#!/usr/bin/env python3
"""
Extrai e analisa todas as 29 regras de um arquivo FRZ do Maker.
Decodifica REG_INTERFACE (base64 -> DFM) e REG_SCRIPT (base64 -> XML).
"""

import gzip
import re
import base64
import html
import json
import sys
from collections import defaultdict, Counter
from html import unescape


def xml_unescape(text):
    """Converte entidades XML (&#x0020; etc) para texto legivel."""
    if not text:
        return text
    text = re.sub(r'&#x([0-9A-Fa-f]+);', lambda m: chr(int(m.group(1), 16)), text)
    text = unescape(text)
    return text


def extract_property(rule_xml, prop_name):
    """Extrai o valor de uma property pelo nome."""
    pattern = rf'<property\s+name="{prop_name}"[^>]*(?:binary-encoded="True"[^>]*)?>(?:<!\[CDATA\[)?(.*?)(?:\]\]>)?</property>'
    m = re.search(pattern, rule_xml, re.DOTALL)
    if m:
        return m.group(1).strip()
    pattern2 = rf'<property\s+name="{prop_name}"[^>]*/>'
    m2 = re.search(pattern2, rule_xml)
    if m2:
        return ""
    return ""


def decode_base64_field(b64_text):
    """Decodifica base64 para texto, tentando varios encodings."""
    if not b64_text:
        return ""
    b64_text = b64_text.strip()
    b64_text = re.sub(r'\s+', '', b64_text)
    try:
        raw = base64.b64decode(b64_text)
        for enc in ['utf-8', 'iso-8859-1', 'cp1252']:
            try:
                return raw.decode(enc)
            except UnicodeDecodeError:
                continue
        return raw.decode('iso-8859-1', errors='replace')
    except Exception as e:
        return f"[ERRO DECODIFICACAO: {e}]"


def parse_dfm_components(dfm_text):
    """Analisa DFM e extrai componentes com suas propriedades."""
    components = []
    pattern = r'object\s+(\w+):\s+(TFlow\w+)'
    for match in re.finditer(pattern, dfm_text):
        comp_name = match.group(1)
        comp_type = match.group(2)
        start = match.start()
        end_pattern = r'\n\s*end\b'
        ends = list(re.finditer(end_pattern, dfm_text[start:]))

        nested_count = 0
        comp_end = start + len(dfm_text[start:])
        for i, em in enumerate(re.finditer(r'\b(object\s+\w+:|end)\b', dfm_text[start:])):
            if em.group().startswith('object'):
                nested_count += 1
            elif em.group() == 'end':
                nested_count -= 1
                if nested_count == 0:
                    comp_end = start + em.end()
                    break

        comp_block = dfm_text[start:comp_end]

        props = {}
        for prop_match in re.finditer(r"(\w+)\s*=\s*'([^']*(?:'[^']*)*)'", comp_block):
            props[prop_match.group(1)] = prop_match.group(2)

        for prop_match in re.finditer(r"(\w+)\s*=\s*(\d+)", comp_block):
            key = prop_match.group(1)
            if key not in ('Left', 'Top', 'Width', 'Height') or key in ('Left', 'Top'):
                props[key] = prop_match.group(2)

        for prop_match in re.finditer(r"(\w+)\s*=\s*(True|False)\b", comp_block):
            props[prop_match.group(1)] = prop_match.group(2)

        expression_match = re.search(r"Expression\s*=\s*\n?\s*((?:(?:'[^']*'|\s|#\d+|\+)*)+)", comp_block)
        if expression_match:
            raw_expr = expression_match.group(1)
            decoded = decode_delphi_string(raw_expr)
            props['Expression_decoded'] = decoded

        description_match = re.search(r"Description\s*=\s*'([^']*(?:'[^']*)*)'", comp_block)
        if not description_match:
            description_match = re.search(r"Description\s*=\s*((?:'[^']*'|\s|#\d+|\+)*)", comp_block)
        if description_match:
            raw_desc = description_match.group(1)
            props['Description'] = decode_delphi_string(raw_desc) if '#' in raw_desc else raw_desc.strip("'")

        input_match = re.search(r"InputNames\s*=\s*'([^']*)'", comp_block)
        if input_match:
            props['InputNames'] = input_match.group(1)

        output_match = re.search(r"OutputNames\s*=\s*'([^']*)'", comp_block)
        if output_match:
            props['OutputNames'] = output_match.group(1)

        returnvar_match = re.search(r"ReturnVar\s*=\s*'([^']*)'", comp_block)
        if returnvar_match:
            props['ReturnVar'] = returnvar_match.group(1)

        text_match = re.search(r"\bText\s*=\s*'([^']*(?:'[^']*)*)'", comp_block)
        if text_match:
            props['Text'] = text_match.group(1)

        loop_match = re.search(r"Loop\s*=\s*(True|False)", comp_block)
        if loop_match:
            props['Loop'] = loop_match.group(1)

        components.append({
            'name': comp_name,
            'type': comp_type,
            'properties': props
        })

    return components


def decode_delphi_string(raw):
    """Decodifica string Delphi com concatenacao e caracteres especiais (#NNN)."""
    if not raw:
        return ""
    raw = raw.replace('\n', ' ').replace('\r', ' ')
    raw = re.sub(r'\s*\+\s*', '', raw)
    parts = re.split(r"(#\d+|'[^']*')", raw)
    result = []
    for p in parts:
        p = p.strip()
        if not p:
            continue
        if p.startswith('#'):
            try:
                result.append(chr(int(p[1:])))
            except ValueError:
                result.append(p)
        elif p.startswith("'") and p.endswith("'"):
            result.append(p[1:-1])
    return ''.join(result)


def parse_script_xml(script_text):
    """Analisa Script XML e extrai EXPRESSION, DECISION, CALLRULE, ACTIVITY."""
    info = {
        'expressions': [],
        'decisions': [],
        'callrules': [],
        'activities': [],
        'params': [],
        'vars': [],
    }

    if not script_text:
        return info

    for m in re.finditer(r'<EXPRESSION\s+[^>]*>', script_text):
        tag = m.group()
        realname = re.search(r'REALNAME="([^"]*)"', tag)
        ret = re.search(r'RETURN="([^"]*)"', tag)
        desc = re.search(r'DESCRIPTION="([^"]*)"', tag)
        expr_id = re.search(r'ID="([^"]*)"', tag)
        info['expressions'].append({
            'id': expr_id.group(1) if expr_id else '',
            'realname': xml_unescape(realname.group(1)) if realname else '',
            'return': xml_unescape(ret.group(1)) if ret else '',
            'description': xml_unescape(desc.group(1)) if desc else '',
        })

    for m in re.finditer(r'<DECISION\s+[^>]*>', script_text):
        tag = m.group()
        decision_id = re.search(r'ID="([^"]*)"', tag)
        desc = re.search(r'DESCRIPTION="([^"]*)"', tag)
        cond_match = re.search(r'<CONDITION[^>]*REALNAME="([^"]*)"', script_text[m.end():m.end()+2000])
        info['decisions'].append({
            'id': decision_id.group(1) if decision_id else '',
            'description': xml_unescape(desc.group(1)) if desc else '',
            'condition_realname': xml_unescape(cond_match.group(1)) if cond_match else '',
        })

    for m in re.finditer(r'<CALLRULE\s+[^>]*>', script_text):
        tag = m.group()
        cr_id = re.search(r'ID="([^"]*)"', tag)
        cr_name = re.search(r'NAME="([^"]*)"', tag)
        cr_ret = re.search(r'RETURN="([^"]*)"', tag)
        cr_params = re.search(r'PARAMSCOUNT="([^"]*)"', tag)
        cr_desc = re.search(r'DESCRIPTION="([^"]*)"', tag)
        info['callrules'].append({
            'id': xml_unescape(cr_id.group(1)) if cr_id else '',
            'name': xml_unescape(cr_name.group(1)) if cr_name else '',
            'return': xml_unescape(cr_ret.group(1)) if cr_ret else '',
            'paramscount': cr_params.group(1) if cr_params else '',
            'description': xml_unescape(cr_desc.group(1)) if cr_desc else '',
        })

    for m in re.finditer(r'<ACTIVITY\s+[^>]*>', script_text):
        tag = m.group()
        act_id = re.search(r'ID="([^"]*)"', tag)
        act_desc = re.search(r'DESCRIPTION="([^"]*)"', tag)
        info['activities'].append({
            'id': act_id.group(1) if act_id else '',
            'description': xml_unescape(act_desc.group(1)) if act_desc else '',
        })

    for m in re.finditer(r'<PARAM\s+[^>]*/>', script_text):
        tag = m.group()
        p_name = re.search(r'NAME="([^"]*)"', tag)
        p_type = re.search(r'TYPE="([^"]*)"', tag)
        p_io = re.search(r'IO="([^"]*)"', tag)
        info['params'].append({
            'name': xml_unescape(p_name.group(1)) if p_name else '',
            'type': xml_unescape(p_type.group(1)) if p_type else '',
            'io': p_io.group(1) if p_io else '',
        })

    for m in re.finditer(r'<VAR\s+[^>]*/>', script_text):
        tag = m.group()
        v_name = re.search(r'NAME="([^"]*)"', tag)
        v_type = re.search(r'TYPE="([^"]*)"', tag)
        info['vars'].append({
            'name': xml_unescape(v_name.group(1)) if v_name else '',
            'type': xml_unescape(v_type.group(1)) if v_type else '',
        })

    return info


def extract_functions_from_expression(expr_text):
    """Extrai funcoes chamadas de Expression XML embutido."""
    funcs = []
    if not expr_text:
        return funcs
    for m in re.finditer(r'REALNAME="([^"]*)"', expr_text):
        funcs.append(m.group(1))
    return funcs


def parse_params_string(params_str):
    """Analisa string de parametros: Nome,Tipo,Default,;Nome2,Tipo2,Default2,"""
    if not params_str:
        return []
    params_str = xml_unescape(params_str)
    entries = params_str.split(';')
    result = []
    for entry in entries:
        entry = entry.strip()
        if not entry:
            continue
        parts = entry.split(',')
        name = parts[0].strip() if len(parts) > 0 else ''
        tipo = parts[1].strip() if len(parts) > 1 else ''
        default = parts[2].strip() if len(parts) > 2 else ''
        if name:
            result.append({'nome': name, 'tipo': tipo, 'default': default})
    return result


def categorize_rule(rule_name):
    """Categoriza regra pelo nome."""
    name_lower = rule_name.lower()
    if 'dashboard' in name_lower or 'gráfico' in name_lower or 'grafico' in name_lower:
        return 'Dashboard / Grafico'
    if 'kanban' in name_lower:
        return 'Kanban'
    if 'login' in name_lower:
        return 'Login'
    if 'formulario principal' in name_lower or 'formulário principal' in name_lower:
        return 'Formulario Principal'
    if 'template' in name_lower:
        return 'Template'
    return 'Outros'


def main():
    frz_path = '/Users/filipefalcao/Downloads/MakerAI/manual_maker_ai/ExemplosFRZ.frz'

    print("Lendo arquivo FRZ...")
    with gzip.open(frz_path, 'rb') as f:
        data = f.read()
    text = data.decode('iso-8859-1')
    print(f"Arquivo decodificado: {len(text):,} caracteres")

    rule_pattern = r'<rule\s+REG_NOME="[^"]*"\s+REG_COD="[^"]*">'
    rule_starts = [(m.start(), m.group()) for m in re.finditer(rule_pattern, text)]
    rule_ends = [m.start() for m in re.finditer(r'</rule>', text)]

    print(f"\nEncontradas {len(rule_starts)} regras")
    print("=" * 120)

    all_rules = []
    all_functions = Counter()
    categories = defaultdict(list)

    for i, (start, tag) in enumerate(rule_starts):
        end = rule_ends[i] + len('</rule>')
        rule_xml = text[start:end]

        reg_cod = extract_property(rule_xml, 'REG_COD')
        reg_nome_raw = extract_property(rule_xml, 'REG_NOME')
        reg_nome = xml_unescape(reg_nome_raw)
        reg_descricao_raw = extract_property(rule_xml, 'REG_DESCRICAO')
        reg_descricao = xml_unescape(reg_descricao_raw)
        reg_destino = extract_property(rule_xml, 'REG_DESTINO')
        reg_params_raw = extract_property(rule_xml, 'REG_PARAMS')
        reg_variaveis_raw = extract_property(rule_xml, 'REG_VARIAVEIS')
        reg_params_out_raw = extract_property(rule_xml, 'REG_PARAMS_OUT')
        reg_interface_b64 = extract_property(rule_xml, 'REG_INTERFACE')
        reg_script_b64 = extract_property(rule_xml, 'REG_SCRIPT')

        cat_path_raw = extract_property(rule_xml, 'CAT_PATH')
        cat_path = xml_unescape(cat_path_raw) if cat_path_raw else ''

        destino_label = 'Cliente (JS)' if reg_destino == '1' else 'Servidor (Java)' if reg_destino == '2' else f'Desconhecido({reg_destino})'

        params = parse_params_string(reg_params_raw)
        variaveis = parse_params_string(reg_variaveis_raw)
        params_out = xml_unescape(reg_params_out_raw).strip() if reg_params_out_raw else ''

        dfm_text = decode_base64_field(reg_interface_b64) if reg_interface_b64 else ''
        script_text = decode_base64_field(reg_script_b64) if reg_script_b64 else ''

        dfm_components = parse_dfm_components(dfm_text) if dfm_text else []
        script_info = parse_script_xml(script_text) if script_text else {
            'expressions': [], 'decisions': [], 'callrules': [],
            'activities': [], 'params': [], 'vars': []
        }

        comp_counts = Counter()
        for comp in dfm_components:
            comp_counts[comp['type']] += 1

        functions_used = []
        for comp in dfm_components:
            if comp['type'] == 'TFlowExpression':
                expr = comp['properties'].get('Expression_decoded', '')
                funcs = extract_functions_from_expression(expr)
                functions_used.extend(funcs)

        for func in functions_used:
            all_functions[func] += 1

        category = categorize_rule(reg_nome)
        rule_data = {
            'reg_cod': reg_cod,
            'reg_nome': reg_nome,
            'reg_descricao': reg_descricao,
            'reg_destino': reg_destino,
            'destino_label': destino_label,
            'cat_path': cat_path,
            'params': params,
            'variaveis': variaveis,
            'params_out': params_out,
            'comp_counts': dict(comp_counts),
            'components': dfm_components,
            'script_info': script_info,
            'functions_used': functions_used,
            'category': category,
        }
        all_rules.append(rule_data)
        categories[category].append(rule_data)

        print(f"\n{'='*120}")
        print(f"REGRA {i+1}/29: [{reg_cod}] {reg_nome}")
        print(f"{'='*120}")
        print(f"  Destino: {destino_label}")
        print(f"  Descricao: {reg_descricao[:200]}{'...' if len(reg_descricao) > 200 else ''}")
        print(f"  Categoria: {cat_path if cat_path else '(nenhuma)'}")
        print(f"  Retorno: {params_out}")

        if params:
            print(f"\n  PARAMETROS DE ENTRADA ({len(params)}):")
            for p in params:
                print(f"    - {p['nome']} : {p['tipo']}{' = ' + p['default'] if p['default'] else ''}")

        if variaveis:
            print(f"\n  VARIAVEIS LOCAIS ({len(variaveis)}):")
            for v in variaveis:
                print(f"    - {v['nome']} : {v['tipo']}")

        if comp_counts:
            print(f"\n  COMPONENTES DFM ({sum(comp_counts.values())} total):")
            for ctype, count in sorted(comp_counts.items()):
                print(f"    {ctype}: {count}")

        if dfm_components:
            print(f"\n  DETALHES DOS COMPONENTES:")
            for comp in dfm_components:
                desc = comp['properties'].get('Description', '')
                text_val = comp['properties'].get('Text', '')
                ret_var = comp['properties'].get('ReturnVar', '')
                inputs = comp['properties'].get('InputNames', '')
                outputs = comp['properties'].get('OutputNames', '')
                loop = comp['properties'].get('Loop', '')

                line = f"    [{comp['type'].replace('TFlow','')}] {comp['name']}"
                if desc:
                    line += f" | Desc: {desc[:80]}"
                if text_val:
                    line += f" | Text: {text_val[:60]}"
                if ret_var:
                    line += f" | Ret: {ret_var}"
                if loop == 'True':
                    line += " | LOOP"
                print(line)

                if inputs:
                    print(f"      In: {inputs}")
                if outputs:
                    print(f"      Out: {outputs}")

                if comp['type'] == 'TFlowExpression':
                    expr = comp['properties'].get('Expression_decoded', '')
                    funcs = extract_functions_from_expression(expr)
                    if funcs:
                        print(f"      Funcoes: {', '.join(funcs)}")

                if comp['type'] == 'TFlowSubRoutine':
                    expr = comp['properties'].get('Expression_decoded', '')
                    if expr:
                        cr_names = re.findall(r'NAME="([^"]*)"', expr)
                        cr_ids = re.findall(r'<CALLRULE[^>]*ID="([^"]*)"', expr)
                        if cr_names:
                            print(f"      Sub-Rotina: {', '.join(cr_names)}")
                        if cr_ids:
                            print(f"      IDs chamados: {', '.join(cr_ids)}")

        if script_info['expressions']:
            print(f"\n  SCRIPT - EXPRESSIONS ({len(script_info['expressions'])}):")
            for expr in script_info['expressions']:
                print(f"    - [{expr['id']}] {expr['realname']} -> {expr['return']}")
                if expr['description']:
                    print(f"      Desc: {xml_unescape(expr['description'][:100])}")

        if script_info['decisions']:
            print(f"\n  SCRIPT - DECISIONS ({len(script_info['decisions'])}):")
            for dec in script_info['decisions']:
                print(f"    - [{dec['id']}] Condicao: {dec['condition_realname']}")
                if dec['description']:
                    print(f"      Desc: {xml_unescape(dec['description'][:100])}")

        if script_info['callrules']:
            print(f"\n  SCRIPT - CALLRULES ({len(script_info['callrules'])}):")
            for cr in script_info['callrules']:
                print(f"    - [{cr['id']}] {cr['name']} -> {cr['return']} (params: {cr['paramscount']})")
                if cr['description']:
                    print(f"      Desc: {xml_unescape(cr['description'][:100])}")

        if script_info['activities']:
            print(f"\n  SCRIPT - ACTIVITIES ({len(script_info['activities'])}):")
            for act in script_info['activities']:
                print(f"    - [{act['id']}] {xml_unescape(act['description'][:100])}")

        if script_info['params']:
            print(f"\n  SCRIPT - PARAMS:")
            for p in script_info['params']:
                print(f"    - {p['name']} : {p['type']} ({p['io']})")

        if script_info['vars']:
            print(f"\n  SCRIPT - VARS:")
            for v in script_info['vars']:
                print(f"    - {v['name']} : {v['type']}")

        if functions_used:
            print(f"\n  FUNCOES USADAS: {', '.join(sorted(set(functions_used)))}")

    print("\n\n")
    print("=" * 120)
    print("ANALISE POR CATEGORIA")
    print("=" * 120)

    for cat_name, rules in sorted(categories.items()):
        print(f"\n{'='*80}")
        print(f"CATEGORIA: {cat_name} ({len(rules)} regras)")
        print(f"{'='*80}")

        cat_functions = Counter()
        cat_destinos = Counter()
        subroutine_calls = []

        for r in rules:
            cat_destinos[r['destino_label']] += 1
            for f in r['functions_used']:
                cat_functions[f] += 1
            for cr in r['script_info']['callrules']:
                subroutine_calls.append({
                    'from': r['reg_nome'],
                    'to': cr['name'],
                    'id': cr['id'],
                })

        print(f"\n  Regras:")
        for r in rules:
            print(f"    [{r['reg_cod']}] {r['reg_nome']} ({r['destino_label']})")

        print(f"\n  Destinos: {dict(cat_destinos)}")

        if cat_functions:
            print(f"\n  Funcoes mais usadas:")
            for func, count in cat_functions.most_common(20):
                print(f"    {func}: {count}x")

        if subroutine_calls:
            print(f"\n  Chamadas de sub-rotinas:")
            for sc in subroutine_calls:
                print(f"    {sc['from']} -> chama [{sc['id']}] {sc['to']}")

        js_patterns = []
        for r in rules:
            for f in r['functions_used']:
                if f.startswith('ebfExecuteJS') or f.startswith('ebfHtml') or f.startswith('ebfJS'):
                    js_patterns.append((r['reg_nome'], f))
            for comp in r['components']:
                expr = comp['properties'].get('Expression_decoded', '')
                if 'ebfExecuteJS' in expr or 'ebfHtml' in expr:
                    js_match = re.search(r'<CONSTANT[^>]*>(.*?)</CONSTANT>', expr, re.DOTALL)
                    if js_match:
                        js_code = xml_unescape(js_match.group(1))
                        if len(js_code) > 10:
                            js_patterns.append((r['reg_nome'], f"JS: {js_code[:200]}"))

        if js_patterns:
            print(f"\n  Padroes JavaScript:")
            for rule_name, pattern in js_patterns:
                print(f"    [{rule_name}] {pattern[:150]}")

    print("\n\n")
    print("=" * 120)
    print("RESUMO GLOBAL DE FUNCOES")
    print("=" * 120)
    for func, count in all_functions.most_common():
        print(f"  {func}: {count}x")

    print("\n\n")
    print("=" * 120)
    print("MAPA DE DEPENDENCIAS (Sub-rotinas)")
    print("=" * 120)
    for r in all_rules:
        if r['script_info']['callrules']:
            print(f"\n  [{r['reg_cod']}] {r['reg_nome']}:")
            for cr in r['script_info']['callrules']:
                target_name = cr['name']
                target_id = cr['id']
                target_rule = next((rr for rr in all_rules if rr['reg_cod'] == target_id), None)
                target_display = f"[{target_id}] {target_rule['reg_nome']}" if target_rule else f"[{target_id}] {target_name}"
                print(f"    -> {target_display} (params: {cr['paramscount']}, ret: {cr['return']})")


if __name__ == '__main__':
    main()

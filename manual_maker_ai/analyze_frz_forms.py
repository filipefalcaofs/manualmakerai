"""
Extrai conhecimento completo sobre formularios de um arquivo FRZ (Maker/WebRun).
Arquivo: ExemplosFRZ.frz (gzip, ISO-8859-1)
"""
import gzip
import re
import json
from collections import Counter, defaultdict
from html import unescape

FRZ_PATH = '/Users/filipefalcao/Downloads/MakerAI/manual_maker_ai/ExemplosFRZ.frz'

ACTION_TYPES = {
    '3': 'Executar SQL',
    '6': 'Executar JavaScript',
    '7': 'Abrir Formulario',
    '12': 'Executar Regra',
}

def decode_xml_entities(text):
    if not text:
        return text
    text = re.sub(r'&#x([0-9A-Fa-f]+);', lambda m: chr(int(m.group(1), 16)), text)
    text = unescape(text)
    return text


def extract_properties(block):
    props = {}
    for m in re.finditer(r'<property name="([^"]+)">(.*?)</property>', block, re.DOTALL):
        props[m.group(1)] = decode_xml_entities(m.group(2))
    return props


def extract_components(form_text):
    components = []
    for m in re.finditer(
        r'<component COM_CODIGO="(\d+)" COM_TIPO="([^"]*)" name="([^"]*)">',
        form_text
    ):
        comp_start = m.start()
        comp_end_tag = form_text.find('</component>', comp_start)
        if comp_end_tag == -1:
            continue
        comp_block = form_text[comp_start:comp_end_tag + len('</component>')]

        comp = {
            'COM_CODIGO': m.group(1),
            'COM_TIPO': m.group(2),
            'name': m.group(3),
            'properties': extract_properties(comp_block),
            'events': extract_events(comp_block),
        }
        components.append(comp)
    return components


def extract_events(block):
    events = []
    for em in re.finditer(r'<event name="([^"]+)">', block):
        event_start = em.start()
        event_end = block.find('</event>', event_start)
        if event_end == -1:
            continue
        event_block = block[event_start:event_end]

        actions = []
        for am in re.finditer(r'<action name="(\d+)">', event_block):
            action_start = am.start()
            action_end = event_block.find('</action>', action_start)
            if action_end == -1:
                action_end = len(event_block)
            action_block = event_block[action_start:action_end]

            action = {
                'tipo_num': am.group(1),
                'tipo_desc': ACTION_TYPES.get(am.group(1), f'Desconhecido({am.group(1)})'),
            }

            cond = re.search(r'<property name="ACC_CONDICAO">(.*?)</property>', action_block)
            if cond:
                action['condicao'] = decode_xml_entities(cond.group(1))

            for pm in re.finditer(r'<param name="([^"]+)"><!\[CDATA\[(.*?)\]\]></param>', action_block, re.DOTALL):
                action[pm.group(1)] = decode_xml_entities(pm.group(2))

            actions.append(action)

        events.append({
            'name': em.group(1),
            'actions': actions,
        })
    return events


def build_hierarchy(components):
    tree = defaultdict(list)
    root_components = []
    for comp in components:
        if comp['COM_TIPO'] == 'F':
            continue
        container = comp['properties'].get('Container', '')
        if container:
            tree[container].append(comp)
        else:
            root_components.append(comp)
    return root_components, dict(tree)


def print_tree(comp, tree, indent=0):
    prefix = '  ' * indent
    tipo = comp['COM_TIPO']
    name = comp['name']
    desc = comp['properties'].get('Descricao', '')
    campo = comp['properties'].get('Campo', '')
    css = comp['properties'].get('NomeClasseCss', '')
    mascara = comp['properties'].get('Mascara', '')
    obrig = comp['properties'].get('Obrigatorio', '')

    label_parts = [f"[{tipo}] {name}"]
    if desc:
        label_parts.append(f'desc="{desc}"')
    if campo:
        label_parts.append(f'campo={campo}')
    if css:
        label_parts.append(f'css="{css}"')
    if mascara:
        label_parts.append(f'mascara="{mascara}"')
    if obrig and obrig.upper() == 'TRUE':
        label_parts.append('OBRIGATORIO')

    line = f"{prefix}{'|-- ' if indent > 0 else ''}{' '.join(label_parts)}"
    lines = [line]

    if comp['events']:
        for ev in comp['events']:
            for act in ev['actions']:
                rule_name = act.get('Nome', act.get('tipo_desc', ''))
                entrada = act.get('Entrada', '')
                ent_str = f' entrada=[{entrada[:60]}]' if entrada else ''
                lines.append(f"{prefix}    >> evento: {ev['name']} -> {act['tipo_desc']}: {rule_name}{ent_str}")

    if name in tree:
        for child in tree[name]:
            lines.extend(print_tree(child, tree, indent + 1))

    return lines


def analyze_form(form_text, form_codigo, form_guid):
    props = extract_properties(form_text)
    components = extract_components(form_text)

    form_settings = None
    regular_components = []
    for c in components:
        if c['COM_TIPO'] == 'F':
            form_settings = c
        else:
            regular_components.append(c)

    root_comps, tree = build_hierarchy(components)

    css_classes = set()
    mascaras = set()
    all_events = []

    for c in components:
        css = c['properties'].get('NomeClasseCss', '')
        if css:
            css_classes.add(css)
        estilo_css = c['properties'].get('EstiloCss', '')
        if estilo_css:
            css_classes.add(f'inline:{estilo_css[:80]}')
        mascara = c['properties'].get('Mascara', '')
        if mascara:
            mascaras.add(mascara)
        if c['events']:
            for ev in c['events']:
                for act in ev['actions']:
                    all_events.append({
                        'componente': c['name'] or f"FormSettings(F)",
                        'COM_TIPO': c['COM_TIPO'],
                        'evento': ev['name'],
                        'acao_tipo': act['tipo_desc'],
                        'regra': act.get('Nome', ''),
                        'entrada': act.get('Entrada', ''),
                        'condicao': act.get('condicao', ''),
                    })

    return {
        'FRM_CODIGO': form_codigo,
        'FRM_GUID': form_guid,
        'FRM_DESCRICAO': decode_xml_entities(props.get('FRM_DESCRICAO', '')),
        'FRM_TAMANHO': props.get('FRM_TAMANHO', ''),
        'FRM_ALTURA': props.get('FRM_ALTURA', ''),
        'FNT_TABELA': props.get('FNT_TABELA', ''),
        'FNT_CAMPOCHAVE': props.get('FNT_CAMPOCHAVE', ''),
        'FNT_SQLSELECT': (props.get('FNT_SQLSELECT', '') or '')[:200],
        'total_componentes': len(regular_components),
        'componentes_por_tipo': dict(Counter(c['COM_TIPO'] for c in regular_components)),
        'form_settings': form_settings,
        'components': regular_components,
        'root_comps': root_comps,
        'tree': tree,
        'css_classes': sorted(css_classes),
        'mascaras': sorted(mascaras),
        'events': all_events,
    }


def main():
    with gzip.open(FRZ_PATH, 'rb') as f:
        raw = f.read()
    text = raw.decode('iso-8859-1')

    form_starts = [(m.start(), m.group(1), m.group(2))
                   for m in re.finditer(r'<form FRM_CODIGO="(\d+)" FRM_GUID="([^"]+)">', text)]
    form_ends = [m.end() for m in re.finditer(r'</form>', text)]

    forms = []
    for i, (start, codigo, guid) in enumerate(form_starts):
        end = form_ends[i]
        form_text = text[start:end]
        forms.append(analyze_form(form_text, codigo, guid))

    separator = '=' * 100
    thin_sep = '-' * 80

    global_css = set()
    global_mascaras = set()
    global_tipo_counts = Counter()
    global_event_summary = []

    for form in forms:
        global_css.update(form['css_classes'])
        global_mascaras.update(form['mascaras'])
        global_tipo_counts.update(form['componentes_por_tipo'])
        global_event_summary.extend(form['events'])

        print(separator)
        print(f"FORMULARIO: {form['FRM_DESCRICAO']}")
        print(f"  FRM_CODIGO: {form['FRM_CODIGO']}  |  FRM_GUID: {form['FRM_GUID']}")
        print(f"  Dimensoes: {form['FRM_TAMANHO']} x {form['FRM_ALTURA']}")
        print(f"  Tabela: {form['FNT_TABELA'] or '(nenhuma)'}")
        print(f"  Campo Chave: {form['FNT_CAMPOCHAVE'] or '(nenhum)'}")
        if form['FNT_SQLSELECT']:
            print(f"  SQL Select: {form['FNT_SQLSELECT']}")
        print(f"  Total Componentes: {form['total_componentes']}")
        print(f"  Tipos: {form['componentes_por_tipo']}")

        if form['form_settings']:
            fs = form['form_settings']
            p = fs['properties']
            print(f"\n  CONFIGURACOES DO FORMULARIO (tipo F):")
            key_props = [
                'ClasseCss', 'Responsivo', 'Navegacao', 'Abas', 'AbaLocalizar',
                'Apresentacao', 'BarraDeRolagem', 'BarraNavegacaoFixa',
                'Centralizado', 'CentralizadoVertical', 'Cor',
                'EditarAoDuploClicar', 'EntrarComoPesquisa', 'FonteDeDados',
                'ImagemDeFundo', 'MaximizarAoAbrir', 'ModoExibicao',
                'PermitirAlterar', 'PermitirExcluir', 'PermitirGravarMais',
                'PermitirIncluir', 'PosicaoAbas', 'TipoFormulario',
                'AbaLocalizarPermitirImportarDados', 'AbaLocalizarPermitirOrdenarGrade',
                'AbaLocalizarPermitirRelatorioHtml', 'AbaLocalizarPermitirRelatorioListagem',
                'BotaoFechar', 'BotaoMaximizar', 'BotaoMinimizar',
                'AIGenerated', 'AIPrompt',
            ]
            for k in key_props:
                if k in p and p[k]:
                    print(f"    {k}: {p[k]}")

            if fs['events']:
                print(f"\n    Eventos no FormSettings:")
                for ev in fs['events']:
                    for act in ev['actions']:
                        cond = f' [cond: {act.get("condicao", "")}]' if act.get('condicao') else ''
                        entrada = act.get('Entrada', '')
                        ent_str = f'\n        Entrada: {entrada[:100]}' if entrada else ''
                        print(f"      {ev['name']} -> {act['tipo_desc']}: {act.get('Nome', '')}{cond}{ent_str}")

        print(f"\n  ARVORE DE COMPONENTES:")
        for comp in form['root_comps']:
            tree_lines = print_tree(comp, form['tree'], indent=1)
            for line in tree_lines:
                print(line)

        if form['css_classes']:
            print(f"\n  CLASSES CSS: {', '.join(form['css_classes'])}")

        if form['mascaras']:
            print(f"\n  MASCARAS: {', '.join(form['mascaras'])}")

        if form['events']:
            print(f"\n  EVENTOS E REGRAS ({len(form['events'])}):")
            for ev in form['events']:
                comp_label = f"{ev['componente']}({ev['COM_TIPO']})"
                entrada = ev['entrada']
                ent_str = f'\n      Entrada: {entrada[:120]}' if entrada else ''
                cond = ev.get('condicao', '')
                cond_str = f' [cond: {cond}]' if cond else ''
                print(f"    {comp_label}.{ev['evento']} -> {ev['acao_tipo']}: {ev['regra']}{cond_str}{ent_str}")

        notable = []
        tipos = form['componentes_por_tipo']
        if 'W' in tipos:
            notable.append(f"{tipos['W']} Card(s)")
        if 'G' in tipos:
            notable.append(f"{tipos['G']} Grade(s)")
        if 'K' in tipos:
            notable.append(f"{tipos['K']} Lookup(s)")
        if 'C' in tipos:
            notable.append(f"{tipos['C']} Combo(s)")
        if 'M' in tipos:
            notable.append(f"{tipos['M']} Memo(s)")
        if 'H' in tipos:
            notable.append(f"{tipos['H']} HTML(s)")
        if form['css_classes']:
            notable.append(f"{len(form['css_classes'])} classes CSS")
        if not form['FNT_TABELA']:
            notable.append("Sem tabela (formulario visual/template)")
        if form['events']:
            notable.append(f"{len(form['events'])} eventos vinculados")
        fs_props = form['form_settings']['properties'] if form['form_settings'] else {}
        if fs_props.get('Responsivo', '').upper() == 'TRUE':
            notable.append("Responsivo")
        if fs_props.get('Abas', '').upper() != 'FALSE':
            notable.append("Com Abas")
        if fs_props.get('AIGenerated', '').upper() == 'TRUE':
            notable.append("Gerado por IA")

        if notable:
            print(f"\n  DESTAQUES: {' | '.join(notable)}")

        print()

    print(separator)
    print("RESUMO GLOBAL")
    print(separator)
    print(f"\nTotal de formularios: {len(forms)}")
    print(f"\nComponentes por tipo (global):")
    tipo_names = {
        'E': 'MakerEdit (campo texto)', 'P': 'MakerPanel/Container',
        'L': 'MakerLabel', 'B': 'MakerButton', 'W': 'MakerCard',
        'I': 'MakerImage', 'S': 'MakerSeparator', 'A': 'MakerAdvancedLabel',
        'M': 'MakerMemo', 'G': 'MakerGrid', 'K': 'MakerLookup',
        'H': 'MakerHTML', 'C': 'MakerCombo', 'R': 'MakerRadio',
        'F': 'FormSettings',
    }
    for t, c in global_tipo_counts.most_common():
        name = tipo_names.get(t, f'Tipo {t}')
        print(f"  {t} ({name}): {c}")

    print(f"\nTodas as classes CSS usadas ({len(global_css)}):")
    for css in sorted(global_css):
        print(f"  {css}")

    print(f"\nTodas as mascaras usadas ({len(global_mascaras)}):")
    for m in sorted(global_mascaras):
        print(f"  {m}")

    print(f"\nMapeamento Eventos -> Regras ({len(global_event_summary)}):")
    for ev in global_event_summary:
        print(f"  {ev['componente']}({ev['COM_TIPO']}).{ev['evento']} -> {ev['acao_tipo']}: {ev['regra']}")

    print(f"\nHierarquia de Containers (quem contem quem):")
    for form in forms:
        if form['tree']:
            print(f"\n  [{form['FRM_DESCRICAO']}]:")
            for container_name, children in form['tree'].items():
                child_names = [f"{c['name']}({c['COM_TIPO']})" for c in children]
                print(f"    {container_name} -> {', '.join(child_names)}")


if __name__ == '__main__':
    main()

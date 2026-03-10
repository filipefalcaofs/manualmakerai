#!/usr/bin/env python3
"""
Gerador de documentação dos XMLs nativos do Maker AI.
Parseia todos os XMLs da pasta NativosMakerAi e gera documentação
markdown organizada em manual_scraped/nativos/.
"""

import os
import re
import html
import xml.etree.ElementTree as ET
from collections import defaultdict
from urllib.parse import unquote

# ─── Configuração ───────────────────────────────────────────────
NATIVOS_DIR = "/Users/filipefalcao/Downloads/MakerAI/NativosMakerAi"
OUTPUT_DIR = "/Users/filipefalcao/Downloads/MakerAI/manual_scraped/nativos"

# ─── Utilitários ────────────────────────────────────────────────

def decode_xml_text(text):
    """Decodifica entidades XML (&#x0020; → espaço, &#x00E7; → ç, etc.)."""
    if not text:
        return ""
    # html.unescape já trata &#xHHHH; e &#NNN; e &amp; etc.
    decoded = html.unescape(text)
    # Limpa \r\n excessivos
    decoded = decoded.replace("\r\n", "\n").replace("\r", "\n")
    return decoded.strip()


def safe_filename(name, max_len=80):
    """Cria um nome de arquivo seguro a partir de um nome legível."""
    name = decode_xml_text(name)
    # Remove/substitui caracteres problemáticos
    name = re.sub(r'[<>:"/\\|?*\x00-\x1f]', '_', name)
    name = re.sub(r'\s+', '-', name)
    name = re.sub(r'-+', '-', name)
    name = name.strip('-_')
    if len(name) > max_len:
        name = name[:max_len]
    return name.lower()


def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def get_prop(element, prop_name):
    """Extraia o valor de um <property name="X"> decodificado."""
    for prop in element.findall("property"):
        if prop.get("name") == prop_name:
            text = prop.text or ""
            # CDATA pode conter texto sem entity encoding
            if prop.get("binary-encoded") == "True":
                return "[interface binária]"
            return decode_xml_text(text)
    return ""


def parse_xml_file(filepath):
    """Parse XML com encoding iso-8859-1."""
    with open(filepath, "rb") as f:
        content = f.read()
    # Ajustar encoding se necessário
    return ET.fromstring(content)


COMPAT_MAP = {
    "0": "Servidor",
    "1": "Cliente",
    "2": "Banco de Dados",
    "3": "Mobile",
}

TIPO_FUNCAO_MAP = {
    "0": "Expressão",
    "1": "SQL",
    "2": "Genérica",
    "3": "Navegação",
    "4": "Componente",
    "5": "Formulário",
}


# ═══════════════════════════════════════════════════════════════
#  1. FUNÇÕES NATIVAS
# ═══════════════════════════════════════════════════════════════

def parse_funcoes_nativas():
    """Parse FuncoesNativasMakerAi.xml e gera documentação por categoria."""
    filepath = os.path.join(NATIVOS_DIR, "FuncoesNativasMakerAi.xml")
    if not os.path.exists(filepath):
        print("  ⚠ FuncoesNativasMakerAi.xml não encontrado")
        return

    print("  Parseando funções nativas...")
    root = parse_xml_file(filepath)
    functions_elem = root.find(".//functions")
    if functions_elem is None:
        print("  ⚠ Elemento <functions> não encontrado")
        return

    # Agrupar por categoria
    categorias = defaultdict(list)
    total = 0

    for func in functions_elem.findall("function"):
        nome = get_prop(func, "FUN_NOME")
        nome_real = get_prop(func, "FUN_NOME_REAL")
        descricao = get_prop(func, "FUN_DESCRICAO")
        params = get_prop(func, "FUN_PARAMS")
        retorno = get_prop(func, "FUN_RETORNO")
        tipo = get_prop(func, "FUN_TIPO")
        compat = get_prop(func, "FUN_COMPATIBILIDADE")
        resumo = get_prop(func, "FUN_RESUMO")
        cat_path = get_prop(func, "CAT_PATH")
        cod = get_prop(func, "FUN_COD")
        conteudo_servidor = get_prop(func, "FUN_CONTEUDO_SERVIDOR")
        conteudo_cliente = get_prop(func, "FUN_CONTEUDO_CLIENTE")
        conteudo_banco = get_prop(func, "FUN_CONTEUDO_BANCO")

        # Decodificar categoria
        if cat_path:
            cat_path = unquote(cat_path.replace("\\", "/").strip("/"))
        else:
            cat_path = "Sem Categoria"

        # Compatibilidades
        compat_list = []
        if compat:
            for c in compat.split(","):
                c = c.strip()
                compat_list.append(COMPAT_MAP.get(c, c))

        func_data = {
            "cod": cod,
            "nome": nome,
            "nome_real": nome_real,
            "descricao": descricao,
            "params": params,
            "retorno": retorno,
            "tipo": TIPO_FUNCAO_MAP.get(tipo, tipo),
            "compatibilidade": compat_list,
            "resumo": resumo,
            "conteudo_servidor": conteudo_servidor,
            "conteudo_cliente": conteudo_cliente,
            "conteudo_banco": conteudo_banco,
        }

        categorias[cat_path].append(func_data)
        total += 1

    # Gerar documentação
    func_dir = os.path.join(OUTPUT_DIR, "funcoes")
    ensure_dir(func_dir)

    # README das funções
    cat_list = sorted(categorias.keys())
    lines = [
        "# Funções Nativas do Maker AI\n",
        f"Total de funções nativas: **{total}**\n",
        f"Categorias: **{len(cat_list)}**\n",
        "## Categorias\n",
        "| Categoria | Qtd Funções |",
        "|-----------|-------------|",
    ]
    for cat in cat_list:
        fname = safe_filename(cat)
        lines.append(f"| [{cat}]({fname}.md) | {len(categorias[cat])} |")

    lines.append("\n---\n")
    lines.append("*Documentação gerada automaticamente a partir de FuncoesNativasMakerAi.xml*\n")

    with open(os.path.join(func_dir, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    # Um arquivo por categoria
    for cat in cat_list:
        funcs = sorted(categorias[cat], key=lambda x: x["nome"])
        fname = safe_filename(cat)

        lines = [
            f"# Funções Nativas - {cat}\n",
            f"Total: **{len(funcs)}** funções\n",
            "[← Voltar para Funções Nativas](README.md)\n",
            "---\n",
        ]

        for fn in funcs:
            lines.append(f"## {fn['nome']}\n")

            # Tabela de meta-informações
            lines.append("| Propriedade | Valor |")
            lines.append("|-------------|-------|")
            lines.append(f"| **Nome Real** | `{fn['nome_real']}` |")
            lines.append(f"| **Código** | {fn['cod']} |")
            if fn["resumo"]:
                lines.append(f"| **Assinatura** | `{fn['resumo']}` |")
            if fn["params"]:
                lines.append(f"| **Parâmetros** | {fn['params']} |")
            if fn["retorno"]:
                lines.append(f"| **Retorno** | {fn['retorno']} |")
            if fn["tipo"]:
                lines.append(f"| **Tipo** | {fn['tipo']} |")
            if fn["compatibilidade"]:
                lines.append(f"| **Compatibilidade** | {', '.join(fn['compatibilidade'])} |")

            lines.append("")

            if fn["descricao"]:
                lines.append("### Descrição\n")
                lines.append(fn["descricao"])
                lines.append("")

            # Código fonte quando disponível
            if fn["conteudo_servidor"]:
                lines.append("### Código Servidor (Java)\n")
                lines.append("```java")
                lines.append(fn["conteudo_servidor"])
                lines.append("```\n")

            if fn["conteudo_cliente"]:
                lines.append("### Código Cliente (JavaScript)\n")
                lines.append("```javascript")
                lines.append(fn["conteudo_cliente"])
                lines.append("```\n")

            if fn["conteudo_banco"]:
                lines.append("### Código Banco de Dados\n")
                lines.append("```sql")
                lines.append(fn["conteudo_banco"])
                lines.append("```\n")

            lines.append("---\n")

        with open(os.path.join(func_dir, f"{fname}.md"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines))

    print(f"  ✓ {total} funções em {len(cat_list)} categorias")
    return total, len(cat_list)


# ═══════════════════════════════════════════════════════════════
#  2. FLUXOS NATIVOS
# ═══════════════════════════════════════════════════════════════

def parse_fluxos(filepath, label, output_subdir):
    """Parse FluxosNativosMakerAi.xml ou TemplatesFluxosMakerAi.xml."""
    if not os.path.exists(filepath):
        print(f"  ⚠ {os.path.basename(filepath)} não encontrado")
        return

    print(f"  Parseando {label}...")
    root = parse_xml_file(filepath)

    # Fluxos usam <rules><rule>, Templates usam <templates><template>
    rules_elem = root.find(".//rules")
    templates_elem = root.find(".//templates")
    if rules_elem is not None:
        items = rules_elem.findall("rule")
    elif templates_elem is not None:
        items = templates_elem.findall("template")
    else:
        print(f"  ⚠ Nenhum elemento <rules> ou <templates> encontrado em {label}")
        return

    fluxos = []
    for rule in items:
        nome = get_prop(rule, "REG_NOME")
        descricao = get_prop(rule, "REG_DESCRICAO")
        params = get_prop(rule, "REG_PARAMS")
        variaveis = get_prop(rule, "REG_VARIAVEIS")
        params_out = get_prop(rule, "REG_PARAMS_OUT")
        destino = get_prop(rule, "REG_DESTINO")
        cod = get_prop(rule, "REG_COD")
        hash_val = get_prop(rule, "REG_HASH")

        # Parse variáveis (formato: Nome,Tipo,,;Nome2,Tipo2,,;...)
        vars_parsed = []
        if variaveis:
            for v in variaveis.split(";"):
                parts = v.split(",")
                if len(parts) >= 2 and parts[0].strip():
                    vars_parsed.append({
                        "nome": parts[0].strip(),
                        "tipo": parts[1].strip() if len(parts) > 1 else "",
                    })

        # Parse parâmetros de saída
        params_out_parsed = []
        if params_out:
            parts = params_out.split(",")
            if parts[0].strip():
                params_out_parsed.append(parts[0].strip())

        # Destino
        destino_map = {"0": "Servidor", "1": "Cliente", "2": "Banco de Dados"}
        destino_nome = destino_map.get(destino, destino)

        fluxos.append({
            "cod": cod,
            "nome": nome,
            "descricao": descricao,
            "params": params,
            "variaveis": vars_parsed,
            "params_out": params_out_parsed,
            "destino": destino_nome,
            "hash": hash_val,
        })

    # Gerar documentação
    out_dir = os.path.join(OUTPUT_DIR, output_subdir)
    ensure_dir(out_dir)

    lines = [
        f"# {label}\n",
        f"Total: **{len(fluxos)}** fluxos\n",
        "[← Voltar para Nativos](../README.md)\n",
        "---\n",
    ]

    # Índice
    lines.append("## Índice\n")
    for fl in sorted(fluxos, key=lambda x: x["nome"]):
        anchor = safe_filename(fl["nome"])
        lines.append(f"- [{fl['nome']}](#{anchor})")
    lines.append("\n---\n")

    # Detalhes de cada fluxo
    for fl in sorted(fluxos, key=lambda x: x["nome"]):
        lines.append(f"## {fl['nome']}\n")

        lines.append("| Propriedade | Valor |")
        lines.append("|-------------|-------|")
        lines.append(f"| **Código** | {fl['cod']} |")
        if fl["destino"]:
            lines.append(f"| **Destino** | {fl['destino']} |")
        if fl["params"]:
            lines.append(f"| **Parâmetros Entrada** | {fl['params']} |")
        if fl["params_out"]:
            lines.append(f"| **Retorno** | {', '.join(fl['params_out'])} |")
        lines.append("")

        if fl["descricao"]:
            lines.append("### Descrição\n")
            lines.append(fl["descricao"])
            lines.append("")

        if fl["variaveis"]:
            lines.append("### Variáveis\n")
            lines.append("| Nome | Tipo |")
            lines.append("|------|------|")
            for v in fl["variaveis"]:
                lines.append(f"| `{v['nome']}` | {v['tipo']} |")
            lines.append("")

        lines.append("---\n")

    lines.append(f"\n*Documentação gerada automaticamente a partir de {os.path.basename(filepath)}*\n")

    with open(os.path.join(out_dir, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"  ✓ {len(fluxos)} fluxos documentados")
    return len(fluxos)


# ═══════════════════════════════════════════════════════════════
#  3. FORMULÁRIOS NATIVOS
# ═══════════════════════════════════════════════════════════════

def parse_formularios_nativos():
    """Parse FormulariosNativosMakerAi.xml."""
    filepath = os.path.join(NATIVOS_DIR, "FormulariosNativosMakerAi.xml")
    if not os.path.exists(filepath):
        print("  ⚠ FormulariosNativosMakerAi.xml não encontrado")
        return

    print("  Parseando formulários nativos...")
    root = parse_xml_file(filepath)

    # Formulários são filhos diretos de <system>
    forms = []
    for system in root.findall(".//system"):
        sis_nome = get_prop(system, "SIS_DESCRICAO") or system.get("SIS_CODIGO", "")
        sis_codigo = system.get("SIS_CODIGO", "")

        for form in system.findall("form"):
            frm_desc = get_prop(form, "FRM_DESCRICAO")
            frm_cod = get_prop(form, "FRM_CODIGO") or form.get("FRM_CODIGO", "")
            frm_tabela = get_prop(form, "FNT_TABELA")
            frm_tipo = get_prop(form, "FRM_TIPO_CRIACAO")
            frm_altura = get_prop(form, "FRM_ALTURA")
            frm_largura = get_prop(form, "FRM_TAMANHO")

            # Propriedades adicionais
            tabela_chave = get_prop(form, "FNT_CAMPOCHAVE")
            sql_select = get_prop(form, "FNT_SQLSELECT")
            componentes = []  # Componentes são definidos em DadosTabelasNativa

            forms.append({
                "sistema": sis_nome,
                "sis_codigo": sis_codigo,
                "codigo": frm_cod,
                "descricao": frm_desc,
                "tabela": frm_tabela,
                "tipo": frm_tipo,
                "altura": frm_altura,
                "largura": frm_largura,
                "campo_chave": tabela_chave,
                "sql_select": sql_select,
                "componentes": componentes,
            })

    # Gerar documentação
    form_dir = os.path.join(OUTPUT_DIR, "formularios")
    ensure_dir(form_dir)

    lines = [
        "# Formulários Nativos do Maker AI\n",
        f"Total: **{len(forms)}** formulários\n",
        "[← Voltar para Nativos](../README.md)\n",
        "---\n",
    ]

    # Agrupar por sistema
    by_system = defaultdict(list)
    for f in forms:
        by_system[f["sistema"] or f["sis_codigo"]].append(f)

    for sys_name in sorted(by_system.keys()):
        sys_forms = by_system[sys_name]
        lines.append(f"## Sistema: {sys_name}\n")

        for frm in sorted(sys_forms, key=lambda x: x["descricao"] or ""):
            titulo = frm['descricao'] or 'Formulário ' + str(frm['codigo'])
            lines.append(f"### {titulo}\n")
            lines.append("| Propriedade | Valor |")
            lines.append("|-------------|-------|")
            lines.append(f"| **Código** | {frm['codigo']} |")
            if frm["tabela"]:
                lines.append(f"| **Tabela** | {frm['tabela']} |")
            if frm.get("campo_chave"):
                lines.append(f"| **Campo Chave** | {frm['campo_chave']} |")
            if frm["tipo"]:
                lines.append(f"| **Tipo Criação** | {frm['tipo']} |")
            if frm["altura"] and frm["largura"]:
                lines.append(f"| **Dimensões** | {frm['largura']} x {frm['altura']} |")
            lines.append("")

            if frm.get("sql_select"):
                lines.append("**SQL Select:**\n")
                lines.append("```sql")
                lines.append(frm["sql_select"])
                lines.append("```\n")

            lines.append("---\n")

    lines.append("\n*Documentação gerada automaticamente a partir de FormulariosNativosMakerAi.xml*\n")

    with open(os.path.join(form_dir, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"  ✓ {len(forms)} formulários documentados")
    return len(forms)


# ═══════════════════════════════════════════════════════════════
#  4. DADOS DAS TABELAS NATIVAS
# ═══════════════════════════════════════════════════════════════

def parse_dados_tabelas_nativas():
    """Parse DadosTabelasNativaMakerAi.xml - dados de referência das tabelas nativas."""
    filepath = os.path.join(NATIVOS_DIR, "DadosTabelasNativaMakerAi.xml")
    if not os.path.exists(filepath):
        print("  ⚠ DadosTabelasNativaMakerAi.xml não encontrado")
        return

    print("  Parseando dados das tabelas nativas (100K+ linhas)...")
    root = parse_xml_file(filepath)

    datapackets = root.find(".//datapackets")
    if datapackets is None:
        print("  ⚠ Elemento <datapackets> não encontrado")
        return

    tabelas = []
    for data in datapackets.findall("DATA"):
        entity = data.find(".//ENTITY")
        if entity is None:
            continue

        table_name = entity.get("NAME", "")
        friendly = entity.get("FRIENDLY_NAME", "")

        # Colunas
        columns = []
        for attr in entity.findall("ATTRIBUTE"):
            columns.append({
                "name": attr.get("NAME", ""),
                "friendly": attr.get("FRIENDLY_NAME", ""),
                "type": attr.get("TYPE", ""),
                "length": attr.get("LENGTH", ""),
            })

        # Linhas de dados
        rows = []
        dataset = data.find(".//DATASET")
        if dataset is not None:
            for row in dataset.findall("ROW"):
                row_data = {}
                for field in row.findall("FIELD"):
                    fname = field.get("NAME", "")
                    is_null = field.get("ISNULL", "false") == "true"
                    value = "" if is_null else (field.text or "")
                    # Decodificar se necessário
                    if value:
                        value = decode_xml_text(value)
                    row_data[fname] = value
                rows.append(row_data)

        tabelas.append({
            "name": table_name,
            "friendly": friendly,
            "columns": columns,
            "rows": rows,
        })

    # Gerar documentação
    dados_dir = os.path.join(OUTPUT_DIR, "dados-tabelas")
    ensure_dir(dados_dir)

    # Classificar tabelas para organizar
    # Tabelas grandes (>100 registros) → arquivo individual
    # Tabelas pequenas → agrupadas em arquivos temáticos
    tabelas_grandes = [t for t in tabelas if len(t["rows"]) > 100]
    tabelas_medias = [t for t in tabelas if 10 < len(t["rows"]) <= 100]
    tabelas_pequenas = [t for t in tabelas if len(t["rows"]) <= 10]

    # README
    lines = [
        "# Dados das Tabelas Nativas do Maker AI\n",
        f"Total: **{len(tabelas)}** tabelas com **{sum(len(t['rows']) for t in tabelas)}** registros\n",
        "[← Voltar para Nativos](../README.md)\n",
        "---\n",
        "## Resumo por Tabela\n",
        "| Tabela | Registros | Colunas |",
        "|--------|-----------|---------|",
    ]

    for t in sorted(tabelas, key=lambda x: x["name"]):
        fname = safe_filename(t["name"])
        if len(t["rows"]) > 100:
            lines.append(f"| [{t['name']}]({fname}.md) | {len(t['rows'])} | {len(t['columns'])} |")
        elif len(t["rows"]) > 10:
            lines.append(f"| [{t['name']}](tabelas-medias.md#{fname}) | {len(t['rows'])} | {len(t['columns'])} |")
        else:
            lines.append(f"| [{t['name']}](tabelas-referencia.md#{fname}) | {len(t['rows'])} | {len(t['columns'])} |")

    lines.append(f"\n### Distribuição")
    lines.append(f"- Tabelas com >100 registros: {len(tabelas_grandes)}")
    lines.append(f"- Tabelas com 11-100 registros: {len(tabelas_medias)}")
    lines.append(f"- Tabelas com ≤10 registros: {len(tabelas_pequenas)}")

    lines.append("\n---\n")
    lines.append("*Documentação gerada automaticamente a partir de DadosTabelasNativaMakerAi.xml*\n")

    with open(os.path.join(dados_dir, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    # Gerar arquivo para cada tabela grande
    for t in tabelas_grandes:
        _write_table_doc(dados_dir, t, individual=True)

    # Agrupar tabelas médias
    if tabelas_medias:
        lines = [
            "# Tabelas Nativas - Dados Médios (11-100 registros)\n",
            "[← Voltar para Dados das Tabelas](README.md)\n",
            "---\n",
        ]
        for t in sorted(tabelas_medias, key=lambda x: x["name"]):
            lines.extend(_format_table_section(t))
        with open(os.path.join(dados_dir, "tabelas-medias.md"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines))

    # Agrupar tabelas pequenas (referência)
    if tabelas_pequenas:
        lines = [
            "# Tabelas Nativas - Dados de Referência (≤10 registros)\n",
            "[← Voltar para Dados das Tabelas](README.md)\n",
            "---\n",
        ]
        for t in sorted(tabelas_pequenas, key=lambda x: x["name"]):
            lines.extend(_format_table_section(t))
        with open(os.path.join(dados_dir, "tabelas-referencia.md"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines))

    print(f"  ✓ {len(tabelas)} tabelas ({sum(len(t['rows']) for t in tabelas)} registros total)")
    return len(tabelas)


def _format_table_section(t):
    """Gera seção markdown para uma tabela com seus dados."""
    lines = []
    lines.append(f"## {t['name']}\n")
    if t["friendly"] and t["friendly"] != t["name"]:
        lines.append(f"*Alias:* {t['friendly']}\n")

    # Estrutura
    lines.append("**Estrutura:**\n")
    lines.append("| Coluna | Tipo | Tamanho |")
    lines.append("|--------|------|---------|")
    for col in t["columns"]:
        lines.append(f"| {col['name']} | {col['type']} | {col['length']} |")
    lines.append("")

    # Dados
    if t["rows"]:
        lines.append(f"**Dados ({len(t['rows'])} registros):**\n")
        col_names = [c["name"] for c in t["columns"]]
        header = "| " + " | ".join(col_names) + " |"
        separator = "|" + "|".join(["---" for _ in col_names]) + "|"
        lines.append(header)
        lines.append(separator)

        max_rows = 200  # Limitar para legibilidade
        for row in t["rows"][:max_rows]:
            values = []
            for c in col_names:
                v = row.get(c, "")
                # Truncar valores muito longos
                if len(v) > 120:
                    v = v[:117] + "..."
                # Escapar pipes para tabela markdown
                v = v.replace("|", "\\|").replace("\n", " ")
                values.append(v)
            lines.append("| " + " | ".join(values) + " |")

        if len(t["rows"]) > max_rows:
            lines.append(f"\n*... e mais {len(t['rows']) - max_rows} registros*\n")

    lines.append("\n---\n")
    return lines


def _write_table_doc(out_dir, t, individual=False):
    """Gera arquivo markdown individual para uma tabela."""
    fname = safe_filename(t["name"])
    lines = [
        f"# {t['name']}\n",
        f"[← Voltar para Dados das Tabelas](README.md)\n",
    ]
    lines.extend(_format_table_section(t))
    lines.append(f"\n*Documentação gerada automaticamente*\n")

    with open(os.path.join(out_dir, f"{fname}.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))


# ═══════════════════════════════════════════════════════════════
#  5. COMPILADOR (dentro de DadosTabelasNativa - FR_COMPILADOR)
# ═══════════════════════════════════════════════════════════════

def parse_compilador_from_dados():
    """Extrai especificamente FR_COMPILADOR do DadosTabelasNativa
    para gerar docs do compilador/gerador de código do Maker."""
    filepath = os.path.join(NATIVOS_DIR, "DadosTabelasNativaMakerAi.xml")
    if not os.path.exists(filepath):
        return

    print("  Extraindo referência do compilador (FR_COMPILADOR)...")
    root = parse_xml_file(filepath)

    datapackets = root.find(".//datapackets")
    if datapackets is None:
        return

    compilador_rows = []
    compilador_db_rows = []

    for data in datapackets.findall("DATA"):
        entity = data.find(".//ENTITY")
        if entity is None:
            continue
        name = entity.get("NAME", "")

        if name == "FR_COMPILADOR":
            dataset = data.find(".//DATASET")
            if dataset is not None:
                for row in dataset.findall("ROW"):
                    descritor = ""
                    especificacao = ""
                    for field in row.findall("FIELD"):
                        fname = field.get("NAME", "")
                        is_null = field.get("ISNULL", "false") == "true"
                        value = "" if is_null else decode_xml_text(field.text or "")
                        if fname == "CPL_DESCRITOR":
                            descritor = value
                        elif fname == "CPL_ESPECIFICACAO":
                            especificacao = value
                    compilador_rows.append({"descritor": descritor, "especificacao": especificacao})

        elif name == "FR_COMPILADOR_DATABASE":
            dataset = data.find(".//DATASET")
            if dataset is not None:
                for row in dataset.findall("ROW"):
                    row_data = {}
                    for field in row.findall("FIELD"):
                        fname = field.get("NAME", "")
                        is_null = field.get("ISNULL", "false") == "true"
                        value = "" if is_null else decode_xml_text(field.text or "")
                        row_data[fname] = value
                    compilador_db_rows.append(row_data)

    if not compilador_rows:
        return

    # Gerar documentação do compilador
    comp_dir = os.path.join(OUTPUT_DIR, "compilador")
    ensure_dir(comp_dir)

    # Categorizar descritores
    categorias = defaultdict(list)
    for item in compilador_rows:
        d = item["descritor"]
        if d.startswith("ebf"):
            categorias["Funções Built-in (ebf*)"].append(item)
        elif d.startswith("opr"):
            categorias["Operadores (opr*)"].append(item)
        elif d.startswith("is"):
            categorias["Comparações (is*)"].append(item)
        elif d.startswith("to"):
            categorias["Conversões (to*)"].append(item)
        elif d.startswith("const_"):
            categorias["Constantes"].append(item)
        elif any(d.startswith(p) for p in ["Declare", "Body", "Drop", "Call", "Rule", "Set", "Format", "Open"]):
            categorias["Estruturas de Código"].append(item)
        elif d in ["Inteiro", "Letras", "Lógico", "Fracionado", "Data", "Hora", "Formulário", "Componente"]:
            categorias["Tipos de Dados"].append(item)
        elif any(d.startswith(p) for p in ["IF", "Begin", "End", "Comment", "New", "Param", "Prefix", "Return", "Escape", "Decimal", "Execute"]):
            categorias["Controle de Fluxo e Sintaxe"].append(item)
        else:
            categorias["Outros"].append(item)

    lines = [
        "# Referência do Compilador/Gerador de Código do Maker AI\n",
        "O compilador do Maker AI utiliza **descritores** para gerar código em diferentes",
        "linguagens (Servidor/Java, Cliente/JavaScript, Banco de Dados/SQL).\n",
        "Cada descritor define um padrão de sintaxe usado na geração do código a partir",
        "dos fluxogramas visuais.\n",
        f"Total de descritores: **{len(compilador_rows)}**\n",
        "[← Voltar para Nativos](../README.md)\n",
        "---\n",
        "## Categorias\n",
    ]

    for cat in sorted(categorias.keys()):
        lines.append(f"- [{cat}](#{safe_filename(cat)}) ({len(categorias[cat])} descritores)")
    lines.append("")

    for cat in sorted(categorias.keys()):
        items = sorted(categorias[cat], key=lambda x: x["descritor"])
        lines.append(f"## {cat}\n")

        for item in items:
            lines.append(f"### `{item['descritor']}`\n")
            lines.append(item["especificacao"])
            lines.append("\n---\n")

    if compilador_db_rows:
        lines.append("## Compiladores por Banco de Dados\n")
        lines.append("| Database | Descritor | Valor |")
        lines.append("|----------|-----------|-------|")
        for row in compilador_db_rows[:100]:
            db = row.get("DBS_CODIGO", "")
            desc = row.get("CPL_DESCRITOR", "")
            val = row.get("CPL_ESPECIFICACAO", "")
            if len(val) > 100:
                val = val[:97] + "..."
            val = val.replace("|", "\\|").replace("\n", " ")
            lines.append(f"| {db} | `{desc}` | {val} |")

    lines.append("\n---\n")
    lines.append("*Documentação gerada automaticamente a partir de FR_COMPILADOR/FR_COMPILADOR_DATABASE*\n")

    with open(os.path.join(comp_dir, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"  ✓ {len(compilador_rows)} descritores do compilador documentados")
    return len(compilador_rows)


# ═══════════════════════════════════════════════════════════════
#  6. DICIONÁRIO DE DADOS
# ═══════════════════════════════════════════════════════════════

def parse_dicionario_dados():
    """Parse DicionarioDeDadosMakerAi.xml (conteúdo mínimo)."""
    filepath = os.path.join(NATIVOS_DIR, "DicionarioDeDadosMakerAi.xml")
    if not os.path.exists(filepath):
        print("  ⚠ DicionarioDeDadosMakerAi.xml não encontrado")
        return

    print("  Parseando dicionário de dados...")
    root = parse_xml_file(filepath)

    # Tabelas
    tables = root.findall(".//table")
    tabelas = []
    for table in tables:
        nome = get_prop(table, "TAB_NOME") or table.get("TAB_NOME", "")
        tabelas.append({"nome": nome})

    # Campos
    fields_elem = root.find(".//fields")
    campos = []
    if fields_elem is not None:
        for field in fields_elem.findall("field"):
            campos.append({
                "tabela": get_prop(field, "TAB_NOME"),
                "campo": get_prop(field, "CMP_NOME"),
                "descricao": get_prop(field, "CMP_DESCRICAO"),
                "tipo": get_prop(field, "TPD_CODIGO"),
            })

    if not tabelas and not campos:
        print("  ⚠ Dicionário de dados vazio ou estrutura diferente. Pulando.")
        return

    dd_dir = os.path.join(OUTPUT_DIR, "dicionario-dados")
    ensure_dir(dd_dir)

    lines = [
        "# Dicionário de Dados Nativo do Maker AI\n",
        "[← Voltar para Nativos](../README.md)\n",
        "---\n",
    ]

    if tabelas:
        lines.append(f"## Tabelas ({len(tabelas)})\n")
        for t in tabelas:
            lines.append(f"- `{t['nome']}`")
        lines.append("")

    if campos:
        lines.append(f"## Campos ({len(campos)})\n")
        lines.append("| Tabela | Campo | Descrição | Tipo |")
        lines.append("|--------|-------|-----------|------|")
        for c in campos:
            lines.append(f"| {c['tabela']} | {c['campo']} | {c['descricao']} | {c['tipo']} |")

    lines.append("\n---\n")
    lines.append("*Documentação gerada automaticamente a partir de DicionarioDeDadosMakerAi.xml*\n")

    with open(os.path.join(dd_dir, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"  ✓ Dicionário documentado ({len(tabelas)} tabelas, {len(campos)} campos)")


# ═══════════════════════════════════════════════════════════════
#  README PRINCIPAL DOS NATIVOS
# ═══════════════════════════════════════════════════════════════

def gerar_readme_principal(stats):
    """Gera o README principal da seção de nativos."""
    lines = [
        "# Componentes Nativos do Maker AI\n",
        "Documentação completa dos componentes nativos exportados do Maker AI v6.1.0.14.\n",
        "Estes componentes fazem parte do núcleo da plataforma e definem as funcionalidades",
        "built-in disponíveis para desenvolvimento no Maker.\n",
        "---\n",
        "## Seções\n",
    ]

    sections = [
        ("funcoes", "Funções Nativas", "Referência completa de todas as funções built-in do Maker, organizadas por categoria.",
         stats.get("funcoes_total", 0), stats.get("funcoes_cats", 0)),
        ("fluxos", "Fluxos Nativos", "Fluxogramas nativos pré-definidos da plataforma.",
         stats.get("fluxos_total", 0), None),
        ("templates-fluxos", "Templates de Fluxos", "Templates reutilizáveis para criação de fluxogramas.",
         stats.get("templates_total", 0), None),
        ("formularios", "Formulários Nativos", "Formulários de sistema pré-definidos.",
         stats.get("forms_total", 0), None),
        ("dados-tabelas", "Dados das Tabelas Nativas", "Dados de referência e configuração das tabelas do framework.",
         stats.get("dados_total", 0), None),
        ("compilador", "Referência do Compilador", "Descritores do gerador de código (Servidor, Cliente, Banco).",
         stats.get("compilador_total", 0), None),
        ("dicionario-dados", "Dicionário de Dados", "Definições do dicionário de dados nativo.",
         None, None),
    ]

    for dir_name, title, desc, count, extra in sections:
        readme_path = os.path.join(OUTPUT_DIR, dir_name, "README.md")
        if os.path.exists(readme_path):
            lines.append(f"### [{title}]({dir_name}/README.md)")
            lines.append(f"{desc}")
            if count:
                lines.append(f"- **{count}** itens documentados")
            if extra:
                lines.append(f"- **{extra}** categorias")
            lines.append("")

    lines.append("---\n")
    lines.append("## Origem dos Dados\n")
    lines.append("| Arquivo XML | Conteúdo |")
    lines.append("|-------------|----------|")
    lines.append("| FuncoesNativasMakerAi.xml | Todas as funções nativas com código-fonte |")
    lines.append("| FluxosNativosMakerAi.xml | Fluxogramas nativos do sistema |")
    lines.append("| TemplatesFluxosMakerAi.xml | Templates de fluxogramas |")
    lines.append("| FormulariosNativosMakerAi.xml | Formulários nativos do sistema |")
    lines.append("| DadosTabelasNativaMakerAi.xml | Dados de referência das tabelas nativas |")
    lines.append("| DicionarioDeDadosMakerAi.xml | Dicionário de dados |")
    lines.append("\n*Maker AI v6.1.0.14*\n")

    with open(os.path.join(OUTPUT_DIR, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))


# ═══════════════════════════════════════════════════════════════
#  MAIN
# ═══════════════════════════════════════════════════════════════

def main():
    print("=" * 60)
    print("  Gerador de Documentação - Nativos do Maker AI")
    print("=" * 60)
    print()

    ensure_dir(OUTPUT_DIR)
    stats = {}

    # 1. Funções Nativas
    print("[1/6] Funções Nativas")
    result = parse_funcoes_nativas()
    if result:
        stats["funcoes_total"], stats["funcoes_cats"] = result

    # 2. Fluxos Nativos
    print("[2/6] Fluxos Nativos")
    result = parse_fluxos(
        os.path.join(NATIVOS_DIR, "FluxosNativosMakerAi.xml"),
        "Fluxos Nativos do Maker AI",
        "fluxos"
    )
    if result:
        stats["fluxos_total"] = result

    # 3. Templates de Fluxos
    print("[3/6] Templates de Fluxos")
    result = parse_fluxos(
        os.path.join(NATIVOS_DIR, "TemplatesFluxosMakerAi.xml"),
        "Templates de Fluxos do Maker AI",
        "templates-fluxos"
    )
    if result:
        stats["templates_total"] = result

    # 4. Formulários Nativos
    print("[4/6] Formulários Nativos")
    result = parse_formularios_nativos()
    if result:
        stats["forms_total"] = result

    # 5. Dados das Tabelas Nativas
    print("[5/6] Dados das Tabelas Nativas")
    result = parse_dados_tabelas_nativas()
    if result:
        stats["dados_total"] = result

    # 5b. Compilador (extraído de FR_COMPILADOR)
    print("[5b/6] Referência do Compilador")
    result = parse_compilador_from_dados()
    if result:
        stats["compilador_total"] = result

    # 6. Dicionário de Dados
    print("[6/6] Dicionário de Dados")
    parse_dicionario_dados()

    # README principal
    print("\n[Final] Gerando README principal...")
    gerar_readme_principal(stats)

    # Resumo
    print("\n" + "=" * 60)
    print("  CONCLUÍDO!")
    print("=" * 60)
    print(f"  Output: {OUTPUT_DIR}")
    for key, val in sorted(stats.items()):
        print(f"  {key}: {val}")
    print()


if __name__ == "__main__":
    main()

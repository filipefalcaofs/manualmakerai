#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gerador de documentação dos Recursos da IDE Maker AI.
Analisa a pasta Resources/ e gera documentação em Markdown.
"""

import os
import xml.etree.ElementTree as ET
import json
import re
from pathlib import Path
from collections import defaultdict

# ── Caminhos ──────────────────────────────────────────────────────
RESOURCES_DIR = os.path.join(os.path.dirname(__file__), "Resources")
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "manual_maker_ai", "recursos-ide")


def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def read_file_text(filepath, encoding="iso-8859-1"):
    try:
        with open(filepath, "r", encoding=encoding, errors="ignore") as f:
            return f.read()
    except Exception:
        return ""


def parse_xml_safe(filepath):
    """Parse XML com tratamento de encoding iso-8859-1."""
    try:
        tree = ET.parse(filepath)
        return tree.getroot()
    except ET.ParseError:
        # Tenta carregar como string e limpar
        text = read_file_text(filepath)
        text = re.sub(r'&(?!amp;|lt;|gt;|quot;|apos;|#)', '&amp;', text)
        try:
            return ET.fromstring(text)
        except Exception:
            return None
    except Exception:
        return None


# ══════════════════════════════════════════════════════════════════
# 1. VISÃO GERAL (README)
# ══════════════════════════════════════════════════════════════════

def generate_overview():
    lines = []
    lines.append("# 🧰 Recursos da IDE Maker AI\n")
    lines.append("Documentação dos recursos internos da IDE do Maker AI, incluindo componentes adicionais,")
    lines.append("plugins, templates de projeto, skins, esquemas de cores, dicionários e configurações do runner.\n")
    lines.append("## 📂 Estrutura da Pasta Resources\n")
    lines.append("```")
    lines.append("Resources/")
    lines.append("├── PT/                    # Recursos em Português")
    lines.append("│   ├── Components/        # 23 componentes adicionais")
    lines.append("│   ├── Plugins/           # 7 plugins da IDE")
    lines.append("│   ├── ColorSchemes/      # Esquemas de cores")
    lines.append("│   ├── Systems/           # Sistemas de exemplo")
    lines.append("│   ├── api_12.2.*.frz     # 18 pacotes de API (versões)")
    lines.append("│   ├── dbsystem.frz       # Definição do banco do sistema")
    lines.append("│   ├── package.xml        # Funções de pacote")
    lines.append("│   ├── dbinfo.ini         # Compatibilidade de SGBDs")
    lines.append("│   ├── runner-portal.xml  # Configuração do Maker Mobile")
    lines.append("│   ├── inspector.dic      # Dicionário do inspetor de propriedades")
    lines.append("│   ├── words.dic          # Dicionário de palavras acentuadas")
    lines.append("│   └── dicionario.dic     # Traduções PT→EN do portal")
    lines.append("│")
    lines.append("├── EN/                    # Recursos em Inglês")
    lines.append("│   ├── Components/        # 22 componentes (sem QueryCopilot)")
    lines.append("│   ├── Plugins/           # 6 plugins (sem FabricaHub)")
    lines.append("│   └── componente.dic     # Dicionário de tipos de componentes")
    lines.append("│")
    lines.append("├── runner/                # Definições do Runner (runtime)")
    lines.append("│   └── *.list             # 20 arquivos de propriedades de componentes")
    lines.append("│")
    lines.append("├── Skins/                 # Skins visuais")
    lines.append("│   └── Bootstrap/         # Skin Bootstrap com formas de fluxo")
    lines.append("│")
    lines.append("└── Templates/             # Templates de projeto")
    lines.append("    ├── Jupiter/           # Template Júpiter v1.0.0.2")
    lines.append("    ├── Saturno/           # Template Saturno v1.0.0.3")
    lines.append("    └── Venus/             # Template Vênus v1.0.0.2")
    lines.append("```\n")

    # Estatísticas
    file_count = 0
    total_size = 0
    ext_counts = defaultdict(int)
    for root, dirs, files in os.walk(RESOURCES_DIR):
        for f in files:
            fp = os.path.join(root, f)
            file_count += 1
            try:
                total_size += os.path.getsize(fp)
            except OSError:
                pass
            ext = os.path.splitext(f)[1].lower()
            ext_counts[ext] += 1

    lines.append("## 📊 Estatísticas\n")
    lines.append(f"| Métrica | Valor |")
    lines.append(f"|---------|-------|")
    lines.append(f"| Total de arquivos | {file_count} |")
    lines.append(f"| Tamanho total | {total_size / 1024 / 1024:.1f} MB |")
    lines.append(f"| Componentes adicionais (PT) | 23 |")
    lines.append(f"| Componentes adicionais (EN) | 22 |")
    lines.append(f"| Plugins | 7 (PT) / 6 (EN) |")
    lines.append(f"| Templates de projeto | 3 |")
    lines.append(f"| Esquemas de cores | 2 |")
    lines.append(f"| Arquivos de propriedades (runner) | 20 |")
    lines.append("")
    lines.append("**Tipos de arquivo:**\n")
    lines.append("| Extensão | Quantidade |")
    lines.append("|----------|-----------|")
    for ext, count in sorted(ext_counts.items(), key=lambda x: -x[1]):
        lines.append(f"| {ext or '(sem extensão)'} | {count} |")
    lines.append("")

    lines.append("## 📄 Arquivos desta Seção\n")
    lines.append("| # | Arquivo | Descrição |")
    lines.append("|---|---------|-----------|")
    lines.append("| 1 | [01-componentes-adicionais.md](01-componentes-adicionais.md) | 23 componentes adicionais da IDE |")
    lines.append("| 2 | [02-plugins.md](02-plugins.md) | 7 plugins da IDE |")
    lines.append("| 3 | [03-propriedades-runner.md](03-propriedades-runner.md) | Propriedades dos componentes no runtime |")
    lines.append("| 4 | [04-templates-projeto.md](04-templates-projeto.md) | Templates Júpiter, Saturno e Vênus |")
    lines.append("| 5 | [05-skins-e-cores.md](05-skins-e-cores.md) | Skins e esquemas de cores |")
    lines.append("| 6 | [06-dicionarios.md](06-dicionarios.md) | Dicionários da IDE |")
    lines.append("| 7 | [07-configuracoes.md](07-configuracoes.md) | Configurações (SGBD, portal, pacotes) |")
    lines.append("| 8 | [08-api-versoes.md](08-api-versoes.md) | Histórico de versões da API |")
    lines.append("")

    with open(os.path.join(OUTPUT_DIR, "README.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print("  ✔ README.md")


# ══════════════════════════════════════════════════════════════════
# 2. COMPONENTES ADICIONAIS
# ══════════════════════════════════════════════════════════════════

def parse_component_xml(filepath):
    """Parse um XML de componente e retorna dict com propriedades, eventos e funções."""
    root = parse_xml_safe(filepath)
    if root is None:
        return None

    comp = {
        "class": root.get("class", ""),
        "category": root.get("category", ""),
        "docurl": root.get("docurl", ""),
        "version": root.get("version", ""),
        "properties": [],
        "events": [],
        "functions": [],
    }

    for prop in root.findall(".//property"):
        visible = prop.get("visible", "true")
        if visible == "false":
            continue
        p = {
            "description": prop.get("description", ""),
            "realname": prop.get("realname", ""),
            "type": prop.get("type", ""),
            "default": prop.get("default", ""),
            "dialogtype": prop.get("dialogtype", ""),
        }
        # Parse list items
        items = []
        for item in prop.findall(".//item"):
            items.append({"name": item.get("name", ""), "value": item.get("value", "")})
        if items:
            p["items"] = items
        # Check for SQL source
        sql_list = prop.find(".//list")
        if sql_list is not None and sql_list.get("sql"):
            p["sql_source"] = True
        comp["properties"].append(p)

    for evt in root.findall(".//event"):
        comp["events"].append({
            "description": evt.get("description", ""),
            "realname": evt.get("realname", ""),
        })

    for func in root.findall(".//function"):
        fn = {
            "name": func.get("name", ""),
            "category": func.get("category", ""),
        }
        desc_el = func.find("description")
        if desc_el is not None and desc_el.text:
            fn["description"] = desc_el.text.strip()
        params = []
        for param in func.findall(".//input"):
            params.append({
                "name": param.get("name", ""),
                "type": param.get("type", ""),
            })
        fn["params"] = params
        comp["functions"].append(fn)

    return comp


def generate_components_doc():
    lines = []
    lines.append("# 🧩 Componentes Adicionais da IDE\n")
    lines.append("A IDE Maker AI inclui componentes adicionais que estendem os componentes básicos do formulário.")
    lines.append("Cada componente é definido em um arquivo XML dentro de `Resources/PT/Components/` (ou `EN/Components/`).\n")

    comp_dir = os.path.join(RESOURCES_DIR, "PT", "Components")
    components = []

    if os.path.isdir(comp_dir):
        for name in sorted(os.listdir(comp_dir)):
            comp_path = os.path.join(comp_dir, name)
            if not os.path.isdir(comp_path):
                continue
            # Find XML file
            xml_file = None
            for f in os.listdir(comp_path):
                if f.lower().endswith(".xml"):
                    xml_file = os.path.join(comp_path, f)
                    break
            if xml_file is None:
                continue
            comp = parse_component_xml(xml_file)
            if comp:
                comp["folder"] = name
                # Count images
                img_dir = os.path.join(comp_path, "Images")
                comp["image_count"] = len(os.listdir(img_dir)) if os.path.isdir(img_dir) else 0
                components.append(comp)

    # Summary table
    lines.append("## Resumo dos Componentes\n")
    lines.append(f"Total: **{len(components)} componentes** em português ({len(components) - 1} em inglês, sem QueryCopilot).\n")
    lines.append("| # | Componente | Categoria | Propriedades | Eventos | Funções | Manual |")
    lines.append("|---|-----------|-----------|:------------:|:-------:|:-------:|--------|")
    for i, c in enumerate(components, 1):
        doc_link = f"[Link]({c['docurl']})" if c["docurl"] else "—"
        lines.append(f"| {i} | **{c['class']}** | {c['category']} | {len(c['properties'])} | {len(c['events'])} | {len(c['functions'])} | {doc_link} |")
    lines.append("")

    # Categorias
    cats = defaultdict(list)
    for c in components:
        cats[c["category"]].append(c)
    lines.append("### Categorias\n")
    for cat, comps in sorted(cats.items()):
        names = ", ".join(c["class"] for c in comps)
        lines.append(f"- **{cat}** ({len(comps)}): {names}")
    lines.append("")

    # Detail per component
    lines.append("---\n")
    for c in components:
        lines.append(f"## {c['class']}\n")
        lines.append(f"- **Categoria:** {c['category']}")
        lines.append(f"- **Pasta:** `Components/{c['folder']}/`")
        if c["docurl"]:
            lines.append(f"- **Manual:** {c['docurl']}")
        if c["version"]:
            lines.append(f"- **Versão:** {c['version']}")
        lines.append("")

        if c["properties"]:
            lines.append("### Propriedades\n")
            lines.append("| Propriedade | Nome Interno | Tipo | Valor Padrão |")
            lines.append("|------------|-------------|------|-------------|")
            for p in c["properties"]:
                tipo = p["type"]
                default = p["default"] if p["default"] else "—"
                if len(default) > 40:
                    default = default[:37] + "..."
                lines.append(f"| {p['description']} | `{p['realname']}` | {tipo} | {default} |")
            lines.append("")

            # List-type properties details
            list_props = [p for p in c["properties"] if "items" in p]
            if list_props:
                lines.append("#### Valores de Lista\n")
                for p in list_props:
                    lines.append(f"**{p['description']}** (`{p['realname']}`):\n")
                    for item in p["items"]:
                        lines.append(f"- `{item['value']}` — {item['name']}")
                    lines.append("")

        if c["events"]:
            lines.append("### Eventos\n")
            lines.append("| Evento | Nome Interno |")
            lines.append("|--------|-------------|")
            for e in c["events"]:
                lines.append(f"| {e['description']} | `{e['realname']}` |")
            lines.append("")

        if c["functions"]:
            lines.append("### Funções\n")
            for fn in c["functions"]:
                lines.append(f"#### {fn['name']}\n")
                if fn.get("description"):
                    lines.append(f"```")
                    lines.append(fn["description"])
                    lines.append(f"```\n")
                if fn["params"]:
                    lines.append("**Parâmetros:**\n")
                    for ip, param in enumerate(fn["params"], 1):
                        lines.append(f"{ip}. `{param['name']}` — {param['type']}")
                    lines.append("")

        lines.append("---\n")

    with open(os.path.join(OUTPUT_DIR, "01-componentes-adicionais.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"  ✔ 01-componentes-adicionais.md ({len(components)} componentes)")


# ══════════════════════════════════════════════════════════════════
# 3. PLUGINS
# ══════════════════════════════════════════════════════════════════

def generate_plugins_doc():
    lines = []
    lines.append("# 🔌 Plugins da IDE Maker AI\n")
    lines.append("Plugins são extensões da IDE que adicionam funcionalidades acessíveis pelo menu de ferramentas.\n")

    for lang, label in [("PT", "Português"), ("EN", "Inglês")]:
        plugins_dir = os.path.join(RESOURCES_DIR, lang, "Plugins")
        if not os.path.isdir(plugins_dir):
            continue

        lines.append(f"## Plugins — {label}\n")
        plugins = []
        for name in sorted(os.listdir(plugins_dir)):
            pdir = os.path.join(plugins_dir, name)
            if not os.path.isdir(pdir):
                continue
            xml_file = None
            for f in os.listdir(pdir):
                if f.lower().endswith(".xml"):
                    xml_file = os.path.join(pdir, f)
                    break
            if xml_file is None:
                continue
            root = parse_xml_safe(xml_file)
            if root is None:
                continue
            for plugin in root.findall(".//plugin"):
                plugins.append({
                    "id": plugin.get("id", ""),
                    "caption": plugin.get("caption", ""),
                    "hint": plugin.get("hint", ""),
                    "endpoint": plugin.get("endpoint", ""),
                    "width": plugin.get("width", ""),
                    "height": plugin.get("height", ""),
                    "formguid": plugin.get("formguid", ""),
                    "folder": name,
                })

        lines.append("| Plugin | ID | Endpoint | Dimensão | Descrição |")
        lines.append("|--------|----|----------|----------|-----------|")
        for p in plugins:
            endpoint = f"`{p['endpoint']}`" if p["endpoint"] else "—"
            dim = f"{p['width']}×{p['height']}" if p["width"] else "—"
            lines.append(f"| **{p['caption']}** | `{p['id']}` | {endpoint} | {dim} | {p['hint']} |")
        lines.append("")

        for p in plugins:
            lines.append(f"### {p['caption']}\n")
            lines.append(f"- **ID:** `{p['id']}`")
            lines.append(f"- **Pasta:** `Plugins/{p['folder']}/`")
            if p["endpoint"]:
                lines.append(f"- **Endpoint JSP:** `{p['endpoint']}`")
            lines.append(f"- **Formulário GUID:** `{p['formguid']}`")
            lines.append(f"- **Dimensão da janela:** {p['width']}×{p['height']} px")
            if p["hint"]:
                lines.append(f"- **Tooltip:** {p['hint']}")
            lines.append("")

    # Diferenças PT vs EN
    pt_plugins = set(os.listdir(os.path.join(RESOURCES_DIR, "PT", "Plugins"))) if os.path.isdir(os.path.join(RESOURCES_DIR, "PT", "Plugins")) else set()
    en_plugins = set(os.listdir(os.path.join(RESOURCES_DIR, "EN", "Plugins"))) if os.path.isdir(os.path.join(RESOURCES_DIR, "EN", "Plugins")) else set()
    pt_only = pt_plugins - en_plugins
    if pt_only:
        lines.append("## Diferenças entre PT e EN\n")
        lines.append(f"Plugins exclusivos do Português: **{', '.join(sorted(pt_only))}**\n")

    with open(os.path.join(OUTPUT_DIR, "02-plugins.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"  ✔ 02-plugins.md")


# ══════════════════════════════════════════════════════════════════
# 4. PROPRIEDADES DO RUNNER
# ══════════════════════════════════════════════════════════════════

def generate_runner_doc():
    lines = []
    lines.append("# ⚡ Propriedades dos Componentes no Runner\n")
    lines.append("Os arquivos `.list` em `Resources/runner/` definem quais propriedades e eventos cada tipo")
    lines.append("de componente expõe no runtime (Webrun). Cada linha segue o formato `NomeInterno=Rótulo Exibido`.\n")

    runner_dir = os.path.join(RESOURCES_DIR, "runner")
    if not os.path.isdir(runner_dir):
        lines.append("*Pasta runner/ não encontrada.*\n")
        with open(os.path.join(OUTPUT_DIR, "03-propriedades-runner.md"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines))
        return

    list_files = sorted([f for f in os.listdir(runner_dir) if f.endswith(".list")])

    # Summary
    lines.append("## Resumo\n")
    lines.append(f"Total: **{len(list_files)} arquivos de definição**\n")
    lines.append("| Arquivo | Componente | Propriedades | Eventos |")
    lines.append("|---------|-----------|:-----------:|:------:|")

    all_data = {}
    for lf in list_files:
        filepath = os.path.join(runner_dir, lf)
        text = read_file_text(filepath, encoding="utf-8")
        props = []
        events = []
        for line in text.strip().split("\n"):
            line = line.strip()
            if not line or "=" not in line:
                continue
            key, val = line.split("=", 1)
            if val.strip().startswith("Ao ") or val.strip().startswith("Antes de") or val.strip().startswith("Depois de"):
                events.append((key.strip(), val.strip()))
            else:
                props.append((key.strip(), val.strip()))
        comp_name = lf.replace("component.", "").replace(".list", "").title()
        if comp_name == "":
            comp_name = "Base (Geral)"
        all_data[lf] = {"name": comp_name, "props": props, "events": events}
        lines.append(f"| `{lf}` | {comp_name} | {len(props)} | {len(events)} |")
    lines.append("")

    # Details per component
    for lf, data in all_data.items():
        lines.append(f"---\n")
        lines.append(f"## {data['name']} (`{lf}`)\n")

        if data["props"]:
            lines.append("### Propriedades\n")
            lines.append("| Nome Interno | Rótulo |")
            lines.append("|-------------|--------|")
            for key, val in data["props"]:
                lines.append(f"| `{key}` | {val} |")
            lines.append("")

        if data["events"]:
            lines.append("### Eventos\n")
            lines.append("| Nome Interno | Rótulo |")
            lines.append("|-------------|--------|")
            for key, val in data["events"]:
                lines.append(f"| `{key}` | {val} |")
            lines.append("")

    with open(os.path.join(OUTPUT_DIR, "03-propriedades-runner.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"  ✔ 03-propriedades-runner.md ({len(list_files)} componentes)")


# ══════════════════════════════════════════════════════════════════
# 5. TEMPLATES DE PROJETO
# ══════════════════════════════════════════════════════════════════

def generate_templates_doc():
    lines = []
    lines.append("# 🎨 Templates de Projeto\n")
    lines.append("A IDE Maker AI inclui 3 templates de projeto pré-configurados que servem como ponto de partida")
    lines.append("para novos sistemas. Cada template inclui formulários de login, tela principal e dependências.\n")

    templates_dir = os.path.join(RESOURCES_DIR, "Templates")
    if not os.path.isdir(templates_dir):
        lines.append("*Pasta Templates/ não encontrada.*\n")
        with open(os.path.join(OUTPUT_DIR, "04-templates-projeto.md"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines))
        return

    templates = []
    for name in sorted(os.listdir(templates_dir)):
        tdir = os.path.join(templates_dir, name)
        if not os.path.isdir(tdir):
            continue
        json_file = os.path.join(tdir, "template.json")
        if not os.path.isfile(json_file):
            continue
        try:
            with open(json_file, "r", encoding="utf-8", errors="ignore") as f:
                data = json.load(f)
        except Exception:
            data = {}

        files = os.listdir(tdir)
        frz_files = [f for f in files if f.lower().endswith(".frz")]

        templates.append({
            "folder": name,
            "name": data.get("name", name),
            "author": data.get("author", ""),
            "version": data.get("version", ""),
            "preview_url": data.get("preview_url", ""),
            "files": files,
            "frz_files": frz_files,
        })

    lines.append("## Visão Geral\n")
    lines.append("| Template | Versão | Autor | Arquivos FRZ |")
    lines.append("|----------|--------|-------|:------------:|")
    for t in templates:
        lines.append(f"| **{t['name']}** | {t['version']} | {t['author']} | {len(t['frz_files'])} |")
    lines.append("")

    for t in templates:
        lines.append(f"---\n")
        lines.append(f"## {t['name']}\n")
        lines.append(f"- **Pasta:** `Templates/{t['folder']}/`")
        lines.append(f"- **Versão:** {t['version']}")
        lines.append(f"- **Autor:** {t['author']}")
        if t["preview_url"]:
            lines.append(f"- **Preview:** {t['preview_url']}")
        lines.append("")
        lines.append("### Arquivos\n")
        lines.append("| Arquivo | Tipo |")
        lines.append("|---------|------|")
        for f in sorted(t["files"]):
            ext = os.path.splitext(f)[1].lower()
            type_map = {
                ".json": "Configuração",
                ".frz": "Formulário compilado",
            }
            tipo = type_map.get(ext, ext)
            lines.append(f"| `{f}` | {tipo} |")
        lines.append("")
        lines.append("### Estrutura dos Formulários\n")
        for frz in sorted(t["frz_files"]):
            label = frz.replace("template_", "").replace(".frz", "").replace("_", " ").title()
            lines.append(f"- **{label}** — `{frz}`")
        lines.append("")

    with open(os.path.join(OUTPUT_DIR, "04-templates-projeto.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"  ✔ 04-templates-projeto.md ({len(templates)} templates)")


# ══════════════════════════════════════════════════════════════════
# 6. SKINS E ESQUEMAS DE CORES
# ══════════════════════════════════════════════════════════════════

def parse_colorscheme(filepath):
    root = parse_xml_safe(filepath)
    if root is None:
        return None
    scheme = {"name": root.get("name", ""), "attrs": {}, "sections": {}}
    for key, val in root.attrib.items():
        if key != "name":
            scheme["attrs"][key] = val
    for child in root:
        section = {"attrs": dict(child.attrib), "subsections": {}}
        for sub in child:
            section["subsections"][sub.tag] = dict(sub.attrib)
        scheme["sections"][child.tag] = section
    return scheme


def generate_skins_doc():
    lines = []
    lines.append("# 🎭 Skins e Esquemas de Cores\n")

    # Skins
    lines.append("## Skins\n")
    skins_dir = os.path.join(RESOURCES_DIR, "Skins", "Bootstrap")
    if os.path.isdir(skins_dir):
        files = os.listdir(skins_dir)
        ini_file = os.path.join(skins_dir, "Default.ini")
        if os.path.isfile(ini_file):
            ini_text = read_file_text(ini_file, encoding="utf-8")
            lines.append("### Bootstrap (Padrão)\n")
            lines.append("Configuração em `Skins/Bootstrap/Default.ini`:\n")
            lines.append("```ini")
            lines.append(ini_text.strip())
            lines.append("```\n")

        # Flow shapes
        pngs = [f for f in files if f.lower().endswith(".png")]
        if pngs:
            lines.append("### Formas de Fluxo\n")
            lines.append("Imagens PNG para os nós do editor de fluxo visual:\n")
            lines.append("| Arquivo | Tipo de Nó |")
            lines.append("|---------|-----------|")
            shape_names = {
                "TFLOWSTART": "Início",
                "TFLOWEND": "Fim",
                "TFLOWDECISION": "Decisão (Se/Senão)",
                "TFLOWEXPRESSION": "Expressão",
                "TFLOWACTIVITY": "Atividade",
                "TFLOWLOOP": "Loop (Repetição)",
                "TFLOWREMARK": "Observação",
                "TFLOWSUBROUTINE": "Sub-rotina",
            }
            for png in sorted(pngs):
                name = os.path.splitext(png)[0]
                desc = shape_names.get(name, name)
                lines.append(f"| `{png}` | {desc} |")
            lines.append("")

    # Color Schemes
    lines.append("## Esquemas de Cores\n")
    cs_dir = os.path.join(RESOURCES_DIR, "PT", "ColorSchemes")
    if os.path.isdir(cs_dir):
        for f in sorted(os.listdir(cs_dir)):
            if not f.lower().endswith(".xml"):
                continue
            filepath = os.path.join(cs_dir, f)
            scheme = parse_colorscheme(filepath)
            if scheme is None:
                continue

            lines.append(f"### {scheme['name']}\n")
            lines.append(f"Arquivo: `PT/ColorSchemes/{f}`\n")

            # Main attributes
            lines.append("#### Cores Principais\n")
            lines.append("| Propriedade | Valor |")
            lines.append("|------------|-------|")
            for key, val in scheme["attrs"].items():
                lines.append(f"| `{key}` | `{val}` |")
            lines.append("")

            # Sections
            if scheme["sections"]:
                lines.append("#### Seções de Cores\n")
                for sec_name, sec in scheme["sections"].items():
                    lines.append(f"**{sec_name}:**\n")
                    if sec["attrs"]:
                        lines.append("| Propriedade | Valor |")
                        lines.append("|------------|-------|")
                        for key, val in sec["attrs"].items():
                            lines.append(f"| `{key}` | `{val}` |")
                        lines.append("")
                    for sub_name, sub_attrs in sec["subsections"].items():
                        lines.append(f"*{sub_name}:*\n")
                        lines.append("| Propriedade | Valor |")
                        lines.append("|------------|-------|")
                        for key, val in sub_attrs.items():
                            lines.append(f"| `{key}` | `{val}` |")
                        lines.append("")

    with open(os.path.join(OUTPUT_DIR, "05-skins-e-cores.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print("  ✔ 05-skins-e-cores.md")


# ══════════════════════════════════════════════════════════════════
# 7. DICIONÁRIOS
# ══════════════════════════════════════════════════════════════════

def parse_dic_file(filepath):
    """Parse um arquivo .dic e agrupa por seção."""
    text = read_file_text(filepath)
    sections = {}
    current_section = "GERAL"
    for line in text.strip().split("\n"):
        line = line.strip()
        if not line:
            continue
        if line.startswith("[") and line.endswith("]"):
            current_section = line[1:-1]
            continue
        if line.startswith(">>"):
            current_section = line[2:].strip()
            continue
        if "=" in line:
            key, val = line.split("=", 1)
            if current_section not in sections:
                sections[current_section] = []
            sections[current_section].append((key.strip(), val.strip()))
    return sections


def generate_dictionaries_doc():
    lines = []
    lines.append("# 📖 Dicionários da IDE\n")
    lines.append("A IDE Maker AI usa arquivos `.dic` para tradução da interface, nomes de propriedades,")
    lines.append("autocompletar de campos e inspetor de propriedades.\n")

    dic_files = [
        ("PT/inspector.dic", "Inspetor de Propriedades", "Traduz nomes internos de propriedades, eventos e cores para português legível no inspetor da IDE."),
        ("PT/words.dic", "Dicionário de Palavras", "Mapeamento de palavras sem acento → com acento, usado para sugestão automática de nomes de campos."),
        ("PT/dicionario.dic", "Traduções do Portal", "Tradução de termos do portal Maker Mobile (PT → EN)."),
        ("EN/componente.dic", "Tipos de Componentes (EN)", "Tradução de nomes de componentes e tipos de dados do português para inglês."),
    ]

    lines.append("## Resumo\n")
    lines.append("| Arquivo | Descrição | Entradas |")
    lines.append("|---------|-----------|:--------:|")

    all_dics = []
    for path, name, desc in dic_files:
        full_path = os.path.join(RESOURCES_DIR, path)
        if not os.path.isfile(full_path):
            continue
        sections = parse_dic_file(full_path)
        total = sum(len(v) for v in sections.values())
        lines.append(f"| `{path}` | {name} | {total} |")
        all_dics.append((path, name, desc, sections))
    lines.append("")

    for path, name, desc, sections in all_dics:
        lines.append(f"---\n")
        lines.append(f"## {name}\n")
        lines.append(f"**Arquivo:** `{path}`\n")
        lines.append(f"{desc}\n")

        total = sum(len(v) for v in sections.values())
        lines.append(f"Total de entradas: **{total}**\n")

        for sec_name, entries in sections.items():
            if len(sections) > 1:
                lines.append(f"### {sec_name}\n")
            # Limit output for very large sections
            lines.append("| Original | Tradução/Valor |")
            lines.append("|----------|---------------|")
            for key, val in entries[:80]:
                lines.append(f"| `{key}` | {val} |")
            if len(entries) > 80:
                lines.append(f"| ... | *+{len(entries) - 80} entradas adicionais* |")
            lines.append("")

    with open(os.path.join(OUTPUT_DIR, "06-dicionarios.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"  ✔ 06-dicionarios.md")


# ══════════════════════════════════════════════════════════════════
# 8. CONFIGURAÇÕES
# ══════════════════════════════════════════════════════════════════

def generate_configurations_doc():
    lines = []
    lines.append("# ⚙️ Configurações da IDE\n")

    # package.xml
    lines.append("## Funções de Pacote (`package.xml`)\n")
    pkg_file = os.path.join(RESOURCES_DIR, "PT", "package.xml")
    if os.path.isfile(pkg_file):
        root = parse_xml_safe(pkg_file)
        if root is not None:
            lines.append("Funções disponíveis no nível de pacote para manipulação de propriedades em tempo de execução:\n")
            for func in root.findall(".//function"):
                name = func.get("name", "")
                cat = func.get("category", "")
                lines.append(f"### {name}\n")
                lines.append(f"- **Categoria:** {cat}")
                desc = func.find("description")
                if desc is not None and desc.text:
                    lines.append(f"\n```")
                    lines.append(desc.text.strip())
                    lines.append("```\n")
                params = func.findall(".//input")
                if params:
                    lines.append("**Parâmetros:**\n")
                    for i, p in enumerate(params, 1):
                        lines.append(f"{i}. `{p.get('name', '')}` — {p.get('type', '')}")
                    lines.append("")
                ret = func.find(".//output")
                if ret is not None:
                    lines.append(f"**Retorno:** `{ret.get('name', '')}` — {ret.get('type', '')}\n")
    lines.append("")

    # dbinfo.ini
    lines.append("---\n")
    lines.append("## Compatibilidade de SGBDs (`dbinfo.ini`)\n")
    dbinfo_file = os.path.join(RESOURCES_DIR, "PT", "dbinfo.ini")
    if os.path.isfile(dbinfo_file):
        text = read_file_text(dbinfo_file)
        sections = {}
        current = None
        for line in text.strip().split("\n"):
            line = line.strip()
            if line.startswith("[") and line.endswith("]"):
                current = line[1:-1]
                sections[current] = []
            elif current and line:
                sections[current].append(line)

        lines.append("Informações de compatibilidade e requisitos por banco de dados:\n")
        for sgbd, info_lines in sections.items():
            lines.append(f"### {sgbd}\n")
            for il in info_lines:
                lines.append(f"- {il}")
            lines.append("")
    lines.append("")

    # runner-portal.xml
    lines.append("---\n")
    lines.append("## Portal Maker Mobile (`runner-portal.xml`)\n")
    portal_file = os.path.join(RESOURCES_DIR, "PT", "runner-portal.xml")
    if os.path.isfile(portal_file):
        root = parse_xml_safe(portal_file)
        if root is not None:
            base_url = root.get("base-url", "")
            lines.append(f"- **URL Base:** `{base_url}`\n")

            login = root.find(".//login")
            if login is not None:
                lines.append(f"- **Login URL:** `{login.get('url', '')}`")

            logout = root.find(".//logout")
            if logout is not None:
                lines.append(f"- **Logout URL:** `{logout.get('url', '')}`")
            lines.append("")

            menu = root.find(".//menu")
            if menu is not None:
                items = menu.findall(".//item")
                if items:
                    lines.append("### Menu do Portal\n")
                    lines.append("| Item | URL |")
                    lines.append("|------|-----|")
                    for item in items:
                        caption = item.get("caption", "")
                        url = item.get("url", "")
                        lines.append(f"| {caption} | `{url}` |")
                    lines.append("")

    with open(os.path.join(OUTPUT_DIR, "07-configuracoes.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print("  ✔ 07-configuracoes.md")


# ══════════════════════════════════════════════════════════════════
# 9. VERSÕES DA API
# ══════════════════════════════════════════════════════════════════

def generate_api_versions_doc():
    lines = []
    lines.append("# 📦 Histórico de Versões da API\n")
    lines.append("Os arquivos `api_12.2.*.frz` na pasta `PT/` contêm pacotes binários de cada versão da API")
    lines.append("do Maker AI. Cada arquivo FRZ é um pacote compilado com as funções nativas daquela versão.\n")

    pt_dir = os.path.join(RESOURCES_DIR, "PT")
    api_files = []
    if os.path.isdir(pt_dir):
        for f in sorted(os.listdir(pt_dir)):
            if f.startswith("api_") and f.endswith(".frz"):
                fp = os.path.join(pt_dir, f)
                size = os.path.getsize(fp)
                # Extract version
                ver = f.replace("api_", "").replace(".frz", "")
                api_files.append({"file": f, "version": ver, "size": size})

    if not api_files:
        lines.append("*Nenhum arquivo de API encontrado.*\n")
    else:
        lines.append(f"Total: **{len(api_files)} versões** encontradas\n")
        lines.append("| # | Arquivo | Versão | Tamanho |")
        lines.append("|---|---------|--------|---------|")
        for i, af in enumerate(api_files, 1):
            size_kb = af["size"] / 1024
            lines.append(f"| {i} | `{af['file']}` | {af['version']} | {size_kb:.1f} KB |")
        lines.append("")

        # Size evolution
        if len(api_files) > 1:
            min_size = min(a["size"] for a in api_files)
            max_size = max(a["size"] for a in api_files)
            lines.append("### Evolução do Tamanho\n")
            lines.append(f"- **Menor pacote:** {api_files[0]['file']} ({api_files[0]['size']/1024:.1f} KB)")
            lines.append(f"- **Maior pacote:** {api_files[-1]['file']} ({api_files[-1]['size']/1024:.1f} KB)")
            growth = ((max_size - min_size) / min_size) * 100
            lines.append(f"- **Crescimento:** {growth:.1f}%")
            lines.append("")

    # Other FRZ files
    lines.append("---\n")
    lines.append("## Outros Pacotes FRZ\n")
    other_frz = []
    if os.path.isdir(pt_dir):
        for f in sorted(os.listdir(pt_dir)):
            if f.endswith(".frz") or f.endswith(".FRZ"):
                if not f.startswith("api_"):
                    fp = os.path.join(pt_dir, f)
                    size = os.path.getsize(fp)
                    other_frz.append({"file": f, "size": size})

    if other_frz:
        lines.append("| Arquivo | Tamanho | Descrição |")
        lines.append("|---------|---------|-----------|")
        frz_descriptions = {
            "AutoDocumentation.FRZ": "Formulário de documentação automática do sistema",
            "dbsystem.frz": "Definição da estrutura do banco de dados do sistema",
            "TemplatesFluxo.FRZ": "Templates pré-definidos para fluxos de automatização",
        }
        for af in other_frz:
            desc = frz_descriptions.get(af["file"], "—")
            lines.append(f"| `{af['file']}` | {af['size']/1024:.1f} KB | {desc} |")
        lines.append("")

    with open(os.path.join(OUTPUT_DIR, "08-api-versoes.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"  ✔ 08-api-versoes.md ({len(api_files)} versões)")


# ══════════════════════════════════════════════════════════════════
# MAIN
# ══════════════════════════════════════════════════════════════════

def main():
    print(f"═══ Gerador de Documentação dos Recursos da IDE ═══")
    print(f"  Origem:  {RESOURCES_DIR}")
    print(f"  Destino: {OUTPUT_DIR}\n")

    if not os.path.isdir(RESOURCES_DIR):
        print(f"ERRO: Pasta Resources/ não encontrada em {RESOURCES_DIR}")
        return

    ensure_dir(OUTPUT_DIR)

    generate_overview()
    generate_components_doc()
    generate_plugins_doc()
    generate_runner_doc()
    generate_templates_doc()
    generate_skins_doc()
    generate_dictionaries_doc()
    generate_configurations_doc()
    generate_api_versions_doc()

    # Count output files and size
    total_size = 0
    file_count = 0
    for f in os.listdir(OUTPUT_DIR):
        fp = os.path.join(OUTPUT_DIR, f)
        if os.path.isfile(fp):
            total_size += os.path.getsize(fp)
            file_count += 1

    print(f"\n═══ Concluído ═══")
    print(f"  {file_count} arquivos gerados ({total_size/1024:.1f} KB)")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
Gerador de documentação do banco de dados do Maker AI
a partir do arquivo spfa.xml (Entity Schema).
"""

import os
import xml.etree.ElementTree as ET
from collections import defaultdict

XML_PATH = "/Users/filipefalcao/Downloads/spfa.xml"
OUTPUT_DIR = "/Users/filipefalcao/Downloads/MakerAI/manual_scraped"


def parse_spfa(xml_path):
    """Parse the spfa.xml and extract all entities, attributes, keys, relationships."""
    tree = ET.parse(xml_path)
    root = tree.getroot()

    # Find the ENTITY_SCHEMA element
    schema = root.find(".//ENTITY_SCHEMA")
    if schema is None:
        print("ENTITY_SCHEMA não encontrado!")
        return [], {}

    entities = []
    entity_map = {}

    for entity_elem in schema.findall("ENTITY"):
        entity = {
            "name": entity_elem.get("NAME", ""),
            "friendly_name": entity_elem.get("FRIENDLY_NAME", ""),
            "form": entity_elem.get("FORM", ""),
            "attributes": [],
            "keys": [],
            "relationships": [],
        }

        # Parse attributes
        for attr_elem in entity_elem.findall("ATTRIBUTE"):
            attr = {
                "name": attr_elem.get("NAME", ""),
                "friendly_name": attr_elem.get("FRIENDLY_NAME", ""),
                "nullable": attr_elem.get("NULLABLE", "true") == "true",
                "type": attr_elem.get("TYPE", ""),
                "length": attr_elem.get("LENGTH", ""),
                "generated": attr_elem.get("GENERATED", "false") == "true",
                "default": "",
                "mask": "",
            }
            default_elem = attr_elem.find("DEFAULT")
            if default_elem is not None and default_elem.text:
                attr["default"] = default_elem.text.strip()
            mask_elem = attr_elem.find("MASK")
            if mask_elem is not None:
                attr["mask"] = mask_elem.get("NAME", "")
            entity["attributes"].append(attr)

        # Parse keys
        for key_elem in entity_elem.findall("KEY"):
            key = {
                "name": key_elem.get("NAME", ""),
                "unique": key_elem.get("UNIQUE", "false") == "true",
                "primary": key_elem.get("PRIMARY", "false") == "true",
                "columns": [],
            }
            for attr_name_elem in key_elem.findall("ATTRIBUTE_NAME"):
                key["columns"].append(attr_name_elem.get("NAME", ""))
            entity["keys"].append(key)

        # Parse relationships (foreign keys)
        for ref_elem in entity_elem.findall("REFERENCE_RELATIONSHIP"):
            ref = {
                "name": ref_elem.get("NAME", ""),
                "referenced_entity": "",
                "referencing_entity": "",
                "keys": [],
            }
            ref_entity = ref_elem.find("REFERENCED_ENTITY")
            if ref_entity is not None:
                ref["referenced_entity"] = ref_entity.get("NAME", "")
            referencing = ref_elem.find("REFERENCING_ENTITY")
            if referencing is not None:
                ref["referencing_entity"] = referencing.get("NAME", "")
            for ref_keys in ref_elem.findall("REFERENCE_KEYS"):
                fk_pair = {}
                referencing_attr = ref_keys.find("REFERENCING_ATTRIBUTE")
                referenced_attr = ref_keys.find("REFERENCED_ATTRIBUTE")
                if referencing_attr is not None:
                    fk_pair["from"] = referencing_attr.text.strip() if referencing_attr.text else ""
                if referenced_attr is not None:
                    fk_pair["to"] = referenced_attr.text.strip() if referenced_attr.text else ""
                ref["keys"].append(fk_pair)
            entity["relationships"].append(ref)

        entities.append(entity)
        entity_map[entity["name"]] = entity

    return entities, entity_map


def categorize_entities(entities):
    """Group entities by functional domain based on naming patterns."""
    categories = {
        "Núcleo do Sistema (Core)": {
            "desc": "Tabelas fundamentais que sustentam toda a estrutura do Maker AI, incluindo sistemas, formulários, componentes e configurações.",
            "prefixes": ["FR_SISTEMA", "FR_FORMULARIO", "FR_COMPONENTE", "FR_CONFIGURACAO", "FR_CAMPO", "FR_TABELA", "FR_DATABASE", "FR_CATEGORIA", "FR_CONTEXTO", "FR_DIAGRAMA", "FR_IMAGEM", "FR_TIPODADO"],
            "entities": [],
        },
        "Ações e Fluxos de Automação": {
            "desc": "Tabelas que gerenciam as ações, regras de negócio, fluxogramas e automações sem código (no-code).",
            "prefixes": ["FR_ACAO", "FR_ACP", "FR_REGRA", "FR_FLUXO", "FR_FUNCAO"],
            "entities": [],
        },
        "Compilador e Geração de Código": {
            "desc": "Tabelas do compilador interno que traduz os projetos visuais em código executável para diferentes bancos de dados.",
            "prefixes": ["FR_COMPILADOR"],
            "entities": [],
        },
        "Consultas e Manipulação de Dados (SQL)": {
            "desc": "Tabelas do assistente SQL e consultas avançadas que permitem manipulação de dados sem escrever código.",
            "prefixes": ["FR_CONSULTA", "FR_GRADE", "FR_DEP_FORMULARIO_CAMPO", "FR_DEP_FORMULARIO_TABELA", "FR_DEP_REGRA_CAMPO", "FR_DEP_REGRA_TABELA"],
            "entities": [],
        },
        "Dependências e Rastreabilidade": {
            "desc": "Tabelas de mapeamento de dependências entre formulários, regras, relatórios, tabelas e componentes — essenciais para refatoração e análise de impacto.",
            "prefixes": ["FR_DEP_"],
            "entities": [],
        },
        "Documentação e Casos de Uso": {
            "desc": "Tabelas que armazenam a documentação de projeto, casos de uso, atores, diagramas de contexto, requisitos e benefícios.",
            "prefixes": ["FR_DOC_"],
            "entities": [],
        },
        "Relatórios": {
            "desc": "Tabelas que definem relatórios, seus parâmetros, fontes de dados e configurações de impressão.",
            "prefixes": ["FR_RELATORIO", "FR_REL_"],
            "entities": [],
        },
        "Segurança e Permissões": {
            "desc": "Tabelas de controle de acesso, grupos, permissões de formulários, relatórios e funções.",
            "prefixes": ["FR_GRUPO", "FR_PERMISSAO", "FR_PERM", "FR_USUARIO"],
            "entities": [],
        },
        "Menus e Navegação": {
            "desc": "Tabelas que definem a estrutura de menus e navegação das aplicações publicadas.",
            "prefixes": ["FR_MENU", "FR_ITEM"],
            "entities": [],
        },
        "Publicação e Deploy (WebRun)": {
            "desc": "Tabelas relacionadas à publicação, geração de WAR/JAR e configurações do WebRun.",
            "prefixes": ["FR_PUBLICACAO", "FR_WEBRUN", "FR_SERVIDOR"],
            "entities": [],
        },
        "Internacionalização e Localização": {
            "desc": "Tabelas para suporte multi-idioma e localização de aplicações.",
            "prefixes": ["FR_IDIOMA", "FR_TRADUCAO", "FR_I18N"],
            "entities": [],
        },
        "Versionamento e Histórico": {
            "desc": "Tabelas de controle de versões de formulários, regras e relatórios.",
            "prefixes": ["FR_VERSAO", "FR_HISTORICO", "FR_LOG"],
            "entities": [],
        },
    }

    categorized = set()

    for entity in entities:
        name = entity["name"]
        placed = False
        for cat_name, cat_info in categories.items():
            for prefix in cat_info["prefixes"]:
                if name == prefix or name.startswith(prefix):
                    cat_info["entities"].append(entity)
                    categorized.add(name)
                    placed = True
                    break
            if placed:
                break

    # Collect uncategorized
    uncategorized = [e for e in entities if e["name"] not in categorized]
    if uncategorized:
        categories["Outras Tabelas do Sistema"] = {
            "desc": "Tabelas adicionais que complementam a estrutura do Maker AI.",
            "prefixes": [],
            "entities": uncategorized,
        }

    # Remove empty categories
    return {k: v for k, v in categories.items() if v["entities"]}


def type_display(attr):
    """Format type display string."""
    t = attr["type"]
    l = attr["length"]
    if t == "string" and l and l != "0":
        return f"VARCHAR({l})"
    elif t == "string" and (l == "0" or not l):
        return "TEXT (CLOB)"
    elif t == "integer":
        return f"INTEGER"
    elif t == "datetime":
        return "DATETIME"
    elif t == "base64":
        return "BLOB (Base64)"
    elif t == "float":
        return "FLOAT"
    elif t == "boolean":
        return "BOOLEAN"
    else:
        return t.upper() if t else "—"


def generate_entity_section(entity):
    """Generate markdown section for a single entity."""
    lines = []
    name = entity["name"]

    lines.append(f"### {name}\n")
    if entity["form"]:
        lines.append(f"**Formulário associado:** `{entity['form']}`\n")

    # Attributes table
    lines.append("#### Colunas\n")
    lines.append("| Coluna | Tipo | Obrigatório | Valor Padrão |")
    lines.append("|--------|------|:-----------:|:------------:|")

    pk_columns = set()
    for key in entity["keys"]:
        if key["primary"]:
            pk_columns.update(key["columns"])

    for attr in entity["attributes"]:
        col_name = attr["name"]
        is_pk = col_name in pk_columns
        pk_badge = " 🔑" if is_pk else ""
        nullable = "Não" if not attr["nullable"] else "Sim"
        default_val = f"`{attr['default']}`" if attr["default"] else "—"
        type_str = type_display(attr)

        lines.append(f"| `{col_name}`{pk_badge} | {type_str} | {nullable} | {default_val} |")

    # Primary Key
    for key in entity["keys"]:
        if key["primary"]:
            pk_cols = ", ".join([f"`{c}`" for c in key["columns"]])
            lines.append(f"\n**Chave Primária:** {pk_cols}")
            if key["name"]:
                lines.append(f"  - Constraint: `{key['name']}`")

    # Unique Keys
    for key in entity["keys"]:
        if key["unique"] and not key["primary"]:
            uk_cols = ", ".join([f"`{c}`" for c in key["columns"]])
            lines.append(f"\n**Chave Única:** {uk_cols}")
            if key["name"]:
                lines.append(f"  - Constraint: `{key['name']}`")

    # Foreign Keys
    if entity["relationships"]:
        lines.append("\n#### Relacionamentos (Foreign Keys)\n")
        for ref in entity["relationships"]:
            ref_entity = ref["referenced_entity"]
            fk_name = ref["name"]
            fk_pairs = []
            for pair in ref["keys"]:
                from_col = pair.get("from", "?")
                to_col = pair.get("to", "?")
                fk_pairs.append(f"`{from_col}` → `{ref_entity}.{to_col}`")
            pairs_str = ", ".join(fk_pairs)
            lines.append(f"- **{fk_name}**: {pairs_str}")
            lines.append(f"  - Referencia: `{ref_entity}`")

    lines.append("")
    return "\n".join(lines)


def build_relationship_graph(entities):
    """Build a graph of relationships for diagram generation."""
    # referenced_by[entity_name] = list of entities that reference it
    referenced_by = defaultdict(list)
    references = defaultdict(list)

    for entity in entities:
        for ref in entity["relationships"]:
            referenced_by[ref["referenced_entity"]].append(entity["name"])
            references[entity["name"]].append(ref["referenced_entity"])

    return referenced_by, references


def generate_overview_doc(entities, entity_map, categories, referenced_by, references):
    """Generate the main overview document."""
    lines = []
    lines.append("# Estrutura do Banco de Dados — Maker AI\n")
    lines.append("> Documentação gerada automaticamente a partir do arquivo de projeto `spfa.xml` (Maker AI v6.1.0.14)\n")
    lines.append("## Visão Geral\n")
    lines.append(f"O banco de dados do Maker AI é composto por **{len(entities)} tabelas** (entidades) que formam o \"código-fonte\" da plataforma. ")
    lines.append("Todas as tabelas utilizam o prefixo `FR_` (Framework) e são organizadas em domínios funcionais que refletem os pilares da plataforma:\n")
    lines.append("- **Formulários e Componentes** — a camada visual (UI)")
    lines.append("- **Ações e Regras** — a lógica de negócio (automações)")
    lines.append("- **Consultas SQL** — a camada de dados")
    lines.append("- **Relatórios** — geração de informações")
    lines.append("- **Segurança** — controle de acesso")
    lines.append("- **Deploy** — publicação e distribuição")
    lines.append("- **Documentação** — rastreabilidade de requisitos\n")

    # Statistics
    total_attrs = sum(len(e["attributes"]) for e in entities)
    total_fks = sum(len(e["relationships"]) for e in entities)
    total_pks = sum(1 for e in entities for k in e["keys"] if k["primary"])

    lines.append("### Estatísticas\n")
    lines.append("| Métrica | Valor |")
    lines.append("|---------|-------|")
    lines.append(f"| Total de Tabelas | {len(entities)} |")
    lines.append(f"| Total de Colunas | {total_attrs} |")
    lines.append(f"| Total de Chaves Primárias | {total_pks} |")
    lines.append(f"| Total de Foreign Keys | {total_fks} |")
    lines.append(f"| Domínios Funcionais | {len(categories)} |")
    lines.append("")

    # Category summary
    lines.append("### Domínios Funcionais\n")
    lines.append("| Domínio | Tabelas | Descrição |")
    lines.append("|---------|:-------:|-----------|")
    for cat_name, cat_info in categories.items():
        count = len(cat_info["entities"])
        desc_short = cat_info["desc"][:100] + "..." if len(cat_info["desc"]) > 100 else cat_info["desc"]
        lines.append(f"| **{cat_name}** | {count} | {desc_short} |")
    lines.append("")

    # List all tables
    lines.append("### Lista Completa de Tabelas\n")
    lines.append("| # | Tabela | Colunas | FKs | Referenciada por |")
    lines.append("|---|--------|:-------:|:---:|:----------------:|")
    for i, entity in enumerate(sorted(entities, key=lambda e: e["name"]), 1):
        name = entity["name"]
        num_attrs = len(entity["attributes"])
        num_fks = len(entity["relationships"])
        num_refs = len(referenced_by.get(name, []))
        lines.append(f"| {i} | `{name}` | {num_attrs} | {num_fks} | {num_refs} |")
    lines.append("")

    # Most referenced tables (central entities)
    lines.append("### Tabelas Mais Referenciadas (Entidades Centrais)\n")
    lines.append("Estas são as tabelas mais importantes do sistema — referenciadas por muitas outras:\n")
    sorted_refs = sorted(referenced_by.items(), key=lambda x: len(x[1]), reverse=True)[:15]
    lines.append("| Tabela | Referenciada por (qtd) | Dependentes |")
    lines.append("|--------|:---------------------:|-------------|")
    for name, refs in sorted_refs:
        refs_unique = sorted(set(refs))
        refs_list = ", ".join([f"`{r}`" for r in refs_unique[:5]])
        if len(refs_unique) > 5:
            refs_list += f" +{len(refs_unique)-5} mais"
        lines.append(f"| `{name}` | {len(refs_unique)} | {refs_list} |")
    lines.append("")

    return "\n".join(lines)


def generate_category_doc(cat_name, cat_info, entity_map, referenced_by):
    """Generate documentation for a functional category."""
    lines = []
    lines.append(f"# {cat_name}\n")
    lines.append(f"> {cat_info['desc']}\n")
    lines.append(f"**Total de tabelas neste domínio:** {len(cat_info['entities'])}\n")

    # Table of contents
    lines.append("## Tabelas\n")
    for entity in sorted(cat_info["entities"], key=lambda e: e["name"]):
        name = entity["name"]
        num_attrs = len(entity["attributes"])
        lines.append(f"- [`{name}`](#{name.lower().replace('_', '_')}) — {num_attrs} colunas")
    lines.append("")

    # Relationship summary for this category
    lines.append("## Diagrama de Relacionamentos\n")
    lines.append("```")
    cat_entity_names = {e["name"] for e in cat_info["entities"]}
    for entity in sorted(cat_info["entities"], key=lambda e: e["name"]):
        for ref in entity["relationships"]:
            lines.append(f"  {entity['name']} --> {ref['referenced_entity']}")
    lines.append("```\n")

    # Detailed entity sections
    lines.append("## Detalhamento das Tabelas\n")
    for entity in sorted(cat_info["entities"], key=lambda e: e["name"]):
        lines.append(generate_entity_section(entity))
        # Show who references this entity
        refs = referenced_by.get(entity["name"], [])
        if refs:
            unique_refs = sorted(set(refs))
            lines.append(f"**Referenciada por:** {', '.join([f'`{r}`' for r in unique_refs])}\n")
        lines.append("---\n")

    return "\n".join(lines)


def main():
    print("=" * 60)
    print("  Gerador de Documentação do Banco de Dados — Maker AI")
    print("=" * 60)

    # Parse
    print("\n[1/3] Parseando spfa.xml...")
    entities, entity_map = parse_spfa(XML_PATH)
    print(f"   {len(entities)} entidades encontradas.")

    # Categorize
    print("[2/3] Categorizando entidades...")
    categories = categorize_entities(entities)
    referenced_by, references = build_relationship_graph(entities)

    # Generate docs
    print("[3/3] Gerando documentação...")

    db_docs_dir = os.path.join(OUTPUT_DIR, "estrutura-banco-de-dados")
    os.makedirs(db_docs_dir, exist_ok=True)

    # 1. Overview document
    overview = generate_overview_doc(entities, entity_map, categories, referenced_by, references)
    overview_path = os.path.join(db_docs_dir, "visao-geral.md")
    with open(overview_path, "w", encoding="utf-8") as f:
        f.write(overview)
    print(f"   ✅ {overview_path}")

    # 2. Category documents
    for cat_name, cat_info in categories.items():
        cat_doc = generate_category_doc(cat_name, cat_info, entity_map, referenced_by)
        safe_name = cat_name.lower()
        safe_name = safe_name.replace(" ", "-").replace("(", "").replace(")", "")
        safe_name = safe_name.replace("/", "-").replace("ã", "a").replace("ç", "c")
        safe_name = safe_name.replace("ó", "o").replace("á", "a").replace("í", "i")
        safe_name = safe_name.replace("ê", "e").replace("ú", "u")
        cat_path = os.path.join(db_docs_dir, f"{safe_name}.md")
        with open(cat_path, "w", encoding="utf-8") as f:
            f.write(cat_doc)
        print(f"   ✅ {cat_path}")

    # 3. Index/README for the database structure section
    index_lines = []
    index_lines.append("# Estrutura do Banco de Dados do Maker AI\n")
    index_lines.append("> O código-fonte do Maker AI é o banco de dados. Todo projeto, formulário, regra, relatório e configuração é armazenado em tabelas com prefixo `FR_`.\n")
    index_lines.append("## Como o Maker AI Funciona Internamente\n")
    index_lines.append("O Maker AI é uma plataforma **low-code/no-code** onde **o banco de dados É o código-fonte**. ")
    index_lines.append("Diferente de sistemas tradicionais onde o código é armazenado em arquivos de texto, no Maker AI:\n")
    index_lines.append("1. **Formulários** são definições armazenadas na tabela `FR_FORMULARIO` e seus componentes visuais em `FR_COMPONENTE`")
    index_lines.append("2. **Regras de negócio** são registros em `FR_REGRA` com seus passos em `FR_REGRA_FUNCAO`")
    index_lines.append("3. **Fluxogramas** são grafos armazenados em `FR_FLUXOGRAMA` com objetos em `FR_FLUXO_OBJETO`")
    index_lines.append("4. **Relatórios** são definições em `FR_RELATORIO` com suas fontes de dados")
    index_lines.append("5. **Menus** e navegação ficam em `FR_MENU` e `FR_ITEM_MENU`")
    index_lines.append("6. **Permissões** são controladas por `FR_GRUPO` e tabelas de permissão associadas")
    index_lines.append("7. **Deploy/Publicação** envolve o compilador (`FR_COMPILADOR`) que gera código a partir dessas definições\n")
    index_lines.append("Isso significa que **exportar um projeto** (spfa.xml) é essencialmente exportar todo o banco de dados do framework.\n")
    index_lines.append("## Arquitetura do Schema\n")
    index_lines.append("```")
    index_lines.append("┌─────────────────────────────────────────────────────────────┐")
    index_lines.append("│                     MAKER AI - SCHEMA FR_                   │")
    index_lines.append("├─────────────┬───────────────┬───────────────┬───────────────┤")
    index_lines.append("│  SISTEMA    │  FORMULÁRIOS  │  FLUXOGRAMAS  │  RELATÓRIOS   │")
    index_lines.append("│ FR_SISTEMA  │ FR_FORMULARIO │ FR_FLUXOGRAMA │ FR_RELATORIO  │")
    index_lines.append("├─────────────┼───────────────┼───────────────┼───────────────┤")
    index_lines.append("│ COMPONENTES │  AÇÕES/REGRAS │  CONSULTAS    │  DOCUMENTAÇÃO │")
    index_lines.append("│ FR_COMPONENTE│ FR_REGRA     │ FR_CONSULTA_  │ FR_DOC_       │")
    index_lines.append("│ FR_CAMPO    │ FR_ACAO       │   AVANCADA    │   PRINCIPAL   │")
    index_lines.append("├─────────────┼───────────────┼───────────────┼───────────────┤")
    index_lines.append("│ SEGURANÇA   │  COMPILADOR   │  MENUS        │  DIAGRAMAS    │")
    index_lines.append("│ FR_GRUPO    │ FR_COMPILADOR │ FR_MENU       │ FR_DIAGRAMA   │")
    index_lines.append("│ FR_PERMISSAO│ FR_COMPILADOR_│ FR_ITEM_MENU  │               │")
    index_lines.append("│             │   DATABASE    │               │               │")
    index_lines.append("├─────────────┴───────────────┴───────────────┴───────────────┤")
    index_lines.append("│                   DEPENDÊNCIAS E RASTREABILIDADE            │")
    index_lines.append("│    FR_DEP_FORMULARIO_*  │  FR_DEP_REGRA_*  │  FR_CONTEXTO  │")
    index_lines.append("└─────────────────────────────────────────────────────────────┘")
    index_lines.append("```\n")
    index_lines.append(f"**Total:** {len(entities)} tabelas | Versão Maker: 6.1.0.14\n")
    index_lines.append("## Documentação por Domínio\n")
    index_lines.append("- [**Visão Geral Completa**](visao-geral.md) — Estatísticas, lista de todas as tabelas e entidades centrais\n")
    for cat_name in categories:
        safe_name = cat_name.lower().replace(" ", "-").replace("(", "").replace(")", "")
        safe_name = safe_name.replace("/", "-").replace("ã", "a").replace("ç", "c")
        safe_name = safe_name.replace("ó", "o").replace("á", "a").replace("í", "i")
        safe_name = safe_name.replace("ê", "e").replace("ú", "u")
        count = len(categories[cat_name]["entities"])
        index_lines.append(f"- [**{cat_name}**]({safe_name}.md) — {count} tabelas")
    index_lines.append("")

    index_path = os.path.join(db_docs_dir, "README.md")
    with open(index_path, "w", encoding="utf-8") as f:
        f.write("\n".join(index_lines))
    print(f"   ✅ {index_path}")

    # Summary
    print("\n" + "=" * 60)
    print(f"  ✅ Documentação gerada com sucesso!")
    print(f"  Diretório: {db_docs_dir}")
    print(f"  Entidades documentadas: {len(entities)}")
    print(f"  Domínios funcionais: {len(categories)}")
    total_files = 2 + len(categories)  # overview + index + categories
    print(f"  Arquivos criados: {total_files}")
    print("=" * 60)


if __name__ == "__main__":
    main()

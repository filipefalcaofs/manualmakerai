#!/usr/bin/env python3
"""
Diagnostica e corrige o posicionamento dos componentes do Cadastro de Edital (form 2000).

Conecta ao banco MariaDB, lê os componentes atuais e aplica UPDATEs para:
- PosicaoX / PosicaoY (posições únicas e corretas)
- NomeClasseCss (Bootstrap col-md-N)
- Container (aninhamento correto dentro dos cards)
- Ordem (sequência visual correta)

Uso:
  python fix_edital_posicionamento.py          # modo dry-run (mostra o que faria)
  python fix_edital_posicionamento.py --apply  # aplica no banco
"""
import sys
import pymysql

DB_CONFIG = {
    "host": "98.88.161.212",
    "port": 3306,
    "user": "root",
    "password": "sudoeste@123",
    "database": "fmt",
    "charset": "utf8mb4",
}

FRM_CODIGO = 2000
FORM_WIDTH = 1100
CARD_WIDTH = 1060
CARD_MARGIN_LEFT = 16
CARD_HEADER_HEIGHT = 40
FIELD_HEIGHT = 33
LINE_GAP = 50
CARD_GAP = 10

# ============================================================================
# Spec das 7 abas conforme PROMPT_MAKER_SGFC.md secao 5
# ============================================================================
# Cada aba define seus cards. Cada card define seus campos com:
#   (campo_banco, tipo_componente, col_md, label_ou_desc)
# tipo_componente: E=Edit, C=Combo, H=Check, M=Memo, G=Grid, K=Lookup, L=Label, B=Button, P=Container

ABA_SPEC = {
    "01-Dados Gerais": {
        "cards": [
            {
                "titulo": "Identificacao do Edital",
                "icone": "fa-file-alt",
                "campos": [
                    ("TITULO", "E", 8, "Titulo"),
                    ("NUMERO", "E", 4, "Numero"),
                    ("ANO_REFERENCIA", "E", 3, "Ano Referencia"),
                    ("TIPO_FOMENTO", "C", 3, "Tipo de Fomento"),
                    ("DT_ABERTURA", "E", 3, "Data Abertura"),
                    ("DT_ENCERRAMENTO", "E", 3, "Data Encerramento"),
                    ("VALOR_TOTAL", "E", 4, "Valor Total"),
                    ("PRAZO_INSCRICAO_INICIO", "E", 4, "Prazo Inscricao Inicio"),
                    ("PRAZO_INSCRICAO_FIM", "E", 4, "Prazo Inscricao Fim"),
                    ("LIMITE_PROJETOS_POR_PRODUTOR", "E", 3, "Limite Projetos"),
                    ("DT_LIBERACAO_PARECER", "E", 3, "Data Liberacao Parecer"),
                    ("PERIODO_RECURSOS", "E", 2, "Periodo Recursos"),
                    ("PERIODO_CONTRARRAZOES", "E", 2, "Periodo Contrarrazoes"),
                    ("PERIODO_PRORROGACAO_PROJETO", "E", 2, "Periodo Prorrogacao"),
                    ("PRORROGAVEL", "H", 2, "Prorrogavel"),
                    ("HABILITAR_ORCAMENTO", "H", 2, "Habilitar Orcamento"),
                    ("STATUS", "C", 3, "Status"),
                    ("ENCERRAMENTO_AUTOMATICO", "C", 3, "Encerramento Automatico"),
                    ("TEXTO_INFORMATIVO", "M", 12, "Texto Informativo"),
                ],
            },
            {
                "titulo": "Publicacao no Diario Oficial",
                "icone": "fa-newspaper",
                "campos": [
                    ("NUMERO_DO", "E", 4, "Numero DO"),
                    ("DT_PUBLICACAO_DO", "E", 4, "Data Publicacao DO"),
                ],
            },
        ],
        "botoes_wizard": [
            ("btnSalvarRascunho1", "Salvar Rascunho", "btn-warning"),
            ("btnProximo1", "Proximo >", "btn-primary"),
        ],
    },
    "02-Elegibilidade": {
        "cards": [
            {
                "titulo": "Tipologia de Agentes",
                "icone": "fa-user-tag",
                "campos": [
                    ("TIPOLOGIA_AGENTE", "M", 12, "Tipologia do Agente"),
                ],
            },
            {
                "titulo": "Criterios de Elegibilidade",
                "icone": "fa-clipboard-check",
                "campos": [
                    ("CRITERIOS_ELEGIBILIDADE", "M", 12, "Criterios de Elegibilidade"),
                ],
            },
        ],
        "botoes_wizard": [
            ("btnAnterior2", "< Anterior", "btn-secondary"),
            ("btnSalvarRascunho2", "Salvar Rascunho", "btn-warning"),
            ("btnProximo2", "Proximo >", "btn-primary"),
        ],
    },
    "03-Categorias": {
        "cards": [
            {
                "titulo": "Categorias do Edital",
                "icone": "fa-th-list",
                "campos": [],
                "grid": "EDITAL_CATEGORIA",
            },
        ],
        "botoes_wizard": [
            ("btnAnterior3", "< Anterior", "btn-secondary"),
            ("btnSalvarRascunho3", "Salvar Rascunho", "btn-warning"),
            ("btnProximo3", "Proximo >", "btn-primary"),
        ],
    },
    "04-Formulario e Documentos": {
        "cards": [
            {
                "titulo": "Documentacao Exigida",
                "icone": "fa-folder-open",
                "campos": [],
                "grid": "EDITAL_DOCUMENTO",
            },
            {
                "titulo": "Formulario de Inscricao",
                "icone": "fa-link",
                "campos": [
                    ("ID_FORMULARIO_INSCRICAO", "K", 6, "Formulario de Inscricao"),
                ],
            },
        ],
        "botoes_wizard": [
            ("btnAnterior4", "< Anterior", "btn-secondary"),
            ("btnSalvarRascunho4", "Salvar Rascunho", "btn-warning"),
            ("btnProximo4", "Proximo >", "btn-primary"),
        ],
    },
    "05-Avaliacao": {
        "cards": [
            {
                "titulo": "Criterios de Avaliacao",
                "icone": "fa-balance-scale",
                "campos": [],
                "grid": "EDITAL_CRITERIO_AVALIACAO",
            },
        ],
        "botoes_wizard": [
            ("btnAnterior5", "< Anterior", "btn-secondary"),
            ("btnSalvarRascunho5", "Salvar Rascunho", "btn-warning"),
            ("btnProximo5", "Proximo >", "btn-primary"),
        ],
    },
    "06-Regras de Fomento": {
        "cards": [
            {
                "titulo": "Fomento Direto",
                "icone": "fa-hand-holding-usd",
                "campos": [
                    ("QTD_MAX_PROJETOS", "E", 4, "Qtd Max Projetos"),
                    ("VALOR_MAX_PROJETO", "E", 4, "Valor Max Projeto"),
                    ("PRAZO_EXECUCAO", "E", 4, "Prazo Execucao"),
                    ("COMISSAO_AVALIADORA", "H", 3, "Comissao Avaliadora"),
                    ("FASE_RECURSOS", "H", 3, "Fase Recursos"),
                    ("PRESTACAO_CONTAS", "H", 3, "Prestacao de Contas"),
                    ("TERRITORIALIZACAO", "M", 12, "Territorializacao"),
                ],
            },
            {
                "titulo": "Fomento Indireto",
                "icone": "fa-university",
                "campos": [
                    ("SUBTIPO_INDIRETO", "C", 4, "Subtipo Indireto"),
                    ("LIMITE_RENUNCIA_FISCAL", "E", 4, "Limite Renuncia Fiscal"),
                    ("VALOR_MAX_CONTRIBUINTE", "E", 4, "Valor Max Contribuinte"),
                    ("VALOR_GRUPO_ECONOMICO", "E", 4, "Valor Grupo Economico"),
                    ("ANO_EXERCICIO_ISS", "E", 3, "Ano Exercicio ISS"),
                    ("TIPO_EDITAL_ISS", "C", 5, "Tipo Edital ISS"),
                    ("PCT_MAX_ISS_CONTRIBUINTE", "E", 3, "Pct Max ISS"),
                ],
            },
        ],
        "botoes_wizard": [
            ("btnAnterior6", "< Anterior", "btn-secondary"),
            ("btnSalvarRascunho6", "Salvar Rascunho", "btn-warning"),
            ("btnProximo6", "Proximo >", "btn-primary"),
        ],
    },
    "07-Orcamento": {
        "cards": [
            {
                "titulo": "Configuracoes de Orcamento",
                "icone": "fa-sliders-h",
                "campos": [
                    ("CALCULAR_IMPOSTO_RETIDO", "H", 4, "Calcular Imposto Retido"),
                    ("PERMITIR_SUGESTAO_ITENS", "H", 4, "Permitir Sugestao Itens"),
                ],
            },
            {
                "titulo": "Grupos de Despesa do Edital",
                "icone": "fa-money-bill-wave",
                "campos": [],
                "grid": "EDITAL_GRUPO_DESPESA",
            },
        ],
        "botoes_wizard": [
            ("btnAnterior7", "< Anterior", "btn-secondary"),
            ("btnSalvarRascunho7", "Salvar Rascunho", "btn-warning"),
            ("btnConcluir", "Concluir Edital", "btn-success"),
        ],
    },
}


def get_connection():
    return pymysql.connect(**DB_CONFIG)


def diagnose(conn):
    """Lê o estado atual dos componentes e retorna diagnóstico."""
    cur = conn.cursor()

    cur.execute(
        "SELECT FRM_DESCRICAO, FRM_GUID, FRM_TAMANHO, FRM_ALTURA "
        "FROM FR_FORMULARIO WHERE FRM_CODIGO = %s",
        (FRM_CODIGO,),
    )
    form = cur.fetchone()
    if not form:
        print(f"ERRO: Formulario {FRM_CODIGO} nao encontrado!")
        return None

    print(f"=== Formulario {FRM_CODIGO}: {form[0]} ===")
    print(f"  GUID: {form[1]}")
    print(f"  Dimensoes: {form[2]}x{form[3]}")

    cur.execute(
        "SELECT c.COM_CODIGO, c.COM_TIPO, c.COM_DESCRICAO, c.COM_ABA "
        "FROM FR_COMPONENTE c WHERE c.FRM_CODIGO = %s "
        "ORDER BY c.COM_CODIGO",
        (FRM_CODIGO,),
    )
    componentes = cur.fetchall()
    print(f"\n  Total componentes: {len(componentes)}")

    comp_map = {}
    for com_codigo, com_tipo, com_desc, com_aba in componentes:
        cur.execute(
            "SELECT PRO_NOME, PRO_VALOR "
            "FROM FR_PROPRIEDADE WHERE FRM_CODIGO = %s AND COM_CODIGO = %s",
            (FRM_CODIGO, com_codigo),
        )
        props = {}
        for pn, pv in cur.fetchall():
            props[pn] = str(pv) if pv is not None else ""

        comp_map[com_codigo] = {
            "tipo": com_tipo,
            "desc": com_desc,
            "aba": com_aba,
            "props": props,
        }

    issues = {"empilhados": 0, "sem_css": 0, "sem_container": 0, "sem_aba": 0}
    positions_seen = {}

    for com_codigo, info in comp_map.items():
        if info["tipo"] == "F":
            continue
        px = info["props"].get("PosicaoX", "0")
        py = info["props"].get("PosicaoY", "0")
        key = f"{info['props'].get('Aba', '')}:{px}:{py}"
        if key in positions_seen:
            issues["empilhados"] += 1
        positions_seen[key] = com_codigo

        if not info["props"].get("NomeClasseCss"):
            if info["tipo"] in ("E", "C", "H", "M", "K"):
                issues["sem_css"] += 1

        if not info["props"].get("Container") and info["tipo"] in ("E", "C", "H", "M", "K"):
            issues["sem_container"] += 1

        if not info["props"].get("Aba") and info["tipo"] != "F":
            issues["sem_aba"] += 1

    print(f"\n  Problemas encontrados:")
    print(f"    Componentes empilhados: {issues['empilhados']}")
    print(f"    Sem NomeClasseCss: {issues['sem_css']}")
    print(f"    Sem Container: {issues['sem_container']}")
    print(f"    Sem Aba: {issues['sem_aba']}")

    return comp_map


def find_component_by_field(comp_map, campo, tipo=None):
    """Encontra componente pelo nome do campo vinculado."""
    for com_codigo, info in comp_map.items():
        field = info["props"].get("Campo", "")
        if field.upper() == campo.upper():
            if tipo is None or info["tipo"] == tipo:
                return com_codigo
    return None


def find_component_by_nome(comp_map, nome):
    """Encontra componente pelo Nome (property)."""
    for com_codigo, info in comp_map.items():
        if info["props"].get("Nome", "") == nome:
            return com_codigo
    return None


def find_component_by_tipo(comp_map, tipo, aba=None):
    """Encontra todos os componentes de um tipo (filtrando por aba opcionalmente)."""
    results = []
    for com_codigo, info in comp_map.items():
        if info["tipo"] == tipo:
            if aba is None or info["props"].get("Aba", "") == aba:
                results.append(com_codigo)
    return results


def find_containers_in_aba(comp_map, aba):
    """Encontra containers (P) na aba, em ordem de COM_CODIGO."""
    results = []
    for com_codigo, info in sorted(comp_map.items()):
        if info["tipo"] == "P" and info["props"].get("Aba", "") == aba:
            results.append(com_codigo)
    return results


def find_labels_in_aba(comp_map, aba):
    """Encontra labels (L) na aba, em ordem de COM_CODIGO."""
    results = []
    for com_codigo, info in sorted(comp_map.items()):
        if info["tipo"] == "L" and info["props"].get("Aba", "") == aba:
            results.append(com_codigo)
    return results


def find_buttons_in_aba(comp_map, aba):
    """Encontra botoes (B) na aba."""
    results = []
    for com_codigo, info in sorted(comp_map.items()):
        if info["tipo"] == "B" and info["props"].get("Aba", "") == aba:
            results.append(com_codigo)
    return results


def find_grids_in_aba(comp_map, aba):
    """Encontra grids (G) na aba."""
    results = []
    for com_codigo, info in sorted(comp_map.items()):
        if info["tipo"] == "G" and info["props"].get("Aba", "") == aba:
            results.append(com_codigo)
    return results


def generate_updates(comp_map):
    """Gera as instrucoes UPDATE com base no spec e componentes existentes."""
    updates = []

    def add_update(com_codigo, prop_name, value):
        updates.append({
            "com_codigo": com_codigo,
            "prop": prop_name,
            "valor": value,
        })

    def layout_fields_in_card(campos_spec, comp_map, card_container_nome, aba, start_y):
        """Calcula layout dos campos dentro de um card.
        Retorna Y final."""
        y = start_y
        row_x = CARD_MARGIN_LEFT
        row_remaining = 12

        for campo, tipo_comp, col_md, label in campos_spec:
            com_codigo = find_component_by_field(comp_map, campo, tipo_comp)
            if com_codigo is None:
                com_codigo = find_component_by_field(comp_map, campo)
            if com_codigo is None:
                print(f"    AVISO: campo '{campo}' ({tipo_comp}) nao encontrado no form!")
                continue

            if row_remaining < col_md:
                y += LINE_GAP
                row_x = CARD_MARGIN_LEFT
                row_remaining = 12

            add_update(com_codigo, "PosicaoX", str(row_x))
            add_update(com_codigo, "PosicaoY", str(y))
            add_update(com_codigo, "Container", card_container_nome)
            add_update(com_codigo, "Aba", aba)
            add_update(com_codigo, "NomeClasseCss", f"form-group col-md-{col_md}")

            col_width = int(CARD_WIDTH * col_md / 12)
            add_update(com_codigo, "Tamanho", str(col_width))

            if tipo_comp == "M":
                add_update(com_codigo, "Altura", "100")
            else:
                add_update(com_codigo, "Altura", str(FIELD_HEIGHT))

            row_x += col_width + 14
            row_remaining -= col_md

        if row_remaining < 12:
            y += LINE_GAP

        return y

    ordem_global = 1

    for aba_nome, aba_spec in ABA_SPEC.items():
        print(f"\n  Processando aba: {aba_nome}")

        containers = find_containers_in_aba(comp_map, aba_nome)
        labels = find_labels_in_aba(comp_map, aba_nome)
        buttons = find_buttons_in_aba(comp_map, aba_nome)
        grids = find_grids_in_aba(comp_map, aba_nome)

        print(f"    Containers: {len(containers)}, Labels: {len(labels)}, "
              f"Buttons: {len(buttons)}, Grids: {len(grids)}")

        y_current = 10

        title_label = None
        for lbl_cod in labels:
            desc = comp_map[lbl_cod]["props"].get("Descricao", "")
            if "header-title-premium" in desc:
                title_label = lbl_cod
                break
        if title_label is None and labels:
            for lbl_cod in labels:
                cont = comp_map[lbl_cod]["props"].get("Container", "")
                if not cont:
                    title_label = lbl_cod
                    break

        if title_label:
            add_update(title_label, "PosicaoX", "16")
            add_update(title_label, "PosicaoY", str(y_current))
            add_update(title_label, "Tamanho", str(CARD_WIDTH))
            add_update(title_label, "Altura", "60")
            add_update(title_label, "Container", "")
            add_update(title_label, "Aba", aba_nome)
            add_update(title_label, "NomeClasseCss", "form-group fw-bold text-dark mb-3")
            add_update(title_label, "Ordem", str(ordem_global))
            ordem_global += 1
            y_current = 80

        card_containers_used = set()
        header_containers_used = set()
        header_labels_used = set()
        if title_label:
            header_labels_used.add(title_label)

        cards_spec = aba_spec.get("cards", [])

        container_pairs = []
        remaining_containers = [c for c in containers]

        for c_idx, card_spec in enumerate(cards_spec):
            card_cont = None
            header_cont = None
            header_label = None

            for rc in remaining_containers:
                css = comp_map[rc]["props"].get("NomeClasseCss", "")
                parent = comp_map[rc]["props"].get("Container", "")
                if "card" in css and "card-header" not in css and not parent:
                    card_cont = rc
                    break
                if "card" in css and "card-header" not in css:
                    card_cont = rc
                    break

            if card_cont is None:
                for rc in remaining_containers:
                    if rc not in card_containers_used and rc not in header_containers_used:
                        css = comp_map[rc]["props"].get("NomeClasseCss", "")
                        if "card-header" not in css:
                            card_cont = rc
                            break

            if card_cont:
                remaining_containers = [c for c in remaining_containers if c != card_cont]
                card_containers_used.add(card_cont)
                card_nome = comp_map[card_cont]["props"].get("Nome", f"MakerContainer{card_cont}")

                for rc in remaining_containers:
                    parent = comp_map[rc]["props"].get("Container", "")
                    css = comp_map[rc]["props"].get("NomeClasseCss", "")
                    if parent == card_nome or "card-header" in css:
                        header_cont = rc
                        break

                if header_cont is None:
                    for rc in remaining_containers:
                        if rc not in card_containers_used and rc not in header_containers_used:
                            header_cont = rc
                            break

                if header_cont:
                    remaining_containers = [c for c in remaining_containers if c != header_cont]
                    header_containers_used.add(header_cont)

                for lbl_cod in labels:
                    if lbl_cod in header_labels_used:
                        continue
                    desc = comp_map[lbl_cod]["props"].get("Descricao", "")
                    cont = comp_map[lbl_cod]["props"].get("Container", "")
                    if "card-heading-premium" in desc:
                        header_label = lbl_cod
                        break

                if header_label is None:
                    for lbl_cod in labels:
                        if lbl_cod in header_labels_used:
                            continue
                        if lbl_cod != title_label:
                            header_label = lbl_cod
                            break

                if header_label:
                    header_labels_used.add(header_label)

                container_pairs.append({
                    "card": card_cont,
                    "header": header_cont,
                    "header_label": header_label,
                    "spec": card_spec,
                })

        grid_idx = 0
        for pair in container_pairs:
            card_cont = pair["card"]
            header_cont = pair["header"]
            header_label = pair["header_label"]
            card_spec = pair["spec"]

            if card_cont is None:
                continue

            card_nome = comp_map[card_cont]["props"].get("Nome", f"MakerContainer{card_cont}")

            campos_count = len(card_spec.get("campos", []))
            has_grid = "grid" in card_spec
            lines_for_fields = 0
            if campos_count > 0:
                remaining_cols = 12
                for _, _, col_md, _ in card_spec["campos"]:
                    if remaining_cols < col_md:
                        lines_for_fields += 1
                        remaining_cols = 12
                    remaining_cols -= col_md
                lines_for_fields += 1

            field_area_height = lines_for_fields * LINE_GAP + 10
            grid_height = 200 if has_grid else 0
            card_height = CARD_HEADER_HEIGHT + field_area_height + grid_height + 20

            add_update(card_cont, "PosicaoX", str(CARD_MARGIN_LEFT))
            add_update(card_cont, "PosicaoY", str(y_current))
            add_update(card_cont, "Tamanho", str(CARD_WIDTH))
            add_update(card_cont, "Altura", str(card_height))
            add_update(card_cont, "Container", "")
            add_update(card_cont, "Aba", aba_nome)
            add_update(card_cont, "NomeClasseCss", "form-group card shadow-sm")
            add_update(card_cont, "Ordem", str(ordem_global))
            ordem_global += 1

            if header_cont:
                header_nome = comp_map[header_cont]["props"].get("Nome", f"MakerContainer{header_cont}")
                add_update(header_cont, "PosicaoX", "0")
                add_update(header_cont, "PosicaoY", "0")
                add_update(header_cont, "Tamanho", str(CARD_WIDTH))
                add_update(header_cont, "Altura", str(CARD_HEADER_HEIGHT))
                add_update(header_cont, "Container", card_nome)
                add_update(header_cont, "Aba", aba_nome)
                add_update(header_cont, "NomeClasseCss", "form-group card-header")
                add_update(header_cont, "Ordem", str(ordem_global))
                ordem_global += 1

                if header_label:
                    icon_html = (
                        f'<div class="text-primary card-heading-premium">'
                        f'<i class="fas {card_spec["icone"]}"></i> '
                        f'<span>{card_spec["titulo"]}</span></div>'
                    )
                    add_update(header_label, "PosicaoX", "10")
                    add_update(header_label, "PosicaoY", "5")
                    add_update(header_label, "Tamanho", str(CARD_WIDTH - 20))
                    add_update(header_label, "Altura", "30")
                    add_update(header_label, "Container", header_nome)
                    add_update(header_label, "Aba", aba_nome)
                    add_update(header_label, "Descricao", icon_html)
                    add_update(header_label, "Ordem", str(ordem_global))
                    ordem_global += 1

            field_y = CARD_HEADER_HEIGHT + 10
            if card_spec.get("campos"):
                final_y = layout_fields_in_card(
                    card_spec["campos"], comp_map, card_nome, aba_nome, field_y
                )
                for campo, _, _, _ in card_spec["campos"]:
                    com = find_component_by_field(comp_map, campo)
                    if com:
                        add_update(com, "Ordem", str(ordem_global))
                        ordem_global += 1

            if has_grid and grids:
                if grid_idx < len(grids):
                    grid_com = grids[grid_idx]
                    grid_idx += 1
                    grid_y = field_y if not card_spec.get("campos") else final_y + 10
                    add_update(grid_com, "PosicaoX", "10")
                    add_update(grid_com, "PosicaoY", str(grid_y))
                    add_update(grid_com, "Tamanho", str(CARD_WIDTH - 20))
                    add_update(grid_com, "Altura", "200")
                    add_update(grid_com, "Container", card_nome)
                    add_update(grid_com, "Aba", aba_nome)
                    add_update(grid_com, "NomeClasseCss", "form-group col-md-12")
                    add_update(grid_com, "Ordem", str(ordem_global))
                    ordem_global += 1

            y_current += card_height + CARD_GAP

        botoes_spec = aba_spec.get("botoes_wizard", [])
        if botoes_spec and buttons:
            wizard_y = y_current + 5
            btn_x = CARD_WIDTH - len(botoes_spec) * 170
            for bi, (btn_nome, btn_label, btn_css) in enumerate(botoes_spec):
                if bi < len(buttons):
                    btn_com = buttons[bi]
                    add_update(btn_com, "PosicaoX", str(btn_x))
                    add_update(btn_com, "PosicaoY", str(wizard_y))
                    add_update(btn_com, "Tamanho", "150")
                    add_update(btn_com, "Altura", str(FIELD_HEIGHT))
                    add_update(btn_com, "Container", "")
                    add_update(btn_com, "Aba", aba_nome)
                    add_update(btn_com, "NomeClasseCss", btn_css)
                    add_update(btn_com, "Ordem", str(ordem_global))
                    ordem_global += 1
                    btn_x += 170

    return updates


def apply_updates(conn, updates, dry_run=True):
    """Aplica os UPDATEs no banco."""
    cur = conn.cursor()
    applied = 0
    errors = 0

    for upd in updates:
        sql = (
            "UPDATE FR_PROPRIEDADE SET PRO_VALOR = %s "
            "WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND PRO_NOME = %s"
        )
        params = (upd["valor"], FRM_CODIGO, upd["com_codigo"], upd["prop"])

        if dry_run:
            cur.execute(
                "SELECT COUNT(*) FROM FR_PROPRIEDADE "
                "WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND PRO_NOME = %s",
                (FRM_CODIGO, upd["com_codigo"], upd["prop"]),
            )
            exists = cur.fetchone()[0]
            if exists:
                applied += 1
            else:
                sql_insert = (
                    "INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                    "VALUES (%s, %s, %s, %s)"
                )
                applied += 1
        else:
            try:
                cur.execute(
                    "SELECT COUNT(*) FROM FR_PROPRIEDADE "
                    "WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND PRO_NOME = %s",
                    (FRM_CODIGO, upd["com_codigo"], upd["prop"]),
                )
                exists = cur.fetchone()[0]

                if exists:
                    cur.execute(sql, params)
                else:
                    cur.execute(
                        "INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                        "VALUES (%s, %s, %s, %s)",
                        (FRM_CODIGO, upd["com_codigo"], upd["prop"], upd["valor"]),
                    )
                applied += 1
            except Exception as e:
                errors += 1
                print(f"  ERRO em COM={upd['com_codigo']} {upd['prop']}: {e}")

    if not dry_run:
        conn.commit()

    return applied, errors


def main():
    dry_run = "--apply" not in sys.argv

    print("=" * 60)
    print("Fix Posicionamento — Cadastro de Edital (Form 2000)")
    print(f"Modo: {'DRY-RUN (sem alteracoes)' if dry_run else 'APLICANDO ALTERACOES'}")
    print("=" * 60)

    conn = get_connection()

    print("\n--- DIAGNOSTICO ---")
    comp_map = diagnose(conn)
    if not comp_map:
        conn.close()
        return 1

    print("\n--- GERANDO CORRECOES ---")
    updates = generate_updates(comp_map)
    print(f"\n  Total de updates gerados: {len(updates)}")

    print("\n--- APLICANDO ---")
    applied, errors = apply_updates(conn, updates, dry_run=dry_run)

    if dry_run:
        print(f"  {applied} propriedades seriam atualizadas/inseridas")
        print(f"\n  Para aplicar, execute: python {sys.argv[0]} --apply")
    else:
        print(f"  {applied} propriedades atualizadas, {errors} erros")
        if errors == 0:
            print("  COMMIT realizado com sucesso!")
        else:
            print("  ATENCAO: houve erros. Verifique o output acima.")

    conn.close()
    return 0


if __name__ == "__main__":
    sys.exit(main())

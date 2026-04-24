"""Enterprise UI/UX engine para geracao de FRZ de nivel corporativo.

Transforma specs de formulario simples em interfaces enterprise-grade:
- Bootstrap 5.3 grid system com responsividade total
- Cards com headers Font Awesome para agrupamento logico
- MasterSkin integration (CSS modular via variaveis --webrun-*)
- Micro-interacoes: mascaras dinamicas, validacao inline
- Separacao rigida cliente (JS) vs servidor (Java)
- Acessibilidade: labels claros, navegacao por teclado

Inferido de: 286K properties reais, 876 formularios, 10.870 componentes.
"""

from __future__ import annotations

import re
import uuid
from typing import Any

# ---------------------------------------------------------------------------
# Constantes de layout (formulas de posicionamento)
# ---------------------------------------------------------------------------

FORM_WIDTH = 1100
FORM_MARGIN = 16
CARD_WIDTH = 1060
CARD_PADDING = 16
CARD_INNER_WIDTH = 1028
HEADER_HEIGHT = 40
HEADER_LABEL_X = 10
HEADER_LABEL_Y = 5
HEADER_LABEL_H = 30
FIELD_HEIGHT = 33
FIELD_GAP_V = 17
FIELD_ROW_HEIGHT = 50
FIELD_GAP_H = 14
FIELD_FIRST_Y = 50
MEMO_HEIGHT = 80
GRID_HEIGHT = 250
BUTTON_HEIGHT = 40
TITLE_Y = 10
TITLE_HEIGHT = 60
FIRST_CARD_Y = 80
CARD_GAP = 10


def _calc_field_height(tipo_componente: str, altura: int = 0) -> int:
    if tipo_componente in ("memo", "M"):
        return altura or MEMO_HEIGHT
    if tipo_componente in ("grade", "G"):
        return altura or GRID_HEIGHT
    if tipo_componente in ("botao", "B"):
        return BUTTON_HEIGHT
    return FIELD_HEIGHT


def _distribute_fields_into_rows(campos: list[dict]) -> list[list[dict]]:
    rows: list[list[dict]] = []
    current_row: list[dict] = []
    col_sum = 0
    for c in campos:
        col = c.get("colunas", 12)
        if col_sum + col > 12 and current_row:
            rows.append(current_row)
            current_row = []
            col_sum = 0
        current_row.append(c)
        col_sum += col
    if current_row:
        rows.append(current_row)
    return rows


def _calc_row_xw(campos_na_linha: list[dict]) -> list[dict]:
    num_gaps = len(campos_na_linha) - 1
    espaco = CARD_INNER_WIDTH - (num_gaps * FIELD_GAP_H)
    col_unit = espaco / 12
    result = []
    x = CARD_PADDING
    total_col = sum(c.get("colunas", 12) for c in campos_na_linha)
    for i, c in enumerate(campos_na_linha):
        col = c.get("colunas", 12)
        w = round(col_unit * col)
        if i == len(campos_na_linha) - 1 and total_col == 12:
            w = CARD_PADDING + CARD_INNER_WIDTH - x
        result.append({"x": x, "w": w})
        x += w + FIELD_GAP_H
    return result


def _calc_card_height(rows: list[list[dict]]) -> int:
    h = HEADER_HEIGHT + 10
    for row in rows:
        max_h = FIELD_ROW_HEIGHT
        for c in row:
            tc = c.get("tipo_componente", c.get("tipo", "E"))
            fh = _calc_field_height(tc, c.get("altura", 0))
            row_h = fh + FIELD_GAP_V
            max_h = max(max_h, row_h)
        h += max_h
    h += 10
    return h


def _apply_layout_positions(enriched_campos: list[dict]) -> tuple[list[dict], int]:
    """Aplica posicoes X, Y, W, H calculadas pelas formulas em todos os componentes."""
    card_y = FIRST_CARD_Y
    current_card = None
    current_card_rows = []
    cards_info = []

    title_found = False
    for c in enriched_campos:
        tipo = c.get("tipo", "E")
        if tipo == "L" and not c.get("container"):
            c["posicao_x"] = FORM_MARGIN
            c["posicao_y"] = TITLE_Y
            c["tamanho"] = CARD_WIDTH
            c["altura"] = TITLE_HEIGHT
            title_found = True
        elif tipo == "P" and not c.get("container"):
            cards_info.append({"nome": c["nome"], "component": c, "fields": []})
        elif tipo == "P" and c.get("container"):
            parent = c["container"]
            for ci in cards_info:
                if ci["nome"] == parent:
                    c["posicao_x"] = 0
                    c["posicao_y"] = 0
                    c["tamanho"] = CARD_WIDTH
                    c["altura"] = HEADER_HEIGHT
                    break
        elif tipo == "L" and c.get("container"):
            c["posicao_x"] = HEADER_LABEL_X
            c["posicao_y"] = HEADER_LABEL_Y
            c["tamanho"] = 400
            c["altura"] = HEADER_LABEL_H
        else:
            parent_card = c.get("container", "")
            for ci in cards_info:
                if ci["nome"] == parent_card:
                    ci["fields"].append(c)
                    break

    y = FIRST_CARD_Y
    for ci in cards_info:
        rows = _distribute_fields_into_rows(ci["fields"])
        card_h = _calc_card_height(rows)

        ci["component"]["posicao_x"] = FORM_MARGIN
        ci["component"]["posicao_y"] = y
        ci["component"]["tamanho"] = CARD_WIDTH
        ci["component"]["altura"] = card_h

        field_y = FIELD_FIRST_Y
        for row in rows:
            xw = _calc_row_xw(row)
            max_row_h = FIELD_ROW_HEIGHT
            for i, c in enumerate(row):
                tc = c.get("tipo_componente", c.get("tipo", "E"))
                c["posicao_x"] = xw[i]["x"]
                c["posicao_y"] = field_y
                c["tamanho"] = xw[i]["w"]
                c["altura"] = _calc_field_height(tc, c.get("altura", 0))
                fh = c["altura"] + FIELD_GAP_V
                max_row_h = max(max_row_h, fh)
            field_y += max_row_h

        y += card_h + CARD_GAP

    form_height = y + 20
    return enriched_campos, form_height


# ---------------------------------------------------------------------------
# Constantes de design (extraidas do banco de producao)
# ---------------------------------------------------------------------------

_MASCARAS_POR_SUFIXO: dict[str, str] = {
    "_CPF": "CPF", "_CNPJ": "CNPJ", "_CEP": "CEP",
    "_TELEFONE": "TELEFONE", "_TEL": "TELEFONE", "_FONE": "TELEFONE",
    "_CELULAR": "CELULAR", "_CEL": "CELULAR",
    "_DATA": "DATA", "_DT": "DATA", "_NASCIMENTO": "DATA",
    "_HORA": "HORA", "_HR": "HORA",
    "_VALOR": "MOEDA", "_PRECO": "MOEDA", "_CUSTO": "MOEDA",
}

_ICONES_POR_SECAO: dict[str, str] = {
    "dados": "fa-id-card", "basico": "fa-id-card", "pessoais": "fa-id-card",
    "contato": "fa-envelope", "comunicacao": "fa-envelope",
    "endereco": "fa-map-marker-alt", "localizacao": "fa-map-marker-alt",
    "financeiro": "fa-dollar-sign", "pagamento": "fa-dollar-sign",
    "documento": "fa-folder-open", "anexo": "fa-paperclip",
    "observacao": "fa-sticky-note", "historico": "fa-history",
    "configuracao": "fa-sliders-h", "permissao": "fa-shield-alt",
    "requisito": "fa-list-check", "detalhe": "fa-info-circle",
    "cadastro": "fa-plus-circle", "geral": "fa-th-large",
    "indicador": "fa-chart-bar", "grafico": "fa-chart-line",
}

_ICONE_POR_TIPO_FORM: dict[str, str] = {
    "cadastro": "fa-plus-circle",
    "pessoa": "fa-user-plus",
    "empresa": "fa-building",
    "financeiro": "fa-dollar-sign",
    "documento": "fa-file-alt",
    "relatorio": "fa-chart-bar",
    "configuracao": "fa-cog",
    "dashboard": "fa-tachometer-alt",
    "login": "fa-sign-in-alt",
    "veiculo": "fa-car",
    "produto": "fa-boxes",
    "venda": "fa-shopping-cart",
    "atendimento": "fa-headset",
}

_TIPO_COMPONENTE_POR_SUFIXO: dict[str, str] = {
    "_COD": "E", "_CODIGO": "E",
    "_NOME": "E", "_RAZAO": "E", "_FANTASIA": "E",
    "_EMAIL": "E", "_MAIL": "E",
    "_OBS": "M", "_OBSERVACAO": "M", "_DESCRICAO": "M",
    "_ATIVO": "R", "_STATUS": "C", "_TIPO": "C", "_SITUACAO": "C",
    "_UF": "C",
}

_LARGURA_POR_TIPO_DADO: dict[str, int] = {
    "CPF": 4, "CNPJ": 4, "CEP": 3, "TELEFONE": 4, "CELULAR": 4,
    "DATA": 3, "HORA": 3, "MOEDA": 4,
}

_CSS_MASTERSKIN = """\
.enterprise-page-header {
    padding: 12px 0 8px;
}
.enterprise-page-header h3 {
    margin: 0; font-size: 1.4rem; font-weight: 700;
    color: var(--bs-emphasis-color);
}
.enterprise-page-header h3 i {
    color: var(--bs-primary); margin-right: 10px;
}
.enterprise-page-header small {
    display: block; margin-top: 4px;
    font-size: 0.85rem; color: var(--bs-secondary-color); font-weight: 400;
}
.enterprise-card-heading {
    display: flex; align-items: center; gap: 8px;
    font-size: 0.95rem; font-weight: 600;
    color: var(--bs-primary);
}
.enterprise-card-heading i { font-size: 1rem; }
.enterprise-field-required::after {
    content: ' *'; color: var(--bs-danger); font-weight: 600;
}
.enterprise-stepper-indicator {
    display: flex; gap: 8px; padding: 8px 16px;
    background: var(--bs-tertiary-bg);
    border-radius: var(--bs-border-radius);
}
.enterprise-stepper-step {
    flex: 1; text-align: center; padding: 6px 0;
    font-size: 0.8rem; font-weight: 500;
    color: var(--bs-secondary-color);
    border-bottom: 3px solid transparent;
    transition: all 0.2s ease;
}
.enterprise-stepper-step.active {
    color: var(--bs-primary);
    border-bottom-color: var(--bs-primary);
    font-weight: 600;
}
[data-bs-theme="dark"] .enterprise-page-header h3 {
    color: var(--bs-body-color);
}
"""


# ---------------------------------------------------------------------------
# Inferencia inteligente de tipo de componente e mascara
# ---------------------------------------------------------------------------

def infer_component_type(campo: str, tipo_dado_sql: str = "") -> str:
    """Infere COM_TIPO baseado no nome do campo e tipo SQL."""
    campo_upper = campo.upper()
    for suffix, comp_type in _TIPO_COMPONENTE_POR_SUFIXO.items():
        if campo_upper.endswith(suffix):
            return comp_type
    if tipo_dado_sql in ("text", "ntext"):
        return "M"
    if tipo_dado_sql == "bit":
        return "H"
    return "E"


def infer_mask(campo: str) -> str:
    """Infere mascara baseado no nome do campo."""
    campo_upper = campo.upper()
    for suffix, mask in _MASCARAS_POR_SUFIXO.items():
        if campo_upper.endswith(suffix) or suffix.lstrip("_") in campo_upper:
            return mask
    return ""


def infer_column_width(campo: str, mascara: str = "", tipo_componente: str = "E") -> int:
    """Infere largura Bootstrap (1-12) baseado no campo."""
    if mascara and mascara in _LARGURA_POR_TIPO_DADO:
        return _LARGURA_POR_TIPO_DADO[mascara]

    campo_upper = campo.upper()
    if any(k in campo_upper for k in ("_COD", "CODIGO", "_ID", "_UF", "_NUMERO")):
        return 3
    if any(k in campo_upper for k in ("_NOME", "_RAZAO", "_FANTASIA", "_ENDERECO", "_EMAIL")):
        return 6
    if tipo_componente == "M":
        return 12
    return 6


def infer_icon_for_section(nome_aba: str) -> str:
    """Infere icone Font Awesome baseado no nome da aba/secao."""
    nome_lower = nome_aba.lower()
    for key, icon in _ICONES_POR_SECAO.items():
        if key in nome_lower:
            return icon
    return "fa-th-large"


def infer_icon_for_form(titulo: str) -> str:
    """Infere icone Font Awesome baseado no titulo do formulario."""
    titulo_lower = titulo.lower()
    for key, icon in _ICONE_POR_TIPO_FORM.items():
        if key in titulo_lower:
            return icon
    return "fa-plus-circle"


# ---------------------------------------------------------------------------
# Agrupamento logico de campos em secoes (Cards)
# ---------------------------------------------------------------------------

_FIELD_GROUPS: dict[str, list[str]] = {
    "Dados Basicos": [
        "COD", "CODIGO", "NOME", "RAZAO", "FANTASIA", "TIPO", "STATUS",
        "ATIVO", "SITUACAO",
    ],
    "Documentos": [
        "CPF", "CNPJ", "RG", "IE", "IM", "INSCRICAO", "ALVARA", "CERTIDAO",
    ],
    "Contato": [
        "EMAIL", "MAIL", "TELEFONE", "TEL", "FONE", "CELULAR", "CEL",
        "WHATSAPP", "FAX", "SITE", "URL",
    ],
    "Endereco": [
        "CEP", "ENDERECO", "LOGRADOURO", "NUMERO", "COMPLEMENTO",
        "BAIRRO", "CIDADE", "MUNICIPIO", "UF", "ESTADO", "PAIS",
    ],
    "Financeiro": [
        "VALOR", "PRECO", "CUSTO", "DESCONTO", "MULTA", "JUROS",
        "BANCO", "AGENCIA", "CONTA", "PIX",
    ],
    "Datas": [
        "DATA", "DT_", "NASCIMENTO", "ADMISSAO", "DEMISSAO",
        "INICIO", "FIM", "VENCIMENTO", "CADASTRO", "CRIACAO",
    ],
    "Observacoes": [
        "OBS", "OBSERVACAO", "DESCRICAO", "NOTAS", "COMENTARIO",
    ],
}


def group_fields_into_sections(campos: list[dict]) -> dict[str, list[dict]]:
    """Agrupa campos em secoes logicas baseado no nome do campo."""
    sections: dict[str, list[dict]] = {}
    used = set()

    for group_name, keywords in _FIELD_GROUPS.items():
        group_campos = []
        for i, c in enumerate(campos):
            if i in used:
                continue
            campo_upper = c.get("campo", c.get("nome", "")).upper()
            if any(kw in campo_upper for kw in keywords):
                group_campos.append(c)
                used.add(i)
        if group_campos:
            sections[group_name] = group_campos

    remaining = [c for i, c in enumerate(campos) if i not in used]
    if remaining:
        first_section = next(iter(sections), "Dados Gerais")
        sections.setdefault(first_section, []).extend(remaining)

    return sections


# ---------------------------------------------------------------------------
# Enterprise Form Enrichment
# ---------------------------------------------------------------------------

def enrich_crud_spec(spec: dict) -> dict:
    """Enriquece spec do gerar_crud com padrao enterprise.

    Adiciona: cards por secao, titulo HTML premium, CSS MasterSkin,
    mascaras automaticas, inferencia de tipo de componente,
    regras de validacao inline (cliente), regra de persistencia (servidor).
    """
    tabela = spec.get("tabela", "")
    titulo = spec.get("titulo", f"Cadastro de {tabela}")
    campos = spec.get("campos", [])

    for c in campos:
        campo_nome = c.get("campo", c.get("nome", ""))
        if not c.get("tipo_componente"):
            c["tipo_componente"] = {
                "E": "texto", "M": "memo", "H": "checkbox",
                "C": "combo", "R": "radio", "K": "lookup",
            }.get(infer_component_type(campo_nome), "texto")
        if not c.get("mascara"):
            mask = infer_mask(campo_nome)
            if mask:
                c["mascara"] = mask
        if not c.get("colunas"):
            c["colunas"] = infer_column_width(
                campo_nome,
                c.get("mascara", ""),
                {"texto": "E", "memo": "M", "checkbox": "H",
                 "combo": "C", "radio": "R"}.get(c.get("tipo_componente", ""), "E"),
            )

    sections = group_fields_into_sections(campos)

    enriched_campos = []
    icon_form = infer_icon_for_form(titulo)

    enriched_campos.append({
        "nome": "lblTituloPagina",
        "tipo": "L",
        "campo": "",
        "descricao": (
            f'<div class="enterprise-page-header">'
            f'<h3><i class="fa-solid {icon_form}"></i> '
            f'<span>{titulo}</span></h3>'
            f'<small>Preencha os dados abaixo para realizar o cadastro</small>'
            f'</div>'
        ),
        "aba": "01-Cadastro",
        "container": "",
        "properties": {
            "NomeClasseCss": "form-group fw-bold text-dark mb-3 col-md-12",
        },
    })

    section_idx = 0
    for section_name, section_campos in sections.items():
        icon = infer_icon_for_section(section_name)
        card_name = f"card{section_idx}"
        header_name = f"cardHeader{section_idx}"

        enriched_campos.append({
            "nome": card_name,
            "tipo": "P",
            "campo": "",
            "descricao": "",
            "aba": "01-Cadastro",
            "container": "",
            "properties": {
                "NomeClasseCss": "form-group card shadow mb-3",
                "Alinhar": "alNone",
            },
        })

        enriched_campos.append({
            "nome": header_name,
            "tipo": "P",
            "campo": "",
            "descricao": "",
            "aba": "01-Cadastro",
            "container": card_name,
            "properties": {
                "NomeClasseCss": "form-group card-header",
                "Alinhar": "alNone",
            },
        })

        enriched_campos.append({
            "nome": f"lblHeader{section_idx}",
            "tipo": "L",
            "campo": "",
            "descricao": (
                f'<span class="enterprise-card-heading">'
                f'<i class="fa-solid {icon}"></i> {section_name}'
                f'</span>'
            ),
            "aba": "01-Cadastro",
            "container": header_name,
            "properties": {
                "NomeClasseCss": "form-group col-md-12",
            },
        })

        for c in section_campos:
            c["aba"] = "01-Cadastro"
            c["container"] = card_name

            cols = c.get("colunas", 6)
            css_class = f"form-group col-md-{cols}"
            if c.get("obrigatorio"):
                css_class += " enterprise-field-required"

            existing_props = c.get("properties", {})
            existing_props["NomeClasseCss"] = css_class
            if c.get("mascara"):
                existing_props["Mascara"] = c["mascara"]
            if c.get("obrigatorio"):
                existing_props["Obrigatorio"] = "TRUE"

            campo_nome = c.get("campo", c.get("nome", ""))
            if not existing_props.get("Placeholder"):
                label = c.get("descricao", campo_nome.replace("_", " ").title())
                existing_props["Placeholder"] = f"Informe {label.lower()}"

            c["properties"] = existing_props
            enriched_campos.append(c)

        section_idx += 1

    enriched_campos, form_height = _apply_layout_positions(enriched_campos)

    spec["campos"] = enriched_campos
    spec["titulo"] = titulo
    spec["css"] = _CSS_MASTERSKIN
    spec["altura"] = form_height

    return spec


def enrich_dashboard_spec(spec: dict) -> dict:
    """Enriquece spec do gerar_dashboard com padrao enterprise."""
    titulo = spec.get("titulo", "Dashboard")
    paineis = spec.get("paineis", [])
    icon = infer_icon_for_form(titulo)

    spec["titulo"] = titulo
    spec["css"] = _CSS_MASTERSKIN
    spec["_icon"] = icon

    for i, p in enumerate(paineis):
        if not p.get("colunas"):
            p["colunas"] = 6 if len(paineis) <= 2 else 4 if len(paineis) <= 3 else 3

    return spec


def enrich_login_spec(spec: dict) -> dict:
    """Enriquece spec do gerar_login com padrao enterprise."""
    spec["css"] = _CSS_MASTERSKIN
    return spec


# ---------------------------------------------------------------------------
# Geracao de regras enterprise
# ---------------------------------------------------------------------------

def build_client_validation_rule(
    nome_regra: str,
    codigo: int,
    campos: list[dict],
    tabela: str,
) -> dict:
    """Gera regra de validacao CLIENTE (destino=1, JavaScript).

    Validacao inline com feedback imediato no browser.
    Separacao rigida: cliente valida formato, servidor persiste.
    """
    required = [c for c in campos if c.get("obrigatorio")]
    if not required:
        return {}

    passos: list[dict] = []
    for i, c in enumerate(required):
        campo_nome = c.get("campo", c["nome"])
        label = c.get("descricao", c.get("label", campo_nome))

        passos.append({
            "tipo": "decisao",
            "nome": f"chk{i}",
            "descricao": f"{label} vazio?",
            "funcao": "isNullOrEmpty",
            "nome_amigavel": "Vazio ou Nulo?",
            "params": [{"tipo": "variavel", "nome": f"p{campo_nome}"}],
            "sim": [
                {
                    "tipo": "atividade",
                    "nome": f"err{i}",
                    "activity_id": 7,
                    "object_name": "ActNewErrorMessage",
                    "real_name": "ActNewErrorMessage",
                    "params": [
                        {"target_param_name": "Título",
                         "value": {"tipo": "constante", "valor": "Campo obrigatorio",
                                   "tipo_dado": "Letras"}},
                        {"target_param_name": "Mensagem",
                         "value": {"tipo": "constante",
                                   "valor": f"O campo '{label}' deve ser preenchido.",
                                   "tipo_dado": "Letras"}},
                        {"target_param_name": "Tempo",
                         "value": {"tipo": "constante", "valor": "5",
                                   "tipo_dado": "Letras"}},
                        {"target_param_name": "Posição",
                         "value": {"tipo": "constante", "valor": "DT",
                                   "tipo_dado": "Letras"}},
                    ],
                    "description": f"Erro: {label} obrigatorio",
                },
            ],
            "nao": [],
        })

    params = [
        {"nome": f"p{c.get('campo', c['nome'])}", "tipo": "Letras"}
        for c in required
    ]

    return {
        "nome": nome_regra,
        "destino": 1,
        "codigo": codigo,
        "descricao": f"Validacao inline - {tabela}",
        "retorno_tipo": "",
        "parametros": params,
        "variaveis": [],
        "passos": passos,
    }


def build_server_validation_rule(
    nome_regra: str,
    codigo: int,
    campos: list[dict],
    tabela: str,
) -> dict:
    """Gera regra de validacao SERVIDOR (destino=2, Java).

    Validacao de integridade antes de persistir.
    """
    required = [c for c in campos if c.get("obrigatorio")]
    if not required:
        return {}

    passos: list[dict] = []
    for i, c in enumerate(required):
        campo_nome = c.get("campo", c["nome"])
        label = c.get("descricao", c.get("label", campo_nome))

        passos.append({
            "tipo": "decisao",
            "nome": f"srvChk{i}",
            "descricao": f"Servidor: {label} vazio?",
            "funcao": "isNullOrEmpty",
            "nome_amigavel": "Vazio ou Nulo?",
            "params": [{"tipo": "variavel", "nome": f"p{campo_nome}"}],
            "sim": [
                {
                    "tipo": "atividade",
                    "nome": f"srvErr{i}",
                    "activity_id": 7,
                    "object_name": "ActNewErrorMessage",
                    "real_name": "ActNewErrorMessage",
                    "params": [
                        {"target_param_name": "Título",
                         "value": {"tipo": "constante", "valor": "Erro de validacao",
                                   "tipo_dado": "Letras"}},
                        {"target_param_name": "Mensagem",
                         "value": {"tipo": "constante",
                                   "valor": f"Campo '{label}' e obrigatorio e nao foi preenchido.",
                                   "tipo_dado": "Letras"}},
                    ],
                    "description": f"Servidor: {label} obrigatorio",
                },
            ],
            "nao": [],
        })

    params = [
        {"nome": f"p{c.get('campo', c['nome'])}", "tipo": "Letras"}
        for c in required
    ]

    return {
        "nome": nome_regra,
        "destino": 2,
        "codigo": codigo,
        "descricao": f"Validacao servidor - {tabela}",
        "retorno_tipo": "",
        "parametros": params,
        "variaveis": [],
        "passos": passos,
    }


def build_mask_client_rule(
    codigo: int,
    campos_com_mascara: list[dict],
) -> dict | None:
    """Gera regra CLIENTE para aplicar mascaras dinamicas via JS."""
    if not campos_com_mascara:
        return None

    mask_map = {
        "CPF": "999.999.999-99",
        "CNPJ": "99.999.999/9999-99",
        "CEP": "99999-999",
        "TELEFONE": "(99) 9999-9999",
        "CELULAR": "(99) 99999-9999",
        "DATA": "99/99/9999",
        "HORA": "99:99",
        "MOEDA": "###.###.##0,00",
    }

    passos = []
    for i, c in enumerate(campos_com_mascara):
        mascara = c.get("mascara", "")
        formato = mask_map.get(mascara, "")
        if not formato:
            continue
        comp_nome = c.get("nome", "")
        passos.append({
            "tipo": "expressao",
            "nome": f"mask{i}",
            "descricao": f"Mascara {mascara} em {comp_nome}",
            "funcao": "ebfSetComponentProperty",
            "nome_amigavel": "Definir Propriedade do Componente",
            "params": [
                {"tipo": "constante", "valor": comp_nome, "tipo_dado": "Letras"},
                {"tipo": "constante", "valor": "Mascara", "tipo_dado": "Letras"},
                {"tipo": "constante", "valor": formato, "tipo_dado": "Letras"},
            ],
            "retorno": "",
            "tipo_retorno": "Variante",
        })

    if not passos:
        return None

    return {
        "nome": "Aplicar Mascaras Dinamicas",
        "destino": 1,
        "codigo": codigo,
        "descricao": "Aplicacao de mascaras via JS ao entrar no formulario",
        "retorno_tipo": "",
        "parametros": [],
        "variaveis": [],
        "passos": passos,
    }


# ---------------------------------------------------------------------------
# Regras complexas — duplicidade, dependencia, orquestracao, condicionais
# ---------------------------------------------------------------------------

def _srv_duplicity_rule(
    nome_regra: str,
    codigo: int,
    tabela: str,
    campo_unico: str,
    campo_pk: str,
    is_update: bool,
    mensagem: str,
) -> dict:
    """Gera regra servidor de verificacao de duplicidade com retorno JSON."""
    param_nome = f"p{campo_unico}"
    params = [{"nome": param_nome, "tipo": "Letras"}]
    where_extra = ""
    if is_update:
        params.append({"nome": f"p{campo_pk}", "tipo": "Inteiro"})
        where_extra = f" AND {campo_pk} <> CAST(:p{campo_pk} AS INTEGER)"

    sql = (
        f"SELECT COUNT(*) AS QTD FROM {tabela} "
        f"WHERE UPPER({campo_unico}) = UPPER(CAST(:{param_nome} AS VARCHAR(200))){where_extra}"
    )
    binds = [{"nome": param_nome, "variavel": param_nome}]
    if is_update:
        binds.append({"nome": f"p{campo_pk}", "variavel": f"p{campo_pk}"})

    return {
        "nome": nome_regra,
        "destino": 2,
        "codigo": codigo,
        "descricao": nome_regra,
        "categoria": "\\SGFC\\Validacao",
        "retorno_tipo": "Variante",
        "parametros": params,
        "variaveis": [
            {"nome": "qryCheck", "tipo": "Tabela"},
            {"nome": "vQtd", "tipo": "Numero"},
            {"nome": "jsonRetorno", "tipo": "Variante"},
        ],
        "passos": [
            {"tipo": "expressao", "nome": "consultar", "descricao": "Consultar duplicidade",
             "funcao": "ebfSQLExecuteQuery", "nome_amigavel": "Abrir Consulta",
             "params": [{"tipo": "sql", "sql": sql, "binds": binds},
                        {"tipo": "constante", "valor": None, "tipo_dado": "Letras"}],
             "retorno": "qryCheck", "tipo_retorno": "Tabela"},
            {"tipo": "expressao", "nome": "extrair", "descricao": "Obter quantidade",
             "funcao": "ebfSQLField", "nome_amigavel": "Campo",
             "params": [{"tipo": "variavel", "nome": "qryCheck"},
                        {"tipo": "constante", "valor": "QTD", "tipo_dado": "Letras"}],
             "retorno": "vQtd", "tipo_retorno": "Numero"},
            {"tipo": "expressao", "nome": "fechar", "descricao": "Fechar consulta",
             "funcao": "ebfSQLClose", "nome_amigavel": "Fechar Consulta",
             "params": [{"tipo": "variavel", "nome": "qryCheck"}],
             "retorno": None, "tipo_retorno": None},
            {"tipo": "expressao", "nome": "criarJson", "descricao": "Criar JSON",
             "funcao": "ebfCreateObjectJSON", "nome_amigavel": "Criar Objeto JSON",
             "params": [], "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
            {"tipo": "decisao", "nome": "existe", "descricao": "Duplicado?",
             "funcao": "isGreater", "nome_amigavel": "Maior que?",
             "params": [{"tipo": "variavel", "nome": "vQtd"},
                        {"tipo": "constante", "valor": "0", "tipo_dado": "Numero"}],
             "sim": [
                 {"tipo": "expressao", "nome": "setErro", "descricao": "Status erro",
                  "funcao": "ebfUpdateValueObjectJson", "nome_amigavel": "JSON - Atualizar Valor",
                  "params": [{"tipo": "variavel", "nome": "jsonRetorno"},
                             {"tipo": "constante", "valor": "status", "tipo_dado": "Letras"},
                             {"tipo": "constante", "valor": "erro", "tipo_dado": "Letras"}],
                  "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
                 {"tipo": "expressao", "nome": "setMsg", "descricao": "Mensagem",
                  "funcao": "ebfUpdateValueObjectJson", "nome_amigavel": "JSON - Atualizar Valor",
                  "params": [{"tipo": "variavel", "nome": "jsonRetorno"},
                             {"tipo": "constante", "valor": "mensagem", "tipo_dado": "Letras"},
                             {"tipo": "constante", "valor": mensagem, "tipo_dado": "Letras"}],
                  "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
             ],
             "nao": [
                 {"tipo": "expressao", "nome": "setOk", "descricao": "Status ok",
                  "funcao": "ebfUpdateValueObjectJson", "nome_amigavel": "JSON - Atualizar Valor",
                  "params": [{"tipo": "variavel", "nome": "jsonRetorno"},
                             {"tipo": "constante", "valor": "status", "tipo_dado": "Letras"},
                             {"tipo": "constante", "valor": "ok", "tipo_dado": "Letras"}],
                  "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
             ]},
        ],
    }


def build_duplicity_check_rules(
    tabela: str,
    campos_unicos: list[str],
    campo_pk: str,
    nome_tela: str = "",
    codigo_base: int = 0,
) -> list[dict]:
    """Gera regras servidor de duplicidade para INSERT e UPDATE de cada campo unico."""
    nome_tela = nome_tela or tabela.replace("_", " ").title()
    rules = []
    for i, campo in enumerate(campos_unicos):
        campo_label = campo.replace("_", " ").title()
        rules.append(_srv_duplicity_rule(
            f"{nome_tela} - Verificar Duplicidade {campo_label} Insert [SRV]",
            codigo_base + (i * 2) if codigo_base else 0,
            tabela, campo, campo_pk, is_update=False,
            mensagem=f"Ja existe um registro com este valor de {campo_label}.",
        ))
        rules.append(_srv_duplicity_rule(
            f"{nome_tela} - Verificar Duplicidade {campo_label} Update [SRV]",
            (codigo_base + (i * 2) + 1) if codigo_base else 0,
            tabela, campo, campo_pk, is_update=True,
            mensagem=f"Ja existe um registro com este valor de {campo_label}.",
        ))
    return rules


def build_dependency_check_rule(
    tabela: str,
    tabela_filha: str,
    campo_fk: str,
    campo_pk: str,
    nome_tela: str = "",
    codigo: int = 0,
    mensagem: str = "",
) -> dict:
    """Gera regra servidor que verifica vinculos antes de deletar."""
    nome_tela = nome_tela or tabela.replace("_", " ").title()
    msg = mensagem or f"Este registro esta vinculado a dados em {tabela_filha} e nao pode ser excluido. Realize a inativacao."
    sql = f"SELECT COUNT(*) AS QTD FROM {tabela_filha} WHERE {campo_fk} = CAST(:pId AS INTEGER)"
    return _srv_duplicity_rule(
        f"{nome_tela} - Verificar Vinculos [SRV]",
        codigo, tabela_filha, campo_fk, campo_pk,
        is_update=False, mensagem=msg,
    ) | {
        "parametros": [{"nome": "pId", "tipo": "Inteiro"}],
        "passos": [
            {"tipo": "expressao", "nome": "consultar", "descricao": "Consultar vinculos",
             "funcao": "ebfSQLExecuteQuery", "nome_amigavel": "Abrir Consulta",
             "params": [{"tipo": "sql", "sql": sql, "binds": [{"nome": "pId", "variavel": "pId"}]},
                        {"tipo": "constante", "valor": None, "tipo_dado": "Letras"}],
             "retorno": "qryCheck", "tipo_retorno": "Tabela"},
            {"tipo": "expressao", "nome": "extrair", "descricao": "Obter quantidade",
             "funcao": "ebfSQLField", "nome_amigavel": "Campo",
             "params": [{"tipo": "variavel", "nome": "qryCheck"},
                        {"tipo": "constante", "valor": "QTD", "tipo_dado": "Letras"}],
             "retorno": "vQtd", "tipo_retorno": "Numero"},
            {"tipo": "expressao", "nome": "fechar", "descricao": "Fechar consulta",
             "funcao": "ebfSQLClose", "nome_amigavel": "Fechar Consulta",
             "params": [{"tipo": "variavel", "nome": "qryCheck"}],
             "retorno": None, "tipo_retorno": None},
            {"tipo": "expressao", "nome": "criarJson", "descricao": "Criar JSON",
             "funcao": "ebfCreateObjectJSON", "nome_amigavel": "Criar Objeto JSON",
             "params": [], "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
            {"tipo": "decisao", "nome": "temVinculos", "descricao": "Possui vinculos?",
             "funcao": "isGreater", "nome_amigavel": "Maior que?",
             "params": [{"tipo": "variavel", "nome": "vQtd"},
                        {"tipo": "constante", "valor": "0", "tipo_dado": "Numero"}],
             "sim": [
                 {"tipo": "expressao", "nome": "setErro", "descricao": "Status erro",
                  "funcao": "ebfUpdateValueObjectJson", "nome_amigavel": "JSON - Atualizar Valor",
                  "params": [{"tipo": "variavel", "nome": "jsonRetorno"},
                             {"tipo": "constante", "valor": "status", "tipo_dado": "Letras"},
                             {"tipo": "constante", "valor": "erro", "tipo_dado": "Letras"}],
                  "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
                 {"tipo": "expressao", "nome": "setMsg", "descricao": "Mensagem",
                  "funcao": "ebfUpdateValueObjectJson", "nome_amigavel": "JSON - Atualizar Valor",
                  "params": [{"tipo": "variavel", "nome": "jsonRetorno"},
                             {"tipo": "constante", "valor": "mensagem", "tipo_dado": "Letras"},
                             {"tipo": "constante", "valor": msg, "tipo_dado": "Letras"}],
                  "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
             ],
             "nao": [
                 {"tipo": "expressao", "nome": "setOk", "descricao": "Status ok",
                  "funcao": "ebfUpdateValueObjectJson", "nome_amigavel": "JSON - Atualizar Valor",
                  "params": [{"tipo": "variavel", "nome": "jsonRetorno"},
                             {"tipo": "constante", "valor": "status", "tipo_dado": "Letras"},
                             {"tipo": "constante", "valor": "ok", "tipo_dado": "Letras"}],
                  "retorno": "jsonRetorno", "tipo_retorno": "Variante"},
             ]},
        ],
    }


def _cli_orchestrator_rule(
    nome_regra: str,
    codigo: int,
    subroutines: list[dict],
    extra_params: list[dict] | None = None,
) -> dict:
    """Gera regra cliente orquestradora que chama sub-rotinas servidor, verifica JSON e mostra SweetAlert."""
    params = list(extra_params or [])
    passos = []

    for sr in subroutines:
        passos.append({
            "tipo": "subrotina",
            "nome": sr["step_name"],
            "rule_name": sr["rule_name"],
            "rule_id": sr.get("rule_id", 0),
            "params": sr.get("params", []),
            "return_var": "vResultado",
            "description": sr.get("description", sr["rule_name"]),
        })
        passos.append({
            "tipo": "expressao", "nome": f"obterStatus{sr['step_name']}",
            "descricao": "Obter status", "funcao": "ebfGetValueObjectJson",
            "nome_amigavel": "JSON - Obter Valor",
            "params": [{"tipo": "variavel", "nome": "vResultado"},
                       {"tipo": "constante", "valor": "status", "tipo_dado": "Letras"}],
            "retorno": "vStatus", "tipo_retorno": "Letras",
        })
        passos.append({
            "tipo": "decisao", "nome": f"chk{sr['step_name']}",
            "descricao": f"Erro em {sr.get('description', '')}?",
            "funcao": "isEqual", "nome_amigavel": "Igual?",
            "params": [{"tipo": "variavel", "nome": "vStatus"},
                       {"tipo": "constante", "valor": "erro", "tipo_dado": "Letras"}],
            "sim": [
                {"tipo": "atividade", "nome": f"err{sr['step_name']}",
                 "activity_id": 7, "object_name": "ActNewErrorMessage",
                 "real_name": "ActNewErrorMessage",
                 "description": sr.get("description", "Erro de validacao")},
                {"tipo": "expressao", "nome": f"stop{sr['step_name']}",
                 "descricao": "Interromper fluxo",
                 "funcao": "ebfStopRuleExecution", "nome_amigavel": "Interromper Fluxo",
                 "params": [{"tipo": "constante", "valor": "", "tipo_dado": "Letras"}],
                 "retorno": None, "tipo_retorno": None},
            ],
            "nao": [],
        })

    for p in params:
        if p not in [pp for pp in params]:
            params.append(p)

    return {
        "nome": nome_regra,
        "destino": 1,
        "codigo": codigo,
        "descricao": nome_regra,
        "categoria": "\\SGFC\\Eventos",
        "parametros": params,
        "variaveis": [
            {"nome": "vResultado", "tipo": "Variante"},
            {"nome": "vStatus", "tipo": "Letras"},
        ],
        "passos": passos,
    }


def build_event_orchestrator_rules(
    tabela: str,
    campos_unicos: list[str],
    campo_pk: str,
    campos_obrigatorios: list[dict] | None = None,
    nome_tela: str = "",
    codigo_base: int = 0,
    dep_tabela_filha: str = "",
    dep_campo_fk: str = "",
) -> list[dict]:
    """Gera 4 regras cliente (Antes de Inserir/Alterar/Gravar/Deletar) com sub-rotinas."""
    nome_tela = nome_tela or tabela.replace("_", " ").title()
    rules = []

    # Antes de Inserir
    sr_insert = []
    params_insert = []
    for campo in campos_unicos:
        p_nome = f"p{campo}"
        params_insert.append({"nome": p_nome, "tipo": "Letras"})
        sr_insert.append({
            "step_name": f"verInsert{campo}",
            "rule_name": f"{nome_tela} - Verificar Duplicidade {campo.replace('_', ' ').title()} Insert [SRV]",
            "params": [{"target_param_name": f"p{campo}", "value": {"tipo": "variavel", "nome": p_nome}}],
            "description": f"Duplicidade {campo} insert",
        })
    if sr_insert:
        rules.append(_cli_orchestrator_rule(
            f"Cad{nome_tela.replace(' ', '')} - Antes de Inserir",
            codigo_base, sr_insert, params_insert,
        ))

    # Antes de Alterar
    sr_update = []
    params_update = list(params_insert) + [{"nome": f"p{campo_pk}", "tipo": "Inteiro"}]
    for campo in campos_unicos:
        sr_update.append({
            "step_name": f"verUpdate{campo}",
            "rule_name": f"{nome_tela} - Verificar Duplicidade {campo.replace('_', ' ').title()} Update [SRV]",
            "params": [
                {"target_param_name": f"p{campo}", "value": {"tipo": "variavel", "nome": f"p{campo}"}},
                {"target_param_name": f"p{campo_pk}", "value": {"tipo": "variavel", "nome": f"p{campo_pk}"}},
            ],
            "description": f"Duplicidade {campo} update",
        })
    if sr_update:
        rules.append(_cli_orchestrator_rule(
            f"Cad{nome_tela.replace(' ', '')} - Antes de Alterar",
            codigo_base + 1 if codigo_base else 0, sr_update, params_update,
        ))

    # Antes de Gravar (validacao obrigatoria inline)
    if campos_obrigatorios:
        passos_gravar = []
        params_gravar = []
        for c in campos_obrigatorios:
            p_nome = f"p{c.get('campo', c['nome'])}"
            params_gravar.append({"nome": p_nome, "tipo": "Letras"})
            label = c.get("descricao", c.get("campo", c["nome"]))
            passos_gravar.append({
                "tipo": "decisao", "nome": f"chk{c['nome']}",
                "descricao": f"{label} vazio?",
                "funcao": "isNullOrEmpty", "nome_amigavel": "Vazio ou Nulo?",
                "params": [{"tipo": "variavel", "nome": p_nome}],
                "sim": [
                    {"tipo": "atividade", "nome": f"err{c['nome']}",
                     "activity_id": 7, "object_name": "ActNewErrorMessage",
                     "real_name": "ActNewErrorMessage",
                     "description": f"{label} obrigatorio"},
                    {"tipo": "expressao", "nome": f"stop{c['nome']}",
                     "descricao": "Interromper", "funcao": "ebfStopRuleExecution",
                     "nome_amigavel": "Interromper Fluxo",
                     "params": [{"tipo": "constante", "valor": "", "tipo_dado": "Letras"}],
                     "retorno": None, "tipo_retorno": None},
                ],
                "nao": [],
            })
        rules.append({
            "nome": f"Cad{nome_tela.replace(' ', '')} - Antes de Gravar",
            "destino": 1,
            "codigo": codigo_base + 2 if codigo_base else 0,
            "descricao": f"Validar campos obrigatorios de {nome_tela}",
            "categoria": "\\SGFC\\Eventos",
            "parametros": params_gravar,
            "variaveis": [],
            "passos": passos_gravar,
        })

    # Antes de Deletar
    if dep_tabela_filha and dep_campo_fk:
        sr_delete = [{
            "step_name": "verVinculos",
            "rule_name": f"{nome_tela} - Verificar Vinculos [SRV]",
            "params": [{"target_param_name": "pId", "value": {"tipo": "variavel", "nome": f"p{campo_pk}"}}],
            "description": "Verificar vinculos antes de excluir",
        }]
        rules.append(_cli_orchestrator_rule(
            f"Cad{nome_tela.replace(' ', '')} - Antes de Deletar",
            codigo_base + 3 if codigo_base else 0, sr_delete,
            [{"nome": f"p{campo_pk}", "tipo": "Inteiro"}],
        ))

    return rules


def build_conditional_component_rules(
    campos: list[dict],
    nome_tela: str = "",
    codigo_base: int = 0,
) -> list[dict]:
    """Gera regras Ao Modificar para campos condicionais (checkbox/combo que controlam outros)."""
    rules = []
    code = codigo_base

    for c in campos:
        controla = c.get("controla_visibilidade") or c.get("controla_habilitacao")
        if not controla:
            continue

        campo_nome = c.get("nome", "")
        campo_valor_ativo = c.get("valor_ativo", "S")
        campos_controlados = controla if isinstance(controla, list) else [controla]
        limpar_ao_desativar = c.get("limpar_ao_desativar", True)
        tipo_controle = "visibilidade" if c.get("controla_visibilidade") else "habilitacao"
        fn = "ebfFormSetVisible" if tipo_controle == "visibilidade" else "ebfFormSetEnabled"
        fn_amigavel = "Mostrar Componente" if tipo_controle == "visibilidade" else "Habilitar Componente"

        passos = [
            {"tipo": "expressao", "nome": "verificar", "descricao": f"Verificar {campo_nome}",
             "funcao": "isEqual", "nome_amigavel": "Igual?",
             "params": [{"tipo": "variavel", "nome": f"p{campo_nome}"},
                        {"tipo": "constante", "valor": campo_valor_ativo, "tipo_dado": "Letras"}],
             "retorno": "vAtivo", "tipo_retorno": "Logico"},
        ]

        for ctrl in campos_controlados:
            passos.append({
                "tipo": "expressao", "nome": f"ctrl{ctrl}",
                "descricao": f"Controlar {ctrl}", "funcao": fn, "nome_amigavel": fn_amigavel,
                "params": [{"tipo": "constante", "valor": ctrl, "tipo_dado": "Letras"},
                           {"tipo": "variavel", "nome": "vAtivo"}],
                "retorno": None, "tipo_retorno": None,
            })

        if limpar_ao_desativar:
            nao_passos = []
            for ctrl in campos_controlados:
                nao_passos.append({
                    "tipo": "expressao", "nome": f"limpar{ctrl}",
                    "descricao": f"Limpar {ctrl}",
                    "funcao": "ebfFormChangeComponentValue",
                    "nome_amigavel": "Alterar Valor do Componente",
                    "params": [{"tipo": "constante", "valor": ctrl, "tipo_dado": "Letras"},
                               {"tipo": "constante", "valor": "", "tipo_dado": "Letras"}],
                    "retorno": None, "tipo_retorno": None,
                })
            passos.append({
                "tipo": "decisao", "nome": "limparSeDesativou",
                "descricao": "Desativou?", "funcao": "oprNot", "nome_amigavel": "Nao",
                "params": [{"tipo": "variavel", "nome": "vAtivo"}],
                "sim": nao_passos, "nao": [],
            })

        rules.append({
            "nome": f"Cad{nome_tela.replace(' ', '') if nome_tela else 'Form'} - {campo_nome} Ao Modificar",
            "destino": 1,
            "codigo": code,
            "descricao": f"Controlar {tipo_controle} de campos ao modificar {campo_nome}",
            "categoria": "\\SGFC\\Componentes",
            "parametros": [{"nome": f"p{campo_nome}", "tipo": "Letras"}],
            "variaveis": [{"nome": "vAtivo", "tipo": "Logico"}],
            "passos": passos,
        })
        code += 1

    return rules


def build_seed_data_sql(tabela: str, campos: list[dict], num_rows: int = 5) -> list[str]:
    """Gera INSERT statements de exemplo para uma tabela."""
    statements = []
    col_names = [c.get("campo", c.get("nome", "")) for c in campos if c.get("campo")]
    if not col_names:
        return statements

    for i in range(1, num_rows + 1):
        values = []
        for c in campos:
            if not c.get("campo"):
                continue
            campo = c["campo"].upper()
            if c.get("pk") or c.get("identity"):
                continue
            if "NOME" in campo or "TITULO" in campo or "DESCRICAO" in campo:
                values.append(f"'Registro de exemplo {i}'")
            elif "CODIGO" in campo or "SIGLA" in campo:
                values.append(f"'COD{i:03d}'")
            elif "STATUS" in campo or "ATIVO" in campo:
                values.append("'ATIVO'")
            elif "DATA" in campo or "DT_" in campo:
                values.append("CURRENT_DATE")
            elif any(k in campo for k in ("VALOR", "PRECO", "TOTAL", "PERCENTUAL", "ALIQUOTA")):
                values.append(str(round(100.0 * i, 2)))
            elif "BOOLEAN" in c.get("tipo", "").upper() or campo.startswith("FL_"):
                values.append("1" if i % 2 == 0 else "0")
            else:
                values.append(f"'{campo.lower()}_{i}'")

        insert_cols = [cn for cn in col_names if not any(
            cc.get("pk") or cc.get("identity")
            for cc in campos if cc.get("campo") == cn
        )]
        if insert_cols and values:
            stmt = f"INSERT INTO {tabela} ({', '.join(insert_cols)}) VALUES ({', '.join(values)})"
            statements.append(stmt)

    return statements


def generate_all_crud_rules(
    tabela: str,
    campos: list[dict],
    campo_pk: str = "",
    campos_unicos: list[str] | None = None,
    dep_tabela_filha: str = "",
    dep_campo_fk: str = "",
    nome_tela: str = "",
    codigo_base: int = 0,
) -> dict:
    """Gera TODAS as regras de um CRUD: servidor + cliente + mascaras + condicionais.

    Retorna dict com:
      - regras_srv: lista de regras servidor (duplicidade + dependencia)
      - regras_cli: lista de regras cliente (orquestradoras por evento)
      - regra_mascaras: regra de mascaras (ou None)
      - regras_condicionais: regras Ao Modificar para campos condicionais
      - vinculos: lista de {evento, regra_nome, entrada, componente_nome}
    """
    nome_tela = nome_tela or tabela.replace("_", " ").title()
    if not campo_pk:
        for c in campos:
            if c.get("pk"):
                campo_pk = c.get("campo", c["nome"])
                break
        if not campo_pk and campos:
            campo_pk = campos[0].get("campo", campos[0].get("nome", "ID"))

    if campos_unicos is None:
        campos_unicos = []
        for c in campos:
            if c.get("unico") or c.get("unique"):
                campos_unicos.append(c.get("campo", c["nome"]))

    campos_obrigatorios = [c for c in campos if c.get("obrigatorio")]

    regras_srv = build_duplicity_check_rules(
        tabela, campos_unicos, campo_pk, nome_tela, codigo_base,
    )

    regra_dep = None
    if dep_tabela_filha and dep_campo_fk:
        regra_dep = build_dependency_check_rule(
            tabela, dep_tabela_filha, dep_campo_fk, campo_pk, nome_tela,
            codigo_base + len(regras_srv) * 2,
        )
        regras_srv.append(regra_dep)

    regras_cli = build_event_orchestrator_rules(
        tabela, campos_unicos, campo_pk, campos_obrigatorios,
        nome_tela, codigo_base + 100,
        dep_tabela_filha, dep_campo_fk,
    )

    campos_com_mascara = [c for c in campos if c.get("mascara")]
    regra_mascaras = build_mask_client_rule(
        campos_com_mascara, codigo_base + 200,
    ) if campos_com_mascara else None

    regras_condicionais = build_conditional_component_rules(
        campos, nome_tela, codigo_base + 300,
    )

    vinculos = []
    for r in regras_cli:
        nome = r["nome"]
        if "Antes de Inserir" in nome:
            entrada = ";".join(f"p{cu}={cu}" for cu in campos_unicos)
            vinculos.append({"evento": "Antes de Inserir", "regra_nome": nome,
                             "entrada": entrada, "componente_nome": ""})
        elif "Antes de Alterar" in nome:
            entrada = ";".join(f"p{cu}={cu}" for cu in campos_unicos)
            entrada += f";p{campo_pk}={campo_pk}"
            vinculos.append({"evento": "Antes de Alterar", "regra_nome": nome,
                             "entrada": entrada, "componente_nome": ""})
        elif "Antes de Gravar" in nome:
            entrada = ";".join(
                f"p{c.get('campo', c['nome'])}={c['nome']}" for c in campos_obrigatorios
            )
            vinculos.append({"evento": "Antes de Gravar", "regra_nome": nome,
                             "entrada": entrada, "componente_nome": ""})
        elif "Antes de Deletar" in nome:
            vinculos.append({"evento": "Antes de Deletar", "regra_nome": nome,
                             "entrada": f"p{campo_pk}={campo_pk}", "componente_nome": ""})

    if regra_mascaras:
        vinculos.append({"evento": "Ao Entrar", "regra_nome": regra_mascaras["nome"],
                         "entrada": "", "componente_nome": ""})

    for rc in regras_condicionais:
        campo_src = rc["parametros"][0]["nome"].lstrip("p") if rc["parametros"] else ""
        vinculos.append({
            "evento": "Ao Modificar", "regra_nome": rc["nome"],
            "entrada": f"p{campo_src}={campo_src}",
            "componente_nome": campo_src,
        })

    return {
        "regras_srv": regras_srv,
        "regras_cli": regras_cli,
        "regra_mascaras": regra_mascaras,
        "regras_condicionais": regras_condicionais,
        "vinculos": vinculos,
    }

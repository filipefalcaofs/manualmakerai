"""
SGFC Layout Engine — Gera spec JSON completa para gerar_tela_completa
a partir de uma spec simplificada com secoes e col-md.

Aplica automaticamente as formulas de posicionamento do PADRAO_DESIGN_SGFC.md:
- Cards com header e icone Font Awesome
- Campos posicionados com grid Bootstrap 12 colunas
- Altura dos cards calculada pelo conteudo
- Y dos cards acumulado sequencialmente
- CSS premium com dark mode

Uso:
    from layout_engine import gerar_spec_completa
    spec = gerar_spec_completa(spec_simplificada)
    # spec e o JSON pronto para passar ao MCP gerar_tela_completa
"""

import json
import math

# --- CONSTANTES DO SISTEMA DE LAYOUT ---
# O Maker renderiza um label (~20px) ACIMA de cada campo.
# FIELD_ROW_HEIGHT deve incluir: label(20) + input(33) + gap(17) = 70

FORM_WIDTH = 1100
FORM_MARGIN = 16
CARD_WIDTH = 1060
CARD_PADDING = 16
CARD_INNER_WIDTH = 1028
HEADER_HEIGHT = 40
HEADER_LABEL_X = 10
HEADER_LABEL_Y = 5
HEADER_LABEL_H = 30
LABEL_HEIGHT = 20
FIELD_HEIGHT = 33
FIELD_GAP_V = 37
FIELD_ROW_HEIGHT = 70
FIELD_GAP_H = 14
FIELD_FIRST_Y = 80
MEMO_HEIGHT = 80
GRID_HEIGHT = 250
BUTTON_HEIGHT = 40
TITLE_Y = 10
TITLE_HEIGHT = 60
FIRST_CARD_Y = 85
CARD_GAP = 15

CSS_PREMIUM = (
    ".page-title{margin-bottom:1.5rem}"
    ".page-title h4{margin:0;font-size:1.25rem;font-weight:600;"
    "color:var(--bs-emphasis-color);letter-spacing:-0.01em}"
    ".page-title p{margin:0.25rem 0 0;font-size:0.875rem;"
    "color:var(--bs-muted-color);font-weight:400}"
    ".card-section-header{display:flex;align-items:center;gap:0.5rem;"
    "font-size:0.8125rem;font-weight:600;text-transform:uppercase;"
    "letter-spacing:0.05em;color:var(--bs-primary);"
    "padding:0.875rem 1.25rem;"
    "background:linear-gradient(to right,rgba(var(--bs-tertiary-rgb),0.7),"
    "var(--webrun-components-bg));"
    "border-bottom:1px solid var(--bs-border-color)}"
    ".card-section-header i{font-size:0.875rem;opacity:0.8}"
)


def _tipo_componente(campo):
    return campo.get("tipo", "E")


def _eh_memo(campo):
    return _tipo_componente(campo) == "M"


def _eh_grade(campo):
    return _tipo_componente(campo) == "G"


def _eh_botao(campo):
    return _tipo_componente(campo) == "B"


def _altura_campo(campo):
    if _eh_memo(campo):
        return campo.get("altura", MEMO_HEIGHT)
    if _eh_grade(campo):
        return campo.get("altura", GRID_HEIGHT)
    if _eh_botao(campo):
        return BUTTON_HEIGHT
    return FIELD_HEIGHT


def _distribuir_campos_em_linhas(campos):
    """Agrupa campos em linhas baseado na soma dos col-md (max 12 por linha)."""
    linhas = []
    linha_atual = []
    soma_col = 0

    for campo in campos:
        col = campo.get("col", 12)
        if soma_col + col > 12 and linha_atual:
            linhas.append(linha_atual)
            linha_atual = []
            soma_col = 0
        linha_atual.append(campo)
        soma_col += col

    if linha_atual:
        linhas.append(linha_atual)

    return linhas


def _calcular_x_w_linha(campos_na_linha):
    """Calcula X e W para cada campo na linha usando grid 12 colunas.
    Sempre usa base 12 para manter proporcionalidade mesmo que a soma
    dos col-md na linha seja menor que 12."""
    num_gaps = len(campos_na_linha) - 1
    espaco_disponivel = CARD_INNER_WIDTH - (num_gaps * FIELD_GAP_H)
    col_unit = espaco_disponivel / 12

    resultado = []
    x_acumulado = CARD_PADDING

    for i, campo in enumerate(campos_na_linha):
        col = campo.get("col", 12)
        w = round(col_unit * col)

        if i == len(campos_na_linha) - 1:
            total_col = sum(c.get("col", 12) for c in campos_na_linha)
            if total_col == 12:
                w = CARD_PADDING + CARD_INNER_WIDTH - x_acumulado

        resultado.append({"x": x_acumulado, "w": w})
        x_acumulado += w + FIELD_GAP_H

    return resultado


def _calcular_altura_card(linhas):
    """Calcula altura total do card baseado nas linhas de campos.
    Cada linha ocupa label(20px) + input(h) + gap(17px) = FIELD_ROW_HEIGHT para campos normais."""
    altura = FIELD_FIRST_Y

    for linha in linhas:
        altura_max_na_linha = FIELD_ROW_HEIGHT
        for campo in linha:
            if _eh_memo(campo):
                h = LABEL_HEIGHT + campo.get("altura", MEMO_HEIGHT) + 17
                altura_max_na_linha = max(altura_max_na_linha, h)
            elif _eh_grade(campo):
                h = LABEL_HEIGHT + campo.get("altura", GRID_HEIGHT) + 17
                altura_max_na_linha = max(altura_max_na_linha, h)
            elif _eh_botao(campo):
                h = BUTTON_HEIGHT + 17
                altura_max_na_linha = max(altura_max_na_linha, h)
        altura += altura_max_na_linha

    altura += 15
    return altura


def _gerar_componentes_secao(secao, aba, card_y, id_counter):
    """Gera todos os componentes de uma secao (card + header + label + campos)."""
    componentes = []
    nome_secao = secao["nome"].replace(" ", "")
    nome_container = f"container{nome_secao}"
    nome_header = f"container{nome_secao}Hdr"
    nome_label = f"lbl{nome_secao}"
    icone = secao.get("icone", "fa-id-card")

    campos = secao.get("campos", [])
    linhas = _distribuir_campos_em_linhas(campos)
    card_h = _calcular_altura_card(linhas)

    componentes.append({
        "nome": nome_container,
        "tipo": "P",
        "campo": "",
        "descricao": "",
        "aba": aba,
        "posicao_x": FORM_MARGIN,
        "posicao_y": card_y,
        "tamanho": CARD_WIDTH,
        "altura": card_h,
        "properties": {"NomeClasseCss": "form-group card shadow-lg overflow-hidden border-0"}
    })

    componentes.append({
        "nome": nome_header,
        "tipo": "P",
        "campo": "",
        "descricao": "",
        "aba": aba,
        "container": nome_container,
        "posicao_x": 0,
        "posicao_y": 0,
        "tamanho": CARD_WIDTH,
        "altura": HEADER_HEIGHT,
        "properties": {"NomeClasseCss": "form-group card-section-header"}
    })

    componentes.append({
        "nome": nome_label,
        "tipo": "L",
        "campo": "",
        "descricao": (
            f"<i class='fa-solid {icone}'></i> {secao['nome']}"
        ),
        "aba": aba,
        "container": nome_header,
        "posicao_x": HEADER_LABEL_X,
        "posicao_y": HEADER_LABEL_Y,
        "tamanho": 400,
        "altura": HEADER_LABEL_H,
        "properties": {}
    })

    y_acumulado = FIELD_FIRST_Y

    for linha in linhas:
        posicoes = _calcular_x_w_linha(linha)
        altura_max_na_linha = FIELD_ROW_HEIGHT

        for i, campo in enumerate(linha):
            h = _altura_campo(campo)
            comp = {
                "nome": campo["nome"],
                "tipo": _tipo_componente(campo),
                "campo": campo.get("campo", ""),
                "descricao": campo.get("descricao", campo["nome"]),
                "aba": aba,
                "container": nome_container,
                "posicao_x": posicoes[i]["x"],
                "posicao_y": y_acumulado,
                "tamanho": posicoes[i]["w"],
                "altura": h,
                "properties": {}
            }

            props = comp["properties"]
            col = campo.get("col", 12)
            props["NomeClasseCss"] = f"form-group col-md-{col}"

            if campo.get("obrigatorio"):
                props["Obrigatorio"] = "TRUE"
            if campo.get("placeholder"):
                props["Placeholder"] = campo["placeholder"]
            if campo.get("mascara"):
                props["Tipo"] = campo["mascara"]
            if campo.get("somente_leitura"):
                props["ApenasLeitura"] = "True"

            if _tipo_componente(campo) == "C":
                if campo.get("lista"):
                    props["Lista"] = campo["lista"]
                if campo.get("valores"):
                    props["Valores"] = campo["valores"]

            if _tipo_componente(campo) == "K":
                if campo.get("sql"):
                    props["SQL"] = campo["sql"]
                if campo.get("campo_chave"):
                    props["CampoChave"] = campo["campo_chave"]
                if campo.get("campo_lista"):
                    props["CampoLista"] = campo["campo_lista"]
                if campo.get("busca_incremental"):
                    props["BuscaIncremental"] = "True"

            if _tipo_componente(campo) == "M":
                if campo.get("texto_rico"):
                    props["TextoRico"] = "True"

            if _tipo_componente(campo) == "G":
                if campo.get("colunas"):
                    props["Colunas"] = campo["colunas"]
                if campo.get("parametros"):
                    props["Parametros"] = campo["parametros"]
                if campo.get("place_holder"):
                    props["PlaceHolder"] = campo["place_holder"]
                props["ApenasLeitura"] = campo.get("apenas_leitura", "True")
                props["Paginacao"] = str(campo.get("paginacao", 20))
                props["GradeHabilitarColunaNumerica"] = "True"
                props["PermiteOrdenacao"] = "True"
                props["EnableGridExport"] = "True"

            if _tipo_componente(campo) == "B":
                if campo.get("classe_css"):
                    props["NomeClasseCss"] = campo["classe_css"]
                if campo.get("imagem"):
                    props["Imagem"] = campo["imagem"]

            if campo.get("eventos"):
                comp["eventos"] = campo["eventos"]

            extra_props = campo.get("properties", {})
            props.update(extra_props)

            componentes.append(comp)

            if _eh_memo(campo):
                h_total = LABEL_HEIGHT + campo.get("altura", MEMO_HEIGHT) + 17
                altura_max_na_linha = max(altura_max_na_linha, h_total)
            elif _eh_grade(campo):
                h_total = LABEL_HEIGHT + campo.get("altura", GRID_HEIGHT) + 17
                altura_max_na_linha = max(altura_max_na_linha, h_total)
            elif _eh_botao(campo):
                h_total = BUTTON_HEIGHT + 17
                altura_max_na_linha = max(altura_max_na_linha, h_total)

        y_acumulado += altura_max_na_linha

    return componentes, card_h


def gerar_spec_completa(spec):
    """
    Recebe spec simplificada e retorna JSON completo para gerar_tela_completa.

    Spec simplificada:
    {
        "titulo": "Nome da Tela",
        "icone": "fa-file-alt",
        "subtitulo": "Descricao breve",
        "tabela": "NOME_TABELA",
        "campo_chave": "ID_CAMPO",
        "sql_select": "SELECT * FROM ...",
        "sql_update": "CAMPO1\\nCAMPO2",
        "campos_grade": "CAMPO1;CAMPO2",
        "campos_pesquisa": "CAMPO1;CAMPO2",
        "codigo": 1000,
        "sistema": "SGFC",
        "eventos": { ... },
        "css_extra": "",
        "abas": [
            {
                "nome": "01-Cadastro",
                "tem_titulo": true,
                "secoes": [
                    {
                        "nome": "Identificacao",
                        "icone": "fa-id-card",
                        "campos": [
                            {
                                "nome": "edtNome",
                                "campo": "COLUNA_BANCO",
                                "descricao": "Label",
                                "tipo": "E",          (E/C/K/M/H/G/B/L)
                                "col": 8,              (col-md-N)
                                "obrigatorio": true,
                                "placeholder": "...",
                                "mascara": "CPF",
                                "somente_leitura": false,
                                "lista": "Op1\\r\\nOp2",  (para combos)
                                "valores": "V1\\r\\nV2",   (para combos)
                                "eventos": { ... }
                            }
                        ]
                    }
                ]
            }
        ]
    }
    """
    titulo = spec.get("titulo", "Formulario")
    icone = spec.get("icone", "fa-plus-circle")
    subtitulo = spec.get("subtitulo", "")
    css_extra = spec.get("css_extra", "")

    todos_componentes = []
    altura_max_form = 0

    for aba_spec in spec.get("abas", []):
        aba_nome = aba_spec["nome"]
        secoes = aba_spec.get("secoes", [])
        tem_titulo = aba_spec.get("tem_titulo", aba_nome == spec["abas"][0]["nome"])

        if tem_titulo:
            card_y = FIRST_CARD_Y
            todos_componentes.append({
                "nome": f"lblTitulo{aba_nome.replace('-', '').replace(' ', '')}",
                "tipo": "L",
                "campo": "",
                "descricao": (
                    f"<div class='page-title'>"
                    f"<h4>{titulo}</h4>"
                    f"<p>{subtitulo}</p></div>"
                ),
                "aba": aba_nome,
                "posicao_x": FORM_MARGIN,
                "posicao_y": TITLE_Y,
                "tamanho": CARD_WIDTH,
                "altura": TITLE_HEIGHT,
                "properties": {"NomeClasseCss": "form-group"}
            })
        else:
            card_y = 10

        for secao in secoes:
            comps, card_h = _gerar_componentes_secao(secao, aba_nome, card_y, 0)
            todos_componentes.extend(comps)
            card_y += card_h + CARD_GAP

        altura_max_form = max(altura_max_form, card_y + 20)

    formulario = {
        "descricao": titulo,
        "tabela": spec.get("tabela", ""),
        "campo_chave": spec.get("campo_chave", ""),
        "sql_select": spec.get("sql_select", ""),
        "tamanho": FORM_WIDTH,
        "altura": altura_max_form,
        "navegacao": spec.get("navegacao", True),
        "abas": True,
        "responsivo": True,
        "aba_localizar": spec.get("aba_localizar", True),
        "editar_duplo_clique": spec.get("editar_duplo_clique", True),
        "barra_rolagem": True,
        "codigo": spec.get("codigo", 9000),
        "sistema": spec.get("sistema", "SGFC"),
        "categoria": 0,
        "css": CSS_PREMIUM + css_extra,
        "campos": todos_componentes,
    }

    if spec.get("sql_update"):
        formulario["sql_update"] = spec["sql_update"]
    if spec.get("campos_grade"):
        formulario["campos_grade"] = spec["campos_grade"]
    if spec.get("campos_pesquisa"):
        formulario["campos_pesquisa"] = spec["campos_pesquisa"]
    if spec.get("eventos"):
        formulario["eventos"] = spec["eventos"]

    return {"formulario": formulario}


def gerar_json(spec):
    """Retorna o JSON como string pronta para passar ao MCP."""
    return json.dumps(gerar_spec_completa(spec), ensure_ascii=False)


# --- CLI: python layout_engine.py spec.json output.json ---
if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Uso: python layout_engine.py <spec.json> [output.json]")
        print("  spec.json: arquivo com spec simplificada")
        print("  output.json: arquivo de saida (opcional, imprime no stdout se omitido)")
        sys.exit(1)

    with open(sys.argv[1], "r", encoding="utf-8") as f:
        spec = json.load(f)

    resultado = gerar_spec_completa(spec)

    if len(sys.argv) >= 3:
        with open(sys.argv[2], "w", encoding="utf-8") as f:
            json.dump(resultado, f, ensure_ascii=False, indent=2)
        print(f"Spec gerada em: {sys.argv[2]}")
    else:
        print(json.dumps(resultado, ensure_ascii=False, indent=2))

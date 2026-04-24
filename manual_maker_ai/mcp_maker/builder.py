"""Builders para geracao de FRZ: DFM, Script XML, formularios e empacotamento.

Recebe especificacoes de alto nivel (dicts/dataclasses) e produz strings
DFM/XML prontas para encoding base64 e empacotamento em .frz.
"""

from __future__ import annotations

import uuid
from dataclasses import dataclass, field
from datetime import datetime
from typing import Any

from .encoder import (
    encode_dfm_b64,
    encode_script_b64,
    write_frz,
    xml_escape_attr,
    xml_escape_content,
    xml_space,
)

# ---------------------------------------------------------------------------
# Constantes
# ---------------------------------------------------------------------------

_FONT_BLOCK = """\
    Font.Charset = DEFAULT_CHARSET
    Font.Color = {font_color}
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [{font_style}]
    ParentFont = False"""

_CONSTRAINTS_FULL = """\
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9"""

_CONSTRAINTS_LINE = """\
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9"""

_MKR_VERSION = "5.0.0.33"

# ---------------------------------------------------------------------------
# Tipos de parametro para passos
# ---------------------------------------------------------------------------

@dataclass
class ParamVariable:
    nome: str
    tipo_dado: str = "Variante"

@dataclass
class ParamConstant:
    valor: str | None
    tipo_dado: str = "Letras"
    guid: str = ""

    @property
    def is_null(self) -> bool:
        return self.valor is None

@dataclass
class ParamSQL:
    sql: str
    binds: list[dict[str, str]] = field(default_factory=list)

@dataclass
class ParamFunction:
    """Funcao aninhada como parametro de outra funcao."""
    funcao: str
    nome_amigavel: str
    params: list[Any] = field(default_factory=list)
    tipo_retorno: str = "Variante"


StepParam = ParamVariable | ParamConstant | ParamSQL | ParamFunction

# ---------------------------------------------------------------------------
# Passos do fluxograma
# ---------------------------------------------------------------------------

@dataclass
class StepExpression:
    nome: str
    descricao: str
    funcao: str
    nome_amigavel: str
    params: list[StepParam] = field(default_factory=list)
    retorno: str = ""
    tipo_retorno: str = "Variante"

@dataclass
class StepDecision:
    nome: str
    descricao: str
    funcao: str
    nome_amigavel: str
    params: list[StepParam] = field(default_factory=list)
    sim: list[Any] = field(default_factory=list)
    nao: list[Any] = field(default_factory=list)
    loop: bool = False

@dataclass
class SubRoutineParam:
    """Parametro passado a uma sub-rotina: nome no destino + valor."""
    target_param_name: str
    value: StepParam

@dataclass
class StepSubRoutine:
    """Passo que chama outra regra como sub-rotina (TFlowSubRoutine/CALLRULE)."""
    nome: str
    rule_name: str
    rule_id: int
    params: list[SubRoutineParam] = field(default_factory=list)
    return_var: str = ""
    description: str = ""

@dataclass
class StepActivity:
    """Passo de atividade nativa (TFlowActivity) como ActNewErrorMessage. Componente terminal."""
    nome: str
    activity_id: int
    object_name: str
    real_name: str
    params: list[SubRoutineParam] = field(default_factory=list)
    description: str = ""

Step = StepExpression | StepDecision | StepSubRoutine | StepActivity

# ---------------------------------------------------------------------------
# Especificacao de regra
# ---------------------------------------------------------------------------

@dataclass
class RuleParam:
    nome: str
    tipo: str
    tamanho: str = ""

@dataclass
class RuleVar:
    nome: str
    tipo: str
    tamanho: str = ""

@dataclass
class RuleSpec:
    nome: str
    destino: int  # 1=cliente, 2=servidor
    passos: list[Step]
    parametros: list[RuleParam] = field(default_factory=list)
    variaveis: list[RuleVar] = field(default_factory=list)
    retorno_tipo: str = ""
    codigo: int = 50
    categoria: str = r"\Uso Geral"
    descricao: str = ""

# ---------------------------------------------------------------------------
# Especificacao de formulario e tabela
# ---------------------------------------------------------------------------

@dataclass
class EventBinding:
    """Vinculacao de evento a regra com parametros de entrada opcionais."""
    rule_name: str
    entrada: str = ""

@dataclass
class TableField:
    """Campo de tabela para secao <global><tables>."""
    nome: str
    descricao: str = ""
    tipo: str = ""
    valor_padrao: str = ""

@dataclass
class TableSpec:
    """Definicao de tabela para o FRZ."""
    nome: str
    descricao: str = ""
    campos: list[TableField] = field(default_factory=list)


# ---------------------------------------------------------------------------
# ENTITY_SCHEMA — Definicao de tabelas (DDL)
# ---------------------------------------------------------------------------

@dataclass
class EntityAttribute:
    """Coluna de uma entidade no ENTITY_SCHEMA."""
    nome: str
    tipo: str = "string"
    tamanho: int = 0
    nullable: bool = True
    generated: bool = False
    default: str = ""
    mascara: str = ""
    friendly_name: str = ""

    @property
    def _friendly(self) -> str:
        return self.friendly_name or self.nome


@dataclass
class EntityKey:
    """Chave primaria ou unica de uma entidade."""
    nome: str
    colunas: list[str] = field(default_factory=list)
    primary: bool = True
    unique: bool = False


@dataclass
class EntitySpec:
    """Definicao completa de uma entidade (tabela) no ENTITY_SCHEMA."""
    nome: str
    atributos: list[EntityAttribute] = field(default_factory=list)
    chaves: list[EntityKey] = field(default_factory=list)
    friendly_name: str = ""
    form: str = ""

    @property
    def _friendly(self) -> str:
        return self.friendly_name or self.nome

    @property
    def _form(self) -> str:
        return self.form or self.nome.lower()


# ---------------------------------------------------------------------------
# Datapackets — Dados iniciais (seed/DML)
# ---------------------------------------------------------------------------

@dataclass
class DataRow:
    """Uma linha de dados para um datapacket."""
    campos: dict[str, str | None] = field(default_factory=dict)


@dataclass
class DataPacketSpec:
    """Pacote de dados iniciais para uma entidade."""
    entity_name: str
    linhas: list[DataRow] = field(default_factory=list)
    guid: str = ""
    friendly_name: str = ""
    form: str = ""
    atributos: list[EntityAttribute] | None = None

@dataclass
class FormField:
    nome: str
    tipo: str  # E, C, K, L, P, G, B, M, H, R, I, A, V, D, W
    campo: str = ""
    descricao: str = ""
    aba: str = "01-Cadastro"
    container: str = ""
    posicao_x: int = 16
    posicao_y: int = 0
    tamanho: int = 321
    altura: int = 35
    properties: dict[str, str] = field(default_factory=dict)
    eventos: dict[str, list[EventBinding]] = field(default_factory=dict)

@dataclass
class FormSpec:
    descricao: str
    tabela: str
    campo_chave: str
    sql_select: str
    tamanho: int = 1100
    altura: int = 700
    campos: list[FormField] = field(default_factory=list)
    sql_update: str = ""
    campos_grade: str = ""
    campos_pesquisa: str = ""
    sql_default: str = ""
    sql_mascara: str = ""
    css: str = ""
    codigo: int = 9000
    guid: str = ""
    sistema: str = "SISTEMA"
    eventos_form: dict[str, list[EventBinding]] = field(default_factory=dict)
    navegacao: bool = True
    abas: bool = True
    responsivo: bool = True
    aba_localizar: bool = True
    editar_duplo_clique: bool = True
    barra_rolagem: bool = True
    categoria: int = 0

# ---------------------------------------------------------------------------
# Expression / DiagramXml builders
# ---------------------------------------------------------------------------

def _build_param_expression_xml(p: StepParam) -> str:
    """Gera XML de um parametro para a property Expression."""
    if isinstance(p, ParamVariable):
        return f'<VARIABLE NAME="{p.nome}"/>'
    elif isinstance(p, ParamConstant):
        null = "TRUE" if p.is_null else "FALSE"
        val = "" if p.is_null else xml_escape_content(p.valor or "")
        guid_attr = f' GUID = "{p.guid}"' if p.guid else ""
        return f'<CONSTANT TYPE="{p.tipo_dado}" NULL="{null}" {guid_attr} >{val}</CONSTANT>'
    elif isinstance(p, ParamSQL):
        sql_escaped = p.sql.replace(" ", "&#x20;")
        binds_xml = ""
        for b in p.binds:
            binds_xml += f'\n<DEFINE NAME="{b["nome"]}">\n<VARIABLE NAME="{b["variavel"]}"/>\n</DEFINE>'
        return (
            f'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ><PSQL>\n'
            f'<COMMAND>\n{sql_escaped}\n\n\n/*WHERE_ADD*/\n/*ORDER_NEW*/\n</COMMAND>\n'
            f'<PARAMS>{binds_xml}\n</PARAMS>\n</PSQL>\n</CONSTANT>'
        )
    elif isinstance(p, ParamFunction):
        inner_params = "\n".join(_build_param_expression_xml(sp) for sp in p.params)
        return (
            f'<FUNCTION NAME="{xml_space(p.nome_amigavel)}" REALNAME="{p.funcao}">\n'
            f'<PARAMS>\n{inner_params}\n</PARAMS>\n</FUNCTION>'
        )
    return ""


def build_expression_xml(funcao: str, nome_amigavel: str, params: list[StepParam]) -> str:
    """Gera conteudo da property Expression do DFM."""
    params_xml = "\n".join(_build_param_expression_xml(p) for p in params)
    if params:
        return (
            f'<FUNCTION NAME="{xml_space(nome_amigavel)}" REALNAME="{funcao}">\n'
            f'<PARAMS>\n{params_xml}\n</PARAMS>\n</FUNCTION>'
        )
    return f'<FUNCTION NAME="{xml_space(nome_amigavel)}" REALNAME="{funcao}">\n</FUNCTION>'


def _build_sql_bind_diagram_b64(var_name: str) -> str:
    """Gera base64 do DiagramXml de um bind de SQL (variavel dentro de DEFINE)."""
    import base64 as _b64
    xml = (
        f'<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<ROOT>\r\n'
        f'<TObjVariable>\r\n<ID>0</ID>\r\n<NOME>VARIABLE</NOME>\r\n'
        f'<TEXT>{var_name}</TEXT>\r\n<SQL>FALSE</SQL>\r\n'
        f'<TIPO>Variante</TIPO>\r\n<INCOMPATIVEL>FALSE</INCOMPATIVEL>\r\n'
        f'<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\r\n'
        f'</TObjVariable>\r\n</ROOT>\r\n'
    )
    return _b64.b64encode(xml.encode("iso-8859-1")).decode("ascii")


def _build_param_diagram_xml(p: StepParam, id_counter: list[int]) -> str:
    """Gera XML de um parametro para DiagramXml."""
    cid = id_counter[0]
    id_counter[0] += 1

    if isinstance(p, ParamVariable):
        tipo = p.tipo_dado
        return (
            f'<TObjVariable>\n<ID>{cid}</ID>\n<NOME>VARIABLE</NOME>\n'
            f'<TEXT>{p.nome}</TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{tipo}</TIPO>\n'
            f'<INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\n'
            f'</TObjVariable>'
        )
    elif isinstance(p, ParamConstant):
        null = "TRUE" if p.is_null else "FALSE"
        val = "" if p.is_null else xml_escape_content(p.valor or "")
        guid_val = p.guid if p.guid else ""
        return (
            f'<TObjConst>\n<ID>{cid}</ID>\n<NOME>CONSTANT</NOME>\n'
            f'<TEXT></TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{p.tipo_dado}</TIPO>\n'
            f'<INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\n'
            f'<VALOR>{val}</VALOR>\n<DMLTYPE>dtSelect</DMLTYPE>\n'
            f'<DIAGRAMXML></DIAGRAMXML>\n<NULO>{null}</NULO>\n'
            f'<FIELDINDEX>-1</FIELDINDEX>\n<GUID>{guid_val}</GUID>\n'
            f'<SPECIALCODE></SPECIALCODE>\n</TObjConst>'
        )
    elif isinstance(p, ParamSQL):
        sql_escaped = p.sql.replace(" ", "&#x20;")
        binds_diag = ""
        for b in p.binds:
            var_name = b["variavel"]
            bind_name = b["nome"]
            inner_b64 = _build_sql_bind_diagram_b64(var_name)
            binds_diag += (
                f'\n<DEFINE NAME="{bind_name}">\n'
                f'<VALOR>\n@{var_name}\n</VALOR>\n'
                f'<DIAGRAMXML>\n{inner_b64}\n</DIAGRAMXML>\n'
                f'<EXPRESSION>\n<VARIABLE NAME="{var_name}"/>\n</EXPRESSION>\n'
                f'</DEFINE>'
            )
        psql_valor = (
            f'<PSQL>\n<COMMAND>\n{sql_escaped}\n\n/*WHERE_ADD*/\n/*ORDER_NEW*/\n</COMMAND>\n'
            f'<PARAMS>{binds_diag}\n</PARAMS>\n</PSQL>'
        )
        sql_diagram_content = (
            f'<?xml version="1.0" encoding="ISO-8859-1"?>\n<ROOT>\n'
            f'<SQL>\n{sql_escaped}\n</SQL>\n\n'
            f'<PARAMS>{binds_diag}\n</PARAMS>\n</ROOT>\n'
        )
        import base64 as _b64
        diag_b64 = _b64.b64encode(
            sql_diagram_content.replace("\n", "\r\n").encode("iso-8859-1")
        ).decode("ascii")
        return (
            f'<TObjConst>\n<ID>{cid}</ID>\n<NOME>CONSTANT</NOME>\n'
            f'<TEXT></TEXT>\n<SQL>FALSE</SQL>\n<TIPO>SQL&#x20;Consulta</TIPO>\n'
            f'<INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\n'
            f'<VALOR>{psql_valor}</VALOR>\n<DMLTYPE>dtSelect</DMLTYPE>\n'
            f'<DIAGRAMXML>{diag_b64}</DIAGRAMXML>\n<NULO>FALSE</NULO>\n'
            f'<FIELDINDEX>-1</FIELDINDEX>\n<GUID></GUID>\n'
            f'<SPECIALCODE></SPECIALCODE>\n</TObjConst>'
        )
    elif isinstance(p, ParamFunction):
        inner = "\n".join(_build_param_diagram_xml(sp, id_counter) for sp in p.params)
        return (
            f'<TObjFunction>\n<ID>{cid}</ID>\n<NOME>FUNCTION</NOME>\n'
            f'<TEXT>{p.funcao}</TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{p.tipo_retorno}</TIPO>\n'
            f'<INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\n'
            f'<PARAMS>\n{inner}\n</PARAMS>\n</TObjFunction>'
        )
    return ""


def build_diagram_xml(funcao: str, tipo_retorno: str, params: list[StepParam]) -> str:
    """Gera conteudo da property DiagramXml do DFM."""
    id_counter = [0]
    func_id = id_counter[0]
    id_counter[0] += 1

    inner = "\n".join(_build_param_diagram_xml(p, id_counter) for p in params)
    params_block = f"\n<PARAMS>\n{inner}\n</PARAMS>" if params else ""

    return (
        f'<?xml version="1.0" encoding="ISO-8859-1"?>\n<ROOT>\n'
        f'<TObjFunction>\n<ID>{func_id}</ID>\n<NOME>FUNCTION</NOME>\n'
        f'<TEXT>{funcao}</TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{tipo_retorno}</TIPO>\n'
        f'<INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>'
        f'{params_block}\n</TObjFunction>\n</ROOT>\n'
    )


def _delphi_inline(xml: str) -> str:
    """Converte XML multiline em string Delphi com #13#10 para CRLF.

    Gera a string flat e depois re-quebra no limite de ~68 caracteres
    por linha, como o Maker real faz (quebrando inclusive no meio do
    conteudo texto quando necessario).
    """
    lines = xml.replace("\r\n", "\n").split("\n")
    segments: list[str] = []
    for i, line in enumerate(lines):
        encoded = _encode_delphi_inline(line)
        seg = f"'{encoded}'" if encoded else "''"
        if i < len(lines) - 1:
            seg += "#13#10"
        segments.append(seg)

    flat = "".join(segments)
    return _rewrap_delphi(flat)


_DELPHI_TOKEN_RE = __import__("re").compile(r"'[^']*(?:''[^']*)*'|#\d+")


def _rewrap_delphi(s: str, max_line: int = 68) -> str:
    """Re-quebra string Delphi flat em linhas de ~max_line caracteres.

    Tokeniza com regex em literais ('...') e codigos (#NNN),
    depois remonta com quebras de linha. Strings longas demais
    sao divididas internamente com fecha/abre aspas.
    """
    if len(s) <= max_line:
        return s

    tokens = _DELPHI_TOKEN_RE.findall(s)
    if not tokens:
        return s

    out: list[str] = []
    line_len = 0
    joiner = " +\n      "

    for token in tokens:
        tlen = len(token)

        if token[0] == "#":
            if line_len + tlen > max_line and line_len > 0:
                out.append(joiner)
                line_len = 0
            out.append(token)
            line_len += tlen

        elif line_len + tlen <= max_line:
            out.append(token)
            line_len += tlen

        elif tlen <= max_line:
            if line_len > 0:
                out.append(joiner)
                line_len = 0
            out.append(token)
            line_len = tlen

        else:
            inner = token[1:-1]
            if line_len > 0 and line_len >= max_line:
                out.append(joiner)
                line_len = 0

            out.append("'")
            line_len += 1
            i = 0
            n = len(inner)
            seg_start = 0

            while i < n:
                if inner[i] == "'" and i + 1 < n and inner[i + 1] == "'":
                    i += 2
                    line_len += 2
                else:
                    i += 1
                    line_len += 1

                if line_len >= max_line and i < n:
                    out.append(inner[seg_start:i])
                    out.append("'")
                    out.append(joiner)
                    out.append("'")
                    line_len = 1
                    seg_start = i

            if seg_start < n:
                out.append(inner[seg_start:])
            out.append("'")
            line_len += 1

        if line_len >= max_line:
            pass

    return "".join(out)


def _encode_delphi_inline(text: str) -> str:
    """Escapa caracteres para string Delphi inline, preservando XML."""
    result: list[str] = []
    i = 0
    while i < len(text):
        ch = text[i]
        code = _DELPHI_CHAR_MAP_INLINE.get(ch)
        if code:
            result.append(f"'{code}'")
        elif ch == "'":
            result.append("'#39'")
        else:
            result.append(ch)
        i += 1
    return "".join(result)


_DELPHI_CHAR_MAP_INLINE: dict[str, str] = {
    "á": "#225", "à": "#224", "â": "#226", "ã": "#227",
    "é": "#233", "è": "#232", "ê": "#234",
    "í": "#237", "ì": "#236",
    "ó": "#243", "ò": "#242", "ô": "#244", "õ": "#245",
    "ú": "#250", "ù": "#249", "û": "#251",
    "ç": "#231", "Ç": "#199",
    "Á": "#193", "À": "#192", "Â": "#194", "Ã": "#195",
    "É": "#201", "È": "#200", "Ê": "#202",
    "Í": "#205", "Ì": "#204",
    "Ó": "#211", "Ò": "#210", "Ô": "#212", "Õ": "#213",
    "Ú": "#218", "Ù": "#217", "Û": "#219",
    "ñ": "#241", "Ñ": "#209",
    "ü": "#252", "Ü": "#220",
}


def _wrap_delphi_long_string(s: str, max_line: int = 70) -> str:
    """Quebra string Delphi longa em multiplas linhas com ' + '."""
    if len(s) <= max_line:
        return s
    lines: list[str] = []
    while s:
        if len(s) <= max_line:
            lines.append(s)
            break
        cut = max_line
        safe = s.rfind("'", 0, cut)
        if safe > 10:
            cut = safe + 1
        lines.append(s[:cut])
        s = s[cut:]
    return (" +\n    ").join(lines)


def _build_text_prop(funcao: str, nome_amigavel: str, params: list[StepParam], retorno: str = "") -> str:
    """Gera o valor da property Text do DFM (representacao legivel da funcao)."""
    parts: list[str] = []
    for p in params:
        if isinstance(p, ParamVariable):
            parts.append(f"@{p.nome}")
        elif isinstance(p, ParamConstant):
            if p.is_null:
                parts.append(f"{p.tipo_dado}")
            else:
                parts.append(p.valor or "")
        elif isinstance(p, ParamSQL):
            parts.append("SQL CONSULTA")
        elif isinstance(p, ParamFunction):
            parts.append(f"{p.nome_amigavel}(...)")
    args = ", ".join(parts)
    return f"{nome_amigavel}({args})"

# ---------------------------------------------------------------------------
# Geracao de componentes DFM individuais
# ---------------------------------------------------------------------------

def _font_block(color: str = "clBlack", style: str = "") -> str:
    return _FONT_BLOCK.format(font_color=color, font_style=style)


def _dfm_flow_start(
    name: str,
    left: int, top: int,
    output_names: str,
    variables_str: str = "",
    input_params_str: str = "",
    description: str = "Inicio",
) -> str:
    desc = _to_delphi_prop(description)
    params_prop = ""
    if input_params_str:
        params_prop = f"    InputParams = {_to_delphi_prop(input_params_str)}\n"
    vars_prop = ""
    if variables_str:
        vars_prop = f"    Variables =\n      {_to_delphi_prop(variables_str)}\n"
    return (
        f"  object {name}: TFlowStart\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 38\n    Height = 38\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block('clWhite', 'fsBold')}\n"
        f"    ChangeDescription = False\n"
        f"    OutputNames = '{output_names}'\n"
        f"    Description = {desc}\n"
        f"{params_prop}"
        f"{vars_prop}"
        f"    WorkFormCod = -1\n"
        f"  end"
    )


def _dfm_flow_end(
    name: str,
    left: int, top: int,
    input_names: str,
    return_var: str = "",
    return_type: str = "",
) -> str:
    diagram = ""
    expression = ""
    text_prop = ""
    output_param = ""
    if return_var:
        diagram_xml = (
            f'<?xml version="1.0" encoding="ISO-8859-1"?>\n<ROOT>\n'
            f'<TObjVariable>\n<ID>0</ID>\n<NOME>VARIABLE</NOME>\n'
            f'<TEXT>{return_var}</TEXT>\n<SQL>FALSE</SQL>\n'
            f'<TIPO>{return_type or "Variante"}</TIPO>\n'
            f'<INCOMPATIVEL>FALSE</INCOMPATIVEL>\n'
            f'<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\n'
            f'</TObjVariable>\n</ROOT>\n'
        )
        diagram = f"\n    DiagramXml = {_delphi_inline(diagram_xml)}"
        expression = f"\n    Expression = '<VARIABLE NAME=\"{return_var}\"/>'"
        text_prop = f"\n    Text = '@{return_var}'"
        output_param = f"\n    OutPutParam = '{return_type or 'Variante'},'"
    return (
        f"  object {name}: TFlowEnd\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 39\n    Height = 39\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block('clWhite', 'fsBold')}\n"
        f"    ChangeDescription = False\n"
        f"    InputNames = '{input_names}'\n"
        f"    Description = 'Fim'\n"
        f"{diagram}{expression}{text_prop}{output_param}\n"
        f"  end"
    )


def _dfm_flow_expression(
    name: str,
    left: int, top: int,
    input_names: str, output_names: str,
    description: str,
    text: str,
    expression: str,
    diagram_xml: str,
    return_var: str = "",
) -> str:
    desc = _to_delphi_prop(description)
    text_prop = _to_delphi_prop(text)
    expr_inline = _delphi_inline(expression)
    diag_inline = _delphi_inline(diagram_xml)
    ret = f"    ReturnVar = '{return_var}'\n" if return_var else ""
    return (
        f"  object {name}: TFlowExpression\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 150\n    Height = 59\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block()}\n"
        f"    ChangeDescription = True\n"
        f"    InputNames = '{input_names}'\n"
        f"    OutputNames = '{output_names}'\n"
        f"    Description = {desc}\n"
        f"    Text = {text_prop}\n"
        f"{ret}"
        f"    Expression =\n"
        f"      {expr_inline}\n"
        f"    DiagramXml =\n"
        f"      {diag_inline}\n"
        f"  end"
    )


def _dfm_flow_decision(
    name: str,
    left: int, top: int,
    input_names: str, output_names: str,
    description: str,
    expression: str,
    diagram_xml: str,
    loop: bool = False,
) -> str:
    desc = _to_delphi_prop(description)
    expr_inline = _delphi_inline(expression)
    diag_inline = _delphi_inline(diagram_xml)
    loop_str = "True" if loop else "False"
    return (
        f"  object {name}: TFlowDecision\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 150\n    Height = 60\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block()}\n"
        f"    ChangeDescription = True\n"
        f"    InputNames = '{input_names}'\n"
        f"    OutputNames = '{output_names}'\n"
        f"    Description = {desc}\n"
        f"    DiagramXml =\n"
        f"      {diag_inline}\n"
        f"    Expression =\n"
        f"      {expr_inline}\n"
        f"    Loop = {loop_str}\n"
        f"  end"
    )


def _dfm_flow_connector(
    name: str,
    left: int, top: int,
    input_names: str, output_names: str,
) -> str:
    return (
        f"  object {name}: TFlowConnector\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 30\n    Height = 30\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block()}\n"
        f"    ChangeDescription = False\n"
        f"    InputNames = '{input_names}'\n"
        f"    OutputNames = '{output_names}'\n"
        f"  end"
    )


def _dfm_flow_line(
    name: str,
    left: int, top: int, width: int, height: int,
    input_names: str, output_names: str,
    color: str = "9079434",
    description: str = "",
    decision: bool = False,
    style: str = "psSolid",
) -> str:
    desc_line = ""
    if description:
        desc_line = f"    Description = {_to_delphi_prop(description)}\n"
    return (
        f"  object {name}: TFlowLine\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = {width}\n    Height = {height}\n"
        f"    Color = {color}\n"
        f"{_CONSTRAINTS_LINE}\n"
        f"{_font_block()}\n"
        f"    ChangeDescription = False\n"
        f"    InputNames = '{input_names}'\n"
        f"    OutputNames = '{output_names}'\n"
        f"{desc_line}"
        f"    Region = 0\n"
        f"    Style = {style}\n"
        f"    Decision = {'True' if decision else 'False'}\n"
        f"  end"
    )


# ---------------------------------------------------------------------------
# TFlowSubRoutine — DFM helpers
# ---------------------------------------------------------------------------

def _subroutine_diagram_value(p: StepParam) -> str:
    """Gera XML do DiagramXML para um param de SubRoutine collection."""
    if isinstance(p, ParamVariable):
        return (
            '<?xml version="1.0"?>\r\n<ROOT>\r\n'
            '\t<TObjVariable>\r\n'
            '\t\t<ID>0</ID>\r\n\t\t<NOME>VARIABLE</NOME>\r\n'
            f'\t\t<TEXT>{p.nome}</TEXT>\r\n'
            '\t\t<SQL>FALSE</SQL>\r\n'
            f'\t\t<TIPO>{p.tipo_dado}</TIPO>\r\n'
            '\t\t<INCOMPATIVEL>FALSE</INCOMPATIVEL>\r\n'
            f'\t\t<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\r\n'
            '\t</TObjVariable>\r\n</ROOT>\r\n'
        )
    if isinstance(p, ParamConstant):
        null = "TRUE" if p.is_null else "FALSE"
        val = "" if p.is_null else xml_escape_content(p.valor or "")
        guid_val = p.guid if p.guid else ""
        return (
            '<?xml version="1.0"?>\r\n<ROOT>\r\n'
            '\t<TObjConst>\r\n'
            '\t\t<ID>0</ID>\r\n\t\t<NOME>CONSTANT</NOME>\r\n'
            '\t\t<TEXT></TEXT>\r\n\t\t<SQL>FALSE</SQL>\r\n'
            f'\t\t<TIPO>{p.tipo_dado}</TIPO>\r\n'
            '\t\t<INCOMPATIVEL>FALSE</INCOMPATIVEL>\r\n'
            f'\t\t<MKR_VERSION>{_MKR_VERSION}</MKR_VERSION>\r\n'
            f'\t\t<VALOR>{val}</VALOR>\r\n'
            '\t\t<DMLTYPE>dtSelect</DMLTYPE>\r\n'
            '\t\t<DIAGRAMXML></DIAGRAMXML>\r\n'
            f'\t\t<NULO>{null}</NULO>\r\n'
            f'\t\t<GUID>{guid_val}</GUID>\r\n'
            '\t</TObjConst>\r\n</ROOT>\r\n'
        )
    if isinstance(p, ParamFunction):
        inner = build_diagram_xml(p.funcao, p.tipo_retorno, p.params)
        return f'<?xml version="1.0"?>\r\n{inner}'
    return ''


def _subroutine_expression_value(p: StepParam) -> str:
    """Gera XML da Expression para um param de SubRoutine collection."""
    if isinstance(p, ParamVariable):
        return f'<VARIABLE NAME="{p.nome}"/>'
    if isinstance(p, ParamConstant):
        null = "TRUE" if p.is_null else "FALSE"
        val = "" if p.is_null else xml_escape_content(p.valor or "")
        guid_attr = f' GUID = "{p.guid}"' if p.guid else ""
        return f'<CONSTANT TYPE="{p.tipo_dado}" NULL="{null}" {guid_attr} >{val}</CONSTANT>'
    if isinstance(p, ParamFunction):
        return build_expression_xml(p.funcao, p.nome_amigavel, p.params)
    return ''


def _subroutine_text_value(p: StepParam) -> str:
    """Gera texto legivel para um param de SubRoutine collection."""
    if isinstance(p, ParamVariable):
        return f'@{p.nome}'
    if isinstance(p, ParamConstant):
        return p.valor or ''
    if isinstance(p, ParamFunction):
        return f'{p.nome_amigavel}(...)'
    return ''


def _build_subroutine_collections(
    params: list[SubRoutineParam],
) -> tuple[str, str, str]:
    """Retorna (InputDiagramXML, InputExpression, InputText) em DFM."""
    if not params:
        return '<>', '<>', '<>'

    diag_items: list[str] = []
    expr_items: list[str] = []
    text_items: list[str] = []

    for sp in params:
        name = sp.target_param_name

        diag_xml = _subroutine_diagram_value(sp.value)
        diag_delphi = _delphi_inline(diag_xml)
        diag_items.append(
            f'      item\n'
            f'        DataType = ftString\n'
            f"        Name = '{name}'\n"
            f'        ParamType = ptInput\n'
            f'        Value = \n'
            f'          {diag_delphi}\n'
            f'      end'
        )

        expr_val = _subroutine_expression_value(sp.value)
        expr_delphi = _to_delphi_prop(expr_val)
        expr_items.append(
            f'      item\n'
            f'        DataType = ftString\n'
            f"        Name = '{name}'\n"
            f'        ParamType = ptInput\n'
            f'        Value = {expr_delphi}\n'
            f'      end'
        )

        text_val = _subroutine_text_value(sp.value)
        text_delphi = _to_delphi_prop(text_val)
        text_items.append(
            f'      item\n'
            f'        DataType = ftString\n'
            f"        Name = '{name}'\n"
            f'        ParamType = ptInput\n'
            f'        Value = {text_delphi}\n'
            f'      end'
        )

    diag = '<\n' + '\n'.join(diag_items) + '>'
    expr = '<\n' + '\n'.join(expr_items) + '>'
    text = '<\n' + '\n'.join(text_items) + '>'
    return diag, expr, text


def _dfm_flow_subroutine(
    name: str,
    left: int, top: int,
    input_names: str, output_names: str,
    description: str,
    rule_id: int,
    rule_name: str,
    params: list[SubRoutineParam] | None = None,
    return_var: str = "",
) -> str:
    desc = _to_delphi_prop(description)
    obj_name = _to_delphi_prop(rule_name)
    diag, expr, text = _build_subroutine_collections(params or [])
    ret = f"    Return = '{return_var}'\n" if return_var else ""
    return (
        f"  object {name}: TFlowSubRoutine\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 150\n    Height = 60\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block()}\n"
        f"    ChangeDescription = False\n"
        f"    InputNames = '{input_names}'\n"
        f"    OutputNames = '{output_names}'\n"
        f"    Description = {desc}\n"
        f"    Id = {rule_id}\n"
        f"    InputDiagramXML = {diag}\n"
        f"    InputExpression = {expr}\n"
        f"    InputText = {text}\n"
        f"{ret}"
        f"    ObjectName = {obj_name}\n"
        f"    RealName = 'CALLRULE'\n"
        f"  end"
    )


def _dfm_flow_activity(
    name: str,
    left: int, top: int,
    input_names: str,
    description: str,
    activity_id: int,
    object_name: str,
    real_name: str,
    params: list[SubRoutineParam] | None = None,
) -> str:
    """Gera bloco DFM TFlowActivity (componente terminal, sem OutputNames)."""
    desc = _to_delphi_prop(description)
    obj = _to_delphi_prop(object_name)
    diag, expr, text_col = _build_subroutine_collections(params or [])
    return (
        f"  object {name}: TFlowActivity\n"
        f"    Left = {left}\n    Top = {top}\n"
        f"    Width = 150\n    Height = 60\n"
        f"{_CONSTRAINTS_FULL}\n"
        f"{_font_block()}\n"
        f"    ChangeDescription = False\n"
        f"    InputNames = '{input_names}'\n"
        f"    Description = {desc}\n"
        f"    Id = {activity_id}\n"
        f"    ObjectName = {obj}\n"
        f"    RealName = '{real_name}'\n"
        f"    InputDiagramXML = {diag}\n"
        f"    InputExpression = {expr}\n"
        f"    InputText = {text_col}\n"
        f"  end"
    )


def _to_delphi_prop(text: str) -> str:
    """Converte texto para valor de property DFM (com #NNN para acentos)."""
    if not text:
        return "''"
    result: list[str] = []
    in_str = False
    for ch in text:
        code = _DELPHI_CHAR_MAP_INLINE.get(ch)
        if code:
            if in_str:
                result.append("'")
                in_str = False
            result.append(code)
        elif ch == "'":
            if in_str:
                result.append("'")
                in_str = False
            result.append("#39")
        else:
            if not in_str:
                result.append("'")
                in_str = True
            result.append(ch)
    if in_str:
        result.append("'")
    raw = "".join(result)
    if len(raw) > 70:
        return _wrap_delphi_long_string_prop(raw)
    return raw


def _wrap_delphi_long_string_prop(s: str, max_line: int = 68) -> str:
    """Quebra property DFM longa reutilizando _rewrap_delphi."""
    return _rewrap_delphi(s, max_line)

# ---------------------------------------------------------------------------
# Defaults por tipo de componente (inferidos de 286K properties reais)
# ---------------------------------------------------------------------------

_COMPONENT_TYPE_DEFAULTS: dict[str, dict[str, str]] = {
    "E": {
        "Cor": "clWindow",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "Senha": "FALSE",
        "Tipo": "0",
        "TamanhoMaximo": "0",
        "Conteudo": "",
        "Atributos": "",
    },
    "L": {
        "Cor": "clBtnFace",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "QuebraAutomaticaDeLinha": "FALSE",
    },
    "K": {
        "Cor": "clWindow",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "Tipo": "0",
        "Estilo": "0",
        "FonteDeDados": "",
        "CampoChave": "",
        "CampoLista": "",
        "SQL": "",
        "Paginacao": "FALSE",
        "Mascara": "",
        "CodigoForm": "",
    },
    "C": {
        "Cor": "clWindow",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "Tipo": "0",
        "Lista": "",
        "Valores": "",
        "Atributos": "",
    },
    "B": {
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "CodigoForm": "",
        "Parametros": "",
        "Imagem": "",
    },
    "M": {
        "Cor": "clWindow",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "Tipo": "0",
        "TamanhoMaximo": "0",
        "Atributos": "",
    },
    "G": {
        "Cor": "clWindow",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "Editavel": "FALSE",
        "Colunas": "",
        "CodigoForm": "",
        "ChamaSubForm": "FALSE",
        "Paginacao": "TRUE",
        "CorCondicional": "",
        "Parametros": "",
        "Atributos": "",
    },
    "H": {
        "Cor": "clBtnFace",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "ValorCheck": "S",
        "ValorUnCheck": "N",
        "Tipo": "0",
    },
    "R": {
        "Cor": "clBtnFace",
        "Habilitado": "True",
        "Fonte": "Tahoma",
        "Tabulacao": "0",
        "Tabular": "True",
        "ApenasLeitura": "FALSE",
        "Lista": "",
        "Valores": "",
        "QtdeColunas": "1",
        "Tipo": "0",
    },
    "P": {
        "Cor": "clBtnFace",
        "Alinhar": "alNone",
        "LarguraMaxima": "",
    },
    "I": {
        "Habilitado": "True",
        "ApenasLeitura": "FALSE",
        "Imagem": "",
        "URL": "",
        "Exibicao": "0",
        "GravarEmArquivo": "FALSE",
        "CampoCodImpDigital": "",
    },
    "V": {
        "Forma": "bsBox",
        "Estilo": "bsRaised",
        "Cor": "clBtnFace",
        "ConsiderarOrdem": "FALSE",
    },
    "D": {
        "Habilitado": "True",
        "CodigoForm": "",
        "Parametros": "",
        "ExcluirSeInvisivel": "FALSE",
        "Tabulacao": "0",
        "Tabular": "True",
    },
    "W": {
        "Habilitado": "True",
        "ClasseComponente": "",
        "Categoria": "",
        "Tabulacao": "0",
        "Tabular": "True",
    },
    "S": {
        "SQL": "",
        "OrigemDados": "",
        "TipoPlotagem": "",
        "NomeGrafico": "",
        "Titulo": "",
    },
    "A": {
        "Series": "",
        "Porcentagem3D": "0",
    },
}


# ---------------------------------------------------------------------------
# Layout automatico
# ---------------------------------------------------------------------------





# ---------------------------------------------------------------------------
# RuleBuilder
# ---------------------------------------------------------------------------

class RuleBuilder:
    r"""Constroi DFM + Script XML a partir de uma RuleSpec.

    ## Modelo Matematico de Layout

    Eixo central: CENTER = 665 (todos componentes centrados neste X).

    ### Formulas de posicionamento horizontal

    Dado CENTER e a largura W de cada componente:
        component.Left = CENTER - W // 2

    | Componente      | W   | Left            |
    |-----------------|-----|-----------------|
    | TFlowStart      | 38  | CENTER - 19     |
    | TFlowExpression | 150 | CENTER - 75     |
    | TFlowDecision   | 150 | CENTER - 75     |
    | TFlowConnector  | 30  | SIM_CENTER - 15 |
    | TFlowEnd        | 39  | SIM_CENTER - 19 |
    | TFlowLine (vert)| 40  | CENTER - 20     |

    Branch SIM: SIM_CENTER = CENTER - 190 (= 475)

    ### Formulas de posicionamento vertical

    START_TOP = 18
    FIRST_GAP = 27 (pixels entre fundo do FlowStart e primeiro componente)
    STEP_SPACING = 75 (Top-a-Top entre componentes sequenciais)

    first_comp.Top = START_TOP + START_H + FIRST_GAP  (= 83)
    comp[n].Top = first_comp.Top + n * STEP_SPACING

    ### FlowLine entre componentes sequenciais

    line.Left   = CENTER - 20
    line.Top    = source.Bottom - 20
    line.Width  = 40
    line.Height = target.Top + 20 - line.Top

    ### Decision: linha SIM (horizontal para esquerda)

    sim_line.Left   = sim_target.Left + sim_target.Width - 20
    sim_line.Top    = decision.Top + 10
    sim_line.Width  = decision.Left + 20 - sim_line.Left
    sim_line.Height = 41
    Decision = True, Style = psSolid

    ### Decision: linha NAO (vertical para baixo)

    nao_line.Left   = CENTER - 20
    nao_line.Top    = decision.Bottom - 20
    nao_line.Width  = DEC_W // 2 - 11  (= 64)
    nao_line.Height = nao_target.Top + 20 - nao_line.Top
    Decision = False, Style = psSolid

    ### Reconexao SIM ao Connector (vertical, psDash)

    line.Left   = SIM_CENTER - 20
    line.Top    = sim_last.Bottom - 20
    line.Height = connector.Top + 20 - line.Top

    ### Reconexao NAO ao Connector (horizontal)

    line.Left   = connector.Left + 10
    line.Top    = nao_last.Top + 10
    line.Width  = nao_last.Left + 20 - line.Left
    line.Height = 40

    ### Connector

    connector.Left = SIM_CENTER - CONN_W // 2
    connector.Top  = max(sim_last.Bottom + 30, nao_last.Top + 14)
    """

    CENTER = 665
    START_W, START_H = 38, 38
    EXPR_W, EXPR_H = 150, 59
    DEC_W, DEC_H = 150, 60
    SUB_W, SUB_H = 150, 60
    CONN_W, CONN_H = 30, 30
    END_W, END_H = 39, 39
    LINE_W = 40

    START_TOP = 18
    FIRST_GAP = 27
    STEP_SPACING = 75
    SIM_OFFSET = 190

    def __init__(self, spec: RuleSpec):
        self.spec = spec
        self._line_counter = 0
        self._connector_counter = 0

    def build(self) -> tuple[str, str, dict[str, str]]:
        """Retorna (dfm, script_xml, properties_dict)."""
        dfm = self._build_dfm()
        script = self._build_script()
        props = self._build_properties(dfm, script)
        return dfm, script, props

    # -- helpers de contagem --

    def _next_line(self) -> str:
        self._line_counter += 1
        return f"FlowLine{self._line_counter}"

    def _next_connector(self) -> str:
        self._connector_counter += 1
        return f"FlowConnector{self._connector_counter}"

    # -- posicionamento horizontal (formulas centralizadas) --

    @property
    def _start_left(self) -> int:
        return self.CENTER - self.START_W // 2

    @property
    def _comp_left(self) -> int:
        return self.CENTER - self.EXPR_W // 2

    @property
    def _line_left(self) -> int:
        return self.CENTER - self.LINE_W // 2

    @property
    def _sim_center(self) -> int:
        return self.CENTER - self.SIM_OFFSET

    @property
    def _sim_comp_left(self) -> int:
        return self._sim_center - self.EXPR_W // 2

    @property
    def _sim_line_left(self) -> int:
        return self._sim_center - self.LINE_W // 2

    @property
    def _conn_left(self) -> int:
        return self._sim_center - self.CONN_W // 2

    @property
    def _end_left(self) -> int:
        return self._sim_center - self.END_W // 2

    # -- FlowLine: formula de posicao vertical --

    def _seq_line(
        self,
        name: str,
        source_bottom: int, target_top: int,
        from_comp: str, to_comp: str,
        center_x: int | None = None,
        **kwargs,
    ) -> str:
        """Gera FlowLine vertical entre dois componentes sequenciais.

        Formula:
            line.Top    = source.Bottom - 20
            line.Height = target.Top + 20 - line.Top
        """
        cx = center_x if center_x is not None else self.CENTER
        line_left = cx - self.LINE_W // 2
        line_top = source_bottom - 20
        line_h = target_top + 20 - line_top
        return _dfm_flow_line(
            name, line_left, line_top, self.LINE_W, max(line_h, 20),
            input_names=from_comp, output_names=to_comp, **kwargs,
        )

    # -- build DFM principal --

    def _build_dfm(self) -> str:
        parts: list[str] = []

        first_line = self._next_line()
        first_comp_top = self.START_TOP + self.START_H + self.FIRST_GAP
        start_bottom = self.START_TOP + self.START_H
        first_comp_name = self.spec.passos[0].nome if self.spec.passos else "fimDoFluxo"

        params_str = ";".join(
            f"{p.nome},{p.tipo},{p.tamanho}," for p in self.spec.parametros
        )
        vars_str = ";".join(
            f"{v.nome},{v.tipo},{v.tamanho}," for v in self.spec.variaveis
        )

        parts.append(_dfm_flow_start(
            "FlowStart1", self._start_left, self.START_TOP,
            output_names=first_line,
            variables_str=vars_str,
            input_params_str=params_str,
        ))

        parts.append(self._seq_line(
            first_line, start_bottom, first_comp_top,
            "FlowStart1", first_comp_name,
        ))

        last_line, last_bottom, last_comp, last_cx, _ = self._build_steps_dfm(
            self.spec.passos, parts, self._comp_left, first_comp_top, first_line, self.CENTER,
        )

        end_line = self._next_line()
        end_top = last_bottom + self.FIRST_GAP + 20

        end_style = "psDash" if last_comp.startswith("FlowConnector") else "psSolid"
        parts.append(self._seq_line(
            end_line, last_bottom, end_top,
            last_comp, "fimDoFluxo",
            center_x=last_cx,
            style=end_style,
        ))

        ret_var = ""
        if self.spec.retorno_tipo:
            ret_var = next((v.nome for v in self.spec.variaveis), "")

        end_left = (last_cx or self.CENTER) - self.END_W // 2
        parts.append(_dfm_flow_end(
            "fimDoFluxo", end_left, end_top,
            input_names=end_line,
            return_var=ret_var,
            return_type=self.spec.retorno_tipo,
        ))

        return "object FlowSubModel1: TFlowSubModel\n" + "\n".join(parts) + "\nend\n"

    ACT_W, ACT_H = 150, 60

    def _build_steps_dfm(
        self,
        steps: list[Step],
        parts: list[str],
        comp_left: int,
        top: int,
        prev_line: str,
        center_x: int,
    ) -> tuple[str, int, str, int, bool]:
        """Gera DFM dos passos sequenciais.

        Retorna (ultimo_line, bottom_do_ultimo, nome_ultimo_comp, center_x_final, terminal).
        terminal=True quando o ultimo passo e um StepActivity (sem output).
        """
        last_comp = ""
        last_bottom = top
        last_cx = center_x
        terminal = False

        for i, step in enumerate(steps):
            next_name = steps[i + 1].nome if i + 1 < len(steps) else ""

            if isinstance(step, StepExpression):
                out_line = self._next_line()

                expr_xml = build_expression_xml(step.funcao, step.nome_amigavel, step.params)
                diag_xml = build_diagram_xml(step.funcao, step.tipo_retorno, step.params)
                text = _build_text_prop(step.funcao, step.nome_amigavel, step.params, step.retorno)

                parts.append(_dfm_flow_expression(
                    step.nome, comp_left, top,
                    input_names=prev_line, output_names=out_line,
                    description=step.descricao,
                    text=text,
                    expression=expr_xml,
                    diagram_xml=diag_xml,
                    return_var=step.retorno,
                ))

                comp_bottom = top + self.EXPR_H

                if next_name:
                    next_top = top + self.STEP_SPACING
                    parts.append(self._seq_line(
                        out_line, comp_bottom, next_top,
                        step.nome, next_name,
                        center_x=center_x,
                    ))

                prev_line = out_line
                last_comp = step.nome
                last_bottom = comp_bottom
                last_cx = center_x
                terminal = False
                top += self.STEP_SPACING

            elif isinstance(step, StepActivity):
                parts.append(_dfm_flow_activity(
                    step.nome, comp_left, top,
                    input_names=prev_line,
                    description=step.description or step.object_name,
                    activity_id=step.activity_id,
                    object_name=step.object_name,
                    real_name=step.real_name,
                    params=step.params,
                ))

                comp_bottom = top + self.ACT_H
                last_comp = step.nome
                last_bottom = comp_bottom
                last_cx = center_x
                terminal = True
                top += self.STEP_SPACING

            elif isinstance(step, StepDecision):
                nao_line = self._next_line()
                sim_line = self._next_line()

                expr_xml = build_expression_xml(step.funcao, step.nome_amigavel, step.params)
                diag_xml = build_diagram_xml(step.funcao, "Lógico", step.params)

                parts.append(_dfm_flow_decision(
                    step.nome, comp_left, top,
                    input_names=prev_line,
                    output_names=f"{nao_line};{sim_line}",
                    description=step.descricao,
                    expression=expr_xml,
                    diagram_xml=diag_xml,
                    loop=getattr(step, "loop", False),
                ))

                dec_bottom = top + self.DEC_H
                sim_comp_left = center_x - self.SIM_OFFSET - self.EXPR_W // 2
                sim_cx = center_x - self.SIM_OFFSET

                # -- Branch SIM (horizontal para esquerda) --
                sim_last_comp = step.nome
                sim_last_bottom = dec_bottom
                sim_terminal = False
                if step.sim:
                    sim_target_name = step.sim[0].nome
                    sim_line_left = sim_comp_left + self.EXPR_W - 20
                    sim_line_w = comp_left + 20 - sim_line_left
                    parts.append(_dfm_flow_line(
                        sim_line, sim_line_left, top + 10,
                        max(sim_line_w, 40), 41,
                        input_names=step.nome,
                        output_names=sim_target_name,
                        description="SIM",
                        decision=True,
                        style="psSolid",
                    ))

                    _, sim_last_bottom, sim_last_comp, _, sim_terminal = self._build_steps_dfm(
                        step.sim, parts, sim_comp_left, top,
                        sim_line, sim_cx,
                    )

                # -- Branch NAO (vertical para baixo) --
                nao_top = top + self.STEP_SPACING
                nao_last_comp = step.nome
                nao_last_bottom = dec_bottom
                nao_last_top = top
                nao_terminal = False
                if step.nao:
                    nao_target_name = step.nao[0].nome
                    nao_line_top = dec_bottom - 20
                    nao_line_h = nao_top + 20 - nao_line_top
                    parts.append(_dfm_flow_line(
                        nao_line, self._line_left, nao_line_top,
                        self.DEC_W // 2 - 11, max(nao_line_h, 20),
                        input_names=step.nome,
                        output_names=nao_target_name,
                        description="NÃO",
                        decision=False,
                        style="psSolid",
                    ))

                    _, nao_last_bottom, nao_last_comp, _, nao_terminal = self._build_steps_dfm(
                        step.nao, parts, comp_left, nao_top,
                        nao_line, center_x,
                    )
                    nao_last_top = nao_top + (len(step.nao) - 1) * self.STEP_SPACING

                # -- Connector: reconvergencia dos branches --
                connector_name = self._next_connector()
                conn_top = max(sim_last_bottom + 30, nao_last_top + 14)
                conn_left = sim_cx - self.CONN_W // 2
                connector_out = self._next_line()

                conn_inputs: list[str] = []

                if step.nao and not nao_terminal:
                    nao_reconn = self._next_line()
                    nao_reconn_left = conn_left + 10
                    nao_reconn_top = nao_last_top + 10
                    nao_reconn_w = comp_left + 20 - nao_reconn_left
                    parts.append(_dfm_flow_line(
                        nao_reconn, nao_reconn_left, nao_reconn_top,
                        max(nao_reconn_w, 40), 40,
                        input_names=nao_last_comp,
                        output_names=connector_name,
                    ))
                    conn_inputs.append(nao_reconn)

                if step.sim and not sim_terminal:
                    sim_reconn = self._next_line()
                    sim_reconn_top = sim_last_bottom - 20
                    sim_reconn_h = conn_top + 20 - sim_reconn_top
                    parts.append(_dfm_flow_line(
                        sim_reconn, sim_cx - self.LINE_W // 2,
                        sim_reconn_top, self.LINE_W, max(sim_reconn_h, 20),
                        input_names=sim_last_comp,
                        output_names=connector_name,
                        style="psDash",
                    ))
                    conn_inputs.append(sim_reconn)

                if conn_inputs:
                    parts.append(_dfm_flow_connector(
                        connector_name, conn_left, conn_top,
                        input_names=";".join(conn_inputs),
                        output_names=connector_out,
                    ))

                    conn_bottom = conn_top + self.CONN_H

                    if next_name:
                        conn_next_top = conn_bottom + self.STEP_SPACING - self.CONN_H
                        parts.append(self._seq_line(
                            connector_out, conn_bottom, conn_next_top,
                            connector_name, next_name,
                            center_x=sim_cx,
                            style="psDash",
                        ))

                    prev_line = connector_out
                    last_comp = connector_name
                    last_bottom = conn_bottom
                    last_cx = sim_cx
                    terminal = False
                    top = conn_bottom + self.STEP_SPACING - self.CONN_H
                else:
                    last_comp = step.nome
                    last_bottom = max(sim_last_bottom, nao_last_bottom)
                    last_cx = sim_cx
                    terminal = True
                    top = last_bottom + self.STEP_SPACING

            elif isinstance(step, StepSubRoutine):
                out_line = self._next_line()

                parts.append(_dfm_flow_subroutine(
                    step.nome, comp_left, top,
                    input_names=prev_line, output_names=out_line,
                    description=step.description or step.rule_name,
                    rule_id=step.rule_id,
                    rule_name=step.rule_name,
                    params=step.params,
                    return_var=step.return_var,
                ))

                comp_bottom = top + self.SUB_H

                if next_name:
                    next_top = top + self.STEP_SPACING
                    parts.append(self._seq_line(
                        out_line, comp_bottom, next_top,
                        step.nome, next_name,
                        center_x=center_x,
                    ))

                prev_line = out_line
                last_comp = step.nome
                last_bottom = comp_bottom
                last_cx = center_x
                terminal = False
                top += self.STEP_SPACING

        return prev_line, last_bottom, last_comp, last_cx, terminal

    def _build_script(self) -> str:
        name_esc = self.spec.nome.replace(" ", "&#x20;")
        params_xml = "\n".join(
            f'<PARAM TYPE="{p.tipo}" SIZE="{p.tamanho}">{p.nome}</PARAM>'
            for p in self.spec.parametros
        )
        vars_xml = "\n".join(
            f'<VAR TYPE="{v.tipo}" SIZE="{v.tamanho}">{v.nome}</VAR>'
            for v in self.spec.variaveis
        )
        ret_type = self.spec.retorno_tipo or ""
        declare_return = f'<DECLARERETURN TYPE="{ret_type}" SIZE=""/>'

        now = datetime.now().strftime("%d/%m/%Y %H:%M:%S")

        actions = self._build_steps_script(self.spec.passos)

        return (
            f'<?xml version="1.0" encoding="ISO-8859-1"?>\n'
            f'<RULE ID="{self.spec.codigo}" NAME="{name_esc}" '
            f'COMPONENTNAME="FlowStart1" DESCRIPTION="Inicio" DEBUG="FALSE">\n'
            f'<HEADER>\n<AUTHOR>master</AUTHOR>\n'
            f'<DATE>{now}</DATE>\n<RANKING>10,0</RANKING>\n</HEADER>\n'
            f'{params_xml}\n{vars_xml}\n{declare_return}\n'
            f'<ACTION>\n{actions}\n'
            f'<RULERETURN COMPONENTNAME="fimDoFluxo" DESCRIPTION="Fim">\n'
            f'</RULERETURN>\n'
            f'</ACTION>\n</RULE>\n'
        )

    def _build_steps_script(self, steps: list[Step]) -> str:
        parts: list[str] = []
        for step in steps:
            if isinstance(step, StepExpression):
                ret_attr = f' RETURN="{step.retorno}"' if step.retorno else ""
                desc_esc = step.descricao.replace(" ", "&#x20;")
                func_xml = self._script_function_xml(step)
                parts.append(
                    f'<EXPRESSION{ret_attr} COMPONENTNAME="{step.nome}" '
                    f'DESCRIPTION="{desc_esc}">\n'
                    f'{func_xml}\n'
                    f'</EXPRESSION>'
                )
            elif isinstance(step, StepDecision):
                desc_esc = step.descricao.replace(" ", "&#x20;")
                cond_xml = self._script_function_xml_from_params(
                    step.funcao, step.nome_amigavel, step.params
                )
                sim_actions = self._build_steps_script(step.sim) if step.sim else ""
                nao_actions = self._build_steps_script(step.nao) if step.nao else ""

                parts.append(
                    f'<DECISION COMPONENTNAME="{step.nome}" DESCRIPTION="{desc_esc}">\n'
                    f'<CONDITION>\n{cond_xml}\n</CONDITION>\n'
                    f'<IFTRUE>\n<ACTION>\n{sim_actions}\n</ACTION>\n</IFTRUE>\n'
                    f'<IFFALSE>\n<ACTION>\n{nao_actions}\n</ACTION>\n</IFFALSE>\n'
                    f'</DECISION>'
                )

            elif isinstance(step, StepSubRoutine):
                name_esc = step.rule_name.replace(" ", "&#x20;")
                desc_esc = (step.description or step.rule_name).replace(" ", "&#x20;")
                ret = step.return_var or ""
                params_count = len(step.params)
                params_xml = "\n".join(
                    self._script_param_xml(sp.value) for sp in step.params
                )
                parts.append(
                    f'<CALLRULE ID="{step.rule_id}" NAME="{name_esc}" '
                    f'RETURN="{ret}" PARAMSCOUNT="{params_count}" '
                    f'COMPONENTNAME="{step.nome}" DESCRIPTION="{desc_esc}">\n'
                    f'<PARAMS>\n{params_xml}\n</PARAMS>\n'
                    f'</CALLRULE>'
                )

            elif isinstance(step, StepActivity):
                name_esc = step.object_name.replace(" ", "&#x20;")
                desc_esc = (step.description or step.object_name).replace(" ", "&#x20;")
                params_xml = "\n".join(
                    self._script_param_xml(sp.value) for sp in step.params
                )
                parts.append(
                    f'<ACTIVITY ID="{step.activity_id}" NAME="{name_esc}" '
                    f'REALNAME="{step.real_name}" COMPONENTNAME="{step.nome}" '
                    f'DESCRIPTION="{desc_esc}">\n'
                    f'<PARAMS>\n{params_xml}\n</PARAMS>\n'
                    f'</ACTIVITY>'
                )
        return "\n".join(parts)

    def _script_function_xml(self, step: StepExpression) -> str:
        return self._script_function_xml_from_params(
            step.funcao, step.nome_amigavel, step.params
        )

    def _script_function_xml_from_params(
        self, funcao: str, nome_amigavel: str, params: list[StepParam]
    ) -> str:
        params_xml = "\n".join(self._script_param_xml(p) for p in params)
        if params:
            return (
                f'<FUNCTION NAME="{nome_amigavel}" REALNAME="{funcao}">\n'
                f'<PARAMS>\n{params_xml}\n</PARAMS>\n</FUNCTION>'
            )
        return f'<FUNCTION NAME="{nome_amigavel}" REALNAME="{funcao}">\n</FUNCTION>'

    def _script_param_xml(self, p: StepParam) -> str:
        if isinstance(p, ParamVariable):
            return f'<VARIABLE NAME="{p.nome}"/>'
        elif isinstance(p, ParamConstant):
            null = "TRUE" if p.is_null else "FALSE"
            val = "" if p.is_null else xml_escape_content(p.valor or "")
            guid_attr = f' GUID = "{p.guid}"' if p.guid else ""
            return f'<CONSTANT TYPE="{p.tipo_dado}" NULL="{null}" {guid_attr} >{val}</CONSTANT>'
        elif isinstance(p, ParamSQL):
            bind_parts = [
                f'\n<DEFINE NAME="{b["nome"]}">\n'
                f'<VARIABLE NAME="{b["variavel"]}"/>\n</DEFINE>'
                for b in p.binds
            ]
            binds = "".join(bind_parts)
            return (
                f'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><PSQL>\n'
                f'<COMMAND>\n{p.sql}\n\n\n/*WHERE_ADD*/\n/*ORDER_NEW*/\n</COMMAND>\n'
                f'<PARAMS>{binds}\n</PARAMS>\n</PSQL>\n</CONSTANT>'
            )
        elif isinstance(p, ParamFunction):
            inner = "\n".join(self._script_param_xml(sp) for sp in p.params)
            return (
                f'<FUNCTION NAME="{p.nome_amigavel}" REALNAME="{p.funcao}">\n'
                f'<PARAMS>\n{inner}\n</PARAMS>\n</FUNCTION>'
            )
        return ""

    def _build_properties(self, dfm: str, script: str) -> dict[str, str]:
        dfm_b64 = encode_dfm_b64(dfm)
        script_b64 = encode_script_b64(script)

        params_str = ";".join(
            f"{p.nome},{p.tipo},{p.tamanho}," for p in self.spec.parametros
        )
        vars_str = ";".join(
            f"{v.nome},{v.tipo},{v.tamanho}," for v in self.spec.variaveis
        )

        nome_esc = xml_escape_attr(self.spec.nome)
        desc_esc = xml_escape_attr(self.spec.descricao or self.spec.nome)

        return {
            "REG_COD": str(self.spec.codigo),
            "REG_NOME": nome_esc,
            "REG_DESCRICAO": desc_esc,
            "REG_PARAMS": xml_escape_attr(params_str),
            "REG_VARIAVEIS": xml_escape_attr(vars_str),
            "REG_PARAMS_OUT": "",
            "REG_DATA": "",
            "REG_HORA": "",
            "REG_COMPILADA": "",
            "REG_DESTINO": str(self.spec.destino),
            "REG_HASH": "",
            "REG_INTERFACE": dfm_b64,
            "REG_SCRIPT": script_b64,
            "CAT_PATH": self.spec.categoria,
        }


# ---------------------------------------------------------------------------
# FormBuilder
# ---------------------------------------------------------------------------

class FormBuilder:
    """Constroi XML de formulario a partir de FormSpec."""

    def __init__(self, spec: FormSpec):
        self.spec = spec
        if not self.spec.guid:
            self.spec.guid = "{" + str(uuid.uuid4()).upper() + "}"

    def build(self) -> str:
        s = self.spec
        crlf = "&#x000D;&#x000A;"
        sc = "&#x003B;"

        update_fields = s.sql_update.replace("\n", crlf) if s.sql_update else ""
        grade_fields = s.campos_grade.replace(";", sc) if s.campos_grade else ""
        pesq_fields = s.campos_pesquisa.replace(";", sc) if s.campos_pesquisa else ""

        props = [
            ('IMG_INCLUIR', '1'), ('IMG_ALTERAR', '2'), ('IMG_EXCLUIR', '8'),
            ('IMG_GRAVAR', '12'), ('IMG_CANCELAR', '13'), ('IMG_ATUALIZAR', '7'),
            ('IMG_GRAVAR_MAIS', '15'), ('IMG_LOG', '16'), ('IMG_VALORES_PADRAO', '17'),
            ('IMG_UTILITARIO', '1'), ('IMG_SAIR', '11'), ('IMG_IMPRIMIR', '10'),
            ('IMG_AJUDA', '14'), ('IMG_PROXIMO', '5'), ('IMG_ULTIMO', '6'),
            ('IMG_PRIMEIRO', '3'), ('IMG_ANTERIOR', '4'),
            ('FRM_DESCRICAO', xml_escape_attr(s.descricao)),
            ('FRM_POSICAOX', '330'), ('FRM_POSICAOY', '146'),
            ('FRM_TAMANHO', str(s.tamanho)), ('FRM_ALTURA', str(s.altura)),
            ('FRM_TIPO_CRIACAO', '0'),
            ('FNT_CAMPOCHAVE', s.campo_chave),
            ('FNT_TABELA', s.tabela),
            ('FNT_SQLSELECT', xml_escape_content(s.sql_select)),
            ('FNT_SQLINSERT', ''),
            ('FNT_SQLUPDATE', update_fields),
            ('FNT_SQLDELETE', ''),
            ('FNT_CAMPOINCREMENTO', ''),
            ('FNT_CAMPOGRADE', grade_fields),
            ('FNT_CAMPOPESQUISA', pesq_fields),
            ('FNT_SQLDEFAULT', xml_escape_content(s.sql_default) if s.sql_default else ''),
            ('FNT_SQLMASCARA', xml_escape_content(s.sql_mascara) if s.sql_mascara else ''),
            ('REL_CODIGO', ''),
        ]
        props_xml = "\n".join(
            f'            <property name="{k}">{v}</property>' for k, v in props
        )

        comps = self._build_components()
        cat_xml = ""
        if s.categoria:
            cat_xml = f'\n            <category CAT_CODIGO="{s.categoria}"/>'

        return (
            f'        <form FRM_CODIGO="{s.codigo}" FRM_GUID="{s.guid}">\n'
            f'{props_xml}\n'
            f'{cat_xml}\n'
            f'{comps}\n'
            f'        </form>'
        )

    def _build_components(self) -> str:
        parts: list[str] = []
        comp_id = 100

        form_comp = self._build_form_settings(comp_id)
        parts.append(form_comp)
        comp_id += 1

        for fld in self.spec.campos:
            comp_xml = self._build_component(fld, comp_id)
            parts.append(comp_xml)
            comp_id += 1

        return "\n".join(parts)

    def _build_form_settings(self, comp_id: int) -> str:
        s = self.spec
        props: list[tuple[str, str]] = [
            ("Navegacao", "TRUE" if s.navegacao else "FALSE"),
            ("Abas", "TRUE" if s.abas else "FALSE"),
            ("Responsivo", "TRUE" if s.responsivo else "FALSE"),
            ("ClasseCss", s.css),
            ("EditarAoDuploClicar", "TRUE" if s.editar_duplo_clique else "FALSE"),
            ("AbaLocalizar", "TRUE" if s.aba_localizar else "FALSE"),
        ]
        if not s.barra_rolagem:
            props.append(("BarraRolagem", "FALSE"))
        events = self._render_events(s.eventos_form)

        props_xml = "\n".join(
            f'                <property name="{k}">{v}</property>' for k, v in props
        )
        return (
            f'            <component COM_CODIGO="{comp_id}" COM_TIPO="F" name="">\n'
            f'{props_xml}\n'
            f'{events}\n'
            f'            </component>'
        )

    def _build_component(self, f: FormField, comp_id: int) -> str:
        props: list[tuple[str, str]] = [
            ("Codigo", str(comp_id)),
            ("Nome", f.nome),
            ("Aba", f.aba),
            ("Altura", str(f.altura)),
            ("Ordem", str(comp_id)),
            ("PosicaoX", str(f.posicao_x)),
            ("PosicaoY", str(f.posicao_y)),
            ("Tamanho", str(f.tamanho)),
            ("Dica", ""),
            ("Visivel", "True"),
        ]

        tipo_defaults = _COMPONENT_TYPE_DEFAULTS.get(f.tipo, {})
        for k, v in tipo_defaults.items():
            props.append((k, v))

        if f.campo and f.tipo not in ("P", "V", "L"):
            props.append(("Campo", f.campo))
        if f.descricao or f.tipo not in ("P", "V"):
            props.append(("Descricao", f.descricao or f.nome))
        if f.container:
            props.append(("Container", f.container))

        for k, v in f.properties.items():
            if k == "SQL":
                props.append((k, xml_escape_content(v)))
            else:
                props.append((k, v))

        props_xml = "\n".join(
            f'                <property name="{k}">{v}</property>' for k, v in props
        )

        events_xml = self._render_events(f.eventos)

        return (
            f'            <component COM_CODIGO="{comp_id}" COM_TIPO="{f.tipo}" name="{f.nome}">\n'
            f'{props_xml}\n'
            f'{events_xml}\n'
            f'            </component>'
        )

    @staticmethod
    def _render_events(eventos: dict[str, list[EventBinding]]) -> str:
        if not eventos:
            return ""
        ev_parts: list[str] = []
        for ev_name, bindings in eventos.items():
            for eb in bindings:
                entrada_cdata = eb.entrada or ""
                ev_parts.append(
                    f'            <event name="{ev_name}">\n'
                    f'                <action name="12">\n'
                    f'                    <property name="ACC_CONDICAO"></property>\n'
                    f'                    <param name="Entrada"><![CDATA[{entrada_cdata}]]></param>\n'
                    f'                    <param name="Nome"><![CDATA[{eb.rule_name}]]></param>\n'
                    f'                </action>\n'
                    f'            </event>'
                )
        return "\n".join(ev_parts)


# ---------------------------------------------------------------------------
# FrzBuilder — orquestrador final
# ---------------------------------------------------------------------------

class FrzBuilder:
    """Gera o XML completo do FRZ e grava como arquivo .frz.

    Suporta multiplos formularios, tabelas, entidades, dados e regras em um unico FRZ.
    """

    def __init__(
        self,
        rules: list[RuleSpec] | None = None,
        forms: list[FormSpec] | None = None,
        tables: list[TableSpec] | None = None,
        form: FormSpec | None = None,
        entities: list[EntitySpec] | None = None,
        datapackets: list[DataPacketSpec] | None = None,
    ):
        self.rules = rules or []
        self.forms = forms or ([form] if form else [])
        self.tables = tables or []
        self.entities = entities or []
        self.datapackets = datapackets or []

    def build_xml(self) -> str:
        now = datetime.now().strftime("%d/%m/%Y %H:%M")

        rules_xml = ""
        if self.rules:
            rule_parts = []
            for rule_spec in self.rules:
                rb = RuleBuilder(rule_spec)
                _, _, props = rb.build()
                rule_xml = self._rule_to_xml(props)
                rule_parts.append(rule_xml)
            rules_xml = "\n".join(rule_parts)

        tables_xml = self._build_tables_xml()
        dd_tempo = ""
        if self.tables:
            dd_tempo = '    <tempo SESSION="DATADICTIONARY">00:00</tempo>\n'

        entity_schema_xml = self._build_entity_schema_xml()
        datapackets_xml = self._build_datapackets_xml()

        systems_xml = self._build_systems_xml()

        return (
            '<?xml version="1.0" encoding="iso-8859-1" ?>\n'
            '<fmaker version="2.3" maker_version="6.1.0.14"  xml:space="preserve">\n'
            '    <global>\n'
            f'{entity_schema_xml}'
            f'{tables_xml}'
            f'{dd_tempo}'
            f'{datapackets_xml}'
            '        <rules>\n'
            f'{rules_xml}\n'
            '        </rules>\n'
            '    </global>\n'
            f'{systems_xml}\n'
            '<tempo SESSION="ALL">00:01</tempo>\n'
            f'<datageracao>{now}</datageracao>\n'
            '</fmaker>\n'
        )

    def _build_tables_xml(self) -> str:
        if not self.tables:
            return ""
        parts = ['        <tables>']
        for tbl in self.tables:
            desc = xml_escape_attr(tbl.descricao) if tbl.descricao else ""
            parts.append(f'            <table TAB_NOME="{tbl.nome}">')
            parts.append(
                f'                <property name="TAB_DESCRICAO">{desc}</property>'
            )
            for fld in tbl.campos:
                fd = xml_escape_attr(fld.descricao) if fld.descricao else ""
                parts.append(f'                <field CMP_NOME="{fld.nome}">')
                parts.append(
                    f'                    <property name="CMP_DESCRICAO">{fd}</property>'
                )
                parts.append(
                    f'                    <property name="CMP_VALORPADRAO">'
                    f'{fld.valor_padrao}</property>'
                )
                parts.append(
                    f'                    <property name="TPD_CODIGO">'
                    f'{fld.tipo}</property>'
                )
                parts.append('                </field>')
            parts.append('            </table>')
        parts.append('        </tables>')
        return "\n".join(parts) + "\n"

    def _build_entity_schema_xml(self) -> str:
        if not self.entities:
            return ""
        parts = ["        <ENTITY_SCHEMA>"]
        for ent in self.entities:
            parts.append(
                f'\t<ENTITY NAME="{ent.nome}" FRIENDLY_NAME="{ent._friendly}" '
                f'FORM="{ent._form}">'
            )
            for attr in ent.atributos:
                gen = "true" if attr.generated else "false"
                null = "true" if attr.nullable else "false"
                length_attr = f' LENGTH="{attr.tamanho}"' if attr.tipo != "boolean" and attr.tipo != "date" else ""
                parts.append(
                    f'\t\t<ATTRIBUTE GENERATED="{gen}" NAME="{attr.nome}" '
                    f'FRIENDLY_NAME="{attr._friendly}" NULLABLE="{null}" '
                    f'TYPE="{attr.tipo}"{length_attr}>'
                )
                parts.append(f"\t\t\t<DEFAULT>{attr.default}</DEFAULT>")
                parts.append(f'\t\t\t<MASK NAME="{attr.mascara}"></MASK>')
                parts.append("\t\t</ATTRIBUTE>")
            for key in ent.chaves:
                unique = "true" if key.unique else "false"
                primary = "true" if key.primary else "false"
                parts.append(
                    f'\t\t<KEY NAME="{key.nome}" UNIQUE="{unique}" PRIMARY="{primary}">'
                )
                for col in key.colunas:
                    parts.append(f'\t\t\t<ATTRIBUTE_NAME NAME="{col}"/>')
                parts.append("\t\t</KEY>")
            parts.append("\t</ENTITY>")
        parts.append("        </ENTITY_SCHEMA>")
        return "\n".join(parts) + "\n"

    def _build_datapackets_xml(self) -> str:
        if not self.datapackets:
            return ""
        parts = ["        <datapackets>"]
        for dp in self.datapackets:
            dp_guid = dp.guid or ("{" + str(uuid.uuid4()).upper() + "}")
            friendly = dp.friendly_name or dp.entity_name.lower()
            form = dp.form or dp.entity_name.lower()

            attrs = dp.atributos or []
            entity_for_lookup = next(
                (e for e in self.entities if e.nome == dp.entity_name), None
            )
            if not attrs and entity_for_lookup:
                attrs = entity_for_lookup.atributos

            meta_attrs = []
            for a in attrs:
                length_attr = f' LENGTH="{a.tamanho}"' if a.tipo not in ("boolean", "date") else ""
                meta_attrs.append(
                    f'<ATTRIBUTE NAME="{a.nome}" FRIENDLY_NAME="{a._friendly.lower()}" '
                    f'TYPE="{a.tipo}"{length_attr}/>'
                )
            meta_str = "".join(meta_attrs)

            parts.append(
                f'        <DATA ID="{dp_guid}">'
                f'<METADATA><ENTITY NAME="{dp.entity_name}" '
                f'FRIENDLY_NAME="{friendly}" FORM="{form}">'
                f'{meta_str}</ENTITY></METADATA>'
            )

            if dp.linhas:
                parts.append("<DATASET>")
                for row in dp.linhas:
                    fields: list[str] = []
                    for a in attrs:
                        val = row.campos.get(a.nome)
                        if val is None:
                            fields.append(f'<FIELD NAME="{a.nome}" ISNULL="true"/>')
                        else:
                            fields.append(
                                f'<FIELD NAME="{a.nome}" ISNULL="false">{val}</FIELD>'
                            )
                    parts.append("<ROW>" + "".join(fields) + "</ROW>")
                parts.append("</DATASET>")

            parts.append("</DATA>\n")
        parts.append("        </datapackets>")
        return "\n".join(parts) + "\n"

    def _build_systems_xml(self) -> str:
        if not self.forms:
            return (
                '    <system SIS_CODIGO="SISTEMA">\n'
                '        <tempo SESSION="FORMS">00:01</tempo>\n'
                '    </system>'
            )

        by_sistema: dict[str, list[FormSpec]] = {}
        for fs in self.forms:
            by_sistema.setdefault(fs.sistema, []).append(fs)

        parts: list[str] = []
        for sistema, form_specs in by_sistema.items():
            parts.append(f'    <system SIS_CODIGO="{sistema}">')
            for fs in form_specs:
                fb = FormBuilder(fs)
                parts.append(fb.build())
            parts.append('        <tempo SESSION="FORMS">00:01</tempo>')
            parts.append('    </system>')

        return "\n".join(parts)

    def write(self, output_path: str) -> str:
        xml = self.build_xml()
        xml_crlf = xml.replace("\r\n", "\n").replace("\n", "\r\n")
        xml_bytes = xml_crlf.encode("iso-8859-1")
        return write_frz(xml_bytes, output_path)

    def _rule_to_xml(self, props: dict[str, str]) -> str:
        nome = props["REG_NOME"]
        cod = props["REG_COD"]
        dfm_b64 = props["REG_INTERFACE"]
        script_b64 = props["REG_SCRIPT"]

        prop_lines = []
        for key in [
            "REG_COD", "REG_NOME", "REG_DESCRICAO", "REG_PARAMS",
            "REG_VARIAVEIS", "REG_PARAMS_OUT", "REG_DATA", "REG_HORA",
            "REG_COMPILADA", "REG_DESTINO", "REG_HASH",
        ]:
            prop_lines.append(
                f'                <property name="{key}">{props.get(key, "")}</property>'
            )

        prop_lines.append(
            f'                <property name="REG_INTERFACE" binary-encoded="True">'
            f'<![CDATA[{dfm_b64}]]></property>'
        )
        prop_lines.append(
            f'                <property name="REG_SCRIPT" binary-encoded="True">'
            f'<![CDATA[{script_b64}]]></property>'
        )

        cat = props.get("CAT_PATH", "")
        if cat:
            prop_lines.append(
                f'                <property name="CAT_PATH"><![CDATA[{cat}]]></property>'
            )

        return (
            f'            <rule REG_NOME="{nome}" REG_COD="{cod}">\n'
            + "\n".join(prop_lines) + "\n"
            + "            </rule>"
        )

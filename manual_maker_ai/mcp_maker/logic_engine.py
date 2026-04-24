"""Motor logico para geracao de regras de negocio enterprise.

Transpoe requisitos de negocio para a estrutura de fluxogramas nativos do Maker,
garantindo maxima eficiencia na execucao das regras de negocio.

Arquitetura de camadas:
- Cliente (destino=1, JS): interatividade imediata, manipulacao de UI, calculos em tempo real
- Servidor (destino=2, Java/Tomcat): transacoes SQL, integridade, processamento pesado

Inferido de: 2445 regras reais, 1186 funcoes nativas, 10 atividades.
Picos reais: 94 decisoes em uma regra, 416K chars de script, WHILE loops, CALLRULE aninhados.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


# ---------------------------------------------------------------------------
# Funcoes categorizadas por camada de execucao
# ---------------------------------------------------------------------------

_SERVER_ONLY_FUNCTIONS = frozenset({
    "ebfSQLExecuteQuery", "ebfSQLExecuteUpdate", "ebfSQLField",
    "ebfSQLClose", "ebfSQLNext", "ebfSQLEOF",
    "ebfFileOpenToWrite", "ebfFileOpenToRead", "ebfFileAppend",
    "ebfFileReadAll", "ebfFileClose", "ebfFileTempDir",
    "ebfAuthUser", "ebfGetUserCode", "ebfGetUserName",
    "ebfSendMail", "ebfSendMailHtml",
    "ebfCreateObjectJSON", "ebfResultSetToJSON",
})

_CLIENT_ONLY_FUNCTIONS = frozenset({
    "ebfFormChangeComponentValue", "ebfFormGetComponentValue",
    "ebfFormSetVisible", "ebfFormSetEnabled", "ebfFormSetRequired",
    "ebfFormIsInBrowserMode", "ebfFormOpenForm",
    "ebfHtmlCreateHtmlElement", "ebfHtmlGetElementById",
    "ebfHtmlSetAttribute", "ebfHtmlInnerHtml", "ebfHtmlAppend",
    "ebfHtmlAttachFlowEvent", "ebfHtmlCssAddClass", "ebfHtmlCssDefineStyle",
    "ebfLocalStorageGet", "ebfLocalStorageSet",
    "ebfExecuteJS", "ebfDonwloadStart",
    "ebfChangeComponentValueOtherForm",
})

_DUAL_FUNCTIONS = frozenset({
    "isNullOrEmpty", "isEqual", "isGreater", "isMinor",
    "isMinorOrEqual", "isGreaterOrEqual",
    "oprNot", "oprOr", "oprAnd", "oprIf",
    "ebfConcat", "ebfReplace", "ebfReplaceAll", "ebfSplit",
    "toString", "toDate", "toInteger", "toFloat",
    "ebfDateToday", "ebfDateTimeNow",
    "ebfListParamsCreate", "ebfListCreate",
    "ebfGetElementFromList", "ebfListLength",
    "ebfMapCreateFromList", "ebfMapGetObject",
    "ebfGetValueObjectJson", "ebfJSONParamsCreate",
    "ebfSetComponentProperty", "ebfGetComponentProperty",
    "ebfFlowExecute",
    "ActNewErrorMessage", "ActNewWarningMessage",
    "ActNewSuccessMessage", "ActNewPromptMessage",
    "ActNewInteractionConfirmMessage",
    "ActShowProgressBar", "ActIncProgressBar", "ActCloseProgressBar",
})


# ---------------------------------------------------------------------------
# Matriz de eventos por ciclo de vida
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class EventSpec:
    nome: str
    fase: str
    camada_preferida: int
    descricao: str


EVENT_LIFECYCLE: dict[str, EventSpec] = {
    # --- Eventos de formulario (componente F) - ciclo CRUD do WebRun engine ---
    "Ao Entrar": EventSpec(
        "Ao Entrar", "inicializacao", 1,
        "DOM: onload/onfocus. Disparado ao abrir o formulario. "
        "Uso: carregar combos, aplicar mascaras, configurar visibilidade inicial. "
        "Componentes: F.",
    ),
    "Antes de Inserir": EventSpec(
        "Antes de Inserir", "pre-persistencia", 2,
        "Engine WebRun (pre-INSERT). Disparado antes de criar novo registro. "
        "Uso: validar campos obrigatorios, verificar duplicidade, gerar sequencial, preencher defaults. "
        "Componentes: F.",
    ),
    "Antes de Alterar": EventSpec(
        "Antes de Alterar", "pre-persistencia", 2,
        "Engine WebRun (pre-UPDATE). Disparado antes de atualizar registro existente. "
        "Uso: validar campos obrigatorios, verificar duplicidade (excluindo atual), regras de negocio. "
        "Componentes: F.",
    ),
    "Depois de Inserir": EventSpec(
        "Depois de Inserir", "pos-persistencia", 2,
        "Engine WebRun (pos-INSERT). Disparado apos criar registro. "
        "Uso: criar registros filhos, disparar integracoes, enviar notificacoes. "
        "Componentes: F.",
    ),
    "Depois de Alterar": EventSpec(
        "Depois de Alterar", "pos-persistencia", 2,
        "Engine WebRun (pos-UPDATE). Disparado apos atualizar registro. "
        "Uso: atualizar totalizadores, sincronizar tabelas, gerar logs. "
        "Componentes: F.",
    ),
    "Antes de Deletar": EventSpec(
        "Antes de Deletar", "pre-persistencia", 2,
        "Engine WebRun (pre-DELETE). Disparado antes de excluir. "
        "Uso: verificar integridade referencial, impedir exclusao com registros filhos. "
        "Componentes: F.",
    ),
    "Depois de Deletar": EventSpec(
        "Depois de Deletar", "pos-persistencia", 2,
        "Engine WebRun (pos-DELETE). Disparado apos excluir. "
        "Uso: limpar registros orfaos, recalcular totalizadores. "
        "Componentes: F.",
    ),
    "Ao Navegar": EventSpec(
        "Ao Navegar", "interacao", 1,
        "Engine WebRun. Disparado ao mudar de registro na navegacao. "
        "Uso: atualizar campos dependentes, recarregar dados relacionados. "
        "Componentes: F.",
    ),
    # --- Eventos de componente - mapeados do DOM pelo wfr.js ---
    "Ao Clicar": EventSpec(
        "Ao Clicar", "interacao", 1,
        "DOM: onclick. Disparado ao clicar no componente. "
        "Uso: acoes de botao, abrir forms, chamar APIs, selecionar item. "
        "Componentes: B, E, L, G, I, H, R, M, P, K.",
    ),
    "Ao Modificar": EventSpec(
        "Ao Modificar", "interacao", 1,
        "DOM: onchange. Disparado quando o valor do campo muda e perde foco. "
        "Uso: calculos em tempo real, toggle visibilidade, auto-preenchimento, validacao inline. "
        "Componentes: E, C, K, M, H, R, G.",
    ),
    "Ao Sair": EventSpec(
        "Ao Sair", "interacao", 1,
        "DOM: onblur. Disparado quando o campo perde foco. "
        "Uso: validacao de formato, busca CEP, consulta CNPJ em API externa. "
        "Componentes: E, C, K, M.",
    ),
    "Ao Duplo Clicar": EventSpec(
        "Ao Duplo Clicar", "interacao", 1,
        "DOM: ondblclick. Disparado ao duplo clique no componente. "
        "Uso: abrir detalhe de registro, editar inline. "
        "Componentes: G, E, L.",
    ),
    "Ao Pressionar Tecla": EventSpec(
        "Ao Pressionar Tecla", "interacao", 1,
        "DOM: onkeydown. Disparado ao pressionar tecla no componente. "
        "Uso: atalhos de teclado, interceptar Enter/Tab/Esc. "
        "Componentes: E, M, C, K.",
    ),
}

# Matriz de eventos por tipo de componente (COM_TIPO)
# Fonte de verdade para vincular eventos a componentes no FRZ.
COMPONENT_EVENTS: dict[str, list[str]] = {
    "F": [  # Form (formulario) - eventos do ciclo CRUD
        "Ao Entrar", "Antes de Inserir", "Antes de Alterar",
        "Antes de Deletar", "Depois de Inserir", "Depois de Alterar",
        "Depois de Deletar", "Ao Navegar",
    ],
    "E": [  # HTMLEdit - campo texto
        "Ao Modificar", "Ao Clicar", "Ao Sair", "Ao Duplo Clicar", "Ao Pressionar Tecla",
    ],
    "C": [  # HTMLComboBox - lista suspensa
        "Ao Modificar", "Ao Sair",
    ],
    "K": [  # HTMLLookup - campo com consulta
        "Ao Modificar", "Ao Sair",
    ],
    "B": [  # HTMLButton - botao
        "Ao Clicar",
    ],
    "G": [  # HTMLGrid - grade de dados
        "Ao Clicar", "Ao Duplo Clicar", "Ao Modificar",
    ],
    "M": [  # HTMLMemo - campo texto multilinha
        "Ao Modificar", "Ao Clicar", "Ao Sair", "Ao Pressionar Tecla",
    ],
    "H": [  # HTMLCheckbox
        "Ao Modificar", "Ao Clicar",
    ],
    "R": [  # HTMLRadioGroup
        "Ao Modificar", "Ao Clicar",
    ],
    "L": [  # HTMLLabel
        "Ao Clicar", "Ao Duplo Clicar",
    ],
    "P": [  # Container/Painel
        "Ao Clicar",
    ],
    "I": [  # Image
        "Ao Clicar", "Ao Duplo Clicar",
    ],
    "A": [  # Attachment (anexo)
        "Ao Modificar",
    ],
    "W": [],  # Container Web - sem eventos proprios
    "S": [],  # Shape/Separador - sem eventos proprios
}


# ---------------------------------------------------------------------------
# Decisao automatica de camada
# ---------------------------------------------------------------------------

def classify_layer(functions_used: list[str]) -> int:
    """Determina automaticamente a camada de execucao (1=cliente, 2=servidor)
    baseado nas funcoes utilizadas no fluxo.

    Regra: se QUALQUER funcao e exclusiva de servidor, destino=2.
    Se todas sao exclusivas de cliente, destino=1.
    Se mistas (dual), prioriza servidor para seguranca.
    """
    has_server = any(f in _SERVER_ONLY_FUNCTIONS for f in functions_used)
    has_client = any(f in _CLIENT_ONLY_FUNCTIONS for f in functions_used)

    if has_server and has_client:
        return -1
    if has_server:
        return 2
    if has_client:
        return 1
    return 2


def split_into_layers(steps: list[dict]) -> tuple[list[dict], list[dict]]:
    """Separa passos em duas camadas quando ha funcoes incompativeis.

    Retorna (passos_cliente, passos_servidor).
    Funcoes dual ficam na camada onde fazem mais sentido contextual.
    """
    client_steps = []
    server_steps = []

    for step in steps:
        funcs = _extract_functions(step)
        layer = classify_layer(funcs)
        if layer == 1:
            client_steps.append(step)
        else:
            server_steps.append(step)

    return client_steps, server_steps


def _extract_functions(step: dict) -> list[str]:
    """Extrai todas as funcoes referenciadas em um passo (recursivo)."""
    funcs = []
    if step.get("funcao"):
        funcs.append(step["funcao"])
    for p in step.get("params", []):
        if isinstance(p, dict):
            if p.get("tipo") == "funcao":
                funcs.append(p.get("funcao", ""))
                funcs.extend(_extract_functions(p))
    for branch in ("sim", "nao"):
        for sub in step.get(branch, []):
            funcs.extend(_extract_functions(sub))
    return [f for f in funcs if f]


# ---------------------------------------------------------------------------
# Biblioteca de padroes de fluxo (Flow Patterns)
# ---------------------------------------------------------------------------

def pattern_sql_select(
    sql: str,
    campos: list[str],
    binds: list[dict] | None = None,
    var_prefix: str = "v",
) -> dict:
    """Padrao SQL Select: query → extrai campos → fecha.
    Baseado no padrao #1 (712 usos reais).
    """
    binds = binds or []
    passos = []

    passos.append({
        "tipo": "expressao",
        "nome": "sqlQuery",
        "descricao": "Abrir consulta",
        "funcao": "ebfSQLExecuteQuery",
        "nome_amigavel": "Abrir Consulta",
        "params": [
            {"tipo": "sql", "sql": sql, "binds": binds},
            {"tipo": "constante", "valor": None, "tipo_dado": "Letras"},
        ],
        "retorno": f"{var_prefix}Query",
        "tipo_retorno": "Tabela",
    })

    for campo in campos:
        var_name = f"{var_prefix}{campo.replace('.', '_')}"
        passos.append({
            "tipo": "expressao",
            "nome": f"get{campo}",
            "descricao": f"Obter {campo}",
            "funcao": "ebfSQLField",
            "nome_amigavel": "Campo",
            "params": [
                {"tipo": "variavel", "nome": f"{var_prefix}Query"},
                {"tipo": "constante", "valor": campo, "tipo_dado": "Campo"},
            ],
            "retorno": var_name,
            "tipo_retorno": "Variante",
        })

    passos.append({
        "tipo": "expressao",
        "nome": "sqlClose",
        "descricao": "Fechar consulta",
        "funcao": "ebfSQLClose",
        "nome_amigavel": "Fechar Consulta",
        "params": [
            {"tipo": "variavel", "nome": f"{var_prefix}Query"},
        ],
        "retorno": "",
        "tipo_retorno": "Variante",
    })

    return {
        "passos": passos,
        "variaveis": [
            {"nome": f"{var_prefix}Query", "tipo": "Tabela"},
        ] + [
            {"nome": f"{var_prefix}{c.replace('.', '_')}", "tipo": "Variante"}
            for c in campos
        ],
    }


def pattern_sql_execute(
    sql: str,
    binds: list[dict] | None = None,
) -> dict:
    """Padrao SQL Execute: INSERT/UPDATE/DELETE sem retorno.
    Baseado no padrao #2 (493 usos reais).
    """
    binds = binds or []
    return {
        "passos": [{
            "tipo": "expressao",
            "nome": "sqlExec",
            "descricao": "Executar SQL",
            "funcao": "ebfSQLExecuteUpdate",
            "nome_amigavel": "Executar SQL",
            "params": [
                {"tipo": "sql", "sql": sql, "binds": binds},
            ],
            "retorno": "",
            "tipo_retorno": "Variante",
        }],
        "variaveis": [],
    }


def pattern_sql_loop(
    sql: str,
    campos: list[str],
    body_steps: list[dict],
    binds: list[dict] | None = None,
    var_prefix: str = "v",
) -> dict:
    """Padrao SQL Loop: itera registros com WHILE + EOF.
    Baseado no padrao #13 (473 usos de ebfSQLEOF).
    """
    binds = binds or []

    field_extractions = []
    for campo in campos:
        var_name = f"{var_prefix}{campo.replace('.', '_')}"
        field_extractions.append({
            "tipo": "expressao",
            "nome": f"getLoop{campo}",
            "descricao": f"Obter {campo}",
            "funcao": "ebfSQLField",
            "nome_amigavel": "Campo",
            "params": [
                {"tipo": "variavel", "nome": f"{var_prefix}Cursor"},
                {"tipo": "constante", "valor": campo, "tipo_dado": "Campo"},
            ],
            "retorno": var_name,
            "tipo_retorno": "Variante",
        })

    next_step = {
        "tipo": "expressao",
        "nome": "sqlNext",
        "descricao": "Proxima linha",
        "funcao": "ebfSQLNext",
        "nome_amigavel": "Proxima Linha",
        "params": [{"tipo": "variavel", "nome": f"{var_prefix}Cursor"}],
        "retorno": "",
        "tipo_retorno": "Variante",
    }

    loop_body = field_extractions + body_steps + [next_step]

    passos = [
        {
            "tipo": "expressao",
            "nome": "sqlOpen",
            "descricao": "Abrir cursor",
            "funcao": "ebfSQLExecuteQuery",
            "nome_amigavel": "Abrir Consulta",
            "params": [
                {"tipo": "sql", "sql": sql, "binds": binds},
                {"tipo": "constante", "valor": None, "tipo_dado": "Letras"},
            ],
            "retorno": f"{var_prefix}Cursor",
            "tipo_retorno": "Tabela",
        },
        {
            "tipo": "while",
            "nome": "loopRegistros",
            "descricao": "Iterar registros",
            "funcao": "oprNot",
            "nome_amigavel": "Nao",
            "params": [
                {"tipo": "funcao", "funcao": "ebfSQLEOF",
                 "nome_amigavel": "Fim da Consulta?",
                 "params": [{"tipo": "variavel", "nome": f"{var_prefix}Cursor"}],
                 "tipo_retorno": "Logico"},
            ],
            "corpo": loop_body,
        },
        {
            "tipo": "expressao",
            "nome": "sqlCloseCursor",
            "descricao": "Fechar cursor",
            "funcao": "ebfSQLClose",
            "nome_amigavel": "Fechar Consulta",
            "params": [{"tipo": "variavel", "nome": f"{var_prefix}Cursor"}],
            "retorno": "",
            "tipo_retorno": "Variante",
        },
    ]

    return {
        "passos": passos,
        "variaveis": [
            {"nome": f"{var_prefix}Cursor", "tipo": "Tabela"},
        ] + [
            {"nome": f"{var_prefix}{c.replace('.', '_')}", "tipo": "Variante"}
            for c in campos
        ],
    }


def pattern_null_guard(
    var_nome: str,
    label: str,
    on_null: list[dict] | None = None,
    on_valid: list[dict] | None = None,
    error_message: str = "",
) -> dict:
    """Padrao de guarda nulo: valida campo e desvia.
    Baseado no padrao #7 (1461 usos de isNullOrEmpty).
    """
    if not error_message:
        error_message = f"O campo '{label}' e obrigatorio."

    default_on_null = [{
        "tipo": "atividade",
        "nome": f"err{var_nome}",
        "activity_id": 7,
        "object_name": "ActNewErrorMessage",
        "real_name": "ActNewErrorMessage",
        "params": [
            {"target_param_name": "Titulo",
             "value": {"tipo": "constante", "valor": "Validacao", "tipo_dado": "Letras"}},
            {"target_param_name": "Mensagem",
             "value": {"tipo": "constante", "valor": error_message, "tipo_dado": "Letras"}},
        ],
        "description": f"Erro: {label} obrigatorio",
    }]

    return {
        "tipo": "decisao",
        "nome": f"chk{var_nome}",
        "descricao": f"{label} vazio?",
        "funcao": "isNullOrEmpty",
        "nome_amigavel": "Vazio ou Nulo?",
        "params": [{"tipo": "variavel", "nome": var_nome}],
        "sim": on_null or default_on_null,
        "nao": on_valid or [],
    }


def pattern_equality_check(
    var_nome: str,
    valor: str,
    label: str,
    on_true: list[dict] | None = None,
    on_false: list[dict] | None = None,
) -> dict:
    """Padrao de comparacao: desvia baseado em igualdade.
    Baseado no padrao #7 (879 usos de isEqual).
    """
    return {
        "tipo": "decisao",
        "nome": f"cmp{var_nome}",
        "descricao": f"{label} = {valor}?",
        "funcao": "isEqual",
        "nome_amigavel": "Igual?",
        "params": [
            {"tipo": "variavel", "nome": var_nome},
            {"tipo": "constante", "valor": valor, "tipo_dado": "Letras"},
        ],
        "sim": on_true or [],
        "nao": on_false or [],
    }


def pattern_change_component(
    componente: str,
    valor: str,
    form_guid: str = "",
) -> dict:
    """Padrao de alteracao de valor de componente (cliente).
    Baseado no padrao #10 (800 usos de ebfFormChangeComponentValue).
    """
    params = []
    if form_guid:
        params.append({"tipo": "constante", "valor": form_guid,
                       "tipo_dado": "Formulario", "guid": form_guid})
    else:
        params.append({"tipo": "constante", "valor": "", "tipo_dado": "Formulario"})

    params.extend([
        {"tipo": "constante", "valor": componente, "tipo_dado": "Componente"},
        {"tipo": "constante", "valor": valor, "tipo_dado": "Letras"},
    ])

    return {
        "tipo": "expressao",
        "nome": f"set{componente}",
        "descricao": f"Alterar {componente}",
        "funcao": "ebfFormChangeComponentValue",
        "nome_amigavel": "Alterar Valor do Componente",
        "params": params,
        "retorno": "",
        "tipo_retorno": "Variante",
    }


def pattern_set_visibility(
    componente: str,
    visivel: bool,
) -> dict:
    """Padrao de visibilidade de componente (cliente).
    Baseado em 319 usos de ebfFormSetVisible.
    """
    return {
        "tipo": "expressao",
        "nome": f"vis{componente}",
        "descricao": f"{'Mostrar' if visivel else 'Ocultar'} {componente}",
        "funcao": "ebfFormSetVisible",
        "nome_amigavel": "Visivel?",
        "params": [
            {"tipo": "constante", "valor": "", "tipo_dado": "Formulario"},
            {"tipo": "constante", "valor": componente, "tipo_dado": "Componente"},
            {"tipo": "constante", "valor": "True" if visivel else "False",
             "tipo_dado": "Logico"},
        ],
        "retorno": "",
        "tipo_retorno": "Variante",
    }


def pattern_set_enabled(
    componente: str,
    habilitado: bool,
) -> dict:
    """Padrao de habilitacao de componente (cliente).
    Baseado em 225 usos de ebfFormSetEnabled.
    """
    return {
        "tipo": "expressao",
        "nome": f"enb{componente}",
        "descricao": f"{'Habilitar' if habilitado else 'Desabilitar'} {componente}",
        "funcao": "ebfFormSetEnabled",
        "nome_amigavel": "Habilitado?",
        "params": [
            {"tipo": "constante", "valor": "", "tipo_dado": "Formulario"},
            {"tipo": "constante", "valor": componente, "tipo_dado": "Componente"},
            {"tipo": "constante", "valor": "True" if habilitado else "False",
             "tipo_dado": "Logico"},
        ],
        "retorno": "",
        "tipo_retorno": "Variante",
    }


def pattern_callrule(
    rule_name: str,
    rule_id: int,
    params: list[dict],
    return_var: str = "",
) -> dict:
    """Padrao de sub-rotina: chama outro fluxo.
    Baseado no padrao #11 (1996 componentes TFlowSubRoutine).
    """
    sr_params = [
        {"target_param_name": p["target"], "value": p["value"]}
        for p in params
    ]

    return {
        "tipo": "subrotina",
        "nome": f"call{rule_name.replace(' ', '')}",
        "rule_name": rule_name,
        "rule_id": rule_id,
        "params": sr_params,
        "return_var": return_var,
        "description": f"Chamar {rule_name}",
    }


def pattern_json_build(
    campos: dict[str, str],
    var_json: str = "vJson",
) -> dict:
    """Padrao de construcao de JSON (servidor ou cliente).
    Baseado no padrao #3 (1532 usos de JSON).
    """
    passos = [{
        "tipo": "expressao",
        "nome": "createJson",
        "descricao": "Criar JSON",
        "funcao": "ebfCreateObjectJSON",
        "nome_amigavel": "Criar JSON",
        "params": [],
        "retorno": var_json,
        "tipo_retorno": "Variante",
    }]

    for key, value_var in campos.items():
        passos.append({
            "tipo": "expressao",
            "nome": f"jsonSet{key}",
            "descricao": f"JSON: definir {key}",
            "funcao": "ebfSetValueObjectJSON",
            "nome_amigavel": "JSON Definir Valor",
            "params": [
                {"tipo": "variavel", "nome": var_json},
                {"tipo": "constante", "valor": key, "tipo_dado": "Letras"},
                {"tipo": "variavel", "nome": value_var},
            ],
            "retorno": var_json,
            "tipo_retorno": "Variante",
        })

    return {
        "passos": passos,
        "variaveis": [{"nome": var_json, "tipo": "Variante"}],
    }


def pattern_success_message(mensagem: str) -> dict:
    """Padrao de mensagem de sucesso."""
    return {
        "tipo": "atividade",
        "nome": "msgSucesso",
        "activity_id": 9,
        "object_name": "ActNewSuccessMessage",
        "real_name": "ActNewSuccessMessage",
        "params": [
            {"target_param_name": "Titulo",
             "value": {"tipo": "constante", "valor": "Sucesso", "tipo_dado": "Letras"}},
            {"target_param_name": "Mensagem",
             "value": {"tipo": "constante", "valor": mensagem, "tipo_dado": "Letras"}},
        ],
        "description": "Mensagem de sucesso",
    }


def pattern_confirmation(
    mensagem: str,
    on_confirm: list[dict],
    on_cancel: list[dict] | None = None,
    var_resposta: str = "vResposta",
) -> dict:
    """Padrao de confirmacao interativa com decisao."""
    return {
        "tipo": "decisao",
        "nome": "confirmacao",
        "descricao": "Confirmar acao?",
        "funcao": "isEqual",
        "nome_amigavel": "Igual?",
        "params": [
            {"tipo": "funcao", "funcao": "ActNewInteractionConfirmMessage",
             "nome_amigavel": "Interacao de Confirmacao",
             "params": [
                 {"tipo": "constante", "valor": "Confirmacao", "tipo_dado": "Letras"},
                 {"tipo": "constante", "valor": mensagem, "tipo_dado": "Letras"},
             ],
             "tipo_retorno": "Letras"},
            {"tipo": "constante", "valor": "S", "tipo_dado": "Letras"},
        ],
        "sim": on_confirm,
        "nao": on_cancel or [],
    }


def pattern_browser_mode_guard(on_browser: list[dict] | None = None) -> dict:
    """Padrao de guarda de modo navegacao: retorna imediatamente se em modo browse.
    Usado em 156 regras 'Ao Entrar' para evitar execucao durante navegacao.
    """
    return {
        "tipo": "decisao",
        "nome": "chkBrowserMode",
        "descricao": "Em modo navegacao?",
        "funcao": "ebfFormIsInBrowserMode",
        "nome_amigavel": "Esta em Modo de Navegacao?",
        "params": [],
        "sim": on_browser or [],
        "nao": [],
    }


def pattern_duplicity_check(
    tabela: str,
    campo: str,
    var_valor: str,
    var_id: str = "",
    error_message: str = "",
) -> dict:
    """Padrao de verificacao de duplicidade antes de gravar.
    Baseado em regras reais como 'Generico___Validacao_Duplicidade_Antes_d'.
    """
    if not error_message:
        error_message = f"Ja existe um registro com este valor de {campo}."

    where_id = f" AND {tabela}.{campo.split('_')[0]}_COD <> :pId" if var_id else ""
    sql = (f"Select COUNT(*) as QTD From {tabela} "
           f"Where {tabela}.{campo} = :pValor{where_id}")

    binds = [{"nome": "pValor", "variavel": var_valor}]
    if var_id:
        binds.append({"nome": "pId", "variavel": var_id})

    return {
        "passos": [
            {
                "tipo": "expressao",
                "nome": "sqlDup",
                "descricao": "Verificar duplicidade",
                "funcao": "ebfSQLExecuteQuery",
                "nome_amigavel": "Abrir Consulta",
                "params": [
                    {"tipo": "sql", "sql": sql, "binds": binds},
                    {"tipo": "constante", "valor": None, "tipo_dado": "Letras"},
                ],
                "retorno": "vDupQuery",
                "tipo_retorno": "Tabela",
            },
            {
                "tipo": "expressao",
                "nome": "getDupCount",
                "descricao": "Obter contagem",
                "funcao": "ebfSQLField",
                "nome_amigavel": "Campo",
                "params": [
                    {"tipo": "variavel", "nome": "vDupQuery"},
                    {"tipo": "constante", "valor": "QTD", "tipo_dado": "Campo"},
                ],
                "retorno": "vDupCount",
                "tipo_retorno": "Variante",
            },
            {
                "tipo": "expressao",
                "nome": "closeDup",
                "descricao": "Fechar consulta",
                "funcao": "ebfSQLClose",
                "nome_amigavel": "Fechar Consulta",
                "params": [{"tipo": "variavel", "nome": "vDupQuery"}],
                "retorno": "",
                "tipo_retorno": "Variante",
            },
            {
                "tipo": "decisao",
                "nome": "chkDup",
                "descricao": "Duplicidade encontrada?",
                "funcao": "isGreater",
                "nome_amigavel": "Maior?",
                "params": [
                    {"tipo": "variavel", "nome": "vDupCount"},
                    {"tipo": "constante", "valor": "0", "tipo_dado": "Inteiro"},
                ],
                "sim": [{
                    "tipo": "atividade",
                    "nome": "errDup",
                    "activity_id": 7,
                    "object_name": "ActNewErrorMessage",
                    "real_name": "ActNewErrorMessage",
                    "params": [
                        {"target_param_name": "Titulo",
                         "value": {"tipo": "constante", "valor": "Duplicidade",
                                   "tipo_dado": "Letras"}},
                        {"target_param_name": "Mensagem",
                         "value": {"tipo": "constante", "valor": error_message,
                                   "tipo_dado": "Letras"}},
                    ],
                    "description": "Erro: registro duplicado",
                }],
                "nao": [],
            },
        ],
        "variaveis": [
            {"nome": "vDupQuery", "tipo": "Tabela"},
            {"nome": "vDupCount", "tipo": "Variante"},
        ],
    }


def _normalize_steps(steps: list[dict]) -> list[dict]:
    """Normaliza passos convertendo 'while' em 'decisao' com loop=true.
    Garante compatibilidade com o pipeline Rust e Python.
    """
    result = []
    for s in steps:
        s = dict(s)
        if s.get("tipo") == "while":
            s["tipo"] = "decisao"
            s["loop"] = True
            s["sim"] = _normalize_steps(s.pop("corpo", []))
            s["nao"] = []
        else:
            if "sim" in s:
                s["sim"] = _normalize_steps(s["sim"])
            if "nao" in s:
                s["nao"] = _normalize_steps(s["nao"])
        result.append(s)
    return result


# ---------------------------------------------------------------------------
# Compositor de regras complexas
# ---------------------------------------------------------------------------

@dataclass
class RuleBlueprint:
    """Blueprint de uma regra de negocio completa.
    Permite composicao modular antes de serializar para JSON/FRZ.
    """
    nome: str
    destino: int = 0
    codigo: int = 0
    descricao: str = ""
    categoria: str = r"\Uso Geral"
    parametros: list[dict] = field(default_factory=list)
    variaveis: list[dict] = field(default_factory=list)
    retorno_tipo: str = ""
    passos: list[dict] = field(default_factory=list)

    def add_param(self, nome: str, tipo: str = "Letras", tamanho: str = "") -> "RuleBlueprint":
        self.parametros.append({"nome": nome, "tipo": tipo, "tamanho": tamanho})
        return self

    def add_var(self, nome: str, tipo: str = "Variante", tamanho: str = "") -> "RuleBlueprint":
        if not any(v["nome"] == nome for v in self.variaveis):
            self.variaveis.append({"nome": nome, "tipo": tipo, "tamanho": tamanho})
        return self

    def add_step(self, step: dict) -> "RuleBlueprint":
        self.passos.append(step)
        return self

    def add_pattern(self, pattern_result: dict) -> "RuleBlueprint":
        """Adiciona resultado de pattern_* (que retorna {passos, variaveis})."""
        if "passos" in pattern_result:
            self.passos.extend(pattern_result["passos"])
        elif "tipo" in pattern_result:
            self.passos.append(pattern_result)
        for v in pattern_result.get("variaveis", []):
            self.add_var(v["nome"], v.get("tipo", "Variante"), v.get("tamanho", ""))
        return self

    def auto_classify(self) -> "RuleBlueprint":
        """Determina automaticamente o destino baseado nas funcoes usadas."""
        all_funcs = []
        for step in self.passos:
            all_funcs.extend(_extract_functions(step))
        self.destino = classify_layer(all_funcs)
        return self

    def to_spec(self) -> dict:
        if self.destino == 0:
            self.auto_classify()
        return {
            "nome": self.nome,
            "destino": self.destino,
            "codigo": self.codigo,
            "descricao": self.descricao or self.nome,
            "retorno_tipo": self.retorno_tipo,
            "categoria": self.categoria,
            "parametros": self.parametros,
            "variaveis": self.variaveis,
            "passos": _normalize_steps(self.passos),
        }


# ---------------------------------------------------------------------------
# Compositor de regras vinculadas a eventos
# ---------------------------------------------------------------------------

@dataclass
class EventRuleBinding:
    """Vinculacao de regra a evento de componente."""
    evento: str
    regra: str
    entrada: str = ""
    componente: str = ""


def build_event_bindings(
    campos: list[dict],
    tabela: str,
    rules: list[RuleBlueprint],
) -> tuple[dict[str, list[dict]], list[EventRuleBinding]]:
    """Constroi vinculacoes de evento automaticas baseadas no contexto.

    Retorna: (eventos_form, bindings_componentes)
    """
    eventos_form: dict[str, list[dict]] = {}
    bindings: list[EventRuleBinding] = []

    required = [c for c in campos if c.get("obrigatorio")]
    has_validation_server = any(r.destino == 2 and "Validar" in r.nome for r in rules)
    has_mask_rule = any("Mascara" in r.nome for r in rules)

    if has_validation_server:
        rule = next(r for r in rules if r.destino == 2 and "Validar" in r.nome)
        entrada = ";".join(
            f"p{c.get('campo', c['nome'])}={c['nome']}" for c in required
        )
        eventos_form.setdefault("Antes de Inserir", []).append({
            "regra": rule.nome,
            "entrada": entrada,
        })
        eventos_form.setdefault("Antes de Alterar", []).append({
            "regra": rule.nome,
            "entrada": entrada,
        })

    if has_mask_rule:
        rule = next(r for r in rules if "Mascara" in r.nome)
        eventos_form.setdefault("Ao Entrar", []).append({
            "regra": rule.nome,
            "entrada": "",
        })

    for r in rules:
        if r.destino == 1 and "Ao Modificar" in r.descricao:
            for c in campos:
                if c.get("campo") and c["campo"] in r.descricao:
                    bindings.append(EventRuleBinding(
                        evento="Ao Modificar",
                        regra=r.nome,
                        entrada=f"pValor={c['nome']}",
                        componente=c["nome"],
                    ))

    return eventos_form, bindings


# ---------------------------------------------------------------------------
# Gerador de regras completas a partir de requisitos
# ---------------------------------------------------------------------------

def generate_crud_rules(
    tabela: str,
    campos: list[dict],
    codigo_base: int = 9001,
) -> list[RuleBlueprint]:
    """Gera conjunto completo de regras para um CRUD enterprise.

    Retorna lista de RuleBlueprint prontos para serializar.
    Separacao rigida: validacao servidor + validacao cliente + mascaras.
    """
    rules: list[RuleBlueprint] = []
    required = [c for c in campos if c.get("obrigatorio")]

    if required:
        srv = RuleBlueprint(
            nome=f"Validar {tabela} Servidor",
            destino=2,
            codigo=codigo_base,
            descricao=f"Validacao de integridade - {tabela}",
        )
        for c in required:
            campo = c.get("campo", c["nome"])
            label = c.get("descricao", campo)
            srv.add_param(f"p{campo}", "Letras")
            srv.add_step(pattern_null_guard(f"p{campo}", label))
        rules.append(srv)

        cli = RuleBlueprint(
            nome=f"Validar {tabela} Cliente",
            destino=1,
            codigo=codigo_base + 1,
            descricao=f"Validacao inline - {tabela}",
        )
        for c in required:
            campo = c.get("campo", c["nome"])
            label = c.get("descricao", campo)
            cli.add_param(f"p{campo}", "Letras")
            cli.add_step(pattern_null_guard(f"p{campo}", label))
        rules.append(cli)

    from .enterprise import infer_mask
    masked = [c for c in campos if c.get("mascara") or infer_mask(c.get("campo", ""))]
    if masked:
        mask_rule = RuleBlueprint(
            nome="Aplicar Mascaras Dinamicas",
            destino=1,
            codigo=codigo_base + 2,
            descricao=f"Mascaras via JS ao entrar - {tabela}",
        )
        _MASK_FORMATS = {
            "CPF": "999.999.999-99", "CNPJ": "99.999.999/9999-99",
            "CEP": "99999-999", "TELEFONE": "(99) 9999-9999",
            "CELULAR": "(99) 99999-9999", "DATA": "99/99/9999",
            "HORA": "99:99", "MOEDA": "###.###.##0,00",
        }
        for c in masked:
            mask = c.get("mascara") or infer_mask(c.get("campo", ""))
            fmt = _MASK_FORMATS.get(mask, "")
            if fmt:
                mask_rule.add_step({
                    "tipo": "expressao",
                    "nome": f"mask{c['nome']}",
                    "descricao": f"Mascara {mask}",
                    "funcao": "ebfSetComponentProperty",
                    "nome_amigavel": "Definir Propriedade do Componente",
                    "params": [
                        {"tipo": "constante", "valor": c["nome"], "tipo_dado": "Letras"},
                        {"tipo": "constante", "valor": "Mascara", "tipo_dado": "Letras"},
                        {"tipo": "constante", "valor": fmt, "tipo_dado": "Letras"},
                    ],
                    "retorno": "",
                    "tipo_retorno": "Variante",
                })
        if mask_rule.passos:
            rules.append(mask_rule)

    return rules


def generate_auto_fill_rule(
    tabela_origem: str,
    campo_chave: str,
    mapeamento: dict[str, str],
    var_trigger: str,
    codigo: int = 9010,
) -> RuleBlueprint:
    """Gera regra de auto-preenchimento (Ao Modificar/Ao Sair).

    tabela_origem: tabela para consulta
    campo_chave: campo de busca na tabela
    mapeamento: {campo_banco: componente_tela}
    var_trigger: parametro que dispara a busca
    """
    campos_select = list(mapeamento.keys())
    sql = (f"Select {', '.join(f'{tabela_origem}.{c}' for c in campos_select)} "
           f"From {tabela_origem} "
           f"Where {tabela_origem}.{campo_chave} = :pChave")

    rule = RuleBlueprint(
        nome=f"Auto Preencher {tabela_origem}",
        destino=2,
        codigo=codigo,
        descricao=f"Auto-preenchimento a partir de {tabela_origem}",
    )
    rule.add_param(var_trigger, "Letras")

    rule.add_step(pattern_null_guard(
        var_trigger, campo_chave,
        on_valid=[],
    ))

    select = pattern_sql_select(
        sql, campos_select,
        binds=[{"nome": "pChave", "variavel": var_trigger}],
    )
    rule.add_pattern(select)

    for campo_banco, componente in mapeamento.items():
        rule.add_step(pattern_change_component(
            componente, f"@v{campo_banco}",
        ))

    return rule

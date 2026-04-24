"""Gera spec JSON da Tela de Perfil do Usuario - renderizada via fluxo com HTML personalizado."""

import json
import os

CSS_PERFIL = """
.profile-page-container { background: transparent; overflow-y: auto; padding: 0; height: 100%; }
.profile-wrapper { max-width: 820px; margin: 0 auto; padding: 24px; }
.profile-banner {
    background: linear-gradient(135deg, #13c983 0%, #0a7d52 50%, #065a3a 100%);
    border-radius: 16px 16px 0 0; height: 150px; position: relative;
}
.profile-avatar {
    width: 110px; height: 110px; border-radius: 50%; background: #fff;
    border: 5px solid #fff; position: absolute; bottom: -55px; left: 50%;
    transform: translateX(-50%); display: flex; align-items: center;
    justify-content: center; box-shadow: 0 8px 24px rgba(0,0,0,.15);
}
.avatar-initials { font-size: 2.5rem; font-weight: 700; color: #13c983; letter-spacing: -1px; }
.profile-header {
    text-align: center; padding: 64px 20px 24px; background: var(--bs-body-bg);
    border-radius: 0 0 16px 16px; box-shadow: 0 2px 12px rgba(0,0,0,.06); margin-bottom: 20px;
}
.profile-name { font-size: 1.6rem; font-weight: 700; color: var(--bs-emphasis-color); margin: 0 0 8px; }
.profile-role { font-size: .82rem; padding: 5px 16px; border-radius: 20px; font-weight: 600; }
.profile-email { font-size: .9rem; color: var(--bs-secondary-color); margin: 10px 0 0; }
.profile-stats { display: flex; gap: 14px; margin-bottom: 20px; }
.stat-item {
    flex: 1; background: var(--bs-body-bg); border-radius: 12px; padding: 18px 12px;
    text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,.05);
    border: 1px solid var(--bs-border-color); transition: transform .2s, box-shadow .2s;
}
.stat-item:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,.08); }
.stat-item i { font-size: 1.4rem; color: #13c983; display: block; margin-bottom: 10px; }
.stat-value { display: block; font-size: .92rem; font-weight: 600; color: var(--bs-emphasis-color); }
.stat-label {
    display: block; font-size: .75rem; color: var(--bs-secondary-color);
    margin-top: 4px; text-transform: uppercase; letter-spacing: .5px;
}
.profile-cards { display: flex; flex-direction: column; gap: 16px; }
.profile-cards .card {
    border-radius: 12px; border: 1px solid var(--bs-border-color);
    overflow: hidden; transition: box-shadow .2s;
}
.profile-cards .card:hover { box-shadow: 0 4px 16px rgba(0,0,0,.08); }
.profile-cards .card-header {
    background: var(--bs-tertiary-bg); border-bottom: 1px solid var(--bs-border-color); padding: 14px 20px;
}
.card-heading-premium {
    display: flex; align-items: center; gap: 10px; font-size: .95rem;
    font-weight: 600; color: #13c983; margin: 0;
}
.card-heading-premium i { font-size: 1.05rem; }
.profile-cards .card-body { padding: 20px; }
.info-row { display: flex; gap: 20px; margin-bottom: 16px; }
.info-row:last-child { margin-bottom: 0; }
.info-item { flex: 1; }
.info-label {
    display: block; font-size: .75rem; font-weight: 600; color: var(--bs-secondary-color);
    text-transform: uppercase; letter-spacing: .8px; margin-bottom: 6px;
}
.info-value {
    display: block; font-size: .92rem; font-weight: 500; color: var(--bs-emphasis-color);
    padding: 10px 14px; background: var(--bs-tertiary-bg); border-radius: 8px;
    border: 1px solid var(--bs-border-color);
}
.info-value i { margin-right: 8px; color: #13c983; font-size: .85rem; }
[data-bs-theme=dark] .profile-banner { background: linear-gradient(135deg, #00FF9D 0%, #0a7d52 50%, #065a3a 100%); }
[data-bs-theme=dark] .profile-avatar { background: var(--bs-body-bg); border-color: var(--bs-body-bg); }
[data-bs-theme=dark] .avatar-initials { color: #00FF9D; }
[data-bs-theme=dark] .card-heading-premium { color: #00FF9D; }
[data-bs-theme=dark] .stat-item i { color: #00FF9D; }
[data-bs-theme=dark] .info-value i { color: #00FF9D; }
""".strip()


def _const(valor, tipo_dado="Letras"):
    return {"tipo": "constante", "valor": valor, "tipo_dado": tipo_dado}

def _var(nome, tipo_dado=None):
    d = {"tipo": "variavel", "nome": nome}
    if tipo_dado:
        d["tipo_dado"] = tipo_dado
    return d

def _expr(nome, descricao, funcao, nome_amigavel, params, retorno, tipo_retorno):
    step = {
        "tipo": "expressao",
        "nome": nome,
        "descricao": descricao,
        "funcao": funcao,
        "nome_amigavel": nome_amigavel,
        "params": params,
        "retorno": retorno,
        "tipo_retorno": tipo_retorno,
    }
    return step

def _get_json(nome, var_json, chave, retorno, tipo_retorno="Letras"):
    return _expr(
        nome=nome,
        descricao=f"Extrair {chave} do JSON",
        funcao="ebfGetValueObjectJson",
        nome_amigavel="JSON Obter Valor",
        params=[_var(var_json), _const(chave)],
        retorno=retorno,
        tipo_retorno=tipo_retorno,
    )


# ---------- REGRA SERVIDOR: Buscar Dados do Usuario ----------

regra_servidor = {
    "nome": "Perfil Usuario - Buscar Dados",
    "destino": 2,
    "codigo": 50,
    "descricao": "Busca dados do usuario logado no banco de dados",
    "retorno_tipo": "Variante",
    "parametros": [],
    "variaveis": [
        {"nome": "vJson", "tipo": "Variante"},
        {"nome": "vLogin", "tipo": "Letras"},
        {"nome": "qryUsuario", "tipo": "Tabela"},
    ],
    "passos": [
        _expr(
            "obterLoginSessao",
            "Obter login do usuario da sessao",
            "ebfGetSessionAttribute",
            "Obter variavel da sessao",
            [_const("USU_LOGIN"), _const("false", "Logico")],
            "vLogin", "Variante",
        ),
        _expr(
            "consultarUsuario",
            "Buscar dados do usuario no banco",
            "ebfSQLExecuteQuery",
            "Abrir Consulta",
            [
                {
                    "tipo": "sql",
                    "sql": (
                        "SELECT USU_CODIGO, USU_LOGIN, USU_NOME, USU_EMAIL, "
                        "USU_TELEFONE, USU_CELULAR, USU_DEPARTAMENTO, USU_PERFIL, "
                        "TO_CHAR(USU_DATA_CADASTRO, 'DD/MM/YYYY') AS USU_DATA_CADASTRO, "
                        "TO_CHAR(USU_ULTIMO_ACESSO, 'DD/MM/YYYY HH24:MI') AS USU_ULTIMO_ACESSO "
                        "FROM FR_USUARIO WHERE USU_LOGIN = :LOGIN"
                    ),
                    "binds": [{"nome": "LOGIN", "variavel": "vLogin"}],
                },
                _const(None),
            ],
            "qryUsuario", "Tabela",
        ),
        _expr(
            "converterParaJson",
            "Converter resultado para JSON",
            "ebfResultSetToJSON",
            "Tabela para JSON",
            [_var("qryUsuario")],
            "vJson", "Variante",
        ),
        _expr(
            "fecharConsulta",
            "Fechar a consulta aberta",
            "ebfSQLClose",
            "Fechar Consulta",
            [_var("qryUsuario")],
            "", "",
        ),
    ],
}


# ---------- REGRA CLIENTE: Renderizar Tela de Perfil ----------

# HTML sections (usando aspas simples nos atributos HTML para compatibilidade)
HTML_BANNER = (
    "<div class='profile-wrapper'>"
    "<div class='profile-banner'>"
    "<div class='profile-avatar'>"
    "<span class='avatar-initials'>"
)
HTML_BANNER_MID1 = (
    "</span></div></div>"
    "<div class='profile-header'>"
    "<h2 class='profile-name'>"
)
HTML_BANNER_MID2 = (
    "</h2><span class='badge bg-primary profile-role'>"
)
HTML_BANNER_MID3 = (
    "</span><p class='profile-email'>"
    "<i class='fas fa-envelope me-2'></i>"
)
HTML_BANNER_END = "</p></div>"

HTML_STATS_START = (
    "<div class='profile-stats'>"
    "<div class='stat-item'>"
    "<i class='fas fa-calendar-check'></i>"
    "<span class='stat-value'>"
)
HTML_STATS_MID1 = (
    "</span><span class='stat-label'>Membro desde</span></div>"
    "<div class='stat-item'>"
    "<i class='fas fa-clock'></i>"
    "<span class='stat-value'>"
)
HTML_STATS_MID2 = (
    "</span><span class='stat-label'>Ultimo acesso</span></div>"
    "<div class='stat-item'>"
    "<i class='fas fa-shield-alt'></i>"
    "<span class='stat-value'>"
)
HTML_STATS_END = (
    "</span><span class='stat-label'>Perfil</span></div></div>"
)

HTML_CARD_PESSOAL_START = (
    "<div class='profile-cards'>"
    "<div class='card shadow-sm'>"
    "<div class='card-header'>"
    "<span class='card-heading-premium'>"
    "<i class='fas fa-id-card'></i> Dados Pessoais</span></div>"
    "<div class='card-body'>"
    "<div class='info-row'>"
    "<div class='info-item'>"
    "<span class='info-label'>Nome Completo</span>"
    "<span class='info-value'><i class='fas fa-user'></i>"
)
HTML_CARD_PESSOAL_MID1 = (
    "</span></div>"
    "<div class='info-item'>"
    "<span class='info-label'>Login</span>"
    "<span class='info-value'><i class='fas fa-sign-in-alt'></i>"
)
HTML_CARD_PESSOAL_MID2 = (
    "</span></div></div>"
    "<div class='info-row'>"
    "<div class='info-item'>"
    "<span class='info-label'>E-mail</span>"
    "<span class='info-value'><i class='fas fa-at'></i>"
)
HTML_CARD_PESSOAL_MID3 = (
    "</span></div>"
    "<div class='info-item'>"
    "<span class='info-label'>Departamento</span>"
    "<span class='info-value'><i class='fas fa-building'></i>"
)
HTML_CARD_PESSOAL_END = "</span></div></div></div></div>"

HTML_CARD_CONTATO_START = (
    "<div class='card shadow-sm'>"
    "<div class='card-header'>"
    "<span class='card-heading-premium'>"
    "<i class='fas fa-phone-alt'></i> Contato</span></div>"
    "<div class='card-body'>"
    "<div class='info-row'>"
    "<div class='info-item'>"
    "<span class='info-label'>Telefone</span>"
    "<span class='info-value'><i class='fas fa-phone'></i>"
)
HTML_CARD_CONTATO_MID = (
    "</span></div>"
    "<div class='info-item'>"
    "<span class='info-label'>Celular</span>"
    "<span class='info-value'><i class='fas fa-mobile-alt'></i>"
)
HTML_CARD_CONTATO_END = "</span></div></div></div></div>"

HTML_CARD_SISTEMA_START = (
    "<div class='card shadow-sm'>"
    "<div class='card-header'>"
    "<span class='card-heading-premium'>"
    "<i class='fas fa-cog'></i> Informacoes do Sistema</span></div>"
    "<div class='card-body'>"
    "<div class='info-row'>"
    "<div class='info-item'>"
    "<span class='info-label'>Codigo</span>"
    "<span class='info-value'><i class='fas fa-hashtag'></i>#"
)
HTML_CARD_SISTEMA_MID1 = (
    "</span></div>"
    "<div class='info-item'>"
    "<span class='info-label'>Perfil de Acesso</span>"
    "<span class='info-value'><i class='fas fa-user-shield'></i>"
)
HTML_CARD_SISTEMA_MID2 = (
    "</span></div></div>"
    "<div class='info-row'>"
    "<div class='info-item'>"
    "<span class='info-label'>Data de Cadastro</span>"
    "<span class='info-value'><i class='fas fa-calendar-plus'></i>"
)
HTML_CARD_SISTEMA_MID3 = (
    "</span></div>"
    "<div class='info-item'>"
    "<span class='info-label'>Ultimo Acesso</span>"
    "<span class='info-value'><i class='fas fa-history'></i>"
)
HTML_CARD_SISTEMA_END = "</span></div></div></div></div></div></div>"


regra_cliente = {
    "nome": "Perfil Usuario - Renderizar Tela",
    "destino": 1,
    "codigo": 51,
    "descricao": "Renderiza a tela de perfil com HTML personalizado via DOM",
    "parametros": [],
    "variaveis": [
        {"nome": "vDadosJson", "tipo": "Variante"},
        {"nome": "vDados", "tipo": "Variante"},
        {"nome": "vNome", "tipo": "Letras"},
        {"nome": "vEmail", "tipo": "Letras"},
        {"nome": "vLogin", "tipo": "Letras"},
        {"nome": "vTelefone", "tipo": "Letras"},
        {"nome": "vCelular", "tipo": "Letras"},
        {"nome": "vDepartamento", "tipo": "Letras"},
        {"nome": "vPerfil", "tipo": "Letras"},
        {"nome": "vDataCadastro", "tipo": "Letras"},
        {"nome": "vUltimoAcesso", "tipo": "Letras"},
        {"nome": "vCodigo", "tipo": "Letras"},
        {"nome": "vInicial", "tipo": "Letras"},
        {"nome": "vHtmlBanner", "tipo": "Letras"},
        {"nome": "vHtmlStats", "tipo": "Letras"},
        {"nome": "vHtmlDadosPessoais", "tipo": "Letras"},
        {"nome": "vHtmlContato", "tipo": "Letras"},
        {"nome": "vHtmlSistema", "tipo": "Letras"},
        {"nome": "vHtml", "tipo": "Letras"},
        {"nome": "vContainer", "tipo": "Variante"},
    ],
    "passos": [
        # 1. Chamar regra servidor
        {
            "tipo": "subrotina",
            "nome": "buscarDados",
            "rule_name": "Perfil Usuario - Buscar Dados",
            "rule_id": 50,
            "params": [],
            "return_var": "vDadosJson",
            "description": "Buscar dados do usuario no servidor",
        },
        # 2. Extrair primeiro registro (indice 0 do array)
        _expr(
            "extrairRegistro",
            "Extrair primeiro registro do JSON",
            "ebfGetElementFromList",
            "Obter Elemento da Lista",
            [_var("vDadosJson"), _const("0", "Inteiro")],
            "vDados", "Variante",
        ),
        # 3-12. Extrair campos do JSON
        _get_json("extrairNome", "vDados", "USU_NOME", "vNome"),
        _get_json("extrairEmail", "vDados", "USU_EMAIL", "vEmail"),
        _get_json("extrairLogin", "vDados", "USU_LOGIN", "vLogin"),
        _get_json("extrairTelefone", "vDados", "USU_TELEFONE", "vTelefone"),
        _get_json("extrairCelular", "vDados", "USU_CELULAR", "vCelular"),
        _get_json("extrairDepartamento", "vDados", "USU_DEPARTAMENTO", "vDepartamento"),
        _get_json("extrairPerfil", "vDados", "USU_PERFIL", "vPerfil"),
        _get_json("extrairDataCadastro", "vDados", "USU_DATA_CADASTRO", "vDataCadastro"),
        _get_json("extrairUltimoAcesso", "vDados", "USU_ULTIMO_ACESSO", "vUltimoAcesso"),
        _get_json("extrairCodigo", "vDados", "USU_CODIGO", "vCodigo"),
        # 13. Obter inicial do nome
        _expr(
            "obterInicial",
            "Obter primeira letra do nome",
            "ebfSubstring",
            "Subsequencia",
            [_var("vNome"), _const("1", "Inteiro"), _const("1", "Inteiro")],
            "vInicial", "Letras",
        ),
        # 14. Converter para maiuscula
        _expr(
            "inicialMaiuscula",
            "Converter inicial para maiuscula",
            "ebfToUpperCase",
            "Maiusculo",
            [_var("vInicial")],
            "vInicial", "Letras",
        ),
        # 15. Montar HTML do banner + header
        _expr(
            "montarBanner",
            "Montar HTML do banner e header do perfil",
            "ebfConcat",
            "Concatenacao",
            [
                _const(HTML_BANNER), _var("vInicial"),
                _const(HTML_BANNER_MID1), _var("vNome"),
                _const(HTML_BANNER_MID2), _var("vPerfil"),
                _const(HTML_BANNER_MID3), _var("vEmail"),
                _const(HTML_BANNER_END),
            ],
            "vHtmlBanner", "Letras",
        ),
        # 16. Montar HTML das estatisticas
        _expr(
            "montarStats",
            "Montar HTML dos indicadores do perfil",
            "ebfConcat",
            "Concatenacao",
            [
                _const(HTML_STATS_START), _var("vDataCadastro"),
                _const(HTML_STATS_MID1), _var("vUltimoAcesso"),
                _const(HTML_STATS_MID2), _var("vPerfil"),
                _const(HTML_STATS_END),
            ],
            "vHtmlStats", "Letras",
        ),
        # 17. Montar HTML card Dados Pessoais
        _expr(
            "montarCardDadosPessoais",
            "Montar HTML do card de dados pessoais",
            "ebfConcat",
            "Concatenacao",
            [
                _const(HTML_CARD_PESSOAL_START), _var("vNome"),
                _const(HTML_CARD_PESSOAL_MID1), _var("vLogin"),
                _const(HTML_CARD_PESSOAL_MID2), _var("vEmail"),
                _const(HTML_CARD_PESSOAL_MID3), _var("vDepartamento"),
                _const(HTML_CARD_PESSOAL_END),
            ],
            "vHtmlDadosPessoais", "Letras",
        ),
        # 18. Montar HTML card Contato
        _expr(
            "montarCardContato",
            "Montar HTML do card de contato",
            "ebfConcat",
            "Concatenacao",
            [
                _const(HTML_CARD_CONTATO_START), _var("vTelefone"),
                _const(HTML_CARD_CONTATO_MID), _var("vCelular"),
                _const(HTML_CARD_CONTATO_END),
            ],
            "vHtmlContato", "Letras",
        ),
        # 19. Montar HTML card Sistema
        _expr(
            "montarCardSistema",
            "Montar HTML do card de informacoes do sistema",
            "ebfConcat",
            "Concatenacao",
            [
                _const(HTML_CARD_SISTEMA_START), _var("vCodigo"),
                _const(HTML_CARD_SISTEMA_MID1), _var("vPerfil"),
                _const(HTML_CARD_SISTEMA_MID2), _var("vDataCadastro"),
                _const(HTML_CARD_SISTEMA_MID3), _var("vUltimoAcesso"),
                _const(HTML_CARD_SISTEMA_END),
            ],
            "vHtmlSistema", "Letras",
        ),
        # 20. Juntar todas as secoes
        _expr(
            "montarHtmlFinal",
            "Concatenar todas as secoes HTML",
            "ebfConcat",
            "Concatenacao",
            [
                _var("vHtmlBanner"), _var("vHtmlStats"),
                _var("vHtmlDadosPessoais"), _var("vHtmlContato"),
                _var("vHtmlSistema"),
            ],
            "vHtml", "Letras",
        ),
        # 21. Obter referencia do container
        _expr(
            "obterContainer",
            "Obter referencia do container de perfil",
            "ebfHtmlGetElementById",
            "HTML - Obter Elemento pelo ID",
            [_const("containerPerfil")],
            "vContainer", "Variante",
        ),
        # 22. Injetar HTML no container
        _expr(
            "renderizarHtml",
            "Definir conteudo HTML no container",
            "ebfHtmlInnerHtml",
            "HTML - Definir Conteudo do Elemento",
            [_var("vContainer"), _var("vHtml")],
            "", "",
        ),
    ],
}


# ---------- SPEC COMPLETA ----------

spec = {
    "formulario": {
        "descricao": "Perfil do Usuario",
        "tabela": "",
        "campo_chave": "",
        "sql_select": "",
        "tamanho": 1100,
        "altura": 800,
        "navegacao": False,
        "abas": False,
        "responsivo": True,
        "barra_rolagem": True,
        "css": CSS_PERFIL,
        "codigo": 9100,
        "sistema": "SIG",
        "eventos": {
            "Ao Entrar": ["Perfil Usuario - Renderizar Tela"],
        },
        "campos": [
            {
                "nome": "containerPerfil",
                "tipo": "P",
                "descricao": "",
                "aba": "",
                "container": "",
                "posicao_x": 0,
                "posicao_y": 0,
                "tamanho": 1100,
                "altura": 800,
                "properties": {
                    "NomeClasseCss": "profile-page-container",
                },
            },
        ],
    },
    "regras": [regra_servidor, regra_cliente],
}


if __name__ == "__main__":
    import sys
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    from mcp_maker.server import gerar_tela_completa

    spec_json = json.dumps(spec, ensure_ascii=False)
    output_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "Perfil_Usuario.frz",
    )
    result = gerar_tela_completa(spec_json, output_path)
    print(result)

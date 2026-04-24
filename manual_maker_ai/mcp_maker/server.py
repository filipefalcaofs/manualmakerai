"""Motor MCP especializado na criacao de FRZ para o Maker.

Cria fluxogramas (regras de negocio) e telas completas (formularios com regras vinculadas).
Todas as tools servem a geracao de artefatos Maker — desde a consulta de funcoes nativas
ate a geracao do arquivo FRZ final.

Backend de compilacao: tenta usar o binario Rust (frz-compiler) para velocidade maxima.
Se nao disponivel, usa o builder Python como fallback transparente.
"""

import json
import os
import sys

from mcp.server.fastmcp import FastMCP

# ---------------------------------------------------------------------------
# Defaults de conexao ao banco (lidos de variaveis de ambiente)
# Configurar em .cursor/mcp.json no bloco "env" do maker-flow-engine.
# ---------------------------------------------------------------------------
_DB_HOST = os.environ.get("MAKER_DB_HOST", "localhost")
_DB_PORT = int(os.environ.get("MAKER_DB_PORT", "1433"))
_DB_USER = os.environ.get("MAKER_DB_USER", "sa")
_DB_PASSWORD = os.environ.get("MAKER_DB_PASSWORD", "")
_DB_NAME = os.environ.get("MAKER_DB_NAME", "SIG_MAKER")
_DB_DRIVER = os.environ.get("MAKER_DB_DRIVER", "mssql")

from .parser import parse_todas_funcoes, indexar_todos_md
from .models import FuncaoMaker
from .rag_engine import (
    RagEngine,
    RagDocument,
    build_funcao_text,
    build_regra_text,
    build_manual_text,
    chunk_manual_page,
)

try:
    from .rust_bridge import compile_frz as _rust_compile, is_available as _rust_available
    _USE_RUST = _rust_available()
except ImportError:
    _USE_RUST = False
    _rust_compile = None

if _USE_RUST:
    print("[frz-engine] Backend Rust (frz-compiler) ativo", file=sys.stderr, flush=True)
else:
    print("[frz-engine] Backend Python (fallback)", file=sys.stderr, flush=True)
from .builder import (
    DataPacketSpec,
    DataRow,
    EntityAttribute,
    EntityKey,
    EntitySpec,
    EventBinding,
    FormBuilder,
    FormField,
    FormSpec,
    FrzBuilder,
    ParamConstant,
    ParamFunction,
    ParamSQL,
    ParamVariable,
    RuleBuilder,
    RuleParam,
    RuleSpec,
    RuleVar,
    StepActivity,
    StepDecision,
    StepExpression,
    StepParam,
    SubRoutineParam,
    StepSubRoutine,
    TableField,
    TableSpec,
    build_diagram_xml,
    build_expression_xml,
)
from .enterprise import (
    enrich_crud_spec,
    enrich_dashboard_spec,
    enrich_login_spec,
    build_client_validation_rule,
    build_server_validation_rule,
    build_mask_client_rule,
    infer_component_type,
    infer_mask,
    infer_column_width,
    infer_icon_for_form,
    group_fields_into_sections,
    _CSS_MASTERSKIN,
)
from .logic_engine import (
    RuleBlueprint,
    EVENT_LIFECYCLE,
    classify_layer,
    split_into_layers,
    pattern_sql_select,
    pattern_sql_execute,
    pattern_sql_loop,
    pattern_null_guard,
    pattern_equality_check,
    pattern_change_component,
    pattern_set_visibility,
    pattern_set_enabled,
    pattern_callrule,
    pattern_json_build,
    pattern_success_message,
    pattern_confirmation,
    pattern_browser_mode_guard,
    pattern_duplicity_check,
    generate_crud_rules,
    generate_auto_fill_rule,
    build_event_bindings,
)
from .direct_access import DirectAccessEngine, FonteDadosSpec

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MCP_DIR = os.path.dirname(os.path.abspath(__file__))


def _get_connection(host, porta, usuario, senha, banco, driver=_DB_DRIVER):
    """Cria conexao ao banco usando o driver adequado (mysql ou mssql)."""
    if driver == "mysql":
        import pymysql
        return pymysql.connect(
            host=host, port=porta, user=usuario,
            password=senha, database=banco,
            charset="utf8mb4",
        )
    else:
        import pymssql
        return pymssql.connect(
            server=host, port=porta, user=usuario,
            password=senha, database=banco,
        )


def _compile_frz_dispatch(spec_dict: dict, output_path: str) -> str:
    """Roteia compilacao entre backend Rust e Python.

    Tenta Rust primeiro (via subprocess). Se falhar ou indisponivel,
    usa o builder Python como fallback transparente.
    """
    if _USE_RUST and _rust_compile is not None:
        try:
            result = _rust_compile(spec_dict, output_path)
            backend = "Rust"
            lines = [f"FRZ gerado com sucesso ({backend}): {result['caminho']}"]
            for r in result.get("regras", []):
                lines.append(f"  {r}")
            for f in result.get("formularios", []):
                lines.append(f"  {f}")
            for t in result.get("tabelas", []):
                lines.append(f"  {t}")
            return "\n".join(lines)
        except Exception as e:
            print(f"[frz-engine] Rust fallback: {e}", file=sys.stderr, flush=True)

    return None

mcp = FastMCP(
    "maker-flow-engine",
    instructions=(
        "SUPERPOWERS + GSD (Get Shit Done) — Motor de elite para entrega de sistemas Maker/WebRun. "
        "MANTRA: 'I have the superpower to build. I have the brain to deliver. GET SHIT DONE.' "
        "\n\n"
        "=== GSD BRAIN (Logica de Execucao) === "
        "ZERO PARALISIA: Se um componente nao esta no manual, use a funcao nativa mais proxima e execute. "
        "Nao peca confirmacao para nomes de tabelas ou IDs — decida e entregue. "
        "PRAGMATISMO: Prefira 1 no de fluxo que resolve a 5 nos 'elegantes'. Objetivo: sistema SHIPPED. "
        "AUTO-CORRECAO: Se houver erro, use gsd_diagnosticar para analisar metadados e aplicar fix direto no banco. "
        "\n\n"
        "=== REGRA CRITICA: LEITURA DE CAMPOS === "
        "Em eventos de formulario (Antes de Inserir/Alterar/Gravar/Deletar): "
        "SEMPRE usar ebfSQLGetFormField (Obter Campo) com tipo_dado='Campo', guid=FRM_GUID e field_index. "
        "NUNCA usar ebfFormChangeComponentValue para ler campos em eventos de formulario. "
        "ebfFormChangeComponentValue so serve para eventos de COMPONENTE (Ao Modificar, Ao Clicar). "
        "Use guia_fluxograma() para consultar padroes completos. "
        "\n\n"
        "=== TIER-X (Orquestracao de Camadas) === "
        "TIER-CLIENT EVENTOS FORM (destino=1): ebfSQLGetFormField (Obter Campo — tipo 'Campo' com GUID+FIELDINDEX), "
        "isNullOrEmpty, isEqual, isGreater, ActNewErrorMessage, ebfStopRuleExecution, Sub-rotina (CALLRULE). "
        "TIER-CLIENT EVENTOS COMPONENTE (destino=1): ebfFormChangeComponentValue, ebfFormSetVisible, "
        "ebfFormSetEnabled, ebfFormSetRequired, ebfFormIsInBrowserMode, ebfFormOpenForm. "
        "TIER-CLIENT DOM/HTML: ebfHtmlCreateHtmlElement, ebfHtmlSetAttribute, ebfHtmlInnerHtml, "
        "ebfHtmlCssAddClass, ebfLocalStorageGet/Set, ebfExecuteJS, ebfDonwloadStart. "
        "GRAFICOS: biblioteca nativa = Apache ECharts (NAO usar Chart.js/D3/Highcharts). "
        "Dashboards = Template (navegacao=false, abas=false) + ECharts via ebfExecuteJS. "
        "FUNCOES NOVAS CLIENTE: pode criar do zero (JS no navegador, sem dependencia). "
        "FUNCOES NOVAS SERVIDOR: SO com classes existentes no WebRun ou JARs de WEB-INF/lib. "
        "NAO pode criar classes Java novas via FRZ. "
        "TIER-SERVER (destino=2, Java/Tomcat): ebfSQLExecuteQuery, ebfSQLExecuteUpdate, "
        "ebfSQLField, ebfSQLClose, ebfSQLNext, ebfSQLEOF, ebfAuthUser, ebfGetUserCode, "
        "ebfSendMail/Html, ebfFileOpenToWrite/Read, ebfCreateObjectJSON, ebfResultSetToJSON. "
        "TIER-DUAL (ambas): isNullOrEmpty, isEqual, isGreater, oprIf, ebfConcat, toString, "
        "toDate, toInteger, toFloat, ebfListCreate, ebfGetValueObjectJson, ActNewErrorMessage, "
        "ActNewSuccessMessage, ActNewPromptMessage, ebfFlowExecute. "
        "\n\n"
        "=== JARS DO SERVIDOR (WEB-INF/lib/) === "
        "205 JARs disponiveis. Principais por dominio: "
        "JDBC: jtds-1.3.1, mssql-jdbc-7.2.2, mysql-connector-8.0.17, postgresql-42.7.3, ojdbc5, mongo-java-driver-3.12.13. "
        "RELATORIOS: jasperreports-6.4.0, itextpdf-5.5.11, jfreechart-1.0.19, poi-3.17. "
        "CLOUD: aws-java-sdk-s3-1.11.0, firebase-admin-5.0.1, google-api-client-2.0.0. "
        "WEB SERVICES: axis2-kernel-1.6.1, cxf-core-3.2.8 (SOAP+REST). "
        "SEGURANCA: jjwt-0.11.5 (JWT), bcprov-1.54 (crypto), waffle-jna-1.8.0 (SSO). "
        "MENSAGERIA: amqp-client-5.20.0 (RabbitMQ). "
        "JSON: javax.json-1.1.4, jackson-2.1.4, gson-2.1. "
        "OFFICE: poi-3.17, tika-1.18. "
        "\n\n"
        "=== WORKFLOW GSD (preferir SEMPRE) === "
        "gsd_criar_sistema → ONE-SHOT: descreva o que quer, o motor decide tudo e materializa direto no banco. "
        "gsd_diagnosticar → AUTO-FIX: analisa metadados, detecta erros e corrige automaticamente. "
        "materializar_sistema → Spec JSON detalhada para Direct Access ou FRZ. "
        "projetar_regra → Composicao modular com 14 padroes + expansao recursiva. "
        "\n\n"
        "=== BOOTSTRAP 5.3 SUPER-LAYOUTS === "
        "Injetar via NomeClasseCss: row, col-md-*, card, shadow, form-group, form-control, "
        "btn btn-primary, alert, badge, table table-striped, nav nav-tabs, modal. "
        "Dark mode: [data-bs-theme='dark'], variaveis --bs-primary, --bs-body-bg. "
        "CSS MasterSkin: variaveis --webrun-*, classes enterprise-*. "
        "\n\n"
        "=== MOTOR LOGICO === "
        "14 padroes: sql_select, sql_execute, sql_loop (WHILE), null_guard, equality_check, "
        "duplicity_check, change_component, set_visibility, set_enabled, callrule, json_build, "
        "success_message, confirmation, browser_mode_guard. "
        "RuleBlueprint compositor modular com auto_classify(). "
        "\n\n"
        "REGRAS: NUNCA invente funcoes — se nao esta no catalogo (1186 funcoes), nao existe. "
        "Baseado em 2445 regras + 876 formularios + 286K properties + 205 JARs de producao."
    ),
)


# ---------------------------------------------------------------------------
# Indice leve de funcoes (sem carregar KB inteira)
# ---------------------------------------------------------------------------

class _FuncIndex:
    def __init__(self) -> None:
        self.funcoes: list[FuncaoMaker] = []
        self._by_name: dict[str, FuncaoMaker] = {}
        self._by_cat: dict[str, list[FuncaoMaker]] = {}
        self._cats: dict[str, int] = {}

    def carregar(self, base_dir: str) -> None:
        funcoes_dir = os.path.join(base_dir, "nativos", "funcoes")
        if os.path.isdir(funcoes_dir):
            self.funcoes = parse_todas_funcoes(funcoes_dir)
        for f in self.funcoes:
            self._by_name[f.nome_real.lower()] = f
            self._by_cat.setdefault(f.categoria, []).append(f)
            self._cats[f.categoria] = self._cats.get(f.categoria, 0) + 1

    def buscar(self, termo: str) -> list[FuncaoMaker]:
        t = termo.lower()
        return [
            f for f in self.funcoes
            if t in f.nome_real.lower()
            or t in f.nome_amigavel.lower()
            or t in f.assinatura.lower()
            or t in f.descricao.lower()
        ]

    def detalhar(self, nome_real: str) -> FuncaoMaker | None:
        return self._by_name.get(nome_real.lower())

    def por_categoria(self, cat: str) -> list[FuncaoMaker]:
        return self._by_cat.get(cat, [])

    def compativeis(self, camada: str, cat: str | None = None) -> list[FuncaoMaker]:
        fns = [
            f for f in self.funcoes
            if (f.servidor if camada == "servidor" else f.cliente)
        ]
        if cat:
            fns = [f for f in fns if f.categoria == cat]
        return fns


_idx: _FuncIndex | None = None


def _funcoes() -> _FuncIndex:
    global _idx
    if _idx is None:
        _idx = _FuncIndex()
        _idx.carregar(BASE_DIR)
        print(
            f"[maker-flow-engine] {len(_idx.funcoes)} funcoes nativas carregadas "
            f"({len(_idx._cats)} categorias)",
            file=sys.stderr, flush=True,
        )
    return _idx


# ---------------------------------------------------------------------------
# Indice de regras reais (2371 regras de producao)
# ---------------------------------------------------------------------------

_regras_reais: list[dict] | None = None
_regras_stats: dict | None = None


def _load_regras() -> tuple[list[dict], dict]:
    global _regras_reais, _regras_stats
    if _regras_reais is not None:
        return _regras_reais, _regras_stats or {}
    path = os.path.join(MCP_DIR, "regras_sistema_real.json")
    if not os.path.isfile(path):
        _regras_reais = []
        _regras_stats = {}
        return _regras_reais, _regras_stats
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
    _regras_reais = data.get("regras", [])
    _regras_stats = data.get("stats", {})
    print(
        f"[maker-flow-engine] {len(_regras_reais)} regras reais carregadas",
        file=sys.stderr, flush=True,
    )
    return _regras_reais, _regras_stats


# ---------------------------------------------------------------------------
# Motor RAG (busca semantica com embeddings)
# ---------------------------------------------------------------------------

_rag: RagEngine | None = None
_rag_loading: bool = False
_paginas_manual: list | None = None


def _rag_engine() -> RagEngine:
    """Inicializa o RAG lazy: carrega docs e computa/carrega embeddings."""
    global _rag, _rag_loading, _paginas_manual
    if _rag is not None:
        return _rag
    if _rag_loading:
        _rag = RagEngine()
        return _rag
    _rag_loading = True
    _rag = RagEngine()

    docs: list[RagDocument] = []

    idx = _funcoes()
    for f in idx.funcoes:
        docs.append(RagDocument(
            doc_id=f"funcao:{f.nome_real}",
            doc_type="funcao",
            text=build_funcao_text(f),
            metadata={"nome_real": f.nome_real, "categoria": f.categoria},
        ))

    regras, _ = _load_regras()
    for r in regras:
        cod = r.get("cod", 0)
        docs.append(RagDocument(
            doc_id=f"regra:{cod}",
            doc_type="regra",
            text=build_regra_text(r),
            metadata={"cod": cod, "nome": r.get("nome", "")},
        ))

    paginas = _get_paginas()
    total_chunks = 0
    for p in paginas:
        chunks = chunk_manual_page(p.titulo, p.conteudo, p.caminho_relativo, p.categoria)
        for text, meta in chunks:
            chunk_id = f"manual:{p.caminho_relativo}:c{meta['chunk']}"
            docs.append(RagDocument(
                doc_id=chunk_id,
                doc_type="manual",
                text=text,
                metadata=meta,
            ))
            total_chunks += 1

    _rag.add_documents(docs)
    print(
        f"[maker-flow-engine] RAG: {len(docs)} documentos indexados "
        f"({sum(1 for d in docs if d.doc_type == 'funcao')} funcoes, "
        f"{sum(1 for d in docs if d.doc_type == 'regra')} regras, "
        f"{len(paginas)} paginas em {total_chunks} chunks)",
        file=sys.stderr, flush=True,
    )

    _rag.build_index()
    _rag_loading = False
    return _rag


def _keyword_scores_funcoes(termo: str) -> list[tuple[str, float]]:
    """Computa scores de keyword para funcoes (mesmo algoritmo existente)."""
    t = termo.lower()
    results = []
    for f in _funcoes().funcoes:
        score = 0.0
        if t in f.nome_real.lower():
            score += 10
        if t in f.nome_amigavel.lower():
            score += 5
        if t in f.assinatura.lower():
            score += 3
        if t in f.descricao.lower():
            score += 2
        if score > 0:
            results.append((f"funcao:{f.nome_real}", score))
    return results


def _keyword_scores_regras(termo: str) -> list[tuple[str, float]]:
    """Computa scores de keyword para regras (mesmo algoritmo existente)."""
    t = termo.lower()
    regras, _ = _load_regras()
    results = []
    for r in regras:
        score = 0.0
        if t in r.get("nome", "").lower():
            score += 10
        if t in r.get("categoria", "").lower():
            score += 5
        if t in r.get("descricao", "").lower():
            score += 3
        for fn in r.get("funcoes", []):
            if t in fn.lower():
                score += 2
                break
        if score > 0:
            results.append((f"regra:{r.get('cod', 0)}", score))
    return results


# ---------------------------------------------------------------------------
# Arquivos de referencia embutidos
# ---------------------------------------------------------------------------

def _ler_arquivo_ref(nome: str) -> str:
    """Le arquivo de referencia do MCP ou de .cursor/rules/."""
    caminhos = [
        os.path.join(MCP_DIR, nome),
        os.path.join(BASE_DIR, ".cursor", "rules", nome),
    ]
    for caminho in caminhos:
        if os.path.isfile(caminho):
            with open(caminho, "r", encoding="utf-8") as f:
                conteudo = f.read()
            if conteudo.startswith("---"):
                parts = conteudo.split("---", 2)
                if len(parts) >= 3:
                    conteudo = parts[2].strip()
            return conteudo
    return f"Arquivo '{nome}' nao encontrado."


# ---------------------------------------------------------------------------
# Helpers para acesso ao manual indexado
# ---------------------------------------------------------------------------

def _get_paginas() -> list:
    """Retorna paginas do manual. Carrega sem depender do RAG."""
    global _paginas_manual
    if _paginas_manual is None:
        _paginas_manual = indexar_todos_md(BASE_DIR)
        print(
            f"[maker-flow-engine] Manual: {len(_paginas_manual)} paginas indexadas",
            file=sys.stderr, flush=True,
        )
    return _paginas_manual


def _buscar_paginas_dominio(
    categorias: list[str],
    paths_contem: list[str] | None = None,
    termo: str = "",
    limite: int = 10,
) -> list:
    """Busca paginas por categoria e/ou path parcial, com filtro opcional por termo."""
    paginas = _get_paginas()
    resultados = []
    for p in paginas:
        cat_match = any(p.categoria in c or c in p.categoria for c in categorias) if categorias else True
        path_match = True
        if paths_contem:
            path_match = any(sub in p.caminho_relativo.lower() for sub in paths_contem)
        if cat_match or path_match:
            if termo:
                t = termo.lower()
                score = 0
                if t in p.titulo.lower():
                    score += 10
                if t in p.conteudo.lower():
                    score += p.conteudo.lower().count(t)
                if score > 0:
                    resultados.append((score, p))
            else:
                resultados.append((1, p))
    resultados.sort(key=lambda x: x[0], reverse=True)
    return [p for _, p in resultados[:limite]]


def _formatar_paginas(paginas: list, incluir_conteudo: bool = False, max_chars: int = 5000) -> str:
    """Formata lista de paginas para retorno da tool."""
    if not paginas:
        return ""
    lines = []
    for p in paginas:
        lines.append(f"### {p.titulo}")
        lines.append(f"  Arquivo: {p.caminho_relativo}")
        lines.append(f"  Categoria: {p.categoria}")
        if incluir_conteudo:
            conteudo = p.conteudo[:max_chars]
            if len(p.conteudo) > max_chars:
                conteudo += "\n\n[... conteudo truncado, use ler_pagina_manual() para ver completo ...]"
            lines.append(f"\n{conteudo}")
        lines.append("")
    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 1: BUSCAR FUNCAO
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def buscar_funcao(termo: str, limite: int = 20, modo: str = "hibrido") -> str:
    """Busca funcoes nativas do Maker por nome, assinatura ou descricao.
    Usa busca hibrida (keyword + semantica) para encontrar funcoes mesmo
    com termos diferentes dos exatos (ex: 'consultar banco' encontra ebfSQLExecuteQuery).

    Args:
        termo: Palavra-chave ou descricao (ex: 'SQL', 'consultar banco', 'enviar email', 'validar campo')
        limite: Maximo de resultados
        modo: 'hibrido' (keyword + semantico), 'keyword' (apenas texto), 'semantico' (apenas embeddings)
    """
    idx = _funcoes()

    if modo == "keyword":
        resultados = idx.buscar(termo)
        nomes_resultado = [f.nome_real for f in resultados[:limite]]
    elif modo == "semantico":
        rag = _rag_engine()
        sem_results = rag.search(termo, top_k=limite, doc_type="funcao")
        nomes_resultado = [
            r.metadata.get("nome_real", r.doc_id.replace("funcao:", ""))
            for r in sem_results
        ]
    else:
        rag = _rag_engine()
        kw_scores = _keyword_scores_funcoes(termo)
        hybrid_results = rag.hybrid_search(
            query=termo,
            keyword_ids_scores=kw_scores,
            top_k=limite,
            doc_type="funcao",
        )
        nomes_resultado = [
            r.metadata.get("nome_real", r.doc_id.replace("funcao:", ""))
            for r in hybrid_results
        ]

    if not nomes_resultado:
        return f"Nenhuma funcao encontrada para '{termo}'."

    resultados_obj = []
    for nome in nomes_resultado:
        f = idx.detalhar(nome)
        if f:
            resultados_obj.append(f)

    lines = [f"Encontradas {len(resultados_obj)} funcoes para '{termo}' (modo={modo}):\n"]
    for f in resultados_obj:
        layer = ""
        if f.servidor and not f.cliente:
            layer = " [SERVIDOR]"
        elif f.cliente and not f.servidor:
            layer = " [CLIENTE]"
        elif f.servidor and f.cliente:
            layer = " [SERVIDOR+CLIENTE]"
        lines.append(
            f"- {f.nome_real} ({f.nome_amigavel}) [{f.categoria}]{layer}"
        )
    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 2: DETALHAR FUNCAO
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def detalhar_funcao(nome_real: str) -> str:
    """Retorna detalhes completos de uma funcao: assinatura, parametros,
    retorno, compatibilidade servidor/cliente, e codigo Java/JavaScript.
    ESSENCIAL para montar passos de fluxo com parametros corretos.

    Args:
        nome_real: Nome real da funcao (ex: 'ebfSQLExecuteQuery', 'isEqual', 'ebfConcat')
    """
    f = _funcoes().detalhar(nome_real)
    if not f:
        similares = _funcoes().buscar(nome_real)
        if similares:
            sugestoes = ", ".join(s.nome_real for s in similares[:5])
            return f"Funcao '{nome_real}' nao encontrada. Similares: {sugestoes}"
        return f"Funcao '{nome_real}' nao encontrada."
    return f.detalhes()


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 3: LISTAR FUNCOES
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def listar_funcoes(camada: str = "", categoria: str = "") -> str:
    """Lista funcoes filtradas por camada (servidor/cliente) e/ou categoria.
    Sem argumentos, lista as categorias disponiveis.

    Args:
        camada: 'servidor' (destino=2, Java) ou 'cliente' (destino=1, JavaScript). Vazio para ambas.
        categoria: Slug da categoria (ex: 'banco-de-dados', 'texto', 'json', 'logica', 'formulario'). Vazio para listar categorias.
    """
    idx = _funcoes()

    if not camada and not categoria:
        cats = idx._cats
        lines = [f"Categorias disponiveis ({len(cats)}):\n"]
        for cat in sorted(cats.keys()):
            lines.append(f"- {cat} ({cats[cat]} funcoes)")
        return "\n".join(lines)

    if camada and not categoria:
        funcoes = idx.compativeis(camada)
        if not funcoes:
            return f"Nenhuma funcao compativel com '{camada}'."
        by_cat: dict[str, list[FuncaoMaker]] = {}
        for f in funcoes:
            by_cat.setdefault(f.categoria, []).append(f)
        lines = [f"Funcoes {camada} ({len(funcoes)} total):\n"]
        for cat in sorted(by_cat.keys()):
            fns = by_cat[cat]
            lines.append(f"\n## {cat} ({len(fns)})")
            for f in fns:
                lines.append(f"  - {f.nome_real} — {f.nome_amigavel}")
        return "\n".join(lines)

    if categoria:
        funcoes = idx.por_categoria(categoria)
        if not funcoes:
            cats_disp = sorted(idx._cats.keys())
            return (
                f"Categoria '{categoria}' nao encontrada.\n"
                f"Disponiveis: {', '.join(cats_disp)}"
            )
        if camada:
            funcoes = [
                f for f in funcoes
                if (f.servidor if camada == "servidor" else f.cliente)
            ]
        lines = [f"Categoria '{categoria}': {len(funcoes)} funcoes\n"]
        for f in funcoes:
            compat = ", ".join(f.compatibilidade)
            lines.append(f"- {f.nome_real} — {f.nome_amigavel} — {compat}")
        return "\n".join(lines)

    return "Use: listar_funcoes(camada='servidor', categoria='banco-de-dados')"


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 4: PADROES DE FLUXO
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def padroes_fluxo(padrao: str = "") -> str:
    """Retorna padroes de composicao de fluxos E formularios extraidos de 2371 regras
    e 12 formularios reais. Cada padrao mostra a sequencia exata de funcoes a usar.

    Sem argumentos: retorna todos os padroes.
    Com argumento: filtra pelo nome do padrao.

    Args:
        padrao: Filtro opcional (ex: 'sql', 'json', 'arquivo', 'validacao', 'string',
            'componente', 'sub-rotina', 'dom', 'html', 'dashboard', 'grafico',
            'login', 'autenticacao', 'formulario', 'layout', 'css', 'bootstrap')
    """
    conteudo = _ler_arquivo_ref("padroes_composicao.md")
    if padrao:
        padrao_lower = padrao.lower()
        secoes = conteudo.split("\n## ")
        encontradas = []
        for secao in secoes:
            if padrao_lower in secao.lower():
                encontradas.append("## " + secao if not secao.startswith("#") else secao)
        if encontradas:
            return "\n\n".join(encontradas)
        return f"Padrao '{padrao}' nao encontrado. Tente: sql, json, arquivo, validacao, string, componente, sub-rotina, download"
    return conteudo


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 5: BOAS PRATICAS
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def boas_praticas() -> str:
    """Retorna boas praticas de performance, seguranca e desenvolvimento
    para fluxos Maker — baseado na analise de 2371 regras de producao.
    Inclui: SQL vs fluxo, nomes, tratamento de erros, eventos, seguranca."""
    return _ler_arquivo_ref("maker-fluxos-boas-praticas.mdc")


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 5b: DESENVOLVIMENTO ORIENTADO A FLUXOGRAMA
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def guia_fluxograma(topico: str = "") -> str:
    """Guia de desenvolvimento orientado a fluxograma para o Maker.
    Ensina a traduzir logica de backend (codigo) em fluxogramas usando funcoes nativas.

    CONSULTAR SEMPRE antes de criar regras de formulario para garantir uso correto de:
    - ebfSQLGetFormField (Obter Campo) vs ebfFormChangeComponentValue
    - Parametros tipo "Campo" com GUID e FIELDINDEX
    - Padrao duplicidade: regra servidor + regra cliente + JSON
    - Padrao validacao obrigatorios: decisoes aninhadas

    Args:
        topico: Filtro opcional (ex: 'campo', 'duplicidade', 'validacao', 'servidor',
            'componente', 'json', 'erros', 'obrigatorio', 'deletar', 'integridade')
    """
    conteudo = _ler_arquivo_ref("desenvolvimento-fluxogramas.md")
    if topico:
        topico_lower = topico.lower()
        secoes = conteudo.split("\n## ")
        encontradas = []
        for secao in secoes:
            if topico_lower in secao.lower():
                encontradas.append("## " + secao if not secao.startswith("#") else secao)
        if encontradas:
            return "\n\n".join(encontradas)
        return f"Topico '{topico}' nao encontrado. Tente: campo, duplicidade, validacao, servidor, componente, json, erros"
    return conteudo


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 6: BUSCAR REGRA REAL
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def buscar_regra_real(termo: str, limite: int = 10, modo: str = "hibrido") -> str:
    """Busca regras reais do sistema de producao (2371 regras) como referencia.
    Mostra: nome, destino, parametros, variaveis, funcoes usadas, componentes.
    Usa busca hibrida (keyword + semantica) para encontrar regras relevantes.

    Args:
        termo: Descricao ou palavra-chave (ex: 'CEP', 'validar duplicidade', 'enviar email', 'gerar relatorio')
        limite: Maximo de resultados
        modo: 'hibrido' (keyword + semantico), 'keyword' (apenas texto), 'semantico' (apenas embeddings)
    """
    regras, stats = _load_regras()
    if not regras:
        return "Nenhuma regra real indexada."

    regras_por_cod: dict[int, dict] = {r.get("cod", 0): r for r in regras}

    if modo == "keyword":
        cod_list = _buscar_regras_keyword(termo, regras, limite)
    elif modo == "semantico":
        rag = _rag_engine()
        sem_results = rag.search(termo, top_k=limite, doc_type="regra")
        cod_list = [r.metadata.get("cod", 0) for r in sem_results]
    else:
        rag = _rag_engine()
        kw_scores = _keyword_scores_regras(termo)
        hybrid_results = rag.hybrid_search(
            query=termo,
            keyword_ids_scores=kw_scores,
            top_k=limite,
            doc_type="regra",
        )
        cod_list = [r.metadata.get("cod", 0) for r in hybrid_results]

    resultados = [regras_por_cod[c] for c in cod_list if c in regras_por_cod]

    if not resultados:
        return f"Nenhuma regra encontrada para '{termo}'."

    lines = [
        f"Encontradas {len(resultados)} regras para '{termo}' (modo={modo}):\n"
    ]

    for r in resultados:
        dest = r.get("destino", "?")
        nf = r.get("num_funcoes", 0)
        nc = r.get("num_componentes", 0)
        funcoes = r.get("funcoes", [])
        funcoes_unicas = sorted(set(funcoes))
        tipos = r.get("tipos_componentes", {})
        params = r.get("params", "")
        variaveis = r.get("variaveis", "")
        retorno = r.get("params_out", "")

        lines.append(f"### [{r['cod']}] {r['nome']}")
        lines.append(f"  Destino: {dest} | Funcoes: {nf} | Componentes: {nc}")
        if params:
            lines.append(f"  Params: {params[:200]}")
        if variaveis:
            lines.append(f"  Variaveis: {variaveis[:200]}")
        if retorno:
            lines.append(f"  Retorno: {retorno}")
        if tipos:
            tipos_str = ", ".join(f"{k}:{v}" for k, v in tipos.items() if k != "TFlowSubModel")
            lines.append(f"  Componentes: {tipos_str}")
        if funcoes_unicas:
            lines.append(f"  Funcoes: {', '.join(funcoes_unicas[:20])}")
        lines.append("")

    top = stats.get("top_funcoes", [])[:10]
    if top:
        lines.append("\n--- Top 10 funcoes do sistema ---")
        for fn, count in top:
            lines.append(f"  {fn}: {count}x")

    return "\n".join(lines)


def _buscar_regras_keyword(termo: str, regras: list[dict], limite: int) -> list[int]:
    """Busca por keyword nas regras, retorna lista de cods ordenados por score."""
    termo_lower = termo.lower()
    resultados = []
    for r in regras:
        score = 0
        if termo_lower in r.get("nome", "").lower():
            score += 10
        if termo_lower in r.get("categoria", "").lower():
            score += 5
        if termo_lower in r.get("descricao", "").lower():
            score += 3
        for fn in r.get("funcoes", []):
            if termo_lower in fn.lower():
                score += 2
                break
        if score > 0:
            resultados.append((score, r.get("cod", 0), r.get("num_funcoes", 0)))

    resultados.sort(key=lambda x: (-x[0], -x[2]))
    return [cod for _, cod, _ in resultados[:limite]]


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 7: SPEC FLUXOGRAMA
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def buscar_manual(termo: str, limite: int = 5) -> str:
    """Busca semantica no manual completo do Maker (668+ paginas, chunked).
    Encontra documentacao relevante mesmo com termos diferentes dos exatos.
    Abrange: funcoes, componentes, arquitetura, banco de dados, configuracoes, FAQ.

    Apos encontrar paginas, use ler_pagina_manual(caminho) para ver o conteudo completo.
    Para buscar por dominio especifico, use: troubleshoot_erro, config_banco, dica_maker,
    arquitetura_webrun, config_mobile, recursos_ide, faq_maker, webrun_docs, maker_docs.

    Args:
        termo: Descricao do que procura (ex: 'como configurar dark mode', 'autenticacao JWT', 'exportar PDF')
        limite: Maximo de paginas retornadas
    """
    rag = _rag_engine()
    results = rag.search(termo, top_k=limite * 3, doc_type="manual")

    if not results:
        return f"Nenhuma pagina encontrada para '{termo}'."

    seen_paths: dict[str, tuple[str, str, str, float]] = {}
    for r in results:
        caminho = r.metadata.get("caminho", "?")
        if caminho not in seen_paths or r.score > seen_paths[caminho][3]:
            seen_paths[caminho] = (
                r.metadata.get("titulo", "?"),
                r.metadata.get("categoria", "?"),
                r.doc_id,
                r.score,
            )

    top = sorted(seen_paths.items(), key=lambda x: x[1][3], reverse=True)[:limite]

    lines = [f"Encontradas {len(top)} paginas relevantes para '{termo}':\n"]
    for caminho, (titulo, categoria, doc_id, score) in top:
        score_pct = score * 100
        lines.append(f"### {titulo}")
        lines.append(f"  Arquivo: {caminho}")
        lines.append(f"  Categoria: {categoria} | Relevancia: {score_pct:.0f}%")

        doc_idx = rag._doc_id_to_idx.get(doc_id)
        if doc_idx is not None:
            doc = rag._documents[doc_idx]
            preview = doc.text[:500].replace("\n", " ")
            lines.append(f"  Preview: {preview}...")
        lines.append("")

    lines.append("Dica: use ler_pagina_manual('caminho') para ver o conteudo completo de uma pagina.")

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 7: SPEC FLUXOGRAMA
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def spec_fluxograma() -> str:
    """Retorna a especificacao tecnica COMPLETA para criar fluxogramas:
    - DFM (TFlowStart, TFlowExpression, TFlowDecision, TFlowLine, etc.)
    - Script XML (EXPRESSION, DECISION, CALLRULE, RULERETURN)
    - Encoding base64 com CRLF obrigatorio
    - REG_DESTINO: 1=cliente, 2=servidor
    - Tipos de dados para params/variaveis
    - Vinculacao de regras a eventos de formulario"""
    return _ler_arquivo_ref("maker-fluxogramas.mdc")


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 8: VALIDAR FLUXO
# ═══════════════════════════════════════════════════════════════════════════

def _parse_param(p: dict) -> StepParam:
    tipo = p.get("tipo", "constante")
    if tipo == "variavel":
        return ParamVariable(
            nome=p["nome"],
            tipo_dado=p.get("tipo_dado", "Variante"),
        )
    elif tipo == "sql":
        return ParamSQL(sql=p["sql"], binds=p.get("binds", []))
    elif tipo == "funcao":
        sub_params = [_parse_param(sp) for sp in p.get("params", [])]
        return ParamFunction(
            funcao=p["funcao"],
            nome_amigavel=p.get("nome_amigavel", p["funcao"]),
            params=sub_params,
            tipo_retorno=p.get("tipo_retorno", "Variante"),
        )
    else:
        return ParamConstant(
            valor=p.get("valor"),
            tipo_dado=p.get("tipo_dado", "Letras"),
        )


def _parse_steps(steps: list[dict]) -> list:
    result = []
    for s in steps:
        tipo = s.get("tipo", "expressao")

        if tipo == "while":
            params = [_parse_param(p) for p in s.get("params", [])]
            corpo = _parse_steps(s.get("corpo", []))
            result.append(StepDecision(
                nome=s.get("nome", "loop"),
                descricao=s.get("descricao", "Loop"),
                funcao=s["funcao"],
                nome_amigavel=s.get("nome_amigavel", s["funcao"]),
                params=params,
                sim=corpo,
                nao=[],
                loop=True,
            ))

        elif tipo == "decisao":
            params = [_parse_param(p) for p in s.get("params", [])]
            result.append(StepDecision(
                nome=s.get("nome", f"dec{len(result)+1}"),
                descricao=s.get("descricao", ""),
                funcao=s["funcao"],
                nome_amigavel=s.get("nome_amigavel", s["funcao"]),
                params=params,
                sim=_parse_steps(s.get("sim", [])),
                nao=_parse_steps(s.get("nao", [])),
                loop=s.get("loop", False),
            ))

        elif tipo == "subrotina":
            sr_params = []
            for sp in s.get("params", []):
                sr_params.append(SubRoutineParam(
                    target_param_name=sp["target_param_name"],
                    value=_parse_param(sp["value"]),
                ))
            result.append(StepSubRoutine(
                nome=s.get("nome", ""),
                rule_name=s["rule_name"],
                rule_id=s["rule_id"],
                params=sr_params,
                return_var=s.get("return_var", ""),
                description=s.get("description", ""),
            ))

        elif tipo == "atividade":
            act_params = []
            for ap in s.get("params", []):
                act_params.append(SubRoutineParam(
                    target_param_name=ap["target_param_name"],
                    value=_parse_param(ap["value"]),
                ))
            result.append(StepActivity(
                nome=s.get("nome", ""),
                activity_id=s.get("activity_id", 7),
                object_name=s.get("object_name", ""),
                real_name=s.get("real_name", ""),
                params=act_params,
                description=s.get("description", ""),
            ))

        else:
            params = [_parse_param(p) for p in s.get("params", [])]
            result.append(StepExpression(
                nome=s.get("nome", f"step{len(result)+1}"),
                descricao=s.get("descricao", ""),
                funcao=s.get("funcao", ""),
                nome_amigavel=s.get("nome_amigavel", s.get("funcao", "")),
                params=params,
                retorno=s.get("retorno", ""),
                tipo_retorno=s.get("tipo_retorno", "Variante"),
            ))

    return result


def _validate_functions(steps: list[dict], idx: _FuncIndex, errors: list[str], destino: int):
    for s in steps:
        tipo = s.get("tipo", "expressao")
        funcao = s.get("funcao", "")

        if funcao and tipo not in ("subrotina", "atividade"):
            f = idx.detalhar(funcao)
            if not f:
                errors.append(f"Funcao '{funcao}' nao encontrada")
            elif destino == 2 and not f.servidor:
                errors.append(
                    f"Funcao '{funcao}' nao e compativel com servidor "
                    f"(compat: {', '.join(f.compatibilidade)})"
                )

        for p in s.get("params", []):
            if p.get("tipo") == "funcao":
                _validate_functions([p], idx, errors, destino)

        if tipo == "decisao":
            _validate_functions(s.get("sim", []), idx, errors, destino)
            _validate_functions(s.get("nao", []), idx, errors, destino)


@mcp.tool()
def validar_fluxo(spec_json: str) -> str:
    """Valida uma especificacao de fluxo SEM gerar arquivo.
    Verifica: funcoes existem, compatibilidade servidor/cliente, parametros.
    Use ANTES de gerar_fluxo para evitar erros.

    Args:
        spec_json: JSON com a spec do fluxo. Pode ser uma unica regra ou um array de regras.
            Cada regra: {nome, destino (1=cliente/2=servidor), parametros [{nome,tipo}],
            variaveis [{nome,tipo}], retorno_tipo, codigo, passos [...]}
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    regras = spec if isinstance(spec, list) else [spec]
    idx = _funcoes()
    all_errors: list[str] = []

    for i, r in enumerate(regras):
        prefix = f"Regra '{r.get('nome', f'#{i}')}': " if len(regras) > 1 else ""
        errors: list[str] = []

        if not r.get("nome"):
            errors.append("Campo 'nome' obrigatorio")
        if not r.get("passos"):
            errors.append("Campo 'passos' obrigatorio")

        destino = r.get("destino", 1)
        _validate_functions(r.get("passos", []), idx, errors, destino)

        for e in errors:
            all_errors.append(f"{prefix}{e}")

    if all_errors:
        return "ERROS DE VALIDACAO:\n" + "\n".join(f"  - {e}" for e in all_errors)
    return f"OK: {len(regras)} regra(s) valida(s). Nenhum erro encontrado."


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 9: GERAR FLUXO
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def gerar_fluxo(spec_json: str, output_path: str) -> str:
    """Gera arquivo .frz contendo um ou mais fluxogramas/regras.
    Suporta multiplas regras interconectadas (sub-rotinas chamando umas as outras).

    Args:
        spec_json: JSON com a especificacao. Pode ser:
            - Uma unica regra: {nome, destino, codigo, parametros, variaveis, passos, ...}
            - Multiplas regras: [{...}, {...}]
            Cada regra aceita:
              nome (str), destino (1=cliente/2=servidor), codigo (int),
              descricao (str), retorno_tipo (str), categoria (str, default '\\Uso Geral'),
              parametros [{nome, tipo, tamanho?}],
              variaveis [{nome, tipo, tamanho?}],
              passos: lista de passos onde cada passo e:
                - Expressao: {tipo:'expressao', nome, descricao, funcao, nome_amigavel, params, retorno, tipo_retorno}
                - Decisao: {tipo:'decisao', nome, descricao, funcao, nome_amigavel, params, sim:[passos], nao:[passos]}
                - Sub-rotina: {tipo:'subrotina', nome, rule_name, rule_id, params:[{target_param_name, value}], return_var, description}
                - Atividade: {tipo:'atividade', nome, activity_id (int, ex: 7=ActNewErrorMessage), object_name, real_name, params:[{target_param_name, value:{tipo,valor}}], description}
              Parametros de cada passo:
                - Variavel: {tipo:'variavel', nome, tipo_dado?}
                - Constante: {tipo:'constante', valor, tipo_dado?}
                - SQL: {tipo:'sql', sql, binds:[{nome, variavel}]}
                - Funcao: {tipo:'funcao', funcao, nome_amigavel, params, tipo_retorno}
        output_path: Caminho absoluto para o arquivo .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    regras_data = spec if isinstance(spec, list) else [spec]
    idx = _funcoes()

    all_errors: list[str] = []
    for r in regras_data:
        _validate_functions(r.get("passos", []), idx, all_errors, r.get("destino", 1))
    if all_errors:
        return "ERROS DE VALIDACAO:\n" + "\n".join(f"  - {e}" for e in all_errors)

    rust_result = _compile_frz_dispatch({"regras": regras_data}, output_path)
    if rust_result is not None:
        return rust_result

    rule_specs = []
    for r in regras_data:
        rule_specs.append(RuleSpec(
            nome=r["nome"],
            destino=r.get("destino", 2),
            codigo=r.get("codigo", 50),
            descricao=r.get("descricao", r["nome"]),
            retorno_tipo=r.get("retorno_tipo", ""),
            categoria=r.get("categoria", r"\Uso Geral"),
            parametros=[
                RuleParam(
                    nome=p["nome"],
                    tipo=p["tipo"],
                    tamanho=p.get("tamanho", ""),
                )
                for p in r.get("parametros", [])
            ],
            variaveis=[
                RuleVar(
                    nome=v["nome"],
                    tipo=v["tipo"],
                    tamanho=v.get("tamanho", ""),
                )
                for v in r.get("variaveis", [])
            ],
            passos=_parse_steps(r.get("passos", [])),
        ))

    frz = FrzBuilder(rules=rule_specs)
    path = frz.write(output_path)

    lines = [f"FRZ gerado com sucesso: {path}\n"]
    for i, rs in enumerate(rule_specs):
        rb = RuleBuilder(rs)
        dfm, script, _ = rb.build()
        dest_label = "Servidor" if rs.destino == 2 else "Cliente"
        lines.append(
            f"  Regra {i + 1}: {rs.nome} [{dest_label}] "
            f"(cod={rs.codigo}, {len(rs.parametros)} params, "
            f"{len(rs.variaveis)} vars, {len(rs.passos)} passos, "
            f"DFM={len(dfm)}chars, Script={len(script)}chars)"
        )

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 9b: GERAR FUNCAO CUSTOMIZADA
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def gerar_funcao(spec_json: str, output_path: str) -> str:
    """Gera arquivo .frz contendo funcoes customizadas (novas funcoes nativas).

    Funcoes CLIENTE podem ser criadas do zero (JavaScript puro).
    Funcoes SERVIDOR so podem usar classes existentes no WebRun/JARs.

    Args:
        spec_json: JSON com a especificacao. Pode ser uma ou multiplas funcoes:
            [{
              nome_real (str): Nome tecnico da funcao (ex: 'ebfValidarCPF'),
              nome (str): Nome amigavel (ex: 'Validar CPF'),
              codigo (int): Codigo unico da funcao,
              descricao (str): Descricao detalhada com parametros e retorno,
              params (str): Tipos dos parametros separados por ; (ex: 'Letras;Inteiro'),
              retorno (str): Tipo de retorno (ex: 'Logico', 'Variante', 'Letras'),
              compatibilidade (str): '1'=cliente, '2'=servidor, '1,2'=ambos,
              conteudo_cliente (str): Codigo JavaScript da funcao,
              conteudo_servidor (str): Codigo Java da funcao (so com classes existentes),
              tipo (int, default 39): Categoria interna,
              categoria (str, default '\\Uso Geral'): Caminho no menu de funcoes
            }]
        output_path: Caminho absoluto para o arquivo .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    funcoes_data = spec if isinstance(spec, list) else [spec]

    rust_result = _compile_frz_dispatch({"funcoes": funcoes_data}, output_path)
    if rust_result is not None:
        return rust_result

    return "ERRO: Compilador Rust nao disponivel. Funcoes customizadas requerem o compilador Rust."


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 10: GERAR EXPRESSAO (debug/inspecao)
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def gerar_expressao(funcao: str, params_json: str = "[]", retorno: str = "") -> str:
    """Gera as properties DFM (Expression, DiagramXml, Text) de uma funcao.
    Util para debug, para entender o formato ou para inserir em fluxos existentes.

    Args:
        funcao: Nome real da funcao (ex: 'ebfSQLExecuteQuery', 'isEqual', 'ebfConcat')
        params_json: JSON array de parametros [{tipo:'variavel'|'constante'|'sql'|'funcao', ...}]
        retorno: Nome da variavel de retorno (opcional)
    """
    idx = _funcoes()
    f = idx.detalhar(funcao)
    if not f:
        similares = idx.buscar(funcao)
        if similares:
            nomes = ", ".join(s.nome_real for s in similares[:5])
            return f"ERRO: Funcao '{funcao}' nao encontrada. Similares: {nomes}"
        return f"ERRO: Funcao '{funcao}' nao encontrada"

    try:
        params_data = json.loads(params_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON de parametros invalido: {e}"

    params = [_parse_param(p) for p in params_data]
    expr = build_expression_xml(funcao, f.nome_amigavel, params)
    diag = build_diagram_xml(funcao, f.retorno or "Variante", params)

    parts_text: list[str] = []
    for p in params:
        if isinstance(p, ParamVariable):
            parts_text.append(f"@{p.nome}")
        elif isinstance(p, ParamConstant):
            parts_text.append(p.valor or "NULL")
        elif isinstance(p, ParamSQL):
            parts_text.append("SQL")
    text = f"{f.nome_amigavel}({', '.join(parts_text)})"

    return (
        f"=== {f.nome_real} ({f.nome_amigavel}) ===\n"
        f"Compatibilidade: {', '.join(f.compatibilidade)}\n"
        f"Retorno: {f.retorno or 'void'}\n\n"
        f"--- Expression ---\n{expr}\n\n"
        f"--- DiagramXml ---\n{diag}\n\n"
        f"--- Text ---\n{text}\n\n"
        f"--- ReturnVar ---\n{retorno}\n"
    )


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 11: ESTRUTURA FRZ
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def estrutura_frz() -> str:
    """Retorna a estrutura XML COMPLETA de um arquivo FRZ, incluindo:
    - Hierarquia de tags (tables, rules, templates, functions, ENTITY_SCHEMA, datapackets, REFERENCE_RELATIONSHIP)
    - Todos os COM_TIPO de componentes com contagem real
    - Tipos de formulario (Template vs CRUD) e suas diferencas
    - REG_DESTINO (1=Cliente, 2=Servidor) e tipos de dados
    - Formato de parametros e variaveis
    - Eventos de componente
    - CSS Bootstrap mais usadas
    Baseado na analise de ExemplosFRZ.frz (18MB, 104 tabelas, 29 regras, 12 formularios)."""
    return _ler_arquivo_ref("estrutura_frz.md")


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 12: SPEC COMPONENTES
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def spec_componentes() -> str:
    """Retorna o catalogo COMPLETO de componentes Maker (COM_TIPO) com TODAS as
    properties de cada tipo: F=Form, E=Edit, C=Combo, K=Lookup, L=Label,
    P=Container, G=Grid, B=Button, M=Memo, H=CheckBox, R=RadioGroup,
    I=Image, A=Attachment, W=Container Web, S=Shape/Separator.
    Inclui eventos, mascaras, exemplos XML.
    ESSENCIAL para montar campos de formulario corretamente."""
    return _ler_arquivo_ref("maker-componentes.mdc")


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 13: SPEC DESIGN
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def spec_design() -> str:
    """Retorna os padroes de design premium para formularios Maker:
    cards Bootstrap 5, icones Font Awesome, CSS nativo do WebRun,
    variaveis --webrun-*, hierarquia de layout (Aba > Card > Header > Campos),
    dimensoes, posicionamento, suporte a dark mode, checklist visual.
    ESSENCIAL para criar telas com visual profissional."""
    return _ler_arquivo_ref("maker-design.mdc")


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 14: GERAR TELA COMPLETA
# ═══════════════════════════════════════════════════════════════════════════

def _parse_entity(ent_data: dict) -> EntitySpec:
    """Converte dict JSON para EntitySpec."""
    atributos = []
    for a in ent_data.get("atributos", []):
        atributos.append(EntityAttribute(
            nome=a["nome"],
            tipo=a.get("tipo", "string"),
            tamanho=a.get("tamanho", 0),
            nullable=a.get("nullable", True),
            generated=a.get("generated", False),
            default=a.get("default", ""),
            mascara=a.get("mascara", ""),
            friendly_name=a.get("friendly_name", ""),
        ))

    chaves = []
    for k in ent_data.get("chaves", []):
        chaves.append(EntityKey(
            nome=k.get("nome", f"{ent_data['nome']}_PKEY"),
            colunas=k.get("colunas", []),
            primary=k.get("primary", True),
            unique=k.get("unique", False),
        ))

    if not chaves and atributos:
        pk_cols = [a.nome for a in atributos if a.generated]
        if not pk_cols:
            pk_cols = [atributos[0].nome]
        chaves.append(EntityKey(
            nome=f"{ent_data['nome']}_PKEY",
            colunas=pk_cols,
        ))

    return EntitySpec(
        nome=ent_data["nome"],
        atributos=atributos,
        chaves=chaves,
        friendly_name=ent_data.get("friendly_name", ""),
        form=ent_data.get("form", ""),
    )


def _parse_datapacket(dp_data: dict, entities: list[EntitySpec]) -> DataPacketSpec:
    """Converte dict JSON para DataPacketSpec."""
    entity_name = dp_data["entity_name"]
    entity_match = next((e for e in entities if e.nome == entity_name), None)

    attrs = None
    if "atributos" in dp_data:
        attrs = [
            EntityAttribute(
                nome=a["nome"],
                tipo=a.get("tipo", "string"),
                tamanho=a.get("tamanho", 0),
                friendly_name=a.get("friendly_name", ""),
            )
            for a in dp_data["atributos"]
        ]

    linhas = []
    for row in dp_data.get("linhas", []):
        if isinstance(row, dict):
            linhas.append(DataRow(campos=row))
        else:
            linhas.append(row)

    return DataPacketSpec(
        entity_name=entity_name,
        linhas=linhas,
        guid=dp_data.get("guid", ""),
        friendly_name=dp_data.get("friendly_name", ""),
        form=dp_data.get("form", ""),
        atributos=attrs,
    )


def _parse_events(eventos_data: dict) -> dict[str, list[EventBinding]]:
    """Converte dicionario de eventos JSON para EventBinding."""
    result: dict[str, list[EventBinding]] = {}
    for ev_name, bindings in eventos_data.items():
        result[ev_name] = []
        for b in (bindings if isinstance(bindings, list) else [bindings]):
            if isinstance(b, str):
                result[ev_name].append(EventBinding(rule_name=b))
            else:
                result[ev_name].append(EventBinding(
                    rule_name=b["regra"],
                    entrada=b.get("entrada", ""),
                ))
    return result


def _parse_form_data(form_data: dict) -> FormSpec:
    """Converte dict JSON para FormSpec."""
    campos = []
    for c in form_data.get("campos", []):
        eventos = _parse_events(c.get("eventos", {}))
        campos.append(FormField(
            nome=c["nome"],
            tipo=c["tipo"],
            campo=c.get("campo", ""),
            descricao=c.get("descricao", ""),
            aba=c.get("aba", "01-Cadastro"),
            container=c.get("container", ""),
            posicao_x=c.get("posicao_x", 16),
            posicao_y=c.get("posicao_y", 0),
            tamanho=c.get("tamanho", 321),
            altura=c.get("altura", 35),
            properties=c.get("properties", {}),
            eventos=eventos,
        ))

    eventos_form = _parse_events(form_data.get("eventos", {}))

    return FormSpec(
        descricao=form_data.get("descricao", "Formulario"),
        tabela=form_data.get("tabela", ""),
        campo_chave=form_data.get("campo_chave", ""),
        sql_select=form_data.get("sql_select", ""),
        tamanho=form_data.get("tamanho", 1100),
        altura=form_data.get("altura", 700),
        campos=campos,
        sql_update=form_data.get("sql_update", ""),
        campos_grade=form_data.get("campos_grade", ""),
        campos_pesquisa=form_data.get("campos_pesquisa", ""),
        sql_default=form_data.get("sql_default", ""),
        sql_mascara=form_data.get("sql_mascara", ""),
        css=form_data.get("css", ""),
        codigo=form_data.get("codigo", 9000),
        guid=form_data.get("guid", ""),
        sistema=form_data.get("sistema", "SISTEMA"),
        eventos_form=eventos_form,
        navegacao=form_data.get("navegacao", True),
        abas=form_data.get("abas", True),
        responsivo=form_data.get("responsivo", True),
        aba_localizar=form_data.get("aba_localizar", True),
        editar_duplo_clique=form_data.get("editar_duplo_clique", True),
        barra_rolagem=form_data.get("barra_rolagem", True),
        categoria=form_data.get("categoria", 0),
    )


@mcp.tool()
def gerar_tabela_dados(spec_json: str, output_path: str) -> str:
    """Gera arquivo .frz com definicao de tabelas (ENTITY_SCHEMA) e dados iniciais (datapackets).
    Produz DDL + seed data prontos para importar no Maker.

    Args:
        spec_json: JSON com a especificacao. Estrutura:
            {
              "sistema": "CODIGO_SISTEMA",
              "entidades": [
                {
                  "nome": "NOME_TABELA",
                  "friendly_name": "NOME_TABELA",
                  "form": "nome_form_vinculado",
                  "atributos": [
                    {
                      "nome": "ID",
                      "tipo": "integer",
                      "tamanho": 32,
                      "nullable": false,
                      "generated": true,
                      "default": "",
                      "mascara": ""
                    },
                    {
                      "nome": "NOME",
                      "tipo": "string",
                      "tamanho": 150,
                      "nullable": false,
                      "generated": false,
                      "default": ""
                    },
                    {
                      "nome": "ATIVO",
                      "tipo": "boolean",
                      "nullable": false,
                      "default": "true"
                    },
                    {
                      "nome": "DATA_CRIACAO",
                      "tipo": "date",
                      "nullable": false
                    }
                  ],
                  "chaves": [
                    {
                      "nome": "TABELA_PKEY",
                      "colunas": ["ID"],
                      "primary": true,
                      "unique": false
                    }
                  ]
                }
              ],
              "dados": [
                {
                  "entity_name": "NOME_TABELA",
                  "linhas": [
                    {"ID": "1", "NOME": "Primeiro registro", "ATIVO": "-1", "DATA_CRIACAO": "01/01/2025"},
                    {"ID": "2", "NOME": "Segundo registro", "ATIVO": "0", "DATA_CRIACAO": "15/03/2025"}
                  ]
                }
              ]
            }

            Tipos: integer (LENGTH=bits), string (LENGTH=chars), boolean, date, float, text.
            Valores boolean: -1 = true, 0 = false.
            Valores date: DD/MM/AAAA.
            Valores NULL: omitir a chave ou usar null.

        output_path: Caminho absoluto para o arquivo .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    entity_specs = [_parse_entity(e) for e in spec.get("entidades", [])]
    dp_specs = [_parse_datapacket(d, entity_specs) for d in spec.get("dados", [])]

    sistema = spec.get("sistema", "SISTEMA")

    frz = FrzBuilder(entities=entity_specs, datapackets=dp_specs)
    path = frz.write(output_path)

    lines = [f"FRZ gerado com sucesso: {path}\n"]
    for ent in entity_specs:
        pk_cols = []
        for k in ent.chaves:
            if k.primary:
                pk_cols.extend(k.colunas)
        lines.append(
            f"  Entidade: {ent.nome} ({len(ent.atributos)} colunas, "
            f"PK: {', '.join(pk_cols) or 'nenhuma'})"
        )
    for dp in dp_specs:
        lines.append(
            f"  Dados: {dp.entity_name} ({len(dp.linhas)} linhas)"
        )

    return "\n".join(lines)


@mcp.tool()
def gerar_tela_completa(spec_json: str, output_path: str) -> str:
    """Gera arquivo .frz com formulario(s) COMPLETO(s) + regras vinculadas a eventos.
    Produz tela pronta para importar no Maker com layout, campos, CSS e fluxos.
    Suporta multiplos formularios no mesmo FRZ.

    Args:
        spec_json: JSON com a especificacao completa. Estrutura:
            {
              "formulario": { ... } ou "formularios": [{ ... }, { ... }],

              Cada formulario aceita:
                "descricao": "Titulo da tela",
                "tabela": "NOME_TABELA" (vazio para templates),
                "campo_chave": "ID_CAMPO",
                "sql_select": "SELECT * FROM TABELA WHERE ID = :ID",
                "tamanho": 1100, "altura": 700,
                "navegacao": true (false para templates),
                "abas": true (false para templates),
                "responsivo": true,
                "aba_localizar": true,
                "editar_duplo_clique": true,
                "barra_rolagem": true (false para remover scrollbar),
                "sql_update": "CAMPO1\\nCAMPO2",
                "campos_grade": "CAMPO1;CAMPO2",
                "campos_pesquisa": "CAMPO1;CAMPO2",
                "css": ".classe-custom { ... }",
                "codigo": 9000,
                "sistema": "SISTEMA",
                "categoria": 0,
                "eventos": {
                  "Antes de Inserir": [{"regra": "Nome do Fluxo", "entrada": "param=campo"}],
                  "Ao Entrar": ["Nome do Fluxo Simples"]
                },
                "campos": [
                  {
                    "nome": "edtCampo",
                    "tipo": "E",
                    "campo": "COLUNA_BANCO",
                    "descricao": "Label do campo",
                    "aba": "01-Cadastro",
                    "container": "containerPai",
                    "posicao_x": 16, "posicao_y": 0,
                    "tamanho": 321, "altura": 35,
                    "properties": {
                      "Placeholder": "Digite...",
                      "Obrigatorio": "TRUE",
                      "NomeClasseCss": "form-group col-md-6",
                      "Mascara": "CPF"
                    },
                    "eventos": {
                      "Ao Sair": [{"regra": "Validar Campo", "entrada": "pValor=edtCampo"}]
                    }
                  }
                ],

              "tabelas": [...],     (opcional, Data Dictionary legado)
              "regras": [...]      (opcional, mesmo formato de gerar_fluxo)
              "entidades": [       (opcional, ENTITY_SCHEMA com DDL completa)
                {
                  "nome": "TABELA",
                  "atributos": [
                    {"nome": "ID", "tipo": "integer", "tamanho": 32, "nullable": false, "generated": true},
                    {"nome": "NOME", "tipo": "string", "tamanho": 150, "nullable": false}
                  ],
                  "chaves": [{"nome": "TABELA_PKEY", "colunas": ["ID"], "primary": true}]
                }
              ],
              "dados": [           (opcional, seed data / datapackets)
                {
                  "entity_name": "TABELA",
                  "linhas": [
                    {"ID": "1", "NOME": "Registro 1"},
                    {"ID": "2", "NOME": "Registro 2"}
                  ]
                }
              ]
            }

            COM_TIPO: E=Edit, C=Combo, K=Lookup, L=Label, P=Container,
            G=Grid, B=Button, M=Memo, H=CheckBox, R=RadioGroup, I=Image,
            A=Attachment, W=Container Web, S=Separator/Shape.
            Mascaras: CPF, CNPJ, TELEFONE, CELULAR, CEP, DATA, HORA, MOEDA.
        output_path: Caminho absoluto para o arquivo .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    rules_data = spec.get("regras", [])
    tables_data = spec.get("tabelas", [])

    idx = _funcoes()
    errors: list[str] = []
    for r in rules_data:
        _validate_functions(r.get("passos", []), idx, errors, r.get("destino", 1))
    if errors:
        return "ERROS DE VALIDACAO:\n" + "\n".join(f"  - {e}" for e in errors)

    rust_result = _compile_frz_dispatch(spec, output_path)
    if rust_result is not None:
        return rust_result

    rule_specs = []
    for r in rules_data:
        rule_specs.append(RuleSpec(
            nome=r["nome"],
            destino=r.get("destino", 2),
            codigo=r.get("codigo", 50),
            descricao=r.get("descricao", r["nome"]),
            retorno_tipo=r.get("retorno_tipo", ""),
            categoria=r.get("categoria", r"\Uso Geral"),
            parametros=[
                RuleParam(nome=p["nome"], tipo=p["tipo"], tamanho=p.get("tamanho", ""))
                for p in r.get("parametros", [])
            ],
            variaveis=[
                RuleVar(nome=v["nome"], tipo=v["tipo"], tamanho=v.get("tamanho", ""))
                for v in r.get("variaveis", [])
            ],
            passos=_parse_steps(r.get("passos", [])),
        ))

    table_specs = []
    for t in tables_data:
        table_specs.append(TableSpec(
            nome=t["nome"],
            descricao=t.get("descricao", ""),
            campos=[
                TableField(
                    nome=c["nome"],
                    descricao=c.get("descricao", ""),
                    tipo=c.get("tipo", "1"),
                    valor_padrao=c.get("valor_padrao", ""),
                )
                for c in t.get("campos", [])
            ],
        ))

    entity_specs = [_parse_entity(e) for e in spec.get("entidades", [])]
    dp_specs = [_parse_datapacket(d, entity_specs) for d in spec.get("dados", [])]

    form_specs: list[FormSpec] = []
    if "formularios" in spec:
        for fd in spec["formularios"]:
            form_specs.append(_parse_form_data(fd))
    elif "formulario" in spec:
        form_specs.append(_parse_form_data(spec["formulario"]))

    frz = FrzBuilder(
        rules=rule_specs, forms=form_specs, tables=table_specs,
        entities=entity_specs, datapackets=dp_specs,
    )
    path = frz.write(output_path)

    lines = [f"FRZ gerado com sucesso: {path}\n"]

    for j, fs in enumerate(form_specs):
        prefix = f"  Form {j + 1}: " if len(form_specs) > 1 else "  "
        tipo_form = "Template" if not fs.navegacao else "CRUD"
        lines.append(f"{prefix}Formulario: {fs.descricao} [{tipo_form}]")
        lines.append(f"{prefix}Tabela: {fs.tabela or '(nao vinculada)'}")
        lines.append(f"{prefix}Campos: {len(fs.campos)}")
        lines.append(f"{prefix}Dimensoes: {fs.tamanho}x{fs.altura}")
        ev_count = sum(len(v) for v in fs.eventos_form.values())
        if ev_count:
            lines.append(f"{prefix}Eventos do formulario: {ev_count}")

    if table_specs:
        for ts in table_specs:
            lines.append(f"  Tabela (DD): {ts.nome} ({len(ts.campos)} campos)")

    for ent in entity_specs:
        pk_cols = []
        for k in ent.chaves:
            if k.primary:
                pk_cols.extend(k.colunas)
        lines.append(
            f"  Entidade: {ent.nome} ({len(ent.atributos)} colunas, "
            f"PK: {', '.join(pk_cols) or 'nenhuma'})"
        )

    for dp in dp_specs:
        lines.append(f"  Dados: {dp.entity_name} ({len(dp.linhas)} linhas)")

    for i, rs in enumerate(rule_specs):
        rb = RuleBuilder(rs)
        dfm, script, _ = rb.build()
        dest_label = "Servidor" if rs.destino == 2 else "Cliente"
        lines.append(
            f"  Regra {i + 1}: {rs.nome} [{dest_label}] "
            f"(cod={rs.codigo}, {len(rs.parametros)} params, "
            f"{len(rs.passos)} passos)"
        )

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# RECIPES DE ALTO NIVEL (Token-Free Logic)
# ═══════════════════════════════════════════════════════════════════════════

_TIPO_CAMPO_MAP = {
    "texto": "E", "edit": "E", "E": "E",
    "combo": "C", "C": "C",
    "lookup": "K", "K": "K",
    "label": "L", "L": "L",
    "container": "P", "P": "P",
    "grid": "G", "G": "G",
    "botao": "B", "button": "B", "B": "B",
    "memo": "M", "M": "M",
    "checkbox": "H", "H": "H",
    "radio": "R", "R": "R",
    "imagem": "I", "image": "I", "I": "I",
    "anexo": "A", "attachment": "A", "A": "A",
    "separador": "S", "S": "S",
}

_TIPO_DADO_MAP = {
    "texto": "Letras", "letras": "Letras", "string": "Letras",
    "numero": "Numero", "inteiro": "Numero", "int": "Numero",
    "decimal": "Decimal", "float": "Decimal", "moeda": "Decimal",
    "data": "Data", "date": "Data",
    "hora": "Hora", "time": "Hora",
    "booleano": "Booleano", "bool": "Booleano",
    "variante": "Variante",
}

_CSS_COLS = {
    1: "col-md-1", 2: "col-md-2", 3: "col-md-3",
    4: "col-md-4", 6: "col-md-6", 8: "col-md-8",
    12: "col-md-12",
}


def _css_class(cols: int) -> str:
    return f"form-group {_CSS_COLS.get(cols, f'col-md-{cols}')}"


def _build_crud_validation_rule(
    nome_regra: str,
    codigo: int,
    campos: list[dict],
    tabela: str,
) -> dict:
    """Gera spec JSON de uma regra de validacao para campos obrigatorios."""
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
            "descricao": f"{label} obrigatorio?",
            "funcao": "isNullOrEmpty",
            "nome_amigavel": "Vazio ou Nulo?",
            "params": [{"tipo": "variavel", "nome": f"p{campo_nome}"}],
            "sim": [
                {
                    "tipo": "expressao",
                    "nome": f"msg{i}",
                    "descricao": f"Erro: {label}",
                    "funcao": "ebfConcat",
                    "nome_amigavel": "Concatenacao",
                    "params": [
                        {"tipo": "constante", "valor": f"O campo '{label}' e obrigatorio.", "tipo_dado": "Letras"},
                    ],
                    "retorno": "vMensagem",
                    "tipo_retorno": "Letras",
                },
                {
                    "tipo": "atividade",
                    "nome": f"err{i}",
                    "activity_id": 7,
                    "object_name": "ActNewErrorMessage",
                    "real_name": "ActNewErrorMessage",
                    "params": [
                        {"target_param_name": "ErrorMessage",
                         "value": {"tipo": "variavel", "nome": "vMensagem"}},
                    ],
                    "description": f"Erro: {label} obrigatorio",
                },
            ],
            "nao": [],
        })

    params = [
        {"nome": f"p{c.get('campo', c['nome'])}",
         "tipo": _TIPO_DADO_MAP.get(c.get("tipo_dado", "texto"), "Letras")}
        for c in required
    ]

    return {
        "nome": nome_regra,
        "destino": 2,
        "codigo": codigo,
        "descricao": f"Validacao de campos obrigatorios - {tabela}",
        "retorno_tipo": "",
        "categoria": r"\Uso Geral",
        "parametros": params,
        "variaveis": [{"nome": "vMensagem", "tipo": "Letras"}],
        "passos": passos,
    }


def _build_crud_form(
    tabela: str,
    campos: list[dict],
    titulo: str,
    codigo_form: int,
    sistema: str,
    regra_validacao: str | None,
    required_fields: list[dict],
) -> dict:
    """Gera spec JSON do formulario CRUD no formato real do Maker."""
    colunas_banco = [c.get("campo", c["nome"]) for c in campos]
    campo_chave = campos[0].get("campo", campos[0]["nome"]) if campos else "ID"

    col_list = ",\n  ".join(f"{tabela}.{col}" for col in colunas_banco)
    sql_select = f"Select\n  {col_list}\nFrom\n  {tabela}\n/*WHERE_NEW*/\n/*ORDER_NEW*/"
    sql_update = "\n".join(colunas_banco)
    campos_grade = ";".join(colunas_banco[:6])
    campos_pesquisa = ";".join(colunas_banco[:4])

    form_campos: list[dict] = []
    for c in campos:
        tipo_direto = c.get("tipo", "")
        if tipo_direto in ("E", "C", "K", "L", "P", "G", "B", "M", "H", "R", "I", "A", "S", "V", "D", "W", "F"):
            tipo_comp = tipo_direto
        else:
            tipo_comp = _TIPO_CAMPO_MAP.get(c.get("tipo_componente", "texto"), "E")

        cols = c.get("colunas", 6)
        props: dict = {}
        if not c.get("properties", {}).get("NomeClasseCss"):
            props["NomeClasseCss"] = _css_class(cols)

        if c.get("obrigatorio"):
            props["Obrigatorio"] = "TRUE"
        if c.get("mascara"):
            props["Mascara"] = c["mascara"].upper()
        if c.get("placeholder"):
            props["Placeholder"] = c["placeholder"]
        if c.get("somente_leitura"):
            props["SomenteLeitura"] = "TRUE"

        props.update(c.get("properties", {}))

        campo_dict: dict = {
            "nome": c["nome"],
            "tipo": tipo_comp,
            "campo": c.get("campo", c.get("nome", "")),
            "descricao": c.get("descricao", c.get("label", c["nome"])),
            "aba": c.get("aba", "01-Cadastro"),
            "properties": props,
        }

        if c.get("container"):
            campo_dict["container"] = c["container"]
        if c.get("eventos"):
            campo_dict["eventos"] = c["eventos"]

        form_campos.append(campo_dict)

    eventos_form = {}
    if regra_validacao and required_fields:
        entrada = ";".join(
            f"p{c.get('campo', c['nome'])}={c['nome']}"
            for c in required_fields
        )
        eventos_form = {
            "Antes de Inserir": [{
                "regra": regra_validacao,
                "entrada": entrada,
            }],
            "Antes de Alterar": [{
                "regra": regra_validacao,
                "entrada": entrada,
            }],
        }

    return {
        "descricao": titulo,
        "tabela": tabela,
        "campo_chave": campo_chave,
        "sql_select": sql_select,
        "sql_update": sql_update,
        "campos_grade": campos_grade,
        "campos_pesquisa": campos_pesquisa,
        "codigo": codigo_form,
        "sistema": sistema,
        "campos": form_campos,
        "eventos": eventos_form,
    }


@mcp.tool()
def gerar_crud(spec_json: str, output_path: str) -> str:
    """Recipe ENTERPRISE: gera CRUD corporativo com UI premium em uma chamada.

    Automaticamente aplica: cards por secao (Dados Basicos, Documentos, Contato,
    Endereco, Financeiro), titulo HTML premium, CSS MasterSkin com dark mode,
    validacao dupla (cliente JS inline + servidor Java), mascaras dinamicas,
    icones Font Awesome, acessibilidade, Bootstrap 5.3 responsivo.

    Args:
        spec_json: JSON compacto com:
            {
              "tabela": "NOME_TABELA",
              "titulo": "Titulo da Tela" (default: "Cadastro de TABELA"),
              "sistema": "GER" (default: "SISTEMA"),
              "codigo_form": 5000 (default: 9000),
              "codigo_regra": 5001 (default: 9001),
              "enterprise": true (default: true, false para modo legado),
              "campos": [
                {
                  "nome": "edtNome" (nome do componente),
                  "campo": "PES_NOME" (coluna do banco, default: nome),
                  "descricao": "Nome Completo" (label, default: nome),
                  "tipo_componente": "texto" (auto-inferido pelo nome se omitido),
                  "tipo_dado": "texto" (texto|numero|decimal|data|hora|booleano),
                  "colunas": 6 (auto-inferido se omitido: NOME=6, CPF=4, OBS=12, COD=3),
                  "obrigatorio": true (gera validacao cliente+servidor),
                  "mascara": "CPF" (auto-inferida pelo nome: CPF, CNPJ, CEP, DATA, MOEDA),
                  "placeholder": "Digite..." (auto-gerado se omitido),
                  "somente_leitura": false,
                  "aba": "01-Cadastro" (default),
                  "properties": {} (properties extras do componente)
                }
              ]
            }
        output_path: Caminho absoluto para o .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    tabela = spec.get("tabela", "")
    if not tabela:
        return "ERRO: Campo 'tabela' obrigatorio"
    campos = spec.get("campos", [])
    if not campos:
        return "ERRO: Campo 'campos' obrigatorio (lista de campos)"

    titulo = spec.get("titulo", f"Cadastro de {tabela}")
    sistema = spec.get("sistema", "SISTEMA")
    codigo_form = spec.get("codigo_form", 9000)
    codigo_regra = spec.get("codigo_regra", 9001)
    enterprise_mode = spec.get("enterprise", True)

    if enterprise_mode:
        spec = enrich_crud_spec(spec)
        campos = spec.get("campos", campos)
        titulo = spec.get("titulo", titulo)

    required_original = [c for c in spec.get("campos_original", campos)
                         if c.get("obrigatorio")]
    required = [c for c in campos if c.get("obrigatorio")]

    regras = []
    nome_regra_srv = None
    nome_regra_cli = None
    nome_regra_mask = None
    eventos_form: dict[str, list] = {}

    if enterprise_mode and required:
        nome_regra_srv = f"Validar {tabela} Servidor"
        srv_rule = build_server_validation_rule(
            nome_regra_srv, codigo_regra, required, tabela,
        )
        if srv_rule:
            regras.append(srv_rule)

        nome_regra_cli = f"Validar {tabela} Cliente"
        cli_rule = build_client_validation_rule(
            nome_regra_cli, codigo_regra + 1, required, tabela,
        )
        if cli_rule:
            regras.append(cli_rule)

        campos_com_mascara = [c for c in campos if c.get("mascara")
                              or (c.get("properties", {}).get("Mascara"))]
        mask_rule = build_mask_client_rule(codigo_regra + 2, campos_com_mascara)
        if mask_rule:
            nome_regra_mask = mask_rule["nome"]
            regras.append(mask_rule)

        if nome_regra_srv:
            entrada_srv = ";".join(
                f"p{c.get('campo', c['nome'])}={c['nome']}"
                for c in required
            )
            eventos_form.setdefault("Antes de Inserir", []).append({
                "regra": nome_regra_srv, "entrada": entrada_srv,
            })
            eventos_form.setdefault("Antes de Alterar", []).append({
                "regra": nome_regra_srv, "entrada": entrada_srv,
            })

        if nome_regra_mask:
            eventos_form.setdefault("Ao Entrar", []).append({
                "regra": nome_regra_mask, "entrada": "",
            })

    elif required:
        nome_regra_srv = f"Validar {tabela}"
        regra_dict = _build_crud_validation_rule(
            nome_regra_srv, codigo_regra, required, tabela,
        )
        if regra_dict:
            regras.append(regra_dict)

    idx = _funcoes()
    all_errors: list[str] = []
    for r in regras:
        _validate_functions(r.get("passos", []), idx, all_errors, r.get("destino", 1))
    if all_errors:
        return "ERROS DE VALIDACAO:\n" + "\n".join(f"  - {e}" for e in all_errors)

    form_dict = _build_crud_form(
        tabela, campos, titulo, codigo_form, sistema,
        nome_regra_srv, required,
    )

    if enterprise_mode:
        form_dict["css"] = spec.get("css", _CSS_MASTERSKIN)
        form_dict["responsivo"] = True
        if eventos_form:
            existing_ev = form_dict.get("eventos", {})
            for ev_name, bindings in eventos_form.items():
                existing_ev.setdefault(ev_name, []).extend(bindings)
            form_dict["eventos"] = existing_ev

    full_spec = {
        "formulario": form_dict,
        "regras": regras,
    }

    rust_result = _compile_frz_dispatch(full_spec, output_path)
    if rust_result is not None:
        info = [rust_result, ""]
        mode_label = "Enterprise" if enterprise_mode else "CRUD"
        info.append(f"[{mode_label} Recipe] {len(campos)} campos, {len(required)} obrigatorios")
        if enterprise_mode:
            info.append(f"[Enterprise] Cards por secao, CSS MasterSkin, Bootstrap 5.3")
        if nome_regra_srv:
            info.append(f"[Enterprise] Regra servidor: '{nome_regra_srv}' (Antes de Inserir + Antes de Alterar)")
        if nome_regra_cli:
            info.append(f"[Enterprise] Regra cliente: '{nome_regra_cli}' (validacao inline JS)")
        if nome_regra_mask:
            info.append(f"[Enterprise] Mascaras: '{nome_regra_mask}' (Ao Entrar)")
        return "\n".join(info)

    form_specs = [_parse_form_data(form_dict)]
    rule_specs = []
    for r in regras:
        rule_specs.append(RuleSpec(
            nome=r["nome"],
            destino=r.get("destino", 2),
            codigo=r.get("codigo", 50),
            descricao=r.get("descricao", r["nome"]),
            retorno_tipo=r.get("retorno_tipo", ""),
            categoria=r.get("categoria", r"\Uso Geral"),
            parametros=[
                RuleParam(nome=p["nome"], tipo=p["tipo"], tamanho=p.get("tamanho", ""))
                for p in r.get("parametros", [])
            ],
            variaveis=[
                RuleVar(nome=v["nome"], tipo=v["tipo"], tamanho=v.get("tamanho", ""))
                for v in r.get("variaveis", [])
            ],
            passos=_parse_steps(r.get("passos", [])),
        ))

    frz = FrzBuilder(rules=rule_specs, forms=form_specs)
    path = frz.write(output_path)

    mode_label = "Enterprise" if enterprise_mode else "CRUD"
    lines = [f"FRZ gerado com sucesso: {path}", ""]
    lines.append(f"[{mode_label} Recipe] {len(campos)} campos, {len(required)} obrigatorios")
    lines.append(f"  Formulario: {titulo} ({tabela})")
    lines.append(f"  Dimensoes: {form_specs[0].tamanho}x{form_specs[0].altura}")
    if enterprise_mode:
        lines.append(f"  UI: Cards por secao, CSS MasterSkin, icones Font Awesome, dark mode")
    for rs in rule_specs:
        dest = "Servidor/Java" if rs.destino == 2 else "Cliente/JS"
        lines.append(f"  Regra: {rs.nome} [{dest}] ({len(rs.passos)} passos)")

    return "\n".join(lines)


@mcp.tool()
def gerar_dashboard(spec_json: str, output_path: str) -> str:
    """Recipe ENTERPRISE: gera dashboard corporativo com cards Bootstrap 5.3.

    Automaticamente aplica: titulo HTML premium, cards com header + icone,
    CSS MasterSkin com dark mode, layout responsivo, indicadores centralizados.

    Args:
        spec_json: JSON com:
            {
              "titulo": "Dashboard de Vendas",
              "sistema": "GER",
              "codigo_form": 9100,
              "paineis": [
                {
                  "titulo": "Total de Vendas",
                  "sql": "SELECT SUM(VALOR) AS TOTAL FROM VENDAS WHERE ANO = :ANO",
                  "tipo": "indicador" (indicador|tabela|lista),
                  "colunas": 4 (largura Bootstrap, default: auto-calculado),
                  "icone": "fa-dollar-sign" (auto-inferido pelo titulo)
                }
              ],
              "parametros_sql": [
                {"nome": "pAno", "tipo": "Numero", "valor_padrao": "2026"}
              ]
            }
        output_path: Caminho absoluto para o .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    spec = enrich_dashboard_spec(spec)

    titulo = spec.get("titulo", "Dashboard")
    sistema = spec.get("sistema", "SISTEMA")
    codigo_form = spec.get("codigo_form", 9100)
    paineis = spec.get("paineis", [])
    params_sql = spec.get("parametros_sql", [])
    icon_dash = spec.get("_icon", "fa-tachometer-alt")

    if not paineis:
        return "ERRO: Campo 'paineis' obrigatorio"

    campos: list[dict] = []
    regras: list[dict] = []
    eventos: dict[str, list] = {"Ao Entrar": []}

    campos.append({
        "nome": "lblTituloDash",
        "tipo": "L",
        "campo": "",
        "descricao": (
            f'<div class="enterprise-page-header">'
            f'<h3><i class="fa-solid {icon_dash}"></i> <span>{titulo}</span></h3>'
            f'<small>Visao consolidada dos indicadores</small></div>'
        ),
        "aba": "01-Dashboard",
        "properties": {"NomeClasseCss": "form-group fw-bold text-dark mb-3 col-md-12"},
    })

    for i, painel in enumerate(paineis):
        titulo_p = painel.get("titulo", f"Painel {i + 1}")
        sql = painel.get("sql", "")
        cols = painel.get("colunas", 6)
        tipo_painel = painel.get("tipo", "indicador")
        icone_p = painel.get("icone", infer_icon_for_form(titulo_p))

        card_nome = f"cardPnl{i}"
        header_nome = f"cardPnlH{i}"

        campos.append({
            "nome": card_nome,
            "tipo": "P",
            "campo": "",
            "descricao": "",
            "aba": "01-Dashboard",
            "container": "",
            "properties": {"NomeClasseCss": f"form-group card shadow col-md-{cols}"},
        })

        campos.append({
            "nome": header_nome,
            "tipo": "P",
            "campo": "",
            "descricao": "",
            "aba": "01-Dashboard",
            "container": card_nome,
            "properties": {"NomeClasseCss": "form-group card-header"},
        })

        campos.append({
            "nome": f"lblH{i}",
            "tipo": "L",
            "campo": "",
            "descricao": (
                f'<span class="enterprise-card-heading">'
                f'<i class="fa-solid {icone_p}"></i> {titulo_p}</span>'
            ),
            "aba": "01-Dashboard",
            "container": header_nome,
            "properties": {"NomeClasseCss": "form-group col-md-12"},
        })

        if tipo_painel == "indicador":
            campos.append({
                "nome": f"lblValor{i}",
                "tipo": "L",
                "campo": "",
                "descricao": titulo_p,
                "aba": "01-Dashboard",
                "container": card_nome,
                "properties": {
                    "NomeClasseCss": "form-group text-primary text-center fs-3 fw-bold",
                },
            })
        elif tipo_painel == "tabela":
            campos.append({
                "nome": f"grd{i}",
                "tipo": "G",
                "campo": "",
                "descricao": "",
                "aba": "01-Dashboard",
                "container": card_nome,
                "properties": {
                    "NomeClasseCss": "form-group col-md-12",
                    "PlaceHolder": "Nenhum dado disponivel",
                    "EnableGridExport": "True",
                },
            })

        if sql:
            codigo_regra = codigo_form + 100 + i
            nome_regra = f"Carregar {titulo_p}"

            rule_params = [
                {"nome": p["nome"], "tipo": p.get("tipo", "Letras")}
                for p in params_sql
            ]

            regras.append({
                "nome": nome_regra,
                "destino": 2,
                "codigo": codigo_regra,
                "descricao": nome_regra,
                "retorno_tipo": "",
                "parametros": rule_params,
                "variaveis": [{"nome": "vDados", "tipo": "Variante"}],
                "passos": [{
                    "tipo": "expressao",
                    "nome": f"sql{i}",
                    "descricao": f"Consultar {titulo_p}",
                    "funcao": "ebfSQLExecuteQuery",
                    "nome_amigavel": "Abrir Consulta",
                    "params": [
                        {"tipo": "sql", "sql": sql, "binds": [
                            {"nome": p["nome"], "variavel": p["nome"]}
                            for p in params_sql
                        ]},
                        {"tipo": "constante", "valor": None, "tipo_dado": "Letras"},
                    ],
                    "retorno": "vDados",
                    "tipo_retorno": "Tabela",
                }],
            })

            entrada = ";".join(f"{p['nome']}={p['nome']}" for p in params_sql)
            binding: dict[str, str] = {"regra": nome_regra}
            if entrada:
                binding["entrada"] = entrada
            eventos["Ao Entrar"].append(binding)

    if not eventos["Ao Entrar"]:
        eventos = {}

    full_spec = {
        "formulario": {
            "descricao": titulo,
            "tabela": "",
            "campo_chave": "",
            "sql_select": "",
            "codigo": codigo_form,
            "sistema": sistema,
            "navegacao": False,
            "abas": True,
            "responsivo": True,
            "css": spec.get("css", _CSS_MASTERSKIN),
            "campos": campos,
            "eventos": eventos,
        },
        "regras": regras,
    }

    idx = _funcoes()
    errs: list[str] = []
    for r in regras:
        _validate_functions(r.get("passos", []), idx, errs, 2)
    if errs:
        return "ERROS DE VALIDACAO:\n" + "\n".join(f"  - {e}" for e in errs)

    rust_result = _compile_frz_dispatch(full_spec, output_path)
    if rust_result is not None:
        return (f"{rust_result}\n\n"
                f"[Dashboard Enterprise] {len(paineis)} paineis, {len(regras)} regras SQL\n"
                f"[Enterprise] Cards Bootstrap 5.3, icones Font Awesome, CSS MasterSkin")

    form_specs = [_parse_form_data(full_spec["formulario"])]
    rule_specs = []
    for r in regras:
        rule_specs.append(RuleSpec(
            nome=r["nome"], destino=2, codigo=r.get("codigo", 50),
            descricao=r.get("descricao", ""), retorno_tipo="",
            parametros=[RuleParam(nome=p["nome"], tipo=p["tipo"]) for p in r.get("parametros", [])],
            variaveis=[RuleVar(nome=v["nome"], tipo=v["tipo"]) for v in r.get("variaveis", [])],
            passos=_parse_steps(r.get("passos", [])),
        ))

    frz = FrzBuilder(rules=rule_specs, forms=form_specs)
    path = frz.write(output_path)

    lines = [f"FRZ gerado com sucesso: {path}", "",
             f"[Dashboard Enterprise] {len(paineis)} paineis, {len(regras)} regras SQL",
             f"  UI: Cards Bootstrap 5.3, icones Font Awesome, CSS MasterSkin"]
    for p in paineis:
        lines.append(f"  Painel: {p.get('titulo', '?')} ({p.get('tipo', 'indicador')})")

    return "\n".join(lines)


@mcp.tool()
def gerar_login(spec_json: str, output_path: str) -> str:
    """Recipe ENTERPRISE: gera tela de login corporativa com card centralizado.

    Automaticamente aplica: card Bootstrap centralizado, icone de seguranca,
    CSS MasterSkin com dark mode, validacao inline (cliente JS),
    autenticacao segura (servidor Java), feedback de erro elegante.

    Args:
        spec_json: JSON com:
            {
              "titulo": "Login do Sistema" (default),
              "sistema": "GER",
              "codigo_form": 9200,
              "codigo_regra": 9201,
              "tabela_usuarios": "USUARIOS",
              "campo_usuario": "USU_LOGIN",
              "campo_senha": "USU_SENHA",
              "sql_auth": "SELECT * FROM USUARIOS WHERE USU_LOGIN = :pLogin AND USU_SENHA = :pSenha",
              "captcha": false (default)
            }
        output_path: Caminho absoluto para o .frz de saida
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    spec = enrich_login_spec(spec)

    titulo = spec.get("titulo", "Login do Sistema")
    sistema = spec.get("sistema", "SISTEMA")
    codigo_form = spec.get("codigo_form", 9200)
    codigo_regra = spec.get("codigo_regra", 9201)
    tabela = spec.get("tabela_usuarios", "USUARIOS")
    campo_user = spec.get("campo_usuario", "USU_LOGIN")
    campo_senha = spec.get("campo_senha", "USU_SENHA")
    sql_auth = spec.get(
        "sql_auth",
        f"SELECT * FROM {tabela} WHERE {campo_user} = :pLogin AND {campo_senha} = :pSenha",
    )
    captcha = spec.get("captcha", False)

    campos = [
        {
            "nome": "cardLogin",
            "tipo": "P",
            "campo": "",
            "descricao": "",
            "aba": "01-Login",
            "properties": {
                "NomeClasseCss": "form-group card shadow",
                "Alinhar": "alNone",
            },
        },
        {
            "nome": "cardLoginHeader",
            "tipo": "P",
            "campo": "",
            "descricao": "",
            "aba": "01-Login",
            "container": "cardLogin",
            "properties": {"NomeClasseCss": "form-group card-header"},
        },
        {
            "nome": "lblLoginHeader",
            "tipo": "L",
            "campo": "",
            "descricao": (
                '<span class="enterprise-card-heading">'
                '<i class="fa-solid fa-lock"></i> Acesso ao Sistema</span>'
            ),
            "aba": "01-Login",
            "container": "cardLoginHeader",
            "properties": {"NomeClasseCss": "form-group col-md-12"},
        },
        {
            "nome": "edtLogin",
            "tipo": "E",
            "campo": "",
            "descricao": "Usuario",
            "aba": "01-Login",
            "container": "cardLogin",
            "properties": {
                "NomeClasseCss": "form-group col-md-12",
                "Placeholder": "Digite seu usuario",
                "Obrigatorio": "TRUE",
            },
        },
        {
            "nome": "edtSenha",
            "tipo": "E",
            "campo": "",
            "descricao": "Senha",
            "aba": "01-Login",
            "container": "cardLogin",
            "properties": {
                "NomeClasseCss": "form-group col-md-12",
                "Placeholder": "Digite sua senha",
                "Obrigatorio": "TRUE",
                "Senha": "True",
            },
        },
    ]

    if captcha:
        campos.append({
            "nome": "edtCaptcha",
            "tipo": "E",
            "campo": "",
            "descricao": "Captcha",
            "aba": "01-Login",
            "container": "cardLogin",
            "properties": {
                "NomeClasseCss": "form-group col-md-12",
                "Placeholder": "Digite o codigo de verificacao",
            },
        })

    campos.append({
        "nome": "btnEntrar",
        "tipo": "B",
        "campo": "",
        "descricao": '<i class="fa-solid fa-right-to-bracket"></i> Entrar',
        "aba": "01-Login",
        "container": "cardLogin",
        "properties": {
            "NomeClasseCss": "btn-primary col-md-12 mt-3",
        },
        "eventos": {
            "Ao Clicar": [{
                "regra": "Autenticar Login",
                "entrada": "pLogin=edtLogin;pSenha=edtSenha",
            }],
        },
    })

    regra_auth = {
        "nome": "Autenticar Login",
        "destino": 2,
        "codigo": codigo_regra,
        "descricao": f"Autenticacao - {tabela}",
        "retorno_tipo": "",
        "parametros": [
            {"nome": "pLogin", "tipo": "Letras"},
            {"nome": "pSenha", "tipo": "Letras"},
        ],
        "variaveis": [
            {"nome": "vResultado", "tipo": "Variante"},
            {"nome": "vMensagem", "tipo": "Letras"},
        ],
        "passos": [
            {
                "tipo": "decisao",
                "nome": "chkLogin",
                "descricao": "Login vazio?",
                "funcao": "isNullOrEmpty",
                "nome_amigavel": "Vazio ou Nulo?",
                "params": [{"tipo": "variavel", "nome": "pLogin"}],
                "sim": [
                    {
                        "tipo": "expressao",
                        "nome": "msgLoginVazio",
                        "descricao": "Erro login",
                        "funcao": "ebfConcat",
                        "nome_amigavel": "Concatenacao",
                        "params": [{"tipo": "constante", "valor": "Informe o usuario.", "tipo_dado": "Letras"}],
                        "retorno": "vMensagem",
                        "tipo_retorno": "Letras",
                    },
                    {
                        "tipo": "atividade",
                        "nome": "errLogin",
                        "activity_id": 7,
                        "object_name": "ActNewErrorMessage",
                        "real_name": "ActNewErrorMessage",
                        "params": [{"target_param_name": "ErrorMessage",
                                    "value": {"tipo": "variavel", "nome": "vMensagem"}}],
                        "description": "Erro: usuario vazio",
                    },
                ],
                "nao": [],
            },
            {
                "tipo": "decisao",
                "nome": "chkSenha",
                "descricao": "Senha vazia?",
                "funcao": "isNullOrEmpty",
                "nome_amigavel": "Vazio ou Nulo?",
                "params": [{"tipo": "variavel", "nome": "pSenha"}],
                "sim": [
                    {
                        "tipo": "expressao",
                        "nome": "msgSenhaVazia",
                        "descricao": "Erro senha",
                        "funcao": "ebfConcat",
                        "nome_amigavel": "Concatenacao",
                        "params": [{"tipo": "constante", "valor": "Informe a senha.", "tipo_dado": "Letras"}],
                        "retorno": "vMensagem",
                        "tipo_retorno": "Letras",
                    },
                    {
                        "tipo": "atividade",
                        "nome": "errSenha",
                        "activity_id": 7,
                        "object_name": "ActNewErrorMessage",
                        "real_name": "ActNewErrorMessage",
                        "params": [{"target_param_name": "ErrorMessage",
                                    "value": {"tipo": "variavel", "nome": "vMensagem"}}],
                        "description": "Erro: senha vazia",
                    },
                ],
                "nao": [],
            },
            {
                "tipo": "expressao",
                "nome": "sqlAuth",
                "descricao": "Consultar credenciais",
                "funcao": "ebfSQLExecuteQuery",
                "nome_amigavel": "Abrir Consulta",
                "params": [
                    {"tipo": "sql", "sql": sql_auth, "binds": [
                        {"nome": "pLogin", "variavel": "pLogin"},
                        {"nome": "pSenha", "variavel": "pSenha"},
                    ]},
                    {"tipo": "constante", "valor": None, "tipo_dado": "Letras"},
                ],
                "retorno": "vResultado",
                "tipo_retorno": "Tabela",
            },
            {
                "tipo": "decisao",
                "nome": "chkAuth",
                "descricao": "Autenticou?",
                "funcao": "isNullOrEmpty",
                "nome_amigavel": "Vazio ou Nulo?",
                "params": [{"tipo": "variavel", "nome": "vResultado"}],
                "sim": [
                    {
                        "tipo": "expressao",
                        "nome": "msgFalha",
                        "descricao": "Login falhou",
                        "funcao": "ebfConcat",
                        "nome_amigavel": "Concatenacao",
                        "params": [{"tipo": "constante", "valor": "Usuario ou senha invalidos.", "tipo_dado": "Letras"}],
                        "retorno": "vMensagem",
                        "tipo_retorno": "Letras",
                    },
                    {
                        "tipo": "atividade",
                        "nome": "errAuth",
                        "activity_id": 7,
                        "object_name": "ActNewErrorMessage",
                        "real_name": "ActNewErrorMessage",
                        "params": [{"target_param_name": "ErrorMessage",
                                    "value": {"tipo": "variavel", "nome": "vMensagem"}}],
                        "description": "Erro: credenciais invalidas",
                    },
                ],
                "nao": [],
            },
        ],
    }

    full_spec = {
        "formulario": {
            "descricao": titulo,
            "tabela": "",
            "campo_chave": "",
            "sql_select": "",
            "tamanho": 500,
            "altura": 500,
            "codigo": codigo_form,
            "sistema": sistema,
            "navegacao": False,
            "abas": False,
            "responsivo": True,
            "aba_localizar": False,
            "barra_rolagem": False,
            "css": spec.get("css", _CSS_MASTERSKIN),
            "campos": campos,
        },
        "regras": [regra_auth],
    }

    idx = _funcoes()
    errs: list[str] = []
    _validate_functions(regra_auth.get("passos", []), idx, errs, 2)
    if errs:
        return "ERROS DE VALIDACAO:\n" + "\n".join(f"  - {e}" for e in errs)

    rust_result = _compile_frz_dispatch(full_spec, output_path)
    if rust_result is not None:
        feat = "com captcha" if captcha else "sem captcha"
        return (f"{rust_result}\n\n"
                f"[Login Enterprise] {titulo} ({feat})\n"
                f"[Enterprise] Card centralizado, CSS MasterSkin, dark mode")

    form_specs = [_parse_form_data(full_spec["formulario"])]
    rule_specs = [RuleSpec(
        nome=regra_auth["nome"], destino=2, codigo=codigo_regra,
        descricao=regra_auth["descricao"], retorno_tipo="",
        parametros=[RuleParam(nome=p["nome"], tipo=p["tipo"]) for p in regra_auth["parametros"]],
        variaveis=[RuleVar(nome=v["nome"], tipo=v["tipo"]) for v in regra_auth["variaveis"]],
        passos=_parse_steps(regra_auth["passos"]),
    )]

    frz = FrzBuilder(rules=rule_specs, forms=form_specs)
    path = frz.write(output_path)

    feat = "com captcha" if captcha else "sem captcha"
    lines = [f"FRZ gerado com sucesso: {path}", "",
             f"[Login Enterprise] {titulo} ({feat})",
             f"  UI: Card centralizado, CSS MasterSkin, icone seguranca, dark mode",
             f"  Regra: Autenticar Login [Servidor/Java] (4 passos: validacao + SQL auth)"]

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 18: SCHEMA DO BANCO (introspeccao)
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def schema_banco() -> str:
    """Retorna o modelo de dados Maker extraido do banco de producao (SIG_MAKER).
    Inclui: entidades FR_*, tipos de componentes, properties por tipo,
    eventos, acoes, formato de PARAMS/VARIAVEIS, FonteDados patterns,
    nomenclatura e dependencias. Base para gerar FRZs de alta fidelidade."""
    return _ler_arquivo_ref("DB_SCHEMA.md")


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 19: INTROSPECTAR TABELA DO BANCO
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def introspectar_tabela(tabela: str, host: str = "localhost", porta: int = 1433,
                         usuario: str = "sa", senha: str = "",
                         banco: str = "SIG_MAKER") -> str:
    """Introspecta uma tabela do SQL Server e retorna schema + spec JSON pronta
    para gerar_crud. Detecta chave primaria, tipos de dados, nullable e gera
    sugestoes de componentes Maker.

    Args:
        tabela: Nome da tabela (ex: 'GER_CARGO', 'SUP_ATENDIMENTO')
        host: Host do SQL Server (default: localhost)
        porta: Porta (default: 1433)
        usuario: Usuario (default: sa)
        senha: Senha do banco
        banco: Nome do banco (default: SIG_MAKER)
    """
    if not senha:
        return "ERRO: senha obrigatoria para conectar ao banco"

    try:
        import pymssql
    except ImportError:
        return "ERRO: pymssql nao instalado. Rode: pip install pymssql"

    try:
        conn = pymssql.connect(server=host, port=porta, user=usuario,
                               password=senha, database=banco)
        cur = conn.cursor()

        cur.execute("""
            SELECT c.COLUMN_NAME, c.DATA_TYPE, c.CHARACTER_MAXIMUM_LENGTH,
                   c.IS_NULLABLE, c.COLUMN_DEFAULT,
                   CASE WHEN pk.COLUMN_NAME IS NOT NULL THEN 1 ELSE 0 END as is_pk
            FROM INFORMATION_SCHEMA.COLUMNS c
            LEFT JOIN (
                SELECT ku.COLUMN_NAME
                FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
                JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE ku
                    ON tc.CONSTRAINT_NAME = ku.CONSTRAINT_NAME
                WHERE tc.TABLE_NAME = %s AND tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
            ) pk ON pk.COLUMN_NAME = c.COLUMN_NAME
            WHERE c.TABLE_NAME = %s
            ORDER BY c.ORDINAL_POSITION
        """, (tabela, tabela))

        cols = cur.fetchall()
        if not cols:
            conn.close()
            return f"ERRO: tabela '{tabela}' nao encontrada"

        cur.execute(f"SELECT COUNT(*) FROM [{tabela}]")
        row_count = cur.fetchone()[0]

        conn.close()

        sql_to_maker = {
            "int": ("Inteiro", "E", 6),
            "bigint": ("Inteiro", "E", 6),
            "smallint": ("Inteiro", "E", 4),
            "varchar": ("Letras", "E", 6),
            "nvarchar": ("Letras", "E", 6),
            "char": ("Letras", "E", 4),
            "text": ("Letras", "M", 12),
            "ntext": ("Letras", "M", 12),
            "datetime": ("Data", "E", 4),
            "smalldatetime": ("Data", "E", 4),
            "date": ("Data", "E", 4),
            "decimal": ("Fracionado", "E", 4),
            "float": ("Fracionado", "E", 4),
            "money": ("Fracionado", "E", 4),
            "bit": ("Logico", "H", 4),
            "image": ("Letras", "I", 12),
        }

        lines = [f"# Schema: {tabela} ({row_count} linhas, {len(cols)} colunas)\n"]
        campos_spec = []
        pk_cols = []

        for col_name, dtype, maxlen, nullable, default, is_pk in cols:
            maker_type, comp_type, maker_cols = sql_to_maker.get(dtype, ("Letras", "E", 6))
            size_str = f"({maxlen})" if maxlen and maxlen > 0 else ""
            null_str = "NULL" if nullable == "YES" else "NOT NULL"
            pk_str = " PK" if is_pk else ""

            lines.append(f"  {col_name}: {dtype}{size_str} {null_str}{pk_str}")

            if is_pk:
                pk_cols.append(col_name)

            campo_spec = {
                "nome": f"edt{col_name}",
                "campo": col_name,
                "descricao": col_name.replace("_", " ").title(),
                "tipo_componente": {"E": "texto", "M": "memo", "H": "checkbox",
                                    "I": "imagem"}.get(comp_type, "texto"),
                "tipo_dado": maker_type.lower(),
                "colunas": maker_cols,
                "obrigatorio": nullable == "NO" and not is_pk,
            }
            if dtype in ("datetime", "smalldatetime", "date"):
                campo_spec["mascara"] = "DATA"
            if dtype == "money":
                campo_spec["mascara"] = "MOEDA"

            campos_spec.append(campo_spec)

        chave = ";".join(pk_cols) if pk_cols else cols[0][0]
        select_cols = ", ".join(f"{tabela}.{c[0]}" for c in cols if c[1] != "image")
        sql_select = f"Select\n  {select_cols}\nFrom\n  {tabela}\n/*WHERE_NEW*/\n/*ORDER_NEW*/"
        update_cols = [c[0] for c in cols if not c[5] and c[1] != "image"]

        lines.append(f"\n## Spec JSON pronta para gerar_crud:\n")
        spec = {
            "tabela": tabela,
            "titulo": f"Cadastro de {tabela.split('_', 1)[-1].replace('_', ' ').title()}",
            "campos": campos_spec,
        }
        lines.append(json.dumps(spec, indent=2, ensure_ascii=False))

        lines.append(f"\n## FonteDados sugerida:")
        lines.append(f"  Tabela: {tabela}")
        lines.append(f"  Chave: {chave}")
        lines.append(f"  SELECT: {sql_select[:200]}...")
        lines.append(f"  UPDATE: {chr(10).join(update_cols[:10])}")
        lines.append(f"  GRADE: {';'.join(c[0] for c in cols[:6] if c[1] != 'image')}")
        lines.append(f"  PESQUISA: {';'.join(c[0] for c in cols[:4] if c[1] != 'image')}")

        return "\n".join(lines)

    except Exception as e:
        return f"ERRO ao conectar: {e}"


def _expand_single_pattern(step: dict) -> list[dict]:
    """Expande um unico padrao em passos concretos (retorna lista de dicts)."""
    padrao = step.get("padrao", "")
    if not padrao:
        return [step]

    if padrao == "sql_select":
        r = pattern_sql_select(
            step["sql"], step["campos"],
            binds=step.get("binds"), var_prefix=step.get("var_prefix", "v"),
        )
        return r["passos"]

    if padrao == "sql_execute":
        r = pattern_sql_execute(step["sql"], binds=step.get("binds"))
        return r["passos"]

    if padrao == "sql_loop":
        body_expanded = _expand_pattern_list(step.get("body", []))
        r = pattern_sql_loop(
            step["sql"], step["campos"],
            body_steps=body_expanded,
            binds=step.get("binds"), var_prefix=step.get("var_prefix", "v"),
        )
        return r["passos"]

    if padrao == "null_guard":
        r = pattern_null_guard(
            step["variavel"], step["label"],
            error_message=step.get("mensagem", ""),
            on_null=_expand_pattern_list(step.get("on_null")) if step.get("on_null") else None,
            on_valid=_expand_pattern_list(step.get("on_valid")) if step.get("on_valid") else None,
        )
        return [r]

    if padrao == "equality_check":
        r = pattern_equality_check(
            step["variavel"], step["valor"], step["label"],
            on_true=_expand_pattern_list(step.get("on_true")) if step.get("on_true") else None,
            on_false=_expand_pattern_list(step.get("on_false")) if step.get("on_false") else None,
        )
        return [r]

    if padrao == "duplicity_check":
        r = pattern_duplicity_check(
            step["tabela"], step["campo"], step["var_valor"],
            var_id=step.get("var_id", ""),
        )
        return r["passos"]

    if padrao == "change_component":
        return [pattern_change_component(
            step["componente"], step["valor"], form_guid=step.get("form_guid", ""),
        )]

    if padrao == "set_visibility":
        return [pattern_set_visibility(step["componente"], step["visivel"])]

    if padrao == "set_enabled":
        return [pattern_set_enabled(step["componente"], step["habilitado"])]

    if padrao == "callrule":
        return [pattern_callrule(
            step["rule_name"], step["rule_id"],
            step.get("params", []), step.get("return_var", ""),
        )]

    if padrao == "json_build":
        r = pattern_json_build(step["campos"], step.get("var_json", "vJson"))
        return r["passos"]

    if padrao == "success_message":
        return [pattern_success_message(step["mensagem"])]

    if padrao == "confirmation":
        r = pattern_confirmation(
            step["mensagem"],
            _expand_pattern_list(step.get("on_confirm", [])),
            on_cancel=_expand_pattern_list(step.get("on_cancel")) if step.get("on_cancel") else None,
        )
        return [r]

    if padrao == "browser_mode_guard":
        return [pattern_browser_mode_guard()]

    return [step]


def _expand_pattern_list(steps: list[dict] | None) -> list[dict]:
    """Expande uma lista de passos, resolvendo padroes recursivamente."""
    if not steps:
        return []
    result: list[dict] = []
    for s in steps:
        result.extend(_expand_single_pattern(s))
    return result


def _expand_patterns_into(rule: RuleBlueprint, steps: list[dict]) -> None:
    """Expande padroes e adiciona ao RuleBlueprint, coletando variaveis."""
    for step in steps:
        padrao = step.get("padrao", "")

        if padrao in ("sql_select", "sql_execute", "sql_loop", "duplicity_check", "json_build"):
            expanded = _expand_single_pattern(step)
            full_pattern = _get_full_pattern_result(step)
            for v in full_pattern.get("variaveis", []):
                rule.add_var(v["nome"], v.get("tipo", "Variante"), v.get("tamanho", ""))
            for e in expanded:
                rule.add_step(e)
        elif padrao:
            expanded = _expand_single_pattern(step)
            for e in expanded:
                rule.add_step(e)
        else:
            rule.add_step(step)


def _get_full_pattern_result(step: dict) -> dict:
    """Obtem o resultado completo de um padrao (com variaveis)."""
    padrao = step.get("padrao", "")
    if padrao == "sql_select":
        return pattern_sql_select(
            step["sql"], step["campos"],
            binds=step.get("binds"), var_prefix=step.get("var_prefix", "v"),
        )
    if padrao == "sql_execute":
        return pattern_sql_execute(step["sql"], binds=step.get("binds"))
    if padrao == "sql_loop":
        body_expanded = _expand_pattern_list(step.get("body", []))
        return pattern_sql_loop(
            step["sql"], step["campos"],
            body_steps=body_expanded,
            binds=step.get("binds"), var_prefix=step.get("var_prefix", "v"),
        )
    if padrao == "duplicity_check":
        return pattern_duplicity_check(
            step["tabela"], step["campo"], step["var_valor"],
            var_id=step.get("var_id", ""),
        )
    if padrao == "json_build":
        return pattern_json_build(step["campos"], step.get("var_json", "vJson"))
    return {}


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 20: PROJETAR REGRA (Logic Engine)
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def projetar_regra(spec_json: str) -> str:
    """Projeta regras de negocio a partir de requisitos, determinando automaticamente
    a camada de execucao (Cliente JS / Servidor Java) e gerando a estrutura logica
    completa do fluxograma.

    Suporta composicao modular com padroes reutilizaveis.
    A camada e determinada automaticamente pelas funcoes utilizadas.

    Args:
        spec_json: JSON com a especificacao da regra. Estrutura:
            {
              "nome": "Nome da Regra",
              "codigo": 9001,
              "descricao": "Descricao do requisito de negocio",
              "destino": 0 (0=auto, 1=cliente, 2=servidor),
              "parametros": [{"nome": "pCampo", "tipo": "Letras"}],
              "variaveis": [{"nome": "vDado", "tipo": "Variante"}],
              "retorno_tipo": "" (opcional),
              "passos": [
                -- Padrao SQL Select:
                {"padrao": "sql_select", "sql": "SELECT ...", "campos": ["CAMPO1"],
                 "binds": [{"nome": "pId", "variavel": "pId"}]},

                -- Padrao SQL Execute (INSERT/UPDATE/DELETE):
                {"padrao": "sql_execute", "sql": "INSERT INTO ..."},

                -- Padrao SQL Loop (WHILE + EOF):
                {"padrao": "sql_loop", "sql": "SELECT ...", "campos": ["CAMPO"],
                 "body": [... passos internos ...]},

                -- Padrao Null Guard (validacao):
                {"padrao": "null_guard", "variavel": "pCampo", "label": "Campo",
                 "mensagem": "Campo obrigatorio" (opcional)},

                -- Padrao Comparacao:
                {"padrao": "equality_check", "variavel": "pTipo", "valor": "A",
                 "label": "Tipo", "on_true": [...], "on_false": [...]},

                -- Padrao Duplicidade:
                {"padrao": "duplicity_check", "tabela": "TABELA",
                 "campo": "CAMPO", "var_valor": "pValor"},

                -- Padrao Alterar Componente (cliente):
                {"padrao": "change_component", "componente": "edtNome", "valor": "@vNome"},

                -- Padrao Visibilidade (cliente):
                {"padrao": "set_visibility", "componente": "pnlExtra", "visivel": true},

                -- Padrao Habilitacao (cliente):
                {"padrao": "set_enabled", "componente": "edtCampo", "habilitado": false},

                -- Padrao Sub-rotina:
                {"padrao": "callrule", "rule_name": "Outra Regra", "rule_id": 100,
                 "params": [{"target": "pNome", "value": {"tipo": "variavel", "nome": "vNome"}}],
                 "return_var": "vRetorno"},

                -- Padrao JSON Build:
                {"padrao": "json_build", "campos": {"chave": "vValor"}},

                -- Padrao Mensagem Sucesso:
                {"padrao": "success_message", "mensagem": "Operacao realizada"},

                -- Padrao Confirmacao:
                {"padrao": "confirmation", "mensagem": "Deseja continuar?",
                 "on_confirm": [... passos ...]},

                -- Padrao Browser Mode Guard:
                {"padrao": "browser_mode_guard"},

                -- Passo direto (sem padrao):
                {"tipo": "expressao", "funcao": "ebfConcat", ...}
              ]
            }

    Retorna: JSON com a spec completa da regra pronta para gerar_fluxo,
    incluindo a camada de execucao determinada automaticamente.
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    rule = RuleBlueprint(
        nome=spec.get("nome", "Regra sem nome"),
        destino=spec.get("destino", 0),
        codigo=spec.get("codigo", 9001),
        descricao=spec.get("descricao", ""),
        categoria=spec.get("categoria", r"\Uso Geral"),
        retorno_tipo=spec.get("retorno_tipo", ""),
    )

    for p in spec.get("parametros", []):
        rule.add_param(p["nome"], p.get("tipo", "Letras"), p.get("tamanho", ""))
    for v in spec.get("variaveis", []):
        rule.add_var(v["nome"], v.get("tipo", "Variante"), v.get("tamanho", ""))

    _expand_patterns_into(rule, spec.get("passos", []))

    rule_spec = rule.to_spec()

    idx = _funcoes()
    errors: list[str] = []
    _validate_functions(rule_spec.get("passos", []), idx, errors, rule_spec["destino"])

    dest_label = "Servidor (Java)" if rule_spec["destino"] == 2 else "Cliente (JavaScript)"
    lines = [
        f"=== Regra projetada: {rule_spec['nome']} ===",
        f"Camada: {dest_label} (destino={rule_spec['destino']})",
        f"Codigo: {rule_spec['codigo']}",
        f"Parametros: {len(rule_spec['parametros'])}",
        f"Variaveis: {len(rule_spec['variaveis'])}",
        f"Passos: {len(rule_spec['passos'])}",
    ]

    if errors:
        lines.append(f"\nAVISOS DE VALIDACAO:")
        for e in errors:
            lines.append(f"  - {e}")
    else:
        lines.append(f"\nValidacao: OK (todas as funcoes existem no catalogo)")

    lines.append(f"\n--- Spec JSON pronta para gerar_fluxo ---")
    lines.append(json.dumps(rule_spec, indent=2, ensure_ascii=False))

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 21: EVENTOS DISPONIVEIS
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def eventos_disponiveis(evento: str = "") -> str:
    """Retorna a matriz de eventos do ciclo de vida dos componentes Maker.
    Cada evento indica: fase do ciclo, camada preferida, descricao e uso ideal.
    Baseado na analise de 1878 vinculacoes reais de producao.

    Args:
        evento: Filtro opcional (ex: 'Gravar', 'Clicar', 'Entrar'). Vazio para listar todos.
    """
    events = EVENT_LIFECYCLE
    if evento:
        evento_lower = evento.lower()
        events = {k: v for k, v in events.items() if evento_lower in k.lower()}

    if not events:
        return f"Nenhum evento encontrado para '{evento}'."

    lines = [f"=== Matriz de Eventos ({len(events)}) ===\n"]

    freq_map = {
        "Ao Clicar": 871, "Ao Modificar": 371, "Ao Entrar": 156,
        "Ao Navegar": 89, "Antes de Inserir": 87, "Antes de Alterar": 80,
        "Depois de Inserir": 74, "Depois de Alterar": 57, "Ao Duplo Clicar": 29,
        "Ao Sair": 26, "Ao Pressionar Tecla": 15,
        "Depois de Deletar": 12, "Antes de Deletar": 8,
    }

    # Incluir componentes aplicaveis de COMPONENT_EVENTS
    from .logic_engine import COMPONENT_EVENTS

    for nome, ev in events.items():
        freq = freq_map.get(nome, 0)
        camada = "Cliente (JS)" if ev.camada_preferida == 1 else "Servidor (Java)"
        # Componentes que suportam este evento
        tipos = [t for t, evts in COMPONENT_EVENTS.items() if nome in evts]
        tipos_str = ", ".join(tipos) if tipos else "-"
        lines.append(f"### {nome} ({freq}x no sistema real)")
        lines.append(f"  Fase: {ev.fase}")
        lines.append(f"  Camada preferida: {camada}")
        lines.append(f"  Componentes: {tipos_str}")
        lines.append(f"  {ev.descricao}")
        lines.append("")

    lines.append("---")
    lines.append("### Matriz Componente x Evento\n")
    for tipo, evts in sorted(COMPONENT_EVENTS.items()):
        if evts:
            lines.append(f"  {tipo}: {', '.join(evts)}")
        else:
            lines.append(f"  {tipo}: (sem eventos)")

    lines.append("\n---")
    lines.append("Uso: vincule regras a eventos via gerar_tela_completa ou projetar_regra.")
    lines.append("Padrao de entrada: 'pParam=NomeComponente;pParam2=OutroComponente'")

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 22: PADROES DE LOGICA
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def padroes_logica(padrao: str = "") -> str:
    """Retorna os padroes de composicao logica disponiveis para projetar_regra.
    Cada padrao e um bloco reutilizavel que gera a estrutura exata do fluxograma.
    Baseado na analise de 2445 regras reais de producao.

    Args:
        padrao: Filtro opcional (ex: 'sql', 'validacao', 'json', 'componente').
                Vazio para listar todos.
    """
    patterns = {
        "sql_select": {
            "descricao": "SQL Select: query → extrai campos → fecha (712 usos reais)",
            "camada": "Servidor",
            "exemplo": '{"padrao": "sql_select", "sql": "SELECT NOME, EMAIL FROM PESSOA WHERE ID = :pId", "campos": ["NOME", "EMAIL"], "binds": [{"nome": "pId", "variavel": "pId"}]}',
        },
        "sql_execute": {
            "descricao": "SQL Execute: INSERT/UPDATE/DELETE sem retorno (493 usos reais)",
            "camada": "Servidor",
            "exemplo": '{"padrao": "sql_execute", "sql": "UPDATE PESSOA SET ATIVO = 0 WHERE PES_COD = :pId", "binds": [{"nome": "pId", "variavel": "pId"}]}',
        },
        "sql_loop": {
            "descricao": "SQL Loop: itera registros com WHILE + EOF (473 usos reais)",
            "camada": "Servidor",
            "exemplo": '{"padrao": "sql_loop", "sql": "SELECT NOME, VALOR FROM ITENS WHERE PED_COD = :pPedido", "campos": ["NOME", "VALOR"], "body": [...], "binds": [{"nome": "pPedido", "variavel": "pPedido"}]}',
        },
        "null_guard": {
            "descricao": "Validacao de nulidade com mensagem de erro (1461 usos de isNullOrEmpty)",
            "camada": "Ambas",
            "exemplo": '{"padrao": "null_guard", "variavel": "pNome", "label": "Nome", "mensagem": "O campo Nome e obrigatorio."}',
        },
        "equality_check": {
            "descricao": "Comparacao com desvio logico (879 usos de isEqual)",
            "camada": "Ambas",
            "exemplo": '{"padrao": "equality_check", "variavel": "pTipo", "valor": "PF", "label": "Tipo Pessoa", "on_true": [...], "on_false": [...]}',
        },
        "duplicity_check": {
            "descricao": "Verificacao de duplicidade no banco antes de gravar",
            "camada": "Servidor",
            "exemplo": '{"padrao": "duplicity_check", "tabela": "GER_PESSOA", "campo": "PES_CPF", "var_valor": "pCpf"}',
        },
        "change_component": {
            "descricao": "Alterar valor de componente na tela (800 usos reais)",
            "camada": "Cliente",
            "exemplo": '{"padrao": "change_component", "componente": "edtNome", "valor": "@vNome"}',
        },
        "set_visibility": {
            "descricao": "Mostrar/ocultar componente (319 usos reais)",
            "camada": "Cliente",
            "exemplo": '{"padrao": "set_visibility", "componente": "pnlDetalhes", "visivel": true}',
        },
        "set_enabled": {
            "descricao": "Habilitar/desabilitar componente (225 usos reais)",
            "camada": "Cliente",
            "exemplo": '{"padrao": "set_enabled", "componente": "edtCampo", "habilitado": false}',
        },
        "callrule": {
            "descricao": "Chamar sub-rotina (1996 componentes TFlowSubRoutine no sistema)",
            "camada": "Ambas",
            "exemplo": '{"padrao": "callrule", "rule_name": "Buscar CEP", "rule_id": 100, "params": [{"target": "pCep", "value": {"tipo": "variavel", "nome": "vCep"}}], "return_var": "vEndereco"}',
        },
        "json_build": {
            "descricao": "Construir objeto JSON (1532 usos de JSON no sistema)",
            "camada": "Ambas",
            "exemplo": '{"padrao": "json_build", "campos": {"nome": "vNome", "email": "vEmail"}}',
        },
        "success_message": {
            "descricao": "Exibir mensagem de sucesso",
            "camada": "Ambas",
            "exemplo": '{"padrao": "success_message", "mensagem": "Registro salvo com sucesso."}',
        },
        "confirmation": {
            "descricao": "Confirmacao interativa com desvio (Sim/Nao)",
            "camada": "Ambas",
            "exemplo": '{"padrao": "confirmation", "mensagem": "Deseja excluir este registro?", "on_confirm": [...]}',
        },
        "browser_mode_guard": {
            "descricao": "Guarda de modo navegacao: retorna se em browse mode (156 regras Ao Entrar)",
            "camada": "Cliente",
            "exemplo": '{"padrao": "browser_mode_guard"}',
        },
    }

    if padrao:
        padrao_lower = padrao.lower()
        patterns = {k: v for k, v in patterns.items() if padrao_lower in k or padrao_lower in v["descricao"].lower()}

    if not patterns:
        return f"Nenhum padrao encontrado para '{padrao}'."

    lines = [f"=== Padroes de Logica ({len(patterns)}) ===\n"]
    for nome, info in patterns.items():
        lines.append(f"### {nome}")
        lines.append(f"  {info['descricao']}")
        lines.append(f"  Camada: {info['camada']}")
        lines.append(f"  Exemplo: {info['exemplo']}")
        lines.append("")

    lines.append("---")
    lines.append("Use projetar_regra com estes padroes no campo 'passos'.")
    lines.append("O motor determina a camada automaticamente pelas funcoes usadas.")

    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 23: MATERIALIZAR SISTEMA (Direct Access)
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def materializar_sistema(
    spec_json: str,
    host: str = _DB_HOST,
    porta: int = _DB_PORT,
    usuario: str = _DB_USER,
    senha: str = _DB_PASSWORD,
    banco: str = _DB_NAME,
    modo: str = "direct",
    output_path: str = "",
    driver: str = _DB_DRIVER,
    seed_data: bool = False,
) -> str:
    """Materializa um sistema completo no banco de dados de desenvolvimento.
    Cria formularios com UI premium, componentes posicionados, regras complexas
    (duplicidade, dependencia, condicionais, mascaras), vinculos de eventos e menu.

    Suporta dois modos:
    - "direct": escreve diretamente no banco (requer senha)
    - "frz": gera arquivo FRZ para importacao (usa gerar_tela_completa)

    Drivers suportados: mysql (MariaDB/MySQL), mssql (SQL Server), postgresql, oracle.

    Args:
        spec_json: JSON com a especificacao. Estrutura:
            {
              "nome": "Nome do Sistema",
              "sistema": "SIG" (codigo do sistema no FR_SISTEMA),
              "css": ".classe-custom { ... }" (CSS MasterSkin global),

              "modulos": [
                {
                  "tipo": "crud",
                  "tabela": "NOME_TABELA",
                  "descricao": "Titulo da Tela",
                  "criar_tabela": false (true para DDL automatico),
                  "colunas_ddl": [...],
                  "campos": [
                    {
                      "nome": "edtNome",
                      "tipo": "E",
                      "campo": "COL_NOME",
                      "descricao": "Nome",
                      "obrigatorio": true,
                      "unico": true,
                      "mascara": "CPF",
                      "placeholder": "Digite...",
                      "colunas": 6,
                      "aba": "01-Cadastro",
                      "controla_visibilidade": ["edtOutroCampo"],
                      "valor_ativo": "S"
                    }
                  ],
                  "campos_unicos": ["COL_NOME", "COL_CODIGO"],
                  "dep_tabela_filha": "OUTRA_TABELA",
                  "dep_campo_fk": "FK_CAMPO",
                  "seed_data": true,
                  "regras": [...]
                }
              ]
            }
        host: Host do banco
        porta: Porta (3306 para MySQL, 1433 para MSSQL, 5432 para PostgreSQL)
        usuario: Usuario
        senha: Senha (obrigatoria para modo direct)
        banco: Nome do banco
        modo: "direct" ou "frz"
        output_path: Caminho para FRZ (modo frz)
        driver: Driver de banco (mysql, mssql, postgresql, oracle)
        seed_data: Gerar dados de exemplo nas tabelas
    """
    try:
        spec = json.loads(spec_json)
    except json.JSONDecodeError as e:
        return f"ERRO: JSON invalido: {e}"

    if modo == "frz":
        if not output_path:
            return "ERRO: output_path obrigatorio para modo FRZ"
        return _materializar_via_frz(spec, output_path)

    if not senha:
        return "ERRO: senha obrigatoria para modo direct"

    try:
        engine = DirectAccessEngine(host, porta, usuario, senha, banco, driver=driver)
    except Exception as e:
        return f"ERRO ao conectar: {e}"

    try:
        result = engine.materialize_system(
            nome_sistema=spec.get("nome", "Sistema"),
            modulos=spec.get("modulos", []),
            sistema=spec.get("sistema", "SIG"),
            css=spec.get("css", ""),
            seed_data=seed_data,
            enterprise=True,
        )

        engine.commit()
        log = engine.get_log()
        engine.close()

        lines = [f"=== Sistema materializado: {result['sistema']} ===\n"]
        lines.append(f"Modulos: {len(result['modulos'])}")

        for i, mod in enumerate(result["modulos"]):
            lines.append(f"\n--- Modulo {i+1}: {mod.get('tabela', 'N/A')} ---")
            lines.append(f"  FRM_CODIGO: {mod.get('frm_codigo', 'N/A')}")
            lines.append(f"  Componentes: {len(mod.get('componentes', {}))}")
            if mod.get("fnt_codigo"):
                lines.append(f"  FNT_CODIGO: {mod['fnt_codigo']}")
            if mod.get("regras"):
                lines.append(f"  Regras: {len(mod['regras'])} (IDs: {mod['regras']})")
            if mod.get("menu"):
                lines.append(f"  Menu: MNU_CODIGO={mod['menu']}")
            if mod.get("tabela_criada"):
                lines.append(f"  Tabela de negocio criada: SIM")

        lines.append(f"\n--- Log de operacoes ({len(log)} ops) ---")
        for entry in log:
            lines.append(f"  {entry}")

        return "\n".join(lines)

    except Exception as e:
        engine.rollback()
        log = engine.get_log()
        engine.close()
        error_lines = [f"ERRO: {e}", "", "Log parcial:"]
        for entry in log:
            error_lines.append(f"  {entry}")
        return "\n".join(error_lines)


def _materializar_via_frz(spec: dict, output_path: str) -> str:
    """Fallback: gera FRZ quando nao ha acesso direto ao banco."""
    from .enterprise import enrich_crud_spec, _CSS_MASTERSKIN

    all_forms = []
    all_rules = []

    for mod in spec.get("modulos", []):
        if mod.get("tipo") == "crud":
            crud_spec = {
                "tabela": mod["tabela"],
                "titulo": mod.get("descricao", mod["tabela"]),
                "campos": mod.get("campos", []),
            }
            enriched = enrich_crud_spec(crud_spec)

            form_data = {
                "descricao": enriched.get("titulo_html", mod.get("descricao", mod["tabela"])),
                "tabela": mod["tabela"],
                "campos": enriched.get("campos", []),
                "css": spec.get("css", "") or _CSS_MASTERSKIN,
            }
            all_forms.append(form_data)

            if mod.get("regras"):
                all_rules.extend(mod["regras"])

    combined = {
        "formularios" if len(all_forms) > 1 else "formulario": all_forms if len(all_forms) > 1 else (all_forms[0] if all_forms else {}),
        "regras": all_rules,
    }

    return gerar_tela_completa(json.dumps(combined, ensure_ascii=False), output_path)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 24: INSPECIONAR METADADOS
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def inspecionar_metadados(
    frm_codigo: int = 0,
    regra_nome: str = "",
    tabela: str = "",
    host: str = _DB_HOST,
    porta: int = _DB_PORT,
    usuario: str = _DB_USER,
    senha: str = _DB_PASSWORD,
    banco: str = _DB_NAME,
    driver: str = _DB_DRIVER,
) -> str:
    """Inspeciona metadados de formularios, regras ou tabelas no banco.
    Util para debug e verificacao de integridade.

    Args:
        frm_codigo: Codigo do formulario para inspecionar (0 para listar)
        regra_nome: Nome da regra para buscar (parcial)
        tabela: Nome da tabela para inspecionar
        host/porta/usuario/senha/banco: conexao ao banco
        driver: Driver de banco (mysql, mssql)
    """
    if not senha:
        return "ERRO: senha obrigatoria"

    is_mysql = driver == "mysql"

    try:
        conn = _get_connection(host, porta, usuario, senha, banco, driver)
        cur = conn.cursor()
    except Exception as e:
        return f"ERRO ao conectar: {e}"

    lines: list[str] = []

    if frm_codigo > 0:
        cur.execute("SELECT FRM_DESCRICAO, FRM_GUID, FRM_TAMANHO, FRM_ALTURA FROM FR_FORMULARIO WHERE FRM_CODIGO = %s", (frm_codigo,))
        row = cur.fetchone()
        if not row:
            conn.close()
            return f"Formulario {frm_codigo} nao encontrado"

        lines.append(f"=== Formulario {frm_codigo}: {row[0]} ===")
        lines.append(f"  GUID: {row[1]}")
        lines.append(f"  Dimensoes: {row[2]}x{row[3]}")

        cur.execute("SELECT COM_CODIGO, COM_TIPO FROM FR_COMPONENTE WHERE FRM_CODIGO = %s ORDER BY COM_CODIGO", (frm_codigo,))
        comps = cur.fetchall()
        lines.append(f"\n  Componentes: {len(comps)}")
        for c in comps:
            cur.execute("SELECT PRO_NOME, SUBSTRING(CAST(PRO_VALOR AS CHAR(200)), 1, 60) FROM FR_PROPRIEDADE WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND PRO_NOME IN ('Nome', 'Descricao', 'Campo', 'NomeClasseCss')", (frm_codigo, c[0]))
            props = {r[0]: r[1] for r in cur.fetchall()}
            nome = props.get('Nome', '')
            desc = props.get('Descricao', '')
            lines.append(f"    COM={c[0]} TIPO={c[1]} NOME={nome} DESC={desc}")

        cur.execute("SELECT ac.ACC_MOMENTO, ac.COM_CODIGO FROM FR_ACAOCOMPONENTE ac WHERE ac.FRM_CODIGO = %s", (frm_codigo,))
        bindings = cur.fetchall()
        if bindings:
            lines.append(f"\n  Eventos vinculados: {len(bindings)}")
            for b in bindings:
                cur.execute("SELECT PAR_NOME, SUBSTRING(PAR_VALOR, 1, 60) FROM FR_PARAMETRO WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND ACC_MOMENTO = %s", (frm_codigo, b[1], b[0]))
                params = {r[0]: r[1] for r in cur.fetchall()}
                lines.append(f"    {b[0]:20s} COM={b[1]} REGRA={params.get('Nome', '?')}")

        cur.execute("SELECT FNT_CODIGO, FNT_TABELA, FNT_CAMPOCHAVE FROM FR_FONTEDADOS WHERE FRM_CODIGO = %s", (frm_codigo,))
        fnts = cur.fetchall()
        if fnts:
            lines.append(f"\n  Fontes de dados: {len(fnts)}")
            for f in fnts:
                lines.append(f"    FNT={f[0]} TAB={f[1]} CHAVE={f[2]}")

    elif regra_nome:
        cur.execute("SELECT REG_COD, REG_NOME, REG_DESTINO, LENGTH(CAST(REG_SCRIPT AS CHAR(10000))) FROM FR_REGRAS WHERE REG_NOME LIKE %s", (f'%{regra_nome}%',))
        regras = cur.fetchall()
        lines.append(f"=== Regras contendo '{regra_nome}' ({len(regras)}) ===")
        for r in regras:
            dest = "Servidor" if r[2] == 2 else "Cliente"
            lines.append(f"  COD={r[0]} [{dest}] {r[1]} (script={r[3]} chars)")

    elif tabela:
        cur.execute("""SELECT c.COLUMN_NAME, c.DATA_TYPE, c.CHARACTER_MAXIMUM_LENGTH, c.IS_NULLABLE
        FROM INFORMATION_SCHEMA.COLUMNS c WHERE c.TABLE_NAME = %s ORDER BY c.ORDINAL_POSITION""", (tabela,))
        cols = cur.fetchall()
        if cols:
            lines.append(f"=== Tabela {tabela} ({len(cols)} colunas) ===")
            for c in cols:
                lines.append(f"  {c[0]:30s} {c[1]}({c[2] or ''}) {c[3]}")
        else:
            lines.append(f"Tabela {tabela} nao encontrada")

    else:
        cur.execute("SELECT FRM_CODIGO, FRM_DESCRICAO, FRM_GUID FROM FR_FORMULARIO ORDER BY FRM_CODIGO DESC LIMIT 20")
        forms = cur.fetchall()
        lines.append(f"=== Ultimos 20 formularios ===")
        for f_row in forms:
            lines.append(f"  COD={f_row[0]} {str(f_row[1])[:50]} GUID={str(f_row[2])[:20]}...")

    conn.close()
    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 25: EXECUTAR SQL NO BANCO
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def executar_sql(
    sql: str,
    host: str = _DB_HOST,
    porta: int = _DB_PORT,
    usuario: str = _DB_USER,
    senha: str = _DB_PASSWORD,
    banco: str = _DB_NAME,
    auto_commit: bool = False,
    driver: str = _DB_DRIVER,
) -> str:
    """Executa SQL arbitrario no banco de metadados.
    Suporta SELECT (retorna dados), INSERT/UPDATE/DELETE (retorna rows affected),
    e DDL (CREATE TABLE, ALTER TABLE).

    CUIDADO: operacoes destrutivas requerem auto_commit=true.

    Args:
        sql: Comando SQL a executar
        host/porta/usuario/senha/banco: conexao ao banco
        auto_commit: Se true, faz commit automatico (obrigatorio para DML/DDL)
        driver: Driver de banco (mysql, mssql)
    """
    if not senha:
        return "ERRO: senha obrigatoria"

    try:
        conn = _get_connection(host, porta, usuario, senha, banco, driver)
        cur = conn.cursor()
    except Exception as e:
        return f"ERRO ao conectar: {e}"

    try:
        cur.execute(sql)
        is_select = sql.strip().upper().startswith("SELECT")

        if is_select:
            cols = [d[0] for d in cur.description] if cur.description else []
            rows = cur.fetchall()
            lines = [f"=== Resultado ({len(rows)} linhas) ==="]
            if cols:
                lines.append(" | ".join(cols))
                lines.append("-" * (len(" | ".join(cols))))
            for row in rows[:100]:
                lines.append(" | ".join(str(v)[:50] if v is not None else "NULL" for v in row))
            if len(rows) > 100:
                lines.append(f"... e mais {len(rows) - 100} linhas")
            conn.close()
            return "\n".join(lines)
        else:
            affected = cur.rowcount
            if auto_commit:
                conn.commit()
                conn.close()
                return f"SQL executado com sucesso. Linhas afetadas: {affected}. COMMIT realizado."
            else:
                conn.rollback()
                conn.close()
                return f"SQL executado (dry-run). Linhas afetadas: {affected}. ROLLBACK (auto_commit=false)."

    except Exception as e:
        conn.rollback()
        conn.close()
        return f"ERRO SQL: {e}"


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 26: GSD CRIAR SISTEMA (ONE-SHOT)
# ═══════════════════════════════════════════════════════════════════════════

def _infer_sql_type(campo: str, tipo_componente: str = "E") -> str:
    """Infere tipo SQL Server a partir do nome do campo."""
    campo_upper = campo.upper()
    if campo_upper.endswith("_COD") or campo_upper.endswith("_CODIGO") or campo_upper.endswith("_ID"):
        return "int"
    if any(k in campo_upper for k in ("_VALOR", "_PRECO", "_CUSTO", "_TOTAL", "_SALDO", "_DESCONTO", "_MULTA", "_JUROS")):
        return "decimal(18,2)"
    if any(k in campo_upper for k in ("_DATA", "_DT", "_NASCIMENTO", "_ADMISSAO", "_VENCIMENTO", "_CRIACAO")):
        return "datetime"
    if any(k in campo_upper for k in ("_HORA", "_HR")):
        return "varchar(8)"
    if any(k in campo_upper for k in ("_ATIVO", "_FLAG")):
        return "bit"
    if any(k in campo_upper for k in ("_OBS", "_OBSERVACAO", "_DESCRICAO_LONGA", "_NOTAS", "_COMENTARIO")):
        return "text"
    if any(k in campo_upper for k in ("_QTD", "_QUANTIDADE", "_NUMERO", "_NUM", "_IDADE", "_ORDEM")):
        return "int"
    if any(k in campo_upper for k in ("_UF",)):
        return "varchar(2)"
    if any(k in campo_upper for k in ("_CEP",)):
        return "varchar(10)"
    if any(k in campo_upper for k in ("_CPF",)):
        return "varchar(14)"
    if any(k in campo_upper for k in ("_CNPJ",)):
        return "varchar(18)"
    if any(k in campo_upper for k in ("_EMAIL", "_MAIL")):
        return "varchar(200)"
    if any(k in campo_upper for k in ("_TELEFONE", "_TEL", "_FONE", "_CELULAR", "_CEL")):
        return "varchar(20)"
    if any(k in campo_upper for k in ("_ENDERECO", "_LOGRADOURO", "_RAZAO", "_FANTASIA")):
        return "varchar(200)"
    if any(k in campo_upper for k in ("_NOME",)):
        return "varchar(150)"
    return "varchar(100)"


def _gsd_build_campo_spec(campo: str, descricao: str, obrigatorio: bool = False) -> dict:
    """Constroi spec completa de um campo para o Direct Access."""
    tipo_comp = infer_component_type(campo)
    mascara = infer_mask(campo)
    largura = infer_column_width(campo, mascara, tipo_comp)

    nome = "edt" + campo.replace("_", "").title().replace(" ", "")
    if tipo_comp == "M":
        nome = "mem" + campo.replace("_", "").title().replace(" ", "")
    elif tipo_comp == "H":
        nome = "chk" + campo.replace("_", "").title().replace(" ", "")
    elif tipo_comp == "C":
        nome = "cmb" + campo.replace("_", "").title().replace(" ", "")

    return {
        "nome": nome,
        "tipo": tipo_comp,
        "campo": campo,
        "descricao": descricao or campo.replace("_", " ").title(),
        "obrigatorio": obrigatorio,
        "mascara": mascara if mascara else None,
        "css_class": f"form-group col-md-{largura}",
        "aba": "01-Cadastro",
        "container": "",
    }


@mcp.tool()
def gsd_criar_sistema(
    descricao: str,
    campos: str,
    host: str = _DB_HOST,
    porta: int = _DB_PORT,
    usuario: str = _DB_USER,
    senha: str = _DB_PASSWORD,
    banco: str = _DB_NAME,
    sistema: str = "SIG",
    criar_tabela: bool = True,
    nome_tabela: str = "",
    campo_pk: str = "",
    campos_obrigatorios: str = "",
    driver: str = _DB_DRIVER,
    seed_data: bool = True,
) -> str:
    """GSD ONE-SHOT: Cria sistema completo no banco a partir de descricao minima.

    Decide autonomamente: nome da tabela, tipos SQL, componentes, mascaras,
    regras complexas (duplicidade por evento, dependencia, condicionais, SweetAlert),
    layout premium (cards, headers, posicionamento), vinculos de evento e menu.

    Suporta: MySQL/MariaDB, SQL Server, PostgreSQL, Oracle.

    Args:
        descricao: O que o sistema faz (ex: "Cadastro de Clientes", "Controle de Estoque")
        campos: Campos separados por virgula. Formato simples: "nome,cpf,email,telefone,endereco"
                ou detalhado: "PES_NOME,PES_CPF,PES_EMAIL"
        host/porta/usuario/senha/banco: conexao ao banco
        sistema: Codigo do sistema (ex: "SIG")
        criar_tabela: Se True, cria a tabela de negocio via DDL
        driver: Driver de banco (mysql, mssql, postgresql, oracle)
        seed_data: Gerar dados de exemplo
        nome_tabela: Nome da tabela (auto-inferido se vazio)
        campo_pk: Campo PK (auto-inferido se vazio)
        campos_obrigatorios: Campos obrigatorios separados por virgula (auto-inferido se vazio)
    """
    if not senha:
        return "ERRO: senha obrigatoria para acesso direto"

    if not campos.strip():
        return "ERRO: informe ao menos um campo (ex: 'nome,cpf,email')"

    campo_list_raw = [c.strip() for c in campos.split(",") if c.strip()]

    prefixo = ""
    if nome_tabela:
        tabela = nome_tabela.upper()
    else:
        palavras = descricao.replace("Cadastro de ", "").replace("Controle de ", "").replace("Gestao de ", "").strip().split()
        if palavras:
            tabela_base = palavras[0].upper()[:10]
        else:
            tabela_base = "ENTIDADE"

        prefixo_map = {
            "CLIENTES": "CLI", "CLIENTE": "CLI", "PESSOAS": "PES", "PESSOA": "PES",
            "PRODUTOS": "PRD", "PRODUTO": "PRD", "FORNECEDORES": "FOR", "FORNECEDOR": "FOR",
            "FUNCIONARIOS": "FUN", "FUNCIONARIO": "FUN", "VEICULOS": "VEI", "VEICULO": "VEI",
            "PEDIDOS": "PED", "PEDIDO": "PED", "VENDAS": "VND", "VENDA": "VND",
            "SERVICOS": "SRV", "SERVICO": "SRV", "ATENDIMENTOS": "ATD", "ATENDIMENTO": "ATD",
            "CONTRATOS": "CTR", "CONTRATO": "CTR", "PROJETOS": "PRJ", "PROJETO": "PRJ",
            "EMPRESAS": "EMP", "EMPRESA": "EMP", "NOTAS": "NF", "NOTA": "NF",
            "ESTOQUE": "EST", "ITENS": "ITM", "ITEM": "ITM",
            "CATEGORIAS": "CAT", "CATEGORIA": "CAT", "USUARIOS": "USR", "USUARIO": "USR",
        }
        prefixo = prefixo_map.get(tabela_base, tabela_base[:3])
        tabela = f"GER_{tabela_base}"

    campo_pk_final = campo_pk.upper() if campo_pk else f"{prefixo}_COD"

    campos_normalizados: list[str] = []
    for c in campo_list_raw:
        c_upper = c.upper().replace(" ", "_")
        if "_" not in c_upper and prefixo:
            c_upper = f"{prefixo}_{c_upper}"
        campos_normalizados.append(c_upper)

    if campo_pk_final not in campos_normalizados:
        campos_normalizados.insert(0, campo_pk_final)

    obrig_set: set[str] = set()
    if campos_obrigatorios:
        for co in campos_obrigatorios.split(","):
            co = co.strip().upper().replace(" ", "_")
            if "_" not in co and prefixo:
                co = f"{prefixo}_{co}"
            obrig_set.add(co)
    else:
        for c in campos_normalizados:
            if c == campo_pk_final:
                continue
            if any(k in c for k in ("_NOME", "_RAZAO", "_DESCRICAO", "_TITULO")):
                obrig_set.add(c)
                break
        if not obrig_set and len(campos_normalizados) > 1:
            obrig_set.add(campos_normalizados[1])

    colunas_ddl: list[dict] = []
    campos_spec: list[dict] = []

    for c in campos_normalizados:
        is_pk = (c == campo_pk_final)
        tipo_sql = "int" if is_pk else _infer_sql_type(c)
        colunas_ddl.append({
            "nome": c,
            "tipo": tipo_sql,
            "pk": is_pk,
            "identity": is_pk,
            "nullable": not is_pk and c not in obrig_set,
        })

        if is_pk:
            campo_spec = _gsd_build_campo_spec(c, "Codigo", obrigatorio=False)
            campo_spec["somente_leitura"] = True
            campo_spec["pk"] = True
        else:
            desc = c.split("_", 1)[-1].replace("_", " ").title() if "_" in c else c.title()
            campo_spec = _gsd_build_campo_spec(c, desc, obrigatorio=(c in obrig_set))

        campos_spec.append(campo_spec)

    from .logic_engine import generate_crud_rules
    regras = generate_crud_rules(tabela, campos_spec, codigo_base=9001)
    regras_spec = [r.to_spec() for r in regras]

    css = _CSS_MASTERSKIN

    campos_unicos_auto = [
        c_spec.get("campo", c_spec.get("nome", ""))
        for c_spec in campos_spec
        if c_spec.get("unico") or c_spec.get("unique")
        or any(k in c_spec.get("campo", "").upper() for k in ("NOME", "CODIGO", "SIGLA", "CPF", "CNPJ", "EMAIL"))
    ][:2]

    spec_completa = {
        "nome": descricao,
        "sistema": sistema,
        "css": css,
        "modulos": [{
            "tipo": "crud",
            "tabela": tabela,
            "descricao": descricao,
            "criar_tabela": criar_tabela,
            "colunas_ddl": colunas_ddl,
            "campos": campos_spec,
            "regras": regras_spec,
            "campos_unicos": campos_unicos_auto,
            "seed_data": seed_data,
        }],
    }

    try:
        engine = DirectAccessEngine(host, porta, usuario, senha, banco, driver=driver)
    except Exception as e:
        return f"ERRO ao conectar: {e}"

    try:
        result = engine.materialize_system(
            nome_sistema=descricao,
            modulos=spec_completa["modulos"],
            sistema=sistema,
            css=css,
            seed_data=seed_data,
            enterprise=True,
        )

        engine.commit()
        log = engine.get_log()
        engine.close()

        lines = [
            f"=== GSD: Sistema materializado com sucesso ===",
            f"Descricao: {descricao}",
            f"Tabela: {tabela} ({'CRIADA' if criar_tabela else 'existente'})",
            f"PK: {campo_pk_final}",
            "",
        ]

        for mod in result.get("modulos", []):
            lines.append(f"--- Modulo: {mod.get('tabela', 'N/A')} ---")
            lines.append(f"  FRM_CODIGO: {mod.get('frm_codigo', 'N/A')}")
            lines.append(f"  Componentes: {len(mod.get('componentes', {}))}")
            for nome_comp, comp_id in mod.get("componentes", {}).items():
                lines.append(f"    {nome_comp} = COM_CODIGO {comp_id}")
            if mod.get("fnt_codigo"):
                lines.append(f"  Fonte de dados: FNT_CODIGO {mod['fnt_codigo']}")
            if mod.get("regras"):
                lines.append(f"  Regras: {len(mod['regras'])} IDs = {mod['regras']}")
            if mod.get("menu"):
                lines.append(f"  Menu: MNU_CODIGO {mod['menu']}")
            if mod.get("tabela_criada"):
                lines.append(f"  DDL: tabela de negocio criada")

        lines.append(f"\n--- Campos do CRUD ({len(campos_normalizados)}) ---")
        for c, ddl in zip(campos_normalizados, colunas_ddl):
            pk_flag = " [PK IDENTITY]" if ddl.get("pk") else ""
            obrig_flag = " [OBRIGATORIO]" if c in obrig_set else ""
            lines.append(f"  {c:30s} {ddl['tipo']:20s}{pk_flag}{obrig_flag}")

        lines.append(f"\n--- Regras geradas ({len(regras_spec)}) ---")
        for r in regras_spec:
            dest = "Servidor (Java)" if r["destino"] == 2 else "Cliente (JS)"
            lines.append(f"  [{dest}] {r['nome']} ({len(r.get('passos', []))} passos)")

        lines.append(f"\n--- Log ({len(log)} operacoes) ---")
        for entry in log[-20:]:
            lines.append(f"  {entry}")
        if len(log) > 20:
            lines.append(f"  ... e mais {len(log) - 20} operacoes")

        return "\n".join(lines)

    except Exception as e:
        engine.rollback()
        log = engine.get_log()
        engine.close()
        error_lines = [f"ERRO GSD: {e}", "", "Log parcial:"]
        for entry in log:
            error_lines.append(f"  {entry}")
        return "\n".join(error_lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 27: GSD DIAGNOSTICAR (AUTO-CORRECAO)
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def gsd_diagnosticar(
    frm_codigo: int,
    auto_fix: bool = False,
    host: str = _DB_HOST,
    porta: int = _DB_PORT,
    usuario: str = _DB_USER,
    senha: str = _DB_PASSWORD,
    banco: str = _DB_NAME,
    driver: str = _DB_DRIVER,
) -> str:
    """GSD AUTO-CORRECAO: Diagnostica e corrige metadados de um formulario.

    Analisa FR_FORMULARIO, FR_COMPONENTE, FR_PROPRIEDADE, FR_FONTEDADOS,
    FR_ACAOCOMPONENTE e FR_PARAMETRO. Detecta problemas comuns e, se
    auto_fix=True, aplica correcoes diretamente no banco.

    Problemas detectados e corrigidos:
    - Formulario sem componente tipo F (shell)
    - Componentes sem propriedade 'Nome' ou 'Descricao'
    - Componentes com Campo preenchido mas sem NomeClasseCss (sem Bootstrap)
    - Fonte de dados sem SQL Select
    - Eventos vinculados sem parametro 'Nome' (regra ausente)
    - Componentes de campo sem propriedade 'NomeClasseCss' (injeta Bootstrap 5.3)
    - Form shell sem propriedade 'Abas' ou 'NavBarVisivel'
    - Componentes sem aba definida

    Args:
        frm_codigo: Codigo do formulario a diagnosticar
        auto_fix: Se True, aplica correcoes automaticamente (COMMIT)
        host/porta/usuario/senha/banco: conexao ao banco
        driver: Driver de banco (mysql, mssql)
    """
    if not senha:
        return "ERRO: senha obrigatoria"

    try:
        conn = _get_connection(host, porta, usuario, senha, banco, driver)
        cur = conn.cursor()
    except Exception as e:
        return f"ERRO ao conectar: {e}"

    issues: list[dict] = []
    fixes_applied: list[str] = []

    cur.execute(
        "SELECT FRM_DESCRICAO, FRM_GUID FROM FR_FORMULARIO WHERE FRM_CODIGO = %s",
        (frm_codigo,)
    )
    form_row = cur.fetchone()
    if not form_row:
        conn.close()
        return f"ERRO: Formulario FRM_CODIGO={frm_codigo} nao existe"

    form_desc = form_row[0]
    lines = [f"=== GSD DIAGNOSTICO: {form_desc} (FRM={frm_codigo}) ===\n"]

    cur.execute(
        "SELECT COM_CODIGO, COM_TIPO FROM FR_COMPONENTE WHERE FRM_CODIGO = %s ORDER BY COM_CODIGO",
        (frm_codigo,)
    )
    componentes = cur.fetchall()

    if not componentes:
        issues.append({"tipo": "CRITICO", "msg": "Nenhum componente encontrado", "fix": None})
    else:
        has_shell = any(c[1] == "F" for c in componentes)
        if not has_shell:
            issues.append({
                "tipo": "CRITICO",
                "msg": "Sem componente tipo F (form shell) — formulario nao renderiza",
                "fix": None,
            })

    shell_com = None
    for com_codigo, com_tipo in componentes:
        cur.execute(
            "SELECT PRO_NOME, SUBSTRING(CAST(PRO_VALOR AS CHAR(500)), 1, 200) "
            "FROM FR_PROPRIEDADE WHERE FRM_CODIGO = %s AND COM_CODIGO = %s",
            (frm_codigo, com_codigo)
        )
        props = {r[0]: r[1] for r in cur.fetchall()}

        if com_tipo == "F":
            shell_com = com_codigo

            if "Abas" not in props:
                issues.append({
                    "tipo": "ALTO",
                    "msg": f"COM={com_codigo} (shell F) sem propriedade 'Abas'",
                    "fix": f"INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                           f"VALUES ({frm_codigo}, {com_codigo}, 'Abas', '01-Cadastro')",
                })

            if "NavBarVisivel" not in props:
                issues.append({
                    "tipo": "MEDIO",
                    "msg": f"COM={com_codigo} (shell F) sem 'NavBarVisivel'",
                    "fix": f"INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                           f"VALUES ({frm_codigo}, {com_codigo}, 'NavBarVisivel', 'TRUE')",
                })

            continue

        if "Nome" not in props:
            issues.append({
                "tipo": "CRITICO",
                "msg": f"COM={com_codigo} (tipo={com_tipo}) sem propriedade 'Nome'",
                "fix": f"INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                       f"VALUES ({frm_codigo}, {com_codigo}, 'Nome', 'comp{com_codigo}')",
            })

        if "Descricao" not in props:
            issues.append({
                "tipo": "MEDIO",
                "msg": f"COM={com_codigo} (tipo={com_tipo}) sem 'Descricao'",
                "fix": f"INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                       f"VALUES ({frm_codigo}, {com_codigo}, 'Descricao', '{props.get('Nome', 'Campo')}')",
            })

        has_campo = bool(props.get("Campo"))
        has_css = bool(props.get("NomeClasseCss"))

        if has_campo and not has_css:
            campo = props.get("Campo", "")
            width = infer_column_width(campo, infer_mask(campo), com_tipo)
            css_class = f"form-group col-md-{width}"
            issues.append({
                "tipo": "ALTO",
                "msg": f"COM={com_codigo} campo='{campo}' sem Bootstrap CSS",
                "fix": f"INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                       f"VALUES ({frm_codigo}, {com_codigo}, 'NomeClasseCss', '{css_class}')",
            })

        if has_campo and "Aba" not in props:
            issues.append({
                "tipo": "MEDIO",
                "msg": f"COM={com_codigo} campo='{props.get('Campo', '')}' sem aba definida",
                "fix": f"INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                       f"VALUES ({frm_codigo}, {com_codigo}, 'Aba', '01-Cadastro')",
            })

    cur.execute(
        "SELECT FNT_CODIGO, FNT_TABELA, SUBSTRING(CAST(FNT_SELECT AS CHAR(500)), 1, 100) "
        "FROM FR_FONTEDADOS WHERE FRM_CODIGO = %s",
        (frm_codigo,)
    )
    fontes = cur.fetchall()
    for fnt in fontes:
        if not fnt[2] or len(fnt[2].strip()) < 10:
            issues.append({
                "tipo": "ALTO",
                "msg": f"FNT={fnt[0]} tabela='{fnt[1]}' com SQL Select vazio ou muito curto",
                "fix": None,
            })

    cur.execute(
        "SELECT ac.COM_CODIGO, ac.ACO_CODIGO, ac.ACC_MOMENTO "
        "FROM FR_ACAOCOMPONENTE ac WHERE ac.FRM_CODIGO = %s",
        (frm_codigo,)
    )
    eventos = cur.fetchall()
    for ev in eventos:
        cur.execute(
            "SELECT PAR_NOME, PAR_VALOR FROM FR_PARAMETRO "
            "WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND ACO_CODIGO = %s AND ACC_MOMENTO = %s",
            (frm_codigo, ev[0], ev[1], ev[2])
        )
        params = {r[0]: r[1] for r in cur.fetchall()}

        if ev[1] == 12 and "Nome" not in params:
            issues.append({
                "tipo": "CRITICO",
                "msg": f"Evento '{ev[2]}' COM={ev[0]} ACO=12 sem parametro 'Nome' (regra nao vinculada)",
                "fix": None,
            })

        if ev[1] == 12 and "Nome" in params:
            regra_nome = params["Nome"]
            cur.execute(
                "SELECT COUNT(*) FROM FR_REGRAS WHERE REG_NOME = %s",
                (regra_nome,)
            )
            if cur.fetchone()[0] == 0:
                issues.append({
                    "tipo": "CRITICO",
                    "msg": f"Evento '{ev[2]}' referencia regra '{regra_nome}' que NAO EXISTE em FR_REGRAS",
                    "fix": None,
                })

    if auto_fix and issues:
        fixable = [i for i in issues if i.get("fix")]
        for issue in fixable:
            try:
                cur.execute(issue["fix"])
                fixes_applied.append(f"[FIX] {issue['msg']}")
            except Exception as e:
                fixes_applied.append(f"[ERRO FIX] {issue['msg']}: {e}")

        if fixes_applied:
            conn.commit()
            lines.append(f"--- AUTO-FIX: {len(fixes_applied)} correcoes aplicadas ---")
            for f in fixes_applied:
                lines.append(f"  {f}")
            lines.append("")

    if not issues:
        lines.append("STATUS: OK — Nenhum problema detectado")
        lines.append(f"  Componentes: {len(componentes)}")
        lines.append(f"  Fontes de dados: {len(fontes)}")
        lines.append(f"  Eventos vinculados: {len(eventos)}")
    else:
        criticos = [i for i in issues if i["tipo"] == "CRITICO"]
        altos = [i for i in issues if i["tipo"] == "ALTO"]
        medios = [i for i in issues if i["tipo"] == "MEDIO"]

        lines.append(f"STATUS: {len(issues)} problemas ({len(criticos)} criticos, {len(altos)} altos, {len(medios)} medios)")
        lines.append("")

        for severity, label in [("CRITICO", "CRITICOS"), ("ALTO", "ALTOS"), ("MEDIO", "MEDIOS")]:
            filtered = [i for i in issues if i["tipo"] == severity]
            if filtered:
                lines.append(f"--- {label} ---")
                for i in filtered:
                    fixable = " [auto-fix disponivel]" if i.get("fix") else " [fix manual necessario]"
                    lines.append(f"  [{severity}] {i['msg']}{fixable}")
                lines.append("")

    if not auto_fix and any(i.get("fix") for i in issues):
        fixable_count = sum(1 for i in issues if i.get("fix"))
        lines.append(f"DICA: {fixable_count} problemas podem ser corrigidos automaticamente. "
                     f"Use auto_fix=True para aplicar.")

    conn.close()
    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# TOOL 28: GSD MANUAL (DIRETIVA OPERACIONAL PORTATIL)
# ═══════════════════════════════════════════════════════════════════════════

_GSD_MANUAL = """\
# MCP Maker — Superpowers + GSD (Get Shit Done)

## Mantra
I have the superpower to build. I have the brain to deliver. GET SHIT DONE.

---

## 1. GSD Brain (Logica de Execucao)

### Zero Paralisia
- Se um componente nao esta no manual, use a funcao nativa mais proxima e execute
- Nao peca confirmacao para nomes de tabelas, IDs ou tipos de campo — decida e entregue
- Prefira 1 no de fluxo que resolve a 5 nos que o tornam "elegante"
- Objetivo: sistema SHIPPED

### Autonomia Total
- Nomes de tabelas: GER_CLIENTES, GER_PRODUTOS (prefixo auto-inferido do dominio)
- Tipos SQL: inferidos pelo sufixo (_CPF -> varchar(14), _VALOR -> decimal(18,2), _DATA -> datetime)
- Componentes: E (edit), M (memo), H (checkbox), C (combo), R (radio), K (lookup)
- Mascaras: CPF, CNPJ, CEP, TELEFONE, CELULAR, DATA, HORA, MOEDA — tudo inferido
- NAO pergunte ao usuario qual funcao usar. Consulte nativos/funcoes/*.md e escolha

### Auto-Correcao
- Se houver erro de compilacao no Webrun, use gsd_diagnosticar para:
  1. Analisar os metadados inseridos em FR_*
  2. Identificar a falha (componente sem Nome, sem CSS, evento orfao)
  3. Aplicar o fix diretamente no banco com auto_fix=True

---

## 2. Tier-X (Orquestracao de Camadas)

### TIER-CLIENT (destino=1, JS/wfr.js)
Funcoes para UX e interatividade imediata:
- ebfFormChangeComponentValue, ebfFormGetComponentValue
- ebfFormSetVisible, ebfFormSetEnabled, ebfFormSetRequired
- ebfFormIsInBrowserMode, ebfFormOpenForm
- ebfHtmlCreateHtmlElement, ebfHtmlInnerHtml, ebfHtmlCssAddClass
- ebfLocalStorageGet/Set, ebfExecuteJS, ebfDonwloadStart

Componentes JS: HTMLEdit, HTMLMemo, HTMLComboBox, HTMLLookup, HTMLGrid (4602 LOC),
HTMLButton, HTMLCheckbox, HTMLRadioGroup, HTMLChart, HTMLCalendar, HTMLChat (7956 LOC)

### TIER-SERVER (destino=2, Java/Tomcat)
Funcoes para seguranca, persistencia e processamento pesado:
- ebfSQLExecuteQuery, ebfSQLExecuteUpdate, ebfSQLField, ebfSQLClose, ebfSQLNext, ebfSQLEOF
- ebfAuthUser, ebfGetUserCode, ebfGetUserName
- ebfSendMail, ebfSendMailHtml
- ebfFileOpenToWrite/Read, ebfFileAppend, ebfFileReadAll
- ebfCreateObjectJSON, ebfResultSetToJSON

Classes Java: WFRSystem, WFRForm, WFRComponent, DBConnection, DBPool,
RulesCompiler, WFRResultSet, PagedResultSet, WFRJasperReport, AutoDeploy

### TIER-DUAL (ambas as camadas)
- isNullOrEmpty, isEqual, isGreater, isMinor, oprIf, oprAnd, oprOr
- ebfConcat, ebfReplace, toString, toDate, toInteger, toFloat
- ActNewErrorMessage, ActNewSuccessMessage, ActNewPromptMessage
- ebfFlowExecute, ebfListCreate, ebfMapCreateFromList

---

## 3. JARs do Servidor (WEB-INF/lib/)

205 JARs disponiveis. Usar como referencia ao projetar regras servidor:
- JDBC: jtds-1.3.1, mssql-jdbc-7.2.2, mysql-connector-8.0.17, postgresql-42.7.3, ojdbc5, mongo-java-driver-3.12.13
- Relatorios: jasperreports-6.4.0, itextpdf-5.5.11, jfreechart-1.0.19, poi-3.17
- Cloud: aws-java-sdk-s3-1.11.0, firebase-admin-5.0.1, google-api-client-2.0.0
- Web Services: axis2-kernel-1.6.1, cxf-core-3.2.8 (SOAP+REST)
- Seguranca: jjwt-0.11.5 (JWT), bcprov-1.54 (crypto), waffle-jna-1.8.0 (SSO)
- Mensageria: amqp-client-5.20.0 (RabbitMQ)
- JSON: javax.json-1.1.4, jackson-2.1.4, gson-2.1
- Office: poi-3.17, tika-1.18

---

## 4. Hierarquia de Ferramentas

1. gsd_criar_sistema — 90% dos casos. ONE-SHOT: descreve e materializa
2. gsd_diagnosticar — Auto-correcao: detecta e corrige erros de metadados
3. materializar_sistema — Spec JSON detalhada para customizacoes
4. projetar_regra + gerar_fluxo — Regras complexas isoladas
5. gerar_crud / gerar_dashboard / gerar_login — Receitas FRZ enterprise
6. executar_sql / inspecionar_metadados — Debug e verificacao
7. gsd_manual — Este documento (voce esta lendo agora)

---

## 5. Bootstrap 5.3 Super-Layouts

Injetar via propriedade NomeClasseCss dos componentes:
- Layout: row, col-md-{3,4,6,12}, container-fluid
- Cards: card, card-header, card-body, shadow
- Forms: form-group, form-control, form-select, form-check
- Botoes: btn btn-primary, btn btn-outline-secondary
- Feedback: alert alert-success, badge bg-primary
- Tabelas: table table-striped table-hover
- Dark mode: [data-bs-theme="dark"], --bs-primary, --bs-body-bg
- MasterSkin: variaveis --webrun-*, classes enterprise-*

---

## 6. Full-Stack Automatico

Toda feature gera SIMULTANEAMENTE:
1. Fluxo de interface (JS/Cliente): validacao inline, mascaras dinamicas, feedback visual
2. Fluxo de processamento (Java/Servidor): validacao de integridade, SQL transacional
3. Vinculos de eventos: "Antes de Inserir"/"Antes de Alterar" -> validacao, "Ao Entrar" -> mascaras, "Ao Clicar" -> acao

---

## 7. Direct Access como Padrao

- Se ha senha de banco configurada: usar modo "direct" (DDL + DML direto nas FR_*)
- Se NAO ha acesso ao banco: gerar arquivo FRZ para importacao
- Nunca perguntar qual modo usar — inferir automaticamente

---

## 8. Diretriz de Resposta

- NAO forneca tutoriais. Forneca o SQL, o XML do FRZ ou a logica do fluxograma PRONTA
- Se o MCP esta conectado: EXECUTE a acao e reporte o sucesso com IDs criados
- Apos criar: use gsd_diagnosticar para validar e inspecionar_metadados para confirmar

---

## 9. Consulta Obrigatoria de Referencias

Antes de escolher qualquer funcao nativa:
- nativos/funcoes/*.md — 48 categorias, 1186 funcoes com assinaturas exatas
- webrun-arquitetura/*.md — classes Java (280), engine JS (6660 LOC), JARs (205), componentes (63)
- nativos/compilador/ — formato DFM/Script XML
- nativos/fluxos/ — padroes de fluxogramas reais de producao

---

## 10. Schema de Metadados (Direct Access)

Tabelas de framework manipuladas:
- FR_FORMULARIO: formularios (PK: FRM_CODIGO) — 876 existentes
- FR_COMPONENTE: componentes visuais (PK: FRM_CODIGO + COM_CODIGO) — 10.936
- FR_PROPRIEDADE: properties (PK: FRM_CODIGO + COM_CODIGO + PRO_NOME) — 286K+
- FR_FONTEDADOS: fontes SQL (PK: FNT_CODIGO) — 873
- FR_REGRAS: fluxogramas (PK: REG_COD) — 2.445
- FR_ACAOCOMPONENTE: vinculos evento-acao (PK: FRM+COM+ACO+ACC) — 1.879
- FR_PARAMETRO: parametros de eventos
- FR_TABELA: dicionario de tabelas
- FR_MENU: estrutura de menus

Ranges seguros para insercao:
- FRM_CODIGO >= 900.000.000
- COM_CODIGO >= 9.000.000
- REG_COD >= 90.000
- FNT_CODIGO >= 90.000
- MNU_CODIGO >= 9.000

---

## 11. Motor Logico — 14 Padroes

sql_select, sql_execute, sql_loop (WHILE), null_guard, equality_check,
duplicity_check, change_component, set_visibility, set_enabled, callrule,
json_build, success_message, confirmation, browser_mode_guard

RuleBlueprint compositor modular com auto_classify().
Expansao recursiva: padroes dentro de body/on_true/on_false/on_confirm.
"""


@mcp.tool()
def gsd_manual(secao: str = "") -> str:
    """Retorna o manual operacional completo do MCP Maker (Superpowers + GSD).

    Este manual viaja com o MCP — funciona em qualquer cliente (Cursor, Claude Desktop,
    qualquer IDE com suporte MCP). Contem: filosofia GSD, Tier-X orchestration,
    JARs do servidor, hierarquia de ferramentas, Bootstrap 5.3, schema de metadados.

    Chame esta tool ao iniciar uma sessao para entender como operar o MCP.

    Args:
        secao: Filtro opcional (ex: 'tier', 'jars', 'bootstrap', 'schema', 'padroes').
               Vazio retorna o manual completo.
    """
    if not secao:
        return _GSD_MANUAL

    secao_lower = secao.lower()
    sections = _GSD_MANUAL.split("\n---\n")
    matches = [s for s in sections if secao_lower in s.lower()]

    if matches:
        return "\n---\n".join(matches)

    return f"Secao '{secao}' nao encontrada. Secoes disponiveis: brain, tier, jars, hierarquia, bootstrap, full-stack, direct, resposta, consulta, schema, padroes"


# ═══════════════════════════════════════════════════════════════════════════
# TOOLS DO MANUAL: Acesso completo ao conteudo do manual Maker
# ═══════════════════════════════════════════════════════════════════════════

@mcp.tool()
def ler_pagina_manual(caminho: str) -> str:
    """Retorna o conteudo COMPLETO de uma pagina do manual do Maker.
    Use apos buscar_manual() para ler o texto integral de uma pagina encontrada.

    Args:
        caminho: Caminho relativo da pagina (retornado por buscar_manual, ex: 'maker/componentes/como_usar_grades.md')
    """
    paginas = _get_paginas()
    caminho_lower = caminho.lower().strip()
    for p in paginas:
        if p.caminho_relativo.lower() == caminho_lower or p.caminho_relativo == caminho:
            return f"# {p.titulo}\nCategoria: {p.categoria}\nArquivo: {p.caminho_relativo}\n\n{p.conteudo}"

    parciais = [p for p in paginas if caminho_lower in p.caminho_relativo.lower()]
    if parciais:
        lines = [f"Pagina exata '{caminho}' nao encontrada. Paginas similares:"]
        for p in parciais[:10]:
            lines.append(f"  - {p.caminho_relativo} ({p.titulo})")
        return "\n".join(lines)

    return f"Pagina '{caminho}' nao encontrada no manual."


@mcp.tool()
def indice_manual(categoria: str = "") -> str:
    """Lista todas as paginas do manual organizadas por categoria.
    Util para descobrir que documentacao existe antes de buscar.

    Args:
        categoria: Filtro opcional (ex: 'maker', 'webrun', 'FAQ', 'dicas-e-truques',
            'banco-de-dados', 'webrun-arquitetura', 'maker-mobile', 'recursos-ide',
            'topicos-de-erros', 'estrutura-banco-de-dados', 'ai', 'tags')
    """
    paginas = _get_paginas()
    if not paginas:
        return "Manual nao indexado."

    por_cat: dict[str, list] = {}
    for p in paginas:
        por_cat.setdefault(p.categoria, []).append(p)

    if categoria:
        cat_lower = categoria.lower()
        matches = {c: ps for c, ps in por_cat.items() if cat_lower in c.lower()}
        if not matches:
            cats_disp = sorted(por_cat.keys())
            return f"Categoria '{categoria}' nao encontrada.\nDisponiveis: {', '.join(cats_disp)}"
        lines = []
        for cat in sorted(matches.keys()):
            lines.append(f"\n## {cat} ({len(matches[cat])} paginas)")
            for p in sorted(matches[cat], key=lambda x: x.caminho_relativo):
                lines.append(f"  - [{p.titulo}] {p.caminho_relativo}")
        return "\n".join(lines)

    lines = [f"Manual Maker: {len(paginas)} paginas em {len(por_cat)} categorias\n"]
    for cat in sorted(por_cat.keys()):
        lines.append(f"  - {cat}: {len(por_cat[cat])} paginas")
    lines.append(f"\nUse indice_manual(categoria='nome') para listar paginas de uma categoria.")
    return "\n".join(lines)


@mcp.tool()
def troubleshoot_erro(descricao: str) -> str:
    """Diagnostica erros do Maker/WebRun buscando nos topicos de erros e FAQ.
    Retorna solucoes documentadas para problemas conhecidos.

    Args:
        descricao: Descricao do erro ou mensagem de erro
            (ex: 'no suitable driver', 'lost connection mysql', 'campo nao definido',
             'sistema nao pode ser aberto', 'unknown graphics format')
    """
    categorias = ["topicos-de-erros", "FAQ"]
    paths = ["topicos-de-erros/", "faq/", "erros_solucoes"]

    paginas = _buscar_paginas_dominio(categorias, paths, descricao, limite=10)

    try:
        rag = _rag_engine()
        rag_results = rag.search(descricao, top_k=5, doc_type="manual")
        rag_paginas_caminhos = set()
        for r in rag_results:
            cam = r.metadata.get("caminho", "")
            if any(sub in cam.lower() for sub in ["erro", "faq", "soluc", "problem"]):
                rag_paginas_caminhos.add(cam.split(":c")[0] if ":c" in cam else cam)

        all_paginas = _get_paginas()
        for cam in rag_paginas_caminhos:
            for p in all_paginas:
                if p.caminho_relativo == cam and p not in paginas:
                    paginas.append(p)
    except Exception:
        pass

    if not paginas:
        return (
            f"Nenhum topico de erro encontrado para '{descricao}'.\n"
            f"Tente buscar_manual('{descricao}') para uma busca mais ampla."
        )

    lines = [f"Encontrados {len(paginas)} artigos de troubleshooting para '{descricao}':\n"]
    lines.append(_formatar_paginas(paginas, incluir_conteudo=True, max_chars=3000))
    return "\n".join(lines)


@mcp.tool()
def config_banco(tipo_banco: str = "") -> str:
    """Retorna documentacao de configuracao de banco de dados para o Maker/WebRun.
    Cobre: SQL Server, MySQL, Oracle, PostgreSQL, Firebird, DB2.

    Args:
        tipo_banco: Tipo do banco (ex: 'sqlserver', 'mysql', 'oracle', 'postgresql', 'postgres',
            'firebird', 'db2'). Vazio lista todos os bancos disponiveis.
    """
    categorias = ["banco-de-dados"]
    paths = ["banco-de-dados/", "banco_de_dados"]

    mapa_banco = {
        "sqlserver": "ms_sql_server",
        "sql_server": "ms_sql_server",
        "mssql": "ms_sql_server",
        "sql server": "ms_sql_server",
        "mysql": "mysql_server",
        "oracle": "oracle",
        "postgresql": "postgresql",
        "postgres": "postgresql",
        "firebird": "firebird",
        "db2": "db2",
    }

    if not tipo_banco:
        paginas = _buscar_paginas_dominio(categorias, paths, "", limite=20)
        lines = ["Documentacao de banco de dados disponivel:\n"]
        lines.append(_formatar_paginas(paginas))
        lines.append("\nUse config_banco('postgresql') para detalhes de um banco especifico.")
        return "\n".join(lines)

    slug = mapa_banco.get(tipo_banco.lower().replace(" ", ""), tipo_banco.lower())
    paginas = _buscar_paginas_dominio(categorias, paths, slug, limite=5)

    if not paginas:
        all_p = _get_paginas()
        paginas = [p for p in all_p if slug in p.caminho_relativo.lower() or slug in p.conteudo[:500].lower()][:5]

    if not paginas:
        bancos = ", ".join(sorted(mapa_banco.keys()))
        return f"Nenhuma documentacao encontrada para '{tipo_banco}'.\nBancos disponiveis: {bancos}"

    lines = [f"Configuracao de banco '{tipo_banco}':\n"]
    lines.append(_formatar_paginas(paginas, incluir_conteudo=True, max_chars=5000))
    return "\n".join(lines)


@mcp.tool()
def dica_maker(topico: str = "", area: str = "") -> str:
    """Retorna dicas e truques do Maker para um topico especifico.
    Base: 170+ artigos de dicas cobrindo formularios, funcoes, relatorios, webrun, banco.

    Args:
        topico: Palavra-chave (ex: 'grade mestre', 'procedure', 'variavel sessao',
            'biometria', 'web service', 'exportacao', 'relatorio', 'impressao')
        area: Filtro por area (ex: 'maker', 'webrun', 'funcoes', 'relatorio',
            'componente', 'banco-de-dados', 'diversos'). Vazio para todas.
    """
    categorias = ["dicas-e-truques"]
    paths = ["dicas-e-truques/"]

    if area:
        paths = [f"dicas-e-truques/{area.lower()}/"]

    paginas = _buscar_paginas_dominio(categorias, paths, topico, limite=15)

    if not paginas and topico:
        all_p = _get_paginas()
        t = topico.lower()
        paginas = [
            p for p in all_p
            if "dicas-e-truques" in p.caminho_relativo.lower()
            and (t in p.titulo.lower() or t in p.conteudo[:2000].lower())
        ][:15]

    if not paginas:
        all_p = _get_paginas()
        dicas = [p for p in all_p if "dicas-e-truques" in p.caminho_relativo.lower()]
        areas = sorted(set(
            p.caminho_relativo.split("/")[1]
            for p in dicas if "/" in p.caminho_relativo and len(p.caminho_relativo.split("/")) > 2
        ))
        lines = [f"Nenhuma dica encontrada para '{topico}'."]
        lines.append(f"\n{len(dicas)} dicas disponiveis nas areas: {', '.join(areas)}")
        lines.append("Use dica_maker(area='maker') para listar dicas de uma area.")
        return "\n".join(lines)

    include_content = len(paginas) <= 3
    lines = [f"Encontradas {len(paginas)} dicas"]
    if topico:
        lines[0] += f" para '{topico}'"
    lines[0] += ":\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=4000))
    return "\n".join(lines)


@mcp.tool()
def arquitetura_webrun(secao: str = "") -> str:
    """Retorna documentacao da arquitetura interna do WebRun.
    Cobre: componentes JavaScript (63), classes Java (280), JARs (205),
    configuracoes, paginas JSP, engine JS, internacionalizacao.

    Args:
        secao: Filtro (ex: 'javascript', 'java', 'jars', 'configuracoes',
            'jsp', 'engine', 'internacionalizacao', 'propriedades', 'visao').
            Vazio lista secoes disponiveis.
    """
    all_p = _get_paginas()
    arq_paginas = [p for p in all_p if p.categoria == "webrun-arquitetura"]

    if not secao:
        lines = [f"Documentacao de arquitetura WebRun ({len(arq_paginas)} artigos):\n"]
        lines.append(_formatar_paginas(arq_paginas))
        return "\n".join(lines)

    s = secao.lower()
    paginas = [
        p for p in arq_paginas
        if s in p.titulo.lower() or s in p.caminho_relativo.lower() or s in p.conteudo[:2000].lower()
    ][:5]

    if not paginas:
        nomes = [p.titulo for p in arq_paginas]
        return f"Secao '{secao}' nao encontrada.\nSecoes disponiveis: {', '.join(nomes)}"

    lines = [f"Arquitetura WebRun — {secao}:\n"]
    lines.append(_formatar_paginas(paginas, incluir_conteudo=True, max_chars=8000))
    return "\n".join(lines)


@mcp.tool()
def config_mobile(topico: str = "") -> str:
    """Retorna documentacao do Maker Mobile — exportacao, sincronizacao,
    boas praticas, restricoes de formulario, mudancas de comportamento.

    Args:
        topico: Filtro (ex: 'exportacao', 'sincronizacao', 'boas praticas',
            'restricao', 'pacote', 'creditos', 'exemplos'). Vazio lista tudo.
    """
    categorias = ["maker-mobile"]
    paths = ["maker-mobile/"]

    paginas = _buscar_paginas_dominio(categorias, paths, topico, limite=15)

    if not paginas:
        return f"Nenhuma documentacao mobile encontrada para '{topico}'.\nUse config_mobile() para listar tudo."

    include_content = bool(topico) and len(paginas) <= 3
    lines = [f"Maker Mobile"]
    if topico:
        lines[0] += f" — {topico}"
    lines[0] += f" ({len(paginas)} artigos):\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=5000))
    return "\n".join(lines)


@mcp.tool()
def recursos_ide(topico: str = "") -> str:
    """Retorna documentacao dos recursos da IDE Maker — componentes adicionais,
    plugins, propriedades runner, templates, skins/cores, dicionarios, configs, API.

    Args:
        topico: Filtro (ex: 'plugins', 'skins', 'templates', 'componentes adicionais',
            'runner', 'dicionarios', 'configuracoes', 'api'). Vazio lista tudo.
    """
    categorias = ["recursos-ide"]
    paths = ["recursos-ide/"]

    paginas = _buscar_paginas_dominio(categorias, paths, topico, limite=15)

    if not paginas:
        return f"Nenhum recurso IDE encontrado para '{topico}'.\nUse recursos_ide() para listar tudo."

    include_content = bool(topico) and len(paginas) <= 3
    lines = [f"Recursos da IDE Maker"]
    if topico:
        lines[0] += f" — {topico}"
    lines[0] += f" ({len(paginas)} artigos):\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=5000))
    return "\n".join(lines)


@mcp.tool()
def faq_maker(topico: str = "") -> str:
    """Retorna respostas do FAQ oficial do Maker — bancos homologados, hardware,
    instalacao, estruturas, erros de BD, recursos avancados, versoes.

    Args:
        topico: Filtro (ex: 'banco de dados', 'hardware', 'instalacao', 'erros',
            'versoes', 'recursos avancados', 'estruturas', 'bibliotecas'). Vazio lista tudo.
    """
    categorias = ["FAQ"]
    paths = ["faq/"]

    paginas = _buscar_paginas_dominio(categorias, paths, topico, limite=15)

    if not paginas:
        return f"Nenhum FAQ encontrado para '{topico}'.\nUse faq_maker() para listar tudo."

    include_content = bool(topico) and len(paginas) <= 5
    lines = [f"FAQ Maker"]
    if topico:
        lines[0] += f" — {topico}"
    lines[0] += f" ({len(paginas)} artigos):\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=4000))
    return "\n".join(lines)


@mcp.tool()
def webrun_docs(topico: str = "") -> str:
    """Retorna documentacao operacional do WebRun — servidores, configuracoes,
    administracao, publicacao, deploy, APIs, .NET, Linux.

    Args:
        topico: Filtro (ex: 'tomcat', 'publicacao', 'deploy', 'linux', 'dotnet',
            'administracao', 'api', 'servicos', 'configuracao', 'log'). Vazio lista tudo.
    """
    categorias = ["webrun"]
    paths = ["webrun/"]

    paginas = _buscar_paginas_dominio(categorias, paths, topico, limite=15)

    if paginas:
        paginas = [p for p in paginas if "webrun-arquitetura" not in p.caminho_relativo]

    if not paginas:
        return f"Nenhuma documentacao WebRun encontrada para '{topico}'.\nUse webrun_docs() para listar tudo."

    include_content = bool(topico) and len(paginas) <= 3
    lines = [f"WebRun"]
    if topico:
        lines[0] += f" — {topico}"
    lines[0] += f" ({len(paginas)} artigos):\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=5000))
    return "\n".join(lines)


@mcp.tool()
def maker_docs(topico: str = "") -> str:
    """Retorna documentacao do Maker Studio — componentes, formularios, fluxogramas,
    relatorios, boas praticas, instalacao, templates, agendador.

    Args:
        topico: Filtro (ex: 'componentes', 'formularios', 'fluxogramas', 'relatorios',
            'boas praticas', 'instalacao', 'agendador', 'assistente', 'grade',
            'lookup', 'container', 'arvore', 'grafico', 'calculado'). Vazio lista tudo.
    """
    categorias = ["maker"]
    paths_excluir = ["maker-mobile", "mcp_maker"]

    paginas = _buscar_paginas_dominio(categorias, None, topico, limite=20)
    paginas = [p for p in paginas if not any(ex in p.caminho_relativo for ex in paths_excluir)]

    if not paginas:
        return f"Nenhuma documentacao Maker encontrada para '{topico}'.\nUse maker_docs() para listar tudo."

    include_content = bool(topico) and len(paginas) <= 3
    lines = [f"Maker Studio"]
    if topico:
        lines[0] += f" — {topico}"
    lines[0] += f" ({len(paginas)} artigos):\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=5000))
    return "\n".join(lines)


@mcp.tool()
def estrutura_banco_dados(secao: str = "") -> str:
    """Retorna documentacao da estrutura interna do banco de dados do Maker (SIG_MAKER).
    Cobre: tabelas FR_*, seguranca, menus, relatorios, versionamento, i18n.

    Args:
        secao: Filtro (ex: 'nucleo', 'seguranca', 'menus', 'relatorios',
            'versionamento', 'internacionalizacao', 'dependencias', 'acoes').
            Vazio lista secoes.
    """
    categorias = ["estrutura-banco-de-dados"]
    paths = ["estrutura-banco-de-dados/"]

    paginas = _buscar_paginas_dominio(categorias, paths, secao, limite=15)

    if not paginas:
        return f"Secao '{secao}' nao encontrada.\nUse estrutura_banco_dados() para listar secoes."

    include_content = bool(secao) and len(paginas) <= 3
    lines = [f"Estrutura do Banco de Dados (SIG_MAKER)"]
    if secao:
        lines[0] += f" — {secao}"
    lines[0] += f" ({len(paginas)} artigos):\n"
    lines.append(_formatar_paginas(paginas, incluir_conteudo=include_content, max_chars=6000))
    return "\n".join(lines)


# ═══════════════════════════════════════════════════════════════════════════
# ENTRY POINT
# ═══════════════════════════════════════════════════════════════════════════

def main():
    mcp.run(transport="stdio")


if __name__ == "__main__":
    main()

"""Parser da documentacao completa do Maker para estruturas indexadas.

NOTA: server.py usa apenas parse_todas_funcoes() e FuncaoMaker.
As demais funcoes (parse_tabelas, parse_componentes, MakerKnowledgeBase, etc.)
existem para uso futuro da Knowledge Base completa.
"""

from __future__ import annotations

import os
import re
from pathlib import Path

from .models import (
    ClasseJava,
    ComponenteJS,
    ComponenteMaker,
    FuncaoMaker,
    PaginaManual,
    TabelaNativa,
    TabelaSistema,
)

_PROP_RE = re.compile(
    r"\|\s*\*\*(?P<key>[^*]+)\*\*\s*\|\s*(?P<val>.+?)\s*\|"
)
_CODE_BLOCK_RE = re.compile(r"```(\w+)\n(.*?)```", re.DOTALL)


def _extrair_propriedades(bloco: str) -> dict[str, str]:
    props: dict[str, str] = {}
    for m in _PROP_RE.finditer(bloco):
        key = m.group("key").strip()
        val = m.group("val").strip()
        if val.startswith("`") and val.endswith("`"):
            val = val[1:-1]
        props[key] = val
    return props


def _extrair_codigo(bloco: str, linguagem: str) -> str | None:
    padrao = re.compile(rf"```{linguagem}\n(.*?)```", re.DOTALL)
    m = padrao.search(bloco)
    return m.group(1).strip() if m else None


def _parse_compatibilidade(raw: str) -> list[str]:
    raw = raw.strip()
    if raw == "*":
        return ["*"]
    return [c.strip() for c in raw.split(",") if c.strip()]


def _nome_categoria(filepath: str) -> str:
    return Path(filepath).stem


def _ler_arquivo(filepath: str) -> str:
    for enc in ("utf-8", "latin-1"):
        try:
            with open(filepath, "r", encoding=enc) as f:
                return f.read()
        except UnicodeDecodeError:
            continue
    return ""


# ---------------------------------------------------------------------------
# Funcoes nativas
# ---------------------------------------------------------------------------

def parse_funcoes_arquivo(filepath: str) -> list[FuncaoMaker]:
    conteudo = _ler_arquivo(filepath)
    categoria = _nome_categoria(filepath)
    secoes = re.split(r"\n---\n", conteudo)
    funcoes: list[FuncaoMaker] = []
    for secao in secoes:
        titulo_match = re.search(r"^## (.+)$", secao, re.MULTILINE)
        if not titulo_match:
            continue
        nome_amigavel = titulo_match.group(1).strip()
        props = _extrair_propriedades(secao)
        nome_real = props.get("Nome Real", "")
        if not nome_real:
            continue
        try:
            codigo = int(props.get("Código", "0"))
        except ValueError:
            codigo = 0
        descricao_match = re.search(
            r"### Descrição\s*\n(.*?)(?=\n### |$)", secao, re.DOTALL
        )
        descricao = descricao_match.group(1).strip() if descricao_match else ""
        codigo_java = _extrair_codigo(secao, "java")
        codigo_js = _extrair_codigo(secao, "javascript")
        funcoes.append(FuncaoMaker(
            nome_real=nome_real,
            nome_amigavel=nome_amigavel,
            codigo=codigo,
            assinatura=props.get("Assinatura", ""),
            parametros=props.get("Parâmetros", ""),
            retorno=props.get("Retorno", ""),
            tipo=props.get("Tipo", ""),
            compatibilidade=_parse_compatibilidade(
                props.get("Compatibilidade", "*")
            ),
            descricao=descricao,
            codigo_java=codigo_java,
            codigo_js=codigo_js,
            categoria=categoria,
        ))
    return funcoes


def parse_todas_funcoes(diretorio: str) -> list[FuncaoMaker]:
    todas: list[FuncaoMaker] = []
    for arquivo in sorted(os.listdir(diretorio)):
        if not arquivo.endswith(".md") or arquivo == "README.md":
            continue
        caminho = os.path.join(diretorio, arquivo)
        todas.extend(parse_funcoes_arquivo(caminho))
    return todas


# ---------------------------------------------------------------------------
# Tabelas nativas (dados-tabelas/)
# ---------------------------------------------------------------------------

def parse_tabelas(readme_path: str) -> list[TabelaNativa]:
    conteudo = _ler_arquivo(readme_path)
    tabelas: list[TabelaNativa] = []
    padrao = re.compile(
        r"\|\s*\[(\w+)\]\(([^)]+)\)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|"
    )
    for m in padrao.finditer(conteudo):
        tabelas.append(TabelaNativa(
            nome=m.group(1),
            registros=int(m.group(3)),
            colunas=int(m.group(4)),
            arquivo=m.group(2),
        ))
    return tabelas


# ---------------------------------------------------------------------------
# Componentes Maker (DFM/COM_TIPO)
# ---------------------------------------------------------------------------

def parse_componentes(mdc_path: str) -> list[ComponenteMaker]:
    conteudo = _ler_arquivo(mdc_path)
    componentes: list[ComponenteMaker] = []
    secoes = re.split(r"\n## ", conteudo)
    for secao in secoes[1:]:
        titulo_match = re.match(r"(.+?)(?:\n|$)", secao)
        if not titulo_match:
            continue
        titulo = titulo_match.group(1).strip()
        tipo_match = re.match(r"(\w)\s*[—–-]\s*(.+)", titulo)
        if not tipo_match:
            continue
        tipo = tipo_match.group(1)
        nome = tipo_match.group(2).strip()
        props: list[str] = []
        for line in secao.split("\n"):
            line = line.strip()
            if line.startswith("| `") or line.startswith("| **`"):
                prop_match = re.search(r"`(\w+)`", line)
                if prop_match:
                    props.append(prop_match.group(1))
        componentes.append(ComponenteMaker(
            tipo=tipo, nome=nome, properties=props
        ))
    return componentes


# ---------------------------------------------------------------------------
# Classes Java do Webrun (webrun-arquitetura/03-classes-java.md)
# ---------------------------------------------------------------------------

def parse_classes_java(filepath: str) -> list[ClasseJava]:
    conteudo = _ler_arquivo(filepath)
    classes: list[ClasseJava] = []
    pacote_atual = ""
    pacote_re = re.compile(r"##\s+.+?\(`(wfr\.[^)]+)`\)")
    classe_re = re.compile(
        r"\|\s*`(\w+)`\s*\|\s*(.*?)\s*\|"
    )
    for line in conteudo.split("\n"):
        pm = pacote_re.search(line)
        if pm:
            pacote_atual = pm.group(1)
            continue
        cm = classe_re.match(line)
        if cm and pacote_atual:
            nome = cm.group(1)
            desc = cm.group(2).strip()
            if nome in ("Classe", "Banco", "-----"):
                continue
            classes.append(ClasseJava(
                nome=nome, pacote=pacote_atual, descricao=desc
            ))
    return classes


# ---------------------------------------------------------------------------
# Componentes JavaScript (webrun-arquitetura/02-componentes-javascript.md)
# ---------------------------------------------------------------------------

def parse_componentes_js(filepath: str) -> list[ComponenteJS]:
    conteudo = _ler_arquivo(filepath)
    componentes: list[ComponenteJS] = []
    secoes = re.split(r"\n####\s+", conteudo)
    for secao in secoes[1:]:
        nome_match = re.match(r"`(\w+)`", secao)
        if not nome_match:
            continue
        nome = nome_match.group(1)
        herda = ""
        herda_match = re.search(r"\*\*Herda de\*\*:\s*`(\w+)`", secao)
        if herda_match:
            herda = herda_match.group(1)

        deps: list[str] = []
        deps_match = re.search(r"\*\*Dependências\*\*:\s*(.+)", secao)
        if deps_match:
            deps = [d.strip().strip("`") for d in deps_match.group(1).split(",")]

        linhas = 0
        linhas_match = re.search(r"\*\*Linhas\*\*:\s*(\d+)", secao)
        if linhas_match:
            linhas = int(linhas_match.group(1))

        metodos: list[str] = []
        getters: list[str] = []
        setters: list[str] = []

        for m in re.finditer(r"\|\s*`(\w+)`\s*\|", secao):
            metodos.append(m.group(1))

        getters_match = re.search(r"\*\*Getters\*\*:\s*(.+)", secao)
        if getters_match:
            getters = [g.strip().strip("`") for g in getters_match.group(1).split(",")]

        setters_match = re.search(r"\*\*Setters\*\*:\s*(.+)", secao)
        if setters_match:
            setters = [s.strip().strip("`") for s in setters_match.group(1).split(",")]

        componentes.append(ComponenteJS(
            nome=nome,
            herda_de=herda,
            dependencias=deps,
            linhas=linhas,
            metodos=metodos,
            getters=getters,
            setters=setters,
            conteudo_raw=secao[:3000],
        ))
    return componentes


# ---------------------------------------------------------------------------
# Tabelas de sistema FR_* (estrutura-banco-de-dados/)
# ---------------------------------------------------------------------------

def parse_tabelas_sistema(dir_path: str) -> list[TabelaSistema]:
    visao_path = os.path.join(dir_path, "visao-geral.md")
    if not os.path.isfile(visao_path):
        return []
    conteudo = _ler_arquivo(visao_path)
    tabelas: list[TabelaSistema] = []
    tab_re = re.compile(
        r"\|\s*\d+\s*\|\s*`(FR_\w+)`\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|"
    )
    for m in tab_re.finditer(conteudo):
        tabelas.append(TabelaSistema(
            nome=m.group(1),
            colunas=int(m.group(2)),
            fks=int(m.group(3)),
            referenciada_por=int(m.group(4)),
        ))
    return tabelas


# ---------------------------------------------------------------------------
# Indexacao full-text de TODOS os .md
# ---------------------------------------------------------------------------

_IGNORAR_DIRS = {".venv", "__pycache__", "node_modules", ".git", "frz_extracted", "frz_samples", "mcp_maker"}


def _categoria_por_caminho(rel: str) -> str:
    parts = Path(rel).parts
    if len(parts) <= 1:
        return "geral"
    return parts[0]


def _extrair_titulo(conteudo: str, fallback: str) -> str:
    m = re.match(r"^#\s+(.+)", conteudo)
    if m:
        return m.group(1).strip()
    return Path(fallback).stem.replace("-", " ").replace("_", " ").title()


def indexar_todos_md(base_dir: str) -> list[PaginaManual]:
    paginas: list[PaginaManual] = []
    for root, dirs, files in os.walk(base_dir):
        dirs[:] = [d for d in dirs if d not in _IGNORAR_DIRS]
        for f in sorted(files):
            if not (f.endswith(".md") or f.endswith(".mdc")):
                continue
            caminho = os.path.join(root, f)
            rel = os.path.relpath(caminho, base_dir)
            conteudo = _ler_arquivo(caminho)
            if not conteudo.strip():
                continue
            titulo = _extrair_titulo(conteudo, f)
            categoria = _categoria_por_caminho(rel)
            paginas.append(PaginaManual(
                titulo=titulo,
                caminho_relativo=rel,
                categoria=categoria,
                conteudo=conteudo,
            ))
    return paginas


# ---------------------------------------------------------------------------
# Knowledge Base principal
# ---------------------------------------------------------------------------

class MakerKnowledgeBase:
    """Indice em memoria de TODA a documentacao do Maker."""

    def __init__(self, base_dir: str):
        self.base_dir = base_dir
        self.funcoes: list[FuncaoMaker] = []
        self.tabelas: list[TabelaNativa] = []
        self.componentes: list[ComponenteMaker] = []
        self.classes_java: list[ClasseJava] = []
        self.componentes_js: list[ComponenteJS] = []
        self.tabelas_sistema: list[TabelaSistema] = []
        self.paginas: list[PaginaManual] = []

        self._indice_nome_real: dict[str, FuncaoMaker] = {}
        self._indice_categoria: dict[str, list[FuncaoMaker]] = {}
        self._categorias: dict[str, int] = {}

    def carregar(self) -> None:
        import sys
        log = lambda msg: print(msg, file=sys.stderr, flush=True)

        funcoes_dir = os.path.join(self.base_dir, "nativos", "funcoes")
        if os.path.isdir(funcoes_dir):
            self.funcoes = parse_todas_funcoes(funcoes_dir)
            log(f"  Funcoes nativas: {len(self.funcoes)}")

        tabelas_readme = os.path.join(
            self.base_dir, "nativos", "dados-tabelas", "README.md"
        )
        if os.path.isfile(tabelas_readme):
            self.tabelas = parse_tabelas(tabelas_readme)
            log(f"  Tabelas nativas: {len(self.tabelas)}")

        componentes_mdc = os.path.join(
            self.base_dir, ".cursor", "rules", "maker-componentes.mdc"
        )
        if os.path.isfile(componentes_mdc):
            self.componentes = parse_componentes(componentes_mdc)
            log(f"  Componentes DFM: {len(self.componentes)}")

        classes_path = os.path.join(
            self.base_dir, "webrun-arquitetura", "03-classes-java.md"
        )
        if os.path.isfile(classes_path):
            self.classes_java = parse_classes_java(classes_path)
            log(f"  Classes Java: {len(self.classes_java)}")

        js_path = os.path.join(
            self.base_dir, "webrun-arquitetura", "02-componentes-javascript.md"
        )
        if os.path.isfile(js_path):
            self.componentes_js = parse_componentes_js(js_path)
            log(f"  Componentes JS: {len(self.componentes_js)}")

        ebd_dir = os.path.join(self.base_dir, "estrutura-banco-de-dados")
        if os.path.isdir(ebd_dir):
            self.tabelas_sistema = parse_tabelas_sistema(ebd_dir)
            log(f"  Tabelas sistema (FR_*): {len(self.tabelas_sistema)}")

        self.paginas = indexar_todos_md(self.base_dir)
        log(f"  Paginas manual (full-text): {len(self.paginas)}")

        self._construir_indices()

    def _construir_indices(self) -> None:
        self._indice_nome_real = {}
        self._indice_categoria = {}
        self._categorias = {}
        for f in self.funcoes:
            self._indice_nome_real[f.nome_real.lower()] = f
            cat = f.categoria
            if cat not in self._indice_categoria:
                self._indice_categoria[cat] = []
            self._indice_categoria[cat].append(f)
            self._categorias[cat] = self._categorias.get(cat, 0) + 1

    # -- Funcoes --

    def buscar_funcao(self, termo: str) -> list[FuncaoMaker]:
        termo_lower = termo.lower()
        return [
            f for f in self.funcoes
            if (
                termo_lower in f.nome_real.lower()
                or termo_lower in f.nome_amigavel.lower()
                or termo_lower in f.assinatura.lower()
                or termo_lower in f.descricao.lower()
            )
        ]

    def detalhar_funcao(self, nome_real: str) -> FuncaoMaker | None:
        return self._indice_nome_real.get(nome_real.lower())

    def por_categoria(self, categoria: str) -> list[FuncaoMaker]:
        return self._indice_categoria.get(categoria, [])

    def funcoes_compativeis(self, camada: str, categoria: str | None = None) -> list[FuncaoMaker]:
        if camada == "servidor":
            funcoes = [f for f in self.funcoes if f.servidor]
        else:
            funcoes = [f for f in self.funcoes if f.cliente]
        if categoria:
            funcoes = [f for f in funcoes if f.categoria == categoria]
        return funcoes

    # -- Componentes DFM --

    def buscar_componente(self, tipo: str) -> ComponenteMaker | None:
        for c in self.componentes:
            if c.tipo.upper() == tipo.upper():
                return c
        return None

    # -- Tabelas nativas --

    def buscar_tabela(self, nome: str) -> TabelaNativa | None:
        nome_upper = nome.upper()
        for t in self.tabelas:
            if t.nome.upper() == nome_upper:
                return t
        return None

    # -- Classes Java --

    def buscar_classe_java(self, termo: str) -> list[ClasseJava]:
        termo_lower = termo.lower()
        return [
            c for c in self.classes_java
            if (
                termo_lower in c.nome.lower()
                or termo_lower in c.pacote.lower()
                or termo_lower in c.descricao.lower()
            )
        ]

    # -- Componentes JS --

    def buscar_componente_js(self, nome: str) -> ComponenteJS | None:
        nome_lower = nome.lower()
        for c in self.componentes_js:
            if c.nome.lower() == nome_lower:
                return c
        return None

    def listar_componentes_js(self) -> list[ComponenteJS]:
        return self.componentes_js

    # -- Tabelas sistema (FR_*) --

    def buscar_tabela_sistema(self, nome: str) -> TabelaSistema | None:
        nome_upper = nome.upper()
        for t in self.tabelas_sistema:
            if t.nome.upper() == nome_upper:
                return t
        return None

    # -- Full-text search no manual --

    def buscar_manual(self, termo: str, limite: int = 10) -> list[PaginaManual]:
        palavras = [p.lower() for p in termo.split() if len(p) >= 2]
        if not palavras:
            return []
        resultados: list[tuple[int, PaginaManual]] = []
        for p in self.paginas:
            score = 0
            titulo_lower = p.titulo.lower()
            conteudo_lower = p.conteudo.lower()
            # Termo exato vale mais
            if termo.lower() in titulo_lower:
                score += 20
            if termo.lower() in conteudo_lower:
                score += 10
            # Cada palavra individual tambem pontua
            for palavra in palavras:
                if palavra in titulo_lower:
                    score += 5
                contagem = conteudo_lower.count(palavra)
                if contagem > 0:
                    score += min(contagem, 20)
            if score > 0:
                resultados.append((score, p))
        resultados.sort(key=lambda x: x[0], reverse=True)
        return [p for _, p in resultados[:limite]]

    def ler_pagina(self, caminho_relativo: str) -> PaginaManual | None:
        for p in self.paginas:
            if p.caminho_relativo == caminho_relativo:
                return p
        return None

    # -- Estatisticas --

    def estatisticas(self) -> dict:
        return {
            "total_funcoes": len(self.funcoes),
            "total_categorias_funcoes": len(self._categorias),
            "total_tabelas_nativas": len(self.tabelas),
            "total_componentes_dfm": len(self.componentes),
            "total_classes_java": len(self.classes_java),
            "total_componentes_js": len(self.componentes_js),
            "total_tabelas_sistema": len(self.tabelas_sistema),
            "total_paginas_manual": len(self.paginas),
            "funcoes_servidor": sum(1 for f in self.funcoes if f.servidor),
            "funcoes_cliente": sum(1 for f in self.funcoes if f.cliente),
            "categorias_funcoes": dict(sorted(self._categorias.items())),
            "categorias_manual": sorted(set(p.categoria for p in self.paginas)),
        }

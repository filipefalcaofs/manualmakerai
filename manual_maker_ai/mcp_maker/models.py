"""Modelos de dados para a Knowledge Base completa do Maker."""

from __future__ import annotations

from dataclasses import dataclass, field


@dataclass
class FuncaoMaker:
    nome_real: str
    nome_amigavel: str
    codigo: int
    assinatura: str
    parametros: str
    retorno: str
    tipo: str
    compatibilidade: list[str] = field(default_factory=list)
    descricao: str = ""
    codigo_java: str | None = None
    codigo_js: str | None = None
    categoria: str = ""

    @property
    def servidor(self) -> bool:
        if "*" in self.compatibilidade:
            return True
        for c in self.compatibilidade:
            cl = c.lower().strip()
            if cl.startswith("servidor") or cl.startswith("banco"):
                return True
        return False

    @property
    def cliente(self) -> bool:
        if "*" in self.compatibilidade:
            return True
        for c in self.compatibilidade:
            cl = c.lower().strip()
            if cl.startswith("cliente"):
                return True
        return False

    @property
    def apenas_cliente(self) -> bool:
        return (
            self.compatibilidade == ["Cliente"]
            or self.compatibilidade == ["Mobile"]
        )

    def resumo(self) -> str:
        compat = ", ".join(self.compatibilidade)
        lines = [
            f"Nome Real: {self.nome_real}",
            f"Nome Amigavel: {self.nome_amigavel}",
            f"Codigo: {self.codigo}",
            f"Assinatura: {self.assinatura}",
            f"Parametros: {self.parametros}",
            f"Retorno: {self.retorno}",
            f"Compatibilidade: {compat}",
            f"Categoria: {self.categoria}",
        ]
        return "\n".join(lines)

    def detalhes(self) -> str:
        parts = [self.resumo(), "", f"Descricao:\n{self.descricao}"]
        if self.codigo_java:
            parts.append(f"\nCodigo Servidor (Java):\n```java\n{self.codigo_java}\n```")
        if self.codigo_js:
            parts.append(f"\nCodigo Cliente (JavaScript):\n```javascript\n{self.codigo_js}\n```")
        return "\n".join(parts)


@dataclass
class ComponenteMaker:
    tipo: str
    nome: str
    properties: list[str] = field(default_factory=list)
    descricao: str = ""


@dataclass
class TabelaNativa:
    nome: str
    registros: int
    colunas: int
    arquivo: str = ""


@dataclass
class ClasseJava:
    """Classe Java do Webrun (wfr.*)."""
    nome: str
    pacote: str
    descricao: str = ""


@dataclass
class ComponenteJS:
    """Componente JavaScript do Webrun (HTMLEdit, HTMLGrid, etc.)."""
    nome: str
    herda_de: str = ""
    dependencias: list[str] = field(default_factory=list)
    linhas: int = 0
    propriedades: list[str] = field(default_factory=list)
    metodos: list[str] = field(default_factory=list)
    getters: list[str] = field(default_factory=list)
    setters: list[str] = field(default_factory=list)
    conteudo_raw: str = ""


@dataclass
class TabelaSistema:
    """Tabela FR_* do banco de dados do Maker."""
    nome: str
    colunas: int = 0
    fks: int = 0
    referenciada_por: int = 0
    dominio: str = ""


@dataclass
class PaginaManual:
    """Pagina generica do manual (.md) indexada para busca full-text."""
    titulo: str
    caminho_relativo: str
    categoria: str
    conteudo: str
    tags: list[str] = field(default_factory=list)

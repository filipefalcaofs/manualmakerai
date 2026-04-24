"""Motor de busca semantica (RAG) para o MCP Maker.

Usa sentence-transformers com modelo multilingual para embedding de documentos
e numpy para cosine similarity. Cache de embeddings em disco (.npz) com
invalidacao automatica por hash do conteudo.
"""

from __future__ import annotations

import hashlib
import os
import sys
import time
from dataclasses import dataclass, field

import numpy as np

_MODEL_NAME = "paraphrase-multilingual-MiniLM-L12-v2"
_EMBEDDING_DIM = 384
_MAX_MANUAL_CHARS = 3000
_CHUNK_SIZE = 1500
_CHUNK_OVERLAP = 200
_HF_CACHE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), ".hf_cache")

_log = lambda msg: print(msg, file=sys.stderr, flush=True)


@dataclass
class RagDocument:
    """Documento indexado para busca semantica."""
    doc_id: str
    doc_type: str  # "funcao", "regra", "manual"
    text: str
    metadata: dict = field(default_factory=dict)


@dataclass
class RagResult:
    """Resultado de busca semantica."""
    doc_id: str
    doc_type: str
    score: float
    metadata: dict = field(default_factory=dict)


def _content_hash(texts: list[str]) -> str:
    h = hashlib.sha256()
    for t in texts:
        h.update(t.encode("utf-8", errors="replace"))
    return h.hexdigest()[:16]


class RagEngine:
    """Indice semantico com cache em disco e busca hibrida."""

    def __init__(self, cache_dir: str | None = None):
        self._model = None
        self._embeddings: np.ndarray | None = None
        self._documents: list[RagDocument] = []
        self._doc_id_to_idx: dict[str, int] = {}
        self._cache_dir = cache_dir or os.path.join(
            os.path.dirname(os.path.abspath(__file__)), ".rag_cache"
        )
        self._content_hash: str = ""

    @property
    def is_indexed(self) -> bool:
        return self._embeddings is not None and len(self._documents) > 0

    @property
    def doc_count(self) -> int:
        return len(self._documents)

    def _ensure_model(self):
        if self._model is not None:
            return
        os.environ.setdefault("HF_HOME", _HF_CACHE_DIR)
        os.environ.setdefault("TRANSFORMERS_CACHE", _HF_CACHE_DIR)
        t0 = time.time()
        from sentence_transformers import SentenceTransformer
        self._model = SentenceTransformer(_MODEL_NAME, cache_folder=_HF_CACHE_DIR)
        _log(f"[rag] Modelo '{_MODEL_NAME}' carregado em {time.time() - t0:.1f}s")

    def _cache_path(self) -> str:
        return os.path.join(self._cache_dir, f"embeddings_{self._content_hash}.npz")

    def _try_load_cache(self) -> bool:
        path = self._cache_path()
        if not os.path.isfile(path):
            return False
        try:
            data = np.load(path)
            cached = data["embeddings"]
            if cached.shape[0] != len(self._documents):
                _log(f"[rag] Cache invalido: {cached.shape[0]} embeddings vs {len(self._documents)} docs")
                return False
            self._embeddings = cached
            _log(f"[rag] Cache carregado: {cached.shape[0]} embeddings de {path}")
            return True
        except Exception as e:
            _log(f"[rag] Erro ao carregar cache: {e}")
            return False

    def _save_cache(self):
        if self._embeddings is None:
            return
        os.makedirs(self._cache_dir, exist_ok=True)
        path = self._cache_path()
        np.savez_compressed(path, embeddings=self._embeddings)
        size_mb = os.path.getsize(path) / (1024 * 1024)
        _log(f"[rag] Cache salvo: {path} ({size_mb:.1f}MB)")

    def add_documents(self, docs: list[RagDocument]):
        """Adiciona documentos ao indice (sem computar embeddings ainda)."""
        for doc in docs:
            if doc.doc_id in self._doc_id_to_idx:
                continue
            self._doc_id_to_idx[doc.doc_id] = len(self._documents)
            self._documents.append(doc)
        self._content_hash = _content_hash([d.text for d in self._documents])

    def build_index(self):
        """Computa embeddings para todos os documentos.

        Tenta carregar do cache primeiro. Se nao houver cache,
        carrega o modelo e computa os embeddings.
        """
        if not self._documents:
            _log("[rag] Nenhum documento para indexar")
            return

        if self._try_load_cache():
            return

        self._ensure_model()
        texts = [d.text for d in self._documents]
        t0 = time.time()
        self._embeddings = self._model.encode(
            texts,
            batch_size=64,
            show_progress_bar=False,
            normalize_embeddings=True,
        )
        elapsed = time.time() - t0
        _log(f"[rag] {len(texts)} embeddings computados em {elapsed:.1f}s")
        self._save_cache()

    def search(self, query: str, top_k: int = 20,
               doc_type: str | None = None) -> list[RagResult]:
        """Busca semantica por cosine similarity.

        Args:
            query: Texto da busca
            top_k: Numero maximo de resultados
            doc_type: Filtrar por tipo ("funcao", "regra", "manual")
        """
        if not self.is_indexed:
            self.build_index()
        if not self.is_indexed:
            return []

        self._ensure_model()
        query_emb = self._model.encode(
            [query],
            normalize_embeddings=True,
        )[0]

        scores = self._embeddings @ query_emb

        if doc_type:
            mask = np.array([d.doc_type == doc_type for d in self._documents])
            scores = np.where(mask, scores, -1.0)

        top_indices = np.argsort(scores)[::-1][:top_k]

        results = []
        for idx in top_indices:
            if scores[idx] <= 0:
                break
            doc = self._documents[idx]
            results.append(RagResult(
                doc_id=doc.doc_id,
                doc_type=doc.doc_type,
                score=float(scores[idx]),
                metadata=doc.metadata,
            ))
        return results

    def hybrid_search(
        self,
        query: str,
        keyword_ids_scores: list[tuple[str, float]],
        top_k: int = 20,
        keyword_weight: float = 0.4,
        semantic_weight: float = 0.6,
        doc_type: str | None = None,
    ) -> list[RagResult]:
        """Busca hibrida: combina score de keyword com score semantico.

        Args:
            query: Texto da busca
            keyword_ids_scores: Lista de (doc_id, score_keyword) da busca por keyword
            top_k: Numero maximo de resultados
            keyword_weight: Peso do score keyword (0-1)
            semantic_weight: Peso do score semantico (0-1)
            doc_type: Filtrar por tipo
        """
        semantic_results = self.search(query, top_k=top_k * 3, doc_type=doc_type)

        kw_scores: dict[str, float] = {}
        if keyword_ids_scores:
            max_kw = max(s for _, s in keyword_ids_scores) if keyword_ids_scores else 1.0
            max_kw = max_kw if max_kw > 0 else 1.0
            for doc_id, score in keyword_ids_scores:
                kw_scores[doc_id] = score / max_kw

        sem_scores: dict[str, float] = {}
        sem_meta: dict[str, dict] = {}
        for r in semantic_results:
            sem_scores[r.doc_id] = r.score
            sem_meta[r.doc_id] = r.metadata

        all_ids = set(kw_scores.keys()) | set(sem_scores.keys())

        merged: list[tuple[str, float]] = []
        for doc_id in all_ids:
            kw = kw_scores.get(doc_id, 0.0)
            sm = sem_scores.get(doc_id, 0.0)
            combined = keyword_weight * kw + semantic_weight * sm
            merged.append((doc_id, combined))

        merged.sort(key=lambda x: x[1], reverse=True)

        results = []
        for doc_id, combined_score in merged[:top_k]:
            idx = self._doc_id_to_idx.get(doc_id)
            if idx is None:
                continue
            doc = self._documents[idx]
            results.append(RagResult(
                doc_id=doc_id,
                doc_type=doc.doc_type,
                score=combined_score,
                metadata=doc.metadata,
            ))
        return results


def build_funcao_text(f) -> str:
    """Constroi texto de embedding para uma FuncaoMaker."""
    parts = [f.nome_real, f.nome_amigavel, f.categoria]
    if f.descricao:
        parts.append(f.descricao)
    if f.assinatura:
        parts.append(f.assinatura)
    if f.parametros:
        parts.append(f.parametros)
    if f.retorno:
        parts.append(f"Retorno: {f.retorno}")
    return " | ".join(parts)


def build_regra_text(r: dict) -> str:
    """Constroi texto de embedding para uma regra real."""
    parts = [r.get("nome", "")]
    if r.get("descricao"):
        parts.append(r["descricao"])
    if r.get("categoria"):
        parts.append(r["categoria"])
    funcoes = r.get("funcoes", [])
    if funcoes:
        uniq = sorted(set(funcoes))
        parts.append("Funcoes: " + ", ".join(uniq))
    return " | ".join(parts)


def build_manual_text(titulo: str, conteudo: str) -> str:
    """Constroi texto de embedding para uma pagina do manual."""
    truncated = conteudo[:_MAX_MANUAL_CHARS] if len(conteudo) > _MAX_MANUAL_CHARS else conteudo
    return f"{titulo} | {truncated}"


def chunk_manual_page(titulo: str, conteudo: str, caminho: str, categoria: str) -> list[tuple[str, dict]]:
    """Divide pagina grande em chunks menores com overlap para melhor embedding.

    Retorna lista de (texto_embedding, metadata).
    Paginas pequenas (<= _CHUNK_SIZE) retornam um unico chunk.
    """
    if len(conteudo) <= _CHUNK_SIZE:
        return [(build_manual_text(titulo, conteudo),
                 {"titulo": titulo, "caminho": caminho, "categoria": categoria, "chunk": 0})]

    chunks = []
    i = 0
    chunk_idx = 0
    while i < len(conteudo):
        end = i + _CHUNK_SIZE

        if end < len(conteudo):
            nl_pos = conteudo.rfind("\n", i, end)
            if nl_pos > i + _CHUNK_SIZE // 2:
                end = nl_pos + 1

        chunk_text = conteudo[i:end]
        text = f"{titulo} (parte {chunk_idx + 1}) | {chunk_text}"
        meta = {"titulo": titulo, "caminho": caminho, "categoria": categoria, "chunk": chunk_idx}
        chunks.append((text, meta))

        i = end - _CHUNK_OVERLAP if end < len(conteudo) else end
        chunk_idx += 1

    return chunks

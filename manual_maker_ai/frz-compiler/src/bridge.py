"""Bridge Python → frz-compiler (Rust binary).

Substitui FrzBuilder.write() por uma chamada ao binario compilado.
Mantém compatibilidade total com a API existente.

Uso:
    from frz_compiler.bridge import compile_frz

    result = compile_frz(spec_dict, output_path="/tmp/saida.frz")
    print(result["caminho"])
"""

from __future__ import annotations

import json
import os
import platform
import shutil
import subprocess
import sys
from pathlib import Path


def _find_binary() -> str:
    """Localiza o binario frz-compiler no sistema."""
    candidates = [
        os.environ.get("FRZ_COMPILER_PATH", ""),
        str(Path(__file__).parent / "target" / "release" / "frz-compiler"),
        shutil.which("frz-compiler") or "",
    ]

    system = platform.system().lower()
    if system == "windows":
        candidates.append(
            str(Path(__file__).parent / "target" / "release" / "frz-compiler.exe")
        )

    for path in candidates:
        if path and os.path.isfile(path) and os.access(path, os.X_OK):
            return path

    raise FileNotFoundError(
        "Binario frz-compiler nao encontrado. "
        "Instale com: cd frz-compiler && cargo build --release"
    )


def compile_frz(
    spec: dict,
    output_path: str,
    binary_path: str | None = None,
    timeout: float = 30.0,
) -> dict:
    """Compila spec JSON para .frz usando o binario Rust.

    Args:
        spec: Dicionario com a especificacao FRZ (regras, formularios, tabelas).
        output_path: Caminho do arquivo .frz de saida.
        binary_path: Caminho explicito para o binario (opcional).
        timeout: Timeout em segundos (padrao: 30s).

    Returns:
        Dicionario com o report da compilacao.

    Raises:
        FileNotFoundError: Se o binario nao for encontrado.
        RuntimeError: Se a compilacao falhar.
        TimeoutError: Se exceder o timeout.
    """
    binary = binary_path or _find_binary()
    json_input = json.dumps(spec, ensure_ascii=False)

    try:
        result = subprocess.run(
            [binary, "--output", output_path],
            input=json_input.encode("utf-8"),
            capture_output=True,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired as e:
        raise TimeoutError(
            f"frz-compiler excedeu timeout de {timeout}s"
        ) from e

    if result.returncode != 0:
        stderr = result.stderr.decode("utf-8", errors="replace")
        try:
            error_data = json.loads(stderr)
            msg = error_data.get("erro", stderr)
        except json.JSONDecodeError:
            msg = stderr
        raise RuntimeError(f"frz-compiler falhou: {msg}")

    return json.loads(result.stdout.decode("utf-8"))


def is_available() -> bool:
    """Verifica se o binario esta disponivel."""
    try:
        _find_binary()
        return True
    except FileNotFoundError:
        return False

"""Funcoes puras de encoding/escaping para geracao de FRZ.

Converte strings Python para os formatos exigidos pelo Maker:
- Delphi string notation (DFM)
- Base64 com CRLF (REG_INTERFACE / REG_SCRIPT)
- XML entity encoding (atributos e conteudo)
- Gzip com header VERSAO (arquivo .frz)
"""

from __future__ import annotations

import base64
import os
import struct
import time
import zlib

# Mapa de caracteres acentuados ISO-8859-1 para codigo Delphi #NNN
_DELPHI_CHAR_MAP: dict[str, str] = {
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
    "'": "#39",
}


def to_delphi_string(text: str, max_line: int = 70) -> str:
    """Converte string Python para notacao Delphi com quebra de linha.

    Caracteres acentuados viram #NNN, aspas simples viram #39,
    e linhas longas sao quebradas com concatenacao ' + '.
    """
    segments: list[str] = []
    current = ""

    for ch in text:
        delphi_code = _DELPHI_CHAR_MAP.get(ch)
        if delphi_code:
            if current:
                segments.append(f"'{current}'")
                current = ""
            segments.append(delphi_code)
        else:
            current += ch

    if current:
        segments.append(f"'{current}'")

    raw = "".join(segments)

    if len(raw) <= max_line:
        return raw

    lines: list[str] = []
    while raw:
        if len(raw) <= max_line:
            lines.append(raw)
            break
        cut = max_line
        safe = raw.rfind("'", 0, cut)
        if safe > 10:
            cut = safe + 1
        lines.append(raw[:cut])
        raw = raw[cut:]

    indent = "    "
    return lines[0] + "\n" + ("\n".join(f"{indent}{line}" for line in lines[1:]))


def to_delphi_crlf_string(xml_content: str) -> str:
    """Converte XML para notacao Delphi com #13#10 para CRLF.

    Usado nas properties Expression e DiagramXml do DFM, onde cada
    newline do XML e representado como '#13#10' no string Delphi.
    """
    lines = xml_content.replace("\r\n", "\n").split("\n")
    parts: list[str] = []
    for i, line in enumerate(lines):
        escaped = _escape_delphi_chars(line)
        if escaped:
            parts.append(f"'{escaped}'")
        if i < len(lines) - 1:
            parts.append("#13#10")
    return "".join(parts)


def _escape_delphi_chars(text: str) -> str:
    """Escapa caracteres especiais dentro de um segmento de string Delphi."""
    result: list[str] = []
    for ch in text:
        delphi_code = _DELPHI_CHAR_MAP.get(ch)
        if delphi_code:
            result.append(f"'{delphi_code}'")
        else:
            result.append(ch)
    return "".join(result)


def encode_dfm_b64(text: str) -> str:
    """Codifica DFM em base64 com line endings CRLF."""
    crlf = text.replace("\r\n", "\n").replace("\n", "\r\n")
    data = crlf.encode("iso-8859-1")
    return base64.b64encode(data).decode("ascii")


def encode_script_b64(text: str) -> str:
    """Codifica Script XML em base64 com line endings CRLF."""
    crlf = text.replace("\r\n", "\n").replace("\n", "\r\n")
    data = crlf.encode("iso-8859-1")
    return base64.b64encode(data).decode("ascii")


def xml_escape_attr(text: str) -> str:
    """Escapa texto para uso em atributos XML do FRZ (REG_NOME, etc.)."""
    out: list[str] = []
    for ch in text:
        cp = ord(ch)
        if ch == " ":
            out.append("&#x0020;")
        elif ch == ",":
            out.append("&#x002C;")
        elif ch == ";":
            out.append("&#x003B;")
        elif ch == "=":
            out.append("&#x003D;")
        elif ch == "{":
            out.append("&#x007B;")
        elif ch == "}":
            out.append("&#x007D;")
        elif ch == '"':
            out.append("&#x0022;")
        elif ch == "'":
            out.append("&#x0027;")
        elif ch == "\r":
            out.append("&#x000D;")
        elif ch == "\n":
            out.append("&#x000A;")
        elif cp > 127:
            out.append(f"&#x{cp:04X};")
        else:
            out.append(ch)
    return "".join(out)


def xml_escape_content(text: str) -> str:
    """Escapa texto para conteudo de elementos XML."""
    return (
        text
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )


def xml_space(text: str) -> str:
    """Substitui espacos por &#x20; em conteudo de atributos XML inline (Expression)."""
    return text.replace(" ", "&#x20;")


def write_frz(xml_bytes: bytes, output_path: str) -> str:
    """Grava arquivo FRZ (gzip com header FNAME='VERSAO')."""
    mtime = int(time.time())
    header = b"\x1f\x8b\x08\x08"
    header += struct.pack("<I", mtime)
    header += b"\x00\x00"
    header += b"VERSAO\x00"

    cobj = zlib.compressobj(6, zlib.DEFLATED, -zlib.MAX_WBITS)
    compressed = cobj.compress(xml_bytes) + cobj.flush()

    crc = zlib.crc32(xml_bytes) & 0xFFFFFFFF
    size = len(xml_bytes) & 0xFFFFFFFF

    os.makedirs(os.path.dirname(os.path.abspath(output_path)), exist_ok=True)

    with open(output_path, "wb") as f:
        f.write(header)
        f.write(compressed)
        f.write(struct.pack("<I", crc))
        f.write(struct.pack("<I", size))

    return output_path

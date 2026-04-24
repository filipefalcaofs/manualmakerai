//! Funcoes puras de encoding para geracao de FRZ.
//!
//! Todas as funcoes sao zero-allocation onde possivel,
//! operam sobre &str/&[u8] e retornam String/Vec<u8>.

use base64::Engine;
use flate2::write::DeflateEncoder;
use flate2::Compression;
use std::io::Write;

/// Mapa de caracteres acentuados ISO-8859-1 para codigo Delphi #NNN.
/// Lookup por array indexado pelo codepoint (O(1) vs HashMap O(1) amortizado).
const fn delphi_code(ch: char) -> Option<&'static str> {
    match ch {
        'á' => Some("#225"), 'à' => Some("#224"), 'â' => Some("#226"), 'ã' => Some("#227"),
        'é' => Some("#233"), 'è' => Some("#232"), 'ê' => Some("#234"),
        'í' => Some("#237"), 'ì' => Some("#236"),
        'ó' => Some("#243"), 'ò' => Some("#242"), 'ô' => Some("#244"), 'õ' => Some("#245"),
        'ú' => Some("#250"), 'ù' => Some("#249"), 'û' => Some("#251"),
        'ç' => Some("#231"), 'Ç' => Some("#199"),
        'Á' => Some("#193"), 'À' => Some("#192"), 'Â' => Some("#194"), 'Ã' => Some("#195"),
        'É' => Some("#201"), 'È' => Some("#200"), 'Ê' => Some("#202"),
        'Í' => Some("#205"), 'Ì' => Some("#204"),
        'Ó' => Some("#211"), 'Ò' => Some("#210"), 'Ô' => Some("#212"), 'Õ' => Some("#213"),
        'Ú' => Some("#218"), 'Ù' => Some("#217"), 'Û' => Some("#219"),
        'ñ' => Some("#241"), 'Ñ' => Some("#209"),
        'ü' => Some("#252"), 'Ü' => Some("#220"),
        '\'' => Some("#39"),
        _ => None,
    }
}

/// Converte texto para valor de property DFM (com #NNN para acentos).
pub fn to_delphi_prop(text: &str) -> String {
    if text.is_empty() {
        return "''".into();
    }

    let mut result = String::with_capacity(text.len() * 2);
    let mut in_str = false;

    for ch in text.chars() {
        if let Some(code) = delphi_code(ch) {
            if in_str {
                result.push('\'');
                in_str = false;
            }
            result.push_str(code);
        } else {
            if !in_str {
                result.push('\'');
                in_str = true;
            }
            result.push(ch);
        }
    }

    if in_str {
        result.push('\'');
    }

    if result.len() > 70 {
        rewrap_delphi(&result, 68)
    } else {
        result
    }
}

/// Re-quebra string Delphi em linhas de ~max_line caracteres.
///
/// Reproduz o comportamento do serializador DFM do Maker:
/// fecha aspas com `' +\n      '` e reabre na proxima linha.
///
/// Implementacao com slicing: sem loop char-a-char,
/// opera sobre fatias UTF-8 validadas.
pub fn rewrap_delphi(s: &str, max_line: usize) -> String {
    if s.len() <= max_line {
        return s.into();
    }

    let mut out = String::with_capacity(s.len() + s.len() / max_line * 10);
    let mut line_len: usize = 0;
    let mut in_str = false;
    let chars: Vec<char> = s.chars().collect();
    let mut i = 0;

    while i < chars.len() {
        let ch = chars[i];

        match ch {
            '\'' if !in_str => {
                if line_len >= max_line {
                    out.push_str(" +\n      ");
                    line_len = 0;
                }
                out.push('\'');
                line_len += 1;
                in_str = true;
                i += 1;
            }

            '\'' if in_str => {
                if i + 1 < chars.len() && chars[i + 1] == '\'' {
                    out.push_str("''");
                    line_len += 2;
                    i += 2;
                } else {
                    out.push('\'');
                    line_len += 1;
                    in_str = false;
                    i += 1;
                    if line_len >= max_line && i < chars.len() {
                        out.push_str(" +\n      ");
                        line_len = 0;
                    }
                }
            }

            '#' if !in_str => {
                let start = i;
                i += 1;
                while i < chars.len() && chars[i].is_ascii_digit() {
                    i += 1;
                }
                let token: String = chars[start..i].iter().collect();
                if line_len + token.len() > max_line && line_len > 0 {
                    out.push_str(" +\n      ");
                    line_len = 0;
                }
                out.push_str(&token);
                line_len += token.len();
            }

            _ if in_str => {
                out.push(ch);
                line_len += 1;
                i += 1;
                if line_len >= max_line && i < chars.len() && chars[i] != '\'' {
                    out.push('\'');
                    out.push_str(" +\n      ");
                    out.push('\'');
                    line_len = 1;
                }
            }

            _ => {
                i += 1;
            }
        }
    }

    out
}

/// Converte XML multiline em string Delphi com #13#10 para CRLF.
pub fn delphi_inline(xml: &str) -> String {
    let lines: Vec<&str> = xml.lines().collect();
    let mut segments = Vec::with_capacity(lines.len() * 2);

    for (i, line) in lines.iter().enumerate() {
        let encoded = encode_delphi_inline(line);
        if encoded.is_empty() {
            segments.push("''".into());
        } else {
            segments.push(format!("'{}'", encoded));
        }
        if i < lines.len() - 1 {
            segments.push("#13#10".into());
        }
    }

    let flat: String = segments.join("");
    rewrap_delphi(&flat, 68)
}

fn encode_delphi_inline(text: &str) -> String {
    let mut result = String::with_capacity(text.len() * 2);
    for ch in text.chars() {
        if let Some(code) = delphi_code(ch) {
            if ch == '\'' {
                result.push_str("'#39'");
            } else {
                result.push('\'');
                result.push_str(code);
                result.push('\'');
            }
        } else {
            result.push(ch);
        }
    }
    result
}

/// Escapa texto para atributos XML do FRZ.
pub fn xml_escape_attr(text: &str) -> String {
    let mut out = String::with_capacity(text.len() * 2);
    for ch in text.chars() {
        match ch {
            ' '  => out.push_str("&#x0020;"),
            ','  => out.push_str("&#x002C;"),
            ';'  => out.push_str("&#x003B;"),
            '='  => out.push_str("&#x003D;"),
            '{'  => out.push_str("&#x007B;"),
            '}'  => out.push_str("&#x007D;"),
            '"'  => out.push_str("&#x0022;"),
            '\'' => out.push_str("&#x0027;"),
            '\r' => out.push_str("&#x000D;"),
            '\n' => out.push_str("&#x000A;"),
            c if (c as u32) > 127 => {
                out.push_str(&format!("&#x{:04X};", c as u32));
            }
            c => out.push(c),
        }
    }
    out
}

/// Escapa texto para conteudo de elementos XML.
pub fn xml_escape_content(text: &str) -> String {
    text.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// Substitui espacos por &#x20; em nomes de funcoes.
pub fn xml_space(text: &str) -> String {
    text.replace(' ', "&#x20;")
}

/// Codifica texto DFM em base64 com CRLF.
pub fn encode_dfm_b64(text: &str) -> String {
    let crlf = text.replace("\r\n", "\n").replace('\n', "\r\n");
    let bytes = encode_iso8859_1(&crlf);
    base64::engine::general_purpose::STANDARD.encode(&bytes)
}

/// Codifica Script XML em base64 com CRLF.
pub fn encode_script_b64(text: &str) -> String {
    encode_dfm_b64(text)
}

/// Converte string UTF-8 para bytes ISO-8859-1.
fn encode_iso8859_1(text: &str) -> Vec<u8> {
    text.chars().map(|c| {
        let cp = c as u32;
        if cp <= 255 { cp as u8 } else { b'?' }
    }).collect()
}

/// Grava arquivo FRZ (gzip com header FNAME='VERSAO').
pub fn write_frz(xml_bytes: &[u8], output_path: &str) -> std::io::Result<()> {
    use std::time::{SystemTime, UNIX_EPOCH};

    let mtime = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_secs() as u32;

    // Header gzip manual: ID1 ID2 CM FLG MTIME XFL OS FNAME
    let mut header = Vec::with_capacity(20);
    header.extend_from_slice(&[0x1f, 0x8b, 0x08, 0x08]); // magic + DEFLATE + FNAME flag
    header.extend_from_slice(&mtime.to_le_bytes());
    header.extend_from_slice(&[0x00, 0x00]); // XFL=0, OS=0
    header.extend_from_slice(b"VERSAO\0");

    // Deflate com nivel 6 (equilibrio velocidade/compressao)
    let mut encoder = DeflateEncoder::new(Vec::new(), Compression::new(6));
    encoder.write_all(xml_bytes)?;
    let compressed = encoder.finish()?;

    let crc = crc32(xml_bytes);
    let size = xml_bytes.len() as u32;

    if let Some(parent) = std::path::Path::new(output_path).parent() {
        std::fs::create_dir_all(parent)?;
    }

    let mut file = std::fs::File::create(output_path)?;
    file.write_all(&header)?;
    file.write_all(&compressed)?;
    file.write_all(&crc.to_le_bytes())?;
    file.write_all(&size.to_le_bytes())?;

    Ok(())
}

/// CRC32 compativel com gzip (IEEE).
fn crc32(data: &[u8]) -> u32 {
    let mut crc: u32 = 0xFFFF_FFFF;
    for &byte in data {
        crc ^= byte as u32;
        for _ in 0..8 {
            if crc & 1 != 0 {
                crc = (crc >> 1) ^ 0xEDB8_8320;
            } else {
                crc >>= 1;
            }
        }
    }
    !crc
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_delphi_prop_simple() {
        assert_eq!(to_delphi_prop("hello"), "'hello'");
    }

    #[test]
    fn test_delphi_prop_accented() {
        assert_eq!(to_delphi_prop("ação"), "'a'#231#227'o'");
        assert_eq!(to_delphi_prop("áção"), "#225#231#227'o'");
    }

    #[test]
    fn test_delphi_prop_empty() {
        assert_eq!(to_delphi_prop(""), "''");
    }

    #[test]
    fn test_xml_escape_attr() {
        assert_eq!(xml_escape_attr("a b"), "a&#x0020;b");
        assert_eq!(xml_escape_attr("á"), "&#x00E1;");
    }

    #[test]
    fn test_xml_escape_content() {
        assert_eq!(xml_escape_content("<a>&b"), "&lt;a&gt;&amp;b");
    }

    #[test]
    fn test_rewrap_short() {
        let s = "'abc'";
        assert_eq!(rewrap_delphi(s, 68), "'abc'");
    }

    #[test]
    fn test_crc32() {
        assert_eq!(crc32(b""), 0x0000_0000);
        assert_eq!(crc32(b"123456789"), 0xCBF4_3926);
    }
}

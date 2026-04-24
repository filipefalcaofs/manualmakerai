//! CLI do compilador FRZ.
//!
//! Uso:
//!   echo '{"regras": [...]}' | frz-compiler --output saida.frz
//!   frz-compiler --input spec.json --output saida.frz
//!
//! O binario le a spec JSON de stdin (ou arquivo) e grava o .frz.
//! Retorna JSON no stdout com o report da compilacao.
//! Exit code 0 = sucesso, 1 = erro.

use clap::Parser;
use std::io::Read;

#[derive(Parser)]
#[command(name = "frz-compiler")]
#[command(about = "Compilador deterministico de specs JSON para FRZ (Maker/WebRun)")]
#[command(version)]
struct Cli {
    /// Caminho do arquivo de saida .frz
    #[arg(short, long)]
    output: String,

    /// Arquivo JSON de entrada (se omitido, le de stdin)
    #[arg(short, long)]
    input: Option<String>,
}

fn main() {
    let cli = Cli::parse();

    let json_input = match cli.input {
        Some(ref path) => {
            std::fs::read_to_string(path).unwrap_or_else(|e| {
                eprintln!("Erro ao ler arquivo {path}: {e}");
                std::process::exit(1);
            })
        }
        None => {
            let mut buf = String::new();
            std::io::stdin().read_to_string(&mut buf).unwrap_or_else(|e| {
                eprintln!("Erro ao ler stdin: {e}");
                std::process::exit(1);
            });
            buf
        }
    };

    match frz_compiler::compile(&json_input, &cli.output) {
        Ok(result) => {
            let report = serde_json::json!({
                "sucesso": true,
                "caminho": result.path,
                "xml_tamanho": result.xml_size,
                "funcoes": result.functions,
                "regras": result.rules,
                "formularios": result.forms,
                "tabelas": result.tables,
                "entidades": result.entities,
                "dados": result.datapackets,
            });
            println!("{}", serde_json::to_string_pretty(&report).unwrap());
        }
        Err(e) => {
            let report = serde_json::json!({
                "sucesso": false,
                "erro": e,
            });
            eprintln!("{}", serde_json::to_string_pretty(&report).unwrap());
            std::process::exit(1);
        }
    }
}

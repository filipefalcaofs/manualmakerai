//! frz-compiler — Compilador deterministico de specs JSON para FRZ.
//!
//! Ponto de entrada da biblioteca. Expoe a funcao `compile` que aceita
//! JSON de stdin e grava o .frz no caminho especificado.

pub mod builder;
pub mod dfm;
pub mod encoder;
pub mod script;
pub mod spec;

use spec::FrzSpec;

/// Compila spec JSON para arquivo FRZ.
///
/// Entrada: JSON UTF-8 conforme esquema FrzSpec.
/// Saida: arquivo .frz no path indicado + report em JSON para stdout.
pub fn compile(json_input: &str, output_path: &str) -> Result<CompileResult, String> {
    let spec: FrzSpec = serde_json::from_str(json_input)
        .map_err(|e| format!("JSON invalido: {e}"))?;

    validate_spec(&spec)?;

    let report = builder::compile_frz(&spec, output_path)?;

    Ok(CompileResult {
        path: report.path,
        xml_size: report.xml_size,
        rules: report.rules,
        functions: report.functions,
        forms: report.forms,
        tables: report.tables,
        entities: report.entities,
        datapackets: report.datapackets,
    })
}

/// Resultado da compilacao (serializado para stdout).
#[derive(Debug)]
pub struct CompileResult {
    pub path: String,
    pub xml_size: usize,
    pub rules: Vec<String>,
    pub functions: Vec<String>,
    pub forms: Vec<String>,
    pub tables: Vec<String>,
    pub entities: Vec<String>,
    pub datapackets: Vec<String>,
}

/// Validacao estrutural da spec antes da compilacao.
fn validate_spec(spec: &FrzSpec) -> Result<(), String> {
    for rule in &spec.regras {
        if rule.nome.is_empty() {
            return Err("Regra sem nome".into());
        }
        if rule.destino != 1 && rule.destino != 2 {
            return Err(format!(
                "Regra '{}': destino deve ser 1 (Cliente) ou 2 (Servidor), recebeu {}",
                rule.nome, rule.destino
            ));
        }
    }

    for form in spec.all_forms() {
        if form.descricao.is_empty() {
            return Err("Formulario sem descricao".into());
        }
    }

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_compile_minimal_rule() {
        let json = r#"{
            "regras": [{
                "nome": "Teste",
                "destino": 2,
                "codigo": 99,
                "parametros": [],
                "variaveis": [{"nome": "v1", "tipo": "Letras", "tamanho": ""}],
                "passos": [{
                    "tipo": "expressao",
                    "nome": "step1",
                    "descricao": "Passo 1",
                    "funcao": "ebfConcat",
                    "nome_amigavel": "Concatenacao",
                    "params": [
                        {"tipo": "constante", "valor": "A", "tipo_dado": "Letras"},
                        {"tipo": "constante", "valor": "B", "tipo_dado": "Letras"}
                    ],
                    "retorno": "v1",
                    "tipo_retorno": "Letras"
                }]
            }]
        }"#;

        let dir = std::env::temp_dir();
        let output = dir.join("test_minimal.frz");
        let result = compile(json, output.to_str().unwrap());
        assert!(result.is_ok(), "Falha: {:?}", result.err());

        let report = result.unwrap();
        assert_eq!(report.rules.len(), 1);
        assert!(std::path::Path::new(&report.path).exists());
    }

    #[test]
    fn test_compile_form() {
        let json = r#"{
            "formulario": {
                "descricao": "Cadastro Teste",
                "tabela": "TESTE",
                "campo_chave": "id",
                "sql_select": "SELECT * FROM TESTE WHERE id = :id",
                "codigo": 9000,
                "sistema": "TST",
                "campos": [
                    {"nome": "edtNome", "tipo": "E", "campo": "nome", "descricao": "Nome"}
                ]
            }
        }"#;

        let dir = std::env::temp_dir();
        let output = dir.join("test_form.frz");
        let result = compile(json, output.to_str().unwrap());
        assert!(result.is_ok());
        assert_eq!(result.unwrap().forms.len(), 1);
    }

    #[test]
    fn test_invalid_destino() {
        let json = r#"{"regras": [{"nome": "Bad", "destino": 5, "codigo": 1, "passos": []}]}"#;
        let result = compile(json, "/tmp/bad.frz");
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("destino"));
    }

    #[test]
    fn test_invalid_json() {
        let result = compile("not json", "/tmp/bad.frz");
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("JSON invalido"));
    }

    #[test]
    fn test_compile_entity_and_data() {
        let json = r#"{
            "entidades": [{
                "nome": "TEST_TABLE",
                "form": "test_table",
                "atributos": [
                    {"nome": "ID", "tipo": "integer", "tamanho": 32, "nullable": false, "generated": true},
                    {"nome": "NOME", "tipo": "string", "tamanho": 100, "nullable": false},
                    {"nome": "ATIVO", "tipo": "boolean", "nullable": false, "default": "true"}
                ],
                "chaves": [{"nome": "TEST_TABLE_PKEY", "colunas": ["ID"], "primary": true}]
            }],
            "dados": [{
                "entity_name": "TEST_TABLE",
                "linhas": [
                    {"ID": "1", "NOME": "Primeiro", "ATIVO": "-1"},
                    {"ID": "2", "NOME": "Segundo", "ATIVO": "0"}
                ]
            }]
        }"#;

        let dir = std::env::temp_dir();
        let output = dir.join("test_entity.frz");
        let result = compile(json, output.to_str().unwrap());
        assert!(result.is_ok(), "Falha: {:?}", result.err());

        let report = result.unwrap();
        assert_eq!(report.entities.len(), 1);
        assert_eq!(report.datapackets.len(), 1);
        assert!(report.entities[0].contains("TEST_TABLE"));
        assert!(report.datapackets[0].contains("2 linhas"));
        assert!(std::path::Path::new(&report.path).exists());
    }
}

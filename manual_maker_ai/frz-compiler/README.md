# frz-compiler

Compilador deterministico de specs JSON para arquivos FRZ (Maker/WebRun).

Recebe uma especificacao JSON via stdin e produz um arquivo `.frz` pronto para importar no Maker.

## Instalacao

### Via setup.sh (recomendado)

```bash
cd manual_maker_ai
./setup.sh
```

O script detecta a plataforma, compila ou baixa o binario, e configura o ambiente Python.

### Build manual

Requer Rust 1.70+:

```bash
cd frz-compiler
cargo build --release
```

Binario em `target/release/frz-compiler` (~800KB).

### Via Makefile

```bash
make build      # Compila release
make test       # Roda testes
make install    # Copia para mcp_maker/bin/
make bench      # Benchmark rapido
```

## Uso

### CLI

```bash
echo '{"regras": [...]}' | frz-compiler --output saida.frz
cat spec.json | frz-compiler --output saida.frz
frz-compiler --input spec.json --output saida.frz
```

### Formato de entrada

```json
{
  "regras": [
    {
      "nome": "Validar CPF",
      "destino": 2,
      "codigo": 101,
      "parametros": [{"nome": "pCPF", "tipo": "Letras"}],
      "variaveis": [{"nome": "vResult", "tipo": "Letras"}],
      "passos": [
        {
          "tipo": "expressao",
          "nome": "concat1",
          "descricao": "Formatar",
          "funcao": "ebfConcat",
          "nome_amigavel": "Concatenacao",
          "params": [
            {"tipo": "constante", "valor": "CPF: ", "tipo_dado": "Letras"},
            {"tipo": "variavel", "nome": "pCPF"}
          ],
          "retorno": "vResult",
          "tipo_retorno": "Letras"
        }
      ]
    }
  ],
  "formulario": {
    "descricao": "Cadastro",
    "tabela": "PESSOA",
    "campo_chave": "ID",
    "sql_select": "SELECT * FROM PESSOA WHERE ID = :ID",
    "codigo": 5000,
    "sistema": "GER",
    "campos": [
      {
        "nome": "edtNome",
        "tipo": "E",
        "campo": "NOME",
        "descricao": "Nome"
      }
    ]
  }
}
```

### Saida

O compilador imprime um JSON com o relatorio:

```json
{
  "caminho": "saida.frz",
  "tamanho_xml": 15234,
  "tamanho_frz": 2100,
  "regras": ["Validar CPF [Servidor] (cod=101, 1 params, 1 passos)"],
  "formularios": ["Cadastro [CRUD] (1 campos, 1100x700)"]
}
```

### Integracao com MCP

O MCP server Python detecta o binario automaticamente e o usa como backend.
Locais verificados (em ordem):

1. `$FRZ_COMPILER_PATH` (variavel de ambiente)
2. `../frz-compiler/target/release/frz-compiler` (build local)
3. `mcp_maker/bin/frz-compiler` (instalado via setup.sh)
4. `frz-compiler` no PATH do sistema

Se nenhum binario for encontrado, o Python usa seu proprio builder como fallback.

## Tipos de passos

| Tipo | Campos obrigatorios |
|------|-------------------|
| `expressao` | nome, funcao, nome_amigavel, params, retorno, tipo_retorno |
| `decisao` | nome, funcao, nome_amigavel, params, sim, nao |
| `subrotina` | nome, rule_name, rule_id, params, return_var |
| `atividade` | nome, activity_id, object_name, real_name, params |

## Tipos de parametros

| Tipo | Campos |
|------|--------|
| `constante` | valor, tipo_dado |
| `variavel` | nome |
| `sql` | sql, binds: [{nome, variavel}] |
| `funcao` | funcao, nome_amigavel, params, tipo_retorno |

## Testes

```bash
cargo test
```

11 testes cobrindo: encoding Delphi, XML escaping, CRC32, compilacao de regras e formularios.

## Arquitetura

```
spec.rs     Modelos Serde (FrzSpec, RuleSpec, Step, FormSpec)
encoder.rs  Encoding: Delphi strings, XML escape, Base64, gzip
dfm.rs      Gerador DFM (layout visual do fluxograma)
script.rs   Gerador Script XML (logica executavel)
builder.rs  Orquestrador: spec -> XML -> FRZ
lib.rs      API publica: compile(json, output_path)
main.rs     CLI: stdin/file -> frz-compiler -> .frz
```

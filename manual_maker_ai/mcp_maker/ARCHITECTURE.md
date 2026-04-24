# Arquitetura do Motor FRZ — Code Review e Plano de Migracao

## 1. Diagnostico do Motor Atual (Python)

### 1.1 Inventario

| Arquivo | Funcoes/Metodos | LOC | Responsabilidade |
|---------|-----------------|-----|-----------------|
| encoder.py | 9 | 193 | Encoding Delphi, base64, gzip, XML escape |
| builder.py | 58 | 1890 | Dataclasses (17), RuleBuilder, FormBuilder, FrzBuilder |
| server.py | 28 | 988 | MCP FastMCP, 14 tools, indice funcoes, parsing |
| parser.py | 31 | 534 | Parser de .md para FuncaoMaker, KB completa |
| models.py | 6 | 129 | Dataclasses (7) para dominio |
| **Total** | **132** | **3734** | |

### 1.2 Performance Medida (Apple Silicon)

| Operacao | Tempo | Observacao |
|----------|-------|------------|
| Import modulos | 341ms | One-time, inclui parse de 47 .md |
| Indice 1186 funcoes | 49ms | 2.4MB memoria |
| Indice 2371 regras reais | 30ms | JSON 2MB |
| 1 regra complexa (11 steps) | 14.9ms | DFM=35K chars, Script=4K chars |
| 50 regras (5 steps cada) | 541ms | XML=1.5MB |
| Gzip write (1.5MB → 19KB) | 545ms | Nivel 9, taxa 97% |
| Form 100 campos | 3ms | 81KB XML |
| `_rewrap_delphi` (5K chars) | 10.8ms | **HOT PATH** |
| `_delphi_inline` (XML) | 0.05ms | Aceitavel |
| `xml_escape_attr` | 0.009ms | Aceitavel |
| Tool call consulta | 0.03-0.1ms | Cache eficiente |

### 1.3 Problemas Identificados

#### CRITICO: Token Burn (consumo de tokens LLM)
O maior custo nao e CPU — e o LLM gastando 1000-5000 tokens por regra compondo JSON spec.
Para gerar a folha CLT (7 regras, ~50 passos), o LLM gastou ~15K tokens so no JSON.
O motor e rapido, mas o LLM e lento e caro para chegar ate ele.

#### ALTO: `_rewrap_delphi` — O(n) com branching excessivo
```
while i < len(s):       # loop char-a-char
    if ch == "'" ...    # 6 branches condicionais
    if in_str ...       # state machine manual
    if ch == "#" ...    # token scanning
```
10.8ms para 5K chars. Em regras grandes (menu com 50 expressoes), cada componente
DFM chama esta funcao ~3x (Expression, DiagramXml, Description).
50 componentes x 3 x 10ms = 1.5s so neste ponto.

#### ALTO: Gzip nivel 9
545ms para comprimir 1.5MB. Nivel 6 daria resultado similar em ~250ms.

#### MEDIO: Concatenacao quadratica em `_script_param_xml`
```python
binds += (...)  # string concat em loop — O(n^2)
```
Impacto real: baixo (poucos binds por regra), mas viola boas praticas.

#### MEDIO: MakerKnowledgeBase nao utilizada
`parser.py` define `MakerKnowledgeBase` com 534 LOC, mas `server.py` usa apenas
`parse_todas_funcoes` e um `_FuncIndex` customizado. O restante e codigo morto.

#### BAIXO: Sem validacao de tipos em runtime
Dataclasses aceitam qualquer valor. Um `ParamVariable(nome=123)` passa silenciosamente.

---

## 2. Avaliacao de Linguagens

### 2.1 Criterios

| Criterio | Peso | Python | Rust | Go | C++ |
|----------|------|--------|------|----|-----|
| Performance raw (string ops) | 20% | 3 | 10 | 7 | 10 |
| Distribuicao binaria | 20% | 2 | 10 | 9 | 7 |
| Seguranca de tipos | 15% | 3 | 10 | 8 | 6 |
| Ecossistema MCP | 15% | 10 | 7 | 5 | 3 |
| Produtividade de dev | 15% | 10 | 5 | 7 | 3 |
| Cross-compilation | 10% | 4 | 9 | 10 | 5 |
| WASM target | 5% | 3 | 10 | 7 | 5 |
| **Score ponderado** | | **5.2** | **8.5** | **7.3** | **5.5** |

### 2.2 Justificativa: Rust

**Rust vence por margens decisivas em 3 criterios que importam para este caso:**

1. **Distribuicao binaria (10/10)**: Um unico executavel `frz-compiler` que funciona em qualquer
   maquina sem Python, venv, pip, ou dependencias. `cargo build --release --target x86_64-unknown-linux-musl`
   produz um binario estatico de ~5MB.

2. **Performance em string processing (10/10)**: `_rewrap_delphi` e uma maquina de estados
   sobre caracteres — exatamente o que Rust faz melhor. O pattern matching do Rust elimina
   os 6 branches `if/elif` com um `match` exaustivo que compila para jump table.

3. **Seguranca de tipos (10/10)**: Enums algebraicos com `serde` para deserializacao
   de JSON garantem que specs malformadas sao rejeitadas em tempo de parse, nao em
   runtime no meio da geracao.

**Go ficou em segundo** por ser mais simples mas sem pattern matching, enums algebraicos,
ou zero-cost abstractions. Para um "compilador" (que e o que o motor FRZ e), Rust e a
escolha natural.

---

## 3. Arquitetura Proposta

### 3.1 Diagrama

```
┌─────────────────────────────────────────────────────┐
│                     LLM (Claude)                     │
│  "Crie um CRUD de Pessoa com validacao de CPF"      │
└──────────────────────┬──────────────────────────────┘
                       │ MCP tool call
                       ▼
┌─────────────────────────────────────────────────────┐
│              Python MCP Server (fino)                │
│  - Knowledge Base (funcoes, padroes, regras)         │
│  - Routing de tools                                  │
│  - Recipes de alto nivel (gerar_crud, gerar_dash)    │
│  - Validacao de funcoes contra catalogo               │
└──────────────────────┬──────────────────────────────┘
                       │ stdin JSON → stdout result
                       ▼
┌─────────────────────────────────────────────────────┐
│            frz-compiler (Rust binary)                │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐            │
│  │ DFM Gen  │ │Script Gen│ │ Encoder  │            │
│  │ (layout, │ │ (XML,    │ │ (base64, │            │
│  │  coords, │ │  actions,│ │  gzip,   │            │
│  │  delphi) │ │  params) │ │  CRLF)   │            │
│  └────┬─────┘ └────┬─────┘ └────┬─────┘            │
│       └─────────────┴────────────┘                   │
│                     │                                │
│              ┌──────┴──────┐                         │
│              │ FRZ Writer  │                         │
│              │ (XML final, │                         │
│              │  gzip+hdr)  │                         │
│              └─────────────┘                         │
└─────────────────────────────────────────────────────┘
                       │
                       ▼
                  arquivo .frz
```

### 3.2 Separacao de Responsabilidades

| Camada | Linguagem | Responsabilidade | Justificativa |
|--------|-----------|-----------------|---------------|
| MCP Server | Python | Protocol MCP, KB, validacao, recipes | FastMCP maduro, flexivel para iterar |
| FRZ Compiler | Rust | Spec JSON → .frz (deterministic) | Performance, binario unico, type-safe |
| Recipes | Python | Intent → Spec (token-free) | Proximos ao LLM, faceis de adicionar |

### 3.3 Interface entre camadas

O Python server chama o binario Rust via subprocess:

```python
import subprocess, json

result = subprocess.run(
    ["frz-compiler", "--output", output_path],
    input=json.dumps(spec).encode("utf-8"),
    capture_output=True,
)
```

O binario le JSON de stdin, escreve .frz no path indicado, retorna status em stdout.
Latencia de spawn: ~5ms. Negligivel comparado com os 14.9ms de geracao.

### 3.4 Recipes de Alto Nivel (Token-Free)

Novas tools que eliminam raciocinio do LLM:

```
gerar_crud(tabela, campos, validacoes) → .frz completo
gerar_dashboard(graficos) → .frz com template + regras SQL
gerar_login(tipo, captcha) → .frz com auth completo
gerar_kanban(colunas, status_field) → .frz com template
```

O LLM chama `gerar_crud("PESSOA", ["nome", "cpf", "email"], ["cpf_unico", "cep_viacep"])`
e recebe um .frz pronto. Zero tokens gastos em composicao de JSON.

---

## 4. Plano de Migracao

### Fase 1: Otimizar Python (CONCLUIDA)
- [x] `_rewrap_delphi`: regex tokenizer — 1080ms → 21ms (51x)
- [x] Gzip: nivel 9 → 6 — 545ms → 214ms (2.5x, ratio melhor)
- [x] Codigo morto documentado (~380 LOC preservados para KB futura)
- [x] Concat quadratica em `_script_param_xml` corrigida

### Fase 2: Rust Compiler Core (CONCLUIDA)
- [x] Cargo project `frz-compiler` (Rust 1.94.1)
- [x] Modelos Serde (spec.rs: FrzSpec, RuleSpec, Step enum, FormSpec)
- [x] DFM generator (dfm.rs: layout engine, Delphi encoding)
- [x] Script XML generator (script.rs)
- [x] Base64 + gzip encoder com header VERSAO (encoder.rs)
- [x] CLI: stdin JSON → .frz file (main.rs)
- [x] 11 testes passando, binario release 813KB

### Fase 3: Integracao Python → Rust (CONCLUIDA)
- [x] rust_bridge.py: deteccao automatica do binario
- [x] server.py: gerar_fluxo e gerar_tela_completa roteiam para Rust
- [x] Fallback transparente para Python se binario indisponivel
- [x] Testes end-to-end: ambos backends geram FRZ valido

### Fase 4: Recipes de Alto Nivel (CONCLUIDA)
- [x] `gerar_crud`: form + validacao automatica de campos obrigatorios + evento Antes de Gravar
- [x] `gerar_dashboard`: template com paineis SQL + regras de carga + eventos Ao Entrar
- [x] `gerar_login`: form de login + auth SQL + captcha opcional + ActNewErrorMessage
- [x] Instrucoes MCP atualizadas com recipes como opcao preferencial

### Fase 5: Distribuicao (CONCLUIDA)
- [x] CI/CD: GitHub Actions com matrix build (macOS ARM/x64, Linux x64, Windows x64)
- [x] setup.sh: detecta OS/arch, compila ou baixa binario, configura Python, verifica
- [x] Makefile: build, test, install, bench, clean
- [x] README.md com documentacao completa (CLI, formato JSON, integracao MCP)

---

## 5. Resultado da Fase 1 (Otimizacao Python)

Aplicadas em 31/03/2026:
- Gzip nivel 9 → 6: **545ms → 214ms** (61% mais rapido, ratio 97% → 98.5%)
- Concatenacao quadratica em `_script_param_xml`: corrigida para list comprehension
- Zero erros de lint apos mudancas

| Metrica | Original | Fase 1 (Python otimizado) |
|---------|----------|--------------------------|
| 50 regras build_xml | 541ms | 118ms |
| Gzip write (1.5MB) | 545ms | 214ms |
| Total 50 regras | 1086ms | 332ms |

---

## 6. Benchmark Real: Python Otimizado vs Rust (subprocess)

| Cenario | Python (otimizado) | Rust (via subprocess) | Speedup |
|---------|-------------------|-----------------------|---------|
| 1 regra complexa (12 passos) | 1.8ms | 3.3ms | 0.5x (*) |
| 50 regras (5 passos cada) | 34.4ms | 18.9ms | 1.8x |

(*) Para 1 regra, o spawn overhead do subprocess (~3ms) domina. Em workloads maiores, Rust escala melhor.

| Metrica | Original (Python) | Atual (Rust + Python otimizado) |
|---------|-------------------|---------------------------------|
| 50 regras total | 1086ms | 18.9ms (Rust) / 34.4ms (Python) |
| `_rewrap_delphi` 5K chars | 10.8ms | 0.21ms (51x) |
| Gzip write 1.5MB | 545ms | 214ms (2.5x) |
| Binario | Python 3.13 + venv | 813KB standalone |

## 7. Recipes de Alto Nivel (Implementadas)

3 recipes token-efficient ativas:

| Recipe | Input (~tokens) | Output | Vs gerar_tela_completa |
|--------|----------------|--------|------------------------|
| `gerar_crud` | ~200 | Form + regra validacao + eventos | ~90% menos tokens |
| `gerar_dashboard` | ~150 | Template + regras SQL + paineis | ~85% menos tokens |
| `gerar_login` | ~100 | Login + auth SQL + captcha | ~95% menos tokens |

Exemplo `gerar_crud` (toda a chamada em ~200 tokens):
```json
{
  "tabela": "PESSOA",
  "campos": [
    {"nome": "edtNome", "campo": "PES_NOME", "obrigatorio": true, "colunas": 6},
    {"nome": "edtCPF", "campo": "PES_CPF", "mascara": "CPF", "obrigatorio": true, "colunas": 3}
  ]
}
```
Auto-gera: form responsivo, regra de validacao, evento Antes de Gravar, SQL, grid.

## 8. Distribuicao

Tres formas de instalar:

```bash
# 1. Setup automatico (recomendado)
./setup.sh

# 2. Build manual
cd frz-compiler && make install

# 3. Download de release (quando disponivel)
./setup.sh download
```

CI/CD via GitHub Actions: push de tag `frz-v*` dispara build para 4 plataformas
e cria release com binarios pre-compilados.

## 9. Analise do Banco de Producao (Fase 6 — CONCLUIDA)

### 9.1 Escopo da Analise

Conectado ao SQL Server (SIG_MAKER) via Docker:
- **539 tabelas** analisadas, nucleo em `FR_` (100 tabelas, 378K linhas)
- **286.287 properties** mapeadas em key-value store (FR_PROPRIEDADE)
- **10.870 componentes** em 19 tipos
- **2.445 regras** (927 cliente + 1.516 servidor)
- **1.872 vinculos** de eventos
- **873 fontes de dados** com SQL real

### 9.2 Descobertas Aplicadas ao Motor

| Descoberta | Impacto no Motor |
|-----------|-----------------|
| Properties universais (Codigo, Ordem, Tabulacao, Tabular, Fonte, Cor) ausentes | Adicionadas como defaults por tipo |
| 19 tipos de componente (V=Bevel, D=SubForm, W=WebContainer faltavam) | Adicionados com defaults reais |
| SELECT real usa formato `Select TABELA.CAMPO1, ... From TABELA /*WHERE_NEW*/` | gerar_crud atualizado |
| PARAMS serializado como `nome,tipo,tamanho,;` | Confirmado, ja correto |
| sql_default usa formato `CAMPO=SQL("...")` | Suporte adicionado ao FormSpec |
| 10 atividades nativas (ActNewErrorMessage, ActNewWarningMessage, etc.) | Ja suportadas |
| Nomenclatura: Maker* (66-86%), edt* (17-25%) | Documentado em DB_SCHEMA.md |

### 9.3 Novas Tools

- **schema_banco** — Retorna o modelo de dados completo do Maker
- **introspectar_tabela** — Analisa tabela SQL Server e gera spec JSON pronta para gerar_crud

### 9.4 Artefatos Gerados

- `DB_SCHEMA.md` — Modelo de dados completo com 11 secoes
- Defaults por tipo de componente em `builder.py` (inferidos de 286K properties reais)

---

## 10. Fase 7: Motor Enterprise (CONCLUIDA)

Elevacao do motor de geracao para produzir interfaces de nivel corporativo (Enterprise Grade).

### 10.1 Modulo enterprise.py

Novo modulo dedicado a transformar specs simples em interfaces enterprise-grade:

| Capacidade | Implementacao |
|-----------|---------------|
| Agrupamento logico automatico | `group_fields_into_sections()` — 7 categorias: Dados Basicos, Documentos, Contato, Endereco, Financeiro, Datas, Observacoes |
| Cards Bootstrap 5.3 | Cada secao gera card + card-header + label com icone Font Awesome |
| Inferencia de tipo de componente | `infer_component_type()` — OBS→Memo, STATUS→Combo, ATIVO→Radio, bit→CheckBox |
| Inferencia de mascara | `infer_mask()` — CPF, CNPJ, CEP, TELEFONE, CELULAR, DATA, HORA, MOEDA |
| Inferencia de largura Bootstrap | `infer_column_width()` — NOME→col-6, CPF→col-4, OBS→col-12, COD→col-3 |
| Icones automaticos | `infer_icon_for_form()` + `infer_icon_for_section()` — 22 padroes |
| CSS MasterSkin | Classes enterprise-* com variaveis --bs-*, dark mode, transicoes |
| Titulo HTML premium | Icone contextual + titulo + subtitulo |
| Placeholders automaticos | "Informe {label}" gerado quando ausente |

### 10.2 Separacao Rigida Cliente/Servidor

| Camada | Destino | Runtime | Responsabilidade |
|--------|---------|---------|-----------------|
| Cliente | 1 | JavaScript (Browser) | Validacao inline, mascaras dinamicas, feedback visual, micro-interacoes |
| Servidor | 2 | Java (Tomcat JAR/WAR) | Validacao de integridade, persistencia, logica de negocio pesada |

Regras geradas automaticamente:
- `Validar {TABELA} Servidor` (destino=2) — isNullOrEmpty + ActNewErrorMessage (Java)
- `Validar {TABELA} Cliente` (destino=1) — isNullOrEmpty + ActNewErrorMessage (JS inline)
- `Aplicar Mascaras Dinamicas` (destino=1) — ebfSetComponentProperty ao entrar (JS)

### 10.3 Funcoes Nativas Validadas

| Funcao | Camada | Uso |
|--------|--------|-----|
| `isNullOrEmpty` | Servidor+Cliente | Validacao de campos obrigatorios |
| `ActNewErrorMessage` | Servidor+Cliente | Exibicao de mensagens de erro |
| `ebfSetComponentProperty` | Servidor+Cliente | Aplicacao de mascaras e propriedades dinamicas |
| `ebfSQLExecuteQuery` | Servidor | Consultas SQL (dashboards, auth) |

### 10.4 Recipes Enterprise Atualizadas

| Recipe | Antes | Depois |
|--------|-------|--------|
| `gerar_crud` | Campos flat, 1 regra servidor | Cards por secao, 3 regras (srv+cli+masks), CSS MasterSkin, auto-infer |
| `gerar_dashboard` | Paineis simples | Cards com headers/icones, titulo premium, CSS enterprise |
| `gerar_login` | Campos soltos | Card centralizado com header seguranca, icone lock, dark mode |

### 10.5 Padrao CSS MasterSkin

CSS modular injetado automaticamente no componente F (ClasseCss):
- `.enterprise-page-header` — titulo premium com icone e subtitulo
- `.enterprise-card-heading` — header de card com icone Font Awesome
- `.enterprise-field-required::after` — indicador visual de campo obrigatorio
- `.enterprise-stepper-indicator` / `.enterprise-stepper-step` — steps para cadastros longos
- Dark mode: `[data-bs-theme="dark"]` com variaveis `var(--bs-*)`, `var(--webrun-*)`
- Sem cores hardcoded — usa `var(--bs-primary)`, `var(--bs-emphasis-color)`, `var(--bs-secondary-color)`

### 10.6 Padroes Reais Incorporados (do banco de producao)

| Padrao | Frequencia | Uso no enterprise |
|--------|-----------|-------------------|
| `form-group card shadow` | 69x | Card padrao |
| `form-group text-primary` | 60x | Labels de destaque |
| `form-group card-header` | derivado | Header de card |
| Aba `01-Cadastro` | 6580x | Aba default |
| LabelPosition `0` | 3222x (99.5%) | Top-aligned labels |

---

## 11. Fase 8: Motor Logico (CONCLUIDA)

Modulo `logic_engine.py` — transpoe requisitos de negocio para fluxogramas nativos,
com decisao automatica de camada e padroes reutilizaveis.

### 11.1 Arquitetura de Decisao de Camadas

Classificacao automatica baseada nas funcoes utilizadas:

| Categoria | Funcoes | Camada |
|---|---|---|
| Servidor-only | ebfSQL*, ebfFile*, ebfAuth*, ebfSendMail* | destino=2 (Java) |
| Cliente-only | ebfForm*, ebfHtml*, ebfLocalStorage*, ebfExecuteJS | destino=1 (JS) |
| Dual | isNull*, isEqual*, opr*, ebfConcat, Act*, ebfFlowExecute | ambas |

Regra: se QUALQUER funcao e server-only, destino=2. Se todas sao client-only, destino=1.
Se conflito (server + client), retorna -1 indicando necessidade de split.

### 11.2 Biblioteca de 14 Padroes de Fluxo

Cada padrao gera a estrutura exata para o builder (DFM + Script XML):

| Padrao | Baseado em | Usos reais |
|---|---|---|
| sql_select | Query + Field + Close | 712x |
| sql_execute | INSERT/UPDATE/DELETE | 493x |
| sql_loop | WHILE + EOF + Next | 473x |
| null_guard | isNullOrEmpty + ActError | 1461x |
| equality_check | isEqual + desvio | 879x |
| duplicity_check | COUNT(*) + isGreater | generico |
| change_component | ebfFormChangeComponentValue | 800x |
| set_visibility | ebfFormSetVisible | 319x |
| set_enabled | ebfFormSetEnabled | 225x |
| callrule | TFlowSubRoutine | 1996x |
| json_build | ebfCreateObjectJSON + SetValue | 1532x |
| success_message | ActNewSuccessMessage | atividade |
| confirmation | ActNewInteractionConfirmMessage | atividade |
| browser_mode_guard | ebfFormIsInBrowserMode | 156x |

### 11.3 Compositor RuleBlueprint

Classe para composicao modular de regras:
- `add_param()`, `add_var()`, `add_step()`, `add_pattern()`
- `auto_classify()` — determina destino automaticamente
- `to_spec()` — serializa para JSON compativel com `gerar_fluxo`
- Normalizacao recursiva: converte `while` para `decisao(loop=true)`

### 11.4 Suporte a WHILE Loop

Loops implementados via `TFlowDecision` com `Loop = True` no DFM:
- DFM: `Loop = True` na decisao
- Script XML: `DECISION` padrao com condicao NOT EOF
- Expansao recursiva de padroes dentro do `corpo` do loop

### 11.5 Matriz de Eventos (12 eventos)

| Evento | Frequencia | Fase | Camada |
|---|---|---|---|
| Ao Clicar | 871x | interacao | Cliente |
| Ao Modificar | 371x | interacao | Cliente |
| Ao Entrar | 156x | inicializacao | Cliente |
| Ao Navegar | 89x | interacao | Cliente |
| Antes de Inserir | 87x | pre-persistencia | Servidor |
| Antes de Gravar | 80x | pre-persistencia | Servidor |
| Depois de Inserir | 74x | pos-persistencia | Servidor |
| Depois de Gravar | 57x | pos-persistencia | Servidor |
| Ao Duplo Clicar | 29x | interacao | Cliente |
| Ao Sair | 26x | interacao | Cliente |
| Depois de Deletar | 12x | pos-persistencia | Servidor |
| Antes de Deletar | 8x | pre-persistencia | Servidor |

### 11.6 Tools Adicionadas

- **projetar_regra** (Tool 20): Transpoe requisitos para fluxograma com auto-classificacao
- **eventos_disponiveis** (Tool 21): Matriz de eventos com fase, camada e uso ideal
- **padroes_logica** (Tool 22): Catalogo de padroes com exemplos JSON

---

## 12. Fase 9: Direct Access Engine (CONCLUIDA)

Modulo `direct_access.py` — materializa sistemas completos diretamente no banco de metadados,
eliminando a necessidade de gerar e importar FRZ.

### 12.1 Schema de Metadados Mapeado

| Tabela | PK | Funcao | Registros |
|---|---|---|---|
| FR_FORMULARIO | FRM_CODIGO | Formularios | 876 |
| FR_COMPONENTE | FRM_CODIGO + COM_CODIGO | Componentes visuais | 10.936 |
| FR_PROPRIEDADE | FRM+COM+PRO_NOME | Properties de componentes | 286K+ |
| FR_FONTEDADOS | FNT_CODIGO | Fontes de dados/SQL | 873 |
| FR_REGRAS | REG_COD | Regras/fluxogramas | 2.445 |
| FR_ACAOCOMPONENTE | FRM+COM+ACO+MOMENTO | Vinculos evento-acao | 1.879 |
| FR_PARAMETRO | FRM+COM+ACO+MOMENTO+NOME | Params de eventos | 3.736 |
| FR_ACAO | ACO_CODIGO | Tipos de acao (12 fixos) | 12 |
| FR_TABELA | TAB_NOME | Dicionario de tabelas | ~539 |
| FR_MENU | SIS+MNU_CODIGO | Estrutura de menus | ~100 |

### 12.2 Tipos de Acao (FR_ACAO)

| ACO_CODIGO | Nome | Uso |
|---|---|---|
| 1 | Abrir Janela | Abrir outro formulario |
| 12 | Executar Regra de negocio | Vincular fluxograma a evento |
| 7 | Mudar Valor | Alterar valor de componente |
| 4 | Mostrar/Ocultar Objetos | Visibilidade |
| 3 | Habilitar/Desabilitar Objetos | Habilitacao |

### 12.3 Ranges de IDs Seguros

Para evitar conflitos com dados existentes:
- FRM_CODIGO >= 900.000.000 (existentes: max 464M)
- COM_CODIGO >= 9.000.000 (existentes: max 1M)
- REG_COD >= 90.000 (existentes: max 2.516)
- FNT_CODIGO >= 90.000 (existentes: max 1.056)
- MNU_CODIGO >= 9.000

### 12.4 DirectAccessEngine

Classe principal com operacoes transacionais:

| Metodo | Tabela | Operacao |
|---|---|---|
| create_business_table | DDL + FR_TABELA | CREATE TABLE + dicionario |
| create_form | FR_FORMULARIO | INSERT formulario |
| create_form_component | FR_COMPONENTE + FR_PROPRIEDADE | Shell F com 18 props |
| create_field_component | FR_COMPONENTE + FR_PROPRIEDADE | Campos E/C/K/M/H/R |
| create_datasource | FR_FONTEDADOS | Fonte de dados SQL |
| create_rule | FR_REGRAS | Regra com DFM + Script b64 |
| create_rule_from_spec | FR_REGRAS (via builder) | Regra a partir de JSON spec |
| bind_event | FR_ACAOCOMPONENTE + FR_PARAMETRO | Vinculo evento-regra |
| create_menu_item | FR_MENU | Item de menu |
| materialize_crud | Todas acima | CRUD completo one-shot |
| materialize_system | Todas acima | Sistema multi-modulo |

### 12.5 Modo Dual de Execucao

| Modo | Quando usar | Resultado |
|---|---|---|
| direct | Banco de desenvolvimento acessivel | Insere direto nas FR_* |
| frz | Sem acesso ao banco, ou producao | Gera .frz para importacao |

### 12.6 Tools Adicionadas

- **materializar_sistema** (Tool 23): Cria sistema completo (DDL + DML + regras + menus)
- **inspecionar_metadados** (Tool 24): Inspeciona formularios, regras ou tabelas
- **executar_sql** (Tool 25): Executa SQL arbitrario no banco de metadados

---

## 13. Fase 10: Superpowers + GSD (CONCLUIDA)

### 13.1 Filosofia Superpowers + GSD

Mantra: "I have the superpower to build. I have the brain to deliver. GET SHIT DONE."

Principios:
- **Zero Paralisia**: Se nao esta no manual, use a funcao mais proxima e execute
- **Pragmatismo**: 1 no que resolve > 5 nos elegantes. Objetivo: SHIPPED
- **Auto-Correcao**: Erro de compilacao? gsd_diagnosticar analisa e corrige direto no banco
- **Tier-X**: Classificacao automatica de camada (CLIENT JS / SERVER Java / DUAL)
- **Full-stack simultaneo**: Regras JS + Java geradas em paralelo

### 13.2 Tier-X Orchestration

| Tier | Destino | Engine | Funcoes Classificadas | Componentes |
|------|---------|--------|----------------------|-------------|
| CLIENT | 1 | wfr.js (6660 LOC) | 20 funcoes ebfForm*, ebfHtml* | HTMLEdit, HTMLGrid, HTMLChart, HTMLChat |
| SERVER | 2 | Java/Tomcat (280 classes) | 19 funcoes ebfSQL*, ebfAuth*, ebfFile* | WFRForm, DBConnection, RulesCompiler |
| DUAL | 1 ou 2 | Ambos | 39 funcoes is*, opr*, ebfConcat* | ActNew*Message, ebfFlowExecute |

JARs do servidor mapeados: 205 JARs em WEB-INF/lib/ incluindo:
JasperReports 6.4.0, AWS SDK 1.11.0, MongoDB 3.12.13, CXF 3.2.8, JJWT 0.11.5, RabbitMQ 5.20.0

### 13.3 Tool gsd_criar_sistema (Tool 26)

ONE-SHOT: descreva o sistema e os campos, o motor decide tudo e materializa.

### 13.4 Tool gsd_diagnosticar (Tool 27)

AUTO-FIX: analisa metadados de um formulario e corrige problemas:

| Problema | Severidade | Auto-fix |
|----------|-----------|----------|
| Sem componente tipo F (shell) | CRITICO | Manual |
| Componente sem propriedade Nome | CRITICO | Sim |
| Evento referencia regra inexistente | CRITICO | Manual |
| Campo sem Bootstrap CSS (NomeClasseCss) | ALTO | Sim (infere col-md-*) |
| Shell sem propriedade Abas | ALTO | Sim |
| Componente sem Descricao | MEDIO | Sim |
| Componente sem aba definida | MEDIO | Sim |
| Shell sem NavBarVisivel | MEDIO | Sim |

### 13.5 Tool gsd_manual (Tool 28)

Manual operacional completo embutido DENTRO do MCP (167 linhas, 11 secoes).
Viaja com o servidor — funciona em qualquer cliente (Cursor, Claude Desktop, qualquer IDE MCP).

Secoes: GSD Brain, Tier-X, JARs, Hierarquia, Bootstrap 5.3, Full-Stack,
Direct Access, Diretriz de Resposta, Consulta Obrigatoria, Schema, Motor Logico.

Suporta filtro por secao: `gsd_manual("tier")`, `gsd_manual("jars")`, `gsd_manual("schema")`.

### 13.6 .cursorrules (ponteiro minimo)

O .cursorrules na raiz do projeto e agora apenas um ponteiro que diz:
"Chame gsd_manual para carregar o manual completo."

Toda a inteligencia operacional esta dentro do MCP, nao em arquivos externos.

### 13.7 System Instructions

Instruacoes do MCP com secoes estruturadas (viajam com o servidor):
- GSD BRAIN: zero paralisia, pragmatismo, auto-correcao
- TIER-X: 78 funcoes classificadas por camada + componentes JS + classes Java
- JARS: 205 JARs por dominio
- BOOTSTRAP 5.3: classes de layout via NomeClasseCss + MasterSkin
- MOTOR LOGICO: 14 padroes + RuleBlueprint

---

## 14. Resumo da Arquitetura Final

```
LLM (Claude/GPT)
  |
  |  ~50 tokens (GSD one-shot) ou ~200 (recipes) ou ~1500 (custom)
  v
Python MCP Server (server.py) — SUPERPOWERS + GSD
  |-- 28 tools (3 GSD + 3 recipes + 14 custom + 2 intro + 3 logic + 3 direct access)
  |-- GSD Brain (server.py)
  |   |-- gsd_criar_sistema: one-shot, zero prompts
  |   |-- gsd_diagnosticar: auto-fix de metadados
  |   |-- gsd_manual: manual operacional portavel (167 linhas, 11 secoes)
  |   |-- Inferencia autonoma: tabela, SQL types, componentes, mascaras
  |   |-- Tier-X: 78 funcoes classificadas (19 server + 20 client + 39 dual)
  |-- Enterprise Engine (enterprise.py)
  |   |-- Agrupamento logico, inferencia, MasterSkin CSS
  |   |-- Bootstrap 5.3 Super-Layouts
  |-- Logic Engine (logic_engine.py)
  |   |-- 14 padroes + decisao de camada + WHILE loops
  |   |-- RuleBlueprint compositor + matriz 12 eventos
  |-- Direct Access Engine (direct_access.py)
  |   |-- DDL: CREATE TABLE + dicionario FR_TABELA
  |   |-- DML: FR_* (formularios, componentes, props, fontes, regras, eventos, menus)
  |   |-- Transacional: commit/rollback atomico
  |   |-- Verificacao: conflitos GUID, nomes, integridade
  |-- Knowledge Base
  |   |-- 1186 funcoes nativas (48 categorias)
  |   |-- 205 JARs mapeados (WEB-INF/lib/)
  |   |-- 63 componentes JS (wfr.js engine)
  |   |-- 280 classes Java (wfr.* packages)
  |   |-- 2445 regras reais de producao
  |
  v
frz-compiler (Rust)     SQL Server (SIG_MAKER)
  |-- .frz file            |-- Direct Access (modo direct — GSD padrao)
  |-- DFM + XML             |   |-- FR_FORMULARIO (876 existentes)
  |-- gzip encoding         |   |-- FR_COMPONENTE (10.936)
  |                         |   |-- FR_PROPRIEDADE (286K+)
  |                         |   |-- FR_REGRAS (2.445)
  |                         |   |-- FR_FONTEDADOS (873)
  |                         |   |-- FR_ACAOCOMPONENTE (1.879)
  |                         |   |-- FR_MENU + FR_TABELA
  |                         |
  v                         v
Modo FRZ                 Modo Direct Access + Auto-Fix
(importacao manual)     (GSD: materializa + diagnostica + corrige)
```

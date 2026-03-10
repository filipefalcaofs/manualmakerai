# Ações e Fluxos de Automação

> Tabelas que gerenciam as ações, regras de negócio, fluxogramas e automações sem código (no-code).

**Total de tabelas neste domínio:** 12

## Tabelas

- [`FR_ACAO`](#fr_acao) — 2 colunas
- [`FR_ACAOCOMPONENTE`](#fr_acaocomponente) — 5 colunas
- [`FR_ACAOPARAMETRO`](#fr_acaoparametro) — 3 colunas
- [`FR_ACPTIPO`](#fr_acptipo) — 2 colunas
- [`FR_REGRAS`](#fr_regras) — 17 colunas
- [`FR_REGRAS_ATIVIDADES`](#fr_regras_atividades) — 7 colunas
- [`FR_REGRAS_BANCO`](#fr_regras_banco) — 3 colunas
- [`FR_REGRAS_CATEGORIAS`](#fr_regras_categorias) — 3 colunas
- [`FR_REGRAS_FUNCOES`](#fr_regras_funcoes) — 13 colunas
- [`FR_REGRAS_FUNCOES_TIPOS`](#fr_regras_funcoes_tipos) — 2 colunas
- [`FR_REGRAS_TIPOS`](#fr_regras_tipos) — 14 colunas
- [`FR_REGRAS_TRIGGERS`](#fr_regras_triggers) — 6 colunas

## Diagrama de Relacionamentos

```
  FR_ACAOCOMPONENTE --> FR_COMPONENTE
  FR_ACAOCOMPONENTE --> FR_ACAO
  FR_ACAOPARAMETRO --> FR_ACAO
  FR_ACAOPARAMETRO --> FR_ACPTIPO
  FR_REGRAS --> FR_REGRAS_CATEGORIAS
```

## Detalhamento das Tabelas

### FR_ACAO

**Formulário associado:** `fr_acao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ACO_CODIGO` 🔑 | INTEGER | Não | — |
| `ACO_NOME` | VARCHAR(30) | Não | — |

**Chave Primária:** `ACO_CODIGO`
  - Constraint: `FR_ACAO_PKEY`

**Referenciada por:** `FR_ACAOCOMPONENTE`, `FR_ACAOPARAMETRO`

---

### FR_ACAOCOMPONENTE

**Formulário associado:** `fr_acaocomponente`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `COM_CODIGO` 🔑 | INTEGER | Não | — |
| `ACO_CODIGO` 🔑 | INTEGER | Não | — |
| `ACC_MOMENTO` 🔑 | VARCHAR(30) | Não | — |
| `ACC_CONDICAO` | VARCHAR(30) | Sim | — |

**Chave Primária:** `FRM_CODIGO`, `COM_CODIGO`, `ACO_CODIGO`, `ACC_MOMENTO`
  - Constraint: `FR_ACAOCOMPONENTE_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_ACAOCOMPONENTE_FK__03F87D43**: `frm_codigo` → `FR_COMPONENTE.frm_codigo`, `com_codigo` → `FR_COMPONENTE.frm_codigo`
  - Referencia: `FR_COMPONENTE`
- **FR_ACAOCOMPONENTE_FK__C2F5EE9B**: `aco_codigo` → `FR_ACAO.aco_codigo`
  - Referencia: `FR_ACAO`

**Referenciada por:** `FR_PARAMETRO`

---

### FR_ACAOPARAMETRO

**Formulário associado:** `fr_acaoparametro`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ACO_CODIGO` 🔑 | INTEGER | Não | — |
| `ACP_NOME` 🔑 | VARCHAR(30) | Não | — |
| `ACT_CODIGO` | INTEGER | Não | — |

**Chave Primária:** `ACO_CODIGO`, `ACP_NOME`
  - Constraint: `FR_ACAOPARAMETRO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_ACAOPARAMETRO_FK_F_B45C18EC**: `aco_codigo` → `FR_ACAO.aco_codigo`
  - Referencia: `FR_ACAO`
- **FR_ACAOPARAMETRO_FK_F_D9F2F70C**: `act_codigo` → `FR_ACPTIPO.act_codigo`
  - Referencia: `FR_ACPTIPO`

---

### FR_ACPTIPO

**Formulário associado:** `fr_acptipo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ACT_CODIGO` 🔑 | INTEGER | Não | — |
| `ACT_DESCRICAO` | VARCHAR(30) | Sim | — |

**Chave Primária:** `ACT_CODIGO`
  - Constraint: `FR_ACPTIPO_PKEY`

**Referenciada por:** `FR_ACAOPARAMETRO`

---

### FR_REGRAS

**Formulário associado:** `fr_regras`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `REG_NOME` | VARCHAR(255) | Sim | — |
| `REG_DESCRICAO` | TEXT (CLOB) | Sim | — |
| `REG_PARAMS` | TEXT (CLOB) | Sim | — |
| `REG_VARIAVEIS` | TEXT (CLOB) | Sim | — |
| `REG_PARAMS_OUT` | TEXT (CLOB) | Sim | — |
| `REG_INTERFACE` | TEXT (CLOB) | Sim | — |
| `REG_SCRIPT` | TEXT (CLOB) | Sim | — |
| `REG_DATA` | DATETIME | Sim | — |
| `REG_HORA` | DATETIME | Sim | — |
| `REG_COMPILADA` | VARCHAR(1) | Sim | — |
| `REG_DESTINO` | INTEGER | Sim | — |
| `REG_HASH` | VARCHAR(50) | Sim | — |
| `CAT_COD` | INTEGER | Sim | `1` |
| `USR_CODIGO` | INTEGER | Sim | — |
| `REG_CORE` | TEXT (CLOB) | Sim | — |
| `REG_PROMPT` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `REG_COD`
  - Constraint: `FR_REGRAS_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_REGRAS_FK_FR_REGRA_28B203CF**: `cat_cod` → `FR_REGRAS_CATEGORIAS.cat_cod`
  - Referencia: `FR_REGRAS_CATEGORIAS`

**Referenciada por:** `FR_DOC_REGRAS_IMAGEM`, `FR_TAREFA`

---

### FR_REGRAS_ATIVIDADES

**Formulário associado:** `fr_regras_atividades`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ATV_COD` 🔑 | INTEGER | Não | — |
| `ATV_NOME` | VARCHAR(50) | Sim | — |
| `ATV_NOME_REAL` | VARCHAR(50) | Sim | — |
| `ATV_DESCRICAO` | VARCHAR(500) | Sim | — |
| `ATV_PARAMS` | VARCHAR(500) | Sim | — |
| `ATV_RETORNO` | VARCHAR(50) | Sim | — |
| `ATV_COMPATIBILIDADE` | VARCHAR(10) | Sim | — |

**Chave Primária:** `ATV_COD`
  - Constraint: `FR_REGRAS_ATIVIDADES_PKEY`

---

### FR_REGRAS_BANCO

**Formulário associado:** `fr_regras_banco`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `BAN_SCRIPT` | TEXT (CLOB) | Sim | — |
| `BAN_COMPILACAO` | DATETIME | Sim | — |

**Chave Primária:** `REG_COD`
  - Constraint: `FR_REGRAS_BANCO_PKEY`

---

### FR_REGRAS_CATEGORIAS

**Formulário associado:** `fr_regras_categorias`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CAT_COD` 🔑 | INTEGER | Não | — |
| `CAT_NOME` | VARCHAR(40) | Sim | — |
| `CAT_SUPER` | INTEGER | Sim | — |

**Chave Primária:** `CAT_COD`
  - Constraint: `FR_REGRAS_CATEGORIAS_PKEY`

**Referenciada por:** `FR_REGRAS`

---

### FR_REGRAS_FUNCOES

**Formulário associado:** `fr_regras_funcoes`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FUN_COD` 🔑 | INTEGER | Não | — |
| `FUN_NOME` | VARCHAR(50) | Não | — |
| `FUN_DESCRICAO` | TEXT (CLOB) | Não | — |
| `FUN_NOME_REAL` | VARCHAR(50) | Não | — |
| `FUN_PARAMS` | TEXT (CLOB) | Sim | — |
| `FUN_RETORNO` | VARCHAR(30) | Sim | — |
| `FUN_TIPO` | INTEGER | Não | — |
| `FUN_COMPATIBILIDADE` | VARCHAR(10) | Sim | — |
| `FUN_RESUMO` | VARCHAR(2000) | Sim | — |
| `FUN_CONTEUDO_SERVIDOR` | TEXT (CLOB) | Sim | — |
| `FUN_CONTEUDO_CLIENTE` | TEXT (CLOB) | Sim | — |
| `FUN_CONTEUDO_BANCO` | TEXT (CLOB) | Sim | — |
| `FUN_VERSAO` | VARCHAR(10) | Sim | — |

**Chave Primária:** `FUN_COD`
  - Constraint: `FR_REGRAS_FUNCOES_PKEY`

---

### FR_REGRAS_FUNCOES_TIPOS

**Formulário associado:** `fr_regras_funcoes_tipos`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FTP_COD` 🔑 | INTEGER | Não | — |
| `FTP_NOME` | VARCHAR(50) | Não | — |

**Chave Primária:** `FTP_COD`
  - Constraint: `FR_REGRAS_FUNCOES_TIPOS_PKEY`

---

### FR_REGRAS_TIPOS

**Formulário associado:** `fr_regras_tipos`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TIP_COD` 🔑 | INTEGER | Não | — |
| `TIP_NOME` | VARCHAR(20) | Sim | — |
| `TIP_VISIVEL` | INTEGER | Sim | — |
| `TIP_EQUIVALENTE` | VARCHAR(200) | Sim | — |
| `TIP_ASPAS` | INTEGER | Sim | — |
| `TIP_DEFAULT` | INTEGER | Sim | — |
| `TIP_CATEGORIA` | INTEGER | Sim | — |
| `TIP_SUPER` | INTEGER | Sim | — |
| `TIP_NOME_INTERNO` | VARCHAR(30) | Sim | — |
| `TIP_TAM_OBRIGATORIO` | INTEGER | Sim | — |
| `TIP_VISIVEL_PARAM_ENTRADA` | INTEGER | Sim | — |
| `TIP_VISIVEL_VAR` | INTEGER | Sim | — |
| `TIP_VISIVEL_CONST` | INTEGER | Sim | — |
| `TIP_VISIVEL_PARAM_SAIDA` | INTEGER | Sim | — |

**Chave Primária:** `TIP_COD`
  - Constraint: `FR_REGRAS_TIPOS_PKEY`

---

### FR_REGRAS_TRIGGERS

**Formulário associado:** `fr_regras_triggers`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TAB_NOME` 🔑 | VARCHAR(100) | Não | — |
| `TAB_EVENTO` 🔑 | INTEGER | Não | — |
| `REG_COD` 🔑 | INTEGER | Não | — |
| `TAB_PARAMS` | TEXT (CLOB) | Sim | — |
| `TAB_SCRIPT` | TEXT (CLOB) | Sim | — |
| `TAB_COMPILACAO` | DATETIME | Sim | — |

**Chave Primária:** `TAB_NOME`, `TAB_EVENTO`, `REG_COD`
  - Constraint: `FR_REGRAS_TRIGGERS_PKEY`

---

# Outras Tabelas do Sistema

> Tabelas adicionais que complementam a estrutura do Maker AI.

**Total de tabelas neste domínio:** 14

## Tabelas

- [`FR_FONTEDADOS`](#fr_fontedados) — 14 colunas
- [`FR_LISTAGEM`](#fr_listagem) — 7 colunas
- [`FR_LISTAGEM_FILTROS`](#fr_listagem_filtros) — 4 colunas
- [`FR_LISTAGEM_LISTA_FILTROS`](#fr_listagem_lista_filtros) — 4 colunas
- [`FR_OPERADOR`](#fr_operador) — 4 colunas
- [`FR_OPERANDO`](#fr_operando) — 4 colunas
- [`FR_PARAMETRO`](#fr_parametro) — 6 colunas
- [`FR_PROCESSAMENTO`](#fr_processamento) — 8 colunas
- [`FR_PROPRIEDADE`](#fr_propriedade) — 4 colunas
- [`FR_SCHEMA`](#fr_schema) — 2 colunas
- [`FR_SESSAO`](#fr_sessao) — 7 colunas
- [`FR_TAREFA`](#fr_tarefa) — 9 colunas
- [`FR_TAREFA_TEMPO`](#fr_tarefa_tempo) — 4 colunas
- [`FR_TIPO_EVENT`](#fr_tipo_event) — 3 colunas

## Diagrama de Relacionamentos

```
  FR_FONTEDADOS --> FR_FORMULARIO
  FR_PARAMETRO --> FR_ACAOCOMPONENTE
  FR_PROPRIEDADE --> FR_COMPONENTE
  FR_TAREFA --> FR_SISTEMA
  FR_TAREFA --> FR_REGRAS
  FR_TAREFA_TEMPO --> FR_TAREFA
```

## Detalhamento das Tabelas

### FR_FONTEDADOS

**Formulário associado:** `fr_fontedados`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FNT_CODIGO` 🔑 | INTEGER | Não | — |
| `FNT_CODIGO_PARENT` | INTEGER | Sim | — |
| `FNT_CAMPOCHAVE` | VARCHAR(100) | Sim | — |
| `FNT_TABELA` | VARCHAR(30) | Sim | — |
| `FNT_SQLSELECT` | VARCHAR(6000) | Sim | — |
| `FNT_SQLINSERT` | VARCHAR(6000) | Sim | — |
| `FNT_SQLUPDATE` | VARCHAR(6000) | Sim | — |
| `FNT_SQLDELETE` | VARCHAR(6000) | Sim | — |
| `FNT_CAMPOINCREMENTO` | VARCHAR(100) | Sim | — |
| `FRM_CODIGO` | INTEGER | Não | — |
| `FNT_CAMPOGRADE` | VARCHAR(6000) | Sim | — |
| `FNT_CAMPOPESQUISA` | VARCHAR(6000) | Sim | — |
| `FNT_SQLDEFAULT` | VARCHAR(6000) | Sim | — |
| `FNT_SQLMASCARA` | VARCHAR(2000) | Sim | — |

**Chave Primária:** `FNT_CODIGO`
  - Constraint: `FR_FONTEDADOS_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_FONTEDADOS_FK_FR_F_1059334C**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`

---

### FR_LISTAGEM

**Formulário associado:** `fr_listagem`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `LST_COD` 🔑 | INTEGER | Não | — |
| `LST_USER` | VARCHAR(100) | Sim | — |
| `LST_NOME` | VARCHAR(100) | Sim | — |
| `LST_COMPONENTE` | VARCHAR(100) | Sim | — |
| `LST_JSON` | TEXT (CLOB) | Sim | — |
| `LST_XML` | TEXT (CLOB) | Sim | — |
| `LST_GUID` | VARCHAR(36) | Sim | — |

**Chave Primária:** `LST_COD`
  - Constraint: `FR_LISTAGEM_PKEY`

---

### FR_LISTAGEM_FILTROS

**Formulário associado:** `fr_listagem_filtros`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `LST_FIL_COD` 🔑 | INTEGER | Não | — |
| `LST_COD` | VARCHAR(200) | Não | — |
| `USR_LOGIN` | VARCHAR(200) | Sim | — |
| `LST_FIL_JSON` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `LST_FIL_COD`
  - Constraint: `FR_LISTAGEM_FILTROS_PKEY`

---

### FR_LISTAGEM_LISTA_FILTROS

**Formulário associado:** `fr_listagem_lista_filtros`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FIL_COD` 🔑 | INTEGER | Não | — |
| `FIL_NOME_TABELA` | VARCHAR(300) | Sim | — |
| `FIL_CAMPO_CHAVE` | VARCHAR(300) | Sim | — |
| `FIL_SQL_SELECT` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `FIL_COD`
  - Constraint: `FR_LISTAGEM_LISTA_FILTROS_PKEY`

---

### FR_OPERADOR

**Formulário associado:** `fr_operador`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `OPDR_CODIGO` 🔑 | INTEGER | Não | — |
| `OPDR_NOME` | VARCHAR(40) | Não | — |
| `OPDR_TIPO` | VARCHAR(1) | Não | — |
| `OPDR_PARAMETROS` | VARCHAR(80) | Não | — |

**Chave Primária:** `OPDR_CODIGO`
  - Constraint: `FR_OPERADOR_PKEY`

---

### FR_OPERANDO

**Formulário associado:** `fr_operando`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FMLA_CODIGO` 🔑 | INTEGER | Não | — |
| `OPDO_ORDEM` 🔑 | INTEGER | Não | — |
| `OPDO_FMLA_CODIGO` | INTEGER | Sim | — |
| `OPDO_EXPRESSAO` | VARCHAR(6000) | Sim | — |

**Chave Primária:** `FMLA_CODIGO`, `OPDO_ORDEM`
  - Constraint: `FR_OPERANDO_PKEY`

---

### FR_PARAMETRO

**Formulário associado:** `fr_parametro`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `COM_CODIGO` 🔑 | INTEGER | Não | — |
| `ACO_CODIGO` 🔑 | INTEGER | Não | — |
| `ACC_MOMENTO` 🔑 | VARCHAR(30) | Não | — |
| `PAR_NOME` 🔑 | VARCHAR(30) | Não | — |
| `PAR_VALOR` | VARCHAR(5000) | Sim | — |

**Chave Primária:** `FRM_CODIGO`, `COM_CODIGO`, `ACO_CODIGO`, `ACC_MOMENTO`, `PAR_NOME`
  - Constraint: `FR_PARAMETRO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_PARAMETRO_FK_FR_AC_3E73C0F2**: `frm_codigo` → `FR_ACAOCOMPONENTE.frm_codigo`, `com_codigo` → `FR_ACAOCOMPONENTE.frm_codigo`, `aco_codigo` → `FR_ACAOCOMPONENTE.frm_codigo`, `acc_momento` → `FR_ACAOCOMPONENTE.frm_codigo`
  - Referencia: `FR_ACAOCOMPONENTE`

---

### FR_PROCESSAMENTO

**Formulário associado:** `fr_processamento`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FR_PRO_ID` 🔑 | INTEGER | Não | — |
| `FR_PRO_NOME` | VARCHAR(500) | Não | — |
| `FR_PRO_DESCRICAO` | TEXT (CLOB) | Sim | — |
| `FR_PRO_GUID` | VARCHAR(40) | Não | — |
| `FR_PRO_PROMPT` | TEXT (CLOB) | Não | — |
| `FR_PRO_ENTRADA` | TEXT (CLOB) | Não | — |
| `FR_PRO_RETORNO` | TEXT (CLOB) | Não | — |
| `FR_PRO_CODIGO_FONTE` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `FR_PRO_ID`
  - Constraint: `FR_PROCESSAMENTO_PKEY`

---

### FR_PROPRIEDADE

**Formulário associado:** `fr_propriedade`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `COM_CODIGO` 🔑 | INTEGER | Não | — |
| `PRO_NOME` 🔑 | VARCHAR(100) | Não | — |
| `PRO_VALOR` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `FRM_CODIGO`, `COM_CODIGO`, `PRO_NOME`
  - Constraint: `FR_PROPRIEDADE_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_PROPRIEDADE_FK_FR__C0E70269**: `frm_codigo` → `FR_COMPONENTE.frm_codigo`, `com_codigo` → `FR_COMPONENTE.frm_codigo`
  - Referencia: `FR_COMPONENTE`

---

### FR_SCHEMA

**Formulário associado:** `fr_schema`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `SCH_NOME` 🔑 | VARCHAR(200) | Não | — |
| `SCH_VERSAO` | INTEGER | Não | — |

**Chave Primária:** `SCH_NOME`
  - Constraint: `FR_SCHEMA_PKEY`

---

### FR_SESSAO

**Formulário associado:** `fr_sessao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `SES_CONEXAO` 🔑 | INTEGER | Não | — |
| `SES_DATAHORA_LOGIN` | DATETIME | Sim | — |
| `SES_USUARIO` | VARCHAR(20) | Sim | — |
| `SES_NOME_USUARIO` | VARCHAR(40) | Sim | — |
| `SES_NOME_MAQUINA` | VARCHAR(40) | Sim | — |
| `SES_END_IP` | VARCHAR(20) | Sim | — |
| `SIS_CODIGO` | VARCHAR(3) | Sim | — |

**Chave Primária:** `SES_CONEXAO`
  - Constraint: `FR_SESSAO_PKEY`

---

### FR_TAREFA

**Formulário associado:** `fr_tarefa`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TRF_CODIGO` 🔑 | INTEGER | Não | — |
| `TRF_DESCRICAO` | VARCHAR(255) | Não | — |
| `SIS_CODIGO` | VARCHAR(3) | Não | — |
| `REG_CODIGO` | INTEGER | Não | — |
| `TRF_DATA_INICIAL` | DATETIME | Sim | — |
| `TRF_DATA_FINAL` | DATETIME | Sim | — |
| `TRF_ATIVA` | VARCHAR(1) | Não | — |
| `TRF_REGRA_PARAMETROS` | TEXT (CLOB) | Sim | — |
| `TRF_TIPO_AGENDAMENTO` | VARCHAR(15) | Sim | — |

**Chave Primária:** `TRF_CODIGO`
  - Constraint: `FR_TAREFA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_TAREFA_FK_FR_SISTE_0B4D6A1E**: `sis_codigo` → `FR_SISTEMA.sis_codigo`
  - Referencia: `FR_SISTEMA`
- **FR_TAREFA_FK_FR_REGRA_BE2A9CA9**: `reg_codigo` → `FR_REGRAS.reg_cod`
  - Referencia: `FR_REGRAS`

**Referenciada por:** `FR_TAREFA_TEMPO`

---

### FR_TAREFA_TEMPO

**Formulário associado:** `fr_tarefa_tempo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TRT_CODIGO` 🔑 | INTEGER | Não | — |
| `TRF_CODIGO` | INTEGER | Não | — |
| `TRT_TIPO` | VARCHAR(15) | Não | — |
| `TRT_VALOR` | INTEGER | Não | — |

**Chave Primária:** `TRT_CODIGO`
  - Constraint: `FR_TAREFA_TEMPO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_TAREFA_TEMPO_FK_FR_3BB01503**: `trf_codigo` → `FR_TAREFA.trf_codigo`
  - Referencia: `FR_TAREFA`

---

### FR_TIPO_EVENT

**Formulário associado:** `fr_tipo_event`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FTE_COD` 🔑 | INTEGER | Não | — |
| `FTE_DESCRICAO` | VARCHAR(20) | Não | — |
| `FTE_SIGLA` | VARCHAR(1) | Não | — |

**Chave Primária:** `FTE_COD`
  - Constraint: `FR_TIPO_EVENT_PKEY`

---

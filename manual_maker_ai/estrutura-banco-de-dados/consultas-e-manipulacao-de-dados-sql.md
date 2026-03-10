# Consultas e Manipulação de Dados (SQL)

> Tabelas do assistente SQL e consultas avançadas que permitem manipulação de dados sem escrever código.

**Total de tabelas neste domínio:** 5

## Tabelas

- [`FR_CONSULTA_AVANCADA`](#fr_consulta_avancada) — 4 colunas
- [`FR_DEP_FORMULARIO_CAMPO`](#fr_dep_formulario_campo) — 3 colunas
- [`FR_DEP_FORMULARIO_TABELA`](#fr_dep_formulario_tabela) — 2 colunas
- [`FR_DEP_REGRA_CAMPO`](#fr_dep_regra_campo) — 3 colunas
- [`FR_DEP_REGRA_TABELA`](#fr_dep_regra_tabela) — 2 colunas

## Diagrama de Relacionamentos

```
  FR_CONSULTA_AVANCADA --> FR_FORMULARIO
```

## Detalhamento das Tabelas

### FR_CONSULTA_AVANCADA

**Formulário associado:** `fr_consulta_avancada`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `CAV_CODIGO` 🔑 | INTEGER | Não | — |
| `CAV_DESCRICAO` | VARCHAR(60) | Não | — |
| `CAV_TEXTO` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `FRM_CODIGO`, `CAV_CODIGO`
  - Constraint: `FR_CONSULTA_AVANCADA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_CONSULTA_AVANCADA__F559A7A5**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`

---

### FR_DEP_FORMULARIO_CAMPO

**Formulário associado:** `fr_dep_formulario_campo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `TAB_NOME` 🔑 | VARCHAR(96) | Não | — |
| `CMP_NOME` 🔑 | VARCHAR(96) | Não | — |

**Chave Primária:** `FRM_CODIGO`, `TAB_NOME`, `CMP_NOME`
  - Constraint: `FR_DEP_FORMULARIO_CAMPO_PKEY`

---

### FR_DEP_FORMULARIO_TABELA

**Formulário associado:** `fr_dep_formulario_tabela`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `TAB_NOME` 🔑 | VARCHAR(96) | Não | — |

**Chave Primária:** `FRM_CODIGO`, `TAB_NOME`
  - Constraint: `FR_DEP_FORMULARIO_TABELA_PKEY`

---

### FR_DEP_REGRA_CAMPO

**Formulário associado:** `fr_dep_regra_campo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `TAB_NOME` 🔑 | VARCHAR(96) | Não | — |
| `CMP_NOME` 🔑 | VARCHAR(96) | Não | — |

**Chave Primária:** `REG_COD`, `TAB_NOME`, `CMP_NOME`
  - Constraint: `FR_DEP_REGRA_CAMPO_PKEY`

---

### FR_DEP_REGRA_TABELA

**Formulário associado:** `fr_dep_regra_tabela`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `TAB_NOME` 🔑 | VARCHAR(96) | Não | — |

**Chave Primária:** `REG_COD`, `TAB_NOME`
  - Constraint: `FR_DEP_REGRA_TABELA_PKEY`

---

# Dependências e Rastreabilidade

> Tabelas de mapeamento de dependências entre formulários, regras, relatórios, tabelas e componentes — essenciais para refatoração e análise de impacto.

**Total de tabelas neste domínio:** 8

## Tabelas

- [`FR_DEP_FORMULARIO_FORMULARIO`](#fr_dep_formulario_formulario) — 2 colunas
- [`FR_DEP_FORMULARIO_REGRA`](#fr_dep_formulario_regra) — 2 colunas
- [`FR_DEP_FORMULARIO_RELATORIO`](#fr_dep_formulario_relatorio) — 2 colunas
- [`FR_DEP_REGRA_COMPONENTE`](#fr_dep_regra_componente) — 3 colunas
- [`FR_DEP_REGRA_FORMULARIO`](#fr_dep_regra_formulario) — 2 colunas
- [`FR_DEP_REGRA_FUNCAO`](#fr_dep_regra_funcao) — 2 colunas
- [`FR_DEP_REGRA_REGRA`](#fr_dep_regra_regra) — 2 colunas
- [`FR_DEP_REGRA_RELATORIO`](#fr_dep_regra_relatorio) — 2 colunas

## Diagrama de Relacionamentos

```
```

## Detalhamento das Tabelas

### FR_DEP_FORMULARIO_FORMULARIO

**Formulário associado:** `fr_dep_formulario_formulario`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `FRM_CODIGO_REFERENCIA` 🔑 | INTEGER | Não | — |

**Chave Primária:** `FRM_CODIGO`, `FRM_CODIGO_REFERENCIA`
  - Constraint: `FR_DEP_FORMULARIO_FOR_674346A6`

---

### FR_DEP_FORMULARIO_REGRA

**Formulário associado:** `fr_dep_formulario_regra`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `REG_COD` 🔑 | INTEGER | Não | — |

**Chave Primária:** `FRM_CODIGO`, `REG_COD`
  - Constraint: `FR_DEP_FORMULARIO_REGRA_PKEY`

---

### FR_DEP_FORMULARIO_RELATORIO

**Formulário associado:** `fr_dep_formulario_relatorio`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `REL_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `FRM_CODIGO`, `REL_CODIGO`
  - Constraint: `FR_DEP_FORMULARIO_REL_30F9856A`

---

### FR_DEP_REGRA_COMPONENTE

**Formulário associado:** `fr_dep_regra_componente`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `COM_CODIGO` 🔑 | INTEGER | Não | — |
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `REG_COD`, `COM_CODIGO`, `FRM_CODIGO`
  - Constraint: `FR_DEP_REGRA_COMPONENTE_PKEY`

---

### FR_DEP_REGRA_FORMULARIO

**Formulário associado:** `fr_dep_regra_formulario`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `REG_COD`, `FRM_CODIGO`
  - Constraint: `FR_DEP_REGRA_FORMULARIO_PKEY`

---

### FR_DEP_REGRA_FUNCAO

**Formulário associado:** `fr_dep_regra_funcao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `FUN_COD` 🔑 | INTEGER | Não | — |

**Chave Primária:** `REG_COD`, `FUN_COD`
  - Constraint: `FR_DEP_REGRA_FUNCAO_PKEY`

---

### FR_DEP_REGRA_REGRA

**Formulário associado:** `fr_dep_regra_regra`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `REG_COD_REFERENCIA` 🔑 | INTEGER | Não | — |

**Chave Primária:** `REG_COD`, `REG_COD_REFERENCIA`
  - Constraint: `FR_DEP_REGRA_REGRA_PKEY`

---

### FR_DEP_REGRA_RELATORIO

**Formulário associado:** `fr_dep_regra_relatorio`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REG_COD` 🔑 | INTEGER | Não | — |
| `REL_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `REG_COD`, `REL_CODIGO`
  - Constraint: `FR_DEP_REGRA_RELATORIO_PKEY`

---

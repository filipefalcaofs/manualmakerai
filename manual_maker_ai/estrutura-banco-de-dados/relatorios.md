# Relatórios

> Tabelas que definem relatórios, seus parâmetros, fontes de dados e configurações de impressão.

**Total de tabelas neste domínio:** 2

## Tabelas

- [`FR_RELATORIO`](#fr_relatorio) — 7 colunas
- [`FR_RELATORIO_CATEGORIA`](#fr_relatorio_categoria) — 2 colunas

## Diagrama de Relacionamentos

```
  FR_RELATORIO_CATEGORIA --> FR_CATEGORIA
```

## Detalhamento das Tabelas

### FR_RELATORIO

**Formulário associado:** `fr_relatorio`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REL_CODIGO` 🔑 | INTEGER | Não | — |
| `SIS_CODIGO` | VARCHAR(3) | Não | — |
| `REL_NOME` | VARCHAR(196) | Não | — |
| `REL_CONTEUDO` | TEXT (CLOB) | Sim | — |
| `REL_MODIFICADO` | DATETIME | Sim | — |
| `REL_TAMANHO` | INTEGER | Sim | — |
| `USR_CODIGO` | INTEGER | Não | — |

**Chave Primária:** `REL_CODIGO`
  - Constraint: `FR_RELATORIO_PKEY`

**Referenciada por:** `FR_DOC_RELATORIO`, `FR_FORMULARIO`, `FR_PERMISSAO`

---

### FR_RELATORIO_CATEGORIA

**Formulário associado:** `fr_relatorio_categoria`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `REL_CODIGO` 🔑 | INTEGER | Não | — |
| `CAT_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `REL_CODIGO`, `CAT_CODIGO`
  - Constraint: `FR_RELATORIO_CATEGORIA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_RELATORIO_CATEGORI_A760E54C**: `cat_codigo` → `FR_CATEGORIA.cat_codigo`
  - Referencia: `FR_CATEGORIA`

---

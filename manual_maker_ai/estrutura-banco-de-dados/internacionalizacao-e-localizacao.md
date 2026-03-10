# Internacionalização e Localização

> Tabelas para suporte multi-idioma e localização de aplicações.

**Total de tabelas neste domínio:** 3

## Tabelas

- [`FR_IDIOMA`](#fr_idioma) — 4 colunas
- [`FR_TRADUCAO`](#fr_traducao) — 4 colunas
- [`FR_TRADUCAO_IDIOMA`](#fr_traducao_idioma) — 5 colunas

## Diagrama de Relacionamentos

```
  FR_TRADUCAO_IDIOMA --> FR_TRADUCAO
  FR_TRADUCAO_IDIOMA --> FR_IDIOMA
```

## Detalhamento das Tabelas

### FR_IDIOMA

**Formulário associado:** `fr_idioma`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `IDI_CODIGO` 🔑 | INTEGER | Não | — |
| `IDI_NOME` | VARCHAR(60) | Não | — |
| `IDI_SIGLA` | VARCHAR(20) | Não | — |
| `IDI_ORDEM` | INTEGER | Não | `999` |

**Chave Primária:** `IDI_CODIGO`
  - Constraint: `FR_IDIOMA_PKEY`

**Referenciada por:** `FR_TRADUCAO_IDIOMA`

---

### FR_TRADUCAO

**Formulário associado:** `fr_traducao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TRA_CODIGO` 🔑 | INTEGER | Não | — |
| `TRA_ITEM` | VARCHAR(300) | Sim | — |
| `TRA_TEXTO` | VARCHAR(2000) | Não | — |
| `TRA_TIPO` | VARCHAR(1) | Não | `'L'` |

**Chave Primária:** `TRA_CODIGO`
  - Constraint: `FR_TRADUCAO_PKEY`

**Referenciada por:** `FR_TRADUCAO_IDIOMA`

---

### FR_TRADUCAO_IDIOMA

**Formulário associado:** `fr_traducao_idioma`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TRA_CODIGO` 🔑 | INTEGER | Não | — |
| `IDI_CODIGO` 🔑 | INTEGER | Não | — |
| `TRI_TEXTO` | VARCHAR(2000) | Não | — |
| `TRI_SITUACAO` | VARCHAR(1) | Não | — |
| `TRI_HASH` | VARCHAR(40) | Sim | — |

**Chave Primária:** `TRA_CODIGO`, `IDI_CODIGO`
  - Constraint: `FR_TRADUCAO_IDIOMA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_TRADUCAO_IDIOMA_FK_C283DD2D**: `tra_codigo` → `FR_TRADUCAO.tra_codigo`
  - Referencia: `FR_TRADUCAO`
- **FR_TRADUCAO_IDIOMA_FK_BC06254F**: `idi_codigo` → `FR_IDIOMA.idi_codigo`
  - Referencia: `FR_IDIOMA`

---

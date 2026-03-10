# Compilador e Geração de Código

> Tabelas do compilador interno que traduz os projetos visuais em código executável para diferentes bancos de dados.

**Total de tabelas neste domínio:** 2

## Tabelas

- [`FR_COMPILADOR`](#fr_compilador) — 2 colunas
- [`FR_COMPILADOR_DATABASE`](#fr_compilador_database) — 3 colunas

## Diagrama de Relacionamentos

```
  FR_COMPILADOR_DATABASE --> FR_COMPILADOR
  FR_COMPILADOR_DATABASE --> FR_DATABASE
```

## Detalhamento das Tabelas

### FR_COMPILADOR

**Formulário associado:** `fr_compilador`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CPL_DESCRITOR` 🔑 | VARCHAR(80) | Não | — |
| `CPL_ESPECIFICACAO` | VARCHAR(350) | Não | — |

**Chave Primária:** `CPL_DESCRITOR`
  - Constraint: `FR_COMPILADOR_PKEY`

**Referenciada por:** `FR_COMPILADOR_DATABASE`

---

### FR_COMPILADOR_DATABASE

**Formulário associado:** `fr_compilador_database`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CPL_DESCRITOR` 🔑 | VARCHAR(80) | Não | — |
| `DBA_CODIGO` 🔑 | VARCHAR(10) | Não | — |
| `CDB_SINTAXE` | VARCHAR(2000) | Sim | — |

**Chave Primária:** `CPL_DESCRITOR`, `DBA_CODIGO`
  - Constraint: `FR_COMPILADOR_DATABASE_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_COMPILADOR_DATABAS_43DB64A9**: `cpl_descritor` → `FR_COMPILADOR.cpl_descritor`
  - Referencia: `FR_COMPILADOR`
- **FR_COMPILADOR_DATABAS_3CDD9B9E**: `dba_codigo` → `FR_DATABASE.dba_codigo`
  - Referencia: `FR_DATABASE`

---

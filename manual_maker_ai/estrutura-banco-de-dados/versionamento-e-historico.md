# Versionamento e Histórico

> Tabelas de controle de versões de formulários, regras e relatórios.

**Total de tabelas neste domínio:** 4

## Tabelas

- [`FR_HISTORICO_SQL`](#fr_historico_sql) — 5 colunas
- [`FR_LOG`](#fr_log) — 1 colunas
- [`FR_LOG_EVENT`](#fr_log_event) — 12 colunas
- [`FR_VERSAO`](#fr_versao) — 9 colunas

## Diagrama de Relacionamentos

```
  FR_HISTORICO_SQL --> FR_SISTEMA
```

## Detalhamento das Tabelas

### FR_HISTORICO_SQL

**Formulário associado:** `fr_historico_sql`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `SQL_CODIGO` 🔑 | INTEGER | Não | — |
| `SQL_SCRIPT` | TEXT (CLOB) | Não | — |
| `SQL_DATA` | DATETIME | Não | — |
| `SIS_CODIGO` | VARCHAR(3) | Não | — |
| `SQL_TABELA` | VARCHAR(100) | Sim | — |

**Chave Primária:** `SQL_CODIGO`
  - Constraint: `FR_HISTORICO_SQL_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_HISTORICO_SQL_FK_F_6F86F118**: `sis_codigo` → `FR_SISTEMA.sis_codigo`
  - Referencia: `FR_SISTEMA`

---

### FR_LOG

**Formulário associado:** `fr_log`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `LOG` | VARCHAR(6000) | Sim | — |

---

### FR_LOG_EVENT

**Formulário associado:** `fr_log_event`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `LOG_ID` 🔑 | INTEGER | Não | — |
| `LOG_DATA` | DATETIME | Sim | — |
| `LOG_HORA` | VARCHAR(8) | Sim | — |
| `LOG_CODFORM` | INTEGER | Sim | — |
| `LOG_DESCFORM` | VARCHAR(100) | Sim | — |
| `LOG_OPERACAO` | VARCHAR(1) | Sim | — |
| `LOG_USUARIO` | VARCHAR(30) | Sim | — |
| `LOG_SISTEMA` | VARCHAR(3) | Sim | — |
| `LOG_CHAVE` | VARCHAR(200) | Sim | — |
| `LOG_CHAVECONT` | VARCHAR(128) | Sim | — |
| `LOG_CONTEUDO` | TEXT (CLOB) | Sim | — |
| `LOG_IP` | VARCHAR(40) | Sim | — |

**Chave Primária:** `LOG_ID`
  - Constraint: `FR_LOG_EVENT_PKEY`

---

### FR_VERSAO

**Formulário associado:** `fr_versao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `VER_CODIGO` 🔑 | INTEGER | Não | — |
| `VER_TIPO` | VARCHAR(1) | Não | — |
| `SIS_CODIGO` | VARCHAR(3) | Sim | — |
| `OBJ_CODIGO` | INTEGER | Sim | — |
| `VER_DESCRICAO` | VARCHAR(100) | Não | — |
| `VER_CONTEUDO` | BLOB (Base64) | Não | — |
| `VER_DATA_HORA` | DATETIME | Não | — |
| `VER_VERSAO` | VARCHAR(10) | Não | — |
| `USR_CODIGO` | INTEGER | Não | — |

**Chave Primária:** `VER_CODIGO`
  - Constraint: `FR_VERSAO_PKEY`

---

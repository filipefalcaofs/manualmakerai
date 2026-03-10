# Menus e Navegação

> Tabelas que definem a estrutura de menus e navegação das aplicações publicadas.

**Total de tabelas neste domínio:** 1

## Tabelas

- [`FR_MENU`](#fr_menu) — 12 colunas

## Diagrama de Relacionamentos

```
  FR_MENU --> FR_MENU
  FR_MENU --> FR_FORMULARIO
```

## Detalhamento das Tabelas

### FR_MENU

**Formulário associado:** `fr_menu`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |
| `MNU_CODIGO` 🔑 | INTEGER | Não | — |
| `MNU_DESCRICAO` | VARCHAR(100) | Sim | — |
| `MNU_CODIGO_PARENT` | INTEGER | Sim | — |
| `MNU_INDICE` | INTEGER | Não | — |
| `FRM_CODIGO` | INTEGER | Sim | — |
| `MNU_TECLA` | VARCHAR(30) | Sim | — |
| `IMG_CODIGO` | INTEGER | Sim | — |
| `MNU_SEPARADOR` | VARCHAR(1) | Sim | — |
| `MNU_GUID` | VARCHAR(38) | Sim | — |
| `MNU_TIPO` | VARCHAR(1) | Sim | — |
| `REL_CODIGO` | INTEGER | Sim | — |

**Chave Primária:** `SIS_CODIGO`, `MNU_CODIGO`
  - Constraint: `FR_MENU_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_MENU_FK_FR_MENU_150069466**: `sis_codigo` → `FR_MENU.sis_codigo`, `mnu_codigo_parent` → `FR_MENU.sis_codigo`
  - Referencia: `FR_MENU`
- **FR_MENU_FK_FR_FORMULA_9EE71E21**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`

**Referenciada por:** `FR_MENU`

---

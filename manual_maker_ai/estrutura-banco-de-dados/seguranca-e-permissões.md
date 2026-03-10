# Segurança e Permissões

> Tabelas de controle de acesso, grupos, permissões de formulários, relatórios e funções.

**Total de tabelas neste domínio:** 6

## Tabelas

- [`FR_GRUPO`](#fr_grupo) — 4 colunas
- [`FR_PERMISSAO`](#fr_permissao) — 12 colunas
- [`FR_PERMISSAO_MAKER`](#fr_permissao_maker) — 7 colunas
- [`FR_USUARIO`](#fr_usuario) — 12 colunas
- [`FR_USUARIO_GRUPO`](#fr_usuario_grupo) — 3 colunas
- [`FR_USUARIO_SISTEMA`](#fr_usuario_sistema) — 9 colunas

## Diagrama de Relacionamentos

```
  FR_PERMISSAO --> FR_GRUPO
  FR_PERMISSAO --> FR_RELATORIO
  FR_PERMISSAO --> FR_FORMULARIO
  FR_USUARIO_GRUPO --> FR_GRUPO
  FR_USUARIO_GRUPO --> FR_USUARIO
  FR_USUARIO_SISTEMA --> FR_USUARIO
```

## Detalhamento das Tabelas

### FR_GRUPO

**Formulário associado:** `fr_grupo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `GRP_CODIGO` 🔑 | INTEGER | Não | — |
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |
| `GRP_NOME` | VARCHAR(40) | Não | — |
| `GRP_FILTRO_DICIONARIO` | VARCHAR(2000) | Sim | — |

**Chave Primária:** `GRP_CODIGO`, `SIS_CODIGO`
  - Constraint: `FR_GRUPO_PKEY`

**Referenciada por:** `FR_PERMISSAO`, `FR_USUARIO_GRUPO`

---

### FR_PERMISSAO

**Formulário associado:** `fr_permissao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `PER_CODIGO` 🔑 | INTEGER | Não | — |
| `GRP_CODIGO` | INTEGER | Não | — |
| `SIS_CODIGO` | VARCHAR(3) | Não | — |
| `REL_CODIGO` | INTEGER | Sim | — |
| `FRM_CODIGO` | INTEGER | Sim | — |
| `COM_CODIGO` | INTEGER | Sim | — |
| `MNU_CODIGO` | INTEGER | Sim | — |
| `PER_ADICIONAR` | VARCHAR(1) | Não | `'N'` |
| `PER_EXCLUIR` | VARCHAR(1) | Não | `'N'` |
| `PER_EDITAR` | VARCHAR(1) | Não | `'N'` |
| `PER_VISUALIZAR` | VARCHAR(1) | Não | `'N'` |
| `PER_HABILITADO` | VARCHAR(1) | Não | `'N'` |

**Chave Primária:** `PER_CODIGO`
  - Constraint: `FR_PERMISSAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_PERMISSAO_FK_FR_GR_F0CDDD83**: `grp_codigo` → `FR_GRUPO.grp_codigo`, `sis_codigo` → `FR_GRUPO.grp_codigo`
  - Referencia: `FR_GRUPO`
- **FR_PERMISSAO_FK_FR_RE_04D0226E**: `rel_codigo` → `FR_RELATORIO.rel_codigo`
  - Referencia: `FR_RELATORIO`
- **FR_PERMISSAO_FK_FR_FO_CC2EC5AE**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`

---

### FR_PERMISSAO_MAKER

**Formulário associado:** `fr_permissao_maker`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `PMK_CODIGO` | INTEGER | Não | — |
| `GRP_CODIGO` | INTEGER | Não | — |
| `PMK_EDITAR` | VARCHAR(1) | Não | `'N'` |
| `PMK_EXCLUIR` | VARCHAR(1) | Não | `'N'` |
| `FRM_CODIGO` | INTEGER | Sim | — |
| `REL_CODIGO` | INTEGER | Sim | — |
| `REG_COD` | INTEGER | Sim | — |

---

### FR_USUARIO

**Formulário associado:** `fr_usuario`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `USR_CODIGO` 🔑 | INTEGER | Não | — |
| `USR_LOGIN` | VARCHAR(20) | Não | — |
| `USR_SENHA` | VARCHAR(64) | Sim | — |
| `USR_ADMINISTRADOR` | VARCHAR(1) | Não | `'N'` |
| `USR_TIPO_EXPIRACAO` | VARCHAR(1) | Não | `'N'` |
| `USR_DIAS_EXPIRACAO` | INTEGER | Sim | — |
| `USR_IMAGEM_DIGITAL` | BLOB (Base64) | Sim | — |
| `USR_FOTO` | BLOB (Base64) | Sim | — |
| `USR_NOME` | VARCHAR(60) | Não | — |
| `USR_EMAIL` | VARCHAR(120) | Sim | — |
| `USR_DIGITAL` | INTEGER | Sim | — |
| `USR_INICIO_EXPIRACAO` | DATETIME | Sim | — |

**Chave Primária:** `USR_CODIGO`
  - Constraint: `FR_USUARIO_PKEY`

**Chave Única:** `usr_login`
  - Constraint: `FR_USUARIO_UQ_USR_LOGIN`

**Referenciada por:** `FR_USUARIO_GRUPO`, `FR_USUARIO_SISTEMA`

---

### FR_USUARIO_GRUPO

**Formulário associado:** `fr_usuario_grupo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `GRP_CODIGO` 🔑 | INTEGER | Não | — |
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |
| `USR_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `GRP_CODIGO`, `SIS_CODIGO`, `USR_CODIGO`
  - Constraint: `FR_USUARIO_GRUPO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_USUARIO_GRUPO_FK_F_6C8BD6F2**: `grp_codigo` → `FR_GRUPO.grp_codigo`, `sis_codigo` → `FR_GRUPO.grp_codigo`
  - Referencia: `FR_GRUPO`
- **FR_USUARIO_GRUPO_FK_F_88199298**: `usr_codigo` → `FR_USUARIO.usr_codigo`
  - Referencia: `FR_USUARIO`

---

### FR_USUARIO_SISTEMA

**Formulário associado:** `fr_usuario_sistema`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `USR_CODIGO` 🔑 | INTEGER | Não | — |
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |
| `USS_ACESSO_EXTERNO` | VARCHAR(1) | Não | `'N'` |
| `USS_ADMINISTRADOR` | VARCHAR(1) | Não | `'N'` |
| `USS_ACESSO_MAKER` | VARCHAR(1) | Não | `'N'` |
| `USS_CRIAR_FORMULARIO` | VARCHAR(1) | Não | `'N'` |
| `USS_CRIAR_RELATORIO` | VARCHAR(1) | Não | `'N'` |
| `USS_ACESSAR` | VARCHAR(1) | Não | `'N'` |
| `USS_CRIAR_REGRA` | VARCHAR(1) | Não | `'N'` |

**Chave Primária:** `USR_CODIGO`, `SIS_CODIGO`
  - Constraint: `FR_USUARIO_SISTEMA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_USUARIO_SISTEMA_FK_0B16A65D**: `usr_codigo` → `FR_USUARIO.usr_codigo`
  - Referencia: `FR_USUARIO`

---

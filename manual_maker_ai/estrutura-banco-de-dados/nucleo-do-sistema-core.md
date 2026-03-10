# Núcleo do Sistema (Core)

> Tabelas fundamentais que sustentam toda a estrutura do Maker AI, incluindo sistemas, formulários, componentes e configurações.

**Total de tabelas neste domínio:** 16

## Tabelas

- [`FR_CAMPO`](#fr_campo) — 5 colunas
- [`FR_CATEGORIA`](#fr_categoria) — 2 colunas
- [`FR_COMPONENTE`](#fr_componente) — 4 colunas
- [`FR_COMPONENTE_CATEGORIA`](#fr_componente_categoria) — 3 colunas
- [`FR_CONFIGURACAO`](#fr_configuracao) — 5 colunas
- [`FR_CONTEXTO`](#fr_contexto) — 7 colunas
- [`FR_DATABASE`](#fr_database) — 2 colunas
- [`FR_DIAGRAMA`](#fr_diagrama) — 10 colunas
- [`FR_FORMULARIO`](#fr_formulario) — 31 colunas
- [`FR_FORMULARIO_CATEGORIA`](#fr_formulario_categoria) — 2 colunas
- [`FR_FORMULARIO_SISTEMA`](#fr_formulario_sistema) — 2 colunas
- [`FR_IMAGEM`](#fr_imagem) — 3 colunas
- [`FR_SISTEMA`](#fr_sistema) — 13 colunas
- [`FR_SISTEMA_CATEGORIA`](#fr_sistema_categoria) — 2 colunas
- [`FR_TABELA`](#fr_tabela) — 2 colunas
- [`FR_TIPODADO`](#fr_tipodado) — 4 colunas

## Diagrama de Relacionamentos

```
  FR_CAMPO --> FR_TABELA
  FR_COMPONENTE --> FR_FORMULARIO
  FR_COMPONENTE_CATEGORIA --> FR_CATEGORIA
  FR_CONTEXTO --> FR_SISTEMA
  FR_FORMULARIO --> FR_RELATORIO
  FR_FORMULARIO_CATEGORIA --> FR_FORMULARIO
  FR_FORMULARIO_CATEGORIA --> FR_CATEGORIA
  FR_FORMULARIO_SISTEMA --> FR_FORMULARIO
  FR_FORMULARIO_SISTEMA --> FR_SISTEMA
  FR_SISTEMA --> FR_IMAGEM
  FR_SISTEMA_CATEGORIA --> FR_CATEGORIA
```

## Detalhamento das Tabelas

### FR_CAMPO

**Formulário associado:** `fr_campo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TAB_NOME` 🔑 | VARCHAR(96) | Não | — |
| `CMP_NOME` 🔑 | VARCHAR(96) | Não | — |
| `CMP_DESCRICAO` | VARCHAR(200) | Não | — |
| `CMP_VALORPADRAO` | VARCHAR(60) | Sim | — |
| `TPD_CODIGO` | INTEGER | Sim | — |

**Chave Primária:** `TAB_NOME`, `CMP_NOME`
  - Constraint: `FR_CAMPO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_CAMPO_FK_FR_TABELA_FACC5902**: `tab_nome` → `FR_TABELA.tab_nome`
  - Referencia: `FR_TABELA`

---

### FR_CATEGORIA

**Formulário associado:** `fr_categoria`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CAT_CODIGO` 🔑 | INTEGER | Não | — |
| `CAT_NOME` | VARCHAR(60) | Não | — |

**Chave Primária:** `CAT_CODIGO`
  - Constraint: `FR_CATEGORIA_PKEY`

**Referenciada por:** `FR_COMPONENTE_CATEGORIA`, `FR_FORMULARIO_CATEGORIA`, `FR_RELATORIO_CATEGORIA`, `FR_SISTEMA_CATEGORIA`

---

### FR_COMPONENTE

**Formulário associado:** `fr_componente`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `COM_CODIGO` 🔑 | INTEGER | Não | — |
| `IMG_CODIGO` | INTEGER | Sim | — |
| `COM_TIPO` | VARCHAR(30) | Sim | — |

**Chave Primária:** `FRM_CODIGO`, `COM_CODIGO`
  - Constraint: `FR_COMPONENTE_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_COMPONENTE_FK_FR_F_8573AD65**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`

**Referenciada por:** `FR_ACAOCOMPONENTE`, `FR_PROPRIEDADE`

---

### FR_COMPONENTE_CATEGORIA

**Formulário associado:** `fr_componente_categoria`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `COM_CODIGO` 🔑 | INTEGER | Não | — |
| `CAT_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `FRM_CODIGO`, `COM_CODIGO`, `CAT_CODIGO`
  - Constraint: `FR_COMPONENTE_CATEGORIA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_COMPONENTE_CATEGOR_901D1FD1**: `cat_codigo` → `FR_CATEGORIA.cat_codigo`
  - Referencia: `FR_CATEGORIA`

---

### FR_CONFIGURACAO

**Formulário associado:** `fr_configuracao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CNF_CODIGO` 🔑 | INTEGER | Não | — |
| `CNF_VERSIONA_FORMULARIO` | INTEGER | Não | `100` |
| `CNF_VERSIONA_RELATORIO` | INTEGER | Não | `100` |
| `CNF_VERSIONA_REGRA` | INTEGER | Não | `100` |
| `CNF_MAKER_VERSION` | VARCHAR(20) | Não | — |

**Chave Primária:** `CNF_CODIGO`
  - Constraint: `FR_CONFIGURACAO_PKEY`

---

### FR_CONTEXTO

**Formulário associado:** `fr_contexto`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CTX_CODIGO` 🔑 | INTEGER | Não | — |
| `SIS_CODIGO` | VARCHAR(3) | Não | — |
| `CTX_VERSAO` | INTEGER | Não | — |
| `CTX_ESTRUTURA_BANCO` | TEXT (CLOB) | Sim | — |
| `CTX_FORMULARIOS` | TEXT (CLOB) | Sim | — |
| `CTX_FLUXOGRAMAS` | TEXT (CLOB) | Sim | — |
| `CTX_RELATORIOS` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `CTX_CODIGO`
  - Constraint: `FR_CONTEXTO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_CONTEXTO_FK_FR_SIS_73FFC89E**: `sis_codigo` → `FR_SISTEMA.sis_codigo`
  - Referencia: `FR_SISTEMA`

---

### FR_DATABASE

**Formulário associado:** `fr_database`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DBA_CODIGO` 🔑 | VARCHAR(10) | Não | — |
| `DBA_DESCRICAO` | VARCHAR(50) | Não | — |

**Chave Primária:** `DBA_CODIGO`
  - Constraint: `FR_DATABASE_PKEY`

**Referenciada por:** `FR_COMPILADOR_DATABASE`

---

### FR_DIAGRAMA

**Formulário associado:** `fr_diagrama`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DGR_COD` 🔑 | INTEGER | Não | — |
| `DGR_NOME` | VARCHAR(120) | Sim | — |
| `DGR_AUTOR` | VARCHAR(80) | Sim | — |
| `DGR_VERSAO` | VARCHAR(20) | Sim | — |
| `DGR_TIPOTABELA` | INTEGER | Sim | — |
| `DGR_DATACRIACAO` | DATETIME | Sim | — |
| `DGR_ATUALIZACAO` | DATETIME | Sim | — |
| `DGR_COMENTARIO` | TEXT (CLOB) | Sim | — |
| `DGR_PADRAOFK` | INTEGER | Sim | — |
| `DGR_LAYOUT` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `DGR_COD`
  - Constraint: `FR_DIAGRAMA_PKEY`

---

### FR_FORMULARIO

**Formulário associado:** `fr_formulario`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `IMG_INCLUIR` | INTEGER | Sim | — |
| `IMG_ALTERAR` | INTEGER | Sim | — |
| `IMG_EXCLUIR` | INTEGER | Sim | — |
| `IMG_GRAVAR` | INTEGER | Sim | — |
| `IMG_GRAVAR_MAIS` | INTEGER | Sim | `15` |
| `IMG_CANCELAR` | INTEGER | Sim | — |
| `IMG_ATUALIZAR` | INTEGER | Sim | — |
| `IMG_VALORES_PADRAO` | INTEGER | Sim | `17` |
| `IMG_UTILITARIO` | INTEGER | Sim | — |
| `IMG_LOG` | INTEGER | Sim | `16` |
| `IMG_SAIR` | INTEGER | Sim | — |
| `IMG_IMPRIMIR` | INTEGER | Sim | — |
| `IMG_AJUDA` | INTEGER | Sim | — |
| `IMG_PROXIMO` | INTEGER | Sim | — |
| `IMG_ULTIMO` | INTEGER | Sim | — |
| `IMG_PRIMEIRO` | INTEGER | Sim | — |
| `IMG_ANTERIOR` | INTEGER | Sim | — |
| `IMG_DUPLICAR` | INTEGER | Sim | — |
| `IMG_INCLUIR_IA` | INTEGER | Sim | — |
| `FRM_DESCRICAO` | VARCHAR(100) | Não | — |
| `FRM_TIPO` | VARCHAR(1) | Sim | — |
| `FRM_POSICAOX` | INTEGER | Sim | — |
| `FRM_POSICAOY` | INTEGER | Sim | — |
| `FRM_TAMANHO` | INTEGER | Sim | — |
| `FRM_ALTURA` | INTEGER | Sim | — |
| `FRM_TIPO_CRIACAO` | VARCHAR(1) | Não | `'0'` |
| `FRM_GUID` | VARCHAR(38) | Sim | — |
| `REL_CODIGO` | INTEGER | Sim | — |
| `USR_CODIGO` | INTEGER | Sim | — |
| `FRM_LOG` | VARCHAR(1) | Não | `'S'` |

**Chave Primária:** `FRM_CODIGO`
  - Constraint: `FR_FORMULARIO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_FORMULARIO_FK_FR_R_30A44CDE**: `rel_codigo` → `FR_RELATORIO.rel_codigo`
  - Referencia: `FR_RELATORIO`

**Referenciada por:** `FR_COMPONENTE`, `FR_CONSULTA_AVANCADA`, `FR_FONTEDADOS`, `FR_FORMULARIO_CATEGORIA`, `FR_FORMULARIO_SISTEMA`, `FR_MENU`, `FR_PERMISSAO`

---

### FR_FORMULARIO_CATEGORIA

**Formulário associado:** `fr_formulario_categoria`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `CAT_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `FRM_CODIGO`, `CAT_CODIGO`
  - Constraint: `FR_FORMULARIO_CATEGORIA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_FORMULARIO_CATEGOR_6D815A0B**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`
- **FR_FORMULARIO_CATEGOR_D6446AA9**: `cat_codigo` → `FR_CATEGORIA.cat_codigo`
  - Referencia: `FR_CATEGORIA`

---

### FR_FORMULARIO_SISTEMA

**Formulário associado:** `fr_formulario_sistema`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |

**Chave Primária:** `FRM_CODIGO`, `SIS_CODIGO`
  - Constraint: `FR_FORMULARIO_SISTEMA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_FORMULARIO_SISTEMA_00955CEA**: `frm_codigo` → `FR_FORMULARIO.frm_codigo`
  - Referencia: `FR_FORMULARIO`
- **FR_FORMULARIO_SISTEMA_6BF65371**: `sis_codigo` → `FR_SISTEMA.sis_codigo`
  - Referencia: `FR_SISTEMA`

---

### FR_IMAGEM

**Formulário associado:** `fr_imagem`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `IMG_CODIGO` 🔑 | INTEGER | Não | — |
| `IMG_IMAGEM` | BLOB (Base64) | Não | — |
| `IMG_GUID` | VARCHAR(38) | Sim | — |

**Chave Primária:** `IMG_CODIGO`
  - Constraint: `FR_IMAGEM_PKEY`

**Referenciada por:** `FR_SISTEMA`

---

### FR_SISTEMA

**Formulário associado:** `fr_sistema`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |
| `SIS_DESCRICAO` | VARCHAR(200) | Não | — |
| `IMG_CODIGO` | INTEGER | Sim | — |
| `IMG_CODIGO_ICONE` | INTEGER | Sim | — |
| `SIS_SQLDATALIMITE` | VARCHAR(2000) | Sim | — |
| `SIS_SQLDADOSENTIDADE` | VARCHAR(2000) | Sim | — |
| `SIS_SQLINFORMACOES` | VARCHAR(2000) | Sim | — |
| `SIS_CHECK` | VARCHAR(30) | Sim | — |
| `SIS_ACESSOEXTERNO` | BOOLEAN | Sim | — |
| `SIS_GRUPOEXTERNO` | INTEGER | Sim | — |
| `SIS_INFORMACAO` | VARCHAR(2000) | Sim | — |
| `SIS_RESUMO` | TEXT (CLOB) | Sim | — |
| `SIS_UNIQUE_IDENTIFIER` | VARCHAR(38) | Sim | — |

**Chave Primária:** `SIS_CODIGO`
  - Constraint: `FR_SISTEMA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_SISTEMA_FK_FR_IMAG_A7C9B10D**: `img_codigo` → `FR_IMAGEM.img_codigo`
  - Referencia: `FR_IMAGEM`

**Referenciada por:** `FR_CONTEXTO`, `FR_DOC_PRINCIPAL`, `FR_FORMULARIO_SISTEMA`, `FR_HISTORICO_SQL`, `FR_TAREFA`

---

### FR_SISTEMA_CATEGORIA

**Formulário associado:** `fr_sistema_categoria`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `SIS_CODIGO` 🔑 | VARCHAR(3) | Não | — |
| `CAT_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `SIS_CODIGO`, `CAT_CODIGO`
  - Constraint: `FR_SISTEMA_CATEGORIA_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_SISTEMA_CATEGORIA__819A84BB**: `cat_codigo` → `FR_CATEGORIA.cat_codigo`
  - Referencia: `FR_CATEGORIA`

---

### FR_TABELA

**Formulário associado:** `fr_tabela`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TAB_NOME` 🔑 | VARCHAR(96) | Não | — |
| `TAB_DESCRICAO` | VARCHAR(96) | Não | — |

**Chave Primária:** `TAB_NOME`
  - Constraint: `FR_TABELA_PKEY`

**Referenciada por:** `FR_CAMPO`

---

### FR_TIPODADO

**Formulário associado:** `fr_tipodado`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `TPD_CODIGO` 🔑 | INTEGER | Não | — |
| `TPD_DESCRICAO` | VARCHAR(30) | Não | — |
| `TPD_MASCARAFORMATACAO` | VARCHAR(254) | Sim | — |
| `TPD_MASCARAEDICAO` | VARCHAR(254) | Sim | — |

**Chave Primária:** `TPD_CODIGO`
  - Constraint: `FR_TIPODADO_PKEY`

---

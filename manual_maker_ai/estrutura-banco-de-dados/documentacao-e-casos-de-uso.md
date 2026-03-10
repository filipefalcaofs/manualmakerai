# Documentação e Casos de Uso

> Tabelas que armazenam a documentação de projeto, casos de uso, atores, diagramas de contexto, requisitos e benefícios.

**Total de tabelas neste domínio:** 24

## Tabelas

- [`FR_DOC_APROVACAO`](#fr_doc_aprovacao) — 4 colunas
- [`FR_DOC_ATOR`](#fr_doc_ator) — 8 colunas
- [`FR_DOC_BENEFICIO`](#fr_doc_beneficio) — 3 colunas
- [`FR_DOC_CASO_USO`](#fr_doc_caso_uso) — 7 colunas
- [`FR_DOC_CASO_USO_ATOR`](#fr_doc_caso_uso_ator) — 5 colunas
- [`FR_DOC_CASO_USO_EXTENSAO`](#fr_doc_caso_uso_extensao) — 4 colunas
- [`FR_DOC_CASO_USO_GENERALIZACAO`](#fr_doc_caso_uso_generalizacao) — 3 colunas
- [`FR_DOC_CASO_USO_INCLUSAO`](#fr_doc_caso_uso_inclusao) — 3 colunas
- [`FR_DOC_DIAGRAMA_CONTEXTO`](#fr_doc_diagrama_contexto) — 4 colunas
- [`FR_DOC_DIAG_CONT_CAS_USO_ATO`](#fr_doc_diag_cont_cas_uso_ato) — 2 colunas
- [`FR_DOC_FORMULARIO`](#fr_doc_formulario) — 3 colunas
- [`FR_DOC_FORMULARIO_IMAGEM`](#fr_doc_formulario_imagem) — 6 colunas
- [`FR_DOC_HIPOTESE_TRABALHO`](#fr_doc_hipotese_trabalho) — 3 colunas
- [`FR_DOC_INTERFACE`](#fr_doc_interface) — 3 colunas
- [`FR_DOC_INTERPRETACAO_CAMPO`](#fr_doc_interpretacao_campo) — 3 colunas
- [`FR_DOC_LIMITE`](#fr_doc_limite) — 2 colunas
- [`FR_DOC_MATERIAL_REFERENCIA`](#fr_doc_material_referencia) — 3 colunas
- [`FR_DOC_MODO_OPERACAO`](#fr_doc_modo_operacao) — 2 colunas
- [`FR_DOC_PRINCIPAL`](#fr_doc_principal) — 14 colunas
- [`FR_DOC_REGRAS_IMAGEM`](#fr_doc_regras_imagem) — 6 colunas
- [`FR_DOC_RELATORIO`](#fr_doc_relatorio) — 5 colunas
- [`FR_DOC_REQUISITO`](#fr_doc_requisito) — 3 colunas
- [`FR_DOC_RESTRICAO`](#fr_doc_restricao) — 3 colunas
- [`FR_DOC_VERSAO`](#fr_doc_versao) — 4 colunas

## Diagrama de Relacionamentos

```
  FR_DOC_APROVACAO --> FR_DOC_PRINCIPAL
  FR_DOC_ATOR --> FR_DOC_PRINCIPAL
  FR_DOC_BENEFICIO --> FR_DOC_PRINCIPAL
  FR_DOC_CASO_USO --> FR_DOC_PRINCIPAL
  FR_DOC_CASO_USO_ATOR --> FR_DOC_ATOR
  FR_DOC_CASO_USO_EXTENSAO --> FR_DOC_CASO_USO
  FR_DOC_CASO_USO_GENERALIZACAO --> FR_DOC_CASO_USO
  FR_DOC_CASO_USO_INCLUSAO --> FR_DOC_CASO_USO
  FR_DOC_DIAGRAMA_CONTEXTO --> FR_DOC_PRINCIPAL
  FR_DOC_DIAG_CONT_CAS_USO_ATO --> FR_DOC_DIAGRAMA_CONTEXTO
  FR_DOC_FORMULARIO --> FR_DOC_PRINCIPAL
  FR_DOC_FORMULARIO_IMAGEM --> FR_DOC_PRINCIPAL
  FR_DOC_HIPOTESE_TRABALHO --> FR_DOC_ATOR
  FR_DOC_INTERFACE --> FR_DOC_PRINCIPAL
  FR_DOC_INTERPRETACAO_CAMPO --> FR_DOC_PRINCIPAL
  FR_DOC_LIMITE --> FR_DOC_PRINCIPAL
  FR_DOC_MATERIAL_REFERENCIA --> FR_DOC_PRINCIPAL
  FR_DOC_MODO_OPERACAO --> FR_DOC_PRINCIPAL
  FR_DOC_PRINCIPAL --> FR_SISTEMA
  FR_DOC_REGRAS_IMAGEM --> FR_DOC_PRINCIPAL
  FR_DOC_REGRAS_IMAGEM --> FR_REGRAS
  FR_DOC_RELATORIO --> FR_DOC_PRINCIPAL
  FR_DOC_RELATORIO --> FR_RELATORIO
  FR_DOC_REQUISITO --> FR_DOC_PRINCIPAL
  FR_DOC_RESTRICAO --> FR_DOC_PRINCIPAL
  FR_DOC_VERSAO --> FR_DOC_PRINCIPAL
```

## Detalhamento das Tabelas

### FR_DOC_APROVACAO

**Formulário associado:** `fr_doc_aprovacao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `APR_NOME` 🔑 | VARCHAR(255) | Não | — |
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `APR_CARGO` | VARCHAR(255) | Sim | — |
| `APR_PARTICIPACAO` | VARCHAR(255) | Sim | — |

**Chave Primária:** `APR_NOME`, `DOC_CODIGO`
  - Constraint: `FR_DOC_APROVACAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_APROVACAO_FK_F_7514E1C2**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_ATOR

**Formulário associado:** `fr_doc_ator`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ATO_CODIGO` 🔑 | INTEGER | Não | — |
| `ATO_FREQUENCIA_USO` | VARCHAR(255) | Sim | — |
| `ATO_NIVEL_INSTRUCAO` | VARCHAR(255) | Sim | — |
| `ATO_NOME` | VARCHAR(255) | Sim | — |
| `ATO_PROFICIENCIA_APLICACAO` | VARCHAR(255) | Sim | — |
| `ATO_PROFICIENCIA_INFORMATICA` | VARCHAR(255) | Sim | — |
| `ATO_USUARIO` | INTEGER | Sim | — |
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `ATO_CODIGO`, `DOC_CODIGO`
  - Constraint: `FR_DOC_ATOR_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_ATOR_FK_FR_DOC_7D378176**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

**Referenciada por:** `FR_DOC_CASO_USO_ATOR`, `FR_DOC_HIPOTESE_TRABALHO`

---

### FR_DOC_BENEFICIO

**Formulário associado:** `fr_doc_beneficio`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `BEN_DESCRICAO` 🔑 | VARCHAR(500) | Não | — |
| `BEN_VALOR` 🔑 | VARCHAR(50) | Não | — |
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `BEN_DESCRICAO`, `BEN_VALOR`, `DOC_CODIGO`
  - Constraint: `FR_DOC_BENEFICIO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_BENEFICIO_FK_F_7B47FD37**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_CASO_USO

**Formulário associado:** `fr_doc_caso_uso`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `USO_CODIGO` 🔑 | INTEGER | Não | — |
| `USO_NOME` | VARCHAR(255) | Sim | — |
| `USO_DESCRICAO` | TEXT (CLOB) | Sim | — |
| `USO_REQUISITO` | TEXT (CLOB) | Sim | — |
| `USO_VALIDACAO` | TEXT (CLOB) | Sim | — |
| `USO_CENARIO` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `DOC_CODIGO`, `USO_CODIGO`
  - Constraint: `FR_DOC_CASO_USO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_CASO_USO_FK_FR_011A1AF5**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

**Referenciada por:** `FR_DOC_CASO_USO_EXTENSAO`, `FR_DOC_CASO_USO_GENERALIZACAO`, `FR_DOC_CASO_USO_INCLUSAO`

---

### FR_DOC_CASO_USO_ATOR

**Formulário associado:** `fr_doc_caso_uso_ator`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ATO_CODIGO_ATIVO` 🔑 | INTEGER | Não | — |
| `ATO_CODIGO_PASSIVO` 🔑 | INTEGER | Não | — |
| `CAS_USO_ATO_CODIGO` 🔑 | INTEGER | Não | — |
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `USO_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `ATO_CODIGO_ATIVO`, `ATO_CODIGO_PASSIVO`, `CAS_USO_ATO_CODIGO`, `DOC_CODIGO`, `USO_CODIGO`
  - Constraint: `FR_DOC_CASO_USO_ATOR_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_CASO_USO_ATOR__DD6B6A0F**: `ato_codigo_ativo` → `FR_DOC_ATOR.ato_codigo`, `doc_codigo` → `FR_DOC_ATOR.ato_codigo`
  - Referencia: `FR_DOC_ATOR`

---

### FR_DOC_CASO_USO_EXTENSAO

**Formulário associado:** `fr_doc_caso_uso_extensao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `USO_CODIGO_PRINCIPAL` 🔑 | INTEGER | Não | — |
| `EXT_CONDICAO` | VARCHAR(255) | Sim | — |
| `USO_CODIGO_EXTENDIDO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `DOC_CODIGO`, `USO_CODIGO_PRINCIPAL`, `USO_CODIGO_EXTENDIDO`
  - Constraint: `FR_DOC_CASO_USO_EXTENSAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_CASO_USO_EXTEN_858C99F1**: `doc_codigo` → `FR_DOC_CASO_USO.doc_codigo`, `uso_codigo_principal` → `FR_DOC_CASO_USO.doc_codigo`, `uso_codigo_extendido` → `FR_DOC_CASO_USO.doc_codigo`
  - Referencia: `FR_DOC_CASO_USO`

---

### FR_DOC_CASO_USO_GENERALIZACAO

**Formulário associado:** `fr_doc_caso_uso_generalizacao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `USO_CODIGO_HERDADOR` 🔑 | INTEGER | Não | — |
| `USO_CODIGO_HERDADO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `DOC_CODIGO`, `USO_CODIGO_HERDADOR`, `USO_CODIGO_HERDADO`
  - Constraint: `FR_DOC_CASO_USO_GENER_43DE45C9`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_CASO_USO_GENER_FE3A128B**: `doc_codigo` → `FR_DOC_CASO_USO.doc_codigo`, `uso_codigo_herdador` → `FR_DOC_CASO_USO.doc_codigo`, `uso_codigo_herdado` → `FR_DOC_CASO_USO.doc_codigo`
  - Referencia: `FR_DOC_CASO_USO`

---

### FR_DOC_CASO_USO_INCLUSAO

**Formulário associado:** `fr_doc_caso_uso_inclusao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `USO_CODIGO_PRINCIPAL` 🔑 | INTEGER | Não | — |
| `USO_CODIGO_SUB_CASO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `DOC_CODIGO`, `USO_CODIGO_PRINCIPAL`, `USO_CODIGO_SUB_CASO`
  - Constraint: `FR_DOC_CASO_USO_INCLUSAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_CASO_USO_INCLU_06CE7A32**: `doc_codigo` → `FR_DOC_CASO_USO.doc_codigo`, `uso_codigo_principal` → `FR_DOC_CASO_USO.doc_codigo`
  - Referencia: `FR_DOC_CASO_USO`

---

### FR_DOC_DIAGRAMA_CONTEXTO

**Formulário associado:** `fr_doc_diagrama_contexto`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CON_CODIGO` 🔑 | INTEGER | Não | — |
| `CON_DESCRICAO` | VARCHAR(255) | Sim | — |
| `CON_IMAGEM` | BLOB (Base64) | Sim | — |
| `DOC_CODIGO` | INTEGER | Sim | — |

**Chave Primária:** `CON_CODIGO`
  - Constraint: `FR_DOC_DIAGRAMA_CONTEXTO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_DIAGRAMA_CONTE_166B6F5D**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

**Referenciada por:** `FR_DOC_DIAG_CONT_CAS_USO_ATO`

---

### FR_DOC_DIAG_CONT_CAS_USO_ATO

**Formulário associado:** `fr_doc_diag_cont_cas_uso_ato`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CAS_USO_ATO_CODIGO` 🔑 | INTEGER | Não | — |
| `CON_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `CAS_USO_ATO_CODIGO`, `CON_CODIGO`
  - Constraint: `FR_DOC_DIAG_CONT_CAS__571E35D0`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_DIAG_CONT_CAS__5C827A44**: `con_codigo` → `FR_DOC_DIAGRAMA_CONTEXTO.con_codigo`
  - Referencia: `FR_DOC_DIAGRAMA_CONTEXTO`

---

### FR_DOC_FORMULARIO

**Formulário associado:** `fr_doc_formulario`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `FRM_OBSERVACAO` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `DOC_CODIGO`, `FRM_CODIGO`
  - Constraint: `FR_DOC_FORMULARIO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_FORMULARIO_FK__338408EA**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_FORMULARIO_IMAGEM

**Formulário associado:** `fr_doc_formulario_imagem`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `FRM_CODIGO` 🔑 | INTEGER | Não | — |
| `FIM_ABA` 🔑 | VARCHAR(50) | Não | — |
| `FIM_ABA_NOME_ORIGINAL` | VARCHAR(50) | Sim | — |
| `FIM_IMAGEM` | BLOB (Base64) | Sim | — |
| `FIM_VERSAO` | VARCHAR(10) | Sim | — |

**Chave Primária:** `DOC_CODIGO`, `FRM_CODIGO`, `FIM_ABA`
  - Constraint: `FR_DOC_FORMULARIO_IMAGEM_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_FORMULARIO_IMA_71D5E63A**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_HIPOTESE_TRABALHO

**Formulário associado:** `fr_doc_hipotese_trabalho`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `ATO_CODIGO` 🔑 | INTEGER | Não | — |
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `TRA_DESCRICAO` 🔑 | VARCHAR(255) | Não | — |

**Chave Primária:** `ATO_CODIGO`, `DOC_CODIGO`, `TRA_DESCRICAO`
  - Constraint: `FR_DOC_HIPOTESE_TRABALHO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_HIPOTESE_TRABA_A56F448A**: `ato_codigo` → `FR_DOC_ATOR.ato_codigo`, `doc_codigo` → `FR_DOC_ATOR.ato_codigo`
  - Referencia: `FR_DOC_ATOR`

---

### FR_DOC_INTERFACE

**Formulário associado:** `fr_doc_interface`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `INT_DESCRICAO` 🔑 | VARCHAR(255) | Não | — |
| `INT_TIPO` 🔑 | VARCHAR(20) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `INT_DESCRICAO`, `INT_TIPO`
  - Constraint: `FR_DOC_INTERFACE_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_INTERFACE_FK_F_FA98BE35**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_INTERPRETACAO_CAMPO

**Formulário associado:** `fr_doc_interpretacao_campo`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `CAM_PADRAO` 🔑 | VARCHAR(255) | Não | — |
| `CAM_TIPO` 🔑 | VARCHAR(255) | Não | — |
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |

**Chave Primária:** `CAM_PADRAO`, `CAM_TIPO`, `DOC_CODIGO`
  - Constraint: `FR_DOC_INTERPRETACAO__3D6EE46A`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_INTERPRETACAO__868C2574**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_LIMITE

**Formulário associado:** `fr_doc_limite`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `LIM_DESCRICAO` 🔑 | VARCHAR(255) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `LIM_DESCRICAO`
  - Constraint: `FR_DOC_LIMITE_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_LIMITE_FK_FR_D_61F03CFD**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_MATERIAL_REFERENCIA

**Formulário associado:** `fr_doc_material_referencia`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `REF_BIBLIOGRAFIA` 🔑 | VARCHAR(500) | Não | — |
| `REF_TIPO` 🔑 | VARCHAR(50) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `REF_BIBLIOGRAFIA`, `REF_TIPO`
  - Constraint: `FR_DOC_MATERIAL_REFER_50ABC7B9`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_MATERIAL_REFER_E938B764**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_MODO_OPERACAO

**Formulário associado:** `fr_doc_modo_operacao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `OPE_DESCRICAO` 🔑 | VARCHAR(500) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `OPE_DESCRICAO`
  - Constraint: `FR_DOC_MODO_OPERACAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_MODO_OPERACAO__82C18CCD**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_PRINCIPAL

**Formulário associado:** `fr_doc_principal`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `DOC_AUTORIA` | VARCHAR(500) | Sim | — |
| `SIS_CODIGO` | VARCHAR(3) | Sim | — |
| `DOC_DATA` | VARCHAR(10) | Sim | — |
| `DOC_EMPRESA` | VARCHAR(255) | Sim | — |
| `DOC_LOCAL` | VARCHAR(255) | Sim | — |
| `DOC_MODELO_DADOS` | BLOB (Base64) | Sim | — |
| `DOC_OBJETIVO` | TEXT (CLOB) | Sim | — |
| `DOC_MISSAO` | TEXT (CLOB) | Sim | — |
| `DOC_COMPONENTES` | TEXT (CLOB) | Sim | — |
| `DOC_VISAO_GERAL` | TEXT (CLOB) | Sim | — |
| `DOC_CONVENCOES` | TEXT (CLOB) | Sim | — |
| `DOC_OBSERVACOES` | TEXT (CLOB) | Sim | — |
| `DOC_USUARIO_DESCRICAO` | TEXT (CLOB) | Sim | — |

**Chave Primária:** `DOC_CODIGO`
  - Constraint: `FR_DOC_PRINCIPAL_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_PRINCIPAL_FK_F_098FC7E1**: `sis_codigo` → `FR_SISTEMA.sis_codigo`
  - Referencia: `FR_SISTEMA`

**Referenciada por:** `FR_DOC_APROVACAO`, `FR_DOC_ATOR`, `FR_DOC_BENEFICIO`, `FR_DOC_CASO_USO`, `FR_DOC_DIAGRAMA_CONTEXTO`, `FR_DOC_FORMULARIO`, `FR_DOC_FORMULARIO_IMAGEM`, `FR_DOC_INTERFACE`, `FR_DOC_INTERPRETACAO_CAMPO`, `FR_DOC_LIMITE`, `FR_DOC_MATERIAL_REFERENCIA`, `FR_DOC_MODO_OPERACAO`, `FR_DOC_REGRAS_IMAGEM`, `FR_DOC_RELATORIO`, `FR_DOC_REQUISITO`, `FR_DOC_RESTRICAO`, `FR_DOC_VERSAO`

---

### FR_DOC_REGRAS_IMAGEM

**Formulário associado:** `fr_doc_regras_imagem`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `REG_COD` 🔑 | INTEGER | Não | — |
| `REG_DEPENDENCIA` | TEXT (CLOB) | Sim | — |
| `REG_IMAGEM` | BLOB (Base64) | Sim | — |
| `SIS_COD` | VARCHAR(3) | Sim | — |
| `REG_HASH` | VARCHAR(32) | Sim | — |

**Chave Primária:** `DOC_CODIGO`, `REG_COD`
  - Constraint: `FR_DOC_REGRAS_IMAGEM_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_REGRAS_IMAGEM__ED0FAE84**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`
- **FR_DOC_REGRAS_IMAGEM__F548B659**: `reg_cod` → `FR_REGRAS.reg_cod`
  - Referencia: `FR_REGRAS`

---

### FR_DOC_RELATORIO

**Formulário associado:** `fr_doc_relatorio`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `REL_CODIGO` 🔑 | INTEGER | Não | — |
| `REL_DESCRICAO` | VARCHAR(500) | Sim | — |
| `REL_OBJETIVO` | VARCHAR(500) | Sim | — |
| `REL_IMAGEM` | BLOB (Base64) | Sim | — |

**Chave Primária:** `DOC_CODIGO`, `REL_CODIGO`
  - Constraint: `FR_DOC_RELATORIO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_RELATORIO_FK_F_89C12705**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`
- **FR_DOC_RELATORIO_FK_F_A80CA1E1**: `rel_codigo` → `FR_RELATORIO.rel_codigo`
  - Referencia: `FR_RELATORIO`

---

### FR_DOC_REQUISITO

**Formulário associado:** `fr_doc_requisito`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `REQ_DESCRICAO` 🔑 | VARCHAR(255) | Não | — |
| `REQ_TIPO` 🔑 | VARCHAR(255) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `REQ_DESCRICAO`, `REQ_TIPO`
  - Constraint: `FR_DOC_REQUISITO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_REQUISITO_FK_F_53BB7089**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_RESTRICAO

**Formulário associado:** `fr_doc_restricao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `RES_DESCRICAO` 🔑 | VARCHAR(255) | Não | — |
| `RES_TIPO` 🔑 | VARCHAR(255) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `RES_DESCRICAO`, `RES_TIPO`
  - Constraint: `FR_DOC_RESTRICAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_RESTRICAO_FK_F_688825C8**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

### FR_DOC_VERSAO

**Formulário associado:** `fr_doc_versao`

#### Colunas

| Coluna | Tipo | Obrigatório | Valor Padrão |
|--------|------|:-----------:|:------------:|
| `DOC_CODIGO` 🔑 | INTEGER | Não | — |
| `VER_DATA` 🔑 | VARCHAR(10) | Não | — |
| `VER_REVISADA` 🔑 | VARCHAR(50) | Não | — |
| `VER_DESCRICAO` | VARCHAR(2000) | Não | — |

**Chave Primária:** `DOC_CODIGO`, `VER_DATA`, `VER_REVISADA`
  - Constraint: `FR_DOC_VERSAO_PKEY`

#### Relacionamentos (Foreign Keys)

- **FR_DOC_VERSAO_FK_FR_D_2FCAEE55**: `doc_codigo` → `FR_DOC_PRINCIPAL.doc_codigo`
  - Referencia: `FR_DOC_PRINCIPAL`

---

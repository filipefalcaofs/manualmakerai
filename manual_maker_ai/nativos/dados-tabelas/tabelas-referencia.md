# Tabelas Nativas - Dados de Referência (≤10 registros)

[← Voltar para Dados das Tabelas](README.md)

---

## FR_ACAO

*Alias:* fr_acao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| ACO_CODIGO | integer | 0 |
| ACO_NOME | string | 30 |

**Dados (10 registros):**

| ACO_CODIGO | ACO_NOME |
|---|---|
| 1 | Abrir Janela |
| 2 | Executar Stored Procedure |
| 3 | Habilitar/Desabilitar Objetos |
| 4 | Mostrar/Ocultar Objetos |
| 5 | Escolher Foco |
| 6 | Mudar Cor |
| 7 | Mudar Valor |
| 8 | Abrir Relatório |
| 11 | Abrir leitor digital |
| 12 | Executar Regra de negócio |

---

## FR_CAMPO

*Alias:* fr_campo

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| TAB_NOME | string | 96 |
| CMP_NOME | string | 96 |
| CMP_DESCRICAO | string | 200 |
| CMP_VALORPADRAO | string | 60 |
| TPD_CODIGO | integer | 0 |

**Dados (1 registros):**

| TAB_NOME | CMP_NOME | CMP_DESCRICAO | CMP_VALORPADRAO | TPD_CODIGO |
|---|---|---|---|---|
| fr_doc_regras_imagem | reg_hash | REG_DEPENDENCIA |  |  |

---

## FR_CATEGORIA

*Alias:* fr_categoria

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CAT_CODIGO | integer | 0 |
| CAT_NOME | string | 60 |

**Dados (2 registros):**

| CAT_CODIGO | CAT_NOME |
|---|---|
| 1 | Uso Geral |
| 2 | Template Default |

---

## FR_COMPONENTE_CATEGORIA

*Alias:* fr_componente_categoria

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FRM_CODIGO | integer | 0 |
| COM_CODIGO | integer | 0 |
| CAT_CODIGO | integer | 0 |


---

## FR_CONFIGURACAO

*Alias:* fr_configuracao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CNF_CODIGO | integer | 0 |
| CNF_VERSIONA_FORMULARIO | integer | 0 |
| CNF_VERSIONA_RELATORIO | integer | 0 |
| CNF_VERSIONA_REGRA | integer | 0 |
| CNF_MAKER_VERSION | string | 20 |

**Dados (1 registros):**

| CNF_CODIGO | CNF_VERSIONA_FORMULARIO | CNF_VERSIONA_RELATORIO | CNF_VERSIONA_REGRA | CNF_MAKER_VERSION |
|---|---|---|---|---|
| 1 | 20 | 20 | 20 | 6.1.0.11 |

---

## FR_CONSULTA_AVANCADA

*Alias:* fr_consulta_avancada

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FRM_CODIGO | integer | 0 |
| CAV_CODIGO | integer | 0 |
| CAV_DESCRICAO | string | 60 |
| CAV_TEXTO | string | 0 |


---

## FR_CONTEXTO

*Alias:* fr_contexto

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CTX_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| CTX_VERSAO | integer | 0 |
| CTX_ESTRUTURA_BANCO | string | 0 |
| CTX_FORMULARIOS | string | 0 |
| CTX_FLUXOGRAMAS | string | 0 |
| CTX_RELATORIOS | string | 0 |

**Dados (1 registros):**

| CTX_CODIGO | SIS_CODIGO | CTX_VERSAO | CTX_ESTRUTURA_BANCO | CTX_FORMULARIOS | CTX_FLUXOGRAMAS | CTX_RELATORIOS |
|---|---|---|---|---|---|---|
| 1 | PW8 | 1 | NgkhITczAj8dZE4/M3IjA2UDP2AXKQctHS88DicTX2cxHzUhMCNfLBphPSw3LnITZGcsCQYTBDcEAygGJD1fdDInJSM2IFclG2dGLTIRAQJkOkMdBkk+J... | MX8EBzhEVwEQYT5dLBYaNng7HnoyLzkOAgMgdiAsWEorGT0rMAwrHgdYNlgtAXt1fAIReB8sAx4AAS81IwNpdigYOlszHDwuBHcxLQQRAjZ4O08jMS89D... | MX8EBzhEVwEQYT5dLxE8LFM7PD8JKyFRBAY4LRMOcUE/FCUCKDVeDRh1MREDBQEzaA4wIBo7WAAfWSYpKztfWAQ1MywCGzgCA3YyAi4BAS5rDjQhMBUEE... |  |

---

## FR_DATABASE

*Alias:* fr_database

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DBA_CODIGO | string | 10 |
| DBA_DESCRICAO | string | 50 |

**Dados (6 registros):**

| DBA_CODIGO | DBA_DESCRICAO |
|---|---|
| db2v9 | DB2 |
| firebird2 | Firebird |
| mssql2000 | SQL Server |
| mysql5 | MySQL |
| oracle10g | Oracle |
| postgres82 | PostgreSQL |

---

## FR_DEP_FORMULARIO_FORMULARIO

*Alias:* fr_dep_formulario_formulario

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FRM_CODIGO | integer | 0 |
| FRM_CODIGO_REFERENCIA | integer | 0 |

**Dados (7 registros):**

| FRM_CODIGO | FRM_CODIGO_REFERENCIA |
|---|---|
| 7149 | 7148 |
| 7151 | 7149 |
| 7150 | 7151 |
| 7146 | 7150 |
| 7146 | 7147 |
| 7146 | 7149 |
| 1 | 20 |

---

## FR_DEP_FORMULARIO_RELATORIO

*Alias:* fr_dep_formulario_relatorio

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FRM_CODIGO | integer | 0 |
| REL_CODIGO | integer | 0 |


---

## FR_DEP_REGRA_COMPONENTE

*Alias:* fr_dep_regra_componente

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REG_COD | integer | 0 |
| COM_CODIGO | integer | 0 |
| FRM_CODIGO | integer | 0 |


---

## FR_DEP_REGRA_FORMULARIO

*Alias:* fr_dep_regra_formulario

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REG_COD | integer | 0 |
| FRM_CODIGO | integer | 0 |

**Dados (1 registros):**

| REG_COD | FRM_CODIGO |
|---|---|
| 39 | 54 |

---

## FR_DEP_REGRA_FUNCAO

*Alias:* fr_dep_regra_funcao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REG_COD | integer | 0 |
| FUN_COD | integer | 0 |


---

## FR_DEP_REGRA_RELATORIO

*Alias:* fr_dep_regra_relatorio

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REG_COD | integer | 0 |
| REL_CODIGO | integer | 0 |


---

## FR_DIAGRAMA

*Alias:* fr_diagrama

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DGR_COD | integer | 0 |
| DGR_NOME | string | 120 |
| DGR_AUTOR | string | 80 |
| DGR_VERSAO | string | 20 |
| DGR_TIPOTABELA | integer | 0 |
| DGR_DATACRIACAO | datetime |  |
| DGR_ATUALIZACAO | datetime |  |
| DGR_COMENTARIO | string | 0 |
| DGR_PADRAOFK | integer | 0 |
| DGR_LAYOUT | string | 0 |


---

## FR_DOC_APROVACAO

*Alias:* fr_doc_aprovacao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| APR_NOME | string | 255 |
| DOC_CODIGO | integer | 0 |
| APR_CARGO | string | 255 |
| APR_PARTICIPACAO | string | 255 |


---

## FR_DOC_ATOR

*Alias:* fr_doc_ator

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| ATO_CODIGO | integer | 0 |
| ATO_FREQUENCIA_USO | string | 255 |
| ATO_NIVEL_INSTRUCAO | string | 255 |
| ATO_NOME | string | 255 |
| ATO_PROFICIENCIA_APLICACAO | string | 255 |
| ATO_PROFICIENCIA_INFORMATICA | string | 255 |
| ATO_USUARIO | integer | 0 |
| DOC_CODIGO | integer | 0 |


---

## FR_DOC_BENEFICIO

*Alias:* fr_doc_beneficio

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| BEN_DESCRICAO | string | 500 |
| BEN_VALOR | string | 50 |
| DOC_CODIGO | integer | 0 |


---

## FR_DOC_CASO_USO

*Alias:* fr_doc_caso_uso

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| USO_CODIGO | integer | 0 |
| USO_NOME | string | 255 |
| USO_DESCRICAO | string | 0 |
| USO_REQUISITO | string | 0 |
| USO_VALIDACAO | string | 0 |
| USO_CENARIO | string | 0 |


---

## FR_DOC_CASO_USO_ATOR

*Alias:* fr_doc_caso_uso_ator

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| ATO_CODIGO_ATIVO | integer | 0 |
| ATO_CODIGO_PASSIVO | integer | 0 |
| CAS_USO_ATO_CODIGO | integer | 0 |
| DOC_CODIGO | integer | 0 |
| USO_CODIGO | integer | 0 |


---

## FR_DOC_CASO_USO_EXTENSAO

*Alias:* fr_doc_caso_uso_extensao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| USO_CODIGO_PRINCIPAL | integer | 0 |
| EXT_CONDICAO | string | 255 |
| USO_CODIGO_EXTENDIDO | integer | 0 |


---

## FR_DOC_CASO_USO_GENERALIZACAO

*Alias:* fr_doc_caso_uso_generalizacao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| USO_CODIGO_HERDADOR | integer | 0 |
| USO_CODIGO_HERDADO | integer | 0 |


---

## FR_DOC_CASO_USO_INCLUSAO

*Alias:* fr_doc_caso_uso_inclusao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| USO_CODIGO_PRINCIPAL | integer | 0 |
| USO_CODIGO_SUB_CASO | integer | 0 |


---

## FR_DOC_DIAGRAMA_CONTEXTO

*Alias:* fr_doc_diagrama_contexto

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CON_CODIGO | integer | 0 |
| CON_DESCRICAO | string | 255 |
| CON_IMAGEM | base64 |  |
| DOC_CODIGO | integer | 0 |


---

## FR_DOC_DIAG_CONT_CAS_USO_ATO

*Alias:* fr_doc_diag_cont_cas_uso_ato

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CAS_USO_ATO_CODIGO | integer | 0 |
| CON_CODIGO | integer | 0 |


---

## FR_DOC_FORMULARIO

*Alias:* fr_doc_formulario

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| FRM_CODIGO | integer | 0 |
| FRM_OBSERVACAO | string | 0 |


---

## FR_DOC_FORMULARIO_IMAGEM

*Alias:* fr_doc_formulario_imagem

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| FRM_CODIGO | integer | 0 |
| FIM_ABA | string | 50 |
| FIM_ABA_NOME_ORIGINAL | string | 50 |
| FIM_IMAGEM | base64 |  |
| FIM_VERSAO | string | 10 |


---

## FR_DOC_HIPOTESE_TRABALHO

*Alias:* fr_doc_hipotese_trabalho

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| ATO_CODIGO | integer | 0 |
| DOC_CODIGO | integer | 0 |
| TRA_DESCRICAO | string | 255 |


---

## FR_DOC_INTERFACE

*Alias:* fr_doc_interface

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| INT_DESCRICAO | string | 255 |
| INT_TIPO | string | 20 |


---

## FR_DOC_INTERPRETACAO_CAMPO

*Alias:* fr_doc_interpretacao_campo

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CAM_PADRAO | string | 255 |
| CAM_TIPO | string | 255 |
| DOC_CODIGO | integer | 0 |


---

## FR_DOC_LIMITE

*Alias:* fr_doc_limite

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| LIM_DESCRICAO | string | 255 |


---

## FR_DOC_MATERIAL_REFERENCIA

*Alias:* fr_doc_material_referencia

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| REF_BIBLIOGRAFIA | string | 500 |
| REF_TIPO | string | 50 |


---

## FR_DOC_MODO_OPERACAO

*Alias:* fr_doc_modo_operacao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| OPE_DESCRICAO | string | 500 |


---

## FR_DOC_PRINCIPAL

*Alias:* fr_doc_principal

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| DOC_AUTORIA | string | 500 |
| SIS_CODIGO | string | 3 |
| DOC_DATA | string | 10 |
| DOC_EMPRESA | string | 255 |
| DOC_LOCAL | string | 255 |
| DOC_MODELO_DADOS | base64 |  |
| DOC_OBJETIVO | string | 0 |
| DOC_MISSAO | string | 0 |
| DOC_COMPONENTES | string | 0 |
| DOC_VISAO_GERAL | string | 0 |
| DOC_CONVENCOES | string | 0 |
| DOC_OBSERVACOES | string | 0 |
| DOC_USUARIO_DESCRICAO | string | 0 |


---

## FR_DOC_REGRAS_IMAGEM

*Alias:* fr_doc_regras_imagem

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| REG_COD | integer | 0 |
| REG_DEPENDENCIA | string | 0 |
| REG_IMAGEM | base64 |  |
| SIS_COD | string | 3 |
| REG_HASH | string | 32 |


---

## FR_DOC_RELATORIO

*Alias:* fr_doc_relatorio

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| REL_CODIGO | integer | 0 |
| REL_DESCRICAO | string | 500 |
| REL_OBJETIVO | string | 500 |
| REL_IMAGEM | base64 |  |


---

## FR_DOC_REQUISITO

*Alias:* fr_doc_requisito

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| REQ_DESCRICAO | string | 255 |
| REQ_TIPO | string | 255 |


---

## FR_DOC_RESTRICAO

*Alias:* fr_doc_restricao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| RES_DESCRICAO | string | 255 |
| RES_TIPO | string | 255 |


---

## FR_DOC_VERSAO

*Alias:* fr_doc_versao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| DOC_CODIGO | integer | 0 |
| VER_DATA | string | 10 |
| VER_REVISADA | string | 50 |
| VER_DESCRICAO | string | 2000 |


---

## FR_FONTEDADOS

*Alias:* fr_fontedados

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FNT_CODIGO | integer | 0 |
| FNT_CODIGO_PARENT | integer | 0 |
| FNT_CAMPOCHAVE | string | 100 |
| FNT_TABELA | string | 30 |
| FNT_SQLSELECT | string | 6000 |
| FNT_SQLINSERT | string | 6000 |
| FNT_SQLUPDATE | string | 6000 |
| FNT_SQLDELETE | string | 6000 |
| FNT_CAMPOINCREMENTO | string | 100 |
| FRM_CODIGO | integer | 0 |
| FNT_CAMPOGRADE | string | 6000 |
| FNT_CAMPOPESQUISA | string | 6000 |
| FNT_SQLDEFAULT | string | 6000 |
| FNT_SQLMASCARA | string | 2000 |

**Dados (10 registros):**

| FNT_CODIGO | FNT_CODIGO_PARENT | FNT_CAMPOCHAVE | FNT_TABELA | FNT_SQLSELECT | FNT_SQLINSERT | FNT_SQLUPDATE | FNT_SQLDELETE | FNT_CAMPOINCREMENTO | FRM_CODIGO | FNT_CAMPOGRADE | FNT_CAMPOPESQUISA | FNT_SQLDEFAULT | FNT_SQLMASCARA |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 |  |  |  |  |  |  |  |  | 54 |  |  |  |  |
| 2 |  | sis_codigo | FR_SISTEMA | Select    FR_SISTEMA.SIS_CODIGO,    FR_SISTEMA.SIS_DESCRICAO,    FR_SISTEMA.SIS_CODIGO AS "Código do Sistema",    FR_... |  | sis_codigo  sis_descricao |  |  | 7149 | Código do Sistema;Descrição | Código do Sistema;Descrição |  |  |
| 3 |  | grp_codigo;sis_codigo | FR_GRUPO | Select    FR_GRUPO.GRP_CODIGO,    FR_GRUPO.SIS_CODIGO,    FR_GRUPO.GRP_NOME  From    FR_GRUPO  /*WHERE_NEW*/  /*ORDER... |  | grp_codigo  sis_codigo  grp_nome |  |  | 7148 |  |  | grp_codigo=SQL("SELECT COALESCE(MAX(GRP_CODIGO),0)+1 FROM FR_GRUPO") |  |
| 4 |  | grp_codigo;sis_codigo;usr_codigo | FR_USUARIO_GRUPO | Select    FR_USUARIO_GRUPO.GRP_CODIGO,    FR_USUARIO_GRUPO.SIS_CODIGO,    FR_USUARIO_GRUPO.USR_CODIGO  From    FR_USU... |  | grp_codigo  sis_codigo  usr_codigo |  |  | 7151 |  |  |  |  |
| 5 |  | usr_codigo;sis_codigo | FR_USUARIO_SISTEMA | Select    FR_USUARIO_SISTEMA.USR_CODIGO,    FR_USUARIO_SISTEMA.SIS_CODIGO,    FR_USUARIO_SISTEMA.USS_ACESSO_EXTERNO, ... |  | usr_codigo  sis_codigo  uss_acesso_externo  uss_administrador  uss_acessar |  |  | 7147 |  |  | uss_acessar=N  uss_acesso_externo=N  uss_administrador=N |  |
| 6 |  | usr_codigo;sis_codigo | FR_USUARIO_SISTEMA | Select    FR_USUARIO_SISTEMA.USR_CODIGO,    FR_USUARIO_SISTEMA.SIS_CODIGO,    FR_SISTEMA.SIS_DESCRICAO,    FR_USUARIO... |  | usr_codigo  sis_codigo  sis_descricao  usr_nome  Sistema  Descrição |  |  | 7150 | Sistema;Descrição | Sistema;Descrição |  |  |
| 7 |  | usr_codigo | FR_USUARIO | Select    U.USR_CODIGO,    U.USR_LOGIN,    U.USR_SENHA,    U.USR_ADMINISTRADOR,    U.USR_TIPO_EXPIRACAO,    U.USR_DIA... |  | usr_codigo  usr_login  usr_administrador  usr_tipo_expiracao  usr_nome |  |  | 7146 | login;nome | login;nome | usr_administrador=N  usr_codigo=SQL("SELECT COALESCE(MAX(USR_CODIGO),0)+1 FROM FR_USUARIO")  usr_senha='softwell'  us... |  |
| 8 |  |  |  |  |  |  |  |  | 37 |  |  |  |  |
| 9 |  |  |  |  |  |  |  |  | 20 |  |  |  |  |
| 10 |  |  |  |  |  |  |  |  | 19 |  |  |  |  |

---

## FR_FORMULARIO_CATEGORIA

*Alias:* fr_formulario_categoria

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FRM_CODIGO | integer | 0 |
| CAT_CODIGO | integer | 0 |

**Dados (5 registros):**

| FRM_CODIGO | CAT_CODIGO |
|---|---|
| 54 | 1 |
| 7149 | 2 |
| 37 | 1 |
| 20 | 1 |
| 19 | 1 |

---

## FR_GRUPO

*Alias:* fr_grupo

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| GRP_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| GRP_NOME | string | 40 |
| GRP_FILTRO_DICIONARIO | string | 2000 |


---

## FR_HISTORICO_IA

*Alias:* fr_historico_ia

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| IA_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| IA_PROMPT | string | 0 |
| IA_DATA | datetime |  |
| IA_CATEGORIA | integer | 0 |

**Dados (1 registros):**

| IA_CODIGO | SIS_CODIGO | IA_PROMPT | IA_DATA | IA_CATEGORIA |
|---|---|---|---|---|
| 1 | PW8 | Crie o formulário de acordo com HU. | 03/10/2026 11:26:43 AM | 2 |

---

## FR_HISTORICO_SQL

*Alias:* fr_historico_sql

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| SQL_CODIGO | integer | 0 |
| SQL_SCRIPT | string | 0 |
| SQL_DATA | datetime |  |
| SIS_CODIGO | string | 3 |
| SQL_TABELA | string | 100 |


---

## FR_IMAGEM

*Alias:* fr_imagem

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| IMG_CODIGO | integer | 0 |
| IMG_IMAGEM | base64 |  |
| IMG_GUID | string | 38 |

**Dados (3 registros):**

| IMG_CODIGO | IMG_IMAGEM | IMG_GUID |
|---|---|---|
| 1 | iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACXEAAAlxAYZ2/isAAAAwS... | {7D32BA27-FDCF-431E-B4B0-30CA4FBE896F} |
| 2 | iVBORw0KGgoAAAANSUhEUgAACjoAAAF5CAYAAAAsr2HaAAAACXBIWXMAAAsTAAALEwEAmpwYAAA4F2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94c... | {84CE88CA-DD84-4F46-AAA3-1916A412327F} |
| 3 | iVBORw0KGgoAAAANSUhEUgAAB9EAAAPECAYAAAAZ8svZAAAACXBIWXMAAAsTAAALEwEAmpwYAAA50mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94c... | {AFD7FE79-183A-4855-844B-56A3AB12CE6D} |

---

## FR_LISTAGEM

*Alias:* fr_listagem

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| LST_COD | integer | 0 |
| LST_USER | string | 100 |
| LST_NOME | string | 100 |
| LST_COMPONENTE | string | 100 |
| LST_JSON | string | 0 |
| LST_XML | string | 0 |
| LST_GUID | string | 36 |


---

## FR_LISTAGEM_FILTROS

*Alias:* fr_listagem_filtros

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| LST_FIL_COD | integer | 0 |
| LST_COD | string | 200 |
| USR_LOGIN | string | 200 |
| LST_FIL_JSON | string | 0 |


---

## FR_LISTAGEM_LISTA_FILTROS

*Alias:* fr_listagem_lista_filtros

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FIL_COD | integer | 0 |
| FIL_NOME_TABELA | string | 300 |
| FIL_CAMPO_CHAVE | string | 300 |
| FIL_SQL_SELECT | string | 0 |


---

## FR_LOG

*Alias:* fr_log

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| LOG | string | 6000 |


---

## FR_LOG_EVENT

*Alias:* fr_log_event

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| LOG_ID | integer | 0 |
| LOG_DATA | datetime |  |
| LOG_HORA | string | 8 |
| LOG_CODFORM | integer | 0 |
| LOG_DESCFORM | string | 100 |
| LOG_OPERACAO | string | 1 |
| LOG_USUARIO | string | 30 |
| LOG_SISTEMA | string | 3 |
| LOG_CHAVE | string | 200 |
| LOG_CHAVECONT | string | 128 |
| LOG_CONTEUDO | string | 0 |
| LOG_IP | string | 40 |


---

## FR_MENU

*Alias:* fr_menu

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| SIS_CODIGO | string | 3 |
| MNU_CODIGO | integer | 0 |
| MNU_DESCRICAO | string | 100 |
| MNU_CODIGO_PARENT | integer | 0 |
| MNU_INDICE | integer | 0 |
| FRM_CODIGO | integer | 0 |
| MNU_TECLA | string | 30 |
| IMG_CODIGO | integer | 0 |
| MNU_SEPARADOR | string | 1 |
| MNU_GUID | string | 38 |
| MNU_TIPO | string | 1 |
| REL_CODIGO | integer | 0 |


---

## FR_OPERADOR

*Alias:* fr_operador

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| OPDR_CODIGO | integer | 0 |
| OPDR_NOME | string | 40 |
| OPDR_TIPO | string | 1 |
| OPDR_PARAMETROS | string | 80 |


---

## FR_OPERANDO

*Alias:* fr_operando

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FMLA_CODIGO | integer | 0 |
| OPDO_ORDEM | integer | 0 |
| OPDO_FMLA_CODIGO | integer | 0 |
| OPDO_EXPRESSAO | string | 6000 |


---

## FR_PERMISSAO

*Alias:* fr_permissao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| PER_CODIGO | integer | 0 |
| GRP_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| REL_CODIGO | integer | 0 |
| FRM_CODIGO | integer | 0 |
| COM_CODIGO | integer | 0 |
| MNU_CODIGO | integer | 0 |
| PER_ADICIONAR | string | 1 |
| PER_EXCLUIR | string | 1 |
| PER_EDITAR | string | 1 |
| PER_VISUALIZAR | string | 1 |
| PER_HABILITADO | string | 1 |


---

## FR_PERMISSAO_MAKER

*Alias:* fr_permissao_maker

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| PMK_CODIGO | integer | 0 |
| GRP_CODIGO | integer | 0 |
| PMK_EDITAR | string | 1 |
| PMK_EXCLUIR | string | 1 |
| FRM_CODIGO | integer | 0 |
| REL_CODIGO | integer | 0 |
| REG_COD | integer | 0 |


---

## FR_PROCESSAMENTO

*Alias:* fr_processamento

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FR_PRO_ID | integer | 0 |
| FR_PRO_NOME | string | 500 |
| FR_PRO_DESCRICAO | string | 0 |
| FR_PRO_GUID | string | 40 |
| FR_PRO_PROMPT | string | 0 |
| FR_PRO_ENTRADA | string | 0 |
| FR_PRO_RETORNO | string | 0 |
| FR_PRO_CODIGO_FONTE | string | 0 |


---

## FR_REGRAS_ATIVIDADES

*Alias:* fr_regras_atividades

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| ATV_COD | integer | 0 |
| ATV_NOME | string | 50 |
| ATV_NOME_REAL | string | 50 |
| ATV_DESCRICAO | string | 500 |
| ATV_PARAMS | string | 500 |
| ATV_RETORNO | string | 50 |
| ATV_COMPATIBILIDADE | string | 10 |

**Dados (10 registros):**

| ATV_COD | ATV_NOME | ATV_NOME_REAL | ATV_DESCRICAO | ATV_PARAMS | ATV_RETORNO | ATV_COMPATIBILIDADE |
|---|---|---|---|---|---|---|
| 1 | Exibir Barra Progresso | ActShowProgressBar | Exibe barra de progresso | Letras |  | 1 |
| 2 | Incrementa Barra Progresso | ActIncProgressBar | Incrementa percentual concluído na barra de progresso | Número |  | 1 |
| 3 | Retira Barra Progresso | ActCloseProgressBar | Fecha barra de progresso |  |  | 1 |
| 4 | Mensagem de Alerta (Clássico) | ActWarningMessage | Exibe uma mensagem de alerta para o usuário | Letras |  | 1;2 |
| 5 | Mensagem de Erro (Clássico) | ActErrorMessage | Exibe uma mensagem de erro para o usuário | Letras |  | 0;1;2 |
| 6 | Mensagem de Alerta | ActNewWarningMessage | Exibe uma mensagem de alerta para o usuário. A mensagem será fechada automaticamente caso o 3º parâmetro seja especif... | Título;Mensagem;Tempo;Posição |  | 1;2 |
| 7 | Mensagem de Erro | ActNewErrorMessage | Exibe uma mensagem de erro para o usuário. A mensagem será fechada automaticamente caso o 3º parâmetro seja especific... | Título;Mensagem;Tempo;Posição |  | 1;2 |
| 8 | Alertar Aguardando Texto | ActNewPromptMessage | Exibe uma caixa de diálogo para o usuário informar um texto. A execução do fluxo é assícrona, ou seja, o fluxo onde e... | Título;Mensagem;TextoQuandoNulo;FluxoAoConfirmar;ParamsAoConfimar;FluxoAoCancelar;ParamsAoCancelar |  | 1;2 |
| 9 | Interação de Confirmação | ActNewInteractionConfirmMessage | Exibe uma mensagem de alerta onde o usuário confirma ou cancela uma ação. A execução do fluxo é assícrona, ou seja, o... | Título;Mensagem;FluxoAoConfirmar;ParamsAoConfimar;FluxoAoCancelar;ParamsAoCancelar |  | 1;2 |
| 10 | Mensagem de Sucesso | ActNewSuccessMessage | Exibe uma mensagem de sucesso para o usuário. A mensagem será fechada automaticamente caso o 3º parâmetro seja especi... | Título;Mensagem;Tempo;Posição |  | 1;2 |

---

## FR_REGRAS_BANCO

*Alias:* fr_regras_banco

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REG_COD | integer | 0 |
| BAN_SCRIPT | string | 0 |
| BAN_COMPILACAO | datetime |  |


---

## FR_REGRAS_CATEGORIAS

*Alias:* fr_regras_categorias

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CAT_COD | integer | 0 |
| CAT_NOME | string | 40 |
| CAT_SUPER | integer | 0 |

**Dados (4 registros):**

| CAT_COD | CAT_NOME | CAT_SUPER |
|---|---|---|
| 1 | Uso Geral |  |
| 2 | Formulário Principal | 1 |
| 3 | Formulário de Login | 1 |
| 4 | MKR_CATEGORY |  |

---

## FR_REGRAS_TRIGGERS

*Alias:* fr_regras_triggers

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| TAB_NOME | string | 100 |
| TAB_EVENTO | integer | 0 |
| REG_COD | integer | 0 |
| TAB_PARAMS | string | 0 |
| TAB_SCRIPT | string | 0 |
| TAB_COMPILACAO | datetime |  |


---

## FR_RELATORIO

*Alias:* fr_relatorio

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REL_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| REL_NOME | string | 196 |
| REL_CONTEUDO | string | 0 |
| REL_MODIFICADO | datetime |  |
| REL_TAMANHO | integer | 0 |
| USR_CODIGO | integer | 0 |


---

## FR_RELATORIO_CATEGORIA

*Alias:* fr_relatorio_categoria

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| REL_CODIGO | integer | 0 |
| CAT_CODIGO | integer | 0 |


---

## FR_SCHEMA

*Alias:* fr_schema

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| SCH_NOME | string | 200 |
| SCH_VERSAO | integer | 0 |

**Dados (3 registros):**

| SCH_NOME | SCH_VERSAO |
|---|---|
| dependences | 1 |
| dbsystem | 1 |
| base | 9 |

---

## FR_SESSAO

*Alias:* fr_sessao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| SES_CONEXAO | integer | 0 |
| SES_DATAHORA_LOGIN | datetime |  |
| SES_USUARIO | string | 20 |
| SES_NOME_USUARIO | string | 40 |
| SES_NOME_MAQUINA | string | 40 |
| SES_END_IP | string | 20 |
| SIS_CODIGO | string | 3 |

**Dados (2 registros):**

| SES_CONEXAO | SES_DATAHORA_LOGIN | SES_USUARIO | SES_NOME_USUARIO | SES_NOME_MAQUINA | SES_END_IP | SIS_CODIGO |
|---|---|---|---|---|---|---|
| 2464145 | 02/23/2026 3:49:00 PM | MASTER | master | 187.73.180.50 | 187.73.180.50 | PW8 |
| 1154357 | 03/10/2026 11:39:12 AM | MASTER | master | 172.18.0.1 | 172.18.0.1 | PW8 |

---

## FR_SISTEMA

*Alias:* fr_sistema

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| SIS_CODIGO | string | 3 |
| SIS_DESCRICAO | string | 200 |
| IMG_CODIGO | integer | 0 |
| IMG_CODIGO_ICONE | integer | 0 |
| SIS_SQLDATALIMITE | string | 2000 |
| SIS_SQLDADOSENTIDADE | string | 2000 |
| SIS_SQLINFORMACOES | string | 2000 |
| SIS_CHECK | string | 30 |
| SIS_ACESSOEXTERNO | boolean |  |
| SIS_GRUPOEXTERNO | integer | 0 |
| SIS_INFORMACAO | string | 2000 |
| SIS_RESUMO | string | 0 |
| SIS_UNIQUE_IDENTIFIER | string | 38 |
| SIS_IDENTIFICADOR | string | 50 |

**Dados (1 registros):**

| SIS_CODIGO | SIS_DESCRICAO | IMG_CODIGO | IMG_CODIGO_ICONE | SIS_SQLDATALIMITE | SIS_SQLDADOSENTIDADE | SIS_SQLINFORMACOES | SIS_CHECK | SIS_ACESSOEXTERNO | SIS_GRUPOEXTERNO | SIS_INFORMACAO | SIS_RESUMO | SIS_UNIQUE_IDENTIFIER | SIS_IDENTIFICADOR |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PW8 | SGFC - GESTÃO DE FOMENTOS CULTURAIS |  |  |  |  |  | E317DH35759G9989CGD63297 |  |  |  | O projeto de Gestão de Fomentos Culturais (SGFC) visa promover e fortalecer a cultura local por meio de iniciativas q... | 3409F270-9C2F-4244-A42A-49200BC3511D | A5D82CC6-C066-43D1-9784-C65A7B25AF7C |

---

## FR_SISTEMA_CATEGORIA

*Alias:* fr_sistema_categoria

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| SIS_CODIGO | string | 3 |
| CAT_CODIGO | integer | 0 |

**Dados (1 registros):**

| SIS_CODIGO | CAT_CODIGO |
|---|---|
| PW8 | 1 |

---

## FR_TAREFA

*Alias:* fr_tarefa

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| TRF_CODIGO | integer | 0 |
| TRF_DESCRICAO | string | 255 |
| SIS_CODIGO | string | 3 |
| REG_CODIGO | integer | 0 |
| TRF_DATA_INICIAL | datetime |  |
| TRF_DATA_FINAL | datetime |  |
| TRF_ATIVA | string | 1 |
| TRF_REGRA_PARAMETROS | string | 0 |
| TRF_TIPO_AGENDAMENTO | string | 15 |


---

## FR_TAREFA_TEMPO

*Alias:* fr_tarefa_tempo

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| TRT_CODIGO | integer | 0 |
| TRF_CODIGO | integer | 0 |
| TRT_TIPO | string | 15 |
| TRT_VALOR | integer | 0 |


---

## FR_TIPO_EVENT

*Alias:* fr_tipo_event

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| FTE_COD | integer | 0 |
| FTE_DESCRICAO | string | 20 |
| FTE_SIGLA | string | 1 |


---

## FR_TRADUCAO

*Alias:* fr_traducao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| TRA_CODIGO | integer | 0 |
| TRA_ITEM | string | 300 |
| TRA_TEXTO | string | 2000 |
| TRA_TIPO | string | 1 |


---

## FR_TRADUCAO_IDIOMA

*Alias:* fr_traducao_idioma

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| TRA_CODIGO | integer | 0 |
| IDI_CODIGO | integer | 0 |
| TRI_TEXTO | string | 2000 |
| TRI_SITUACAO | string | 1 |
| TRI_HASH | string | 40 |


---

## FR_USUARIO

*Alias:* fr_usuario

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| USR_CODIGO | integer | 0 |
| USR_LOGIN | string | 20 |
| USR_SENHA | string | 64 |
| USR_ADMINISTRADOR | string | 1 |
| USR_TIPO_EXPIRACAO | string | 1 |
| USR_DIAS_EXPIRACAO | integer | 0 |
| USR_IMAGEM_DIGITAL | base64 |  |
| USR_FOTO | base64 |  |
| USR_NOME | string | 60 |
| USR_EMAIL | string | 120 |
| USR_DIGITAL | float |  |
| USR_INICIO_EXPIRACAO | datetime |  |

**Dados (1 registros):**

| USR_CODIGO | USR_LOGIN | USR_SENHA | USR_ADMINISTRADOR | USR_TIPO_EXPIRACAO | USR_DIAS_EXPIRACAO | USR_IMAGEM_DIGITAL | USR_FOTO | USR_NOME | USR_EMAIL | USR_DIGITAL | USR_INICIO_EXPIRACAO |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | master | 6512bd43d9caa6e02c990b0a82652dca | S | N |  |  |  | master |  |  |  |

---

## FR_USUARIO_GRUPO

*Alias:* fr_usuario_grupo

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| GRP_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| USR_CODIGO | integer | 0 |


---

## FR_USUARIO_SISTEMA

*Alias:* fr_usuario_sistema

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| USR_CODIGO | integer | 0 |
| SIS_CODIGO | string | 3 |
| USS_ACESSO_EXTERNO | string | 1 |
| USS_ADMINISTRADOR | string | 1 |
| USS_ACESSO_MAKER | string | 1 |
| USS_CRIAR_FORMULARIO | string | 1 |
| USS_CRIAR_RELATORIO | string | 1 |
| USS_ACESSAR | string | 1 |
| USS_CRIAR_REGRA | string | 1 |


---

## FR_VERSAO

*Alias:* fr_versao

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| VER_CODIGO | integer | 0 |
| VER_TIPO | string | 1 |
| SIS_CODIGO | string | 3 |
| OBJ_CODIGO | integer | 0 |
| VER_DESCRICAO | string | 100 |
| VER_CONTEUDO | base64 |  |
| VER_DATA_HORA | datetime |  |
| VER_VERSAO | string | 10 |
| USR_CODIGO | integer | 0 |


---

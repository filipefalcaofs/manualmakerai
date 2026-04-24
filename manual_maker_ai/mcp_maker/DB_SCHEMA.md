# Modelo de Dados do Maker (SIG_MAKER)

Extraido do banco de producao via analise direta. 539 tabelas, nucleo em `FR_` (100 tabelas, 378K linhas).

## 1. Entidades Principais

### FR_FORMULARIO (876 formularios)
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| FRM_CODIGO | int PK | ID do formulario |
| FRM_DESCRICAO | varchar(100) | Nome/titulo |
| FRM_TIPO | char(1) | Tipo (null na maioria) |
| FRM_TAMANHO | int | Largura em pixels |
| FRM_ALTURA | int | Altura em pixels |
| FRM_GUID | varchar(38) | GUID unico |
| FRM_TIPO_CRIACAO | char(1) | '0'=manual, '1'=assistente |

### FR_COMPONENTE (10.870 componentes)
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| FRM_CODIGO | int PK/FK | Formulario pai |
| COM_CODIGO | int PK | ID do componente (sequencial global) |
| COM_TIPO | varchar(30) | Tipo do componente |

### FR_PROPRIEDADE (286.287 properties) — key-value store
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| FRM_CODIGO | int PK/FK | Formulario |
| COM_CODIGO | int PK/FK | Componente |
| PRO_NOME | varchar(100) PK | Nome da property |
| PRO_VALOR | varchar(max) | Valor |

### FR_REGRAS (2.445 regras)
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| REG_COD | int PK | ID da regra |
| REG_NOME | varchar(500) | Nome |
| REG_DESTINO | int | 0=ambos, 1=cliente, 2=servidor |
| REG_PARAMS | text | Parametros: `nome,tipo,tamanho,;` |
| REG_VARIAVEIS | text | Variaveis: `nome,tipo,tamanho,;` |
| REG_PARAMS_OUT | text | Tipo de retorno |
| REG_INTERFACE | text | DFM base64 (layout visual) |
| REG_SCRIPT | text | Script XML base64 (logica) |
| CAT_COD | int FK | Categoria (1=Uso Geral) |

### FR_FONTEDADOS (873 fontes)
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| FNT_CODIGO | int PK | ID da fonte |
| FRM_CODIGO | int FK | Formulario |
| FNT_TABELA | varchar(30) | Tabela principal |
| FNT_CAMPOCHAVE | varchar(100) | Chave primaria (`;` para compostas) |
| FNT_SQLSELECT | varchar(6000) | SELECT com `/*WHERE_NEW*/` `/*ORDER_NEW*/` |
| FNT_SQLUPDATE | varchar(6000) | Campos para UPDATE (um por linha) |
| FNT_CAMPOGRADE | varchar(6000) | Colunas da grade (`;` separados) |
| FNT_CAMPOPESQUISA | varchar(6000) | Colunas de pesquisa |
| FNT_SQLDEFAULT | varchar(6000) | Valores default: `CAMPO=SQL("...")` |

### FR_ACAOCOMPONENTE (1.872 vinculos)
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| FRM_CODIGO | int PK/FK | Formulario |
| COM_CODIGO | int PK/FK | Componente |
| ACO_CODIGO | int PK/FK | Tipo de acao (ver FR_ACAO) |
| ACC_MOMENTO | varchar(30) PK | Evento trigger |

### FR_PARAMETRO (3.714 parametros de eventos)
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| FRM_CODIGO | int PK/FK | Formulario |
| COM_CODIGO | int PK/FK | Componente |
| ACO_CODIGO | int PK/FK | Acao |
| ACC_MOMENTO | varchar(30) PK | Evento |
| PAR_NOME | varchar(30) PK | Nome do parametro |
| PAR_VALOR | varchar(5000) | Valor |

## 2. Tipos de Componentes

| Tipo | Nome | Qtd | Properties Exclusivas |
|------|------|-----|----------------------|
| E | Edit | 2654 | Senha, ApenasLeitura, TamanhoMaximo, Conteudo, LabelPosition, Placeholder |
| L | Label | 1759 | QuebraAutomaticaDeLinha, HorzAlignment, VertAlignment, ValorInicial |
| K | Lookup | 1505 | CampoChave, SQL, FonteDeDados, CampoLista, CodigoForm, Paginacao, Mascara |
| V | Bevel | 985 | Forma, Estilo, ConsiderarOrdem |
| F | Form | 872 | Navegacao, AbaLocalizar, Abas, EntrarComoPesquisa, Modal, BarraDeRolagem |
| B | Button | 779 | Imagem, CodigoForm, Parametros |
| M | Memo | 469 | TextoRico, QuebraAutomaticaDeLinha, TamanhoMaximo |
| G | Grid | 463 | Colunas, Editavel, ChamaSubForm, CorCondicional, Paginacao, CodigoForm |
| H | CheckBox | 344 | ValorCheck, ValorUnCheck |
| C | Combo | 269 | Lista, Valores, LarguraExibicao |
| I | Image | 239 | Imagem, URL, Exibicao, TipoExibicao, GravarEmArquivo, LenteAumento |
| R | RadioGroup | 184 | QtdeColunas, Lista, Valores, FonteDescricao |
| P | Container | 180 | Alinhar, LarguraMaxima |
| W | WebContainer | 113 | ClasseComponente, Categoria, Image, AcoesPreDefinida |
| D | SubForm | 45 | ExcluirSeInvisivel, CodigoForm, Parametros |
| S | ChartSeries | 36 | SQL, CampoValor, TipoPlotagem, NomeGrafico, Titulo |
| A | Chart | 27 | Series, Eixo*, Porcentagem3D |
| U | Unknown | 12 | — |
| T | Unknown | 1 | — |

### Properties Universais (100% dos componentes)
Codigo, Nome, Aba, Altura, Ordem, PosicaoX, PosicaoY, Tamanho, Dica, Visivel

### Properties Comuns (>70%)
Cor, Habilitado, Descricao, Fonte, Campo, Tabulacao, Tabular

## 3. Tipos de Acao (FR_ACAO)

| ACO_CODIGO | Nome | Uso |
|------------|------|-----|
| 1 | Abrir Janela | Abre outro formulario |
| 2 | Executar Stored Procedure | SP direta |
| 3 | Habilitar/Desabilitar Objetos | Toggle |
| 4 | Mostrar/Ocultar Objetos | Visibility |
| 5 | Escolher Foco | Set focus |
| 6 | Mudar Cor | Change color |
| 7 | Mudar Valor | Set value |
| 8 | Abrir Relatorio | Print/report |
| 12 | **Executar Regra de negocio** | **Principal (871 usos)** |

## 4. Eventos (ACC_MOMENTO)

| Evento | Ocorrencias | Uso Tipico |
|--------|-------------|------------|
| Ao Clicar | 871 | Botoes, labels clicaveis |
| Ao Modificar | 371 | Validacao em tempo real |
| Ao Entrar | 156 | Carga inicial (form/campo) |
| Ao Navegar | 89 | Mudanca de registro |
| Antes de Inserir | 87 | Pre-validacao |
| Antes de Gravar | 80 | Validacao final |
| Depois de Inserir | 74 | Pos-processamento |
| Depois de Gravar | 57 | Atualizacao pos-save |

## 5. Vinculacao Evento → Regra

```
FR_ACAOCOMPONENTE (FRM, COM, ACO=12, ACC_MOMENTO="Antes de Gravar")
  |
  +-- FR_PARAMETRO (PAR_NOME="Nome", PAR_VALOR="Nome da Regra")
  +-- FR_PARAMETRO (PAR_NOME="Entrada", PAR_VALOR="pCampo={edtCampo};pValor={edtValor}")
```

Formato de Entrada: `nomeParam={nomeComponente};nomeParam2={nomeComponente2}`

## 6. Formato de Serializacao de Regras

### REG_PARAMS / REG_VARIAVEIS
```
nome,tipo,tamanho,;nome2,tipo2,tamanho2,;
```
Exemplo: `Codigo,Inteiro,,;Nome,Letras,50,;DataNasc,Data,,;`

### Tipos de Dados (FR_REGRAS_TIPOS)
| ID | Nome | Uso em Params/Vars |
|----|------|--------------------|
| 0 | Variante | Default, aceita qualquer valor |
| 1 | Letras | String (ftString) |
| 2 | Numero | Numerico generico |
| 3 | Fracionado | Decimal/float |
| 4 | Data | Date |
| 5 | Hora | Time |
| 6 | Logico | Boolean |
| 7 | SQL | SQL inline |
| 8 | Tabela | Resultado de query |
| 9 | Inteiro | Integer |
| 10 | SQL Consulta | SELECT |
| 11 | SQL Atualizacao | UPDATE/INSERT |

### Atividades Pre-definidas (FR_REGRAS_ATIVIDADES)
| ID | Nome Interno | Descricao |
|----|-------------|-----------|
| 1 | ActShowProgressBar | Exibir barra progresso |
| 2 | ActIncProgressBar | Incrementar barra |
| 3 | ActCloseProgressBar | Fechar barra |
| 4 | ActWarningMessage | Alerta classico |
| 5 | ActErrorMessage | Erro classico |
| 6 | ActNewWarningMessage | Alerta moderno (titulo, msg, tempo, posicao) |
| 7 | ActNewErrorMessage | Erro moderno (titulo, msg, tempo, posicao) |
| 8 | ActNewPromptMessage | Input de texto assincrono |
| 9 | ActNewInteractionConfirmMessage | Confirmacao assincrona |
| 10 | ActNewSuccessMessage | Sucesso moderno |

## 7. Mascaras (FR_TIPODADO)

| ID | Nome | Formato |
|----|------|---------|
| 1 | CPF | 999.999.999-99 |
| 3 | CEP (8) | 99.999-999 |
| 4 | CNPJ | 99.999.999/9999-99 |
| 5 | DATA | DD/MM/YYYY |
| 8 | VALOR | ###,###,##0.00 |
| 9 | TELEFONE | (99) 9999-9999 |
| 22 | HORA | 90:90 |
| 40 | CELULAR | (99) 99999-9999 |

## 8. Nomenclatura de Componentes (Padroes Reais)

| Tipo | Prefixo Dominante | Prefixo Secundario | Exemplo |
|------|-------------------|--------------------|---------|
| E | Maker* (66%) | edt* (25%) | MakerEdit1, edtNOME |
| K | Maker* (74%) | edt* (17%) | MakerLookup1, edtCODIGO |
| C | Maker* (72%) | EDT* (12%) | MakerComboBox1 |
| B | Maker* (86%) | btn* (4%) | MakerButton1, btnSalvar |
| M | Maker* (69%) | edt* (22%) | MakerMemo1, edtOBS |
| G | Maker* (73%) | TMA* (20%) | MakerGrid1 |
| P | CON* (40%) | Maker* (34%) | CONDados, MakerPanel1 |
| L | Maker* (80%) | Tex* (7%) | MakerLabel1, TextoTitulo |

## 9. Dependencias (FR_DEP_*)

| Tabela | Linhas | Significado |
|--------|--------|------------|
| FR_DEP_FORMULARIO_CAMPO | 11.318 | Campos usados pelo formulario |
| FR_DEP_REGRA_FUNCAO | 10.724 | Funcoes usadas pela regra |
| FR_DEP_REGRA_CAMPO | 9.794 | Campos referenciados pela regra |
| FR_DEP_FORMULARIO_TABELA | 3.274 | Tabelas do formulario |
| FR_DEP_REGRA_TABELA | 2.787 | Tabelas da regra |
| FR_DEP_REGRA_REGRA | 1.507 | Sub-rotinas (regra chama regra) |
| FR_DEP_FORMULARIO_REGRA | 1.367 | Regras vinculadas ao form |
| FR_DEP_REGRA_FORMULARIO | 958 | Formularios referenciados pela regra |
| FR_DEP_FORMULARIO_FORMULARIO | 652 | Sub-forms referenciados |

## 10. Distribuicao de Regras

- **Servidor (destino=2)**: 1.516 regras (62%)
- **Cliente (destino=1)**: 927 regras (38%)
- **Ambos (destino=0)**: 2 regras

## 11. FonteDados (SQL Patterns)

De 873 fontes de dados:
- 734 (84%) tem tabela definida
- 590 (68%) tem chave primaria
- 735 (84%) tem SELECT
- 639 (73%) tem campos UPDATE
- 167 (19%) tem valores DEFAULT

### Padrao SELECT
```sql
Select TABELA.CAMPO1, TABELA.CAMPO2, ...
From TABELA
/*WHERE_NEW*/
/*ORDER_NEW*/
```

### Padrao UPDATE (campos, um por linha)
```
CAMPO1
CAMPO2
CAMPO3
```

### Padrao GRADE/PESQUISA
```
CAMPO1;CAMPO2;CAMPO3
```

### Padrao DEFAULT
```
CAMPO=SQL("Select DATA_ATUAL_VI.Data From DATA_ATUAL_VI")
```

### Chaves Compostas
```
CAMPO1;CAMPO2   (separadas por ;)
```

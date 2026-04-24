# Padroes de Composicao de Fluxos e Formularios Maker

Baseado na analise de **2371 regras**, **430 funcoes** de um sistema em producao,
e **29 regras + 12 formularios** do FRZ de exemplos (templates Dashboard, Login, Kanban, Menu Principal).
Cada padrao e um bloco reutilizavel. Um fluxo complexo e a composicao de varios.

---

## 1. SQL Select (consulta com retorno) — 712 usos

Executa query, extrai campos, fecha.

```
ExecuteQuery(SQL, null) → varQuery
Field(varQuery, 'campo1') → varCampo1
Field(varQuery, 'campo2') → varCampo2
SQLClose(varQuery)
```

Funcoes:
- `ebfSQLExecuteQuery` (Abrir Consulta): SQL Consulta, Variante → Tabela — 712x no sistema
- `ebfSQLField` (Campo): Tabela, Campo → depende do campo — 1138x
- `ebfSQLClose` (Fechar Consulta): Variante → void — 518x
- `ebfSQLEOF` (Fim da Consulta?): Tabela → Logico — 473x (para loops)

Loop de leitura:
```
ExecuteQuery(SQL) → qry
WHILE NOT EOF(qry):
    Field(qry, 'campo') → valor
    ... processar ...
    SQLNext(qry)
SQLClose(qry)
```

---

## 2. SQL Execute (comando sem retorno) — 493 usos

Executa INSERT/UPDATE/DELETE.

```
ExecuteUpdate(SQL) → void
```

Funcoes:
- `ebfSQLExecuteUpdate` (Executar SQL): SQL Consulta → void — 493x

---

## 3. JSON — Padrao dominante no sistema (1532+ usos)

Funcao mais usada no sistema inteiro: `ebfGetValueObjectJson`.

### Criar JSON
```
CreateObjectJSON() → varJson
ListParamsCreate() → varParams
... montar params ...
JSONParamsCreate(params) → varJson
```

### Ler JSON
```
GetValueObjectJson(json, 'chave') → valor
```

### Converter
```
ResultSetToJSON(query) → varJson  (92x)
```

Funcoes:
- `ebfGetValueObjectJson` (JSON Obter Valor): Variante, Letras → Variante — 1532x
- `ebfListParamsCreate` (Criar Lista Params): → Variante — 1524x
- `ebfCreateObjectJSON` (Criar JSON): → Variante — 204x
- `ebfJSONParamsCreate` (JSON de Params): Variante → Variante — 101x
- `ebfResultSetToJSON` (Query para JSON): Variante → Variante — 92x

---

## 4. Arquivo - Escrita

Cria/abre arquivo, escreve conteudo, fecha.

```
FileTempDir() → varDir
Concat(varDir, '/nome.ext') → varPath
FileOpenToWrite(varPath, false) → varFile
FileAppend(varFile, varConteudo)
FileClose(varFile)
```

Funcoes:
- `ebfFileTempDir` (Dir temp): → Letras
- `ebfConcat` (Concatenacao): Letras, Letras → Letras
- `ebfFileOpenToWrite` (Abrir para escrita): Letras, Logico → Variante
- `ebfFileAppend` (Adicionar a arquivo): Variante, Letras → void
- `ebfFileClose` (Fechar arquivo): Variante → void

Segundo param de OpenToWrite: false=sobrescrever, true=append.

---

## 5. Arquivo - Leitura

Abre arquivo, le conteudo, fecha.

```
FileOpenToRead(varPath) → varFile
FileReadAll(varFile) → varConteudo
FileClose(varFile)
```

Funcoes:
- `ebfFileOpenToRead` (Abrir para leitura): Letras → Variante
- `ebfFileReadAll` (Ler todo arquivo): Variante → Letras
- `ebfFileClose` (Fechar arquivo): Variante → void

---

## 6. Download de Arquivo

Escreve arquivo no temp e dispara download no navegador.

```
(Padrao 4: Arquivo Escrita)
DonwloadStart('/tmp/nome.ext', true)
```

Funcoes:
- `ebfDonwloadStart` (Iniciar Download): Letras, Logico → void

Caminho deve comecar com /tmp/, /download/ ou /upload/.

---

## 7. Validacao / Desvio — 879 usos de isEqual, 1461 de isNullOrEmpty

Decision so quando o resultado muda o caminho de execucao.

```
Decision: isNullOrEmpty(valor)?
  SIM → ActNewErrorMessage('Campo obrigatorio') ou Exception
  NAO → continua processamento
```

Funcoes de comparacao (por uso real):
- `isNullOrEmpty` — 1461x (a mais usada para validacao!)
- `isEqual` — 879x
- `isGreater` — 217x
- `isMinorOrEqual` — 194x
- `isMinor` — 99x
- `oprNot` — 113x
- `oprOr` — 209x
- `oprIf` — 428x (if inline, sem Decision)

Funcoes de erro:
- `ActNewErrorMessage` — 516x (mensagem de erro padrao)
- `ActErrorMessage` — 176x

Regra: so usar Decision quando SIM e NAO levam a **acoes diferentes de verdade**.

---

## 8. String / Formatacao — 1017 usos de Concat

```
Concat(a, b) → resultado
Replace(texto, de, para) → resultado
Split(texto, separador) → lista
```

Funcoes (por uso real):
- `ebfConcat` — 1017x
- `ebfReplace` — 306x
- `ebfReplaceAll` — 254x
- `ebfSplit` — 139x
- `toString` — 149x
- `toDate` — 316x
- `ebfDateToday` — 591x

---

## 9. Listas e Maps — 1524 usos de ListParamsCreate

Padrao dominante pra passar parametros entre regras e montar JSONs.

```
ListParamsCreate() → params
... adicionar items ...
ListLength(params) → tamanho
GetElementFromList(params, indice) → item
```

Funcoes:
- `ebfListParamsCreate` — 1524x
- `ebfGetElementFromList` — 983x
- `ebfListLength` — 203x
- `ebfListCreate` — 156x
- `ebfMapCreateFromList` — 92x
- `ebfMapGetObject` — 98x

---

## 10. Componentes de Formulario (cliente) — 800 usos

```
FormChangeComponentValue(guid, 'campo', valor) → void
FormGetComponentValue(guid, 'campo') → valor
FormSetVisible(guid, 'campo', true/false) → void
FormSetEnabled(guid, 'campo', true/false) → void
FormSetRequired(guid, 'campo', true/false) → void
```

Funcoes (por uso real):
- `ebfFormChangeComponentValue` — 800x
- `ebfFormSetVisible` — 319x
- `ebfFormGetComponentValue` — 245x
- `ebfFormSetEnabled` — 225x
- `ebfFormSetRequired` — 140x

---

## 11. Sub-Rotinas — 1996 componentes no sistema

Chamar outro fluxograma como funcao.

```
CallRule(idRegra, param1, param2) → retorno
```

Componente: `TFlowSubRoutine` — 1996 instancias no sistema real.
Representa reutilizacao de logica entre regras.

---

## 12. Outros (usuario, data, seguranca)

- `ebfGetUserCode` — 136x (obter codigo do usuario logado)
- `ebfDateToday` — 591x (data atual)

---

## 13. SQL Loop (iteracao com cursor) — extraido de templates Dashboard

Padrao para iterar registros de uma query coletando dados em lista.
Usado em graficos, relatorios e processamento em lote.

```
ListParamsCreate() → varLista
ExecuteQuery(SQL) → qry
Decision: EOF(qry)?
  SIM → fechar e retornar
  NAO →
    Field(qry, 'etiqueta') → varEtiqueta
    Field(qry, 'valor') → varValor
    ListParamsCreate() → varPar
    ... adicionar etiqueta e valor ao par ...
    ... adicionar par a varLista ...
    SQLNext(qry)
    → volta ao Decision (Connector)
SQLClose(qry)
retornar varLista
```

Funcoes:
- `ebfSQLEOF` (Fim da Consulta?): Tabela → Logico — 473x (controle do loop)
- `ebfSQLNext` (Proxima Linha): Tabela → void
- `ebfListParamsCreate` — para criar lista e sub-listas (pares)
- Usa `TFlowConnector` para criar o loop visual no DFM

---

## 14. DOM / HTML Dinamico (cliente) — extraido de templates Menu/Login

Construcao programatica de elementos HTML via JavaScript do Maker.
Usado em menus, topbars, widgets, componentes customizados.

```
HtmlGetElementById('container-id') → varContainer
HtmlCreateHtmlElement('div') → varDiv
HtmlSetAttribute(varDiv, 'class', 'dropdown-item')
HtmlInnerHtml(varDiv, '<i class="fa-solid fa-icon"></i> Texto')
HtmlAppend(varContainer, varDiv)
HtmlAttachFlowEvent(varDiv, 'click', 'Nome da Regra', params)
```

Funcoes (por uso real no FRZ de exemplos):
- `ebfHtmlCreateHtmlElement` — 39x (criar elementos DOM)
- `ebfHtmlAttachFlowEvent` — 22x (vincular eventos a regras)
- `ebfHtmlInnerHtml` — 20x (definir conteudo HTML)
- `ebfHtmlGetElementById` — obter referencia DOM
- `ebfHtmlSetAttribute` — definir atributos
- `ebfHtmlAppend` — adicionar filho a container
- `ebfHtmlCssAddClass` — adicionar classe CSS
- `ebfHtmlCssDefineStyle` — definir estilo inline

Padrao de menu dropdown:
```
1. Obter container principal
2. Criar wrapper (div com classe Bootstrap)
3. Para cada item:
   a. Criar elemento (button/anchor)
   b. Definir classes CSS (dropdown-item, d-flex, etc.)
   c. Definir innerHTML com icone Font Awesome + texto
   d. Vincular evento click a sub-rotina via AttachFlowEvent
   e. Anexar ao wrapper
4. Anexar wrapper ao container
```

---

## 15. Autenticacao / Login — extraido de templates Login

Fluxo cliente-servidor para autenticacao com captcha.

### Cliente (Ao Entrar)
```
1. Verificar localStorage por sessao existente
2. Obter lista de conexoes (CallRule servidor)
3. Criar captcha (CallRule servidor)
4. Preencher combo de conexoes
```

### Cliente (Autenticar)
```
1. Obter usuario, senha, conexao da tela
2. Validar captcha (CallRule servidor)
3. Se captcha OK: autenticar (ebfAuthUser)
```

### Servidor (Criar Captcha)
```
1. Gerar numeros aleatorios
2. Montar imagem base64 com texto do captcha
3. Retornar JSON {imagem, resposta}
```

### Servidor (Validar Captcha)
```
1. Comparar resposta do usuario com resposta gerada
2. Se invalido: gerar novo captcha e retornar erro
3. Se valido: retornar OK
```

Funcoes-chave:
- `ebfAuthUser` — funcao central de autenticacao
- `ebfLocalStorageGet` / `ebfLocalStorageSet` — persistencia no navegador
- `ebfSetRuleExecutionTime` — agendar execucao de regra

---

## 16. Dashboard / Graficos — extraido de templates Dashboard

6 tipos de grafico, todos com o mesmo padrao servidor.

### Servidor (dados do grafico)
```
1. ListParamsCreate() → lista principal
2. ExecuteQuery(SQL com GROUP BY) → qry
3. Loop: EOF? NAO →
   a. Field(qry, 'etiqueta') → label
   b. Field(qry, 'valor') → valor
   c. ListParamsCreate() → par
   d. Adicionar [label, valor] ao par
   e. Adicionar par a lista principal
   f. SQLNext(qry)
   g. → volta ao Decision
4. SQLClose(qry)
5. Retornar lista principal
```

### Cliente (renderizar)
```
1. Chamar regra servidor para obter dados
2. Passar lista para componente de grafico (tipo A=AdvancedLabel/Chart)
```

Tipos: Area, Barra, Barra Horizontal, Linha, Pizza, Rosca.

---

## 17. Formularios — Padroes de Layout

### Template (sem tabela, visual/funcional)
```
FormSettings: Navegacao=FALSE, Abas=FALSE, Responsivo=TRUE
Sem tabela, sem SQL, sem grade de pesquisa
Regras vinculadas ao Ao Entrar
```

### CRUD (com tabela, navegacao)
```
FormSettings: Navegacao=TRUE, Abas=TRUE, Responsivo=TRUE
AbaLocalizar=TRUE, EditarAoDuploClicar=TRUE
Tabela, CampoChave, SQLSelect, SQLUpdate definidos
CampoGrade e CampoPesquisa com campos separados por ;
```

### Hierarquia de componentes
```
Aba "01-NomeAba"
  └── Container P (card)
      ├── Container P (card-header)
      │   └── Label L (icone + titulo)
      └── Campos (E, C, K, M, H, R, I, A)
```

### CSS Bootstrap mais usadas em formularios reais
| Classe | Uso |
|---|---|
| `form-group` | Base de todo campo |
| `form-group col-md-N` | Campo responsivo (N=3,4,6,12) |
| `form-group card` | Card container |
| `form-group card-header` | Header de card |
| `d-flex flex-row` | Layout flexbox horizontal |
| `align-items-center` | Centralizar verticalmente |
| `p-0 m-0` | Reset padding/margin |
| `shadow` | Sombra em cards |
| `btn-dark`, `btn-primary` | Botoes |
| `text-muted` | Texto secundario |

### CSS WebRun (classes nativas do skin)
| Classe | Uso |
|---|---|
| `webrun-template-bg-primary` | Background do tema |
| `webrun-text-template-bg-primary` | Texto do tema |
| `text-bg-body` | Background do body |

---

## Dimensoes reais dos componentes (extraido de 2371 regras)

| Componente | Width | Height |
|---|---|---|
| TFlowStart | 38 | 38 |
| TFlowExpression | 150 | 57 |
| TFlowDecision | 150 | 60 |
| TFlowEnd | 38 | 38 |
| TFlowSubRoutine | 150 | 60 |
| TFlowConnector | 30 | 30 |
| TFlowActivity | 150 | 60 |

Spacing vertical entre passos: **~18px** (gap entre bottom de um e top do proximo).
Step total = Height + gap = 75px para expressions, 78px para decisions.

---

## Regras de Composicao

1. **JSON domina**: `ebfGetValueObjectJson` e a funcao mais usada no sistema inteiro (1532x). Usar JSON pra trocar dados entre regras.
2. **Validar com `isNullOrEmpty`**: e mais usada que `isEqual` pra validacao (1461x vs 879x).
3. **Listas de parametros**: `ebfListParamsCreate` (1524x) e o padrao pra montar parametros.
4. **Sub-rotinas**: 1996 usos — reutilizar logica entre regras e a norma.
5. **Decision so com desvio real**: se SIM e NAO fazem a mesma coisa, nao precisa.
6. **SQL primeiro**: resolver logica complexa no SQL, nao no fluxo.
7. **Nomes descritivos**: cada passo com nome que diz o que faz (verbo + objeto).
8. **Fechar recursos**: query (SQLClose 518x) e arquivo (FileClose) sempre.
9. **Cliente vs Servidor**: regras que manipulam DOM, localStorage, UI → destino=1 (cliente). Regras com SQL, arquivo, auth → destino=2 (servidor).
10. **Orquestracao com sub-rotinas**: regra cliente chama regra servidor para obter dados, processa localmente. Ex: Login chama servidor para validar captcha, recebe JSON, exibe erro ou redireciona.
11. **DOM programatico para UI dinamica**: menus, dropdowns, widgets → usar ebfHtml* em vez de componentes DFM fixos. Mais flexivel e customizavel.
12. **CSS Bootstrap + Font Awesome**: padrao visual do Maker moderno. Classes form-group, card, btn-*, shadow, d-flex. Icones com fa-solid, fas, fab.

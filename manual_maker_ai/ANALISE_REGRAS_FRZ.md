# Analise Completa das 29 Regras do FRZ (ExemplosFRZ.frz)

Arquivo: 17.9M caracteres (gzip compressed, ISO-8859-1)

---

## Indice de Regras por Categoria

### Dashboard / Grafico (6 regras) -- Todas Servidor (Java)

| COD | Nome | Destino | Retorno | Componentes | Funcoes |
|-----|------|---------|---------|-------------|---------|
| 1 | Template - Dashboard - Grafico Area 1 | Servidor | Variante | 31 (10 Expr, 1 Dec, 1 Conn, 15 Lines) | ebfSQLExecuteScrollQuery, ebfListCreate, ebfSQLField, ebfListParamsCreate, ebfSetElementAtList, oprAdd, ebfSQLNext, ebfSQLClose |
| 2 | Template - Dashboard - Grafico Barra 1 | Servidor | Variante | 31 | Identico ao COD 1 |
| 3 | Template - Dashboard - Grafico Barra 2 | Servidor | Variante | 31 | Identico ao COD 1 |
| 4 | Template - Dashboard - Grafico Linha 1 | Servidor | Variante | 31 | Identico ao COD 1 |
| 5 | Template - Dashboard - Grafico Pizza 1 | Servidor | Variante | 31 | Identico ao COD 1 |
| 6 | Template - Dashboard - Grafico Pizza 2 | Servidor | Variante | 31 | Identico ao COD 1 |

### Formulario Principal (11 regras) -- 10 Cliente, 1 Servidor

| COD | Nome | Destino | Retorno | Componentes | Funcoes Principais |
|-----|------|---------|---------|-------------|-------------------|
| 14 | Alternar Menu | Cliente | - | 24 (3 Expr, 2 Dec, 2 SubRot) | ebfHtmlGetElementById, ebfHtmlGetAttribute, ebfSearchSubstring, ebfTrim, oprNot |
| 16 | Ao Clicar no Menu | Cliente | - | 66 (8 Expr, 8 Dec, 2 SubRot) | ebfOpenReport, ebfFlowExecute, ebfActionExecute, ebfGetComponentProperty, ebfFormOpenForm, ebfTabComponentAddTab |
| 17 | Ao Entrar | Cliente | - | 17 (1 Expr, 1 Dec, 3 SubRot) | ebfTabComponentAddTab |
| 18 | Ao Entrar (Servidor) | Servidor | Variante | 25 (8 Expr, 1 Dec) | ebfListCreate, ebfSetElementAtList, ebfSQLField, ebfSQLExecuteQuery, ebfGetUserCode, ebfSubstring, ebfGetFullSystemID, ebfSQLEOF, ebfToUpperCase, ebfUserAccessWhichMode, ebfIsReloadable, ebfBytesToBase64, ebfRemoveLineBreak |
| 19 | Atalhos - Ajustar Atalho | Cliente | - | 24 (10 Expr) | ebfHtmlAppendElementAt, ebfHtmlGetElementByClassName, ebfHtmlSetAttribute, ebfHtmlAttachFlowEvent, ebfHtmlGetDOMAttribute, ebfGetClientFormVariable |
| 21 | Atalhos - Ao Soltar Atalho | Cliente | - | 19 (5 Expr, 1 Dec, 1 SubRot) | ebfHtmlGetElementById, ebfHtmlInnerHtml, ebfHtmlSetAttribute, ebfHtmlCreateHtmlElement, ebfReplaceAll |
| 22 | Atalhos - Carregar Atalhos | Cliente | Letras | 40 (14 Expr, 2 Dec, 1 SubRot) | ebfHtmlCreateHtmlElement, ebfHtmlGetDOMAttribute, ebfHtmlInnerHtml, ebfHtmlAttachFlowEvent, ebfObjectKeys, ebfGetClientFormVariable |
| 25 | Criar Container de Troca de Temas | Cliente | - | 26 (11 Expr) | ebfHtmlCreateHtmlElement, ebfHtmlAttachFlowEvent, ebfLocalStorageGetItem, ebfConcat, oprIf, isEqual, isNullOrEmpty |
| 27 | Definir Classe do Menu | Cliente | - | 27 (3 Expr, 3 Dec) | ebfHtmlGetAttribute, ebfHtmlSetAttribute, ebfTrim, ebfToLowerCase, ebfConcat, ebfReplace |
| 28 | Estrutura | Cliente | - | 38 (11 Expr, 2 Dec, 2 SubRot) | ebfHtmlGetMakerElementById, ebfHtmlCreateHtmlElement, ebfHtmlSetAttribute, ebfHtmlCssDefineStyle, ebfGetElementFromList, ebfTrim |
| 29 | Estrutura - Montar Dropdown | Cliente | - | 146 (50 Expr, 8 Dec, 1 SubRot) | ebfHtmlCreateHtmlElement, ebfHtmlInnerHtml, ebfHtmlAttachFlowEvent, ebfListParamsCreate, ebfConcat |

### Kanban (1 regra)

| COD | Nome | Destino | Retorno | Componentes | Funcoes |
|-----|------|---------|---------|-------------|---------|
| 37 | Template - Kanban - Ao Entrar | Cliente | - | 6 (1 Expr) | ebfSetRuleExecutionTime |

### Login (11 regras) -- 7 Cliente, 4 Servidor

| COD | Nome | Destino | Retorno | Componentes | Funcoes Principais |
|-----|------|---------|---------|-------------|-------------------|
| 46 | Acionar Mudanca de Pagina | Cliente | - | 18 (7 Expr) | ebfHtmlCssAddClass, ebfHtmlGetElementById, ebfSetRuleExecutionTime |
| 49 | Ao Entrar | Cliente | - | 51 (14 Expr, 3 Dec, 3 SubRot) | ebfComboPut, ebfComboClean, ebfFormChangeComponentValue, ebfFormSetVisible, ebfHtmlCssDefineStyle, ebfHtmlGetMakerElementById, ebfExecuteJS, ebfHtmlAppendElementAt, ebfHtmlRemoveChild, ebfHtmlGetParent, ebfHtmlAttachFlowEvent, ebfRequestGetParameter |
| 50 | Ao Pressionar Tecla | Cliente | - | 11 (0 Expr, 1 Dec, 1 SubRot) | (nenhuma direta -- delega para Validar Captcha) |
| 51 | Autenticar Usuario | Servidor | - | 6 (1 Expr) | ebfAuthUser, oprIf, oprOr, isNullOrEmpty, isEqual |
| 52 | Criar Captcha | Cliente | - | 13 (1 Expr, 1 Dec, 1 SubRot) | ebfLocalStorageSetItem, ebfConcat, ebfGetFullSystemID |
| 53 | Criar Captcha (Servidor) | Servidor | Letras | 6 (1 Expr) | ebfCreateLocalCaptcha |
| 55 | Entrar com Certificado | Cliente | - | 6 (1 Expr) | ebfLoginCertificate |
| 60 | Obter Lista de Conexoes | Servidor | Variante | 4 (0 Expr) | (funcao inline no End) |
| 64 | Recuperar Acesso - Chamada | Cliente | - | 13 (4 Expr) | ebfChangeDescription, ebfFormSetEnabled, ebfFormSetVisible, ebfAsyncJavaFlowExecute |
| 66 | Validar Captcha | Cliente | - | 8 (1 Expr, 1 SubRot) | ebfLocalStorageGetItem, ebfConcat, ebfGetFullSystemID |
| 67 | Validar Captcha (Servidor) | Servidor | Logico | 23 (1 Expr, 2 Dec, 1 Activity, 2 SubRot) | ebfValidateLocalCaptcha |

---

## Padroes Identificados

### 1. Padrao Dashboard (6 regras identicas)

Todas as regras de dashboard seguem exatamente o mesmo fluxograma:

```
Start -> [Remark: "Modifique a consulta e mantenha o Alias"]
  -> ebfSQLExecuteScrollQuery (abrir consulta SQL)
  -> ebfListCreate (criar lista vazia)
  -> Inicializar Contador = 1
  -> Decision: isMinorOrEqual(Contador, 6) [LOOP]
    SIM -> ebfSQLField (obter ValorNumerico)
        -> ebfSQLField (obter Etiqueta)
        -> ebfListParamsCreate (criar par [Etiqueta, ValorNumerico])
        -> ebfSetElementAtList (inserir na ListaDeListas)
        -> oprAdd (incrementar Contador)
        -> [Connector] -> ebfSQLNext (proximo registro)
        -> volta para Decision
    NAO -> ebfSQLClose (fechar consulta)
        -> End (retorna @ListaDeListas como Variante)
```

Variaveis: Consulta(Tabela), Contador(Inteiro), ValorNumerico(Variante), Etiqueta(Variante), ListaAcao(Variante), ListaDeListas(Variante)

Funcoes usadas: ebfSQLExecuteScrollQuery, ebfListCreate, ebfSQLField, ebfListParamsCreate, ebfSetElementAtList, oprAdd, ebfSQLNext, ebfSQLClose

### 2. Padrao Formulario Principal -- Arvore de Dependencias

```
[17] Ao Entrar (Cliente)
  |-> chama [18] Ao Entrar (Servidor) -- retorna Lista de Parametros
  |-> chama [28] Estrutura (Cliente)
  |     |-> chama [29] Montar Dropdown (Cliente)
  |     |     |-> chama [25] Criar Container de Troca de Temas (Cliente)
  |     |-> chama [22] Carregar Atalhos (Cliente)
  |           |-> chama [19] Ajustar Atalho (Cliente)
  |-> chama [14] Alternar Menu (Cliente)
        |-> chama [27] Definir Classe do Menu (Cliente)

[16] Ao Clicar no Menu (Cliente) -- acionado por eventos de clique
  |-> chama [27] Definir Classe do Menu (Cliente)
```

A regra "Ao Entrar (Servidor)" [18] monta uma lista com 6 parametros:
1. Nome do usuario (via SQL: fr_usuario)
2. Sigla do sistema (ebfGetFullSystemID)
3. Administrador ou nao (ebfSQLEOF + SQL em fr_grupoatribuicao)
4. Publicado ou nao (ebfIsReloadable)
5. Modo do projeto (ebfUserAccessWhichMode)
6. Imagem do usuario (ebfBytesToBase64 de blob)

### 3. Padrao Login -- Arvore de Dependencias

```
[49] Ao Entrar (Cliente)
  |-> chama [60] Obter Lista de Conexoes (Servidor) -- retorna lista
  |-> chama [52] Criar Captcha (Cliente)
  |     |-> chama [53] Criar Captcha (Servidor) -- retorna GUID
  |-> chama [51] Autenticar Usuario (Servidor) -- com certificado

[50] Ao Pressionar Tecla (Cliente) -- detecta ENTER
  |-> chama [66] Validar Captcha (Cliente)
        |-> chama [67] Validar Captcha (Servidor)
              |-> chama [51] Autenticar Usuario (Servidor)
              |-> chama [52] Criar Captcha (Cliente) -- recria captcha se falhar

[46] Acionar Mudanca de Pagina (Cliente) -- animacao fade-in/fade-out
[55] Entrar com Certificado (Cliente) -- ebfLoginCertificate
[64] Recuperar Acesso - Chamada (Cliente) -- fluxo assincrono
```

### 4. Padrao de Construcao de UI via HTML (Cliente)

As regras cliente do Formulario Principal constroem UI programaticamente:

**Ciclo repetido para cada item de menu:**
```
1. ebfHtmlCreateHtmlElement(tag, ebfListParamsCreate(...atributos...))
   -> Cria elemento <div>, <a>, <button>, <i> etc.
2. ebfHtmlInnerHtml(elemento, "<i class='fas fa-xxx'></i><span>Texto</span>")
   -> Define conteudo HTML com icone Font Awesome
3. ebfHtmlAttachFlowEvent(elemento, "onclick", ebfListParamsCreate(...params...))
   -> Associa evento de clique a um fluxo
```

**Exemplo real do dropdown (Montar Dropdown - 50 expressoes):**
- Cria div.dropdown-menu
- Cria h6 (cabecalho com nome do usuario)
- Para cada item: cria div.dropdown-item -> define innerHTML com icone FA -> associa onclick
- Items: Modo Gerente, Modo Projeto, Alterar Senha, Sair, Usuarios, Grupos, Modo Normal, Recarregar Sistema, System Check, Recarregar Menu, Conexoes Adicionais, Master Skin, Listagem, Assistente de Regras
- 8 Decisions controlam visibilidade por modo (admin, gerente, projeto, normal, publicado)

### 5. Padrao Captcha (Login)

```
Cliente:                          Servidor:
[52] Criar Captcha               [53] Criar Captcha (Servidor)
  -> verifica se existe captcha     -> ebfCreateLocalCaptcha("captcha", 5)
  -> chama servidor                 -> retorna GUID
  -> ebfLocalStorageSetItem         
     (chave: concat(systemID, "_captcha_guid"))

[66] Validar Captcha             [67] Validar Captcha (Servidor)  
  -> ebfLocalStorageGetItem         -> ebfValidateLocalCaptcha(captcha, GUID)
     (obtem GUID)                   -> Decision: ambiente local?
  -> chama servidor com 5 params    -> Decision: captcha valido?
                                    -> SIM: chama [51] Autenticar Usuario
                                    -> NAO: Activity "Mensagem de Erro"
                                           + chama [52] Criar Captcha
```

---

## Resumo Global de Funcoes (por frequencia)

| Funcao | Usos | Camada | Categoria |
|--------|------|--------|-----------|
| ebfListParamsCreate | 128x | Ambas | Listas |
| ebfHtmlCreateHtmlElement | 39x | Cliente | HTML/DOM |
| ebfHtmlAttachFlowEvent | 22x | Cliente | Eventos |
| ebfHtmlInnerHtml | 20x | Cliente | HTML/DOM |
| ebfSQLField | 14x | Servidor | SQL |
| ebfGetElementFromList | 13x | Ambas | Listas |
| ebfSetElementAtList | 12x | Ambas | Listas |
| ebfHtmlGetDOMAttribute | 12x | Cliente | HTML/DOM |
| ebfHtmlGetElementById | 9x | Cliente | HTML/DOM |
| ebfConcat | 9x | Ambas | Strings |
| oprAdd | 8x | Ambas | Aritmetica |
| ebfHtmlSetAttribute | 8x | Cliente | HTML/DOM |
| ebfListCreate | 7x | Ambas | Listas |
| ebfTrim | 7x | Ambas | Strings |
| ebfHtmlGetAttribute | 7x | Cliente | HTML/DOM |
| ebfSQLExecuteScrollQuery | 6x | Servidor | SQL |
| ebfSQLNext | 6x | Servidor | SQL |
| ebfSQLClose | 6x | Servidor | SQL |
| ebfGetUserCode | 5x | Servidor | Sistema |
| ebfGetFullSystemID | 4x | Ambas | Sistema |
| ebfHtmlGetMakerElementById | 4x | Cliente | HTML/DOM |
| ebfSetRuleExecutionTime | 4x | Cliente | Agendamento |
| ebfSQLExecuteQuery | 3x | Servidor | SQL |
| ebfHtmlGetElementByClassName | 3x | Cliente | HTML/DOM |
| oprIf | 3x | Ambas | Logica |
| isEqual | 3x | Ambas | Comparacao |
| ebfHtmlCssDefineStyle | 3x | Cliente | CSS |
| ebfToLowerCase | 2x | Cliente | Strings |
| ebfTabComponentAddTab | 2x | Cliente | Abas |
| ebfHtmlAppendElementAt | 2x | Cliente | HTML/DOM |
| ebfLocalStorageGetItem | 2x | Cliente | Storage |
| ebfHtmlCssAddClass | 2x | Cliente | CSS |
| ebfComboPut | 2x | Cliente | Combos |
| ebfFormSetVisible | 2x | Cliente | Formulario |

Funcoes unicas (1x): ebfAuthUser, ebfCreateLocalCaptcha, ebfValidateLocalCaptcha, ebfLoginCertificate, ebfAsyncJavaFlowExecute, ebfExecuteJS, ebfOpenReport, ebfFlowExecute, ebfActionExecute, ebfFormOpenForm, ebfSQLEOF, ebfUserAccessWhichMode, ebfIsReloadable, ebfBytesToBase64, ebfRemoveLineBreak, ebfObjectKeys, ebfRequestGetParameter, ebfGetActualForm, ebfChangeDescription, ebfFormSetEnabled, ebfSearchSubstring, ebfSubstring, ebfReplaceAll, ebfReplace, ebfToUpperCase, ebfGetSystemID, ebfComboClean, ebfFormChangeComponentValue, ebfHtmlRemoveChild, ebfHtmlGetParent, ebfHtmlGetElementsByTagName, ebfLocalStorageSetItem, ebfHtmlCssDefineStyle, ebfGetComponentProperty, oprNot, oprOr, isNullOrEmpty

---

## Tipos de Componentes DFM Encontrados

| Tipo | Descricao | Total |
|------|-----------|-------|
| TFlowExpression | Expressao (chamada de funcao) | ~200+ |
| TFlowLine | Linha de conexao entre componentes | ~300+ |
| TFlowDecision | Decisao (if/else com sim/nao) | ~40 |
| TFlowStart | Inicio do fluxograma | 29 |
| TFlowEnd | Fim do fluxograma (com retorno) | ~30 |
| TFlowSubRoutine | Chamada a outra regra | ~25 |
| TFlowConnector | Conector visual (juncao de fluxos) | ~35 |
| TFlowSubModel | Container do fluxograma | 29 |
| TFlowRemark | Comentario visual | ~3 |
| TFlowActivity | Acao pre-definida (ex: Mensagem de Erro) | 1 |

---

## Padroes JavaScript (funcoes ebfHtml*)

### Construcao de elementos HTML
```
ebfHtmlCreateHtmlElement(tag, atributos_como_lista)
  -> atributos via ebfListParamsCreate("class", "valor", "id", "valor", ...)
  -> retorna referencia ao elemento criado
```

### Definicao de conteudo
```
ebfHtmlInnerHtml(elemento, html_string)
  -> html_string tipicamente: '<i class="fas fa-xxx" style="min-width: 2rem;"></i>\n<span>Texto</span>'
```

### Associacao de eventos
```
ebfHtmlAttachFlowEvent(elemento, "onclick", params_lista)
  -> params_lista contém identificador do fluxo a executar
  -> tambem usado: "ondragend", "oncontextmenu", "ondrop"
```

### Manipulacao de DOM
```
ebfHtmlGetElementById(id_string)         -> busca por ID
ebfHtmlGetMakerElementById(maker_id)     -> busca componente Maker
ebfHtmlGetElementByClassName(classe)     -> busca por classe CSS
ebfHtmlGetElementsByTagName(tag)         -> busca por tag
ebfHtmlGetAttribute(elemento, "class")   -> ler atributo
ebfHtmlSetAttribute(elemento, "class", valor) -> definir atributo
ebfHtmlGetDOMAttribute(elemento, "data-xxx")  -> atributo DOM
ebfHtmlGetParent(elemento)               -> obter pai
ebfHtmlRemoveChild(pai, filho)           -> remover filho
ebfHtmlAppendElementAt(pai, filho)       -> anexar filho
ebfHtmlCssAddClass(elemento, "classe")   -> adicionar classe CSS
ebfHtmlCssDefineStyle(elemento, "prop", "valor") -> definir estilo CSS
```

### Padrao de Temas (Troca de Temas)
```
tema = ebfLocalStorageGetItem(ebfConcat(ebfGetFullSystemID(), "_theme"))
botao = ebfHtmlCreateHtmlElement("div", atributos_com_classe_ativa_se_tema_atual)
icone = ebfHtmlCreateHtmlElement("i", atributos_com_fa_icon)
ebfHtmlAttachFlowEvent(botao, "onclick", params_para_trocar_tema)
```

---

## Detalhes de Cada Regra

### Regra 1-6: Dashboard (Graficos)

Todas identicas. Padrao de iteracao com loop manual:
- Vars: Consulta(Tabela), Contador(Inteiro), ValorNumerico(Variante), Etiqueta(Variante), ListaAcao(Variante), ListaDeListas(Variante)
- 10 Expressions, 1 Decision (loop), 1 Connector (loop-back)
- Categoria: \Uso Geral
- Retorno: Variante (ListaDeListas)

### Regra 7: [14] Alternar Menu (Cliente)

Params: nenhum | Vars: Menu(Variante), Exibir(Logico), Aba(Variante)
- Obtem referencia do menu via ebfHtmlGetElementById
- Verifica se menu tem classe "menu-aberto" via ebfSearchSubstring + ebfTrim + ebfToLowerCase
- Chama [27] Definir Classe do Menu 2x (uma para menu, outra para aba)

### Regra 8: [16] Ao Clicar no Menu (Cliente)

Params: Identificador(Letras), Descricao(Letras), Tipo(Inteiro), Parametros(Variante)
- 8 Decisions: verifica tipo do item (formulario, relatorio, fluxo, acao)
- Para cada tipo: ebfFormOpenForm, ebfOpenReport, ebfFlowExecute, ebfActionExecute
- Gerencia abas: ebfGetComponentProperty + ebfTabComponentAddTab
- Controla menu mobile: chama [27] Definir Classe do Menu

### Regra 9: [17] Ao Entrar - Form Principal (Cliente)

Orquestra inicializacao:
1. Chama [18] Ao Entrar (Servidor) -> retorna Lista de Parametros
2. Chama [28] Estrutura -> monta UI do menu/topbar
3. Decision: mobile? -> chama [14] Alternar Menu ou nao
4. ebfTabComponentAddTab -> adiciona aba inicial

### Regra 10: [18] Ao Entrar - Form Principal (Servidor)

Monta lista com 6 parametros do ambiente:
1. Nome do usuario (SQL: fr_usuario WHERE usu_codigo = ebfGetUserCode())
2. Sigla do sistema (ebfSubstring(ebfGetFullSystemID(), ...))
3. E administrador? (SQL: fr_grupoatribuicao + ebfSQLEOF)
4. E publicado? (ebfIsReloadable)
5. Modo do projeto (ebfToUpperCase(ebfUserAccessWhichMode))
6. Imagem do usuario (SQL blob -> ebfBytesToBase64)

### Regra 11: [19] Atalhos - Ajustar Atalho (Cliente)

Params: Atalho(Variante), Menu Dropdown(Variante)
- Obtem referencia ao objeto de atalhos via ebfGetClientFormVariable("menu_obj_atalhos")
- Busca icone e texto via ebfHtmlGetElementByClassName("menu-item-text")
- Define classes e atributos
- Associa 3 eventos: ondragend, oncontextmenu, onclick

### Regra 12: [21] Atalhos - Ao Soltar Atalho (Cliente)

Params: Atalho(Variante)
- Obtem ShortcutsDropdownMenu via ebfHtmlGetElementById
- Limpa conteudo do menu
- Cria cabecalho h6 "Atalhos"
- Chama [19] Ajustar Atalho para reposicionar

### Regra 13: [22] Atalhos - Carregar Atalhos (Cliente)

Params: Elemento Pai(Variante) | Retorno: Letras
- Cria div dropdown com atributos
- Cria cabecalho h6
- Obtem objeto atalhos via ebfGetClientFormVariable
- Obtem chaves via ebfObjectKeys
- Loop: para cada chave, cria <a> com icone e texto
- Se vazio: mostra "Voce nao possui nenhum atalho"

### Regra 14: [25] Criar Container de Troca de Temas (Cliente)

Params: Dropdown(Variante)
- Obtem tema atual via ebfLocalStorageGetItem
- Cria 3 botoes: Claro, Sistema, Escuro
- Cada botao: div + icone(i) com classe condicional (oprIf/isEqual)
- Associa eventos onclick para troca de tema

### Regra 15: [27] Definir Classe do Menu (Cliente)

Params: Elemento(Variante), Exibir(Logico)
- Obtem classes atuais via ebfHtmlGetAttribute
- 3 Decisions: Exibir? Possui classe? Possui classe?
- Se exibir e nao tem: ebfHtmlSetAttribute(concat + "menu-aberto")
- Se nao exibir e tem: ebfHtmlSetAttribute(replace remove "menu-aberto")

### Regra 16: [28] Estrutura (Cliente)

Params: Lista de Parametros(Variante)
- Extrai nome do usuario (1o item da lista)
- Verifica se tem espacos (extrai primeiro nome)
- Obtem container via ebfHtmlGetMakerElementById("UserInfo")
- Cria dropdown do usuario (div, button, i)
- Verifica se tem imagem -> define src ou oculta icone generico
- Cria dropdown de atalhos (div, a, i)
- Chama [29] Montar Dropdown e [22] Carregar Atalhos

### Regra 17: [29] Estrutura - Montar Dropdown (Cliente)

Params: Lista de Parametros, Elemento Pai, Nome do Usuario
- 146 componentes DFM -- a maior regra do arquivo
- 50 Expressions, 8 Decisions, 1 SubRoutine
- Cria menu dropdown completo com todos os items:
  - Cabecalho com nome do usuario
  - Modo Gerente/Projeto/Normal (condicionais por modo)
  - Alterar Senha, Sair
  - Usuarios, Grupos (admin only)
  - Recarregar Sistema, System Check, Recarregar Menu
  - Conexoes Adicionais
  - Master Skin, Listagem, Assistente de Regras
- Cada item: criar div -> innerHTML com FA icon -> attachFlowEvent onclick
- Chama [25] Criar Container de Troca de Temas
- 8 Decisions controlam visibilidade por perfil

### Regra 18: [37] Kanban - Ao Entrar (Cliente)

Regra minima: apenas agenda execucao de outro fluxo
- ebfSetRuleExecutionTime("Kanban - Funcionalidade do Quadro", ...)

### Regra 19: [46] Login - Acionar Mudanca de Pagina (Cliente)

Params: botaoRetorno, nomeContainerEntrada, nomeContainerSaida
- Animacao de transicao entre containers (login <-> recuperar senha)
- ebfHtmlCssAddClass(fade-in / fade-out)
- 3x ebfSetRuleExecutionTime para agendar animacoes

### Regra 20: [49] Login - Ao Entrar (Cliente)

Orquestra inicializacao do login:
1. Obtem hash do certificado digital (ebfRequestGetParameter)
2. Chama [60] Obter Lista de Conexoes (Servidor)
3. Popula combo de conexoes (ebfComboPut em loop)
4. Se 1 conexao: oculta combo (ebfFormSetVisible)
5. ebfHtmlCssDefineStyle para ajustar layout
6. Reorganiza containers (remove/append recuperar senha)
7. Associa evento ao campo email
8. Chama [52] Criar Captcha
9. Decision: certificado vazio? -> chama [51] Autenticar via cert

### Regra 21: [50] Login - Ao Pressionar Tecla (Cliente)

Params: Alt, Ctrl, Shift, Codigo da Tecla, Caractere da Tecla
- 1 Decision: tecla == ENTER?
- SIM: chama [66] Validar Captcha com 4 params

### Regra 22: [51] Login - Autenticar Usuario (Servidor)

Params: usuario, senha, conexao
- Regra minima: 1 Expression
- ebfAuthUser(usuario, senha, true, oprIf(oprOr(isNullOrEmpty(conexao), isEqual(conexao, -1)), null, conexao))
- Logica: se conexao vazia ou -1, passa null; senao passa conexao

### Regra 23: [52] Login - Criar Captcha (Cliente)

- Decision: existe captcha?
- Se nao: chama [53] Criar Captcha (Servidor) -> retorna GUID
- Armazena GUID via ebfLocalStorageSetItem com chave = concat(systemID, "_captcha_guid")

### Regra 24: [53] Login - Criar Captcha (Servidor)

- Regra minima: ebfCreateLocalCaptcha("captcha", 5)
- Retorna: GUID (Letras)

### Regra 25: [55] Login - Entrar com Certificado (Cliente)

- Regra minima: ebfLoginCertificate()

### Regra 26: [60] Login - Obter Lista de Conexoes (Servidor)

- Regra vazia: apenas Start -> End
- Retorno inline (funcao no End): "Obter Lista de Conexoes-Ponte do Sistema()"

### Regra 27: [64] Login - Recuperar Acesso - Chamada (Cliente)

Params: email(Letras)
- Ativa spinner no botao: ebfChangeDescription(recoveryBtn, html_spinner)
- Desabilita botao: ebfFormSetEnabled(recoveryBtn, false)
- Oculta botao voltar: ebfFormSetVisible(returnbtn, false)
- Executa fluxo assincrono: ebfAsyncJavaFlowExecute com 3 params via ebfListParamsCreate

### Regra 28: [66] Login - Validar Captcha (Cliente)

Params: usuario, senha, conexao, captcha
- Obtem GUID do localStorage: ebfLocalStorageGetItem(concat(systemID, "_captcha_guid"))
- Chama [67] Validar Captcha (Servidor) com 5 params: GUID, captcha, usuario, senha, conexao

### Regra 29: [67] Login - Validar Captcha (Servidor)

Params: GUID, Captcha, username, password, connection
Retorno: Logico
- ebfValidateLocalCaptcha(Captcha, GUID) -> Resposta
- Decision 1: ambiente local?
- Decision 2: captcha valido?
  - SIM: chama [51] Autenticar Usuario(username, password, connection)
  - NAO: Activity "Mensagem de Erro" + chama [52] Criar Captcha (recria)

---

## Mapa Completo de Dependencias entre Regras

```
FORMULARIO PRINCIPAL:
[17] Ao Entrar
  -> [18] Ao Entrar (Servidor) -- retorna lista 6 params
  -> [28] Estrutura
       -> [29] Montar Dropdown
            -> [25] Criar Container de Troca de Temas
       -> [22] Carregar Atalhos
            -> [19] Ajustar Atalho
  -> [14] Alternar Menu
       -> [27] Definir Classe do Menu

[16] Ao Clicar no Menu
  -> [27] Definir Classe do Menu (2x)

[21] Ao Soltar Atalho
  -> [19] Ajustar Atalho

LOGIN:
[49] Ao Entrar
  -> [60] Obter Lista de Conexoes (Servidor)
  -> [52] Criar Captcha
       -> [53] Criar Captcha (Servidor)
  -> [51] Autenticar Usuario (Servidor) -- via certificado

[50] Ao Pressionar Tecla
  -> [66] Validar Captcha
       -> [67] Validar Captcha (Servidor)
            -> [51] Autenticar Usuario (Servidor)
            -> [52] Criar Captcha -- recria se falhou

KANBAN:
[37] Ao Entrar -- agenda outro fluxo (sem sub-rotinas)

DASHBOARD:
[1-6] -- sem sub-rotinas (fluxos isolados)
```

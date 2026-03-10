# Funções Nativas - Componente

Total: **136** funções

[← Voltar para Funções Nativas](README.md)

---

## Aba - Adicionar Nova Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTabComponentAddTab` |
| **Código** | 1008 |
| **Assinatura** | `Aba - Adicionar Nova Aba (Componente;Letras;Letras;Letras)` |
| **Parâmetros** | Componente;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função adiciona uma aba de formulário ao componente aba.

Parâmetro(s):
1. Componente Aba. 
2. Código ou GUID do Formulário que será adicionado. (Letras)
3. Título da Aba. (Letras, Opcional)
4. Filtro do Formulário. (Letras, Opcional)

Retorno:
Não possui.

Observações:
1. Se o título da aba não for especificado, o componente irá obter e utilizar o nome do formulário automaticamente.
1. No parâmetro filtro, os campos devem ser iguais aos campos da tabela associada ao formulário que vai ser aberto.
2. No parâmetro filtro, não podem haver espaços.
3. Caso o banco utilizado seja SQL Server e o tipo de dado do filtro seja varchar, deverá ser utilizado aspas simples no filtro.
4. Caso o filtro seja uma chave estrangeira que relaciona a outra entidade, deverá ser utilizado o filtro tabela.campo=valor (Junção de tabelas).
5. Somente poderá ser usado o comparador lógico de igualdade ("=").

Exemplo:
Assumindo como 3º parâmetro "CIDADE" (Formulário) e como 4º parâmetro "ESTADO=BAHIA", o resultado seria a abertura do formulário "CIDADE" somente com as cidades que pertencem ao Estado Bahia.

### Código Cliente (JavaScript)

```javascript
function ebfTabComponentAddTab(com, formGUID, title, filter) {
  return $c(com).addFormTab(title, formGUID, filter);
}
```

---

## Aba - Atualizar Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTabComponentUpdateTab` |
| **Código** | 1009 |
| **Assinatura** | `Aba - Atualizar Aba (Componente;Letras;Letras): Lógico` |
| **Parâmetros** | Componente;Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função atualiza o formulário contido na aba passada por parâmetro.

Parâmetro(s):
1. Componente Aba.
2. Código do Formulário ou Título da Aba a ser atualizada. (Letras)
3. Filtro do Formulário. (Letras, Opcional)

Retorno:
Valor lógico indicando se a aba foi atualizada. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfTabComponentUpdateTab(com, formId, filter) {
  return $c(com).updateFormTab(formId, filter);
}
```

---

## Aba - Fechar Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTabComponentRemoveTab` |
| **Código** | 1010 |
| **Assinatura** | `Aba - Fechar Aba (Componente;Letras): Lógico` |
| **Parâmetros** | Componente;Letras |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função fecha uma aba no componente Aba.

Parâmetro(s):
1. Componente Aba. 
2. Código do Formulário ou Título da Aba a ser fechada. (Letras)

Retorno:
Valor lógico indicando se a aba foi fechada. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfTabComponentRemoveTab(com, formOrTitle) {
  let component = $c(com);  

  if (component.getTabByTitle(formOrTitle)) {
    return component.removeTabByTitle(formOrTitle);    
  } else if (component.getTabByFormId(formOrTitle)) {
    return component.removeFormTab(formOrTitle);    
  }  

  return false;
}
```

---

## Aba - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTabNew` |
| **Código** | 272 |
| **Assinatura** | `Aba - Novo(Letras,Lógico)` |
| **Parâmetros** | Letras;Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria uma nova aba dinamicamente.

Parâmetro(s):
1. Nome da Aba. (Letras)
2. Valor lógico que confirma a criação da aba mesmo que já exista outra de mesmo nome. 

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTabNew(name,duplicate){
  var container = $mainform().d.t.getTabByName(name); 
  if(!container || duplicate){
    if(d.t){
      d.t.add(name);
    }
  }
}
```

---

## Aba - Novo Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNewTabComponent` |
| **Código** | 1011 |
| **Assinatura** | `Aba - Novo Componente (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Lógico;Lógico;Lógico;Inteiro;Lógico;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Lógico;Lógico;Lógico;Inteiro;Lógico;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um componente Aba dinamicamente.
	
Parâmetro(s):
1. Nome da Aba do Formulário. (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do componente. (Inteiro)
5. Altura do componente. (Inteiro)
6. Lista de Formulários. (Letras)
7. Nome do Componente. (Letras)
8. Visível? (Lógico)
9. Habilitado? (Lógico)
10. Permitir Fechar Aba? (Lógico)
11. Acessível (0 = Modo Inclusão/Alteração - 1 = Todos os Modos). (Inteiro)
12. Permitir Desdocar Formulário? (Lógico)
13. Container. (Letras)

Retorno: 
Não possui.

Observações:
1. Caso não seja informado o Nome da Aba no primeiro parâmetro a aba não será criada.
2. A lista de formulários da aba é um texto contendo as GUIDs dos formulários separados por "," (vírgula). Ex: {03F726D4-0168-40DE-9193-019B4D750E85},{5EB4F8A6-0D5D-473F-99DD-95124F239B01}

### Código Servidor (Java)

```java
protected final Variant ebfNewTabComponent(Variant aba, Variant posX, Variant posY, Variant width, Variant height, Variant formList, Variant comName, Variant visible, Variant enabled, Variant allowCloseTab, Variant access, Variant allowUndockForm, Variant container) throws Exception {
  if (!aba.getString().equals("")) {
    Map<wfr.sys.HTMLInterface.ComponentProperty, String> componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>();
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CLASSE_COMPONENTE, "Aba");
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ABA, aba.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_X, posX.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_Y, posY.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME, comName.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ALTURA, width.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TAMANHO, height.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.VISIVEL, visible.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HABILITADO, enabled.getString());

    if (!container.isNull()) {
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CONTAINER, container.getString());
    }

    wfr.com.WebrunProperties webrunProperties = new wfr.com.WebrunProperties();
    webrunProperties.put("Acessivel", access.getString());
    webrunProperties.put("FecharAba", allowCloseTab.getString());
    webrunProperties.put("Desdocar", allowUndockForm.getString());
    webrunProperties.put("ListaDeFormularios", formList.getString());

    WFRComponent com = new WFRComponent(fields.getForm(), 'W', componentProperties, webrunProperties);
    fields.getForm().addComponent(com, componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.ABA));
    wfr.sys.HTMLInterface.HTMLElement elem = wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(getData().getHtmlInterface(), getData(), com, getSystem(), fields.getResultSet(), response.getWriter());

    String requestAcceptHeader = request.getHeader("Accept");
    if (requestAcceptHeader.indexOf("application/javascript") == 0) {
      elem.designJs(true, true);
      response.getWriter().println("d.c_" + com.getCode() + ".design(d.t.getDiv('" + aba.getString() + "'), true)");
    } else {
      response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getOpenTagScript());
      response.getWriter().println("var d = $mainform().d;");
      response.getWriter().println("var HTMLTabComponent = $mainform().HTMLTabComponent;");
      elem.designJs(true, true);
      response.getWriter().println("d.c_" + com.getCode() + ".design(d.t.getDiv('" + aba.getString() + "'), true)");
      response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getCloseTagScript());
    }
  }

  return Variant.VARIANT_NULL;
}
```

---

## Accordion - Abrir Formulário na Seção

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAccordionOpenForm` |
| **Código** | 905 |
| **Assinatura** | `Accordion - Abrir Formulário na Seção (Componente;Letras;Inteiro)` |
| **Parâmetros** | Componente;Letras;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função abre um formulário na seção do Accordion.
    
Parâmetro(s):
1. Componente Accordion (Componente).
2. Título da Seção. (Letras).
3. Código do Formulário (Inteiro).

Retorno:
Não possui.

Observações:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfAccordionOpenForm(com, section, form) {
  return $c(com).openFormInSection(section, form);
}
```

---

## Accordion - Abrir URL na Seção

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAccordionOpenURL` |
| **Código** | 904 |
| **Assinatura** | `Accordion - Abrir URL na Seção (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função abre uma URL na Seção de acordo o valor informado no segundo parâmetro.

Parâmetro(s):
1. Nome da Seção. (Variante) (Ver observação 1)
2. URL. (Letras)

Retorno:
Não Possui.

Observação:
O 1º Parâmetro é enviado automaticamente no evento "Ao Expandir".

Exemplo:
No 2º Parâmetro deve passar uma URL, como: "http://www.softwell.com.br".

### Código Cliente (JavaScript)

```javascript
function ebfAccordionOpenURL(section, url) {

  let elemento = document.getElementById(section);

  if (elemento.children[0]) {
    elemento.children[0].src = url;
  } else {
    let iframe = document.createElement("iframe"); //cria iframe
    iframe.className = "w-100 h-100 border-0 m-0"; // Bootstrap
    iframe.style.outline = "0";
    iframe.src = url;
    elemento.appendChild(iframe);
  }
}
```

---

## Accordion - Atualizar conteúdo da Seção

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAccordionSetContent` |
| **Código** | 903 |
| **Assinatura** | `Accordion - Atualizar conteúdo da Seção (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza o conteúdo da seção especificada.

Parâmetro(s):
1. Nome da Seção. (Letras) (Ver observação 1)
2. Novo Conteúdo. (Letras) (Ver observação 2)

Retorno:
Não possui.

Observações: 
1. O 1º parâmetro é enviado automaticamente no evento "Ao Expandir".
2. O 2º parâmetro deve ser no formato HTML.

### Código Cliente (JavaScript)

```javascript
function ebfAccordionSetContent (section, content) {
   if (section && content) {   
     section = document.getElementById(section);
     if(section)
       section.innerHTML = content;
  }
}
```

---

## Accordion - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAccordionNew` |
| **Código** | 901 |
| **Assinatura** | `Accordion - Novo (Letras;Letras;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Lógico;Letras;SQL Consulta;Cor;Inteiro;Inteiro;Lógico;Variante;Variante;Variante;Letras)` |
| **Parâmetros** | Letras;Letras;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Lógico;Letras;SQL Consulta;Cor;Inteiro;Inteiro;Lógico;Variante;Variante;Variante;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função cria um componente Accordion dinamicamente.   
    
Parâmetro(s):
1. Nome da Aba. (Letras)
2. Dica. (Letras)
3. Posição X. (Inteiro)
4. Posição Y. (Inteiro)
5. Altura. (Inteiro)
6. Largura. (Inteiro)
7. Visível? (Lógico)
8. Habilitado? (Lógico)
9. Nome do Componente. (Letras)
10. Consulta SQL. (Opcional)
11. Cor da Fonte. (Cor, Opcional)
12. Orientação (1 = Horizontal; 2 = Vertical). (Inteiro)
13. Acessível (0 = Modo Inclusão/Alteração - 1 = Todos os Modos). (Inteiro)
14. Limitar Conteúdo. (Lógico)
15. Lista Formulário. (Variante)
16. Lista URL. (Variante)
17. Lista Títulos. (Variante)
18. Contêiner. (Letras)

Retorno:
Não possui.

Observação:
Caso o 10º parâmetro seja informado para carregamento das seções, os parâmetros 15º, 16º e 17º serão ignorados.

### Código Servidor (Java)

```java
protected final Variant ebfAccordionNew (Variant tab, Variant title, Variant posX, Variant posY, Variant height, Variant width,
      Variant visible, Variant enable, Variant name, Variant... variants) throws Exception{
  Variant SQL              = variants[0];
  Variant fontColor        = variants[1];
  Variant orientation      = variants[2];
  Variant modeAccessible   = variants[3];
  Variant limitContent     = variants[4];
  Variant forms            = variants[5];
  Variant uris             = variants[6];
  Variant titles           = variants[7];
  Variant container        = variants[8];
  return ebfAccordionNew(tab, title, posX, posY, height, width, visible, enable, name, SQL.getString(), 0, fontColor, orientation, modeAccessible, limitContent
      ,forms, uris, titles, container);
}

/*Sobrecarga devido SQL ser opcional, quando se utiliza o objeto Consulta SQL o mesmo passa dois parâmetros Query e Qtd parâmetros*/
protected final Variant ebfAccordionNew (Variant tab, Variant title, Variant posX, Variant posY, Variant height, Variant width,
      Variant visible, Variant enable, Variant name, String SQL, int paramsQtt, Variant... variants) throws Exception{

  if(SQL != null && SQL.length() > 0 && paramsQtt > 0){
    java.util.regex.Pattern interrogacao = java.util.regex.Pattern.compile("((¿)|(\\?))(?=(?:[^']|'[^']*')*$)");
    java.util.regex.Matcher matcher = interrogacao.matcher(SQL);
    StringBuffer bSQL = new StringBuffer();
    for(int i = 0; i < paramsQtt && matcher.find(); i++){
      if(variants[i].getType() == WFRRuleType.STRING ||
          variants[i].getType() == WFRRuleType.DATE ||
          variants[i].getType() == WFRRuleType.BOOLEAN) {
            matcher.appendReplacement(bSQL, "'"+variants[i].toString()+"'");
      } else{
          matcher.appendReplacement(bSQL, variants[i].toString());
      }
    }
    matcher.appendTail(bSQL);
    SQL = bSQL.toString();
  }

  wfr.util.SQLFormatter sqlf = new wfr.util.SQLFormatter();
  String sSQL = sqlf.format(SQL).toString();

  String fontColor     = variants[0 + paramsQtt].getString();
  int orientation      = variants[1 + paramsQtt].getLong().intValue();
  int modeAccessible   = variants[2 + paramsQtt].getLong().intValue();
  boolean limitContent = variants[3 + paramsQtt].getBoolean();
  Variant forms        = variants[4 + paramsQtt];
  Variant uris         = variants[5 + paramsQtt];
  Variant titles       = variants[6 + paramsQtt];
  String container     = variants[7 + paramsQtt].getString();

  /*Codifica a lista de formulários*/
  if (!isNullOrEmpty(forms).getBoolean()) {
    forms = new Variant ("Formulário=" + Functions.listToString((ArrayList)forms.getObject(), "|Formulário="));
  } else {
    forms = new Variant("");
  }

  /*Codifica a lista de URL's*/
  if (!isNullOrEmpty(uris).getBoolean()) {
    if(!isNullOrEmpty(forms).getBoolean())
      uris = new Variant("|URL=" + Functions.listToString((ArrayList) uris.getObject(), "|URL="));
    else
      uris = new Variant(" URL=" + Functions.listToString((ArrayList) uris.getObject(), "|URL="));
  }

  /*Codifica a lista de títulos*/
  if (!isNullOrEmpty(titles).getBoolean()) {
    if(!isNullOrEmpty(forms).getBoolean() || !isNullOrEmpty(uris).getBoolean())
      titles = new Variant("|Título=" + Functions.listToString((ArrayList) titles.getObject(), "|Título="));
    else
      titles = new Variant("Título=" + Functions.listToString((ArrayList) titles.getObject(), "|Título="));
  }

  String content = forms.getString().concat(uris.getString()).concat(titles.getString()).trim();

  HashMap<wfr.sys.HTMLInterface.ComponentProperty, String> componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>();
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ABA, tab.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_X, posX.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_Y, posY.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME, name.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TABULAR, "false");
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ALTURA, height.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TAMANHO, width.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.VISIVEL, visible.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HABILITADO, enable.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HIDDENPROPERTIES, "consultaSQL");
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CLASSE_COMPONENTE, "Accordion");

  WebrunProperties webrunProperties = new WebrunProperties();
  webrunProperties.put("consultaSQL", sSQL);
  webrunProperties.put("corFonteElemento", fontColor);
  webrunProperties.put("LimitarConteudo", limitContent);
  webrunProperties.put("orientacao", orientation);
  webrunProperties.put("Acessivel", modeAccessible);
  webrunProperties.put("ListaTitulo", content);


  WFRComponent com = new WFRComponent(fields.getForm(), 'W', componentProperties, webrunProperties);
  fields.getForm().addComponent(com, componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.ABA));
  wfr.sys.HTMLInterface.HTMLElement elem = wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(getData().getHtmlInterface(),
      getData(), com, getSystem(), fields.getResultSet(), response.getWriter());

  boolean isOpenAndCloseTagScript = !(request.getHeader("Accept").indexOf("application/javascript") > -1);
  if(isOpenAndCloseTagScript)
    response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getOpenTagScript());

  response.getWriter().println("var d = $mainform().d; var HTMLAccordion = $mainform().HTMLAccordion;");
  elem.designJs(true, true);
  response.getWriter().println("d.c_" + com.getCode()+ ".design(d.t.getDiv('"+tab.getString()+"'), true)");  
  response.getWriter().println("d.c_" + com.getCode() + ".onFormLoadAction();");
  if(isOpenAndCloseTagScript)
    response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getCloseTagScript());

  return Variant.VARIANT_NULL;
}
```

---

## Alterar Cor da Fonte e do Fundo do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetColorComponent` |
| **Código** | 516 |
| **Assinatura** | `Alterar Cor da Fonte e do Fundo do Componente (Componente;Letras;Letras)` |
| **Parâmetros** | Componente;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Alterar Cor da Fonte e Fundo do Componente.

Parâmetro(s):
1. Nome do Componente.
2. Cor da Fonte. (Letras)
3. Cor do Fundo. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSetColorComponent(ComponentName,color,bgcolor) {
   var c = $c(ComponentName);   
   if (color) {    
      c.setColor(color);
   }   
   if (bgcolor) {     
      c.setBGColor(bgcolor);
   }
}
```

---

## Alterar Cursor do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeCursorComponent` |
| **Código** | 525 |
| **Assinatura** | `Alterar Cursor do Componente (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Alterar Cursor do Componente.

Parâmetro(s):
1. Nome do Componente. (Componente)
2. Tipo do Cursor. (Letras) (Ver observação 2)

Retorno:
Não possui.

Observações:
1. Pode-se utilizar no evento ao entrar do formulário, para modificar o cursor.
2. No segundo parâmetro pode ser passado default, pointer etc.

### Código Cliente (JavaScript)

```javascript
function ebfChangeCursorComponent(componentVar, typeCursor) {
  var c = $c(componentVar);
  if (c) {
    if (c.name == "HTMLLabel") {    
      c = c.label;
    } else {    
      c = c.div;
    }
    c.style.cursor = typeCursor;
  }
}
```

---

## Alterar Hint do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetHint` |
| **Código** | 466 |
| **Assinatura** | `Alterar Hint do Componente (Componente;Letras);` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Alterar Hint do Componente.

Parâmetro(s):
1. Nome do Componente. (Ver observação 1)
2. Hint. (Dica)

Retorno:
Não possui.

Observação:
No 1º Parâmetro deve definir o formulário de trabalho no parâmetro de entrada, ou informar o nome do componente na constante letras.

### Código Cliente (JavaScript)

```javascript
function ebfSetHint(ComponentName,text) {
  var c = $c(ComponentName);
  c.setHint(text);
}
```

---

## Alterar Máscara

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComponentSetMask` |
| **Código** | 229 |
| **Assinatura** | `Alterar Máscara (Formulário;Componente;Letras;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | * |

### Descrição

Altera a máscara de um componente.

Parâmetro(s):
1. Formulário que contém o componente.
2. Nome do componente.
3. Nova máscara. (Letras)
4. Tipo da máscara. (Letras, Número ou Data)

Retorno:
Não possui.

Observação:
Observe que os valores no 4º parâmetros devem ser exatamente como estão descritos. Acentuação e caixas altas devem ser seguidas.

### Código Servidor (Java)

```java
protected final Variant ebfComponentSetMask(Variant formGUID, Variant componentName, Variant mask, Variant type) throws Exception {
  WFRComponent c = fields.getForm().getComponentByName(componentName.toString());
  if (c == null){
      throw new WFRRuleException("Componente não encontrado para o formulário escolhido!");
  }
  if(c.isDBAware()){
    if(type.getString().equals("Data")){
      type.setString("Date");
    }else if (type.getString().equals("Número")){
      type.setString("Number");
    }else{
      type.setString("String");
    }
    
    WFRDataType dt = new WFRDataType(c.getCode(), type.getString(), mask.getString(), mask.getString(), getSystem());
    dt.setFormatMask(mask.getString());
    c.getDataField().setDataType(dt);
  }
  return callClientFunction("ebfComponentSetMask", formGUID, componentName, mask, type);
}
```

### Código Cliente (JavaScript)

```javascript
function repeatValueUntilSize(s, size) {
  var r = "";
  for (var i = 1; i <= size; i++) {
    r += s;
  }
  return r;
}
function convertToJsMask(m, type) {
  var r = "";
  if (type != "date" && m != null && m.length > 0) {
    r = m;
    if (type == "number") {
      r = r.replace(/\\\\/g, "");
      r = r.replace(/;0/g, "");
      r = r.replace(/;1/g, "");
      r = r.replace(/\\!/g, "");
      r = trim(r);
      var li = r.lastIndexOf(".");
      var nm = "#,###";
      if (m.indexOf(",") == -1) {
        nm = "#";
      }
      if (li != -1) {
        nm += ".";
        nm += repeatValueUntilSize("0", r.substring(li + 1, r.length).length);
      }
      r = nm;
    } else {
      r = r.replace(/\\\\0/g, "Z");
      r = r.replace(/\\\\9/g, "N");
      r = r.replace(/\\\\/g, "");
      r = r.replace(/\\/g, "");
      r = r.replace(/;0/g, "");
      r = r.replace(/;1/g, "");
      r = r.replace(/!/g, "");
      r = r.replace(/0/g, "#");
      r = r.replace(/9/g, "#");
      r = r.replace(/Z/g, "0");
      r = r.replace(/N/g, "9");
      r = r.replace(/A/g, "*");
      r = r.replace(/L/g, "x");
      r = trim(r);
    }
  }
  return r;
}

function ebfComponentSetMask(formGUID, componentName, mask, type) {
  var component = $c(componentName, formGUID);
  if (component) {
    if (isNullable(mask)) {
      component.mask = null;
      return;
    }
    
    if (type == 'Data') {
      component.dateMask = mask;
    } else if (type == 'Número') {
      component.numberMask = convertToJsMask(mask, "number");
    } else {
      component.textMask = convertToJsMask(mask, "string");
    }
    
    if (component.maskSuport) {
      component.designMask();
      component.attachEvent(component.input, 'keypress', component.keypressAction);
      component.attachEvent(component.input, 'keyup', component.keyupAction);
      if (component.getValue().length > 0) {
        component.mask.allowPartial = true;
        component.setValue(component.mask.format(component.getValue()));
        component.mask.allowPartial = false;
      }
    }  
  }
}
```

---

## Alterar Tamanho da Fonte do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfsetSizeFontComponent` |
| **Código** | 496 |
| **Assinatura** | `Alterar Tamanho da Fonte do Componente (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Alterar Tamanho da Fonte do Componente.

Parâmetro(s):
1. Nome do Componente 
2. Tamanho da Fonte. (Inteiro)

Retorno:
Não possui.

Observação:
No 1º Parâmetro deve ser definir o formulário de trabalho no parâmetro de entrada, ou informar o nome do componente na constante letras.

### Código Cliente (JavaScript)

```javascript
function ebfsetSizeFontComponent(ComponentName,s) {
    s = (s ? s : 11);
   $c(ComponentName).setSize(s);
}
```

---

## Alterar Valor da Lista Dinâmica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetLookupName` |
| **Código** | 301 |
| **Assinatura** | `Componente - Alterar Valor da Lista Dinâmica(Formulário;Componente;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que altera o valor exibido na lista dinâmica.

Parâmetro(s):
1. Formulário. (Ver observação 1)
2. Componente Lista Dinâmica.
3. Novo valor que será exibido na Lista Dinâmica. (Letras)

Retorno:
Não possui.

Observação:
O 1º Parâmetro deve ser onde se encontra o componente do tipo "MakerLookup".

### Código Cliente (JavaScript)

```javascript
function ebfFormSetLookupName(form, com, newValue){
  try{
    var lk = $c(com);
        lk.setShowValue(newValue);
  }catch(e){
    throw "Não foi possível Alterar o valor do lookup";
  }
}
```

---

## Alterar imagem do componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetImageSrc` |
| **Código** | 447 |
| **Assinatura** | `Alterar imagem do componente (Componente;Variante)` |
| **Parâmetros** | Componente;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera a imagem de um componente do tipo "Imagem" disponível no formulário.

Parâmetro(s):
1. Componente que será alterado.
2. Novo valor do componente. (Variante)

Retorno: 
Não Possui.

Observações:
1. O valor do 2º parâmetro deve ser o byte de uma imagem.
2. Para a camada servidor no 2° parâmetro é necessário a utilização da função "Binário para base 64" e abrir uma consulta com o campo de tipo byte de uma imagem.

### Código Servidor (Java)

```java
protected final Variant ebfSetImageSrc(Variant componentName, Variant imageData) throws Exception {
  return callClientFunction("ebfSetImageSrc", componentName, imageData);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfSetImageSrc(componentName, imageData) {
  var imgComp = $c(componentName);
  if (imgComp.setImageBase64) {
    imgComp.setImageBase64(imageData);
  } else {
    imgComp.img.src = 'data:image/jpeg;base64,' + imageData;
    imgComp.noImage.style.display = 'none';
    imgComp.img.style.display = 'block';
  }
}
```

---

## Associar Componente a uma Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAssociatingComponent` |
| **Código** | 517 |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função associa (juntar ou unir) um componente a uma moldura.

Parâmetro(s):
1. Nome do componente. (Letras)
2. Nome da moldura que o componente será associado. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfAssociatingComponent(component, targetComponent) {
  /* var source = $c(component).div;  
  var destino = $c(targetComponent).div;  
  d.t.getDiv().removeChild(source);  
  destino.appendChild(source); */    

 var x = $c(targetComponent);
 var y = $c(component);
 x.div.appendChild(y.div);

}
```

---

## Associar Evento ao componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComponentEventAssociate` |
| **Código** | 490 |
| **Assinatura** | `Associar Evento ao componente (Componente;Letras;Fluxo)` |
| **Parâmetros** | Componente;Letras;Letras;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa um evento no padrão W3C (DOM Events Specification) ao componente.

Parâmetro(s): 
1. Componente cujo evento será associado.
2. Descrição do evento. (Letras) (Ver observação 3)
3. Fluxo que será executado quando o evento ocorrer. (Letras)
4. Lista com os parâmetros a serem passados para o fluxo. (Variante)

Retorno: 
Não possui.

Observações:
1. Caso o componente passado no primeiro parâmetro seja nulo, o evento será associado ao formulário.
2. O fluxo que será associado ao componente deve obrigatoriamente ser do tipo cliente.
3. Alguns eventos utilizados pelo Webrun no padrão W3C (Dom Events):
1 - onclick;
2 - onkeypress;
3 - onchange;
4 - onblur;
5 - onfocus;
6 - onmouseover.

Exemplo: 
1. Caso um fluxo de nome "Observador de eventos" precise ser chamado sempre que o usuário passar o mouse sobre um componente Texto chamado "MakerLabel1", a função ficaria:
1º Parâmetro: MakerLabel1 (Componente).
2º Parâmetro: onmouseover (Letras).
3º Parâmetro: Fluxo Observador de eventos (Letras).
4º Parâmetro: nulo.

### Código Cliente (JavaScript)

```javascript
var overwrittenEvents = new Map();
overwrittenEvents.add("change", "onchange");
overwrittenEvents.add("blur", "onblur");

function ebfComponentEventAssociate(componentName, eventName, ruleName, ruleParams) {  
  // Testa se o objeto é nulo e associa o evento ao formulário
  var component = controller.verifyComponent(componentName);
  
  // Obtém a DIV onde o evento será associado
  var componentDiv;
  if(component == null) { 
    componentDiv = $mainform().d;
  } else {
    componentDiv = component.div;
  }
  
  // Testa se o parâmetro do fluxo a ser executado é nulo
  if (typeof(ruleParams) == 'undefined' || ruleParams == null) {
    ruleParams = '';
  }
  
  // Remove o 'on' do evento
  var startsWithOn = /^on(.+)/;
  var found = eventName.match(startsWithOn);
  if (found != null && found != -1) {
    eventName = RegExp.$1;
  }
  
  // Associa o evento ao componente e define a função num array 
  var associatedFunction = function() {
    executeJSRuleNoField(sysCode, idForm, ruleName, ruleParams);
  }
  
  var event = overwrittenEvents.get(eventName);
  
  if (event != null) {
    component[event] = associatedFunction;
  } else {
    addEvent(componentDiv, eventName, associatedFunction, true);
    
    if (!componentDiv.ruleEvents) {
      componentDiv.ruleEvents = new Array();
    }
    componentDiv.ruleEvents[eventName] = associatedFunction;
  }
  
  if (component) {
    if(!component.onclick){   
      component.onclick = function() {};
    }     
    // Necessário, pois o componente pode ainda não ter evento associado o que o deixaria desabilitado
    component.setEnabled(true);
  }
}
```

---

## Associar Evento à Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAssociateTabEvent` |
| **Código** | 491 |
| **Assinatura** | `Associar Evento à Aba(Letras, Fluxo, Variante)` |
| **Parâmetros** | Letras;Fluxo;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa o evento a aba "Quando clicar na aba" definida por parâmetro.

Parâmetro(s):
1. Nome da aba. (Letras)
2. Nome da regra. (Letras ou Fluxo) (Ver observação 2)  
3. Lista contendo os parâmetros da regra. (Variante) (Ver observação 3)

Retorno:
Não possui.

Observações:
1. Esta função deve ser utilizada no evento "Ao Entrar" do formulário.
2. No segundo parâmetro a regra deve estar na camada cliente.
3. Mesmo que a regra executada não possua parâmetros, é necessário criar uma lista vazia.
4. O não preenchimento do 3° parâmetro inutilizará a função.
5. Ao associar o evento à aba localizar, esta não carregará os dados padrão, pois o mesmo será sobrescrito pelo evento associado.

### Código Cliente (JavaScript)

```javascript
function ebfAssociateTabEvent(aba, rule, ruleParams) {
  var _ruleName = rule;
  var _params = ruleParams;
  var _sys = sysCode;
  var _formID = idForm;

  $mainform().d.t.getTabByName(aba).onclick = function() {
    executeJSRuleNoField(_sys, _formID, _ruleName, ruleParams);
  } 
  return null;
}
```

---

## Atualizar Todos os Componentes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormRefreshAllComponents` |
| **Código** | 1064 |
| **Assinatura** | `Atualizar Todos os Componentes ()` |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza o conteúdo/dados de todos os componentes no formulário.

Parâmetro(s):
Não possui.

Retorno: 
Não possui.

Observações:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfFormRefreshAllComponents() {
  Object.values($mainform().controller.elemsById).filter((com) => com.name !== "HTMLNavigationButton" && com.name !== "HTMLHidden").map((com) => com.timeout(com.refresh, 0));
}
```

---

## Ação - Atualizar Imagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfActionSetImage` |
| **Código** | 900 |
| **Assinatura** | `Ação - Atualizar Imagem (Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza a imagem do componente.
    
Parâmetro(s):
1. Nome do Componente. (Letras)
2. URL ou GUID da Imagem. (Letras) (Ver observação 1)
3. Evento. (Letras, Opcional) (Ver observação 2) 

Retorno:
Não Possui.

Observações:
1. Para informar uma GUID no 2º Parâmetro, deve utilizar a galeria de imagens do Maker.
2. O 3º Parâmetro determina qual evento será executado para alterar a imagem (Ao Clicar/Ao Passar o Mouse). Caso nulo apenas altera a imagem.

### Código Cliente (JavaScript)

```javascript
function ebfActionSetImage(name, urlImage, event) {
  let component = $c(name);
  if (!component) {
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", name));
    return false;
  }  
  let isGUID = urlImage.startsWith("{");
  event = event ? event : "";
  switch (event.toLowerCase()){
    case 'ao clicar':
      if(isGUID){
          component.ImageOnClick = urlImage;
      } else {
          component.URLImageOnClick = urlImage;
      }
    break;
    case 'ao passar o mouse':
      if(isGUID){
          component.ImageMouseOver = urlImage;
      } else {
          component.URLImageMouseOver = urlImage;
      }
    break;
    default:
      if(isGUID){
          component.Image = urlImage;
      } else {
          component.URLImage = urlImage;
      }
    break;
  }  
  component.updateImage(); 
}
```

---

## Ação - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfActionNew` |
| **Código** | 899 |
| **Assinatura** | `Ação - Novo (Letras;Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Letras;Inteiro;Letras;Letras;Lógico;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Letras;Inteiro;Letras;Letras;Lógico;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Ação dinamicamente.

Parâmetro(s):
1. Aba (caso não seja definida, a aba não será criada). (Letras)
2. Nome do componente. (Letras)
3. Posição X. (Inteiro)
4. Posição Y. (Inteiro)
5. Altura do componente. (Inteiro)
6. Largura do componente. (Inteiro)
7. URL Imagem. (Letras)
8. URL Imagem Ao Clicar. (Letras)
9. URL Imagem Ao Passar o Mouse. (Letras)
10. GUID Imagem. (Letras)
11. GUID Imagem Ao Clicar. (Letras)
12. GUID Imagem Ao Passar o Mouse. (Letras)
13. Acessível (0 = Modo Inclusão/Alteração - 1 = Todos os Modos). (Inteiro)
14. Ação Predefinida. (Letras) (Ver observação 1)
15. Dica. (Letras)
16. Habilitado? (Lógico)
17. Container. (Letras)
18. Estilo CSS. (Letras)
19. Classe CSS. (Letras)

Retorno:
Não possui.

Observação:
No 14º parâmetro deve (Configurar Conexões Adicionais, Grupos, Usuários, LOG, Alterar Senha, Importação de Relatório, Executar Script SQL, 
Recarregar Sistema, Modo Normal, Modo Gerente, Modo Projeto, Alterar Usuário, Sair).

### Código Cliente (JavaScript)

```javascript
function ebfActionNew(tab, name, posX, posY, height, width, urlImage, urlImageClick, urlImageOver, guidImage,
    guidImageClick, guidImageOver, modeAccessible, defaultAction, title, enable, compContainer, styleCss, classCss) {
  let code = getCodComponent();
  let component = new HTMLActionButton(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, "", "");
  component.id = name;
  component.zindex = 3;
  component.loadComponentTime = 0;  
  component.Aba = tab;
  component.AcoesPreDefinida = defaultAction;
  component.Tamanho = width;
  component.Image = guidImage;
  component.Container = compContainer;
  component.Categoria = 'Maker 3';
  component.Habilitado = enable;
  component.URLImageMouseOver = urlImageOver;
  component.URLImageOnClick = urlImageClick; 
  component.Acessivel = modeAccessible;
  component.Nome = name;
  component.Visivel = 'True';
  component.Dica = title;
  component.ClasseComponente = 'Acao';  
  component.ImageMouseOver = guidImageOver;
  component.URLImage = urlImage;
  component.Altura = height;
  component.ImageOnClick = guidImageClick;  
  component.PosicaoY = posX;
  component.PosicaoX = posY;  
  component.styleCss = styleCss;  
  component.classCss = classCss;
   
  let container = $mainform().d.t.getTabByName(tab);  
  if (!container) {
     d.t.add(tab);
     container = $mainform().d.t.getTabByName(tab);
  } 
  if (compContainer) {   
    compContainer = document.getElementById(compContainer);
    component.design(compContainer, true);
  } else{ 
    component.design(container.div, true);  
  }  
}
```

---

## Botão - Alterar Imagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeImageButton` |
| **Código** | 484 |
| **Assinatura** | `Alterar a imagem do botão(Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Altera a imagem do componente botão passado no primeiro parâmetro.

Parâmetro(s):
1. Nome do Componente.
2. Caminho da imagem. (Letras)

Retorno:
Não possui.

Observação:
A imagem deve estar no contexto do Webrun ou URL externa ex.: http://suporte.softwell.com.br/logo.jpg.

### Código Cliente (JavaScript)

```javascript
function ebfChangeImageButton(component, path){
       $c(component).setImage(path);        
}
```

---

## Botão - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfButtonNew` |
| **Código** | 465 |
| **Assinatura** | `Botão - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Botão dinamicamente.

Parâmetro(s):
1. Aba (Caso não seja definida, a aba não será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do Componente. (Inteiro)
5. Altura do Componente. (Inteiro)
6. Descrição do Componente. (Letras)
7. Imagem. (Letras)
8. ID do Componente. (Letras) (Ver observação 2)
9. Container. (Letras)
10. Estilo CSS. (Letras)
11. Classe CSS. (Letras)

Retorno:
Não possui.

Observações:
1. No 7º parâmetro a mesma deve estar no local Skins\Default.
2. No 8º parâmetro deve ser passado o identificador do componente, ex: MakerButton1.

### Código Cliente (JavaScript)

```javascript
function ebfButtonNew(aba, posX, posY, width, height, description, img, id, compContainer, styleCss, classCss){
    var code = getCodComponent();
    var component = new HTMLButton(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, description, img);
    component.id = id;
    component.loadComponentTime = 0;  
    component.classCss = classCss;
    component.styleCss = styleCss;
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    if(compContainer){
      component.container = compContainer;   
      compContainer = document.getElementById(compContainer);
      component.design(compContainer, true);
    }else{ 
       component.design(container.div, true);  
     }
    document['c_' + code] = component;
  }
```

---

## Caixa de Texto - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEditNew` |
| **Código** | 639 |
| **Assinatura** | `Caixa de Texto - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Inteiro;Lógico;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Inteiro;Lógico;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente caixa de texto dinamicamente.

Parâmetro(s):
1. Aba (Caso não seja definida, a aba não será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do Componente. (Inteiro)
5. Altura do Componente. (Inteiro)
6. Descrição do Componente. (Letras)
7. Valor. (Letras)
8. ID para o componente. (Letras)
9. Tipo (moeda, inteiro, data) (Letras, Opcional)
10. Texto quando Nulo. (Letras, Opcional)
11. Posição da Descrição (Inteiro, Opcional)
12. Auto Completar? (Lógico, Opcional)
13. Container. (Letras)
14. Estilo CSS. (Letras)
15. Classe CSS. (Letras)

Retorno:
Não possui.

Observação:
Caso se deseje utilizar um dos tipos de dados acima, deve-se escrever o tipo do mesmo, conforme as opções. O 
mesmo irá definir a máscara escolhida ao componente.

### Código Cliente (JavaScript)

```javascript
function ebfEditNew(aba, posX, posY, width, height, description, value, id, maskType, placeholder, labelPosition, autocomplete, compContainer, styleCss, classCss) {  
    var code = getCodComponent();
    var component = new HTMLEdit(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, description, value);
    if (!id) {
      id = description;
    } 
    component.id = id;
    component.zindex = 3;
    component.loadComponentTime = 0;  
    component.styleCss = styleCss;  
    component.classCss = classCss;
    
    if (placeholder) {
      component.placeholder = placeholder;
    }
    
    if (labelPosition) {
      component.labelPosition = labelPosition;
    }
    
    if (autocomplete) {
      component.autocomplete = autocomplete;
    }
    
    if (maskType == "data") {   
      component.type = 2;
      component.typeName = 'date';
      component.textMask = '##/##/####';
    }
    
    if (maskType == "datahora") {   
      component.type = 2;
      component.typeName = 'datetime';
      component.textMask = '##/##/#### ##:##:##';
    }
  
    if (maskType == "moeda") {
      component.typeName = 'double';
      component.numberMask = '#,###.00';
      component.align = 'right';
    }
    
    if (maskType == "inteiro") {
      component.typeName = 'integer';
      component.numberMask = '#';
      component.align = 'right';
    }  
  
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    if(compContainer){
      component.container = compContainer;
      compContainer = document.getElementById(compContainer);
      component.design(compContainer, true);
    }else{ 
       component.design(container.div, true);  
     }
    document['c_' + code] = component;  
    setOrderTabDynamically(component);
  }
  
  //Chamado quando cria-se um componente (Maker All) dinamicamente na camada cliente.
  function setOrderTabDynamically (component){
    if(component && orderTab){
      for(i=0; i <= orderTab.length; i++){
        if(orderTab[i] instanceof HTMLNavigationButton || orderTab[i] instanceof HTMLNavigationButtonSingleImage){
          orderTab.splice(i, 0, component);
          break;
        }else if(i === orderTab.length) {
          orderTab.push(component);        
          break;
        }     
      }
    }
  }
```

---

## Calendário - Decrementar Ano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarDecYear` |
| **Código** | 916 |
| **Assinatura** | `Calendário - Decrementar Ano (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função decrementa um ano na data atual.

Parâmetro:
1. Componente Calendário.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCalendarDecYear (Variant comp) throws Exception {
  return callClientFunction("ebfCalendarDecYear", comp);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCalendarDecYear (comp) {
  let rComp = $c(comp);  
  if (rComp)  
    rComp.prevYear();
  else      
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Decrementar Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarDecMonth` |
| **Código** | 917 |
| **Assinatura** | `Calendário - Decrementar Mês (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função decrementa um mês na data atual.

Parâmetro:
1. Componente Calendário.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCalendarDecMonth (Variant comp) throws Exception {
  return callClientFunction("ebfCalendarDecMonth", comp);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCalendarDecMonth (comp) {
  let rComp = $c(comp);  
  if (rComp)  
    rComp.prevMonth();
  else      
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Hoje

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarToday` |
| **Código** | 913 |
| **Assinatura** | `Calendário - Hoje (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função modifica o componente para a data atual.

Parâmetro:
1. Componente Calendário.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCalendarToday (Variant comp) throws Exception {
  return callClientFunction("ebfCalendarToday", comp);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCalendarToday (comp) {
  let rComp = $c(comp);  
  if (rComp)  
    rComp.goToday();
  else   
   interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Incrementar Ano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarIncYear` |
| **Código** | 915 |
| **Assinatura** | `Calendário - Incrementar Ano (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função incrementa um Ano na data atual.

Parâmetro:
1. Componente Calendário.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCalendarIncYear (Variant comp) throws Exception {
  return callClientFunction("ebfCalendarIncYear", comp);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCalendarIncYear (comp) {
  let rComp = $c(comp);  
  if (rComp)  
    rComp.nextYear();
  else      
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Incrementar Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarIncMonth` |
| **Código** | 914 |
| **Assinatura** | `Calendário - Incrementar Mês (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função incrementa um mês na data atual.

Parâmetro:
1. Componente Calendário.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCalendarIncMonth (Variant comp) throws Exception {
  return callClientFunction("ebfCalendarIncMonth", comp);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCalendarIncMonth (comp) {
  let rComp = $c(comp);  
  if (rComp)  
    rComp.nextMonth();
  else      
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Ir para o Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarGoToMonth` |
| **Código** | 922 |
| **Assinatura** | `Calendário - Ir para o Mês (Componente;Inteiro;Inteiro)` |
| **Parâmetros** | Componente;Inteiro;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função navega o componente para o mês e ano passados por parâmetro.

Parâmetro(s):
1. Componente Calendário.
2. Mês. (Inteiro)
3. Ano. (Inteiro)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCalendarGoToMonth (Variant comp, Variant month, Variant year) throws Exception {
  return callClientFunction("ebfCalendarGoToMonth", comp, month, year);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCalendarGoToMonth (comp, month, year) {
  let rComp = $c(comp);  
  if (rComp) {  
    if (month && year)
      return rComp.goToMonth(month, year);
    return false;   
  }       
  else interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarNew` |
| **Código** | 1104 |
| **Assinatura** | `Calendário - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Tabela;Letras;Letras;Tabela;Letras;Letras;Letras;Letras;Variante)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Tabela;Letras;Letras;Tabela;Letras;Letras;Letras;Letras;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função cria um componente Calendário dinamicamente.   
    
Parâmetro(s):
1. Nome da Aba. (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Tamanho. (Inteiro)
5. Altura. (Inteiro)
6. Nome do Componente. (Letras)
7. Consulta SQL Feriado. (Tabela) (Ver observação 1)
8. Campo Data Feriado. (Letras)
9. Campo Descrição Feriado. (Letras)
10. Consulta SQL Atividade. (Tabela) (Ver observação 1)
11. Campo ID. (Letras)
12. Campo Data Inicio Atividade. (Letras)
13. Campo Data Final Atividade. (Letras)
14. Campo Descrição Atividade. (Letras)
15. JSON de Propriedades. (Variante) (Ver observação 2)

Retorno:
Não possui.

Observações:
1. Os parâmetros 7° e 10º esperam o retorno da função "Obter SQL do Editor".
2. O objeto JSON informado no 15º parâmetro deve seguir o padrão abaixo:
{
  
    "Navegação": "true",
  
    "Dica": "Dica para o componente",
  
    "Habilitado": "true",
  
    "Visível": "true",
  
    "Container": "Nome do Componente",
  
    "Editável": "true",
  
    "Formulário de Edição": "formulário",
  
    "Exibir Números dos Dias": "true",
  
    "Destacar Hórario Comercial": "true",
  
    "Destacar Dia Atual": "true",
  
    "Modo de Visualização": "1"

}

### Código Servidor (Java)

```java
protected final Variant ebfCalendarNew (Variant tab, Variant posX, Variant posY,
    Variant width, Variant height ,Variant name, Variant... variants) throws Exception {

    String enable = "";
    String visible = "";
    String hiddenProperties = "consultaSQL;consultaSQLAtividade;campoData;campoDescricao;FonteDeDados;";
    hiddenProperties = hiddenProperties.concat("campoIDAtividade;campoDataAtividade;campoDataFimAtividade; campoDescricaoAtividade");
    Object rsetHoliday            = variants[0].getObject();
    String fDateHoliday           = variants[1].getString();
    String fDescription           = variants[2].getString();
    Object rsetActivity           = variants[3].getObject();
    String fIDActivity            = variants[4].getString();
    String fDateActStart          = variants[5].getString();
    String fDateActEnd            = variants[6].getString();
    String fDescriptionA          = variants[7].getString();

    jakarta.json.JsonObject jsonProperties = (jakarta.json.JsonObject) variants[8].getObject();
    int idx = 0;

    /*Propriedades que estão carregados no XML*/
    WebrunProperties webrunProperties = new WebrunProperties();
    webrunProperties.put("consultaSQL", rsetHoliday);
    webrunProperties.put("campoData", fDateHoliday);
    webrunProperties.put("campoDescricao", fDescription);
    webrunProperties.put("consultaSQLAtividade", rsetActivity);
    webrunProperties.put("campoIDAtividade", fIDActivity);
    webrunProperties.put("campoDataAtividade", fDateActStart);
    webrunProperties.put("campoDataFimAtividade", fDateActEnd);
    webrunProperties.put("campoDescricaoAtividade", fDescriptionA);

    List<String> properties = new ArrayList<String>();
    properties.add("Navegacao");
    properties.add("FonteDeDados");
    properties.add("container");
    properties.add("Editavel");
    properties.add("FormularioDeEdicao");
    properties.add("ExibirNumerosDosDias");
    properties.add("DestacarHorarioComercial");
    properties.add("DestacarDiaAtual");
    properties.add("ModoDeVisualizacao");

    java.util.Set keys = jsonProperties.keySet();
    for(Object key : keys) {
      if(key.toString().equalsIgnoreCase("Visível")) {
        visible = jsonProperties.getString(key.toString());
      } else if(key.toString().equalsIgnoreCase("Habilitado")) {
        enable = jsonProperties.getString(key.toString());
      } else {
        webrunProperties.put(properties.get(idx), jsonProperties.getString(key.toString()));
        idx++;
      }
    }

    /*Propriedades padrões dos componentes*/
    HashMap<wfr.sys.HTMLInterface.ComponentProperty, String> componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>();
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ABA, tab.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_X, posX.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_Y, posY.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME, name.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TABULAR, "false");
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ALTURA, height.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TAMANHO, width.getString());
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.VISIVEL, visible);
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HABILITADO, enable);
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HIDDENPROPERTIES, hiddenProperties);
    componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CLASSE_COMPONENTE, "Calendario");

    WFRComponent com = new WFRComponent(fields.getForm(), 'W', componentProperties, webrunProperties);
    fields.getForm().addComponent(com, componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.ABA));
    wfr.sys.HTMLInterface.HTMLElement elem = wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(getData().getHtmlInterface(),
      getData(), com, getSystem(), fields.getResultSet(), response.getWriter());
    boolean isOpenAndCloseTagScript = !(request.getHeader("Accept").indexOf("application/javascript") > -1);
    if(isOpenAndCloseTagScript)
      response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getOpenTagScript());

    response.getWriter().println("var d = $mainform().d; var HTMLCalendar = $mainform().HTMLCalendar;");
    elem.designJs(true, true);
    response.getWriter().println("d.c_"+com.getCode()+".design(d.t.getDiv('"+tab.getString()+"'), true)");
    if(isOpenAndCloseTagScript)
      response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getCloseTagScript());

    return Variant.VARIANT_NULL;
  }
```

---

## Calendário - Obter Ano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarGetYear` |
| **Código** | 911 |
| **Assinatura** | `Calendário - Obter Ano (Componente): Inteiro` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função obtém a ano corrente do componente.

Parâmetro:
1. Componente Calendário.

Retorno:
Ano corrente. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfCalendarGetYear (comp) {
  let rComp = $c(comp);  
  if (rComp)  
    return rComp.getYear();    
  interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Calendário - Obter Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCalendarGetMonth` |
| **Código** | 912 |
| **Assinatura** | `Calendário - Obter Mês (Componente;Lógico): Variante` |
| **Parâmetros** | Componente;Lógico |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função obtém o mês corrente do componente.

Parâmetro(s):
1. Componente Calendário.
2. Por extenso? (Lógico)

Retorno:
Mês corrente. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfCalendarGetMonth (comp, monthName) {
  let rComp = $c(comp);  
  if (rComp)  
    return rComp.getMonth(monthName);    
  interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", comp));
}
```

---

## Card - Anexar Evento ao Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAddEventOnCard` |
| **Código** | 1005 |
| **Assinatura** | `Card - Anexar Evento ao Componente (Componente;Letras;Fluxo;Variante)` |
| **Parâmetros** | Componente;Letras;Fluxo;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa um evento no padrão W3C (DOM Events Specification) ao componente Card.

Parâmetro(s): 
1. Componente Card.
2. Descrição do evento. (Letras) (Ver observação 3)
3. Fluxo que será executado quando o evento ocorrer. (Fluxo)
4. Lista com os parâmetros a serem passados para o fluxo. (Variante)

Retorno: 
Não possui retorno.

Observações:
1. O fluxo que será associado ao componente deve obrigatoriamente ser do tipo cliente.
2. Caso o evento seja nulo, ou vazio, por padrão, é adicionado o evento ?click?.
3. Alguns eventos utilizados pelo Webrun no padrão W3C (Dom Events):
1 - onclick
2 - onkeypress
3 - onchange
4 - onblur
5 - onfocus
6 - onmouseover
7 - dblclick

Exemplo: 
Caso um fluxo de nome "Observador de eventos" precise ser chamado sempre que o usuário passar o mouse sobre um componente Texto chamado "MakerLabel1", a função ficaria:
1º Parâmetro: MakerLabel1 (Componente).
2º Parâmetro: onmouseover (Letras).
3º Parâmetro: Fluxo Observador de eventos (Fluxo).
4º Parâmetro: nulo.

### Código Cliente (JavaScript)

```javascript
function ebfAddEventOnCard (cardID, event, flow, params) {
   var card = $c(cardID);       
   if(!card) throw interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", cardID));          

   card.addEventOnCard(event, flow, params);  
}
```

---

## Card - Preencher Card

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFillOutCard` |
| **Código** | 1033 |
| **Assinatura** | `Card - Preencher Card (Letras;Letras;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Preenche o componente de acordo com os parâmetros informados por parâmetros.

Parâmetros:
1. Componente; 
2. Título (Opcional)
3. Título do Corpo
4. Texto do Corpo
5. Texto do Rodapé
6. URL Imagem (Opcional)

Retorno:
Não possui.

Observação:
1. Os parâmetros 2 ao 6 são opcionais;

### Código Cliente (JavaScript)

```javascript
function ebfFillOutCard(cardID, title, titleBody, bodyText, footer, image) {
  var card = $c(cardID);
  if(card)
    card.fillOutCard(title, titleBody, bodyText, footer, image);
  else
    handleException(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", cardID));; 
}
```

---

## Chat - Abrir Conversa com Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatOpenGroupConversation` |
| **Código** | 979 |
| **Assinatura** | `Chat - Abrir Conversa com Grupo (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Abre a conversa com um grupo.

Parâmetro(s):
1. Componente Chat. 
2. ID do Grupo. (Inteiro)

Retorno:
Não possui.

Observação:
O ID do Grupo definido no 2º parâmetro deve ser obtido através da tabela responsável por armazenar as definições do grupo.

### Código Cliente (JavaScript)

```javascript
function ebfChatOpenGroupConversation(chat, groupId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup) chatGroup.setActive(true);
    }
}
```

---

## Chat - Abrir Conversa com Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatOpenUserConversation` |
| **Código** | 980 |
| **Assinatura** | `Chat - Abrir Conversa com Usuário (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Abre a conversa com um usuário.

Parâmetro(s):
1. Componente Chat.
2. ID do Usuário. (Inteiro)

Retorno:
Não possui.

Observação:
O ID do Usuário definido no 2º parâmetro deve ser obtido através da tabela responsável por armazenar as definições do usuário.

### Código Cliente (JavaScript)

```javascript
function ebfChatOpenUserConversation(chat, userId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatUser = chatComponent.getUserById(userId);
        if (chatUser) chatUser.setActive(true);
    }
}
```

---

## Chat - Adicionar Assistente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatAddAssistant` |
| **Código** | 1070 |
| **Assinatura** | `Chat - Adicionar Assistente (Formulário;Componente;Letras;Letras;Letras;Letras): Lógico` |
| **Parâmetros** | Formulário;Componente;Letras;Letras;Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função adiciona um assistente virtual ao componente.

Parâmetros:
1. Formulário
2. Componente
3. Nome do Assistente
4. Imagem (GUID da Imagem armazenada na galeria de imagens).
5. APIKEY (APIKEY obtida na conta da openai).
6. Identificador do Assistente (Obtida na conta da openai)

Retorno:
Valor lógico indicando se o assistente foi adicionado.

Observações:
1. As informações da APIKEY e Identificador do assistente podem ser obtidas no link: https://platform.openai.com/playground
2. Após a utilização dessa função, é recomendado utilizar a função "Chat - Atualizar Componente".

### Código Servidor (Java)

```java
protected final Variant ebfChatAddAssistant(
    Variant formGUID,
    Variant comp,
    Variant name,
    Variant image,
    Variant apiKey,
    Variant assistant) throws Exception {

  WFRForm form = getSystem().getFormByGuid(formGUID.getString());
  if(form != null) {
    WFRComponent component = form.getComponentByName(comp.getString());
    if(component != null) {
      wfr.sys.HTMLInterface.HTMLChat chatElement = (wfr.sys.HTMLInterface.HTMLChat) wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(
          getData().getHtmlInterface(), getData(), component, getSystem(), fields.getResultSet(), response.getWriter());

      return new Variant(chatElement.addAssistant(
          name.getString(),
          image.getString(),
          apiKey.getString(),
          assistant.getString()));
    }
  }
  return Variant.VARIANT_FALSE;
}
```

---

## Chat - Adicionar Usuários ao Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGroupAddUsers` |
| **Código** | 981 |
| **Assinatura** | `Chat - Adicionar Usuários ao Grupo (Componente;Inteiro;Variante)` |
| **Parâmetros** | Componente;Inteiro;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Adiciona usuários a um grupo (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Grupo. (Inteiro)
3. Lista contendo os IDs dos Usuários. (Variante)

Retorno:
Não possui.

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o grupo não estiver na lista do chat especificado, a função não irá fazer nada.
3. Alterações em grupos só serão feitas se o chat estiver com a propriedade "Permitir Criação de Grupos" habilitada.
4. O usuário logado deve ser administrador do grupo especificado para poder adicionar/remover usuários.

### Código Cliente (JavaScript)

```javascript
function ebfChatGroupAddUsers(chat, groupId, users) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup) chatGroup.groupAddUsers(users);
    }
}
```

---

## Chat - Atualizar Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatUpdateComponent` |
| **Código** | 982 |
| **Assinatura** | `Chat - Atualizar Componente (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza os dados em cache do componente (lista de grupos, usuários, etc).

Parâmetro:
1. Componente Chat.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfChatUpdateComponent(chat) {
    var chatComponent = $c(chat);
    if (chatComponent) chatComponent.updateData(true);
}
```

---

## Chat - Enviar Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatSendMessage` |
| **Código** | 983 |
| **Assinatura** | `Chat - Enviar Mensagem (Componente;Inteiro;Lógico;Letras)` |
| **Parâmetros** | Componente;Inteiro;Lógico;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Envia uma mensagem para um usuário/grupo.

Parâmetro(s):
1. Componente Chat.
2. ID do Usuário/Grupo. (Inteiro)
3. ID do 2º parâmetro é um grupo? (Lógico)
4. Mensagem. (Letras)

Retorno:
Não possui.

Observação:
Se a mensagem estiver vazia ou somente preenchida com espaços, a função não irá efetuar a operação de envio da mensagem.

### Código Cliente (JavaScript)

```javascript
function ebfChatSendMessage(chat, entityId, entityIsGroup, messageContent) {
    if (messageContent === undefined || messageContent === null || messageContent.toString().length == 0 ||
        messageContent.toString().trim().length == 0) return;

    var chatComponent = $c(chat);
    if (chatComponent) {
        chatComponent.sendMessage(entityId, entityIsGroup, messageContent.toString().trim());
    }
}
```

---

## Chat - Exportar Conversa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatExportConversation` |
| **Código** | 984 |
| **Assinatura** | `Chat - Exportar Conversa (Componente;Inteiro;Lógico;Letras;Inteiro;Inteiro;Lógico;Inteiro;Lógico;Data;Data)` |
| **Parâmetros** | Componente;Inteiro;Lógico;Letras;Inteiro;Inteiro;Lógico;Inteiro;Lógico;Data;Data |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Exporta uma conversa do usuário logado com outro usuário/grupo do chat.

Parâmetro(s):
1. Componente Chat.
2. ID do Usuário/Grupo (Inteiro).
3. ID do 2º parâmetro é um grupo? (Lógico).
4. Formato de Exportação. (Letras) (Ver observação 3)
5. Ordem de Exportação das Mensagens (0: antigas para novas, 1: novas para antigas). (Inteiro)
6. Layout da página (de 1 a 6, onde 1 é A1 e 6 é A6). (Inteiro)
7. Rotacionar Página? (Lógico)
8. Estilo da Tabela (0: simples, 1: escuro). (Inteiro)
9. Bordas na Tabela? (Lógico)
10. Data Inicial. (Data)
11. Data Final. (Data)

Retorno:
Não possui.

Observações:
1. As datas nos 10º e 11º parâmetros podem ser nulas. Se a data inicial e a data final forem nulas, todo o histórico será exportado. Se somente a data final for nula, todas as mensagens da data inicial até o final serão exportadas.
2. Após o processamento, o download da conversa exportada será iniciado automaticamente.
3. O dado passado no 4º parâmetro pode ser do tipo PDF.

### Código Cliente (JavaScript)

```javascript
function ebfChatExportConversation(chat, entityId, entityIsGroup, format, order, layout, rotated, style, borders, dateStart, dateEnd) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        if (dateStart && dateStart instanceof Date) dateStart = dateStart.toISOString();
        if (dateEnd && dateEnd instanceof Date) dateEnd = dateEnd.toISOString();

        chatComponent.exportConversation(entityId, parseBoolean(entityIsGroup) ? 1 : 0,
            format, parseInt(order), parseInt(layout), parseBoolean(rotated), parseInt(style),
            parseBoolean(borders), dateStart, dateEnd);
    }
}
```

---

## Chat - Fechar Conversa Ativa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatCloseActiveConversation` |
| **Código** | 985 |
| **Assinatura** | `Chat - Fechar Conversa Ativa (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Fecha a conversa ativa no chat.

Parâmetro:
1. Componente Chat.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfChatCloseActiveConversation(chat) {
    var chatComponent = $c(chat);
    if (chatComponent && chatComponent.activeContainer) {
        chatComponent.activeContainer.setActive(false);
        chatComponent.activeContainer = null;
    }
}
```

---

## Chat - Obter Identificador dos Assistentes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGetAssistantsIds` |
| **Código** | 1069 |
| **Assinatura** | `Chat - Obter Identificador dos Assistentes (Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém o identificador único de um ou mais assistentes virtuais adicionados ao componente.

Parâmetros:
1. Formulário
2. Componente

Retorno:
Objeto JSONArray contento os indentificadores obtidas.


Observações:
1. Caso o componente não tenha nenhum assistente adicionado, será retornado um objeto vazio.
2. Exemplo de retorno da função:

[
  {
    "name":"nome do assistente",
    "botId":"UUID do assisten"
  }
]

### Código Servidor (Java)

```java
protected final Variant ebfChatGetAssistantsIds(Variant formGUID, Variant comp) throws Exception {
  WFRForm form = getSystem().getFormByGuid(formGUID.getString());
  if(form != null) {
    WFRComponent component = form.getComponentByName(comp.getString());
    if(component != null) {
      wfr.sys.HTMLInterface.HTMLChat chatElement = (wfr.sys.HTMLInterface.HTMLChat) wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(
          getData().getHtmlInterface(), getData(), component, getSystem(), fields.getResultSet(), response.getWriter());

      return new Variant(WFRJson.createJsonArray(chatElement.getAssistantsIds().toString()));
    }
  }

  return new Variant(WFRJson.createJsonArray("[]"));
}
```

---

## Chat - Obter Lista de Usuários Online

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGetOnlineUserList` |
| **Código** | 920 |
| **Assinatura** | `Chat - Obter Lista de Usuários Online (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém a lista de usuários online.

Parâmetro:
Não possui.

Retorno:
Lista de lista de usuários. (Variante)

Observação:
A lista retornada contém as informações do usuário, como nome completo, id e última visualização.

### Código Servidor (Java)

```java
protected final Variant ebfChatGetOnlineUserList () throws Exception {
  return VariantPool.get(wfr.util.Functions.getChatOnlineUsers(client.getSystem()));
}
```

---

## Chat - Obter Lista de Usuários do Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGetGroupUsers` |
| **Código** | 986 |
| **Assinatura** | `Chat - Obter Lista de Usuários do Grupo (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a lista de usuários de um grupo (em cache).

Parâmetro(s):
1. Componente Chat. 
2. ID do Grupo. (Inteiro)

Retorno:
Lista contendo os IDs usuários no grupo. (Variante)

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o grupo não estiver na lista do chat especificado, a função retornará uma lista vazia.

### Código Cliente (JavaScript)

```javascript
function ebfChatGetGroupUsers(chat, groupId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup && chatGroup.data && chatGroup.data.users) return chatGroup.data.users;
    }

    return [];
}
```

---

## Chat - Obter Nome do Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGetGroupName` |
| **Código** | 987 |
| **Assinatura** | `Chat - Obter Nome do Grupo (Componente;Inteiro): Letras` |
| **Parâmetros** | Componente;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o nome de um grupo do chat (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Grupo. (Inteiro)

Retorno:
Nome do grupo. (Letras)

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o grupo não estiver na lista do chat especificado, a função retornará um texto vazio.
3. O resultado dessa função pode não refletir o nome do grupo em tempo real no banco de dados. Se o cache do chat estiver desatualizada, ele irá apresentar diferenças. Para isso é possível utilizar a função "Chat - Atualizar Componente" para atualizar a cache do chat.

### Código Cliente (JavaScript)

```javascript
function ebfChatGetGroupName(chat, groupId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup && chatGroup.data && chatGroup.data.name) return chatGroup.data.name;
    }

    return "";
}
```

---

## Chat - Obter Nome do Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGetUserName` |
| **Código** | 988 |
| **Assinatura** | `Chat - Obter Nome do Usuário (Componente;Inteiro): Letras` |
| **Parâmetros** | Componente;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o nome de um usuário do chat (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Usuário. (Inteiro)

Retorno:
Nome do usuário. (Letras)

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o usuário não estiver na lista do chat especificado, a função retornará um texto vazio.
3. O resultado dessa função pode não refletir o nome do usuário em tempo real no banco de dados. Se o cache do chat estiver desatualizada, ele irá apresentar diferenças. Para isso é possível utilizar a função "Chat - Atualizar Componente" para atualizar a cache do chat.

### Código Cliente (JavaScript)

```javascript
function ebfChatGetUserName(chat, userId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatUser = chatComponent.getUserById(userId);
        if (chatUser && chatUser.data && chatUser.data.name) return chatUser.data.name;
    }

    return "";
}
```

---

## Chat - Obter Total de Mensagens não Lidas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGetTotalUnreadMessages` |
| **Código** | 993 |
| **Assinatura** | `Chat - Obter Total de Mensagens não Lidas (Componente;Inteiro): Inteiro` |
| **Parâmetros** | Componente;Inteiro |
| **Retorno** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o total de mensagens não lidas (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Usuário. (Inteiro)

Retorno:
Total de mensagens não lidas entre o usuário logado e o usuário especificado no 2º parâmetro ou com o chat inteiro. (Inteiro)

Observações:
1. Essa função utiliza a cache do componente chat.
2. Se nenhum valor for especificado no 2º parâmetro, a função irá retornar o total de mensagens não lidas para o chat inteiro.
3. Quando o 2º parâmetro for especificado e o usuário não estiver na lista do chat, a função irá retornar 0.

### Código Cliente (JavaScript)

```javascript
function ebfChatGetTotalUnreadMessages(chat, userId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        if (userId === undefined || userId === null || userId === "") {
            var totalUnreadMessages = 0;

            if (chatComponent.cachedContainers && chatComponent.cachedContainers.length > 0) {
                for (var i = 0; i < chatComponent.cachedContainers.length; i++) {
                    var chatContainer = chatComponent.cachedContainers[i];

                    if (chatContainer && chatContainer.isUser() && !chatContainer.isSendToEveryone &&
                        chatContainer.unreadMessages !== undefined && chatContainer.unreadMessages !== null) {

                        totalUnreadMessages += chatContainer.unreadMessages;
                    }
                }
            }

            return totalUnreadMessages;
        } else {
            var chatUser = chatComponent.getUserById(userId);
            if (chatUser) return chatUser.unreadMessages;
        }
    }

    return 0;
}
```

---

## Chat - Remover Assistente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatRemoveAssistant` |
| **Código** | 1071 |
| **Assinatura** | `Chat - Remover Assistente (Formulário;Componente;Letras): Lógico` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função remove um assistente do componente de acordo o identificador único.

Parâmetros:
1. Formulário
2. Componente
3. Identificador único do assistente (Observação 1).

Retorno:
Valor lógico indicando se o assistente foi removido.

Observações:
1. Para obter o idientificar único do assistente utilize a função "Chat - Obter Identificardor dos Assistentes".
2. Após a utlização dessa função é recomendado utilizar a função "Chat - Atualizar Componente".

### Código Servidor (Java)

```java
protected final Variant ebfChatRemoveAssistant(Variant formGUID, Variant comp, Variant botId) throws Exception {
  WFRForm form = getSystem().getFormByGuid(formGUID.getString());
  if(form != null) {
    WFRComponent component = form.getComponentByName(comp.getString());
    if(component != null) {
      wfr.sys.HTMLInterface.HTMLChat chatElement = (wfr.sys.HTMLInterface.HTMLChat) wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(
          getData().getHtmlInterface(), getData(), component, getSystem(), fields.getResultSet(), response.getWriter());

      return new Variant(chatElement.removeAssistant(botId.getString()));
    }
  }

  return Variant.VARIANT_FALSE;
}
```

---

## Chat - Remover Usuários do Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatGroupRemoveUsers` |
| **Código** | 989 |
| **Assinatura** | `Chat - Remover Usuários do Grupo (Componente;Inteiro;Variante)` |
| **Parâmetros** | Componente;Inteiro;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Remove usuários de um grupo (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Grupo. (Inteiro)
3. Lista contendo os IDs dos Usuários. (Variante)

Retorno:
Não possui.

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o grupo não estiver na lista do chat especificado, a função não irá fazer nada.
3. Alterações em grupos só serão feitas se o chat estiver com a propriedade "Permitir Criação de Grupos" habilitada.
4. O usuário logado deve ser administrador do grupo especificado para poder adicionar/remover usuários.

### Código Cliente (JavaScript)

```javascript
function ebfChatGroupRemoveUsers(chat, groupId, users) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup) chatGroup.groupRemoveUsers(users);
    }
}
```

---

## Chat - Sair do Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatExitGroup` |
| **Código** | 990 |
| **Assinatura** | `Chat - Sair do Grupo (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Remove o usuário logado de um grupo ao qual ele faz parte (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Grupo. (Inteiro)

Retorno:
Não possui.

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o grupo não estiver na lista do chat especificado, a função não irá fazer nada.
3. Alterações em grupos só serão feitas se o chat estiver com a propriedade "Permitir Criação de Grupos" habilitada.

### Código Cliente (JavaScript)

```javascript
function ebfChatExitGroup(chat, groupId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup) chatGroup.groupExit();
    }
}
```

---

## Chat - Usuário está Online?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatIsUserOnline` |
| **Código** | 992 |
| **Assinatura** | `Chat - Usuário está Online? (Componente;Inteiro): Lógico` |
| **Parâmetros** | Componente;Inteiro |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se um usuário está online no chat (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Usuário. (Inteiro)

Retorno:
Valor lógico indicando se o usuário está online. (Lógico)

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o usuário não estiver na lista do chat especificado, a função irá retornar falso.

### Código Cliente (JavaScript)

```javascript
function ebfChatIsUserOnline(chat, userId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatUser = chatComponent.getUserById(userId);
        if (chatUser) return chatUser.isOnline();
    }

    return false;
}
```

---

## Chat - Usuário é Administrador do Grupo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatIsUserAdminOfGroup` |
| **Código** | 991 |
| **Assinatura** | `Chat - Usuário é Administrador do Grupo? (Componente;Inteiro;Inteiro): Lógico` |
| **Parâmetros** | Componente;Inteiro;Inteiro |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se um usuário é administrador de um grupo (em cache).

Parâmetro(s):
1. Componente Chat.
2. ID do Grupo. (Inteiro)
3. ID do Usuário. (Inteiro)

Retorno:
Valor lógico indicando se o usuário é administrador do grupo. (Lógico)

Observações:
1. Essa função utiliza a cache do componente chat. 
2. Se o grupo não estiver na lista do chat especificado, a função retornará falso.

### Código Cliente (JavaScript)

```javascript
function ebfChatIsUserAdminOfGroup(chat, groupId, userId) {
    var chatComponent = $c(chat);
    if (chatComponent) {
        var chatGroup = chatComponent.getGroupById(groupId);
        if (chatGroup) return chatGroup.groupIsUserAdmin(userId);
    }

    return false;
}
```

---

## Check - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCheckBoxNew` |
| **Código** | 271 |
| **Assinatura** | `Check - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo objeto CheckBox dinamicamente.

Parâmetro(s):
1. Aba (caso não seja definida, a aba não será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do Componente. (Inteiro)
5. Altura do Componente. (Inteiro)
6. Descrição do Componente. (Letras)
7. Valor do Componente. (Letras)
8. Valor Marcado. (Letras)
9. Valor Desmarcado. (Letras)
10. ID do Componente. (Letras)
11. Container. (Letras)
12. Estilo CSS. (Letras)
13. Classe CSS. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCheckBoxNew(aba, x,y,width,height,description,value,valueChecked,valueUnchecked, id, compContainer, styleCss, classCss){
    var code = getCodComponent();
    var component = new HTMLCheckbox(ebfGetSystemID(),ebfGetFormID(),code, x, y, width, height, description, value, valueChecked, valueUnchecked);  
  
    if(id){  
      component.id = id;
    }else{
      component.id = description;    
    }
    component.zindex = 3;
    component.loadComponentTime = 0;  
    component.styleCss = styleCss;  
    component.classCss = classCss;
    component.description = description ? description : "";  
  
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    if(compContainer){
      component.container = compContainer;   
      compContainer = document.getElementById(compContainer);    
      component.design(compContainer, true);
    }else{ 
       component.design(container.div, true);  
     }
    document['c_' + code] = component;  
    setOrderTabDynamically(component);
  }function ebfCheckBoxNew(aba, x,y,width,height,description,value,valueChecked,valueUnchecked, id, compContainer, styleCss, classCss){
    var code = getCodComponent();
    var component = new HTMLCheckbox(ebfGetSystemID(),ebfGetFormID(),code, x, y, width, height, description, value, valueChecked, valueUnchecked);  
  
    if(id){  
      component.id = id;
    }else{
      component.id = description;    
    }
    component.zindex = 3;
    component.loadComponentTime = 0;  
    component.styleCss = styleCss;  
    component.classCss = classCss;
    component.description = description ? description : "";  
  
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    if(compContainer){
      component.container = compContainer;   
      compContainer = document.getElementById(compContainer);    
      component.design(compContainer, true);
    }else{ 
       component.design(container.div, true);  
     }
    document['c_' + code] = component;  
    setOrderTabDynamically(component);
  }
```

---

## Componente Está Habilitado?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComponentIsEnabled` |
| **Código** | 420 |
| **Assinatura** | `Componente Está Habilitado? (Formulário, Componente) : Lógico` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se o componente esta habilitado ou desabilitado, retornando verdadeiro, caso o componente esteja habilitado e retorna retorna falso caso esteja desabilitado.

Parâmetro(s):
1. Formulário que contém o componente.
2. Componente a ser verificado.

Retorno:
Valor indicando se o componente está habilitado. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfComponentIsEnabled(formGUID, componentName) {
  return $c(componentName, formGUID).getEnabled();
}
```

---

## Container - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfContainerNew` |
| **Código** | 955 |
| **Assinatura** | `Container - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Container dinamicamente.

Parâmetro(s):
1. Aba (caso não seja definida, a aba será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do componente. (Inteiro)
5. Altura do componente. (Inteiro)
6. Descrição do componente. (Letras)
7. Nome do componente. (Letras)
8. Estilo CSS. (Letras)

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfContainerNew(aba, posX, posY, width, height, description, value, styleCss){
  var code = getCodComponent();
  var component = new HTMLContainer(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, description, value);
  component.id = value;    
  component.loadComponentTime = 0;
  component.styleCss = styleCss;
  var container = $mainform().d.t.getTabByName(aba);
  if(!container){
     d.t.add(aba);
     container = $mainform().d.t.getTabByName(aba);
  } 
  component.design(container.div, true);
  document['c_' + code] = component;
}
```

---

## Definir Propriedade do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetComponentProperty` |
| **Código** | 740 |
| **Assinatura** | `Definir Propriedade do Componente (Formulário;Componente;Letras;Variante)` |
| **Parâmetros** | Formulário;Componente;Letras;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Define uma propriedade para o componente passado por parâmetro.

Parâmetro(s):
1. Formulário. (Opcional)
2. Componente.
3. Propriedade. (Letras)
4. Valor. (Variante)

Retorno: 
Não possui.

Observação:
Na camada servidor, caso o formulário não seja informado, a função adotará o formulário corrente. Na camada cliente,
sempre será o formulário corrente.

Exemplo:
Assumindo como componente "MakerEdit2", propriedade "AoPesquisar" e valor "Sim", será criada uma propriedade de nome e valor
definido no parâmetro.

### Código Servidor (Java)

```java
protected Variant ebfSetComponentProperty(Variant formGuid, Variant compName, Variant propertyName, Variant value)throws Exception {    
  WFRForm form = null;    
  if (formGuid == Variant.VARIANT_NULL)
    form =  getData().getSystem().getForm(Functions.fromISOtoBASE(request.getParameter("formID")), connection);
  else
    form =  getSystem().getFormByGuid(formGuid.getString());

  ebfSetSessionAttribute(new Variant(fields.getForm().getGuid() + "_" + compName.getString() + "_" + propertyName.getString()), new Variant(value.getObject()), Variant.VARIANT_FALSE);

  Variant properties = ebfGetSessionAttribute(new Variant(form + "_componente_propriedade"), new Variant(false));

  if(properties.getObject() == Variant.VARIANT_NULL || properties.getObject() == null) {
    ebfSetSessionAttribute(new Variant(form + "_componente_propriedade"), new Variant(ebfListParamsCreate(new Variant(new Variant(fields.getForm().getGuid() + "_" + compName.getString() + "_" + propertyName.getString())))), new Variant(false));
  }else {
    List listProperties = (List) properties.getObject();
    listProperties.add(fields.getForm().getGuid() + "_" + compName.getString() + "_" + propertyName.getString());
    ebfSetSessionAttribute(new Variant(form + "_componente_propriedade"), new Variant(listProperties), new Variant(false));
  }

  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfSetComponentProperty() {
  if (existArgs(arguments)) {  
    var comp = $c(arguments[1]);      
    if(comp){
      comp[arguments[2]] = arguments[3];    
    }
  }
  return null;
}
```

---

## Destruir Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDestroyComponent` |
| **Código** | 522 |
| **Assinatura** | `Destruir Componente (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função destrói o componente retirando o mesmo da memória.

Parâmetro: 
1. Nome do Componente. (Ver observação 2)

Retorno:
Não possui.

Observações:
1. O componente destruído não mais poderá ser referenciado.
2. Deve ser definido o formulário de trabalho no parâmetro de entrada, ou informar o nome do componente numa constante do tipo letras.

### Código Cliente (JavaScript)

```javascript
function ebfDestroyComponent(componente) {
  var c = $c(componente);
  if (c && !(c instanceof HTMLMakerFlowComponent)) {
    var cdiv = c.div;
    if (cdiv.parentNode) {
       cdiv.parentNode.removeChild(cdiv);
       if (c instanceof HTMLTreeview) {
         try {
           c.removeAllChilds();           
         } catch(e){}
       }

       $controller().remove(c);
    }
  } else if (c) {
    c.free();
  }
}
```

---

## Executar Ação Pré Definida

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfActionExecute` |
| **Código** | 918 |
| **Assinatura** | `Executar Ação Pré Definida (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função executa uma ação predefinida.

Parâmetro:
1. Ação Predefinida. (Letras) (Ver observação 1)

Retorno:
Não possui.

Observação:
O tipo da ação predefinida de ser uma das listadas a seguir:
"Grupos" - Abrir formulário de Cadastro de Grupos;
"Usuarios" - Abrir formulário de Cadastro de Usuário;
"LOG" - Abrir formulário de LOG;
"AlterarSenha" - Abrir formulário de Alteração de Senha;
"ExecutarScriptSQL" - Abrir formulário de Executar Script SQL;
" RecarregarSistema" - Recarregar sistema atual;
"AlterarUsuario" - Realizar logoff do usuário atual para login com outro usuário;
"Sair" - Logoff do sistema;
"ModoNormal" - Ir para modo Normal;
"ModoGerente" - Ir para modo Gerente;
"ModoProjeto" - Ir para modo Projeto;
"ConfigurarConexoesAdicionais" - Abrir formulário de Conexões Adicionais;
"Incluir" - Entra em modo de inserção no formulário corrente;
"Alterar" - Entra em modo de alteração no formulário corrente;
"Excluir" -Exclui o registro corrente;
"Gravar" - Grava o registro corrente; 
"GravarMais" - Grava mais de um registro simultaneamente;
"PrimeiroReg" - Vai para o primeiro registro do formulário corrente;
"AnteriorReg" - Vai para o registro anterior do formulário corrente;
"ProximoReg" - Vai para o próximo registro do formulário corrente;
"UltimoReg" - Vai para o último registro do formulário corrente;
"Cancelar" - Cancela as alterações efetuadas no formulário corrente;

### Código Cliente (JavaScript)

```javascript
function ebfActionExecute(action) {
  switch (action.trim().toLowerCase()) {
    // Ações do Formulário
    case "incluir": { ebfFormInsertMode(); break; }
    case "alterar": { ebfFormEditMode(); break; }
    case "excluir": { ebfNavDeleteCurrentRecord(); break; }
    case "gravar": { ebfNavEditSaveRecord(); break; }
    case "gravarmais": { ebfNavIncludeMoreSaveRecord(); break; }
    case "primeiroreg": { ebfNavFirstRecord(); break; }
    case "anteriorreg": { ebfNavPreviousRecord(); break; }
    case "proximoreg": { ebfNavNextRecord(); break; }
    case "ultimoreg": { ebfNavLastRecord(); break; }
    case "cancelar": {
      if (ebfFormIsInEditMode()) ebfNavEditCancel();
      else if (ebfFormIsInInsertMode()) ebfNavIncludeCancel();
      break;
    }

    // Ações Pre-Definidas
    case "grupos": { IframeTransporter("executeFunction.do?action=executeFunction&sys=" + ebfGetFullSystemID() + "&function=ebfFormOpenFormGroup"); break; } // Abrir Formulário de Cadastro de Grupos
    case "usuarios": { IframeTransporter("executeFunction.do?action=executeFunction&sys=" + ebfGetFullSystemID() + "&function=ebfFormOpenFormUser"); break; } // Abrir Formulário de Cadastro de Usuário
    case "log": { openFormLog(ebfGetFullSystemID(), '', 'Log', '', 2); break; }
    case "alterarsenha": { IframeTransporter("executeFunction.do?action=executeFunction&sys=" + ebfGetFullSystemID() + "&function=ebfFormOpenFormPassword"); break; } // Abrir Formulário de Alteração de Senha
    case "executarscriptsql": { openWFRSQLScriptExecute(ebfGetFullSystemID()); break; }
    case "recarregarsistema": { shortcutReloadSystem(ebfGetFullSystemID()); break; }
    case "alterarusuario": { ebfSystemChangeUser(); break; }
    case "sair": { ebfSystemExit(); break; }
    case "modonormal": { ebfMenuChangeMode('n'); break; }
    case "modogerente": { ebfMenuChangeMode('p'); break; }
    case "modoprojeto": { ebfMenuChangeMode('d'); break; }
    case "configurarconexoesadicionais": { openWFRConfigureSubconnections(ebfGetFullSystemID()); break; }
  }
}
```

---

## Existe Componente?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComponentExists` |
| **Código** | 403 |
| **Assinatura** | `Existe Componente?(Lógico);` |
| **Parâmetros** | Componente |
| **Retorno** | Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe o nome de um componente e retorna verdadeiro ou falso caso o mesmo exista no formulário onde o fluxo foi chamado.

Parâmetro:
1. Nome do Componente. (Ver observação 1)

Retorno:
Valor indicando se o componente existe. (Lógico)

Observação:
Deve ser definido o formulário de trabalho no parâmetro de entrada, ou informar o nome do componente numa constante do tipo letras.

### Código Cliente (JavaScript)

```javascript
function ebfComponentExists(componentName) {
  if($c(componentName))
    return true;
  else
    return false;   
}
```

---

## Galeria de Imagens - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfImageGalleryNew` |
| **Código** | 923 |
| **Assinatura** | `Galeria de Imagens - Novo (Componente;SQL Consulta;Letras;Letras;Letras;Variante)` |
| **Parâmetros** | Componente;SQL Consulta;Letras;Letras;Letras;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função cria um componente Galeria de Imagens dinamicamente.

Parâmetro(s):
1. Nome do Componente.
2. Consulta SQL.
3. Campo ID. (Letras)
4. Campo Miniatura. (Letras)
5. Campo Imagem. (Letras)
6. JSON Propriedades. (Variante)

Retorno:
Não possui.

Observação:
O JSON de propriedades deve seguir o modelo abaixo:
{
  "Fonte de dados": "",
  "Barra de Rolagem":"",
  "Altura Miniatura":"",
  "Tamanho Miniatura":"",
  "Permitir Upload":"",
  "Permitir Exclusão":"",
  "Expandir ao Clicar":"",
  "Aba":"",
  "Posição X":"",
  "Posição Y":"",
  "Altura":"",
  "Tamanho":"",
  "Habilitado":"",
  "Visível":""
}

### Código Servidor (Java)

```java
protected final Variant ebfImageGalleryNew (Variant name, String SQL, int paramsQtt, Variant... variants) throws Exception {
  String tab="", posX="", posY="", height="", width="", visible="", enable="", hiddenProperties;

  hiddenProperties = "consultaSQL;campoID;campoMiniatura;campoImagem";
  SQL = ebfGetSQLParametersEditor(SQL, paramsQtt, variants).getString();

  wfr.util.SQLFormatter sqlf = new wfr.util.SQLFormatter();
  String sSQL = sqlf.format(SQL).toString();

  String fID     = variants[0 + paramsQtt].getString();
  String fmin    = variants[1 + paramsQtt].getString();
  String fImage  = variants[2 + paramsQtt].getString();
  jakarta.json.JsonObject jsonProperties = (jakarta.json.JsonObject) variants[3 + paramsQtt].getObject();

  int idx = 0;

  List<String> properties = new ArrayList<String>();
  properties.add("FonteDeDados");
  properties.add("BarraRolagem");
  properties.add("AlturaMiniatura");
  properties.add("TamanhoMiniatura");
  properties.add("PermitirUpload");
  properties.add("PermitirExclusao");
  properties.add("ExpandirAoClicar");

  WebrunProperties webrunProperties = new WebrunProperties();
  webrunProperties.put("consultaSQL", SQL);
  webrunProperties.put("campoID", fID);
  webrunProperties.put("campoMiniatura", fmin);
  webrunProperties.put("campoImagem", fImage);

  java.util.Set keys = jsonProperties.keySet();

  for (Object key : keys) {
    switch (key.toString()) {
    case "Visível":
      visible = jsonProperties.getString(key.toString());
      break;
    case "Habilitado":
      enable = jsonProperties.getString(key.toString());
      break;
    case "Aba":
      tab = jsonProperties.getString(key.toString());
      break;
    case "Posição X":
      posX = jsonProperties.getString(key.toString());
      break;
    case "Posição Y":
      posY = jsonProperties.getString(key.toString());
      break;
    case "Altura":
      height = jsonProperties.getString(key.toString());
      break;
    case "Tamanho":
      width = jsonProperties.getString(key.toString());
      break;
    default:
      webrunProperties.put(properties.get(idx), jsonProperties.getString(key.toString()));
      idx++;
      break;
    }
  }

  HashMap<wfr.sys.HTMLInterface.ComponentProperty, String> componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>();
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ABA, tab);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_X, posX);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_Y, posY);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME, name.getString());
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TABULAR, "false");
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ALTURA, height);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TAMANHO, width);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.VISIVEL, visible);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HABILITADO, enable);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.HIDDENPROPERTIES, hiddenProperties);
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CLASSE_COMPONENTE, "Galeria de Imagens");

  WFRComponent com = new WFRComponent(fields.getForm(), 'W', componentProperties, webrunProperties);
  fields.getForm().addComponent(com, componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.ABA));
  wfr.sys.HTMLInterface.HTMLElement elem = wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(getData().getHtmlInterface(), getData(), com, getSystem(), fields.getResultSet(), response.getWriter());

  boolean isOpenAndCloseTagScript = !(request.getHeader("Accept").indexOf("application/javascript") > -1);
  if(isOpenAndCloseTagScript)
    response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getOpenTagScript());

  response.getWriter().println("var d = $mainform().d; var HTMLImageGallery = $mainform().HTMLImageGallery;");
  elem.designJs(true, true);
  response.getWriter().println("d.c_" + com.getCode() + ".design(d.t.getDiv('" + tab + "'), true)");
  response.getWriter().println("d.c_" + com.getCode() + ".onFormLoadAction();");
  response.getWriter().println("typeof window['setOrderTabDynamically'] !== 'undefined' ? setOrderTabDynamically(d.c_" + com.getCode() +") : parent.setOrderTabDynamically(d.c_" + com.getCode() +");");
  if(isOpenAndCloseTagScript)
    response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getCloseTagScript());

  return Variant.VARIANT_NULL;
}
```

---

## Imagem - Alterar URL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfImageSetURL` |
| **Código** | 230 |
| **Assinatura** | `Imagem - Alterar URL (Formulário, Componente, Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera a URL de um componente imagem.

Parâmetro(s):
1. Formulário que contém o componente imagem.
2. Nome do componente.
3. URL da imagem. (Letras)

Retorno:
Não possui.

Observações:
1. A função não permitirá a utilização de imagens que não se encontram nas pastas ?Upload? ou ?TMP?. Desta forma, caso exista alguma regra que altere a URL de um componente Imagem e o caminho da URL aponte para uma pasta diferente de ?Upload? ou ?tmp?, o funcionamento será incorreto.
2. Caso a imagem possua uma URL, as características do componente serão mantidas.
3. Caso a imagem inicial esteja definida como Centralizada, ao alterar a URL a mesma continuará assim.
4. Caso seja uma imagem do banco de dados, uma impressão digital ou a imagem esteja como estendida, ela sempre aparecerá nas dimensões do componente.

### Código Servidor (Java)

```java
protected final Variant ebfImageSetURL(Variant formGUID, Variant componentName, Variant url) throws Exception {
    return callClientFunction("ebfImageSetURL", formGUID, componentName, url);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfImageSetURL(formGUID, componentName, url) {
  var component = $c(componentName, formGUID);
  component.url = url;

  if (component.type == 1 || component.type == 2 || (component.getViewMode() == "stretch")) {
    // Define o tipo temporariamente para -1 para a imagem poder ser alterada via refresh
    component.type = -1;
    
    component.refresh(true);

    // Define o tipo para URL
    component.type = 3;
  } else {
    component.context.style.backgroundImage = ("url(" + url + ")");
  }
}
```

---

## Imagem - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNewImage` |
| **Código** | 521 |
| **Assinatura** | `Imagem - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Inteiro;Letras;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Inteiro;Letras;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Imagem dinamicamente.

Parâmetro(s):
1. Aba (caso não seja definida, a aba não será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do componente. (Inteiro)
5. Altura do componente. (Inteiro)
6. Descrição do componente. (Letras)
7. URL relativa da imagem desejada. (Letras) (Ver observação)
8. Tipo - Tipo  = 1 (Upload) /Tipo  = 2 (Digital Capture) /Tipo  = 3 (URL). (Inteiro)
9. Nome do componente. (Letras)
10. Dica do Componente. (Letras)
11. Container. (Letras)
12. Estilo CSS. (Letras)
13. Classe CSS. (Letras)

Retorno: 
Não possui.

Observação:
No 7º deve ser utilizada URL do tipo (Skins/Default/background.jpg).

### Código Cliente (JavaScript)

```javascript
function ebfNewImage(aba, posX, posY, width, height, description, value, type, id, hint, compContainer, styleCss, classCss){
    var code = getCodComponent();
    var component = new HTMLImage(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, description, value, type,false);    
    component.hasImage = true;
    component.viewMode = 'Estender';
    component.zoomWidth = 0;
    component.zoomHeight = 0;
    //d.c_260.md5 = '';
    component.id = id;
    //component.type = type;  
    component.exhibitionType = 2;   
    component.loadComponentTime = 0;
    component.styleCss = styleCss;  
    component.classCss = classCss;
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    if(compContainer){
      component.container = compContainer; 
      compContainer = document.getElementById(compContainer);
      component.design(compContainer, true);
    }else{ 
      component.design(container.div, true);  
    }
    component.setHint(hint);
    document['c_' + code] = component;
  }
```

---

## Inserir Texto na Posição do Cursor no Texto Rico

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRichTextInsertTextAtPosition` |
| **Código** | 940 |
| **Assinatura** | `Inserir Texto na Posição do Cursor no Texto Rico (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Insere um texto na posição do cursor em um Texto Rico.

Parâmetro(s):
1. Componente Texto Rico.
2. Texto em HTML a ser inserido. (Letras)

Retorno:
Não possui.

Observações:
1. Esta função só funciona para o memo quando a propriedade texto rico está setada como 
"HTML Básico" e "HTML Avançado".
2. Para utilizar esta função no Internet Explorer, deve-se previamente utilizar a função "Monitorar posição do cursor no Texto Rico".

### Código Cliente (JavaScript)

```javascript
function ebfRichTextInsertTextAtPosition(component, htmlText) {
  var comp = $c(component);
  if (comp) comp.insertHtmlAtCaret(htmlText);
}
```

---

## Inserir texto na posição do cursor no Memo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `freTextAreaInsertTextoAtCursor` |
| **Código** | 393 |
| **Assinatura** | `Inserir texto na posição do cursor no Memo(componente, texto)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Insere o texto na posição atual do cursor dentro de um campo do tipo Memo.

Parâmetro(s):
1. Componente. 
2. Texto desejado. (Letras)

Retorno:
Não possui.

Observações:
1. Esta função insere apenas o texto na posição do cursor em um componente Memo.
2. Esta função só funciona para o memo quando a propriedade texto rico está setada como "Texto".
3. Para utilizar esta função, deve-se criar um novo processamento e utilizar previamente a função "Monitorar posição do cursor no Memo".

### Código Cliente (JavaScript)

```javascript
function freTextAreaInsertTextoAtCursor() { 
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    var stringToInsert = arguments[1];
    if (component) {
      var cPos = component.input.__cursorPos;
      var sText = component.input.value;
      var firstPart = sText;
      var secondPart = "";
      if(cPos){
        firstPart = sText.substring(0, cPos);
        secondPart = sText.substring(cPos, sText.length);
      }
      component.setValue(firstPart + stringToInsert + secondPart);
    }
    else {
      handleException(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", arguments[0]));
    }
  }
}
```

---

## Integração - Obter Elemento pelo ID

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIntegracaoGetElementById` |
| **Código** | 954 |
| **Assinatura** | `Integração - Obter Elemento pelo ID (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém um elemento da estrutura HTML de um componente Integração através do seu ID.

Parâmetro(s):
1. Componente Integração. 
2. ID do elemento. (Letras)

Retorno:
Retorna a referência do elemento. (Variante)

Observações:
1. Caso não exista elemento com o ID especificado, o retorno será nulo.
2. No primeiro parâmetro também pode ser passado o nome do componente em uma variável do tipo Letras.

### Código Cliente (JavaScript)

```javascript
function ebfIntegracaoGetElementById(comp, id) {
  var component = $c(comp);
  if (component) return component.getElementById(id);
  else handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', comp));  
}
```

---

## Lista - Adicionar Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComboPut` |
| **Código** | 166 |
| **Assinatura** | `Lista - Adicionar Elemento (Componente;Letras;Letras): Variante` |
| **Parâmetros** | Componente;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | * |

### Descrição

Essa função insere um elemento no componente Lista. Passando como parâmetro o componente Lista, o valor chave (que será o valor à ser salvo no banco) e o valor que representará o valor chave.

Parâmetro(s):
1. Nome do componente Lista.
2. Valor Chave. (Letras)
3. Valor que representará a chave. (Letras)

Retorno: 
O retorno somente para a camada Servidor, será o valor inserido no componente Lista. (variante)

Observação:
O campo chave deve obrigatoriamente ser do tipo Letras. Caso contrário, a lista não irá exibir os valores.

Exemplo: 
Assumindo o 1º parâmetro: Carros (Lista) contendo os elementos 1 - Usado e 2 - Novo, sendo 1 e 2 o valor chave e  "Usado e Novo" o valor que representam o valor chave. O 2º parâmetro sendo 3 e o 3º parâmetro sendo "Quebrado". O retorno será a lista Carros contendo os elementos 1 - Usado, 2 - Novo e 3 - Quebrado.

### Código Servidor (Java)

```java
protected final Variant ebfComboPut(Variant combo, Variant key, Variant value) throws Exception {
    client.executeJavascript("$mainform().ebfComboPut('" + Functions.stringToJs(combo.getString()) + "', " + key.toJS() + ", " + value.toJS() + ")");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfComboPut(obj, key, value) {
  obj = controller.verifyComponent(obj);
  if (obj && obj.add) {
    obj.add(key, value);
  }
}
```

---

## Lista - Limpar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComboClean` |
| **Código** | 165 |
| **Assinatura** | `Combo - Limpar (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | * |

### Descrição

Essa função remove todos os elementos do componente Lista. Passando como parâmetro o componente Lista.

Parâmetro:
1. Nome do componente Lista.

Retorno: 
O retorno será os elementos da Lista apagadas. (Variante)

Exemplo: 
Assumindo o 1º parâmetro: Carros (Lista) contendo os elementos 1 - Usado e 2 - Novo, sendo 1 e 2 o valor chave e  "Usado e Novo" o valor que representam o valor chave. O retorno será a lista Carros com os elementos removidos.

### Código Servidor (Java)

```java
protected final Variant ebfComboClean(Variant combo) throws Exception {
    client.executeJavascript("$mainform().ebfComboClean('" + Functions.stringToJs(combo.getString()) + "')");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfComboClean(obj) {
  obj = controller.verifyComponent(obj);
  if (obj && obj.clean) {
    obj.clean();
  }
}
```

---

## Lista - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComboBoxNew` |
| **Código** | 475 |
| **Assinatura** | `Lista - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Variante;Variante;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Variante;Variante;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Cria um novo componente Lista de forma dinâmica.

Parâmetro(s):
1. Aba (Caso não seja definida, a aba será criada). (Letras)
2. Posição X no formulário. (Inteiro)
3. Posição Y no formulário. (Inteiro)
4. Largura do componente. (Inteiro)
5. Altura do componente. (Inteiro)
6. Descrição do Componente. (Letras)
7. Lista de valores. (Campo Chave). (Variante)
8. Lista de descrições a serem exibidas. (Campo Lista). (Variante)
9. ID do Componente. (Letras)
10. Container. (Letras)
11. Estilo CSS. (Letras)
12. Classe CSS. (Letras)

Retorno:
Não Possui.

Observação:
As listas podem conter um ou mais elementos, e irão se referenciar uma com a outra de acordo com a posição delas na lista.

### Código Cliente (JavaScript)

```javascript
function ebfComboBoxNew(aba, x, y, width, height, description, keys, values,id, compContainer, styleCss, classCss){
    var code = getCodComponent();
    var component = new HTMLComboBox(ebfGetSystemID(),ebfGetFormID(),code, x, y, width, height, description);
    if (!isNullable(keys) && !isNullable(values)) {
      if (keys instanceof Array && values instanceof Array) {
        component.values = values;
        component.keys = keys;
      } else {
        component.values = [values];
        component.keys = [keys];
      }
    } else {
      component.values = [];
      component.keys = [];
    }  
    component.id = id;
    component.zindex = 3;
    component.loadComponentTime = 0;  
    component.styleCss = styleCss;  
    component.classCss = classCss;
    component.isLegacy = mainform.isLegacyList ? mainform.isLegacyList : false;
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    if(compContainer){
      component.container = compContainer;   
      compContainer = document.getElementById(compContainer);    
      component.design(compContainer, true);
    }else{ 
       component.design(container.div, true);  
     }
    document['c_' + code] = component;  
    setOrderTabDynamically(component);
  }
```

---

## Lista - Remover Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComboRemoveByKey` |
| **Código** | 758 |
| **Assinatura** | `Lista - Remover Elemento (Formulário;Componente;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Função que remove um item do componente Lista tomando a chave como referência.

Parâmetro(s):
1. Formulário.
2. Nome do Componente.
3. Chave. (Letras)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfComboRemoveByKey(Variant form, Variant combo, Variant key) throws Exception {
    callClientFunction("ebfComboRemoveByKey", form, combo, key);
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfComboRemoveByKey(form, obj, key) {
  obj = controller.verifyComponent(obj);
  if (obj && obj.removeByKey) {
    obj.removeByKey(key);
  }
}
```

---

## Lista Dinâmica - Definir Tipo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDynamicListDefineAllFilterType` |
| **Código** | 411 |
| **Assinatura** | `Lista Dinâmica - Definir Tipo (Inteiro)` |
| **Parâmetros** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Define o tipo de filtro que deve ser executado para todas as Listas Dinâmicas do formulário.

Parâmetro(s):
1. Tipo de filtro:
1- Igual, 2- Contendo, 3- Iniciando com, 4- Terminando com.

Retorno:
Não Possui.

Observação:
Definir o fluxo ao entrar no formulário ou na lista dinâmica.

### Código Servidor (Java)

```java
protected final Variant ebfDynamicListDefineAllFilterType(Variant type) throws Exception {
    return callClientFunction("ebfDynamicListDefineAllFilterType", type);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDynamicListDefineAllFilterType(type) {
  var initialType = 3;
  try {
    initialType = parseInt(type);
    if (!(/[1-4]/.test(initialType))) {
      initialType = 3;
    }
  } catch (e) { /*do nothing*/ }

  var elems = $mainform().controller.elems;
  for (var i = 0; i < elems.length; i++) {
    var elem = elems[i];
    if (elem instanceof HTMLLookup) {
      elem.initialType = initialType;
    }
  }
}
```

---

## Lista Dinâmica - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateLookup` |
| **Código** | 712 |
| **Assinatura** | `Lista Dinâmica - Novo (Letras;Inteiro;Inteiro;Letras;SQL Consulta;Variante;Variante;Variante;Variante;Variante;Variante)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Letras;SQL Consulta;Variante;Variante;Variante;Variante;Variante;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um novo componente Lista Dinâmica.

Parâmetro(s):
1. Aba. (Caso não seja informada o componente não será criado). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Descrição do Componente. (Letras)
5. Consulta SQL. (Constante SQL Consulta)
6. Campo Chave. (Variante)
7. Campo Lista. (Variante)
8. ID do Componente. (Variante)
9. Estilo CSS. (Variante)
10. Classe CSS. (Variante)
11. Mapa com parâmetros extras. (Variante, Opcional)

Retorno:
Não Possui.

Observações:
1. O mapa de parâmetros extras (parâmetro 9) aceita as seguintes chaves:
ALTURA, APENAS_LEITURA, BUSCA_INCREMENTAL, CHAMA_SUB_FORM, CODIGO_FORM,
DICA, HABILITADO, PAGINACAO, PLACE_HOLDER, TAMANHO, TIPO_FILTRO_INICIAL, VISIVEL (Letras).
COR (Cor).
2. Caso a altura não seja informada, o componente assumirá como padrão 21px. Caso a largura não seja informada, o componente assumirá como padrão 121px.
3. Não será possível realizar filtros por constantes ou funções pré-definidas.

### Código Servidor (Java)

```java
protected final Variant ebfCreateLookup(Variant tabName,  Variant posX,  Variant posY,  Variant description,  Variant SQL, Variant... variants) throws Exception{
    return ebfCreateLookup(tabName, posX, posY, description, SQL.getString(), 0, variants);  
  }

  protected final Variant ebfCreateLookup(Variant tabName, Variant posX, Variant posY, Variant description, String SQL, int paramsQtt, Variant... variants) throws Exception {
    if(variants != null && variants.length > 0){
      java.util.regex.Pattern interrogacao = java.util.regex.Pattern.compile("((¿)|(\\?))(?=(?:[^']|'[^']*')*$)");
      java.util.regex.Matcher matcher = interrogacao.matcher(SQL);
      StringBuffer bSQL = new StringBuffer();
      for(int i = 0; i < paramsQtt && matcher.find(); i++){
        if(variants[i].getType() == WFRRuleType.STRING || 
            variants[i].getType() == WFRRuleType.DATE || 
            variants[i].getType() == WFRRuleType.BOOLEAN){
          matcher.appendReplacement(bSQL, "'"+variants[i].toString()+"'");
        }else{
          matcher.appendReplacement(bSQL, variants[i].toString());
        }
      }
      matcher.appendTail(bSQL);
      SQL = bSQL.toString();
      }
    
    
    Variant properties = null;
    Variant classCss   = null;
    Variant styleCss   = null;
    Variant identifier = null;
    Variant valueField = null;
    Variant keyField   = null;
    
    if (variants.length > 4) {
        properties = variants[variants.length - 1];
        classCss = variants[variants.length - 2];
        styleCss = variants[variants.length - 3];
        identifier = variants[variants.length - 4];
        valueField = variants[variants.length - 5];
        keyField = variants[variants.length - 6];
      }else {
        properties = variants[variants.length - 1];
        identifier = variants[variants.length - 2];
        valueField = variants[variants.length - 3];
        keyField   = variants[variants.length - 4];
      }
    
    
    Map<wfr.sys.HTMLInterface.ComponentProperty, String> componentProperties;
    if(!(tabName.getString().equals(""))){
      if(properties.getObject() == null){
        componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>();
      }else{
        Map<String, String> propertiesMap = (Map<String, String>) properties.getObject();  
        componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>(propertiesMap.size());
        for (Map.Entry<String, String> property : propertiesMap.entrySet()) {
          componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.valueOf(property.getKey()), property.getValue());
        }
      }
      
      wfr.util.SQLFormatter sqlf = new wfr.util.SQLFormatter();         
      SQL = sqlf.format(SQL).toString();

      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ABA, tabName.getString());
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_X, posX.getString());
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.POSICAO_Y, posY.getString());
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.DESCRICAO, description.getString());
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.SQL, SQL);
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CAMPO_CHAVE, keyField.getString());
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CAMPO_LISTA, valueField.getString());
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME, identifier.getString());

      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ESTILO, "0");
      componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TABULAR, "true"); 
      
      if (classCss != null) {
          componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME_CLASSE_CSS, classCss.getString()); 
          }
      
      if (styleCss != null) {
         componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ESTILO_CSS, styleCss.getString());
			}

      if (componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.ALTURA) == null) {
          componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.ALTURA, "35");
      }  
      if (componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.TAMANHO) == null) {
          componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.TAMANHO, "124");
      }       
    
      WFRComponent com = new WFRComponent(fields.getForm(), componentProperties, 'K');
      fields.getForm().addComponent(com, componentProperties.get(wfr.sys.HTMLInterface.ComponentProperty.ABA));
      wfr.sys.HTMLInterface.HTMLElement elem = wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(getData().getHtmlInterface(), getData(), com, getSystem(), fields.getResultSet(), response.getWriter());
    
      String requestAcceptHeader = request.getHeader("Accept");
      if(requestAcceptHeader.indexOf("application/javascript") == 0) {
          elem.designJs(true, true); 
          response.getWriter().println("d.c_"+com.getCode()+".design(d.t.getDiv('"+tabName.getString()+"'), true)");
          response.getWriter().println("typeof window['setOrderTabDynamically'] !== 'undefined' ? setOrderTabDynamically(d.c_"+com.getCode()+") : parent.setOrderTabDynamically(d.c_"+com.getCode()+");");           
      }else{
          response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getOpenTagScript());
          response.getWriter().println("var d = $mainform().d; var HTMLLookup = $mainform().HTMLLookup;");
          elem.designJs(true, true);
          response.getWriter().println("d.c_"+com.getCode()+".design(d.t.getDiv('"+tabName.getString()+"'), true)");           
          response.getWriter().println("typeof window['setOrderTabDynamically'] !== 'undefined' ? setOrderTabDynamically(d.c_"+com.getCode()+") : parent.setOrderTabDynamically(d.c_"+com.getCode()+");");
          response.getWriter().println(wfr.sys.HTMLInterface.HTMLInterface.getInstance(request).getCloseTagScript());
          
      }
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Lista Dupla - Adicionar Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDualListPut` |
| **Código** | 736 |
| **Assinatura** | `Lista Dupla - Adicionar Elemento (Componente;Letras;Letras)` |
| **Parâmetros** | Componente;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função adiciona um elemento em tela no componente Lista Dupla de acordo os valores passados nos parâmetros.

Parâmetro(s):
1. Componente Lista Dupla.
2. Valor Chave. (Letras)
3. Valor que representará a chave. (Letras)

Retorno: 
Não possui.

Observação:
O valor adicionado ao componente, não será armazenado no banco de dados, caso o mesmo esteja vinculado a campo.

Exemplo:
Assumindo como 1º parâmetro um componente Lista Dupla com os valores na lista principal:
 1 - Pedra
 2 - Papel
ao passar o valor "3" no 2º parâmetro e "Tesoura" no 3º parâmetro o resultado será uma Lista Dupla com os valores 
1 - Pedra
2 - Papel
3 - Tesoura.

### Código Cliente (JavaScript)

```javascript
function ebfDualListPut(obj, value, label) {
  obj = controller.verifyComponent(obj);  
  
  if (obj && obj.addItem) {
    obj.addItem(obj.leftSelect, value, label);
  }  
}
```

---

## Lista Dupla - Limpar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDualListClean` |
| **Código** | 735 |
| **Assinatura** | `Lista Dupla - Limpar (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função remove todos os elementos em tela do componente Lista Dupla passado por parâmetro. 

Parâmetro:
1. Componente Lista Dupla.

Retorno: 
Não possui.

Observação:
Essa função não remove os registros armazenados no banco de dados.

### Código Cliente (JavaScript)

```javascript
function ebfDualListClean(obj) {
  obj = controller.verifyComponent(obj);
  if (obj && obj.deleteOption) {  
    var index = 0;
    var objSelect = obj.leftSelect;  
    while (objSelect.options.length) {
      obj.deleteOption(objSelect, index);
    }    
    var objSelect = obj.rightSelect;  
    while (objSelect.options.length) {
      obj.deleteOption(objSelect, index);
    }
  }  
}
```

---

## Lista Dupla - Obter Chaves da Lista Principal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetDualListLeftValue` |
| **Código** | 358 |
| **Assinatura** | `Lista Dupla - Chaves dos ítens da lista principal(Componente)` |
| **Parâmetros** | Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna uma lista com os valores dos campos chaves dos itens da lista principal do componente lista dupla.

Parâmetro: 
1. Componente Lista Dupla.

Retorno: 
Retorna uma Lista que deve ser atribuída a uma variável. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetDualListLeftValue(component) {
	var selectIN = $c(component).leftSelect;
	if(selectIN) {
		var arrElements = new Array();

		if (selectIN.options.length > 0) {
			for (var i = 0; i < selectIN.options.length; i++) {
				var text = selectIN.options[i].value;
				
				arrElements.push(text);
			}
		}
		
	} else
		throw "O componente não é Lista Dupla";
	
	
	return arrElements;
}
```

---

## Lista Dupla - Obter Chaves da Lista Selecionados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetDualListRightValue` |
| **Código** | 360 |
| **Assinatura** | `Lista Dupla - Obter chaves da lista selecionados(Componente)` |
| **Parâmetros** | Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna uma lista com os valores dos campos chaves dos itens da lista dos selecionados do componente lista dupla.

Parâmetro: 
1. Componente Lista Dupla.

Retorno: 
Retorna uma Lista que deve ser atribuída a uma variável. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetDualListRightValue(component) {
	var selectIN = $c(component).rightSelect;
	if(selectIN) {
		var arrElements = new Array();

		if (selectIN.options.length > 0) {
			for (var i = 0; i < selectIN.options.length; i++) {
				var text = selectIN.options[i].value;
				
				arrElements.push(text);
			}
		}
		
	} else
		throw "O componente não é Lista Dupla";
	
	
	return arrElements;
}
```

---

## Lista Dupla - Obter Seleções Lista Principal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDualListGetLeftSelectedValues` |
| **Código** | 390 |
| **Assinatura** | `Lista Dupla - Obter Seleções Lista Principal (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna uma lista com os campos chaves da lista principal do componente lista dupla. É necessário selecionar os itens nas quais, quer-se obter os campos chaves.

Parâmetro(s): 
1. Formulário que contém a Lista Dupla.
2. Componente do tipo Lista Dupla.

Retorno: 
Retorna uma Lista com os selecionados da lista principal. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfDualListGetLeftSelectedValues(form, componentName) {
  var component = $c(componentName, form);
  
  var selectedValues = new Array();
  
  var options = component.leftSelect.options;
  for (var i = 0; i < options.length; i++) {
    var option = options[i];
    if (option.selected) {
      selectedValues.push(option.value);
    }
  }
  
  return selectedValues;
}
```

---

## Lista Dupla - Obter Seleções Lista Selecionados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDualListGetRightSelectedValues` |
| **Código** | 391 |
| **Assinatura** | `Lista Dupla - Obter Seleções Lista Selecionados (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna uma lista dos selecionados com os valores dos campos chaves, dos itens que foram selecionados pelo usuário do componente lista dupla.

Parâmetro(s): 
1. Formulário que contém a Lista Dupla.
2. Componente do tipo Lista Dupla.

Retorno: 
Retorna uma Lista com os selecionados da lista principal. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfDualListGetRightSelectedValues(form, componentName) {
  var component = $c(componentName, form);
  
  var selectedValues = new Array();
  
  var options = component.rightSelect.options;
  for (var i = 0; i < options.length; i++) {
    var option = options[i];
    if (option.selected) {
      selectedValues.push(option.value);
    }
  }
  
  return selectedValues;
}
```

---

## Lista Dupla - Obter Textos da Lista Principal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetDualListLeftText` |
| **Código** | 357 |
| **Assinatura** | `Lista Dupla - Descrição dos Itens à Direita(Componente)` |
| **Parâmetros** | Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna uma lista com a descrição dos itens da lista principal do componente lista dupla.

Parâmetro: 
1. Componente Lista Dupla.

Retorno: 
Retorna uma Lista que deve ser atribuída a uma variável do tipo variante. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetDualListLeftText(component) {	
	var selectIN = $c(component).leftSelect;
	if(selectIN) {
		var arrElements = new Array();

		if (selectIN.options.length > 0) {
			for (var i = 0; i < selectIN.options.length; i++) {
				var text = selectIN.options[i].text;
				
				arrElements.push(text);
			}
		}
		
	} else
		throw "O componente não é Lista Dupla";
	
	
	return arrElements;
}
```

---

## Lista Dupla - Obter Textos da Lista Selecionados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetDualListRightText` |
| **Código** | 359 |
| **Assinatura** | `Lista Dupla - Obter textos da lista selecionados(Componente)` |
| **Parâmetros** | Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna uma lista com a descrição dos itens da lista dos selecionados do componente lista dupla.

Parâmetro: 
1. Componente Lista Dupla.

Retorno: 
Retorna uma Lista que deve ser atribuída a uma variável do tipo variante. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetDualListRightText(component) {
	var selectIN = $c(component).rightSelect;
	if(selectIN) {
		var arrElements = new Array();

		if (selectIN.options.length > 0) {
			for (var i = 0; i < selectIN.options.length; i++) {
				var text = selectIN.options[i].text;
				
				arrElements.push(text);
			}
		}
		
	} else
		throw "O componente não é Lista Dupla";
	
	
	return arrElements;
}
```

---

## MakerFlow - Criar Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateMakerFlowComponent` |
| **Código** | 742 |
| **Assinatura** | `MakerFlow - Criar Componente (Letras;Variante): Inteiro` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um novo componente Maker Flow (Componente desenvolvido com o Maker) no servidor guardando suas propriedades.

Parâmetro(s):
1. Nome do componente. (Letras)
2. Mapa de parâmetros. (Variante)

Retorno:
Código do componente. (Inteiro)

Observações:
1. É recomendado o uso desta função para o armazenamento de propriedades sensíveis do componente, evitando que estas sejam expostas na camada cliente.
2. Caso seja necessário obter as propriedades armazenadas, utilizar a função "Obter Propriedade do Componente", ou definir uma nova propriedade posteriormente, utilizar a função "Definir Propriedade do Componente".

### Código Servidor (Java)

```java
protected final Variant ebfCreateMakerFlowComponent(Variant name, Variant paramsAdd) throws Exception{
  Map<wfr.sys.HTMLInterface.ComponentProperty, String> componentProperties = new HashMap<wfr.sys.HTMLInterface.ComponentProperty, String>();
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.CAMPO, "");
  componentProperties.put(wfr.sys.HTMLInterface.ComponentProperty.NOME, name.getString());
  WFRComponent com = new WFRComponent(fields.getForm(), componentProperties , 'Y');
  com.setComponentProperties(null);  
  Map<String, Object> properteisAdd = (Map<String, Object>) paramsAdd.getObject(); 
        
  for(Map.Entry<String, Object> property : properteisAdd.entrySet()){
    com.getComponentProperties().put(property.getKey(),  property.getValue()); 
    
    ebfSetComponentProperty(new Variant(fields.getForm().getGuid()), name, new Variant(property.getKey()), new Variant(property.getValue()));          
  }     

  return VariantPool.get(com.getCode());
}
```

---

## MakerFlow - Remover Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDestroyMakerFlowComponent` |
| **Código** | 743 |
| **Assinatura** | `MakerFlow - Remover Componente (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Remove um componente Maker Flow (Componente desenvolvido com o Maker) criado anteriormente.

Parâmetro:
1. Nome do componente.

Retorno:
Não possui.

Observação:
É recomendado o uso desta função sempre que for utilizar a função "MakerFlow - Criar Componente", desta forma, o componente criado não terá as propriedades duplicadas.

### Código Servidor (Java)

```java
protected final Variant ebfDestroyMakerFlowComponent(Variant name) throws Exception{
    ebfRemoveSessionAttribute(new Variant(fields.getForm().getGuid() + "_" + name.getString()), Variant.VARIANT_FALSE);
    return Variant.VARIANT_NULL;
  }
```

---

## Moldura - Alterar Conteúdo da Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebgChangeValueGroupBox` |
| **Código** | 476 |
| **Assinatura** | `Moldura - Alterar Conteúdo da Moldura (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função altera o Conteúdo da Moldura.

Parâmetro(s):
1. Nome do Componente.
2. Novo conteúdo. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebgChangeValueGroupBox(componentName, html) {
  var component = $c(componentName);
  if (component && component instanceof HTMLGroupBox) {
    component.changeContent(html);
  }
}
```

---

## Moldura - Alterar Posição da Barra de Rolagem X

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxSetPositionScrollLeft` |
| **Código** | 536 |
| **Parâmetros** | Letras;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe o nome da moldura e altera a posição da barra de rolagem horizontal da mesma de acordo com o segundo parâmetro.

Parâmetro(s):
1. Nome da moldura. (Letras)
2. Posição da barra de rolagem. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxSetPositionScrollLeft(component,position){
  if($c(component)) {
    var cdiv = $c(component).div;  
        cdiv.scrollLeft = position;
  }
}
```

---

## Moldura - Alterar Posição da Barra de Rolagem Y

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxSetPositionScrollTop` |
| **Código** | 533 |
| **Parâmetros** | Letras;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe o nome da moldura e altera a posição da barra de rolagem da mesma de acordo com o 
segundo parâmetro.

Parâmetro(s):
1. Nome da moldura.
2. Posição da barra de rolagem. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxSetPositionScrollTop(component,position){
  if($c(component)) {
    var cdiv = $c(component).div;  
        cdiv.scrollTop = position;
  }
}
```

---

## Moldura - Alterar Profundidade dos Componentes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxZindexComponents` |
| **Código** | 497 |
| **Assinatura** | `Moldura - Alterar Profundidade dos Componentes (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função alterar Profundidade dos Componentes

Parâmetro(s):
1. Nome do Componente Moldura.
2. Índice de Profundidade. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxZindexComponents(groupBoxName,zIndex){
  var groupBox = $c(groupBoxName);
  
  if (groupBox instanceof HTMLGroupBox) {
    var rightLimit = (groupBox.getX() + groupBox.getWidth());
    var bottomLimit = (groupBox.getY() + groupBox.getHeight());
    
    var elements = controller.getElementsByDiv(d.t.tabsByName[groupBox.getTabName()].div);
    for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      if (element != groupBox) {
        if (element.getX() >= groupBox.getX() && element.getX() <= rightLimit) {
          if (element.getY() >= groupBox.getY() && element.getY() <= bottomLimit) {
            if (isNullable(element.parentPanelCode)) {
              if(element.id) {
                ebfFormZindex(groupBoxName,zIndex+1);
              }
            }
          }
        }
      }
    }
     ebfFormZindex(groupBoxName,zIndex);
  }
}
```

---

## Moldura - Exibir/Ocultar Barra de Rolagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxAddScroll` |
| **Código** | 538 |
| **Assinatura** | `Moldura - Exibir/Ocultar Barra de Rolagem (Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função adiciona ou remove a barra de rolagem (x, y) de uma moldura tomando como base nos parâmetros informados.

Parâmetro(s):
1. Nome do componente moldura. (Letras)
2. Barra de rolagem do eixo X. (Letras)
3. Barra de rolagem do eixo Y. (Letras)

Retorno
Não possui.

Observação:
O conteúdo dos parâmetros de entrada 2 e 3 são:
hidden - Oculta a barra de rolagem.
none   - Exibi a barra de rolagem.
auto   -  Deixa a barra de rolagem automática.

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxAddScroll(component,scrollX,scrollY) {
  if($c(component)) {
    var cdiv = $c(component).div;  
    if (cdiv) {
      cdiv.style.overflowY = ebfTrim(scrollY);  
      cdiv.style.overflowX = ebfTrim(scrollX);
    }
  }
}
```

---

## Moldura - Exibir/Ocultar Componentes Internos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxShowComponents` |
| **Código** | 400 |
| **Assinatura** | `Moldura - Exibir/Ocultar Componentes Internos (Componente;Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função mostra ou oculta o componente moldura e todos os componentes que estiverem "dentro" da área do mesmo.

Parâmetro(s):
1. Componente Moldura.
2. Valor lógico que exibe ou oculta os componentes. (Lógico)

Retorno: 
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfGroupBoxShowComponents(Variant groupBoxName, Variant visible) throws Exception {
  return callClientFunction("ebfGroupBoxShowComponents", groupBoxName, visible);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxShowComponents(groupBoxName, visible){
  var groupBox = $c(groupBoxName);
  
  if (groupBox instanceof HTMLGroupBox) {
    var rightLimit = (groupBox.getX() + groupBox.getWidth());
    var bottomLimit = (groupBox.getY() + groupBox.getHeight());
    
    var elements = controller.getElementsByDiv(d.t.tabsByName[groupBox.getTabName()].div);
    for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      if (element != groupBox) {
        if (element.getX() >= groupBox.getX() && element.getX() <= rightLimit) {
          if (element.getY() >= groupBox.getY() && element.getY() <= bottomLimit) {
            if (isNullable(element.parentPanelCode)) {
              element.setVisible(visible);
            }
          }
        }
      }
    }

    groupBox.setVisible(visible);
  }
}
```

---

## Moldura - Limpar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxClean` |
| **Código** | 423 |
| **Assinatura** | `Moldura - Limpar (Formulário, Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Força a remoção do conteúdo da moldura.

Parâmetro(s):
1. Formulário da moldura.
2. Componente moldura.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfGroupBoxClean(Variant formName, Variant componentName) throws Exception {
  return callClientFunction("ebfGroupBoxClean", formName, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxClean(formName, componentName) {
  var component = $c(componentName, formName);  
  if (component && component instanceof HTMLGroupBox) {  
    component.clearContent();
  }
}
```

---

## Moldura - Modo Assinatura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableSignatureBevel` |
| **Código** | 1067 |
| **Assinatura** | `Moldura - Modo Assinatura (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função permite que o componente seja capaz de capturar uma assinatura de forma digital.

Parâmetros:
1. Formulário
2. Componente

Retorno:
Não possui

### Código Cliente (JavaScript)

```javascript
function ebfEnableSignatureBevel(form, componentId) {
  let component = $c(componentId);  
  if (component &&  component.name === "HTMLGroupBox") {
    let canvas = document.createElement("canvas");
    canvas.setAttribute("width", component.div.offsetWidth + "px");
    canvas.setAttribute("height", component.div.offsetHeight + "px");
    component.div.appendChild(canvas);
    if (canvas) {
      var ctx = canvas.getContext('2d');
      var drawing = false;

      canvas.addEventListener('mousedown', function(e) {
        drawing = true;
        ctx.moveTo(e.offsetX, e.offsetY);
      });

      canvas.addEventListener('mousemove', function(e) {
        if (drawing) {
          ctx.lineTo(e.offsetX, e.offsetY);
          ctx.stroke();
        }
      });

      canvas.addEventListener('mouseup', function() {
        drawing = false;
      });

      canvas.addEventListener('mouseleave', function() {
        drawing = false;
      });

      canvas.addEventListener('touchstart', function(event) {
        const rect = component.div.getBoundingClientRect();
        event.preventDefault();
        drawing = true;
        ctx.moveTo(event.touches[0].clientX - rect.left, event.touches[0].clientY - rect.top);
      });

      canvas.addEventListener('touchmove', function(event) {
        event.preventDefault();
        if (drawing) { 
          const rect = component.div.getBoundingClientRect();
          ctx.lineTo(event.touches[0].clientX - rect.left, event.touches[0].clientY - rect.top);
          ctx.stroke();
        }
      });

      canvas.addEventListener('touchend', function(event) {
        event.preventDefault();
        drawing = false;
      });
    }
  } else {
    throw new Error(handleException(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", componentId)));
  }
}
```

---

## Moldura - Mover Componentes Internos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxMoveComponents` |
| **Código** | 399 |
| **Assinatura** | `Moldura - Mover Componentes Internos (Componente;Inteiro;Inteiro)` |
| **Parâmetros** | Componente;Inteiro;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função move o componente moldura e todos os componentes que estiverem "dentro" da área do mesmo.

Parâmetro(s):
1. Moldura. (Componente)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)

Retorno:
Não possui.

Observação:
Esta função simula a funcionalidade de um Region (container).

### Código Servidor (Java)

```java
protected final Variant ebfGroupBoxMoveComponents(Variant groupBoxName, Variant posX, Variant posY) throws Exception {
  return callClientFunction("ebfGroupBoxMoveComponents", groupBoxName, posX, posY);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxMoveComponents(groupBoxName, posX, posY) {  
  var groupBox = $c(groupBoxName);
  var diffDistanceX = (posX - groupBox.getX());
  var diffDistanceY = (posY - groupBox.getY());

  if (groupBox instanceof HTMLGroupBox) {
    var rightLimit = (groupBox.getX() + groupBox.getWidth());
    var bottomLimit = (groupBox.getY() + groupBox.getHeight());
    
    var elements = controller.getElementsByDiv(d.t.tabsByName[groupBox.getTabName()].div);
    for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      if (element != groupBox) {
        if (element.getX() >= groupBox.getX() && element.getX() <= rightLimit) {
          if (element.getY() >= groupBox.getY() && element.getY() <= bottomLimit) {
            if (isNullable(element.parentPanelCode)) {
              element.setX(element.getX() + diffDistanceX);
              element.setY(element.getY() + diffDistanceY);
            }
          }
        }
      }
    }

    groupBox.setX(posX);
    groupBox.setY(posY);
  }
}
```

---

## Moldura - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxNew` |
| **Código** | 495 |
| **Assinatura** | `Moldura - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Inteiro;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Inteiro;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Moldura dinamicamente.

Parâmetro(s):
1. Aba (caso não seja definida, a aba será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura do componente. (Inteiro)
5. Altura do componente. (Inteiro)
6. Descrição do componente. (Letras)
7. Nome do componente. (Letras)
8. Estilo ( 1.Moldura 2.Linha Acima 3.Linha Baixo 4.Linha à Esquerda 5. Linha à Direita 6.Espaço). (Inteiro)
9. Estilo CSS. (Letras)
10. Classe CSS. (Letras)

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxNew(aba,posX,posY,width,height,description,value,estilo, styleCss, classCss){
    var code = getCodComponent();
    var component = new HTMLGroupBox(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, description, value);
    component.id = value;    
    component.style = estilo;
    component.zindex = 1;
    component.loadComponentTime = 0;  
    component.styleCss = styleCss;  
    component.classCss = classCss;
    var container = $mainform().d.t.getTabByName(aba);
    if(!container){
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);
    } 
    component.design(container.div, true);
    document['c_' + code] = component;
  }
```

---

## Moldura - Obter Posição da Barra de Rolagem X

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxGetScrollPositionLeft` |
| **Código** | 537 |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro o nome da moldura e retorna a posição da barra de rolagem.

Parâmetro:
1. Nome da moldura. (Letras)

Retorno:
Posição da barra de rolagem. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxGetScrollPositionLeft (component){  
   var c = $c(component).div;
     return c.scrollLeft;

  }
```

---

## Moldura - Obter Posição da Barra de Rolagem Y

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxGetScrollPositionTop` |
| **Código** | 532 |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro o nome da moldura e retorna a posição da barra de rolagem.

Parâmetro:
1. Nome da moldura. (Letras)

Retorno:
Posição da barra de rolagem. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxGetScrollPositionTop (component){  
   var c = $c(component).div;
     return c.scrollTop;

  }
```

---

## Moldura - Obter a Assinatura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCaptureSignatureBevel` |
| **Código** | 1068 |
| **Assinatura** | `Moldura - Obter a Assinatura (Formulário;Componente): Letras` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função obtém a assinatura digital no componente.
O retorno dessa função é uma string em base64 para formato de imagem .png

Parâmetros:
1. Formulário
2. Componente

Retorno:
Assinatura (Letras)

Observação:
1. Para que essa função funcione corretamente é necessário que o Modo Assinatura tenha sido permitido
por meio da função "Moldura - Modo Assinatura". Caso contário o retorno é vazio.

### Código Cliente (JavaScript)

```javascript
function ebfCaptureSignatureBevel(form, componentId) {
  let component = $c(componentId);
  if (component && component.name === "HTMLGroupBox") {
    let canvas = component.div.children[0];
    if (canvas && canvas.toDataURL) {
      return canvas.toDataURL('image/png');
    }
  }

  return "";
}
```

---

## Moldura - Remover Componentes da Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxRemoveComponents` |
| **Código** | 467 |
| **Assinatura** | `Moldura - Remover Componentes da Moldura (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Remove Componentes da Moldura.

Parâmetro:
1. Nome da Moldura. (Componente)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxRemoveComponents(groupBoxName){
  var groupBox = $c(groupBoxName);
  
  if (groupBox instanceof HTMLGroupBox) {
    var rightLimit = (groupBox.getX() + groupBox.getWidth());
    var bottomLimit = (groupBox.getY() + groupBox.getHeight());
    
    var elements = controller.getElementsByDiv(d.t.tabsByName[groupBox.getTabName()].div);
    for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      if (element != groupBox) {
        if (element.getX() >= groupBox.getX() && element.getX() <= rightLimit) {
          if (element.getY() >= groupBox.getY() && element.getY() <= bottomLimit) {
            if (isNullable(element.parentPanelCode)) {
              if(element.id) {
                ebfDestroyComponent(element.id);
              }
            }
          }
        }
      }
    }
     ebfDestroyComponent(groupBox .id);
  }
}
```

---

## Moldura-Habilitar/Desabilitar Componentes Internos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGroupBoxEnabledComponents` |
| **Código** | 401 |
| **Assinatura** | `Moldura-Habilitar/Desabilitar Componentes Internos (Componente;Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função habilita ou não o componente moldura e todos os componentes que estiverem "dentro" da área do mesmo.

Parâmetro(s):
1. Nome da Moldura. (Componente)
2. Valor lógico que habilita ou desabilita os componentes. (Lógico)

Retorno: 
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfGroupBoxEnabledComponents(Variant groupBoxName, Variant enable) throws Exception {
  return callClientFunction("ebfGroupBoxEnabledComponents", groupBoxName, enable);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGroupBoxEnabledComponents(groupBoxName, enable){
  var groupBox = $c(groupBoxName);
  
  if (groupBox instanceof HTMLGroupBox) {
    var rightLimit = (groupBox.getX() + groupBox.getWidth());
    var bottomLimit = (groupBox.getY() + groupBox.getHeight());
    
    var elements = controller.getElementsByDiv(d.t.tabsByName[groupBox.getTabName()].div);
    for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      if (element != groupBox) {
        if (element.getX() >= groupBox.getX() && element.getX() <= rightLimit) {
          if (element.getY() >= groupBox.getY() && element.getY() <= bottomLimit) {
            if (isNullable(element.parentPanelCode)) {
              element.setEnabled(enable);
            }
          }
        }
      }
    }

    groupBox.setEnabled(enable);
  }
}
```

---

## Monitorar posição do cursor no Memo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `freTextAreaMonitorarCursor` |
| **Código** | 392 |
| **Assinatura** | `Monitorar posição do cursor no Memo(componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Inicia o monitoramento do deslocamento do cursor dentro de um campo do tipo Memo.

Parâmetro:
1. Componente Memo. (Letras)

Retorno:
Não possui.

Observações:
1. Esta função monitora apenas o posicionamento do cursor em um componente MEMO.
2. Esta função não funciona para o memo quando a propriedade texto rico está setada como "HTML Básico" ou "HTML Avançado".

### Código Cliente (JavaScript)

```javascript
function __freMonitorarCursor_setCursorPos(tArea) {
  tArea.__cursorPos = __freMonitorarCursor_getCursorPos(tArea);  
}

function __freMonitorarCursor_getCursorPos(textElement) {
 //Firefox/Mozzila
 if (textElement.selectionStart || textElement.selectionStart == '0') {
   return textElement.selectionStart;    
 }
 //save off the current value to restore it later,
 var sOldText = textElement.value;

//create a range object and save off it's text
 var objRange = document.selection.createRange();
 var sOldRange = objRange.text;

//set this string to a small string that will not normally be encountered
 var sWeirdString = '#%~';

//insert the weirdstring where the cursor is at
 objRange.text = sOldRange + sWeirdString; 
 objRange.moveStart('character', (0 - sOldRange.length - sWeirdString.length));

//save off the new string with the weirdstring in it
 var sNewText = textElement.value;

//set the actual text value back to how it was
 objRange.text = sOldRange;

//look through the new string we saved off and find the location of
//the weirdstring that was inserted and return that value
 for (i=0; i <= sNewText.length; i++) {
   var sTemp = sNewText.substring(i, i + sWeirdString.length);
   if (sTemp == sWeirdString) {
     var cursorPos = (i - sOldRange.length);
     return cursorPos;
   }
 }
}

function freTextAreaMonitorarCursor() { 
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      component.input.onchange = function() { __freMonitorarCursor_setCursorPos(this); };      
      component.input.onclick  = function() { __freMonitorarCursor_setCursorPos(this); };      
    }     
    else {
      alert('Componente não encontrado!');    
    }
  }
}
```

---

## Mudar Altura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetHeight` |
| **Código** | 585 |
| **Assinatura** | `Mudar Altura` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera a altura do componente do formulário.

Parâmetro(s):
1. Componente que mudará de tamanho.
2. Nova altura do componente. (Inteiro)

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Inicio" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "componente" para uma constante do tipo "Letras".

Exemplo:
Assumindo como parâmetros o componente "Cidade"(MakerEdit1), e o valor 100(inteiro), quando o fluxo for 
executado a altura do componente passará a ser 100.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetHeight(Variant field, Variant height) throws WFRRuleException {
    client.setHeight(field.getString(), height.getLong());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetHeight() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      component.setHeight(arguments[1]);
    }
  }
}
```

---

## Mudar Cor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetColor` |
| **Código** | 578 |
| **Assinatura** | `Mudar Cor` |
| **Parâmetros** | Componente;Cor |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera a cor do conteúdo do componente.

Parâmetro(s):
1. Componente cujo conteúdo mudará de cor.
2. Nova cor do conteúdo do componente. (Cor)

Retorno: 
Não possui.

Observações:
1. No 2º parâmetro deve ser passado o hexadecimal correspondente a cor desejada, como por exemplo, a cor 
preta(000000).
2. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
3. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo 
"componente" para uma constante do tipo "Letras".

Exemplo:
Assumindo como parâmetros o componente "Cidade" (MakerEdit1), e a cor Azul (0000FF), quando o fluxo for executado 
o conteúdo do componente "MakerEdit1" passará a ser azul.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetColor(Variant field, Variant color) throws Exception {
    client.setColor(field.getString(), color.getString());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetColor() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      component.setColor(arguments[1]);
    }
  }
}
```

---

## Mudar Cor de Fundo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetBGColor` |
| **Código** | 579 |
| **Assinatura** | `Mudar Cor de Fundo` |
| **Parâmetros** | Componente;Cor |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera a cor de fundo do componente.

Parâmetro(s):
1. Componente cujo fundo mudará de cor.
2. Nova cor de fundo do componente. (Cor)

Retorno: 
Não possui.

Observações:
1. No 2º parâmetro deve ser passado o hexadecimal correspondente a cor desejada, como por exemplo, a cor preta (000000).
2. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
3. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo 
"componente" para uma constante do tipo "Letras".

Exemplo:
Assumindo como parâmetros o componente "Cidade"(MakerEdit1), e a cor Azul (0000FF), quando o fluxo for executado 
o fundo do componente "MakerEdit1" passará a ser azul.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetBGColor(Variant field, Variant color) throws Exception {
    client.setBGColor(field.getString(), color.getString());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetBGColor() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      component.setBGColor(arguments[1]);
    }
  }
}
```

---

## Mudar Cor de Fundo da DIV

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetDivBGColor` |
| **Código** | 472 |
| **Assinatura** | `Mudar Cor de Fundo da DIV` |
| **Parâmetros** | Componente;Cor |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera a cor de fundo do componente DIV.

Parâmetro(s):
1. Componente DIV cujo fundo mudará de cor.
2. Nova cor de fundo do componente. (Cor)

Retorno: 
Não possui.

Observações:
1. No 2º parâmetro deve ser passado o hexadecimal correspondente a cor desejada, como por exemplo, a cor preta (000000).
2. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
3. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo 
"componente" para uma constante do tipo "Letras".

Exemplo:
1. Assumindo como parâmetros o componente "Cidade" (MakerEdit1), e a cor Azul (0000FF), quando o fluxo for executado 
o fundo do componente "MakerEdit1" passará a ser azul.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetDivBGColor(Variant comp, Variant cor) throws Exception {
    return VariantPool.get(callClientFunction("ebfFormSetDivBGColor", comp, cor));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetDivBGColor(comp,cor) {
  if (comp) {
    var component = $c(comp);
    if (component) {
      component.div.style.backgroundColor = cor;
    }
  }
}
```

---

## Mudar Descrição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeDescription` |
| **Código** | 312 |
| **Assinatura** | `Mudar Descrição(Componente, Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Muda a descrição do componente escolhido no primeiro parâmetro.

Parâmetro(s):
1. Componente.
2. Nova Descrição. (Letras)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfChangeDescription(Variant c, Variant d) throws Exception {
    return callClientFunction("ebfChangeDescription", c, d);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfChangeDescription(c, d) {
  $c(c).setDescription(d);  
}
```

---

## Mudar Largura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetWidth` |
| **Código** | 584 |
| **Assinatura** | `Mudar Largura` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera a largura do componente do formulário.

Parâmetro(s):
1. Componente que mudará de tamanho.
2. Nova largura do componente. (Inteiro)

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo 
"componente" para uma constante do tipo "Letras".

Exemplo:
Assumindo como parâmetros o componente "Cidade"(MakerEdit1), e o valor 350 (Inteiro), quando o fluxo for 
executado a largura do componente passará a ser 350.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetWidth(Variant field, Variant width) throws WFRRuleException {
    client.setWidth(field.getString(), width.getLong());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetWidth() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      component.setWidth(arguments[1]);
    }
  }
}
```

---

## Mudar Posição do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetPosition` |
| **Código** | 583 |
| **Assinatura** | `Mudar Posição do Componente (Componente;Inteiro;Inteiro)` |
| **Parâmetros** | Componente;Inteiro;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera a posição do componente passado por parâmetro.

Parâmetro(s):
1. Componente que mudará de posição.
2. Nova posição X (Horizontal) do componente. (Inteiro)
3. Nova posição Y (Vertical) do componente. (Inteiro)

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "InÍcio" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo 
"componente" para uma constante do tipo "Letras".

Exemplo:
Assumindo como parâmetros o componente "Cidade"(MakerEdit1), o valor 150 e o valor 250, quando o fluxo for executado a posição X do componente será 150 e a Y será 250.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetPosition(Variant field, Variant x, Variant y) throws WFRRuleException {
    client.setPosition(field.getString(), x.getLong(), y.getLong());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetPosition() {
  var component; 
  if (existArgs(arguments)) {
    component = $c(arguments[0]);
    if (component) {
      if (arguments[1])
        component.setX(arguments[1]);
      if (arguments[2])
        component.setY(arguments[2]);     
    }
  }  
}
```

---

## MultiSelect - Obter Valores

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMultiSelectGetValues` |
| **Código** | 908 |
| **Assinatura** | `MultiSelect - Obter Valores (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe o nome do componente MultiSelect e retorna os valores que foram selecionados.

Parâmetro:
1. Nome do MultiSelect. (Componente)

Retorno:
Valores selecionados. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfMultiSelectGetValues(componentName){
    let component = $c(componentName);
    return component.selected;
}
```

---

## Multiselect - Adicionar Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMultiselectPut` |
| **Código** | 1000 |
| **Assinatura** | `Multiselect - Adicionar Elemento (Componente;Letras;Letras): Variante` |
| **Parâmetros** | Componente;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | * |

### Descrição

Essa função Insere um elemento no componente Multiselect. Passando como parâmetro o componente Lista, o valor chave (que será o valor à ser salvo no banco) e o valor que representará o valor chave.

Parâmetro(s):
1. Nome do MultiSelect. (Componente)
2. Valor Chave. (Letras)
3. Valor que representará a chave. (Letras)

Retorno: 
O retorno somente para a camada Servidor, será o valor inserido no componente Multiselect. (Variante) 

Observação:
O campo chave deve obrigatoriamente ser do tipo Letras. Caso contrário, o componente não irá exibir os valores.

Exemplo: 
Assumindo o 1º parâmetro: Carros (Lista) contendo os elementos 1- Usado e 2- Novo, sendo 1 e 2 o valor chave e  "Usado e Novo" o valor que representam o valor chave. O 2º parâmetro sendo 3 e o 3º parâmetro sendo "Quebrado". O retorno será a lista Carros contendo os elementos 1- Usado, 2- Novo e 3- Quebrado.

### Código Servidor (Java)

```java
protected final Variant ebfMultiselectPut(Variant combo, Variant key, Variant value) throws Exception {
    return callClientFunction("ebfMultiselectPut", combo, key, value);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfMultiselectPut(componentName, key, value) {
  let component = $c(componentName);
  if(component){
    component.add(key, value);    
  }else{
    handleException(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", arguments[0]));
  }
}
```

---

## Multiselect - Atualizar Valor Selecionado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMultiSelectSetValues` |
| **Código** | 906 |
| **Assinatura** | `Multiselect - Atualizar Valor Selecionado (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função altera os valores selecionados na lista do componente.

Parâmetro(s):
1. Nome do MultiSelect. (Componente)
2. Sequência de valores separados por vírgula ','. (Letras)

Retorno:
Não possui.
		
Observações:
1. Ao inserir a sequência de valores como parâmetro, colocar valores como: 1,2,3.
2. Utilizar os mesmo valores contidos na lista de valores do componente. 
3. Caso um dos valores inseridos não esteja na lista ele será ignorado.

### Código Cliente (JavaScript)

```javascript
function ebfMultiSelectSetValues(componentName, values) {
  let component = $c(componentName);
  let listValues = values.split(",").map(function(el) {
    return el.trim();
  });

  for (let i = 0; i < component.keys.length; i++) {
    component.unselectOption(component.keys[i]);
  }

  for (let i = 0; i < listValues.length; i++) {
    if (component.keys.indexOf(listValues[i]) != -1) {
      component.selectOption(listValues[i]);
    }
  }
}
```

---

## Multiselect - Limpar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMultiselectClean` |
| **Código** | 1001 |
| **Assinatura** | `Multiselect - Limpar (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | * |

### Descrição

Essa função remove todos os elementos do componente Multiselect passado por parâmetro.

Parâmetro(s):
1. Nome do MultiSelect. (Componente)

Retorno: 
Não possui.

Exemplo: 
Assumindo o 1º parâmetro: Carros (Lista) contendo os elementos 1- Usado e 2- Novo, sendo 1 e 2 o valor chave e  "Usado e Novo" o valor que representam o valor chave. Irá ser exibido a lista Carros com os elementos removidos.

### Código Servidor (Java)

```java
protected final Variant ebfMultiselectClean(Variant combo) throws Exception {
  return callClientFunction("ebfMultiselectClean", combo);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfMultiselectClean(componentName) {
  let component = $c(componentName);
  if(component){
    component.clean();   
  }else{
    handleException(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", arguments[0]));
  }
}
```

---

## Obter Propriedade do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetComponentProperty` |
| **Código** | 741 |
| **Assinatura** | `Obter Propriedade do Componente (Formulário;Componente;Letras): Variante` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o valor da propriedade passada por parâmetro.

Parâmetro(s):
1. Formulário. (Opcional)
2. Componente.
3. Propriedade. (Letras)

Retorno: 
Valor atual da propriedade. (Variante)

Observações:
1. Na camada servidor, caso o formulário não seja informado, a função adotará o formulário corrente. Na camada cliente,
sempre será o formulário corrente.
2. O nome da propriedade deverá o nome real e não o de exibição.

Exemplo:
Assumindo como componente "MakerEdit2" e propriedade "AutoAjuste",  o retorno será o valor corrente desta propriedade.

### Código Servidor (Java)

```java
protected Variant ebfGetComponentProperty(Variant formGuid, Variant compName, Variant propertyName)throws Exception {
    
    WFRForm form = null;
    if (formGuid == Variant.VARIANT_NULL){
      form =  getData().getSystem().getForm(Functions.fromISOtoBASE(request.getParameter("formID")), connection);
    }else{
      form = getSystem().getFormByGuid(formGuid.getString());
    }
    
    Variant com = (Variant) ebfGetSessionAttribute(new Variant(fields.getForm().getGuid() + "_" + compName.getString() + "_" + propertyName.getString()), Variant.VARIANT_FALSE);
  
    if (propertyName != null && propertyName.getString().length() > 0) {
      if (com.getObject() != null){
        return new Variant(com.getObject());
      }
      if(form.getComponentByName(compName.getString()) != null)
        return new Variant(form.getComponentByName(compName.getString()).getComponentProperties().get(propertyName.getString()));
    }    

    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetComponentProperty() {
  if (existArgs(arguments)) {  
    var comp = $c(arguments[1]);      
    if(comp){
      return comp[arguments[2]];     
    }
  }
  return null;
}
```

---

## Opções - Adicionar Item

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupAdd` |
| **Código** | 269 |
| **Assinatura** | `Opções - Adicionar Item(Formulário;Componente;Letras;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que adiciona um item ao componente Opções passado por parâmetro.

Parâmetro(s):
1. Formulário.
2. Componente Opções.
3. Valor (Referente ao item adicionado (pode ser passado por parâmetro)). (Letras)
4. Label (Nome que aparecerá (pode ser passado como parâmetro)). (Letras)

Retorno:
Não possui.

Observação:
Ao adicionar item ao componente dinamicamente, não é possível salvar a opção selecionada no banco.

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupAdd(form, component, value, label){
  let comp = $c(component);
  if(comp) {
    document.getElementsByName("WFRInput" + comp.code)[0].remove();
    comp.add(value, label);
  } else {
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', component));
  }
}
```

---

## Opções - Limpar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupClean` |
| **Código** | 273 |
| **Assinatura** | `Opções - Limpar(Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que remove/limpa todos os itens do componente Opções (RadioGroup).

Parâmetro(s):
1. Formulário.
2. Componente Opções.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupClean(form, component){
  var component = $c(component);
  var size = component.options.length;
  for(i=0;i<size;i++){
    component.labels.splice(0, 1);
    component.values.splice(0, 1);
  }  
  document.getElementsByName("WFRInput"+component.code)[0].remove();
  component.reDesign();
}
```

---

## Opções - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupNew` |
| **Código** | 270 |
| **Assinatura** | `Opções - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Variante;Variante;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Variante;Variante;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Opções dinamicamente.

Parâmetro(s):
1. Aba (Caso a aba definida neste parâmetro não exista, a mesma será criada).
2. Posição X.
3. Posição Y.
4. Largura do Componente.
5. Altura do Componente.
6. Descrição do Componente.
7. Valor do Componente.
8. Lista de Labels. (Ver observação)
9. Lista de Valores. (Ver observação)
10. Container.
11. Estilo CSS.
12. Classe CSS.
13. Id do componente

Retorno:
Não possui.

Observação:
A função "Criar lista a partir dos elementos" ajuda na criação de labels e valores.

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupNew(aba, posX, posY, width, height, description, value, labels, values, compContainer, styleCss, classCss, identity) {
  var code = getCodComponent();
  var component = new HTMLRadioGroup(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, description, value, labels, values);
  component.id = identity ? identity : description;
  component.zindex = 3;
  component.loadComponentTime = 0;
  component.styleCss = styleCss;
  component.classCss = classCss;

  var container = $mainform().d.t.getTabByName(aba);
  if (!container) {
      d.t.add(aba);
      container = $mainform().d.t.getTabByName(aba);
  }

  setOrderTabDynamically(code); 
  if (compContainer) {
    component.container = compContainer;
    compContainer = document.getElementById(compContainer);
    component.design(compContainer, true);
  } else { 
    component.design(container.div, true);  
  }

  document['c_' + code] = component;
}
```

---

## Opções - Obter Quantidade de Itens

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupGetSize` |
| **Código** | 265 |
| **Assinatura** | `Opções - Obter Quantidade de Itens(Formulário;Componente) : Inteiro` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna a quantidade itens de um componente Opções.

Parâmetro(s):
1. Formulário onde se encontra o componente.
2. Componente Opções.

Retorno:
Retorna a quantidade de itens do componente. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupGetSize(form, component){  
  component = $c(component);
  return component.options.length;
}
```

---

## Opções - Remover Item

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupRemoveItem` |
| **Código** | 266 |
| **Assinatura** | `Opções - Remover Item(Formulário;Componente;Inteiro)` |
| **Parâmetros** | Formulário;Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que remove um item do componente Opções tomando o índice como referência.

Parâmetro(s):
1. Formulário.
2. Componente Opções.
3. Índice do item a ser removido.

Retorno:
Não possui.

Observação:
O índice dos itens estão na ordem N-1. Sendo o primeiro 0.

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupRemoveItem(form, component, idx){  
  component = $c(component);
  component.values.splice(idx, 1);
  component.labels.splice(idx, 1);
  element = document.getElementsByName("WFRInput"+component.code);
  if (element)  {
    element[0].parentNode.removeChild(element[0]);      
    component.reDesign();     
  }
}
```

---

## Opções - Remover Item por Label

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupRemoveByLabel` |
| **Código** | 267 |
| **Assinatura** | `Opções - Remover Item por Label(Formulário;Componente;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que remove um item do componente Opções tomando o label do item como referência.

Parâmetro(s):
1. Formulário onde está localizado o componente Opções.
2. Componente Opções.
3. Label do item a ser removido.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupRemoveByLabel(form, component, label){  
  component = $c(component);
  var idx = arrayIndexOf(component.labels, label);
  if (idx != -1) {     
    component.options.splice(idx, 1);
    component.values.splice(idx, 1);
    component.labels.splice(idx, 1);     
  }else
    interactionError(getLocaleMessage("INFO.KEY_ELEMENT_DOES_NOT_EXIST",key));

  element = document.getElementsByName("WFRInput"+component.code);
  if (element)  {
    element[0].parentNode.removeChild(element[0]);      
    component.reDesign();     
  }
  
  component.reDesign();  
}
```

---

## Opções - Selecionar Item

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRadioGroupSetChecked` |
| **Código** | 268 |
| **Assinatura** | `Opções - Selecionar Item(Formulário;Componente;Inteiro)` |
| **Parâmetros** | Formulário;Componente;Inteiro |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que seleciona o item do componente Opções.

Parâmetro(s):
1. Formulário onde se encontra o componente.
2. Componente Opções.
3. Valor. (Inteiro) (Ver observação)

Retorno:
Não possui.

Observação:
No 3º parâmetro deve ser o valor configurado no componente para ser salvo no banco.

### Código Cliente (JavaScript)

```javascript
function ebfRadioGroupSetChecked(form, component, idx){
  var component = $c(component);
  for(i=0;i<component.options.length;i++){
    if(component.options[i].value == idx){
      component.options[i].setChecked(true);
    } else {
      component.options[i].setChecked(false);
    }
  }
}
```

---

## Player - Inserir/Substituir Lista De Reprodução

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPlayerSetPlaylist` |
| **Código** | 919 |
| **Assinatura** | `Player - Inserir/Substituir Lista De Reprodução (Letras;Variante;Lógico)` |
| **Parâmetros** | Letras;Variante;Lógico |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Recebe por parâmetro uma lista de URLs e inclui ou substitui a lista de reprodução anterior.

Parâmetro(s):
1. Nome do Componente
2. Lista de URLs.
3. Adicionar no fim da lista.
	
Retorno:
Não possui.

Observação:
Se o parâmetro "Adicionar no fim da lista" for verdadeiro, a nova lista de URLs será adicionada no fim da lista anterior, 
caso contrário, a lista será totalmente substituída.

### Código Cliente (JavaScript)

```javascript
function ebfPlayerSetPlaylist(componentName, URLList, add){
    component = $c(componentName);
    if(component){
        if(!add){
            component.clearPlaylist();
        }
        URLList.map(function(el){
            component.addMediaToPlaylist(el, "");
        });
    } else {
        interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", componentName));
    }
}
```

---

## RSS - Alterar/Carregar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRSSReload` |
| **Código** | 921 |
| **Assinatura** | `RSS - Alterar/Carregar  (Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Recebe como parâmetro uma nova URL e recarrega o componente RSS especificado.

Parâmetro(s):
1. Nome do RSS. (Letras)
2. URL do RSS. (Letras)
3. Charset. (Letras)

Retorno:
Não possui.

Observação:
Se o parâmetro URL for nulo, o componente será recarregado mantendo a URL anterior.

### Código Servidor (Java)

```java
protected final Variant ebfRSSReload (Variant comp, Variant uri, Variant charSet) throws Exception {
  callClientFunction("ebfRSSReload", comp, uri, charSet);  
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRSSReload(name, URL, charset) {
  let component = $c(name); 
  if(component) {
    component.setUrl(URL, charset);
  } else {
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", name));
  }
}
```

---

## Remover Evento do componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfComponentEventRemove` |
| **Código** | 302 |
| **Assinatura** | `Remover Evento do componente (Componente;Letras;Fluxo)` |
| **Parâmetros** | Componente;Letras;Letras;Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove um evento no padrão W3C (DOM Events Specification) associado ao componente através da 
função "Associar Evento ao componente".

Parâmetro(s): 
1. Componente cujo evento foi associado (nulo caso o evento seja o formulário).
2. Descrição do evento.
3. Fluxo que é executado quando o evento ocorre.
4. Lista com os parâmetros que são passados ao fluxo.

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfComponentEventRemove(componentName, eventName) {  
  // Testa se o objeto é nulo e associa o evento ao formulário
  var component = controller.verifyComponent(componentName);
  
  var componentDiv;
  if(component == null) { 
    componentDiv = $mainform().d;
  } else {
    componentDiv = component.div;
  }
  
  // Remove o 'on' do evento
  var startsWithOn = /^on(.+)/;
  var found = eventName.match(startsWithOn);
  if (found != null && found != -1) {
    eventName = RegExp.$1;
  }
  
  // Remove o objeto
  if (componentDiv.ruleEvents) {
    var associatedFunction = componentDiv.ruleEvents[eventName];
    removeEvent(componentDiv, eventName, associatedFunction, true);
    componentDiv.ruleEvents[eventName] = null;
  }
}
```

---

## Remover Seleção do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveOnSelectStart` |
| **Código** | 494 |
| **Assinatura** | `Remove o evento onselectstart e onmousedown do componente. (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove a seleção do componente

Parâmetro:
1. Nome do Componente Moldura.

Retorno:
Não possui.

Observação:
Remove o evento onselectstart e onmousedown do componente.

### Código Cliente (JavaScript)

```javascript
function ebfRemoveOnSelectStart(ComponentName) {
	var c = $c(ComponentName);
	if (c) {
		if ('undefined' !== typeof c.div.onselectstart) {
			c.div.onselectstart = function () { return false; };
		} else {
			c.div.onmousedown   = function () { return false; };
		}
	}
}
```

---

## Slider - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSliderNew` |
| **Código** | 907 |
| **Assinatura** | `Slider - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Inteiro;Inteiro;Inteiro;Lógico;Lógico;Inteiro;Inteiro;Número;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Inteiro;Inteiro;Inteiro;Lógico;Lógico;Inteiro;Inteiro;Número;Letras;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Cria o componente Slider dinamicamente.

Parâmetro(s):
1. Nome da Aba. (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura. (Inteiro)
5. Altura. (Inteiro)
6. Nome do Componente. (Letras)
7. Valor Inicial. (Inteiro, Opcional)
8. Valor Final. (Inteiro, Opcional). 
9. Posição Inicial. (Inteiro, Opcional)
10. Habilitar? (Lógico)
11. Visível? (Lógico)
12. Acessível (0 = Modo Inclusão/Alteração - 1 = Todos os Modos). (Inteiro)
13. Exibir Numeração (1 = Exibir - 0 = Ocultar). (Inteiro)
14. Precisão Decimal. (Número, Opcional)
15. Dica. (Letras)
16. Container. (Letras)
17. Estilo CSS. (Letras)
18. Classe CSS. (Letras)

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSliderNew (tab, posX, posY, width, height, name, startValue, endValue, posStart,
    enable, visible, accessible, showNumber, precisionDecimal, tips, compContainer, styleCss, classCss) {
      
      let code = getCodComponent();
      let component = new HTMLSlider(ebfGetSystemID(), ebfGetFormID(), code, posX, posY, width, height, "", "");
    
      component.zindex = 3;
      component.Categoria = 'Maker 3';
      component.Aba = tab;
      component.PosicaoX = posX;
      component.Posicaoy = posY;
      component.Tamanho = width;
      component.Altura = height;
      component.id = name;
      component.ValorInicio = (startValue != null && typeof startValue != "undefined") ? startValue : 0;
      component.ValorFim = (endValue != null && typeof endValue === "undefined") ? endValue : 100;
      component.ValorInicialMarcador = (posStart != null && typeof posStart != "undefined") ? posStart : 0;
      component.Habilitado = enable;
      component.Visivel = visible;
      component.Acessivel = accessible;
      component.ExibirNumeracao = showNumber;
      component.Precisao = (precisionDecimal != null && typeof precisionDecimal != "undefined") ? precisionDecimal: 0;
      component.Dica = tips;
      component.Container = compContainer;    
      component.styleCss = styleCss;
      component.classCss = classCss;  
    
    
      let container =  $mainform().d.t.getTabByName(tab);
      if (!container) {
        d.t.add(tab);
        container = $mainform().d.t.getTabByName(tab);
      } 
      if (compContainer) {   
        compContainer = document.getElementById(compContainer);
        component.design(compContainer, true);
      } else{ 
        component.design(container.div, true);  
      }  
    }
```

---

## Slider Panel - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSliderPanelNew` |
| **Código** | 910 |
| **Assinatura** | `Slider Panel - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Lógico;Lógico;Inteiro;Inteiro;Inteiro;Cor;Cor;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Lógico;Lógico;Inteiro;Inteiro;Inteiro;Cor;Cor;Letras;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função cria o componente SliderPanel dinamicamente.

Parâmetro(s):
1. Nome da Aba. (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Altura. (Inteiro)
5. Tamanho. (Inteiro)
6. Nome do Componente. (Letras)
7. Lista de Imagens. (Letras)
8. Visível? (Lógico)
9. Habilitar? (Lógico)
10. Acessível (0 = Modo Inclusão/Alteração - 1 = Todos os Modos). (Inteiro)
11. Tamanho da Fonte. (Inteiro)
12. Tempo. (Inteiro)
13. Cor da Fonte do Texto. (Cor)
14. Cor do Rodapé Ativo. (Cor)
15. Container. (Letras)
16. Estilo CSS. (Letras)
17. Classe CSS. (Letras)

Retorno:
Não possui.

Observações:
1. O 7º parâmetro é passado uma lista de lista, onde cada lista deverá possuir 3 parâmetros:
URL da imagem, Descrição da imagem e Link, sendo o primeiro parâmetro obrigatório. Se imagem estiver
no contexto do Webrun pode-se passar o caminho relativo da mesma.
2. O valor passado no 12º parâmetro é executado em milissegundos.

### Código Cliente (JavaScript)

```javascript
function ebfSliderPanelNew(tab, posX, posY, height, width, name, imageList, visible,
    enable, acessible, fontSize, time, fontColor, footerColor, compContainer, styleCss, classCss) {
  
      let code = getCodComponent();
      let component = new HTMLSliderPanel(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, "", "");
  
      /*Realiza o tratamento da lista de URL's passa por argumento*/     
      if (imageList instanceof Array) {
        let size =  imageList.length;
        let _JSON_URLs = {};
        var _JSON_Instance = {sliderpanel:{}};      
        for(var i=0; i < size; i++){      
          let currentList = imageList[i];        
          _JSON_URLs.path = currentList[0] === null ? "" : currentList[0];     
          _JSON_URLs.description = currentList[1] === null ? "" : currentList[1];        
          _JSON_URLs.link = currentList[2] === null ? "" : currentList[2];        
          _JSON_Instance.sliderpanel[i+1] = _JSON_URLs;
          _JSON_URLs = {} 
        }      
  
        _JSON_Instance = "JSONInstance(" + JSON.stringify(_JSON_Instance) + ")";
      }
      /*Fim*/
      
      component.id = name;
      component.zindex = 3;
  
      component.Aba = tab;
      component.Tamanho = width;
      component.Container = compContainer;
      component.Categoria = 'Maker 3';
      component.Habilitado = enable;
      component.Acessivel = acessible;
      component.Nome = name;
      component.Visivel = visible;
      component.CorFonteTexto = fontColor;
      component.CorRodapeAtivo = footerColor;
      component.TamanhoFonte = fontSize;
      component.TabelaImagem = _JSON_Instance;
      component.Tempo = time;
      component.Altura = height;
      component.PosicaoY = posX;
      component.PosicaoX = posY;    
      component.styleCss = styleCss;
      component.classCss = classCss;    
  
  
      let container = $mainform().d.t.getTabByName(tab);  
      if (!container) {
        d.t.add(tab);
        container = $mainform().d.t.getTabByName(tab);
      } 
      if (compContainer) {   
        compContainer = document.getElementById(compContainer);
        component.design(compContainer, true);
      } else{ 
        component.design(container.div, true);  
      }  
  }
```

---

## Texto Estático - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLabelNew` |
| **Código** | 469 |
| **Assinatura** | `Texto Estático - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Inteiro;Letras;Letras)` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Inteiro;Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Função que cria um novo componente Caixa de Texto dinamicamente.

Parâmetro(s):
1. Nome da Aba (Caso não seja definida, a aba será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura. (Inteiro)
5. Altura. (Inteiro)
6. Valor (Novo Texto). (Letras)
7. Nome do Componente. (Letras)
8. ZIndex. (Inteiro)
9. Container. (Letras)
10. Estilo CSS. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfLabelNew(aba, posX, posY, width, height, value, id, index, compContainer, styleCss){
  var code = getCodComponent();
  var component = new HTMLLabel(ebfGetSystemID(),ebfGetFormID(), code, posX, posY, width, height, value);
  component.wrap = true;
  component.id = id;
  component.zindex = index;
  component.loadComponentTime = 0;
  component.styleCss = styleCss;  
  if ($mainform().d) {
   var container = $mainform().d.t.getTabByName(aba);
   if(!container){   
    if(d) {
       d.t.add(aba);
       container = $mainform().d.t.getTabByName(aba);      
      }
   }
  if(compContainer){
    component.container = compContainer;
    compContainer = document.getElementById(compContainer);
    component.design(compContainer, true);
  }else{ 
     component.design(container.div, true);  
   }
   document['c_' + code] = component;  
  }
}
```

---

## Texto Longo - Novo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMemoNewComponent` |
| **Código** | 477 |
| **Assinatura** | `Texto Longo - Novo (Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Lógico;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Inteiro;Inteiro;Letras;Letras;Letras;Lógico;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Função que cria um novo componente Texto Longo dinamicamente.

Parâmetro(s):
1. Nome da Aba (caso ainda não exista, será criada). (Letras)
2. Posição X. (Inteiro)
3. Posição Y. (Inteiro)
4. Largura. (Inteiro)
5. Altura. (Inteiro)
6. Descrição. (Letras)
7. Valor inicial. (Letras)
8. Nome do componente. (Letras)
9. Quebra de Linha do valor inserido (Parâmetro 7). (Lógico)
10. Container. (Letras)
11. Estilo CSS. (Letras)
12. Classe CSS. (Letras)

Retorno:
Nome interno definido para o componente. (Variante)

Observações:
1. Caso o 8º Parâmetro não seja definido, será dado com a descrição (Parâmetro 6).
2. A função não vai ter retorno caso seja salva na camada servidor.

### Código Servidor (Java)

```java
protected final Variant ebfMemoNewComponent(Variant tabName, Variant posX, Variant posY, Variant width, Variant height, Variant description, Variant value, Variant id, Variant wrap) throws Exception {
  return callClientFunction("ebfMemoNewComponent", tabName, posX, posY, width, height, description, value, id, wrap);
}


protected final Variant ebfMemoNewComponent(Variant tabName, Variant posX, Variant posY, Variant width, Variant height, Variant description, Variant value, Variant id, Variant wrap, Variant compContainer, Variant styleCss, Variant classCss) throws Exception {
  return callClientFunction("ebfMemoNewComponent", tabName, posX, posY, width, height, description, value, id, wrap, compContainer, styleCss, classCss);
}

protected final Variant ebfMemoNewComponent(Variant tabName, Variant posX, Variant posY, Variant width, Variant height, Variant description, Variant value, Variant id, Variant wrap, Variant compContainer) throws Exception {
  return callClientFunction("ebfMemoNewComponent", tabName, posX, posY, width, height, description, value, id, wrap, compContainer);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfMemoNewComponent(tabName, posX, posY, width, height, description, value, id, wrap, compContainer, styleCss, classCss) {
    var code = getCodComponent();
    
    var component = new HTMLMemo(ebfGetSystemID(), ebfGetFormID(), code, posX, posY, width, height, description, value);
    component.id = (!isNullable(id) ? id : reduceVariable(description));
    component.wrap = !!wrap;
    component.zindex = 3;
    component.loadComponentTime = 0;
    component.styleCss = styleCss;  
    component.classCss = classCss;
    
    var tabDiv;
    var tab = $mainform().d.t.getTabByName(tabName);
    if (tab) {
      tabDiv = tab.div;
    } else {
      tabDiv = d.t.add(tabName);
    }
    
    d['c_' + code] = component;
    if(compContainer){
      component.container = compContainer;
      compContainer = document.getElementById(compContainer);
      component.design(compContainer, true);
    }else{ 
    component.design(tabDiv, true);   
    }
      
    setOrderTabDynamically(component);
    return component;
  }
```

---

## Timer - Criar Objeto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimerCreate` |
| **Código** | 935 |
| **Assinatura** | `Timer - Criar Objeto (Letras;Formulário;Componente): Variante` |
| **Parâmetros** | Letras;Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função cria um novo objeto Temporizador, recebe por parâmetro o nome do temporizador, que será usado nas funções de iniciar, pausar, parar e zerar. Recebe ainda, o Formulário e o componente do tipo caixa de texto no qual este temporizador será constantemente atualizado.

Parâmetro(s):
1. Nome do Temporizador. (Letras)
2. Formulário onde o componente a ser utilizado pelo Timer.
3. Componente. (Caixa de Texto)

Retorno:
Retorna a referência do timer. (Variante)

Observação:
Caso seja necessário utilizar as funções que manipulam componente, Exemplo: 'Mostrar Componente', deve-se utilizar o ID do componente informado nessa função.

Exemplo:
Neste exemplo, o edit com nome tempo do Formulário "Cadastro de Tempo" irá constantemente ser atualizado com o valor do temporizador criado:
1º Parâmetro: Temporizador (letras)
2º Parâmetro: Cadastro de Tempo
3º Parâmetro: Tempo.

### Código Cliente (JavaScript)

```javascript
function ebfTimerCreate(name, form, com) {
  let container = $c(com);  
  if (container) {
    let timer = new HTMLTimer(ebfGetSystemID(), form, getCodComponent(), container.posX, container.posY,
                  container.width, container.height, name);
    container.div.classList.add("d-none");
    timer.id = name;
    timer.parent = container;    
    timer.valorInicial = "00:00:00";     
    if (container.decorationChanged)
      timer.setDecoration(container.font, container.size, container.weight, container.italic,
         container.underline, container.strikeout, container.bgColor, container.color);
    timer.design(container.doc, false);
    timer.setVisible(container.visible);              
    return timer;               
  } else {
    interactionError(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", com));
  }  
}
```

---

## Timer - Iniciar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimerStart` |
| **Código** | 936 |
| **Assinatura** | `Timer - Iniciar (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Inicia a contagem no temporizador passado por parâmetro.

Parâmetro:
1. Nome do Temporizador. (Letras)

Retorno:
Não possui.

Observação:
O Temporizador deve ter sido criado anteriormente.

### Código Cliente (JavaScript)

```javascript
function ebfTimerStart(id){
  var timer = $c(id);
  if (timer) {
    timer.start();
  }
}
```

---

## Timer - Obter Horário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimerGetTime` |
| **Código** | 902 |
| **Assinatura** | `Timer - Obter Horário (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe como parâmetro o nome do componente Timer e o tipo de formatação que a função deve seguir no retorno do horário.

Parâmetro(s):
1. Nome do Componente Timer. (Letras)
2. Tipo de Retorno. (Letras, Opcional) (H=Horas, M=Minutos, S=Segundos)

Retorno:
Retorna o horário. (Variante)

Observação:
Caso o segundo parâmetro não seja definido, o retorno será o horário completo do Timer.

### Código Cliente (JavaScript)

```javascript
function ebfTimerGetTime(componentName, format) {
    let component = $c(componentName);
    let time = component.getTimerString();   
    switch (format){
        case 'H':
            time = time.substring(0, 2);
            break;
        case 'M':
            time = time.substring(3, 5);
            break;
        case 'S':
            time = time.substring(6);
            break;
    }
    return time;  
}
```

---

## Timer - Parar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimerStop` |
| **Código** | 937 |
| **Assinatura** | `Timer - Parar (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Para a contagem no temporizador passado por parâmetro.

Parâmetro:
1. Nome do Temporizador. (Letras)

Retorno:
Não possui.

Observação:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTimerStop(id){
  var timer = $c(id);
  if (timer) {
    timer.stop();
  }
}
```

---

## Timer - Pausar/Continuar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimerPause` |
| **Código** | 939 |
| **Assinatura** | `Timer - Pausar/Continuar (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Pausa ou Continua a contagem no temporizador passado por parâmetro.

Parâmetro:
1. Nome do Temporizador. (Letras)

Retorno:
Não possui.

Observação:
Caso o timer já esteja pausado e a função seja novamente chamada, o contador irá continuar de onde parou.

### Código Cliente (JavaScript)

```javascript
function ebfTimerPause(id){
  var timer = $c(id);
  if (timer) {
    timer.pause();
  }
}
```

---

## Timer - Reset

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimerReset` |
| **Código** | 938 |
| **Assinatura** | `Timer - Reset (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente |

### Descrição

Reinicia a contagem no temporizador passado por parâmetro.

Parâmetro:
1. Nome do Temporizador. (Letras)

Retorno:
Não possui.

Observação:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTimerReset(id){
  var timer = $c(id);
  if (timer) {
    timer.reset();
  }  
}
```

---

## Tornar Componente Acessível

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ComponenteEditavel` |
| **Código** | 419 |
| **Parâmetros** | Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função deixa o componente acessível, não importando o modo do formulário.

Parâmetro(s):
1. Componente.

Retorno: 
Não possui.

Exemplo:
Utilizando a função em um componente Texto Longo, o componente ficará em modo de edição, permitindo que a
barra de rolagem possa ser movida mesmo que o formulário esteja em modo de navegação.

### Código Servidor (Java)

```java
protected final Variant ComponenteEditavel(Variant component) throws Exception {
  return callClientFunction("ComponenteEditavel", component);
}
```

### Código Cliente (JavaScript)

```javascript
function ComponenteEditavel(componente) {
  $c(componente).div.style.zIndex = 100000
}
```

---

## Transforma Memo em Texto Rico Avançado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConvertRichText` |
| **Código** | 300 |
| **Assinatura** | `Transforma Memo em Texto Rico Avançado (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Recebe um componente Memo e transforma em Texto Rico Avançado.

Parâmetro(s):
1. Formulário onde está localizado o componente Memo.
2. Componente Memo.

Retorno:
Não possui.

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfConvertRichText(Variant form, Variant componentName) throws Exception {
  return callClientFunction("ebfConvertRichText", form, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfConvertRichText(form, componentName) {
  var component = $c(componentName, form);
  if ((component instanceof HTMLMemo) && (!component.isRichText())) {
    component.richText = 2;    
    component.richTextLoad();
  }
}
```

---

## Transforma Memo em Texto Rico Básico

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMemoToBasicRichText` |
| **Código** | 448 |
| **Assinatura** | `Transforma Memo em Texto Rico Básico (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 18 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Recebe um componente Memo e transforma em Texto Rico Básico.

Parâmetro(s):
1. Formulário onde está localizado o componente Memo.
2. Componente Memo.

Retorno:
Não possui.

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfMemoToBasicRichText(Variant form, Variant componentName) throws Exception {
  return callClientFunction("ebfMemoToBasicRichText", form, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfMemoToBasicRichText(form, componentName) {
  var component = $c(componentName, form);
  if ((component instanceof HTMLMemo) && (!component.isRichText())) {
    component.richText = 1;    
    component.richTextLoad();
  }
}
```

---

# Funções Nativas - XML

Total: **22** funções

[← Voltar para Funções Nativas](README.md)

---

## XML - Abrir XML

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLOpen` |
| **Código** | 11 |
| **Assinatura** | `XML - Abrir XML (Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função cria um objeto XML passando como parâmetro o texto no formato em XML e atribui o objeto criado a uma
variável do tipo Variante.

Parâmetro(s):
1. Texto em XML. (Letras)
2. Charset. (Letras, Opcional) (Servidor)

Retorno: 
Objeto XML. (Variante)

Observação:
No 2º Parâmetro, deverá ser informado o charset do arquivo. Caso não seja passado o charset, a função adotará o charset corrente do Webrun.

Exemplos: 
1. Assumindo o 1º parâmetro sendo: 
        <?xml version="1.0" encoding="ISO-8859-1"?>
          <CURSO>
               <DISCIPLINA>
                   <OBJETIVO>
                        Ensinar XML
                   </OBJETIVO>
                   <METODOLOGIA>
                         Laboratório
                   </METODOLOGIA>
                   <AVALIACAO>
                         3 provas
                   </AVALIACAO>
               </DISCIPLINA>
          </CURSO>
    O retorno será a criação do objeto XML.
2. Exemplos de Charset: UTF-8, ISO-8859-1.

### Código Servidor (Java)

```java
protected final Variant ebfXMLOpen(Variant xml) throws Exception {
    try {
      SAXBuilder builder = new SAXBuilder();
      return new Variant(builder.build(new ByteArrayInputStream((xml.getString().getBytes()))));
    } catch (Exception e) {
      logger.info(WFRSystem.DEFAULT_USER, this.getSystem().getCode(), "Erro na abertura do XML: " + xml.getString(), "Erro: " + e.toString());    
      throw e;
    }
  }  

protected final Variant ebfXMLOpen(Variant xml, Variant charset) throws Exception {
    try {    
      SAXBuilder builder = new SAXBuilder(); 
      
      if ((charset == Variant.VARIANT_NULL) || (charset != Variant.VARIANT_NULL && charset.getString().equals(""))){
        return new Variant(builder.build(new ByteArrayInputStream((xml.getString().getBytes(Settings.CHARSET)))));        
      }else{      
        return new Variant(builder.build(new ByteArrayInputStream((xml.getString().getBytes(charset.getString())))));
      }
    } catch (Exception e) {
      logger.info(WFRSystem.DEFAULT_USER, this.getSystem().getCode(), "Erro na abertura do XML: " + xml.getString(), "Erro: " + e.toString());    
      throw e;
    }
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLOpen(XMLText) {
  var doc = null;
  if (document.implementation && document.implementation.createDocument) {//Mozzila
   var domParser = new DOMParser();
   doc = domParser.parseFromString(XMLText, 'application/xml');
   fixXMLDocument(doc);
   return doc;
  }
  else {//IE
    doc = new ActiveXObject("MSXML2.DOMDocument");
    doc.loadXML(XMLText);
  }
  return doc;
};
```

---

## XML - Abrir XML de um Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLOpenFromFile` |
| **Código** | 80 |
| **Assinatura** | `XML - Abrir XML de um Arquivo (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre um arquivo XML para um arquivo variável.

Parâmetro:
1. Caminho da onde se encontra o arquivo XML. (Variante)

Retorno: 
Variante contendo o XML do arquivo.

Observação:
A linguagem XML é definida como o formato universal para dados estruturados na Web. Para saber mais sobre o assunto, pesquise em um site de busca sobre (XML) ou (Extensible Markup Language).

Exemplo:
Assumindo o 1º parâmetro sendo: 
        C:\Pasta\Arquivo.xml
Retorna a referência para o arquivo passado.

### Código Servidor (Java)

```java
protected final Variant ebfXMLOpenFromFile(Variant file) throws Exception {
  SAXBuilder builder = new SAXBuilder();
  if (file.getObject() instanceof String) {
    return new Variant(builder.build(new File((Functions.getDirectory(getSystem(), file.getString())))));
  } else {
    return new Variant(builder.build((FileInputStream) file.toObject()));
  }
}
```

---

## XML - Adicionar Elemento Filho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLAddChildElement` |
| **Código** | 564 |
| **Assinatura** | `XML - Adicionar Elemento Filho(Variante;Variante;Variante): Variante` |
| **Parâmetros** | Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Adiciona um elemento como filho do nó informado.

Parâmetro(s):
1. Elemento principal. (Variante)
2. Elemento filho. (Variante)
3. Valor do elemento filho. (Variante)

Retorno:
Elemento com o filho adicionado. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfXMLAddChildElement(Variant elemVariant, Variant tagName, Variant value) throws Exception {
    Element element = (Element) elemVariant.getObject();
    Element child = new Element(tagName.toString());
    child.setText(value.toString());
    element.addContent(child);
    return VariantPool.get(child);
  }
```

---

## XML - Alterar o Valor de um Atributo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLSetElementAttributeValue` |
| **Código** | 84 |
| **Assinatura** | `XML - Alterar o Valor de um Atributo (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Letras |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função altera um valor de um atributo em um documento XML (Existem dois tipos de informação que podem aparecer 
em um documento XML: elementos e atributos. Elementos são as informações que são representadas entre as tags e 
atributos são informações adicionais que são acrescentadas a uma tag.).

Parâmetro(s):
1. Objeto XML. (Variante)
2. Atributo. (Letras)
3. Valor a ser modificado. (Letras)

Exemplo:
Se o Elemento é ?<TEXTO>Maker  Complemento=?MakerFlow?</TEXTO>?  e o Atributo é ?Complemento=?MakerFlow? ?, então o valor do atributo é   .

### Código Servidor (Java)

```java
protected final Variant ebfXMLSetElementAttributeValue(Variant elemVariant, Variant attribute, Variant value) throws Exception {
    Element element = (Element) elemVariant.getObject();
    if (element != null) {
      element.setAttribute(attribute.toString(), value.toString());
    }
    return Variant.VARIANT_NULL;
  }
```

---

## XML - Alterar o Valor de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLSetElementValue` |
| **Código** | 83 |
| **Assinatura** | `XML - Alterar o Valor de um Elemento (Variante;Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Alterar o valor de um elemento em um documento XML (Existem dois tipos de informação que podem aparecer em um
documento XML: elementos e atributos. Elementos são as informações que são representadas entre as tags e atributos
são informações adicionais que são acrescentadas a uma tag.).

Parâmetro(s):
1. Elemento do XML. (Variante)
2. Valor a ser modificado. (Variante)

Retorno:
Não possui.

Exemplo:
Se o Elemento é <TEXTO>MakerFlow</TEXTO> , então o valor do elemento é MakerFlow.

### Código Servidor (Java)

```java
protected final Variant ebfXMLSetElementValue(Variant elemVariant, Variant value) throws Exception {
    Element element = (Element) elemVariant.getObject();
    if (element != null) {
      element.setText(value.toString());
    }
    return Variant.VARIANT_NULL;
  }
```

---

## XML - Clonar Nó

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLCloneNode` |
| **Código** | 1124 |
| **Assinatura** | `XML - Clonar Nó (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função clona um nó passado como parâmetro. Este nó clonado é recursivo.

Parâmetro:
1. Referência do Nó. (Variante)

Retorno:
Nó clonado. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfXMLCloneNode(Variant node) throws Exception {
    Element element = (Element)node.getObject();
    return new Variant(element.clone());
  }
```

---

## XML - Elemento para XML

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetElementAsXML` |
| **Código** | 1123 |
| **Assinatura** | `XML - Elemento para XML (Variante;Lógico;Lógico): Letras` |
| **Parâmetros** | Variante;Lógico;Lógico |
| **Retorno** | Letras |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o elemento de uma determinada raiz de um documento XML.

Parâmetro(s):
1. Raiz do XML. (Variante)
2. Formatar? (Lógico)
3. Escapar caracteres especiais? (Lógico)

Retorno:
Elemento da Raiz. (Letras)

Observações: 
1. Ao definir o segundo parâmetro como true, o conteúdo XML será indentado.
2. Ao definir o terceiro parâmetro como true, caracteres especiais como ç, ã, ó, ê, etc no conteúdo do XML serão escapados.

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetElementAsXML(Variant elemVariant) throws Exception {
    return ebfXMLGetElementAsXML(elemVariant, new Variant(false));
  }

  protected final Variant ebfXMLGetElementAsXML(Variant elemVariant, Variant formatVariant) throws Exception {
    return ebfXMLGetElementAsXML(elemVariant, formatVariant, new Variant(false));
  }

  protected final static Variant ebfXMLGetElementAsXML(Variant elemVariant, Variant formatVariant, Variant escapeVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    boolean escape = escapeVariant.getBoolean();

    Element element = (Element) elemVariant.getObject();
    XMLOutputter xmlOut = null;
    org.jdom2.output.Format format = null;

    EscapeStrategy escapeStrategy = ch -> {
      return ch < 32 || ch > 126;
    };

    if (element != null) {
      if (formatVariant.getBoolean()) {
        format = org.jdom2.output.Format.getPrettyFormat();
        if (escape)
          format.setEscapeStrategy(escapeStrategy);

        xmlOut = new XMLOutputter(format);
      } else {
        format = org.jdom2.output.Format.getRawFormat();
        if (escape)
          format.setEscapeStrategy(escapeStrategy);

        xmlOut = new XMLOutputter(format);
      }

      value = VariantPool.get(xmlOut.outputString(element));
    }

    return value;
  }
```

---

## XML - Inserir Nó

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLInsertInto` |
| **Código** | 1122 |
| **Assinatura** | `XML - Inserir Nó (Variante;Variante;Variante): Variante` |
| **Parâmetros** | Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função insere o nó passado no 2º parâmetro da função no XML passado no 1º parâmetro. Adicionalmente, caso um
nó referência seja definido no terceiro parâmetro, o nó do 2º parâmetro será inserido antes do nó do 3º parâmetro, caso
contrário, o nó será inserido no fim do XML.

Parâmetro(s):
1. Objeto XML. (Raiz ou Nó) (Variante)
2. Nó a inserir. (Variante)
3. Referência para Inserir. (Variante, Opcional)

Retorno:
Objeto XML atualizado (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfXMLInsertInto(Variant xml, Variant nodeToInsert, Variant beforeNode) throws Exception {
    Element mainNode = (Element) xml.getObject();
    Element newNode = (Element) nodeToInsert.getObject();
    Element beforeRef = (Element) beforeNode.getObject();
    newNode.detach();
    if(beforeRef != null) {
      return new Variant(mainNode.addContent(mainNode.indexOf(beforeRef), newNode));
    }  

    return new Variant(mainNode.addContent(newNode));
  }
```

---

## XML - Listar Atributos de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLListAttributes` |
| **Código** | 1121 |
| **Assinatura** | `XML - Listar Atributos de um Elemento (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém todos os atributos (caso exista) no nó passado como parâmetro.

Parâmetro:
1. Nó XML. (Variante)

Retorno:
Lista com o nome dos Atributos do nó. (Variante)

Observação:
É recomendada sua utilização após a função Filhos de um elemento XML.

### Código Servidor (Java)

```java
protected final Variant ebfXMLListAttributes(Variant elemVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    List<Attribute> attributes = ((Element) elemVariant.getObject()).getAttributes();
    if (attributes != null && attributes.size() > 0) {
      List list = new ArrayList(attributes.size());
      for (Attribute attribute : attributes) {
        list.add(attribute.getName());
      }
      value = new Variant(list);
    }

    return value;
  }
```

---

## XML - Obter Atributo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetAttribute` |
| **Código** | 14 |
| **Assinatura** | `XML - Obter Atributo (Variante;Letras): Letras` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o atributo do Elemento XML informado (Atributos são informações adicionais que são acrescentadas a uma tag (delimitadores)).

Parâmetro(s):
1. Objeto XML. (Variante)
2. Nome do Atributo. (Letras)

Retorno: 
Atributo do Elemento XML. (Letras)

Exemplo:
Se tivermos então um elemento XML: 
  <?xml version="1.0"?>
    <aviso date="25/10/2007">
      <para>Janice</para>
      <de>Jefferson</de>
      <cabecalho>Lembre-se</cabecalho>
      <corpo>Lançamento do oficial do Maker</corpo>
    </aviso>
e obtemos o atributo "date" o retorno será "25/10/2007".

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetAttribute(Variant elemVariant, Variant attVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Element element = (Element) elemVariant.getObject();
    if (element != null) {
      String temp = element.getAttributeValue(attVariant.getString());
      if (temp != null) {
        value = new Variant(temp);
      }
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetAttribute(node, attribute) {
  return node.getAttribute(attribute);
}
```

---

## XML - Obter Filho de Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetChildElement` |
| **Código** | 1157 |
| **Assinatura** | `XML - Obter Filho de Elemento (Variante;Letras;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna o primeiro elemento do Objeto XML passado por parâmetro.

Parâmetro(s):
1. Objeto XML. (Variante)
2. Nome do Elemento. (Letras)
3. NameSpace. (Letras, Opcional)

Retorno:
Retorna a referência do elemento passado como parâmetro. (Variante)

Exemplos:
1. Tendo um XML onde o nome do elemento a ser obtido é "SQL"
<TEXTO>	
  <SQL>Sequel</SQL>	   
  <MAKER>Flow</MAKER>
  <SQL>Sequel2</SQL>
</TEXTO> 
Então o retorno seria a referência para o primeiro elemento "SQL".
2. Tendo um XML onde o nome do elemento a ser obtido é "MAKER" onde o mesmo possui o NameSpace "flow"
<TEXTO>	
  <SQL>Sequel</SQL>	   
  <MAKER xmlns="flow">Flow</MAKER>
  <SQL>Sequel2</SQL>
</TEXTO> 
Então o retorno seria a referência para o primeiro elemento "MAKER".

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetChildElement(Variant elemVariant, Variant nodeVariant) throws Exception {
    return ebfXMLGetChildElement(elemVariant, nodeVariant, Variant.VARIANT_NULL);
}

protected final Variant ebfXMLGetChildElement(Variant elemVariant, Variant nodeVariant, Variant nodeNamespaceVariant) throws Exception {
  Variant childElement = Variant.VARIANT_NULL;
  if (elemVariant.getObject() instanceof Element) {
    Element element = (Element) elemVariant.getObject();
    String node = nodeVariant.getString();
    String nodeNamespace = nodeNamespaceVariant.getString();

    if (nodeNamespace.isEmpty())
      childElement = new Variant(element.getChild(node, element.getNamespace()));
    else
      childElement = new Variant(element.getChild(node, org.jdom2.Namespace.getNamespace(node, nodeNamespace)));
  }

  return childElement;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetChildElement(node, childName) {
  var c = node.getElementsByTagName(childName);
  if (c.length > 0) 
   return c[0];
}
```

---

## XML - Obter Filhos de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetChildrenElement` |
| **Código** | 1118 |
| **Assinatura** | `XML - Obter Filhos de um Elemento (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém todos os filhos de um determinado Elemento XML informado. Os Filhos do elemento no caso seria então os subelementos do elemento.

Parâmetro(s):
1. Objeto XML. (Raiz, Nó, etc.) (Variante)
2. Nome do Elemento. (Letras, Opcional)

Retorno: 
A variável de Retorno deverá ser do tipo Variante.

Exemplo:
Tendo um XML onde o elemento é 
    "<TEXTO>	
      <SQL>Sequel</SQL>	   
      <MAKER>Flow</MAKER>	 
    </TEXTO>"
 Então o retorno seria o que estivesse dentro do nó "<TEXTO>", no caso,  "<SQL>" e "<MAKER>".

Observação:
1. Essa função não funciona quando o elemento possui namespace.

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetChildrenElement(Variant variant, Variant nodeVariant) throws Exception {
  Variant children = Variant.VARIANT_NULL;
  Element element = (Element) variant.getObject();
  if (element != null) {
    String node = nodeVariant.getString();
    if (nodeVariant.getType() == WFRRuleType.NULL || node == null || node.trim().equals("")) {
      children = new Variant(element.getChildren());
    } else {
      XPathFactory xpathFactory = XPathFactory.instance();
      XPathExpression<Object> xpathExpr = xpathFactory.compile(node);
      children = new Variant(xpathExpr.evaluate(element));
    }
  }

  return children;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetChildrenElement(node, childName) {
  if (childName) {
    return node.getElementsByTagName(childName);
  }
  else {
    return node.childNodes;  
  }
}
```

---

## XML - Obter Filhos de um Elemento Com Namespace

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetChildrenElementWithNameSpace` |
| **Código** | 1185 |
| **Assinatura** | `XML - Obter Filhos de um Elemento Com Namespace (Variante;Letras;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém todos os filhos de um determinado Elemento XML informado. Os Filhos do elemento no caso seria então os subelementos do elemento.

Parâmetro(s):
1. Objeto XML. (Raiz, Nó, etc.) (Variante)
2. Nome do Elemento. (Letras, Opcional)
3. Namespace (Letras) (Observação 1)

Retorno: 
A variável de Retorno deverá ser do tipo Variante.

Observação:
1. Caso a segundo parâmetro seja informado é necessário informar o namespace do elemento.

Exemplo:
Assumindo como parâmetros:

1.<?xml version="1.0" encoding="UTF-8"?>
<RootElement xmlns="http://www.exemplo.com/ns1"
             xmlns:ns2="http://www.exemplo.com/ns2">

    <ChildElement id="1">
        <Nome>Produto A</Nome>
        <Preco moeda="BRL">100.00</Preco>
    </ChildElement>

    <ns2:ChildElement id="2">
        <Nome>Produto B</Nome>
        <Descricao>Item importado</Descricao>
    </ns2:ChildElement>

    <ChildElement id="3">
        <Nome>Produto C</Nome>
        <Preco moeda="USD">50.00</Preco>
        <ns2:Observacao>Entrega rápida</ns2:Observacao>
    </ChildElement>

</RootElement>

2. ChildElement

3. http://www.exemplo.com/ns2

 Então o retorno seria a referência para o  nó:
<ns2:ChildElement id="2">
    <Nome>Produto B</Nome>
    <Descricao>Item importado</Descricao>
</ns2:ChildElement>

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetChildrenElementWithNameSpace(
    Variant elemVariant,
    Variant nodeVariant,
    Variant nodeNamespaceVariant) throws Exception {

  List<Element> children = Collections.emptyList();

  Object obj = elemVariant.getObject();
  if (obj instanceof Element) {
    Element element = (Element) obj;
    String child = nodeVariant.getString();
    String nameSpace = nodeNamespaceVariant.getString();
    if (child.trim().isEmpty()) {
      children = element.getChildren();
    } else if (!nameSpace.trim().isEmpty()) {
      Namespace ns = Namespace.getNamespace(nameSpace);
      children = element.getChildren(child, ns);
    }
  }

  return new Variant(children);
}
```

---

## XML - Obter Raiz

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetRoot` |
| **Código** | 13 |
| **Assinatura** | `XML - Obter Raiz (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém um elemento raiz de um XML. (O Elemento raiz seria o elemento pai de um arquivo XML)

Parâmetro:
1. Objeto XML. (Variante)

Retorno:
Referência da Raiz do XML. (Variante)

Exemplo: 
Se tivermos o XML:
      "<?xml version="1.0" encoding="ISO-8859-1"?>
      <software>
        <titulo>Maker</titulo>
        <direitos>SOFTWELL</direitos>
        <ano>2007</ano>
      </software>"
 Então o retorno será: "<software>".

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetRoot(Variant variant) throws Exception {
    Variant rootVar = Variant.VARIANT_NULL;
    Document doc = (Document) variant.getObject();
    if (doc != null) {
      Element root = doc.getRootElement();
      rootVar = new Variant(root);
    }
    return rootVar;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetRoot(doc) {
  if (doc) return doc.documentElement;
}
```

---

## XML - Obter XML do menu

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetXmlMenu` |
| **Código** | 1014 |
| **Assinatura** | `XML - Obter XML do menu (Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função retorna o XML do menu.

Parâmetro(s):
1. Formulário.
2. Componente.

Retorno:
Conteúdo do menu em formato XML. (Variante)

Exemplo:
Assumindo como formulário, ?Template - Formulário Principal? e o componente com sendo ?Menu?, será retornado o XML do menu do Formulário Principal.

### Código Servidor (Java)

```java
protected final Variant ebfGetXmlMenu(Variant form, Variant component) throws Exception {
  WFRForm frm = this.client.getSystem().getFormByGuid(form.getString());
  WFRComponent cpmt = frm.getComponentByName(component.getString());
  String xml = cpmt.getComponentProperties().getString("XMLMenu");

  return VariantPool.get(ebfURLDecoder(ebfBase64ToString(ebfBytesToBase64(ebfZLIBInflate(ebfBase64ToBinary(VariantPool.get(xml))))), Variant.VARIANT_NULL));
}
```

---

## XML - Obter o Nome de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetElementTagName` |
| **Código** | 35 |
| **Assinatura** | `XML - Obter o Nome de um Elemento (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o nome de um elemento XML.

Parâmetro:
1. Objeto XML. (Variante)

Retorno:
Nome do Elemento. (Letras)

Exemplo:
Se temos
        "<TEXTO>
               Maker Flow  Versão = 3.0 
         </TEXTO>"
o retorno será: "TEXTO".

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetElementTagName(Variant elemVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Element element = (Element) elemVariant.getObject();
    if (element != null) {
      value = new Variant(element.getName());
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetElementTagName(node) {
  return node.tagName;
}
```

---

## XML - Obter o Pai de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetParentElement` |
| **Código** | 38 |
| **Assinatura** | `XML - Obter o Pai de um Elemento (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o Elemento acima do subelemento.

Parâmetro:
1. Objeto XML. (Nó, Elemento, etc.) (Variante)

Retorno:
Elemento pai. (Variante)

Exemplo:
Tendo uma XML onde o subelemento é  "<MAKER>Flow</MAKER>" e acima dele há um elemento pai
   "<TEXTO>		   
	   <MAKER>Flow</MAKER>	
    </TEXTO>"
 então o seu elemento pai é "<TEXTO>".

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetParentElement(Variant elemVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Element element = (Element) elemVariant.getObject();
    if (element != null) {
      Element parent = (Element) element.getParent();
      if (parent != null) {
        value = new Variant(parent);
      }
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetParentElement(node) {
  return node.parentNode
}
```

---

## XML - Obter o valor de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLGetElementValue` |
| **Código** | 21 |
| **Assinatura** | `XML - Obter o valor de um Elemento (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém todo o conteúdo e todos os subelementos que estão dentro do Elemento.

Parâmetro:
1. Objeto XML. (Nó do elemento)

Retorno:
Valor do Elemento. (Variante)

Exemplo:
Se temos:
    "<TEXTO>
            Maker Flow	
            <SQL>Sequel</SQL>	    
            <MAKER>Flow</MAKER>	
    </TEXTO>"
 então o retorno será:
 "Maker Flow , <SQL>Sequel</SQL> e <MAKER>Flow</MAKER>".

### Código Servidor (Java)

```java
protected final Variant ebfXMLGetElementValue(Variant elemVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Element element = (Element) elemVariant.getObject();
    if (element != null) {
      value = new Variant(element.getText());
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLGetElementValue(node) {
  if (node && node.firstChild)
    return node.firstChild.nodeValue;
  else
    return null;
}
```

---

## XML - Remover Nó

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLRemoveNode` |
| **Código** | 1120 |
| **Assinatura** | `XML - Remover Nó (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Remove o nó filho de um elemento pai passado como parâmetro. 

Parâmetro(s):
1. Nó Pai. (Variante)
2. Nó filho a ser removido. (Variante)

Retorno:
Retorna verdadeiro se o filho foi removido com sucesso. Caso contrário, será retornado o valor falso. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfXMLRemoveNode(Variant xml, Variant node) throws Exception {
    Element mainNode = (Element) xml.getObject();
    Element removeNode = (Element) node.getObject();  
    if(removeNode != null) {
      return new Variant(mainNode.removeContent(removeNode));
    }  

    return new Variant(Boolean.FALSE);
  }
```

---

## XML - Validar Schema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfValidateXML` |
| **Código** | 479 |
| **Assinatura** | `XML - Validar Schema (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Valida se o XML está de acordo com o XSD Schema informado. 

Parâmetro(s):
1. XML a ser verificado. (Letras)
2. XSD Schema. (Letras)

Retorno: 
Caso o XML esteja no padrão definido pelo XSD o retorno será 'True', 'False' caso contrário. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfValidateXML(Variant xmlSource, Variant xsdSchema){
    
    java.io.File fileXSD = null;
    java.io.File fileXML = null;
    
    try{  
      fileXSD = Functions.generateTempFile("XSD_", null);
      Functions.saveBytesToFile(xsdSchema.getString().getBytes(), fileXSD);
      
      fileXML = Functions.generateTempFile("XML_", null);
      Functions.saveBytesToFile(xmlSource.getString().getBytes(), fileXML);
      
      javax.xml.parsers.DocumentBuilder parser = javax.xml.parsers.DocumentBuilderFactory.newInstance().newDocumentBuilder();
      org.w3c.dom.Document document = parser.parse(fileXML);

      javax.xml.validation.SchemaFactory factory = javax.xml.validation.SchemaFactory.newInstance(javax.xml.XMLConstants.W3C_XML_SCHEMA_NS_URI);

      javax.xml.transform.Source schemaFile = new javax.xml.transform.stream.StreamSource(fileXSD);
      javax.xml.validation.Schema schema = factory.newSchema(schemaFile);

      javax.xml.validation.Validator validator = schema.newValidator();

      validator.validate(new javax.xml.transform.dom.DOMSource(document));
      
      return Variant.VARIANT_TRUE;
    } catch (Exception ex){ 
      return Variant.VARIANT_FALSE;
    } finally {
      if (fileXSD.exists()) {
        fileXSD.delete();  
      }
      if (fileXML.exists()) {
        fileXML.delete();  
      }  
    }
 }
```

---

## XML para JSON

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXMLToJSON` |
| **Código** | 950 |
| **Assinatura** | `XML para JSON (Letras;Lógico): Letras` |
| **Parâmetros** | Letras;Lógico |
| **Retorno** | Letras |
| **Tipo** | Formulário |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Converte uma texto no padrão XML para o padrão JSON texto.

Parâmetro:
1. Texto XML. (Letras)
2. Manter Letras? (Opcional) (Lógico) (Obervação 1)

Retorno:
JSON texto. (Letras)

Exemplo: 
Assumindo como parâmetro o texto "<Softwell><IDE>Maker</IDE><Framework>Webrun</Framework></Softwell>" o retorno será o texto JSON 
"{"Softwell":{"IDE":"Maker", "Framework":"Webrun"}}".

Observação:
1. Se verdadeiro, os valores não serão convertidos em valores lógicos ou numéricos e, em vez disso, serão deixados como letras.

### Código Servidor (Java)

```java
protected final Variant ebfXMLToJSON (Variant xml, Variant keepStrings) throws Exception {
  if (xml != null) 
    return VariantPool.get(wfr.util.Functions.xmlToJson(xml.getString(), keepStrings.getBoolean()));
  return xml;    
}
```

### Código Cliente (JavaScript)

```javascript
function ebfXMLToJSON(xml) {
  if (xml != null && typeof xml === "string") {
    //Converte a string em objeto
    var parse = new DOMParser()
    xml = parse.parseFromString (xml, 'text/xml');
    // Create the return object
    var obj = {};

    if (xml.nodeType == 1) { // element
      // do attributes
      if (xml.attributes.length > 0) {
        obj["@attributes"] = {};
        for (var j = 0; j < xml.attributes.length; j++) {
          var attribute = xml.attributes.item(j);
          obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
        }
      }
    } else if (xml.nodeType == 3) { // text
      obj = xml.nodeValue;
    }

    // do children
    if (xml.hasChildNodes()) {
      for (var i = 0; i < xml.childNodes.length; i++) {
        var item = xml.childNodes.item(i);
        var nodeName = item.nodeName;
        if (typeof (obj[nodeName]) == "undefined") {
          obj[nodeName] = ebfXMLToJSON(item);
        } else {
          if (typeof (obj[nodeName].length) == "undefined") {
            var old = obj[nodeName];
            obj[nodeName] = [];
            obj[nodeName].push(old);
          }
          obj[nodeName].push(ebfXMLToJSON(item));
        }
      }
    }
    return obj;
  }
};
```

---

## XPath - Obter Nós

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXpathCompile` |
| **Código** | 1119 |
| **Assinatura** | `XPath - Obter Nós (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | Formulário |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém o nó com o filtro/expressão indicado.

Parâmetro(s):
1. XML. (Variante)
2. Caminho do nó a obter com o filtro/expressão.

Retorno:
Uma lista com todos os elementos (XML) encontrados com o filtro indicado (Variante)

Exemplo:
<?xml version="1.0" encoding="iso-8859-1" standalone="yes"?>
<clientes>
  <cliente id="1" tipoPessoa="F">
    <nome>Eliezer Rodrigues</nome>
  </cliente>
  <cliente id="2" tipoPessoa="J">
    <nome>Empresa Abz teste</nome>
  </cliente>
  <cliente id="3" tipoPessoa="F">
    <nome>Maria da Silva</nome>
  </cliente>
</clientes>

No 1º parâmetro é informado a raiz do XML acima e no 2º parâmetro é informado o nó cliente junto com o filtro '//clientes/cliente[@tipoPessoa = 'F']'.
No exemplo acima, o retorno é uma lista com dois elementos e em cada elemento da lista contém a referência do respectivo nó XML.

Em um exemplo mais complexo temos o seguinte XML:
<?xml version="1.0" encoding="iso-8859-1" standalone="yes"?>
<clientes xmlns="http://www.softwell.com.br">
  <cliente id="1" tipoPessoa="F">
    <nome>Eliezer Rodrigues</nome>
  </cliente>
  <cliente id="2" tipoPessoa="J">
    <nome>Empresa Abz teste</nome>
  </cliente>
  <cliente id="3" tipoPessoa="F">
    <nome>Maria da Silva</nome>
  </cliente>
</clientes>

Note que nesse exemplo temos um namespace definido na raiz do XML, sendo assim a expressão(filtro) do exemplo anterior não serviria nesse caso.
Para o exemplo em questão temos duas formas de chegar no mesmo valor:
1. Montar a expressão validando o namespace que foi definido:
  Expressão: /*[name()='clientes' and namespace-uri()='http://www.softwell.com.br']/*[name()='cliente' and @tipoPessoa='F']

2. Montar a expressão ignorando o namespace:
  Expressão: /*[name()='clientes']/*[name()='cliente' and @tipoPessoa='F']

Ambas as expressões foram montadas a partir da documentação de syntax do XPath no link a seguir:
  https://www.w3schools.com/xml/xpath_syntax.asp

### Código Servidor (Java)

```java
protected final Variant ebfXpathCompile(Variant xml, Variant path) throws Exception {
    XPathFactory xPathFactory = XPathFactory.instance();
    XPathExpression<Element> xpath = xPathFactory.compile(path.getString(), Filters.element());
    List<Element> elements = xpath.evaluate(xml.getObject());
    return new Variant(elements);
  }
```

---

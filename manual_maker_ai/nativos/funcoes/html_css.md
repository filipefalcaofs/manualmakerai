# Funções Nativas - HTML/CSS

Total: **45** funções

[← Voltar para Funções Nativas](README.md)

---

## CSS - Adicionar Classe

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCssAddClass` |
| **Código** | 1040 |
| **Assinatura** | `CSS - Adicionar Classe (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função adiciona uma classe CSS de um elemento passado por parâmetro.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Nome da classe CSS a ser adicionada ao elemento. (Letras)

Retorno:
Não possui.

Exemplo:
Assumindo como exemplo que o elemento passado como referência sendo um botão e a classe a CSS a ser adicionada como 'btn-primary'.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCssAddClass(element, className) {
  if (element && className) {
    element.classList.add(className);
  }
}
```

---

## CSS - Definir Propriedade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCssDefineStyle` |
| **Código** | 633 |
| **Assinatura** | `CSS - Definir Propriedade (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define uma propriedade CSS em um elemento passado por parâmetro.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Nome da propriedade de estilo. (Letras)
3. Novo valor da propriedade. (Letras)

Retorno:
Não possui.

Observação:
O nome da propriedade de estilo deve seguir o padrão DOM Style. Uma lista de exemplo pode ser visto em:
"http://goo.gl/PGSe".

Exemplo:
Suponhamos que queremos definir a propriedade de estilo "vertical-align: middle". O nome da propriedade de acordo
com o padrão DOM Style seria: verticalAlign.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCssDefineStyle(element, propertyName, propertyValue) {
  if (element && propertyName) {  
    eval("element.style." + propertyName + " = \"" + propertyValue + "\"");
  } 
}
```

---

## CSS - Importar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfImportCSSFile` |
| **Código** | 1017 |
| **Assinatura** | `CSS - Importar Arquivo (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função importa uma lista de arquivos CSS a tag head.

Parâmetro:
1. Lista contendo os caminhos dos arquivos CSS. (Variante)

Retorno:
Não possui.

Observação:
Os caminhos dos arquivos passados na lista devem ser referentes ao contexto.

Exemplo:
Assumindo a lista de caminhos como sendo [assets/style1.css, assets/style1.css ] será adicionado os arquivos CSS.

### Código Cliente (JavaScript)

```javascript
function ebfImportCSSFile(path){
    for (let index = 0; index < path.length; index++) {
      let element = document.createElement("link");
      element.setAttribute("rel", "stylesheet");
      element.setAttribute("type", "text/css")
      element.setAttribute("href", path[index])
      document.head.appendChild(element)
    }
  }
```

---

## CSS - Importar Conteúdo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCSSImportContent` |
| **Código** | 397 |
| **Assinatura** | `CSS - Importar Conteúdo (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função importa uma folha de estilo e anexa ao formulário. 

Parâmetro(s): 
1. Conteúdo da folha de estilo no padrão CSS. (Letras)
2. ID para o CSS a ser importado (Letras, Opcional)

Retorno: 
Não possui.

Observação:
Para aplicar a folha de estilo a um componente utilize #NomeDoComponente. Para importar a uma 
classe, utilize .NomeDaClasse

Exemplo:
Assumindo o 1º Parâmetro como:
.MinhaClasse{
  color: red;
}

#MakerEdit1{
  background-color: blue;
}

### Código Cliente (JavaScript)

```javascript
function ebfCSSImportContent(content, idCss) {
  var lnk = document.getElementById("WFRMakerCSS");  
  if (lnk && idCss == null) {      
    if (lnk.styleSheet) {
      lnk.styleSheet.cssText = content;
    } else {
      lnk.innerHTML = content + lnk.innerHTML;
    }
  } else {
   lnk = document.createElement('style');    
   lnk.id = idCss ? idCss : "WFRMakerCSS";       
   lnk.setAttribute('type', "text/css");
  if (lnk.styleSheet) {
    lnk.styleSheet.cssText = content;
  } else {
    lnk.innerHTML = content;
  }     
    document.body.appendChild(lnk);
  }
}
```

---

## CSS - Obter Propriedade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCssGetStyle` |
| **Código** | 634 |
| **Assinatura** | `CSS - Obter Propriedade (Variante;Letras): Letras` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém uma propriedade CSS de um elemento passado por parâmetro.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Nome da propriedade de estilo. (Letras)

Retorno:
Valor da Propriedade. (Letras)

Observação:
O nome da propriedade de estilo deve seguir o padrão DOM Style. Uma lista de exemplo pode ser visto em:
"http://goo.gl/PGSe".

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCssGetStyle(element, propertyName, propertyValue) {
  if (element && propertyName) {  
    return eval("element.style." + propertyName);
  } 
}
```

---

## CSS - Possui Classe?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCssExistsClass` |
| **Código** | 1080 |
| **Assinatura** | `CSS - Possui Classe? (Variante;Letras): Lógico` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Lógico |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função verifica se um elemento passado por parâmetro possui uma classe CSS.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Nome da classe CSS a ser verificada. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCssExistsClass(element, className) {
  if (element && className) {
    return element.classList.contains(className);
  }
}
```

---

## CSS - Remover Classe

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCssRemoveClass` |
| **Código** | 1012 |
| **Assinatura** | `CSS - Remover Classe (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove uma classe CSS de um elemento passado por parâmetro.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Nome da classe CSS a ser removida do elemento. (Letras)

Retorno:
Não possui.

Observação:
A classe CSS a ser removida deve ser uma classe existente no elemento.

Exemplo:
Assumindo como exemplo que o elemento passado como referência sendo um botão e a classe a CSS a ser removida como ?btn-primary?.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCssRemoveClass(element, className) {
  if (element && className) {
    element.classList.remove(className);
  }
}
```

---

## CSS - Remover Propriedade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCssRemoveStyle` |
| **Código** | 635 |
| **Assinatura** | `CSS - Remover Propriedade (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove uma propriedade CSS de um elemento passado por parâmetro.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Nome da propriedade de estilo a ser removida. (Letras)

Retorno:
Não possui.

Observação:
O nome da propriedade de estilo deve seguir o padrão DOM Style. Uma lista de exemplo pode ser visto em:
"http://goo.gl/PGSe".

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCssRemoveStyle(element, propertyName) {
  if (element && propertyName) {  
    eval("element.style.removeProperty(\"" + propertyName + "\")");
  } 
}
```

---

## HTML - Anexar Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlAppendElementAt` |
| **Código** | 563 |
| **Assinatura** | `HTML - Anexar Elemento (Variante;Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função anexa um elemento recebido como parâmetro em um outro elemento passado por parâmetro.

Parâmetro(s):
1. Referência do elemento que receberá o novo elemento. (Variante)
2. Referência do elemento a ser anexado. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlAppendElementAt(element, child){
  if (element && child) {  
    element.appendChild(child);
  }
}
```

---

## HTML - Anexar Elemento na Posição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlAppendElementAtPosition` |
| **Código** | 727 |
| **Assinatura** | `HTML - Anexar Elemento na Posição (Variante;Variante;Inteiro)` |
| **Parâmetros** | Variante;Variante;Inteiro |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função anexa o elemento na posição dentro do elemento pai passado por parâmetro.

Parâmetro(s):
1. Referência do elemento que receberá o novo elemento. (Variante)
2. Referência do elemento a ser anexado. (Variante)
3. Posição onde o elemento será inserido. (Inteiro)

Retorno:
Não possui.

Observação:
Para mais informações verifique: "http://www.w3schools.com/jsref/met_node_insertbefore.asp".

### Código Cliente (JavaScript)

```javascript
function ebfHtmlAppendElementAtPosition(element, child, position){
  position = position - 1;
  if (element !== null && child !== null && position !== null && position >= 0) {
    element.insertBefore(child, element.childNodes[position])
  }
}
```

---

## HTML - Associar Fluxo ao Evento do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlAttachFlowEvent` |
| **Código** | 622 |
| **Assinatura** | `HTML - Associar Fluxo ao Evento do Elemento (Variante;Letras;Fluxo;Variante;Lógico)` |
| **Parâmetros** | Variante;Letras;Fluxo;Variante;Lógico |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa um fluxo a um evento no objeto HTML recebido por parâmetro.

Parâmetro(s):
1. Referência do Elemento HTML. (Variante)
2. Nome do Evento. (Letras)
3. Nome do Fluxo. (Fluxo)
4. Lista de parâmetros do fluxo (Variante, Opcional)
5. O objeto do evento será passado como primeiro parâmetro para o Fluxo? (Lógico, Opcional)

Retorno:
Não possui.

Observações:
1. O 4º parâmetro pode ser o retorno da função "Criar Lista a partir dos Elementos".
2. Se o 5º parâmetro for Verdadeiro (por padrão é Falso) será passado como primeiro parâmetro do Fluxo o objeto do tipo de evento especificado (Mouse, Teclado, etc), que usando a função "HTML - Obter Atributo do Elemento (DOM)" é possível, por exemplo, obter as coordenadas do cursor na tela, última tecla pressionada ou o elemento HTML que disparou o evento.
3. O objeto do evento se tornará o primeiro parâmetro do Fluxo a ser chamado, logo os outros parâmetros começarão a partir da segunda posição.
4. O fluxo chamado no 3º parâmetro pode retornar o valor Lógico Falso para interromper o comportamento padrão do evento do navegador, como por exemplo o clique (onclick) ou o caractere digitado (onkeypress).
5. Somente serão executados fluxos na camada cliente. Para executar fluxos na camada servidor, utilize subfluxo.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlAttachFlowEvent(elementVar, eventName, flowName, ruleParams, eventObject) {
  if (elementVar && eventName && flowName) {  
    // Testa se o parâmetro do fluxo a ser executado é nulo
    if (typeof(ruleParams) == 'undefined' || ruleParams == null) {
      ruleParams = [];
    }    

    // Remove o 'on' do nome do evento
    if(eventName.indexOf("on") === 0){
      eventName = eventName.substr(2);
    }
    
    var totalParams = ruleParams.length;
    
    var func = function(event) {
      event = event || window.event;
      if(eventObject){
        if(totalParams === ruleParams.length){
          ruleParams.unshift(event); // Adiciona evento no primeiro parâmetro
        }else{
          ruleParams[0] = event; // Substitui o objeto do evento anterior
        }
      }
      var stopEvent = executeJSRuleNoField(sysCode, idForm, flowName, ruleParams);
      
      // Se o fluxo retornar o valor Lógico Falso, então será interrompido a propagação do evento
      // para os elementos pais e o evento padrão do navegador
      if(stopEvent === false) {
        event.stopPropagation();
        event.preventDefault();
      }
    };
    
    elementVar[eventName] = func;
    addEvent(elementVar, eventName, func, false);
  }
}
```

---

## HTML - Atualizar Iframe

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlRefreshElement` |
| **Código** | 705 |
| **Assinatura** | `HTML - Atualizar Iframe (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função possibilita a atualização dinâmica de um iframe recebido por parâmetro.

Parâmetro:
1. Referência do Iframe HTML. (Variante)

Retorno:
Não possui.

Observação: 
Deve-se utilizar a função "HTML - Obter Elemento Pelo Id" para o obter o Iframe que se deseja atualizar.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlRefreshElement(element){
  element.contentWindow.location.reload();
}
```

---

## HTML - Clonar Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCloneHtmlNode` |
| **Código** | 706 |
| **Assinatura** | `HTML - Clonar Elemento (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna uma cópia do elemento passado por parâmetro.

Parâmetro:
1. Referência do elemento a ser clonado. (Variante)

Retorno:
Referência do elemento clonado. (Variante)

Observação:
O retorno será nulo, caso o elemento não seja encontrado.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCloneHtmlNode(element){
  return element.cloneNode(true);
}
```

---

## HTML - Criar Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlCreateHtmlElement` |
| **Código** | 565 |
| **Assinatura** | `HTML - Criar Elemento (Letras;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função cria um elemento HTML especificado pelos parâmetros da função e seus atributos e retorna sua referência.

Parâmetro(s):
1. Elemento a ser criado. (Letras)
2. Lista de Lista de atributos e valores. (Variante, Opcional)
3. Elemento que receberá o elemento criado. (Variante, Opcional)

Retorno:
Elemento criado. (Variante)

Observação:
O elemento não deve possuir os sinais de < e >, caso deseja inserir o elemento paragrafo <p> por exemplo: 
use somente 'p'.

Exemplo:
Suponhamos que queremos obter o elemento 'p' passado por parâmetro, o retorno será: [object HTMLParagraphElement]

### Código Cliente (JavaScript)

```javascript
function ebfHtmlCreateHtmlElement(elementVar, attributeListVar, elementAtt) {
  if (elementVar) {
    var element = document.createElement(elementVar);
    if (attributeListVar) {
      for (var i=0; i<attributeListVar.length; i++) {
        var currentAttribute = attributeListVar[i];
        element.setAttribute(currentAttribute[0], currentAttribute[1]);
      }
    }    

    if (elementAtt){    
      elementAtt.appendChild(element);
    }
    return element;    
  }
}
```

---

## HTML - Definir Atributo a um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlSetAttribute` |
| **Código** | 623 |
| **Assinatura** | `HTML - Definir Atributo a um Elemento (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define um atributo a um elemento HTML.

Parâmetro(s):
1. Referência do elemento que receberá o atributo. (Variante)
2. Nome do Atributo. (Letras)
3. Valor do Atributo. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlSetAttribute(element, attributeName, attributeValue) {
  if (element && attributeName) {
    element.setAttribute(attributeName, attributeValue);
  }
}
```

---

## HTML - Definir Atributo a um Elemento (DOM)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlSetDOMAttribute` |
| **Código** | 690 |
| **Assinatura** | `HTML - Definir Atributo a um Elemento (DOM) (Variante;Letras;Variante)` |
| **Parâmetros** | Variante;Letras;Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define um atributo a um objeto HTML (DOM).

Parâmetro(s):
1. Referência do elemento que receberá o atributo. (Variante)
2. Nome do Atributo. (Letras)
3. Valor do Atributo. (Variante)

Retorno:
O mesmo Valor do Atributo passado no terceiro parâmetro. (Variante)

Observação:
Esta função serve para alterar atributos do objeto, permitindo acesso a propriedades avançadas do objeto.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlSetDOMAttribute(elem, attr, value){
  return elem[attr] = value; 
}
```

---

## HTML - Definir Conteúdo do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlInnerHtml` |
| **Código** | 624 |
| **Assinatura** | `HTML - Definir Conteúdo do Elemento (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função define o conteúdo do elemento HTML passado por parâmetro.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Conteúdo. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlInnerHtml(elementVar, elementContent) {
  if (elementVar) {
    elementVar.innerHTML = elementContent; 
  }
}
```

---

## HTML - Existe Barra de Rolagem?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDetectScroll` |
| **Código** | 734 |
| **Assinatura** | `HTML - Existe Barra de Rolagem? (Variante;Inteiro): Lógico` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Lógico |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe um elemento HTML por parâmetro e retorna se ele possui barra de rolagem.

Parâmetro(s):
1. Elemento. (Variante)
2. Posição. (Inteiro)

Retorno:
"True" caso exista a barra de rolagem e "false" caso não exista. (Lógico)

Observação:
No 2º Parâmetro é necessário informar a posição da barra de rolagem que se deseja saber, passando 1 como a vertical e 2 para horizontal.

### Código Cliente (JavaScript)

```javascript
function ebfDetectScroll(elem, pos){
  if(pos === 1)
    scrollbar = elem.scrollHeight > elem.clientHeight;
  else if(pos === 2)
    scrollbar = elem.scrollWidth > elem.clientWidth; 
  return scrollbar;
}
```

---

## HTML - Gerar QR Code

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGenereteQRCode` |
| **Código** | 1021 |
| **Assinatura** | `HTML - Gerar QR Code (Letras;Inteiro;Inteiro;Letras): Variante` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função gera um QR Code em um elemento em tela.

Parâmetro(s):
1. Texto para gerar o QRCode. (Letras)
2. Largura do QR Code. (Inteiro, Opcional)
3. Altura do QR Code. (Inteiro, Opcional) 
4. ID do elemento. (Letras)

Retorno:
Referência contendo o QR Code. (Variante)

Observação:
Deve-se utilizar a mesma largura e altura para gerar o QR Code.

Exemplo:
Assumindo o texto passado como parâmetro ?www.softwell.com.br?, a largura e altura como 128  e o ID do elemento como ?MakerBrav1?, será gerado um QR code no formulário no ID do elemento passado como parâmetro.

### Código Cliente (JavaScript)

```javascript
async function ebfGenereteQRCode(text, width, height, elementId) {
  let element = $c(elementId) ? $c(elementId).div : document.getElementById(elementId);
  if(element) {
    width = width || element.offsetWidth;
    height = height || width;
    const qrCodeObject = await loadAsyncScript("assets/qrcode.min.js", function() {
      let qrcode = new QRCode(element, {
        text: text,
        width: width,
        height: height,
        correctLevel: QRCode.CorrectLevel.H
      });
      return qrcode
    });
    return qrCodeObject;
  }
}
```

---

## HTML - Imprimir Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPrintHTMLContent` |
| **Código** | 722 |
| **Assinatura** | `HTML - Imprimir Elemento (Letras;Variante)` |
| **Parâmetros** | Letras;Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função imprime o conteúdo do elemento passado no segundo parâmetro.

Parâmetro(s):
1. Título da Janela. (Letras)
2. Elemento HTML. (Variante) (Ver observação 2)

Retorno: 
Não possui.

Observações:
1. Caso o elemento que se deseja imprimir tenha elementos de desenho, Ex: canvas, o mesmo será ignorado na impressão.
2. No 2º Parâmetro utilize a função "HTML - Obter Elemento pelo ID".

### Código Cliente (JavaScript)

```javascript
function ebfPrintHTMLContent(title, data){
  var mywindow = window.open('', '');  
  if (!title){  
    title = "";
  }
  mywindow.document.write('<html><head><title>' + title + '</title>');
  css = document.getElementsByTagName('link');
  for(i = 0; i < css.length; i++){
    if(css[i].rel === "stylesheet"){
      mywindow.document.write('<link rel="stylesheet" href="' + css[i].href + '" type="text/css" />');
    }
  }
  mywindow.document.write('</head><body >');
  mywindow.document.write(data.innerHTML);
  mywindow.document.write('</body></html>');  

  setTimeout(function() {
    mywindow.print();
    mywindow.close();
  }, 1);  

  return true;
}
```

---

## HTML - Imprimir Página

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPrintHTMLContentPage` |
| **Código** | 764 |
| **Assinatura** | `HTML - Imprimir Página ()` |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função imprime o conteúdo da página da forma que a mesma é exibida no navegador.

Parâmetro:
Não possui.

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfPrintHTMLContentPage(){
  window.print();
}
```

---

## HTML - Obter Atributo do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetAttribute` |
| **Código** | 625 |
| **Assinatura** | `HTML - Obter Atributo do Elemento (Variante;Letras): Letras` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém um atributo de um elemento HTML.

Parâmetro(s):
1. Referência do elemento que será capturado o atributo. (Variante)
2. Nome do Atributo. (Letras)

Retorno:
Valor do Atributo. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetAttribute(element, attributeName) {
  if (element && attributeName) {
    return element.getAttribute(attributeName);
  }
}
```

---

## HTML - Obter Atributo do Elemento (DOM)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetDOMAttribute` |
| **Código** | 691 |
| **Assinatura** | `HTML - Obter Atributo do Elemento (DOM) (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém um atributo de um objeto HTML (DOM).

Parâmetro(s):
1. Referência do elemento que contenha o atributo. (Variante)
2. Nome do Atributo. (Letras)

Retorno:
Valor do Atributo. (Variante)

Observação:
Essa função serve para obter atributos do objeto, permitindo acesso a propriedades avançadas do objeto.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetDOMAttribute(elem, attr){
  return elem[attr];         
}
```

---

## HTML - Obter Chaves de um Elemento (DOM)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfObjectKeys` |
| **Código** | 708 |
| **Assinatura** | `HTML - Obter Chaves de um Elemento (DOM) (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna uma lista contendo as chaves de um elemento (DOM).

Parâmetro:
1. Referência do Elemento. (Variante)

Retorno:
Lista de chaves do elemento (DOM). (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfObjectKeys(object){
  return Object.keys(object);
}
```

---

## HTML - Obter Componente Maker

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetMakerElementById` |
| **Código** | 626 |
| **Assinatura** | `HTML - Obter Componente Maker (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função busca a referência do elemento HTML de um componente Maker a partir do seu nome.

Parâmetro:
1. Nome do Componente Maker. (Letras)

Retorno:
Referência do Elemento. (Variante)

Observação:
O retorno será nulo, caso o elemento não seja encontrado.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetMakerElementById(id) {
  var component = $c(id);  
  if (component) {
    component = component.div; 
  }  
  return component;
}
```

---

## HTML - Obter Conteúdo do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetInnerHtml` |
| **Código** | 627 |
| **Assinatura** | `HTML - Obter Conteúdo do Elemento (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém o conteúdo do elemento HTML passado por parâmetro.

Parâmetro:
1. Referência do Elemento. (Variante)

Retorno:
Conteúdo do Elemento HTML. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetInnerHtml(elementVar) {
  if (elementVar) {
    return elementVar.innerHTML; 
  }
}
```

---

## HTML - Obter Corpo da Página

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetBodyElement` |
| **Código** | 562 |
| **Assinatura** | `HTML - Obter Corpo da Página (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o corpo (DOM: body) da página do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Corpo da página. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetBodyElement() {
  return $mainform().document.body;
}
```

---

## HTML - Obter Corpo da Página do JSP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetBodyJSP` |
| **Código** | 692 |
| **Assinatura** | `HTML - Obter Corpo da Página do JSP (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o corpo (DOM: body) da página do JSP do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Corpo da página. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetBodyJSP(){
  return $mainform().parent.document.body;
}
```

---

## HTML - Obter Documento da Página

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetDocumentElement` |
| **Código** | 645 |
| **Assinatura** | `HTML - Obter Documento da Página (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o corpo (DOM: document) da página do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Document da página. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetDocumentElement() {
  return $mainform().document;
}
```

---

## HTML - Obter Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetElement` |
| **Código** | 1044 |
| **Assinatura** | `HTML - Obter Elemento (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna o primeiro elemento que corresponde ao grupo especificado de seletores.

Parâmetros:
1. Seletor CSS. (Letras)
2. Referência do Elemento HTML em que será feita a busca dos elementos filhos pelo nome do seletor. (Variante)(Opcional)

Retorno:
Referência do Elemento. (Variante)

Observações:
1. Caso o segundo parâmetro não seja especificado, a busca do elemento será realizada dentro da página.
2. O retorno será nulo, caso o elemento não seja encontrado.

Exemplo:
Assumindo como primeiro parâmetro o ".menu", será retornado o primeiro elemento que possua a classe "menu".

### Código Cliente (JavaScript)

```javascript
function ebfGetElement(selector, ref) {
  ref = ref || document;
  return ref.querySelector(selector);  
}
```

---

## HTML - Obter Elemento pelo ID

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetElementById` |
| **Código** | 628 |
| **Assinatura** | `HTML - Obter Elemento pelo ID (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função busca a referência de um elemento HTML a partir do seu ID.

Parâmetro:
1. ID do Elemento. (Letras)

Retorno:
Referência do Elemento. (Variante)

Observação:
O retorno será nulo, caso o elemento não seja encontrado.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetElementById(id) {
  try {
    return document.getElementById(id);    
  } catch(e) {
    return null;  
  }
}
```

---

## HTML - Obter Elementos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetAllElements` |
| **Código** | 1045 |
| **Assinatura** | `HTML - Obter Elementos (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna uma lista de elementos que coincidam com o grupo de seletores especificado.

Parâmetros:
1. Seletor CSS.(Letras)
2. Referência do Elemento HTML em que será feita a busca dos elementos filhos pelo nome do seletor.(Variante)(Opcional)

Retorno:
Lista de elementos. (Variante)

Observações:
1. Caso o segundo parâmetro não seja especificado, a busca do elemento será realizada dentro da página.
2. O retorno será nulo, caso o elemento não seja encontrado.

Exemplo:
Assumindo como primeiro parâmetro o ".primary", será retornada uma lista com todos os elementos que possuam a classe "primary".

### Código Cliente (JavaScript)

```javascript
function ebfGetAllElements(selector, ref) {
  ref = ref || document; 
  return [...ref.querySelectorAll(selector)];
}
```

---

## HTML - Obter Elementos pelo Nome da Classe

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetElementByClassName` |
| **Código** | 698 |
| **Assinatura** | `HTML - Obter Elementos pelo Nome da Classe (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função busca todas referências dos elementos que possuem a classe determinada no parâmetro.

Parâmetro(s):
1. Classe dos Elementos. (Letras)
2. Referência do Elemento HTML em que será feita a busca dos elementos filhos pelo nome da classe. (Variante)

Retorno:
Lista com referências dos Elementos ou lista vazia caso nenhum elemento seja encontrado. (Variante)

Observação:
Utilizar a função Obter Objeto da Lista para percorrer todos Elementos HTML encontrados.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetElementByClassName(classe, ref) {
  ref = ref || document;
  return ref.getElementsByClassName(classe);
}
```

---

## HTML - Obter Elementos pelo Nome da Tag

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetElementsByTagName` |
| **Código** | 721 |
| **Assinatura** | `HTML - Obter Elementos pelo Nome da Tag (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função busca todas as referências dos elementos que possuem a Tag determinada no parâmetro.

Parâmetro(s): 
1. Nome da Tag. (Letras)
2. Referência do Elemento HTML em que será feita a busca dos elementos. (Variante)

Retorno:
Lista com referências dos Elementos ou lista vazia caso nenhum elemento seja encontrado. (Variante)

Observação:
Utilizar a função Obter Objeto da Lista para percorrer todos Elementos HTML encontrados.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetElementsByTagName(tagName, element) {
  element = element || document;
  return element.getElementsByTagName(tagName);
}
```

---

## HTML - Obter Elementos pelo Nome do Atributo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetElementByAttrName` |
| **Código** | 772 |
| **Assinatura** | `HTML - Obter Elementos pelo Nome do Atributo (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função busca todas as referências dos elementos que possuem o atributo determinado no parâmetro.

Parâmetro(s):
1. Referência do Elemento HTML em que será feita a busca dos elementos filhos pelo atributo. (Variante)
2. Atributo. (Letras)

Retorno:
Lista com referências dos Elementos ou lista vazia caso nenhum elemento seja encontrado. (Variante)

Observação:
Utilizar a função "Obter Objeto da Lista" para percorrer todos Elementos HTML encontrados.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetElementByAttrName(ref, attrName) {
  ref = ref || document;
  return ref.querySelectorAll('[' + attrName + ']') 
}
```

---

## HTML - Obter Filhos de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlChildNodes` |
| **Código** | 629 |
| **Assinatura** | `HTML - Obter Filhos de um Elemento (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna uma lista com os filhos de um elemento informado como parâmetro.

Parâmetro:
1. Referência do elemento onde será retornado os seus filhos. (Variante)

Retorno:
Lista contendo os filhos do elemento informado como parâmetro ou lista vazia caso o elemento não possua filhos. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfHtmlChildNodes(element) {
  if (element) {
    return element.children;
  }
}
```

---

## HTML - Obter Janela Flutuante pelo Nome

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFloatingFormDivById` |
| **Código** | 697 |
| **Assinatura** | `HTML - Obter Janela Flutuante pelo Nome (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém a referência da DIV gerada ao abrir uma instância de um formulário flutuante.

Parâmetro:
1. Nome da Janela (Letras)

Retorno:
Referência do elemento HTML. (Variante)

Observação:
Utilizar após a função Abrir URL Numa Janela Flutuante para obter a DIV.

### Código Cliente (JavaScript)

```javascript
function ebfGetFloatingFormDivById(name){
  return $mainform().getFloatingFormDivById(name);
}
```

---

## HTML - Obter Pai do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlGetParent` |
| **Código** | 630 |
| **Assinatura** | `HTML - Obter Pai do Elemento (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função busca a referência pai do elemento HTML atual.

Parâmetro:
1. Referência do Elemento HTML. (Variante)

Retorno:
Referência do Elemento Pai. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfHtmlGetParent(elementVar) {
  if (elementVar)  
    return elementVar.parentElement;
}
```

---

## HTML - Obter Referência da Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetTabDivByName` |
| **Código** | 640 |
| **Assinatura** | `HTML - Obter Referência da Aba (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém a referência do elemento HTML da aba passada por parâmetro.

Parâmetro:
1. Nome da Aba. (Letras)

Retorno:
Referência da Aba. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetTabDivByName(tabName) {
  var tab = $mainform().d.t.getTabByName(tabName);
  if (tab) {
    return tab.div;
  }
}
```

---

## HTML - Remover Atributo de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlRemoveAttribute` |
| **Código** | 673 |
| **Assinatura** | `HTML - Remover Atributo de um Elemento (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove um atributo de um elemento HTML.

Parâmetro(s):
1. Referência do elemento que receberá o atributo. (Variante)
2. Nome do Atributo. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlRemoveAttribute(element, attributeName) {
  if (element && attributeName) {
    element.removeAttribute(attributeName);
  }
}
```

---

## HTML - Remover Atributo de um Elemento (DOM)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDeleteObject` |
| **Código** | 707 |
| **Assinatura** | `HTML - Remover Atributo de um Elemento (DOM) (Variante;Letras): Lógico` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Lógico |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove um atributo de um objeto HTML (DOM).

Parâmetro(s):
1. Referência do elemento. (Variante)
2. Nome do Atributo. (Letras)

Retorno:
Verdadeiro, se exclusão bem sucedida, caso contrário, falso. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfDeleteObject(object, attribute){
  return delete object[attribute];
}
```

---

## HTML - Remover Evento do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlRemoveEvent` |
| **Código** | 631 |
| **Assinatura** | `HTML - Remover Evento do Elemento (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove um evento do elemento recebido por parâmetro.

Parâmetro(s):
1. Referência do Elemento HTML. (Variante)
2. Nome do Evento a ser removido. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlRemoveEvent(elementVar, eventName) {
  if (elementVar && eventName){
    // Remove o 'on' do nome do evento
    if(eventName.indexOf("on") === 0){
      eventName = eventName.substr(2);
    }
    if(elementVar[eventName]){    
      removeEvent(elementVar, eventName, elementVar[eventName], false);
      elementVar[eventName] = '';      
    }  
  }
}
```

---

## HTML - Remover Filho de um Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlRemoveChild` |
| **Código** | 632 |
| **Assinatura** | `HTML - Remover Filho de um Elemento (Variante;Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove o filho de um elemento especificado por parâmetro.

Parâmetro(s):
1. Referência do elemento pai que terá seu filho removido. (Variante)
2. Referência do elemento filho que será removido. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHtmlRemoveChild(element, child) {
  if (element && child) {
    element.removeChild(child);  
  }
}
```

---

## HTML - Scroll Infinito

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInfiniteScroll` |
| **Código** | 754 |
| **Assinatura** | `HTML - Scroll Infinito (Variante;Fluxo;Variante)` |
| **Parâmetros** | Variante;Fluxo;Variante |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função permite executar um fluxo sempre que o usuário chegar ao fim da barra de rolagem.

Parâmetro(s):
1. Referência do Elemento. (Variante)
2. Fluxo. (Fluxo)
3. Lista de parâmetros. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfInfiniteScroll (element, ruleName, params){
  if (element && ruleName) {
    element.addEventListener('scroll', function(){
      if(element.scrollTop + element.clientHeight >= element.scrollHeight){
          ebfFlowExecute(ruleName, params);
      }    
    });
  }
}
```

---

## Maximizar Formulário Flutuante

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMaximizeWindow` |
| **Código** | 1022 |
| **Assinatura** | `Maximizar Formulário Flutuante (Inteiro)` |
| **Parâmetros** | Inteiro |
| **Tipo** | 28 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função maximiza um formulário flutuante ou pop up.

Parâmetro:
1. Distância das margens. (Inteiro, Opcional)

Retorno:
Não possui.

Observação:
As margens serão aplicadas apenas a formulários flutuantes.

### Código Cliente (JavaScript)

```javascript
function ebfMaximizeWindow(marginSize) {
  var margin;
  if (mainSystemFrame.isPopup) {
      mainSystemFrame.resizeTo(screen.width, screen.height);
      mainSystemFrame.moveBy(0, 0);
      
    } else {
    if (marginSize) {
      margin = marginSize;
    } else {
      margin = 20;
    }

    let width = mainSystemFrame.innerWidth - (margin * 2);
    let height = mainSystemFrame.innerHeight - (margin * 2);

    let id = "WFRIframeForm" + $mainform().idForm;
    let formWindow = mainSystemFrame.document.getElementById(id);

    if (formWindow) {
      formWindow.style.width = width + "px";
      formWindow.style.height = height + "px";
      formWindow.style.top = margin + "px";
      formWindow.style.left = margin + "px";
    }
  }
}
```

---

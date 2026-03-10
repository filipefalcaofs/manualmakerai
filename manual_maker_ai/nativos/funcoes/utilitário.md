# Funções Nativas - Utilitário

Total: **174** funções

[← Voltar para Funções Nativas](README.md)

---

## Abrir ActiveX numa moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormCreateActiveX` |
| **Código** | 398 |
| **Assinatura** | `Abrir ActiveX numa moldura (Componente;Letras;Letras;Variante)` |
| **Parâmetros** | Componente;Letras;Letras;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Abre um ActiveX em uma Moldura.

Parâmetro(s):
1. Nome da moldura (Usada no formulário para exibir o ActiveX). (Componente)
2. Classid do ActiveX (CLSID). (Letras)
3. Codebase do ActiveX. (Letras)
4. Objeto Mapa contendo os parâmetros. (Variante)

Retorno: 
Não possui.

Observações:
1. ActiveX são objetos para serem utilizados no Internet Explorer.
2. Necessário definir no objeto inicio o formulário de trabalho, para o correto preenchimento do 1° parâmetro.

### Código Cliente (JavaScript)

```javascript
function ebfFormCreateActiveX (nomeMoldura, id,codebase, mapa) {
  var moldura = $c(nomeMoldura);
  var div = moldura.div;
  var actx = document.createElement("object");
  
  actx.name = "activex";
  actx.classid = "clsid:" + id;
  actx.codeBase = codebase;
  actx.width = "100%";
  actx.height = "100%";
  
  if ((mapa != null) && (mapa instanceof Map)) {
    var listaChaves = mapa.getKeys();
    for (var i=0;i< listaChaves.length;i++) {
      var name  = listaChaves[i];
      var value = mapa.get(listaChaves[i]);
	  var param = document.createElement("param");
	  param.name = name;
	  param.value = value;
	  actx.appendChild(param);
    }
  }
  div.appendChild(actx);
}
```

---

## Abrir Formulário no Container

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfContainerOpenForm` |
| **Código** | 751 |
| **Assinatura** | `Abrir Formulário no Container (Formulário;Componente;Formulário;Letras;Inteiro;Lógico)` |
| **Parâmetros** | Formulário;Componente;Formulário;Letras;Inteiro;Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Função que abre um formulário no Container. O Container pode ser uma Moldura, uma DIV existente na tela ou o componente Container.

Parâmetro(s):
1. Formulário.
2. Referência do Container. (Componente)
3. Formulário que será aberto no Container.
4. Texto indicando o filtro. (Letras, Opcional)
5. Modo de Abertura. (Inteiro)
6. Barra de Rolagem? (Lógico)

Observações:
1. Esta função não deve ser utilizada para abrir no container o mesmo formulário que o contém.
2. Modos de Abertura: 1 - Inclusão, 2 - Edição.
No Mobile: 1: Inclusão, 2: Edição, -1: Navegação, 3: - Exclusão.
3. As modificações feitas no formulário que está em um Container, apenas serão visualizadas quando o sistema for reiniciado, ou quando o formulário for atualizado manualmente.

Exemplo:
Assumindo como 1º parâmetro o formulário "Form", 2º parâmetro o container (presente em "Form") "Moldura", 3º parâmetro o formulário "Form Moldura" e como 6º parâmetro "True", será aberto no Container "Moldura" o formulário "Form Moldura" com barra de rolagem.

### Código Servidor (Java)

```java
protected final Variant ebfContainerOpenForm(Variant form, Variant componentName, Variant formTarget, Variant filter, Variant mode, Variant scrollbars) throws Exception {
  return callClientFunction("ebfContainerOpenForm", form, componentName, formTarget, filter, mode, scrollbars);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfContainerOpenForm(form, componentName, formTarget, filter, mode, scrollbars){


  if(typeof componentName === "string"){  
    component = document.getElementById(componentName);
  }else{  
    component = componentName;
  }

  if (component) {
    var scrolling = (scrollbars ? "yes" : "no");    

    var url = getAbsolutContextPath();
    url += 'form.jsp?sys='+sysCode+'&formID='+ URLEncode(formTarget) +'&goto=-1&filter='+(filter?filter:'')+'&scrolling='+scrolling+'&mode='+(mode?mode:'-1');
    var iframe = null;
    
    var iframes = component.getElementsByTagName("iframe");      
    if (iframes.length > 0) {
      iframe = iframes[0];      
          
      var iframeTag = eval(iframe.id);
      if (iframeTag.formOnUnLoadAction) {
        iframeTag.formOnUnLoadAction();
      }      

    }else{
      var id = 'URLFrame' + parseInt((Math.random() * 9999999));
      iframe = document.createElement("iframe");      
      iframe.src = url;
      iframe.id = id;
      iframe.name = id;       
      iframe.style.border = "none";
      iframe.width = '100%';
      iframe.height = '100%';
    }
    
    if (iframe.src != url) {
      iframe.src = url
    }
    
    iframe.style.scrollbars = scrollbars;
    component.appendChild(iframe);  
  }
}
```

---

## Abrir URL Na Mesma Janela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenUrlSameWindow` |
| **Código** | 541 |
| **Assinatura** | `Abrir URL Na Mesma Janela (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função abre uma URL (página) na mesma janela em que esta função for chamada.

Parâmetro:
1. URL da página (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfOpenUrlSameWindow(urlToOpen) {     
  window.top.location.href = urlToOpen;
}
```

---

## Abrir URL Numa Janela Flutuante

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenFloatingUrl` |
| **Código** | 675 |
| **Assinatura** | `Abrir URL Numa Janela Flutuante (Letras;Letras;Letras;Inteiro;Inteiro;Letras;Lógico;Lógico)` |
| **Parâmetros** | Letras;Letras;Letras;Inteiro;Inteiro;Letras;Lógico;Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Abre uma URL em uma janela flutuante.

Parâmetro(s):
1. URL que será aberta. (Letras)
2. Nome da janela (Não deve conter espaço nem caracteres especiais). (Letras)
3. Descrição da janela (Título do formulário flutuante). (Letras, Opcional)
4. Largura. (Inteiro)
5. Altura. (Inteiro)
6. Classe HTML adicional. (Letras, Opcional)
7. Modal. (Lógico)
8. Redimensionável. (Lógico)

Retorno:
Não possui.

Observações:
1. Para colocar um caractere "&" que esteja entre os dados do valor de um parâmetro de uma URL utilize a combinação: %26 + &.
2. A URL deve possuir o protocolo "http://" antes do endereço, caso contrário, será tratato como uma URL relativa.
3. O nome da janela não deve conter espaço.
4. A função deve ser utilizara sempre a partir de um formulário flutuante.

### Código Cliente (JavaScript)

```javascript
function ebfOpenFloatingUrl(pURL, pWindowName, pWindowDescription, pWindowWidth, pWindowHeight, pClass, modal, resizable) {
  var formDiv = mainSystemFrame.document.getElementById("WFRIframeForm" + pWindowName);
  if (formDiv !== null && formDiv.className.indexOf("WFRIframeForm-Active") === -1) {
    formDiv.style.zIndex = ++mainSystemFrame.lastFormZindex;
    var activeForms = mainSystemFrame.document.getElementsByClassName("WFRIframeForm-Active");
    if (activeForms.length > 0) {
      activeForms[0].getElementsByTagName("iframe")[0].contentWindow.document.getElementsByTagName("iframe")[0].contentWindow.document.activeElement.blur();
      activeForms[0].className = activeForms[0].className.replace(" WFRIframeForm-Active", "");
    }
    formDiv.className += " WFRIframeForm-Active";
  }

  if (formDiv === null) {
    openFloatingUrl(pURL, pWindowName, pWindowDescription, pWindowWidth, pWindowHeight, pClass, modal, resizable);
  } else if (mainSystemFrame.document.getElementById("Min" + formDiv.id) !== null) {
    mainSystemFrame.document.getElementById("minimizedFloatingDivs").removeChild(mainSystemFrame.document.getElementById("Min" + formDiv.id));
    formDiv.style.display = "";
  }
}
```

---

## Abrir URL em Outra Janela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `OpenURLOnNewWindow` |
| **Código** | 350 |
| **Assinatura** | `Abrir URL em Outra Janela (URL; Nome da janela; Propriedades da janela)` |
| **Parâmetros** | Letras;Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Abre uma URL em outra janela.

Parâmetro(s):
1. URL que será aberta. (Letras)
2. Nome da janela (Caso nulo ou não exista a janela, será criada uma nova janela). (Letras)
3. Propriedade para a abertura da janela. (Letras, Opcional)

Retorno:
Não possui.

Observações:
1. As propriedades devem ser definidas em pares separados por vírgula. Ex.: scrollbars=yes,resizable=yes
2. As propriedades válidas e seus possíveis valores são:
    - toolbar = yes | no
    - location = yes | no
    - status = yes | no
    - menubar = yes | no
    - scrollbars = yes | no
    - resizable = yes | no
    - width = yes | no
    - height = Número inteiro
    - left = Número inteiro
    - top = Número inteiro
3. Para colocar um caractere "&" que esteja entre os dados do valor de um parâmetro de uma URL utilize a combinação: %26 + &.
4. A URL deve possuir o protocolo "http://" antes do endereço, caso contrário, será tratado como uma URL relativa.
5. O nome da janela não deve conter espaço.
6. Para o mobile não é necessário informar o nome da janela, caso seja informada a página será aberta sobre a própria aplicação.

### Código Cliente (JavaScript)

```javascript
function OpenURLOnNewWindow(pURL, pWindowName, pWindowProperties) {
  try {
    MM_openBrWindow(pURL, pWindowName, pWindowProperties);    
  } catch(e) {
    //Abafa  
  }
}
```

---

## Alertar Aguardando Ok

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAlertMessage` |
| **Código** | 113 |
| **Assinatura** | `Alertar Aguardando Ok(Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Exibe uma mensagem de alerta junto com um botão "Ok"  e o fluxo só continua a ser executado após o usuário clicar
neste botão.

Parâmetro:
1. Mensagem que será exibida. (Texto)

Retorno:
Não possui.

Observação:
Maker Mobile: No iOS, o fluxo continuará sua execução independente do usuário clicar no botão OK.

Exemplo:
Assumindo como parâmetro a mensagem "Maker ALL", junto com este aparecerá um botão de OK.
O fluxo só continuará sendo executado quando o usuário clicar no botão "OK".

### Código Servidor (Java)

```java
protected final Variant ebfAlertMessage(Variant str) throws Exception {
    client.alertMessage(str.getString());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfAlertMessage(msg) {
  alert(msg);
}
```

---

## Alertar Aguardando Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPrompt` |
| **Código** | 710 |
| **Assinatura** | `Alertar Aguardando Texto (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função exibe uma caixa de diálogo solicitando uma entrada do usuário.

Parâmetro(s):
1. Texto do diálogo. (Letras)
2. Texto pré-definido. (Letras)

Retorno:
Retorna o texto que o usuário digitou. Caso o usuário click em Cancelar, o retorno é nulo. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfPrompt(dialog, stringDefault) {
  stringDefault = stringDefault || "";
  return prompt(dialog, stringDefault);
}
```

---

## Alterar Conexão Adicional

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetSubconnection` |
| **Código** | 280 |
| **Assinatura** | `Alterar Conexão Adicional (Letras, Variante)` |
| **Parâmetros** | Letras;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Altera a Conexão Adicional.

Parâmetro(s):
1. Nome de uma conexão adicional existente. (Letras)
2. Conexão que será atribuída no nome definido no 1º parâmetro. (Variante)

Retorno:
Não possui.

Observações:
1. A nova conexão ficará valendo enquanto a sessão que a modificou estiver ativa.
2. Normalmente é utilizada as funções abrir conexão de banco de dados para o 2° parâmetro. Ex.: Abrir Conexão MSSQL.

### Código Servidor (Java)

```java
protected final Variant ebfSetSubconnection(Variant connectionKey, Variant dbConnection) throws Exception {
    connection.setSubconnection(connectionKey.toString(), dbConnection.getObject());
    return Variant.VARIANT_NULL;
  }
```

---

## Alterar Idioma

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetLocale` |
| **Código** | 456 |
| **Assinatura** | `Alterar Idioma(Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Alterar idioma.

Parâmetro:
1. Idioma. (Letras)

Retorno:
Não possui.

Observação:
Os idiomas devem ser representados com as seguintes tags: pt_BR para Português,  fr_FR para Françês,  es_ES para Espanhol e en_US para Inglês.

### Código Servidor (Java)

```java
protected final Variant ebfSetLocale(Variant locale) throws Exception {
    wfr.util.Resources.getInstance(request, locale.getString());
    return Variant.VARIANT_NULL;
  }
```

---

## Alterar Modo do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMenuChangeMode` |
| **Código** | 614 |
| **Assinatura** | `Alterar Modo do Sistema (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função altera o modo do menu (Projeto, Gerente e Normal).

Parâmetro: 
1. Sigla do modo do sistema. (Letras)

Retorno:
Não possui.

Observação:
Sigla do Modo:
d - Modo Projeto
p - Modo Gerente
n - Modo Normal

### Código Cliente (JavaScript)

```javascript
function ebfMenuChangeMode(mode) {
  mainSystemFrame.changeMode = true;

  let openXHR = function(method, url, async, formdata, callback, params) {
    let xhr = new XMLHttpRequest();
    xhr.open(method, url, async);
    xhr.setRequestHeader("Accept", "application/javascript,*/*;q=0.9");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded" + (isSafari ? ";charset=UTF-8" : ""));
    xhr.addEventListener("load", function() {
      if (xhr.readyState === 4) {
        if (xhr.status >= 200 && xhr.status <= 299) {
          if (callback && typeof callback === "function") {
            callback.apply(params && Array.isArray(params) ? params : []);
          }
        } else {
          console.error(xhr.responseText);
        }
      }
    });

    xhr.addEventListener("error", function() {
      console.error(xhr.responseText);
    });

    xhr.send(formdata);
  };

  openXHR("POST", "form.do", true, "sys=" + sysCode + "¶m=closeForm&formID=" + mainform.idForm +
    (mainform.WEBRUN_CSRFTOKEN ? "&WEBRUN-CSRFTOKEN=" + mainform.WEBRUN_CSRFTOKEN : ""), function() {

    openXHR("POST", "changeMode.do", true, "sys=" + sysCode + "&action=changeMode&mode=" + mode + "&back=true", ebfNavRefreshForm);
  });
}
```

---

## Alterar Usuário do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSystemChangeUser` |
| **Código** | 650 |
| **Assinatura** | `Alterar Usuário do Sistema ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função efetua logoff do sistema atual e redireciona para a tela de login do sistema.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSystemChangeUser() {
  let win = top; 
  if (parent.opener) { 
    win = parent.opener.top; 
  } else if (getOpenerWindow(top)) { 
    win = getOpenerWindow(top).top; 
  }
  
  mainSystemFrame.formOnUnLoadAction();
  let xhr = new XMLHttpRequest();
  xhr.open("POST", "closesystem.do?sys=" + mainform.sysCode, true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {    
      win.mainSystemFrame.unloaded = true;
      win.document.location.href = "open.do?sys=" + mainform.sysCode;
    }
  };

  xhr.send();
}
```

---

## Alterar Ícone da Aplicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeApplicationIcon` |
| **Código** | 1081 |
| **Assinatura** | `Alterar Ícone da Aplicação (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Altera o ícone da aplicação no Webrun utilizando um caminho relativo para a imagem. 

Parâmetro(s):
1. Caminho relativo da imagem. (Letras)

Retorno: 
Não possui.

Observação: 
A imagem deve estar no contexto do Webrun ou em uma URL externa acessível.

Exemplos: 
1. Assumindo o parâmetro como 'imagens/icone.png', o ícone da aplicação será alterado para a imagem especificada.

### Código Cliente (JavaScript)

```javascript
function ebfChangeApplicationIcon(imagePath) {
  if (imagePath) {
    let links = top.document.querySelectorAll("link[rel*=\"icon\"]");
    for (let i = 0; i < links.length; i++) {
      if (links[i].rel === "apple-touch-icon") {
        links[i].parentElement.removeChild(links[i]);
      } else {
        links[i].href = imagePath;
      }
    }
  }
}
```

---

## Armazenamento Local - Definir Variável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLocalStorageSetItem` |
| **Código** | 1026 |
| **Assinatura** | `Armazenamento Local - Definir Variável (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Define o valor de uma variável do armazenamento local.

O armazenamento local é um tipo de armazenamento do navegador do usuário, onde são armazenados os dados dos websites. Esse armazenamento é separado por domínio/subdomínio, ou seja, poderá ser compartilhado entre todos os sistemas e Webrun que estão rodando no mesmo domínio.

Para saber mais acesse: https://developer.mozilla.org/pt-BR/docs/Web/API/Window/localStorage

Parâmetros:
1. Nome da Variável. (Letras)
2. Valor da Variável. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfLocalStorageSetItem(keyName, keyValue) {
  return localStorage.setItem(keyName, keyValue);
}
```

---

## Armazenamento Local - Limpar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLocalStorageClear` |
| **Código** | 1028 |
| **Assinatura** | `Armazenamento Local - Limpar ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Remove todas as variáveis do armazenamento local.

O armazenamento local é um tipo de armazenamento do navegador do usuário, onde são armazenados os dados dos websites. Esse armazenamento é separado por domínio/subdomínio, ou seja, poderá ser compartilhado entre todos os sistemas e Webrun que estão rodando no mesmo domínio.

Para saber mais acesse: https://developer.mozilla.org/pt-BR/docs/Web/API/Window/localStorage

Parâmetros:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfLocalStorageClear() {
  localStorage.clear();
}
```

---

## Armazenamento Local - Obter Quantidade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLocalStorageGetLength` |
| **Código** | 1029 |
| **Assinatura** | `Armazenamento Local - Obter Quantidade (): Inteiro` |
| **Retorno** | Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a quantidade de variáveis armazenadas no armazenamento local.

O armazenamento local é um tipo de armazenamento do navegador do usuário, onde são armazenados os dados dos websites. Esse armazenamento é separado por domínio/subdomínio, ou seja, poderá ser compartilhado entre todos os sistemas e Webrun que estão rodando no mesmo domínio.

Para saber mais acesse: https://developer.mozilla.org/pt-BR/docs/Web/API/Window/localStorage

Parâmetros:
Não possui.

Retorno:
Quantidade de variáveis armazenadas no armazenamento local. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfLocalStorageGetLength() {
  return localStorage.length;
}
```

---

## Armazenamento Local - Obter Variável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLocalStorageGetItem` |
| **Código** | 1025 |
| **Assinatura** | `Armazenamento Local - Obter Variável (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o valor de uma variável do armazenamento local.

O armazenamento local é um tipo de armazenamento do navegador do usuário, onde são armazenados os dados dos websites. Esse armazenamento é separado por domínio/subdomínio, ou seja, poderá ser compartilhado entre todos os sistemas e Webrun que estão rodando no mesmo domínio.

Para saber mais acesse: https://developer.mozilla.org/pt-BR/docs/Web/API/Window/localStorage

Parâmetros:
1. Nome da Variável. (Letras)

Retorno:
Valor da variável especificada. (Letras)

Observações:
1. Se a variável não existir, a função irá retornar NULO.
2. O valor da variável sempre é do tipo Letras.

### Código Cliente (JavaScript)

```javascript
function ebfLocalStorageGetItem(keyName) {
  return localStorage.getItem(keyName);
}
```

---

## Armazenamento Local - Remover Variável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLocalStorageRemoveItem` |
| **Código** | 1027 |
| **Assinatura** | `Armazenamento Local - Remover Variável (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Remove uma variável do armazenamento local.

O armazenamento local é um tipo de armazenamento do navegador do usuário, onde são armazenados os dados dos websites. Esse armazenamento é separado por domínio/subdomínio, ou seja, poderá ser compartilhado entre todos os sistemas e Webrun que estão rodando no mesmo domínio.

Para saber mais acesse: https://developer.mozilla.org/pt-BR/docs/Web/API/Window/localStorage

Parâmetros:
1. Nome da Variável. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfLocalStorageRemoveItem(keyName) {
  return localStorage.removeItem(keyName);
}
```

---

## Atualizar Clipboard

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfClipboardUpdate` |
| **Código** | 1184 |
| **Assinatura** | `Atualizar Clipboard (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza o conteúdo do clipboard com o valor fornecido como parâmetro. 

Parâmetro(s):
1. Conteúdo a ser copiado para o clipboard. (Letras)

Retorno: 
Não possui.

Observação: 
Esta função utiliza a API Clipboard do navegador para atualizar o conteúdo do clipboard. É necessário que a página esteja em um contexto seguro (HTTPS) e que o usuário tenha interagido com a página para que a operação seja permitida.

Exemplo: 
Assumindo o parâmetro como 'Texto de exemplo', o clipboard será atualizado com 'Texto de exemplo'.

### Código Cliente (JavaScript)

```javascript
function ebfClipboardUpdate(content) {
    if (navigator.clipboard) {
        navigator.clipboard.writeText(content);
    }
}
```

---

## Atualizar a coordenada do eixo X

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUpdateX` |
| **Código** | 561 |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função atualiza a posição X do componente passado como parâmetro. Função apenas para componentes que possuem a propriedade de movimentação habilitada.

Parâmetro(s):
1. Componente a ser atualizado.
2. Nova posição para a coordenada X do componente. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfUpdateX(componentVar,newPosition){
    var component = $c(componentVar);
    if(component){
        component.updateX(newPosition);
    }
}
```

---

## Atualizar a coordenada do eixo Y

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUpdateY` |
| **Código** | 560 |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função atualiza a posição Y do componente passado como parâmetro. Função apenas para componentes que possuem a propriedade de movimentação habilitada.

Parâmetro(s):
1. Componente a ser atualizado.
2. Nova posição para a coordenada Y do componente. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfUpdateY(componentVar,newPosition){
    var component = $c(componentVar);
    if(component){
        component.updateY(newPosition);
    }
}
```

---

## Autenticar Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAuthUser` |
| **Código** | 641 |
| **Assinatura** | `Autenticar Usuário (Letras;Letras;Lógico;Letras)` |
| **Parâmetros** | Letras;Letras;Lógico;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função efetua a autenticação de um usuário.

Parâmetro(s):
1. Usuário. (Letras)
2. Senha. (Letras)
3. Redirecionar para o formulário principal? (Apenas na Camada Servidor, Lógico)
4. Conexão-Ponte. (DataConnection, Letras, Opcional)

Retorno: 
"True" quando a autenticação for realizada com sucesso, "false" quando não for realizada com sucesso (Ver observação 4). (Lógico)

Observações:
1. Caso a função seja utilizada na camada servidor, o sistema não pode possuir o evento "Ao Autenticar" definido. Caso 
o tenha, deve-se utilizar esta função na camada cliente.
2. O parâmetro de redirecionamento apenas tem efeito na camada servidor. Na camada cliente, sempre será 
redirecionado para o formulário principal.
3. A conexão ponte pode ser obtida através da função "Obter Lista de Conexões-Ponte". Este parâmetro serve para
definir qual a ENTIDADE que será utilizada para acessar o sistema.
4. O retorno da função só poderá ser obtido quando o terceiro parâmetro da função for definido como falso e estiver na camada servidor, visto que, caso verdadeiro, ocorrerá o redirecionamento automático da página.

### Código Servidor (Java)

```java
protected final Variant ebfAuthUser(Variant user, Variant password, Variant redirect, Variant dataConnection) throws Exception {
  wfr.sys.HTMLInterface.HTMLInterface htmlInterface = wfr.sys.HTMLInterface.HTMLInterface.getInstance(request);
  wfr.sys.InnerPrintWriter innerPrintWriter = null;
  try {
    int pIntType = -1;
    String pType = request.getParameter("pType");
    if (Functions.isNumeric(pType))
      pIntType = Integer.parseInt(pType.trim());
      
    if(pIntType == wfr.web.Action.GET_METHOD || request.getParameter("iframeId") == null)
      innerPrintWriter = new wfr.sys.InnerPrintWriter(response.getWriter());

    htmlInterface.logonSys((innerPrintWriter != null ? innerPrintWriter : response.getWriter()), 
        user.getString(), 
        password.getString().trim(), 
        dataConnection.getString(), 
        request, 
        response, 
        true, 
        false, 
        false
    );

    if (redirect.getBoolean()) {
      client.executeJavascript("top.location.href=\"open.do?sys=" + getSystem().getCode() + "\";", this);
    }
    return Variant.VARIANT_TRUE;
  } catch (Exception e) {
    throw e;
  }
}
```

### Código Cliente (JavaScript)

```javascript
function ebfAuthUser(user, password, redirect, dataConnection) {
  var url = "logon.do?sys=" + sysCode + "&user=" + URLEncode(user) + "&password=" + URLEncode(password.trim());  
  if (dataConnection && dataConnection != "undefined") {
    url += "&dataConnection=" + URLEncode(dataConnection);  
  }
  IframeTransporter(url);
}
```

---

## Autenticar com Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLoginCertificate` |
| **Código** | 1076 |
| **Assinatura** | `Autenticar com Certificado Digital ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função autentica o usuário a partir de um certificado digital.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. Para que seja possível realizar a autenticação com o cerificado digital é necessário utilizar o evento "Ao Autenticar".
2. É preciso informar ao Webrun qual é a URL para conectar com o servidor de aplicações na porta HTTPS.

### Código Cliente (JavaScript)

```javascript
function ebfLoginCertificate() {
  window.top.location.href = "x509?callback=" + URLEncode(window.top.location.href, 'GET');
}
```

---

## Bootstrap - Criar Modal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBootstrapCreateModal` |
| **Código** | 924 |
| **Assinatura** | `Bootstrap - Criar Modal (Letras;Lógico;Letras;Letras;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Lógico;Letras;Letras;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função cria um modal do Bootstrap.

Parâmetro(s):
1. Título do Modal. (Letras, Opcional)
2. Fechável? (Lógico, Opcional)
3. Conteúdo do Corpo. (Letras, Opcional)
4. Conteúdo do Rodapé. (Letras, Opcional)
5. Atributos do Modal. (Variante, Opcional)
6. Elemento que receberá o Modal criado. (Variante, Opcional)

Retorno:
Lista com os elementos (Variante): Modal (1), Cabeçalho (2), Corpo (3) e Rodapé (4). (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfBootstrapCreateModal(title, closeable, bodyContent, footerContent, attributes, elementAtt) {
  return bootstrapCreateModal(title, closeable, bodyContent, footerContent, attributes, elementAtt);
}
```

---

## Bootstrap - Fechar Modal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBootstrapCloseModal` |
| **Código** | 925 |
| **Assinatura** | `Bootstrap - Fechar Modal (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Fecha um Modal do Bootstrap.

Parâmetro:
1. Elemento do Modal. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfBootstrapCloseModal(modal) {
  bootstrapCloseModal(modal);
}
```

---

## Bootstrap - Trocar Tema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBootstrapToggleTheme` |
| **Código** | 1180 |
| **Assinatura** | `Bootstrap - Trocar Tema (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Realiza a troca do tema a ser utilizado via variável Bootstrap

Parâmetro(s):
1. Nome do Tema. (Letras)

Retorno:
Não possui.

Observação:
1. Os nomes dos temas aceitos de forma nativa são "dark" (tema escuro), "light" (tema claro) e "sys"
2. Caso o nome do tema passado como parâmetro seja "sys", será obtido o tema do sistema operacional que esta executando o sistema.

### Código Cliente (JavaScript)

```javascript
function ebfBootstrapToggleTheme(theme) {
  toggleTheme(theme)
}
```

---

## Bootstrap - É tela pequena?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBootstrapIsSmallDevice` |
| **Código** | 1006 |
| **Assinatura** | `Bootstrap - É tela pequena? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém um valor lógico indicando se está em disposição mobile.

Parâmetro:
Não possui.

Retorno:
Valor indicando se está em disposição mobile. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfBootstrapIsSmallDevice() {
  return bootstrapIsSmallDevice();
}
```

---

## Captcha - Criar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateLocalCaptcha` |
| **Código** | 714 |
| **Assinatura** | `Captcha - Criar (Componente;Inteiro): Letras` |
| **Parâmetros** | Componente;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função cria um captcha local (sem necessidade de conexão com a internet).

Parâmetro(s):
1. Componente Imagem (o Captcha será renderizado neste componente). 
2. Quantidade de caracteres. (Inteiro)

Retorno:
GUID. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfCreateLocalCaptcha(Variant componetName, Variant qtdChar) throws Exception{
  LocalCaptcha captcha = new LocalCaptcha(qtdChar.getLong().intValue(), request, response, getRequest().getParameter("sys"));   
  callClientFunction("ebfSetImageSrc", componetName, new Variant(captcha.getEncodedString()));  
  return VariantPool.get(captcha.getGuid());
}
```

---

## Captcha - Validar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfValidateLocalCaptcha` |
| **Código** | 715 |
| **Assinatura** | `Captcha - Validar (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função valida o captcha criado através da função Captcha - Criar.

Parâmetro(s):
1. Resposta. (Letras)
2. GUID (Retorno da função Captcha - Criar). (Letras)

Retorno:
Verdadeiro caso a resposta seja válida, falso caso contrário. (Lógico)

Observação:
Caso o GUID informado não exista na lista de Captchas, o retorno será falso.

### Código Servidor (Java)

```java
protected final Variant ebfValidateLocalCaptcha(Variant answer, Variant guid) throws Exception{
  Map <String, String> createdCaptcha = (Map<String, String>) request.getSession().getAttribute("captcha_" + getRequest().getParameter("sys"));  

  if (!(createdCaptcha == null)){
    String challenge = createdCaptcha.get(guid.getString());
    if(challenge != null){
    if (!challenge.equals("")){
      if (challenge.equals(answer.getString())){
         createdCaptcha.remove(guid.getString());  
         return Variant.VARIANT_TRUE;
      }else{
         createdCaptcha.put(guid.getString(), challenge);
         request.getSession().setAttribute("captcha_" + getRequest().getParameter("sys"), createdCaptcha);
      }    
    }
   } 
  }
  return Variant.VARIANT_FALSE;
}
```

---

## Captura URL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHttpConnection` |
| **Código** | 28 |
| **Assinatura** | `Captura URL(Letras;Letras;Inteiro;Letras;Letras):Letras` |
| **Parâmetros** | Letras;Letras;Inteiro;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o conteúdo de uma URL.

Parâmetro(s):
1. URL (Sempre com http:// antes). (Letras)
2. Proxy. (Letras)
3. Porta. (Inteiro)
4. Usuário (Se não existir, definir como nulo). (Letras)
5. Senha (Se não existir, definir como nulo). (Letras)

Retorno: 
O conteúdo do URL. (Letras)

Exemplo: 
1. 1º Parâmetro: http://www.site.com/arquivo.txt.
    2º Parâmetro: 192.168.1.2,
    3º Parâmetro: 8080, 
    4º Parâmetro: NULO, 
    5º Parâmetro: NULO
    Retorno: Conteúdo do url http://www.site.com/arquivo.txt.

---

## Chamar Serviço Web (SOAP 1.2)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSCall2` |
| **Código** | 1175 |
| **Assinatura** | `Chamar Serviço Web (SOAP 1.2) (Letras;Letras;Letras;Variante;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Chama um Web Service (são componentes que permitem às aplicações enviar e receber dados em formato XML).

Parâmetro(s):
1. URL do Web Service (Sempre com http:// antes). (Letras)
2. Porta. (Letras)
3. Nome do método que será chamado no Web Service. (Letras)
4. Lista de Parâmetros do Web Service. (Variante)
5. Tempo (segundos) para estabelecer conexão (Connection Timeout). (Inteiro)
6. Tempo (segundos) do limite de conexão (Túnel aberto). (Inteiro)

Retorno: 
Retorna o resultado da chamado do serviço web. (Variante)

Observação:
Quando o serviço web que será chamado for um fluxo de ação marcado como "Externo" no Gerenciador de Objetos do Maker, os parâmetros da lista criada para o quarto parâmetro desta função deverão ser do tipo "Letras".

Exemplos: 
1. https://manual.softwell.com.br/#/exemplo_de_utilizacao_de_web_services_no_maker
2. Assumindo que o 1° parâmetro = "http://www.byjg.com.br/xmlnuke-php/webservice.php/ws/cep?WSDL", 2° parâmetro = "CEPServicePort", 3° parâmetro = "obterLogradouro", e o 4° parâmetro o CEP digitado pelo usuário, o retorno será o endereço do cep digitado pelo usuário.

### Código Servidor (Java)

```java
protected final Variant ebfWSCall2(Variant url, Variant portName, Variant methodName, Variant arguments) throws Exception {
  return ebfWSCall2(url, portName, methodName, arguments, new Variant(0), new Variant(0));
}

protected final Variant ebfWSCall2(Variant url, Variant portName, Variant methodName, Variant arguments, Variant connectionTime, Variant socketTime) throws Exception {
  wfr.web.webservices.WebServiceConsumer ws = manager.getWebServiceConsumer();

  if (arguments.toObject() instanceof List) {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        (Variant[]) arguments.toArray(Variant.class)
    );
  } else if (arguments.isNull()) {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        new Variant[0]
    );
  } else {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        arguments
    );
  }
}
```

---

## Chamar Serviço Web (SOAP1.2) - Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSCallSSL2` |
| **Código** | 1176 |
| **Assinatura** | `Chamar Serviço Web (SOAP1.2) - Certificado Digital (Letras;Letras;Letras;Letras;Letras;Letras;Letras;Variante;Inteiro;Inteiro): Letras` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Letras;Variante;Inteiro;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Faz uma chamada a um Web Service utilizando protocolo HTTPS.

Parâmetro(s):
1. Arquivo com as informações sobre os certificados do serviço. (Letras)
2. Senha para o arquivo com as informações sobre os certificados do serviço. (Letras)
3. Arquivo com o certificado de quem chama o serviço. (Letras)
4. Senha para o arquivo com o certificado de quem chama o serviço. (Letras)
5. URL do Web Service (Sempre com https:// antes). (Letras)
6. Porta. (Letras)
7. Nome do Método. (Letras)
8. Variante (Parâmetros do método). (Variante)
9. Tempo (segundos) para estabelecer conexão (Connection Timeout). (Inteiro)
10. Tempo (segundos) do limite de conexão (Túnel aberto). (Inteiro)

Retorno:
Conteúdo do XML retornado pelo Web Service. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfWSCallSSL2(
      Variant fileKeyStore,
      Variant passKeyStore,
      Variant filepfx,
      Variant passpfx,
      Variant url,
      Variant portName,
      Variant methodName,
      Variant arguments,
      Variant connectionTime,
      Variant socketTime
  ) throws Exception {

    return ebfWSCallCXFSSLClientAuth(fileKeyStore,passKeyStore,filepfx,passpfx,url,portName,methodName,arguments,connectionTime,socketTime);
  }
```

---

## Chamar Serviço Web via SOAP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSCallCXF` |
| **Código** | 1174 |
| **Assinatura** | `Chamar Serviço Web via SOAP (Letras;Letras;Letras;Variante;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Chama um Web Service (são componentes que permitem às aplicações enviar e receber dados em formato XML).

Parâmetro(s):
1. URL do Web Service (Sempre com http:// antes). (Letras)
2. Porta. (Letras)
3. Nome do método que será chamado no Web Service. (Letras)
4. Lista de parâmetros para o Webservice (Caso o Web Service espere um arquivo (MTOM), passar o caminho do arquivo). (Variante)
5. Tempo (segundos) para estabelecer conexão (Connection Timeout). (Inteiro)
6. Tempo (segundos) do limite de conexão (Túnel aberto). (Inteiro)

Retorno: 
Retorna o resultado da chamada do serviço web. (Variante)

Observação:
Quando o serviço web que será chamado for um fluxo de ação marcado como "Externo" no Gerenciador de Objetos do Maker, os parâmetros da lista criada para o quarto parâmetro desta função deverão ser do tipo "Letras".

Exemplos: 
1. https://manual.softwell.com.br/#/exemplo_de_utilizacao_de_web_services_no_maker
2. Assumindo que o 1° parâmetro = "http://www.byjg.com.br/xmlnuke-php/webservice.php/ws/cep?WSDL", 2° parâmetro = "CEPServicePort", 3° parâmetro = "obterLogradouro", e o 4° parâmetro o CEP digitado pelo usuário, o retorno será o endereço do cep digitado pelo usuário.

### Código Servidor (Java)

```java
protected final Variant ebfWSCallCXF(
    Variant url,
    Variant portName,
    Variant methodName,
    Variant arguments,
    Variant connectionTime,
    Variant socketTime
) throws Exception {

  wfr.web.webservices.WebServiceConsumer ws = manager.getWebServiceConsumer();
  if (arguments.toObject() instanceof List) {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        (Variant[]) arguments.toArray(Variant.class)
    );
  } else if (arguments.isNull()) {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        new Variant[0]
    );
  } else {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        arguments
    );
  }
}
```

---

## Chamar Serviço Web via SOAP - Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSCallCXFSSLClientAuth` |
| **Código** | 1144 |
| **Assinatura** | `Chamar Serviço Web via SOAP - Certificado Digital (Letras;Letras;Letras;Letras;Letras;Letras;Letras;Variante;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Letras;Variante;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Chama um Web Service (são componentes que permitem às aplicações enviar e receber dados em formato XML).

Parâmetro(s):
1. Arquivo com as informações sobre os certificados do serviço. (Letras)
2. Senha para o arquivo com as informações sobre os certificados do serviço. (Letras)
3. Arquivo com o certificado de quem chama o serviço. (Letras)
4. Senha para o arquivo com o certificado de quem chama o serviço. (Letras)
5. URL do Web Service (Sempre com http:// antes).  (Letras)
6. Porta. (Letras)
7. Nome do método que será chamado no Web Service. (Letras)
8. Lista de parâmetros para o Web Service (Caso o Web Service espere um arquivo (MTOM), passar o caminho do arquivo). (Variante)
9. Tempo (segundos) para estabelecer conexão (Connection Timeout). (Inteiro)
10. Tempo (segundos) do limite de conexão (Túnel aberto). (Inteiro)

Retorno: 
Retorna o resultado da chamada do serviço web. (Variante)

Observação:
Quando o serviço web que será chamado for um fluxo de ação marcado como "Externo" no "Gerenciador de "Objetos" do Maker, 
os parâmetros da lista criada para o quarto parâmetro desta função deverão ser do tipo "Letras".

Exemplos: 
1. https://manual.softwell.com.br/#/exemplo_de_utilizacao_de_web_services_no_maker
2. Assumindo que o 1° parâmetro = "http://www.byjg.com.br/xmlnuke-php/webservice.php/ws/cep?WSDL", 2° parâmetro = "CEPServicePort",
3° parâmetro = "obterLogradouro", e o 4° parâmetro o CEP digitado pelo usuário, o retorno será o endereço do cep digitado pelo usuário.

### Código Servidor (Java)

```java
protected final Variant ebfWSCallCXFSSLClientAuth(
    Variant fileKeyStore,
    Variant passKeyStore,
    Variant filepfx,
    Variant passpfx,
    Variant url,
    Variant portName,
    Variant methodName,
    Variant arguments,
    Variant connectionTime,
    Variant socketTime
) throws Exception {

  wfr.web.webservices.WebServiceConsumer ws = manager.getWebServiceConsumer();

  if (arguments.toObject() instanceof List) {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        filepfx.getString(),
        passpfx.getString(),
        (Variant[]) arguments.toArray(Variant.class)
    );
  } else if (arguments.isNull()) {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        filepfx.getString(),
        passpfx.getString(),
        new Variant[0]
    );
  } else {
    return ws.callService(
        url.toString(),
        portName.toString(),
        methodName.toString(),
        connectionTime.getLong().intValue(),
        socketTime.getLong().intValue(),
        filepfx.getString(),
        passpfx.getString(),
        arguments
    );
  }
}
```

---

## Clonar WFRE

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWFRECloneSetParams` |
| **Código** | 730 |
| **Assinatura** | `Clonar WFRE (Variante;Variante;Letras): Letras` |
| **Parâmetros** | Variante;Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função clona o WFRE atual, podendo modificar os parâmetros de conexão de acordo a lista passada no segundo parâmetro.

Parâmetro(s):
1. Caminho de saída para o arquivo clonado. (Variante)
2. Lista de lista com parâmetros. (Variante, Opcional)
3. Novo Código do Sistema. (Letras, Opcional)

Retorno:
Retorna o caminho do arquivo clonado. (Letras)

Observação:
A lista passada no segundo parâmetro deve conter as mesma informações das configurações do Projeto ex: DataBase = Softwell;

### Código Servidor (Java)

```java
protected final Variant ebfWFRECloneSetParams(Variant path, Variant paramMap) {
   return ebfWFRECloneSetParams(path, paramMap, Variant.VARIANT_NULL); 	
}

protected final Variant ebfWFRECloneSetParams(Variant path, Variant paramMap, Variant newCode) {
  try{
    WFREFile fwfre = (WFREFile) getSystem().getFile().clone();
    if(!newCode.getString().equals("")){    
      fwfre.setCode(newCode.getString());
    }     
    ArrayList<Object> params = (ArrayList<Object>) paramMap.getObject();
    List<Object> currentValue;
    if(params != null && params.size() != 0){
      for(int i=0; i < params.size(); i++){ 
        currentValue = (List<Object>) params.get(i);
  	fwfre.setParameter(currentValue.get(0).toString(), currentValue.get(1).toString());
      }  			
    }
    return VariantPool.get(fwfre.saveAs(path.toString() + File.separator, fwfre.getName().toString()+".wfre"));  	  	
  
  }catch(Exception e){
    return Variant.VARIANT_NULL;
  }  	
}
```

---

## Compactação - Compactar para a extensão ZIP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfZipFiles` |
| **Código** | 233 |
| **Assinatura** | `Compactação - Compactar para a extensão ZIP (Variante, Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Compacta os arquivos para a extensão ZIP.

Parâmetro(s):
1. Lista de arquivos/pastas para a compactação. (Variante)
2. Destino do arquivo compactado. (Letras)

Retorno:
Não possui.

Observação:
Utilize a função "Percorrer Diretório" da categoria arquivo para retornar a lista de arquivos e pastas para compactação.

Exemplo: 
Assumindo que o retorno da função "Percorrer Diretório" será passado no 1° parâmetro, e o 2° parâmetro o seguinte 
destino: C:\destino.ZIP, o arquivo será compactado com o nome destino.zip no endereço passado.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfZipFiles(Variant filesVar, Variant compressedFileVar) throws Exception {
  Object directoriesObj = filesVar.getObject();
  if (directoriesObj == null || !(directoriesObj instanceof List)) {
    return Variant.VARIANT_NULL;
  }
  String compressedFileName = compressedFileVar.getTrimString();
  File compressedFile;
  if (!compressedFileName.toLowerCase().endsWith(".zip")) {
    compressedFile = new File(compressedFileName + ".zip");
  } else {
    compressedFile = new File(compressedFileName);
  }
  FileOutputStream out = new FileOutputStream(compressedFile, false);
  java.util.zip.ZipOutputStream zipFile = new java.util.zip.ZipOutputStream(out);
  List<String> directories = List.class.cast(directoriesObj);
  for (String dir : directories) {
    File currentFile = new File(dir);
    ebfInsertZipFiles(zipFile, currentFile, currentFile.getParent());
  }
  if (zipFile != null) {
    zipFile.close();
  }
  return Variant.VARIANT_NULL;
}

private void ebfInsertZipFiles(java.util.zip.ZipOutputStream zipFile, File currentFile, String ancestralDirectory) throws Exception {
  String entryName = currentFile.getAbsolutePath();
  int indx = entryName.indexOf(File.separator);   
  if (indx > 0) {
    entryName = entryName.substring(indx + 1);  
  }
  if (currentFile.isDirectory() && currentFile.list().length == 0) {
    zipFile.putNextEntry(new java.util.zip.ZipEntry(currentFile.getAbsolutePath().substring((indx - 1) + ancestralDirectory.length()) + File.separator));
    zipFile.closeEntry();
  } else if (currentFile.isDirectory()) {
    File[] directoryContent = currentFile.listFiles();
    for (File file : directoryContent) {
      ebfInsertZipFiles(zipFile, file, ancestralDirectory);
    }
  } else {
    byte[] buffer = new byte[2048];
    String zipEntryPath = null;
    int index = currentFile.getAbsolutePath().indexOf(ancestralDirectory);
    if (index >= 0) {
      zipEntryPath = currentFile.getAbsolutePath().substring(index + ancestralDirectory.length());
    }
    if (zipEntryPath.startsWith("\\") || zipEntryPath.startsWith("/")) {
      zipEntryPath = zipEntryPath.substring(1);
    }
    FileInputStream in = new FileInputStream(currentFile);
    java.util.zip.ZipEntry file = new java.util.zip.ZipEntry(zipEntryPath);
    zipFile.putNextEntry(file);
    int readBytes;
    while ((readBytes = in.read(buffer)) != -1) {
      zipFile.write(buffer, 0, readBytes);
    }
    if (zipFile != null) {
      zipFile.closeEntry();
    }
    if (in != null) {
      in.close();
    }
  }
}
```

---

## Compactação - Descompactar arquivo de extensão ZIP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUnzipFiles` |
| **Código** | 234 |
| **Assinatura** | `Compactação - Descompactar arquivo de extensão zip (Letras, Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Descompacta os arquivos de extensão ZIP.

Parâmetro(s):
1. Diretório de destino da descompactação. (Letras)
2. Diretório do arquivo ZIP para a descompactação. (Letras)

Retorno:
Não possui.

Exemplo: 
Assumindo que o diretório destino da descompactação a ser passado no 1° parâmetro será: C:\destino, e o diretório na qual encontra-se
o arquivo zip, que será descompactado C:\destino.ZIP. O arquivo será descompactado no diretório do 1° parâmetro.

### Código Servidor (Java)

```java
protected final Variant ebfUnzipFiles(Variant unzipDirectoryNameVar, Variant compressedFileNameVar) throws Exception {
  String unzipDirectoryName = unzipDirectoryNameVar.getTrimString();
  String compressedFileName = compressedFileNameVar.getTrimString();
  File compressedFile = new File(compressedFileName);
  File unzipDirectory = new File(unzipDirectoryName);
  unzipDirectory.mkdirs();
  if (!unzipDirectory.isDirectory()) {
    throw new WFRRuleException("Erro descompactando arquivo. Diretório de destino não existe [" + unzipDirectoryName + "]", this.ruleName);
  }
  java.util.zip.ZipFile zipFile = null;
  try {
    zipFile = new java.util.zip.ZipFile(compressedFile);
    Enumeration<?> files = zipFile.entries();
    while (files.hasMoreElements()) {
      java.util.zip.ZipEntry file = (java.util.zip.ZipEntry) files.nextElement();
      if (file.isDirectory()) {
        File currentFile = new File(unzipDirectory, file.getName());
        if (!currentFile.exists()) {
          currentFile.mkdirs();
        }
      } else {
        File currentFile = new File(unzipDirectory, file.getName());
        if (!currentFile.getParentFile().exists()) {
          currentFile.getParentFile().mkdirs();
        }
        currentFile.createNewFile();
        InputStream in = null;
        OutputStream out = null;
        try {
          in = zipFile.getInputStream(file);
          out = new FileOutputStream(currentFile);
          int readBytes;
          byte[] buffer = new byte[2048];
          while ((readBytes = in.read(buffer)) > 0) {
            out.write(buffer, 0, readBytes);
          }
        } finally {
          if (in != null) {
            in.close();
          }
          if (out != null) {
            out.close();
          }
        }
      }
    }
  } finally {
    if (zipFile != null) {
      zipFile.close();
    }
  }
  return Variant.VARIANT_NULL;
}
```

---

## Compartilhar Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWirelessSendText` |
| **Código** | 859 |
| **Assinatura** | `Compartilhar Texto (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Compartilha um texto/link através do dispositivo.

Parâmetro(s):
1. Assunto. (Letras)
2. Conteúdo. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfWirelessSendText(subject, content) {
  //To-do
}
```

---

## Contador De Para

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLoop` |
| **Código** | 92 |
| **Assinatura** | `Contador De Para (Inteiro;Inteiro;Inteiro;Inteiro):Lógico` |
| **Parâmetros** | Inteiro;Inteiro;Inteiro;Inteiro |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa um laço (estrutura de repetição) com o intervalo definido nos parâmetros. 

Parâmetro(s):
1. Variável ou Ponteiro (Funções de ponteiro) que conterá o valor corrente do laço. (Ver observação 2.) (Inteiro)
2. Valor inicial do intervalo. (Caso seja definido como Nulo, então considera-se 0.) (Inteiro)
3. Valor final do intervalo. (Inteiro)
4. Incremento da variável. (Caso não seja definido, considera-se 1.) (Inteiro)

Retorno: 
Retorna Verdadeiro enquanto a condição for satisfeita ou falso, caso contrário. 
O resultado dessa função pode ser armazenado em uma variável do tipo lógico ou utilizado em um componente "Decisão". (Lógico)

Observações:
1. O valor inicial é atribuído à variável passada por parâmetro.
2. É recomendado a utilização da função "Ponteiro - Criar instância" no primeiro parâmetro desta função, pois A função "Contador De Para" possui 
uma limitação que ao declarar mais de uma variável do tipo inteiro com o mesmo valor e utilizá-la na função, todas as variáveis declaradas são
incrementadas.

Exemplos: 
1. https://manual.softwell.com.br/#/utilizando_as_funcoes_de_ponteiros_na_funcao_contador_de_para
2. Assumindo como parâmetro uma variável chamada "contador" (Inteiro), 1 (valor Inicial - Inteiro), 3 (Valor Final - Inteiro) e 1 (incremento), enquanto contador for menor ou igual a 3, retorna verdadeiro, caso contrário, retorna falso.
3. Assumindo como parâmetro o retorno da função "Ponteiro - Criar Instância", 2 (valor Inicial - Inteiro), 6 (Valor Final - Inteiro) e 1 (incremento), enquanto contador for menor ou igual a 6, retorna verdadeiro, caso contrário, retorna falso.

### Código Servidor (Java)

```java
protected final Variant ebfLoop(Variant variable, Variant ini, Variant end, Variant increment) throws Exception {
    Variant condition = Variant.VARIANT_TRUE;    
    final String LOOP_CONST = "WEBRUNloopmanagement";
    
    if (increment.getType() != WFRRuleType.NULL && increment.getLong().longValue() < 1) {
      throw new WFRRuleException("Valor incorreto para o incremento do laço.", this.ruleName);
    }
    
    long currentValue;
    Long loopConstValue = (Long) getAttribute(LOOP_CONST);
    
    if (loopConstValue == null) {
      // Caso seja a primeira vez a tentar a iteração ...
      
      // Se o valor inicial não for definido, então considera-se 0
      Long initialValue = 0L;
      if (ini.getType() != WFRRuleType.NULL) {
        initialValue = ini.getLong();
      }
      
      currentValue = initialValue;
    } else {
      currentValue = loopConstValue.longValue();
    }
    
    long finalValue = end.getLong().longValue();
    boolean tempCondition = currentValue <= finalValue;
    
    // Caso a condição ainda seja satisfeita, então incrementa-se o valor da variável corrente e atribui este à variável
    // Caso contrário, retorna falso
    if (tempCondition) {
      // Caso o incremento seja definido como nulo, então considera-se 1
      long incrementValue = 1;
      if (increment.getType() != WFRRuleType.NULL) {
        incrementValue = increment.getLong().longValue();
      }

      if (variable.getType() == WFRRuleType.LONG) {
        variable.setLong(currentValue);
      } else if (variable.getObject() != null && variable.getObject().getClass().getSimpleName().equals("RuleParameterPointer")) {
        Class<?> pointerClass = Class.forName(this.getClass().getPackage().getName()+".WebrunFunctions$RuleParameterPointer");
        java.lang.reflect.Method setMethod = pointerClass.getMethod("setValue", Variant.class);
        setMethod.invoke(variable.getObject(), VariantPool.get(currentValue));
      }
      
      currentValue += incrementValue;
      setAttribute(LOOP_CONST, Long.valueOf(currentValue));
    } else {
      removeAttribute(LOOP_CONST);
      condition = Variant.VARIANT_FALSE;
    }
    
    return condition;
  }
```

---

## Copiar para a Pasta Temporária

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCopyFileToTMP` |
| **Código** | 1079 |
| **Assinatura** | `Copiar para a Pasta Temporária (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função copia um arquivo informado por parâmetro para a pasta temporaria do Webrun.

Parâmetro:
1. Caminho do arquivo (Letras).

Retorno:
Caminho relativo do arquivo copiado (Letras).

### Código Servidor (Java)

```java
protected final Variant ebfCopyFileToTMP(Variant pathFile) throws Exception {
  return new Variant(Functions.copyFileToTMP(getSystem(), pathFile.getString()));  
}
```

---

## Criar Nome de Variável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUtilReduceVariable` |
| **Código** | 22 |
| **Assinatura** | `Criar Nome de Variável (Letras;Lógico):Letras` |
| **Parâmetros** | Letras;Lógico |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Criar o nome de uma variável. 

Parâmetro(s):
1. Nome da Variável. (Letras)
2. Valor lógico. (Verdadeiro ou falso)

Retorno: 
Retorna o nome da variável sem acentos nem cedilhas. (Letras)

Observações:
1. Se o nome passado por parâmetro possuir acentos ou cedilhas, a função retornará valores diferentes conforme o 2° parâmetro Lógico.
2. Se o 2° parâmetro for "true" o retorno será a variável sem acentos ou cedilhas, caso seja "false" o retorno será a variável
sem acentos ou cedilhas e em formato uppercase (em maiúsculo).

Exemplo: 
Assumindo como parâmetro "Ação" (Letras), se o segundo parâmetro for Falso, o resultado será "ACAO", se for verdadeiro
será "Acao".

### Código Servidor (Java)

```java
protected final Variant ebfUtilReduceVariable(Variant texto, Variant className) throws Exception {
    if (texto.getString().trim().length() == 0) {
      return Variant.VARIANT_STRING_EMPTY;
    }
    return VariantPool.get(RulesFunctions.reduceVariable(texto.getString(), !className.getBoolean().booleanValue()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfUtilReduceVariable(texto, className) {
  return reduceVariable(texto, !parseBoolean(className));
}
```

---

## Definir Cookie

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetCookie` |
| **Código** | 379 |
| **Assinatura** | `Define um valor de um Cookie.` |
| **Parâmetros** | Letras;Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Define um valor de um Cookie.

Parâmetro(s):
1. Nome do cookie definido. (Letras)
2. Valor do cookie. (Letras)
3. Comentário. (Letras)

Retorno:
Não possui.

Observações:
1. Existe uma função "Obter valor de um Cookie" que permite obter o cookie criado por essa função.
2. Esta função está homologada apenas com os servidores de aplicações "TomCat" e "JBoss".

Exemplo:
1° Parâmetro: senhaUsuarios
2° Parâmetro: 123
3° Parâmetro: Senha de um usuário logado em uma máquina.

### Código Servidor (Java)

```java
protected Variant ebfSetCookie(Variant cookieName,Variant value,Variant comment) throws Exception{
  Functions.setCookie(response,cookieName.getString(),value.getString(),comment.getString());
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfSetCookie(cookieName,cookieValue,cookieComment) { 
  var today = new Date(); 
  var expire = new Date(); 	 
  expire.setTime(today.getTime() + 3600000*24); 
  document.cookie = cookieName+"="+escape(cookieValue) 
  + ";expires="+expire.toGMTString(); 
}
```

---

## Definir Dados para Monitoramento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetMonitoringSessionAttribute` |
| **Código** | 1030 |
| **Assinatura** | `Definir Dados para Monitoramento (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função defini um conteúdo que será monitorado no sistema que está sendo executado de acordo o valor definido por parâmetro.

Parâmetro:
1. Valor (Letras).

Retorno:
True ou False indicando se a variável foi definida com sucesso.

Observação:
1. Essa função só terá efeito em sistema publicado e com o monitoramento ativo.

---

## Definir Variável Local

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetLocalVariable` |
| **Código** | 470 |
| **Assinatura** | `Definir Variável Local (Letras;Variante): Letras` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Define uma variável local. As variáveis definidas com esta função ficarão disponíveis somente para o formulário onde o 
fluxo foi executado.

Parâmetro(s):
1. Nome da variável. (Letras)
2. Valor a ser armazenado. (Variante)

Retorno:
Retorna o antigo valor da variável. Caso a variável não exista, retorna Nulo.

Observações:
1. A função que acessa a variável local é: 'Obter Variável Local'.
2. Ao definir essa função em formulário flutuante a mesma estará acessível para os demais formulários flutuantes.
3. Ao definir essa função para formulários pop up, as variáveis estarão disponíveis para o formulário corrente.

Exemplo:
Assumindo como parâmetros: TESTE (Letras) e Valor (Letras), quando a função for executada vai ser criada uma 
variável local chamada TESTE com o conteúdo Valor.

### Código Cliente (JavaScript)

```javascript
function ebfSetLocalVariable(varName, varValue) {
  let targetStorage = window.webrunTopTarget ? window.webrunTopTarget : top.document;
  return targetStorage[varName] = varValue;
}
```

---

## Definir Variável da Sessão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetSessionAttribute` |
| **Código** | 101 |
| **Assinatura** | `Definir Variável da Sessão (Letras;Variante;Lógico): Letras` |
| **Parâmetros** | Letras;Variante;Lógico |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

As variáveis de sessão são utilizadas quando houver a necessidade de ter uma variável que se mantém para regras
diferentes. Variáveis de sessão não globais se mantém de acordo com o usuário e as globais se mantém para todo usuário.
Se for necessário, por exemplo, guardar a hora de login de um usuário para ser utilizada em várias regras diferentes, essa
variável de sessão será local. Se for necessário, por exemplo, guardar a quantidade de usuários logados, essa variável de
sessão será global.

Parâmetro(s):
1. Nome da variável. (Letras)
2. Valor a ser armazenado. (Variante)
3. Escopo da variável. Recebe verdadeiro (se ela vai ser global) ou falso (não global - exclusiva da sessão do navegador). (Lógico)

Retorno:
Retorna o antigo valor da variável. Caso a variável não exista, retorna Nulo. (Letras)

Observações: 
1. Filtragem de relatórios por variável de sessão. Caso exista uma variável de sessão com o formato
2. REPORT_FILTER_<campo do filtro do relatório>, o sistema preenche automaticamente o filtro.

Exemplo:
Assumindo como parâmetros: Contador (Letras), 6 (Inteiro) e Verdadeiro (Lógico), quando a função for executada vai ser criada uma varável global chamada Contador com o conteúdo 6.

### Código Cliente (JavaScript)

```javascript
function ebfSetSessionAttribute(name, value, global){
  try {  
    postForceUTF8;    
  } catch (e) {
    var isFirefoxVersionAbove3 = false;
    var firefoxRegExp = new RegExp("firefox/(\\d+)", "i");
    var firefoxRegExpResult = firefoxRegExp.exec(navigator.userAgent);
    if (firefoxRegExpResult != null && firefoxRegExpResult.length > 1) {
      try {
        var version = parseInt(firefoxRegExpResult[1]);
        if (version > 2) {
          isFirefoxVersionAbove3 = true;
        }
      } catch (e) {}
    }

    postForceUTF8 = (isFirefoxVersionAbove3 || isSafari);  
  }

  var postData = ("sys=" + sysCode + "&nome=" + URLEncode(name, postForceUTF8) + "&valor=" + URLEncode(value, postForceUTF8) + "&global=" + global + "&acao=set");
  var content = postURL("sessionManager.do", postData);
  return content;
}
```

---

## Encerrar Sessão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInvalidadeSession` |
| **Código** | 1116 |
| **Assinatura** | `Encerrar Sessão (Inteiro)` |
| **Parâmetros** | Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função encerra a sessão de um usuário no sistema de acordo os valor passado no primeiro parâmetro.

Parâmetro:
1. Tempo de inatividade. (Inteiro)

Retorno:
Não possui.

Observações:
1. O valor passado no 1º parâmetro define o tempo (em segundos) de inatividade do usuário no sistema.
2. Se o tempo informado no 1º parâmetro for igual a 0 (zero), a sessão irá expirar imediatamente.
3. Se o parâmetro avançado RedirecionarAoExpirar estiver ativo, ao expirar a sessão o usuário será redirecionado para a tela de login.

### Código Servidor (Java)

```java
protected final Variant ebfInvalidadeSession(Variant time) throws Exception{
    jakarta.servlet.http.HttpSession session = request.getSession();
    if(time.getLong().intValue() > 0){
      session.setMaxInactiveInterval(time.getLong().intValue());
    }else{
      session.invalidate();
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Enviar Envelope SOAP com Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSSendSoapMessageSSL` |
| **Código** | 1179 |
| **Assinatura** | `Enviar Envelope SOAP com Certificado Digital (Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia um envelope SOAP 1.2 via post para um determinado endereço de serviço.

Parâmetro(s):
1. URL do serviço. (Letras)
2. Ação da operação. (Letras)
3. XML (Conteúdo para POST). (Letras)
4. Charset. (Letras)
5. Arquivo com as informações sobre os certificados do serviço (KeyStore). (Letras)
6. Senha para o arquivo com as informações sobre os certificados do serviço (Senha da KeyStore). (Letras)
7. Arquivo com o certificado de quem chama o serviço (Geralmente, PFX/.p12). (Letras)
8. Senha para o arquivo com o certificado de quem chama o serviço. (Letras)

Retorno: 
XML. (Letras)

Observações: 
1. O conteúdo do POST pode ser visualizado através do SoapUI.
2. O 2° parâmetro encontra-se no "soap:address location" no WSDL do WebService.
3. O 3° parâmetro encontra-se no "soap:operation soapAction" no WSDL do WebService.

### Código Servidor (Java)

```java
protected final Variant ebfWSSendSoapMessageSSL(
    Variant urlVar,
    Variant soapAction,
    Variant content,
    Variant charsetVar,
    Variant fileKeyStore,
    Variant passKeyStore,
    Variant filepfx,
    Variant passpfx)
throws Exception {

  String charset = wfr.util.Settings.CHARSET;
  if (!charsetVar.isNull() && !charsetVar.getTrimString().equals("")) {
    charset = charsetVar.getTrimString();
  }

  java.security.KeyStore trustStore = java.security.KeyStore.getInstance("JKS");
  try (java.io.InputStream trustStoreStream = new java.io.FileInputStream(fileKeyStore.getString())) {
    trustStore.load(trustStoreStream, passKeyStore.getString().toCharArray());
  }

  java.security.KeyStore keyStore = java.security.KeyStore.getInstance("PKCS12");
  try (java.io.InputStream keyStoreStream = new java.io.FileInputStream(filepfx.getString())) {
    keyStore.load(keyStoreStream, passpfx.getString().toCharArray());
  }

  String alias = keyStore.aliases().nextElement();
  java.security.cert.X509Certificate certificate = (java.security.cert.X509Certificate) keyStore.getCertificate(alias);
  certificate.checkValidity(); // Lança exceção se o certificado estiver expirado ou não for válido ainda

  javax.net.ssl.SSLContext sslContext = new org.apache.http.ssl.SSLContextBuilder()
      .loadTrustMaterial(trustStore, null)
      .loadKeyMaterial(keyStore, passpfx.getString().toCharArray())
      .build();

  try (org.apache.http.impl.client.CloseableHttpClient client = org.apache.http.impl.client.HttpClients.custom()
                                                                      .setSSLContext(sslContext)
                                                                      .build()) {

    org.apache.http.client.methods.HttpPost httpPost = new org.apache.http.client.methods.HttpPost(urlVar.getTrimString());
    httpPost.setHeader("Content-Type", "text/xml;charset=" + charset);
    httpPost.setHeader("SOAPAction", soapAction.getString());

    String encodedLogin = wfr.util.Functions.getAutorizationProxy(urlVar.getString());
    if(encodedLogin != null) {
      httpPost.setHeader("Proxy-Authorization", "Basic " + encodedLogin);
    }

    org.apache.http.entity.StringEntity entity = new org.apache.http.entity.StringEntity(content.getString(), charset);
    httpPost.setEntity(entity);

    try (org.apache.http.client.methods.CloseableHttpResponse response = client.execute(httpPost)) {
      org.apache.http.HttpEntity responseEntity = response.getEntity();
      int statusCode = response.getStatusLine().getStatusCode();
      String responseString = responseEntity != null ? org.apache.http.util.EntityUtils.toString(responseEntity) : "";

      if (statusCode != java.net.HttpURLConnection.HTTP_OK) {
          throw new java.io.IOException("Falha na requisição HTTP: " + statusCode + " " + response.getStatusLine().getReasonPhrase() + " - " + responseString);
      }

      return VariantPool.get(responseString);
    }
  }
}
```

---

## Enviar Envelope Soap

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSSendSoapMessage` |
| **Código** | 1177 |
| **Assinatura** | `Enviar Envelope Soap (Letras;Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia um envelope SOAP via post para um determinado endereço de serviço.

Parâmetro(s):
1. URL do serviço. (Letras)
2. Ação da operação. (Letras)
3. XML (Conteúdo para POST). (Letras)
4. Charset. (Letras, Opcional) 

Retorno: 
XML. (Letras)

Observações:
1. O 2° parâmetro encontra-se no "soap:address location" no WSDL do WebService.
2. O 3° parâmetro encontra-se no "soap:operation soapAction" no WSDL do WebService.
3. Caso o 4° parâmetro não seja informado, será adotado o charset padrão do Webrun.

### Código Servidor (Java)

```java
protected final Variant ebfWSSendSoapMessage(Variant urlVar, Variant soapAction, Variant content) throws Exception {
  return ebfWSSendSoapMessage(urlVar, soapAction, content, VariantPool.get(""));
}

protected final Variant ebfWSSendSoapMessage(Variant urlVar, Variant soapAction, Variant content, Variant charSet) throws Exception {
  Variant result = Variant.VARIANT_NULL;
  String url = urlVar.getTrimString();

  String effectiveCharSet = charSet.getString();
  if (effectiveCharSet.equals("")) {
    effectiveCharSet = wfr.util.Settings.CHARSET;
  }


  try (org.apache.http.impl.client.CloseableHttpClient client = org.apache.http.impl.client.HttpClients.createDefault()) {
    org.apache.http.client.methods.HttpPost httpPost = new org.apache.http.client.methods.HttpPost(url);

    if (!soapAction.isNull()) {
      httpPost.setHeader("SOAPAction", soapAction.getTrimString());
    }

    httpPost.setHeader("Content-Type", ("text/xml;charset=" + effectiveCharSet));

    String proxyUser = System.getProperty("http.proxyUser");
    if (proxyUser != null && proxyUser.trim().length() > 0) {
      if (!url.toLowerCase().startsWith("http://localhost") && !url.toLowerCase().startsWith("https://localhost") && !url.toLowerCase().startsWith("http://127.0.0.1")
          && !url.toLowerCase().startsWith("https://127.0.0.1")) {
        String userpass = proxyUser.trim() + ":" + System.getProperty("http.proxyPassword");
        // Substituído pelo encoder padrão do Java (java.util.Base64)
        String encodedLogin = java.util.Base64.getEncoder().encodeToString(userpass.getBytes());
        httpPost.setHeader("Proxy-Authorization", "Basic " + encodedLogin);
      }
    }

    org.apache.http.entity.StringEntity entity = new org.apache.http.entity.StringEntity(content.getString(), effectiveCharSet);
    httpPost.setEntity(entity);

    try (org.apache.http.client.methods.CloseableHttpResponse response = client.execute(httpPost)) {
      org.apache.http.HttpEntity responseEntity = response.getEntity();
      int statusCode = response.getStatusLine().getStatusCode();
      String responseString = "";

      if (responseEntity != null) {
        responseString = org.apache.http.util.EntityUtils.toString(responseEntity);
      }

      if (statusCode != 200) {
        result = new Variant("Ocorreu erro ao processar o envio. Status: ").append(VariantPool.get(statusCode));
        result.append(VariantPool.get("\nMensagem: ")).append(VariantPool.get(response.getStatusLine().getReasonPhrase()));
        result.append(VariantPool.get("\nResposta: ")).append(VariantPool.get(responseString));
      } else {
        result = VariantPool.get(responseString);
      }
    }
  }

  return result;
}
```

---

## Enviar Envelope Soap 1.2

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWSSendSoapMessage2` |
| **Código** | 1178 |
| **Assinatura** | `Enviar Envelope Soap 1.2 (Letras;Letras;Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia um envelope SOAP 1.2 via post para um determinado endereço de serviço.

Parâmetro(s):
1. URL do serviço. (Letras)
2. XML (Conteúdo para POST). (Letras)
3. Charset. (Letras)
4. Usuário. (Letras, Opcional)
5. Senha. (Letras, Opcional)

Retorno: 
XML.  (Letras)

Observações: 
1. A autenticação é realizada através do método Basic (Encode Base64).
2. O conteúdo do Post pode ser visualizado através do SoapUI.
3. O 2° parâmetro encontra-se no "soap:address location" no WSDL do WebService.

### Código Servidor (Java)

```java
protected final Variant ebfWSSendSoapMessage2(Variant urlVar, Variant content, Variant charsetVar) throws Exception {
  return ebfWSSendSoapMessage2 (urlVar, content, charsetVar, VariantPool.get(""), VariantPool.get(""));
}

protected final Variant ebfWSSendSoapMessage2(Variant urlVar, Variant content, Variant charsetVar, Variant user, Variant password) throws Exception {
  Variant result = Variant.VARIANT_NULL;
  String charset = wfr.util.Settings.CHARSET;
  String url = urlVar.getTrimString();

  try (org.apache.http.impl.client.CloseableHttpClient client = org.apache.http.impl.client.HttpClients.createDefault()) {

    if (!charsetVar.isNull() && !charsetVar.getTrimString().equals("")) {
      charset = charsetVar.getTrimString();
    }

    org.apache.http.client.methods.HttpPost httpPost = new org.apache.http.client.methods.HttpPost(url);

    if(!(user.getString().equals(""))){
      String toEncode = user.getString() + ":" + password.getString();
      String encodedAuth = java.util.Base64.getEncoder().encodeToString(toEncode.getBytes());
      httpPost.setHeader("Authorization", "Basic " + encodedAuth);
    }

    httpPost.setHeader("Content-Type", ("application/soap+xml;charset=" + charset));

    String proxyUser = System.getProperty("http.proxyUser");
    if (proxyUser != null && proxyUser.trim().length() > 0) {
      if (!url.toLowerCase().startsWith("http://localhost") && !url.toLowerCase().startsWith("https://localhost") && !url.toLowerCase().startsWith("http://127.0.0.1")
          && !url.toLowerCase().startsWith("https://127.0.0.1")) {
        String userpass = proxyUser.trim() + ":" + System.getProperty("http.proxyPassword");
        String encodedLogin = java.util.Base64.getEncoder().encodeToString(userpass.getBytes());
        httpPost.setHeader("Proxy-Authorization", "Basic " + encodedLogin);
      }
    }

    org.apache.http.entity.StringEntity entity = new org.apache.http.entity.StringEntity(content.getString(), charset);
    httpPost.setEntity(entity);

    try (org.apache.http.client.methods.CloseableHttpResponse response = client.execute(httpPost)) {
      org.apache.http.HttpEntity responseEntity = response.getEntity();
      int statusCode = response.getStatusLine().getStatusCode();
      String responseString = "";

      if (responseEntity != null) {
        responseString = org.apache.http.util.EntityUtils.toString(responseEntity);
      }

      if(statusCode != 200 && statusCode != 202) {
        result = new Variant("Ocorreu erro ao processar o envio. Status: ").append(VariantPool.get(statusCode));
        result.append(VariantPool.get("\nMensagem: ")).append(VariantPool.get(response.getStatusLine().getReasonPhrase()));
        result.append(VariantPool.get("\nResposta: ")).append(VariantPool.get(responseString));
      } else {
        result = VariantPool.get(responseString);
      }
    }
  }

  return result;
}
```

---

## Enviar arquivos via POST

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `postFile` |
| **Código** | 1158 |
| **Assinatura** | `Enviar arquivos via POST (Letras;Variante;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função envia um ou mais arquivos via POST para o endereço especificado.

Parâmetro(s):
1. URL para POST. (Letras)
2. Parâmetros do POST. (Variante)
3. Mapa com Arquivos. (Variante)
4. Mapa com os parâmetros do cabeçalho. (Variante)

Retorno: 
Variante.

Observação: 
1. O 2° parâmetro é um mapa com chave/valor.
2. O 3° parâmetro é um mapa com o nome do parâmetro que receberá o arquivo e o caminho completo do arquivo que será enviado, com chave/valor.

### Código Servidor (Java)

```java
protected final Variant postFile(Variant urlVar, Variant params, Variant files) throws Exception {
  return postFile(urlVar, params, files, null);
}

@SuppressWarnings("unchecked")
protected final Variant postFile(Variant urlVar, Variant params, Variant files, Variant headerParams) throws Exception {
  String result = null;
  org.apache.hc.client5.http.entity.mime.MultipartEntityBuilder builder = org.apache.hc.client5.http.entity.mime.MultipartEntityBuilder.create();
  try (org.apache.hc.client5.http.impl.classic.CloseableHttpClient client = org.apache.hc.client5.http.impl.classic.HttpClients.createDefault()) {
    java.lang.String url = urlVar.getString();
    org.apache.hc.client5.http.classic.methods.HttpPost httpPost = new org.apache.hc.client5.http.classic.methods.HttpPost(url);

    String encodedLogin = wfr.util.Functions.getAutorizationProxy(url);
    if (encodedLogin != null) {
      httpPost.setHeader("Proxy-Authorization", "Basic " + encodedLogin);
    }

    TreeMap<String, String> headParams = headerParams != null
            ? ((java.util.TreeMap<String, String>) headerParams.getObject())
            : null;
    if (headParams != null) {
        headParams.forEach(httpPost::setHeader);
    }

    if (params != null) {
        Map<String, String> mapParams = (Map<String, String>) params.getObject();
        mapParams.forEach(builder::addTextBody);
    }

    // Adiciona arquivos ao corpo da requisição
    Map<String, String> mapFiles = (Map<String, String>) files.getObject();
    for (Map.Entry<String, String> entry : mapFiles.entrySet()) {
        String pathFile = getWfrFileFunctions().getDirectory(getSystem(), entry.getValue());
        File file = new File(pathFile);
        org.apache.hc.client5.http.entity.mime.FileBody fileBody = new org.apache.hc.client5.http.entity.mime.FileBody(file, org.apache.hc.core5.http.ContentType.DEFAULT_BINARY);
        builder.addPart(entry.getKey(), fileBody);
    }

    org.apache.hc.core5.http.HttpEntity entity = builder.build();
    httpPost.setEntity(entity);

    try (
      org.apache.hc.client5.http.impl.classic.CloseableHttpResponse response = client.execute(httpPost)) {
      org.apache.hc.core5.http.HttpEntity resEntity = response.getEntity();
      result = (resEntity != null) ? org.apache.hc.core5.http.io.entity.EntityUtils.toString(resEntity) : "";
    }
  }

  return VariantPool.get(result);
}
```

---

## Enviar arquivos via POST Assíncrono

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendFilePOSTAsync` |
| **Código** | 873 |
| **Assinatura** | `Enviar arquivos via POST Assíncrono (Letras;Variante;Variante;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Letras;Variante;Variante;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função envia um ou mais arquivos via POST para o endereço especificado.
O arquivo é enviado de forma assíncrona, sem travar a tela.

Parâmetro(s):
1. URL para POST. (Letras)
2. Parâmetros do POST. (Variante)
3. Mapa com Arquivos. (Variante)
4. Fluxo de Sucesso. (Fluxo)
5. Parâmetros para o fluxo sucesso. (Variante, Opcional)
6. Fluxo de Erro. (Fluxo)
7. Parâmetros para o fluxo de erro. (Variante, Opcional)

Retorno: 
Não possui.

Observações:
1. O 2° parâmetro é um mapa com chave/valor.
2. O 3° parâmetro é um mapa com o nome do parâmetro que receberá o arquivo e o caminho completo do arquivo que será enviador, com chave e valor.

### Código Cliente (JavaScript)

```javascript
function ebfSendFilePOSTAsync(){
  console.log('MakerMobile');
}
```

---

## Está no Tema Escuro?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsDarkMode` |
| **Código** | 1075 |
| **Assinatura** | `Está no Tema Escuro? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

A função verifica se o tema atual se configura como um tema escuro.

Parâmetro:
Não possui.

Retorno: 
Retorna "True" caso o tema atual seja um tema escuro ou "False" caso contrário. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfIsDarkMode() {
  return isDarkMode();
}
```

---

## Evento - Ao finalizar movimentação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOndragEnd` |
| **Código** | 526 |
| **Parâmetros** | Letras;Letras;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Função iniciada ao finalizar a movimentação de um componente no formulário.

Parâmetro(s):
1. Componente. (Letras)
2. Nome do fluxo a ser chamado. (Letras)
3. Lista de parâmetros para o fluxo. (Variante)

Retorno.
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfOndragEnd(componentName,ruleName,ruleParams) {    
    $c(componentName).ondragend = function(comp,div){        
         executeJSRuleNoField(ebfGetSystemID(),ebfGetFormID(),ruleName,ruleParams);
     };
}
```

---

## Evento - Ao movimentar um componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOndragdrop` |
| **Código** | 558 |
| **Parâmetros** | Letras;Letras;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Movimentar componentes de um formulário (Ondragdrop).

Parâmetro(s):
1. Nome do componente que será movido. (Letras)
2. Nome de um fluxo chamado. (Letras, Opcional)
3. Parâmetros da regra. (Variante, Opcional)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfOndragdrop(componentName,ruleName,ruleParams) {    
    if($c(componentName))    
      if($c(componentName).div){
    //$c(componentName).div.style="cursor:pointer";
    //$c(componentName).div.setAttribute('style','cursor:pointer'); 
    $c(componentName).ondragdrop = function(x, y, oldX, oldY, component, mouseDiffX, mouseDiffY, componentDiv){        
         var newList = new Array();
         newList.push(x);   
         newList.push(y);  
         newList.push(oldX);  
         newList.push(oldY);  
         newList.push(component);  
         newList.push(mouseDiffX);     
         newList.push(mouseDiffY);  
         newList.push(componentDiv);      

         if (!isNullable(ruleParams)) {
            for(var i = 0; i < ruleParams.length; i++){
                newList.push(ruleParams[i]);
            }
            
         }
         executeJSRuleNoField(ebfGetSystemID(),ebfGetFormID(),ruleName,newList,false);
     };                                                                 
      }


}
```

---

## Evento - Permitir movimentação de um componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOnDragInit` |
| **Código** | 559 |
| **Assinatura** | `Evento - Permitir movimentação de um componente (Componente;Lógico;Fluxo;Variante)` |
| **Parâmetros** | Componente;Lógico;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Função que possibilita que um componente seja movimentado dentro de um formulário.

Parâmetro(s):
1. Nome do componente. (Componente)
2. Permitir movimentação? (Lógico, Opcional)
3. Fluxo (Opcional)
4. Lista de parâmetros. (Variante, Opcional)

Retorno:
Não Possui.

Observações:
1. A regra associada no 3º parâmetro será disparada ao movimentar o componente, sendo que a mesma só poderá ser do 
tipo cliente. A regra definida receberá automaticamente oito parâmetros. (Posição X, Posição Y, Posição X anterior, Posição Y anterior, Referência do Componente, Mouse X, Mouse Y, Referência da DIV).
2. Caso não seja definido o 2º parâmetro o mesmo assumirá o valor "true", permitindo a movimentação do componente.

### Código Cliente (JavaScript)

```javascript
function ebfOnDragInit(componentVar,flag,ruleName,ruleParams){   
  var components = $c(componentVar);
  if(components){
    components.setDraggable(flag == undefined ? true : flag, components.div.parentElement);
    if(components.divDragComponent){ 
    components.divDragComponent.style.cursor = 'pointer';  
    components.divDragComponent.style.zIndex = parseInt(components.div.style.zIndex) + 1;
    components.ondragdrop = function(x,y,oldX,oldY,component,mouseDiffX,mouseDiffY,componentDiv){ 
      var newList = new Array();
      newList.push(x);
      newList.push(y);
      newList.push(oldX);
      newList.push(oldY);
      newList.push(component);
      newList.push(mouseDiffX);
      newList.push(mouseDiffY);
      newList.push(componentDiv);
      if(ruleName){
        if (ruleParams){
          for(var i = 0; i < ruleParams.length; i++){
            newList.push(ruleParams[i]);
          }
        } 
        executeJSRuleNoField(ebfGetSystemID(),ebfGetFormID(),ruleName,newList,false);
      }  
    };
  }
  } 
}
```

---

## Executar Fluxo Ao Abrir Formulário na Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRunFlowAfterOpen` |
| **Código** | 455 |
| **Assinatura** | `Executar Fluxo Ao Abrir Formulário na Moldura (Formulário;Fluxo;Variante)` |
| **Parâmetros** | Formulário;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Executa um fluxo ao abrir formulário na moldura.

Parâmetro(s):
1. Formulário.
2. Fluxo.
3. Lista de Parâmetros. (Variante)

Retorno:
Não possui.

Observação:
O fluxo será executado somente se o formulário informado no primeiro parâmetro da função for aberto em uma moldura.

### Código Cliente (JavaScript)

```javascript
function ebfRunFlowAfterOpen(formGUID,FlowName,ruleParams) {
        var values = top.children;
        if (values && values.length > 0) {
		for (i = 0; i < values.length; i++) {
                           try {
                                var mainform = values[i].$mainform();
			        if (mainform.formGUID == formGUID ) {
			         var myOpenForm = values[i].$mainform();
		        	}
                           }   catch(e) {}
		}
        }
        var elems = $mainform().controller.getAllElements();
        for (var i = 0; i < elems.length; i++) {
		if (elems[i] instanceof HTMLGroupBox) {
			var iframes = elems[i].div.getElementsByTagName("iframe");    
			if (iframes.length > 0) {
			  var iframe = iframes[0];
			  var mainform = eval(iframe.id).mainform;
                          if(mainform) {

			  	if (mainform.formGUID == formGUID) {
			   		var myBevelForm = elems[i].id;
			  	}  
                          }
                        }
                }
	}  
 	
        _formGUID = formGUID;
	_FlowName = FlowName;
	_ruleParams = ruleParams;
	
        if (myOpenForm) {
                 try {
  		
                    setTimeout(function(){
			ebfExecuteRuleOnForm(myOpenForm,FlowName,ruleParams);
  	            },100);  
                                       
                 } catch(e) {                 
		    setTimeout(function(){
			ebfRunFlowAfterOpen(_formGUID,_FlowName,_ruleParams);
  	            },100);                     
                 }
	} 
			
	else if (myBevelForm) {
                 try {    
                       
 		    setTimeout(function(){
			ebfExecuteRuleOnFormOpenedBevel(ebfGetGUIDActualForm(),myBevelForm,FlowName,ruleParams);
  	            },100);               

                 } catch(e) {                 
		    setTimeout(function(){
			ebfRunFlowAfterOpen(_formGUID,_FlowName,_ruleParams);
  	            },100);                     
                 }
	} 

	else {
		setTimeout(function(){
			ebfRunFlowAfterOpen(_formGUID,_FlowName,_ruleParams);
		},100);

	}
  
}
```

---

## Executar Fluxo Servidor Assíncrono

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAsyncJavaFlowExecute` |
| **Código** | 951 |
| **Assinatura** | `Executar Fluxo Servidor Assíncrono (Fluxo;Variante;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função executa uma regra servidor de forma assíncrona.

Parâmetro(s):
1. Regra a ser executada.
2. Lista de parâmetros da regra. (Variante)
3. Fluxo de sucesso.
4. Lista de parâmetros do fluxo de sucesso. (Variante)
5. Fluxo de erro.
6. Lista de parâmetro do fluxo de erro. (Variante)

Retorno:
Não possui.

Observações:
1. O fluxo definido no terceiro parâmetro receberá automaticamente como parâmetro o retorno da regra executada caso
a mesma retorne. O primeiro parâmetro da regra deve ser reservado.
2. O fluxo definido no quinto parâmetro receberá automaticamente como parâmetro o detalhes do erro. O primeiro parâmetro da regra deve ser reservado.

### Código Cliente (JavaScript)

```javascript
function ebfAsyncJavaFlowExecute(ruleName, params, ruleOk, paramsOk, ruleFail, paramsFail) {
  var reducedName = (ruleName);
  var sysCode = ($mainform().document.WFRForm ? $mainform().document.WFRForm.sys.value : $mainform().sysCode);
  var formCode = ($mainform().document.WFRForm ? $mainform().document.WFRForm.formID.value : null);
  var isJava = false;
  try {
    window.eval(reducedName);
  } catch (ex) {
    try {
      reducedName = reduceVariable(ruleName);
      window.eval(reducedName);
    } catch (ex) {
      isJava = true;
    }
  }

  if (isJava) {
    let url = "executeRule.do";
    let data = "sys=".concat(sysCode)
      .concat("&formID=")
      .concat(formCode)
      .concat("&ruleName=")
      .concat(URLEncode(ruleName, postForceUTF8))
      .concat("&pType=2&action=executeRule");
    if (params && params.length > 0) {
      if (params instanceof Array) {
        for (i = 0; i < params.length; i++) {
          let value = normalizeRuleParam(params[i]);
          // Ex.: &P_0=valor
          data = data.concat("&P_").concat(i).concat("=").concat(URLEncode(value, postForceUTF8));
        }
      }
    }

    // Cria a requisição.
    let xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    let contentType = "application/x-www-form-urlencoded";
    if(isSafari) contentType = contentType.concat(";charset=").concat("UTF-8");
    xhr.setRequestHeader('Content-Type', contentType);
    xhr.onreadystatechange = function (e) {
      if (xhr.readyState === 4) {
        if (xhr.status >= 200 && this.status <= 299) {
          if (ruleOk) {
            paramsOk = paramsOk && paramsOk.length > 0 ? paramsOk : new Array();
            if (xhr.responseText) {
              $mainform().document._ruleReturn = null;
              eval(xhr.responseText);
              paramsOk[0] = $mainform().document._ruleReturn;
            }
            ebfFlowExecute(ruleOk, paramsOk);
          }
        } else {
          if (ruleFail) {
            paramsFail = paramsFail && paramsFail.length > 0 ? paramsFail : new Array();
            if (xhr.responseText) {
              eval(xhr.responseText);
              paramsFail[0] = xhr.status;
            }
            ebfFlowExecute(ruleFail, paramsFail);
          }
        }
      }
    };
    xhr.send(data);
  }
}
```

---

## Executar Função

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExecuteCustomJSFunction` |
| **Código** | 701 |
| **Assinatura** | `Executar Função (Variante;Letras;Variante)` |
| **Parâmetros** | Variante;Letras;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe como parâmetro um objeto e uma função que pertence aquele objeto e executa passando parâmetros se houver.

Parâmetro(s):
1. Objeto. (Variante, Opcional)
2. Nome da função. (Letras)
3. Lista de parâmetros. (Variante, Opcional)

Retorno:
O retorno da função chamada. (Variante)

Observação:
Caso o 1º parâmetro não seja informado, implicitamente será obtido o objeto Window (equivalente ao retorno da função Obter Formulário Atual na maioria dos casos).

### Código Cliente (JavaScript)

```javascript
function ebfExecuteCustomJSFunction(obj, fun, params){
  if(typeof(fun) === "string"){
    if(typeof(obj) !== "object" || obj === null)
      obj = window;
    return obj[fun].apply(obj, params);
  }
}
```

---

## Executar JavaScript

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExecuteJS` |
| **Código** | 598 |
| **Assinatura** | `Executar JavaScript(Letras):Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Executa um comando JavaScript passado como parâmetro. 

Parâmetro:
1. Comando JavaScript.

Retorno: 
Retorna o resultado do comando executado. (Variante) 

Exemplo:
Parâmetro: alert("Messagem a ser Enviada");

### Código Servidor (Java)

```java
protected final Variant ebfExecuteJS(Variant variant) throws Exception {
    client.executeJavascript(variant.getString(), this);
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfExecuteJS(js, context) {
  return executeJS.call(this, js, context);
}
```

---

## Executar JavaScript em um Contexto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExecuteJSFromWindow` |
| **Código** | 753 |
| **Assinatura** | `Executar JavaScript em um Contexto (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Executa um comando JavaScript a partir de um contexto específico. 

Parâmetro(s):
1. Referência do contexto. (Variante)
2. Comando JavaScript. (Letras)

Retorno: 
Retorna o resultado do comando executado. (Variante) 

Observações:
1. Caso o primeiro parâmetro seja nulo, a função será executada a partir do contexto principal do formulário.
2. O primeiro parâmetro pode ser a referência do contexto (objeto window) ou do iframe (elemento HTML).

Exemplo:
1º Parâmetro: referência de um elemento iframe;
2° Parâmetro: alert("Messagem a ser enviada");

### Código Cliente (JavaScript)

```javascript
function ebfExecuteJSFromWindow(newWindow, jsQuery) {
  try {
    if(!newWindow) {
     return eval(jsQuery);
    } else if(newWindow instanceof HTMLIFrameElement) {
      newWindow = newWindow.contentWindow;     
    }
    return newWindow.eval(jsQuery);     
  } catch(e) {
    handleException(new Error(e));
  }
}
```

---

## Executar Linha De Comando Numa Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfShellExecuteAtFolder` |
| **Código** | 382 |
| **Assinatura** | `Executar Linha De Comando Numa Pasta (Variante, Variante, Letras, Lógico) : Letras` |
| **Parâmetros** | Variante;Variante;Letras;Lógico |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa uma linha de comando no "SHELL" do SERVIDOR.

Parâmetro(s):
1. Comando a ser executado e seus argumentos. (Variante)
2. Lista contendo variáveis de ambiente a serem utilizadas para executar o comando. (Variante)
3. Pasta onde será executado o comando ou Nulo para executar no diretório corrente. (Letras)
4. Continuar após terminar o comando? (Lógico)

Retorno:
Resultado do comando executado. (Letras)

Observações:
1. Se o 4° parâmetro estiver verdadeiro, o fluxo só vai continuar após terminar a execução do comando.
2. O comando é executado somente no servidor.
3. Uma vez definido o 4° parâmetro como "Verdadeiro", o resultado do comando será retornado. Caso contrário, retornará Nulo.
4. O diretório corrente é em relação ao servidor de aplicações.

Exemplo:
Assumindo que o comando do 1° parâmetro seja: dir> nome.txt, 2° parâmetro nulo, 3° parâmetro o caminho da pasta, e o 4° parâmetro
"true". o resultado, será a criação do arquivo "nome.txt" com os diretórios do mesmo.

### Código Servidor (Java)

```java
protected final Variant ebfShellExecuteAtFolder(Variant cmdLineListVar, Variant envListVar, Variant folderVariant, Variant syncProcess)
      throws Exception {
    // Prepare the command
    String[] cmdLineArr = null;
    if (cmdLineListVar.getObject() instanceof List) {
      List<Object> cmdLineList = List.class.cast(cmdLineListVar.getObject());
      cmdLineArr = new String[cmdLineList.size()];

      for (int i = 0; i < cmdLineList.size(); i++) {
        Object cmd = cmdLineList.get(i);
        if (cmd != null) {
          cmdLineArr[i] = cmd.toString();
        }
      }
    } else if (!cmdLineListVar.isNull()) {
      cmdLineArr = new String[1];
      cmdLineArr[0] = cmdLineListVar.toString();
    }

    // Prepare the environment variables
    String[] envArr = null;
    if (envListVar.getObject() instanceof List) {
      List<Object> envList = List.class.cast(envListVar.getObject());
      envArr = new String[envList.size()];

      for (int i = 0; i < envList.size(); i++) {
        Object env = envList.get(i);
        if (env != null) {
          envArr[i] = env.toString();
        }
      }
    } else if (!envListVar.isNull()) {
      envArr = new String[1];
      envArr[0] = envListVar.toString();
    }
    
    // Folder where the process will be executed
    java.io.File folderFile = null;

    String folder = folderVariant.getString();
    if (folder != null && folder.trim().length() > 0) {
      folderFile = new java.io.File(folder.trim());
    }

    // Execute the process
    Process process = Runtime.getRuntime().exec(cmdLineArr, envArr, folderFile);
    if (syncProcess.getBoolean()) {
      StringBuilder result = new StringBuilder();

      java.io.BufferedReader in = null;
      try {
        in = new java.io.BufferedReader(new java.io.InputStreamReader(process.getInputStream()));

        String line;
        while ((line = in.readLine()) != null) {
          result.append(line).append("\n");
        }
      } finally {
        if (in != null) {
          in.close();
        }
      }

      return VariantPool.get(result);
    }

    return Variant.VARIANT_NULL;
  }
```

---

## Executar Linha de comando

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfShellExecute` |
| **Código** | 98 |
| **Assinatura** | `Executar Linha de comando (Letras;Lógico): Letras` |
| **Parâmetros** | Letras;Lógico |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa uma linha de comando no "SHELL" do SERVIDOR, retornando o resultado.

Parâmetro(s):
1. Linha de comando a ser executada. (Letras)
2. Continuar após acabar o comando? (Lógico)

Retorno:
Resultado do comando executado quando necessário. (Só retornará resultado, caso o comando executado necessite de retorno.) (Letras)

Observações:
1. Se o 2° parâmetro estiver verdadeiro, o fluxo só vai continuar após terminar de executar o comando.
2. O comando é executado somente no servidor.
3. Caso o comando executado não possua retorno, será retornado nulo.

Exemplo:
Uma função assumindo como parâmetros  "cmd /c mkdir c:\softwell" (Letras) e Falso (Lógico). Esse exemplo cria uma
pasta com o nome "softwell".

### Código Servidor (Java)

```java
protected final Variant ebfShellExecute(Variant cmdLine) throws Exception {
    return ebfShellExecute(cmdLine, Variant.VARIANT_TRUE);
  }
  protected final Variant ebfShellExecute(Variant cmdLine, Variant waitFor) throws Exception {
    Process p = Runtime.getRuntime().exec(cmdLine.getString());
    if (waitFor.getBoolean()) {
      BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
      String r = "";
      String line;
      while ((line = input.readLine()) != null) {
        r += (line + "\n");
      }
      input.close();
      return VariantPool.get(r);
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Executar Processamento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRunProcessing` |
| **Código** | 1181 |
| **Assinatura** | `Executar Processamento (Processamento;Variante): Variante` |
| **Parâmetros** | Processamento;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função executa um processamento de um regra que está armazenado no sistema.

Parâmetros:
1. Identificador único do processamento (Processamento)
2. Parâmetro do processamento (Variante)

Retorno
Retorna o valor da execução do processamento

### Código Servidor (Java)

```java
protected final Variant ebfRunProcessing(Variant guid, Variant param) throws Exception {
  if (!guid.isNull()) {
    String sourceCode = "";
    String uuid = guid.getString();
    String query = "SELECT FR_PRO_CODIGO_FONTE FROM FR_PROCESSAMENTO WHERE FR_PRO_GUID = ?";

    try (java.sql.PreparedStatement preparedStatement = connection.getPreparedStatement(query)) {
      preparedStatement.setString(1, uuid);

      try (ResultSet resultSet = preparedStatement.executeQuery()) {
        while (resultSet.next()) {
          sourceCode = resultSet.getString(1);
        }
      }

      String javaContent = parseJavaContent(this, sourceCode);
      WFRRule function = manager.getJavaFunction(javaContent, connection, client, fields);
      return function.run(new Variant(this), param);
    } catch (Exception e) {
      logger.debug(WFRSystem.DEFAULT_USER, WFRSystem.DEFAULT_SYSTEM, "Erro executando processamento com identificador: " + guid.getString(), e);
      throw new Exception("Recurso indisponível no sistema!");
    }
  }

  return Variant.VARIANT_STRING_EMPTY;
}
```

---

## Expressão Regular - Obter Subsequências

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRegExpGetMatches` |
| **Código** | 719 |
| **Assinatura** | `Expressão Regular - Obter Subsequências  (Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função retorna as subsequências correspondentes à expressão regular passada como parâmetro.

Parâmetro(s):
1. Expressão Regular. (Letras) (Ver Observação 1)
2. Texto. (Letras)

Retorno:
Lista de subsequências. (Variante)

Observações:
1. O primeiro parâmetro deve conter a expressão regular, as expressões tem formatos divergentes na camada cliente e servidor.
  Como exemplo, temos a seguinte expressão que retorna todos caracteres diferente de número:
  -  Camada Cliente:
  Exemplo:
    /EXPRESSÃO_REGULAR/MODIFICADORES
    /[^0-9]/gm (Expressão exemplo)
  - Camada Servidor:
  Exemplo:
    EXPRESSÃO_REGULAR
    [^0-9] (Expressão exemplo)
2. Para validar as expressões tando na camada cliente(JavaScript) quanto na camada servidor(Java), sugerimos a utilização da ferramenta Regex101 que, ao inserir a expressão regular é possível verificar a formatação da expressão de acordo com a camada clicando na opção 'Code Generator'.
Regex101:
https://regex101.com/
3. O retorno desta função é uma lista de listas contendo todas as subsequências encontradas. As listas possuem em seu primeiro índice a subsequência geral da expressão seguida das subsequências obtidas pelos grupos de captura.

### Código Servidor (Java)

```java
protected final Variant ebfRegExpGetMatches(Variant regex, Variant text) throws Exception {
  final java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex.getString());
  final java.util.regex.Matcher matcher = pattern.matcher(text.getString());
  
  List list = new ArrayList();
  List listMatch;

  while (matcher.find()) {
    listMatch = new ArrayList();
    
    listMatch.add(matcher.group(0));
    for (int i = 1; i <= matcher.groupCount(); i++) {
      listMatch.add(matcher.group(i));
    }
    list.add(listMatch);
  }
  
  return VariantPool.get(list);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRegExpGetMatches(regexp, text){
  var sub, re, i;
  regexp += '';
  text += '';
  subsequences = []; 
  re = new RegExp(regexp.split('/')[1], regexp.split('/')[2]);
  for(i = 0; ; i++){
    sub = re.exec(text);
    if(sub === null || i >= re.lastIndex){
      break;
    } else {
      subsequences.push(sub);
    }
  }
  return subsequences;
}
```

---

## Expressão Regular - Trocar Subsequências

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRegExpReplaceText` |
| **Código** | 718 |
| **Assinatura** | `Expressão Regular - Trocar Subsequências (Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função troca todas as subsequências de um texto por outro valor através de uma expressão regular.

Parâmetro(s):
1. Expressão Regular. (Letras) (Ver Observação 1)
2. Texto. (Letras)
3. Novo Valor. (Letras)

Retorno:
Texto atualizado. (Letras)

Observações:
1. O primeiro parâmetro deve conter a expressão regular, as expressões tem formatos divergentes na camada cliente e servidor.
  Como exemplo, temos a seguinte expressão que retorna todos caracteres diferente de número:
  -  Camada Cliente:
  Exemplo:
    /EXPRESSÃO_REGULAR/MODIFICADORES
    /[^0-9]/gm (Expressão exemplo)

  - Camada Servidor:
  Exemplo:
    EXPRESSÃO_REGULAR
    [^0-9] (Expressão exemplo)
2. Para validar as expressões tanto na camada cliente (JavaScript) quanto na camada servidor (Java), sugerimos a utilização da ferramenta Regex101 que, ao inserir a expressão regular é possível verificar a formatação da expressão de acordo com a camada clicando na opção 'Code Generator'.
Regex101:
https://regex101.com
3. Mais informações para a camada cliente (JavaScript): 
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions

### Código Servidor (Java)

```java
protected final Variant ebfRegExpReplaceText(Variant regex, Variant text, Variant replaceText) throws Exception {
  final java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex.getString());
  final java.util.regex.Matcher matcher = pattern.matcher(text.getString());
    
  String textReplaced = matcher.replaceAll(replaceText.getString());
    
  return VariantPool.get(textReplaced);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRegExpReplaceText (regexp, text, replaceText){
  regexp += '';
  text += '';
  replaceText += '';
  var re = new RegExp(regexp.split('/')[1], regexp.split('/')[2]);
  return text.replace(re, replaceText);
}
```

---

## Faça com Barra de Progresso

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWithProgressBar` |
| **Código** | 48 |
| **Assinatura** | `Faça com Barra de Progresso(Lógico;Letras;Número):Lógico` |
| **Parâmetros** | Lógico;Letras;Número |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Mostra uma barra de progresso com a porcentagem percorrida, enquanto percorre os registros de uma tabela.

Parâmetro(s):
1. Valor lógico que representa a condição de parada da barra de progresso. (Lógico)
2. Mensagem que aparecerá na barra de progresso. (Letras)
3. Quantidade de registros da tabela. (Número)

Retorno:
Mostra a Barra de progresso baseado na quantidade de registros da tabela. (Lógico)

Observações:
1. Para percorrer todos os registros da tabela é necessário que haja um processamento com a função "Tabela - Próximo registro"
da categoria "Banco de Dados".
2. Essa função é muito utilizada dentro de um componente de decisão usado como estrutura de repetição.
3. Não é possível utilizar a função "Faça com Barra de Progresso" após o uso da função "Upload".
4. Não é possível executá-la dentro de subfluxo servidor chamado por um fluxo cliente.
5. Ao fechar a barra de progresso, o processo que estiver em execução não será cancelado.
6. Quando o 1° parâmetro for "true" será exibida a barra de progresso.

Exemplo: 
1. Em uma decisão, assumindo como parâmetros: 
1º Uma função "Existem registros" da categoria Banco de Dados.
2º Parâmetro: "Carregando..." (Letras).
3º Parâmetro: Quantidade de registros existentes na tabela passada no primeiro parâmetro. 
O resultado é uma barra de progresso que é executada enquanto tabela registros é percorrida. A mensagem mostrada na barra de progresso é "Carregando".

---

## Formatar Bytes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormatBytes` |
| **Código** | 949 |
| **Assinatura** | `Formatar Bytes (Inteiro): Letras` |
| **Parâmetros** | Inteiro |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Formata o valor passado no primeiro parâmetro de acordo o tamanho em bytes.

Parâmetro:
1. Valor em bytes. (Inteiro)

Retorno:
Valor formatado. (Letras)

Observação:
Os possíveis valores de saída para formatação são: Bytes, KB, MB, GB, TB e PB.

### Código Servidor (Java)

```java
protected final Variant ebfFormatBytes (Variant bytes) throws Exception {
  return VariantPool.get(wfr.util.Functions.formatBytes(bytes.getLong()));    
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormatBytes(bytes, decimals = 2) {
  if (!bytes) return '0 Bytes';
  const k = 1024;
  const dm = decimals < 0 ? 0 : decimals;
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}
```

---

## Gerar GUID

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGenerateGUID` |
| **Código** | 60 |
| **Assinatura** | `Gerar GUID ():Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

A função gera um GUID e o retorna.

Parâmetro:
Não possui.

Retorno:
GUID (Identificador Único Universal) gerado. (Variante)

Observações:
1. GUID significa - Globally Unique Identifier (Identificador Único Universal). 
2. Como não existem dois GUIDs idênticos, não importa quantos são gerados, eles servem para identificar de forma única
senhas, manipuladores, chaves, etc.

Exemplo:
Ao gerar um GUID, o retorno seria por exemplo: "648AAF7A-EB32-F348-EB9D-C6FD0A15D78B".

### Código Servidor (Java)

```java
public static Variant ebfGenerateGUID() {
  RandomGUID GUID = new RandomGUID();
  String key = GUID.toString();
  return VariantPool.get(key);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGenerateGUID_S4() {
  return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
}

function ebfGenerateGUID() {
  var bloc1 = ebfGenerateGUID_S4() + ebfGenerateGUID_S4();
  var bloc2 = ebfGenerateGUID_S4();
  var bloc3 = ebfGenerateGUID_S4();
  var bloc4 = ebfGenerateGUID_S4();
  var bloc5 = ebfGenerateGUID_S4() + ebfGenerateGUID_S4() + ebfGenerateGUID_S4();

  return (bloc1 + "-" + bloc2 + "-" + bloc3 + "-" + bloc4 + "-" + bloc5 + "".toUpperCase());
}
```

---

## Gmail - Enviar Email - Oauth 2.0

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfsendGmailOauth2` |
| **Código** | 1023 |
| **Assinatura** | `Gmail - Enviar Email - Oauth 2.0 (Letras;Letras;Letras;Variante;Letras;Letras;Lógico;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Letras;Letras;Lógico;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem instantaneamente para o(s) destinatário(s), utilizando o SMTP do GMAIL com o Oauth2.0.

1. Token de acesso. (Letras)
2. Nome do Aplicativo (Letras) (Ver Observação 4)
3. Remetente (Letras)
4. Destinatários (Variante) (Ver Observação 2)
5. Assunto (Letras)
6. Mensagem (Variante)
7. HTML? (Lógico)
8. Lista de anexos (Variante) (Ver Observação 3)

Retorno:
Não possui.

Observações:
1. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
2. Para passar apenas um anexo, é possível passar apenas o caminho do arquivo. Se for preciso passar 
vários anexos, é necessário passar uma lista de caminhos dos arquivos.
3. Caso o 7º parâmetro seja Verdadeiro, a mensagem será renderizada como HTML, obedecendo a todas as 
regras da linguagem.
3. O 3º parâmetro, além do email do remetente, também poderá ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
    Ex: Passando Nome e email: Carlos Santos <carlos@gmail.com>
         Passando apenas email: carlos@gmail.com
4. Nome do aplicativo cadastrado no Google Cloud.

### Código Servidor (Java)

```java
protected final void ebfsendGmailOauth2(Variant accessToken,  Variant appName, Variant fromVar, Variant toVar, Variant subjectVar, Variant bodyVar, Variant html, Variant attachmentVar) throws Exception {
  if(!accessToken.isNull() && !accessToken.getString().isEmpty()) {

    String token = accessToken.getString();
    String applicationName = appName.getString();
    String from = fromVar.getString();
    Object to = toVar.getObject();
    String subject = subjectVar.getString();
    Object body = bodyVar.getObject();
    boolean isHTML = html.getBoolean();
    Object attachments = attachmentVar.getObject();

    WFRMailSenderOauth2 mailSender = new WFRMailSenderOauth2(token, applicationName, getSystem());
    mailSender.sendGmail(from, to, subject, body, isHTML, attachments);
  }
}
```

---

## Hotmail - Enviar Email - Oauth 2.0

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfsendOauth2Hotmail` |
| **Código** | 1140 |
| **Assinatura** | `Hotmail - Enviar Email - Oauth 2.0 (Letras;Letras;Variante;Letras;Letras;Lógico;Variante)` |
| **Parâmetros** | Letras;Letras;Variante;Letras;Letras;Lógico;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem instantaneamente para o(s) destinatário(s), utilizando o SMTP do Hotmail com o Oauth2.0.

Parâmetro(s):
1. Token de acesso. (Letras) (Ver Observação 1)
2. Remetente. (Letras)
3. Destinatários. (Variante) (Ver Observação 2)
4. Assunto. (Letras)
5. Mensagem. (Variante)
6. HTML? (Lógico)
7. Lista de anexos. (Variante) (Ver Observação 3)

Retorno:
Não possui.

Observações:
1. Token de acesso gerado fazendo uma requisção para o serviço de Cloud da Microsoft(Azure). 
2. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
3. Para passar apenas um anexo, é possível passar apenas o caminho do arquivo. Se for preciso passar 
vários anexos, é necessário passar uma lista de caminhos dos arquivos.
3. Caso o 7º parâmetro seja Verdadeiro, a mensagem será renderizada como HTML, obedecendo a todas as 
regras da linguagem.
3. O 3º parâmetro, além do email do remetente, também poderá ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
    Ex: Passando Nome e email: Carlos Santos <carlos@gmail.com>
         Passando apenas email: carlos@gmail.com

### Código Servidor (Java)

```java
protected final void ebfsendOauth2Hotmail(Variant varToken, Variant fromVar, Variant toVar, Variant subjectVar,
    Variant bodyVar, Variant html, Variant attachmentVar) throws Exception {

  String token = varToken.getString();
  String from = fromVar.getString();
  Object to = toVar.getObject();
  String subject = subjectVar.getString();
  Object body = bodyVar.getObject();
  boolean isHTML = html.getBoolean();
  Object attachments = attachmentVar.getObject();

  WFRMailSenderOauth2 mailSenderOauth2 = new WFRMailSenderOauth2(getSystem());
  mailSenderOauth2.sendHotmail(token, from, to, subject, body, isHTML, attachments);
}
```

---

## ID do Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetUserCode` |
| **Código** | 31 |
| **Assinatura** | `ID do Usuário():Inteiro` |
| **Retorno** | Número |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

A função retorna o código do usuário do sistema contido na tabela FR_USUARIO.

Parâmetro:
Não possui.

Retorno:
Retorna o código do usuário conectado ao sistema (Tabela FR_USUARIO). (Número)

Exemplo:
Se o usuário for "Master", o retorno será "1".

### Código Servidor (Java)

```java
protected final Variant ebfGetUserCode() throws Exception {
    return VariantPool.get(getData().getUser().getCode());
  }
```

---

## Identificador da Sessão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSessionID` |
| **Código** | 51 |
| **Assinatura** | `Identificador da Sessão():Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Quando o usuário conecta ao sistema, uma sessão é gerada com um identificador único, essa função tem como objetivo
retornar o identificador da sessão do usuário conectado ao sistema.

Parâmetro:
Não possui.

Retorno:
Retorna o identificador da sessão do usuário conectado ao sistema. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfGetSessionID() throws Exception {
    return VariantPool.get(connection.getSessionID());
  }
```

---

## Imagem - Rotacionar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfImageRotate` |
| **Código** | 426 |
| **Assinatura** | `Imagem - Rotacionar (Variante, Fracionado)` |
| **Parâmetros** | Variante;Fracionado |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Rotaciona a imagem com a quantidade de graus definido.

Parâmetro(s):
1. Referência da imagem em bytes. (Variante)
2. Ângulo desejado em graus. (Fracionado)

Retorno:
Referência da imagem rotacionada. (Variante)

Observações:
1. Ao rotacionar a imagem, a mesma é ajustada de acordo com o tamanho do componente.
2. A qualidade da imagem é reduzida após a rotação.

### Código Servidor (Java)

```java
protected final Variant ebfImageRotate(Variant imageData, Variant angle) throws Exception {
    if (imageData.getObject() instanceof byte[]) {
      javax.swing.ImageIcon imageIcon = new javax.swing.ImageIcon((byte[]) imageData.getObject());

      java.awt.image.BufferedImage bufferedImage = new java.awt.image.BufferedImage(imageIcon.getIconWidth(), imageIcon.getIconHeight(),
          java.awt.image.BufferedImage.TYPE_INT_RGB);

      java.awt.Graphics2D imageGraphics = bufferedImage.createGraphics();
      imageGraphics.rotate(Math.toRadians(angle.getDouble()), (imageIcon.getIconWidth() / 2), (imageIcon.getIconHeight() / 2));
      imageGraphics.drawImage(imageIcon.getImage(), 0, 0, null);

      java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
      javax.imageio.ImageIO.write(bufferedImage, "JPG", out);

      return new Variant(out.toByteArray());
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Importar Scripts Assíncrono

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLoadScript` |
| **Código** | 849 |
| **Assinatura** | `Importar Scripts Assíncrono (Variante;Fluxo;Variante)` |
| **Parâmetros** | Variante;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função realiza a importação de um ou mais scripts de forma assíncrona, e ao final da importação um fluxo de callback é chamado.

Parâmetro(s):
1. Lista de URL's. (Variante)
2. Fluxo de Callback. (Fluxo)
3. Lista de Parâmetros. (Variante)

Retorno:
Não possui.

Observações: 
1. O 2° parâmetro será chamado após a importação a importação.
2. O 3° parâmetro será passado para o fluxo de callback.

### Código Cliente (JavaScript)

```javascript
function ebfLoadScript(url, ruleCallback, paramsRuleCallback){
  loadAsyncWfr(url, callbackFunctionLoad);  
 
  function callbackFunctionLoad(){
    loadCallbackFunction();   
  }  

  window.loadCallbackFunction = function(){  
    var parametros = paramsRuleCallback;
    var ruleCallbackExec = ruleCallback;

    if(ruleCallbackExec){
      executeRuleFromJS(ruleCallbackExec, parametros);
    }
  }
}
```

---

## Impressão Direta - Imprimir Texto ou Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPrintDirect` |
| **Código** | 816 |
| **Assinatura** | `Impressão Direta - Imprimir Texto ou Arquivo (Letras;Lógico;Letras)` |
| **Parâmetros** | Letras;Lógico;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função realiza a impressão do texto ou do arquivo de acordo as informações passada por parâmetro.

Para mais informações, acesse: https://manual.softwell.com.br/#/configuracao_impressao

Parâmetro(s):
1. Texto ou Link do Arquivo (Letras).
2. É arquivo? (Lógico) (Ver Observação 3).
3. Impressora (Letras) (Opcional) (Obtida através da função 'Impressão Direta - Obter Lista de Impressoras').

Retorno:
Não possui.

Observações:
1. Para que esta função funcione corretamente é necessário utilizar o Webrun Agent na máquina que está executando a ação.
2. A impressão será realizada na impressora definida como padrão ou na impressora informada no parâmetro 3.
3. Ao informar o valor como Verdadeiro (true), será impresso o arquivo informado no primeiro parâmetro, caso contrário 
será impresso o texto.
4. Tipos de arquivo suportados: .pdf .png .jpeg.
5. No caso da impressão de arquivo, o mesmo deve estar disponível via HTTP, Ex.: http://localhost:8049/webrunstudio/tmp/<nome do arquivo>.pdf
6. O link deve ser acessível externamente ou dentro da rede onde está o serviço.

### Código Cliente (JavaScript)

```javascript
function ebfPrintDirect(texto, file, printerName){
  sendToPrinter(texto, file, printerName);  
}
```

---

## Impressão Direta - Obter Lista de Impressoras

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetPrinterList` |
| **Código** | 1043 |
| **Assinatura** | `Impressão Direta - Obter Lista de Impressoras (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém a lista de todas as impressoras disponíveis no momento.
Essa função é executada de forma assíncrona, isso quer dizer que, o resultado da função será enviado para outro fluxo 
definido como Callback.

Para mais informações, acesse: https://manual.softwell.com.br/#/configuracao_impressao

Parâmetro(s):
1. Fluxo de Callback (Fluxo que receberá a lista com todas as impressoras do sistema)
2. Lista de Parâmetros (Lista) (Lista de Parâmetros extras que o fluxo de Callback)

Retorno:
Não possui.

Observações:
1. O Fluxo informado no parâmetro receberá no primeiro parâmetro uma lista com todas as impressoras disponíveis.

### Código Cliente (JavaScript)

```javascript
function ebfGetPrinterList(ruleName, ruleParams) {
  getPrinterList(ruleName, ruleParams);
}
```

---

## Iniciar Captura Digital do Logon

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfopenLogonDigitalCapture` |
| **Código** | 528 |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função inicia Captura Digital do Logon.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfopenLogonDigitalCapture() {
 openLogonDigitalCapture(ebfGetSystemID());
}
```

---

## Iniciar Download

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDonwloadStart` |
| **Código** | 124 |
| **Assinatura** | `Iniciar Download(URL, Mostrar Aviso)` |
| **Parâmetros** | Letras;Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Utilizada para fazer o download de um arquivo passando o endereço do mesmo.
O caminho deve ser relativo ao diretório do deploy webrun, e deve começar por "/tmp/" ou "/download/" ou "/upload/" 
ou "/downloads/" ou "/uploads.

Parâmetro(s):
1. URL do arquivo que será baixado. (Ex: /tmp/arquivo.zip) (Letras)
2. WEB: Indica se deve ser exibido uma mensagem informativa, com o link do arquivo. (Lógico)

Retorno:
WEB: Não possui.
Maker Mobile: Retorna o caminho completo do arquivo salvo.

Observações:
1. Caso o caminho da URL não seja relativo ao diretório do deploy do webrun, o download não iniciará automaticamente.
Ex: http://sistemas.webrun.com.br/tmp/arquivo.zip
2. Se o 2° parâmetro for verdadeiro aparecerá uma mensagem informando o endereço do arquivo, e iniciará o download. Se for falso apenas iniciará o download do arquivo. No Maker Mobile: Indica o nome (com extensão) do arquivo que será baixado.
3. Caso a função seja utilizada para a plataforma Maker Mobile, o segundo parâmetro deverá ser informado o nome (com extensão) para o arquivo que será salvo. A função retornará automaticamente o caminho do arquivo salvo (Maker Mobile)

### Código Servidor (Java)

```java
protected final Variant ebfDonwloadStart(Variant url, Variant showWarning) throws Exception {
    return callClientFunction("ebfDonwloadStart", url, showWarning);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDonwloadStart(url, showWarning) {
  const execWin = ((d && d.n && d.n.isModal === true) || ($isMwebSession())) ? $mainframe() : top;
  execWin.IframeTransporter('download?download_file=' + URLEncode(url, 'GET') + '&sys=' + sysCode + '&formID=' + URLEncode(idForm, 'GET'));
  if (showWarning)
    interactionInfo(getLocaleMessage("INFO.DOWNLOAD") + "\n<a href=\"" + url + "\" target=\"_NEW\">" + url + "</a>");
}
```

---

## Instalar os certificados para conexão HTTPS

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTTPSInstallCert` |
| **Código** | 371 |
| **Assinatura** | `Instalar os certificados para conexão HTTPS(Letras;Letras;Letras;Inteiro)` |
| **Parâmetros** | Letras;Letras;Letras;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Instala os certificados necessários para a comunicação HTTPS.

Parâmetro(s):
1. Caminho completo para o arquivo com os certificados para comunicação HTTPs. (Letras)
2. Senha para o arquivo com os certificados para comunicação HTTPs. (Letras)
3. Hostname HTTPs. (Ex.: hnfe.sefaz.ba.gov.br) (Letras)
4. Porta HTTPs. (Ex.: 443) (Inteiro)

Retorno:
Lógico indicando se o certificado foi incluído com sucesso. (Variante)

### Código Servidor (Java)

```java
private static class SavingTrustManager implements javax.net.ssl.X509TrustManager {
    private final javax.net.ssl.X509TrustManager tm;
    public java.security.cert.X509Certificate[] chain;
    SavingTrustManager(javax.net.ssl.X509TrustManager tm) { this.tm = tm; }
    public java.security.cert.X509Certificate[] getAcceptedIssuers() { throw new UnsupportedOperationException(); }
    public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException { throw new UnsupportedOperationException(); }
    public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException { this.chain = chain; tm.checkServerTrusted(chain, authType); }
  }
  protected final Variant ebfHTTPSInstallCert(Variant fileKeyStore, Variant passKeyStore, Variant host, Variant port) throws Exception {
    if ((port == null) || (port == Variant.VARIANT_NULL) || (port.isNull()) || (!port.isNumeric())) {
      port = VariantPool.get(443);
    }
    // Abrindo arquivo com certificados
    char[] passphrase = passKeyStore.getString().toCharArray();
    java.io.InputStream in = new java.io.FileInputStream(fileKeyStore.getString());
    java.security.KeyStore ks = java.security.KeyStore.getInstance(java.security.KeyStore.getDefaultType());
    ks.load(in, passphrase);
    in.close();
    // Conectando
    javax.net.ssl.SSLContext context = javax.net.ssl.SSLContext.getInstance("TLS");
    javax.net.ssl.TrustManagerFactory tmf = javax.net.ssl.TrustManagerFactory.getInstance(javax.net.ssl.TrustManagerFactory.getDefaultAlgorithm());
    tmf.init(ks);
    javax.net.ssl.X509TrustManager defaultTrustManager = (javax.net.ssl.X509TrustManager) tmf.getTrustManagers()[0];
    SavingTrustManager tm = new SavingTrustManager(defaultTrustManager);
    context.init(null, new javax.net.ssl.TrustManager[]{tm}, null);
    javax.net.ssl.SSLSocketFactory factory = context.getSocketFactory();
    javax.net.ssl.SSLSocket socket = (javax.net.ssl.SSLSocket) factory.createSocket(host.getString(), port.getLong().intValue());
    socket.setSoTimeout(10000);
    // verificando
    try {
      socket.startHandshake();
      socket.close();
    } catch (javax.net.ssl.SSLHandshakeException e) {
      // Instalando
      java.security.cert.X509Certificate[] chain = tm.chain;
      for (int i = 0; i < chain.length; i++) {
        java.security.cert.X509Certificate cert = chain[i];
        String alias = host + "-" + (i + 1);
        ks.setCertificateEntry(alias, cert);
        java.io.OutputStream out = new java.io.FileOutputStream(fileKeyStore.getString());
        ks.store(out, passphrase);
        out.close();
      }
    }
    return Variant.VARIANT_TRUE;
  }
```

---

## Interação de Confirmação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConfirm` |
| **Código** | 126 |
| **Assinatura** | `Interação de Confirmação(Letras):Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

É passado um parâmetro que será um texto, onde esse será confirmado ou negado conforme a escolha do usuário.
Essa função abre uma caixa com opções "Ok" ou "Cancel".
Ao clicar em "Ok" usuário confirmará uma operação retornando verdadeiro,  ou cancelará a mesma retornando falso.

Parâmetro:
1. Texto que servirá para interagir com o usuário. (Letras)

Retorno:
Se o usuário clicar em "OK" retorna "verdadeiro", se clicar em "Cancel", retorna "falso". (Lógico)

Exemplo:
Passando como parâmetro "Confirmar operação?", o resultado será uma caixa de diálogo com os botões "OK" e "Cancel". Se o usuário clicar "Ok" o retorno será verdadeiro, caso contrário, será falso.

### Código Cliente (JavaScript)

```javascript
function ebfConfirm (src) {
  return window.confirm(src);
}
```

---

## Invocar Método

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInvokeMethod` |
| **Código** | 148 |
| **Assinatura** | `Invocar Método (Variante;Letras;Variante)` |
| **Parâmetros** | Variante;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Invoca um método no objeto passado por parâmetro.

Parâmetro(s):
1. Objeto que contém o método. (Variante)
2. Método a ser executado. (Letras)
3. Lista de parâmetros do método. (Variante)

Retorno:
Retorna o resultado da execução do método. (Variante)

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
  protected static final Variant ebfInvokeMethod(Object objectVar, Variant methodVar, Variant paramsVar) throws Exception {
    Object object = null;
    if (objectVar instanceof Variant)
      object = ((Variant)objectVar).getObject();
    else  
      object = objectVar;
    String methodName = methodVar.getString().trim();
    if (object != null && methodName.length() > 0) {
      if (paramsVar.getType() == WFRRuleType.NULL) {
        java.lang.reflect.Method method = object.getClass().getMethod(methodVar.getString(), (Class[]) null);
        return VariantPool.get(method.invoke(object, (Object[]) null));
      } else if (paramsVar.getObject() instanceof List) {
        List<?> paramsList = (List<?>) paramsVar.getObject();
        if (paramsList != null && paramsList.size() > 0) {
          List<java.lang.reflect.Method> methodsList = new ArrayList<java.lang.reflect.Method>();
          // Carrega os possíveis métodos a serem chamados
          java.lang.reflect.Method[] methods = object.getClass().getMethods();
          for (java.lang.reflect.Method method : methods) {
            if (method.getName().equals(methodName)) {
              if (method.getParameterTypes().length == paramsList.size()) {
                methodsList.add(method);
              }
            }
          }
          // Pra cada Method encontrado tenta executá-lo
          for (java.lang.reflect.Method method : methodsList) {
            // Tipos dos parâmetros do método
            Object[] params = new Object[paramsList.size()];
            for (int i = 0; i < paramsList.size(); i++) {
              if (paramsList.get(i) instanceof Variant)
                params[i] = ((Variant) paramsList.get(i)).toObject(method.getParameterTypes()[i]);
              else
                params[i] = new Variant(paramsList.get(i)).toObject(method.getParameterTypes()[i]);
            }
            // Executa o método e retorna o resultado da execução
            try {
              Object retorno = method.invoke(object, params);
              if (retorno == null) {
                return Variant.VARIANT_NULL;
              } else {
                return VariantPool.get(retorno);
              }
            } catch (Exception ex) {
              // Abafa o erro e tenta novamente no próximo provável método
              continue;
            }
          }
        }
      }
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfInvokeMethod(object, methodName, params){ 

  if (!object){
    throw 'Objeto inválido';
  }
  if (methodName == null || methodName == ''){
    throw 'Nome do método inválido';
  }
  var _object = object;
  var _params = params;

  var callCmd = '_object.'+methodName+'(';
  if (params != null){
    if (params.length>0){
      callCmd += '_params[0]';
      for(index=1; index<params.length; index++) {
        callCmd += ', _params['+index+']';
      }
    }
  }
  callCmd += ')';
  return eval(callCmd);
}
```

---

## JWT - Gerar Token

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGenerateJWTToken` |
| **Código** | 1145 |
| **Assinatura** | `JWT - Gerar Token (Variante;Letras;Letras;Inteiro): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função gera um JSON Web Token de acordo com os valores inseridos por parâmetro.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Chave privada. (Letras)
3. Charset. (Letras, Opcional)
4. Tempo de expiração. (Inteiro)

Retorno: 
JWT Token. (Variante)

Observações:
1. O tempo de expiração deve ser informado em segundos como unidade de tempo.
2. A chave privada será criptografada utilizando o padrão SHA-256 e deverá conter no mínimo 32 caracteres.
3. O terceiro parâmetro aceito o charset ISO-8859-1 ou UTF-8.

### Código Servidor (Java)

```java
protected final Variant ebfGenerateJWTToken(Variant payload, Variant secretKey, Variant charset, Variant expiryTime) throws Exception {
    String result = null;
    if (payload.getObject() instanceof jakarta.json.JsonObject) {
      jakarta.json.JsonObject json = ((jakarta.json.JsonObject) payload.getObject());

      if (secretKey.getString().length() < 32) {
        throw new wfr.exceptions.WFRException(wfr.exceptions.ExceptionMessage.ERROR_INVALID_SECRETKEY_JWT);
      }

      Map<String, Object> claims = new HashMap<>();

      for (Object keyObject : json.keySet()) {
        Object value = null;
        switch (json.get(keyObject.toString()).getValueType().toString().toUpperCase()) {

        case "STRING":
          value = json.getString(keyObject.toString());
          break;
        case "NUMBER":
          value = json.getInt(keyObject.toString());
          break;
        case "TRUE":
        case "FALSE":
          value = json.getBoolean(keyObject.toString());
          break;
        default:
          break;
        }
        claims.put(keyObject.toString(), value);
      }

      String jwtToken = io.jsonwebtoken.Jwts.builder().setHeaderParam("typ", "JWT").setClaims(claims)
          .setIssuedAt(Date.from(java.time.Instant.now()))
          .setExpiration(Date.from(java.time.Instant.now().plus(expiryTime.getLong(),  java.time.temporal.ChronoUnit.SECONDS)))
          .signWith(io.jsonwebtoken.security.Keys.hmacShaKeyFor(secretKey.getString().getBytes()), io.jsonwebtoken.SignatureAlgorithm.HS256).compact();

      result = jwtToken;
    }
    return new Variant(result);
  }
```

---

## JWT - Obter Payload

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetPayloadJWT` |
| **Código** | 1032 |
| **Assinatura** | `JWT - Obter Payload (Variante;Letras): Letras` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função retorna uma payload de um token JWT.

Parâmetro(s):
1. Token JWT. (Variante) (Ver Observação 1)
2. Charset. (Letras, Opcional)

Retorno: 
Payload referente ao JWT. (Letras)

Observação:
Deve-se utilizar a função JWT - Gerar Token.

### Código Servidor (Java)

```java
protected Variant ebfGetPayloadJWT(Variant tokenJWT, Variant charset) throws Exception{
    String charsetToCompare = charset.getString().isEmpty() ? Settings.CHARSET:charset.getString();
    String[] splittedToken = tokenJWT.getString().split("\\.");
    java.util.Base64.Decoder decoder = java.util.Base64.getUrlDecoder();
    Variant payload = null;

    switch (charsetToCompare.toUpperCase()) {
    case "UTF-8":
      payload = VariantPool.get(new String(decoder.decode(splittedToken[1]), java.nio.charset.StandardCharsets.UTF_8));
      break;
    case "ISO-8859-1":
      payload =  VariantPool.get(new String(decoder.decode(splittedToken[1]), java.nio.charset.StandardCharsets.ISO_8859_1));
    default:
      break;
    }

    Variant jsonPayload = ebfCreateObjectJSON(payload);
    return  jsonPayload;
  }
```

---

## JWT - Validar Token

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfValidateJWTToken` |
| **Código** | 1146 |
| **Assinatura** | `JWT - Validar Token (Letras;Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função valida um JSON Web Token de acordo com os valores inseridos por parâmetro.

Parâmetro(s):
1. JWT Token. (Letras) (Ver Observação 1)
2. Chave privada. (Letras)
3. Charset. (Letras, Opcional)

Retorno: 
Retorno. (Lógico)

Observações:
1. Para obter o valor do primeiro parâmetro deve-se utilizar a função: JWT - Gerar Token.
2. No terceiro parâmetro pode ser informado o charset ISO-8859-1 ou UTF-8.

### Código Servidor (Java)

```java
protected static Variant ebfValidateJWTToken(Variant token, Variant secretKey, Variant charset) throws Exception {
  boolean check = false;
  try {
    io.jsonwebtoken.Jwts.parser()
      .verifyWith(io.jsonwebtoken.security.Keys.hmacShaKeyFor(secretKey.getString().getBytes()))
      .build()
      .parseSignedClaims(token.getString());

    check = true;
  } catch (Exception e) {}

  return VariantPool.get(check);
}
```

---

## Largura da Janela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWindowGetWidth` |
| **Código** | 462 |
| **Assinatura** | `Largura da Janela () : Inteiro` |
| **Retorno** | Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna a largura (em pixels) do formulário onde o fluxo for executado.

Parâmetro:
Não possui.

Retorno:
Largura do Formulário. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfWindowGetWidth() {
  return getWindowDimensions().width;
}
```

---

## Logger - Adicionar Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetLogDebug` |
| **Código** | 409 |
| **Assinatura** | `ebfSetLogDebug(Letras);` |
| **Parâmetros** | Letras;Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Loga uma mensagem passada como parâmetro de entrada. Caso o uso dessa função seja na camada servidor, a mensagem será adicionada no arquivo de log do servidor de aplicações. Caso o uso seja na camada cliente, a mensagem será exibida no console do navegador.

Parâmetro(s):
1. Mensagem (Letras)
2. Nível de log. (Inteiro, Somente camada servidor)

Retorno:
Não possui.

Observação:
1. No segundo parâmetro pode ser passado os seguintes números:
    [1] Debug
    [2] Info
    [3] Erro
Caso estiver nulo será configurado o nível Default.

### Código Servidor (Java)

```java
private static Logger flowSetLogger = Logger.getLogger(WFRRule.class);

protected final Variant ebfSetLogDebug(Variant message, Variant levelMode) throws Exception {
  if(message != null){
    switch (levelMode.getDouble().intValue()) {  
      case 1: {
        flowSetLogger.debug(message.getString());
        flowSetLogger.debug("debug");       
        break;
      }    
      case 2: {
        flowSetLogger.info(message.getString());       
        flowSetLogger.info("info");        
        break;
      }                                              
      case 3: {
        flowSetLogger.error(message.getString());
        flowSetLogger.error("error");
        break;    
      }   
      default: {
        flowSetLogger.info(message.getString());       
        flowSetLogger.info("default");
        break;    
      }                     
    }             
  }
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfSetLogDebug() {
  console.log(arguments[0]);
}
```

---

## Login do Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetUserLogin` |
| **Código** | 30 |
| **Assinatura** | `Login do Usuário():Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém e retorna o login do usuário conectado.

Parâmetro:
Não possui.

Retorno:
Retorna o Login do usuário conectado ao sistema (Tabela FR_USUARIO). (Letras) 

Exemplo:
Se o usuário do sistema for "Master", o retorno será "Master".

### Código Servidor (Java)

```java
protected final Variant ebfGetUserLogin() throws Exception {
    return VariantPool.get(getData().getUser().getLogin().toUpperCase());
  }
```

---

## Login do Usuário (Case Sensitive)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetUserLoginSensitive` |
| **Código** | 425 |
| **Assinatura** | `Login do Usuário ()` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém e retorna o login do usuário conectado.

Parâmetro:
Não possui.

Retorno:
Retorna o Login do usuário conectado ao sistema (Tabela FR_USUARIO). (Letras)

Exemplo:
Se o usuário do sistema for "mAsTEer", o retorno será "mAsTEer".

### Código Servidor (Java)

```java
protected final Variant ebfGetUserLoginSensitive() throws Exception {
  return VariantPool.get(getData().getUser().getLogin());
}
```

---

## Mobile - Abrir URL no Contexto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `OpenUrlOnNewTab` |
| **Código** | 875 |
| **Assinatura** | `Mobile - Abrir URL no Contexto (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Abre uma URL em outra janela.

Parâmetro:
1. URL que será aberta. (Letras)

Retorno:
Não possui.

Observações:
1. As propriedades devem ser definidas em pares separados por vírgula. Ex: scrollbars=yes,resizable=yes
2. As propriedades válidas e seus possíveis valores são:
    - toolbar = yes | no
    - location = yes | no
    - status = yes | no
    - menubar = yes | no
    - scrollbars = yes | no
    - resizable = yes | no
    - width = yes | no
    - height = Número inteiro
    - left = Número inteiro
    - top = Número inteiro
3. Para colocar um caractere & que esteja entre os dados do valor de um parâmetro de uma URL utilize a combinação: %26 + &
4. A URL deve possuir o protocolo "http://" antes do endereço www, caso contrário, será tratato como uma URL relativa.
5. O nome da janela não deve conter espaço.
6. Para o mobile não é necessário informar o nome da janela, caso seja informada a página será aberta sobre a própria aplicação.

### Código Cliente (JavaScript)

```javascript
function OpenURLOnNewWindow_copy(pURL, pWindowName, pWindowProperties) {
  try {
    MM_openBrWindow(pURL, pWindowName, pWindowProperties);    
  } catch(e) {
    //Abafa  
  }
}
```

---

## NFe - Assinar XML

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNFeSignXML` |
| **Código** | 830 |
| **Assinatura** | `NFe - Assinar XML (Variante;Variante;Variante;Variante;Variante)` |
| **Parâmetros** | Variante;Variante;Variante;Variante;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função assina um XML no padrão NFe.

Parâmetro(s):
1. Caminho do arquivo XML. (Variante)
2. Caminho do arquivo de saída (XML). (Variante)
3. Caminho do arquivo de chaves (.jks, pkx, p12).  (Variante)
4. Senha do arquivo de chaves. (Variante)
5. Alias do par de chaves contido dentro do arquivo de chaves (.jks, pkx, p12). (Variante)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfNFeSignXML(Variant pathXML, Variant pathXMLSignature, Variant pathKeystore, Variant passKeystore, Variant aliasCert) throws Exception {
  wfr.util.WFRNFeSignature.ebfNFeSignXML(pathXML.getString(), pathXMLSignature.getString(), pathKeystore.getString(), passKeystore.getString(), aliasCert.getString());
  return Variant.VARIANT_NULL;    
}
```

---

## Notificação - Exibir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNotification` |
| **Código** | 744 |
| **Assinatura** | `Notificação - Exibir (Letras;Letras;Letras;Letras;Inteiro;Letras;Fluxo;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Inteiro;Letras;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esse função exibe uma notificação ao usuário fora do contexto de uma página da web.

Parâmetro(s):
1. Título. (Letras)
2. Mensagem. (Letras)
3. URL do Ícone. (Letras, Opcional)
4. URL da Imagem. (Letras, Opcional)
5. Tempo de Exibição em segundos. (Inteiro, Opcional)
6. ID. (Letras, Opcional)
7. Fluxo ao clicar na notificação. (Fluxo, Opcional)
8. Lista de parâmetros do fluxo. (Variante)

Retorno:
Não possui.

Observações:
1. Essa função só irá notificar o usuário, se o mesmo tiver concedido permissão.
2. Ao definir o 6º parâmetro, caso a notificação esteja em exibição e uma nova seja lançada esta será sobrescrita.

### Código Servidor (Java)

```java
protected final Variant ebfNotification(Variant title, Variant message, Variant icon, Variant image, Variant timer, Variant tag,
  Variant flow, Variant params) throws Exception {
    return callClientFunction("ebfNotification", title, message, icon, image, timer, tag, flow, params);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfNotification(title, message, icon, image, timer, tag, flow, params){
  if(Notification.permission === "default"){
    Notification.requestPermission(function(permission){
      if(permission === "granted")
        notify();
      else if(permission === "denied")
        console.log("Solicitação de permissão bloqueada pelo usuário");
    });
  }else if(Notification.permission === "denied"){
     console.log("Notificação bloqueada pelo usuário");
  }else{
    notify();
  }
  function notify(){
    tag = tag === undefined || tag === null ? "" : tag;
    var renotify = tag === "" ? false : true;
    timer = timer === undefined || timer === null || timer === "" ? 5000 : (timer * 1000);

    var options = {    
      body     : message,  
      icon     : icon,
      image    : image,
      tag      : tag,
      renotify : renotify
    }

    var notification = new Notification(title, options);
    notification.onshow = function(){setTimeout(closeNotify, timer, notification)};
    if(flow){
      params !== null && params instanceof Array ? params : [];
      notification.onclick = function(){ebfFlowExecute(flow, params)};
    }  
   
    function closeNotify(notification){
      notification.close();
    }
  }
}
```

---

## Notificação - Obter Status

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetNotificationStatus` |
| **Código** | 745 |
| **Assinatura** | `Notificação - Obter Status (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna o status de permissão de notificação.

Parâmetro:
Não possui.

Retorno:
Status. (Letras)

Observação:
1. O tipo de retorno pode ser:
  1.1 "granted" permissão concedida.
  1.2 "denied" permissão negada.
  1.3 "default" requer solicitação de permissão (Utilizar a função "Notificação - Solicitar Permissão").

### Código Cliente (JavaScript)

```javascript
function ebfGetNotificationStatus(){
  return Notification.permission;
}
```

---

## Notificação - Solicitar Permissão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNotificationRequestPermission` |
| **Código** | 746 |
| **Assinatura** | `Notificação - Solicitar Permissão ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função solicita a permissão de notificação ao usuário.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
Essa função só realizar a solicitação ao usuário caso o status da permissão seja "default". Utilizar a função "Notificação - Obter Status".

### Código Servidor (Java)

```java
protected final Variant ebfNotificationRequestPermission() throws Exception {
    return callClientFunction("ebfNotificationRequestPermission");
}
```

### Código Cliente (JavaScript)

```javascript
function ebfNotificationRequestPermission(){
  Notification.permission != "default" ? null : Notification.requestPermission();
}
```

---

## Número Aleatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRandom` |
| **Código** | 97 |
| **Assinatura** | `Número Aleatório(Inteiro):Inteiro` |
| **Parâmetros** | Inteiro |
| **Retorno** | Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna um número inteiro aleatório entre 0 e o valor informado como parâmetro.

Parâmetro:
1. Valor que definirá o intervalo do número. (Inteiro)

Retorno:
Número aleatório. (Inteiro)

Exemplo:
Assumindo como parâmetro 7 (Inteiro), o retorno seria um número aleatório entre 0 e 6 (n-1).

### Código Servidor (Java)

```java
protected final Variant ebfRandom(Variant maxValue) throws Exception {
  return VariantPool.get(Math.round(Math.random() * maxValue.getLong()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRandom(value) {
  return parseInt(parseNumeric(value) * Math.random());
}
```

---

## OAuth 1.0 - Gerar Token de Autorização

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGenerateOauthHeader` |
| **Código** | 856 |
| **Assinatura** | `OAuth 1.0 - Gerar Token de Autorização (Variante;Variante;Variante;Variante;Variante;Variante;Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante;Variante;Variante;Variante;Variante;Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função gera um Token de autenticação com assinatura para a URL passada no segundo parâmetro.

Parâmetro(s):
1. Método (GET, POST). (Variante)
2. URL. (Variante)
3. Chave de Consumo. (Consumer Key) (Variante)
4. Chave secreta de consumo. (Consumer Secret) (Variante)
5. Token. (Variante)
6. Token Secreto. (Token Secret) (Variante)
7. Parâmetros adicionais da URL. (Variante)
8. URL de Callback. (Variante)

Retorno:
Token de autenticação assinado. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfGenerateOauthHeader(Variant method, Variant url, Variant consumerKey, Variant consumerSecret, Variant consumerToken, Variant consumerTokenSecret, Variant additionalParameters, Variant callback) throws Exception {

  long timestamp = new Date().getTime() / 1000;
  String nonce = Long.toString(timestamp + 1);

  ArrayList < String > parameters = new ArrayList < String > ();
  parameters.add("oauth_consumer_key=" + consumerKey.getString());
  parameters.add("oauth_nonce=" + nonce);
  parameters.add("oauth_signature_method=HMAC-SHA1");
  parameters.add("oauth_timestamp=" + timestamp);
  parameters.add("oauth_token=" + consumerToken.getString());
  parameters.add("oauth_callback=" + java.net.URLEncoder.encode(callback.getString()));
  parameters.add("oauth_version=1.0");

  List additionalParametersAux = (List) additionalParameters.getObject();

  if (!(additionalParametersAux == null)) {
    for (int a = 0; a < additionalParametersAux.size(); a++) {
      parameters.add(java.net.URLEncoder.encode(additionalParametersAux.get(a).toString()).replace("%3D", "="));
    }
  }

  Collections.sort(parameters);

  StringBuffer parametersList = new StringBuffer();

  for (int i = 0; i < parameters.size(); i++) {
    parametersList.append(((i > 0) ? "&" : "") + parameters.get(i));
  }

  String signatureString = method.getString() + "&" + java.net.URLEncoder.encode(url.getString()) + "&" + java.net.URLEncoder.encode(parametersList.toString());

  String signature = null;

  javax.crypto.spec.SecretKeySpec signingKey = new javax.crypto.spec.SecretKeySpec((consumerSecret.getString() + "&" + consumerTokenSecret.getString()).getBytes(), "HmacSHA1");
  javax.crypto.Mac mac = javax.crypto.Mac.getInstance("HmacSHA1");
  mac.init(signingKey);
  byte[] rawHMAC = mac.doFinal(signatureString.getBytes());
  signature = Base64.getEncoder().encodeToString(rawHMAC);

  String authorizationLine =
    "OAuth " +
    "oauth_consumer_key=\"" + consumerKey.getString() + "\", " +
    "oauth_nonce=\"" + nonce + "\", " +
    "oauth_timestamp=\"" + timestamp + "\", " +
    "oauth_token=\"" + consumerToken.getString() + "\", " +
    "oauth_signature_method=\"HMAC-SHA1\", " +
    "oauth_signature=\"" + java.net.URLEncoder.encode(signature) + "\", " +
    "oauth_version=\"1.0\"";

  authorizationLine += ", oauth_callback=\"" +
    java.net.URLEncoder.encode(callback.getString()) + "\"";

  return VariantPool.get(authorizationLine);
}
```

---

## Oauth 2.0 -  Requisitar Token

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRequestOauth2Token` |
| **Código** | 1024 |
| **Assinatura** | `Oauth 2.0 -  Requisitar Token (Variante;Variante;Letras;Lógico;Letras): Letras` |
| **Parâmetros** | Variante;Variante;Letras;Lógico;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função realiza a requisição de tokens para serviços de cloud, como Google Cloud e Azure.

Parâmetros:
1. Objeto JSON - (Parâmetros da requisição). (Variante) (Ver observação 1)
2. Objeto JSON - (Parâmetros do cabeçalho). (Opcional) (Variante) (Ver observação 2)
3. URL (Variante) (Ver observação 3)
4. Devolver o JSON inteiro? (Lógico) (Ver observação 4)
5. Valor a ser retornado. (Letras) (Opcional) (Ver observação 5)

Retorno:
JSON referente a requisição (Letras).

Observações:
1. Os parâmetros da requisição deve ser um JSON contendo todos os parâmetros para realizar uma determinada requisição.
Exemplo: Assumindo que para requisitar um no serviço da Google Cloud, precisa de dois parâmetros "client_id" e "client_secret",
sendo assim, o Objeto Json assumirá o seguinte formato: {"client_id": "id_do_cliente", "client_secret":"secret_do_client"}.

2. Caso seja necessário definir os parâmetros do cabeçalho o JSON seguirá o seguinte formato:
Exemplo: {"connection":"Keep-Alive"}

3. Refere-se a URL nescessária para realizar a requisição.
Exemplo : "https://www.googleapis.com/oauth2/v4/token"

4. Caso queira capturar o valor específico de um chave do JSON, marcar como verdadeiro e no quinto parâmetro informar o nome da chave.

5. Caso o quarto parâmetro tenha sido marcado como verdadeiro informar o valor da chave.
Exemplo: "access_token".

### Código Servidor (Java)

```java
protected final Variant ebfRequestOauth2Token(Variant parameterPayload, Variant headPayload, Variant url, Variant wholeValue, Variant valueToReturn) throws Exception {
    jakarta.json.JsonObject jsonParameter;
    jakarta.json.JsonObject jsonHead;
    Variant result = null;
    Variant json;

    // Extract JSON payloads
    jsonParameter = parameterPayload.getObject() != null && parameterPayload.getObject() instanceof jakarta.json.JsonObject
            ? (jakarta.json.JsonObject) parameterPayload.getObject()
            : null;

    jsonHead = headPayload.getObject() != null && headPayload.getObject() instanceof jakarta.json.JsonObject
            ? (jakarta.json.JsonObject) headPayload.getObject()
            : null;

    // Create HTTP client and POST method
    org.apache.hc.client5.http.classic.methods.HttpPost post = new org.apache.hc.client5.http.classic.methods.HttpPost(url.getString());
    org.apache.hc.client5.http.impl.classic.CloseableHttpClient client = org.apache.hc.client5.http.impl.classic.HttpClients.createDefault();

    try {
      if (jsonParameter != null) {
          org.apache.hc.core5.http.io.entity.StringEntity entity = new org.apache.hc.core5.http.io.entity.StringEntity(
              jsonParameter.toString(), 
              org.apache.hc.core5.http.ContentType.APPLICATION_JSON, 
              "UTF-8", false);
          post.setEntity(entity);
      }

      if (jsonHead != null) {
          jsonHead.keySet().forEach(keyString -> {
              Object keyValue = jsonHead.getString(keyString);
              post.addHeader(keyString, keyValue.toString());
          });
      }

      org.apache.hc.client5.http.impl.classic.CloseableHttpResponse response = client.execute(post);

      try {
        int code = response.getCode();
        String responseBody = new String(response.getEntity().getContent().readAllBytes(), "UTF-8");
        json = ebfCreateObjectJSON(VariantPool.get(responseBody));
        result = code == 200 && wholeValue.getBoolean()
                ? ebfGetValueObjectJson(VariantPool.get(json), valueToReturn)
                : VariantPool.get(json);
      } finally {
        response.close();
      }
    } catch (Exception e) {
      logger.error(e);
    } finally {
      client.close();
    }

    return VariantPool.get(result != null ? result.getString() : "");
}
```

---

## Obter Bytes da URL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `alxDownloadFile` |
| **Código** | 732 |
| **Assinatura** | `Obter Bytes da URL (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o Byte da URL/Arquivo e escreve num arquivo de destino.

Parâmetro(s):
1. URL do arquivo. (Letras)
2. Caminho absoluto do destino. (Letras)

Retorno:
Não possui.

Exemplo:
O 1º Parâmetro como: http://www.servidor.com.br/imagem.jpg, Parâmetro 2: c:\imagem.jpg.

### Código Servidor (Java)

```java
protected final Variant alxDownloadFile(Variant urlImagem, Variant caminhoDestino) throws Exception{

  try {
    java.net.URL url = new java.net.URL(urlImagem.toString());
    InputStream in = new BufferedInputStream(url.openStream());
    ByteArrayOutputStream out = new ByteArrayOutputStream();
    byte[] buf = new byte[1024];
    int n = 0;
    while (-1!=(n=in.read(buf))){
      out.write(buf, 0, n);
    }

    byte[] response = out.toByteArray();

    //return new Variant (response);
    FileOutputStream fos = null;
    File file = new File(caminhoDestino.toString());                
    if (!file.exists()){
      file.createNewFile();
    }
    fos = new FileOutputStream(file, false);                  
    if (null != fos){ 
      fos.write(response); 
      fos.close();
    }
    return Variant.VARIANT_NULL;            
  } 
  catch (Exception e){
    throw new Exception(e);
  }              
}
```

---

## Obter Caminho Absoluto da Aplicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetAbsolutContextPath` |
| **Código** | 343 |
| **Assinatura** | `Obter Caminho Absoluto da Aplicação : Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o caminho absoluto da aplicação.

Parâmetro:
Não possui.

Retorno:
Retorna o caminho absoluto da aplicação. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfGetAbsolutContextPath(){
    return getAbsolutContextPath();
}
```

---

## Obter Caminho do WFRE

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWFREGetAbsolutePath` |
| **Código** | 412 |
| **Assinatura** | `Obter Caminho do WFRE()` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém o caminho físico do WFRE utilizado no Webrun.

Parâmetro:
Não possui.

Retorno:
Caminho físico do WFRE. (Letras)

### Código Servidor (Java)

```java
public Variant ebfWFREGetAbsolutePath()  throws Exception {
    WFREFile file = connection.getOriginalWfreFile();
    if (file == null) {
      file = connection.getWfreFile();
    }
    return VariantPool.get(file.getLocalFile());
  }
```

---

## Obter Charset do Webrun

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetWebrunCharset` |
| **Código** | 1047 |
| **Assinatura** | `Obter Charset do Webrun (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o Charset do Webrun.

Parâmetros:
Não possui.

Retorno:
ISO-8859-1 ou UTF-8 (Letras).

### Código Servidor (Java)

```java
protected final Variant ebfGetWebrunCharset() throws Exception {
  return VariantPool.get(Settings.CHARSET);  
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetWebrunCharset() {
  return ENCODING;   
}
```

---

## Obter Classe de um Objeto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetClassObject` |
| **Código** | 892 |
| **Assinatura** | `Obter Classe de um Objeto (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém a Classe do objeto passado como parâmetro.

Parâmetro:
1. Objeto (qualquer tipo).

Retorno:
Retorna o nome da classe do Objeto.

Observação:
Deve-se sempre ficar atento ao retorno na camada cliente, devido a cada browser ter suas peculiaridades o tipo de retorno pode mudar.

Exemplos:
1. Se o objeto passado como parâmetro for uma lista, o retorno será 'ArrayList'. (Camada Servidor)
2. Se o objeto passado como parâmetro for uma lista, o retorno será 'array'. (Camada Cliente)

### Código Servidor (Java)

```java
protected final Variant ebfGetClassObject(Variant value) throws Exception{
  if(!(value.isNull())){
    return VariantPool.get(value.getObject().getClass().getSimpleName());
  }
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetClassObject(obj) {
  return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()
}
```

---

## Obter Conteúdo da URL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetURLContent` |
| **Código** | 167 |
| **Assinatura** | `Obter Conteúdo da URL (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o conteúdo da URL a partir desta.

Parâmetro(s):
1. A página web que deseja obter o conteúdo. (Letras)
2. Charset. (Letras, Opcional)

Retorno: 
O conteúdo da página passada como parâmetro em formato de texto. (Letras)

Observação:
Esta função não funciona em redes com proxy.

Exemplo:
Ao passar como parâmetro http://www.softwell.com.br, o retorno será o HTML da página passado em formato de texto.

### Código Servidor (Java)

```java
protected final Variant ebfGetURLContent(Variant url) throws Exception {       
	return ebfGetURLContent(url, new Variant(""));
  }

  protected final Variant ebfGetURLContent(Variant url, Variant charSet) throws Exception {
    charSet = charSet.getObject() == null || charSet.getObject().equals("") ? new Variant(wfr.util.Settings.CHARSET) : charSet; 
    return VariantPool.get(Functions.getSBURL(url.getString(), charSet.getString()));
  }
```

---

## Obter Conteúdo da URL Com POST

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `mpfOpenURLwithPOST` |
| **Código** | 733 |
| **Assinatura** | `Obter Conteúdo da URL Com POST (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma requisição POST e retorna a resposta da URL.

Parâmetro(s):
1. URL. (Letras)
2. Letras ou um Objeto Mapa. (Variante)

Retorno:
Conteúdo retornado pelo servidor (Letras).

Observação:
Caso ocorra algum erro, será retornado pelo Webrun.

Exemplo:
Ao passar como parâmetro http://www.softwell.com.br, o retorno será o HTML da página passado em formato de texto.

### Código Servidor (Java)

```java
protected static final Variant mpfOpenURLwithPOST(Variant urlPOSTVar, Variant valuesVar) throws Exception {
  //Converter
  String urlPOST = urlPOSTVar.getString();
  Object values = valuesVar.getObject();
  //
  StringBuffer postData = new StringBuffer();
  if(values instanceof java.util.Map) {
    java.util.Map<Object, Object> mapValues = (java.util.Map<Object, Object>) values;
    Iterator<Object> mapKeys = mapValues.keySet().iterator();
    Object keyName;
    String itemValue;
    while(mapKeys.hasNext()) {
      keyName = mapKeys.next();
      itemValue = String.valueOf(mapValues.get(keyName));
      postData.append(String.valueOf(keyName));
      postData.append("=");
      postData.append(java.net.URLEncoder.encode(itemValue));
      postData.append("&");
    }
  } else {
    postData.append(values);
  }

  try {
    // Send the request
    java.net.URL url = new java.net.URL(urlPOST);
    java.net.URLConnection conn = url.openConnection();
    String encodedLogin = wfr.util.Functions.getAutorizationProxy(urlPOST);
    if(encodedLogin != null)
      conn.setRequestProperty("Proxy-Authorization", "Basic " + encodedLogin);
    conn.setDoOutput(true);
    java.io.OutputStreamWriter writer = new java.io.OutputStreamWriter(conn.getOutputStream());
    //write parameters
    writer.write(postData.toString());
    writer.flush();
    writer.close();
    //Output the response
    // Get the response
    String line = "";
    StringBuffer answer = new StringBuffer();
    java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
    while ((line = reader.readLine()) != null) {
      answer.append(line);
    }
    writer.close();
    reader.close();
    //Output the response
    return VariantPool.get(answer.toString());
  } catch (java.net.MalformedURLException ex) {
      return VariantPool.get(ex.getMessage());
  } catch (java.io.IOException ex){
      return VariantPool.get(ex.getMessage());
  }
}
```

---

## Obter Coordenadas Geográficas pelo Navegador

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetGeolocation` |
| **Código** | 1078 |
| **Assinatura** | `Obter Coordenadas Geográficas pelo Navegador (Fluxo;Variante;Fluxo;Variante): Variante` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém as coordenadas geográficas do navegador do usuário utilizando a API de Geolocalização do HTML5. A execução é assíncrona na camada cliente ou Mobile e, de acordo com o resultado (sucesso ou erro), dispara a regra correspondente com um objeto JSON estruturado.

Parâmetro(s):

1. Regra a ser executada em caso de sucesso. (Fluxo somente camada cliente ou Mobile)
2. Parâmetros da Regra em caso de sucesso. (Variante somente camada cliente ou Mobile)
3. Regra a ser executada em caso de erro. (Fluxo somente camada cliente ou Mobile)
4. Parâmetros da Regra em caso de erro. (Variante somente camada cliente ou Mobile)

Retorno:
Objeto JSON com o formato abaixo:

{
  "headers": {},
  "result": {
    "latitude": "Valor numérico representando a latitude",
    "longitude": "Valor numérico representando a longitude",
    "accuracy": "Valor numérico que indica a acurácia da medição (em metros)",
    "altitude": "Valor numérico representando a altitude (pode ser null se não disponível)",
    "altitudeAccuracy": "Valor numérico representando a acurácia da altitude (pode ser null)",
    "heading": "Valor numérico indicando a direção do movimento (pode ser null)",
    "speed": "Valor numérico indicando a velocidade (pode ser null)",
    "timestamp": "Timestamp da obtenção da localização"
  },
  "status": "OK", // Em caso de sucesso; caso contrário, "ERROR"
  "statusCode": 200 // Código 200 em caso de sucesso; ou código de erro retornado pela API
}

Observações:

1.A função solicitará ao usuário a permissão para acessar sua localização. Se o acesso for negado ou ocorrer algum erro durante a obtenção, a regra de erro será executada com um objeto contendo o código e a mensagem do erro.
2.Caso o navegador não suporte a API de Geolocalização, a função automaticamente dispara a regra de erro, retornando um objeto com status "ERROR", código 0 e a mensagem "Geolocation não é suportada por este navegador.".
3.A execução desta função na camada cliente ou Mobile é assíncrona, e o retorno é enviado automaticamente como primeiro parâmetro da regra definida (sucesso ou erro).
4.Como a API de Geolocalização não utiliza cabeçalhos HTTP, a propriedade headers do objeto retornado é um objeto vazio.

### Código Cliente (JavaScript)

```javascript
function ebfGetGeolocation(ruleCallback, Params, ruleCallbackError, paramsRuleError) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      function(position) { // Sucesso
        if (ruleCallback) {
          var jsonReturn = {};
          jsonReturn.headers = {}; // Não há cabeçalhos em uma chamada de geolocalização
          jsonReturn.status = "OK";
          jsonReturn.statusCode = 200;
          jsonReturn.result = {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude,
            accuracy: position.coords.accuracy,
            altitude: position.coords.altitude,
            altitudeAccuracy: position.coords.altitudeAccuracy,
            heading: position.coords.heading,
            speed: position.coords.speed,
            timestamp: position.timestamp
          };
          Params = Params == null ? [] : Params;
          ebfSetElementAtList(Params, jsonReturn, 1);
          executeRuleFromJS(ruleCallback, Params);
        }
      },
      function(error) { // Erro ao obter a localização
        if (ruleCallbackError) {
          var jsonReturn = {};
          jsonReturn.headers = {};
          jsonReturn.status = "ERROR";
          jsonReturn.statusCode = error.code;
          jsonReturn.result = error.message;
          paramsRuleError = paramsRuleError == null ? [] : paramsRuleError;
          ebfSetElementAtList(paramsRuleError, jsonReturn, 1);
          executeRuleFromJS(ruleCallbackError, paramsRuleError);
        }
      }
    );
  } else {
    // Geolocalização não suportada
    if (ruleCallbackError) {
      var jsonReturn = {};
      jsonReturn.headers = {};
      jsonReturn.status = "ERROR";
      jsonReturn.statusCode = 0;
      jsonReturn.result = "Geolocation não é suportada por este navegador.";
      paramsRuleError = paramsRuleError == null ? [] : paramsRuleError;
      ebfSetElementAtList(paramsRuleError, jsonReturn, 1);
      executeRuleFromJS(ruleCallbackError, paramsRuleError);
    }
  }
}
```

---

## Obter Dicionário de Dados do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSystemDataDictionary` |
| **Código** | 1065 |
| **Assinatura** | `Obter Dicionário de Dados do Sistema (Lógico): Variante` |
| **Parâmetros** | Lógico |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna um objeto JSON contendo informações do dicionário de dados do sistema, como:
1. Nome da Tabela
2. Descrição da Tabela
3. Campo
4. Descrição
5. Valor Padrão

Parâmetro:
1. Ignorar tabelas padrões? (FR's) (Lógico).

Retorno:
Retorna um objeto JSON contendo as informações do dicionário de dados.

Observações:
1. O modelo do objeto JSON segue o formato abaixo:

{
  "dictionary_tables_name": {
    "mkr_pais": "Países"
  },
  "dictionary_tables_fields": {
    "mkr_pais": [
      {
        "campo": "mkr_pas_id",
        "descricao": "id",
        "valorPadrao": ""
      },
      {
        "campo": "mkr_sof_nome",
        "descricao": "País",
        "valorPadrao": ""
      }
    ]
  }
}

2. Quando a opção de ignorar as tabelas padrões for verdadeira, tabelas iniciadas com (fr_) serão ignoradas na obtenção das informações.

### Código Servidor (Java)

```java
protected final Variant ebfGetSystemDataDictionary(Variant ignoreDefaults) throws Exception {
  org.json.JSONObject dictionary = new org.json.JSONObject();
  Collection<WFRField> fields = getSystem().getAllFields().values();
  Map<String, String> tables = getSystem().getDictionaryTables(); 
  for(WFRField field : fields) {
    String table = field.getTable();
    if(ignoreDefaults.getBoolean() && table.toLowerCase().startsWith("fr_")) // ignora as tabelas padrões do sistema.
      continue;

    org.json.JSONObject jsonData = new org.json.JSONObject();
    jsonData.put("campo", field.getField());
    jsonData.put("descricao", field.getDescription());
    jsonData.put("valorPadrao", field.getDefaultValue());     
    dictionary.append(table, jsonData);
  }
  
  org.json.JSONObject jsonTables = new org.json.JSONObject(
    tables.entrySet()
      .stream()
      .collect(java.util.stream.Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue))
  );

  org.json.JSONObject systemdictionary = new org.json.JSONObject();
  systemdictionary.put("dictionary_tables_name", jsonTables);
  systemdictionary.put("dictionary_tables_fields", dictionary);

  return new Variant(WFRJson.createJsonObject(systemdictionary.toString()));
}
```

---

## Obter Driver da Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetConnectionDriver` |
| **Código** | 1066 |
| **Assinatura** | `Obter Driver da Conexão (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém o driver de conexão do sistema.

Parâmetro:
Não possui.

Retorno:
1. Driver de Conexão (Letras).

### Código Servidor (Java)

```java
protected final Variant ebfGetConnectionDriver() throws Exception {
  return new Variant(getData().connection().getDriverName());
}
```

---

## Obter Idioma Corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCurrentLanguage` |
| **Código** | 352 |
| **Assinatura** | `Obter Idioma Corrente () : Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o idioma que está sendo utilizado no momento.

Parâmetro:
Não possui.

Retorno:
Retorna o idioma da aplicação. (Letras)

Exemplo:
Caso o idioma corrente que esteja sendo utilizado for o inglês, então a função retornará o valor: "en_US"

### Código Servidor (Java)

```java
protected final Variant ebfCurrentLanguage() throws Exception {
    return VariantPool.get(Resources.getThreadResources().getLocale().toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfCurrentLanguage() {
  return resources_locale;
}
```

---

## Obter Informações das Sessões Ativas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetJSONSessionsSystems` |
| **Código** | 1002 |
| **Assinatura** | `Obter Informações das Sessões Ativas (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém as informações das sessões ativas no(s) sistema(s).

Parâmetro:
1. Sigla do sistema. (Letras, Opcional)

Retorno:
Objeto JSON com as informações. (Variante)

Observações:
1. Quando não especificado a sigla do sistema, a função retornará as sessões ativas de todos os sistema que possuem usuários conectados.
2.  O objeto JSON retornado terá as seguintes informações:
  2.1 Quantidade de usuários conectados
  2.2. Informações da sessão do usuário:
    2.2.1 Data e hora do login.
    2.2.2 Milissegundos da data.
    2.2.3 Navegador utilizado.
    2.2.4 ID da sessão.

### Código Servidor (Java)

```java
protected final Variant ebfGetJSONSessionsSystems(Variant system) throws Exception {
    return VariantPool.get( wfr.web.manage.session.ManageSessions.getInstance().getInfoJsonSystemSessions(system.getObject() != null ? system.getString() : ""));
  }
```

---

## Obter Informações do Disco

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInformationsAboutDisk` |
| **Código** | 728 |
| **Assinatura** | `Obter Informações do Disco (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função retorna um mapa com informações do disco.

Parâmetro:
Não possui.

Retorno:
Mapa com as informações. (Variante)

Observações:
1. A chave será a letra da unidade existente no computador.
2. Dentro de cada chave contém uma lista com as seguintes informações: Primeira posição, total de espaço no disco. Segunda posição, percentual de disco já ocupado.

### Código Servidor (Java)

```java
protected final Variant ebfInformationsAboutDisk() throws Exception{
    if (Functions.isDotNetPlatform()){
      return Functions.BRIDGED_FUNCTIONS.ebfInformationsAboutDisk();
    }else{
      java.nio.file.FileStore filesystemusage = null;

      java.util.ArrayList <String> listDisk = new java.util.ArrayList<String>();
    
      Map map = new java.util.TreeMap();
      
      for(java.nio.file.Path path : java.nio.file.FileSystems.getDefault().getRootDirectories()){   
        java.util.ArrayList <String> listValues = new java.util.ArrayList<String>();
        try{
          String disk = "";  
          if(wfr.util.Functions.isLinux()){    
            disk = String.valueOf(path);      
          } else{
            disk = String.valueOf(path).substring(0,2);  
          }
          filesystemusage = java.nio.file.Files.getFileStore(path);
          long totalDisk = Math.round(((filesystemusage.getTotalSpace()/1024)/1024)/1024);
          double percUsage = Math.round(100-((filesystemusage.getUnallocatedSpace()*100)/filesystemusage.getTotalSpace()));
          listValues.add(String.valueOf(totalDisk));
          listValues.add(String.valueOf(percUsage));
          map.put(disk, listValues);
        }catch (java.io.IOException se) {
          //se.printStackTrace();
        }
     }
      return VariantPool.get(map);
    }
  }
```

---

## Obter Informações do Dispositivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetDeviceInfo` |
| **Código** | 876 |
| **Assinatura** | `Obter Informações do Dispositivo (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna um JSON com informações do dispositivo tais como: Versão do Sistema Operacional, Modelo do dispositivo, Tipo do Sistema operacional (Android ou iOS).

Parâmetro:
Não possui.

Retorno:
JSON com informações. (Variante)

---

## Obter Informações do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInformationsAboutMemory` |
| **Código** | 729 |
| **Assinatura** | `Obter Informações do Sistema (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém informações do sistema e da JVM (Java Virtual Machine).

Parâmetro:
Não possui.

Retorno:
Mapa com as informações. (Variante)

Observação:
As chaves do mapa retornado são: 
 - tMemory = Total de memória atual. 
 - fMemory = Total de memória livre. 
 - PercUsageMemory = Percentual de memória em uso. 
 - CPUUsage = Percentual de CPU em uso. 
 - JVMUsage = Memória em uso JVM. 
 - JVMTotal = Memória total JVM. 
 - JVMVersion = Versão da JVM. 
 - OSName = Sistema Operacional. 
 - OSVersion = Versão do Sistema Operacional. 
 - HostName = Nome do Host.  
 - IPAddress = IP do Host.

### Código Servidor (Java)

```java
protected final Variant ebfInformationsAboutMemory() throws Exception {
    if (Functions.isDotNetPlatform()){
      return Functions.BRIDGED_FUNCTIONS.ebfInformationsAboutMemory();
    }else{
      String[] memoryAttributes={"TotalPhysicalMemorySize", "FreePhysicalMemorySize", "ProcessCpuLoad"};
      java.lang.management.OperatingSystemMXBean operatingSystem = java.lang.management.ManagementFactory.getOperatingSystemMXBean();
      List<javax.management.Attribute> memoryAttributesList = null;
      try {
        memoryAttributesList = java.lang.management.ManagementFactory.getPlatformMBeanServer()
                                .getAttributes(operatingSystem.getObjectName(), memoryAttributes).asList();
      } catch (javax.management.InstanceNotFoundException | javax.management.ReflectionException ex) { }

      //Memória    
      long memoryAtual = (((long)memoryAttributesList.get(0).getValue() / 1024) / 1024);
      long memoryActualFree = (((long)memoryAttributesList.get(1).getValue() / 1024) / 1024);
      long memoryActualUsagePerc = Math.round(((memoryAtual - memoryActualFree)*100)/memoryAtual);
      long CPUUsagePerc = Math.round(((int) ((Double) memoryAttributesList.get(2).getValue() * 1000) / 10.0));
      //JVM  
      java.lang.Runtime runtime = java.lang.Runtime.getRuntime(); 
      long JVMuse = runtime.totalMemory() - runtime.freeMemory();
      String JVMVersion = java.lang.System.getProperty("java.version");
      java.util.ArrayList<Long> JVMItens = new ArrayList<Long>(java.util.Arrays.asList(JVMuse, runtime.maxMemory()));
      java.util.ArrayList<String> JVMStringValues = new ArrayList<String>();
      for (long item : JVMItens) {
        java.text.CharacterIterator ci = new java.text.StringCharacterIterator("KMGTPE");
        long value = item;
        for (int i = 40; i >= 0 && item > 0xfffccccccccccccL >> i; i -= 10) {
            value >>= 10;
            ci.next();
        }
        value *= Long.signum(item);
        JVMStringValues.add(String.format("%.1f%c", value / 1024.0, ci.current()).replace(",", "."));
      }
      // OS
      String OSName = java.lang.System.getProperty("os.name");
      String OSVersion = java.lang.System.getProperty("os.version");
      String HostName = "";
      String IPAddress = "";
      try {
       HostName = java.net.InetAddress.getLocalHost().getHostName();
       IPAddress = java.net.InetAddress.getLocalHost().getHostAddress();
      }catch (java.io.IOException io) {}

      Map<String, Comparable> map = new java.util.TreeMap<String, Comparable>();
      map.put("tMemory", memoryAtual);
      map.put("fMemory", memoryActualFree);
      map.put("PercUsageMemory", memoryActualUsagePerc);
      map.put("CPUUsage", CPUUsagePerc);
      map.put("JVMUsage", JVMStringValues.get(0));
      map.put("JVMTotal", JVMStringValues.get(1));
      map.put("JVMVersion", JVMVersion);
      map.put("OSName", OSName);
      map.put("OSVersion", OSVersion);
      map.put("HostName", HostName);
      map.put("IPAddress", IPAddress);
 
      return VariantPool.get(map);
    }
  }
```

---

## Obter Lista de Conexões-Ponte do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSystemConnectionsName` |
| **Código** | 654 |
| **Assinatura** | `Obter Lista de Conexões-Ponte do Sistema (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém o nome das conexões-ponte (DataConnections) existentes. A mesma pode ser utilizada em conjunto
com a função de "Autenticar Usuário" e permitir que exista um controle de "Entidades" na aplicação.

Parâmetro:
Não possui.

Retorno:
Lista de Conexões-Ponte. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfGetSystemConnectionsName() throws Exception {
  return new Variant(getSystem().getFile().getConnectionsName());
}
```

---

## Obter Lista de WFRE do Contexto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSystemList` |
| **Código** | 529 |
| **Assinatura** | `Obter Lista de WFRE do Contexto (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função retorna uma lista de WFRE's existente no contexto/pasta systems.

Parâmetro:
Não possui.

Retorno:
Lista de WFRE's. (Variante)

### Código Servidor (Java)

```java
public Variant ebfGetSystemList() throws Exception {
  List<List<String>> result = new ArrayList<List<String>>();
   
  for (wfr.com.WFREFile currentWfre : wfr.sys.WFRLoader.systemsList()) {
    List<String> currentInfo = new ArrayList<String>();
    currentInfo.add(currentWfre.getCode());
    currentInfo.add(currentWfre.getName());
    result.add(currentInfo);
  }
  return new Variant(result);
}
```

---

## Obter Nome da Aba Ativa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSelectTabStringName` |
| **Código** | 464 |
| **Assinatura** | `Obter Nome da Aba Ativa ()` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

A função obtém o nome da aba ativa.

Parâmetro:
Não possui.

Retorno:
Nome da Aba Ativa. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfGetSelectTabStringName() {
  var a = ebfSelectedTab();
  return a.description;
}
```

---

## Obter Parâmetro da Requisição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRequestGetParameter` |
| **Código** | 606 |
| **Assinatura** | `Obter Parâmetro da Requisição (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém um parâmetro da requisição.

Parâmetro:
1. Nome do parâmetro na requisição.
2. Contexto (Observação 2)

Retorno:
Retorna o valor do parâmetro definido na requisição ou Nulo caso o mesmo não exista. (Letras)

Observação:
1. Esta função deve ser utilizada no evento "Ao Entrar" do Formulário.
2. Contexto a ser verificado o parâmetro. Somente para a camada cliente.

Exemplo:
Utilizando a função no evento "Ao Entrar" de um formulário, passando o primeiro parâmetro como formID, ela retornará o próprio valor de formID.

### Código Servidor (Java)

```java
protected final Variant ebfRequestGetParameter(Variant parameter) throws Exception {
    java.lang.reflect.Method requestMethod = client.getClass().getMethod("getRequest", (Class[]) null);
    Object request = requestMethod.invoke(client, (Object[]) null);

    Object parameterObj = null;
    if (request != null) {
      java.lang.reflect.Method requestParameter = request.getClass().getMethod("getParameter", String.class);
      parameterObj = requestParameter.invoke(request, parameter.toString());
    }

    return VariantPool.get(parameterObj);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRequestGetParameter(parameterName, context) {
  context = context ? context : window; 
  const urlParams = new URLSearchParams(context.location.search);
  return urlParams.get(parameterName);
}
```

---

## Obter Parâmetro de Configurações

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConfgGet` |
| **Código** | 647 |
| **Assinatura** | `Obter Parâmetro de Configurações (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém um parâmetro avançado do Webrun (config.xml). Para se obter o valor do parâmetro, deve-se passar o 
grupo que o mesmo se encontra e o nome do parâmetro.

Parâmetro(s):
1. Grupo. (Letras)
2. Nome do Parâmetro. (Letras)

Retorno:
Valor do parâmetro definido. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfConfgGet(Variant group, Variant keyGroup) throws Exception {
  String maxTriesStr = WFRConfig.config().get(group.getString(), keyGroup.getString()).trim();
  return new Variant(maxTriesStr);
}
```

---

## Obter Posição X do Cursor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetCursorX` |
| **Código** | 181 |
| **Assinatura** | `Obter Posição X do Cursor():Inteiro` |
| **Retorno** | Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a posição horizontal (relativa ao formulário atual) do cursor.

Parâmetro:
Não possui.

Retorno:
Posição X do Cursor. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfGetCursorX() {
return $mainform().mX;
}
```

---

## Obter Posição Y do Cursor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetCursorY` |
| **Código** | 182 |
| **Assinatura** | `Obter Posição Y do Cursor():Inteiro` |
| **Retorno** | Inteiro |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a posição vertical (relativa ao formulário atual) do cursor.

Parâmetro:
Não possui.

Retorno:
Posição Y do Cursor. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfGetCursorY() {
return $mainform().mY;
}
```

---

## Obter Propriedade Avançada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetAdvancedProperty` |
| **Código** | 1063 |
| **Assinatura** | `Obter Propriedade Avançada (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o valor de uma propriedade avançada.

Parâmetro:
1. Nome da propriedade. (Letras)

Retorno: 
Retorna o valor da propriedade passada por parâmetro ou nulo caso o mesmo não exista.(Letras)

Observação:
1. As propriedades avançadas do sistema têm prioridade em relação às propriedades avançadas do Webrun, ou seja,
primeiro será realizada uma busca nas propriedades do sistema, caso a propriedade não seja encontrada, será feita
uma busca nas propriedades avançadas do Webrun.

### Código Servidor (Java)

```java
public Variant ebfGetAdvancedProperty(Variant value) {
  String propertyAdvancedOfSystem = getData().getSystem().getAdvancedProperty(value.getString());
 
   if (!propertyAdvancedOfSystem.isEmpty()) {
      return VariantPool.get(propertyAdvancedOfSystem);
   }   

   String propertyAdvanced =  WFRConfig.config().get("PropriedadesAvancadas", value.getString());
   if (!propertyAdvanced.isEmpty()) {
     return VariantPool.get(propertyAdvanced);
   }
    
   return Variant.VARIANT_NULL;   
}
```

---

## Obter URL do Contexto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRequestGetContextPath` |
| **Código** | 468 |
| **Assinatura** | `Obter URL do Contexto (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém a URL do contexto que a aplicação está sendo rodada.

Parâmetro:
Não possui.

Retorno:
Retorna o contexto da aplicação com a URL completa. (Letras)

Exemplo:
http://localhost:8080/webrun.

### Código Servidor (Java)

```java
protected final Variant ebfRequestGetContextPath() throws Exception {
    java.lang.reflect.Method getRequest = client.getClass().getMethod("getRequest", (Class[]) null);

    Object request = getRequest.invoke(client, (Object[]) null);

    java.lang.reflect.Method getContextPath = request.getClass().getMethod("getContextPath", (Class[]) null);
    java.lang.reflect.Method getRequestURL = request.getClass().getMethod("getRequestURL", (Class[]) null);

    Object contextPath = getContextPath.invoke(request, (Object[]) null);
    Object requestURL = getRequestURL.invoke(request, (Object[]) null);

    String value = requestURL.toString();

    java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("(.+" + contextPath + ")/");
    java.util.regex.Matcher matcher = pattern.matcher(value);

    if (matcher.find()) {
      value = matcher.group(1);
    }

    return VariantPool.get(value.toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRequestGetContextPath() {
  return getAbsolutContextPath();
}
```

---

## Obter Valor do Componente no Formulário - Async

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChannelGetComponentValeuOtherForm` |
| **Código** | 975 |
| **Assinatura** | `Obter Valor do Componente no Formulário - Async (Formulário;Componente;Fluxo;Variante)` |
| **Parâmetros** | Formulário;Componente;Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o valor de um componente em outro formulário de forma assíncrona, executando o fluxo de callback após a sua execução.

Parâmetro(s):
1. Constante formulário ou GUID.
2. Componente.
3. Fluxo de Callback.
4. Lista de Parâmetros (Variante, Opcional)

Retorno:
Não possui.

Observações:
1. Para que essa função funcione da forma esperada, o formulário informado no primeiro parâmetro precisa estar aberto.
2. O fluxo definido como callback receberá automaticamente no primeiro parâmetro o valor do componente.

### Código Cliente (JavaScript)

```javascript
function ebfChannelGetComponentValeuOtherForm (form, component, ruleCallback, callbackParams) {
  if(webrunBroadcast) {
    const jsonProperties = {};
    jsonProperties.formGUID = form;
    jsonProperties.action = "wgc";
    jsonProperties.component = component;
    jsonProperties.formTarget = decodeURI(mainform.formGUID);
    jsonProperties.callback = ruleCallback;
    jsonProperties.callbackParams = callbackParams;

    webrunBroadcast.postMessage(jsonProperties);
  }
}
```

---

## Obter Variável Local

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetLocalVariable` |
| **Código** | 539 |
| **Assinatura** | `Obter Variável Local (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o valor da variável local criada através da função "Definir Variável Local".

Parâmetro:
1. Nome da variável.

Retorno:
Retorna o valor da variável local definida no formulário.

### Código Cliente (JavaScript)

```javascript
function ebfGetLocalVariable(varName) {
  let targetStorage = window.webrunTopTarget ? window.webrunTopTarget : top.document;
  return targetStorage[varName];
}
```

---

## Obter Variável de Ambiente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetEnv` |
| **Código** | 457 |
| **Assinatura** | `Obter Variável de Ambiente (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém a variável de ambiente.

Parâmetro:
1. Nome da variável de ambiente. (Letras)

Retorno:
Valor da variável de ambiente obtida. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfGetEnv(Variant varName) throws Exception {
      return new Variant(System.getenv(varName.toString()));
  }
```

---

## Obter Versão do Aplicativo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetAppVersion` |
| **Código** | 877 |
| **Assinatura** | `Obter Versão do Aplicativo (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna a versão atual do aplicativo.

Parâmetro:
Não possui.

Retorno:
Versão do aplicativo. (Letras)

---

## Obter XML com a Estrutura do Menu

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfXmlMenu` |
| **Código** | 607 |
| **Assinatura** | `Obter XML com a Estrutura do Menu (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função retorna um XML com as informações do menu de acordo com as permissões do usuário logado.

Parâmetro:
Não possui.

Retorno:
XML com a estrutura do menu do sistema. (Letras)

Observação:
Esta função usará como base a tabela FR_MENU e só retornará dados caso a tabela esteja preenchida (Geralmente de projetos criados com a versão 2.7 ou anterior).

### Código Servidor (Java)

```java
protected final Variant ebfXmlMenu() throws Exception {
  StringBuffer xml = new StringBuffer();
  xml.append("<?xml version=\"1.0\" encoding=\"").append(Settings.CHARSET).append("\"?>\n");
  xml.append("<ROOT>\n\n");
  if (getSystem().getMenus() == null) {
    getSystem().reloadMenus(connection);
  }
  generateMenu(xml, getSystem().getMenus());
  xml.append("</ROOT>");
  
  return new Variant(xml);
}

private void generateMenu(StringBuffer xml, List<WFRMenu> menus) throws Exception {
  for (WFRMenu menu : menus) {
    if (menu instanceof WFRMenuSeparator) {
      xml.append("<MENU SEPARATOR=\"true\">\n\n");
    } else {
      xml.append("<MENU CODE=\"" + menu.getCode() + "\">\n");
      xml.append("<DESCRIPTION>" + Functions.stringToJs(menu.getDescription()) + "</DESCRIPTION>\n");
      if (menu instanceof WFRMenuItem) {
        if (((WFRMenuItem) menu).getForm() != null)
          xml.append("<FORM>" + (((WFRMenuItem) menu).getForm().getCodeStr()) + "</FORM>\n");
      } else if (menu instanceof WFRMenuReport) {
        xml.append("<REPORT>" + (((WFRMenuReport) menu).getDBCode()) + "</REPORT>\n");
      }
      
      WFRAccessPermission perm = menu.getPermission(getData().getHtmlInterface().getAcessUser(), getSystem().getAccess()); 

      boolean show = perm.getVisible();

      if (menu.getManager() && !getData().getHtmlInterface().isManager())
        show = false;
      if (menu.getAccessMode() && getData().getHtmlInterface().getAccess() != wfr.sys.HTMLInterface.AccessType.PERMISSION)
        show = false;

      boolean readonly = false;

      if ((!perm.getEnabled() || perm.getReadOnly()) && getData().getHtmlInterface().getAccess() != wfr.sys.HTMLInterface.AccessType.PERMISSION) {
        readonly = true;
      }
      
      String link = "";
      
      if (menu instanceof WFRMenuItem) {
        WFRMenuItem m = (WFRMenuItem) menu;
        if (m.getForm() != null)
          link = "javascript:" + wfr.sys.HTMLInterface.HTMLForm.getFormOpenCommand(m.getForm(), "");
      } else if (menu instanceof WFRMenuReport) {
        WFRMenuReport m = (WFRMenuReport) menu;
        if (m.getSubMenus().size() == 0) 
            link = m.jsLink();
      } else if (menu instanceof WFRMenuMakerReport) {
        WFRMenuMakerReport m = (WFRMenuMakerReport) menu;
        if (m.getSubMenus().size() == 0)
            link = m.jsLink();
      }
      
      if (readonly)
        link = "";
      
      xml.append("<VISIBLE>" + show + "</VISIBLE>\n");
      xml.append("<READONLY>" + readonly + "</READONLY>\n");
      xml.append("<LINK>" + link + "</LINK>\n");
    }
    generateMenu(xml, menu.getSubMenus());
    xml.append("</MENU>\n\n");
  }
}
```

---

## Obter tipo de conexão de internet

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConnectionType` |
| **Código** | 610 |
| **Assinatura** | `Obter tipo de conexão de internet ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna o tipo de conexão usada para acesso a internet pelo dispositivo móvel.

Parâmetro:
Não possui.

Retorno:
 Tipo da conexão:
      -  Unknown connection;
      -  Ethernet connection;
      -  WiFi connection;
      -  Cell 2G connection;
      -  Cell 3G connection;
      -  Cell 4G connection;
      -  No network connection;

### Código Cliente (JavaScript)

```javascript
function ebfConnectionType() {

}
```

---

## Obter valor de um Cookie

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetCookie` |
| **Código** | 380 |
| **Assinatura** | `Obter valor de um Cookie.` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o valor de um Cookie.

Parâmetro:
1. Nome do cookie definido.

Retorno:
Valor do Cookie. (Letras)

Observação:
Existe uma função "Definir Cookie" que permite criar e atribuir um valor a um cookie.

### Código Servidor (Java)

```java
protected Variant ebfGetCookie(Variant cookieName)throws Exception{
  String cookie = Functions.getCookie(request, cookieName.getString());
  return VariantPool.get(cookie);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetCookie(name) { 
  var dc = document.cookie;
  var prefix = name + "=";
  var begin = dc.indexOf("; " + prefix);
  if (begin == -1) {
    begin = dc.indexOf(prefix);
    if (begin != 0)
      return null;
  }else
    begin += 2;
  var end = document.cookie.indexOf(";", begin);
  if (end == -1)
    end = dc.length;
  return unescape(dc.substring(begin + prefix.length, end));
}
```

---

## Obter variável da sessão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSessionAttribute` |
| **Código** | 102 |
| **Assinatura** | `Obter variavel da sessão(Letras;Lógico):Variante` |
| **Parâmetros** | Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o conteúdo da variável criada pela função "Definir variável de sessão" passando no 1º parâmetro o nome da
variável e no 2º parâmetro o valor lógico verdadeiro ou falso, indicando se é ou não uma variável global. Para variáveis
globais usa-se verdadeiro, para não globais usa-se falso.

Parâmetro(s):
1. Nome da Variável. (Letras)
2. Valor Lógico.

Retorno:
Retorna o conteúdo da variável passada no primeiro parâmetro caso ela já exista. Caso ela ainda não tenha sido definida,
retorna nulo. (Variante)

Observação:
Para obter uma variável de sessão é necessário antes definir essa variável utilizando a função "Definir variável de sessão" 
da categoria Utilitários.

Exemplo: 
Assumindo como parâmetros "Contador" (Letras) e verdadeiro (Lógico). Se existir uma variável global com o nome 
"Contador" o retorno seria o conteúdo dessa variável. Caso não exista, o retorno seria nulo.

### Código Cliente (JavaScript)

```javascript
function ebfGetSessionAttribute(name, global){
  try {  
    postForceUTF8;    
  } catch (e) {
    var isFirefoxVersionAbove3 = false;
    var firefoxRegExp = new RegExp("firefox/(\\d+)", "i");
    var firefoxRegExpResult = firefoxRegExp.exec(navigator.userAgent);
    if (firefoxRegExpResult != null && firefoxRegExpResult.length > 1) {
      try {
        var version = parseInt(firefoxRegExpResult[1]);
        if (version > 2) {
          isFirefoxVersionAbove3 = true;
        }
      } catch (e) {}
    }

    postForceUTF8 = (isFirefoxVersionAbove3 || isSafari);  
  }  

  var content = getContent("sessionManager.do?sys=" + sysCode + "&nome=" + URLEncode(name, postForceUTF8) + "&global=" + global + "&acao=get");
  var ajaxReturn = eval(content);
  if (ajaxReturn) {
    return ajaxReturn;
  } else {
    return "";
  }
}
```

---

## Obter versão do Webrun

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetWebrunVersion` |
| **Código** | 410 |
| **Assinatura** | `Obter versão do Webrun():Letras;` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna a versão atual do Webrun.

Parâmetro:
Não possui.

Retorno:
Versão do webrun. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfGetWebrunVersion() throws Exception {
  return VariantPool.get(WFRSystem.WEBRUN_VERSION);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetWebrunVersion(){
  return VERSION;
}
```

---

## Paleta de Cor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReturnColor` |
| **Código** | 527 |
| **Parâmetros** | Letras;Letras;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Paleta que possibilita a escolha de uma cor retornando o código HTML da cor escolhida.

Parâmetro(s):
1. Moldura na qual a paleta de cores aparecerá. (Letras)
2. Nome da regra chamada. (Letras)
3. Lista contendo parâmetros da regra chamada. (Variante)

Retorno:
Código HTML da Cor. (Letras)

Observação:
A regra chamada no 2° parâmetro deve possuir uma variável do tipo letras como parâmetro de entrada.

Exemplo:
Assumindo que temos uma moldura no 1° parâmetro, um fluxo no 2° parâmetro com uma variável chamada "Cor" como parâmetro de entrada
e o uso da função: "Alertar Aguardando Ok" retornando a variável "Cor", 3° parâmetro nulo.

### Código Cliente (JavaScript)

```javascript
function ebfDrawColorPalette(stageID, callback) {
    var listColor = ["00", "33", "66", "99", "CC", "FF"];
    var table = document.createElement("table");
    table.border = 1;
    table.cellPadding = 0;
    table.cellSpacing = 0;
    table.style.borderColor = "#666666";
    table.style.borderCollapse = "collapse";
    var tr, td;
    var color = "";
    var tbody = document.createElement("tbody");
    for (var i = 0; i < listColor.length; i++){
        tr = document.createElement("tr");
        for (var x = 0; x < listColor.length; x++) {
            for (var y = 0; y < listColor.length; y++) {
                color = "#"+listColor[i]+listColor[x]+listColor[y];
                td = document.createElement("td");
                td.style.width = "11px";
                td.style.height = "11px";
                td.style.background = color;
                td.color = color;
                td.style.borderColor = "#000";
                td.style.cursor = "pointer";
               
                if (typeof(callback) == "function") {
                    td.onclick = function() {
                        callback.apply(this, [this.color]);
                    }
                }
                tr.appendChild(td); 
            }
        }
        tbody.appendChild(tr);
    }  
    table.appendChild(tbody);
    //var element = document.getElementById(stageID);     
    var element = $c(stageID).div; 
    if (element){ 
      element.innerHTML = '';
      element.appendChild(table);      
    }    
    
    return table;
}

 function ebfReturnColor(divName,ruleName,ruleParams){  
    
     ebfDrawColorPalette(divName, function(color) {        
      //---                             
      if (!isNullable(ruleName)) {
         var params = new Array();       
         var newList = new Array();
         newList.push(color);          

         if (!isNullable(ruleParams)) {
            for(var i = 0; i < ruleParams.length; i++){
                newList.push(ruleParams[i]);
            }
            
         }     
         executeJSRuleNoField(ebfGetSystemID(),ebfGetFormID(),ruleName,newList,false);         
         $c(divName).div.innerHTML = '';
         
      }
    //---        
        
        return color;
    });       
    
 }
```

---

## Permitir certificados SSL não confiáveis?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSSLAccept` |
| **Código** | 435 |
| **Assinatura** | `Permitir certificados SSL não confiáveis (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Determina se a aplicação deve aceitar ou não certificados não confiáveis. Certificados não confiáveis são aqueles onde
a identidade do mesmo não pôde ser atestada.

Parâmetro:
1. "Falso" para não aceitar certificados não confiáveis ou "Verdadeiro" para o aceitá-los.

Retorno:
Não possui.

Observação:
Por padrão, a partir da versão 2.6.2.29 do Webrun, certificados não confiáveis são aceitos.

Exemplo: 
Ao entrar no sistema, caso deseje não permitir certificados SSL não confiáveis, utilize esta função assumindo o parâmetro 
como "falso". Dessa forma, caso utilize a função "Obter conteúdo da URL" e a URL informada esteja com um certificado
SSL inválido, o conteúdo não será acessado e uma janela de erro será apresentada.

### Código Servidor (Java)

```java
protected final Variant ebfSSLAccept(final Variant accept) throws Exception {
    javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(new javax.net.ssl.HostnameVerifier() {
      public boolean verify(String string, javax.net.ssl.SSLSession ssls) {
        try {
          return accept.getBoolean();
        } catch (WFRRuleException e) {
          return false;
        }
      }
    });
    return Variant.VARIANT_NULL;
  }
```

---

## Postar Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPostData` |
| **Código** | 540 |
| **Assinatura** | `Postar Dados (Letras;Letras;Lógico;Lógico;Fluxo;Fluxo): Variante` |
| **Parâmetros** | Letras;Letras;Lógico;Lógico;Fluxo;Fluxo |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função efetua a postagem (POST) de dados para uma determinada URL informada pelo parâmetro.

Parâmetro(s):
1. URL. (Letras)
2. Dados. (Letras)
3. Levantar exceção? (Lógico)
4. Assíncrono? (Lógico)
5. Regra a ser executada. (Fluxo, Opcional, Somente Assíncrono)
6. Regra a ser executada caso ocorra erro. (Fluxo, Opcional, Somente Assíncrono)

Retorno:
Conteúdo (Letras para Síncrono e Variante para Assíncrono)

Observação(ões):
1. Caso seja definido a postagem como Assíncrono, deve-se informar um fluxo no 5º parâmetro. O mesmo 
será chamado assim que a postagem dos dados for concluída. O fluxo definido deverá possuir um parâmetro de entrada 
do tipo Letras que será a resposta (caso possua) do servidor.
2. O 3º parâmetro define se uma exceção deverá ser levantada em caso de erros na postagem dos dados.
3. Caso deseje passar os dados com caracteres especiais o mesmo deve ser codificado/escapado, conforme definido pelo w3c. Pode-se 
efetuar essa codificação utilizando a função "URL - Codificar".
4. Esta função somente retorna valores se a mesma for definida como Síncrona (4º parâmetro = falso). Caso seja definida como Assíncrona, o retorno será enviado para o fluxo que será chamado (Definido no 5º parâmetro).

Exemplo:
Primeiro parâmetro definimos a URL:http://localhost:8036/webrun/FluxoWebPostarDados.rule?sys=M3B Segundo parâmetro os dados: &EMPRESA=Softwell&PRODUTO=Maker
Observação: (EMPRESA e PRODUTO) são parâmetros de entrada do fluxo e os mesmos devem ser passados separado por &.

### Código Cliente (JavaScript)

```javascript
function ebfPostData(url, postData, throwsException, async, ruleCallback, ruleCallbackError) {
  if (async) {
    postURLAsync(url, postData, throwsException, ruleCallback, ruleCallbackError);
  } else {
    return postURL(url, postData, throwsException);
  }
}
```

---

## Postar Dados por Iframe

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIframeTransporter` |
| **Código** | 655 |
| **Assinatura** | `Postar Dados por Iframe (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe uma URL como parâmetro e abre o mesmo em um iframe criado dinamicamente. O iframe criado não
possui tamanho nem aparência, ficando invisível ao formulário.

Parâmetro:
1. URL. (Letras)

Retorno:
Não possui.

Observação:
Esta função é recomendada na chamada de serviços que retornam conteúdo HTML ou Elementos do tipo Script para
serem executados.

### Código Cliente (JavaScript)

```javascript
function ebfIframeTransporter(url) {
  IframeTransporter(url);
}
```

---

## REST - Consumir Serviço Stream

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendRequestStream` |
| **Código** | 1072 |
| **Assinatura** | `REST - Consumir Serviço Stream (Letras;Letras;Variante;Letras;Fluxo;Variante;Fluxo;Variante;Inteiro;Letras)` |
| **Parâmetros** | Letras;Letras;Variante;Letras;Fluxo;Variante;Fluxo;Variante;Inteiro;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função envia uma requisição HTTP, utilizando os parâmetros fornecidos para configurar a conexão, corpo da requisição, cabeçalhos e regras de processamento da resposta. A resposta é lida como um stream de dados e processada de acordo com uma regra específica.

Parâmetros:
1. Método da requisição HTTP (Letras)
2. URL para onde a requisição HTTP será enviada (Letras)
3. Mapa de parâmetros do cabeçalho (Variante)
4. Parâmetro do corpo, normalmente para métodos como POST ou PUT (Letras)
5. Nome da regra de sucesso. Regra a ser chamada para processar cada linha da resposta recebida do servidor (Letras)
6. Lista de parâmetros da regra de sucesso(Variante) (Opcional)
7. Nome da regra de erro. Regra a ser chamada para processar o erro ocorrido (Letras)
8. Lista de parâmetros da regra de erro(Variante) (Opcional)
9. Tempo máximo de espera (em milissegundos) para a conexão (Inteiro) (Opcional)
10. Charset. Conjunto de caracteres usado para ler a resposta. (Letras) (Opcional)

Retorno:
Não possui.

Observações:
1. A regra associada no parâmetro 4 receberá automaticamente como parâmetro o valor de retorno de cada linha da resposta recebida.
2. O parâmetro 7  deve ser usado apenas na camada servidor. Quando definido a regra deve reservar dois parâmetros de entrada que serão preenchidos automaticamente com o código de status e a resposta.
3. O parâmetro 8  deve ser usado apenas na camada servidor.
4. O parâmetro 9 deve ser usado apenas na camada servidor. Quando não definido, por padrão temo como valor 0 (zero).
5. O parâmetro 10 deve ser usado apenas na camada servidor. Quando não definido, por padrão tem como valor o charset do Webrun.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final void ebfSendRequestStream(Variant method, Variant url, Variant headerParams, Variant body, Variant successRule,
    Variant paramsSuccess, Variant errorRule, Variant errorParams, Variant timeout, Variant charset) throws Exception {

  java.net.HttpURLConnection connection;
  if (url.getString().isEmpty()) {
    return;
  }

  connection = (java.net.HttpURLConnection) new java.net.URL(url.getString()).openConnection();
  connection.setConnectTimeout(timeout.getLong().intValue());
  connection.setRequestMethod(method.getString().toUpperCase());
  connection.setDoOutput(true);
  if (headerParams.getObject() != null) {
    Map<String, String> headParams = (Map<String, String>) headerParams.getObject();
    headParams.forEach((key, value) -> {
      connection.setRequestProperty(key, value);
    });
  }

  if (!method.getString().equalsIgnoreCase("GET") && body != null) {
    connection.getOutputStream().write(body.getString().getBytes());
  }

  int responseCode = connection.getResponseCode();
  String charSet = charset.getString().isEmpty() ? wfr.util.Settings.CHARSET : charset.getString();
  // Verifica se o status code não é 200 ou 201
  if (responseCode >= 200 && responseCode <= 299) {
    try (InputStream inputStream = connection.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, charSet.toUpperCase()))) {

      List<Object> params = (List<Object>) paramsSuccess.getObject();
      int size = (params != null) ? params.size() : 0;
      String line;
      while ((line = bufferedReader.readLine()) != null) {
        Variant[] paramsList = new Variant[size + 1];
        paramsList[0] = new Variant(line);
        if (size > 0) {
          for (int i = 0; i < size; i++) {
            paramsList[i + 1] = new Variant(params.get(i));
          }
        }

        callRule(this, successRule.getString(), isDevelopmentMode(), paramsList);
      }
    }
  } else {
    // Lê a resposta de erro
    StringBuilder errorResponse = new StringBuilder();
    try (InputStream errorStream = connection.getErrorStream();
        BufferedReader errorReader = new BufferedReader(new InputStreamReader(errorStream, charSet.toUpperCase()))) {
      String line;
      while ((line = errorReader.readLine()) != null) {
        errorResponse.append(line);
      }
    }

    // Chama a regra de erro com o status code e a resposta completa
    List<Object> params = (List<Object>) errorParams.getObject();
    int size = (params != null) ? params.size() : 0;
    Variant[] _errorParams = new Variant[size + 2];
    _errorParams[0] = new Variant(responseCode);
    _errorParams[1] = new Variant(errorResponse.toString());
    if (size > 0) {
      for (int i = 0; i < size; i++) {
        _errorParams[i + 2] = new Variant(params.get(i));
      }
    }
    
    callRule(this, errorRule.getString(), isDevelopmentMode(), _errorParams);
  }

  connection.disconnect();
}
```

### Código Cliente (JavaScript)

```javascript
async function ebfSendRequestStream(method, url, headers, messageData, dataCallback, paramsDataCallback) {
  const response = await fetch(url, {
    method: method.toUpperCase(),
    headers: ebfMapToJson(headers),
    body: JSON.stringify(messageData),
  });

  if(dataCallback && !paramsDataCallback) {
    paramsDataCallback = new Array();
  }

  const reader = response.body.pipeThrough(new TextDecoderStream()).getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) break;
    if (dataCallback) {
      let params = new Array();
      params.unshift(value);
      if (paramsDataCallback.length > 0)
        params = params.concat(paramsDataCallback);

      ebfFlowExecute(dataCallback, params);
    }
  }
};
```

---

## REST - Consumir WebService

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRestCallNew` |
| **Código** | 1156 |
| **Assinatura** | `REST - Consumir WebService (Letras;Letras;Letras;Fluxo;Variante;Variante;Letras;Letras;Fluxo;Variante): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Fluxo;Variante;Variante;Letras;Letras;Fluxo;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função consome um WebService através da API REST.

Parâmetro(s):
1. Ação. (Letras)
2. URL. (Letras)
3. Parâmetros da Postagem. (Letras ou Mapa) (Ver observação 3)
4. Regra a ser executada. (Fluxo, Somente camada cliente ou Mobile)
5. Parâmetros da Regra. (Variante, Somente camada cliente ou Mobile)
6. Parâmetros do Cabeçalho. (Mapa de Parâmetros)
7. Parâmetro do Corpo. (Letras, Somente camada servidor, na camada cliente usar o 3º parâmetro) (Ver observação 5).
8. Charset. (Letras, Opcional, Somente camada servidor) (Ex.: UTF-8, ISO-8859-1)
9. Regra a ser executada caso tenha ocorrido um erro. (Fluxo, Somente camada cliente ou Mobile) (Ver observação 6);
10. Parâmetros da Regra caso tenha ocorrido um erro. (Variante, Somente camada cliente ou Mobile);

Retorno:
Objeto JSON com o formato abaixo: 
{
  "headers": {
    "key1": "value1",
    "key2": "value2"
  },
  "result": "Resultado do Webservice",
  "status": "OK",
  "statusCode": 200
}

Variante (Ver observação 4 e 8).

Observações:
1. A regra do quarto parâmetro deverá possuir um parâmetro de entrada que irá receber o retorno do WebService.
2. Ações disponíveis (GET, POST, PUT, DELETE, HEADER, OPTIONS), é importante observar se o servidor suporta essas ações.
3. Caso a ação seja POST deverá ser criado um Mapa com parâmetros, Letras caso contrário.
4. A execução desta função na camada cliente ou Mobile é assíncrona e o retorno será enviado automaticamente como primeiro parâmetro do fluxo. (4º parâmetro) . Caso a execução desta função seja camada servidor, a execução será síncrona.
5. O 7º parâmetro somente é suportado para as ações PUT e POST, ao ser definir o 3º parâmetro será ignorado.
6. O 9º parâmetro somente é suportado na camada cliente e recebe automaticamente no primeiro parâmetro o código do erro da resposta. Ex.: 500 = "Erro interno do servidor".
7. Caso a URL para consumo seja um Fluxo WEB e o método solicitado seja POST/PUT deve-se setar o 6º parâmetro (Parâmetros do Cabeçalho) para Content-Type = application/x-www-form-urlencoded (Camada Cliente).
8. Quando utilizada na camada Cliente, as chaves do cabeçalho(headers) tem o retorno em caixa baixa, exceto no Internet Explorer.
  Exemplo: Na camada cliente o parâmetro "Content-Type" é escrito como "content-type", como mostra a documentação: 
  https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/getAllResponseHeaders

### Código Servidor (Java)

```java
@SuppressWarnings({ "rawtypes", "unchecked" })
protected final Variant ebfRestCallNew(Variant...variants) throws Exception {
  boolean bHTTPS = false;
  String sResponse = "";
  boolean isBody = false;
  String action = variants[0].getString();
  String vURL = variants[1].toString();
  Map<String, String> hParams = (Map)variants[5].getObject();
  String charSet = variants[7].toString().equals("") ? wfr.util.Settings.CHARSET : variants[7].toString();

  StringBuilder postData = new StringBuilder();
  byte[] postDataBytes = null;
  String postDataString = null;
  java.net.HttpURLConnection httpConn = null;
  javax.net.ssl.HttpsURLConnection httpsConn = null;
  java.io.DataOutputStream dos = null;
  java.io.InputStream istr = null;
  java.io.BufferedReader reader = null;
  java.net.URL ul = null;
  jakarta.json.JsonObjectBuilder jObjectBuilder = jakarta.json.Json.createObjectBuilder();
  jakarta.json.JsonObjectBuilder jObjectBuilderHeader = jakarta.json.Json.createObjectBuilder();

  if (action.equals("GET") || action.equals("DELETE") || action.equals("PUT"))
    ul = new java.net.URL(variants[2].getString().equals("") ? vURL : vURL + "?" + variants[2].getString());
  else ul = new java.net.URL(vURL);

  if (vURL.startsWith("https:")) {
    bHTTPS = true;
    httpsConn = (javax.net.ssl.HttpsURLConnection) ul.openConnection();
  } else {
    httpConn = (java.net.HttpURLConnection) ul.openConnection();
  }

  if (action.equals("GET") || action.equals("DELETE")) {
    if (bHTTPS) {
      if (hParams != null) {
        for (Map.Entry<String, String> entry: hParams.entrySet()) {
          httpsConn.setRequestProperty(entry.getKey(), entry.getValue());
        }
      }

      httpsConn.setRequestMethod(action);
    } else {
      if (hParams != null) {
        for (Map.Entry < String, String > entry: hParams.entrySet()) {
          httpConn.setRequestProperty(entry.getKey(), entry.getValue());
        }
      }

      httpConn.setRequestMethod(action);
    }
  } else if (action.equals("POST") || action.equals("PUT")) {
    Map params = null;
    String fParams = null;

    if (action.equals("POST")) {
      params = (Map) variants[2].getObject();

      if (params != null && variants[6].getObject() == null) {
        Map<String, String> map = params;
        for (Map.Entry<String, String> param: map.entrySet()) {
          if (postData.length() != 0) postData.append('&');
          postData.append(java.net.URLEncoder.encode(param.getKey(), charSet));
          postData.append('=');
          postData.append(java.net.URLEncoder.encode(String.valueOf(param.getValue()), charSet));
        }

        postDataBytes = postData.toString().getBytes(charSet);
        postDataString = postData.toString();
      } else {
        postDataBytes = variants[6].getObject() != null ? variants[6].getObject().toString().getBytes(charSet) : new byte[0];
        postDataString = variants[6].getObject() != null ? variants[6].getObject().toString() : null;
        isBody = true;
      }
    } else {
      fParams = variants[2].getString();
      if (fParams != null && variants[6].getObject() == null) {
        postDataBytes = fParams.toString().getBytes(charSet);
        postDataString = fParams.toString();
      } else {
        postDataBytes = variants[6].getObject().toString().getBytes(charSet);
        postDataString = variants[6].getObject().toString();
        isBody = true;
      }
    }

    if (bHTTPS) {
      if (hParams != null) {
        Map<String, String> map = hParams;
        for (Map.Entry<String, String> entry: map.entrySet()) {
          httpsConn.setRequestProperty(entry.getKey(), entry.getValue());
        }
      }

      httpsConn.setRequestMethod(action);
    } else {
      if (hParams != null) {
        Map < String, String > map = hParams;
        for (Map.Entry < String, String > entry: map.entrySet()) {
          httpConn.setRequestProperty(entry.getKey(), entry.getValue());
        }
      }

      httpConn.setRequestMethod(action);
    }

    if (bHTTPS) {
      httpsConn.setDoOutput(true);
      httpsConn.setDoInput(true);

      if (postDataBytes != null)
        httpsConn.setRequestProperty("Content-Length", Integer.toString(postDataBytes.length));

      if (isBody) {
        dos = new java.io.DataOutputStream(httpsConn.getOutputStream());
        dos.write(postDataBytes);
        dos.close();
      } else {
        httpsConn.getOutputStream().write(postDataBytes);
      }
    } else {
      httpConn.setDoOutput(true);
      httpConn.setDoInput(true);

      if (postDataBytes != null)
        httpConn.setRequestProperty("Content-Length", Integer.toString(postDataBytes.length));

      if (isBody) {
        dos = new java.io.DataOutputStream(httpConn.getOutputStream());
        dos.write(postDataBytes);
        dos.close();
      } else {
        httpConn.getOutputStream().write(postDataBytes);
      }
    }
  }

  if (bHTTPS) {
    if (httpsConn.getResponseCode() == 200 || httpsConn.getResponseCode() == 201 || httpsConn.getResponseCode() == 202) {
      istr = httpsConn.getInputStream();
      jObjectBuilder.add("status", "OK");
      jObjectBuilder.add("statusCode", httpsConn.getResponseCode());
    } else {
      istr = httpsConn.getErrorStream();
      jObjectBuilder.add("status", "ERROR");
      jObjectBuilder.add("statusCode", httpsConn.getResponseCode());
      sResponse = httpsConn.getResponseMessage();
    }
  } else {
    if (httpConn.getResponseCode() == 200 || httpConn.getResponseCode() == 201 || httpConn.getResponseCode() == 202) {
      istr = httpConn.getInputStream();
      jObjectBuilder.add("status", "OK");
      jObjectBuilder.add("statusCode", httpConn.getResponseCode());
    } else {
      istr = httpConn.getErrorStream();
      jObjectBuilder.add("status", "ERROR");
      jObjectBuilder.add("statusCode", httpConn.getResponseCode());
      sResponse = httpConn.getResponseMessage();
    }
  }

  java.io.ByteArrayOutputStream result = new java.io.ByteArrayOutputStream();
  byte[] buffer = new byte[1024];
  int length;
  if(istr != null) {
    while ((length = istr.read(buffer)) != -1) {
      result.write(buffer, 0, length);
    }

    sResponse = result.toString(charSet);
  }

  java.util.Map<String, java.util.List<String>> headers = bHTTPS ? httpsConn.getHeaderFields() : httpConn.getHeaderFields();
  java.util.Set<String> keys = headers.keySet();
  java.util.Iterator<String> itr = keys.iterator();
  while (itr.hasNext()) {
    String key = itr.next();
    if (key != null) {
      java.util.List<String> values = headers.get(key);
      java.lang.StringBuffer sb = new java.lang.StringBuffer();
      java.util.Iterator<String> itrV = values.iterator();
      while (itrV.hasNext()) sb.append(" ").append(new String(itrV.next().getBytes(), charSet));
      jObjectBuilderHeader.add(key, sb.toString());
    }
  }

  jObjectBuilder.add("headers", jObjectBuilderHeader.build());
  jObjectBuilder.add("result", sResponse);

  if (istr != null) istr.close();
  if (reader != null) reader.close();
  if (dos != null) dos.close();

  if (httpsConn != null) httpsConn.disconnect();
  else if (httpConn != null) httpConn.disconnect();

  return VariantPool.get(jObjectBuilder.build());
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRestCallNew(action, url, ParamsURL, ruleCallback, Params, headerParams, paramBody, charset, ruleCallbackError, paramsRuleError) {
  var data = "";
  action = action.toUpperCase();
  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function() {
    if (this.readyState == 4) {
      if(this.status == 200 || this.status == 201 || this.status == 202 ){
        if (ruleCallback) {
          var content = convertNonUnicodeChars(this.responseText);
          Params = Params == null ? [] : Params          
          var jsonReturn = {};
          jsonReturn.headers = getResponseHeaderMap(this);
          jsonReturn.status = "OK";
          jsonReturn.statusCode = this.status;          
          jsonReturn.result = content;          
          ebfSetElementAtList(Params, jsonReturn, 1)
          executeRuleFromJS(ruleCallback, Params);
        }
      }else{
        if (ruleCallbackError) {
          var content = convertNonUnicodeChars(this.responseText);
          paramsRuleError = paramsRuleError == null ? [] : paramsRuleError          
          var jsonReturn = {};
          jsonReturn.headers = getResponseHeaderMap(this);
          jsonReturn.status = "ERROR";
          jsonReturn.statusCode = this.status;          
          jsonReturn.result = content;
          ebfSetElementAtList(paramsRuleError, jsonReturn, 1)
          executeRuleFromJS(ruleCallbackError, paramsRuleError);
        }
      }
    }
  };

  if (action == "POST" || action == "PUT") {
    if(ParamsURL !== undefined && ParamsURL !== 'undefined' && ParamsURL !== null && ParamsURL instanceof Map){
      var paramsMap = ParamsURL.getKeys();
      for(j=0; j < ParamsURL.size; j++){
        if(ParamsURL.size > 1 && j + 1 < ParamsURL.size ){          
          data += "" + paramsMap[j]+'='+ebfMapGetObject(ParamsURL, paramsMap[j])+'&';
        }else{
          data += "" + paramsMap[j]+'='+ebfMapGetObject(ParamsURL, paramsMap[j]);
        }
      }
    }else{
      data = ParamsURL;
    }
  } else {
    if (ParamsURL != "" && ParamsURL !== undefined && ParamsURL !== 'undefined' && ParamsURL !== null) {
      url = url + "?" + ParamsURL;
    }
  }

  xhr.overrideMimeType('text/plain; charset=' + (charset ? charset : ENCODING));
  xhr.open(action, url, true);

  if(headerParams !== undefined && headerParams instanceof Map){
    var paramsHeader = headerParams.getKeys();
    for(i=0; i < headerParams.size; i++){
      xhr.setRequestHeader(paramsHeader[i], ebfMapGetObject(headerParams, paramsHeader[i]));
    }
  }

  xhr.send(data == "" ? null : data);
}


function getResponseHeaderMap(xhr) {
  const headers = {};
  var responseHeaders = xhr.getAllResponseHeaders();
  if(responseHeaders){
    responseHeaders.trim()
      .split(/[\r\n]+/)
      .map(function(value){return value.split(/: /)})
      .forEach(function(keyValue) {
        headers[keyValue[0].trim()] = keyValue[1].trim();
      });
  }
  return headers;
}
```

---

## REST - Consumir Webservice - 2.0

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRestFulCallService` |
| **Código** | 1042 |
| **Assinatura** | `REST - Consumir Webservice - 2.0 (Letras;Letras;Variante;Variante;Letras;Letras;Letras;Letras;Letras;Variante): Variante` |
| **Parâmetros** | Letras;Letras;Variante;Variante;Letras;Letras;Letras;Letras;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função realiza uma requisição para um determinado endpoint informado por parâmetro.
Métodos HTTP suportados: GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS.

Parâmetros:
1. URL (Letras).
2. Método HTTP (Letras).
3. Parâmetros do Cabeçalho (Variante)(Opcional)(Observação 1).
4. Parâmetros da Requisição (Variante)(Opcional)(Observação 2).
5. Parâmetro do Corpo (Letras)(Opcional).
6. Content-Type (Letras)(Opcional).
7. Charset (Opcional)(Letras)(Ver observação 3)
8. Caminho do Certificado Digital (Letras)(Opcional)(Ver observação 4).
9. Senha do Certificado Digital (Letras)(Opcional)(Ver observação 4).
10. Mapa com os Arquivos (Variante)(Opcional)(Ver Observação 5).

Retorno:
Objeto JSON contendo as seguites informações:

status - Status da Requisição HTTP
code - Código de Resposta HTTP
headers - Cabeçalhos da Resposta
result - Resultado do consumo do endpoint (Letras)

Exemplo de Retorno:
{
  "status": "Unprocessable Entity",
  "code": 422,
  "headers": {
    "Date": "Thu, 01 Jun 2023 19:35:58 GMT",
    "Server": "Apache",
    "Content-Type": "application/json;charset=UTF-8",
    "Keep-Alive": "timeout=60, max=999",
    "Connection": "Keep-Alive",
    "Transfer-Encoding": "chunked"
  },
  "result": "{}" // Resultado do consumo do endpoint (Letras)
}

Observações:
1. O terceiro parâmetro quando definido, deve-se informar um objeto mapa contendo a chave e valor.
2. O quarto parâmetro quando definido, deve-se informar um objeto mapa contendo a chave e valor.
3. O sétimo parâmetro caso não seja definido, automaticamente obterá o charset do Webrun.
4. Deve ser passado somente se o endpoint que será requisitado exija autenticação com Certificado Digital. Ao passar 
um caminho, a conexão será feita com autenticação via Certificado Digital, a senha do certificado tem que ser informada 
para que seja possível incluir o certificado na requisição.
5. O décimo parâmetro tem como objetivo enviar arquivos para o endpoint. Deve-se informar um objeto mapa contendo a chave(nome do parâmetro) e valor(caminho completo para o arquivo).
6. Não é possível enviar na requisão diferentes tipos de parâmetros, exemplo: definir parâmetro da requisição e parâmetro do corpo.

### Código Servidor (Java)

```java
protected final Variant ebfRestFulCallService(Variant url, Variant httpMethod, Variant headParams, Variant payload, Variant raw,
  Variant contentType, Variant charset, Variant pathCertificate, Variant passwordCertificate) throws Exception {
  return ebfRestFulCallService(url, httpMethod, headParams, payload, raw, contentType, charset, pathCertificate, passwordCertificate, null);
}

@SuppressWarnings({ "unchecked", "rawtypes" })
protected final Variant ebfRestFulCallService(Variant url, Variant httpMethod, Variant headParams, Variant payload, Variant raw,
  Variant contentType, Variant charset, Variant pathCertificate, Variant passwordCertificate, Variant files) throws Exception {
  return VariantPool.get(wfr.util.WFRRestCall.callService(
    url.getString(),
    httpMethod.getString(),
    (Map) headParams.getObject(),
    (Map) payload.getObject(),
    raw.getString(),
    contentType.getString(),
    charset.getString(),
    pathCertificate.getString(),
    passwordCertificate.getString(),
    (Map) files.getObject(),    
    getSystem()
  ));
}
```

---

## REST - Obter Ação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRestGetActionName` |
| **Código** | 765 |
| **Assinatura** | `REST - Obter Ação (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém a ação que foi realizada na requisição REST.
Para funcionamento correto, deverá ser chamada em um fluxo definido com Web.

Parâmetro:
Não possui.

Retorno:
Ação. (Letras)

Exemplo:
Retorno DELETE.

### Código Servidor (Java)

```java
protected final Variant ebfRestGetActionName() throws Exception {
  return VariantPool.get(request.getMethod().toUpperCase());
}
```

---

## REST - Obter Conteúdo do Cabeçalho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRestGetHeadersContent` |
| **Código** | 1137 |
| **Assinatura** | `REST - Obter Conteúdo do Cabeçalho (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função permitir obter todo conteúdo do cabeçalho da requisição REST.
Para funcionamento correto, deverá ser chamada em um fluxo definido com Web.

Parâmetro:
Não possui.

Retorno:
Objeto JSON com o conteúdo. (Variante)

Observações:
1. Essa função tem o melhor funcionamento em fluxo marcado como WEB.
2. Todas as chaves do JSON retornado estarão em caixa baixa (minúscula).

### Código Servidor (Java)

```java
protected final Variant ebfRestGetHeadersContent () throws Exception {
  if (request != null) {
    jakarta.json.JsonObjectBuilder job = jakarta.json.Json.createObjectBuilder();
    Enumeration<String> headerNames = request.getHeaderNames();
    while (headerNames.hasMoreElements()) {
      String headerName = headerNames.nextElement();
      Enumeration<String> headers = request.getHeaders(headerName);
      while (headers.hasMoreElements()) {
        String headerValue = headers.nextElement();
        job.add(headerName, headerValue);
      }
    }
    return new Variant(job.build());
  }    
  return Variant.VARIANT_NULL;
}
```

---

## REST - Obter Conteúdo do Corpo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRestGetBodyContent` |
| **Código** | 891 |
| **Assinatura** | `REST - Obter Conteúdo do Corpo (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém o conteúdo do corpo de uma requisição REST.
Para funcionamento correto, deverá ser chamada em um fluxo definido como Web.

Parâmetro:
Não possui.

Retorno:
Conteúdo do corpo. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfRestGetBodyContent() throws Exception {
  return VariantPool.get(request.getReader().lines().collect(java.util.stream.Collectors.joining(System.lineSeparator())));
}
```

---

## RPS - Assinar XML

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRPSSignXML` |
| **Código** | 857 |
| **Assinatura** | `RPS - Assinar XML (Variante;Variante;Variante;Variante;Variante)` |
| **Parâmetros** | Variante;Variante;Variante;Variante;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função assina um XML no padrão RPS

Parâmetro(s):
1. Caminho do arquivo XML. (Variante)
2. Caminho do arquivo de saída (XML). (Variante)
3. Caminho do arquivo de chaves (.jks, pkx, p12). (Variante)
4. Senha do arquivo de chaves. (Variante)
5. Alias do par de chaves contido dentro do arquivo de chaves (.jks, pkx, p12). (Variante)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfRPSSignXML(Variant pathXML, Variant pathXMLSignature, Variant pathKeystore, Variant passKeystore, Variant aliasCert) throws Exception {
  wfr.util.WFRNFeSignature.ebfRPSSignXML(pathXML.getString(), pathXMLSignature.getString(), pathKeystore.getString(), passKeystore.getString(), aliasCert.getString());
  return Variant.VARIANT_NULL;    
}
```

---

## Recarregar Menus do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMenuReload` |
| **Código** | 651 |
| **Assinatura** | `Recarregar Menus do Sistema ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função recarrega os menus do sistema.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Servidor (Java)

```java
public void ebfMenuReload() throws Exception {
  getSystem().reloadMenus(connection);
}
```

---

## Recarregar Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfshortcutReloadSystem` |
| **Código** | 454 |
| **Assinatura** | `Recarregar Sistema ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Recarrega o sistema em execução onde a função foi chamada.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfshortcutReloadSystem() {
 shortcutReloadSystem(ebfGetFullSystemID());
}
```

---

## Redimensionar Imagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResizeImage` |
| **Código** | 458 |
| **Assinatura** | `Redimensionar Imagem (Letras;Letras;Inteiro;Inteiro;Letras)` |
| **Parâmetros** | Letras;Letras;Inteiro;Inteiro;Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Redimensiona uma imagem para uma novo tamanho (A x L).

Parâmetro(s):
1. Caminho do arquivo original. (Letras)
2. Caminho do arquivo de saída. (Letras)
3. Largura da imagem. (Inteiro)
4. Altura da imagem. (Inteiro)
5. Formato: jpg, png. (Letras)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfResizeImage(Variant originalFile, Variant finalFile, Variant imgWidth, Variant imgHeight, Variant imgFormat) throws Exception {
  java.awt.image.BufferedImage originalImage = javax.imageio.ImageIO.read(new File(getWfrFileFunctions().getDirectory(getSystem(), originalFile.getString())));
  int type = originalImage.getType() == 0 ? java.awt.image.BufferedImage.TYPE_INT_ARGB : originalImage.getType();
  java.awt.image.BufferedImage resizedImage = new java.awt.image.BufferedImage(imgWidth.getLong().intValue(), imgHeight.getLong().intValue(), type);
  java.awt.Graphics2D g = resizedImage.createGraphics();

  g.drawImage(originalImage, 0, 0, imgWidth.getLong().intValue(), imgHeight.getLong().intValue(), null);
  g.dispose();
  g.setComposite(java.awt.AlphaComposite.Src);
  g.setRenderingHint(java.awt.RenderingHints.KEY_INTERPOLATION, java.awt.RenderingHints.VALUE_INTERPOLATION_BILINEAR);
  g.setRenderingHint(java.awt.RenderingHints.KEY_RENDERING, java.awt.RenderingHints.VALUE_RENDER_QUALITY);
  g.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING, java.awt.RenderingHints.VALUE_ANTIALIAS_ON);

  javax.imageio.ImageIO.write(resizedImage, imgFormat.getString(), new java.io.File(getWfrFileFunctions().getDirectory(getSystem(), finalFile.getString())));
}
```

---

## Remover variável da sessão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveSessionAttribute` |
| **Código** | 103 |
| **Assinatura** | `Remover variável da sessão(Letras;Lógico):Variante` |
| **Parâmetros** | Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Remove a variável de sessão passando no 1º parâmetro o nome da variável e no 2º o valor Lógico que indica se ela é ou
não global.

Parâmetro(s):
1. Nome da Variável. (Letras)
2. Valor Lógico ("verdadeiro" se variável global, "falso" se variável não global).

Retorno:
Variável removida. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfRemoveSessionAttribute(name, global){
  try {  
    postForceUTF8;    
  } catch (e) {
    var isFirefoxVersionAbove3 = false;
    var firefoxRegExp = new RegExp("firefox/(\\d+)", "i");
    var firefoxRegExpResult = firefoxRegExp.exec(navigator.userAgent);
    if (firefoxRegExpResult != null && firefoxRegExpResult.length > 1) {
      try {
        var version = parseInt(firefoxRegExpResult[1]);
        if (version > 2) {
          isFirefoxVersionAbove3 = true;
        }
      } catch (e) {}
    }

    postForceUTF8 = (isFirefoxVersionAbove3 || isSafari);  
  }  

  var content = getContent("sessionManager.do?sys=" + sysCode + "&nome=" + URLEncode(name, postForceUTF8) + "&global=" + global + "&acao=remove");
  var ajaxReturn = eval(content);
  if (ajaxReturn) {
    return ajaxReturn;
  } else {
    return "";
  }
}
```

---

## Retornar Constante do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSystemConstant` |
| **Código** | 238 |
| **Assinatura** | `Retornar Constante do Sistema(Letras) : Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna uma constante do sistema.

Parâmetro:
1. Nome da constante do sistema. 

Retorno:
Valor da constante do sistema. (Variante)

Observações:
1. Devem ser colocadas os nomes das funções, e não a chamada dela.
2. Para obter algumas constantes do sistema é necessário consultar os arquivos definido na pasta config do Webrun:
    Constante database:<propriedade> consultar o arquivo database.xml.
    Constante sistema:<grupo>:<chave> consultar o arquivo config.xml. Para mais informações consulte o link do manual: "https://manual.softwell.com.br/#/arquivo_config_xml?id=arquivo-configxml".
3. Para obter uma propriedade avançada do projeto, utilize a constante "Avancadas:NomeDaPropriedade". Ex.: "Avancadas:RedirecionarAoExpirar".
4. Para maiores informações sobre todas as constantes do sistema consulte o link do manual: "https://manual.softwell.com.br/#/usando_funcoes_predefinidas_em_consultas?id=usando-fun%c3%a7%c3%b5es-predefinidas-em-consultas".

Exemplos:
1. Assumindo como parâmetro a constante "sistema" o retorno da função será a sigla do sistema.
2. Assumindo como parâmetro sistema:Agendador:Tempo o retorno será 600000 valor padrão definido.

### Código Servidor (Java)

```java
protected final Variant ebfGetSystemConstant(Variant name) throws Exception {
  Object value = client.getSystem().getSystemConstant(connection, client.getData(), developmentMode, name.toString()); 
  return VariantPool.get(value);
}
```

---

## Sair do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSystemExit` |
| **Código** | 646 |
| **Assinatura** | `Sair do Sistema ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função efetua logout do usuário autenticado no sistema. Caso esta função seja chamada através de aplicativos móveis (Maker Mobile), a aplicação será encerrada.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSystemExit() {
  let win = top; 
  if (parent.opener) { 
    win = parent.opener.top; 
  } else if (getOpenerWindow(top)) { 
    win = getOpenerWindow(top).top; 
  }
   
  mainSystemFrame.formOnUnLoadAction();
  let xhr = new XMLHttpRequest();
  xhr.open("POST", "closesystem.do?sys=" + mainform.sysCode, true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {    
      win.mainSystemFrame.unloaded = true;
      win.document.location.href = getAbsolutContextPath() + "?sys=" + mainform.sysCode + "&back=false&action=logout";      
      return true;
    }
  };

  xhr.send();
}
```

---

## Sessão - Definir Regra Ao Expirar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExecuteRuleDestroyingSession` |
| **Código** | 1117 |
| **Assinatura** | `Sessão - Definir Regra Ao Expirar (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa uma regra ao clicar em Sair ou ao destruir uma sessão.

Parâmetro(s):
1. Nome do fluxo que será executado. (Fluxo)
2. Lista de parâmetros que o fluxo espera. (Variante, Opcional)

Retorno:
Não possui.

### Código Servidor (Java)

```java
public class FlowchartSessionBindingListener implements jakarta.servlet.http.HttpSessionBindingListener, java.io.Serializable {
    private static final long      serialVersionUID = 7907635345551116768L;
    private Logger                 logger           = Logger.getLogger(FlowchartSessionBindingListener.class);

    private wfr.com.WFRSystem      system;
    private wfr.sys.WFRData        data;
    private String                 user;
    private String                 ruleName;
    private java.util.List<Object> params;

    public FlowchartSessionBindingListener(wfr.com.WFRSystem system, wfr.sys.WFRData data, String user, String ruleName, java.util.List<Object> params) {
      this.system = system;
      this.data = data;
      this.user = user;
      this.ruleName = ruleName;
      this.params = params;
    }

    public void valueBound(jakarta.servlet.http.HttpSessionBindingEvent event) {
      // do nothing
    }

    public void valueUnbound(jakarta.servlet.http.HttpSessionBindingEvent event) {
      java.io.PrintWriter out = new java.io.PrintWriter(new java.io.CharArrayWriter());

      boolean validationSession = false;
      try{
        event.getSession().isNew();
      }catch(Exception e){
        validationSession = true;

      }

      if(validationSession){	
        wfr.database.DBConnection connection = null;
        if (data != null) {
          connection = data.connection();
        }

        Variant[] paramsArray;
        if (params != null && params.size() > 0) {
          paramsArray = new Variant[params.size()];
          for (int i = 0; i < params.size(); i++) {
            paramsArray[i] = VariantPool.get(params.get(i));
          }
        } else {
          paramsArray = new Variant[0];
        }

        try {
          wfr.rules.WFRRuleClient client = new wfr.rules.WFRRuleClient(system, data, out, null);
          wfr.rules.WFRRule rule = system.getRuleManager().getRuleClass(ruleName, client, connection, new wfr.sys.WFRFormData(), false);

          try {
            if (connection != null) {
              connection.startTransactionIfNecessary();
            }

            rule.start(paramsArray);

            if (connection != null) {
              connection.commitTransaction();
            }
          } catch (Exception execEx) {
            if (connection != null) {
              connection.rollbackTransaction();
            }
            throw execEx;
          }
        } catch (Exception ruleEx) {
          String error;
          if (ruleEx instanceof WebrunException) {
            error = ((WebrunException) ruleEx).getShowMessage(system.getResources());
          } else {
            error = ruleEx.getMessage();
          }

          String user = this.user;
          if (user == null || user.trim().length() == 0) {
            user = WFRSystem.DEFAULT_USER;
          }

          logger.error(user, system.getCode(), "Error running flowchart when destroying session.", error, ruleEx);
        }
      }
    }
  }

  protected final Variant ebfExecuteRuleDestroyingSession(Variant ruleName, Variant params) throws Exception {
    String user = null;
    if (getData() != null && getData().getUser() != null) {
      user = getData().getUser().getLogin();
    }

    java.util.List<Object> paramsList = null;
    if (params.getObject() instanceof java.util.List) {
      paramsList = java.util.List.class.cast(params.getObject());
    }

    FlowchartSessionBindingListener listener = new FlowchartSessionBindingListener(getSystem(), getData(), user, ruleName.getString(), paramsList);
    request.getSession().setAttribute("FlowchartSessionBindingListenerUnbound", listener);

    return Variant.VARIANT_NULL;
  }
```

---

## Sessão - Remover Regra Ao Expirar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSessionDestroyRemoveRule` |
| **Código** | 418 |
| **Assinatura** | `Sessão - Remover Regra Ao Expirar` |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Remove a regra definida para ser executada quando a sessão for expirada.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação: 
Esta função só remove regra definida na função "Sessão - Definir Regra ao Expirar".

### Código Servidor (Java)

```java
protected final Variant ebfSessionDestroyRemoveRule() throws Exception {
  request.getSession().removeAttribute("FlowchartSessionBindingListenerUnbound");
  return Variant.VARIANT_NULL;
}
```

---

## Sigla do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFullSystemID` |
| **Código** | 451 |
| **Assinatura** | `Sigla do Sistema (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função retorna o Código (ou sigla) do sistema atual em que o fluxo está sendo executado.

Parâmetro:
Não possui.

Retorno:
Retorna o código (ou sigla) do sistema utilizado. (Letras)

Observação: 
Caso existam mais de um sistema com a mesma sigla na pasta systems, esta função retornará o Sigla do sistema com
instância. Exemplo: CTP_SISTEMA02

Exemplo:
Se o fluxo for executado no "Sistema de Contabilidade Pública", que tem como sigla "CTP", a função retornará 
"CTP".

### Código Servidor (Java)

```java
protected final Variant ebfGetFullSystemID() throws Exception {
    return VariantPool.get(getRequest().getParameter("sys"));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetFullSystemID() {
  return d.WFRForm.sys.value.toString();
}
```

---

## Spinner - Criar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateSpinner` |
| **Código** | 957 |
| **Assinatura** | `Spinner - Criar (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função tem por objetivo criar um elemento Spinner de acordo os parâmetros informados.

Parâmetro(s):
1. Referência do Elemento Pai. (Variante, Opcional).
2. Classe adicional. (Letras, Opcional)

Retorno:
Referência do Elemento. (Variante)

Observações:
1. Quando o primeiro parâmetro não é informado o mesmo assume como valor o corpo da pagina.
2. Para maiores informações sobre Spinners e as classes adicionais acessar: https://getbootstrap.com/docs/4.4/components/spinners/
3. Essa função bloqueia o acesso do elemento pai, ou seja, o elemento ficará bloqueado até que a função "Spinner - Remover" seja executada.
4. O 2° parâmetro pode receber, por exemplo: "spinner-border text-primary".

### Código Cliente (JavaScript)

```javascript
function ebfCreateSpinner (parent, addClass) {
  parent = parent ? parent : document.body;      
  return bootstrapCreateSpinner(parent, addClass, true)[0]; 
}
```

---

## Spinner - Remover

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveSpinner` |
| **Código** | 958 |
| **Assinatura** | `Spinner - Remover (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função remove um elemento Spinner.

Parâmetro:
1. Referência do Elemento. (Variante)

Retorno:
Não possui.

Observação:
A referência do elemento é obtida por meio da função "Spinner - Criar".

### Código Cliente (JavaScript)

```javascript
function ebfRemoveSpinner (spinner) {
  if (spinner) spinner.parentElement.removeChild(spinner);
}
```

---

## Traduzir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTranslate` |
| **Código** | 340 |
| **Assinatura** | `Traduzir (Letras;Variante) : Letras` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Traduz um texto para um determinado idioma.

Parâmetro(s):
1. Texto a ser traduzido. (Letras)
2. Lista de parâmetros do texto. (Variante)

Retorno:
Retorna o texto traduzido para o idioma definido no parâmetro. (Letras)

Observações:
1. Quando utilizada na camada servidor, a função irá buscar o texto passado na Tabela de Traduções. Se for utilizada
na camada cliente, o texto já tem que estar determinado no fluxo para que ele possa buscar na tabela antes da chamada da função.
2. O segundo parâmetro é para definir nomes próprios que não possuem tradução.

Exemplo:
Se definirmos o 1° Parâmetro = Meu nome é {0} e meu pai é {1},
o 2° parâmetro uma lista com os valores correspondentes a posição no texto (Lista [Maria, João]),
desta forma, a função irá retornar: My name is Maria and my father is João.

### Código Servidor (Java)

```java
protected Variant ebfTranslate(Variant text, Variant params) throws Exception {
    return VariantPool.get(translate(text.toString(), (Object[]) params.toArray(Object.class, false)));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfTranslate(text) {
  // Caso o texto não tenha sida definido, então retorna o próprio valor
  if ((text == null) || (typeof text == "undefined") || (text === "")) {
    return text;
  }
	
  var value = text;
	
  // Traduz o texto
  if (this.translations.findKey(resources_locale) != -1) {
    var resourcesMap = this.translations.get(resources_locale);
    if (resourcesMap.findKey(text) != -1) {
      value = resourcesMap.get(text);
    }
  }  

  // Tabela de Tradução.  
  try {
    if (eval("resources_" + resources_locale) && eval("resources_" + resources_locale)[text]) {  
      return eval("resources_" + resources_locale)[text];
    }  
  } catch(e) {}

  // Trata os parâmetros, caso haja
  if ((arguments.length > 1) && (arguments[1] != null) && (typeof arguments[1] != "undefined")) {
    if (arguments[1] instanceof Array) {
      // Obtém o Array
      var params = arguments[1];

      for (var i = 0; i < params.length; i++) {
        var param = params[i];
        if (param != null && typeof param != "undefined") {
          var regexp = new RegExp("\\{" + (i) + "\\}", "g");
          value = value.replace(regexp, param);
        }
      }
    } else {
      // Obtém os parâmetros definidos a partir do segundo parâmetro
      for (var i = 1; i < arguments.length; i++) {
        var param = arguments[i];
        if (param != null && typeof param != "undefined") {
          var regexp = new RegExp("\\{" + (i-1) + "\\}", "g");
          value = value.replace(regexp, param);
        }
      }
    }    
  }
  return value;
}
```

---

## URL - Codificar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfURLEncoder` |
| **Código** | 432 |
| **Assinatura** | `URL - Codificar (Letras, Letras) : Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função codifica uma URL passada por parâmetro.

Parâmetro(s):
1. URL. (Letras)
2. Charset. (Letras, Opcional) (Ex.: UTF-8, ISO-8859-1)

Retorno: 
Retorna a URL codificada. (Letras)

Observações:
1. Caso o 2º parâmetro seja nulo, a função utiliza o Charset da aplicação.
2. Ao codificar uma URL na camada cliente a mesma deve ser decodificada na mesma camada.

### Código Servidor (Java)

```java
protected final Variant ebfURLEncoder(Variant url, Variant charset) throws Exception {
    String charsetStr = charset.getTrimString();
    if (charsetStr.length() == 0) {
      charsetStr = Settings.CHARSET;
    }
    return VariantPool.get(java.net.URLEncoder.encode(url.getTrimString(), charsetStr));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfURLEncoder (url, charset){
  charset = charset === null || charset === undefined ? ENCODING : charset;
  if(charset.toUpperCase() === 'ISO-8859-1') {
    return escape(url);
  } else {
    return encodeURI(url);
  }
}
```

---

## URL - Decodificar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfURLDecoder` |
| **Código** | 433 |
| **Assinatura** | `URL - Decodificar (Letras, Letras) : Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função decodifica uma URL passada por parâmetro.

Parâmetro(s):
1. URL. (Letras)
2. Charset. (Letras, Opcional)

Retorno: 
URL decodificada. (Letras)

Observações:
1. Caso o 2º parâmetro seja nulo, a função utiliza o Charset utilizado na aplicação.
2. A URL só será decodificada corretamente se a mesma estiva codificada na mesma camada.

### Código Servidor (Java)

```java
protected final Variant ebfURLDecoder(Variant url, Variant charset) throws Exception {
    String charsetStr = charset.getTrimString();
    if (charsetStr.length() == 0) {
      charsetStr = Settings.CHARSET;
    }
    return VariantPool.get(java.net.URLDecoder.decode(url.getTrimString(), charsetStr));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfURLDecoder (url, charset) {
  charset = charset === null || charset === undefined ? ENCODING : charset;
  if(charset.toUpperCase() === 'ISO-8859-1') {
    return unescape(url);
  } else {
    return decodeURI(url);
  }
}
```

---

## Usuário Logado na Máquina

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCurrentMachineUser` |
| **Código** | 341 |
| **Assinatura** | `Usuário Logado na Máquina()` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o nome do usuário logado na máquina.

Parâmetro:
Não possui.

Retorno:
Nome do usuário logado. (Letras)

Observação:
A função retorna o usuário da conta associada ao servidor de aplicações.

### Código Servidor (Java)

```java
protected final Variant ebfCurrentMachineUser() {
  return VariantPool.get(System.getenv("USERNAME"));
}
```

---

## Usuário é Administrador?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUserIsAdmin` |
| **Código** | 1183 |
| **Assinatura** | `Usuário é Administrador? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se o usuário logado no sistema é administrador.

Parâmetros:
Não possui

Retorno:
Valor lógico indicando se o usuário é administrador.

### Código Servidor (Java)

```java
protected final Variant ebfUserIsAdmin() throws Exception {
    wfr.sys.HTMLInterface.HTMLInterface htmlInterface = 
        wfr.sys.HTMLInterface.HTMLInterface.getInstance(request);
    
    return new Variant(
        htmlInterface.getAcessUser().isRootManager() ||
        htmlInterface.getAcessUser().isManagerOf(getSystem().getCode())
    );
}
```

---

## Validar CNPJ

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsCnpj` |
| **Código** | 314 |
| **Assinatura** | `Validar CNPJ (Letras) : Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se um CNPJ é válido. Caso o valor seja vazio, será considerado que o CNPJ é válido.

Parâmetro:
1. Valor a ser avaliado. (Letras)

Retorno:
Retorna "verdadeiro" se for um CNPJ, caso contrário retorna "falso". (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfIsCnpj(value) {
  if (value == null || typeof value == "undefined" || value == "") {
    return false;
  }
  return CNPJ(value);
}
```

---

## Validar CPF

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsCpf` |
| **Código** | 342 |
| **Assinatura** | `Validar CPF (Letras) : Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se é um CPF Válido. Caso o valor seja vazio, será considerado que o CPF é válido.

Parâmetro:
1. Valor a ser avaliado. (Letras)

Retorno:
Retorna "verdadeiro" se for um CPF válido, caso o CPF seja Inválido retorna "falso".

### Código Cliente (JavaScript)

```javascript
function ebfIsCpf(value) {
  if (value == null || typeof value == "undefined" || value == "") {
    return false;
  }
  return CPF(value);
}
```

---

## Validar E-mail

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsEmail` |
| **Código** | 770 |
| **Assinatura** | `Validar E-mail (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se é um E-mail válido. Caso o valor seja vazio, será considerado que o e-mail é inválido.

Parâmetro:
1. E-mail a ser validado. (Letras)

Retorno:
Retorna "verdadeiro" se for um e-mail válido ou "falso" caso contrário.

Observações:
1. A função não verifica se é um e-mail existente. Apenas valida se está na sintaxe correta.
2. Recomendado o envio de um link de ativação para confirmação da existência do e-mail.

### Código Cliente (JavaScript)

```javascript
function ebfIsEmail(value) {
  if (value == null || typeof value == "undefined" || value == "") {
    return false;
  } 
  
  var regExp = new RegExp(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
  return regExp.test(value);
}
```

---

## Verificar Comando SQL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfValidSQLCommand` |
| **Código** | 118 |
| **Assinatura** | `Verificar Comando SQL (Letras;Variante):Letras` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Função usada para verificar se um comando em SQL está correto ou não. 

Parâmetro(s):
1. Comando SQL. (Letras)
2. Conexão (Variante) (Opcional)

Retorno: 
Caso exista erro, retorna o erro encontrado no comando SQL, caso contrário, retornará o valor nulo. (Letras)

Exemplo:
1. Passe como 1º parâmetro uma constante do tipo letras com a consulta. (ex: select * from fr_acao)
2. Atribua o valor de retorno a uma variável do tipo letras.

### Código Servidor (Java)

```java
public final Variant ebfValidSQLCommand(Variant sql, Variant pConnection) throws Exception {
    DBConnection lConnection = connection;
    Variant erro = Variant.VARIANT_NULL;
    if (pConnection.getType() != WFRRuleType.NULL) {
      Object connectionObj = pConnection.getObject();
      if (connectionObj instanceof DBConnection) {
        lConnection = (DBConnection) connectionObj;
      } else {
        throw new WFRRuleException("Conexão passada para a função \"Validar Comando SQL\" incorreto.");
      }
    }
    try {
      lConnection.executeQuery(sql.getString());
    } catch (Exception ex) {
      erro = VariantPool.get(ex.getMessage());
    }
    return erro;
  }
```

---

## Verificar Conexão com Internet

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCheckInternetConnection` |
| **Código** | 236 |
| **Assinatura** | `Verificar Conexão com Internet (Letras;Fluxo;Variante;Fluxo;Variante): Lógico` |
| **Parâmetros** | Letras;Fluxo;Variante;Fluxo;Variante |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Função que checa se existe conexão com a Internet.

Parâmetro(s):
1. URL do Website (Para o Maker Mobile, este parâmetro será ignorado). (Letras)
2. Fluxo de Sucesso (Apenas Maker Mobile. Será executado caso contenha conexão com a internet).
3. Lista de Parâmetros para o Fluxo de Sucesso (Apenas Maker Mobile). (Variante)
4. Fluxo de Erro (Apenas Maker Mobile. Será executado caso não contenha conexão com a internet).
5. Lista de Parâmetros para o Fluxo de Erro (Apenas Maker Mobile). (Variante)

Retorno:
Webrun: "True" caso contenha conexão com a internet e "false" caso contrário. (Lógico)
Caso o parâmetro "URL" a ser testada não for definida, será usado o endereço: "http://www.google.com.br/" como alvo. 

Observação:
Esta função não verifica conexão com internet em rede que contenha proxy.

Exemplo:
Parâmetro 1: "http://www.softwell.com.br/".

### Código Servidor (Java)

```java
protected final Variant ebfCheckInternetConnection(Variant urlName) throws Exception {
  boolean conect = false;
  if (urlName.isNull()) {
    urlName = VariantPool.get("http://www.google.com/");
  }
  java.net.HttpURLConnection urlConnection = null;
  try {
    java.net.URL url = new java.net.URL(urlName.toString());
    urlConnection = (java.net.HttpURLConnection) url.openConnection();
    if (urlConnection.getResponseCode() == java.net.HttpURLConnection.HTTP_OK) {
      conect = true;
    }
  } catch (Exception e) {
  } finally {
    if (urlConnection != null) {
      urlConnection.disconnect();
    }
    return VariantPool.get(conect);
  }  
}                                       

protected final Variant ebfCheckInternetConnection(Variant urlName, Variant success, Variant successParams, Variant fail, Variant failParams) throws Exception {
  return ebfCheckInternetConnection(urlName);
}
```

---

## WFRE - Atualizar lista de sistemas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUpdateWFRE` |
| **Código** | 1016 |
| **Assinatura** | `WFRE - Atualizar lista de sistemas ()` |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função atualiza a lista de WFRE presente em Data Connections.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
Esta função atualiza a lista de WFRE presente em Data Connections sem precisar reiniciar o serviço do Webrun.

### Código Servidor (Java)

```java
protected final void ebfUpdateWFRE() throws Exception {
    getSystem().getFile().processConnections();
}
```

---

## X509 - Obter Informações do Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfX509GetSessionCertificate` |
| **Código** | 1077 |
| **Assinatura** | `X509 - Obter Informações do Certificado Digital (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna o certificado de sessão associado a um usuário autenticado via certificado digital.

Parâmetro:
1. Identificador do Usuário (Letras): Identificador do usuário obtido durante o processo de autenticação com o certificado digital (Observação 1).

Retorno:
Texto JSON contento as informações do certificado digital para autenticação, ou texto JSON vazio caso nenhuma informação seja encontrada (Letras).

Observação:
1. O parâmetro userId deve ser um identificador válido retornado no processo de autenticação via certificado digital, que fica disponível na URL de retorno após a autenticação.

### Código Servidor (Java)

```java
protected final Variant ebfX509GetSessionCertificate(Variant userId) throws Exception {
  String data = "{}";
  if (!userId.getString().isEmpty()) {
    wfr.web.certificate.WebrunCertificate webrunCertificate = wfr.web.certificate.WebrunCertificate.getInstance();
    String key = userId.getString();
    if (webrunCertificate.containsKey(key)) {
      data = webrunCertificate.getMapCertificates().get(key);
      webrunCertificate.remove(key);
    }
  }

  return new Variant(data);
}
```

---

## ZLIB Comprimir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfZLIBDeflate` |
| **Código** | 105 |
| **Assinatura** | `ZLIB Comprimir(Variante) : Variante;` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Comprime um conjunto de dados (Texto, Imagem, etc.) utilizando o algoritmo ZLIB definido pela RFC 1950 ZLIB Compressed
Data Format Specification version 3.3 (www.ietf.org/rfc/rfc1950.txt). (Zlib é uma biblioteca genérica de compactação e
descompactação.)

Parâmetro:
1. Array de Bytes. (Variante)

Retorno: 
Array de Bytes comprimido. (Variante)

Exemplo: 
1° Parâmetro: Campo BLOB.

Observações: 
1. BLOB (Binary Large Object) é normalmente usado para imagens.
2. Essa função é usada para abrir comprimir Array de Bytes.

### Código Servidor (Java)

```java
public static final Variant ebfZLIBDeflate(Variant value) throws Exception  {
    // Compress the bytes
    java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
    java.util.zip.DeflaterOutputStream compresser = new java.util.zip.DeflaterOutputStream(output);    
    compresser.write((byte[]) value.getObject());
    compresser.finish();
    compresser.close();
    return VariantPool.get(output.toByteArray());
   }
```

---

## ZLIB Descomprimir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfZLIBInflate` |
| **Código** | 106 |
| **Assinatura** | `ZLIB Descomprimir(Variante):Variante;` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Descomprime um conjunto de dados (Texto, Imagem, etc.) utilizando o algoritmo ZLIB definido pela RFC 1950 ZLIB
Compressed Data Format Specification version 3.3 (www.ietf.org/rfc/rfc1950.txt). (Zlib é uma biblioteca genérica de
compactação e descompactação.)

Parâmetro:
1. Array de Bytes comprimido. (Variante)

Retorno: 
Retorna o Array de Bytes Descomprimido. (Variante)

Observações: 
1. Essa função é usada para Descomprimir Arrray de Bytes.
2. BLOB (Binary Large Object) é normalmente usado para imagens.

Exemplo:
1° Parâmetro: Campo BLOB Comprimido.

### Código Servidor (Java)

```java
public static final Variant ebfZLIBInflate(Variant value) throws Exception  {
    // Decompress the bytes
    java.io.ByteArrayInputStream input = new java.io.ByteArrayInputStream((byte[]) value.getObject());    
    java.util.zip.InflaterInputStream decompresser = new java.util.zip.InflaterInputStream(input);    
    byte[] buffer = new byte[1024*4];//4KB
    java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
    int len;
    while((len = decompresser.read(buffer)) != -1) {
      out.write(buffer, 0, len);
    }
    decompresser.close();
    out.close();
    input.close();
    return VariantPool.get(out.toByteArray());
   }
```

---

## [DEPRECIADO] ChatAPI WhatsApp - Enviar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiSendFile` |
| **Código** | 1165 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp - Enviar Arquivo (Variante;Variante;Variante;Variante;Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante;Variante;Variante;Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL

Essa função envia um arquivo para um número de WhatsApp informado.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)
3. Número de WhatsApp. (Variante) (Ver Observação 1)
4. Mensagem que aparece como descrição do arquivo enviado. (Variante)
5. Nome do Arquivo. (Variante) (Ver Observação 2) 
6. URL do Arquivo. (Variante)

Retorno:
Texto JSON. (Letras)

Observações:
1. O número para o qual a mensagem será enviada deve conter o código do país e o DDD.
    Ex: 5571999999999, onde 55 é o código do Brasil e 71 é o DDD.
2. O nome do arquivo deve conter também a extensão do arquivo que será enviado.
    Ex.: Se o arquivo for um PDF, esse parâmetro deve ser enviado da seguinte forma - <nome qualquer>.pdf
    O mesmo serve para qualquer tipo de arquivo aceitável pelo WhatsApp (.pdf, .mp4, .png, .jpg, etc).
3.  O link do 6° parâmetro deverá ser público. 
4. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiSendFile(Variant url, Variant token, Variant phone, Variant message, Variant fileName, Variant fileUri) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] ChatAPI WhatsApp - Enviar Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiSendMessage` |
| **Código** | 1163 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp - Enviar Mensagem (Variante;Variante;Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante;Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL.

Essa função envia uma mensagem de texto para um número de WhatsApp.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)
3. Número de WhatsApp. (Variante) (Ver Observação 1)
4. Mensagem. (Variante)

Retorno:
Texto JSON. (Letras)

Observações:
1. O número para o qual a mensagem será enviada deve conter o código do país e o DDD.
    Ex: 5571999999999, onde 55 é o código do Brasil e 71 é o DDD.
2. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiSendMessage(Variant url, Variant token, Variant phone, Variant message) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] ChatAPI WhatsApp - Enviar Áudio

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiSendAudio` |
| **Código** | 1164 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp - Enviar Áudio (Variante;Variante;Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante;Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL.

Essa função envia um áudio para um número de WhatsApp.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)
3. Número de WhatsApp. (Variante) (Ver Observação 1)
4. URL do Áudio. (Variante) (Ver Observação 2) 

Retorno:\nTexto JSON. (Letras)

Observações:\n1. O número para o qual a mensagem será enviada deve conter o código do país e o DDD.
    Ex: 5571999999999, onde 55 é o código do Brasil e 71 é o DDD.
2. A URL dele conter um arquivo com extensão .opus e deve conter menos de 1MB (Limitação do ChatAPI).
3. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiSendAudio(Variant url, Variant token, Variant phone, Variant audio) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] ChatAPI WhatsApp - Limpar Fila

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiCleanQueueMessages` |
| **Código** | 1162 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp - Limpar Fila (Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL.

Essa função limpa a fila de mensagens ainda não enviadas.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)

Retorno:
Texto JSON. (Letras)

Observações:
1. Essa função pode ser utilizada quando se quer limpar a fila de mensagens não enviadas.
2. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiCleanQueueMessages(Variant url, Variant token) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] ChatAPI WhatsApp - Obter Fila

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiGetQueueMessages` |
| **Código** | 1161 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp - Obter Fila (Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL.

Essa função obtém a fila de mensagens ainda não enviadas.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)

Retorno:
Texto JSON. (Letras)

Observações:
1. Essa função pode ser utilizada quando se quer todas as mensagens que estejam na fila de espera para serem enviadas.
2. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiGetQueueMessages(Variant url, Variant token) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] ChatAPI WhatsApp - Obter Lista de GP.

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiGetGroupsDialogs` |
| **Código** | 1166 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp - Obter Lista de GP. (Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL.

Essa função obtém a lista de grupos com as informações necessária para interação com o mesmo.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)

Retorno:
Texto JSON. (Letras)

Observações:
1. Essa função pode ser utilizada quando se quer obter os grupos de WhatsApp para interagir com o mesmo.
2. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiGetGroupsDialogs(Variant url, Variant token) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] ChatAPI WhatsApp-Definir URL Webhook

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChatApiSetWebhook` |
| **Código** | 1167 |
| **Assinatura** | `[DEPRECIADO] ChatAPI WhatsApp-Definir URL Webhook (Variante;Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: O ChatAPI ENCERROU SUAS ATIVIDADES E POR ISSO A INTEGRAÇÃO COM O SERVIÇO NÃO ESTÁ MAIS DISPONÍVEL.

Essa função define uma URL como Webhook para receber todas as chamadas de retorno da API.

Parâmetro(s):
1. URL do Chat (Fornecido no console do ChatAPI). (Variante)
2. Token (Fornecido no console do ChatAPI). (Variante)
3. URL Webhook. (Variante) (Ver Observação 1) 

Retorno:
Texto JSON. (Letras)

Observações:
1. Caso a URL Webhook seja um fluxo do projeto, o mesmo deverá ser definido como fluxo WEB e deve ser permitido o acesso externo no mesmo. Abaixo um exemplo de como ficaria essa URL se a mesma for representar um fluxo do projeto.
  EX: <URL do contexto>/<nome do fluxo>.rule?sys=<sigla do sistema>
2. Para obter o conteúdo recebido no fluxo Web definido, utilize a função "REST - Obter contéudo do corpo".
3. Para mais informações sobre o ChatAPI acesse: https://chat-api.com/pt-br/

### Código Servidor (Java)

```java
protected final Variant ebfChatApiSetWebhook(Variant url, Variant token, Variant urlWebhook) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] Obter Diretório de Skins

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSkinFolder` |
| **Código** | 638 |
| **Assinatura** | `[DEPRECIADO] Obter Diretório de Skins (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna o diretório de Skins que está sendo utilizado pelo sistema.

Parâmetro:
Não possui.

Retorno:
Diretório da Skin. (Letras)

Observação:
O diretório retornado é o caminho relativo a aplicação.

### Código Cliente (JavaScript)

```javascript
function ebfGetSkinFolder() {
  return $mainform().skin;
}
```

---

## É Dispositivo Móvel?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDetectMobile` |
| **Código** | 716 |
| **Assinatura** | `É Dispositivo Móvel? (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 8 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função detecta se é um dispositivo móvel e retorna o tamanho e altura da tela.

Parâmetro:
Não possui.

Retorno:
Uma lista contendo três elementos:
1. Valor lógico informando se é ou não mobile;
2. Largura da tela;
3. Altura da tela.

### Código Cliente (JavaScript)

```javascript
function ebfDetectMobile(){
  var isMobile = new Array();
  if (navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/Windows Phone/i)){ 
    isMobile[0] = true;
    isMobile[1] = window.innerWidth;
    isMobile[2] = window.innerHeight;
    return isMobile;
  }else{
    isMobile[0] = false;
    isMobile[1] = window.innerWidth;
    isMobile[2] = window.innerHeight;
    return isMobile;
  }
}
```

---

## É publicado?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsReloadable` |
| **Código** | 656 |
| **Assinatura** | `É publicado? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 8 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função verifica se o sistema está publicado ou se está executando em modo interpretado.

Parâmetro:
Não possui.

Retorno:
"Verdadeiro" caso o sistema esteja publicado. Caso contrário, retorna "Falso". (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfIsReloadable() throws Exception {
  return new Variant(!(getSystem().isReloadable()));
}
```

---

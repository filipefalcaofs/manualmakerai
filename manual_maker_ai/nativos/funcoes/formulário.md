# Funções Nativas - Formulário

Total: **102** funções

[← Voltar para Funções Nativas](README.md)

---

## Abrir Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenForm` |
| **Código** | 942 |
| **Assinatura** | `Abrir Formulário (Formulário): Variante` |
| **Parâmetros** | Formulário |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Abre o formulário passado por parâmetro.

Parâmetro:
1. Formulário a ser aberto (GUID). 

Retorno:
Não possui.

Observações:
1. Para abrir um formulário flutuante com ícone basta passar uma lista como parâmetro que contenha duas sublistas onde:
   1.1. O primeiro parâmetro da primeira lista deve ser "formGuid" e o segundo o GUID do formulário a ser aberto.
   1.2. O primeiro parâmetro da segunda lista deve ser "icon" e o segundo parâmetro a classe do ícone do formulário (ex:"fas fa-home").
2. Para definir cor ao ícone do formulário flutuante basta adicionar uma terceira sublista na lista do parâmetro onde:
   2.1O primeiro parâmetro deve ser "iconColor" e o segundo parâmetro a cor do ícone, onde este pode ser um HEX da cor (ex: #000000) ou qualquer outro tipo de valor possível para cores do CSS.
3. Os ícones só são aplicados a formulários do tipo flutuante, ou seja, formulários cuja propriedade "Abrir em Modo Pop-up" seja falsa.

Exemplo:
Assumindo como parâmetro a constante formulário "Form" ou a GUID do mesmo, a função irá abrir em outra 
janela o formulário "Form".

### Código Servidor (Java)

```java
protected final Variant ebfFormOpenForm(Variant formularioGuid) throws Exception {
  return callClientFunction("ebfFormOpenForm", formularioGuid);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormOpenForm(formGuid) {
  if (formGuid && Array.isArray(formGuid)) {
    var props = { };
    try {
      for (var i = 0; i < formGuid.length; i++) {
        if (Array.isArray(formGuid[i]) && formGuid[i].length > 1) {
          props[formGuid[i][0]] = formGuid[i][1];
        }
      }
    } catch (e) { }

    eval(getContent("wfrcore?action=ruleopenform&sys=" + sysCode + "&guid=" + URLEncode(props.formGuid) + "&props=" + URLEncode(JSON.stringify(props))));
  } else {
    eval(getContent("wfrcore?action=ruleopenform&sys=" + sysCode + "&guid=" + URLEncode(formGuid)));
  }
}
```

---

## Abrir Formulário Filtrado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenFilteredForm` |
| **Código** | 27 |
| **Assinatura** | `Abrir Formulário Filtrado (Formulário;Letras)` |
| **Parâmetros** | Formulário;Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função abre o formulário passado no 1º parâmetro e filtra automaticamente pelo filtro passado no 2º 
parâmetro.

Parâmetro(s): 
1. Formulário que será aberto (GUID). 
2. Texto indicando o filtro. (Letras)

Retorno: 
Não possui.

Observações: 
1. O campo passado no filtro tem que ser igual ao campo da tabela associada ao formulário que vai ser 
aberto.
2. No filtro não podem haver espaços.
3. Caso o banco utilizado seja SQL Server e o tipo de dado do filtro seja varchar, deverá ser utilizado 
aspas simples no filtro.
4. Caso o filtro seja uma chave estrangeira que relaciona a outra entidade, deverá ser utilizado o filtro 
tabela.campo=valor (Junção de tabelas).
5. Somente poderá ser usado o comparador lógico de igualdade ("=").

Exemplo:
Assumindo como 1º parâmetro "CIDADE" (Formulário) e como 2º parâmetro "ESTADO=BAHIA", o resultado 
seria a abertura do formulário "CIDADE" somente com as cidades que pertencem ao Estado Bahia.

### Código Servidor (Java)

```java
protected final Variant ebfFormOpenFilteredForm(Variant formularioGuid, Variant filter) throws Exception {
    client.openFilteredForm(manager.getSys().getFormByGuid(formularioGuid.getString()), filter.toString());
    return Variant.VARIANT_NULL;
  }
```

---

## Abrir Formulário Filtrado na Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFrameOpenFilteredForm` |
| **Código** | 344 |
| **Assinatura** | `Abrir Formulário Filtrado na Moldura (Formulário;Componente;Formulário;Lógico;Letras;Lógico)` |
| **Parâmetros** | Formulário;Componente;Formulário;Lógico;Letras;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Função que abre um formulário numa moldura filtrado.

Parâmetro(s):
1. Formulário onde se encontra o componente do tipo moldura. 
2. Componente do tipo moldura. (Componente)
3. Formulário que será aberto na moldura (GUID). 
4. Mostrar barra de rolagem? (Lógico)
5. Texto indicando o filtro. (Letras)
6. Mostrar borda? (Lógico)

Observações:
1. Esta função não deve ser utilizada para abrir numa moldura o mesmo formulário que a contém.
2. Pode-se tipar o valor passando o formato <Valor>@<Tipo>, onde tipo pode ser: long, double, timestamp, 
date e boolean, como por exemplo, "TAB_PESSOAS.CODIGO=100@long".
3. As modificações feitas no formulário que será aberto na moldura, apenas serão visualizadas quando o 
sistema é reiniciado.

Exemplo:
Assumindo como 1º parâmetro "FORMULÁRIO" (Formulário), como 2º parâmetro "MOLDURA", 3º parâmetro 
"CIDADE" (Formulário), 4º parâmetro "True" e 5º parâmetro "ESTADO=BAHIA", o resultado seria a abertura do 
formulário "CIDADE" na moldura "MOLDURA", com barra de rolagem e somente com as cidades que 
pertencem ao Estado Bahia.

### Código Servidor (Java)

```java
protected final Variant ebfFrameOpenFilteredForm(Variant form, Variant componentName, Variant formTarget, Variant scrollbars, Variant filter) throws Exception {
  return callClientFunction("ebfFrameOpenFilteredForm", form, componentName, formTarget, scrollbars, filter, Variant.VARIANT_FALSE);
}

protected final Variant ebfFrameOpenFilteredForm(Variant form, Variant componentName, Variant formTarget, Variant scrollbars, Variant filter, Variant border) throws Exception {
  return callClientFunction("ebfFrameOpenFilteredForm", form, componentName, formTarget, scrollbars, filter, border);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFrameOpenFilteredForm(form, componentName, formTarget, scrollbars, filter, border) {
  var component = controller.getElementById(componentName, form);
  if (component && component instanceof HTMLGroupBox) {
    return component.openFilteredFormInFrame(formTarget, filter, scrollbars, border);
  }

  return null;
}
```

---

## Abrir Formulário Filtro e Modo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenFilterAndMode` |
| **Código** | 149 |
| **Assinatura** | `Abrir Formulário Filtro e Modo (Formulário;Letras;Inteiro)` |
| **Parâmetros** | Formulário;Letras;Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

A função abre o formulário no modo passado no 3º parâmetro e filtra automaticamente de acordo com o filtro 
passado no 2º parâmetro.

Parâmetro(s):
1. Formulário que será aberto. (Formulário)
2. Texto indicando o filtro a ser feito. (Letras)
3. Modo de Abertura do formulário.  (Inteiro)

Retorno:
Não possui.

Observações:
1. Caso o banco utilizado seja SQL Server e o tipo de dado do filtro seja varchar, deve ser utilizado aspas 
simples no filtro.
2. Caso o filtro seja uma chave estrangeira que relaciona a outra entidade, deverá ser utilizado o filtro 
tabela.campo=valor (Junção de tabelas).
3.  Modos de Abertura: 1 - Inclusão, 2 - Edição . (Para Mobile: [1] - Inclusão, [2] - Edição, [-1] - Navegação, [3] 
- Exclusão).

Exemplo:
Assumindo como 1º parâmetro "CIDADE" (Formulário), 2º parâmetro "ESTADO = BAHIA" (Filtro) e 3º 
parâmetro "2" (Modo Edição) o resultado será a abertura do formulário em modo de edição, somente com as 
cidades que pertencem ao Estado Bahia.

### Código Servidor (Java)

```java
protected final Variant ebfFormOpenFilterAndMode(Variant formularioGuid, Variant filter, Variant mode) throws Exception {
    client.openFilteredForm(manager.getSys().getFormByGuid(formularioGuid.getString()), filter.toString(), mode.getLong().intValue());
    return Variant.VARIANT_NULL;
  }
```

---

## Abrir Formulário da Grade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenFormGrid` |
| **Código** | 946 |
| **Assinatura** | `Abrir Formulário da Grade (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Abre o formulário associado ao componente grade passado por parâmetro.

Parâmetro:
1. Componente Grade. (Componente)

Retorno:
Não possui.

Observações:
1. Para aparecer a lista de componente do formulário é necessário selecionar o formulário de trabalho no "Início" 
do fluxo.
2. Caso não queira selecionar o formulário no início, pode-se escrever o nome (Letras) do componente (nome da 
grade) como parâmetro.
3. O evento deve estar no mesmo formulário onde está o componente grade.
4. O Componente Grade deve estar com a propriedade Apenas Leitura definido como "Não".

### Código Servidor (Java)

```java
protected final Variant ebfOpenFormGrid(Variant grid) throws Exception {
  return callClientFunction("ebfOpenFormGrid", grid);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfOpenFormGrid(gridName) {
  if (gridName) {
    var grid = $c(gridName);
    if (grid.currentRow == -1 && grid.getRowCount() > 0) {
      grid.selectRow(0, true);
    }

    grid.timeout(grid.openNormalForm, 0);
  }
}
```

---

## Abrir Formulário de Alteração de Senha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenFormPassword` |
| **Código** | 929 |
| **Assinatura** | `Abrir Formulário de Alteração de Senha ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre o formulário de alteração de senha do usuário ativo do Webrun.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfFormOpenFormPassword() throws Exception {
  WFRSystem sys = client.getSystem();
  WFRForm changePasswordForm = Functions.getFormChangePassword(sys, connection);
  if (changePasswordForm != null) {
    client.openForm(changePasswordForm);     
  } else {  
    callClientFunction("openWFRPassword", new Variant(sys.getCode()));
  }
}
```

---

## Abrir Formulário de Cadastro de Grupos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenFormGroup` |
| **Código** | 927 |
| **Assinatura** | `Abrir Formulário de Cadastro de Grupos ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre o formulário de cadastro de grupos de usuários do Webrun.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
As alterações nos grupos só terão efeito após a recarga geral do sistema.

### Código Servidor (Java)

```java
protected final void ebfFormOpenFormGroup() throws Exception {
  client.openForm(Functions.getFormGroup(client.getSystem(), connection));
}
```

---

## Abrir Formulário de Cadastro de Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenFormUser` |
| **Código** | 928 |
| **Assinatura** | `Abrir Formulário de Cadastro de Usuário ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre o formulário de cadastro de usuários do Webrun.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfFormOpenFormUser() throws Exception {
  client.openForm(Functions.getFormUsers(client.getSystem(), connection));
}
```

---

## Abrir Formulário numa Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFrameOpenForm` |
| **Código** | 274 |
| **Assinatura** | `Abrir Formulário numa Moldura (Formulário;Componente;Formulário;Lógico;Lógico)` |
| **Parâmetros** | Formulário;Componente;Formulário;Lógico;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Função que abre um formulário numa moldura.

Parâmetro(s):
1. Formulário que contém o componente moldura. (Formulário)
2. Componente moldura. (Componente)
3. Formulário que será aberto na moldura. (Formulário)
4. Mostrar barra de rolagem? (Lógico)
5. Mostrar borda? (Lógico)

Observações:
1. Esta função não deve ser utilizada para abrir numa moldura o mesmo formulário que a contém.
2. As modificações feitas no formulário que está em uma moldura, apenas serão visualizadas quando o sistema 
for reiniciado, ou quando o formulário for atualizado manualmente.

Exemplo:
Assumindo como 1º parâmetro o formulário "Form", 2º parâmetro a moldura(presente em "Form") "Moldura", 3º 
parâmetro o formulário "Form Moldura" e como 4º parâmetro "True", será aberto na moldura "Moldura" o 
formulário "Form Moldura" com barra de rolagem.

### Código Servidor (Java)

```java
protected final Variant ebfFrameOpenForm(Variant form, Variant componentName, Variant formTarget, Variant scrollbars) throws Exception {
    return callClientFunction("ebfFrameOpenForm", form, componentName, formTarget, scrollbars, Variant.VARIANT_FALSE);
  }  
protected final Variant ebfFrameOpenForm(Variant form, Variant componentName, Variant formTarget, Variant scrollbars, Variant border) throws Exception {
    return callClientFunction("ebfFrameOpenForm", form, componentName, formTarget, scrollbars, border);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFrameOpenForm(form, componentName, formTarget, scrollbars, border){
  ebfFrameOpenFilteredForm(form, componentName, formTarget, scrollbars, null, border);
}
```

---

## Abrir URL numa Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFrameOpenURL` |
| **Código** | 952 |
| **Assinatura** | `Abrir URL numa Moldura (Formulário;Componente;Letras;Lógico;Lógico)` |
| **Parâmetros** | Formulário;Componente;Letras;Lógico;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Abre uma URL numa moldura.

Parâmetro(s):
1. Formulário da moldura. 
2. Nome do componente moldura. 
3. URL. (Letras)
4. Mostrar barra de rolagem? (Lógico)
5. Mostrar borda? (Lógico)

Retorno:
Não possui.

Observações: 
1. Para colocar um caracter & que esteja entre os dados do valor de um parâmetro de uma URL utilize a 
combinação: %26 + &
2. A URL deve possuir o protocolo "http://" antes do endereço www, caso contrário, será tratato como uma URL 
relativa.

### Código Servidor (Java)

```java
protected final Variant ebfFrameOpenURL(Variant formName, Variant componentName, Variant url, Variant scrollbar) throws Exception {
  return callClientFunction("ebfFrameOpenURL", formName, componentName, url, scrollbar, Variant.VARIANT_FALSE);
}

protected final Variant ebfFrameOpenURL(Variant formName, Variant componentName, Variant url, Variant scrollbar, Variant border) throws Exception {
  return callClientFunction("ebfFrameOpenURL", formName, componentName, url, scrollbar, border);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFrameOpenURL(form, componentName, url, scrollbars, border) {
  var component = controller.getElementById(componentName, form);
  if (component && component instanceof HTMLGroupBox) {
    return component.openUrlInFrame(url, scrollbars, border);
  }

  return null;
}
```

---

## Alterar Campo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLSetFormField` |
| **Código** | 509 |
| **Assinatura** | `Alterar Campo (Campo;Variante)` |
| **Parâmetros** | Campo;Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera o campo do formulário com o conteúdo passado no 2° parâmetro.

Parâmetro(s):
1. Campo para ser alterado. (Campo)
2. Novo valor do campo. (Variante)

Retorno:
Não possui.

Observações:
1. Para selecionar o campo é necessário indicar o nome do formulário no "Início" do fluxo . 
2. Caso não queira indicar o formulário no início, pode escrever o nome (Letras) do campo como parâmetro.
3. O campo precisa estar associado a um campo da Tabela. Caso o isso não ocorra, usa-se a função "Alterar 
valor do componente" da categoria "Formulário".
4. A função não determina qual o formulário onde deve ser alterado, no entanto caso queira alterar um valor da 
grade será necessário usar a função "Alterar valor do componente".
5. Ao utilizar a função na camada servidor, caso o componente a ser alterado esteja vinculado a campo, a função só funcionará com o formulário em modo de inserção ou alteração.

Exemplo: 
Assumindo como parâmetros o campo "Telefone" (Letras) de uma tabela qualquer e o valor "3354-9554" (Letras), 
após o fluxo ser executado o campo "Telefone" conterá o conteúdo "3354-9554".

### Código Servidor (Java)

```java
protected final Variant ebfSQLSetFormField(Variant variantField, Variant variantValue) throws Exception {
    if (fields != null) {
//      if (!fields.isInInsertMode() && !fields.isInEditMode()) {
//        throw new WFRRuleException("Só é permitido alterar valor(es) no modo de inserção ou edição.", this.ruleName);
//      }
      if (variantValue == null)
        fields.changeValue(variantField.toString(), null);
      else
        fields.changeValue(variantField.toString(), variantValue.toObject());
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSQLSetFormField() {
  if (existArgs(arguments)) {
    changeFormFieldValue(arguments[0], arguments[1]);
  }
  return true;
}
```

---

## Alterar Tamanho do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeCurrentFormSize` |
| **Código** | 670 |
| **Assinatura** | `Alterar Tamanho do Formulário (Inteiro;Inteiro)` |
| **Parâmetros** | Inteiro;Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função altera o tamanho da janela do formulário onde o fluxo está sendo executado.

Parâmetro(s):
1. Largura. (Inteiro)
2. Altura. (Inteiro)

Retorno:
Não possui.

Observação:
O Internet Explorer não permite que formulários (pop-up) modais sejam redimensionados.

### Código Cliente (JavaScript)

```javascript
function ebfChangeCurrentFormSize(newWidth, newHeight) {
 if (isPopup) {
   top.resizeTo(newWidth, newHeight);    
 } else {  
   var floatingFormDiv = getFloatingFormDivById($mainform().idForm);
   floatingFormDiv.style.height = (parseInt(newHeight) + 30) + "px";
   floatingFormDiv.style.width = parseInt(newWidth) + "px";    
   var floatingFormIframe = floatingFormDiv.getElementsByTagName("iframe")[0];    
   floatingFormIframe.style.height = newHeight + "px";    
   floatingFormIframe.style.width = newWidth + "px";
   getFloatingFormDivById($mainform().idForm).getElementsByTagName("iframe")[0]  
 }
}
```

---

## Alterar Título do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeFormTitle` |
| **Código** | 747 |
| **Assinatura** | `Alterar Título do Formulário (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função altera o título do formulário corrente.

Parâmetro:
1. Novo título que o formulário receberá. (Letras)

Retorno: 
Não possui.

Observação:
Essa função não tem suporte para formulário aberto no componente Aba e/ou Moldura.

### Código Servidor (Java)

```java
protected final void ebfChangeFormTitle(Variant newTitle) throws Exception {
  callClientFunction("ebfChangeFormTitle", newTitle);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfChangeFormTitle(newTitle){
  try {
    if(isPopup){    
      top.document.title = newTitle;
    } else{
      var div = "WFRIframeForm" + ebfGetFormID();
      // Obtenção do elemento pai.
      let parent = mainform.parent.parent.document.getElementById(div).children[0].children[0];
      // Verificação se o formulário possui definição de ícone.
      div = parent.childElementCount > 1 ? parent.children[1] : parent.children[0];
      div.innerText = newTitle;
    }    
  } catch (e) {
    console.error("Função: 'Alterar Título do Formulário' não é suportado no componente Aba ou Moldura.");    
    return;
  }
}
```

---

## Alterar Valor do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormChangeComponentValue` |
| **Código** | 42 |
| **Assinatura** | `Alterar Valor do Componente` |
| **Parâmetros** | Formulário;Componente;Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função altera o conteúdo do componente que está no formulário passado como parâmetro pelo conteúdo 
passado no 3º parâmetro.

Parâmetro(s):
1. Formulário onde está o componente. 
2. Componente que será alterado. 
3. Novo valor do componente. (Variante)

Retorno: 
Não possui.

Observações:
1. Esta função altera valores somente de componentes do formulário da qual ela foi chamada. Para alterar valor 
do componente em outro formulário, deve-se utilizar a função "Alterar Valor do Componente em Outro Formulário".
2. Ao utilizar a função na camada servidor, caso o componente a ser alterado esteja vinculado a campo, a função só funcionará com o formulário em modo de inserção ou alteração.

Exemplo:
Assumindo como parâmetros "Cadastro" (Constante do tipo Formulário), MakerEdit1 (Constante do tipo 
Componente) e "Salvador" (Letras), ao fluxo ser executado, o componente "MakerEdit1" passaria a ter o 
conteúdo "Salvador".

### Código Servidor (Java)

```java
protected final Variant ebfFormChangeComponentValue(Variant formGUID, Variant com, Variant value) throws Exception {
    if (formGUID.toString().trim().length() == 0) {
      throw new WFRRuleException("Defina um formulário para alterar o valor de um componente!");
    }
    if (fields != null && fields.getForm().getGuid().equals(formGUID.toString())) {
      WFRComponent c = fields.getForm().getComponentByName(com.toString());
      if (c == null)
        throw new WFRRuleException("Componente não encontrado para o formulário escolhido!");
      if (c.isDBAware()) {
        fields.changeValue(c.getField(), value.toObject());
        return Variant.VARIANT_NULL;
      }
    }
    callClientFunction("ebfFormChangeComponentValue", formGUID, com, value);
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormChangeComponentValue(form, com, value) {
  try{
    $c(com, form).setValue(value, true);
  }catch(e){
    if((e.toString()).indexOf('NS_ERROR_FAILURE')==-1){
      throw(e);
    }else{}
  }
}
```

---

## Alterar Valor do Componente e Mascarar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormChangeComponentValueAndMask` |
| **Código** | 442 |
| **Assinatura** | `Alterar Valor do Componente e Mascarar` |
| **Parâmetros** | Formulário;Componente;Variante |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função altera o conteúdo do componente que está no formulário passado como parâmetro pelo conteúdo passado no 3º parâmetro. Após o valor ser definido a máscara que está no componente é aplicada.

Parâmetro(s):
1. Formulário onde está o componente. 
2. Componente que será alterado. 
3. Novo valor do componente. (Variante)

Retorno: 
Valor com a máscara aplicada. O retorno só se aplica para a camada cliente. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfFormChangeComponentValueAndMask(Variant formGUID, Variant com, Variant value) throws Exception {
    return callClientFunction("ebfFormChangeComponentValueAndMask", formGUID, com, value);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormChangeComponentValueAndMask(form, com, value) {
  if (isNullable(value, true)) {
    return null;
  }
  
  try {
    var component = $c(com, form);    

    if(component.mask && component.mask.type === "number"){
      var mask = component.numberMask == "$" ? "0.00" : component.numberMask;
      var maskSize = mask.split(".")[1] ? mask.split(".")[1].length : 0;
      var THOUSAND_POINT = DECIMAL_POINT == "," ? "." : ",";
      if(parseFloat(value).formatMoney){
        component.setValue(parseFloat(value).formatMoney(maskSize, DECIMAL_POINT, THOUSAND_POINT), true);   
      }else{
        component.setValue(value, true);
        if (component.mask && component.getValue().length > 0) {
          component.mask.allowPartial = true;
          component.setValue(component.mask.format(component.getValue(), component));
          component.mask.allowPartial = false;
        }  
      }
    }else{
      component.setValue(value, true);
    
      if (component.mask && component.getValue().length > 0) {
        component.mask.allowPartial = true;
        component.setValue(component.mask.format(component.getValue(), component));
        component.mask.allowPartial = false;
      }    
    }
    
    return component.getValue();
  } catch(e) {
    if (e.toString().indexOf('NS_ERROR_FAILURE') == -1) {
      throw(e);
    }
  }  

  return null;
}
```

---

## Alterar Valor do Componente em Outro Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeComponentValueOtherForm` |
| **Código** | 977 |
| **Assinatura** | `Alterar Valor do Componente em Outro Formulário (Formulário;Componente;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Altera o valor de um componente que esteja em outro formulário que não o corrente.

Parâmetro(s):
1. Formulário ou GUID. 
2. Componente. 
3. Novo Valor. (Letras)

Retorno:
Não possui.

Observações: 
1. Esta função não altera o valor do componente Lista Dinâmica. Para isso, utilize a função: Alterar Valor da Lista 
Dinâmica.
2. É necessário que o outro formulário esteja aberto, para que a alteração venha a ser executada com sucesso.

Exemplo:
Assumindo como 1º parâmetro o formulário "FORMULARIO1", 2º parâmetro o componente "COMPONENTE" e 
como 3º parâmetro o valor "CONTEÚDO", o componente "COMPONENTE" receberá o valor "CONTEÚDO".

### Código Cliente (JavaScript)

```javascript
function ebfChangeComponentValueOtherForm (form, component, value) {
  if(webrunBroadcast) {
    const jsonProperties = {};
    jsonProperties.formGUID = form;
    jsonProperties.action = "wcc";
    jsonProperties.component = component;
    jsonProperties.value = value;
    jsonProperties.formTarget = decodeURI(mainform.formGUID);

    webrunBroadcast.postMessage(jsonProperties);
  }
}
```

---

## Alterar índice de profundidade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormZindex` |
| **Código** | 450 |
| **Assinatura** | `Alterar índice de profundidade (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Função utilizada para alterar o índice de profundidade de um componente.

Parâmetro(s):
1. Componente. 
2. Novo índice. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfFormZindex() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      component.div.style.zIndex = arguments[1];
    }
  }
}
```

---

## Alterou Dados?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormHasChanged` |
| **Código** | 6 |
| **Assinatura** | `Alterou Dados () : Lógico` |
| **Retorno** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

A função retorna um valor lógico (verdadeiro ou falso) informando se algum componente foi ou não alterado.

Parâmetro:
Não possui.

Retorno: 
Retorna "Verdadeiro" se algum componente foi alterado. Caso contrário, retorna "Falso". (Lógico)

Observações:
1. É recomendável utilizar no evento "Antes de Alterar".
2. A função só funciona se o componente estiver ligado a alguma tabela do banco de dados.
3. Caso a função não seja utilizada no evento "Antes de Alterar", as modificações para o componente Imagem não são reconhecidas.
4. O fluxo associado deverá estar na camada servidor e ser  chamado direto no evento "Antes de Alterar". Caso seja chamado através de subfluxo (cliente --> servidor), a função retornará "false".

### Código Servidor (Java)

```java
protected final Variant ebfFormHasChanged() throws Exception {
    return VariantPool.get(fields.changed());
  }
```

---

## Associar Evento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEventAssociate` |
| **Código** | 46 |
| **Assinatura** | `Associar Evento (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Fluxo |
| **Retorno** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

A função executa o fluxo (passado no 3º parâmetro) quando ocorrer o evento (2º parâmetro) no formulário 
ou componente (1º parâmetro).

Parâmetro(s):
1. Componente ou formulário. (Variante)
2. Nome do Evento. (Letras)
3. Fluxo a ser executado. (Fluxo)

Retorno: 
Não possui.

Observações:
1. Não é permitido o uso de fluxo que recebem parâmetros.
2. O fluxo de ação a que se refere o 3º parâmetro da função deve ser selecionado pela aba "Fluxos e 
Funções" da tela "Propriedades" aberta através da tela "Montador de Expressão" do "Editor de Fluxo de Ações".
3. Não é possível referenciar nesta função o componente "moldura". Para isto, utilize a função "Associar 
Evento ao Componente".

Exemplo:
Assumindo os parâmetros como "MakerEdit2" (Constante do tipo Componente ou Formulário), "Ao Clicar" 
(Letras) e "Mensagem de Alerta" (Fluxo a ser executado), quando esta função for executada  a "Mensagem de Alerta" 
vai ficar associada ao componente (1° parâmetro) no evento "Ao clicar". Assim, toda vez que der um clique no componente 
"MakerEdit2" a função "Mensagem de alerta" vai ser executada.

---

## Associar Evento ao Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAddEventForm` |
| **Código** | 452 |
| **Assinatura** | `Associar Evento ao Formulário(Letras;Fluxo;Variante)` |
| **Parâmetros** | Letras;Fluxo;Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Associa um evento ao formulário que chama o fluxo.

Parâmetro(s):
1. Evento. (Letras)
2. Fluxo que será executado quando o evento ocorrer. (Fluxo)
3. Lista de parâmetros do fluxo. (Variante)
 
Retorno: 
Não possui.

Observação: 
Alguns eventos que podem ser passados no 1º parâmetro onclick, onkeypress e onblur. Mais informações em http://www.w3schools.com/jsref/dom_obj_event.asp

### Código Cliente (JavaScript)

```javascript
function ebfAddEventForm(evento, fluxo, lista) {
  if(evento && fluxo){
    fluxo = reduceVariable(fluxo);
    var w = mainform;
    if(w.addEventListener){ // all browsers except IE before version 9
      w.addEventListener(evento, function() {
        return ebfFlowExecute(fluxo, lista);
        }, false);
    }else{
       if(w.attachEvent){ // IE before version 9
         w.attachEvent(evento, function() {
           return ebfFlowExecute(fluxo, lista);
            });
       }
    }
  }
}
```

---

## Ativar Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormOpenTab` |
| **Código** | 33 |
| **Assinatura** | `Ativar Aba (Letras) : Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função permite ativar e focar a aba descrita no primeiro parâmetro.

Parâmetro(s):
1. Nome da Aba a ser ativada. (Letras)

Retorno: 
A aba selecionada para regras cliente. Para regras servidor retorna Nulo. (Variante)

Exemplo:
Assumindo como parâmetro a aba "Endereço"(Letras), quando o fluxo for executado a aba "Endereço" será 
habilitada.

### Código Servidor (Java)

```java
protected final Variant ebfFormOpenTab(Variant tabName) throws Exception {
    return callClientFunction("ebfFormOpenTab", tabName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormOpenTab(tabName) {
  var t = $mainform().d.t;
  t.isCallFunction = true;
  t.timeout(t.openTab, 0, [tabName]);
  return t.tabsByName[tabName];
}
```

---

## Atualizar Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormRefreshComponent` |
| **Código** | 594 |
| **Assinatura** | `Atualizar Componente (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Atualiza o conteúdo do componente passado por parâmetro.

Parâmetro(s):
1. Componente que será atualizado. (Componente)

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente, é necessário indicar o nome do formulário de trabalho no "Início" do fluxo. 
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo
"componente" para uma constante do tipo "Letras".

### Código Servidor (Java)

```java
protected final Variant ebfFormRefreshComponent(Variant com) throws Exception {
    client.refreshComponent(com.getString());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormRefreshComponent(componentName) {
  if (!isNullable(componentName)) {
    var component = $c(componentName);
    component.timeout(component.refresh, 0);
  }
}
```

---

## Atualizar Componente em Outro Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRefreshComponentOtherForm` |
| **Código** | 978 |
| **Assinatura** | `Atualizar Componente em Outro Formulário (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza o componente em outro formulário.

Parâmetro(s):
1. Constante formulário ou GUID. (Formulário)
2. Componente. (Componente)

Retorno:
Não possui.

Observação:
Para o funcionamento correto desta função o formulário passado como parâmetro deve está aberto.

### Código Cliente (JavaScript)

```javascript
function ebfRefreshComponentOtherForm (form, component) {
  if(webrunBroadcast) {
    const jsonProperties = {};
    jsonProperties.formGUID = form;
    jsonProperties.action = "wrc";
    jsonProperties.component = component;
    jsonProperties.formTarget = decodeURI(mainform.formGUID);

    webrunBroadcast.postMessage(jsonProperties);
  }
}
```

---

## Atualizar Componente na Tela Chamadora

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `cmsOpenerWindowRefreshComponent` |
| **Código** | 324 |
| **Assinatura** | `Atualizar Componente na Tela Chamadora (Formulário;Componente;Lógico)` |
| **Parâmetros** | Formulário;Componente;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Atualiza um componente na tela chamadora.

Parâmetro(s):
1. Formulário do Componente a ser atualizado. (Formulário)
2. Componente a ser atualizado. (Componente)
3. Procurar Componente em qualquer tela chamadora? (Lógico)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant cmsOpenerWindowRefreshComponent(Variant form, Variant componentName, Variant allWindows) throws Exception {
  return callClientFunction("cmsOpenerWindowRefreshComponent", form, componentName, allWindows);
}
```

### Código Cliente (JavaScript)

```javascript
function cmsOpenerWindowRefreshComponent(form, componentName, allWindows) {
  var first = true;
  var current = top;
  while (((caller = getOpenerWindow(current)) != null) && (allWindows === true || first)) {
    first = false;

    if (!caller.mainform || isNullable(caller.mainform.sysCode)) {
      return;
    }
     
    var mainform = caller.$mainform();
    if (mainform) {
      var component = mainform.$c(componentName, form);
      if (component && component.refresh) {
        component.refresh();
        return;
      }
    }
     
    current = caller;
  }
}
```

---

## Atualizar Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavRefreshForm` |
| **Código** | 191 |
| **Assinatura** | `Atualizar Formulário ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Atualiza o formulário corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
1. O uso dessa função tem uma melhor performance quando usada em regras clientes.
2. Esta função atualiza todo o formulário.

### Código Servidor (Java)

```java
protected final Variant ebfNavRefreshForm() throws Exception {
    client.executeJavascript("$mainform().ebfNavRefreshForm();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavRefreshForm() {
  parent.location.reload();
}
```

---

## Atualizar Formulário na Moldura - Outro Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRefreshBevelOtherForm` |
| **Código** | 361 |
| **Assinatura** | `Atualizar Formulário na Moldura - Outro Formulário (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função atualiza o registro corrente de um formulário que está em uma moldura a partir de outro formulário.

Parâmetro(s):
1. Formulário onde a moldura se encontra.
2. Moldura onde se encontra o outro formulário. (Componente)

Retorno: 
Não possui.

Observação:
Esta função só irá funcionar caso exista algum parentesco entre os formulários.

### Código Servidor (Java)

```java
protected final Variant ebfRefreshBevelOtherForm(Variant form, Variant componentName) throws Exception {
  return callClientFunction("ebfRefreshBevelOtherForm", form, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function searchFormByGUIDRefreshBevelOtherForm(currentForm, GUID){
  if (currentForm && currentForm.formGUID == GUID){
    return currentForm;
  }
  if (currentForm && currentForm.$mainform() && currentForm.$mainform().formGUID == GUID) {
    return currentForm.$mainform();
  }
  if (currentForm.children) {
    for (var i=0; i < currentForm.children.length; i++) {
      try {
        if (currentForm.children[i].$mainform()) {
          if (currentForm.children[i].$mainform().formGUID == GUID){
            return currentForm.children[i].$mainform();
          }
          var childForm = currentForm.children[i];
          if (currentForm.children[i].$mainform().d.n.isModal) {
            childForm = childForm.$mainform();
          }
          var returnForm = searchFormByGUIDRefreshBevelOtherForm(childForm,GUID);
          if (returnForm){
            return returnForm;
          }
        }
      }catch(e){}
    }
  }
}

function searchFloatingFormRefreshOtherForm(formGUID) {
  var openFloatingForms;
  if (isPopup) {  
    var mainFormWindow = top.opener;
    while(mainFormWindow.opener) {    
      mainFormWindow = mainFormWindow.opener;
    }    
    openFloatingForms = mainFormWindow.mainSystemFrame.document.getElementsByClassName("WFRIframeForm");
  } else {
    openFloatingForms = mainSystemFrame.document.getElementsByClassName("WFRIframeForm");  
  }
  for (var i=0; i<openFloatingForms.length; i++) {
    var formReference = openFloatingForms[i].children[1].children[1].contentWindow.mainform;
    if (formReference.formGUID == formGUID) {
      return formReference;    
    }
  }
}

function ebfRefreshBevelOtherForm(form, componentName){
  var mainWindow = top;
  while (getOpenerWindow(mainWindow) != null) {
    var openerWindow = getOpenerWindow(mainWindow);
    if (openerWindow.mainform && !isNullable(openerWindow.mainform.sysCode)) {
      mainWindow = openerWindow;
    } else {
      break;
    }
  }
  
  var formFounded = searchFormByGUIDRefreshBevelOtherForm(mainWindow, form);    
  if (!formFounded) {
    formFounded = searchFloatingFormGet(form);  
  }
  if (formFounded){
    formFounded.mainform.ebfFrameRefreshForm(form, componentName);
  }
}
```

---

## Atualizar Formulário numa Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFrameRefreshForm` |
| **Código** | 356 |
| **Assinatura** | `ebfFrameRefreshForm (Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Atualiza um formulário aberto através da função "Abrir formulário numa moldura".

Parâmetro(s): 
1. Formulário que contém a moldura. 
2. Nome da Moldura. (Componente)

Retorno: 
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFrameRefreshForm(Variant form, Variant componentName) throws Exception {
  return callClientFunction("ebfFrameRefreshForm", form, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFrameRefreshForm(form, componentName) {
  var component = $c(componentName, form);
  if (component instanceof HTMLGroupBox) {
    var iframes = component.div.getElementsByTagName("iframe");
    if (iframes && iframes.length > 0) {
      var iframe = iframes[0];
      
      var iframeTag = eval(iframe.id);
      if (iframeTag.formOnUnLoadAction) {
        iframeTag.formOnUnLoadAction();
      }
      
      iframeTag.location = "about:blank";
      iframeTag.location = iframeTag.location.toString();
    }
  }  
}
```

---

## Atualizar Formulário sem Interação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRefreshFormModal` |
| **Código** | 421 |
| **Assinatura** | `Atualizar Formulário` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função atualiza o formulário (apenas o registro corrente) onde está o evento sem interação de confirmação com o usuário.

Parâmetro:
Não possui.

Retorno: 
Não possui.

Observações:
1. Se essa função for executada antes de salvar alterações feitas no formulário, estas serão perdidas, pois a 
essa função traz os dados existente no banco.
2. Indicada para atualizar formulário Modal.
3. Esta função deve ser utilizada em formulário com consulta.

### Código Servidor (Java)

```java
protected final Variant ebfRefreshFormModal() throws Exception {
    client.executeJavascript("$mainform().d.n.execAjaxEval('refresh')");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRefreshFormModal() {
  $mainform().d.n.execAjaxEval("refresh");
}
```

---

## Atualizar Registro Atual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRefreshRecord` |
| **Código** | 180 |
| **Assinatura** | `Atualizar Registro Atual` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função é utilizada para atualizar o registro que está sendo mostrado no formulário.

Parâmetro:
Não possui.

Retorno: 
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfRefreshRecord() throws Exception {
    client.executeJavascript("$mainform().d.n.execAjaxEval('refresh')");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRefreshRecord() {
  $mainform().d.n.execAjaxEval("refresh");
}
```

---

## Atualizar Registro Corrente do Formulário Pai

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRefreshCurrentRecortParentForm` |
| **Código** | 362 |
| **Assinatura** | `Atualizar registro corrente do formulário pai()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza o registro corrente do formulário pai.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfRefreshCurrentRecortParentForm() {
  if (parent && parent.frameElement && parent.frameElement.targetContext) {  
    parent.frameElement.targetContext.mainform.d.n.execAjaxEval("refresh");
  } else if (top.opener) {
    top.opener.mainform.d.n.execAjaxEval("refresh");
  } else if (parent.opener) {
    parent.opener.mainform.d.n.execAjaxEval("refresh");
  }
}
```

---

## Campo Apenas Leitura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetReadonly` |
| **Código** | 159 |
| **Assinatura** | `Campo Apenas Leitura (Componente;Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função define um campo/componente do formulário como Apenas Leitura. Caso o parâmetro seja 
Verdadeiro, define Apenas Leitura. Caso contrário retira esta definição.

Parâmetro(s):
1. O Componente que se deseja definir como Apenas Leitura. (Componente)
2. "True" para o componente se tornar Apenas Leitura. "False" para retirar tal propriedade. (Lógico)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetReadonly(Variant field, Variant readonly) throws Exception {
    return callClientFunction("ebfFormSetReadonly", field, readonly);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetReadonly(field, readonly) {
  var component = $c(field);
  if (component) {
    component.setReadOnly(readonly);
  }
}
```

---

## Componente Visível?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormGetVisible` |
| **Código** | 15 |
| **Assinatura** | `Componente Visível? (Componente): Lógico` |
| **Parâmetros** | Componente |
| **Retorno** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

A função retorna valor lógico "True" caso o componente passado pelo parâmetro esteja visível, ou "False" caso 
contrário.

Parâmetro:
1. Componente que deseja obter o valor (Se está visível ou não). (Componente)

Retorno: 
Retorna valor lógico "True" caso o componente passado esteja visível, ou "False" caso contrário. (Lógico)

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "Formulário" para uma constante do tipo "Letras".

### Código Cliente (JavaScript)

```javascript
function ebfFormGetVisible() {
  var value = false;
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
     value = component.getVisible();
    }    
  }  
  return value;  
}
```

---

## Conteúdo da Barra de Status

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChangeWindowStatusBar` |
| **Código** | 235 |
| **Assinatura** | `Conteúdo da Barra de Status (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera o conteúdo da barra de status.

Parâmetro:
1. Conteúdo para a barra de status

Retorno:
Não possui.

Observações:
1. Só funciona no evento "Ao Entrar".
2. No Browser Firefox é preciso marcar a opção "MODIFICAR TEXTO NA BARRA DE 
STATUS" no caminho abaixo:
  I.   FERRAMENTAS
  II.  OPÇÕES
  III. CONTEÚDO
  IV.  BOTÃO AVANÇADO
3. No Browser Internet Explorer verifique se está habilitado o recurso de atualizações da barra de status.
Caminho:
  I. FERRAMENTAS
  II. OPÇÕES
  III.  ABA SEGURANÇA
  IV.  NÍVEL PERSONALIZADO
  V.  "PERMITIR ATUALIZAÇÕES DA BARRA DE STATUS VIA SCRIPT"

### Código Servidor (Java)

```java
protected final Variant ebfChangeWindowStatusBar(Variant text) throws Exception {
    callClientFunction("ebfChangeWindowStatusBar", text);
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfChangeWindowStatusBar(text){
  // Caso o texto passado como parâmetro seja nulo, a barra de status não é modificada
  if (text == null){
    return;
  } else {
    $mainframe().sbtext = text;
  }
}
```

---

## Criar Imagem Estática

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormCreateImage` |
| **Código** | 24 |
| **Assinatura** | `Criar Imagem Estática (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Cria uma imagem estática em um componente moldura.

Parâmetro(s):
1. Nome da moldura usada no formulário para exibir a imagem. (Letras)
2. Endereço onde está armazenada a imagem na Internet. (Letras)

Retorno: 
Não possui.

Exemplo: 
Assumindo como 1º parâmetro a moldura "MOLDURA" e como 2º parâmetro a URL 
"http://www.softwell.com.br/downloads/Foto.jpg", a imagem estática será criada na moldura "MOLDURA".

### Código Cliente (JavaScript)

```javascript
function ebfFormCreateImage(nomeMoldura,url) {
  var moldura = controller.getElementById(nomeMoldura);  
  var div =  getDiv("imagem", 0, 0, moldura.getWidth(), moldura.getHeight(), 1000010, true);  
  var img = new Image(moldura.getWidth(),moldura.getHeight());
  div.appendChild(img);
  moldura.div.innerHTML= '';
  moldura.div.appendChild(div);
  img.src = url;
  if ($c(nomeMoldura).onclick) {   
    img.onclick = $c(nomeMoldura).onclick;
    img.style.cursor = "pointer";
    $c(nomeMoldura).div.onclick = null; 
  }
  return div;  
}
```

---

## Criar Vídeo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormCreateVideo` |
| **Código** | 23 |
| **Assinatura** | `Criar Vídeo (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função permite adicionar vídeos a formulários.

Parâmetro(s):
1. Nome da moldura usada no formulário para exibir o vídeo. (Letras)
2. Endereço na Internet onde está armazenado o vídeo. (Letras)

Retorno:
Não possui.

Exemplo: 
Assumindo como 1º parâmetro a moldura "MOLDURA" e como 2º parâmetro a URL 
"http://www.softwell.com.br/downloads/exemplo.mpg", a imagem estática será criada na moldura "MOLDURA".

### Código Cliente (JavaScript)

```javascript
function ebfFormCreateVideo(nomeMoldura, url) { 
  var moldura = $c(nomeMoldura);  
  var div = getDiv("Video", 0, 0, moldura.getWidth(), moldura.getHeight(), 1000010, true);
  var video = document.createElement("embed");  
  video.src = url;
  video.frameBorder = 0;
  video.style.left = 0;
  video.style.top = 0;
  video.style.width = moldura.getWidth() + "px";
  video.style.height = moldura.getHeight() + "px";
  video.setAttribute("autostart", "true");
  div.appendChild(video);
  div.style.position = "absolute";
  moldura.div.appendChild(div);     
  return div;
}
```

---

## Código do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFormID` |
| **Código** | 44 |
| **Assinatura** | `Código do Formulário()` |
| **Retorno** | Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função retorna o código do formulário chamado no fluxo.

Parâmetro:
Não possui.

Retorno: 
Retorna o código do formulário que chama o fluxo. (Inteiro)

Exemplo:
Assumindo que o formulário "Cadastro" chama o fluxo, o retorno seria o código deste formulário.

### Código Servidor (Java)

```java
protected final Variant ebfGetFormID() throws Exception {
  if (fields != null && fields.getForm() != null) { 
    return VariantPool.get(fields.getForm().getCode());    
  } else {  
    return Variant.VARIANT_NULL;
  }
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetFormID() {
  var formID = ($mainform().d.WFRForm ? $mainform().d.WFRForm.formID.value : null);  
  return formID;
}
```

---

## Código do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSystemID` |
| **Código** | 45 |
| **Assinatura** | `Código do Sistema (): Letras` |
| **Retorno** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função retorna o Código do sistema atual em que o fluxo está sendo executado.

Parâmetro:
Não possui.

Retorno:
Retorna o código do sistema utilizado. (Letras)

Exemplo:
Se o fluxo for executado no "Contas a Pagar", que tem como sigla "CAP", a função retornará 
"CAP".


Observação(ões):
1. Essa função não retorna a SIGLA com instância  caso exista mais de um sistema com a mesma sigla. Se for necessário obter a SIGLA com instância, utilize a função Sigla do Sistema.

### Código Servidor (Java)

```java
protected final Variant ebfGetSystemID() throws Exception {
    return VariantPool.get(getData().getSystem().getCode().substring(0, 3));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetSystemID() {
  var system = ($mainform().d.WFRForm ? $mainform().d.WFRForm.sys.value : $mainform().sysCode);
  return system.toString().substring(0, 3);
}
```

---

## Definir Obrigatoriedade de Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetRequired` |
| **Código** | 363 |
| **Assinatura** | `Definir Obrigatoriedade de Componente (Componente, Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função define se um ou mais componentes se tornarão obrigatórios ou não.

Parâmetro(s):
1. Componente ou lista de componentes. (Componente)
2. "True" para tornar obrigatório, "False" caso não. (Lógico)

Retorno: 
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetRequired(Variant components, Variant value) throws Exception {
    return callClientFunction("ebfFormSetRequired", components, value);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetRequired() {
  if (existArgs(arguments)) {
    var components = arguments[0];

    if (components.constructor.toString().indexOf('Array') == -1)
      components = [arguments[0]];
      
    for(var i=0;i<components.length;i++) {
      var component = $c(components[i]);
      if (component) {
        component.required = arguments[1];
        if (component.label) {
          component.label.innerHTML = component.decorateRequired(component.description.replace(/\s/g, ' '), component.required);
        }

      }
    }
  }
}
```

---

## Definir Variável de Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetClientFormVariable` |
| **Código** | 439 |
| **Assinatura** | `Criar Variável de Formulário(Nome, Valor)` |
| **Parâmetros** | Letras;Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Cria uma variável em um formulário corrente.

Parâmetro(s):
1. Nome da variável. (Letras)
2. Valor a ser armazenado. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfSetClientFormVariable(name, value) {
  if (!$mainform().__storage) {
    $mainform().__storage = {};
  }
  $mainform().__storage[name] = value;
}
```

---

## Está em Modo de Alteração?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormIsInEditMode` |
| **Código** | 595 |
| **Assinatura** | `Está em Modo de Alteração? () : Lógico` |
| **Retorno** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função obtém o estado do formulário no momento que o fluxo é chamado retornando true (verdadeiro) caso 
esteja em modo de alteração ou false (falso) caso contrário.

Parâmetro:
Não possui.

Retorno: 
Retorna "True" caso o formulário esteja em modo de alteração ou "False" caso contrário. (Lógico)

Observação:
Não é necessário passar o nome do formulário. O formulário sempre vai ser o que chama o fluxo.

Exemplo: 
Assumindo que um formulário está em modo de alteração no momento que o fluxo é chamado. Neste caso, o 
retorno seria "True".

### Código Servidor (Java)

```java
protected final Variant ebfFormIsInEditMode() throws Exception {
    return VariantPool.get(fields.isInEditMode());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormIsInEditMode()  {
  return $mainform().edit;
}
```

---

## Está em Modo de Inserção?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormIsInInsertMode` |
| **Código** | 596 |
| **Assinatura** | `Está em Modo de Inserção? () : Lógico` |
| **Retorno** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função obtém o estado do formulário no momento que o fluxo é chamado, retornando true (verdadeiro) caso 
esteja em modo de inserção ou false (falso) caso contrário.

Parâmetro:
Não possui.

Retorno: 
Retorna "True" caso o formulário esteja em modo de inserção ou "False" caso contrário. (Lógico)

Observação:
Não é necessário passar o nome do formulário. O formulário sempre vai ser o que chama o fluxo.

Exemplo:
Assumindo que um formulário está em modo de inserção no momento que o fluxo é chamado. Neste caso, o 
retorno seria "True".

### Código Servidor (Java)

```java
protected final Variant ebfFormIsInInsertMode() throws Exception {
    return VariantPool.get(fields.isInInsertMode());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormIsInInsertMode()  {
  return $mainform().insert;
}
```

---

## Está em Modo de Navegação?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormIsInBrowserMode` |
| **Código** | 738 |
| **Assinatura** | `Está em Modo de Navegação? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função obtém o estado do formulário no momento que o fluxo é chamado, retornando true (verdadeiro) caso 
esteja em modo de navegação ou false (falso) caso contrário.

Parâmetro:
Não possui.

Retorno: 
Retorna "True" caso o formulário esteja em modo de navegação  ou "False" caso contrário. (Lógico)

Observação:
Não é necessário passar o nome do formulário. O formulário sempre vai ser o que chama o fluxo.

Exemplo:
Assumindo que um formulário está em modo de navegação no momento que o fluxo é chamado. Neste caso, o 
retorno seria "True".

### Código Servidor (Java)

```java
protected final Variant ebfFormIsInBrowserMode()  throws Exception {
  return VariantPool.get(!fields.isInInsertMode() && !fields.isInEditMode());
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormIsInBrowserMode()  {
  return (!ebfFormIsInInsertMode() && !ebfFormIsInEditMode());
}
```

---

## Executar Fluxo no Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChannelExecuteRuleOnForm` |
| **Código** | 976 |
| **Assinatura** | `Executar Fluxo no Formulário (Formulário;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Formulário;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Executa uma regra em um determinado formulário passado como parâmetro.

Parâmetro(s):
1. Constante formulário ou GUID. (Formulário)
2. Fluxo. (Fluxo)
3. Lista de Parâmetros. (Variante, Opcional)
4. Fluxo de Callback. (Fluxo, Opcional) (Ver observação 1)
5. Lista de Parâmetros. (Variante, Opcional)

Retorno:
Não possui.

Observações:
1. O fluxo de callback receberá automaticamente o valor de retorno do fluxo executado, caso o mesmo retorne.
2. Essa função não executa um fluxo no formulário corrente.

### Código Cliente (JavaScript)

```javascript
function ebfChannelExecuteRuleOnForm (form, ruleName, ruleParams, ruleCallback, callbackParams) {
  if (webrunBroadcast) {
    if (isNullable(ruleParams)) ruleParams = new Array();
    const jsonProperties = {};
    jsonProperties.formGUID = form;
    jsonProperties.action = "wef";
    jsonProperties.flow = ruleName;
    jsonProperties.params = ruleParams;
    jsonProperties.callback = ruleCallback;
    jsonProperties.callbackParams = callbackParams;
    jsonProperties.formTarget = decodeURI(mainform.formGUID);

    webrunBroadcast.postMessage(jsonProperties);
  }
}
```

---

## Executar Java

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `executeJavaFunction` |
| **Código** | 605 |
| **Assinatura** | `Executar Java (Letras) : Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa um comando Java passado por parâmetro.

Parâmetro:
1. Comando Java. (Letras)

Retorno: 
Retorna o resultado do comando executado. (Variante)

Observações:
1. Java é uma linguagem computacional completa, adequada para o desenvolvimento de aplicações baseadas na 
rede Internet, redes fechadas ou ainda programas stand-alone [CAM96]. Para saber mais sobre o assunto, 
pesquise em um site de busca sobre Java.
2. Essa função é usada para a necessidade de executar um comando Java.

### Código Servidor (Java)

```java
protected final Variant executeJavaFunction(Variant functionVar) throws Exception {
    String javaContent = parseJavaContent(this, functionVar.getString());
    WFRRule function = manager.getJavaFunction(javaContent, connection, client, fields);
    return function.run(new Variant(this));
  }
```

---

## Exportar Dados do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExportFormData` |
| **Código** | 322 |
| **Assinatura** | `Exportar Dados do Formulário(Formulário;Letras)` |
| **Parâmetros** | Formulário;Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Exporta os dados do formulário passado no primeiro parâmetro de acordo com o tipo de exportação escolhida.

Parâmetro(s):
1. Formulário cujos dados serão exportados. (Formulário)
2. Tipo de exportação: (Letras)
     LST      - Exportar como uma lista;
     HTML  - Exportar como tabelas HTML;
     XML    - Exportar como árvore XML;
     TXT     - Exportar como arquivo de texto;

Retorno:
Não possui.

Observação:
Essa função pode ser usada somente pra exportação de dados, ou seja, vinculados ao registro da tabela referente ao formulário passado no 1º parâmetro.

### Código Cliente (JavaScript)

```javascript
function ebfExportFormData(formGuid,type) {
  window.open("export.jsp?sys=" + sysCode + "&formID=" + URLEncode(formGuid) + "&type=" + type, "ExportFormData", "fullscreen");
}
```

---

## Fechar Filhos de um Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormCloseChildren` |
| **Código** | 279 |
| **Assinatura** | `Fechar Filhos de um Formulário (Formulário;Lógico)` |
| **Parâmetros** | Formulário;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Fecha a árvore de formulários a partir do definido por parâmetro.

Parâmetro(s):
1. Formulário de onde deve-se partir para fechar todos seus formulários filhos. (Formulário)
2. Define-se se o formulário, definido no Parâmetro 1, deve ser recarregado. (Lógico)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFormCloseChildren(Variant formGUID, Variant reloadParent) throws Exception {
  return callClientFunction("ebfFormCloseChildren", formGUID, reloadParent);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormCloseChildren(formGUID, reloadParent) {
  var currentWin = window;
  var parentWin = getOpenerWindow(currentWin);
  var allWindows = new Array();

  allWindows.push(currentWin);
  while (parentWin && parentWin != currentWin) {
    allWindows.push(parentWin);
    var tempParentWin = getOpenerWindow(parentWin);
    if (tempParentWin != parentWin)
      parentWin = tempParentWin;
    else
      parentWin = null;
  }

  var first = null;
  for (var i = 0; i < allWindows.length ; i++) {
    if (allWindows[i].$mainform && allWindows[i].$mainform().formGUID) {
      if (allWindows[i].$mainform().formGUID == formGUID) {
        if (reloadParent) {
          first = allWindows[i];
        }
      
        for (var j = i - 1; j >= 0; j--) {
          try { 
            if (allWindows[j].isPopup)
              allWindows[j].top.close();
            else
              closeFloatingFormById(allWindows[j].idForm);
          } catch(e) {}
        }
        break;
      }
    }
  }
  
  if (first != null) {
    if (first.isPopup) {
      if (IE) {
        first.focus();
        first.top.location.reload(first.top.location.href);
      } else {
        first.top.location.reload();
      }
    } else {
      first.location.reload();
    }
  }
}
```

---

## Fechar Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCloseForm` |
| **Código** | 151 |
| **Assinatura** | `Fechar Formulário` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função é utilizada para fechar o formulário que chama o fluxo.

Parâmetro: 
Não possui.

Retorno: 
Não possui.

Observações: 
1. Não é necessário passar o nome do formulário. O formulário sempre vai ser o que chama o fluxo.
2. Caso o formulário seja a janela principal (propriedade "Formulário Principal" do Maker), o mesmo não poderá ser 
fechado através desta função.

Exemplo:
Quando essa função for chamada em um formulário, o mesmo será fechado.

### Código Servidor (Java)

```java
protected final Variant ebfCloseForm() throws Exception {
    client.executeJavascript("$mainform().d.n.actExit();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfCloseForm() {
    $mainform().d.n.actExit();
}
```

---

## Fechar Formulário Pai

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCloseOpenerWindow` |
| **Código** | 323 |
| **Assinatura** | `Fechar Formulário Pai ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Fecha a janela que abriu a janela corrente. (Formulário pai)

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCloseOpenerWindow() throws Exception{
  callClientFunction("ebfCloseOpenerWindow");
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCloseOpenerWindow() {
  "use strict";
  var openerWindow;

  if (isPopup) {
    openerWindow = $mainform().getOpenerWindow(top);
    if (openerWindow && openerWindow.mainform && mainform.webrunBroadcast) {
      mainform.webrunBroadcast.postMessage({
        action: "wcf",
        idForm: decodeURI(openerWindow.mainform.idForm),
        formGUID: decodeURI(openerWindow.mainform.formGUID),
      });
    }
  } else {
    Object.keys(mainSystemFrame.formHierarchy).forEach(function (parentFormId) {
      var formChildren = mainSystemFrame.formHierarchy[parentFormId];
      formChildren.some(function (childFormId) {
        if ("WFRIframeForm" + idForm === childFormId) {
          closeFormHierarchy(parentFormId);
          return true;
        }
      });
    });
  }
}
```

---

## Fechar Formulário numa Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFrameCloseForm` |
| **Código** | 355 |
| **Assinatura** | `ebfFrameCloseForm(Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Fecha um formulário aberto através da função "Abrir formulário numa moldura".

Parâmetro(s): 
1. Formulário onde se encontra o componente moldura. 
2. Nome da Moldura. (Componente)

Retorno: 
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFrameCloseForm(Variant form, Variant componentName) throws Exception {
    return callClientFunction("ebfFrameCloseForm", form, componentName);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFrameCloseForm(form, componentName) {
  var component = $c(componentName, form);
  if (component && component instanceof HTMLGroupBox) {
    component.closeFrame();
  }
}
```

---

## Fechar Pilha de Formulários

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCloseMasterForm` |
| **Código** | 237 |
| **Assinatura** | `Fechar Pilha de Formulários ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Fecha todos os formulários que foram utilizados para abrir o formulário atual (exceto o primeiro) e ele mesmo.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
A função não fecha o formulário principal.

### Código Servidor (Java)

```java
protected final Variant ebfCloseMasterForm()throws Exception {
    callClientFunction("ebfCloseMasterForm");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfCloseMasterForm() {
  try {  
    if (isPopup) {
      if ($mainform().getOpenerWindow(top)) {
        $mainform().getOpenerWindow(top).close();
      }
      $mainform().d.n.actExit();    
    } else {
      for (var i=0; i<mainSystemFrame.floatingForms.length; i++) {
        closeFloatingFormById(mainSystemFrame.floatingForms[i].replace("WFRIframeForm", ""));   
      }
    }
  } catch (ex) {}
}
```

---

## Focar Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetFocus` |
| **Código** | 582 |
| **Assinatura** | `Formulário - Focar Componente (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função é utilizada para focar um determinado componente passado como parâmetro.

Parâmetro:
1. Componente que vai ter o foco. 

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário no de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "Componente" para uma constante do tipo "Letras".

Exemplo:
Assumindo como parâmetro o componente "Cidade" (MakerEdit1), após essa função ser executada, o foco do 
cursor estará neste componente passado como parâmetro.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetFocus(Variant field) throws Exception {
    client.setFocus(field.getString());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetFocus() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      timeout(function() {
            component.focus();
        }, 100);
    }
  }
}
```

---

## Focar Componente - Anterior

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPrevFocus` |
| **Código** | 369 |
| **Assinatura** | `Focar Componente - Anterior (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Muda o foco do componente para o componente anterior de acordo com a tabulação.

Parâmetro:
1. ID ou Nome do Componente em foco. (Letras)

Retorno: 
Não possui.

Observação:
Pode ser utilizado o nome do componente ou o ID, obtendo através da função "Obter ID do Componente".

### Código Cliente (JavaScript)

```javascript
function ebfPrevFocus(componentAtual) {
  componentAtual = $c(componentAtual);
  if (componentAtual) {
     controller.next(componentAtual, true);
  } else  {
      controller.focusFirst();
   }  
}
```

---

## Focar Componente - Próximo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNextFocus` |
| **Código** | 368 |
| **Assinatura** | `Focar Componente - Proximo (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Muda o foco do componente para o próximo componente de acordo com a tabulação.

Parâmetro:
1. ID ou Nome do Componente em foco. (Letras)

Retorno: 
Não possui.

Observação:
Pode ser utilizado o nome do componente ou o ID, obtendo através da função "Obter ID do Componente".

### Código Cliente (JavaScript)

```javascript
function ebfNextFocus(componentAtual) {
  componentAtual = $c(componentAtual);
  if (typeof(componentAtual) != "undefined") {
     controller.next(componentAtual, false);
  } else  {
      controller.focusFirst();
   }  
}
```

---

## Formulário - Tornar FullScreen

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFullScreen` |
| **Código** | 1015 |
| **Assinatura** | `Formulário - Tornar FullScreen (Formulário)` |
| **Parâmetros** | Formulário |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função coloca um formulário em modo FullScreen.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
A função colocará em FullScreen o formulário corrente.

### Código Cliente (JavaScript)

```javascript
function ebfFullScreen() {
    $mainform().document.documentElement.requestFullscreen();
}
```

---

## Formulário está aberto?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `formIsOpenned` |
| **Código** | 321 |
| **Assinatura** | `Formulário está aberto? (Formulário): Lógico` |
| **Parâmetros** | Formulário |
| **Retorno** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Verifica se o formulário passado por parâmetro está aberto.

Parâmetro:
1. Formulário.

Retorno:
Retorna verdadeiro se o formulário estiver aberto, caso contrário retorna falso. (Lógico)

Observações:
1. Esta função não identifica os formulários que foram abertos numa moldura. Para tal, deve utilizar a função 
"Executar fluxo no Formulário numa Moldura" passando uma regra que irá verificar se o formulário na moldura 
está aberto.
2. Esta função só irá funcionar caso exista algum parentesco entre os formulários.

### Código Cliente (JavaScript)

```javascript
function searchFormByGUIDFormIsOpened(currentForm,GUID){
  if (currentForm && currentForm.formGUID == GUID){
    return currentForm;
  }
  if (currentForm && currentForm.$mainform() && currentForm.$mainform().formGUID == GUID) {
    return currentForm.$mainform();
  }
  if (currentForm.children) {
    for (var i=0; i < currentForm.children.length; i++) {
      try {
        if (currentForm.children[i].$mainform()) {
          if (currentForm.children[i].$mainform().formGUID == GUID){
            return currentForm.children[i].$mainform();
          }
          var childForm = currentForm.children[i];
          if (currentForm.children[i].$mainform().d.n.isModal) {
            childForm = childForm.$mainform();
          }
          var returnForm = searchFormByGUIDFormIsOpened(childForm,GUID);
          if (returnForm){
            return returnForm;
          }
        }
      }catch(e){}
    }
  }
}

function searchFloatingFormIsOpenned(formGUID) {
  var openFloatingForms;
  if (isPopup) {  
    var mainFormWindow = top.opener;
    while(mainFormWindow && mainFormWindow.opener) {    
      mainFormWindow = mainFormWindow.opener;
    }
    if (mainFormWindow && mainFormWindow.mainSystemFrame)   
      openFloatingForms = mainFormWindow.mainSystemFrame.document.getElementsByClassName("WFRIframeForm");      
    else    
      openFloatingForms = [];
  } else {

    openFloatingForms = mainSystemFrame.document.getElementsByClassName("WFRIframeForm");  


  }
  for (var i=0; i<openFloatingForms.length; i++) {
    var formReference = openFloatingForms[i].children[1].children[1].contentWindow.mainform;
    if (formReference.formGUID == formGUID) {
      return formReference;    
    }
  }
}

function formIsOpenned(form) {
  if (isNull(form)) {
    return false;
  }

  var mainWindow = top;
  while (getOpenerWindow(mainWindow) != null) {
    var openerWindow = getOpenerWindow(mainWindow);
    if (openerWindow.mainform && !isNullable(openerWindow.mainform.sysCode)) {
      mainWindow = openerWindow;
    } else {
      break;
    }
  }

  var myForm = searchFormByGUIDFormIsOpened(mainWindow, form);
  if (myForm) {
    return true;
  }

  myForm = searchFloatingFormIsOpenned(form);
  if (myForm) {
    return true;
  }

  myForm = searchTabbedFormIsOpened(form);
  if (myForm) {
    return true;
  }

  return false;
}
```

---

## Habilitar Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetEnabled` |
| **Código** | 580 |
| **Assinatura** | `Habilitar Componente` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função habilita o componente se a condição passada no segundo parâmetro for verdadeira, ou desabilita 
caso a condição seja falsa. Se o componente estiver desabilitado, não será possível modificar seu conteúdo.

Parâmetro(s):
1. Componente que será habilitado ou desabilitado (Letras).
2. Condição para habilitar o componente (Lógico).

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Inicio" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "Componente" para uma constante do tipo "Letras".

Exemplos:
1. Assumindo como parâmetros o componente "Cidade" (MakerEdit1), e uma condição lógica "Ano Atual= 
2000", quando a função for executada, caso o Ano atual seja 2000 o componente "MakerEdit1" será 
habilitado, caso seja diferente de 2000 o campo será desabilitado.
2. Assumindo como parâmetros o componente "Cidade"  (MakerEdit1), e uma condição lógica true, quando a 
função for executada o componente sempre vai ser habilitado.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetEnabled(Variant componentName, Variant enabled) throws Exception {
    return callClientFunction("ebfFormSetEnabled", componentName, enabled);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetEnabled(componentName, enabled) {
  var component = $c(componentName); 
  if(component && !(verifyObjectType(component, "HTMLMakerFlowComponent"))) {
    if(controller.activeElement == component) {            
      component.blur();      
    }    
    component.timeout(component.setEnabled, 0, [parseBoolean(enabled)]);
  } else if(component) {
    component.setEnabled(enabled);
  }   
}
```

---

## Habilitar ou Desabilitar Botão de Alteração

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableEditButton` |
| **Código** | 310 |
| **Assinatura** | `Habilitar ou Desabilitar Botão de Alteração (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Habilitar ou desabilitar botão de alteração.

Parâmetro:
1. Verdadeiro para Habilitar, Falso para Desabilitar. (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfEnableEditButton(enabled) {
  var navigation = $mainform().d.n;
  if (navigation) {
    navigation.canEdit = enabled;
    navigation.btEdit.setEnabled(enabled);
  }
}
```

---

## Habilitar ou Desabilitar Botão de Exclusão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableDeleteButton` |
| **Código** | 309 |
| **Assinatura** | `Habilitar ou Desabilitar Botão de Exclusão (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Habilitar ou desabilitar botão de exclusão.

Parâmetro:
1. Verdadeiro para Habilitar, Falso para Desabilitar. (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfEnableDeleteButton(value) {
  var button = d.n.btDelete;
  if (!button.flag) {
    var func = button.setEnabled;
    button.setEnabled = function(value, exec) {
      if (exec) {
        button.timeout(func, 0, [value]);
      }
    }
    button.flag = true;
  }
  button.setEnabled(value, true);
}
```

---

## Habilitar ou Desabilitar Botão de Inserção

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableIncludeButton` |
| **Código** | 311 |
| **Assinatura** | `Habilitar ou Desabilitar Botão de Inserção (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Habilitar ou desabilitar botão de inserção.

Parâmetro:
1. Verdadeiro para Habilitar, Falso para Desabilitar. (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfEnableIncludeButton() {

var navigation = $mainform().d.n;

if (navigation) {
   navigation.btInclude.setEnabled(arguments[0]);
 
}

}
```

---

## Modificar Consulta do Formulário ou Grade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDefineFormResultSet` |
| **Código** | 277 |
| **Assinatura** | `Modificar Consulta do Formulário (Formulário, Tabela, Lógico)` |
| **Parâmetros** | Formulário;Tabela;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Modifica a consulta de um formulário ou de uma grade.

Parâmetro(s):
1. Formulário ou Grade vinculado ao componente grade. 
2. Tabela navegável. (Tabela)
3. Atualizar formulário ou grade do Parâmetro 1? (Lógico)

Retorno:
Não possui.

Observações: 
1. No caso de formulário, a seleção deve ser compatível com a seleção de origem, ou seja, os mesmo campos e tabela
devem estar presentes em ambos (Já que trata-se de uma nova associação de dados ao formulário sendo a consulta 
anterior fechada. (O mesmo não vale quando existem Alias configurados aos campos)). Sendo uma grade, todos os 
campos podem ser alterados.
2. Ao modificar a consulta do formulário, a nova consulta deixa de ser gerenciada pelo fluxo, ou seja, ele não 
se encarregará de fechá-la, pois isso deverá ser uma tarefa do gerenciador do formulário (que a fechará 
quando o formulário for fechado).
3. O 2º parâmetro pode ser obtido através da função Abrir Consulta Navegável.

### Código Servidor (Java)

```java
protected final Variant ebfDefineFormResultSet(Variant formGuid, Variant rs, Variant update) throws Exception {
  WFRForm form = client.getSystem().getForm(formGuid.toString(), client.getData().connection());
  client.getData().setFormResultSet(form.getCodeStr(), rs.getResultSet());
  wfr.database.DBConnection conn = null;
  String dataSource = form.getProperty(wfr.sys.HTMLInterface.ComponentProperty.FONTEDEDADOS);
  try {
    conn = client.getData().connection().getDBConnection(dataSource);
  } catch (Exception e) {
    conn = client.getData().connection();
  }

  if (rs.getResultSet() instanceof WFRResultSet && (conn != null && conn.isPooled())) {
    WFRResultSet.class.cast(rs.getResultSet()).setOpenCursorOnNewPage(true);
  }
  openedResultSetList.remove(rs.getResultSet());

  if (update.getBoolean()) {

    WFRForm parentForm = fields.getForm();

    List<WFRComponent> coms = parentForm.getAllComponents();

    for (WFRComponent c : coms) {
      if (c.getType() == 'G' && c.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM).equals(form.getCodeStr())) {
        wfr.sys.HTMLInterface.HTMLGrid elemGrid = (wfr.sys.HTMLInterface.HTMLGrid) wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(
            getData().getHtmlInterface(), getData(), c, client.getSystem(), rs.getResultSet(), response.getWriter());
        if (elemGrid.isEnableNumberOfRecords()) {
          elemGrid.setTotalRows(elemGrid.getNavigation().getTotalRows(form.getCodeStr(), request, dataSource));
          client.command("$c('" + c.getName() + "').setTotalRows(" + elemGrid.getTotalRows() + ");");
        }
        client.command("$mainform().$c('" + c.getName() + "').clearDataSelected($c('" + c.getName() + "').getSelectedRow());");
        client.command("$mainform().$c('" + c.getName() + "').paging.navigationAction(null, null, 'first');\n $mainform().$c('" + c.getName() + "').noRefresh = true;");
        return Variant.VARIANT_NULL;
      }
    }

    client.command("$mainform().d.n.execAjaxEval('first')");
    client.command("try { if ($mainform().d.p) $mainform().d.p.loaded = false } catch (ex) {}");
  }

  return Variant.VARIANT_NULL;
}
```

---

## Modo de Alteração

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormEditMode` |
| **Código** | 123 |
| **Assinatura** | `Modo de Alteração` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função muda o modo do formulário para o modo de alteração.

Parâmetro:
Não possui.

Retorno: 
Não possui.

Observação:
O formulário que vai entrar em modo de alteração será o mesmo que chama o fluxo.

Exemplo:
Caso um formulário esteja em modo de navegação, após a função ser chamada, o formulário passará para o modo de alteração.

### Código Servidor (Java)

```java
protected final Variant ebfFormEditMode() throws Exception {
  return callClientFunction("ebfFormEditMode");
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormEditMode()  {
  if (d.n) {
    d.n.timeout(d.n.actEdit, 100);
  }
}
```

---

## Modo de Inserção

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormInsertMode` |
| **Código** | 121 |
| **Assinatura** | `Modo de Inserção` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função muda o modo do formulário para o modo de inserção.

Parâmetro:
Não possui.

Retorno: 
Não possui.

Observações:
1. O formulário que vai entrar em modo de alteração será o mesmo que chama o fluxo.
2. O formulário deve estar com o modo de inclusão habilitado (Definições do Formulário) para que esta função tenha efeito.

Exemplo:
Caso um formulário esteja em modo de navegação, após a função ser chamada, o formulário passará para o modo de inserção.

### Código Servidor (Java)

```java
protected final Variant ebfFormInsertMode() throws Exception {
  return callClientFunction("ebfFormInsertMode");
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormInsertMode()  {  
  if (d.n) {
    d.n.timeout(d.n.actInclude, 100);
  }
}
```

---

## Mostrar Aba

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormShowTab` |
| **Código** | 7 |
| **Assinatura** | `Mostrar Aba(Letras;Lógico)` |
| **Parâmetros** | Letras;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função mostra ou oculta a aba a depender da condição lógica passada. Caso a condição seja verdadeira, 
mostra a aba, caso seja falsa, oculta.

Parâmetro(s):
1. Aba. (Letras)
2. Mostrar Aba? (Lógico)

Retorno:
Não possui.

Observação:
A aba passada como parâmetro deve estar no formulário que chama o fluxo.

Exemplos:
1. Caso um formulário esteja em modo de inserção, após a função ser chamada, o formulário passará para o 
modo de alteração.
2. A função apenas mostrará a ABA. Isso significa que a ABA não será ativada. Para isto utilize a função "Ativar 
Aba".

### Código Servidor (Java)

```java
protected final Variant ebfFormShowTab(Variant tabName, Variant visible) throws Exception {
    client.showTab(tabName.getString(), visible.getBoolean());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormShowTab() {
  if (existArgs(arguments)) {
    mainform.d.t.setVisible(arguments[0], arguments[1]);
  }
}
```

---

## Mostrar Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormSetVisible` |
| **Código** | 581 |
| **Assinatura** | `Mostrar Componente` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função mostra o componente se a condição passada no segundo parâmetro for verdadeira ou oculta 
caso a condição seja falsa. 

Parâmetro(s):
1. Componente que ficará visível ou oculto. 
2. Mostrar componente? (Lógico)

Retorno: 
Não possui.

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "Componente" para uma constante do tipo "Letras".

Exemplos:
1. Assumindo como parâmetros o componente "Cidade" (MakerEdit1),  e uma condição lógica "Ano Atual= 
2000", quando a função for executada, caso o Ano atual seja 2000 o componente "MakerEdit1" ficará visível, 
Caso seja diferente de 2000 o campo ficará oculto.
2. Assumindo como parâmetros o componente "Cidade"  (MakerEdit1),  e uma condição lógica "false", quando a 
função for executada o componente ficará oculto.

### Código Servidor (Java)

```java
protected final Variant ebfFormSetVisible(Variant field, Variant visible) throws Exception {
    client.setVisible(field.getString(), visible.getBoolean());
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormSetVisible() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) 
      component.setVisible(parseBoolean(arguments[1]));
  }  
}
```

---

## Obter Aba Ativa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSelectedTab` |
| **Código** | 111 |
| **Assinatura** | `Obter Aba Ativa() : Tab` |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém e retorna o objeto da aba que está ativa quando o fluxo é executado.

Parâmetro:
Não possui.

Retorno: 
Objeto da aba ativa. (Variante)

Exemplo:
Se a aba é "Cadastros", a função gera um objeto desta aba: [object HTMLab Cadastro].

### Código Cliente (JavaScript)

```javascript
function ebfSelectedTab() {
  return d.t.getSelectedTab();
}
```

---

## Obter Altura do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormGetHeight` |
| **Código** | 184 |
| **Assinatura** | `Obter Altura do Componente` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Retorna a altura (em pixels) do componente passado por parâmetro.

Parâmetro:
1. Nome do Componente. (Componente)

Retorno:
Altura do componente. (Inteiro)

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do tipo 
"componente" para uma constante do tipo "Letras".

### Código Cliente (JavaScript)

```javascript
function ebfFormGetHeight() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      return component.getHeight();
    }
  }  
}
```

---

## Obter Altura do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormGetClientHeight` |
| **Código** | 453 |
| **Assinatura** | `Obter Altura do Formulário` |
| **Retorno** | Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Retorna a altura (em pixels) do formulário onde o fluxo for executado.

Parâmetro:
Não possui.

Retorno:
Altura do Formulário. (Inteiro)

Observação:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfFormGetClientHeight() {
  return parseInt(getWindowHeight());
}
```

---

## Obter Campo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLGetFormField` |
| **Código** | 508 |
| **Assinatura** | `Obter Campo (Campo) : Variante` |
| **Parâmetros** | Campo |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o conteúdo do campo passado por parâmetro.

Parâmetro:
1. Campo qual deseja obter o conteúdo. (Formulário)

Retorno: 
Conteúdo do campo. (Variante)

Observações:
1. Para selecionar o campo é necessário indicar o nome do formulário no de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do campo mudando a constante do tipo 
"formulário" para uma constante do tipo "Letras".
3. É necessário que o componente esteja associado a um campo da tabela.
4. Caso o formulário que se deseja obter o campo esteja dentro de um componente moldura, deve-se utilizar a 
função "Executar Fluxo no Formulário" apontar para um fluxo que contenha esta função.

Exemplo:
Em um formulário cujo conteúdo do campo "Cidade" é "Salvador", assumindo como parâmetro este campo 
("Cidade"), o retorno seria "Salvador".

### Código Servidor (Java)

```java
protected final Variant ebfSQLGetFormField(Variant variantField) throws Exception {
    Variant field = Variant.VARIANT_NULL;
    if (fields != null && fields.contains(variantField.getString())) {
      Object value = fields.getValue(variantField.getString());
      if (value != null) {
        field = VariantPool.get(value);
      }
    }
    return field;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSQLGetFormField() {
  var value = "";
  if (existArgs(arguments)) {
    value = getFormFieldValue(arguments[0]);
  }
  return value;
}
```

---

## Obter Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormComponentByName` |
| **Código** | 40 |
| **Assinatura** | `Obter Componente(Nome)` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Retorna a referência do componente passado por parâmetro.

Parâmetro:
1. Nome do componente. (Letras)

Retorno: 
Retorna a referência do componente. (Variante)

Observações:
1. Se o formulário não for o principal (o que chama o fluxo), essa função não vai funcionar em regras do tipo 
cliente;
2. Se não for o formulário principal (que chama o fluxo) e o mesmo estiver aberto, o retorno será o conteúdo do 
campo passado naquele registro. Caso o formulário passado não esteja sendo utilizado, o retorno será o primeiro 
registro no banco.

Exemplo:
Assumindo como componente "MakerEdit2", o retorno será o objeto deste componente.

### Código Cliente (JavaScript)

```javascript
function ebfFormComponentByName() {
  if (existArgs(arguments)) {
    var component = controller.getElementById(arguments[0]);
    if (component)
      return component;     
  }
  return null;
}
```

---

## Obter Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetWindowReferenceByGuid` |
| **Código** | 671 |
| **Assinatura** | `Obter Formulário (Formulário;Lógico): Variante` |
| **Parâmetros** | Formulário;Lógico |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém a referência da janela do formulário informado como parâmetro.

Parâmetro(s):
1. Formulário. 
2. Levantar Exceção? (Caso o formulário não encontrado). (Lógico)

Retorno:
1. Referência (DOM) da janela (Window) do formulário (Variante).

Observações:
1. Esta função não dá suporte a formulários com as propriedades "Popup = SIM" e "Modal = SIM".
2. Esta função obtém apenas formulários abertos em forma de janela (Popup Sim ou Não). Para obter formulários na
moldura, utilize a função "Obter Formulário da Moldura".

### Código Cliente (JavaScript)

```javascript
function ebfGetWindowReferenceByGuid(formGUID, throwException) {
  var topLevel = isPrincipal ? principal : $mainform().parent.principal;  
  var foundWindow;  

  //Formulário foi atualizado. Obter do pai  
  if (!topLevel) {// && getOpenerWindow(window) && getOpenerWindow(window).$mainform()) {  
    topLevel = getOpenerWindow(window);
    while(getOpenerWindow(topLevel) != null) {
      topLevel = getOpenerWindow(topLevel);
    }    
    if (topLevel && topLevel.mainform.isPrincipal)    
      topLevel = topLevel.mainform.principal;      
    if (topLevel && topLevel.$mainform().isPrincipal)    
      topLevel = topLevel.$mainform().principal;
    /*if (getOpenerWindow(window).$mainform().principal)
      topLevel = getOpenerWindow(window).$mainform().principal;
    else
      topLevel = getOpenerWindow(window).$mainform().parent.principal;*/    
  }
  if (topLevel && topLevel.formGUID == formGUID)  
    return topLevel;
   
  //Caso da moldura
  if (!topLevel) {
    if (top.$mainform() && top.$mainform().mainform && top.$mainform().mainform.isPrincipal)    
      topLevel = top.$mainform().mainform.principal;
  }

  //Procurar Janelas
  foundWindow = ebfSearchPopupWindowRecursivelly(topLevel, formGUID);
  if (foundWindow) {
    return foundWindow.$mainform();
  }    

  //Procurar Flutuantes    
  if (topLevel && topLevel.$mainform().mainSystemFrame && topLevel.$mainform().mainSystemFrame.floatingForms) {
    for (var i=0; i<topLevel.$mainform().mainSystemFrame.floatingForms.length; i++) {      
      var currentFloatingFormWindow = topLevel.$mainform().getFloatingFormWindowById(
        topLevel.$mainform().mainSystemFrame.floatingForms[i].replace("WFRIframeForm", ""));        
      if (currentFloatingFormWindow.mainform.formGUID == formGUID) {
        return currentFloatingFormWindow.mainform;        
      } else {
        var found = ebfSearchPopupWindowRecursivelly(currentFloatingFormWindow.mainform, formGUID);
        if (found)
          return found;      
      }
    }
  }    
  //Não encontrou 
  if(throwException == undefined || throwException){ 
    throw "Formulário não encontrado";    
  }
}

function ebfSearchPopupWindowRecursivelly(window, formGUID) {
  if (window && window.parent && window.parent.children) {
    for (var i=0; i<window.parent.children.length; i++) {
      var currentWindow = window.parent.children[i];      
      try {      
        var existCurrentWindow = currentWindow.$mainform();        
      } catch(e) {
        continue;    
      }
      if (currentWindow.$mainform() && currentWindow.$mainform().formGUID == formGUID) {
        return currentWindow.$mainform();
      } else if (currentWindow.mainform && currentWindow.mainform.formGUID == formGUID) {
        return currentWindow.mainform;      
      }
      
      var found = ebfSearchPopupWindowRecursivelly(currentWindow, formGUID);
      if (found)
        return found;
    }
    
  } else if (window && window.children) {  
    for (var i=0; i<window.children.length; i++) {
      var currentWindow = window.children[i];      
      try {      
        currentWindow.$mainform();        
      } catch(e) {
        continue;    
      }
      if (currentWindow.$mainform() && currentWindow.$mainform().formGUID == formGUID) {
        return currentWindow.$mainform();
      }
      var found = ebfSearchPopupWindowRecursivelly(currentWindow, formGUID);
      if (found)
        return found;
    }  
  }
}
```

---

## Obter Formulário Atual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetActualForm` |
| **Código** | 365 |
| **Assinatura** | `Obter Formulário Atual(): Variante` |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a referência do formulário no qual foi associado (ao evento do formulário) o fluxo de ação que contém 
esta função.

Parâmetro:
Não possui.

Retorno:
Referência do Formulário. (Variante)

Observação:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGetActualForm() {
  return $mainform();
}
```

---

## Obter Formulário Chamador

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetOpenerForm` |
| **Código** | 366 |
| **Assinatura** | `Obter Formulário Chamador(Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a referência do formulário a partir do qual um outro formulário foi aberto normalmente abertos através de 
botões, dentre outros.

Parâmetro:
1. Referência do Formulário. (Variante) (Ver observação)

Retorno:
Referência do Formulário a partir do qual um formulário foi aberto. (Variante)

Observação:
Para obter o parâmetro utilize a função "Obter Formulário Atual".

### Código Cliente (JavaScript)

```javascript
function ebfGetOpenerForm(formActual) {
  return getOpenerWindow(formActual).$mainform();
}
```

---

## Obter Formulário Chamador Principal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMainFormGetInstance` |
| **Código** | 443 |
| **Assinatura** | `Obter Formulário Chamador Principal : Variante` |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a referência do formulário principal, sendo este o chamador; normalmente abertos através de botões, 
dentre outros.

Parâmetro:
Não possui.

Retorno:
Referência do Formulário Principal a partir do qual o formulário atual foi aberto. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfMainFormGetInstance() {
  return getOpenerWindow(top).$mainform().top.$mainform();
}
```

---

## Obter Formulário Pai

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetParentForm` |
| **Código** | 364 |
| **Assinatura** | `Obter Formulário Pai (Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a referência do formulário a partir do qual um outro formulário foi aberto; normalmente aberto na moldura de um formulário.

Parâmetro:
1. Referência do formulário. (Variante)

Retorno:
Referência do Formulário a partir do qual outro formulário foi aberto. (Variante)

Observação:
Para obter o parâmetro utilize a função "Obter Formulário Atual".

### Código Cliente (JavaScript)

```javascript
function ebfGetParentForm(formActual) {
  return formActual.parent.parent.$mainform();  
  //Anterior return formActual.top.parent.$mainform();
}
```

---

## Obter Formulário da Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetBevelWindowReferenceByGuid` |
| **Código** | 672 |
| **Assinatura** | `Obter Formulário da Moldura (Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém a referência da janela do formulário aberto na moldura.

Parâmetro(s):
1. Formulário. (Formulário)
2. Componente Moldura. (Componente)

Retorno:
Referência (DOM) da janela (Window) do formulário da moldura. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetBevelWindowReferenceByGuid(formGUID, com) {
  var formRef = ebfGetWindowReferenceByGuid(formGUID);  
  if (formRef) {
    if (formRef.$c(com)) {    
      var iframe = formRef.$c(com).div.getElementsByTagName("iframe");      
      if (iframe) {      
        return iframe[0].contentWindow;
      }      
      throw "Não há nenhum formulário aberto na moldura";    
    }    
    throw "Formulário não encontrado";

  }  
  throw "Formulário não encontrado";
}
```

---

## Obter GUID do Formulário Atual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetGUIDActualForm` |
| **Código** | 471 |
| **Assinatura** | `Obter GUID do Formulário Atual (): Letras` |
| **Retorno** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o GUID do formulário no qual foi associado (ao evento do formulário) o fluxo de ação que contém esta função.

Parâmetro:
Não possui.

Retorno:
GUID do Formulário. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfGetGUIDActualForm() throws Exception {     
  return VariantPool.get(fields.getForm().getGuid());
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetGUIDActualForm() {
  return $mainform().formGUID;
}
```

---

## Obter ID do Componente em Foco

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFocusedComponent` |
| **Código** | 275 |
| **Assinatura** | `Obter ID do Componente em Foco` |
| **Retorno** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Função que obtém o ID do componente em foco.

Parâmetro:
Não possui.

Retorno:
Nome do Componente em Foco. (Letras)

Observação:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGetFocusedComponent(){
   if(controller && controller.activeElement)
     return controller.activeElement.id;
}
```

---

## Obter ID do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetIdForm` |
| **Código** | 370 |
| **Assinatura** | `Obter ID do Formulário (Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o ID do formulário.

Parâmetro:
1. Referência do formulário. (Variante)

Retorno:
ID do Formulário. (Variante)

Observação:
Deve ser utilizada a função "Obter Formulário Atual" ou "Obter Janela do Formulário" para obter a referência do formulário.

### Código Cliente (JavaScript)

```javascript
function ebfGetIdForm(formActual) {

    return formActual.idForm;
	
}
```

---

## Obter Janela do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFormByGuid` |
| **Código** | 381 |
| **Assinatura** | `Obter Janela do Formulário (Formulário) : Variante` |
| **Parâmetros** | Formulário |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a janela (instância) do formulário definido no parâmetro.

Parâmetro:
1. GUID do Formulário. (Formulário)

Retorno:
Referência do Formulário. (Variante)

Observações:
1. O formulário deve está aberto no momento da execução da função.
2. Esta função só irá funcionar caso exista algum parentesco entre os formulários.

### Código Cliente (JavaScript)

```javascript
function searchFormByGUIDGetFormByGuid(currentForm,GUID){
  if (currentForm && currentForm.formGUID == GUID){
    return currentForm;
  }
  if (currentForm && currentForm.$mainform() && currentForm.$mainform().formGUID == GUID) {
    return currentForm.$mainform();
  }
  if (currentForm.children) {
    for (var i=0; i < currentForm.children.length; i++) {
      try {
        if (currentForm.children[i].$mainform()) {
          if (currentForm.children[i].$mainform().formGUID == GUID){
            return currentForm.children[i].$mainform();
          }
          var childForm = currentForm.children[i];
          if (currentForm.children[i].$mainform().d.n.isModal) {
            childForm = childForm.$mainform();
          }
          var returnForm = searchFormByGUIDGetFormByGuid(childForm,GUID);
          if (returnForm){
            return returnForm;
          }
        }
      }catch(e){}
    }
  }
}

function ebfGetFormByGuid(formGUID) {
  var mainWindow = top;
  while (getOpenerWindow(mainWindow) != null) {
    var openerWindow = getOpenerWindow(mainWindow);
    if (openerWindow.mainform && !isNullable(openerWindow.mainform.sysCode)) {
      mainWindow = openerWindow;
    } else {
      break;
    }
  }
  return searchFormByGUIDGetFormByGuid(mainWindow, formGUID);
}
```

---

## Obter Largura do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormGetWidth` |
| **Código** | 183 |
| **Assinatura** | `Obter Largura do Componente` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém a largura(em pixels) do componente passado como parâmetro.

Parâmetro:
1. Nome do Componente.

Retorno:
Largura do Componente. (Inteiro)

Observação:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfFormGetWidth() {
  if (existArgs(arguments)) {
    var component = $c(arguments[0]);
    if (component) {
      return component.getWidth();
    }
  }
}
```

---

## Obter Lista com Nome das Abas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetTabList` |
| **Código** | 724 |
| **Assinatura** | `Obter Lista com Nome das Abas (): Variante` |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna uma lista com o nome das abas (incluindo as abas criadas dinamicamente) do formulário em execução. 

Parâmetro:
Não possui.

Retorno:
Lista com nome das abas (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetTabList() {
  var tabList = new Array();
  $mainform().d.t.tabs.forEach(function(element, index, array){tabList.push(element["description"])});  
  return tabList;
}
```

---

## Obter Lista de Componentes de um Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetComponentList` |
| **Código** | 427 |
| **Assinatura** | `Obter Lista de Componentes de um Formulário(Formulário)` |
| **Parâmetros** | Formulário |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna uma lista contendo todos os componentes (e seus objetos) do formulário passado como parâmetro.

Parâmetro:
1. Formulário. 

Retorno:
Lista de componentes do formulário. (Variante)

Observações:
1. Caso o parâmetro seja nulo, a função retornará a lista de componentes do formulário corrente.
2. Ao utilizar a função na camada cliente, os componentes da barra de navegação também serão listados independente da propriedade Navegação do Formulário.
3. Para que os componentes da barra de navegação não sejam listados, é necessário desabilitá-los nas definições do formulário.

### Código Servidor (Java)

```java
protected Variant ebfGetComponentList(Variant formID) throws Exception {
    wfr.com.WFRForm form = fields.getForm();
    if (!formID.isNull()) {
      form = client.getSystem().getFormByGuid(formID.toString());
    }
    
    if (form == null) {
      throw new Exception("Formulário não encontrado");
    }
    
    List<WFRForm> forms = new ArrayList<WFRForm>();
    forms.add(form);
    forms.addAll(form.getRecursiveSubForms());
    
    java.util.List<String> componentNames = new java.util.ArrayList<String>();
    java.util.List<WFRComponent> componentList = new java.util.ArrayList<WFRComponent>();
    
    for (WFRForm f : forms) {
      componentList.addAll(f.getAllComponents());
    }
    for (wfr.com.WFRComponent com : componentList) {
      componentNames.add(com.getName());
    }
    
    return new Variant(componentNames);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetComponentList(form) {
  if (form) { 
    return controller.getElementsByForm(form);
  } else {
    return controller.getAllElements();
  }  
}
```

---

## Obter Mapa com formulários do sistema

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetForms` |
| **Código** | 703 |
| **Assinatura** | `Obter Mapa com formulários do sistema (): Variante` |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém um mapa com os formulários de sistema onde a chave será o guid dor formulário e o valor a sua descrição.

Parâmetro:
Não possui.

Retorno:
Mapa de formulários onde a chave será o guid do formulário e o valor a descrição dele. (Variante)

Observação:
Os formulários dos componentes Maker 3 não estarão contidos.

### Código Servidor (Java)

```java
protected final Variant ebfGetForms(){
  Map<String, WFRForm> forms = getSystem().getForms();
  java.util.Set<String> keys = forms.keySet();
  java.util.Iterator<String> i = keys.iterator();
  Map<String,String> mapForms = new java.util.TreeMap<String,String>();
  while(i.hasNext()){
    String guid = i.next().toString();
    WFRForm f = forms.get(guid);
    String descricao = f.getDescription();
    if((descricao != null)&&(descricao.indexOf("FORMULARIO_DO_SISTEMA")<0)&& !f.getFormProperties().getBoolean("AUTODEPLOY_FORM")){
      mapForms.put(guid, descricao);
    }  
  }
	  
  return new Variant(mapForms);
}
```

---

## Obter Metadados do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFormMetadata` |
| **Código** | 1147 |
| **Assinatura** | `Obter Metadados do Formulário (Formulário): Variante` |
| **Parâmetros** | Formulário |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna o metadados da consulta de um formulário passado por parâmetro. 

Parâmetro:
1. Formulário.

Retorno:
O retorno é uma lista de lista contendo: (Variante)
 - O nome da tabela (letras);
 - O nome do campo (letras);
 - A descrição do campo de acordo com o dicionário de dados (letras);
 - O tipo do campo (letras);
 - O tamanho do campo (inteiro);
 - A precisão do campo (inteiro);
 - Se o campo é autoincremento (lógico);
 - Se o campo aceita nulo (1 aceita e 0 não aceita);
 - O alias (se existir) ou o nome do campo (letras).

### Código Servidor (Java)

```java
protected final Variant ebfGetFormMetadata(Variant formGUID) throws Exception{
  WFRForm form = client.getSystem().getForm(formGUID.getString(), client.getData().connection()); 
  String nameTable = form.getTable();
  ResultSet rSet = (ResultSet) client.getData().getFormResultSet(form.getGuid());
  List<List<String>> columns = new ArrayList<List<String>>();
  java.sql.ResultSetMetaData rsmd = rSet.getMetaData();
  int columnCount = rsmd.getColumnCount();
  for (int i = 1; i <= columnCount; i++) {
    List<String> currentColumnInfo = new ArrayList<String>();
    String tableName, columnName;
    tableName = rsmd.getTableName(i); // Adiciona o nome da tabela à lista
    if(tableName.equals("")){
      tableName = nameTable;
    }

    currentColumnInfo.add(tableName);
    columnName = rsmd.getColumnName(i); // Adiciona o nome da coluna à lista
    currentColumnInfo.add(columnName);
    if (getSystem().getField(tableName, columnName) != null) { // Adiciona a descrição da coluna de acordo com o dicionário de dados
      currentColumnInfo.add(getSystem().getField(tableName, columnName).getDescription());
    } else {
      currentColumnInfo.add("");
    }

    // Adiciona as informações: ColumnType, DisplaySize, Precision, Scale, AutoIncrement?, Nullable?
    currentColumnInfo.add(rsmd.getColumnTypeName(i).toString());
    currentColumnInfo.add(String.valueOf(rsmd.getPrecision(i)));
    currentColumnInfo.add(String.valueOf(rsmd.getScale(i)));
    currentColumnInfo.add(String.valueOf(rsmd.isAutoIncrement(i)));
    currentColumnInfo.add(String.valueOf(rsmd.isNullable(i)));
    currentColumnInfo.add(rsmd.getColumnLabel(i)); // Adicionar alias ou nome da coluna
    columns.add(currentColumnInfo); // Adiciona as informações a lista principal
  }

  return VariantPool.get(columns);
}
```

---

## Obter Nome dos Componentes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `getAllComponentNames` |
| **Código** | 386 |
| **Assinatura** | `getAllComponentNames(): Lista de Componentes;` |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna uma lista com o nome de todos os componentes presentes na tela onde esta função foi 
chamada.

Parâmetro:
Não possui.

Retorno:
Lista com Nome dos Componentes. (Variante)

Observação:
Caso queira utilizar na camada servidor, escolha a função "Obter Lista de Componentes de um Formulário".

### Código Cliente (JavaScript)

```javascript
function getAllComponentNames() {
  var all = controller.getAllElements();
  var elems = new Array();
  for (var i in all) {
    if (typeof(all[i]) == 'function' || all[i].code == -1 || all[i].code == 0 || all[i].code == undefined || all[i].id == undefined ) continue;
    elems.push(all[i].id);
  }
  return elems;
}
```

---

## Obter Posição X do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetComponenteXPosition` |
| **Código** | 85 |
| **Assinatura** | `Obter Posição X do Componente(Componente): Inteiro` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém e retorna a posição horizontal (X) do componente passado por parâmetro.

Parâmetro:
1. Componente que se deseja obter a posição horizontal (X). 

Retorno: 
Retorna a posição horizontal do componente passado como parâmetro. (Inteiro)

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "formulário" para uma constante do tipo "Letras".

Exemplo:
Em um formulário com um componente "Cidade" cuja posição horizontal é 150, assumindo como parâmetros 
este componente ("Cidade"), o retorno será 150 (Inteiro).

### Código Cliente (JavaScript)

```javascript
function ebfGetComponenteXPosition(componente) {
  var comp = controller.getElementById(componente);
  if (comp) {
    return comp.getX();
  }
}
```

---

## Obter Posição Y do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetComponenteYPosition` |
| **Código** | 86 |
| **Assinatura** | `Obter Posição Y do Componente (Componente): Inteiro` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém e retorna a posição vertical (Y) do componente passado por parâmetro.

Parâmetro:
1. Componente que se deseja obter a posição vertical (Y). (Componente)

Retorno: 
Retorna a posição vertical do componente passado como parâmetro. (Inteiro)

Observações:
1. Para selecionar o componente é necessário indicar o nome do formulário de trabalho no "Início" do fluxo.
2. Caso não queira selecionar o formulário de trabalho, digite o nome do componente mudando a constante do 
tipo "formulário" para uma constante do tipo "Letras".

Exemplo:
Em um formulário com um componente "Cidade" cuja posição vertical é 250, assumindo como parâmetros este 
componente ("Cidade"), o retorno será 250 (Inteiro).

### Código Cliente (JavaScript)

```javascript
function ebfGetComponenteYPosition(componente) {
  var comp = controller.getElementById(componente);
  if (comp) {
    return comp.getY();
  }
}
```

---

## Obter Propriedade do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFormProperty` |
| **Código** | 676 |
| **Assinatura** | `Obter Propriedade do Formulário (Formulário;Letras): Letras` |
| **Parâmetros** | Formulário;Letras |
| **Retorno** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o valor da propriedade do formulário passado como parâmetro.

Parâmetro(s):
1. Formulário.
2. Nome da propriedade. (Letras)

Retorno:
Valor da propriedade. (Letras)

Observação:
O nome da propriedade poderá ser obtido no arquivo XML do formulário. Este arquivo poderá ser encontrado em
..\WEB-INF\classes\wfr\com\systems\system_SIGLA\forms\NOMEDOFORM\NOMEDOFORM.xml

### Código Servidor (Java)

```java
protected final Variant ebfGetFormProperty(Variant formGuid, Variant propertyName) throws Exception {
  if (formGuid != null && formGuid.getString().length() > 0 && propertyName != null && propertyName.getString().length() > 0) {
    WFRForm form = getSystem().getFormByGuid(formGuid.getString());
    if(form == null) {
      form = getSystem().getForm(formGuid.getString(), connection);
    }
    return new Variant(form.getFormProperties().getString(propertyName.getString()));
  }
  return Variant.VARIANT_NULL;
}
```

---

## Obter Tabela do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFormResultset` |
| **Código** | 128 |
| **Assinatura** | `Obter Tabela do Formulário` |
| **Parâmetros** | Formulário |
| **Retorno** | Tabela |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém a tabela vinculada ao formulário passado como parâmetro.

Parâmetro:
1. Formulário. 

Retorno: 
Retorna a tabela vinculada ao formulário escolhido. (Tabela)

### Código Servidor (Java)

```java
protected final Variant ebfGetFormResultset(Variant formGuid) throws Exception {
    WFRForm form = client.getSystem().getFormByGuid(formGuid.getString());
    ResultSet rs = client.getData().getFormResultSet(form.getCodeStr());
    return new Variant(rs);
  }
```

---

## Obter Valor da Lista Dinâmica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormGetLookupName` |
| **Código** | 325 |
| **Assinatura** | `Obter Valor da Lista Dinâmica(Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Função que obtém o valor exibido na lista dinâmica.

Parâmetro(s):
1. Formulário com o componente Lista Dinâmica. 
2. Componente Lista Dinâmica. 

Retorno:
Retorna o valor que estiver no componente. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfFormGetLookupName(form, com){
  try{
    var lk = $c(com);
    var idx = lk.value;
    return lk.showValue;
  }catch(e){
    throw "Não foi possível obter o valor do componente.";
  }
}
```

---

## Obter Valor do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormGetComponentValue` |
| **Código** | 116 |
| **Assinatura** | `Obter Valor do Componente (Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o conteúdo do componente passado no segundo parâmetro e o retorna.

Parâmetro(s):
1. Nome do Formulário. 
2. Nome do Componente. 

Retorno: 
Retorna o conteúdo do componente passado como parâmetro. (Variante)

Observações:
1. Para obter o valor de um componente que se encontra em um Sub Form, deve ser passado o formulário do 
Sub Form como parâmetro.
2. Para obter o valor de um componente que se encontra em outro formulário, utilize a função "Obter Valor do 
Componente do Formulário".
3. Para obter o valor de um componente que se encontra em uma moldura, deve ser utilizada a função 
"Executar Fluxo no Formulário" e apontar para um fluxo que chama esta função.

### Código Cliente (JavaScript)

```javascript
function ebfFormGetComponentValue(form, com) {
  return $c(com, form).getValue();
}
```

---

## Obter Valor do Componente do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLGetFieldFromForm` |
| **Código** | 597 |
| **Assinatura** | `Obter Campo do Formulário (Formulário;Componente) : Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o conteúdo de um componente do formulário principal ou de qualquer outro passado por parâmetro.

Parâmetro(s):
1. Formulário onde está o componente. 
2. Componente do qual se deseja obter o valor. 

Retorno: 
Conteúdo do campo passado como parâmetro. (Variante)

Observações:
1. É necessário que o componente esteja associado a um campo da tabela.
2. Se não for o formulário principal (que chama o fluxo) e o mesmo estiver aberto, o retorno será o conteúdo 
do campo passado naquele registro. Caso o formulário passado não esteja sendo utilizado, o retorno será o primeiro 
registro no banco.
3. Para obter o valor de um componente que se encontra em um Sub Form, deve ser passado o formulário do 
Sub Form como parâmetro.

Exemplos:
1. No formulário "Cadastro" cujo conteúdo do campo "Cidade" é "Salvador", assumindo como parâmetros 
Cadastros (Formulário), "Cidade" (Campo), o retorno será "Salvador".

### Código Servidor (Java)

```java
protected final Variant ebfSQLGetFieldFromForm(Variant vform, Variant vfield) throws Exception {
    WFRComponent com = findComponent(vform.toString(), vfield.toString());
    if (com != null) {
      if (!fields.getForm().getGuid().equals(vform.toString())) {
        ResultSet rs = client.getData().getFormResultSet(com.getForm().getCodeStr());
        if (hasData(rs))
          return VariantPool.get(rs.getObject(com.getField()));
      } else {
        return VariantPool.get(fields.getValue(com.getField()));
      }
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSQLGetFieldFromForm(form, com) {
  return controller.getElementById(com, form).getValue(); 
}
```

---

## Obter Valor do Componente em Outro Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetComponentValueFromOtherForm` |
| **Código** | 621 |
| **Assinatura** | `Obter Valor do Componente em Outro Formulário (Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Função que obtém o valor do componente desejado em qualquer formulário aberto.

Parâmetro(s):
1. Formulário que contém o componente.
2. Componente desejado. 

Retorno:
Conteúdo do campo passado como parâmetro. (Variante)

Observações:
1. Esta função só irá funcionar caso exista algum parentesco entre os formulários.
2. Para obter o valor de um componente que se encontra em um Sub Form, deve ser passado o formulário do Sub 
Form como parâmetro.
3. Quando o formulário se encontra dentro de um componente moldura, deve-se utilizar a função "Executar Fluxo 
no Formulário" apontando para um fluxo que obtêm o valor do componente.

### Código Cliente (JavaScript)

```javascript
function searchFormByGUIDGetComponentValueFromOtherForm(currentForm,GUID){
  if (currentForm && decodeURI(currentForm.formGUID) == GUID){
    return currentForm;
  }

  if (currentForm && currentForm.mainform && decodeURI(currentForm.mainform.formGUID) == GUID){
    return currentForm.mainform;
  }
  if (currentForm.children){
    for (var i=0;i<currentForm.children.length;i++){
      try {
        if (currentForm.children[i].mainform){
          if (decodeURI(currentForm.children[i].mainform.formGUID) == GUID){
            return currentForm.children[i].mainform;
          }
          var returnForm = searchFormByGUIDGetComponentValueFromOtherForm(currentForm.children[i],GUID);
          if (returnForm){
            return returnForm;
          }
        }
      }catch(e){}
    }
  }
}

function searchFloatingFormGet(formGUID) {
  var openFloatingForms, mainFormWindow, i, formIframe, formReference;
  if (isPopup) {
    mainFormWindow = top.opener;    
    if(mainFormWindow){
      while (mainFormWindow.opener) {
        mainFormWindow = mainFormWindow.opener;
      }      
      openFloatingForms = mainFormWindow.mainSystemFrame.document.getElementsByClassName("WFRIframeForm");       
    }
  } else {
    openFloatingForms = mainSystemFrame.document.getElementsByClassName("WFRIframeForm");
  }
  if(openFloatingForms){
    for (i = 0; i < openFloatingForms.length; i++) {
      formIframe = openFloatingForms[i].getElementsByTagName("iframe")[0];
      if (formIframe) {
        formReference = formIframe.contentWindow.mainform;      
        if(formReference){
          if (decodeURI(formReference.formGUID) === formGUID) {
            return formReference;
          }        
        }
      }
    }
  }
}

function searchGUIDFormComponentTabGetValueOtherForm(form){
  var formPrincipal;
  
  if($mainform().mainSystemFrame || top.opener){  
    formPrincipal = $mainform().mainSystemFrame; 
    var formFined = findGUIDFormGetValueOtherForm(formPrincipal, form);
    if(formFined){
      return formFined;
  }else if(top.opener && top.opener.mainSystemFrame){
      formPrincipal = top.opener.mainSystemFrame;
      var formFined = findGUIDFormGetValueOtherForm(formPrincipal, form);
      if(formFined){
        return formFined;
      }		 
   }else if(mainSystemFrame.document.getElementsByTagName("iframe")){
      formPrincipal = mainSystemFrame.document.getElementsByTagName("iframe")[0].contentDocument.getElementsByTagName("iframe"); 
      for(i=0; i < formPrincipal.length; i++){
        try{
          var guidForm = decodeURI(formPrincipal[i].contentWindow.mainform.formGUID);
          if(guidForm !== undefined && guidForm === form){
            return formPrincipal[i].contentWindow.mainform;
          } 
        }catch(e){
         //Devido a algumas URL's não permitirem obter o ContentWindow  
        }          
      }
    }	
  }
}

function findGUIDFormGetValueOtherForm(formP, form){
  if(formP){ 
    var formChildren = formP.children;
    if(formChildren){ 
      for(i=0; i < formChildren.length; i++){    
        if(formChildren[i].isPopup && formChildren[i].mainform){
          var guidForm = decodeURI(formChildren[i].mainform.formGUID);
        }else{
          var guidForm = decodeURI(formChildren[i].formId ? formChildren[i].formId : "");
	    }       
        if(guidForm === form && formChildren[i].mainform){
          return formChildren[i].mainform;
        }
      }	
    if(formP.mainSystemFrame.document.getElementsByTagName("iframe")){
      var findForm = formP.mainSystemFrame.document.getElementsByTagName("iframe")[0].contentDocument.getElementsByTagName("iframe");
      for(i=0; i < findForm.length; i++){
        try{
          var guidForm = decodeURI(findForm[i].contentWindow.mainform.formGUID);
          if(guidForm !== undefined && guidForm === form){
            return findForm[i].contentWindow.mainform;
          }
        }catch(e){
           //Devido a algumas URL's não permitirem obter o ContentWindow
        }  
       }	
    }
    if(formP.mainSystemFrame.document.getElementsByClassName("WFRIframeForm")){
      var openFloatingForms = formP.mainSystemFrame.document.getElementsByClassName("WFRIframeForm");
      for(i=0; i < openFloatingForms.length; i++){
        try{
          var formReference = openFloatingForms[i].children[1].children[1].contentWindow.mainform;
          if(decodeURI(formReference.formGUID) === form){
            return formReference;
          }  
        }catch(e){};
      }         		 
    }	 
    }	
  }  
}

function findInMe (formGUID) {
  var childs = parent.window.children;  
  var form;  
  if(childs) {
    for(i=0; i < childs.length; i++){
      var guid = childs[i].mainform.formGUID;
      if(guid === formGUID) {
        form = childs[i].mainform;       
        break;
      }
    }
  }     
  return form;
}

function ebfGetComponentValueFromOtherForm(formGUID, componentName){
  if (isNullable(formGUID)) {
    throw 'Defina um formulário para obter o valor de um componente!';
  }
  var mainWindow = top;
  while (getOpenerWindow(mainWindow) != null) {
    var openerWindow = getOpenerWindow(mainWindow);
    if (openerWindow.mainform && !isNullable(openerWindow.mainform.sysCode)) {
      mainWindow = openerWindow;
    } else {
      break;
    }
  }  

  var myForm = searchFormByGUIDGetComponentValueFromOtherForm(mainWindow, formGUID);
  if (!myForm) {
    myForm = searchGUIDFormComponentTabGetValueOtherForm(formGUID);
  }
  if (!myForm){
    myForm = searchFloatingFormGet(formGUID);
  }  
  if (!myForm){
    myForm = findInMe(formGUID);
  }
  if (myForm) {
    var component = myForm.controller.getElementById(componentName);
    if (component) {
      return component.getValue();
    } else {
      component = myForm.controller.getElementById(componentName, formGUID);
      if (component) {
        return component.getValue();
      } else {
        throw 'Componente não encontrado para o formulário escolhido!';
      }
    }
  } else {
    throw 'O Formulário cujo componente se deseja obter não está aberto!';
  }
}
```

---

## Obter Variável de Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetClientFormVariable` |
| **Código** | 438 |
| **Assinatura** | `Obter Variável de Formulário(Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Obtêm uma variável de um formulário, definida com a função "Definir Variável de Formulário".

Parâmetro:
1. Nome da variável. (Letras)

Retorno:
Retorna o conteúdo da variável passada no primeiro parâmetro caso ela já exista. Caso ela ainda não tenha sido 
definida, retorna Nulo. (Variante)

Observação: 
Para obter uma variável de formulário é necessário antes definir essa variável utilizando a função "Definir 
variável de formulário".

### Código Cliente (JavaScript)

```javascript
function ebfGetClientFormVariable(name) {
  if (!$mainform().__storage) {
    $mainform().__storage = {};
  }
  return $mainform().__storage[name];
}
```

---

## Obter valor do componente do formulário da moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBevelGetComponentValue` |
| **Código** | 406 |
| **Assinatura** | `Obter valor do componente do formulário da moldura (Formulário;Componente;Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente;Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Retorna o valor de um componente contido em um formulário aberto numa moldura.

Parâmetro(s):
1. Formulário onde se encontra a Moldura. 
2. Nome do Componente Moldura.
3. Formulário que será aberto na Moldura. (Formulário)
4. Componente que será obtido o valor. (Componente)

Retorno:
Valor do componente que se encontra na moldura. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfBevelGetComponentValue(formBevel, bevelName, formComponent, componentName) {
 
  var component = $c(bevelName, formBevel);
  if (component instanceof HTMLGroupBox) {	    
    var iframes = component.div.getElementsByTagName("iframe");      
	if (iframes.length > 0) {
      var iframe = iframes[0];
      var mainform = eval(iframe.id).mainform;
      var elems = mainform.controller.getAllElements();
      for (var i = 0; i < elems.length; i++) {
        var elem = elems[i];
        if (elem.id == componentName) {
          return elem.getValue();
        }
      }
    }
  }
  return null;
}
```

---

## Recarregar Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResetForm` |
| **Código** | 64 |
| **Assinatura** | `Recarregar Formulário(Formulário)` |
| **Parâmetros** | Formulário |
| **Tipo** | Genérica |
| **Compatibilidade** | Banco de Dados |

### Descrição

Recarrega o formulário passado por parâmetro.

Parâmetro:
1. Formulário a ser recarregado.

Retorno: 
Não possui.

Exemplo:
Em um formulário "Pessoa", ao ser chamada a função Recarregar Formulário, todos os campos são atualizados.

Observação:
Esta função não funciona em sistemas publicados (WAR ou JAR).

### Código Servidor (Java)

```java
protected final Variant ebfResetForm(Variant codForm) throws Exception {
  client.getSystem().reloadForm(codForm.toString(), connection);
  return Variant.VARIANT_NULL;
}
```

---

## Remover Botão de Gravar e Gravar+

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveSaveButtons` |
| **Código** | 291 |
| **Assinatura** | `Remover Botão de Gravar e Gravar+ ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Remove os botões de Gravar e Gravar+ do formulário.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
Esta função remove os botões de Gravar e Gravar+ do modo de Inserção/alteração.

### Código Servidor (Java)

```java
protected final Variant ebfRemoveSaveButtons() throws Exception {
  return callClientFunction("ebfRemoveSaveButtons");
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRemoveSaveButtons() {
  var navigation = $mainform().d.n;
   if (navigation) {
    if (navigation.insButtons[0] != null) {
      navigation.insButtons[1].setVisible(false);
      navigation.insButtons[0].setVisible(false);
      navigation.insButtons[1] = null;
      navigation.insButtons[0] = null;
    } else if(navigation.edtButtons[0]!=null) {
      navigation.edtButtons[0].setVisible(false);
      navigation.edtButtons[0] = null;
    }
  }
}
```

---

## Remover Botão de Gravar+

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveSaveMoreButton` |
| **Código** | 313 |
| **Assinatura** | `Remover Botão de Gravar+ ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Remove o botão de Gravar+ do formulário. Este botão é visível quando o formulário se encontra em modo de 
inserção.

Retorno:
Não possui.

Observação:
A função deve ser utilizada no evento ao entrar ou em modo normal do formulário.

### Código Servidor (Java)

```java
protected final Variant ebfRemoveSaveMoreButton() throws Exception {
  return callClientFunction("ebfRemoveSaveMoreButton");
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRemoveSaveMoreButton() {
  var navigation = $mainform().d.n;
  if ((navigation)&&(navigation.insButtons[0] != null)) {
    if((navigation.insButtons[1] != null)&&(navigation.insButtons[2] == null)) {      
      navigation.insButtons[0].setVisible(false);      
      navigation.insButtons[0] = null;
    } else if (navigation.insButtons.length == 3) {
      navigation.insButtons[0].setVisible(false);
      navigation.insButtons[0] = null;
    }
  }
}
```

---

## Remover Botão de Valores Padrão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveDefaultValuesButton` |
| **Código** | 320 |
| **Assinatura** | `Remover Botão de Valores Padrão ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Remove o botão de valores padrão do formulário.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
Esta função deve ser utilizada no evento ao entrar.

### Código Servidor (Java)

```java
protected final Variant ebfRemoveDefaultValuesButton() throws Exception {
  return callClientFunction("ebfRemoveDefaultValuesButton");
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRemoveDefaultValuesButton() {
  var nav = $mainform().d.n;

  if (nav) {
    if (nav.btDefaultValues) { 
      nav.btDefaultValues.div.style.display = "none";
    }
  } 
}
```

---

## Remover Evento Associado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEventRemoveAssociation` |
| **Código** | 71 |
| **Assinatura** | `Remover Evento Associado (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro uma constante do tipo Componente ou Formulário, o nome do evento e retira 
o evento anteriormente associado. A função que associa um evento ao componente é  "Associar Evento" da categoria 
"Formulário".

Parâmetro(s):
1. Constante do tipo Componente ou Formulário.
2. Onclick (Ao Clicar) - Nome do Evento. (Letras)

Retorno:
Não possui.

Observação:
Essa função remove evento associado com a função "Associar Evento".

---

## Remover Vinculo de Parentesco Entre Formulários

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCloseFormWithoutChildren` |
| **Código** | 413 |
| **Assinatura** | `Remover Vinculo de Parentesco Entre Formulários ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Essa função remove o vinculo de parentesco entre os formulários e relatório.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
Esta função pode ser usada no evento ao entrar do formulário pai. Uma vez feito isso, os filhos desse formulário ficarão abertos depois que o formulário pai for fechado ou atualizado.

### Código Cliente (JavaScript)

```javascript
function ebfCloseFormWithoutChildren() {
  closeChildrenForms = false;
}
```

---

## Remover barra de navegação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `removeNavigator` |
| **Código** | 37 |
| **Assinatura** | `Remover barra de navegação ()` |
| **Tipo** | Genérica |
| **Compatibilidade** | Cliente |

### Descrição

Remove a barra de navegação do formulário que chama o fluxo.

Parâmetro:
Não possui.

Retorno: 
Não possui.

Observação:
O navegador que vai ser removido será a do formulário que chama o fluxo.

Exemplo:
Em um formulário que possua barra de navegação, quando essa função for executada esta barra será removida.

### Código Cliente (JavaScript)

```javascript
function removeNavigator() {
  controller.removeNavigator();
}
```

---

# Funções Nativas - Navegação

Total: **19** funções

[← Voltar para Funções Nativas](README.md)

---

## Atualizar Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRefreshForm` |
| **Código** | 130 |
| **Assinatura** | `Atualizar Formulário` |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função atualiza o formulário onde está o evento.

Parâmetro:
Não possui.

Retorno: 
Não possui.

Observações:
1. Se essa função for executada antes de salvar alterações feitas no formulário, estas serão perdidas, pois a 
essa função traz os dados existentes no banco.
2. Esta função pergunta ao usuário se deseja atualizar o registro corrente ou todo o formulário.

### Código Servidor (Java)

```java
protected final Variant ebfRefreshForm() throws Exception {
    client.executeJavascript("$mainform().d.n.actRefresh()");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRefreshForm() {
  $mainform().d.n.actRefresh();
}
```

---

## Atualizar Registro Corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavRefreshCurrentRecord` |
| **Código** | 192 |
| **Assinatura** | `Atualizar Registro Corrente ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Atualiza o registro corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso desta função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavRefreshCurrentRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavRefreshCurrentRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavRefreshCurrentRecord() {
  var nav = $mainform().d.n;
  if (nav) {  
    nav.execAjaxEval("refresh");
  }
}
```

---

## Cancelar Modo de Edição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavEditCancel` |
| **Código** | 196 |
| **Assinatura** | `Cancelar Modo de Edição ()` |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Cancela o modo de edição de um registro.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso desta função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavEditCancel() throws Exception {
    return callClientFunction("ebfNavEditCancel");
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavEditCancel() {
  var nav = $mainform().d.n;
  if (nav) {
    nav.timeout(nav.actEditCancel, 0);
  }
}
```

---

## Cancelar Modo de Inclusão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavIncludeCancel` |
| **Código** | 197 |
| **Assinatura** | `Cancelar Modo de Inclusão ()` |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Cancela o modo de inclusão de um registro.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso desta função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavIncludeCancel() throws Exception {
    return callClientFunction("ebfNavIncludeCancel");
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavIncludeCancel() {
  var nav = $mainform().d.n;
  if (nav) {
    nav.timeout(nav.actIncludeCancel, 0);
  }
}
```

---

## Gravar Alterações Registro Corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavEditSaveRecord` |
| **Código** | 193 |
| **Assinatura** | `Gravar Alterações Registro Corrente ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Salva o registro corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso desta função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavEditSaveRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavEditSaveRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavEditSaveRecord() {
  var nav = $mainform().d.n;
  if (nav) {  
    if(nav.actEditSaveSync)
      nav.actEditSaveSync();
    else
      nav.actEditSave();
  }
}
```

---

## Gravar Alterações Registro Corrente Assíncrono

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavEditSaveRecordAsync` |
| **Código** | 483 |
| **Assinatura** | `Gravar Alterações Registro Corrente Assíncrono ()` |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Salva o registro corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. O uso desta função tem uma melhor performance quando usada em regras clientes.
2. Utilizar quando existir um fluxo associado ao evento "Depois de Alterar" e este fluxo receba como parâmetros valores dos componentes.

### Código Servidor (Java)

```java
protected final Variant ebfNavEditSaveRecordAsync() throws Exception {
    client.executeJavascript("$mainform().ebfNavEditSaveRecordAsync();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavEditSaveRecordAsync() {
  var nav = $mainform().d.n;
  if (nav) {  
    nav.actEditSave();
  }
}
```

---

## Guia Anterior

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormPreviousTab` |
| **Código** | 198 |
| **Assinatura** | `Guia Anterior ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Permuta entre a aba corrente para a anterior.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso desta função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfFormPreviousTab() throws Exception {
  client.executeJavascript("$mainform().ebfFormPreviousTab();");
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormPreviousTab() {
  var tabController = $mainform().d.t;
  if (tabController) {
    tabController.isCallFunction = true;  
    tabController.openPreviousTab(true);    
    tabController.isCallFunction = false;
  }
}
```

---

## Incluir Dados Registro Corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavIncludeSaveRecord` |
| **Código** | 194 |
| **Assinatura** | `Incluir Dados Registro Corrente ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Inclui os dados como um novo registro no banco.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. O uso desta função tem uma melhor performance quando usada em regras clientes.
2. Caso ocorra um erro durante a inserção dos dados no banco, não é possível capturar a exceção com as funções
try/catch, pois a função simula a gravação de um registro que está sendo editado e, em seguida, gravado no formulário.
Caso deseje tratar as exceções, deve ser utilizada a função "Executar Atualização".

### Código Servidor (Java)

```java
protected final Variant ebfNavIncludeSaveRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavIncludeSaveRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavIncludeSaveRecord() {
  var nav = $mainform().d.n;
  if (nav) {
    if(nav.actIncludeSaveSync)
      nav.actIncludeSaveSync();
    else
      nav.actIncludeSave();
  }
}
```

---

## Incluir Dados Registro Corrente (+)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavIncludeMoreSaveRecord` |
| **Código** | 195 |
| **Assinatura** | `Incluir Dados Registro Corrente (+) ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Inclui os dados como um novo registro no banco e fica novamente em modo de inserção para um novo cadastro.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso desta função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavIncludeMoreSaveRecord() throws Exception {
    return callClientFunction("ebfNavIncludeMoreSaveRecord");
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavIncludeMoreSaveRecord() {
  var nav = $mainform().d.n;
  if (nav) {
    if(nav.actIncludeSaveMoreSync) {
      try {
        nav.actIncludeSaveMoreSync();
      } finally {
        hideWait();
      }
    } else {
      nav.actIncludeSaveMore();
    }
  }
}
```

---

## Incluir Dados Registro Corrente (+) Assíncrono

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavIncludeMoreSaveRecordAsync` |
| **Código** | 482 |
| **Assinatura** | `Incluir Dados Registro Corrente (+) Assíncrono ()` |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Inclui os dados como um novo registro no banco e fica novamente em modo de inserção para um novo cadastro.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. O uso desta função tem uma melhor performance quando usada em regras clientes.
2. Utilizar quando existir um fluxo associado ao evento "Depois de Inserir" e este fluxo receba como parâmetros valores dos componentes.

### Código Servidor (Java)

```java
protected final Variant ebfNavIncludeMoreSaveRecordAsync() throws Exception {
    return callClientFunction("ebfNavIncludeMoreSaveRecordAsync");
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavIncludeMoreSaveRecordAsync() {
  var nav = $mainform().d.n;
  if (nav) {
    nav.actIncludeSaveMore();
  }
}
```

---

## Incluir Dados Registro Corrente Assíncrono

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavIncludeSaveRecordAsync` |
| **Código** | 481 |
| **Assinatura** | `Incluir Dados Registro Corrente Assíncrono ()` |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Inclui os dados como um novo registro no banco.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. O uso desta função tem uma melhor performance quando usada em regras clientes.
2. Caso ocorra um erro durante a inserção dos dados no banco, não é possível capturar a exceção com as funções
try/catch, pois a função simula a gravação de um registro que está sendo editado e, em seguida, gravado no formulário.
Caso deseje tratar as exceções, deve ser utilizada a função "Executar Atualização".
3. Utilizar quando existir um fluxo associado ao evento "Depois de Inserir" e este fluxo receba como parâmetros valores dos componentes.

### Código Servidor (Java)

```java
protected final Variant ebfNavIncludeSaveRecordAsync() throws Exception {
    client.executeJavascript("$mainform().ebfNavIncludeSaveRecordAsync();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavIncludeSaveRecordAsync() {
  var nav = $mainform().d.n;
  if (nav) {
      nav.actIncludeSave();
  }
}
```

---

## Ir Para Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavGotoRecord` |
| **Código** | 190 |
| **Assinatura** | `Ir Para Registro (Inteiro)` |
| **Parâmetros** | Inteiro |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Vai para o registro definido no parâmetro.

Parâmetro:
1. Posição do registro. (Inteiro)

Retorno: 
Não possui.

Observação:
O uso dessa função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavGotoRecord(Variant value) throws Exception {
    client.executeJavascript("$mainform().ebfNavGotoRecord(" + value.getLong() + ");");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavGotoRecord(value) {
  var nav = $mainform().d.n;
  if (nav) {  
    if(nav.actGotoSync)
      nav.actGotoSync(value);
    else
      nav.actGoto(value);
  }
}
```

---

## Navegação - Adicionar Botão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavigationFormAddButton` |
| **Código** | 953 |
| **Assinatura** | `Navegação - Adicionar Botão (Letras;Letras;Letras;Variante;Inteiro)` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Inteiro |
| **Tipo** | 16 |
| **Compatibilidade** | Cliente |

### Descrição

Função que permite que um novo botão seja adicionado na barra de navegação.

Parâmetro(s):
1. Nome da imagem que deverá aparecer. (Letras) 
2. Descrição (Hint) que deverá aparecer. (Letras)
3. Nome da regra (Fluxo) que será executada ao se clicar no botão. (Letras) (Ver observação 1)
4. Lista de parâmetros para execução da função. (Variante)
5. Largura da Imagem. (Inteiro)

Retorno:
Não possui.

Observações:
1. No 3º Parâmetro a regra deverá ser do tipo cliente.
2. Ao posicionar o mouse sobre a imagem, é necessário que haja outra com o mesmo nome da primeira mais '_over' para reproduzir o efeito de destaque neste evento.
Ex.: Nome da imagem : "enviar_email.gif"
       Imagem necessária: "enviar_email_over.gif"
3. A imagem deverá ser colocada no diretório "assets/icons" no contexto utilizado.

### Código Cliente (JavaScript)

```javascript
function ebfNavigationFormAddButton(img, caption, func, params, size){
  if(!size){
    size = 40;
  }
  func = reduceVariable(func, false);
  d.n.addMainButton("assets/icons/"+img, caption, function(){executeJSRule(ebfGetSystemID(), ebfGetFormID(), func, params)}, size);  
}
```

---

## Primeiro Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavFirstRecord` |
| **Código** | 185 |
| **Assinatura** | `Primeiro Registro ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Vai para o primeiro registro do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso dessa função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavFirstRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavFirstRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavFirstRecord() {
  var nav = $mainform().d.n;
  if (nav) {
   if(nav.actFirstSync)	
     nav.actFirstSync();
   else
     nav.actFirst(); 
  }
}
```

---

## Próxima Guia

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormNextTab` |
| **Código** | 199 |
| **Assinatura** | `Próxima Guia ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Vai para a guia seguinte à corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso dessa função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfFormNextTab() throws Exception {
  client.executeJavascript("$mainform().ebfFormNextTab();");
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFormNextTab() {
  var tabController = $mainform().d.t;
  if (tabController) {
    tabController.isCallFunction = true;  
    tabController.openNextTab(true);    
    tabController.isCallFunction = false;
  }
}
```

---

## Próximo Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavNextRecord` |
| **Código** | 187 |
| **Assinatura** | `Próximo Registro ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Vai para o próximo registro do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso dessa função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavNextRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavNextRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavNextRecord() {
  var nav = $mainform().d.n;
  if (nav) {  
    if(nav.actNextSync)
      nav.actNextSync();
    else
      nav.actNext();
  }
}
```

---

## Registro Anterior

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavPreviousRecord` |
| **Código** | 186 |
| **Assinatura** | `Registro Anterior ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Vai para o registro anterior do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso dessa função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavPreviousRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavPreviousRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavPreviousRecord() {
  var nav = $mainform().d.n;
  if (nav) {
    if(nav.actPreviousSync) 
      nav.actPreviousSync();
    else
      nav.actPrevious();      
  }
}
```

---

## Remover Registro Corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavDeleteCurrentRecord` |
| **Código** | 189 |
| **Assinatura** | `Remover Registro Corrente ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Remove o registro atual do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O uso dessa função tem uma melhor performance quando usada em regras clientes.

### Código Servidor (Java)

```java
protected final Variant ebfNavDeleteCurrentRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavDeleteCurrentRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavDeleteCurrentRecord() {
  var nav = $mainform().d.n;
  if (nav) { 
    if(nav.actDeleteSync)
      nav.actDeleteSync();
    else 
      nav.actDelete();
  }
}
```

---

## Último Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNavLastRecord` |
| **Código** | 188 |
| **Assinatura** | `Último Registro ()` |
| **Tipo** | 16 |
| **Compatibilidade** | * |

### Descrição

Vai para o último registro do formulário corrente.

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. O uso dessa função tem uma melhor performance quando usada em regras clientes.
2. Esta função ao ser executada no evento ao entrar de um formulário, corre o risco do form ainda está carregando e a
função ocasionar um erro, pois se trata de um processo assíncrono. Para evitar tal problema, agende a execução do fluxo.

### Código Servidor (Java)

```java
protected final Variant ebfNavLastRecord() throws Exception {
    client.executeJavascript("$mainform().ebfNavLastRecord();");
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNavLastRecord() {
  var nav = $mainform().d.n;
  if (nav) {  
    if(nav.actLastSync) 
      nav.actLastSync();
    else
      nav.actLast();
  }
}
```

---

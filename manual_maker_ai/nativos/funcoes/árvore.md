# Funções Nativas - Árvore

Total: **24** funções

[← Voltar para Funções Nativas](README.md)

---

## Árvore - Adicionar Filho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAddChild` |
| **Código** | 176 |
| **Assinatura** | `Árvore - Adicionar Filho (Variante;Variante;Letras): Letras` |
| **Parâmetros** | Variante;Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Adiciona um filho ao elemento passado por parâmetro.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento pai. (Variante)
3. Descrição do filho que será adicionado. (Letras)

Retorno: 
Elemento que foi adicionado como filho. (Variante)

Exemplo: 
Para adicionar um filho com a descrição "Módulo" ao elemento cuja referência está armazenada na variável "Elemento" e assumindo que esse elemento pertence à árvore que está na variável "Árvore", os parâmetros seriam "Árvore", "Elemento", "Módulo". Armazenar o retorno na variável "Filho".

### Código Cliente (JavaScript)

```javascript
function ebfAddChild(tree,parentElement, description){	
  return tree.addChild(parentElement,description);	
}
```

---

## Árvore - Adicionar Informações ao Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeSetElementDBInfo` |
| **Código** | 248 |
| **Assinatura** | `Adicionar Informações ao Elemento(Variante,Variante,Letras)` |
| **Parâmetros** | Variante;Variante;Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Adiciona informações ao elemento.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento. (Variante)
3. Lista de Informações Adicionais. (Variante)

Retorno:
Não possui.

Exemplo: 
Assumindo os parâmetros como uma "Árvore",  o "Elemento" e uma "Lista" com informações adicionais, esta será atribuída ao Elemento. Podendo ser obtida com a função Árvore - Obter Informações do Elemento.

### Código Cliente (JavaScript)

```javascript
function ebfTreeSetElementDBInfo(tree,element,arrInfo){	
  tree.setElementDBInfo(element,arrInfo);	
}
```

### Código Banco de Dados

```sql
ZnVuY3Rpb24gZWJmVHJlZVNldEVsZW1lbnREQkluZm8odHJlZSxlbGVtZW50LGFyckluZm8pewkNCiAgdHJlZS5zZXRFbGVtZW50REJJbmZvKGVsZW1lbnQsYXJySW5mbyk7CQ0KfQ==
```

---

## Árvore - Alterar Borda

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeChangeBorder` |
| **Código** | 247 |
| **Assinatura** | `Árvore - Mostrar Borda(Variante,Inteiro)` |
| **Parâmetros** | Variante;Inteiro;Cor |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Altera borda da árvore.

Parâmetro(s):
1. Árvore. (Variante)
2. Tamanho da borda (pixel). (Inteiro)
3. Cor.

Retorno:
Não possui.

Exemplo: 
Assumindo os parâmetros como "Árvore", "2" e a cor azul. Será criada uma borda em volta da árvore de 2 pixels de largura e de cor azul.

### Código Cliente (JavaScript)

```javascript
function ebfTreeChangeBorder(tree,borderSize,color) {
  tree.otherDiv.style.border = borderSize + "px solid " + color;
}
```

### Código Banco de Dados

```sql
ZnVuY3Rpb24gZWJmVHJlZUNoYW5nZUJvcmRlcih0cmVlLGJvcmRlclNpemUsY29sb3IpIHsNCiAgdHJlZS5vdGhlckRpdi5zdHlsZS5ib3JkZXIgPSBib3JkZXJTaXplICsgInB4IHNvbGlkICIgKyBjb2xvcjsNCn0=
```

---

## Árvore - Alterar Fonte

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetFontStyle` |
| **Código** | 173 |
| **Assinatura** | `Alterar Fonte(Variante,Letras,Inteiro,Letras)` |
| **Parâmetros** | Variante;Letras;Inteiro;Letras |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Altera o tipo, tamanho e cor da fonte dos elementos da árvore.

Parâmetro(s):
1. Árvore. (Variante)
2. Tipo de Letra. (Letras)
3. Tamanho da Fonte. (Inteiro)
4. Cor da Fonte. (Letras)

Retorno:
Não possui.

Observação:
A árvore pode ser obtida através da função "Obter Componente" da categoria Formulário.

Exemplo: 
Assumindo como parâmetros a árvore, "arial black",  "12" e "#666600", a fonte dos elementos da árvore irá alterar para o tipo e tamanho passado por parâmetro e a cor da fonte será vermelha.

### Código Cliente (JavaScript)

```javascript
function ebfSetFontStyle(tree,font,size,color) {
  tree.font = font;
  tree.size = size;
  tree.color = color;
  tree.setFontStyle();		
}
```

---

## Árvore - Alterar Ícone

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeSetIcon` |
| **Código** | 637 |
| **Assinatura** | `Árvore - Alterar Ícone (Variante;Variante;Letras)` |
| **Parâmetros** | Variante;Variante;Letras |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Altera o ícone da árvore.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento. (Variante)
3. Nome do arquivo imagem. (Letras)

Retorno:
Não possui.

Observação:
A função irá sempre buscar a imagem a partir do diretório Skin definido na propriedade "Skin" da área de trabalho do 
Maker. Caso não haja um Skin definido, será buscado no diretório padrão ("Skins/Default/").

### Código Cliente (JavaScript)

```javascript
function ebfTreeSetIcon(tree, element, iconFile) {	
  tree.setIcon(element, iconFile);	
}
```

---

## Árvore - Altura dos ícones

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetIconsHeight` |
| **Código** | 172 |
| **Assinatura** | `Altura dos Ícones(Variante,Número)` |
| **Parâmetros** | Variante;Número |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Altera a altura dos ícones da árvore para a passada por parâmetro.

Parâmetro(s):
1. Árvore. (Variante)
2. Nova altura dos ícones. (Inteiro)

Retorno:
Não possui.

Observação:
A árvore pode ser obtida através da função "Obter Componente" da categoria Formulário.

Exemplo:
Assumindo como parâmetros a referência para a árvore e 20, a altura dos ícones será alterada para 20.

### Código Cliente (JavaScript)

```javascript
function ebfSetIconsHeight(tree,height){	
  tree.setIconsHeight(height);	
}
```

---

## Árvore - Associar Regra ao Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAssociateRuletoElement` |
| **Código** | 175 |
| **Assinatura** | `Associar Regra ao Elemento(Variante,Variante,Letras,Variante)` |
| **Parâmetros** | Variante;Variante;Letras;Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Associa uma regra ao clicar no elemento passado por parâmetro.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento. (Variante)
3. Nome da regra que será associada. (Letras)
4. Lista de parâmetros que serão enviados para a regra. (Variante)

Retorno:
Não possui.

Observações:
1. Os parâmetros deverão ser passados por uma lista de valores.
2. Essa função só pode chamar regras clientes.

Exemplo:
Supondo que a regra "Imprimir"  mostra na tela a soma dos números passados por parâmetro e assumindo os 
parâmetros como Árvore, Elemento, "Imprimir", [5,6], será mostrado na tela o valor 11.

### Código Cliente (JavaScript)

```javascript
function ebfAssociateRuletoElement(tree, element, ruleName, ruleParams){
  tree.associateRuleToElement(element, ruleName, ruleParams);	
}
```

---

## Árvore - Contrair Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeviewElementClose` |
| **Código** | 636 |
| **Assinatura** | `Árvore - Contrair Elemento (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Contrai o elemento da árvore passado como parâmetro.

Parâmetro:
1. Elemento da Árvore. (Variante)

Retorno:
Não possui.

Observação: 
Para que a função funcione corretamente a propriedade ""Carga Postergada"  deve está desativada.

### Código Cliente (JavaScript)

```javascript
function ebfTreeviewElementClose(element) {
  if (element) {
    element.close();  
  }  
}
```

---

## Árvore - Contrair Todos os Nós

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeviewCollapseAll` |
| **Código** | 424 |
| **Assinatura** | `Árvore - Contrair Tudo (Formulário, Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Contrai todos os nós da árvore.

Parâmetro(s):
1. Formulário que contém a árvore.
2. Componente Árvore.

Retorno:
Não possui.

Observação: 
Para que a função funcione corretamente a propriedade "Carga Postergada"  deve está desativada.

### Código Servidor (Java)

```java
protected final Variant ebfTreeviewCollapseAll(Variant formName, Variant componentName) throws Exception {
  return callClientFunction("ebfTreeviewCollapseAll", formName, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfTreeviewCollapseElement(element, isRoot) {
  if (isNullable(element)) {  
    return;
  }  
  if (!isNullable(element._children)) {
    if (!isRoot && element._children.length > 0) {    
      element.close();
    }
    for (var i = 0; i < element._children.length; i++) {
      ebfTreeviewCollapseElement(element._children[i]);
    }
  }  
}

function ebfTreeviewCollapseAll(formName, componentName) {
  var component = $c(componentName);  
  if (component instanceof HTMLTreeview) {  
    component.tree.autoCollapse = false;    
    ebfTreeviewCollapseElement(component.getRoot(), true);
  }
}
```

---

## Árvore - Criar Árvore

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateTreeView` |
| **Código** | 170 |
| **Assinatura** | `Cria Árvore(Letras,Letras,Inteiro,Inteiro,Inteiro,Inteiro):Variante` |
| **Parâmetros** | Letras;Letras;Inteiro;Inteiro;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Cria uma árvore na aba passada por parâmetro, na posição e tamanho especificados.

Parâmetro(s):
1. Nome da Árvore. (Letras)
2. Nome da aba do formulário onde será adicionada a árvore. (Letras)
3. Posição x. (Inteiro)
4. Posição y. (Inteiro)
5. Tamanho. (Inteiro)
6. Altura. (Inteiro)

Retorno: 
Árvore Criada. (Variante)

Observação:
É obrigatório a existência de pelo menos um componente no formulário no qual será criada a árvore.

Exemplo: 
Assumindo os parâmetros como "Projetos" (Letras), "Visualização" (Letras), 100 (Inteiro), 100 (Inteiro), 250 (Inteiro) e 250 (Inteiro), será criada uma árvore de nome "projetos", na aba "Visualização" do formulário, na posição x=100 e y=100, com 250 de tamanho e de altura.

### Código Cliente (JavaScript)

```javascript
function getCodComponent (){
  var components = $mainform().controller.getTabElements(parent.mainform.d.t);
  var max_cod = 0;
  for(var i = 0; i < components.length; i++) { 
    max_cod = Math.max(max_cod, components[i].getCode());
  }   
   var generatedCode = parseInt(''+ parseInt((parseInt(9) * Math.random()))
                                +''+parseInt((parseInt(9) * Math.random()))
                                +''+parseInt((parseInt(9) * Math.random()))
                                +''+parseInt((parseInt(9) * Math.random()))
                                +''+parseInt((parseInt(9) * Math.random()))
                                +''+parseInt((parseInt(9) * Math.random()))
                      );
  
  return generatedCode + max_cod;
}
function ebfCreateTreeView(value, tab, posx, posy, width, height){	
  var code = getCodComponent();
  tree = new HTMLTreeview(sysCode,idForm,code,posx,posy,width,height,value);
  tree.design(mainform.d.t.getDiv(tab), true);
  tree.show();	
  return tree;	
}
```

---

## Árvore - Esconder Árvore

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHideTree` |
| **Código** | 252 |
| **Assinatura** | `Esconder Árvore(Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Esconde a árvore passada por parâmetro.

Parâmetro:
1. Variável onde está guardada a referência para a árvore.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHideTree(tree){	
  return tree.hideTree();		
}
```

---

## Árvore - Expandir Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeviewElementExpand` |
| **Código** | 1186 |
| **Assinatura** | `Árvore - Expandir Elemento (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Parâmetro:
1. Elemento da Árvore. (Variante)

Retorno:
Não possui.

Observação: 
Para que a função funcione corretamente a propriedade ""Carga Postergada"  deve está desativada.

### Código Cliente (JavaScript)

```javascript
function ebfTreeviewElementExpand(element) {
  if (element) {
    element.open();  
  }  
}
```

---

## Árvore - Expandir Todos os Nós

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeviewExpandAll` |
| **Código** | 534 |
| **Assinatura** | `Árvore - Expandir Tudo (Formulário, Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Expande todos os nós da árvore.

Parâmetro(s):
1. Formulário que contém a árvore.
2. Componente Árvore.

Retorno:
Não possui.

Observação: 
Para que a função funcione corretamente a propriedade "Carga Postergada" deve está desativada.

### Código Servidor (Java)

```java
protected final Variant ebfTreeviewExpandAll(Variant formName, Variant componentName) throws Exception {
  return callClientFunction("ebfTreeviewExpandAll", formName, componentName);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfTreeviewExpandElement(element, isRoot) {
  if (isNullable(element)) {  
    return;
  } 
  if (!isNullable(element._children)) {
    for (var i = 0; i < element._children.length; i++) {
      ebfTreeviewExpandElement(element._children[i]);
    }
    if (!isRoot && element._children.length > 0) {    
      element.open();
    }    
  }
}

function ebfTreeviewExpandAll(formName, componentName) {
  var component = $c(componentName);  
  if (component instanceof HTMLTreeview) {  
    component.tree.autoCollapse = false;    
    ebfTreeviewExpandElement(component.getRoot(), true);
  }
}
```

---

## Árvore - Filtrar Árvore

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeviewFilter` |
| **Código** | 384 |
| **Assinatura** | `Árvore - Filtrar Árvore(Componente, Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Filtra a árvore de acordo com a palavra-chave passada.

Parâmetro(s):
1. Componente Árvore.
2. Filtro. (Letras)

Retorno:
Não possui.

Observações:
1. Somente são considerados no filtro, os elementos Raízes.
2. O filtro ocorre de acordo com a descrição dos elementos e não pelo campo-chave.

### Código Servidor (Java)

```java
protected final Variant ebfTreeviewFilter(Variant com, Variant filter) throws Exception {
    return callClientFunction("ebfTreeviewFilter", com, filter);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfTreeviewFilter(com, filter) {
  $c(com).filter(filter);
}
```

---

## Árvore - Mostrar Árvore

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfShowTree` |
| **Código** | 179 |
| **Assinatura** | `Árvore - Mostrar Árvore(Variante,Lógico)` |
| **Parâmetros** | Variante;Lógico |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Mostra a Árvore.

Parâmetro(s):
1. Árvore. (Variante)
2. Valor Lógico. (Lógico)

Retorno:
Não possui.

Exemplo: 
Assumindo os parâmetros como "Árvore" (Variante) e "False" (Lógico). Então a árvore será escondida. Caso o valor 
lógico seja "True", a árvore aparecerá.

### Código Cliente (JavaScript)

```javascript
function ebfShowTree(tree,view){	
  if (view)
    tree.showTree();
  else
    tree.hideTree();		
}
```

### Código Banco de Dados

```sql
ZnVuY3Rpb24gZWJmU2hvd1RyZWUodHJlZSx2aWV3KXsJDQogIGlmICh2aWV3KQ0KICAgIHRyZWUuc2hvd1RyZWUoKTsNCiAgZWxzZQ0KICAgIHRyZWUuaGlkZVRyZWUoKTsJCQ0KfQ==
```

---

## Árvore - Obter Chave do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeGetElementKey` |
| **Código** | 338 |
| **Assinatura** | `Árvore - Obter Chave do Elemento(Variante;Variante) : Variante` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna a chave do elemento passado como parâmetro.

Parâmetro(s):
1. Árvore na qual o elemento se encontra. (Variante)
2. Elemento desejado. (Variante)

Retorno:
Chave do elemento. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfTreeGetElementKey(tree, element){

  if(!tree)
    throw "O objeto árvore não foi definido";
  if(! (tree instanceof HTMLTreeview) )
    throw "O objeto passado não é do tipo Árvore";
  if(!element)
    throw "O objeto passado não é um elemento de uma árvore";

  try {
    var key = tree.getElementDBInfo(element).chave;
    //var key = tree.getElementById(element);
    return key;
    
  } catch(e){
    throw e;
  }
  
  return -1;
}
```

---

## Árvore - Obter Elemento Ativo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetActiveElement` |
| **Código** | 174 |
| **Assinatura** | `Obter Elemento Ativo(Variante):Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o elemento da árvore que está ativo no momento.

Parâmetro:
1. Árvore. (Variante) (Ver observação 2)

Retorno:  
Elemento da árvore que está ativo. (Variante)

Observações:
1. Caso não haja objeto ativo, será retornado "false".
2. A árvore pode ser obtida através da função "Obter Componente" da categoria Formulário.

### Código Cliente (JavaScript)

```javascript
function ebfGetActiveElement(tree){	
  return tree.getActiveElement();	
}
```

---

## Árvore - Obter Elemento HTML a partir do Nó

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetElementIdByReference` |
| **Código** | 926 |
| **Assinatura** | `Árvore - Obter Elemento HTML a partir do Nó (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém o elemento HTML a partir do nó passado como parâmetro.

Parâmetro:
1. Elemento da Árvore. (Variante)

Retorno:
Elemento HTML do elemento. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGetElementIdByReference(elementVar) {
  if (elementVar) return elementVar.div;
}
```

---

## Árvore - Obter Elemento Pelo ID

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeGetElementById` |
| **Código** | 339 |
| **Assinatura** | `Árvore - Obter Elemento Pelo ID(Variante;Inteiro) : Variante` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna um elemento da árvore a partir do seu ID.

Parâmetro(s):
1. Árvore na qual o elemento se encontra. (Variante)
2. ID do elemento desejado. (Variante)

Retorno:
Referência do elemento. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfTreeGetElementById(tree, id){
  if(!tree)
    throw "O objeto árvore não foi definido!";
  if(! (tree instanceof HTMLTreeview) )
    throw "O objeto passado não é do tipo Árvore!";
    
  if(!id)
    throw "O ID do elemento desejado não pode ser nulo!";
    
  return tree.getElement(id);  
}
```

---

## Árvore - Obter Informações do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeGetElementDBInfo` |
| **Código** | 246 |
| **Assinatura** | `Obter Informações do Elemento(Variante,Variante)` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Obter Informações do Elemento.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento. (Variante)

Retorno:
Informação do elemento. (Letras)

Exemplo: 
Assumindo os parâmetros como "Árvore" (Variante), "Elemento" (Variante). Caso haja alguma informação sobre o elemento passado por parâmetro, ela será retornada para uma variável do tipo Letras.

### Código Cliente (JavaScript)

```javascript
function ebfTreeGetElementDBInfo(tree,element){	
  return tree.getElementDBInfo(element);	
}
```

### Código Banco de Dados

```sql
ZnVuY3Rpb24gZWJmVHJlZUdldEVsZW1lbnREQkluZm8odHJlZSxlbGVtZW50KXsJDQogIHJldHVybiB0cmVlLmdldEVsZW1lbnREQkluZm8oZWxlbWVudCk7CQ0KCQ0KfQ==
```

---

## Árvore - Obter Nome do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTreeGetElementDesc` |
| **Código** | 315 |
| **Assinatura** | `Árvore - Obter Nome do Elemento(Variante;Variante) : Variante` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o nome do Elemento passado como parâmetro.

Parâmetro(s):
1. Árvore. (Variante)
2. Referência do Elemento. (Variante)

Retorno:
Nome do elemento. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfTreeGetElementDesc(tree, element){

  if(!tree)
    throw "O objeto árvore não foi definido";
  if(! (tree instanceof HTMLTreeview) )
    throw "O objeto passado não é do tipo Árvore";
  if(!element)
    throw "O objeto passado não é um elemento de uma árvore";

  try {
    return element.caption;
   
    
  } catch(e){
    throw e;
  }
  
  return -1;
}
```

---

## Árvore - Obter Raiz da Árvore

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetRoot` |
| **Código** | 171 |
| **Assinatura** | `Obter Raiz da Árvore(Variante):Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o elemento raiz da árvore passada por parâmetro.

Parâmetro:
1. Árvore. (Variante)

Retorno:  
Raiz da árvore. (Variante)

Observação:
A árvore pode ser obtida através da função "Obter Componente" da categoria Formulário.

### Código Cliente (JavaScript)

```javascript
function ebfGetRoot(tree){	
  return tree.getRoot();	
}
```

---

## Árvore - Remover Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveELement` |
| **Código** | 177 |
| **Assinatura** | `Remover Elemento(Variante,Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Remove o elemento passado por parâmetro.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento que será removido. (Variante)

Retorno:
Não possui.

Exemplo:
Para remover o elemento que está na variável "Elemento" e pertence à árvore cuja referência está armazenada na 
variável "Árvore", deverão ser passados os parâmetros "Árvore" e "Elemento".

### Código Cliente (JavaScript)

```javascript
function ebfRemoveELement(tree,element){	
  tree.removeElement(element);	
}
```

---

## Árvore - Remover todos os filhos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveAllChildsOf` |
| **Código** | 178 |
| **Assinatura** | `Remover todos os filhos(Variante,Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | 20 |
| **Compatibilidade** | Cliente |

### Descrição

Remove todos os filhos do elemento passado por parâmetro.

Parâmetro(s):
1. Árvore. (Variante)
2. Elemento do qual serão removidos os filhos. (Variante)

Retorno:
Não possui.

Exemplo:
Para remover todos os filhos do elemento que está na variável "Elemento" e pertence à árvore cuja referência está 
armazenada na variável "Árvore", deverão ser passados os parâmetros "Árvore" e "Elemento".

### Código Cliente (JavaScript)

```javascript
function ebfRemoveAllChildsOf(tree,element){	
  return tree.removeAllChildsOf(element);	
}
```

---

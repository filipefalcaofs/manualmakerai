# Funções Nativas - Lista

Total: **11** funções

[← Voltar para Funções Nativas](README.md)

---

## Criar Objeto Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfListCreate` |
| **Código** | 20 |
| **Assinatura** | `Criar Objeto Lista():Variante` |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função cria uma lista vazia.

Parâmetro:
Não possui.

Retorno: 
Lista vazia. (Variante)

Observações: 
1. Para inserir elemento na lista é necessária a utilização de outras funções da categoria lista.
2. Não há suporte para passagem de parâmetro de uma lista criada na camada "Cliente" para a camada "Servidor"; a
ação contrária é suportada.
3. Caso queira criar uma lista já definindo valores, utilize a função Criar lista a partir dos Elementos.

### Código Servidor (Java)

```java
protected final Variant ebfListCreate() throws Exception {
    return VariantPool.get(new ArrayList());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfListCreate() {
  return new Array();
}
```

---

## Criar lista a partir dos Elementos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfListParamsCreate` |
| **Código** | 96 |
| **Assinatura** | `Criar lista a partir dos parâmetros(Variante...):Lista` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função cria uma lista com todos os valores que foram passados pelos parâmetros.

Parâmetro(s):
1. Elemento da Lista. (Variante)
2. Elemento da Lista. (Variante)

Retorno: 
Lista com todos os valores passados por parâmetro. (Variante)

Observações: 
1. A função pode ter (N) parâmetro.
2. O acesso aos elementos da lista retornada é feito através de outras funções da categoria lista.

Exemplos:
1. Assumindo que os elementos da lista sendo:1, 2 e 5, o retorno será uma lista com os elementos 1,2 e 5.
2. Assumindo que os elementos da lista sendo: A, B e C, o retorno será uma lista com os elementos A, B e C.

### Código Servidor (Java)

```java
protected final Variant ebfListParamsCreate(Variant...array) throws Exception {
    List list = new ArrayList(array.length);
    for (Variant v : array)
      list.add(v.getObject());
    return new Variant(list);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfListParamsCreate() {
  var list = new Array()
  for(i = 0; i < arguments.length; i++) {
    list[i] = arguments[i];
  }
  return list;
}
```

---

## Existe o Elemento na Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfListExistsValue` |
| **Código** | 999 |
| **Assinatura** | `Existe o Elemento na Lista (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função verifica se o elemento passado por parâmetro existe no objeto lista, retornando o valor lógico verdadeiro (true) se o elemento existir na lista ou falso (false) caso contrário.

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Elemento. (Variante)

Retorno:
Valor lógico indicando se o elemento existe na lista.

### Código Servidor (Java)

```java
protected final Variant ebfListExistsValue (Variant list, Variant value) throws Exception {
  if(list != null && !((List) list.getObject()).isEmpty())
    return VariantPool.get(((List) list.getObject()).contains(value.getObject()));
  return Variant.VARIANT_FALSE;        
}
```

### Código Cliente (JavaScript)

```javascript
function ebfListExistsValue(list, value) {
  if(list != null && list instanceof Array && list.length > 0)  
    return list.includes(value);    
  return false;
}
```

---

## Inserir Objeto na Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetElementAtList` |
| **Código** | 19 |
| **Assinatura** | `Inserir Objeto na Lista(Variante;Variante;Inteiro):Variante` |
| **Parâmetros** | Variante;Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função insere um elemento numa lista, podendo indicar a sua posição na lista. 

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Elemento a ser inserido. (Variante)
3. Inteiro indicando a posição do elemento na Lista ou nulo indicando inclusão no final da lista. (Inteiro, Opcional)

Retorno:
Valor inserido na lista. (Variante)

Exemplos:
1. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a, b, c, d, e, f, g, h}, o 2º parâmetro "s" e o 3º
parâmetro NULO. O retorno será uma lista com os seguintes valores: {a, b, c, d, e, f, g, h, s}. Como não indicou a posição
do elemento, ele é inserido na ultima posição da lista.
2. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {v, y, d}, o 2º parâmetro "u" e o 3º parâmetro 2. 
O retorno será uma lista com os seguintes valores: {v, u, y, d}. Como o 3º parâmetro determina a posição do elemento na
lista, ele será inserido na posição 2 da lista.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
  protected final Variant ebfSetElementAtList(Variant lstVariant, Variant elementVariant, Variant posVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    List elementList = (List) lstVariant.getObject();
    if (elementList != null) {
      if (posVariant.getType() == WFRRuleType.NULL || posVariant.getString().trim().length() == 0) {
        elementList.add(elementVariant.getObject());
      } else {
        int position = posVariant.getLong().intValue() - 1;
        if (position < 0) {
          position = 0;
        } else if (position > elementList.size()) {
          position = elementList.size();
        }
        elementList.add(position, elementVariant.getObject());
      }
      value = VariantPool.get(elementList);
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSetElementAtList (list, value, position) {
  if (list) {
    if (position !== null && position !== undefined) {
      position--;
      position = Math.max(0, position);
      position = Math.min(position, list.length);
      list.splice(position, 0, value);
    } else {
      list.push(value)
    }
  }
  return list; 
}
```

---

## Obter Objeto da Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetElementFromList` |
| **Código** | 12 |
| **Assinatura** | `Obter Objeto da Lista(Variante;Inteiro):Variante` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função busca e retorna o elemento que deseja obter, a partir da sua posição na lista. 

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Posição do elemento na lista que deseja obter. (Inteiro)

Retorno:
Elemento correspondente à posição, passada no 2º parâmetro, na lista. (Variante)

Exemplos: 
1. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a, b, c, d, e, f, g, h}, o 2º parâmetro seja 3. 
    O retorno será "c", pois o elemento que está na posição 3 da lista é o "c".
2. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {2, 5, 8, 9}, o 2º parâmetro seja 1. O retorno será "2", pois o elemento que está na posição 1 da lista é o "2".

### Código Servidor (Java)

```java
protected final Variant ebfGetElementFromList(Variant lstVariant, Variant posVariant) throws Exception {
    Variant value = Variant.VARIANT_NULL; 
    List elementList = (List) lstVariant.getObject();
    if (elementList != null && !elementList.isEmpty()) {
      int position = posVariant.getLong().intValue() - 1;
      if (position < 0) {
        position = 0;
      } else if (position >= elementList.size()) {
        position = elementList.size() - 1;
      }
      value = VariantPool.get(elementList.get(position));
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetElementFromList() {
  var value = null;
  if (existArgs(arguments)) {
    var position = parseInt(arguments[1]) - 1;
    position = Math.max(0, position);
    position = Math.min(position, (arguments[0].length - 1));
    value = arguments[0][position];
  }
  return value;
}
```

---

## Obter Objeto da Lista sem Validação de Posição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetElementFromListNoValidatePos` |
| **Código** | 474 |
| **Assinatura** | `Obter Objeto da Lista sem Validação de Posição (Variante;Inteiro): Variante` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função busca e retorna o elemento que deseja obter, a partir da sua posição na lista.  Caso a posição informada não exista, o retorno será "" (Vazio).

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Posição do elemento na lista que deseja obter. (Inteiro)

Retorno:
Elemento correspondente à posição, passada no 2º parâmetro, na lista. (Variante)

Exemplo: 
Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a, b, c, d, e, f, g, h}, o 2º parâmetro seja 3. O retorno será "c", pois o elemento que está na posição 3 da lista é o "c".

### Código Servidor (Java)

```java
protected final Variant ebfGetElementFromListNoValidatePos(Variant lstVariant, Variant posVariant) throws Exception {
  Variant value = Variant.VARIANT_NULL; 
  List elementList = (List) lstVariant.getObject();
  if (elementList != null && !elementList.isEmpty()) {
    int position = posVariant.getLong().intValue() - 1;
    if (position < 0 || position >= elementList.size()) {
      return VariantPool.get("");
    }
    value = VariantPool.get(elementList.get(position));
  }
  return value;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetElementFromListNoValidatePos() {
  var value = null;  
  var length  = arguments[0].length - 1;
  if (existArgs(arguments)) {
    var position = parseInt(arguments[1]) - 1;
    //position = Math.max(0, position);
   // position = Math.min(position,length);    
    if (position>length) {
     value = "";  
    } else {
      value = arguments[0][position];         
    }
  }
  return value;
}
```

---

## Ordenar Objeto Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfListSort` |
| **Código** | 337 |
| **Assinatura** | `Ordernar Objeto Lista(Variante, Lógico) : Variante` |
| **Parâmetros** | Variante;Lógico |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função ordena os elementos de uma lista. 
    
Parâmetro(s):
1. Objeto Lista. (Variante)
2. Valor Lógico. (Lógico)
   
Retorno:
Lista ordenada. (Variante)
    
Exemplos:
1. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a, d, b, e, h, f, g, c}, o 2º parâmetro seja "True". 
O retorno será uma lista ordenada de forma ascendente com os seguintes valores: {a, b, c, d, e, f, g, h}. 
2. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {1, 2, 3}, o 2º parâmetro seja "False". 
O retorno será uma lista ordenada de forma descendente com os seguintes valores: {3, 2, 1}.

### Código Servidor (Java)

```java
protected final Variant ebfListSort(Variant lstVariant, Variant reverse) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    List list = (List) lstVariant.getObject();
    if (list != null && !list.isEmpty()) {
      Collections.sort(list);
      if (!reverse.getBoolean()) {
         Collections.reverse(list);
      }
      value = VariantPool.get(list);
    }
    return value; 
}
```

### Código Cliente (JavaScript)

```javascript
function ebfListSort(lstVariant, ascending) {
  if (lstVariant) {  
    if (ascending) {
      return lstVariant.sort();    
    }
    return lstVariant.sort().reverse();  
  }
}
```

---

## Remover Elemento da Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveElementFromList` |
| **Código** | 89 |
| **Assinatura** | `Remover Elemento da Lista (Variante;Inteiro):Variante` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função busca o elemento que deseja obter, a partir da sua posição na lista e o remove do mesmo.

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Posição do elemento na lista que será removido. (Inteiro)

Retorno: 
Elemento removido da lista. (Variante)

Observação:
1. Ao utilizar esta função num fluxo do tipo cliente, é necessário atribuir o retorno da mesma à lista cujo elemento se 
deseja remover.
  1.1 A função quando executada no cliente retorna a lista resultante após a remoção do objeto desejado.
  1.2 A função quando executada no servidor retorna o objeto removido.

Exemplos: 
1. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a, b, c, h}, o 2º parâmetro seja 4. O retorno
será o elemento "h" removido da lista, pois o elemento que está na posição 4 da lista é o "h".
2. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {56, 26, 95, 62}, o 2º parâmetro seja 2.
O retorno será o elemento "26" removido da lista, pois o elemento que está na posição 2 da lista é o "26";.

### Código Servidor (Java)

```java
protected final Variant ebfRemoveElementFromList(Variant listVar, Variant positionVar) throws Exception {
    Variant removedObject = Variant.VARIANT_NULL;
    List list = (List) listVar.getObject();
    if (list != null && !list.isEmpty()) {
      int position = list.size() - 1;
      if (positionVar.getType() != WFRRuleType.NULL) {
        position = positionVar.getLong().intValue() - 1;
      }
      if (position >= 0 && position < list.size()) {
        removedObject = VariantPool.get(list.remove(position));
      }
    }
    return removedObject;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRemoveElementFromList(list, idx) {
  if (list) {
    if ((idx) && (list.splice)) {
       list.splice((idx-1), 1);
    }
  }
  return list;
}
```

---

## Substituir Elemento da Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReplaceElementFromList` |
| **Código** | 93 |
| **Assinatura** | `Substituir Elemento da Lista(Variante;Inteiro;Variante):Variante` |
| **Parâmetros** | Variante;Inteiro;Variante |
| **Retorno** | Variante |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função busca um elemento, a partir da sua posição na lista e o substitui por um novo elemento.

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Posição do elemento na lista que será substituído. (Inteiro)
3. Novo elemento. (Variante)

Retorno: 
Elemento substituído. (Variante)

Exemplos: 
1. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a, t, c, h}, o 2º parâmetro seja 1 e o 3º parâmetro "k". O retorno será a lista atualizada com os seguintes elementos: {k, t, c, h}, pois o elemento que está na posição 1 da lista é o "a".
2. Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {95, 35, 02, 806}, o 2º parâmetro seja 3 e o 3º parâmetro "357". O retorno será a lista atualizada com os seguintes elementos: {95, 35, 357, 806}, pois o elemento que está na posição 3 da lista é o "02".

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfReplaceElementFromList(Variant lstVariant, Variant posVariant, Variant newValue) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    List elementList = (List) lstVariant.getObject();
    if (elementList != null && !elementList.isEmpty()) {
      int position = posVariant.getLong().intValue() - 1;
      if (position < 0) {
        position = 0;
      } else if (position >= elementList.size()) {
        position = elementList.size() - 1;
      }
      value = VariantPool.get(elementList.get(position));
      elementList.set(position, newValue.getObject());
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfReplaceElementFromList() {
  listReturn = null;
  if (existArgs(arguments)) {
    listReturn = arguments[0];
    var position = parseInt(arguments[1]) - 1;
    position = Math.max(0, position);
    position = Math.min(position, (arguments[0].length - 1));
    listReturn[position] = arguments[2];
  }
  return listReturn;
}
```

---

## Tamanho da Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfListLength` |
| **Código** | 16 |
| **Assinatura** | `Tamanho da Lista(Variante):Inteiro` |
| **Parâmetros** | Variante |
| **Retorno** | Inteiro |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna o tamanho da lista, ou seja, a quantidade de elementos que pertencem à lista. 

Parâmetro:
1. Lista com os elementos. (Variante)

Retorno:
Retorna a quantidade de elementos na lista. (Inteiro)

Exemplo:
Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a,b,c,d,e,f,g,h} o retorno será o valor 8, pois
existem 8 elementos na lista.

### Código Servidor (Java)

```java
protected final Variant ebfListLength(Variant variant) throws Exception {
    Variant value = VariantPool.get(0);
    List list = (List) variant.getObject();
    if (list != null && !list.isEmpty()) {
      value = VariantPool.get(list.size());
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfListLength() {
  var value = 0;
  if (existArgs(arguments)) {
    value = arguments[0].length;
  }
  return value;
}
```

---

## Índice do Objeto na Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `listContainsObject` |
| **Código** | 58 |
| **Assinatura** | `Índice do Objeto na Lista(Variante;Variante):Inteiro` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Inteiro |
| **Tipo** | 6 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função busca a posição do elemento que foi informado na lista. 

Parâmetro(s):
1. Lista onde será procurado o elemento. (Variante)
2. Elemento que será procurado. (Variante)

Retorno:
Retorna a posição do elemento na lista, caso não seja encontrado, retorna 0. (Inteiro)

Exemplo:
Assumindo que o 1º parâmetro seja uma lista com os seguintes valores: {a,b,c,d,e,f,g,h} e o 2º parâmetro seja o valor  "d". O retorno será o valor 4, pois "d" está na posição 4 da lista.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
  protected final Variant listContainsObject(Variant listVar, Variant objVar) throws Exception {
    long position = 0;
    List<Object> list = (List<Object>) listVar.getObject();
    if (list != null && list.contains(objVar.getObject())) {
      for (int i = 0; i < list.size(); i++) {
        Object obj = list.get(i);
        if (obj != null && obj.equals(objVar.getObject())) {
          position = i + 1;
          break;
        }
      }
    }
    return VariantPool.get(position);
  }
```

### Código Cliente (JavaScript)

```javascript
function listContainsObject(list, obj) {
  position = 0;
  if(list) {
    for (i = 0; i < list.length; i++) {
      if(list[i] == obj) {
        position = i + 1;
      }  
    }  
  }
  return position;
}
```

---

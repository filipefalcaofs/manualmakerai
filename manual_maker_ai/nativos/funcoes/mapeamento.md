# Funções Nativas - Mapeamento

Total: **11** funções

[← Voltar para Funções Nativas](README.md)

---

## Adicionar Elemento ao Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapAddObject` |
| **Código** | 53 |
| **Assinatura** | `Adicionar Elemento ao Mapa (Variante;Variante;Variante)` |
| **Parâmetros** | Variante;Variante;Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função armazena um valor no objeto mapa passando por parâmetro a chave ou referencia do valor e o valor que
deseja armazenar.

Parâmetro(s):
1. Objeto Mapa. (Variante)
2. Chave (ou Referência). (Variante)
3. Valor a ser armazenado. (Variante)

Retorno: 
Não possui.

Observação:
Para obter o valor armazenado é preciso utilizar a função "Obter Elemento" passando por parâmetro a chave ou referência do valor.

Exemplo: 
Assumindo o 1º parâmetro sendo MAPA, o 2º parâmetro sendo Maker e o 3º parâmetro sendo Flow, o retorno será o conteúdo Flow armazenado no objeto mapa "MAPA" com a sua chave de referencia sendo Maker.

### Código Servidor (Java)

```java
protected final Variant ebfMapAddObject(Variant mapVar, Variant keyVar, Variant valueVar) throws Exception {
    Map map = (Map) mapVar.getObject();
    if (map != null) {
      Object key = keyVar.getObject();
      Object value = valueVar.getObject();
      map.put(key, value);
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapAddObject(obj, key, value) {
    obj.add(key, value);
}
```

---

## Criar Objeto Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapCreateObject` |
| **Código** | 52 |
| **Assinatura** | `Criar Objeto Mapa():Variante` |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Criar um mapa ou um mapeamento para armazenar valores, com uma diferença: ambos os valores (chave e valor) são Strings.
(Um Mapa associa os dois objetos: passando uma chave, então se obtém um valor).

Parâmetro:
Não possui.

Retorno: 
Retorna o objeto mapa. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfMapCreateObject() throws Exception {
    return VariantPool.get(new TreeMap());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapCreateObject() {
  return new Map();
}
```

---

## Criar Objeto Mapa com Parâmetros

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapCreateFromList` |
| **Código** | 154 |
| **Assinatura** | `Criar Objeto Mapa com Parâmetros (Variante...) : Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função criar um mapa ou mapeamento para armazenar valores a partir de uma lista de "par/valor".

Parâmetro(s):
1. Lista com "par/valor". (Variante)
2. Lista com "par/valor". (Variante)

Retorno: 
Retorna o objeto mapa com suas chaves e seus respectivos valores. (Variante)

Observação: 
A função pode ter N' parâmetros.

Exemplo: 
1. Assumindo o 1º e 2º parâmetro sendo a Função Criar Lista a partir dos parâmetros contendo os pares de valores: Maker/Flow e Softwell/Freire. O retorno será um objeto mapa contendo esses elementos.

### Código Servidor (Java)

```java
protected final Variant ebfMapCreateFromList(Variant... params) throws Exception {
    Map map = new TreeMap();
    for (Variant paramVar : params) {
      Object obj = paramVar.getObject();
      if (obj != null && obj instanceof List) {
        List param = (List) obj;
        if (param.size() == 2) {
          map.put(param.get(0), param.get(1));
        }
      }
    }
    return VariantPool.get(map);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapCreateFromList() {
  var map = new Map();
  for (var i = 0; i < arguments.length; i++) {
    var params = arguments[i];
    if (params instanceof Array && params.length == 2) {
      map.add(params[0], params[1]);
    }
  }
  return map;
}
```

---

## Existe Chave no Mapa?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapContainsKey` |
| **Código** | 460 |
| **Assinatura** | `Existe Chave no Mapa? (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna se uma determinada chave existe no objeto mapa.

Parâmetro(s):
1. Objeto Mapa. (Variante)
2. Chave a ser buscada. (Variante)

Retorno: 
Retorna Verdadeiro caso a chave existe no mapa. Caso contrário, retorna Falso. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfMapContainsKey(Variant mapVar, Variant key) throws Exception {
    if (mapVar.getObject() instanceof Map) {
      Map map = Map.class.cast(mapVar.getObject());
      return VariantPool.get(map.containsKey(key.getObject()));
    }
    return Variant.VARIANT_FALSE;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapContainsKey(obj, key) {
  if (obj instanceof Map) {
    return (obj.findKey(key) != -1);
  }
  return false;
}
```

---

## Lista de Chaves do Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapKeys` |
| **Código** | 57 |
| **Assinatura** | `Lista de Chaves do Mapa(Variante):Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém todas as chaves ou referencias de um determinado objeto mapa.

Parâmetro:
1. Objeto Mapa. (Variante)

Retorno: 
Retorna uma lista de chaves. (Variante)

Exemplo: 
Assumindo o 1º parâmetro contendo um objeto mapa com as seguintes chaves e respectivos valores: "Maker/Flow"; "Freire/Softwell", Banco/SQL. A partir desses valores o retorno será uma lista com a chave do objeto mapa, que seria Maker, Freire e Banco.

### Código Servidor (Java)

```java
protected final Variant ebfMapKeys(Variant mapVar) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Map map = (Map) mapVar.getObject();
    if (map != null) {
      List keysList = new ArrayList();
      Set keys = map.keySet();
      for (Object key : keys) {
        keysList.add(key);
      }
      value = VariantPool.get(keysList);
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapKeys(obj) {
  return obj.getKeys();
}
```

---

## Lista de Valores do Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapValues` |
| **Código** | 56 |
| **Assinatura** | `Lista de Valores do Mapa(Variante):Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém todos os valores de um determinado objeto mapa.

Parâmetro:
1. Objeto Mapa. (Variante)

Retorno: 
Retorna uma lista de valores. (Variante)

Exemplo: 
Assumindo o 1º parâmetro contendo um objeto mapa com as seguintes chaves e respectivos valores: Maker/Flow; Freire/Softwell, Banco/SQL. A partir desses valores o retorno será uma lista com os valores do objeto mapa, que seria Flow, Softwell e SQL.

### Código Servidor (Java)

```java
protected final Variant ebfMapValues(Variant mapVar) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    if (mapVar.getObject() instanceof Map) {
      Map map = Map.class.cast(mapVar.getObject());
      if (map != null) {
        List values = new ArrayList();
        for (Object temp : map.values()) {
          values.add(temp);
        }
        value = VariantPool.get(values);
      }
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapValues(obj) {
  return obj.getValues();
}
```

---

## Mapa para JSON

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapToJson` |
| **Código** | 774 |
| **Assinatura** | `Mapa para JSON (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função transforma um objeto Mapa em JSON.

Parâmetro:
1. Objeto Mapa. (Variante)

Retorno:
Objeto JSON. (Variante)

### Código Servidor (Java)

```java
@SuppressWarnings({ "unchecked", "rawtypes" })
protected final Variant ebfMapToJson(Variant map) throws Exception {
  return VariantPool.get(WFRJson.mapToJson((Map) map.getObject()));
}
```

### Código Cliente (JavaScript)

```javascript
function ebfMapToJson(map){
  var ro = {};
  var keys = map.getKeys();
  for(var i = 0; i < keys.length; i++){
    if(map.get(keys[i]) instanceof Map){
      ro[keys[i]] = ebfMapToJson(map.get(keys[i]));
    }else{
      ro[keys[i]] = map.get(keys[i]);
    }
  };
  return ro;
};
```

---

## Obter Chave na Posição do Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapGetElementAt` |
| **Código** | 461 |
| **Assinatura** | `Obter Chave na Posição do Mapa (Variante;Inteiro): Variante` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna o valor de uma chave numa determinada posição da lista.

Parâmetro(s):
1. Objeto Mapa. (Variante)
2. Posição a buscar a chave. (Inteiro)

Retorno: 
Retorna o objeto definido na posição. (Variante)

Observação:
Caso a posição seja negativa, o primeiro será retornado, caso a posição seja maior que o tamanho do mapa, o último elemento será retornado.

### Código Servidor (Java)

```java
protected final Variant ebfMapGetElementAt(Variant mapVar, Variant positionVar) throws Exception {
    if (mapVar.getObject() instanceof Map) {
      Map map = Map.class.cast(mapVar.getObject());

      int mapSize = map.size();
      if (mapSize > 0) {
        int position = positionVar.getLong().intValue() - 1;
        position = Math.max(0, position);
        position = Math.min(position, (mapSize - 1));

        int counter = 0;
        for (Object obj : map.keySet()) {
          if (counter == position) {
            return VariantPool.get(obj);
          }
          counter++;
        }
      }
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapGetElementAt(obj, position) {
  if (obj instanceof Map) {
    var keys = obj.getKeys();
    
    position = parseInt(position) - 1;
    position = Math.max(0, position);
    position = Math.min(position, (keys.length - 1));
    
    return keys[position];
  }
  return null;
}
```

---

## Obter Elemento do Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapGetObject` |
| **Código** | 54 |
| **Assinatura** | `Obter Elemento do Mapa (Variante;Variante): Variante` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém o elemento de um objeto mapa a partir da chave (ou Referência).

Parâmetro(s):
1. Objeto Mapa. (Variante)
2. Chave (ou Referência). (Variante)

Retorno: 
Retorna o elemento de um determinado objeto mapa a partir da chave (ou referência) do elemento. (Variante)

Exemplo: 
Assumindo o 1º parâmetro contendo um objeto mapa com as seguintes chaves e respectivos valores: "Maker/Flow"; 
"Freire/Softwell", "Banco/SQL" e o 2º parâmetro contendo a chave Maker. A partir desses valores o retorno será o valor
"Flow".

### Código Servidor (Java)

```java
protected final Variant ebfMapGetObject(Variant mapVar, Variant keyVar) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Map map = (Map) mapVar.getObject();
    if (map != null) {
      Object key = keyVar.getObject();
      value = VariantPool.get(map.get(key));
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapGetObject(obj, key) {
  return obj.get(key);
}
```

---

## Remover Elemento do Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapRemoveObject` |
| **Código** | 153 |
| **Assinatura** | `Remover Elemento do Mapa (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função remove o elemento de um objeto mapa a partir da chave (ou Referência).

Parâmetro(s):
1. Objeto Mapa. (Variante)
2. Chave (ou Referência). (Variante)

Retorno: 
Retorna o elemento removido de um determinado objeto mapa a partir da chave (ou referência) do elemento. Caso o 
elemento seja removido retorna Verdadeiro, caso contrário Falso. (Lógico)

Exemplo: 
Assumindo o 1º parâmetro contendo um objeto mapa com as seguintes chaves e respectivos valores: "Maker/Flow"; "Freire/Softwell", "Banco/SQL" e o 2º parâmetro contendo a chave Freire. A partir desses valores o elemento a ser removido será o valor "Flow".

### Código Servidor (Java)

```java
protected final Variant ebfMapRemoveObject(Variant mapVar, Variant keyVar) throws Exception {
    Map map = (Map) mapVar.getObject();
    if (map != null) {
      Object key = keyVar.getObject();
      return VariantPool.get(map.remove(key) != null);
    }
    return Variant.VARIANT_FALSE;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapRemoveObject(obj, key) {
  if (obj instanceof Map) {
    return obj.remove(key);
  }
  return -1;
}
```

---

## Tamanho do Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMapLength` |
| **Código** | 55 |
| **Assinatura** | `Tamanho do Mapa (Variante):Inteiro` |
| **Parâmetros** | Variante |
| **Retorno** | Inteiro |
| **Tipo** | 11 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna a quantidade de valores que existe no objeto mapa.

Parâmetro:
1. Objeto Mapa. (Variante)

Retorno: 
Retorna o tamanho do objeto mapa, ou seja, a quantidade de valores que existe no mapa. (Inteiro)

Exemplo: 
Assumindo o 1º parâmetro contendo um objeto mapa com as seguintes chaves e respectivos valores: Maker/Flow; Freire/Softwell, Banco/SQL. A partir desses valores o retorno será 3, pois existe 3 valores no objeto mapa que são Flow, Softwell e SQL.

### Código Servidor (Java)

```java
protected final Variant ebfMapLength(Variant mapVar) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Map map = (Map) mapVar.getObject();
    if (map != null) {
      value = VariantPool.get(map.size());
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMapLength(obj) {
  return obj.size;
}
```

---

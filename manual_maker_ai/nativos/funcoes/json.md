# Funções Nativas - JSON

Total: **13** funções

[← Voltar para Funções Nativas](README.md)

---

## JSON - Atualizar Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUpdateValueObjectJson` |
| **Código** | 1110 |
| **Assinatura** | `JSON - Atualizar Valor (Variante;Letras;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função atualiza um elemento no objeto JSON passado no primeiro parâmetro.
Caso a chave passada no segundo parâmetro não exista a mesma será criada.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Chave. (Letras)
3. Valor. (Variante)

Retorno:
Objeto JSON atualizado. (Variante)

Observações:
1. O primeiro parâmetro pode ser passado o retorno da função "JSON - Criar Objeto".
2. Caso uma chave a ser atualizada tenha como valor um objeto Mapa, esta será convertida para JSON.

Exemplo:
Assumindo como parâmetro um objeto JSON criado a partir do Texto {"Versão":"3.9","empresa":"Softwell"}, ao chamar a função "JSON - Atualizar Valor" e passar como chave "Versão" (sem aspas) e valor (3º parâmetro) "4.0", o objeto JSON (1º parâmetro) terá a chave "Versão" atualizada de "3.9" para "4.0".

### Código Servidor (Java)

```java
protected Variant ebfUpdateValueObjectJson(Variant objectJSON, Variant key, Variant value) throws Exception {
    if (objectJSON.getObject() instanceof jakarta.json.JsonArray || objectJSON.getObject() instanceof ArrayList) {
      jakarta.json.JsonArray jsonArray = null;
      if (objectJSON.getObject() instanceof ArrayList) {
        jsonArray = WFRJson.arrayToJsonArray((ArrayList<?>) objectJSON.getObject());
        jsonArray = WFRJson.add(jsonArray, value);
      } else {
        jsonArray = WFRJson.add(jsonArray, value);
      }
      return new Variant(jsonArray);
    } else if (objectJSON.getObject() instanceof jakarta.json.JsonObject) {
      return VariantPool.get(WFRJson.put((jakarta.json.JsonObject) objectJSON.getObject(), key.getString(), value.getObject()));
    }
    return objectJSON;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfUpdateValueObjectJson(objectJSON, key, value){
  objectJSON[key] = value instanceof Map ? ebfMapToJson(value) : value;
  return objectJSON;
}
```

---

## JSON - Converter JSONArray para Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJsonArrayToArray` |
| **Código** | 1111 |
| **Assinatura** | `JSON - Converter JSONArray para Lista (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função realiza a conversão de um objeto JSONArray para Lista.

Parâmetro:
1. JSONArray. (Variante)

Retorno:
JSONArray convertido para Lista. (Variante)

Observações:
1. Recomendamos a utilização dessa função quando  o objeto a ser convertido é o retorno da função "Tabela para JSON".
2. A função "JSON - Obter Valor" já realiza a conversão implicitamente para o tipo do objeto.

### Código Servidor (Java)

```java
protected final Variant ebfJsonArrayToArray (Variant jsonArray) throws Exception {
    if (jsonArray.getObject() instanceof jakarta.json.JsonArray)
      return VariantPool.get(WFRJson.toArray((jakarta.json.JsonArray) jsonArray.getObject()));

    return jsonArray;
  }
```

---

## JSON - Criar JSON a Partir dos Elementos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJSONParamsCreate` |
| **Código** | 763 |
| **Assinatura** | `JSON - Criar JSON a Partir dos Elementos (Variante;Lógico): Variante` |
| **Parâmetros** | Variante;Lógico |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função cria um objeto JSON ou um texto JSON de acordo com o valor lógico passado no segundo parâmetro.

Parâmetro(s):
1. Lista de Lista contendo chave e valor. (Variante)
2. É um Objeto JSON? (Lógico)

Retorno:
Retorna um objeto JSON ou um texto JSON. (Variante)

Observações:
1. A função possui suporte a passagem de objetos do tipo JSON e Lista como valor.
2. Retorna nulo caso o primeiro parâmetro não seja um objeto do tipo lista.

### Código Servidor (Java)

```java
@SuppressWarnings({ "rawtypes", "unchecked" })
protected final Variant ebfJSONParamsCreate(Variant listValues, Variant obj) throws Exception {
  if (listValues.getObject() != null && listValues.getObject() instanceof ArrayList)
    return VariantPool.get(WFRJson.arrayToJson((ArrayList) listValues.getObject(), obj.getBoolean()));

  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfJSONParamsCreate (list, obj){
  if(list && list instanceof Array){
    var objectJSON = JSON.parse('{}');
    for(i=0; i < list.length; i++){
      var key = list[i];     
      objectJSON[key[0].toString()] = key[1];
    }    
    return obj === true ? objectJSON : JSON.stringify(objectJSON);
  }
  return null;
}
```

---

## JSON - Criar Objeto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateObjectJSON` |
| **Código** | 709 |
| **Assinatura** | `JSON - Criar Objeto (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função recebe um texto JSON e retorna um objeto.

Parâmetro:
1. Texto em JSON. (Letras)

Retorno:
Objeto JSON. (Variante)

Exemplo:
Assumindo como parâmetro da função o texto {"Versão":"3.9","empresa":"Softwell"}, o retorno será um Objeto JSON.

### Código Servidor (Java)

```java
protected final Variant ebfCreateObjectJSON(Variant textJson) throws Exception {
  if(textJson.getString().startsWith("[") && textJson.getString().endsWith("]"))
    return VariantPool.get(WFRJson.createJsonArray(textJson.getString()));
  else
    return VariantPool.get(WFRJson.createJsonObject(textJson.getString()));
}
```

### Código Cliente (JavaScript)

```javascript
function ebfCreateObjectJSON(json) {
  try {
    return JSON.parse(json == null || json == "" ? "{}" : json);
  } catch (ex) {
    handleException(new Error("Texto JSON não está em um formato válido"));
  }
}
```

---

## JSON - Existe a Chave?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJSONExistsKey` |
| **Código** | 1108 |
| **Assinatura** | `JSON - Existe a Chave? (Variante;Letras): Lógico` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Lógico |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna se uma determinada chave existe no objeto JSON.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Chave a ser buscada. (Letras)

Retorno: 
Retorna Verdadeiro caso a chave existe no JSON. Caso contrário, retorna Falso. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfJSONExistsKey(Variant json, Variant key) throws Exception {
    if (!json.isNull() && json.getObject() instanceof jakarta.json.JsonObject)
      return VariantPool.get(WFRJson.containsKey((jakarta.json.JsonObject) json.getObject(), key.getString()));

    return VariantPool.get(false);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfJSONExistsKey (json, key) {
  try {
    const find = Object.keys(json).find(function(e) {
      return e === key;
    });
    if (find) return true;
    return false;
  } catch (e) {}
  return false;
}
```

---

## JSON - Filtrar Objeto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFilterJSONArray` |
| **Código** | 1139 |
| **Assinatura** | `JSON - Filtrar Objeto (Variante;Variante): Variante` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função filtra um objeto JSONArray (lista de objetos JSON) retornando apenas os elementos que satisfazem os critérios de busca informados por parâmetro. A função suporta dois formatos de filtros: Simples (Igualdade) e Avançado (Operadores e Lógica Booleana).

Parametro(s):

1.  Objeto JSONArray
    - Tipo: Variante
    - Descrição: lista de registros que deseja filtrar.

2.  Lista de Lista contendo chave e valor
    * Tipo: Variante
    * Descrição: A lista de critérios de filtro a ser aplicada. O formato varia entre o modo Simples e Avançado.

Retorno:

Objeto JSONArray Filtrado.
    - Tipo: Variante (Array de Objetos).
    - Descrição: Um novo Array contendo apenas os elementos que passaram em todas as regras de filtro. Se a lista de filtros estiver vazia ou for inválida, o Array original será retornado.


Formatos de Filtros:

A função detecta automaticamente o formato dos filtros.

1. Modo de Filtro Simples (Compatibilidade / Apenas Igualdade)

Este modo é ativado quando todos os filtros possuem apenas 2 itens na lista interna.

- Formato: [ [chave, valor], [chave, valor], ... ]
- Logica: Trata todos os filtros como AND (todos devem ser verdadeiros)
- Operador: Implicitamente usa Igualdade (=)

Exemplo:
[
  ["status", "ATIVO"],  // status DEVE ser igual a "ATIVO" E
  ["categoria", "ALIMENTOS"] // categoria DEVE ser igual a "ALIMENTOS"
]

2. Modo de Filtro Avancado (Operadores e Logica)

Este modo é ativado quando pelo menos um filtro possui 3 ou 4 itens na lista interna. Ele suporta diferentes operadores e a combinação de logica AND (E) e OR (OU).

- Formato: [ [chave, operador, valor, tipoLogico], ... ]
- Logica: Os filtros são agrupados automaticamente.
    - Filtros AND (padrao) devem ser todos verdadeiros.
    - Pelo menos um filtro OR deve ser verdadeiro.
    - O resultado final é (todos os ANDs) E (pelo menos um OR).

Exemplo:
[
  // AND: O valor deve ser maior ou igual a 100.50 E
  ["valorTotal", ">=", 100.50], 
  // OR: O status DEVE ser "PENDENTE" OU
  ["status", "equals", "PENDENTE", "OR"], 
  // OR: O status DEVE ser "AGUARDANDO"
  ["status", "equals", "AGUARDANDO", "OR"] 
]

Este exemplo selecionará itens onde o valorTotal é >= 100.50 E (o status é PENDENTE OU o status é AGUARDANDO).*

Tabela de Operadores Validos:

1. (= ou equals) Igual a (comparação estrita de texto).
2. (!= ou notequals) Diferente de.
3. (>) Maior que (comparação numérica, se possível).
4. (<) Menor que (comparação numérica, se possível).
5. (>=) Maior ou igual a (comparação numérica, se possível).
6. (<=) Menor ou igual a (comparação numérica, se possível).
7. (contains) Contém o texto (não sensível a maiúsculas/minúsculas).
8. (startswith) Começa com o texto (não sensível a maiúsculas/minúsculas).
9. (endswith) Termina com o texto (não sensível a maiúsculas/minúsculas).
10. (regex) Corresponde a uma expressão regular.

### Código Servidor (Java)

```java
@SuppressWarnings({
  "rawtypes",
  "unchecked"
})
protected final Variant ebfFilterJSONArray(Variant jsonArray, Variant listArray) throws Exception {
  if ((jsonArray.getObject() instanceof jakarta.json.JsonArray 
      || jsonArray.getObject() instanceof List 
      || jsonArray.getObject() instanceof ArrayList) 
    && listArray.getObject() instanceof List)
    return VariantPool.get(wfr.util.WFRJson.filter(jsonArray.getObject(), (List) listArray.getObject()));

  return VariantPool.get(jakarta.json.Json.createArrayBuilder().build());
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFilterJSONArray(array, filters) {
  if (!Array.isArray(array) || !filters || filters.length === 0) {
    return array || [];
  }

  const isLegacyFormat = filters.every(f => f.length === 2);

  if (isLegacyFormat) {
    // Modo compatível: [campo, valor] = apenas igualdade
    return array.filter(item => {
      return filters.every(filter => {
        const field = String(filter[0]);
        const expectedValue = filter[1];
        const fieldValue = getNestedValue(item, field);
        return compareJsonValue(fieldValue, expectedValue);
      });
    });
  }

  return filterAdvanced(array, filters);
}

/**
 * Filtra um array com suporte a múltiplos tipos, operadores e lógica OR/AND.
 * 
 * @param {Array} array - Array a ser filtrado
 * @param {Array<Array>} filters - Lista de filtros no formato [campo, operador, valor, tipoLogico]
 * @returns {Array} Array filtrado
 */
function filterAdvanced(array, filters) {
  const andFilters = [];
  const orFilters = [];

  for (const filter of filters) {
    const logicType = filter.length > 3 ? String(filter[3]).toUpperCase() : "AND";
    if (logicType === "OR") {
      orFilters.push(filter);
    } else {
      andFilters.push(filter);
    }
  }

  return array.filter(item => {
    const andMatch = andFilters.length === 0 || andFilters.every(filter => {
      try {
        if (filter.length < 3) return false;

        const field = String(filter[0]);
        const operator = String(filter[1]);
        const expectedValue = filter[2];

        const fieldValue = getNestedValue(item, field);
        return compareValues(fieldValue, operator, expectedValue);
      } catch (e) {
        console.error("Erro ao filtrar campo AND: " + filter[0], e);
        return false;
      }
    });

    // Verifica filtros OR (pelo menos um deve ser satisfeito)
    const orMatch = orFilters.length === 0 || orFilters.some(filter => {
      try {
        if (filter.length < 3) return false;

        const field = String(filter[0]);
        const operator = String(filter[1]);
        const expectedValue = filter[2];

        const fieldValue = getNestedValue(item, field);
        return compareValues(fieldValue, operator, expectedValue);
      } catch (e) {
        console.error("Erro ao filtrar campo OR: " + filter[0], e);
        return false;
      }
    });

    return andMatch && orMatch;
  });
}

/**
 * Compara valores com suporte a múltiplos operadores e tipos.
 * 
 * @param {*} fieldValue - Valor do campo
 * @param {string} operator - Operador de comparação
 * @param {*} expectedValue - Valor esperado
 * @returns {boolean} true se a comparação for satisfeita
 */
function compareValues(fieldValue, operator, expectedValue) {
  if (fieldValue === null || fieldValue === undefined) {
    return expectedValue === null || expectedValue === undefined || 
           String(expectedValue).toLowerCase() === "null";
  }

  const actualValue = String(fieldValue);
  const expectedStr = String(expectedValue);

  switch (operator.toLowerCase()) {
    case "=":
    case "equals":
      return actualValue === expectedStr;

    case "!=":
    case "notequals":
      return actualValue !== expectedStr;

    case ">":
      return compareNumeric(actualValue, expectedStr) > 0;

    case "<":
      return compareNumeric(actualValue, expectedStr) < 0;

    case ">=":
      return compareNumeric(actualValue, expectedStr) >= 0;

    case "<=":
      return compareNumeric(actualValue, expectedStr) <= 0;

    case "contains":
      return actualValue.toLowerCase().includes(expectedStr.toLowerCase());

    case "startswith":
      return actualValue.toLowerCase().startsWith(expectedStr.toLowerCase());

    case "endswith":
      return actualValue.toLowerCase().endsWith(expectedStr.toLowerCase());

    case "regex":
      return new RegExp(expectedStr).test(actualValue);

    default:
      return actualValue === expectedStr;
  }
}

/**
 * Compara um valor com um Object esperado (modo legacy).
 * 
 * @param {*} fieldValue - Valor do campo
 * @param {*} expectedValue - Valor esperado
 * @returns {boolean} true se os valores forem iguais
 */
function compareJsonValue(fieldValue, expectedValue) {
  if (fieldValue === null || fieldValue === undefined) {
    return expectedValue === null || expectedValue === undefined;
  }
  
  const actualValue = String(fieldValue);
  const expectedStr = String(expectedValue);
  
  return actualValue === expectedStr;
}

/**
 * Obtém valor de campo aninhado (ex: "user.address.city").
 * 
 * @param {Object} obj - Objeto
 * @param {string} field - Caminho do campo (pode usar notação de ponto para campos aninhados)
 * @returns {*} Valor do campo ou null se não encontrado
 */
function getNestedValue(obj, field) {
  const parts = field.split(".");
  let current = obj;
  
  for (const part of parts) {
    if (current && typeof current === "object" && part in current) {
      current = current[part];
    } else {
      return null;
    }
  }
  
  return current;
}

/**
 * Compara valores numéricos.
 * 
 * @param {string} actual - Valor atual
 * @param {string} expected - Valor esperado
 * @returns {number} Resultado da comparação: negativo se actual < expected, zero se iguais, positivo se actual > expected
 */
function compareNumeric(actual, expected) {
  const actualNum = parseFloat(actual);
  const expectedNum = parseFloat(expected);
  
  // Se algum não for número, faz comparação lexicográfica
  if (isNaN(actualNum) || isNaN(expectedNum)) {
    return actual.localeCompare(expected);
  }
  
  return actualNum - expectedNum;
}
```

---

## JSON - Inserir no Banco

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJsonInsert` |
| **Código** | 1112 |
| **Assinatura** | `JSON - Inserir no Banco (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 39 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função insere valores no banco de dados de acordo em um JSON.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Nome da tabela no banco de dados que irá receber os valores do JSON. (Letras)

Retorno:
Não possui.

Observação:
Cada chave no objeto JSON deve corresponder a uma coluna na tabela do banco de dados passado como parâmetro .

Exemplo:
Assumindo o JSON como {?nome?: ?Softwell?, ?idade?: 15} e as colunas correspondentes no banco de dados como ?nome? e ?idade?, assim como no objeto JSON os valores inseridos no banco serão ?Softwell? e ?15?.

### Código Servidor (Java)

```java
protected final void ebfJsonInsert(Variant json, Variant tableName) throws Exception {
    int verifyJsonType = 0;
    if (json.getObject() instanceof jakarta.json.JsonArray) {
      verifyJsonType = 1;
    }

    java.util.List params = new java.util.ArrayList();
    StringBuilder insert = new StringBuilder("INSERT INTO " + tableName.getString() + "(");
    StringBuilder finalInsert = new StringBuilder();
    int aux = 0;

    switch (verifyJsonType) {
    case 0: {
      jakarta.json.JsonObject jsonObject = (jakarta.json.JsonObject) json.getObject();
      try {
        int arrSize = jsonObject.size() - 1;
        int count = 0;

        for (Object key : jsonObject.keySet()) {
          if ((String) key != null && count == arrSize) {
            insert.append(key + ")");
          } else {
            insert.append(key + ",");
          }
          count++;
        }

        insert.append(" VALUES (");
        count = 0;

        for (Object key : jsonObject.keySet()) {

          Object value = null;

          switch (jsonObject.get(key.toString()).getValueType().toString().toUpperCase()) {
          case "STRING":
            value = jsonObject.getString(key.toString());
            break;
          case "NUMBER":
            value = jsonObject.getInt(key.toString());
            break;
          case "TRUE":
          case "FALSE":
            value = jsonObject.getBoolean(key.toString());
            break;
          default:
            break;
          }
          if ((String) key != null && count == arrSize) {
            params.add(value);
            insert.append("?)");
          } else {
            params.add(value);
            insert.append("?,");
          }
          count++;
        }
      } catch (Exception e) {
        e.printStackTrace();
      }

      java.sql.PreparedStatement st = null;
      try {
        st = this.connection.getPreparedStatement(insert.toString());
        Functions.setParams(st, params);
        this.connection.execStatement(st);
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        if (st != null)
          st.close();
      }

      break;
    }

    case 1: {
      jakarta.json.JsonArray objArrJSON = (jakarta.json.JsonArray) json.getObject();
      int count = 0;
      java.util.Iterator<?> iterator = objArrJSON.iterator();

      while (iterator.hasNext()) {
        jakarta.json.JsonObject obj = (jakarta.json.JsonObject) iterator.next();

        if (aux == 0) {
          for (Object key : obj.keySet()) {
            count++;
            if (count == obj.size()) {
              insert.append(key + ")");
            } else {
              insert.append(key + ",");
            }
          }

          insert.append(" VALUES (");
          count = 0;
          finalInsert = new StringBuilder(insert);
        }

        for (Object key : obj.keySet()) {
          count++;

          Object value = null;

          switch (obj.get(key.toString()).getValueType().toString().toUpperCase()) {
          case "STRING":
            value = obj.getString(key.toString());
            break;
          case "NUMBER":
            value = obj.getInt(key.toString());
            break;
          case "TRUE":
          case "FALSE":
            value = obj.getBoolean(key.toString());
            break;
          default:
            break;
          }

          if (count == obj.size()) {
            if (insert.length() >= 500) {
              params.add(value);
              insert.append("?)");

              java.sql.PreparedStatement st = null;
              try {
                st = this.connection.getPreparedStatement(insert.toString());
                Functions.setParams(st, params);
                this.connection.execStatement(st);
              } catch (Exception e) {
                e.printStackTrace();
              } finally {
                if (st != null) {
                  st.close();
                }
              }

              insert.setLength(0);
              params.clear();
              insert = new StringBuilder(finalInsert);
            } else {
              params.add(value);
              if (aux == objArrJSON.size() - 1) {
                insert.append("?)");
              } else {
                insert.append("?),(");
              }
            }
          } else {
            params.add(value);
            insert.append("?,");
          }
        }

        count = 0;
        aux++;
      }

      if (insert.length() != 0) {
        java.sql.PreparedStatement stArr = null;
        try {
          stArr = this.connection.getPreparedStatement(insert.toString());
          Functions.setParams(stArr, params);
          this.connection.execStatement(stArr);
        } catch (Exception e) {
          e.printStackTrace();
        } finally {
          if (stArr != null) {
            stArr.close();
          }
        }
      }

      break;
    }

    default:
      break;
    }
  }
```

---

## JSON - Obter Dados da Tela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfgetWindowJSON` |
| **Código** | 1013 |
| **Assinatura** | `JSON - Obter Dados da Tela (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém um JSON dos dados dos componentes em tela.

Parâmetro:
Não possui.

Retorno:
Objeto JSON. (Variante)

Observação:
O nome do componente corresponde a chave do JSON e o valor corresponde ao valor da chave.

### Código Cliente (JavaScript)

```javascript
function ebfgetWindowJSON() {
    let result = {};
    for (let i = 0; i < window.controller.elems.length; i++) {
      let el = window.controller.elems[i];
      if (el) {
        let key = window.controller.elems[i].id;
        if (key) {
          result[key] = el.getValue();
        }
      }
    }
    return result;
  }
```

---

## JSON - Obter Lista de Chaves

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetListKeysObjectJson` |
| **Código** | 1106 |
| **Assinatura** | `JSON - Obter Lista de Chaves (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém a lista de chaves do objeto JSON passado no primeiro parâmetro.

Parâmetro:
1. Objeto JSON. (Variante)

Retorno:
Lista contendo as chaves. (Variante)

Observação:
O primeiro parâmetro pode ser passado o retorno da função "JSON - Criar Objeto".

Exemplo:
Assumindo como parâmetro um objeto JSON criado a partir do Texto {"Versão":"3.9","empresa":"Softwell"}, ao chamar a função "JSON - Obter Lista de Chaves" o retorno será um objeto Lista com os valores "Versão" e "empresa".

### Código Servidor (Java)

```java
protected final Variant ebfGetListKeysObjectJson(Variant objectJson) throws Exception {
    if(objectJson.getObject() instanceof jakarta.json.JsonObject || objectJson.getObject() instanceof jakarta.json.JsonArray)
      return VariantPool.get(WFRJson.getKeys(objectJson.getObject()));

    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetListKeysObjectJson(objetoJSON){
  if(objetoJSON){
    var listKeys = new Array;
    for(i=0; i<Object.keys(objetoJSON).length; i++){   
      listKeys.push(Object.keys(objetoJSON)[i]);
    }
    return listKeys;
  }
}
```

---

## JSON - Obter Objeto de um Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetObjectJSONFromFile` |
| **Código** | 1136 |
| **Assinatura** | `JSON - Obter Objeto de um Arquivo (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função recebe por parâmetro o caminho do arquivo com a extensão .json e retorna o objeto.

Parâmetro:
1. Caminho do arquivo. (Letras)

Retorno:
Objeto JSON ou Nulo. (Variante)

Observação:
O objeto retornado pode ser um JSON ou JSONArray.

Exemplo:
Assumindo como parâmetro da função o caminho "C:\Softwell\Colaboradores.json", o retorno será um Objeto JSON.

### Código Servidor (Java)

```java
protected final Variant ebfGetObjectJSONFromFile (Variant file) throws Exception {
  if(file.getObject() != null && !file.getString().equals(""))
    return VariantPool.get(WFRJson.getJsonFromFile(file.getString(), getSystem()));

  return Variant.VARIANT_NULL;
}
```

---

## JSON - Obter Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetJSONText` |
| **Código** | 1105 |
| **Assinatura** | `JSON - Obter Texto (Variante;Inteiro): Letras` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função obtém um objeto JSON e retorna o seu conteúdo em forma de texto.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Número de espaços para formatação. (Inteiro, Opcional)

Retorno:
Texto JSON. (Letras)

Observação:
Na camada servidor o 2º parâmetro quando informado sempre aplicará a formatação "Pretty" para o text JSON.

### Código Servidor (Java)

```java
protected final Variant ebfGetJSONText(Variant objectJson, Variant identity) throws Exception {
    if(objectJson.getObject() instanceof jakarta.json.JsonObject)
      return VariantPool.get(WFRJson.toString((jakarta.json.JsonObject) objectJson.getObject(), identity.getBoolean()));
    else if(objectJson.getObject() instanceof jakarta.json.JsonArray)
      return VariantPool.get(WFRJson.toString((jakarta.json.JsonArray) objectJson.getObject(), identity.getBoolean()));

    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetJSONText(object, space) {
  return JSON.stringify(object, null, space);
}
```

---

## JSON - Obter Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetValueObjectJson` |
| **Código** | 1107 |
| **Assinatura** | `JSON - Obter Valor (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém o valor de um elemento de acordo a chave passada no segundo parâmetro.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Chave. (Letras)

Retorno:
Retorna o valor da Chave ou Nulo caso não exista. (Variante)

Observação:
O 1º Parâmetro pode ser passado o retorno da função "JSON - Criar Objeto".

Exemplo:
Assumindo como parâmetro um objeto JSON criado a partir do Texto {"Versão":"3.9","empresa":"Softwell"}, ao chamar a função "JSON - Obter Valor" e passar como chave "empresa" (sem aspas), o retorno será "Softwell" (sem aspas).

### Código Servidor (Java)

```java
protected final Variant ebfGetValueObjectJson(Variant objectJson, Variant key) throws Exception {
    if(objectJson.getObject() instanceof jakarta.json.JsonObject) {
      return VariantPool.get(WFRJson.getValue((jakarta.json.JsonObject) objectJson.getObject(), key.getString()));
    } else if (objectJson.getObject() instanceof jakarta.json.JsonArray) {
      return VariantPool.get(WFRJson.getValue((jakarta.json.JsonArray) objectJson.getObject(), key.getLong().intValue()));
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetValueObjectJson(objectJSON, key){
  if(objectJSON){     
    return objectJSON[key];    
  }else{  
    return null;
  }
}
```

---

## JSON - Remover Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJSONRemoveElement` |
| **Código** | 1109 |
| **Assinatura** | `JSON - Remover Elemento (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 39 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função remove um elemento do objeto JSON de acordo com a chave informada no segundo parâmetro.

Parâmetro(s):
1. Objeto JSON. (Variante)
2. Chave. (Letras)

Retorno:
Objeto JSON Atualizado. (Variante)

Exemplo:
Assumindo como primeiro parâmetro o objeto JSON {"Setores":["Suporte","Testes","Produtos","Desenvolvimento"],"Produtos":["IDE Maker","Webrun"]} e a chave "Setores" o retorno será: {"Produtos":["IDE Maker","Webrun"]}

### Código Servidor (Java)

```java
protected final Variant ebfJSONRemoveElement(Variant object, Variant key) throws Exception {
    if(object.getObject() instanceof jakarta.json.JsonObject)
      return VariantPool.get(WFRJson.removeByKey((jakarta.json.JsonObject) object.getObject(), key.getString()));
    return object;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfJSONRemoveElement(objectJSON, key){
  if (objectJSON) {
    delete objectJSON[key];
    return objectJSON;
  }
  return objectJSON;
}
```

---

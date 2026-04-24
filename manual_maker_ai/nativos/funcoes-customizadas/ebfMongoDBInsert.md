---

## MongoDB - Inserir Registro (Aprimorado)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMongoDBInsert` |
| **Código Original** | 1154 |
| **Assinatura** | `MongoDB - Inserir Registro (Variante;Letras;Letras;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |
| **Substitui** | `ebfMongoDBInsert` (1154) e `ebfSQLMongoDBInsertJson` (1155) |

### Descrição

Versão aprimorada da função nativa `ebfMongoDBInsert` que unifica a inserção de documentos no MongoDB aceitando múltiplos tipos de entrada.

**Diferenças em relação à função original (1154):**
- A função original aceita **apenas Map** no 4º parâmetro.
- Esta versão aceita **Map, List, String JSON, JsonObject e JsonArray**.
- Suporta **inserção em lote** (`insertMany`) quando o input é uma lista ou array JSON.
- Corrige o erro `CodecConfigurationException` causado por valores `javax.json.JsonValue` (ex: `JsonStringImpl` do Eclipse Parsson) que o codec BSON do MongoDB não reconhece.

**Tipos aceitos no 4º parâmetro:**

| Tipo do Input | Comportamento | Retorno |
|---------------|---------------|---------|
| `javax.json.JsonObject` | Converte para JSON string → `insertOne` | ObjectID |
| `javax.json.JsonArray` | Converte para JSON string → `insertMany` | Quantidade inserida |
| `String` (JSON objeto) | `Document.parse()` → `insertOne` | ObjectID |
| `String` (JSON array) | Parse manual → `insertMany` | Quantidade inserida |
| `java.util.Map` | Serialização recursiva → `Document.parse()` → `insertOne` | ObjectID |
| `java.util.List` | Serialização recursiva → parse → `insertMany` | Quantidade inserida |

Parâmetro(s):
1. Referência da conexão. (Variante)
2. Nome do Banco de Dados, Ex: BD_TESTE. (Letras)
3. Nome da coleção, Ex: Funcionário. (Letras)
4. Documento(s) a ser(em) inserido(s) — aceita Map, List, String JSON, JsonObject ou JsonArray. (Variante)

Retorno:
- Insert único: ObjectID do documento inserido. (Variante)
- Insert em lote: Quantidade de documentos inseridos. (Variante)

### Problema Resolvido

A função original fazia `new Document(map)` diretamente, o que causava a seguinte exceção quando o Map continha valores `javax.json.JsonValue`:

```
org.bson.codecs.configuration.CodecConfigurationException:
Can't find a codec for CodecCacheKey{clazz=class org.eclipse.parsson.JsonStringImpl, types=null}
```

A solução é **normalizar todo input para JSON string** antes de criar Documents BSON. A detecção de tipos JSON-P (`JsonObject`, `JsonArray`, `JsonValue`) é feita via **reflection** (verificação do nome da classe) para evitar dependência de compilação do `javax.json`. A serialização de Map/List é feita com um **serializador JSON recursivo manual**, sem dependência do Jackson (evitando problemas de incompatibilidade de versão). `Document.parse()` reconstrói o documento apenas com tipos Java nativos compatíveis com o codec BSON.

### Dependências

| Dependência | JAR no Webrun | Versão |
|-------------|---------------|--------|
| MongoDB Driver | `mongo-java-driver` | 3.12.13 |

> **Nota:** O código **não usa Jackson** nem importa `javax.json` diretamente. A detecção de tipos JSON-P é feita por verificação do nome da classe. A serialização de Map/List usa um serializador JSON recursivo manual embutido na função.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfMongoDBInsert(Variant connectionVar, Variant databaseVar, Variant collectionVar, Variant mapVar) throws Exception {

  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> collection = database.getCollection(collectionVar.getString());

  Object obj = mapVar.getObject();

  if (obj == null) {
    throw new Exception("O documento para inserção não pode ser nulo.");
  }

  try {

    // =========================
    // Normaliza o input para JSON string.
    // Evita CodecConfigurationException com tipos JSON-P
    // (ex: org.eclipse.parsson.JsonStringImpl) que o BSON
    // codec não reconhece.
    // Usa verificação pelo nome da classe em vez de instanceof
    // para evitar dependência de compilação do javax.json.
    // Usa serializador JSON recursivo manual em vez do Jackson
    // para evitar NoSuchMethodError por conflito de versões.
    // =========================
    String json;
    String className = obj.getClass().getName();

    boolean isJsonPType = className.startsWith("javax.json.")
        || className.startsWith("org.eclipse.parsson.")
        || className.startsWith("org.glassfish.json.");

    if (isJsonPType) {
      // JSON-P (JsonObject, JsonArray, etc.) → toString() gera JSON válido
      json = obj.toString();

    } else if (obj instanceof String) {
      json = ((String) obj).trim();

    } else if (obj instanceof java.util.Map || obj instanceof java.util.List) {
      // Map ou List pode conter valores javax.json.JsonValue internos.
      // Serializa manualmente para JSON string, tratando tipos JSON-P
      // via toString() durante a recursão.
      StringBuilder sb = new StringBuilder();
      toJson(obj, sb);
      json = sb.toString();

    } else {
      throw new Exception("Tipo inválido para inserção no MongoDB: " + obj.getClass().getName());
    }

    // =========================
    // Insere no MongoDB
    // =========================
    if (json.startsWith("[")) {

      // BATCH INSERT (Lista/Array JSON)
      // Usa org.bson.Document.parse() para cada objeto do array
      // Faz parse manual do array JSON para evitar dependência do Jackson
      json = json.trim();
      java.util.List<org.bson.Document> documents = new java.util.ArrayList<>();
      // Remove os colchetes externos
      String inner = json.substring(1, json.length() - 1).trim();
      // Divide os objetos JSON do array respeitando aninhamento
      int depth = 0;
      int start = -1;
      for (int i = 0; i < inner.length(); i++) {
        char c = inner.charAt(i);
        if (c == '{') {
          if (depth == 0) start = i;
          depth++;
        } else if (c == '}') {
          depth--;
          if (depth == 0 && start >= 0) {
            String docJson = inner.substring(start, i + 1);
            documents.add(org.bson.Document.parse(docJson));
            start = -1;
          }
        }
      }

      if (documents.isEmpty()) {
        throw new Exception("Array JSON não contém objetos válidos.");
      }

      collection.insertMany(documents);
      return VariantPool.get(documents.size());
    }

    // SINGLE INSERT
    org.bson.Document document = org.bson.Document.parse(json);
    collection.insertOne(document);
    return VariantPool.get(document.get("_id"));

  } catch (com.mongodb.DuplicateKeyException e) {
    throw new WFRRuleStopException(ExceptionMessage.ERROR_RULE_EXECUTION_FAILED, e.getMessage());
  }
}

/**
 * Serializador JSON recursivo manual.
 * Converte Map, List e valores primitivos para JSON string.
 * Tipos JSON-P (javax.json.*) são tratados via toString().
 * Não depende de Jackson nem de nenhuma biblioteca externa.
 */
@SuppressWarnings("unchecked")
private void toJson(Object value, StringBuilder sb) {
  if (value == null) {
    sb.append("null");
    return;
  }

  String cn = value.getClass().getName();
  boolean isJsonP = cn.startsWith("javax.json.")
      || cn.startsWith("org.eclipse.parsson.")
      || cn.startsWith("org.glassfish.json.");

  if (isJsonP) {
    // Tipos JSON-P geram JSON válido via toString()
    sb.append(value.toString());

  } else if (value instanceof java.util.Map) {
    java.util.Map<Object, Object> map = (java.util.Map<Object, Object>) value;
    sb.append('{');
    boolean first = true;
    for (java.util.Map.Entry<Object, Object> entry : map.entrySet()) {
      if (!first) sb.append(',');
      first = false;
      sb.append('"');
      escapeJsonString(String.valueOf(entry.getKey()), sb);
      sb.append('"');
      sb.append(':');
      toJson(entry.getValue(), sb);
    }
    sb.append('}');

  } else if (value instanceof java.util.List) {
    java.util.List<Object> list = (java.util.List<Object>) value;
    sb.append('[');
    for (int i = 0; i < list.size(); i++) {
      if (i > 0) sb.append(',');
      toJson(list.get(i), sb);
    }
    sb.append(']');

  } else if (value instanceof String) {
    sb.append('"');
    escapeJsonString((String) value, sb);
    sb.append('"');

  } else if (value instanceof Number || value instanceof Boolean) {
    sb.append(value.toString());

  } else {
    // Fallback: trata como string
    sb.append('"');
    escapeJsonString(value.toString(), sb);
    sb.append('"');
  }
}

/**
 * Escapa caracteres especiais de JSON em uma string.
 */
private void escapeJsonString(String s, StringBuilder sb) {
  for (int i = 0; i < s.length(); i++) {
    char c = s.charAt(i);
    switch (c) {
      case '"':  sb.append("\\\""); break;
      case '\\': sb.append("\\\\"); break;
      case '\b': sb.append("\\b");  break;
      case '\f': sb.append("\\f");  break;
      case '\n': sb.append("\\n");  break;
      case '\r': sb.append("\\r");  break;
      case '\t': sb.append("\\t");  break;
      default:
        if (c < 0x20) {
          sb.append("\\u");
          sb.append(String.format("%04x", (int) c));
        } else {
          sb.append(c);
        }
    }
  }
}
```

# Funções Nativas - Firebase

Total: **18** funções

[← Voltar para Funções Nativas](README.md)

---

## Firebase - Ao Desconectar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseOnDisconnect` |
| **Código** | 782 |
| **Assinatura** | `Firebase - Ao Desconectar (Variante;Variante;Variante)` |
| **Parâmetros** | Variante;Variante;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Atualiza o valor de um nó/chave quando a conexão com o Firebase for encerrada. 
A conexão com o Firebase pode ser encerrada por falta de conexão com internet, por exemplo.

Parâmetro(s):
1. Referência da conexão. (Variante) (Ver observação 1)
1. Nome do Nó. (Variante)
3. JSON ou Valor (Literal). (Variante)

Retorno:
Não possui.

Observação:
No 1º Parâmetro caso seja Maker Mobile e na camada Cliente, será obtido automaticamente.

### Código Servidor (Java)

```java
protected Variant ebfFirebaseOnDisconnect(Variant ref, Variant node, Variant data) throws Exception{
  com.google.firebase.database.DatabaseReference reff = (com.google.firebase.database.DatabaseReference) ref.getObject();
  if(node.getString() != "null") {
    com.google.firebase.database.OnDisconnect onDisconnect = reff.child(node.getString()).onDisconnect();
    com.google.firebase.database.DatabaseReference.CompletionListener completionListener = (databaseError, databaseReference) -> {
      if (databaseError != null) {
        logger.error("OnDisconnect setValue failed: " + databaseError.getMessage());
      } else {
        logger.info("OnDisconnect setValue succeeded.");
      }
    };

    if(data.getObject() instanceof jakarta.json.JsonObject) {
      jakarta.json.JsonObject jsonData = (jakarta.json.JsonObject) data.getObject();
      Map<String, Object> dataMap = jsonToMap(jsonData);
      onDisconnect.setValue(dataMap, completionListener);
    } else{
      onDisconnect.setValue(data.getString(), completionListener);
    }
  }

  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFirebaseOnDisconnect(ref, node, data){
  var database = firebase.database().ref(node);
  database.onDisconnect().set(data);
}
```

---

## Firebase - Atualizar Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseWriteData` |
| **Código** | 783 |
| **Assinatura** | `Firebase - Atualizar Dados (Variante;Variante;Variante;Variante;Lógico;Fluxo;Variante;Fluxo;Variante): Letras` |
| **Parâmetros** | Variante;Variante;Variante;Variante;Lógico;Fluxo;Variante;Fluxo;Variante |
| **Retorno** | Letras |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Atualiza ou insere um nó no banco de dados Firebase.

Parâmetro(s):
1. Referência da Conexão. (Variante) (Ver observação 1)
2. Nó de Inserção/Atualização. (Variante)
3. ID do Registro. (Variante)
4. Dados (JSON). (Variante)
5. Assíncrono? (Lógico) (Ver observação 3)
6. Fluxo de sucesso. (Fluxo)
7. Parâmetros do fluxo de sucesso (Lista de Parâmetros). (Variante)
8. Fluxo de erro. (Fluxo)
9. Parâmetros do fluxo de erro (Lista de Parâmetros). (Variante)

Retorno:
ID Gerado. (No caso de inserção, ao atualizar, será retornado o mesmo ID), caso a função seja assíncrona, o fluxo de sucesso receberá o ID no primeiro parâmetro.

Observações:
1. No 1º Parâmetro caso seja Maker Mobile e na camada Cliente, será obtido automaticamente.
2. Caso o ID não seja informado, os dados serão inseridos no banco. Caso o ID seja informado, os dados serão atualizados
3. Ao passar esse parâmetro como TRUE, a função irá se comportar de forma assíncrona. Após a escrita, o fluxo de sucesso é chamado recebendo no 1º Parâmetro o ID do registro, caso contrario, o fluxo de erro será acionado recebendo a causa do erro no 1º Parâmetro.

### Código Servidor (Java)

```java
protected final Variant ebfFirebaseWriteData(Variant ref, Variant node, Variant udid, Variant data) throws Exception {
  com.google.firebase.database.DatabaseReference reff = (com.google.firebase.database.DatabaseReference) ref.getObject();
  String nodeAUX = node.getString();
  String udidAUX = (udid.getString().isEmpty() || udid == null)
      ? reff.child(nodeAUX).push().getKey()
      : udid.getString();

  com.google.firebase.database.DatabaseReference.CompletionListener completionListener = (databaseError, databaseReference) -> {
    if (databaseError != null) {
      logger.error("Error saving data to Firebase: " + databaseError.getMessage());
    } else {
      logger.info("Data saved successfully in: " + databaseReference.toString());
    }
  };

  if(data.getObject() instanceof jakarta.json.JsonObject) {
    jakarta.json.JsonObject jsonData = (jakarta.json.JsonObject) data.getObject();
    Map<String, Object> dataMap = jsonToMap(jsonData);
    reff.child(nodeAUX).child(udidAUX).setValue(dataMap, completionListener);
  } else {
    reff.child(nodeAUX).child(udidAUX).setValue(data.getObject(), completionListener);
  }

  return VariantPool.get(udidAUX);
}

protected final Variant ebfFirebaseWriteData(
    Variant ref, 
    Variant node, 
    Variant udid, 
    Variant data, 
    Variant async, 
    Variant onSuccess, 
    Variant onSuccessParams, 
    Variant errorRule, 
    Variant errorParams) throws Exception {

  if(!async.getBoolean()) {
    return ebfFirebaseWriteData(ref, node, udid, data);
  } else {
    com.google.firebase.database.DatabaseReference reff = (com.google.firebase.database.DatabaseReference) ref.getObject();  
    String nodeAUX = node.getString();
    String udidAUX = (udid.getString().isEmpty() || udid == null)
        ? reff.child(nodeAUX).push().getKey()
        : udid.getString();
    
    final String finalUID = udidAUX;
    final java.util.List<Variant> paramsFinal = (java.util.ArrayList<Variant>) onSuccessParams.getObject();
    final java.util.List<Variant> paramsFinalError = (java.util.ArrayList<Variant>) errorParams.getObject();
    final String ruleSuccess = onSuccess.getString();
    final String ruleError = errorRule.getString();
    
    com.google.firebase.database.DatabaseReference.CompletionListener completionListener = (databaseError, databaseReference) -> {
      if (databaseError != null) {
        try {
          paramsFinalError.set(0, new Variant(databaseError.getMessage()));
          ebfFlowExecute(new Variant(ruleError), new Variant(paramsFinalError));
        } catch (Exception e) {
          logger.error(e);
        }
      } else {
        try {
          paramsFinal.set(0, new Variant(finalUID));
          ebfFlowExecute(new Variant(ruleSuccess), new Variant(paramsFinal));
        } catch (Exception e) {
          logger.error(e);
        }
      }
    };

    if(data.getObject() instanceof jakarta.json.JsonObject) {
      jakarta.json.JsonObject jsonData = (jakarta.json.JsonObject) data.getObject();
      Map<String, Object> dataMap = jsonToMap(jsonData);
      reff.child(nodeAUX).child(udidAUX).setValue(dataMap, completionListener);
    } else {
      reff.child(nodeAUX).child(udidAUX).setValue(data.getObject(), completionListener);
    }
  }

  return Variant.VARIANT_STRING_EMPTY;
}

protected final Map<String, Object> jsonToMap(jakarta.json.JsonObject json) throws WFRRuleException, Exception {
  Map<String, Object> retMap = new HashMap<String, Object>();
  if(json != jakarta.json.JsonObject.NULL) {
    retMap = toMap(json);
  }

  return retMap;
}

protected final Map<String, Object> toMap(jakarta.json.JsonObject object) throws WFRRuleException, Exception {
  Map<String, Object> map = new HashMap<String, Object>();
  ArrayList keys = (ArrayList) ebfGetListKeysObjectJson(new Variant(object)).getObject();
  int j = 0;
  while(keys.size() > j) {
    String key = keys.get(j).toString();
    Object value = ebfGetValueObjectJson(new Variant(object), new Variant(key)).getObject();
    if(value instanceof jakarta.json.JsonArray) {
      value = toList((jakarta.json.JsonArray) value);
    } else if(value instanceof jakarta.json.JsonObject) {
      value = toMap((jakarta.json.JsonObject) value);
    } else if(value != jakarta.json.JsonObject.NULL){
      map.put(key, value);
    }

    j++;
  }

  return map;
}

protected final List<Object> toList(jakarta.json.JsonArray array) throws wfr.exceptions.WFRRuleException, Exception {
  List<Object> list = new ArrayList<Object>();
  Object mapValue;
  for(int i = 0; i < array.size(); i++) {
    jakarta.json.JsonValue value =  array.get(i);
    if(value instanceof jakarta.json.JsonArray) {
      value = (jakarta.json.JsonValue) toList((jakarta.json.JsonArray) value);
    } else if(value instanceof jakarta.json.JsonObject) {
      mapValue =  toMap((jakarta.json.JsonObject) value);
      list.add(mapValue);
      continue;
    } else if(value.getValueType().equals(jakarta.json.JsonValue.ValueType.STRING)) {
      list.add(array.getString(i));
    } else if(value.getValueType().equals(jakarta.json.JsonValue.ValueType.FALSE) 
        ||value.getValueType().equals(jakarta.json.JsonValue.ValueType.TRUE)) {

      list.add(array.getBoolean(i));
    } else if(value.getValueType().equals(jakarta.json.JsonValue.ValueType.NUMBER)) {
      if (array.getJsonNumber(i).getClass().getSimpleName().equalsIgnoreCase("JsonBigDecimalNumber")) {
        list.add(array.getJsonNumber(i).doubleValue());
      } else if (array.getJsonNumber(i).getClass().getSimpleName().equalsIgnoreCase("JsonIntNumber")) {
        list.add(array.getJsonNumber(i).intValue());
      } else {
        list.add(array.getJsonNumber(i).longValue());
      }
    }
  }

  return list;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFirebaseWriteData(ref, node, udid, data, async, onSuccess, onSuccessParams, onError, onErrorParams){
  var database = firebase.database().ref(node);
  
  if(udid === '' || udid == null || udid === undefined){
   udid = database.push().key;
  }
     
  var updates = {};
  updates[udid] = data; 
  if(!async){
    database.update(updates);
    return udid; 
  } else {
    database.update(updates).then(function () {
      firebaseCallbackFunction(udid, false);
    }).catch(function (error) {
      firebaseCallbackFunction(error.message, true);
    });
  }
  
  function firebaseCallbackFunction(value, error) {
    var parametros;
    if(!error){
      if (onSuccessParams)
        parametros = [value].concat(onSuccessParams);
      else
        parametros = [value];

      var ruleCallback = onSuccess;

      if (ruleCallback) {
        executeRuleFromJS(ruleCallback, parametros);
      }
    }else{
      if (onErrorParams)
        parametros = [value].concat(onErrorParams);
      else
        parametros = [value];

      var ruleCallbackError = onError;

      if (ruleCallbackError) {
        executeRuleFromJS(ruleCallbackError, parametros);
      }
    }
  }
}
```

---

## Firebase - Conectar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseConnect` |
| **Código** | 784 |
| **Assinatura** | `Firebase - Conectar (Variante;Variante;Fluxo;Variante): Variante` |
| **Parâmetros** | Variante;Variante;Fluxo;Variante |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Efetua a conexão com o banco de dados Firebase. Nos casos de utilização no Mobile, o banco a ser conectado será o configurado no projeto cadastrado no Firebase.

Parâmetro(s):
1. Caminho do arquivo de conexão '.json' (No Maker Mobile, será obtido automaticamente. Informar o JSON de conexão quando utilizada na camada Cliente). (Ver observação 5)
2. URL do banco (No Maker Mobile e na camada Cliente, será obtido automaticamente).
3. Fluxo de Callback (Aplicado apenas para camada Cliente, este parâmetro recebe o nome do fluxo que será executado quando a conexão com o banco for estabelecida).
4. Lista de Parâmetros para o fluxo indicado no 3º parâmetros.

Retorno:
Retorna a referência da conexão quando utilizado na camada servidor ou mobile (quando utilizada na camada Cliente, o retorno será nulo).

Observações:
1. Os dados para conexão com o banco de dados são obtidos no cadastro do projeto no Console do Firebase.
2. Endereço do console do Firebase: https://console.firebase.google.com/
3. No Mobile o arquivo de configuração deverá ser upado no servidor do Maker Mobile através da opção "Configurações Adicionais" disponível na tela de exportação do projeto.
4. A  leitura do arquivo "google-services.json" (Android) ou "google-services.plist" (iOS) será realizada de forma automática.
5. Para a camada cliente deverá ser o retorno da função JSON - Criar Objeto, copiar o JSON (texto) disponibilizado após configurar o projeto para Web no Firebase ( No link https://firebase.google.com/docs/web/setup?hl=pt-br e seção "Objeto de configuração do Firebase") . Para utilizar na camada servidor, deverá ser habilitado o Firebase Admin SDK conforme documentação: https://firebase.google.com/docs/admin/setup

### Código Servidor (Java)

```java
protected final Variant ebfFirebaseConnect(Variant pathJsonVar, Variant urlVar) throws Exception {
  return ebfFirebaseConnect(pathJsonVar, urlVar, Variant.VARIANT_NULL, Variant.VARIANT_NULL);
} 

protected final Variant ebfFirebaseConnect(Variant pathJsonVar, Variant urlVar, Variant rule, Variant params) throws Exception {
  String pathJson = pathJsonVar.getString();
  String url      = urlVar.getString();
  if (com.google.firebase.FirebaseApp.getApps().isEmpty()) {
    FileInputStream serviceAccount = new FileInputStream(pathJson);

    com.google.firebase.FirebaseOptions options = com.google.firebase.FirebaseOptions.builder()
        .setCredentials(com.google.auth.oauth2.GoogleCredentials.fromStream(serviceAccount))
        .setDatabaseUrl(url)
        .build();
    
    com.google.firebase.FirebaseApp.initializeApp(options);
  }

  com.google.firebase.database.FirebaseDatabase database = com.google.firebase.database.FirebaseDatabase.getInstance();
  com.google.firebase.database.DatabaseReference reference = database.getReference();
  return new Variant(reference);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFirebaseConnect(jsonConfig, url, ruleCallback, paramsRuleCallback){
  loadAsync("https://www.gstatic.com/firebasejs/5.2.0/firebase.js", callbackFunction);  
 
  function callbackFunction(){
    firebase.initializeApp(jsonConfig);
    firebaseCallbackFunction();   
  }  

  window.firebaseCallbackFunction = function(){  
    var parametros = paramsRuleCallback;
    var ruleCallbackExec = ruleCallback;

    if(ruleCallbackExec){
      executeRuleFromJS(ruleCallbackExec, parametros);
    }
  }
}

function loadAsync(src, callback){
  var script = document.createElement('script');
  script.src = src; 
  script.type = 'text/javascript';
  script.async = true;
  if(callback != null){
      if (script.readyState) {
          script.onreadystatechange = function() {
              if (script.readyState == "loaded" || script.readyState == "complete") {
                  script.onreadystatechange = null;
                  callback();
              }
          };
      } else {
          script.onload = function() {
              callback();
          };
      }
  }
  document.head.appendChild(script);
}
```

---

## Firebase - GeoFire - Definir Local

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGeoFireSetPosition` |
| **Código** | 885 |
| **Assinatura** | `Firebase - GeoFire - Definir Local (Letras;Letras;Letras;Letras;Fluxo;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Fluxo;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente |

### Descrição

Define a localização atual para uso posterior com as funções de Georreferenciamento. 

Parâmetro(s):
1. Nó onde será armazenada a posição (latitude e longitude). (Letras)
2. Chave. (Letras)
3. Latitude. (Letras)
4. Longitude. (Letras)
5. Fluxo de callback. (Opcional)
6. Parâmetros Extra para o fluxo de callback. (Variante, Opcional)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGeoFireSetPosition(){}
```

---

## Firebase - GeoFire - Monitorar Área

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGeoFireWatchArea` |
| **Código** | 886 |
| **Assinatura** | `Firebase - GeoFire - Monitorar Área (Letras;Fracionado;Fracionado;Fracionado;Fluxo;Variante)` |
| **Parâmetros** | Letras;Fracionado;Fracionado;Fracionado;Fluxo;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente |

### Descrição

Monitora as atualizações que ocorrerem dentro de uma determinada área.

Parâmetro(s):
1. Nó que será monitorado (onde são enviadas as atualizações de GPS). (Letras)
2. Latitude. (Fracionado)
3. Longitude. (Fracionado)
4. Raio (em KM). (Fracionado)
5. Fluxo que receberá os dados de monitoramento. (Ver observação)
6. Lista de parâmetros extra para o fluxo. (Variante)

Retorno:
Não possui.

Observação:
No 5º Parâmetro deve ser informado o fluxo que deverá deixar o 1º Parâmetro reservado para recebimento das atualizações. Será enviado um JSON com as seguintes
    chaves/informações:
    {
        "action": ""
        "latitude": 37.7832,
         "longitude": -122.4056 
    }

### Código Cliente (JavaScript)

```javascript
function ebfGeoFireWatchArea(){}
```

---

## Firebase - GeoFire - Parar Monitoramento da Área

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGeoFireStopWatching` |
| **Código** | 887 |
| **Assinatura** | `Firebase - GeoFire - Parar Monitoramento da Área ()` |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função remove o monitoramento da área.
Desta forma, quando um elemento entrar ou sair da área especificada, o fluxo associado anteriormente não será executado.

Parâmetro:
Não possui.

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGeoFireStopWatching(){}
```

---

## Firebase - Ler Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseReadData` |
| **Código** | 785 |
| **Assinatura** | `Firebase - Ler Dados (Variante;Letras;Letras;Letras;Letras;Fluxo;Variante;Fluxo;Variante)` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Letras;Fluxo;Variante;Fluxo;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Lê um nó/registro em um no banco de dados Firebase.

Parâmetro(s):
1. Referência da Conexão(No Maker Mobile e na camada Cliente, será obtido automaticamente).
2. Nome do Nó.
3. Filtro a ser realizado (JSON).
4. Tipo de Ordenação ("F": Ordenar resultados pelo valor de uma chave filho específica; "C": Ordenar resultados por chaves filho;
    "V": Ordenar resultados por valores filhos. 
5. Valor de ordenação (Somente para o tipo "F". Informar o nome de um nó filho para ordenação).
6. Fluxo que receberá os dados lidos (JSON).
7. Lista de parâmetros extra para o fluxo(Na camada cliente não se faz necessário reservar os parâmetros automáticos da função).
8. Fluxo que receberá no primeiro parâmetro a mensagem de erro, quando o mesmo ocorrer (Letras).
9. Lista de parâmetros extra para o fluxo de Erro.

Retorno:
Não possui.

Observação:
O fluxo deverá ter o primeiro parâmetro reservado para recebimento dos dados lidos (Objeto JSON).

Exemplo: 
Para o 3º Parâmetro segue exemplo abaixo, serão retornados os primeiros 12 elementos que iniciam com "A" e terminam com "D"
{
  "first": 12,
  "startWith": "A",
  "endsWith": "D"
}

### Código Servidor (Java)

```java
protected final Variant ebfFirebaseReadData(Variant ref, Variant node, Variant filter, Variant orderType, Variant orderData, Variant onSuccess, Variant onSuccessParams, Variant onError, Variant onErrorParams) throws Exception{
    final Variant ruleName = onSuccess;
    final Variant ruleNameParams = onSuccessParams;
    final Variant ruleNameError = onError;
    final Variant ruleNameParamsError = onErrorParams;
    com.google.firebase.database.DatabaseReference reference = (com.google.firebase.database.DatabaseReference) ref.getObject();

    com.google.firebase.database.Query resultset = null;
    resultset = reference.child(node.getString());
    resultset = doOrder(resultset, orderType, orderData);

    if(!filter.getString().equals("")) {
      resultset = doFilter(resultset, filter);
    }

    resultset.addListenerForSingleValueEvent(new com.google.firebase.database.ValueEventListener() {
    @Override
    public void onDataChange(com.google.firebase.database.DataSnapshot dataSnapshot) {
    try {

      jakarta.json.JsonObject jReturn = (jakarta.json.JsonObject) ebfCreateObjectJSON(new Variant("{}")).getObject();

      if (dataSnapshot.getValue() instanceof java.util.HashMap){
        jReturn = mapToJson((java.util.Map<String, java.lang.Object>) dataSnapshot.getValue());
      }else if (dataSnapshot.getValue() instanceof jakarta.json.JsonObject){
        jReturn = (jakarta.json.JsonObject) dataSnapshot.getValue();
      }else{
        jReturn = (jakarta.json.JsonObject) ebfCreateObjectJSON(new Variant("{}")).getObject();
        jReturn = (jakarta.json.JsonObject) ebfUpdateValueObjectJson(new Variant(jReturn), new Variant(dataSnapshot.getKey()), new Variant(dataSnapshot.getValue())).getObject();
      }

    java.util.List<Variant> params = (java.util.ArrayList<Variant>) ruleNameParams.getObject();
    params.set(0, new Variant(jReturn));
    ebfFlowExecute(new Variant(ruleName.getString()), new Variant(params));

    } catch (java.lang.Exception e) {
      e.printStackTrace();
    }
  }

    @Override
    public void onCancelled(com.google.firebase.database.DatabaseError databaseError) {
      try {
      java.util.List<Variant> params = (java.util.ArrayList<Variant>) ruleNameParamsError.getObject();
      params.set(0, new Variant(databaseError.getMessage()));
      ebfFlowExecute(new Variant(ruleNameError.getString()), new Variant(params));
      } catch (java.lang.Exception e) {
        e.printStackTrace();
      }
    }

      private jakarta.json.JsonObject mapToJson(java.util.Map<java.lang.String, java.lang.Object> map) throws wfr.exceptions.WFRRuleException, Exception {
        jakarta.json.JsonObject json = (jakarta.json.JsonObject) ebfCreateObjectJSON(new Variant("{}")).getObject();
        java.util.Iterator<java.util.Map.Entry<java.lang.String, java.lang.Object>> it = map.entrySet().iterator();

        while (it.hasNext()) {
          java.util.Map.Entry<java.lang.String, java.lang.Object> pair = it.next();
          java.lang.String key = pair.getKey();
          java.lang.Object value = pair.getValue();

          if (value instanceof java.util.Map) {
            json = (jakarta.json.JsonObject) ebfUpdateValueObjectJson(new Variant(json), new Variant(key), new Variant(mapToJson((java.util.Map<java.lang.String, java.lang.Object>) value))).getObject();
          } else {
            json = (jakarta.json.JsonObject) ebfUpdateValueObjectJson(new Variant(json), new Variant(key), new Variant(value)).getObject();
          }
        }
      return json;
    }      

    });

    return Variant.VARIANT_NULL;
    
  }

  protected final com.google.firebase.database.Query doFilter(com.google.firebase.database.Query resultSet, Variant filter) throws Exception {
    if(filter.getString() != "null") {
      jakarta.json.JsonObject jFilter = (jakarta.json.JsonObject) filter.getObject();
      java.util.ArrayList keysItr = (ArrayList) ebfGetListKeysObjectJson(new Variant(jFilter)).getObject();
      int j = 0;
      while (keysItr.size() > j) {
        java.lang.String key = keysItr.get(j).toString();
        java.lang.Object value = ebfGetValueObjectJson(new Variant(jFilter), new Variant(key)).getObject();

        switch (key) {
          case "equalTo":
            resultSet = doParseValue("eq", resultSet, value);
            break;
          case "first":
            resultSet = resultSet.limitToFirst(Integer.parseInt(value.toString()));
            break;
          case "last":
            resultSet = resultSet.limitToLast(Integer.parseInt(value.toString()));
            break;
          case "startWith":
            resultSet = doParseValue("sw", resultSet, value);
            break;
          case "endsWith":
            resultSet = doParseValue("ew", resultSet, value);
            break;
        }
        j++;
      }
    }
    return resultSet;
  }

  protected final com.google.firebase.database.Query doParseValue(java.lang.String filter, com.google.firebase.database.Query resultSet, java.lang.Object value) {

    if(value != null){
      switch(value.getClass().getSimpleName()) {
        case "Integer":
          if(filter.equals("sw")){
            return resultSet.startAt(Integer.parseInt(value.toString()));
          }else if(filter.equals("ew")){
            return resultSet.endAt(Integer.parseInt(value.toString()));
          }else{
            return resultSet.equalTo(Integer.parseInt(value.toString()));
          }
        case "Number":
          if(filter.equals("sw")){
            return resultSet.startAt(Double.parseDouble(value.toString()));
          }else if(filter.equals("ew")){
            return resultSet.endAt(Double.parseDouble(value.toString()));
          }else{
            return resultSet.equalTo(Double.parseDouble(value.toString()));
          }
        case "Boolean":
          if(filter.equals("sw")){
            return resultSet.startAt(Boolean.valueOf(value.toString()));
          }else if(filter.equals("ew")){
            return resultSet.endAt(Boolean.valueOf(value.toString()));
          }else{
            return resultSet.equalTo(Boolean.valueOf(value.toString()));
          }
        default:
          if(filter.equals("sw")){
            return resultSet.startAt(value.toString());
          }else if(filter.equals("ew")){
            return resultSet.endAt(value.toString());
          }else{
            return resultSet.equalTo(value.toString());
          }
      }
    }else{
      if(filter.equals("sw")){
        return resultSet.startAt(null);
      }else if(filter.equals("ew")){
        return resultSet.endAt(null);
      }else{
        return resultSet.equalTo(null);
      } 
    }
  }  

  protected final com.google.firebase.database.Query doOrder(com.google.firebase.database.Query resultSet, Variant orderType, Variant orderNode) {

    if(orderType.getString().equals("V")) {
      return resultSet.orderByValue();
    }else if(orderType.getString().equals("F")) {
      return resultSet.orderByChild(orderNode.getString());
    }else if(orderType.getString().equals("C")){
      return resultSet.orderByKey();
    }

    return resultSet;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFirebaseReadData(ref, node, filter, orderType, orderData, onSuccess, onSuccessParams) {
  var database = firebase.database().ref(node);

  if (filter) {
    var first = filter.first,
        last = filter.last,
        startAt = filter.startAt,
        endAt = filter.endAt,
        equalTo = filter.equalTo;


    if (orderType == 'F') {
      database = database.orderByChild(orderData);
    } else if (orderType == 'C') {
      database = database.orderByKey();
    } else if (orderType == 'V') {
      database = database.orderByValue();
    }

    if (first)
      database = database.limitToFirst(first);

    if (last)
      database = database.limitToLast(last);

    if (filter.hasOwnProperty('startAt'))
      database = database.startAt(startAt);

    if (filter.hasOwnProperty('endAt'))
      database = database.endAt(endAt);

    if (filter.hasOwnProperty('equalTo'))
      database = database.equalTo(equalTo);
  }

  database.once('value').then(function (snapshot) {
    return firebaseReadCallbackFunction(snapshot.val() ? snapshot.val() : {});
  });

  function firebaseReadCallbackFunction(value) {
    var parametros;
    if (onSuccessParams) parametros = [value].concat(onSuccessParams);else parametros = [value];

    var ruleCallback = onSuccess;

    if (ruleCallback) {
      executeRuleFromJS(ruleCallback, parametros);
    }
  };
}
```

---

## Firebase - Monitorar Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseMonitoringData` |
| **Código** | 786 |
| **Assinatura** | `Firebase - Monitorar Dados (Variante;Letras;Letras;Letras;Letras;Fluxo;Variante)` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Letras;Fluxo;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Monitora alterações/atualizações de um nó/registro em um no banco de dados Firebase.

Parâmetro(s):
1. Referência da Conexão (No Maker Mobile e na camada Cliente, será obtido automaticamente).
2. Nome do Nó a ser monitorado.
3. Filtro a ser realizado (JSON).
4. Tipo de Ordenação ("F": Ordenar resultados pelo valor de uma chave filho específica; "C": Ordenar resultados por chaves filho;
    "V": Ordenar resultados por valores filhos. 
5. Valor de ordenação (Somente para o tipo "F". Informar o nome de um nó filho para ordenação)
6. Fluxo que receberá os dados de monitoramento.
    O fluxo deverá deixar dois parâmetros reservados. O primeiro receberá a ação realizada que é "A": Adição; "D": Remoção; "U": Atualização
    O segundo será o JSON com os dados recebidos.
7. Lista de parâmetros extra para o fluxo(Na camada cliente não se faz necessário reservar os parâmetros automáticos da função).

Retorno:
Não possui.

Exemplo: 
Para o 3º Parâmetro no exemplo abaixo, serão monitorados os primeiros 12 elementos que iniciam com "A" e terminam com "D"
{
  "first": 12,
  "startWith": "A",
  "endWith": "D"
}

### Código Servidor (Java)

```java
protected final Variant ebfFirebaseMonitoringData(Variant ref, Variant node, Variant filter, Variant orderType, Variant orderData, Variant onSuccess, Variant onSuccessParams) throws Exception{
  final Variant ruleName = onSuccess;
  final Variant ruleNameParams = onSuccessParams;
  com.google.firebase.database.DatabaseReference reference = (com.google.firebase.database.DatabaseReference) ref.getObject();

  com.google.firebase.database.Query resultset = null;
  
  resultset = reference.child(node.getString());
  resultset = doOrder(resultset, orderType, orderData);
  if(!filter.getString().equals("")) {
    resultset = doFilter(resultset, filter);
  }
    
  resultset.addChildEventListener(new com.google.firebase.database.ChildEventListener() {
    @SuppressWarnings("unchecked")
    public void runCallSuccessEvent(java.lang.String action, com.google.firebase.database.DataSnapshot dataSnapshot, java.lang.String s) throws wfr.exceptions.WFRRuleException, Exception{
      jakarta.json.JsonObject jReturn = (jakarta.json.JsonObject) ebfCreateObjectJSON(new Variant("{}")).getObject();
      if (dataSnapshot.getValue() instanceof java.util.HashMap){
        try {
          jReturn = mapToJson((java.util.Map<java.lang.String, java.lang.Object>) dataSnapshot.getValue());
        } catch (org.json.JSONException e) {
            e.printStackTrace();
          }
      }else if (dataSnapshot.getValue() instanceof jakarta.json.JsonObject){
        jReturn = (jakarta.json.JsonObject) dataSnapshot.getValue();
      }else{
        jReturn = (jakarta.json.JsonObject) ebfCreateObjectJSON(new Variant("{}")).getObject();
        try {
          jReturn = (jakarta.json.JsonObject) ebfUpdateValueObjectJson(new Variant(jReturn), new Variant(dataSnapshot.getKey()), new Variant(dataSnapshot.getValue())).getObject();
        } catch (org.json.JSONException e) {
            e.printStackTrace();
          }
      }
      
      try {
        execCallSuccessRule(ruleName.getString(), ruleNameParams, action, jReturn, s);
      } catch (java.lang.Exception e) {
          e.printStackTrace();
        } 
            
    }
    
  private jakarta.json.JsonObject mapToJson(java.util.Map<java.lang.String, Object> map) throws Exception {
    jakarta.json.JsonObject json = (jakarta.json.JsonObject) ebfCreateObjectJSON(new Variant("{}")).getObject();
    java.util.Iterator<java.util.Map.Entry<String, Object>> it = map.entrySet().iterator();
    
    while (it.hasNext()) {
      java.util.Map.Entry<String, Object> pair = it.next();
      java.lang.String key = pair.getKey();
      java.lang.Object value = pair.getValue();
      
      if (value instanceof java.util.Map) {
        json = (jakarta.json.JsonObject) ebfUpdateValueObjectJson(new Variant(json), new Variant(key), new Variant(mapToJson((java.util.Map<java.lang.String, Object>) value))).getObject();
      } else {
          json = (jakarta.json.JsonObject) ebfUpdateValueObjectJson(new Variant(json), new Variant(key), new Variant(value)).getObject();
        }
    }
      return json;
  }
      
  
  protected void execCallSuccessRule(java.lang.String onSuccess, Variant onSuccessParams, java.lang.String action, jakarta.json.JsonObject jReturn, java.lang.String s) throws Exception {        
    java.util.List<Variant> params = (java.util.ArrayList<Variant>) onSuccessParams.getObject();
    params.set(0, new Variant(action));
    params.set(1, new Variant(jReturn));
    params.set(2, new Variant(s));
    
    ebfFlowExecute(new Variant(onSuccess), new Variant(params));
          
  }

  @Override
  public void onChildAdded(com.google.firebase.database.DataSnapshot arg0, java.lang.String arg1) {
    try {
    runCallSuccessEvent("A", arg0, arg0.getKey());
  } catch (Exception e) {
    e.printStackTrace();
  }
  }

  @Override
  public void onChildChanged(com.google.firebase.database.DataSnapshot arg0, java.lang.String arg1) {
    try {
      runCallSuccessEvent("U", arg0, arg0.getKey());
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
      
  @Override
  public void onChildRemoved(com.google.firebase.database.DataSnapshot arg0) {
    try {
    runCallSuccessEvent("D", arg0, arg0.getKey());
  } catch (Exception e) {
    e.printStackTrace();
  }
  }

  @Override
  public void onChildMoved(com.google.firebase.database.DataSnapshot arg0, java.lang.String arg1) {}

  @Override
  public void onCancelled(com.google.firebase.database.DatabaseError arg0) {}      
  
  }); 
  
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFirebaseMonitoringData(ref, node, filter, orderType, orderData, onSuccess, onSuccessParams) {

  var database = firebase.database().ref(node);

  if (filter) {
    var first = filter.first,
        last = filter.last,
        startAt = filter.startAt,
        endAt = filter.endAt,
        equalTo = filter.equalTo;


    if (orderType == 'F') {
      database = database.orderByChild(orderData);
    } else if (orderType == 'C') {
      database = database.orderByKey();
    } else if (orderType == 'V') {
      database = database.orderByValue();
    }

    if (first)
      database = database.limitToFirst(first);

    if (last)
      database = database.limitToLast(last);

    if (filter.hasOwnProperty('startAt'))
      database = database.startAt(startAt);

    if (filter.hasOwnProperty('endAt'))
      database = database.endAt(endAt);

    if (filter.hasOwnProperty('equalTo'))
      database = database.equalTo(equalTo);
  }

  database.on('child_added', function (snapshot) {
    firebaseCallbackFunction('A', snapshot.val() ? snapshot.val() : {}, snapshot.key);
  });

  database.on('child_changed', function (snapshot) {
    firebaseCallbackFunction('U', snapshot.val() ? snapshot.val() : {}, snapshot.key);
  });

  database.on('child_removed', function (snapshot) {
    firebaseCallbackFunction('D', snapshot.val() ? snapshot.val() : {}, snapshot.key);
  });

  database.on('child_moved', function (snapshot) {
    firebaseCallbackFunction('M', snapshot.val() ? snapshot.val() : {}, snapshot.key);
  });

  function firebaseCallbackFunction(action, value, key) {
    var parametros;
    if (onSuccessParams) parametros = [action, value, key].concat(onSuccessParams);else parametros = [action, value, key];

    var ruleCallback = onSuccess;

    if (ruleCallback) {
      executeRuleFromJS(ruleCallback, parametros);
    }
  };
}
```

---

## Firebase - Parar Monitoramento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirebaseStopMonitoringData` |
| **Código** | 787 |
| **Assinatura** | `Firebase - Parar Monitoramento (Variante;Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função remove o monitoramento do nó especificado.

Parâmetro(s):
1. Referência da conexão. (Variante) (Ver observação 1)
2. Nó que deseja remover o Monitoramento. (Variante)

Retorno:
Não possui.

Observações:
1. Para o 1º Parâmetro no Maker Mobile, será obtido automaticamente.
2. Ao utilizar essa função qualquer alteração que acontecer no nó não executará o fluxo que foi associado com a função "Firebase - Monitorar Dados".

### Código Servidor (Java)

```java
protected final Variant ebfFirebaseStopMonitoringData(Variant ref, Variant node) throws Exception{
  com.google.firebase.database.DatabaseReference reference = (com.google.firebase.database.DatabaseReference) ref.getObject();
  java.util.TreeMap map = (TreeMap) ebfGetSessionAttribute(new Variant("monitoringFirebaseNodes"), new Variant(true)).getObject();

   try{
       com.google.firebase.database.ChildEventListener event = (com.google.firebase.database.ChildEventListener) ebfMapGetObject(new Variant(map), node).getObject();
       reference.getRef().child(node.getString()).removeEventListener(event);
       ebfMapRemoveObject(new Variant(map), node);
       ebfSetSessionAttribute(new Variant("monitoringFirebaseNodes"), new Variant(map), new Variant(true));
   }catch(Exception e){}

  return Variant.VARIANT_NULL;
}
```

---

## MongoDB - Abrir Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMongoDBOpenConnection` |
| **Código** | 1148 |
| **Assinatura** | `MongoDB - Abrir Conexão (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre uma conexão com um banco de dados.

Parâmetro:
1. Url de Conexão. (Letras)

Retorno:
Retorna a referência da conexão. (Variante)

Observação:
Maiores informações da URI: https://docs.mongodb.com/manual/reference/connection-string/ .

Exemplos:
1. Assumindo no 1º Parâmetro como "mongodb://maker:maker@localhost:27017".
2. mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]

### Código Servidor (Java)

```java
protected final Variant ebfMongoDBOpenConnection(Variant uriVar) throws Exception {
  return VariantPool.get(com.mongodb.client.MongoClients.create(uriVar.getString()));
}
```

---

## MongoDB - Atualizar Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLMongoDBUpdate` |
| **Código** | 1149 |
| **Assinatura** | `MongoDB - Atualizar Registro (Variante;Letras;Letras;Variante;Variante)` |
| **Parâmetros** | Variante;Letras;Letras;Variante;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Atualizar um documento ou registro.

Parâmetro(s):
1. Referência da conexão. (Variante)
2. Nome do Banco de Dados. Ex: BD_TESTE;
3. Nome da coleção. Ex: Funcionário;
4. Critério de busca do documento a ser alterado (Mapa). (Variante, Opcional)
5. Dados a serem atualizados (Mapa). (Variante)

Retorno:
Não possui.

Observação: 
Se o parâmetro de critério for omitido, todos os documentos da coleção serão atualizados.

Exemplo:
  Critério:     
      * MAPA: "Criar objeto mapa com parâmetros" com a função "criar lista a partir do elementos", informando sempre chave e valor.
      * Os operadores  mais conhecidos  (>, >=, <, <=, !=, in, !in, or, and, not e nor), podem ser utilizados no critério de busca. 
      * Caso deseje algum operador diferente do citado acima, consulte a documentação: https://docs.mongodb.com/manual/reference/operator/query/       
  Documento novo: 
      * MAPA: "Criar objeto mapa com parâmetros" com a função "criar lista a partir do elementos", informando sempre chave e valor.
      * Pode ser especificados todos o campos, alguns campos ou apenas um campo a ser alterado.

### Código Servidor (Java)

```java
protected final Variant ebfSQLMongoDBUpdate(
    Variant connectionVar, 
    Variant databaseVar, 
    Variant collectionVar,
    Variant queryVar,
    Variant newDocVar) throws Exception {

  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> dbCollection = database.getCollection(collectionVar.getString());

  Map<String, Object> query = (Map<String, Object>) queryVar.getObject();
  Map<String, Object> newDoc = (Map<String, Object>) newDocVar.getObject();

  org.bson.conversions.Bson filter = buildQuery(query);
  org.bson.Document criterion = new org.bson.Document("$set", new org.bson.Document(newDoc));
  dbCollection.updateOne(filter, criterion);
  return Variant.VARIANT_NULL;
}

private org.bson.conversions.Bson buildQuery(Map<String, Object> query) {
  org.bson.conversions.Bson finalFilter = com.mongodb.client.model.Filters.and();
  
  for(Map.Entry<String, Object> entry : query.entrySet()) {
    String operator = entry.getKey();
    Object value = entry.getValue();

    org.bson.conversions.Bson filter;
    switch (operator) {
      case "=" -> filter = com.mongodb.client.model.Filters.eq(value);
      case ">" -> filter = com.mongodb.client.model.Filters.gt(operator, value);
      case ">=" -> filter = com.mongodb.client.model.Filters.gte(operator, value);
      case "<" -> filter = com.mongodb.client.model.Filters.lt(operator, value);
      case "<=" -> filter = com.mongodb.client.model.Filters.lte(operator, value);
      case "!=" -> filter = com.mongodb.client.model.Filters.ne(operator, value);
      case "in" -> filter = com.mongodb.client.model.Filters.in(operator, (Object[]) value);
      case "!in" -> filter = com.mongodb.client.model.Filters.nin(operator, (Object[]) value);
      case "or" -> filter = com.mongodb.client.model.Filters.or((Iterable<org.bson.conversions.Bson>) value);
      case "and" -> filter = com.mongodb.client.model.Filters.and((Iterable<org.bson.conversions.Bson>) value);
      case "not" -> filter = com.mongodb.client.model.Filters.not((org.bson.conversions.Bson) value);
      case "nor" -> filter = com.mongodb.client.model.Filters.nor((Iterable<org.bson.conversions.Bson>) value);
      default -> filter = com.mongodb.client.model.Filters.eq(operator, value);
    }

    finalFilter = com.mongodb.client.model.Filters.and(finalFilter, filter);
  }
  
  return finalFilter;
}
```

---

## MongoDB - Atualizar Registro (JSON)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLMongoDBUpdateJson` |
| **Código** | 1150 |
| **Assinatura** | `MongoDB - Atualizar Registro (JSON) (Variante;Letras;Letras;Variante;Letras)` |
| **Parâmetros** | Variante;Letras;Letras;Variante;Letras |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Atualizar documento ou registro.

Parâmetro(s):
1. Referência da conexão. (Variante)
2. Nome do Banco de Dados. Ex: "BD_TESTE"; (Letras)
3. Nome da coleção. Ex:"Empresa". (Letras)
4. Critério de busca do documento a ser alterado (Mapa). (Variante, Opcional)
5. Dados a serem atualizados (Texto em formato JSON). (Letras)

Retorno:
Não possui.

Observação: 
Se o parâmetro de critério for omitido, todos os documentos da coleção serão atualizados.

Exemplo:
  Critério:  
     * MAPA: "Criar objeto mapa com parâmetros" com a função "criar lista a partir do elementos", informando sempre chave e valor.
     * Os operadores  mais conhecidos  (>, >=, <, <=, !=, in, !in, or, and, not e nor), podem ser utilizados no critério de busca. 
     * Caso deseje algum operador diferente do citado acima, consulte a documentação: https://docs.mongodb.com/manual/reference/operator/query/     
  Documento novo: 
     { 
         "empresa": "Softwell Solutions", 
         "tel": "+55 (71) 2108 3800",  
          "endereco": {   
                 "bairro": "Trobogy",   
                 "cep": "41.730-101",    
                 "complemento": "Parque tecnológico da Bahia, Salas 204, 205 e 206 ",    
                 "logradouro": " Edf. Tecnocentro - R. Mundo 121 - Trobogy",   
                 "cidade": "Salvador",    
                 "uf": "BA"  
           }
        }

### Código Servidor (Java)

```java
protected final Variant ebfSQLMongoDBUpdateJson(
    Variant connectionVar, 
    Variant databaseVar, 
    Variant collectionVar, 
    Variant queryVar, 
    Variant newDocVar) throws Exception {

  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> dbCollection = database.getCollection(collectionVar.getString());

  Map<String, Object> query = (Map<String, Object>) queryVar.getObject();
  String newDoc = newDocVar.getString();

  Map<String, Object> newQuery = new HashMap<String, Object>();
  Iterator<Map.Entry<String, Object>> iterator = query.entrySet().iterator();
  while (iterator.hasNext()) {
    Map.Entry mentry = (Map.Entry) iterator.next();

    String operator = mentry.getKey().toString();
    switch (operator) {
      case "=": newQuery.put("$eq", mentry.getValue()); break;
      case ">": newQuery.put("$gt", mentry.getValue()); break;
      case ">=":newQuery.put("$gte", mentry.getValue()); break;
      case "<": newQuery.put("$lt", mentry.getValue()); break;
      case "<=": newQuery.put("$lte", mentry.getValue()); break;
      case "!=": newQuery.put("$ne", mentry.getValue()); break;
      case "in": newQuery.put("$in", mentry.getValue()); break;
      case "!in": newQuery.put("$nin", mentry.getValue()); break;
      case "or": newQuery.put("$or", mentry.getValue()); break;
      case "and": newQuery.put("$and", mentry.getValue()); break;
      case "not": newQuery.put("$not", mentry.getValue()); break;
      case "nor": newQuery.put("$nor", mentry.getValue()); break;
      default: newQuery.put((String) mentry.getKey(), mentry.getValue()); break;
    }
  }

  org.bson.Document criterion = new org.bson.Document(newQuery);
  org.bson.Document updateData = new org.bson.Document("$set", org.bson.Document.parse(newDoc));

  dbCollection.updateOne(criterion, updateData);
  return Variant.VARIANT_NULL;
}
```

---

## MongoDB - Consultar Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMongoDBFind` |
| **Código** | 1151 |
| **Assinatura** | `MongoDB - Consultar Registro (Variante;Letras;Letras;Variante;Variante;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Variante;Variante;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Consultar um documento ou registro;

Parâmetro(s):
1. Referência da Conexão. (Variante)
2. Nome do Banco de Dados, Ex: BD_TESTE. (Letras)
3. Nome da coleção, Ex: Funcionário. (Letras)
4. Critério (Texto em formato JSON ou Mapa) (Variante, Opcional)
5. Ordenação (Mapa). (Variante, Opcional)
6. Limite de registros por consulta. (Inteiro, Opcional)
7. Número da página (Inteiro, Opcional)

Retorno:
JSON com os dados da consulta. (Variante)

Observação: 
Se o parâmetro de critério for omitido, todos os documentos da coleção serão resgatados.

Exemplo:
  * Limite de registro por consulta: Caso seja passado o valor 5, irá retornar apenas 5 registros na consulta, caso nulo, não haverá limite de retorno.
  * Número da página: Deve ser inserido o número da página que deseja fazer a consulta. Esse parâmetro é utilizado para controle de paginação.
  Critério:  
     * JSON : Texto em formato JSON. 
     * Exemplo: {"CPF" : "668.678.816-98" };
       Irá buscar o documento cujo o CPF é igual ao 668.678.816-98.
     * MAPA: "Criar objeto mapa com parâmetros" com a função "criar lista a partir do elementos", informando sempre chave e valor.
     * Os operadores  mais conhecidos  (>, >=, <, <=, !=, in, !in, or, and, not e nor), podem ser utilizados no critério de busca. 
     * Caso deseje algum operador diferente do citado acima, consulte a documentação: https://docs.mongodb.com/manual/reference/operator/query/
     * Ordenação: Função "Criar objeto mapa com parâmetros" com o parâmetro de "Criar Lista a partir dos elementos", Chave e Valor.
     * A chave deverá ser o nome do campo e o valor o tipo de ordenação. Caso seja ascendente usar o valor 1 e descendente -1.

### Código Servidor (Java)

```java
protected final Variant ebfMongoDBFind(
    Variant connectionVar, 
    Variant databaseVar, 
    Variant collectionVar, 
    Variant queryVar,
    Variant sortVar, 
    Variant pageSizeVar, 
    Variant pageNumberVar) throws Exception {

  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> collection = database.getCollection(collectionVar.getString());

  Map<String, Object> sortMap = (Map<String, Object>) sortVar.getObject();
  int pageSize =  pageSizeVar.getLong().intValue();
  int pageNumber = pageNumberVar.getLong().intValue();
  org.bson.Document queryDocument = new org.bson.Document();

  java.util.List<com.mongodb.DBObject> list = new java.util.ArrayList<com.mongodb.DBObject>();


  if (queryVar.getObject() instanceof Map) {
    Map<String, Object> query = (Map<String, Object>) queryVar.getObject();
    Map<String, Object> newQuery = new HashMap<>();

    for (Map.Entry<String, Object> entry : query.entrySet()) {
      switch (entry.getKey()) {
        case "=": newQuery.put("$eq", entry.getValue()); break;
        case ">": newQuery.put("$gt", entry.getValue()); break;
        case ">=": newQuery.put("$gte", entry.getValue()); break;
        case "<": newQuery.put("$lt", entry.getValue()); break;
        case "<=": newQuery.put("$lte", entry.getValue()); break;
        case "!=": newQuery.put("$ne", entry.getValue()); break;
        case "in": newQuery.put("$in", entry.getValue()); break;
        case "!in": newQuery.put("$nin", entry.getValue()); break;
        case "or": newQuery.put("$or", entry.getValue()); break;
        case "and": newQuery.put("$and", entry.getValue()); break;
        default: newQuery.put(entry.getKey(), entry.getValue());
      }
    }

    queryDocument.putAll(newQuery);
  } else if (queryVar.getObject() != null) {
    queryDocument = org.bson.Document.parse(queryVar.toString());
  }

  org.bson.Document sortDocument = new org.bson.Document();
  if (sortMap != null) {
    for (Map.Entry<String, Object> entry : sortMap.entrySet()) {
      sortDocument.put(entry.getKey(), entry.getValue());
    }
  }

  com.mongodb.client.FindIterable<org.bson.Document> result = collection.find(queryDocument)
      .sort(sortDocument)
      .skip(pageSize * (pageNumber -1))
      .limit(pageSize);

  List<org.bson.Document> resultList = new ArrayList<org.bson.Document>();
  for (org.bson.Document doc : result) {
    resultList.add(doc);
  }

  return VariantPool.get(list);
}
```

---

## MongoDB - Converter String para ObjectID

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConvertObjectId` |
| **Código** | 788 |
| **Assinatura** | `MongoDB - Converter String para ObjectID (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Recebe um texto para converter no formato ObjectID (Id de um documento no Mongo DB).

Parâmetro:
1. Texto ID a ser convertido. (Letras)

Retorno:
ObjectID. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfConvertObjectId(Variant objectIdVar) throws Exception {
  String chave = objectIdVar.getString();
  org.bson.types.ObjectId id = new org.bson.types.ObjectId(chave);
  return VariantPool.get(id);
}
```

---

## MongoDB - Excluir Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMongoDBRemove` |
| **Código** | 1152 |
| **Assinatura** | `MongoDB - Excluir Registro (Variante;Letras;Letras;Variante)` |
| **Parâmetros** | Variante;Letras;Letras;Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Excluir um documento ou registro.

Parâmetro(s):
1. Referência da conexão. (Variante)
2. Nome do Banco de Dados, Ex: BD_TESTE. (Letras)
3. Nome da coleção, Ex: Funcionario. (Letras)
4. Critério (Mapa). (Variante, Opcional)

Retorno:
Não possui.

Observação:
Se o parâmetro de critério for omitido, todos os documentos da coleção serão removidos.

Exemplo:
  Critério:  
      * MAPA: "Criar objeto mapa com parâmetros" com a função "criar lista a partir do elementos", informando sempre chave e valor.
      * Os operadores  mais conhecidos  (>, >=, <, <=, !=, in, !in, or, and, not e nor), podem ser utilizados no critério de busca. 
      * Caso deseje algum operador diferente do citado acima, consulte a documentação: https://docs.mongodb.com/manual/reference/operator/query/

### Código Servidor (Java)

```java
protected final Variant ebfMongoDBRemove(
    Variant connectionVar, 
    Variant databaseVar,
    Variant collectionVar, 
    Variant queryVar) throws Exception {

  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> collection = database.getCollection(collectionVar.getString());

  org.bson.Document queryDocument = new org.bson.Document();
  if (queryVar.getObject() != null) {
    Map<String, Object> query = (Map<String, Object>) queryVar.getObject();
    Map<String, Object> newQuery = new HashMap<String, Object>();

    for (Map.Entry<String, Object> entry : query.entrySet()) {
      String operator = entry.getKey().toString();
      switch (operator) {
        case "=": newQuery.put("$eq", entry.getValue()); break;
        case ">": newQuery.put("$gt", entry.getValue()); break;
        case ">=":newQuery.put("$gte", entry.getValue()); break;
        case "<": newQuery.put("$lt", entry.getValue()); break;
        case "<=": newQuery.put("$lte", entry.getValue()); break;
        case "!=": newQuery.put("$ne", entry.getValue()); break;
        case "in": newQuery.put("$in", entry.getValue()); break;
        case "!in": newQuery.put("$nin", entry.getValue()); break;
        case "or": newQuery.put("$or", entry.getValue()); break;
        case "and": newQuery.put("$and", entry.getValue()); break;
        case "not": newQuery.put("$not", entry.getValue()); break;
        case "nor": newQuery.put("$nor", entry.getValue()); break;
        default: newQuery.put((String) entry.getKey(), entry.getValue()); break;
      }
    }

    queryDocument.putAll(newQuery);
  }

  collection.deleteMany(queryDocument);
  return Variant.VARIANT_NULL;
}
```

---

## MongoDB - Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMongoDBCloseConnection` |
| **Código** | 1153 |
| **Assinatura** | `MongoDB - Fechar Conexão (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Encerra a conexão atual.

Parâmetro:
1. Referência da conexão. (Variante)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfMongoDBCloseConnection(Variant connectionVar) throws Exception {
  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  connection.close();
  return Variant.VARIANT_NULL;
}
```

---

## MongoDB - Inserir Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMongoDBInsert` |
| **Código** | 1154 |
| **Assinatura** | `MongoDB - Inserir Registro (Variante;Letras;Letras;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Insere um documento ou registro.

Parâmetro(s):
1. Referência da conexão. (Variante)
2. Nome do Banco de Dados, Ex: BD_TESTE. (Letras)
3. Nome da coleção, Ex: Funcionário. (Letras)
4. Documento a ser inserido (Mapa). (Variante)

Retorno:
ObjectID. (Variante)

Exemplo:
Documento a ser inserido:  "Criar objeto mapa com parâmetros" com a função "criar lista a partir do elementos", informando sempre chave e valor.

### Código Servidor (Java)

```java
protected final Variant ebfMongoDBInsert(Variant connectionVar, Variant databaseVar, Variant collectionVar, Variant mapVar) throws Exception {
  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> collection = database.getCollection(collectionVar.getString());

  Map<String, Object> map = (Map<String, Object>) mapVar.getObject();
  org.bson.Document document = new org.bson.Document(map);

  org.bson.types.ObjectId id = null;
  try {
    collection.insertOne(document);
    id = (org.bson.types.ObjectId)document.get( "_id" );
  } catch (com.mongodb.DuplicateKeyException e) {
    throw new WFRRuleStopException(ExceptionMessage.ERROR_RULE_EXECUTION_FAILED, e.getMessage().toString());
  }

  return VariantPool.get(id);
}
```

---

## MongoDB - Inserir Registro (JSON)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLMongoDBInsertJson` |
| **Código** | 1155 |
| **Assinatura** | `MongoDB - Inserir Registro (JSON) (Variante;Letras;Letras;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 41 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Insere um documento ou registro.

Parâmetro(s):
1. Referência da conexão. (Variante)
2. Nome do Banco de Dados, Ex: "BD_TESTE". (Letras)
3. Nome da coleção, Ex:"Funcionário". (Letras)
4. Documento a ser inserido (Texto em formato JSON). (Variante)

Retorno:
ObjectID. (Variante)

Exemplo:
Documento a ser inserido
    -  JSON : Texto em formato de JSON deve ser da seguinte forma:
         { 
         "empresa": "Softwell Solutions", 
         "tel": "+55 (71) 2108 3800",  
          "endereco": {   
                 "bairro": "Trobogy",   
                 "cep": "41.730-101",    
                 "complemento": "Parque tecnológico da Bahia, Salas 204, 205 e 206 ",    
                 "logradouro": " Edf. Tecnocentro - R. Mundo 121 - Trobogy",   
                 "cidade": "Salvador",    
                 "uf": "BA"  
           }
        }

### Código Servidor (Java)

```java
protected final Variant ebfSQLMongoDBInsertJson(Variant connectionVar, Variant databaseVar, Variant collectionVar, Variant jsonVar) throws Exception {
  com.mongodb.client.MongoClient connection = (com.mongodb.client.MongoClient) connectionVar.getObject();
  com.mongodb.client.MongoDatabase database = connection.getDatabase(databaseVar.getString());
  com.mongodb.client.MongoCollection<org.bson.Document> dbCollection = database.getCollection(collectionVar.getString());

  org.bson.types.ObjectId id = null;
  org.bson.Document document =  (org.bson.Document) org.bson.Document.parse(jsonVar.getString());

  try {
    dbCollection.insertOne(document);
    id = (org.bson.types.ObjectId) document.get( "_id" );
  } catch (com.mongodb.DuplicateKeyException e) {
    throw new WFRRuleStopException(ExceptionMessage.ERROR_RULE_EXECUTION_FAILED, e.getMessage().toString());
  }

  return VariantPool.get(id);
}
```

---

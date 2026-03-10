# Funções Nativas - WebSocket

Total: **9** funções

[← Voltar para Funções Nativas](README.md)

---

## WebSocket - Conectar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketConnectClient` |
| **Código** | 1113 |
| **Assinatura** | `WebSocket - Conectar (Letras;Fluxo;Variante;Fluxo;Variante;Fluxo;Variante;Fluxo;Variante): Variante` |
| **Parâmetros** | Letras;Fluxo;Variante;Fluxo;Variante;Fluxo;Variante;Fluxo;Variante |
| **Retorno** | Variante |
| **Tipo** | 43 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função conecta ao Endpoint disponível.

Parâmetro(s):
1. URL. (Letras)
2. Fluxo Ao Abrir Conexão. (Opcional)
3. Parâmetros Opcionais (Ao abrir conexão). (Variante, Opcional)
4. Fluxo ao receber mensagem. (Opcional)
5. Parâmetros opcionais (Ao receber mensagem). (Variante, Opcional)
6. Fluxo ao Ocorrer Erro. (Opcional)
7. Parâmetros opcionais (Ao ocorrer erro). (Variante, Opcional)
8. Fluxo Ao Fechar Conexão. (Opcional)
9. Parâmetros Opcionais (Ao fechar conexão). (Variante, Opcional)

Retorno:
Referência da conexão. (Variante)

Observações:
1. Caso o fluxo "Ao abrir conexão" seja passado, o primeiro parâmetro deve ser reservado para a referência da conexão, mesmo que não vá usar.
2. Caso o fluxo "Ao receber mensagem", o primeiro elemento dos parâmetros de entrada sempre será a mensagem recebida.
3. O segundo parâmetro é o retorno da função "WebSocket - Obter EndPoint"
4. No fluxo "Ao fechar conexão" não utilize funções que precisem da referência da conexão, pois neste estado a conexão já está sendo fechada e não funcionarão.
5. Caso queira enviar mensagem do servidor para os clientes sem que seja uma mensagem enviada por um cliente, utilize a função "WebSocket - Enviar mensagem servidor p/ clientes" da camada Servidor.

Exemplos:
1. Passando um fluxo "Ao abrir conexão" e uma lista de parâmetro com 2 (dois) elementos, o primeiro parâmetro do fluxo passado será reservado para a referência, o segundo sera reservado para o primeiro elemento da lista e o terceiro será reservado para o segundo elemento da lista.
2. Passando um fluxo "Ao receber mensagem" e uma lista de parâmetro com 1 (um) elemento, o primeiro parâmetro do fluxo passado será reservado para a mensagem recebida e o segundo sera reservado para a mensagem recebida do servidor.

### Código Servidor (Java)

```java
@jakarta.websocket.ClientEndpoint
  public class EndpointClientDefault {
    private jakarta.websocket.Session session;
    private String ruleOnOpen;
    private String ruleOnMessage;
    private String ruleOnError;
    private String ruleOnClose; 
    private java.util.List<?> arrayOnOpen;
    private java.util.List<?> arrayOnMessage;
    private java.util.List<?> arrayOnerror;
    private java.util.List<?> arrayOnClose;

    public EndpointClientDefault(
        String endpointURI, 
        String flowOnOpen, 
        java.util.List<?> onOpenParams, 
        String flowOnMessage, 
        java.util.List<?> onMessageParams, 
        String flowOnError, 
        java.util.List<?> onErrorParams, 
        String flowOnClose, 
        java.util.List<?> onCloseParams) throws Exception {

      ruleOnOpen = flowOnOpen;  
      ruleOnMessage = flowOnMessage;  
      ruleOnError = flowOnError;
      ruleOnClose = flowOnClose;  
      arrayOnOpen = onOpenParams;  
      arrayOnMessage = onMessageParams;  
      arrayOnerror = onErrorParams;
      arrayOnClose = onCloseParams;
      java.net.URI endpoint = new java.net.URI(endpointURI);
      jakarta.websocket.WebSocketContainer container = jakarta.websocket.ContainerProvider.getWebSocketContainer();
      session = container.connectToServer(this, endpoint);

      //Fluxo no parâmetro 'Ao Abrir Conexão' irá ser executado caso a conexão com o servidor seja bem sucedida 
      if(session.isOpen() && ruleOnOpen != null && !ruleOnOpen.isEmpty()) {
        executeRule(ruleOnOpen, addFirstParamToList(new Variant(session), arrayOnOpen));
      }
    }

    public jakarta.websocket.Session getSession() {
      return session;
    }

    @jakarta.websocket.OnOpen
    public void onOpen(jakarta.websocket.Session msg) {}

    @jakarta.websocket.OnMessage(maxMessageSize = 1048576)
    public void onMessage(String msg) throws Exception  {
      if(ruleOnMessage != null)
        if(!ruleOnMessage.isEmpty())
          executeRule(ruleOnMessage, addFirstParamToList(new Variant(msg), arrayOnMessage));
    }

    @SuppressWarnings("unchecked")
    @jakarta.websocket.OnError
    public void onError(Throwable arg0) throws Exception {
      if(ruleOnError != null)
        if(!ruleOnError.isEmpty())
          executeRule(ruleOnError, (List<Variant>) arrayOnerror); 
    }

    @SuppressWarnings("unchecked")
    @jakarta.websocket.OnClose
    public void onClose(jakarta.websocket.Session session, jakarta.websocket.CloseReason reason) throws Exception {
      if(ruleOnClose != null)
        if(!ruleOnClose.isEmpty())
          executeRule(ruleOnClose, (List<Variant>) arrayOnClose);
    }

    public java.util.List<Variant> addFirstParamToList(Variant firstParam, java.util.List<?> listParams){
      java.util.List<Variant> listParamsTemp = new ArrayList<Variant>();
      listParamsTemp.add(0,firstParam);	
      if(listParams!=null)
        for (int i=0; i<listParams.size();i++){
          listParamsTemp.add(new Variant(listParams.get(i)));
        }
      return listParamsTemp;	
    }

    private void executeRule(String ruleName, List<Variant> ruleParameters) throws Exception {
      WFRSystem system = getClient().getSystem();
      WFRData data = new WFRData(system);
      if (system.getJSManager().isJSRule(ruleName)) {
        return;
      }

      logger.info(WFRSystem.DEFAULT_USER, system.getCode(), "Executando Tarefa - Regra \"" + ruleName + "\".");

      try {
        WFRRuleClient client = new WFRRuleClient(system, data, new PrintWriter(new CharArrayWriter()));
        WFRFormData fields = new WFRFormData();
        WFRRule rule = system.getRuleManager().getRuleClass(ruleName, client, data.connection(), fields, false); // Obtém a regra
        Variant[] params = null; // Obtém os parâmetros da regra
        if (ruleParameters != null && ruleParameters.size() > 0) {
          params = new Variant[ruleParameters.size()];
          for (int i = 0; i < ruleParameters.size(); i++) {
            params[i] = VariantPool.get(ruleParameters.get(i));
          }
        }

        data.connection().startTransactionIfNecessary();
        if (params == null || params.length == 0) {
          rule.start();
        } else {
          rule.start(params);
        }

        data.connection().commitTransaction();
      } catch (Exception e) {
        logger.error(WFRSystem.DEFAULT_USER, system.getCode(), "Erro ao executar regra de negócio " + ruleName + ".", e);
        try {
          if (data != null)
            data.connection().rollbackTransaction();
        } catch (Exception ex) {
          logger.error(WFRSystem.DEFAULT_USER, system.getCode(), "Erro ao dar rollbak na regra de negócio " + ruleName + ".", ex);
        }
      } finally {
        if (data != null) {
          data.close();
        }
      }
    }
  } 

  public Variant ebfWebSocketConnectClient(
      Variant uri, 
      Variant flowOnOpen, 
      Variant onOpenParams, 
      Variant flowOnMessage, 
      Variant onMessageParams, 
      Variant flowOnError,
      Variant onErrorParams, 
      Variant flowOnClose, 
      Variant onCloseParams) throws Exception {

    EndpointClientDefault client = new EndpointClientDefault(
        uri.getString(), 
        flowOnOpen.getString(), 
        (java.util.List<?>) onOpenParams.getObject(), 
        flowOnMessage.getString(),
        (java.util.List<?>) onMessageParams.getObject(),
        flowOnError.getString(),
        (java.util.List<?>) onErrorParams.getObject(), 
        flowOnClose.getString(),
        (java.util.List<?>) onCloseParams.getObject());

    jakarta.websocket.Session session = client.getSession();
    return VariantPool.get(session);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfWebSocketConnectClient(url, flowOnOpen, onOpenParams, flowOnMessage, onMessageParams, flowOnError, onErrorParams, flowOnClose, onCloseParams) {
  let ws = new WebSocket(url);

  ws.addEventListener("open", function() {
    if (flowOnOpen != null) {
      if (onOpenParams != null) {
        onOpenParams.splice(0, 0, ws);
      } else {
        onOpenParams = [ws];
      }

      ebfFlowExecute(flowOnOpen, onOpenParams);
      onOpenParams = onOpenParams.slice(1, onOpenParams.length);
    }
  });

  ws.addEventListener("message", function(e) {
    if (flowOnMessage != null) {
      if (onMessageParams != null) {
        onMessageParams.splice(0, 0, e.data);
      } else {
        onMessageParams = [e.data];
      }

      ebfFlowExecute(flowOnMessage, onMessageParams);
      onMessageParams = onMessageParams.slice(1, onMessageParams.length);
    }
  });

  ws.addEventListener("error", function() {
    if (flowOnError != null) {
      ebfFlowExecute(flowOnError, onErrorParams);
    }
  });

  ws.addEventListener("close", function() {
    if (flowOnClose != null) {
      ebfFlowExecute(flowOnClose, onCloseParams);
    }
  });

  return ws;
}
```

---

## WebSocket - Enviar Mensagem para o Cliente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketSendMessageFromServerToClients` |
| **Código** | 811 |
| **Assinatura** | `WebSocket - Enviar Mensagem para o Cliente (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 43 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função envia uma mensagem do servidor para todos os clientes conectados ao Endpoint.

Parâmetro(s):
1. Nome do Endpoint do servidor. (Letras)
2. Mensagem a ser enviada aos clientes. (Letras)

Retorno:
Não possui.

Observações:
1. O primeiro parâmetro é o retorno da função "WebSocket - Obter EndPoint"
2. Ao enviar mensagem do servidor para os clientes conectados a ele, fluxo de "Ao receber mensagem" do cliente será acionado automaticamente caso especificado.

### Código Servidor (Java)

```java
protected Variant ebfWebSocketSendMessageFromServerToClients (Variant endpointPath, Variant message) {
  String aux[] = endpointPath.getString().split("/");
  String endpointName = aux[aux.length-1];
  wfr.rules.WebSocketProxy.getInstance().sendMessageFromServerToClients(endpointName, message.getString());
  return Variant.VARIANT_NULL;
}
```

---

## WebSocket - Enviar Mensagem para o Servidor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketClientSendMessage` |
| **Código** | 1141 |
| **Assinatura** | `WebSocket - Enviar Mensagem para o Servidor (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 43 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função envia uma mensagem para o servidor de acordo os parâmetros passados.

Parâmetro(s):
1. Referência da Conexão. (Variante)
2. Mensagem. (Letras)

Retorno
Não possui.

Observações:
1. O primeiro parâmetro é o retorno da função "WebSocket - Conectar.
2. A mensagem enviada ao servidor será automaticamente enviada pelo mesmo para todos os clientes, acionando o fluxo "Ao enviar mensagem" de cada um.

### Código Servidor (Java)

```java
protected void ebfWebSocketClientSendMessage (Variant ws, Variant message) throws Exception {
  jakarta.websocket.Session session = (jakarta.websocket.Session) ws.getObject();
  session.getBasicRemote().sendText(message.getString());
}
```

### Código Cliente (JavaScript)

```javascript
function ebfWebSocketClientSendMessage(ws, message) {
  ws.send(message);  
}
```

---

## WebSocket - Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketClientDisconnect` |
| **Código** | 1115 |
| **Assinatura** | `WebSocket - Fechar Conexão (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 43 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função encerra a conexão com o EndPoint passado como parâmetro.

Parâmetro:
1. Referência da conexão. (Variante)

Retorno:
Não possui.

Observações:
1. O primeiro parâmetro é o retorno da função "WebSocket - Conectar".
2. Ao desconectar, será executado o fluxo associado ao parâmetro "Fluxo Ao desconectar", caso especificado.

### Código Servidor (Java)

```java
protected void ebfWebSocketClientDisconnect (Variant ws) throws Exception {
    jakarta.websocket.Session session = (jakarta.websocket.Session) ws.getObject();
    if(session.isOpen())
      session.close();
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfWebSocketClientDisconnect (ws) {
  if (ws.readyState === WebSocket.OPEN)
      ws.close();
}
```

---

## WebSocket - Liberar EndPoint

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketServerSetFree` |
| **Código** | 812 |
| **Assinatura** | `WebSocket - Liberar EndPoint (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 43 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função libera/desocupa o EndPoint para que o mesmo possa ter outros fluxos/regras de negócio associados.

Parâmetro:
1. Nome do EndPoint. (Letras)

Retorno
Não possui.

Observação:
O 1º Parâmetro é o retorno da função "WebSocket - Obter EndPoint".

### Código Servidor (Java)

```java
protected final Variant ebfWebSocketServerSetFree (Variant endpointPath) throws Exception {
  String aux[] = endpointPath.getString().split("/");
  String endpointName = aux[aux.length-1];
  wfr.rules.WebSocketProxy.getInstance().setEndpointToFree(endpointName);
  return Variant.VARIANT_NULL;
}
```

---

## WebSocket - Obter EndPoint

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketAllocateServer` |
| **Código** | 813 |
| **Assinatura** | `WebSocket - Obter EndPoint (Fluxo;Variante;Fluxo;Variante;Fluxo;Variante;Fluxo;Variante;Lógico): Variante` |
| **Parâmetros** | Fluxo;Variante;Fluxo;Variante;Fluxo;Variante;Fluxo;Variante;Lógico |
| **Retorno** | Variante |
| **Tipo** | 43 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém um EndPoint disponível e retorna a sua referência, caso não exista EndPoints disponíveis o retorno será nulo.

Parâmetro(s):
1. Fluxo ao entrar. (Opcional)
2. Lista de Parâmetros do Fluxo. (Variante, Opcional)
3. Fluxo ao Receber Mensagem. (Opcional)
4. Lista de Parâmetros do Fluxo. (Variante, Opcional)
5. Fluxo ao Sair. (Opcional)
6. Lista de Parâmetros do Fluxo. (Variante, Opcional)
7. Fluxo de Erro. (Opcional)
8. Lista de Parâmetros do Fluxo. (Variante, Opcional)
9. Modo Restrito (Lógico, Opcional)(Ver observação 1)

Retorno:
Referência do EndPoint. (Variante)

Observação(ões):
1. Com o Modo Restrito ativo, somente o servidor tem acesso às mensagens enviadas para o socket, caso o mesmo 
esteja desabilitado, quando uma mensagem for enviada para o socket, todos que estão conectados recebem a mensagem.
Se não for informado um valor, o padrão será desativado.

### Código Servidor (Java)

```java
protected Variant ebfWebSocketAllocateServer (Variant ruleOnOpen, Variant onOpenParams, Variant ruleOnMessage, Variant onMessageParams,
    Variant ruleOnClose, Variant onCloseParams, Variant ruleOnError, Variant onErrorParams) throws Exception {
  
  return ebfWebSocketAllocateServer(ruleOnOpen, onOpenParams, ruleOnMessage, onMessageParams, ruleOnClose, onCloseParams, ruleOnError, onErrorParams, Variant.VARIANT_FALSE);
}

protected Variant ebfWebSocketAllocateServer (Variant ruleOnOpen, Variant onOpenParams, Variant ruleOnMessage, Variant onMessageParams,
    Variant ruleOnClose, Variant onCloseParams, Variant ruleOnError, Variant onErrorParams, Variant restrictMode) throws Exception {

  Object request = this.getRequest();
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
  value = value.replace("http", "ws");
    
  String path = "";
  path = wfr.rules.WebSocketProxy.getInstance().allocEndpoint(
    ruleOnOpen.getString(),
    ruleOnMessage.getString(),
    ruleOnClose.getString(), 
    ruleOnError.getString(),
    (List<?>) onOpenParams.getObject(),
    (List<?>) onMessageParams.getObject(),
    (List<?>) onCloseParams.getObject(),
    (List<?>) onErrorParams.getObject(),
    this.getSystem(),
    this.getData(),
    this.getClient(),
    restrictMode.getBoolean()
  );
  return VariantPool.get(path.length() == 0 ? Variant.VARIANT_NULL : VariantPool.get(value+"/"+path));
}
```

---

## WebSocket - Obter Números de Clientes do EndPoint

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketGetNumberOfClients` |
| **Código** | 814 |
| **Assinatura** | `WebSocket - Obter Números de Clientes do EndPoint (Letras): Inteiro` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 43 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém o número de clientes conectados a um EndPoint.

Parâmetro:
1. Nome do EndPoint. (Letras)

Retorno:
Número de clientes conectados ao EndPoint. (Inteiro)

Observação:
O 1º Parâmetro é o retorno da função "WebSocket - Obter EndPoint".

### Código Servidor (Java)

```java
protected Variant ebfWebSocketGetNumberOfClients (Variant endpointPath) {
  String aux[] = endpointPath.getString().split("/");
  String endpointName = aux[aux.length-1];
  return VariantPool.get(wfr.rules.WebSocketProxy.getInstance().getEndpointNumberOfUsers(endpointName));
}
```

---

## WebSocket - Obter Status da Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketClientCheckConnection` |
| **Código** | 1114 |
| **Assinatura** | `WebSocket - Obter Status da Conexão (Variante): Inteiro` |
| **Parâmetros** | Variante |
| **Retorno** | Inteiro |
| **Tipo** | 43 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna o status da conexão.

Parâmetro:
1. Referência da conexão. (Variante)

Retorno:
Status. (Inteiro)
0 - Conectando
1 - Conectado
2 - Fechando
3 - Fechado

Observação:
O 1º Parâmetro é o retorno da função "WebSocket - Conectar ao Servidor".

### Código Servidor (Java)

```java
protected Variant ebfWebSocketClientCheckConnection (Variant ws) throws WFRRuleException {
    jakarta.websocket.Session session = (jakarta.websocket.Session) ws.getObject();
    if(session.isOpen())
      return VariantPool.get(1);
    else
      return VariantPool.get(3);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfWebSocketClientCheckConnection(ws) {
  return ws.readyState;
}
```

---

## WebSocket - Servidor em Uso?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebSocketIsServerInUse` |
| **Código** | 815 |
| **Assinatura** | `WebSocket - Servidor em Uso? (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 43 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função recebe como parâmetro o nome do EndPoint e retorna "true" caso esteja em uso ou '"false" caso 
esteja livre.

Parâmetro:
1. Nome do EndPoint. (Letras)

Retorno:
Status. (Variante)
Nulo - Servidor inexistente.
True - Servidor em uso.
False - Servidor não está em uso.

Observação:
O 1º Parâmetro é o retorno da função "WebSocket - Obter EndPoint".

### Código Servidor (Java)

```java
protected Variant ebfWebSocketIsServerInUse (Variant endpointPath) throws Exception {
  String aux[] = endpointPath.getString().split("/");
  wfr.web.websocket.classes.CustomEndpoint endpoint = wfr.rules.WebSocketProxy.getInstance().getEndpointByPath(aux[aux.length-1]);
  if (endpoint == null)
    return Variant.VARIANT_NULL;	  
  return VariantPool.get(!endpoint.isFree()); 
}
```

---

# Funções Nativas - Mensageria

Total: **15** funções

[← Voltar para Funções Nativas](README.md)

---

## RabbitMQ - Abrir Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQOpenConnection` |
| **Código** | 1048 |
| **Assinatura** | `RabbitMQ - Abrir Conexão (Letras;Letras;Letras;Inteiro;Letras;Inteiro;Lógico): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Inteiro;Letras;Inteiro;Lógico |
| **Retorno** | Variante |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma nova conexão com o servidor de mensageria RabbitMQ.

Parâmetros:
1. Host (Letras).
2. Usuário (Letras).
3. Senha (Letras).
4. Porta (Inteiro).
5. Virtual Host (Letras)(Opcional).
6. Timeout (Inteiro).
7. SSL? (Lógico)(Opcional)

Retorno:
Referência do objeto ou nulo (Variante).

Observações:
1. O controle de abertura e fechamento de conexão é de controle do desenvolvedor.
2. Não é recomendado abrir diversas conexões com o mesmo servidor para operações futuras. Armazene a referência do objeto e utilize em demais operações de mensageria.
3. É possível associar um fluxo que será executado quando uma conexão for encerrada com sucesso, através da função RabbitMQ - Associar Evento Ao Fechar Conexão.
4. Para fechar a conexão, utilize a função RabbitMQ - Fechar Conexão.
5. Para mais informações sobre o RabbitMQ consulte: https://www.rabbitmq.com/documentation.html.
6. O 7º parâmetro define se a conexão deve ser feita utilizando SSL.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQOpenConnection(Variant host, Variant user, Variant password, Variant port, Variant virtualHost, Variant timeout, Variant ssl) throws Exception {
  String _host = host.getString();
  String _userName = user.getString();
  String _password = password.getString();
  String _virtualHost = virtualHost.getString();
  int _timeout = timeout.getLong().intValue();
  int _port = port.getLong().intValue();

  if (!_host.isEmpty() && !_userName.isEmpty() && !_password.isEmpty()) {
    wfr.util.RabbitMQ.WebrunRabbitMQ webrunRabbitMQ = new wfr.util.RabbitMQ.WebrunRabbitMQ();
    webrunRabbitMQ.openConnection(_host, _userName, _password, _virtualHost, _port, _timeout, ssl.getBoolean());
    return new Variant(webrunRabbitMQ);
  }
  return Variant.VARIANT_NULL;
}
```

---

## RabbitMQ - Associar Evento Ao Fechar Canal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQAttachEventShutdownChannel` |
| **Código** | 1049 |
| **Assinatura** | `RabbitMQ - Associar Evento Ao Fechar Canal (Variante;Variante;Fluxo;Variante): Lógico` |
| **Parâmetros** | Variante;Variante;Fluxo;Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Associa um fluxo ao fechar um canal de comunicação do servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência ou Identificador do Canal de Comunicação (Variante).
2. Nome da Regra (Fluxo) (Observação 2).
3. Parâmetros da Regra (Variante) (Opcional).

Retorno:
Valor lógico indicando se o evento foi associado.

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. A regra definida no segundo parâmetro deve reversar o primeiro parâmetro que receberá a causa do fechamento do canal.
3. Somente é permitido associar uma regra da camada servidor.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfWebrunRabbitMQAttachEventShutdownChannel(Variant webrunRabbitMQ, Variant channel, Variant ruleName, Variant params) throws Exception {
 if (!webrunRabbitMQ.isNull()
     && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ
     && !channel.isNull()) {

   wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
   com.rabbitmq.client.Channel _channel;
   if (channel.getObject() instanceof com.rabbitmq.client.Channel) {
     _channel = (com.rabbitmq.client.Channel) channel.getObject();
   } else if (channel.isNumeric()) {
     _channel = _webrunRabbitMQ.getChannelOpenInMemory(channel.getLong().intValue());
     if (_channel == null) {
       return Variant.VARIANT_FALSE;
     }
   } else {
     return Variant.VARIANT_FALSE;
   }

   List<Object> _params;
   if (params.isNull()) {
     _params = new ArrayList<Object>();
   } else {
     _params = (ArrayList<Object>) params.getObject();
   }

   _webrunRabbitMQ.attachEventShutdownChannel(_channel, ruleName.getString(), _params, getSystem(), connection, this.developmentMode);
   return Variant.VARIANT_TRUE;
 }

 return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Associar Evento Ao Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQAttachEventShutdownConnection` |
| **Código** | 1050 |
| **Assinatura** | `RabbitMQ - Associar Evento Ao Fechar Conexão (Variante;Fluxo;Variante): Lógico` |
| **Parâmetros** | Variante;Fluxo;Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Associa um fluxo ao fechar uma conexão com o servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Nome da Regra (Fluxo) (Observação 2).
3. Parâmetros da Regra (Variante) (Opcional).

Retorno:
Valor lógico indicando se o evento foi associado.

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. A regra definida no segundo parâmetro deve reversar o primeiro parâmetro que receberá a causa do fechamento da conexão.
3. Somente é permitido associar uma regra da camada servidor.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfWebrunRabbitMQAttachEventShutdownConnection(Variant webrunRabbitMQ, Variant ruleName, Variant params) throws Exception {
 if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {
   wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
   List<Object> _params;
   if (params.isNull()) {
     _params = new ArrayList<Object>();
   } else {
     _params = (ArrayList<Object>) params.getObject();
   }

   _webrunRabbitMQ.attachEventShutdownConnection(ruleName.getString(), _params, getSystem(), connection, this.developmentMode);
   return Variant.VARIANT_TRUE;
 }

 return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Associar Evento Ao Receber Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQAttachEventConsumer` |
| **Código** | 1051 |
| **Assinatura** | `RabbitMQ - Associar Evento Ao Receber Mensagem (Variante;Variante;Letras;Fluxo;Variante;Lógico): Lógico` |
| **Parâmetros** | Variante;Variante;Letras;Fluxo;Variante;Lógico |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Associa um fluxo ao receber uma mensagem na lista do canal de comunicação do servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência ou Identificador do Canal de Comunicação (Variante).
3. Nome da Lista (Letras).
4. Nome da Regra (Fluxo) (Observação 2).
5. Parâmetros da Regra (Variante) (Opcional).
6. Rejeitar adicionando na fila? (Observação 3)

Retorno:
Valor lógico indicando se o evento foi associado.

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. A regra definida no segundo parâmetro deve reversar o primeiro parâmetro que receberá a mensagem.
  2.1 O fluxo deve retorno um valor lógico indicando se a mensagem deve ser aceita ou rejeitada pelo servidor.
3. O quinto parâmetro quando informado o valor verdadeiro, ao rejeitar uma mensagem a mesma é adicionada novamente a fila, caso contrário é removida.
4. Somente é permitido associar uma regra da camada servidor.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfWebrunRabbitMQAttachEventConsumer(Variant webrunRabbitMQ, Variant channel,
  Variant queue, Variant ruleName, Variant params, Variant requeue) throws Exception {

  if (!webrunRabbitMQ.isNull()
      && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ
      && !channel.isNull()
      && !ruleName.getString().isEmpty()) {

    wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
    com.rabbitmq.client.Channel _channel;
    if (channel.getObject() instanceof com.rabbitmq.client.Channel) {
      _channel = (com.rabbitmq.client.Channel) channel.getObject();
    } else if (channel.isNumeric()) {
      _channel = _webrunRabbitMQ.getChannelOpenInMemory(channel.getLong().intValue());
      if (_channel == null) {
        return Variant.VARIANT_FALSE;
      }
    } else {
      return Variant.VARIANT_FALSE;
    }

    List<Object> _params;
    if (params.isNull()) {
      _params = new ArrayList<Object>();
    } else {
      _params = (ArrayList<Object>) params.getObject();
    }

    _webrunRabbitMQ.attachEventConsumer(_channel, queue.getString(), ruleName.getString(),
        _params, getSystem(), connection, requeue.getBoolean(), this.developmentMode);

    return Variant.VARIANT_TRUE;
  }

  return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Canal de Comunicação está aberto?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQIsChannelOpen` |
| **Código** | 1052 |
| **Assinatura** | `RabbitMQ - Canal de Comunicação está aberto? (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se um canal de comunicação está aberto com o servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência ou Identificador do Canal de Comunicação (Variante).

Retorno:
Valor lógico indicando se o canal de comunicação está aberto.

Observação:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQIsChannelOpen(Variant webrunRabbitMQ, Variant channel) throws Exception {
  if (!webrunRabbitMQ.isNull()
      && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ
      && !channel.isNull()) {

    wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
    if (channel.getObject() instanceof com.rabbitmq.client.Channel) {
      return VariantPool.get(_webrunRabbitMQ.isOpenChannel((com.rabbitmq.client.Channel) channel.getObject()));
    } else if (channel.isNumeric()) {
      com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.getChannelOpenInMemory(channel.getLong().intValue());
      if (_channel != null)
        return VariantPool.get(_webrunRabbitMQ.isOpenChannel(_channel));
      else
        return Variant.VARIANT_FALSE;
    }
  }
  return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Conexão está aberta?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQIsOpenConnection` |
| **Código** | 1053 |
| **Assinatura** | `RabbitMQ - Conexão está aberta? (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se uma conexão está aberta com o servidor RabbitMQ.

Parâmetro:
1. Referência do Objeto (Variante) (Observação 1).

Retorno:
Valor lógico indicando se a conexão está aberta.

Observação:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQIsOpenConnection(Variant webrunRabbitMQ) throws Exception {
  if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {
    return VariantPool.get(((wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject()).isOpenConnection());
  }

  return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Declarar Fila

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQQueueDeclare` |
| **Código** | 1054 |
| **Assinatura** | `RabbitMQ - Declarar Fila (Variante;Variante;Letras;Lógico;Lógico;Lógico): Lógico` |
| **Parâmetros** | Variante;Variante;Letras;Lógico;Lógico;Lógico |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Declara uma fila no canal de comunicação do servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência ou Identificador do Canal de Comunicação (Variante) (Observação 2).
3. Nome da Fila (Letras).
4. Durável? (Lógico) (Opcional) (Observação 3).
5. Exclusivo? (Lógico) (Opcional) (Observação 4).
6. Auto Exclusão? (Lógico) (Opcional) (Observação 5).

Retorno:
Valor lógico indicando se a fila foi declarada no canal de comunicação.

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. O segundo parâmetro é o retorno da função RabbitMQ - Obter Canal de Comunicação.
3. Determina se a fila persistirá no disco após uma reinicialização do servidor. Se definida como true, a fila e suas mensagens sobreviverão a reinicializações. Valor padrão false.
4. Determina se a fila é exclusiva para uma única conexão. Se definida como true, apenas o consumidor conectado à fila poderá acessá-la e a fila será excluída automaticamente quando a conexão for fechada. Valor padrão false.
5. Determina se a fila será automaticamente excluída quando não estiver mais em uso. Se definida como true, a fila será excluída quando o último consumidor se desconectar e nenhum outro consumidor estiver ativo. Valor padrão false.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQQueueDeclare(Variant webrunRabbitMQ, Variant channel,
    Variant queue, Variant durable, Variant exlusive, Variant autoDelete) throws Exception {

  if (!webrunRabbitMQ.isNull()
      && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ
      && !channel.isNull()
      && !queue.isNull()
      && !queue.getString().isEmpty()) {
 
    wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
    com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.declaredClosableChannelIfNotGiven(channel.getObject());
    _webrunRabbitMQ.queueDeclare(_channel, queue.getString(), durable.getBoolean(), exlusive.getBoolean(), autoDelete.getBoolean());
    if (_webrunRabbitMQ.isCloseChannel()) {
      _webrunRabbitMQ.closeChannel(_channel);
      _webrunRabbitMQ.setCloseChannel(false);
    }
    
    return Variant.VARIANT_TRUE;
  }
  return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Enviar Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQSendMessage` |
| **Código** | 1055 |
| **Assinatura** | `RabbitMQ - Enviar Mensagem (Variante;Variante;Letras;Letras): Lógico` |
| **Parâmetros** | Variante;Variante;Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem para o servidor RabbitMQ.

Parâmetros:
1. Referência do objeto (Variante) (Observação 1).
2. Referência ou Identificador do Canal de comunicação (Variante) (Observação 2).
3. Nome da fila (Letras).
4. Mensagem (Letras).

Retorno:
Valor lógico indicando se a mensagem foi enviada para o servidor.

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. O segundo parâmetro é o retorno da função RabbitMQ - Obter Canal de Comunicação. Caso não informado, um novo canal será criado e fechado após o envio da mensagem.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQSendMessage(Variant webrunRabbitMQ, Variant channel, Variant queue, Variant message) throws Exception {
 if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {
   wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();

   com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.declaredClosableChannelIfNotGiven(channel.getObject());
   _webrunRabbitMQ.sendMessage(_channel, queue.getString(), message.getString());
   if (_webrunRabbitMQ.isCloseChannel()) {
     _webrunRabbitMQ.closeChannel(_channel);
     _webrunRabbitMQ.setCloseChannel(false);
   }

   return Variant.VARIANT_TRUE;
 }
 return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Fechar Canal de Comunicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQCloseChannel` |
| **Código** | 1056 |
| **Assinatura** | `RabbitMQ - Fechar Canal de Comunicação (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha um canal de comunicação com o servidor RabbitMQ.

Parâmetros:
1. Referência do objeto (Variante) (Observação 1).
2. Referência ou Identificador do canal de comunicação (Variante).

Retorno:
Valor lógico indicando se o canal de comunicação foi fechado.

Observação:
1. A referência é o retorno da função RabbitMQ - Abrir Conexão.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQCloseChannel(Variant webrunRabbitMQ, Variant channel) throws Exception {
  if (!webrunRabbitMQ.isNull()
      && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ
      && !channel.isNull()) {

    wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
    if (channel.getObject() instanceof com.rabbitmq.client.Channel) {
      return VariantPool.get(_webrunRabbitMQ.closeChannel((com.rabbitmq.client.Channel) channel.getObject()));
    } else if (channel.isNumeric()) {
      return VariantPool.get(_webrunRabbitMQ.closeChannel(channel.getLong().intValue()));
    }
  }

  return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQCloseConnection` |
| **Código** | 1057 |
| **Assinatura** | `RabbitMQ - Fechar Conexão (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha uma conexão estabelecida com o servidor de mensageria RabbitMQ.

Parâmetro:
1. Referência do objeto (Variante) (Observação 1).

Retorno:
Valor lógico indicando se a conexão foi fechada.

Observação:
1. A referência é o retorno da função RabbitMQ - Abrir Conexão.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQCloseConnection(Variant webrunRabbitMQ) throws Exception {
  if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {
    return VariantPool.get(((wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject()).closeConnection());
  }

  return Variant.VARIANT_FALSE;
}
```

---

## RabbitMQ - Obter Canal de Comunicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQGetChannel` |
| **Código** | 1058 |
| **Assinatura** | `RabbitMQ - Obter Canal de Comunicação (Variante;Inteiro): Variante` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém um canal de comunicação com o servidor RabbitMQ.

Parâmetros:
1. Referência do objeto (Variante) (Observação 3).
2. Identificação do Canal (Inteiro) (Observação 4).

Retorno:
Referência do canal (Variante).

Observações:
1. O controle de abertura e fechamento de canal é de controle do desenvolvedor.
2. Não é recomendado abrir diversos canais de comunicação para operações futuras. Armazene a referência do canal e utilize em demais operações de mensageria.
3. A referência do objeto é o retorno da função RabbitMQ - Abrir Conexão.
4. O valor inteiro do identificador é opcional e representa a referência do canal de comunicação.
  4.1. Caso não informado o valor, o canal será criado com o identificador aleatório.
  4.2. Caso informado o valor de identificação e o mesmo não exista, o canal de comunicação será criado com a identificação informada no parâmetro.
  4.3. Caso informado o valor de identificação e o mesmo exista, o canal de comunicação será retornado da memória.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQGetChannel(Variant webrunRabbitMQ, Variant channelNumber) throws Exception {
  if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {
    return VariantPool.get(((wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject()).getChannel(channelNumber.getLong().intValue()));
  }

  return Variant.VARIANT_NULL;
}
```

---

## RabbitMQ - Obter Identificador do Canal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQGetChannelNumber` |
| **Código** | 1059 |
| **Assinatura** | `RabbitMQ - Obter Identificador do Canal  (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o identificador do canal de comunicação de um servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência do Canal de Comunicação (Variante) (Observação 2).

Retorno:
Valor lógico indicando se o canal de comunicação está aberto.

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. O segundo parâmetro é o retorno da função RabbitMQ - Obter Canal de Comunicação.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQGetChannelNumber(Variant webrunRabbitMQ, Variant channel) throws Exception {
  int channelNumber = 0;
  if (!webrunRabbitMQ.isNull()
      && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ
      && !channel.isNull()) {

    wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
    if (channel.getObject() instanceof com.rabbitmq.client.Channel) {
      channelNumber = _webrunRabbitMQ.getChannelNumber((com.rabbitmq.client.Channel) channel.getObject());
    } else if (channel.isNumeric()) {
      com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.getChannelOpenInMemory(channel.getLong().intValue());
      if (_channel != null) {
        channelNumber = _webrunRabbitMQ.getChannelNumber(_channel);
      }
    }
  }

  return VariantPool.get(channelNumber);
}
```

---

## RabbitMQ - Obter Lista de Mensagens

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQGetAllMessages` |
| **Código** | 1060 |
| **Assinatura** | `RabbitMQ - Obter Lista de Mensagens (Variante;Variante;Letras): Variante` |
| **Parâmetros** | Variante;Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém todas as mensagens contidas na lista do canal de comunicação do servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência do Canal de Comunicação (Variante) (Observação 2).
3. Nome da Lista (Letras).

Retorno:
Lista de Mensagens (Variante).

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. O segundo parâmetro é o retorno da função RabbitMQ - Obter Canal de Comunicação. Caso não informado, um novo canal será criado e fechado após a obtenção da mensagem.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQGetAllMessages(Variant webrunRabbitMQ, Variant channel, Variant queue) throws Exception {
 if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {

   wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
   com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.declaredClosableChannelIfNotGiven(channel.getObject());
   List<String> messages = _webrunRabbitMQ.getAllMessages(_channel, queue.getString());
   if (_webrunRabbitMQ.isCloseChannel()) {
     _webrunRabbitMQ.closeChannel(_channel);
     _webrunRabbitMQ.setCloseChannel(false);
   }
   return VariantPool.get(messages);
 }

 return VariantPool.get(new ArrayList<String>());
}
```

---

## RabbitMQ - Obter Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQGetMessage` |
| **Código** | 1061 |
| **Assinatura** | `RabbitMQ - Obter Mensagem (Variante;Variante;Letras): Letras` |
| **Parâmetros** | Variante;Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém uma mensagem na lista informada no canal de comunicação do servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência do Canal de Comunicação (Variante) (Observação 2).
3. Nome da Fila (Letras).

Retorno:
Mensagem contida na lista (Letras).

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. O segundo parâmetro é o retorno da função RabbitMQ - Obter Canal de Comunicação. Caso não informado, um novo canal será criado e fechado após a obtenção da mensagem.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQGetMessage(Variant webrunRabbitMQ, Variant channel, Variant queue) throws Exception {
 if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {
   wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
   com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.declaredClosableChannelIfNotGiven(channel.getObject());
   String message = _webrunRabbitMQ.getMessage(_webrunRabbitMQ.getResponse(_channel, queue.getString()));
   if (_webrunRabbitMQ.isCloseChannel()) {
     _webrunRabbitMQ.closeChannel(_channel);
     _webrunRabbitMQ.setCloseChannel(false);
   }

   return VariantPool.get(message);
 }

 return Variant.VARIANT_STRING_EMPTY;
}
```

---

## RabbitMQ - Obter Total de Mensagens

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunRabbitMQGetTotalMessages` |
| **Código** | 1062 |
| **Assinatura** | `RabbitMQ - Obter Total de Mensagens (Variante;Variante;Letras): Inteiro` |
| **Parâmetros** | Variante;Variante;Letras |
| **Retorno** | Inteiro |
| **Tipo** | 47 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o total de mensagens contidas na lista do canal de comunicação do servidor RabbitMQ.

Parâmetros:
1. Referência do Objeto (Variante) (Observação 1).
2. Referência do Canal de Comunicação (Variante) (Observação 2).
3. Nome da Lista (Letras).

Retorno:
Total de Mensagens (Inteiro).

Observações:
1. O primeiro parâmetro é o retorno da função RabbitMQ - Abrir Conexão.
2. O segundo parâmetro é o retorno da função RabbitMQ - Obter Canal de Comunicação. Caso não informado, um novo canal será criado e fechado após a obtenção da mensagem.

### Código Servidor (Java)

```java
protected final Variant ebfWebrunRabbitMQGetTotalMessages(Variant webrunRabbitMQ, Variant channel, Variant queue) throws Exception {
 if (!webrunRabbitMQ.isNull() && webrunRabbitMQ.getObject() instanceof wfr.util.RabbitMQ.WebrunRabbitMQ) {

   wfr.util.RabbitMQ.WebrunRabbitMQ _webrunRabbitMQ = (wfr.util.RabbitMQ.WebrunRabbitMQ) webrunRabbitMQ.getObject();
   com.rabbitmq.client.Channel _channel = _webrunRabbitMQ.declaredClosableChannelIfNotGiven(channel.getObject());
   int totalMessages = _webrunRabbitMQ.getTotalMessages(_channel, queue.getString());
   if (_webrunRabbitMQ.isCloseChannel()) {
     _webrunRabbitMQ.closeChannel(_channel);
     _webrunRabbitMQ.setCloseChannel(false);
   }
   return VariantPool.get(totalMessages);
 }

 return Variant.VARIANT_LONG_ZERO;
}
```

---

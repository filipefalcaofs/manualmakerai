# Funções Nativas - Email

Total: **26** funções

[← Voltar para Funções Nativas](README.md)

---

## Email - Alterar marcador da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailSetFlag` |
| **Código** | 1098 |
| **Assinatura** | `Email - Alterar marcador da mensagem (Variante;Inteiro;Lógico)` |
| **Parâmetros** | Variante;Inteiro;Lógico |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Altera o valor do marcador (flag) passado por parâmetro da mensagem.

Parâmetro(s):
1. Mensagem. (Variante) (Ver observação 1)
2. Marcador da mensagem. (Inteiro) 
3. Valor lógico para o marcador. (Lógico)

Retorno:
Não possui.

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Mensagens em uma pasta".
2. Para o marcador de deleção das mensagens com protocolo POP3, é necessário usar a função "Email - 
Fechar pasta do repositório de emails" com o 2º parâmetro verdadeiro.
3. Valores para os marcadores da mensagem:
          1 - Respondida
          2 - Deletada
          3 - Rascunho
          4 - Assinalar
          5 - Recente
          6 - Lida
          7 - Requerida

Exemplo:
Assumindo como 1º parâmetro uma mensagem qualquer, como o 2º parâmetro "2"(Deletada) e 3º 
parâmetro "True", será aplicado o marcador "Deletada" a mensagem.

### Código Servidor (Java)

```java
protected final Variant ebfEmailSetFlag(Variant messageVar, Variant flagTypeVar, Variant setFlagVar) throws Exception{
    Object messageObject = messageVar.getObject();
    if (!(messageObject instanceof jakarta.mail.Message)){
      return Variant.VARIANT_NULL;
    }

    jakarta.mail.Message message = (jakarta.mail.Message) messageObject;
    jakarta.mail.Flags.Flag flag;

    int flagType = flagTypeVar.getLong().intValue();
    switch (flagType) {
      case 1 -> flag = jakarta.mail.Flags.Flag.ANSWERED;
      case 2 -> flag = jakarta.mail.Flags.Flag.DELETED;
      case 3 -> flag = jakarta.mail.Flags.Flag.DRAFT;
      case 4 -> flag = jakarta.mail.Flags.Flag.FLAGGED;
      case 5 -> flag = jakarta.mail.Flags.Flag.RECENT;
      case 6 -> flag = jakarta.mail.Flags.Flag.SEEN;
      case 7 -> flag = jakarta.mail.Flags.Flag.USER; 
      default -> flag = null;
    };

    boolean setFlag = setFlagVar.getBoolean();
    message.setFlag(flag, setFlag); 
    return Variant.VARIANT_NULL;
  }
```

---

## Email - Assunto da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageSubject` |
| **Código** | 1094 |
| **Assinatura** | `Email - Assunto da mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o assunto da mensagem passada por parâmetro.

Parâmetro(s):
1. Mensagem. (Variante) (Ver observação 1)

Retorno:
Assunto da mensagem. (Letras)

Observação:
O 1º Parâmetro é o retorno da função "Email - Mensagens em uma pasta".

Exemplo:
Assumindo como parâmetro a mensagem(id) "<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", 
que tem como assunto "Softwell Solutions", o retorno será "Softwell Solutions".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageSubject(Variant messageVar) throws Exception{
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;      
    }
    // Obtém o assunto da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    String subject = message.getSubject();
    // Retorna o assunto da mensagem
    return VariantPool.get(subject);
  }
```

---

## Email - Corpo da Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageBody` |
| **Código** | 1088 |
| **Assinatura** | `Email - Corpo da Mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o corpo da mensagem passada por parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1)

Retorno:
Corpo da mensagem. (Letras)

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Mensagens em uma pasta".
2. Caso o corpo da mensagem esteja formatado, o retorno terá tags HTML.
3. Caso o email contenha anexo, o mesmo será desconsiderado.

Exemplo:
Assumindo como parâmetro a mensagem(id) "<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", 
que tem como corpo "Qualquer dúvida entre em contato com o suporte", o retorno será "Qualquer dúvida entre 
em contato com o suporte".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageBody(Variant messageVar) throws Exception {
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;
    }

    // Obtém o corpo da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    String messageBody = null;
    if (message.isMimeType("text/plain")) {
      messageBody = message.getContent().toString();
    } else if (message.isMimeType("text/html")) {
      StringBuffer buffer = new StringBuffer();
      String newMessage = message.getContent().toString();
      for (int index = 0; index < newMessage.length(); index++) {
        char c = newMessage.charAt(index);
        if (c == '\n') {
          buffer.append("<br>");
        } else {
          buffer.append(c);
        }
      }
      messageBody = buffer.toString();
    } else {
      jakarta.mail.Multipart multipart = (jakarta.mail.Multipart) message.getContent();
      for (int index = 0; index < multipart.getCount(); index++) {
        jakarta.mail.Part part = multipart.getBodyPart(index);

        String disposition = part.getDisposition();
        if (disposition != null && disposition.equals(jakarta.mail.Part.INLINE)) {
          if (part.isMimeType("text/plain")) {
            messageBody = part.getContentType().toString();
            break;
          }
        } else if (disposition == null) {
          if (part.getContent() instanceof jakarta.mail.internet.MimeMultipart) {
            jakarta.mail.internet.MimeMultipart mm = (jakarta.mail.internet.MimeMultipart) part.getContent();
            if (mm.getBodyPart(1).getContent() instanceof String) {
              messageBody = mm.getBodyPart(1).getContent().toString();
              break;
            }
          } else {
            if (part.getContent() instanceof String) {
              messageBody = part.getContent().toString();
              break;
            }
          }
        }
      }
    }
    return VariantPool.get(messageBody);
  }
```

---

## Email - Criar corpo da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSMTPCreateMessageBody` |
| **Código** | 1099 |
| **Assinatura** | `Email - Criar corpo da mensagem (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria o conteúdo do email que pode ser texto, html e anexo.

Parâmetro(s):
1. Lista de Parâmetros
       1. Tipo do conteúdo. (Ver observação 1)
       2. Valor do conteúdo.
N. Lista de Parâmetros
       1. Tipo do conteúdo. (Ver observação 1)
       2. Valor do conteúdo.

Retorno:
Corpo da mensagem. (Variante)

Observações:
O tipo do conteúdo pode ser "texto" (texto normal), "html"(texto em html) ou "anexo".

### Código Servidor (Java)

```java
protected final Variant ebfSMTPCreateMessageBody(Variant... variants) throws Exception{
  jakarta.mail.Multipart messageBody = new jakarta.mail.internet.MimeMultipart();
  jakarta.activation.FileDataSource fds;
  jakarta.mail.internet.MimeBodyPart bodyPart;
  String bodyType;
  String bodyContent;
  String contentType;

  for (int index = 0; index<variants.length; index++) {
    bodyType = ((List)variants[index].getObject()).get(0).toString().toLowerCase();
    bodyContent = ((List)variants[index].getObject()).get(1).toString();
    if ((bodyType != null) && (bodyType != "") && (bodyContent != null) && (bodyContent != "")){
      if ((bodyType == "texto") || (bodyType == "html")){
        if (bodyType == "texto") {
          contentType = "text/plain";
        } else {
          contentType = "text/html";
        }

        bodyPart = new jakarta.mail.internet.MimeBodyPart();
        bodyPart.setContent(bodyContent, contentType);
        messageBody.addBodyPart(bodyPart);

      } else if (bodyType == "anexo") {
        fds = new jakarta.activation.FileDataSource(bodyContent); 
        bodyPart = new jakarta.mail.internet.MimeBodyPart();
        bodyPart.setDataHandler(new jakarta.activation.DataHandler(fds));
        bodyPart.setFileName(fds.getName());
        messageBody.addBodyPart(bodyPart);
      }
    }
  }

  return VariantPool.get(messageBody);
}
```

---

## Email - Criar lista de destinatários

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSMTPGetRecipientsAddress` |
| **Código** | 1100 |
| **Assinatura** | `Email - Criar lista de destinatários (Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria uma lista de destinatários para o envio de email.

Parâmetro(s):
1. Destinatários "TO". (Letras)
2. Destinatários "CC". (Letras)
3. Destinatários "BCC". (Letras)

Retorno:
Lista de destinatários. (Letras)

Observações:
1. Os destinatários passados por parâmetros são separados por ","(Vírgula).
2. O retorno desta função é usado como parâmetro para as funções de envio de email.

Exemplo:
Assumindo como 1º parâmetro "suportesoftwell@softwell.com.br", como 2º parâmetro 
"maker@softwell.com.br" e 3º parâmetro "softwell@softwell.com.br", o retorno será "[[1, 
suportesoftwell@softwell.com.br], [2, maker@softwell.com.br], [3, softwell@softwell.com.br]]".

### Código Servidor (Java)

```java
protected final Variant ebfSMTPGetRecipientsAddress(Variant toVar, Variant ccVar, Variant bccVar)
      throws Exception{
      
    ArrayList<String> listTo = (ArrayList<String>) Functions.stringToList(replaceAll(toVar.getString()," ",""),",");
    ArrayList<String> listCc = (ArrayList<String>) Functions.stringToList(replaceAll(ccVar.getString()," ",""),",");
    ArrayList<String> listBcc = (ArrayList<String>) Functions.stringToList(replaceAll(bccVar.getString()," ",""),",");

    java.util.List<List> listAddress = new ArrayList<List>();
    java.util.List<String> currentList;
    for (int index =0; index<listTo.size();index++){
      if (listTo.get(index)!= ""){
        currentList = new ArrayList<String>();
        currentList.add("1");
        currentList.add(listTo.get(index).toString());
        listAddress.add(currentList);
      }
    }
    for (int index =0; index<listCc.size();index++){
      if (listCc.get(index)!= ""){
        currentList = new ArrayList<String>();
        currentList.add("2");
        currentList.add(listCc.get(index).toString());
        listAddress.add(currentList);
      }
    }
    for (int index =0; index<listBcc.size();index++){
      if (listBcc.get(index)!= ""){
        currentList = new ArrayList<String>();
  	currentList.add("3");
	currentList.add(listBcc.get(index).toString());
	listAddress.add(currentList);
      }
    }
	
    return VariantPool.get(listAddress);
  }
```

---

## Email - Data da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageDate` |
| **Código** | 1089 |
| **Assinatura** | `Email - Data da mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém a data da mensagem passada por parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1) 

Retorno:
Data da mensagem. (Letras)

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Mensagens em uma pasta".
2. O retorno é do tipo Letras e precisa ser tratado antes de ser convertido para Data, pois é retornado com 
informações adicionais além da data), como detalhado no exemplo.

Exemplos:
Assumindo como parâmetro a mensagem(id) "<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", 
que tem como data definida "Fri, 24 Feb 2012 10:36:29 -0200", o retorno será "Fri, 24 Feb 2012 10:36:29 -0200".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageDate(Variant messageVar) throws Exception{
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;      
    }
    // Obtém a data da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    String received = message.getHeader("Date")[0].toString();
    // Retorna a data da mensagem
    return VariantPool.get(received);
  }
```

---

## Email - Destinatários da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageListTo` |
| **Código** | 1092 |
| **Assinatura** | `Email - Destinatários da mensagem (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna uma lista de destinatários da mensagem passada por parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1)

Retorno:
Lista de destinatários. (Variante)

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Mensagens em uma pasta".
2. Para manipular o retorno desta mensagem é necessário o uso das funções de Lista.

Exemplo:
Assumindo como parâmetro a mensagem(id) "<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", 
que tem como destinatários "[Suporte@softwell.com.br,comercial@softwell.com.br", o retorno será "
[Suporte@softwell.com.br,comercial@softwell.com.br".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageListTo(Variant messageVar) throws Exception{
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;      
    }
    // Obtém os destinatários da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    jakarta.mail.Address[] listAddress = message.getRecipients(jakarta.mail.Message.RecipientType.TO);
    List<String> listTo = new ArrayList<String>();
    for (int index=0; index<listAddress.length; index++) {
      listTo.add(listAddress[index].toString());      
    }
    // Retorna a lista de destinatários da mensagem
    return VariantPool.get(listTo);    
  }
```

---

## Email - Email do remetente da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetMessageFrom` |
| **Código** | 1142 |
| **Assinatura** | `Email - Email do remetente da mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o email do remetente da mensagem passada por parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1)

Retorno:
Email do remetente da mensagem. (Letras)

Observação:
O 1º Parâmetro é o retorno da função "Email - Mensagens em uma pasta".

Exemplo:
Assumindo como parâmetro a mensagem(id) "<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", 
que tem como email do remetente "suportesoftwell@softwell.com.br", o retorno será 
"suportesoftwell@softwell.com.br".

### Código Servidor (Java)

```java
protected final Variant ebfGetMessageFrom(Variant messageVar) throws Exception{
  // Verifica se a mensagem passada como parâmetro é um objeto Message
  Object messageObj = messageVar.getObject();
  if (!(messageObj instanceof jakarta.mail.Message)) {
    return Variant.VARIANT_NULL;
  }
  // Obtém o remetente da mensagem
  jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
  String from = message.getFrom()[0].toString();
  String[] email={};
  if(from.indexOf("<")>-1){
    email = from.split("<");
    from = ((email[1]).replace(">", "")).trim();
  }
  //Retorna o rementente da mensagem
  return VariantPool.get(from);
}
```

---

## Email - Enviar Email SSL/TLS - Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendAuthenticatedEmailWithCA2` |
| **Código** | 1103 |
| **Assinatura** | `Email - Enviar Email SSL/TLS - Certificado Digital (Letras;Letras;Letras;Letras;Letras;Letras;Variante;Variante;Letras;Lógico;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Variante;Variante;Letras;Lógico;Letras;Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem instantaneamente para o(s) destinatário(s) utilizando certificado Digital.

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Tipo de Autenticação: (Letras)  
       1 - Sem SSL
       2 - Com SSL
       3 - Com TLS
4. Usuário. (Letras)
5. Senha. (Letras)
6. Remetente. (Letras)
7. Destinatários. (Variante) (Ver Observação 1)
8. Assunto. (Variante)
9. Mensagem. (Letras)
10. HTML? (Lógico)
11. Caminho do certificado. (Letras)
12. Senha do certificado. (Letras)

Retorno:
Não possui.

Observações:
1. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
2. Caso o 10º parâmetro seja Verdadeiro, a mensagem será renderizada em HTML, obedecendo a todas as 
regras da linguagem.
3. O envio de e-mails deve ser sempre feito a partir de um único modo de conexão (SSL, TLS ou Sem SSL). 
Caso haja a troca do modo de conexão, é necessário reiniciar o servidor de aplicações. Esta é uma limitação 
da linguagem (Java).
4. O Servidor SMTP do Hotmail só aceita conexões TLS.
5. O 6º parâmetro, além do email do remetente, também pode ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
Ex: Passando Nome e email: Carlos Santos <carlos@testes.com>
      Passando apenas email: carlos@testes.com

### Código Servidor (Java)

```java
protected final Variant ebfSendAuthenticatedEmailWithCA2(Variant hostVar, Variant portVar, Variant SSLAuthenticationVar, Variant userVar, Variant passwordVar, Variant fromVar,
      Variant toVar, Variant subjectVar, Variant bodyVar, Variant html, Variant keyStore, Variant keyStorePass) throws Exception {

    String SSL = SSLAuthenticationVar.getTrimString();
    String host = hostVar.getTrimString();
    String port = portVar.getTrimString();

    if (port.isEmpty()) {
      port = SSL.equals("3") ? "587" : (SSL.equals("2") ? "465" : "25");
    }

    // Usar Bouncy Castle como provider seguro de criptografia
    java.security.Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());

    java.util.Properties props = new java.util.Properties();
    props.put("javax.net.ssl.trustStoreType", "JKS");
    props.put("javax.net.ssl.trustStore", keyStore.getString());
    props.put("javax.net.ssl.trustStorePassword", keyStorePass.getString());

    if (Boolean.parseBoolean(System.getProperty("proxySet"))) {
      props = wfr.util.Functions.getProxySettings(props);
    }

    props.put("mail.debug", "false");
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.port", port);
    props.put("mail.smtp.auth", "true");

    if (SSL.equals("2")) {
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.socketFactory.fallback", "false");
      props.put("mail.smtp.socketFactory.port", port);
    }

    if (SSL.equals("3")) {
      props.put("mail.smtp.starttls.enable", "true");
    }

    final String myUser = userVar.getTrimString();
    final String myPass = passwordVar.getTrimString();

    jakarta.mail.Authenticator auth = new jakarta.mail.Authenticator() {
      protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
        return new jakarta.mail.PasswordAuthentication(myUser, myPass);
      }
    };

    jakarta.mail.Session session = jakarta.mail.Session.getInstance(props, auth);
    jakarta.mail.internet.MimeMessage message = new jakarta.mail.internet.MimeMessage(session);

    message.setFrom(new jakarta.mail.internet.InternetAddress(fromVar.getString(), fromVar.getString()));
    message.addRecipient(jakarta.mail.Message.RecipientType.TO, new jakarta.mail.internet.InternetAddress(toVar.getString(), toVar.getString()));
    message.setSubject(subjectVar.getString());
    message.setContent(bodyVar.getString(), html.getBoolean() ? "text/html; charset=UTF-8" : "text/plain; charset=UTF-8");

    jakarta.mail.Transport.send(message);
    return Variant.VARIANT_NULL;
  }
```

---

## Email - Enviar Email com SSL/TLS

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendAuthenticatedEmail2` |
| **Código** | 1102 |
| **Assinatura** | `Email - Enviar Email com SSL/TLS (Letras;Letras;Letras;Letras;Letras;Letras;Variante;Variante;Letras;Lógico)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Variante;Variante;Letras;Lógico |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem instantaneamente para o(s) destinatário(s).

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Tipo de Autenticação: (Letras)
       1 - Sem SSL
       2 - Com SSL
       3 - Com TLS
4. Usuário. (Letras)
5. Senha. (Letras)
6. Remetente. (Letras)
7. Destinatários. (Variante) (Ver Observação 1)
8. Assunto. (Variante)
9. Mensagem. (Letras)
10. HTML? (Lógico)

Retorno:
Não possui.

Observações:
1. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
2. Caso o 10º parâmetro seja Verdadeiro, a mensagem será renderizada como HTML, obedecendo a todas as 
regras da linguagem.
3. O 6º parâmetro, além do email do remetente, também poderá ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
    Ex: Passando Nome e email: Carlos Santos <carlos@testes.com>
         Passando apenas email: carlos@testes.com
4. O Servidor SMTP do Hotmail só aceita conexões TLS.

### Código Servidor (Java)

```java
protected final Variant ebfSendAuthenticatedEmail2(Variant hostVar, Variant portVar, Variant SSLAuthenticationVar, Variant userVar, Variant passwordVar, Variant fromVar,
      Variant toVar, Variant subjectVar, Variant bodyVar, Variant html) throws Exception {

    String SSL = SSLAuthenticationVar.getTrimString();
    String host = hostVar.getTrimString();

    String port;
    if (portVar.isNull() || (port = portVar.getTrimString()) == "") {
      if(SSL == "3") {
        port = "587";
      } else {
        if (SSL == "2") {
          port = "465";
        } else{
          port = "25";
        }
      }
    }

    java.util.Properties props = new java.util.Properties();
    props.put("mail.debug", "false");
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.port", port);

    /**Get proxy settings*/
    if(System.getProperty("proxySet") != null && System.getProperty("proxySet").equalsIgnoreCase("true"))
      props = wfr.util.Functions.getProxySettings(props);  

    if (SSL.equals("2")) {
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    } 
    if (SSL.equals("3")) {
      props.put("mail.smtp.starttls.enable","true");
    }

    props.put("mail.smtp.auth", "true");

    final String myUser = userVar.getTrimString();
    final String myPass = passwordVar.getTrimString();

    jakarta.mail.Authenticator auth = new jakarta.mail.Authenticator() {
      public jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
        return new jakarta.mail.PasswordAuthentication(myUser, myPass);
      }
    };
    
    props.put("mail.smtp.user", myUser);
    props.put("mail.smtp.password", myPass);

    jakarta.mail.internet.InternetAddress myInfo = null;
    String value = fromVar.getString().trim();
    java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("(.+)?<(.+?)>");
    java.util.regex.Matcher matcher = pattern.matcher(value.trim());

    if (matcher.find()) {
      myInfo = new jakarta.mail.internet.InternetAddress(matcher.group(2),matcher.group(1));
    } else {
      myInfo = new jakarta.mail.internet.InternetAddress(fromVar.getString().trim());
    }
    jakarta.mail.Session session = jakarta.mail.Session.getInstance(props, auth);
    jakarta.mail.internet.MimeMessage message = new jakarta.mail.internet.MimeMessage(session);
    message.setFrom(myInfo);
    if (toVar.getObject() instanceof java.util.List) {
      java.util.List<java.util.List> to = (java.util.List<java.util.List>) toVar.getObject();
      int currentAddressType;
      java.util.List currentList = null;
      for (int index = 0; index < to.size(); index++) {
        currentList = to.get(index);
        currentAddressType = Integer.parseInt(currentList.get(0).toString());
        jakarta.mail.internet.InternetAddress currentInternetAddress = new jakarta.mail.internet.InternetAddress(currentList.get(1).toString());
        jakarta.mail.Message.RecipientType currentRecipientType;
        if (currentAddressType == 1) {
          currentRecipientType = jakarta.mail.Message.RecipientType.TO;
        } else if (currentAddressType == 2) {
          currentRecipientType = jakarta.mail.Message.RecipientType.CC;
        } else {
          currentRecipientType = jakarta.mail.Message.RecipientType.BCC;
        }

        message.addRecipient(currentRecipientType, currentInternetAddress);
      }
    } else if (toVar.getObject() instanceof String) {
      ArrayList<String> listTo = (ArrayList<String>) Functions.stringToList(toVar.toString(), ",");
      for (int index = 0; index < listTo.size(); index++) {
        if ((listTo.get(index).toString() != null) && (listTo.get(index).toString() != "")) {
          jakarta.mail.internet.InternetAddress currentInternetAddress = new jakarta.mail.internet.InternetAddress(listTo.get(index).toString());
          message.addRecipient(jakarta.mail.Message.RecipientType.TO, currentInternetAddress);
        }
      }
    } else {
      return Variant.VARIANT_NULL;
    } 


    message.setSubject(subjectVar.getString());
    message.setContent(bodyVar.getString(), (html.getBoolean()) ? "text/html; charset=UTF-8" : "text/plain; charset=UTF-8");
    jakarta.mail.Transport.send(message);

    return Variant.VARIANT_NULL;
  }
```

---

## Email - Enviar Email com SSL/TLS - Anexo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSMTPSendAuthenticatedAttachEmail2` |
| **Código** | 1101 |
| **Assinatura** | `Email - Enviar Email com SSL/TLS - Anexo (Letras;Letras;Letras;Letras;Letras;Letras;Variante;Letras;Variante;Lógico;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Variante;Letras;Variante;Lógico;Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem com anexo(s) para o(s) destinatário(s).

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Tipo de Autenticação: (Letras)
       1 - Sem SSL
       2 - Com SSL
       3 - Com TLS
4. Usuário. (Letras)
5. Senha. (Letras)
6. Remetente. (Letras)
7. Destinatários. (Variante) (Ver Observação 1)
8. Assunto. (Variante)
9. Mensagem. (Letras)
10. HTML? (Lógico)
11. Lista de anexos. (Variante) (Ver Observação 2)

Retorno:
Não possui.

Observações:
1. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
2. Para passar apenas um anexo, é possível passar apenas o caminho do arquivo. Se for preciso passar 
vários anexos, é necessário passar uma lista de caminhos dos arquivos.
3. Caso o 10º parâmetro seja Verdadeiro, a mensagem será renderizada como HTML, obedecendo a todas as 
regras da linguagem.
4. O Servidor SMTP do Hotmail só aceita conexões TLS.
5. O 6º parâmetro, além do email do remetente, também pode ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
    Ex: Passando Nome e email: Carlos Santos <carlos@testes.com>
         Passando apenas email: carlos@testes.com

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfSMTPSendAuthenticatedAttachEmail2(
    Variant hostVar, 
    Variant portVar, 
    Variant SSLAuthenticationVar, 
    Variant userVar, 
    Variant passwordVar, 
    Variant fromVar,
    Variant toVar, 
    Variant subjectVar, 
    Variant bodyVar, 
    Variant html, 
    Variant attachmentVar) throws Exception {

  String SSL = SSLAuthenticationVar.getTrimString();
  String host = hostVar.getTrimString();
  if (hostVar.isNull() || (host == ""))
    return Variant.VARIANT_NULL;

  String port = portVar.getTrimString();
  if (portVar.isNull() || (port = portVar.getTrimString()) == "") {
    if(SSL == "3") {
      port = "587";
    } else {
      if (SSL == "2") {
        port = "465";
      } else{
        port = "25";
      }
    }
  }

  String user = userVar.getTrimString();
  String password = passwordVar.getTrimString();

  java.util.Properties props = System.getProperties();
  props.put("mail.debug", "false");

  /**Get proxy settings*/
  if(System.getProperty("proxySet") != null && System.getProperty("proxySet").equalsIgnoreCase("true"))
    props = wfr.util.Functions.getProxySettings(props);

  jakarta.mail.Session session;
  props.put("mail.smtp.host", host);
  props.put("mail.transport.protocol", "smtp");
  props.put("mail.smtp.port", port);
  if (SSL.equals("2")) {
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
  }
  if (SSL.equals("3")) {
    props.put("mail.smtp.starttls.enable","true");
  }
  jakarta.mail.Authenticator authenticator = null;
  if (user.length() > 0 && password.length() > 0) {
    // Classe para autenticação
    class SimpleAuthenticator extends jakarta.mail.Authenticator {
      private String user;
      private String password;

      SimpleAuthenticator(String user, String password) {
        this.user = user;
        this.password = password;
      }

      /**
        * @see jakarta.mail.Authenticator#getPasswordAuthentication()
        */
      @Override
      protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
        return new jakarta.mail.PasswordAuthentication(this.user, this.password);
      }
    }

    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.user", user);
    props.put("mail.smtp.password", password);
    authenticator = new SimpleAuthenticator(user, password);

  }
  session = jakarta.mail.Session.getInstance(props, authenticator);

  jakarta.mail.internet.MimeMessage msg = new jakarta.mail.internet.MimeMessage(session);

  //Adiciona o rementente à mensagem
  String from = fromVar.getTrimString();
  msg.setFrom(new jakarta.mail.internet.InternetAddress(from));

  //Altera a data de envio da mensagem
  msg.setSentDate(new Date());

  //Adiciona os destinatários à mensagem
  Object toObj = toVar.getObject();
  jakarta.mail.internet.InternetAddress currentInternetAddress;

  if (toObj instanceof java.util.List) {

    java.util.List<java.util.List> to = (java.util.List<java.util.List>) toObj;
    int currentAddressType;
    java.util.List currentList = null;
    for (int index = 0; index < to.size(); index++) {
      currentList = to.get(index);
      currentAddressType = Integer.parseInt(currentList.get(0).toString());
      currentInternetAddress = new jakarta.mail.internet.InternetAddress(currentList.get(1).toString());
      jakarta.mail.Message.RecipientType currentRecipientType;
      if (currentAddressType == 1) {
        currentRecipientType = jakarta.mail.Message.RecipientType.TO;
      } else if (currentAddressType == 2) {
        currentRecipientType = jakarta.mail.Message.RecipientType.CC;
      } else {
        currentRecipientType = jakarta.mail.Message.RecipientType.BCC;
      }

      msg.addRecipient(currentRecipientType, currentInternetAddress);
    }
  } else if (toObj instanceof String) {
    ArrayList<String> listTo = (ArrayList<String>) Functions.stringToList(replaceAll(toObj.toString(), " ", ""), ",");
    for (int index = 0; index < listTo.size(); index++) {
      if ((listTo.get(index).toString() != null) && (listTo.get(index).toString() != "")) {
        currentInternetAddress = new jakarta.mail.internet.InternetAddress(listTo.get(index).toString());
        msg.addRecipient(jakarta.mail.Message.RecipientType.TO, currentInternetAddress);
      }
    }
  } else {
    return Variant.VARIANT_NULL;
  }
  //Adiciona o assunto da mensagem
  String subject = subjectVar.getTrimString();
  if ((subject != null) && (subject != "")) {
    msg.setSubject(subject);
  }

  //Adiciona o corpo da mensagem
  Object a = bodyVar.getObject();
  jakarta.mail.Multipart messageBody;
  jakarta.activation.FileDataSource fds;
  if (a instanceof jakarta.mail.Multipart) {
    messageBody = (jakarta.mail.Multipart) a;
  } else {
    messageBody = new jakarta.mail.internet.MimeMultipart();
    jakarta.mail.internet.MimeBodyPart bodyPart = null;
    String bodyContent = bodyVar.getTrimString();
    if ((bodyContent != null) && (bodyContent != "")) {
      bodyPart = new jakarta.mail.internet.MimeBodyPart();
      bodyPart.setContent(bodyVar.getString(), (html.getBoolean())? "text/html; charset=UTF-8" : "text/plain; charset=UTF-8");
      messageBody.addBodyPart(bodyPart);
    }
  }

  Object attachmentObj = attachmentVar.getObject();
  String currentAttachment;
  jakarta.mail.internet.MimeBodyPart bodyPart = null;
  if (attachmentObj instanceof List) {
    java.util.List<String> attachment = (List<String>) attachmentObj;

    for (int index = 0; index < attachment.size(); index++) {
      currentAttachment = attachment.get(index).toString();
      if ((currentAttachment != null) && (currentAttachment != "")) {
        fds = new jakarta.activation.FileDataSource(wfr.util.Functions.getDirectory(getSystem(), currentAttachment));
        bodyPart = new jakarta.mail.internet.MimeBodyPart();
        bodyPart.setDataHandler(new jakarta.activation.DataHandler(fds));
        bodyPart.setFileName(fds.getName());
        messageBody.addBodyPart(bodyPart);
      }
    }
  } else if (attachmentObj instanceof String) {
    currentAttachment = attachmentObj.toString();
    if ((currentAttachment != null) && (currentAttachment != "")) {
      fds = new jakarta.activation.FileDataSource(wfr.util.Functions.getDirectory(getSystem(), currentAttachment));
      bodyPart = new jakarta.mail.internet.MimeBodyPart();
      bodyPart.setDataHandler(new jakarta.activation.DataHandler(fds));
      bodyPart.setFileName(fds.getName());
      messageBody.addBodyPart(bodyPart);
    }
  }

  msg.setContent(messageBody);
  jakarta.mail.Transport.send(msg);
  if (SSL.equals("2")) {
    props.remove("mail.smtp.socketFactory.class");
  }

  return Variant.VARIANT_NULL;
}
```

---

## Email - Fechar pasta do email

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCloseEmailFolder` |
| **Código** | 1082 |
| **Assinatura** | `Email - Fechar pasta do email (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha a pasta do email passada por parâmetro.

Parâmetro:
1. Pasta do Email. (Variante)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCloseEmailFolder(Variant folderVar) throws Exception {
    Object folderObj = folderVar.getObject();
    if (!(folderObj instanceof jakarta.mail.Folder)){
      return Variant.VARIANT_NULL;
    }

    try(jakarta.mail.Folder folder = (jakarta.mail.Folder) folderObj) {
      if (folder != null){
        folder.close(true); 
      }
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Email - Fechar pasta do repositório de emails

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailCloseFolder` |
| **Código** | 1083 |
| **Assinatura** | `Email - Fechar pasta do repositório de emails (Variante;Lógico)` |
| **Parâmetros** | Variante;Lógico |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha a pasta do repositório de emails.

Parâmetro(s):
1. Pasta do Email. (Variante) (Ver observação 1)
2. Apagar mensagens marcadas como deletadas. (Lógico)

Observações: 
1. O 1º Parâmetro é o retorno da função "Email - Obter pasta do repositório de emails".
1. Mensagens não poderão ser lidas caso a pasta a qual ela pertença esteja fechada.
2. O segundo parâmetro só é válido para conexões com o protocolo POP3.

Exemplo:
Assumindo como 1º parâmetro a pasta "INBOX" e como 2º parâmetro o valor lógico "True", a pasta "INBOX" 
será fechada e todas mensagens marcadas como deletadas serão apagadas.

### Código Servidor (Java)

```java
protected final Variant ebfEmailCloseFolder(Variant folderVar, Variant deleteFlaggedMessageVar) throws Exception {
    // Verifica se a pasta passada como parâmetro é um objeto Folder
    Object folderObj = folderVar.getObject();
    if (!(folderObj instanceof jakarta.mail.Folder)) {
      return Variant.VARIANT_NULL;
    }

    try(jakarta.mail.Folder folder = (jakarta.mail.Folder) folderObj) {
      String protocol = folder.getStore().getURLName().getProtocol();
      boolean deleteFlaggedMessage;
      if (protocol == "imap" || protocol == "imaps"){
        deleteFlaggedMessage = false;  
      }else{
        deleteFlaggedMessage = deleteFlaggedMessageVar.getBoolean();
      }

      if (folder != null) {
        folder.close(deleteFlaggedMessage);
      }
    }

    return Variant.VARIANT_NULL;
  }
```

---

## Email - Fechar repositório de emails

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailCloseStore` |
| **Código** | 1084 |
| **Assinatura** | `Email - Fechar repositório de emails (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha o repositório de emails.

Parâmetro:
1. Repositório de Emails. (Variante) (Ver observação 1) 

Retorno:
Não possui.

Observação:
O 1º Parâmetro é o retorno da função "Email - Repositório de emails".

### Código Servidor (Java)

```java
protected final Variant ebfEmailCloseStore(Variant storeVar) throws Exception{
    // Verifica se o objeto passado como paâmetro é um objeto Store
    Object storeObj = storeVar.getObject();
    if (!(storeObj instanceof jakarta.mail.Store)){
      return Variant.VARIANT_NULL;
    }

    jakarta.mail.Store store = (jakarta.mail.Store) storeObj;
    // Fecha o repositório de emails
    if (store != null){
      store.close();
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Email - Id da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageId` |
| **Código** | 1091 |
| **Assinatura** | `Email - Id da mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o identificador único (ID) da mensagem passada por parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1)

Retorno:
Identificador da mensagem. (Letras)

Observação:
O 1º Parâmetro é o retorno da função "Email -  Mensagens em uma pasta".

Exemplo:
Assumindo como parâmetro a mensagem "Softwell", que tem o ID "
<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", o retorno será "
<27117501.441199967041995.JavaMail.SYSTEM@APOLO>".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageId(Variant messageVar) throws Exception{
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;      
    }
    // Obtém o id da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    String idMessage = message.getHeader("message-ID")[0];
    // Retorna o id da mensagem
    return VariantPool.get(idMessage);
  }
```

---

## Email - Ip do remetente da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageSenderIp` |
| **Código** | 1093 |
| **Assinatura** | `Email - Ip do remetente da mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o IP do remetente da mensagem passada por parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1)

Retorno:
Ip do Remetente da mensagem. (Letras)

Observações:
1. O 1º Parâmetro é o retorno da função "Email -  Mensagens em uma pasta".
2. O retorno deve ser tratado com as funções de texto, pois a função retorna mais informações do que 
apenas o IP do remetente da mensagem.

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageSenderIp(Variant messageVar) throws Exception{
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;      
    }
    // Obtém o ip da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    String received = message.getHeader("Received")[0].toString();
    System.out.println(received);
    // Retorna o ip da mensagem
    return VariantPool.get(received);    
  }
```

---

## Email - Mensagens em uma pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailListMessages` |
| **Código** | 1097 |
| **Assinatura** | `Email - Mensagens em uma pasta (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna uma lista com todas as mensagens contidas em uma pasta do repositório de emails.

Parâmetro:
1. Pasta do repositório de emails. (Variante) (Ver observação 1)

Retorno:
Lista de mensagens contidas na pasta do repositório de emails. (Variante)

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Obter pasta do repositório de emails".
2. Para manipular o retorno desta função é necessário o uso das funções de Lista.

Exemplo:
Assumindo como parâmetro o retorno da função "Email - Obter pasta do repositório de emails", o retorno 
será uma lista com as mensagens contidas na pasta.

### Código Servidor (Java)

```java
protected final Variant ebfEmailListMessages(Variant folderVar) throws Exception {
    Object folderObj = folderVar.getObject();
    if (!(folderObj instanceof jakarta.mail.Folder)) {
      return Variant.VARIANT_NULL;
    }

    jakarta.mail.Folder folder = (jakarta.mail.Folder) folderObj;
    return VariantPool.get(Arrays.asList(folder.getMessages()));
  }
```

---

## Email - Obter pasta do repositório de emails

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetFolder` |
| **Código** | 1087 |
| **Assinatura** | `Email - Obter pasta do repositório de emails (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém uma pasta do repositório de emails passado como parâmetro.

Parâmetro(s):
1. Repositório de emails. (Variante) (Ver observação 1)
2. Nome da pasta. (Letras)

Retorno:
Pasta do repositório de emails. (Variante)

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Repositório de emails".
2. A pasta é aberta automaticamente.

Exemplo:
Assumindo como 1º parâmetro o repositório de email "imaps://seuemail%40gmail.com@imap.gmail.com:993" e 
como 2º parâmetro a pasta "INBOX", o retorno será a pasta "INBOX" do repositório de emails.

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetFolder(Variant storeVar,Variant folderNameVar) throws Exception {
    Object storeObj = storeVar.getObject();

    if (!(storeObj instanceof jakarta.mail.Store)) {
      return Variant.VARIANT_NULL;
    }

    String folderName = folderNameVar.getTrimString();
    if (folderName.isEmpty()) {
      return Variant.VARIANT_NULL;
    }

    jakarta.mail.Store store = (jakarta.mail.Store) storeObj;
    jakarta.mail.Folder folder = store.getFolder(folderName);
    folder.open(jakarta.mail.Folder.READ_WRITE);
    return VariantPool.get(folder);
  }
```

---

## Email - Obter repositório de emails

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetEmailStoreImap` |
| **Código** | 1143 |
| **Assinatura** | `Email - Obter repositório de emails (Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém um repositório de email para a manipulação de e-mails.

Parâmetro(s):
1. Servidor de e-mail. (Letras)
2. Porta do servidor de e-mail. (Letras)
3. Usuário. (Letras)
4. Senha. (Letras)

Retorno:
Repositório de Emails. (Variante)

Observação:
É utilizado o protocolo IMAP.

### Código Servidor (Java)

```java
public final Variant ebfGetEmailStoreImap(Variant hostVar,Variant portVar,Variant userVar,Variant passwordVar) throws Exception{   
    // Verifica se o servidor passado como parâmetro é nulo
    if (hostVar.getString() == null){
      return Variant.VARIANT_NULL;
    }
    // Adiciona as propriedades da sessão que será criada
    Properties prop = new Properties();
    prop.put("mail.debug","true");
    prop.put("proxySet", "true");
    prop.put("socksProxyHost", System.getProperty("http.proxyHost"));
    prop.put("socksProxyPort", System.getProperty("http.proxyPort"));
    prop.put("mail.store.protocol", "imap");
    // Caso a porta passada como parâmetro para a conexão com o servidor seja nulo, utiliza a porta padrão do protocolo "imap" para a criação da sessão
    if (portVar.getString() == null) {
      prop.put("mail.store.port", "143");
    }else{
      prop.put("mail.store.port", portVar.getTrimString());
    }
    // Cria a sessão
    jakarta.mail.Session session = jakarta.mail.Session.getInstance(prop,null);
    // Cria o repositório de emails
    jakarta.mail.Store store = session.getStore("imap");
    store.connect(hostVar.getTrimString(), userVar.getString(), passwordVar.getString());
    // Retorna o repositório de emails
    return VariantPool.get(store);
  }
```

---

## Email - Pasta existente no repositório de emails?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailExistFolder` |
| **Código** | 1085 |
| **Assinatura** | `Email - Pasta existente no repositório de emails? (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Recebe ´por parâmetro uma pasta e verifica se ela existe no repositório de emails.

Parâmetro:
1. Pasta do repositório de emails. (Variante) (Ver observação 1)

Retorno:
Retorna "True" se a pasta existe, caso contrário retorna "False". (Lógico)

Observação:
O 1º Parâmetro é o retorno da função "Email - Obter pasta do repositório de emails". 

Exemplo:
Assumindo como parâmetro a pasta "INBOX" e que a mesma exista no repositório de emails, o retorno será o 
valor lógico "True".

### Código Servidor (Java)

```java
protected final Variant ebfEmailExistFolder(Variant folderVar)throws Exception {
    // Verifica o objeto passado é um Folder
    Object folderObj = folderVar.getObject();
    boolean exists = false;

    if (!(folderObj instanceof jakarta.mail.Folder)) {
      return Variant.VARIANT_FALSE;
    }

    try(jakarta.mail.Folder folder = (jakarta.mail.Folder) folderObj) {
      exists = folder.exists();
    }

    return VariantPool.get(exists);
  }
```

---

## Email - Pastas do repositório de emails

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailListFolders` |
| **Código** | 1096 |
| **Assinatura** | `Email - Pastas do repositório de emails (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna uma lista com os nomes das pastas existentes no repositório de emails.

Parâmetro:
1. Repositório de emails. (Variante) (Ver observação 1)

Retorno:
Lista com o nome das pastas contidas no repositório de emails. (Variante)

Observações:
1. O 1º Parâmetro é o retorno da função "Email - Repositório de emails".
2. Para manipular o retorno da função é necessário o uso das funções de Lista.

### Código Servidor (Java)

```java
protected final Variant ebfEmailListFolders(Variant storeFolderVar) throws Exception{
    Object storeFolderObj = storeFolderVar.getObject();
    if (storeFolderObj instanceof jakarta.mail.Store) {
      jakarta.mail.Store store = (jakarta.mail.Store) storeFolderVar.getObject();
      jakarta.mail.Folder rootFolder = store.getDefaultFolder();
      return VariantPool.get(Arrays.asList(rootFolder.list()));
    } else if (storeFolderObj instanceof jakarta.mail.Folder) {
      jakarta.mail.Folder folder = (jakarta.mail.Folder) storeFolderVar.getObject();
      return VariantPool.get(Arrays.asList(folder.list()));
    }

    return Variant.VARIANT_NULL;
  }
```

---

## Email - Remetente da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetMessageFrom` |
| **Código** | 1090 |
| **Assinatura** | `Email - Remetente da mensagem (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o remetente da mensagem passada como parâmetro.

Parâmetro:
1. Mensagem. (Variante) (Ver observação 1) (Função: Email -  Mensagens em uma pasta)

Retorno:
Remetente da mensagem. (Letras)

Observações:
1. O 1º Parâmetro é o retorno da função "Email -  Mensagens em uma pasta".
2. Para obter sempre somente o email do remetente, utilize a função "Email - Email do remetente da mensagem".

Exemplo:
1. Assumindo como parâmetro a mensagem(id) "<27117501.441199967041995.JavaMail.SYSTEM@APOLO>", 
que tem como email do remetente "suportesoftwell@softwell.com.br" e nome "Suporte Softwell", o retorno será 
"Suporte Softwell" ou o próprio email "suportesoftwell@softwell.com.br".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetMessageFrom(Variant messageVar) throws Exception {
    // Verifica se a mensagem passada como parâmetro é um objeto Message
    Object messageObj = messageVar.getObject();
    if (!(messageObj instanceof jakarta.mail.Message)) {
      return Variant.VARIANT_NULL;      
    }
    
    // Obtém o remetente da mensagem
    jakarta.mail.Message message = (jakarta.mail.Message) messageObj;
    
    String from = jakarta.mail.internet.MimeUtility.decodeText(message.getFrom()[0].toString());

    //Retorna o rementente da mensagem
    return VariantPool.get(from);    
  }
```

---

## Email - Repositório de emails

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetStore` |
| **Código** | 1095 |
| **Assinatura** | `Email - Repositório de emails (Letras;Inteiro;Inteiro;Lógico;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Inteiro;Inteiro;Lógico;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o repositório de email para a manipulação de e-mails.

Parâmetro(s):
1. Servidor de e-mail. (Letras)
2. Porta do servidor de e-mail. (Inteiro)
3. Protocolo utilizado. (Inteiro)
4. SSL? (Lógico)
5. Usuário. (Letras)
6. Senha. (Letras)

Retorno:
Repositório de Emails. (Variante)

Observações:
1. Os valores aceitos para o protocolo utilizado são 1(IMAP) ou 2(POP3).
2. O repositório é aberto automaticamente, com necessidade apenas de ser fechado após o uso.

Exemplo:
Assumindo que os parâmetros sejam:
      1º Parâmetro:"imap.gmail.com"
      2º Parâmetro:"993"
      3º Parâmetro:1
      4º Parâmetro:Verdadeiro
      5º Parâmetro:"usuário"
      6º Parâmetro:"senha"
      Retorno: Repositório de emails (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetStore(Variant hostVar,Variant portVar, Variant protocolVar, Variant SSLAuthenticationVar, Variant userVar,Variant passwordVar) throws Exception {
  Boolean SSL = SSLAuthenticationVar.getBoolean();
  String host;
  if ( hostVar.isNull() || ( host = hostVar.getTrimString()) == "")
    return Variant.VARIANT_NULL;
  int protocol = protocolVar.getLong().intValue();
  String protocolName = "";
  if (protocol == 1){
    if (SSL)
      protocolName = "imaps";
    else
      protocolName = "imap";
  }else if (protocol == 2){
    if (SSL)
      protocolName = "pop3s";
    else
      protocolName = "pop3";
  }else{
    return Variant.VARIANT_NULL;
  }
  int port = portVar.getLong().intValue();
  if (port == 0){
    if (protocol == 1){
      if (SSL)
        port = 993;
      else
        port = 143;
    }else{
      if (SSL)
        port = 995;
      else
        port = 110;
    }
  }
  String user = userVar.getTrimString();
  String password = passwordVar.getTrimString();
  java.util.Properties props = System.getProperties();
  /**Get proxy settings*/
  if(System.getProperty("proxySet") != null && System.getProperty("proxySet").equalsIgnoreCase("true"))
    props = wfr.util.Functions.getProxySettings(props);
  //props.put("mail.debug","true");
  jakarta.mail.Session session = jakarta.mail.Session.getDefaultInstance(props, null);
  jakarta.mail.URLName urln = new jakarta.mail.URLName(protocolName,host, port, null, user, password);
  jakarta.mail.Store store = session.getStore(urln);
  store.connect();
  return VariantPool.get(store);
}
```

---

## Email - Verificar marcador da mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEmailGetFlag` |
| **Código** | 1086 |
| **Assinatura** | `Email - Verificar marcador da mensagem (Variante;Inteiro): Lógico` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Lógico |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna "Verdadeiro" se o valor do marcador (flag) da mensagem for igual ao passado no 2º parâmetro. 
Caso contrário, retorna "Falso".

Parâmetro(s):
1. Mensagem. (Variante) (Ver observação 1)
2. Marcador da mensagem. (Inteiro)

Retorno:
Valor do marcador da mensagem. (Lógico)

Observações:
1. O 1º Parâmetro é o retorno da função "Email -  Mensagens em uma pasta".
2. Para verificar se o valor do marcador da mensagem foi obtido com sucesso, é possível utilizar a função "É nulo".
3. Valores para os marcadores da mensagem:
          1 - Respondida
          2 - Deletada
          3 - Rascunho
          4 - Assinalar
          5 - Recente
          6 - Lida
          7 - Requerida

Exemplo:
Assumindo como 1º parâmetro a mensagem(id) 
"27117501.441199967041995.JavaMail.SYSTEM@APOLO>" que contém o marcador "Respondida" e como 2º 
parâmetro o inteiro "1", o retorno será o valor lógico "Verdadeiro".

### Código Servidor (Java)

```java
protected final Variant ebfEmailGetFlag(Variant messageVar, Variant flagTypeVar) throws Exception{
    Object messageObject = messageVar.getObject();
    if (!(messageObject instanceof jakarta.mail.Message)){
      return Variant.VARIANT_NULL;
    }
    jakarta.mail.Message message = (jakarta.mail.Message) messageObject;
    int flagType = flagTypeVar.getLong().intValue();
    jakarta.mail.Flags.Flag flag;
    switch (flagType) {
      case 1 -> flag = jakarta.mail.Flags.Flag.ANSWERED;
      case 2 -> flag = jakarta.mail.Flags.Flag.DELETED;
      case 3 -> flag = jakarta.mail.Flags.Flag.DRAFT;
      case 4 -> flag = jakarta.mail.Flags.Flag.FLAGGED;
      case 5 -> flag = jakarta.mail.Flags.Flag.RECENT;
      case 6 -> flag = jakarta.mail.Flags.Flag.SEEN;
      case 7 -> flag = jakarta.mail.Flags.Flag.USER;
      default -> flag = null; 
    };

    jakarta.mail.Flags flags = message.getFlags();
    return VariantPool.get(flags.contains(flag));
  }
```

---

## Gmail - Enviar Email

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendAuthenticatedGmail` |
| **Código** | 1004 |
| **Assinatura** | `Gmail - Enviar Email (Letras;Letras;Letras;Variante;Letras;Variante;Lógico;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Letras;Variante;Lógico;Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem instantaneamente para o(s) destinatário(s), utilizando o SMTP do GMAIL.
Essa função sempre enviará o e-mail utilizando o padrão SSL.

Parâmetro(s):
1. Usuário. (Letras)
2. Senha. (Letras)
3. Remetente. (Letras)
4. Destinatários. (Variante) (Ver Observação 1)
5. Assunto. (Letras)
6. Mensagem. (Variante)
7. HTML? (Lógico)
8. Lista de anexos. (Variante) (Ver Observação 2)

Retorno:
Não possui.

Observações:
1. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
2. Para passar apenas um anexo, é possível passar apenas o caminho do arquivo. Se for preciso passar 
vários anexos, é necessário passar uma lista de caminhos dos arquivos.
3. Caso o 7º parâmetro seja Verdadeiro, a mensagem será renderizada como HTML, obedecendo a todas as 
regras da linguagem.
3. O 3º parâmetro, além do email do remetente, também poderá ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
    Ex: Passando Nome e email: Carlos Santos <carlos@gmail.com>
         Passando apenas email: carlos@gmail.com

### Código Servidor (Java)

```java
protected final Variant ebfSendAuthenticatedGmail(
    Variant userVar,
    Variant passwordVar,
    Variant fromVar,
    Variant toVar,
    Variant subjectVar,
    Variant bodyVar,
    Variant html,
    Variant attachmentVar
) throws Exception {

  String username = userVar.getString();
  String password = passwordVar.getString();
  String from = fromVar.getString();
  Object to = toVar.getObject();
  String subject = subjectVar.getString();
  Object body = bodyVar.getObject();
  boolean isHTML = html.getBoolean();
  Object attachments = attachmentVar.getObject();

  WFRMailSenderOauth2 mailSenderOauth2 = new WFRMailSenderOauth2(getSystem());
  Properties properties = mailSenderOauth2.getGmailProperties();
  mailSenderOauth2.sendEmail(properties, username, password, from, to, subject, body, isHTML, attachments);

  return Variant.VARIANT_STRING_EMPTY;
}
```

---

## Hotmail - Enviar Email

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSendAuthenticatedHotmail` |
| **Código** | 1003 |
| **Assinatura** | `Hotmail - Enviar Email (Letras;Letras;Letras;Variante;Letras;Variante;Lógico;Variante)` |
| **Parâmetros** | Letras;Letras;Letras;Variante;Letras;Variante;Lógico;Variante |
| **Tipo** | 45 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Envia uma mensagem instantaneamente para o(s) destinatário(s), utilizando o SMTP do HOTMAIL.
Essa função sempre enviará o e-mail utilizando o padrão SSL.

Parâmetro(s):
1. Usuário. (Letras)
2. Senha. (Letras)
3. Remetente. (Letras)
4. Destinatários. (Variante) (Ver Observação 1)
5. Assunto. (Letras)
6. Mensagem. (Variante)
7. HTML? (Lógico)
8. Lista de anexos. (Variante) (Ver Observação 2)

Retorno:
Não possui.

Observações:
1. Os destinatários podem ser passados separados por "," e serão enviados como "TO". Se for necessário 
enviar email como "TO", "CC" e/ou "BCC", é necessário utilizar a função "Email - Criar lista de destinatários".
2. Para passar apenas um anexo, é possível passar apenas o caminho do arquivo. Se for preciso passar 
vários anexos, é necessário passar uma lista de caminhos dos arquivos.
3. Caso o 7º parâmetro seja Verdadeiro, a mensagem será renderizada como HTML, obedecendo a todas as 
regras da linguagem.
3. O 3º parâmetro, além do email do remetente, também poderá ser informado o nome do mesmo. Para isso 
deve ser informado o nome que será mostrado e em seguida o email. O email deve ser envolvido por <>.
   Ex.: Passando Nome e email: Carlos Santos <carlos@gmail.com>
         Passando apenas email: carlos@gmail.com

### Código Servidor (Java)

```java
protected final Variant ebfSendAuthenticatedHotmail(
    Variant userVar,
    Variant passwordVar,
    Variant fromVar,
    Variant toVar,
    Variant subjectVar,
    Variant bodyVar,
    Variant html,
    Variant attachmentVar
) throws Exception {

  String username = userVar.getString();
  String password = passwordVar.getString();
  String from = fromVar.getString();
  Object to = toVar.getObject();
  String subject = subjectVar.getString();
  Object body = bodyVar.getObject();
  boolean isHTML = html.getBoolean();
  Object attachments = attachmentVar.getObject();

  WFRMailSenderOauth2 mailSenderOauth2 = new WFRMailSenderOauth2(getSystem());
  Properties properties = mailSenderOauth2.getHotmailPropertiesOAuth();
  mailSenderOauth2.sendEmail(properties, username, password, from, to, subject, body, isHTML, attachments);

  return Variant.VARIANT_STRING_EMPTY;
}
```

---

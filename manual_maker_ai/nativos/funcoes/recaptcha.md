# Funções Nativas - ReCaptcha

Total: **5** funções

[← Voltar para Funções Nativas](README.md)

---

## ReCaptcha - Atualizar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReCaptchaRefresh` |
| **Código** | 649 |
| **Assinatura** | `ReCaptcha - Atualizar ()` |
| **Tipo** | 34 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função atualiza o captcha para um novo challenge (novas combinações de letras).

Parâmetro:
Não possui.

Retorno:
Não possui.

Observação:
O ReCaptcha é um serviço anti-spam gratuito e mantido pelo Google. Para obter informações, criação de chaves 
públicas e privadas, acesse: "http://www.google.com/recaptcha".

### Código Cliente (JavaScript)

```javascript
function ebfReCaptchaRefresh() {
  if ($mainform().Recaptcha) {
    $mainform().Recaptcha.reload();  
  }
}
```

---

## ReCaptcha - Criar Captcha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReCaptchaShow` |
| **Código** | 642 |
| **Assinatura** | `ReCaptcha - Criar Captcha (Letras;Fluxo)` |
| **Parâmetros** | Letras;Fluxo |
| **Tipo** | 34 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função cria uma instância do ReCaptcha (Ferramenta de verificação anti-spam).

Parâmetro(s):
1. Chave de Site do reCAPTCHA (Letras).
2. Função de callback que receberá o token do reCAPTCHA (Fluxo).

Retorno:
Não possui.

Observação:
O reCAPTCHA é um serviço anti-spam gratuito e mantido pelo Google. Para obter informações, criação de chaves 
públicas e privadas, acesse: "http://www.google.com/recaptcha".
Ao utilizar a função "ReCaptcha - Criar Captcha" , o desenvolvedor deverá passar um fluxo que receberá o token gerado pela Google para que o mesmo possa fazer a validação da reposta do usuário no servidor.

### Código Cliente (JavaScript)

```javascript
function ebfReCaptchaShow(siteKey, tokenFlow) {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "https://www.google.com/recaptcha/api.js?render=" + siteKey;
  script.onload = function() {
    grecaptcha.ready(function() {
      grecaptcha.execute(siteKey, { action: 'submit' })
        .then(function(token) {
          if (tokenFlow) {
            ebfFlowExecute(tokenFlow, [token]);
          }
        });
    });
  };
  document.head.appendChild(script);
}
```

---

## ReCaptcha - Obter Challenge

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReCaptchaGetChallenge` |
| **Código** | 643 |
| **Assinatura** | `ReCaptcha - Obter Challenge (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 34 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém o challenge do captcha aberto no formulário corrente.

Parâmetro:
Não possui.

Retorno:
Challenge. (Letras)

Observação:
O ReCaptcha é um serviço anti-spam gratuito e mantido pelo Google. Para obter informações, criação de chaves 
públicas e privadas, acesse: "http://www.google.com/recaptcha".

### Código Cliente (JavaScript)

```javascript
function ebfReCaptchaGetChallenge() {
  var challenge = $mainform().document.getElementById("recaptcha_challenge_field");  
  if (challenge) {
    return challenge.value;  
  }
}
```

---

## ReCaptcha - Obter Resposta do Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReCaptchaGetResponse` |
| **Código** | 644 |
| **Assinatura** | `ReCaptcha - Obter Resposta do Usuário (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 34 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função obtém a resposta do captcha aberto no formulário corrente e digitado pelo usuário.

Parâmetro:
Não possui.

Retorno:
Resposta do usuário. (Letras)

Observação:
O ReCaptcha é um serviço anti-spam gratuito e mantido pelo Google. Para obter informações, criação de chaves 
públicas e privadas, acesse: "http://www.google.com/recaptcha".

### Código Cliente (JavaScript)

```javascript
function ebfReCaptchaGetResponse() {
  var response = $mainform().document.getElementById("recaptcha_response_field");  
  if (response) {
    return response.value;  
  }
}
```

---

## ReCaptcha - Validar Resposta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReCaptchaCheckAnswer` |
| **Código** | 648 |
| **Assinatura** | `ReCaptcha - Validar Resposta (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 34 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função verifica se a resposta enviada pelo usuário está correta ou não (Validação do reCAPTCHA).

Parâmetro(s):
1. Chave Secreta. (Letras)
2. Token. (Letras)

Retorno:
Objeto Json contendo as seguintes chaves: {
  "success": true|false,
  "challenge_ts": timestamp, 
  "hostname": string,     
  "score": string
 }

Observação:
O reCAPTCHA é um serviço anti-spam gratuito e mantido pelo Google. Para obter informações, criação de chaves 
públicas e privadas, acesse: "http://www.google.com/recaptcha".

### Código Servidor (Java)

```java
protected final Variant ebfReCaptchaCheckAnswer(Variant secretKey, Variant responseToken) throws Exception {
  String url = "https://www.google.com/recaptcha/api/siteverify";
  String params = "secret=" + secretKey + "&response=" + responseToken;
  byte[] postData = params.getBytes(java.nio.charset.StandardCharsets.UTF_8);

  java.net.HttpURLConnection conn = null;
  try {
    conn = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
    conn.setDoOutput(true);
    conn.setRequestMethod("POST");
    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
    conn.setRequestProperty("charset", "utf-8");
    conn.setRequestProperty("Content-Length", Integer.toString(postData.length));
    conn.setUseCaches(false);

    try (java.io.OutputStream os = conn.getOutputStream()) {
      os.write(postData);
    }

    int responseCode = conn.getResponseCode();
    if (responseCode == java.net.HttpURLConnection.HTTP_OK) {
      try (jakarta.json.JsonReader jsonReader = jakarta.json.Json.createReader(conn.getInputStream())) {
        jakarta.json.JsonObject response = jsonReader.readObject();
        return VariantPool.get(response);
      }
    } else {
      return Variant.VARIANT_NULL; // ou lançar uma exceção com detalhes do erroaile
    }
  } finally {
    if (conn != null)
      conn.disconnect();
  }
}
```

---

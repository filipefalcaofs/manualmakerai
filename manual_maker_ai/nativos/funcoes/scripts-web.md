# Funções Nativas - Scripts Web

Total: **4** funções

[← Voltar para Funções Nativas](README.md)

---

## Resposta Web: Atribuir Valor ao Cabeçalho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetHeader` |
| **Código** | 440 |
| **Assinatura** | `Atribuir valor ao cabeçalho(Variante, Variante)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 30 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Atribui um valor de retorno ao cabeçalho de resposta.

Parâmetro(s):
1 . Nome da tag que deseja utilizar. (Letras)
2 . Valor a ser atribuído a tag do parâmetro 1, que será retornado no cabeçalho de resposta. (Letras)

Retorno:
Não possui.

Observação:
Pode ser usado em qualquer cabeçalho de resposta.

Exemplos:
1. Content-Disposition
2. attachment; filename = "teste.frz"

### Código Servidor (Java)

```java
protected final Variant ebfSetHeader(Variant key, Variant value) throws Exception {
    response.setHeader(key.getString(), value.getString());
    return VariantPool.get(Variant.VARIANT_NULL);
  }
```

---

## Resposta Web: Definir Status

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetStatusCode` |
| **Código** | 444 |
| **Assinatura** | `Resposta Web: Definir Status(Inteiro)` |
| **Parâmetros** | Inteiro |
| **Tipo** | 30 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Define o status da resposta.

Parâmetro:
1. Código do status. (Inteiro)

Retorno:
Não possui.

Observação:
Alguns códigos de status comuns:
200 - O servidor retornou a página com sucesso.
404 - A página solicitada não existe.
503 - O servidor está temporariamente indisponível.

Exemplo:
301 (redirecionamento de URL).

### Código Servidor (Java)

```java
protected final Variant ebfSetStatusCode(Variant code) throws Exception {
    response.setStatus(code.getLong().intValue());
    return VariantPool.get(Variant.VARIANT_NULL);
  }
```

---

## Resposta Web: Escrever

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWriteResponseStream` |
| **Código** | 1074 |
| **Assinatura** | `Resposta Web: Escrever (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Letras |
| **Tipo** | 30 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função escreve a resposta para um requisição a um fluxo WEB.

Parâmetros:
1. Stream da resposta
2. Conteúdo da resposta
3. Charset (Opcional)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfWriteResponseStream(Variant outStream, Variant content, Variant charset) throws Exception {
  if(outStream.getObject() != null) {
    OutputStream out = (OutputStream) outStream.getObject();
    String charSet = charset.getString().isEmpty() ? Settings.CHARSET : charset.getString();
    out.write(content.getString().getBytes(charSet.toUpperCase()));
    out.flush();
  }
}
```

---

## Resposta Web: Obter Stream para Resposta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetResponseStream` |
| **Código** | 1073 |
| **Assinatura** | `Resposta Web: Obter Stream para Resposta (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 30 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtém a saída em stream para um resposta WEB.

Parâmetro:
Não possui.

Retorno:
Stream para a resposta.

### Código Servidor (Java)

```java
protected final Variant ebfGetResponseStream() throws Exception {
  if(response != null) {
    return new Variant(response.getOutputStream());
  }

  return Variant.VARIANT_NULL;
}
```

---

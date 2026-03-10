# Funções Nativas - AWS

Total: **12** funções

[← Voltar para Funções Nativas](README.md)

---

## AWS - Copiar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3CopyFile` |
| **Código** | 1135 |
| **Assinatura** | `AWS - Copiar Arquivo (Variante;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Copia um arquivo especificado para outra pasta no bucket.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket a ser copiado (Letras).
3. Diretório do arquivo a ser copiada (Letras).
4. Nome do bucket de destino (Letras).
5. Diretório de destino (Letras).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = detalhes da exceção
4. O tempo de execução depende diretamente da velocidade da taxa de upload da conexão com a internet.

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3CopyFile(Variant s3Client, Variant sourceBucketName,
    Variant sourceBucketObject, Variant destinationBucketName, Variant destinationBucketPath) throws Exception {

  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.copyFile(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), sourceBucketName.getString(),
        sourceBucketObject.getString(), destinationBucketName.getString(), destinationBucketPath.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Copiar Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3CopyFolder` |
| **Código** | 1134 |
| **Assinatura** | `AWS - Copiar Pasta (Variante;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Copia uma pasta especificada para outra pasta no bucket.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket a ser copiado (Letras).
3. Nome da pasta a ser copiada (Letras).
4. Nome do bucket de destino (Letras).
5. Nome da pasta de Destino (Letras).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = detalhes da exceção
4. O tempo de execução depende diretamente da velocidade da taxa de upload da conexão com a internet.

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3CopyFolder(Variant s3Client, Variant sourceBucketName,
    Variant sourceFolderPrefix, Variant destinationBucketName, Variant destinationFolderPrefix) throws Exception {

  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.copyFolder(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), sourceBucketName.getString(),
        sourceFolderPrefix.getString(), destinationBucketName.getString(), destinationFolderPrefix.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Criar Bucket

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3CreateBucket` |
| **Código** | 1133 |
| **Assinatura** | `AWS - Criar Bucket (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um novo bucket.

Parâmetro(s):
1. Conexão (Variante).
2. Nome para o bucket (Letras).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = created/conflict/error
  3.2 statusCode = 201/409/500
  3.3 data = detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3CreateBucket(Variant s3Client, Variant bucketName) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.createBucket(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Criar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3Conection` |
| **Código** | 1041 |
| **Assinatura** | `AWS - Criar Conexão (Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria uma nova conexão com a Amazon S3 Client.

Parâmetro(s):
1. Chave de Acesso. (Letras)
2. Chave Secreta. (Letras)
3. Região. (Letras)

Retorno:
Referência para a conexão Amazon S3 Client (Variante).

Exemplo:
Assumindo como parâmetros:

1) SECWSDHQRUKJWRJNOVUB
2) sS0cwe6azT$C7Te8Z4cccMGVYZ$LHlQKEbYNO3r8
3) sa-east-1

O retorno será a referência para a conexão com a Amazon S3 Client.

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3Conection(Variant accesskey, Variant secretKey, Variant region)  throws Exception {
  return VariantPool.get(wfr.util.WFRAWS.createConnection(
      accesskey.getString(), secretKey.getString(), region.getString()));
}
```

---

## AWS - Criar Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3CreateFolder` |
| **Código** | 1132 |
| **Assinatura** | `AWS - Criar Pasta (Variante;Letras;Letras): Lógico` |
| **Parâmetros** | Variante;Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria uma nova pasta no bucket.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket (Letras).
3. Diretório (Letras).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = created/not found/conflict/error
  3.2 statusCode = 201/404/409/500
  3.3 data = detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3CreateFolder(Variant s3Client, Variant bucketName, Variant folderName) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.createFolder(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString(), folderName.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Deletar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3Delete` |
| **Código** | 1131 |
| **Assinatura** | `AWS - Deletar (Variante;Letras;Letras;Lógico): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Deleta um arquivo ou uma pasta no bucket.

Parâmetro(s):
1. Conexão AWS S3 (Variante).
2. Nome do bucket (Letras).
3. Diretório no bucket (Letras).
4. É pasta? (Lógico)

Retorno:
Objeto JSON com as informações da execução (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3Delete(Variant s3Client, Variant bucketName, Variant bucketPath, Variant isFolder) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.delete(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString(),
        bucketPath.getString(), isFolder.getBoolean()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Deletar Bucket

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3DeleteBucket` |
| **Código** | 1130 |
| **Assinatura** | `AWS - Deletar Bucket (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Deleta um bucket e todo seu conteúdo.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket (Letras).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3DeleteBucket(Variant s3Client, Variant bucketName) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.deleteBucket(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Download

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3Download` |
| **Código** | 1129 |
| **Assinatura** | `AWS - Download (Variante;Letras;Letras;Lógico;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Lógico;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Realiza o download de um arquivo ou de um diretório do bucket para um diretório local.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket (Letras).
3. Diretório no bucket (Letras).
4. É arquivo? (Lógico).
5. Diretório local. (Letras)

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = detalhes da exceção
4. O tempo de execução depende diretamente da velocidade da taxa de download da conexão com a internet.

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3Download(Variant s3Client, Variant bucketName,
    Variant bucketPath, Variant isFolder, Variant folderPath) throws Exception {

  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.download(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString(),
        bucketPath.getString(), isFolder.getBoolean(), folderPath.getString(), getSystem()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Existe o Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3FileExists` |
| **Código** | 1127 |
| **Assinatura** | `AWS - Existe o Arquivo (Variante;Letras;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Valida se o arquivo existe dentro do bucket especificado.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do Bucket (Letras).
3. Chave (Letras).

Retorno:
Objeto JSON contendo as informações da execução (Variante)(Ver observação 4).

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. O terceiro parâmetro é representado pelo diretório do arquivo dentro do bucket ex.: Maker5/Docs/Webrun5.pdf, onde Webrun5.pdf representa a chave.
3. Caso a conexão não exista retorna um objeto JSON vazio.
4. O objeto JSON retornado conterá as seguintes chaves:
  4.1 status = success/error
  4.2 statusCode = 200/500
  4.3 data = valor lógico/detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3FileExists(Variant s3Client, Variant bucketName, Variant bucketPath) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.fileExists(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString(), bucketPath.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Listar Conteúdo de uma Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3ListAllContents` |
| **Código** | 1128 |
| **Assinatura** | `AWS - Listar Conteúdo de uma Pasta (Variante;Letras;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Lista o conteúdo de uma pasta no bucket.

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket (Letras).
3. Diretório no bucket (Letras).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = lista/detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3ListAllContents(Variant s3Client, Variant bucketName, Variant bucketPath) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.getAllKeysInFolder(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString(), bucketPath.getString()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Obter Lista de Buckets

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3GetBucketList` |
| **Código** | 1126 |
| **Assinatura** | `AWS - Obter Lista de Buckets (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém os nomes dos buckets de uma conexão Amazon S3 Client.

Parâmetro(s):
1. Conexão. (Variante)

Retorno:
Objeto JSON com a informações da execução da operação (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/error
  3.2 statusCode = 200/500
  3.3 data = lista/detalhes da exceção

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3GetBucketList(Variant s3Client) throws Exception {
  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.getBucketList((software.amazon.awssdk.services.s3.S3Client) s3Client.getObject()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

## AWS - Upload

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAWSS3Upload` |
| **Código** | 1125 |
| **Assinatura** | `AWS - Upload (Variante;Letras;Letras;Letras;Lógico): Variante` |
| **Parâmetros** | Variante;Letras;Letras;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 46 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Realiza o upload de um arquivo ou um diretório local para uma pasta no bucket

Parâmetro(s):
1. Conexão (Variante).
2. Nome do bucket (Letras).
3. Diretório no bucket (Letras).
4. Diretório local para upload (Letras).
5. Incluir subdiretórios? (Lógico).

Retorno:
Objeto JSON com as informações da execução. (Variante)(Ver observação 3)

Observações:
1. O primeiro parâmetro é o retorno da função AWS - Criar Conexão.
2. Caso a conexão não exista retorna um objeto JSON vazio.
3. O objeto JSON retornado conterá as seguintes chaves:
  3.1 status = success/not found/error
  3.2 statusCode = 200/404/500
  3.3 data = detalhes da exceção
4. O tempo de execução depende diretamente da velocidade da taxa de upload da conexão com a internet.

### Código Servidor (Java)

```java
protected final Variant ebfAWSS3Upload(Variant s3Client, Variant bucketName, 
    Variant bucketPath, Variant folderPath, Variant subdirectories) throws Exception {

  if(!s3Client.isNull())
    return VariantPool.get(wfr.util.WFRAWS.upload(
        (software.amazon.awssdk.services.s3.S3Client) s3Client.getObject(), bucketName.getString(),
        bucketPath.getString(), folderPath.getString(), subdirectories.getBoolean(), getSystem()));

  return VariantPool.get(wfr.util.WFRJson.createJsonObject(null));
}
```

---

# Funções Nativas - FTP

Total: **14** funções

[← Voltar para Funções Nativas](README.md)

---

## FTP - Abrir conexão FTP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPConnect` |
| **Código** | 253 |
| **Assinatura** | `FTP - Abrir conexão FTP (Letras;Inteiro;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Inteiro;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre uma conexão com um servidor via FTP.

Parâmetro(s):
1. Host. (Letras)
2. Porta. (Inteiro)
3. Usuário. (Letras)
4. Senha. (Letras)

Retorno: 
Referência da Conexão FTP. (Variante) 

Exemplo:
Assumindo os parâmetros como:
 1º parâmetro: ftp.google.com, ftp.xpg.com.br (seu servidor ftp)
 2º parâmetro: 21
 3º parâmetro: login
 4º parâmetro: password

### Código Servidor (Java)

```java
protected final Variant ebfFTPConnect(Variant host, Variant port, Variant user, Variant password) throws Exception {
  org.apache.commons.net.ftp.FTPClient ftp = null;
  /*Get Proxy Settings*/
  if (System.getProperty("proxySet") != null && System.getProperty("proxySet").equalsIgnoreCase("true")) {
    String proxyHost = System.getProperty("http.proxyHost");
    int proxyPort = Integer.parseInt(System.getProperty("http.proxyPort"));
    String proxyUser = System.getProperty("http.proxyUser");
    if (proxyUser != null && proxyUser.length() > 0) {
      String proxyPassword = System.getProperty("http.proxyPassword");
      ftp = new org.apache.commons.net.ftp.FTPHTTPClient(proxyHost, proxyPort, proxyUser, proxyPassword);
    } else {
      ftp = new org.apache.commons.net.ftp.FTPHTTPClient(proxyHost, proxyPort);
    }
  } else {
    ftp = new org.apache.commons.net.ftp.FTPClient();
  }
  if (port.getLong().intValue() == 0) ftp.connect(host.getTrimString());
  else ftp.connect(host.getTrimString(), port.getLong().intValue());
  if(!org.apache.commons.net.ftp.FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
    ftp.disconnect();
    throw new Exception("FTP server refused connection.");
  }
  if (!ftp.login(user.getTrimString(), password.getTrimString())) {
    ftp.disconnect();
    throw new Exception("Username and/or password are wrong.");
  }
  return VariantPool.get(ftp);
}
```

---

## FTP - Adicionar arquivo ao servidor FTP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPPut` |
| **Código** | 255 |
| **Assinatura** | `Adicionar arquivo ao servidor FTP(Variante;Letras;Letras;Lógico)` |
| **Parâmetros** | Variante;Letras;Letras;Lógico |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Adiciona um arquivo ao servidor FTP.

Parâmetro(s):
1. Conexão FTP. (Variante)
2. Arquivo de origem. (Letras)
3. Destino no servidor. (Letras)
4. Transferência binária? (Lógico)

Retorno:
Não possui.

Exemplo:
Assumindo os parâmetros como:
 1º parâmetro: conexao FTP ( retorno da função "Abrir conexão FTP" )
 2º parâmetro: c:/tpArquivoOrigem.txt
 3º parâmetro: /pastadestino/ArquivoDestino.txt
 4º parâmetro: Verdadeiro (Valor Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfFTPPut(Variant ftpClient, Variant local, Variant remote, Variant binary) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    if (binary.getBoolean()) {
      ftp.setFileType(ftp.BINARY_FILE_TYPE);
    } else {
      ftp.setFileType(ftp.ASCII_FILE_TYPE);
    }
    java.io.InputStream in = new java.io.FileInputStream(local.getTrimString());
    ftp.storeFile(remote.getTrimString(), in);
    in.close();
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Cria um diretório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPNewFolder` |
| **Código** | 299 |
| **Assinatura** | `FTP - Cria um diretório` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um diretório no servidor FTP.

Parâmetro(s):
1. Objeto FTP que represente uma conexão FTP aberta. (Variante)
2. Nome do diretório que será criado. (Letras)

Retorno:
Não possui.

Observação:
Antes do uso desta função é necessário ter a conexão ftp aberta.

### Código Servidor (Java)

```java
protected final Variant ebfFTPNewFolder(Variant ftpClient, Variant folder) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.makeDirectory(folder.getTrimString());
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Deleta um arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPDeleteFile` |
| **Código** | 298 |
| **Assinatura** | `FTP - Deleta um arquivo` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Deleta o arquivo informado.

Parâmetro(s):
1. Objeto FTP que represente uma conexão FTP aberta. (Variante) 
2. Nome do arquivo que será excluído. (Letras)

Retorno:
Não possui.

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFTPDeleteFile(Variant ftpClient, Variant file) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.deleteFile(file.getTrimString());
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Deleta um diretório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPDeleteFolder` |
| **Código** | 297 |
| **Assinatura** | `FTP - Deleta um diretório` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Deleta um diretório informado.

Parâmetro(s):
1. Objeto FTP que represente uma conexão FTP aberta. (Variante)
2. Nome do diretório que será excluído. (Letras)

Retorno:
Não possui.

Observação:
Para deletar um diretório é necessário que exclua antes seus arquivos e subdiretórios.

### Código Servidor (Java)

```java
protected final Variant ebfFTPDeleteFolder(Variant ftpClient, Variant folder) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.removeDirectory(folder.getTrimString());
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Executar comando FTP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPSendServer` |
| **Código** | 303 |
| **Assinatura** | `FTP - Executar comando FTP (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa um Comando FTP passado como parâmetro.

Parâmetro(s):
1. Objeto FTP que represente uma conexão FTP aberta. (Variante)
2. Comando a ser executado. (Letras) (Ver observação 1)

Retorno:
Não possui.

Observação:
Deve ser visto a lista de comandos reconhecidos para mais informações:
http://iisbrasil.wordpress.com/2011/04/07/comandos-utilizado-no-ftp/
http://pt.kioskea.net/contents/internet/ftp.php3

### Código Servidor (Java)

```java
protected final Variant ebfFTPSendServer(Variant ftpClient, Variant command) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.sendCommand(command.getTrimString());
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Fechar conexão FTP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPClose` |
| **Código** | 254 |
| **Assinatura** | `Fechar conexão FTP(Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha a conexão FTP.

Parâmetro(s):
1. Conexão FTP. (Variante)

Retorno:
Não possui.

Exemplo:
1º parâmetro: conexao FTP, retorno da função "Abrir conexão FTP".

### Código Servidor (Java)

```java
protected final Variant ebfFTPClose(Variant ftpClient) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.logout();
    ftp.disconnect();
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Listar conteúdo de uma pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPListFile` |
| **Código** | 293 |
| **Assinatura** | `FTP - Listar conteúdo de uma pasta` |
| **Parâmetros** | Variante;Lógico |
| **Retorno** | Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função vai listar o conteúdo de uma pasta. Caso o valor informado no segundo  parâmetro tenha um valor lógico verdadeiro, será listado arquivos, pastas e outras informações dos mesmo, se o valor for falso será exibido apenas uma lista contendo os arquivos e pastas do diretório.

Parâmetros:
1. Objeto FTP que represente uma conexão FTP aberta. (Variante)
2. Valor lógico. (Ver observação 1)

Retorno: 
Lista contendo arquivos e pastas dentro do diretório informado. (Letras)

Observação:
O valor passado no 2º Parâmetro será o responsável pelo tipo de retorno dessa função, se verdade, o retorno será mais  detalhado, caso contrário, só será listado as pastas e arquivos contidas nesse diretório.

### Código Servidor (Java)

```java
protected final Variant ebfFTPListFile(Variant ftpClient, Variant description) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    StringBuilder out = new StringBuilder();
    Object[] objects;
    if (description.getBoolean()) {
      objects = ftp.listFiles();
    } else {
      objects = ftp.listNames();
    }
    for (Object object: objects) {
      out.append(object).append("\n");
    }
    return VariantPool.get(out.toString());
  }
```

---

## FTP - Listar o conteúdo de uma pasta informada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPListFileFromFolder` |
| **Código** | 294 |
| **Assinatura** | `FTP - Listar o conteúdo de uma pasta informada` |
| **Parâmetros** | Variante;Letras;Lógico |
| **Retorno** | Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função vai listar o conteúdo de uma pasta que será passada como parâmetro. Caso o valor informado no terceiro
parâmetro tenha um valor lógico verdadeiro, será listado arquivos, pastas e outras informações dos mesmo,
se o valor for falso será exibido apenas uma lista contendo os arquivos e pastas do diretório.

Parâmetro(s):
1. Objeto FTP que represente uma conexão FTP aberta. (Variante) 
2. Pasta que terá o seu conteúdo retornado. (Letras)
3. Valor Lógico. (Ver observação 1)

Retorno:
Lista contendo arquivos e pastas dentro do diretório informado (Letras)

Observação:
O valor passado no 3º Parâmetro será o responsável pelo tipo de retorno dessa função,
se verdade, o retorno será mais detalhado, caso contrário, só será listado as pastas e arquivos contidas nesse
diretório.

### Código Servidor (Java)

```java
protected final Variant ebfFTPListFileFromFolder(Variant ftpClient, Variant folder, Variant description) throws Exception {
    StringBuilder out = new StringBuilder();

    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient) ftpClient.getObject();
    String currentDir = ftp.printWorkingDirectory();

    ftp.changeWorkingDirectory(folder.getTrimString());

    Object[] objects;
    if (description.getBoolean()) {
      objects = ftp.listFiles();
    } else {
      objects = ftp.listNames();
    }

    ftp.changeWorkingDirectory(currentDir);

    for (Object object : objects) {
      out.append(object).append("\n");
    }

    return VariantPool.get(out.toString());
  }
```

---

## FTP - Modo Passivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPPassiveMode` |
| **Código** | 305 |
| **Assinatura** | `FTP - Modo Passivo` |
| **Parâmetros** | Variante |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Entra no modo passivo no ftp.

Parâmetro:
1. Objeto FTP que represente uma conexão FTP aberta. (Variante)

Retorno:
Não possui.

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFTPPassiveMode(Variant ftpClient) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.enterRemotePassiveMode();
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Mostra diretório de trabalho remoto corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPGetFolder` |
| **Código** | 292 |
| **Assinatura** | `FTP - Mostra diretório de trabalho remoto corrente` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Mostra qual é o diretório de trabalho remoto corrente.

Parâmetro:
1. Objeto FTP que represente uma conexão FTP aberta. (Variante) 

Retorno:
Nome do diretório. (Letras)

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFTPGetFolder(Variant ftpClient) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    return VariantPool.get(ftp.printWorkingDirectory());
  }
```

---

## FTP - Nivel Acima

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPFolderUp` |
| **Código** | 296 |
| **Assinatura** | `FTP - Nivel Acima` |
| **Parâmetros** | Variante |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Muda o diretório de trabalho para o diretório "pai" (superior) do diretório atual.

Parâmetro:
1. Objeto FTP que represente uma conexão FTP aberta. (Variante) 

Retorno:
Não possui.

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfFTPFolderUp(Variant ftpClient) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.changeToParentDirectory();
    return Variant.VARIANT_NULL;
  }
```

---

## FTP - Obter arquivo do servidor FTP

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPGet` |
| **Código** | 256 |
| **Assinatura** | `Obter arquivo do servidor FTP(Variante;Letras;Letras;Lógico)` |
| **Parâmetros** | Variante;Letras;Letras;Lógico |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o arquivo do servidor FTP.

Parâmetro(s):
1. Conexão. (Variante)
2. Arquivo de origem. (Letras)
3. Destino do arquivo. (Letras)
4. Transferência binária? (Lógico)

Retorno:
Não possui.

Exemplo:
Assumindo os parâmetros como: 
 1º parâmetro: conexao FTP ( retorno da função "Abrir conexão FTP" )
 2º parâmetro: (arquivo que se encontra no servidor, na qual deseja obte-lo.)/pastaorigem/ArquivoOrigem.txt
 3º parâmetro: (local do arquivo que deseja salvar o arquivo na maquina local)c:/tpArquivoDestino.txt
 4º parâmetro: Verdadeiro (Valor Lógico) (Transferência em binário ou não.)

### Código Servidor (Java)

```java
protected final Variant ebfFTPGet(Variant ftpClient, Variant remote, Variant local, Variant binary) throws Exception {
  org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
  if (binary.getBoolean()) {
    ftp.setFileType(ftp.BINARY_FILE_TYPE);
  } else {
    ftp.setFileType(ftp.ASCII_FILE_TYPE);
  }
  
  java.io.OutputStream out = new java.io.FileOutputStream(local.getTrimString());
  if(ftp.retrieveFile(remote.getTrimString(), out)) {
    out.close();
    return Variant.VARIANT_NULL;
  } else {
    out.close(); 
    java.io.File f = new java.io.File(local.getTrimString());
    f.delete(); 
    throw new Exception("Download error");
  }
}
```

---

## FTP - Trocar a pasta atual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFTPAlterFolder` |
| **Código** | 295 |
| **Assinatura** | `FTP - Trocar a pasta atual` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 23 |
| **Compatibilidade** | Banco de Dados |

### Descrição

O diretório de trabalho remoto inicialmente será o diretório home do usuário.
Para mudá-lo basta usar essa função, passando o nome do novo diretório como argumento.

Parâmetro(s):
1. Objeto FTP que represente uma conexão FTP aberta. (Variante) 
2. Novo diretório de trabalho. (Letras)

Retorno:
Não possui.

Observação:
Só é possível mudar o diretório a partir da home do usuário, não sendo possível, 
trocar a pasta a partir de um diretório diferente da home.

### Código Servidor (Java)

```java
protected final Variant ebfFTPAlterFolder(Variant ftpClient, Variant folder) throws Exception {
    org.apache.commons.net.ftp.FTPClient ftp = (org.apache.commons.net.ftp.FTPClient)ftpClient.getObject();
    ftp.changeWorkingDirectory(folder.getTrimString());
    return Variant.VARIANT_NULL;
  }
```

---

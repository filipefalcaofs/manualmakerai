# Funções Nativas - SFTP

Total: **15** funções

[← Voltar para Funções Nativas](README.md)

---

## SFTP - Abrir Canal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPConnectChannel` |
| **Código** | 791 |
| **Assinatura** | `SFTP - Abrir Canal (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre um canal de comunicação com o servidor.

Parâmetro:
1. Referência da Conexão SFTP. (Variante)

Retorno:
Referencia do Canal. (Variante)

Observação:
Para obter a referência da conexão utilizar a função "SFTP - Abrir Conexão".

### Código Servidor (Java)

```java
protected final Variant ebfSFTPConnectChannel(Variant sftp) throws Exception {
  com.jcraft.jsch.Session session = (com.jcraft.jsch.Session)sftp.getObject();
  com.jcraft.jsch.Channel channel = session.openChannel("sftp");
  channel.connect();
  com.jcraft.jsch.ChannelSftp sftpChannel = (com.jcraft.jsch.ChannelSftp) channel;
  return VariantPool.get(sftpChannel);
}
```

---

## SFTP - Abrir Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPConnect` |
| **Código** | 789 |
| **Assinatura** | `SFTP - Abrir Conexão (Letras;Inteiro;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Inteiro;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre uma conexão com um servidor via SFTP.

Parâmetro(s):
1. Host. (Letras)
2. Porta. (Inteiro)
3. Usuário. (Letras)
4. Senha. (Letras)

Retorno:
Referência da Conexão SFTP. (Variante)

Exemplo:
1º parâmetro: sftp.google.com, ftp.xpg.com.br (seu servidor Sftp)
2º parâmetro: 22
3º parâmetro: login
4º parâmetro: password

### Código Servidor (Java)

```java
protected final Variant ebfSFTPConnect (Variant host, Variant port, Variant user, Variant password) throws Exception {
  com.jcraft.jsch.JSch jsch = new com.jcraft.jsch.JSch();
  com.jcraft.jsch.Session session = null;

  if (port.getLong().intValue() == 0)
    session = jsch.getSession(user.getTrimString(), host.getTrimString());
  else
    session = jsch.getSession(user.getTrimString(), host.getTrimString(), port.getLong().intValue());

  session.setConfig("StrictHostKeyChecking", "no");
  session.setPassword(password.getTrimString());

  /**Get Proxy Settings*/
  if (System.getProperty("proxySet") != null && System.getProperty("proxySet").equalsIgnoreCase("true")) {
    String proxyHost = System.getProperty("http.proxyHost");
    int proxyPort = Integer.parseInt(System.getProperty("http.proxyPort"));
    com.jcraft.jsch.ProxyHTTP proxy = new com.jcraft.jsch.ProxyHTTP(proxyHost, proxyPort);
    String proxyUser = System.getProperty("http.proxyUser");
    if (!proxyUser.equals("") && proxyUser.length() > 0) {
      String proxyPassword = System.getProperty("http.proxyPassword");
      proxy.setUserPasswd(proxyUser, proxyPassword);
    }
    session.setProxy(proxy);
  }
  session.connect();
  return VariantPool.get(session);
}
```

---

## SFTP - Adicionar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPPut` |
| **Código** | 790 |
| **Assinatura** | `SFTP - Adicionar Arquivo (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Adiciona um arquivo ao servidor SFTP.

Parâmetro(s):
1. Canal SFTP. (Variante)
2. Arquivo de origem. (Letras)
3. Destino no servidor. (Letras)

Retorno:
Não possui.

Exemplo:
1º parâmetro: canal SFTP ( retorno da função "Conectar Canal SFTP")
2º parâmetro: c:/tpArquivoOrigem.txt
3º parâmetro: /pastadestino/ArquivoDestino.txt

### Código Servidor (Java)

```java
protected final Variant ebfSFTPPut (Variant sftpChannel, Variant local, Variant remote) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.put(local.getString().trim(), remote.getString().trim());
  return Variant.VARIANT_NULL;
}
```

---

## SFTP - Criar um Diretório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPNewFolder` |
| **Código** | 792 |
| **Assinatura** | `SFTP - Criar um Diretório (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um diretório no servidor SFTP.

Parâmetro(s):
1. Um objeto SFTP que represente um canal de conexão SFTP aberto. (Variante) 
2. Diretório que será criado. (Letras)

Retorno:
Não possui.

Observação:
Antes do uso desta função é necessário ter a conexão SFTP aberta.

### Código Servidor (Java)

```java
protected final Variant ebfSFTPNewFolder(Variant sftpChannel, Variant folder) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.mkdir(folder.getTrimString());
  return Variant.VARIANT_NULL; 
}
```

---

## SFTP - Deletar um Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPDeleteFile` |
| **Código** | 793 |
| **Assinatura** | `SFTP - Deletar um Arquivo (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Deleta o arquivo informado.

Parâmetro(s):
1. Referência do Canal. (Variante)
2. Nome do arquivo. (Letras)

Retorno:
Não possui.

Observação:
O 1º Parâmetro é o retorno da função "SFTP - Abrir Canal".

### Código Servidor (Java)

```java
protected final Variant ebfSFTPDeleteFile(Variant sftpChannel, Variant file) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.rm(file.getTrimString());
  return Variant.VARIANT_NULL;
}
```

---

## SFTP - Deletar um Diretório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPDeleteFolder` |
| **Código** | 794 |
| **Assinatura** | `SFTP - Deletar um Diretório (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Deleta um diretório informado.

Parâmetro(s):
1. Referência do Canal. (Variante)
2. Diretório. (Letras)

Retorno:
Não possui.

Observações:
1. A referência do canal é o retorno da função "SFTP - Abrir Canal".
2. Para deletar um diretório é necessário que exclua antes seus arquivos e subdiretórios.

### Código Servidor (Java)

```java
protected final Variant ebfSFTPDeleteFolder(Variant sftpChannel, Variant folder) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.rmdir(folder.getTrimString());
  return Variant.VARIANT_NULL; 
}
```

---

## SFTP - Executar Comando

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPExecCommand` |
| **Código** | 965 |
| **Assinatura** | `SFTP - Executar Comando (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa um Comando SFTP passado como parâmetro.

Parâmetro(s):
1. Conexão SFTP. (Variante)
2. Comando a ser executado. (Letras)

Retorno:
Retorno da linha de comando executada, caso exista. (Letras)

Observação:
Para obter a referência da conexão SFTP utilizar a função SFTP - Abrir Conexão.

### Código Servidor (Java)

```java
protected final Variant ebfSFTPExecCommand(Variant sftpSession, Variant command) throws Exception {
    StringBuilder outputBuffer = new StringBuilder();
    com.jcraft.jsch.Channel channel = ((com.jcraft.jsch.Session) sftpSession.getObject()).openChannel("exec");
    ((com.jcraft.jsch.ChannelExec) channel).setCommand(command.getString());
    java.io.InputStream commandOutput = channel.getInputStream();
    channel.connect();
    int readByte = commandOutput.read();

    while(readByte != 0xffffffff) {
      outputBuffer.append((char)readByte);
      readByte = commandOutput.read();
    }
    channel.disconnect();
    return VariantPool.get(outputBuffer.toString());
  }
```

---

## SFTP - Existe o Arquivo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPFileExists` |
| **Código** | 964 |
| **Assinatura** | `SFTP - Existe o Arquivo? (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função verifica se o arquivo existe no servidor SFTP.

Parâmetro(s):
1. Canal SFTP. (Variante)
2. Caminho do arquivo no servidor. (Letras)

Retorno:
Caso o arquivo exista retorna "verdadeiro", se não existir retorna "falso". (Lógico)

Observação:
A referência para o canal pode ser obtido por meio da função SFTP - Abrir Canal.

### Código Servidor (Java)

```java
protected final Variant ebfSFTPFileExists (Variant sftpChannel, Variant file) throws Exception {
    com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp) sftpChannel.getObject();
    if (file.getString().length() > 0) {
      try {        
        channel.stat(file.getString());   
        return Variant.VARIANT_TRUE;
      } catch (Exception e) {
        return Variant.VARIANT_FALSE;
      }  
    }
    return Variant.VARIANT_FALSE;
  }
```

---

## SFTP - Fechar Canal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPDisconnectChannel` |
| **Código** | 795 |
| **Assinatura** | `SFTP - Fechar Canal (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha um canal de comunicação.

Parâmetro:
1. Referência do Canal. (Variante)

Retorno:
Não possui.

Observação:
O primeiro parâmetro é o retorno da função "SFTP - Abrir Canal" .

### Código Servidor (Java)

```java
protected final Variant ebfSFTPDisconnectChannel(Variant sftpChannel) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.exit();
  return Variant.VARIANT_NULL; 
}
```

---

## SFTP - Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPClose` |
| **Código** | 796 |
| **Assinatura** | `SFTP - Fechar Conexão (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha a conexão SFTP.

Parâmetro:
1. Conexão SFTP. (Variante)

Retorno:
Não possui.

Observação:
O primeiro parâmetro é o retorno da função "SFTP - Abrir Conexão".

### Código Servidor (Java)

```java
protected final Variant ebfSFTPClose(Variant ftp) throws Exception {
  com.jcraft.jsch.Session session = (com.jcraft.jsch.Session)ftp.getObject();
  session.disconnect();
  return Variant.VARIANT_NULL;
}
```

---

## SFTP - Listar Conteúdo de uma Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPListFile` |
| **Código** | 797 |
| **Assinatura** | `SFTP - Listar Conteúdo de uma Pasta (Variante;Letras;Lógico): Variante` |
| **Parâmetros** | Variante;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função listará o conteúdo de uma pasta. Caso o nome da pasta seja informada no segundo parâmetro, será listado apenas o conteúdo da pasta informada. Caso o valor informado no terceiro parâmetro tenha um valor lógico verdadeiro, será exibido informações detalhadas dos mesmos, se o valor for falso será exibido apenas uma lista contendo os arquivos e pastas do diretório.

Parâmetro(s):
1. Referência do Canal. (Variante)
2. Pasta. (Letras)
3. Detalhes? (Lógico)

Retorno:
Lista de lista com as informações. (Variante)

Observação:
O primeiro parâmetro é o retorno da função "SFTP - Abrir Canal".

### Código Servidor (Java)

```java
protected final Variant ebfSFTPListFile(Variant sftpChannel, Variant folder, Variant description) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  List<String> files = new ArrayList<String>(); 
  if(folder.getObject() != null)
    channel.cd(folder.getTrimString());
    java.util.Vector<com.jcraft.jsch.ChannelSftp.LsEntry> filelist = channel.ls(".");
  if(description.getObject() != null && description.getBoolean()) {
    for (com.jcraft.jsch.ChannelSftp.LsEntry file : filelist) {
      files.add(file.getLongname());
    }
  }
  else{  
    for (com.jcraft.jsch.ChannelSftp.LsEntry file : filelist) {
      files.add(file.getFilename());
    }
  }
  return VariantPool.get(files);
}
```

---

## SFTP - Nível Acima

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPFolderUp` |
| **Código** | 798 |
| **Assinatura** | `SFTP - Nível Acima (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função muda o diretório de trabalho para o diretório "pai" (superior) do diretório atual.

Parâmetro:
1. Referência do Canal. (Variante)

Retorno: 
Referência do canal com o novo nível. (Variante)

Observação:
O primeiro parâmetro é o retorno da função "SFTP - Abrir Canal".

### Código Servidor (Java)

```java
protected final Variant ebfSFTPFolderUp(Variant sftpChannel) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.cd("..");
  return VariantPool.get(channel);
}
```

---

## SFTP - Obter Arquivo do Servidor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPGet` |
| **Código** | 799 |
| **Assinatura** | `SFTP - Obter Arquivo do Servidor (Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Letras;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função obtém o arquivo informado do servidor SFTP e adiciona uma cópia do mesma na pasta local informada.

Parâmetro(s):
1. Referência de um Canal. (Variante)
2. Endereço local do arquivo de origem no servidor. (Letras)
3. Endereço da pasta de destino local. (Letras)

Retorno:
Não possui.

Observações:
1. Ao passar o endereço de origem é necessário passar o endereço completo com o nome e a extensão do arquivo.
2. Antes do uso desta função é necessário ter a conexão SFTP aberta.

Exemplo:
1º parâmetro: canal SFTP (Variante -  retorno da função "Conectar Canal SFTP" )
2º parâmetro: /pastaOrigem/ArquivoOrigem.txt
3º parâmetro: c:/pastaDestino/ArquivoDestino.txt

### Código Servidor (Java)

```java
protected final Variant ebfSFTPGet(Variant sftpChannel, Variant remote, Variant local) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.get(remote.getTrimString(),local.getTrimString());
  return Variant.VARIANT_NULL;
}
```

---

## SFTP - Obter Diretório de Trabalho Remoto Corrente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPGetFolder` |
| **Código** | 801 |
| **Assinatura** | `SFTP - Obter Diretório de Trabalho Remoto Corrente (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função exibe o nome do diretório de trabalho remoto corrente.

Parâmetro:
1. Referência de um canal SFTP. (Variante)

Retorno:
Nome do diretório corrente. (Letras)

Observação: 
O primeiro parâmetro é o retorno da função "SFTP - Abrir Canal".

### Código Servidor (Java)

```java
protected final Variant ebfSFTPGetFolder(Variant sftpChannel) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  StringBuilder out = new StringBuilder();
  out.append(channel.pwd());
  out.append("\n"); 
  return VariantPool.get(out.toString());
}
```

---

## SFTP - Trocar a Pasta Atual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSFTPAlterFolder` |
| **Código** | 800 |
| **Assinatura** | `SFTP - Trocar a Pasta Atual (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 42 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função altera o diretório de trabalho remoto para o diretório informado.

Parâmetro(s):
1. Referência de um Canal. (Variante)
2. Endereço do novo diretório. (Letras)

Retorno:
Referência de um Canal. (Variante)

Observações:
1. Só é possível mudar o diretório a partir da home do usuário, não sendo possível trocar a pasta partir de um diretório diferente da home.
2. Antes do uso desta função é necessário ter a conexão SFTP aberta. 

Exemplo:
1º parâmetro: canal SFTP (Retorno da função "SFTP - Abrir Canal")
2º parâmetro: /pastaDestino

### Código Servidor (Java)

```java
protected final Variant ebfSFTPAlterFolder(Variant sftpChannel, Variant folder) throws Exception {
  com.jcraft.jsch.ChannelSftp channel = (com.jcraft.jsch.ChannelSftp)sftpChannel.getObject();
  channel.cd(folder.getTrimString());
  return  VariantPool.get(channel);	 
}
```

---

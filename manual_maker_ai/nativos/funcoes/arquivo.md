# Funções Nativas - Arquivo

Total: **39** funções

[← Voltar para Funções Nativas](README.md)

---

## Abrir arquivo para escrita

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileOpenToWrite` |
| **Código** | 72 |
| **Assinatura** | `Abrir arquivo para escrita (Letras;Lógico): Variante` |
| **Parâmetros** | Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre um arquivo para edição e retorna uma referência para o arquivo. 

Parâmetro(s):
1. Caminho do arquivo. (Letras)
2. Falso, para abrir o arquivo para edição sobrepondo o seu conteúdo original, ou verdadeiro, para abrir e 
apenas inserir novos dados ao conteúdo existente. (Lógico)

Retorno: 
Referência para o arquivo. (Variante)

Observação: 
Caso o arquivo não exista, ele será criado automaticamente.

Exemplos: 
1. Assumindo os parâmetros como "\\servidor\maquina\diretorio\exemplo.txt" e "Verdadeiro", o retorno seria a 
referência para o arquivo exemplo.txt, sem apagar o conteúdo existente.
2. Assumindo os parâmetros como "c:/softwellmaker.txt" e "Falso", o retorno seria a referência para o arquivo 
softwellmaker.txt, sobrepondo o conteúdo existente.

### Código Servidor (Java)

```java
protected final Variant ebfFileOpenToWrite(Variant url, Variant append) throws Exception {
    return new Variant(getWfrFileFunctions().openToWrite(getSystem(), url.getString(), append.getBoolean()));
  }
```

---

## Abrir arquivo para leitura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileOpenToRead` |
| **Código** | 73 |
| **Assinatura** | `Abrir arquivo para leitura (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre um arquivo apenas para leitura, ou seja, sem permitir alterações no arquivo.

Parâmetro:
1. Caminho do arquivo. (Letras)

Retorno: 
Retorna a referência para o arquivo. (Variante)

Observação: 
A referência para o arquivo retornada por essa função não permite a posterior utilização de funções que farão 
alteração no arquivo. Caso queira abrir um arquivo para fazer uma alteração, utilize a função "Abrir arquivo para 
escrita".

Exemplo: 
Assumindo o parâmetro como "\\servidor\maquina\diretorio\exemplo.txt", o retorno seria uma 
referência para o arquivo "exemplo.txt".

### Código Servidor (Java)

```java
protected final Variant ebfFileOpenToRead(Variant url) throws Exception {
    return new Variant(getWfrFileFunctions().openToRead(getSystem(), url.getString()));
  }
```

---

## Adicionar a arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileAppend` |
| **Código** | 74 |
| **Assinatura** | `Adicionar a arquivo (Variante;Letras;Letras;Lógico;Lógico)` |
| **Parâmetros** | Variante;Letras;Letras;Lógico;Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função adiciona um conteúdo ao arquivo passado por parâmetro.

Parâmetro(s):
1. Caminho do arquivo ou referência do arquivo. (Variante) (Ver observação 1)
2. Conteúdo que será adicionado ao arquivo. (Letras)
3. Charset. (Letras, Opcional) (Ver observação 2)
4. Falso, para abrir o arquivo para edição sobrepondo o seu conteúdo original, ou verdadeiro, para abrir e apenas inserir novos dados ao conteúdo existente. (Lógico, Opcional)
5. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a escrita. (Lógico, Opcional) (Ver Observação 3)

Retorno:
Referência do arquivo ou nulo. (Variante)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função "Abrir arquivo para Escrita", ou o caminho para o arquivo. 
2. No segundo parâmetro, deverá ser informado o charset do arquivo exemplo: (UTF-8, ISO-8859-1).
3. Quando o valor para o quinto parâmetro for falso o arquivo será fechado e o retorno será nulo, caso seja verdadeiro o arquivo permanecerá aberto e retornará a referência do mesmo.
4. Caso o quarto parâmetro não seja informado o conteúdo do arquivo possuirá o Charset do Webrun.

### Código Servidor (Java)

```java
protected final Variant ebfFileAppend(Variant file, Variant content) throws Exception {
  if (file.getObject() instanceof FileOutputStream) {
    FileOutputStream out = (FileOutputStream) file.getObject();
    if(content.getObject() instanceof byte[])
      out.write((byte[])content.getObject());
    else
      out.write(content.toString().getBytes());
  } else
    throw new Exception(getSystem().getResources().getString(ExceptionMessage.ERROR_FILE_PARAMETER_MUST_BE_OPENED));
  return Variant.VARIANT_NULL;
}

protected final Variant ebfFileAppend(Variant file, Variant content, Variant charset) throws Exception {
  return ebfFileAppend(file, content, charset, new Variant(false), new Variant(false));
}

protected final Variant ebfFileAppend(Variant reference, Variant content, Variant charset, Variant append, Variant close) throws Exception {
  String encoding = charset.getString();
  encoding = encoding.isEmpty() ? Settings.CHARSET : encoding;
  return new Variant(getWfrFileFunctions().append(
      getSystem(), reference.getObject(), content.getObject(), encoding, append.getBoolean(), close.getBoolean()));
}
```

---

## Copiar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileCopy` |
| **Código** | 205 |
| **Assinatura** | `Copiar Arquivo (Letras, Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria uma cópia de um arquivo do servidor.

Parâmetro(s):
1. Caminho absoluto do arquivo a ser copiado. (Letras)
2. Caminho absoluto do arquivo a ser criado. (Letras)

Retorno:
Não possui.

Observação:
Somente podem ser copiados arquivos que estejam dentro da mesma rede ou no computador onde o Webrun 
está sendo executado.

Exemplos:
1. Definindo o primeiro parâmetro como "\\192.168.1.50\Arquivos\Documento.doc" e o segundo parâmetro como 
"\\192.168.1.69\Arquivos\teste.doc" o arquivo será copiado de um computador da rede para outro. (É possível 
copiar arquivos de uma máquina da rede para outra);
2. Definindo o primeiro parâmetro como "C:\softwell.txt" e o segundo parâmetro como "D:\maker.txt", o arquivo 
será copiado do diretório "C" para o diretório "D".

### Código Servidor (Java)

```java
protected final Variant ebfFileCopy(Variant pathFrom, Variant pathTo) throws Exception {
  getWfrFileFunctions().copy(getSystem(), pathFrom.getString(), pathTo.getString());
  return Variant.VARIANT_NULL;
}
```

---

## Copiar Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFolderCopy` |
| **Código** | 731 |
| **Assinatura** | `Copiar Pasta (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função cria uma cópia da pasta e todo seu conteúdo passado por parâmetro para outra pasta de escolha do usuário no servidor.

Parâmetro(s):
1. Caminho absoluto da pasta a ser copiado. (Letras)
2. Caminho absoluto da pasta a ser colada. (Letras)

Retorno:
Não possui.

Observação:
Caso a pasta destino não exista, ela será criada automaticamente.

Exemplo:
Caso o 1º parâmetro seja "C:\Teste", e o 2º parâmetro "C:\Teste2", caso ela não exista, será criado uma pasta de nome "Teste2" e colado todo seu conteúdo.

### Código Servidor (Java)

```java
protected final Variant ebfFolderCopy(Variant pathFrom, Variant pathTo) throws Exception {
  getWfrFileFunctions().folderCopy(getSystem(), pathFrom.getString(), pathTo.getString());
  return Variant.VARIANT_NULL;
}
```

---

## Criar Nova Pasta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateFolder` |
| **Código** | 389 |
| **Assinatura** | `Criar Nova Pasta (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria uma nova pasta no servidor.

Parâmetro:
1. Caminho absoluto da pasta. (Letras)

Retorno:
Verdadeiro, caso toda a estrutura de pastas tenha sido criada. Falso, caso contrário. (Lógico)

Observação:
Caso a pasta definida no primeiro parâmetro já exista, a mesma é mantida e a função retorna "False".

Exemplo:
Assumindo como parâmetro a referência para a pasta "C:\Pasta", caso já exista uma pasta de mesmo 
caminho absoluto, o retorno será "False".

### Código Servidor (Java)

```java
protected final Variant ebfCreateFolder(Variant absolutePath) throws Exception {
  return new Variant(getWfrFileFunctions().createFolder(getSystem(), absolutePath.getString()));
}
```

---

## Criar Novo Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileCreate` |
| **Código** | 202 |
| **Assinatura** | `Criar Novo Arquivo (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria um novo arquivo no servidor.

Parâmetro(s):
1. Caminho absoluto do arquivo. (Letras)
2. Charset. (Letras, Opcional) (Ver observação 2)

Retorno:
Verdadeiro, caso o arquivo seja criado com sucesso. Falso, caso contrário. (Lógico)

Observações:
1. Caso queira criar o arquivo no contexto do Webrun, utilize a função "Diretório de Arquivos" que retorna o 
diretório de arquivos do Webrun. Após ter conhecimento do diretório, utilize a função "Concatenação" para juntá-
lo com o nome e extensão desejados para o seu novo arquivo.
2. No segundo parâmetro, deverá ser informado o charset do arquivo, exemplo: (UTF-8, ISO-8859-1). Caso não seja passado o charset, a função adotará o charset corrente do Webrun.

Exemplos:
1. Assumindo como parâmetro o caminho "C:\HelpMaker.txt", caso já exista um arquivo de mesmo caminho 
absoluto, o retorno será "False".
2. Assumindo como parâmetro o caminho "C:\MakerALL.txt", caso não exista um arquivo de mesmo caminho 
absoluto, o retorno será "True" caso o arquivo seja criado com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfFileCreate (Variant path) throws Exception {
  return ebfFileCreate(path, Variant.VARIANT_STRING_EMPTY);
}

protected final Variant ebfFileCreate(Variant path, Variant charset) throws Exception {
  return new Variant(getWfrFileFunctions().create(getSystem(), path.getString(), charset.getString()));
}
```

---

## Descarregar para arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileFlush` |
| **Código** | 78 |
| **Assinatura** | `Descarregar para arquivo (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Força a gravação do arquivo em disco, movendo todo o conteúdo que estava na memória para a unidade de 
armazenamento. O uso desta função evita perdas inesperadas e força o Sistema Operacional a gravar logo 
as informações (contidas na memória) no arquivo.

Parâmetro(s):
1. Referência para o arquivo. (Variante) 

Retorno:
Não possui.

Observação: 
A referência para o arquivo utilizado na função deverá ser o retorno da função "Abrir arquivo para escrita".

Exemplo: 
Supondo que anteriormente foi armazenado na variável "Caminho do TXT" a referência para determinado arquivo e que foi utilizada a função "Adicionar a arquivo"  para adicionar conteúdos a este arquivo. Utilizar esta função posteriormente garante que os dados sejam gravados em disco, e não somente de forma provisória na memória.

### Código Servidor (Java)

```java
protected final Variant ebfFileFlush(Variant file) throws Exception {
  if (file.getObject() instanceof FileOutputStream) {
    ((FileOutputStream) file.getObject()).flush();
  } else
    throw new Exception(getSystem().getResources().getString(ExceptionMessage.ERROR_FILE_PARAMETER_MUST_BE_OPENED));
  return Variant.VARIANT_NULL;
}
```

---

## Diretório de Arquivos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileBase` |
| **Código** | 160 |
| **Assinatura** | `Diretório de Arquivos (): Letras` |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o diretório de arquivos do Webrun.

Parâmetro:
Não possui.

Retorno: 
Retorna o diretório de arquivos do Webrun em uso. (Letras)

Exemplo: 
Se o Webrun utilizado estiver nomeado como "webrun_teste" na pasta do seu Tomcat, o retorno será algo 
próximo a "C:\Program Files (x86)\Softwell Solutions\Maker 2.7\Webrun 2\tomcat\webapps\webrun_teste\".

### Código Servidor (Java)

```java
protected final Variant ebfFileBase() throws Exception {
  return new Variant(getWfrFileFunctions().getBase(getSystem()));
}
```

---

## Diretório de Arquivos de Configuração

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWebrunConfigDir` |
| **Código** | 402 |
| **Assinatura** | `Diretório de Arquivos de Configuração () : Letras` |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o diretório de arquivos de configuração (config).

Parâmetro:
Não possui.

Retorno: 
Retorna o diretório de arquivos de configuração geral do Webrun. (Letras)

Exemplo:
Se o seu Maker foi instalado no diretório padrão de instalação, o retorno será algo próximo a 
"C:\Program Files\Softwell Solutions\Maker 2.7\Webrun 2\config".

### Código Servidor (Java)

```java
protected final Variant ebfWebrunConfigDir() throws Exception {    
  return new Variant(getWfrFileFunctions().webrunConfigDir(getSystem()));
}
```

---

## Diretório de Arquivos temporários

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileTempDir` |
| **Código** | 82 |
| **Assinatura** | `Diretório de arquivos temporários(): Letras` |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o diretório de arquivos temporários do Webrun.

Parâmetro:
Não possui.

Retorno: 
Retorna o diretório de arquivos temporários do Webrun em uso. (Letras)

Exemplo: 
Se o Webrun utilizado estiver nomeado como "webrun_teste" na pasta do seu Tomcat, o retorno será algo 
próximo a "C:\Program Files (x86)\Softwell Solutions\Maker 2.7\Webrun 2\tomcat\webapps\webrun_teste\tmp".

### Código Servidor (Java)

```java
protected final Variant ebfFileTempDir() throws Exception {
  return new Variant(getWfrFileFunctions().tempDir(getSystem()));
}
```

---

## Existe o Arquivo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileExists` |
| **Código** | 204 |
| **Assinatura** | `Existe o Arquivo? (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se existe um arquivo no servidor.

Parâmetro:
1. Caminho absoluto do arquivo. (Letras)

Retorno:
Verdadeiro caso o arquivo exista. Caso contrário, retorna Falso. (Lógico)

Observação:
Caso o arquivo esteja em rede deve-se passar o caminho do arquivo na rede e não a unidade mapeada, exemplo:
\\servidor\softwell\ExisteArquivo.pdf.

Exemplos:
1. Assumindo como parâmetro "C:\MakerSoftwell.txt" e o mesmo exista, o retorno da função será "True".
2. Assumindo como parâmetro "C:\MakerSoftwell.txt" e o mesmo não exista, o retorno da função será "False".

### Código Servidor (Java)

```java
protected final Variant ebfFileExists(Variant path) throws Exception {
  return new Variant(getWfrFileFunctions().exists(getSystem(), path.getString()));
}
```

---

## Fechar arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileClose` |
| **Código** | 79 |
| **Assinatura** | `Fechar arquivo (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha um arquivo que foi aberto para escrita ou para leitura.

Parâmetro:
1. Referência de um arquivo aberto. (Variante) (Ver observação 1)

Retorno:
Não possui.

Observação:
A referência do arquivo pode ser obtida através da utilização das funções "Abrir arquivo para escrita" ou "Abrir arquivo para leitura".

### Código Servidor (Java)

```java
protected final Variant ebfFileClose(Variant file) throws Exception {
  if (file.getObject() instanceof FileOutputStream) {
    ((FileOutputStream) file.getObject()).flush();
    ((FileOutputStream) file.getObject()).close();
  } else if (file.getObject() instanceof FileInputStream) {
    ((FileInputStream) file.getObject()).close();
  } else {
    throw new Exception("O parâmetro arquivo deve ser um arquivo aberto!");
  }
  return Variant.VARIANT_NULL;
}
```

---

## Fim do Arquivo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileEoF` |
| **Código** | 109 |
| **Assinatura** | `Fim do Arquivo? (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se já chegou ao fim do arquivo. Muito usada com a função "Ler linha do arquivo", para verificar se o 
arquivo já está no final.

Parâmetro:
1. Referência para um arquivo. (Variante) (Ver observação 1)

Retorno: 
"True" se tiver chegado ao fim do arquivo, e "False" caso contrário. (Lógico)

Observação:
A referência do arquivo pode ser obtida através da utilização das funções "Abrir arquivo para escrita" ou "Abrir arquivo para leitura".

### Código Servidor (Java)

```java
protected final Variant ebfFileEoF(Variant file) throws Exception {
    if (file.getObject() instanceof FileInputStream) {
      FileInputStream in = (FileInputStream) file.getObject();
      return VariantPool.get(in.getChannel().position() == in.getChannel().size());     
    } else
      throw new Exception("O parâmetro arquivo deve ser um arquivo aberto para leitura!");
  }
```

---

## Gerar Miniatura da Imagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGenerateThumbnail` |
| **Código** | 653 |
| **Assinatura** | `Gerar Miniatura da Imagem (Letras;Letras;Inteiro;Inteiro)` |
| **Parâmetros** | Letras;Letras;Inteiro;Inteiro |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função gera um arquivo Thumbnail (Arquivo imagem de menor tamanho) a partir do arquivo e tamanhos definidos
por parâmetro.

Parâmetro(s):
1. Caminho Absoluto da Imagem. (Letras)
2. Caminho Absoluto da Imagem. (Letras) (Ver observação 2)
3. Largura da Imagem Thumbnail. (Inteiro)
4. Altura da Imagem Thumbnail. (Inteiro)

Retorno:
Não possui.

Observações:
1. Apenas são suportadas imagens de extensão PNG, JPG e BMP.
2. No segundo parâmetro deve ser especificado o caminho da nova Thumbnail que será salva.

### Código Servidor (Java)

```java
protected void ebfGenerateThumbnail(Variant srcFile, Variant destFile, Variant width, Variant height) throws Exception {
  getWfrFileFunctions().generateThumbnail(
      getSystem(), srcFile.getString(), destFile.getString(), width.getLong().intValue(), height.getLong().intValue());
}
```

---

## Ler Intervalo de Linhas de um Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileReadLineInterval` |
| **Código** | 702 |
| **Assinatura** | `Ler Intervalo de Linhas de um Arquivo (Variante;Inteiro;Inteiro;Lógico): Letras` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Lógico |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função lê uma determinada quantidade de linhas de um arquivo a partir de uma linha inicial.

Parâmetro(s):
1. Caminho do arquivo ou referência do arquivo. (Variante) (Ver observação 1)
2. Linha Inicial. (Inteiro)
3. Quantidade de Linhas. (Inteiro)
4. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a leitura (Lógico, Opcional) (Ver observação 2)

Retorno:
Linhas lidas do arquivo. (Letras)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função "Abrir arquivo para Leitura", ou o caminho para o arquivo.
2. Caso o quarto parâmetro não seja informado o arquivo permanecerá aberto após a leitura.

### Código Servidor (Java)

```java
protected final Variant ebfFileReadLineInterval(Variant file, Variant lineStart, Variant length) throws Exception {
  return ebfFileReadLineInterval (file, lineStart, length, new Variant(false));
}

protected final Variant ebfFileReadLineInterval(Variant file, Variant lineStart, Variant length, Variant close) throws Exception {
  return new Variant(getWfrFileFunctions().readLineInterval(
      getSystem(), file.getObject(), lineStart.getLong().intValue(), length.getLong().intValue(), close.getBoolean()));
}
```

---

## Ler Linha do Arquivo Definindo Charset

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileReadLineWithCharset` |
| **Código** | 739 |
| **Assinatura** | `Ler Linha do Arquivo Definindo Charset (Variante;Letras;Lógico): Letras` |
| **Parâmetros** | Variante;Letras;Lógico |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Lê a linha do arquivo passado no parâmetro de acordo o Charset informado.

Parâmetro(s):
1. Caminho do arquivo ou referência do arquivo. (Variante) (Ver observação 1)
2. Charset a ser utilizado. (Letras, Opcional) (Ver observação 3)
3. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a leitura (Lógico, Opcional) (Ver observação 4)

Retorno: 
Conteúdo lido. (Letras)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função Abrir Arquivo para Leitura, ou o caminho para o arquivo.
2. Ao utilizar esta função a linha é incrementada, ou seja, na primeira utilização a leitura da primeira linha será realizada, na segunda vez o retorno será o conteúdo da segunda linha.
3. No segundo parâmetro, deverá ser informado o charset do arquivo, exemplo: (UTF-8, ISO-8859-1). Caso ele não seja definido o mesmo assumirá o Charset do Webrun.
4. Caso o terceiro parâmetro não seja informado o arquivo permanecerá aberto após a leitura.

Exemplo:
Assumindo como primeiro parâmetro a referência para um arquivo que tem o texto "Maker Flow" na primeira 
linha e o texto "Softwares" na segunda linha, o retorno será "Maker Flow". Na segunda vez que a função for 
usada o retorno será "Softwares", pois ao realizar a leitura a linha é incrementada.

### Código Servidor (Java)

```java
protected final Variant ebfFileReadLineWithCharset(Variant file, Variant charSet) throws Exception {
  return ebfFileReadLineWithCharset(file, charSet, new Variant(false));
}

protected final Variant ebfFileReadLineWithCharset(Variant file, Variant charset, Variant close) throws Exception {
  String encoding = charset.getString();
  encoding = encoding.isEmpty() ? Settings.CHARSET : encoding;
  return new Variant(getWfrFileFunctions().readLineWithCharset(getSystem(), file.getObject(), encoding, close.getBoolean()));
}
```

---

## Ler Todo Arquivo Definindo Charset

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileReadContentWithCharset` |
| **Código** | 437 |
| **Assinatura** | `Ler Todo Arquivo Definindo Charset (Variante;Letras) : Letras` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Lê todo o conteúdo do arquivo passado no parâmetro, mesmo que tenha quebra de linha, definindo o charset.

Parâmetro(s):
1. Referência do arquivo ou caminho para o arquivo. (Ver observação 1)
2. Charset a ser utilizado. Ex: ISO-8859-1, UTF-8. (Ver observação 2)

Retorno: 
Conteúdo de todo o arquivo. (Letras)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função Abrir Arquivo para Leitura, ou o caminho para o arquivo. 
2. Caso o 2º parâmetro não seja definido o mesmo assumirá o Charset do Webrun.

Exemplo:
Assumindo como parâmetro a referência para um arquivo que tem o texto "Maker ALL" , o retorno será "Maker 
ALL".

### Código Servidor (Java)

```java
protected final Variant ebfFileReadContentWithCharset(Variant file, Variant charset) throws Exception {
  return VariantPool.get(getWfrFileFunctions().readAll(getSystem(), file.getObject(), true, charset.getString()));
}
```

---

## Ler caracteres do arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileRead` |
| **Código** | 75 |
| **Assinatura** | `Ler caracteres do arquivo (Variante;Inteiro;Lógico): Letras` |
| **Parâmetros** | Variante;Inteiro;Lógico |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Lê a quantidade de caracteres passada no segundo parâmetro, mesmo que tenha quebra de linha.

Parâmetro(s):
1. Caminho do arquivo ou referência do arquivo. (Variante) (Ver observação 1)
2. Quantidade de caracteres a serem lidos. (Inteiro)
3. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a leitura. (Lógico, Opcional) (Ver observação 3)

Retorno: 
Texto lido. (Letras)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função Abrir Arquivo para Leitura ou o caminho para o arquivo. 
2. A leitura é sempre realizada a partir do início do arquivo até a quantidade de caracteres definida.
3. Caso o terceiro parâmetro não seja informado o arquivo permanecerá aberto após a leitura.

Exemplos:
1. Assumindo como parâmetro a referência para um arquivo que tem o texto "Maker ALL" , o retorno será "Maker 
ALL" caso a quantidade de caracteres passada no segundo parâmetro tenha sido igual a 9.
2. Assumindo como parâmetro a referência para um arquivo que tem o texto "Softwell Maker ALL" , o retorno será "Softwell" caso a quantidade de caracteres passada no segundo parâmetro tenha sido igual a 8.

### Código Servidor (Java)

```java
protected final Variant ebfFileRead(Variant file, Variant size) throws Exception {
  return ebfFileRead (file, size, new Variant(false));
}
protected final Variant ebfFileRead(Variant file, Variant size, Variant close) throws Exception {
  return new Variant(getWfrFileFunctions().read(
      getSystem(), file.getObject(), size.getLong().intValue(), close.getBoolean()));
}
```

---

## Ler linha do arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileReadLine` |
| **Código** | 77 |
| **Assinatura** | `Ler linha do arquivo (Variante;Lógico): Letras` |
| **Parâmetros** | Variante;Lógico |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Lê a linha do arquivo passado por parâmetro.

Parâmetro(s):
1. Referência do arquivo ou caminho do arquivo. (Ver observação 1)
2. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a leitura. (Opcional) (Ver observação 3)

Retorno: 
Conteúdo lido. (Letras)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função "Abrir arquivo para Leitura", ou o caminho para o arquivo.
2. Ao utilizar esta função a linha é incrementada, ou seja, na primeira utilização a leitura da primeira linha será realizada, na segunda vez o retorno será o conteúdo da segunda linha.
3. Caso o segundo parâmetro não seja informado o arquivo permanecerá aberto após a leitura.

Exemplo:
Assumindo como primeiro parâmetro a referência para um arquivo que tem o texto "Maker Flow" na primeira 
linha e o texto "Softwares" na segunda linha, o retorno será "Maker Flow". Na segunda vez que a função for 
usada o retorno será "Softwares", pois ao realizar a leitura a linha é incrementada.

### Código Servidor (Java)

```java
protected final Variant ebfFileReadLine(Variant file) throws Exception {
  return ebfFileReadLine( file, new Variant(false));
}

protected final Variant ebfFileReadLine(Variant file, Variant close) throws Exception {
  return new Variant(getWfrFileFunctions().readLine(getSystem(), file.getObject(), close.getBoolean()));
}
```

---

## Ler todo arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileReadAll` |
| **Código** | 76 |
| **Assinatura** | `Ler todo arquivo (Variante;Lógico): Letras` |
| **Parâmetros** | Variante;Lógico |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Lê todo o conteúdo do arquivo passado no parâmetro, mesmo que tenha quebra de linha.

Parâmetro(s):
1. Caminho do arquivo ou referência do arquivo. (Variante) (Ver observação 1)
2. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a leitura. (Lógico, Opcional) (Ver observação 2)

Retorno: 
Conteúdo de todo o arquivo. (Letras)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função "Abrir arquivo para Leitura", ou o caminho do arquivo.
2. Caso o segundo parâmetro não seja informado o arquivo permanecerá aberto após a leitura.

Exemplo:
Assumindo como parâmetro a referência para um arquivo que tem o texto "Maker ALL" , o retorno será "Maker 
ALL".

### Código Servidor (Java)

```java
protected final Variant ebfFileReadAll(Variant file) throws Exception {
  return VariantPool.get(getWfrFileFunctions().readAll(getSystem(), file.getObject(), false));
}

protected final Variant ebfFileReadAll(Variant file, Variant close) throws Exception {
  return VariantPool.get(getWfrFileFunctions().readAll(getSystem(), file.getObject(), close.getBoolean()));
}
```

---

## Ler todo arquivo em bytes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileReadAllToBytes` |
| **Código** | 95 |
| **Assinatura** | `Ler todo arquivo em bytes (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Ler em bytes todo o conteúdo do arquivo passado no parâmetro, mesmo que tenha quebra de linha.

Parâmetro:
1. Referência do arquivo ou caminho do arquivo. (Variante) (Ver observação 1)

Retorno: 
Array de bytes lido. (Variante)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função "Abrir Arquivo para Leitura", ou o caminho para o arquivo. 
2. Antes de manipular os elementos do array de bytes retornados por esta função utilizando a categoria lista, é 
necessário utilizar a função "Array para Lista" da categoria conversão.

Exemplo:
Assumindo como parâmetro a referência para um arquivo que tem o texto "Maker", o retorno será 
[77, 97, 107, 101, 114].

### Código Servidor (Java)

```java
protected final Variant ebfFileReadAllToBytes(Variant file) throws Exception {
  return new Variant(getWfrFileFunctions().readAllToBytes(getSystem(), file.getObject()));
}
```

---

## Mover Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileMove` |
| **Código** | 208 |
| **Assinatura** | `Mover Arquivo (Letras, Letras) : Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Move o arquivo especificado.

Parâmetro(s):
1. Caminho absoluto do arquivo original. (Letras)
2. Caminho absoluto do destino do arquivo. (Letras)

Retorno:
Verdadeiro caso consiga mover. Caso contrário, retorna Falso. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfFileMove(Variant pathFrom, Variant pathTo) throws Exception {
  return new Variant(getWfrFileFunctions().move(getSystem(), pathFrom.getString(), pathTo.getString()));
}
```

---

## Obter Diretório do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileGetParent` |
| **Código** | 206 |
| **Assinatura** | `Obter Diretório do Arquivo (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Remove o nome do arquivo retornando apenas o diretório em que ele se encontra.

Parâmetro:
1. Caminho absoluto do arquivo. (Letras)

Retorno:
Caminho da pasta que contém o arquivo. (Letras)

Exemplo:
Assumindo como parâmetro o valor "C:\Softwell\Documentos.txt" o retorno será "C:\Softwell", sem o nome do arquivo.

### Código Servidor (Java)

```java
protected final Variant ebfFileGetParent(Variant path) throws Exception {
  return new Variant(getWfrFileFunctions().getParent(getSystem(), path.getString()));
}
```

---

## Obter Extensão do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFileExtension` |
| **Código** | 996 |
| **Assinatura** | `Obter Extensão do Arquivo (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna a extensão do arquivo a partir do seu diretório.

Parâmetro:
1. Caminho absoluto do arquivo. (Letras)

Retorno:
Extensão do arquivo. (Letras)

Observação:
A função só retornará a extensão do arquivo caso o mesmo exista no diretório informado, caso contrário, retorna vazio.

Exemplo:
Assumindo como parâmetro "C:\MakerStudio\maker.txt" o retorno será "txt".

### Código Servidor (Java)

```java
protected final Variant ebfGetFileExtension (Variant pathFile) throws Exception {
  if (!pathFile.isNull() && !pathFile.getString().isEmpty())
    return VariantPool.get(org.apache.commons.io.FilenameUtils.getExtension(pathFile.getString()));
  return Variant.VARIANT_STRING_EMPTY;
}
```

---

## Obter MD5 do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFileMD5` |
| **Código** | 417 |
| **Assinatura** | `Obter MD5 do Arquivo(Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o conteúdo do arquivo passado por parâmetro convertido para MD5.

Parâmetro:
1. Endereço do arquivo. (Letras)

Retorno:
Conteúdo do arquivo convertido em MD5 do arquivo. (Letras)

Exemplo:
Ao passar um arquivo com o conteúdo "abc", o retorno será "900150983cd24fb0d6963f7d28e17f72".

### Código Servidor (Java)

```java
protected final Variant ebfGetFileMD5(Variant filename) throws Exception {
  return new Variant(getWfrFileFunctions().getFileMD5(getSystem(), filename.getString()));
}
```

---

## Obter Nome do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetFileName` |
| **Código** | 995 |
| **Assinatura** | `Obter Nome do Arquivo (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna o nome do arquivo a partir do seu diretório.

Parâmetro:
1. Caminho absoluto do arquivo. (Letras)

Retorno:
Nome do Arquivo. (Letras)

Observação:
A função só retornará o nome do arquivo caso o mesmo exista no diretório informado, caso contrário, retorna vazio.

Exemplo:
Assumindo como parâmetro "C:\MakerStudio\maker.txt", o retorno será "maker.txt".

### Código Servidor (Java)

```java
protected final Variant ebfGetFileName (Variant pathFile) throws Exception {
  if (!pathFile.isNull() && !pathFile.getString().isEmpty()) {
    File file = new File(pathFile.getString());
    if (file.exists()) return VariantPool.get(file.getName());
  }
  return Variant.VARIANT_STRING_EMPTY;
}
```

---

## Obter Total de Linhas do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileGetNumberOfLines` |
| **Código** | 404 |
| **Assinatura** | `Obter Total de Linhas do Arquivo (Letras): Inteiro` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o número total de linhas de um arquivo.

Parâmetro:
1. Caminho do Arquivo. (Letras)

Retorno:
Número de Linhas. (Inteiro)

### Código Servidor (Java)

```java
protected final Variant ebfFileGetNumberOfLines(Variant url) throws Exception {
  return new Variant(getWfrFileFunctions().getNumberOfLines(getSystem(), url.getString()));
}
```

---

## Percorrer Diretório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPercorreDirectory` |
| **Código** | 155 |
| **Assinatura** | `Percorre diretório(Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Percorre o diretório passado por parâmetro e retorna uma lista com todos os arquivos e pastas contidos nesse diretório.

Parâmetro:
1. Corresponde ao endereço do diretório que será percorrido. (Letras)

Retorno: 
Lista com os arquivos e diretórios contidos no diretório passado por parâmetro. (Variante)

Observações:
1. O retorno dessa função pode ser facilmente manipulado pelas funções da categoria lista.
2. Para verificar se um elemento da lista é arquivo ou diretório, utilize as funções "É diretório?" ou "É arquivo?".
3. Para que haja sucesso no uso da função, é necessário que o usuário que a utiliza tenha permissão de acesso aos diretórios e a pasta deve estar compartilhada.
4. Caso no diretório passado por parâmetro possua sub-diretórios com arquivos dentro, eles não serão retornados. A função percorre somente o diretório corrente.

Exemplos:
1. Assumindo como parâmetro c:/softwell (Sendo que dentro da pasta possui um arquivo Maker.txt e a pasta Webrun). O retorno será uma Lista com os elementos {c:/softwell/Maker.txt, c:/softwell/webrun}.
2. Assumindo como parâmetro \\192.168.1.50\softwell (pasta compartilhada - sendo que dentro da pasta possui um arquivo Maker.txt e a pasta Webrun). O retorno será uma Lista com os elementos {\\192.168.1.50\softwell\Maker.txt, \\192.168.1.50\softwell}.

### Código Servidor (Java)

```java
protected final Variant ebfPercorreDirectory(Variant dir) throws Exception {
  return new Variant(getWfrFileFunctions().browseDirectory(getSystem(), dir.getString()));
}
```

---

## Pode Escrever no Arquivo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileCanWrite` |
| **Código** | 201 |
| **Assinatura** | `Pode Escrever no Arquivo? (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se é possível escrever em um determinado arquivo no servidor.

Parâmetro:
1. Caminho absoluto do arquivo. (Letras)

Retorno:
Verdadeiro caso tenha permissão de escrita para o arquivo. Caso contrário retorna Falso. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfFileCanWrite(Variant path) throws Exception {
  return new Variant(getWfrFileFunctions().canWrite(getSystem(), path.getString()));
}
```

---

## Pode Ler Arquivo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileCanRead` |
| **Código** | 200 |
| **Assinatura** | `Pode Ler Arquivo? (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se é possível ler um determinado arquivo no servidor.

Parâmetro:
1. Caminho absoluto do arquivo. (Letras)

Retorno: 
Verdadeiro caso o arquivo possa ser lido. Caso contrário retorna Falso. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfFileCanRead(Variant path) throws Exception {
  return new Variant(getWfrFileFunctions().canRead(getSystem(), path.getString()));
}
```

---

## Remover Arquivo ou Pasta Vazia

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileRemove` |
| **Código** | 203 |
| **Assinatura** | `Remover Arquivo ou Pasta Vazia (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Remove um arquivo ou uma pasta vazia no servidor.

Parâmetro:
1. Local da pasta ou arquivo a ser deletado. 

Retorno:
Se o arquivo ou pasta vazia for removido(a) com sucesso, retorna "True". Caso contrário, retorna "False". (Lógico)

Observação:
Caso deseje remover uma pasta que contenha arquivos dentro, utilizar a função "Remover Pasta de Arquivos".

Exemplos:
1. Assumindo que o parâmetro seja "C:\MakerFlow", caso a pasta exista e esteja vazia, ela será apagada.
2. Assumindo que o parâmetro seja "C:\MakerFlow\maker.txt", caso o arquivo exista, ele será apagado.

### Código Servidor (Java)

```java
protected final Variant ebfFileRemove(Variant path) throws Exception {
  return new Variant(getWfrFileFunctions().delete(getSystem(), path.getString()));
}
```

---

## Remover Pasta de Arquivos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileRemoveFolderAndChildren` |
| **Código** | 436 |
| **Assinatura** | `Remover Pasta de Arquivos(Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Apaga no servidor a pasta e todo o conteúdo existente na mesma. 

Parâmetro:
1. Caminho absoluto da pasta. (Letras)

Retorno:
Caso o caminho exista e seja removido com sucesso, o retorno será "True", caso contrário será "False". (Lógico)

Observação:
Caso seja informado o caminho de um arquivo, a função removerá o arquivo informado no parâmetro.

Exemplos:
1. Assumindo que o parâmetro seja "C:\MakerFlow", caso a pasta exista, ela será apagada juntamente com os 
arquivos existentes em seu contexto e a função retornará "True".
2. Assumindo que o parâmetro seja "C:\MakerFlows", caso a pasta não exista, o retorno será "False".

### Código Servidor (Java)

```java
protected final Variant ebfFileRemoveFolderAndChildren(Variant path) throws Exception {
  return new Variant(getWfrFileFunctions().deleteFolderAndChildren(getSystem(), path.getString()));
}
```

---

## Renomear Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileRename` |
| **Código** | 207 |
| **Assinatura** | `Renomear Arquivo (Letras, Letras) : Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Renomeia o arquivo especificado.

Parâmetro(s):
1. Caminho absoluto do arquivo original. (Letras)
2. Novo nome do arquivo (com extensão). (Letras)

Retorno:
Não possui.

Exemplo:
Assumindo o caminho "C:\Softwell\Arquivo.txt" como 1º parâmetro e "Arquivo Novo.txt" como 2º parâmetro, o 
arquivo terá o nome alterado para "Arquivo Novo.txt".

### Código Servidor (Java)

```java
protected final Variant ebfFileRename(Variant path, Variant name) throws Exception {
  return new Variant(getWfrFileFunctions().renameTo(getSystem(), path.getString(), name.getString()));
}
```

---

## Tamanho do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFileGetSize` |
| **Código** | 125 |
| **Assinatura** | `Tamanho do Arquivo (Variante;Lógico): Inteiro` |
| **Parâmetros** | Variante;Lógico |
| **Retorno** | Inteiro |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o tamanho em bytes do arquivo passado por parâmetro.

Parâmetro(s):
1. Caminho do arquivo ou referência do arquivo. (Variante) (Ver observação 1)
2. Verdadeiro ou falso para indicar se desejar fechar o arquivo após a leitura. (Lógico, Opcional) (Ver observação 2)

Retorno: 
Tamanho do arquivo em bytes. (Inteiro)

Observações:
1. No primeiro parâmetro pode ser informado a referência para o arquivo por meio da função "Abrir Arquivo para Leitura", ou o caminho para o arquivo.
2. Caso o segundo parâmetro não seja informado o arquivo permanecerá aberto após a leitura.

Exemplo:
Assumindo como parâmetro a referência para um arquivo que tem 100 bytes, o retorno será 100.

### Código Servidor (Java)

```java
protected final Variant ebfFileGetSize(Variant file) throws Exception {
  return ebfFileGetSize(file, new Variant(false));
}

protected final Variant ebfFileGetSize(Variant file, Variant close) throws Exception {
  return new Variant(getWfrFileFunctions().getSize(getSystem(), file.getObject(), close.getBoolean()));
}
```

---

## Upload

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUploadFile2` |
| **Código** | 930 |
| **Assinatura** | `Upload (Letras;Fluxo;N'Variante)` |
| **Parâmetros** | Letras;Fluxo;N'Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Realiza o upload de um arquivo. Poderá ser informado o caminho onde será armazenado o 
arquivo, uma regra para efetuar a validação do arquivo a ser enviado e uma possível regra chamada e os parâmetros 
que essa regra poderá receber (caso exista).

Parâmetro(s):
1. Caminho para armazenamento (Caso nulo será armazenado na "Upload" dentro do contexto do Webrun). (Letras)
2. Nome de uma regra cliente para validação (Opcional: Caso nulo, não haverá validação do arquivo antes do envio). (Fluxo)
3. Nome de uma regra (Caso nulo a função realizará apenas o upload do arquivo). (N' Variante)

Retorno:
Não possui.

Observações:
1. A regra chamada no 2º parâmetro pela função "Upload", receberá como parâmetro de entrada uma lista 
(Variante) de arquivos a serem enviados. Esta lista possui informações como: nome do arquivo, tamanho (em bytes) e o tipo do arquivo (se identificado pelo browser).
2.  A regra chamada no 2º parâmetro pela função "Upload", caso seja definida, deverá retornar verdadeiro ou 
falso (Lógico) informando se deve ser permitido ou não o envio do arquivo.
3. A regra chamada no 2º parâmetro deve ser da camada CLIENTE.
4. A regra chamada no 3º parâmetro pela função "Upload", caso seja definida na camada servidor, não pode 
chamar um sub fluxo cliente.
5. A regra chamada no 3º parâmetro pela função "Upload", recebe como parâmetro de entrada o caminho para 
onde foi enviado o arquivo. Para passar parâmetros adicionais, além do enviado automaticamente pelo Webrun, basta 
clicar no botão (com sinal de adição) que se encontra ao lado do nome da função.

### Código Servidor (Java)

```java
protected final Variant ebfUploadFile2(Variant folder, Variant ruleValidation) throws Exception {
  return ebfUploadFile2(folder, ruleValidation, Variant.VARIANT_NULL);
}

protected final Variant ebfUploadFile2(Variant folder, Variant ruleValidation, Variant ruleName) throws Exception {
  return ebfUploadFile2(folder, ruleValidation, ruleName, new Variant[0]);
}

protected final Variant ebfUploadFile2(Variant folder, Variant ruleValidation, Variant ruleName, Variant... params) throws Exception {  
  boolean version1 = "1".equals(getSystem().getAdvancedProperty("VersaoSeguranca"));
  if (version1) {
    WFRSystem system = getSystem();
      
    java.lang.reflect.Method getHtmlUpload = system.getClass().getMethod("getHtmlUpload", (Class[]) null);
    Object htmlUpload = getHtmlUpload.invoke(system);
      
    java.lang.reflect.Method put = htmlUpload.getClass().getMethod("put", String.class);
    folder = VariantPool.get(String.class.cast(put.invoke(htmlUpload, folder.getString())));
  }

  Variant[] paramsVar = new Variant[params.length + 3];
  paramsVar[0] = folder;       
  paramsVar[1] = ruleValidation;
  paramsVar[2] = ruleName;
  for (int i = 0; i < params.length; i++) {
    paramsVar[i + 3] = params[i];
  }

  return callClientFunction("ebfUploadFile2", paramsVar);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfUploadFile2(url, ruleValidation, ruleName) {
  var securityVersion1 = false;
  try { securityVersion1 = (securityVersion == "1"); } catch (e) { }
  if (isNullable(url) || (securityVersion1 && !(/^(\w+-)+\w+$/.test(url)))) url = "";
  if (isNullable(ruleName)) ruleName = "";
  if (isNullable(ruleValidation)) ruleValidation = "";

  var params = "";
  if (arguments.length > 3) {
    for (var i = 3; i < arguments.length; i++) {
      params += ("&P_" + (i - 3) + "=" + URLEncode(arguments[i], "GET"));
    }
  }  

  openRuleUpload(sysCode, idForm, ruleName, url, params, ruleValidation, false);
}
```

---

## Upload Múltiplos Arquivos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUploadMultipleFiles2` |
| **Código** | 931 |
| **Assinatura** | `Upload Múltiplos Arquivos (Letras;Fluxo;N'Variante)` |
| **Parâmetros** | Letras;Fluxo;N'Variante |
| **Tipo** | 14 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Realiza o upload de múltiplos arquivos. Poderá ser informado o caminho que será(ão) armazenado(s) 
o(s) arquivo(s), uma regra para efetuar a validação do arquivo a ser enviado e uma possível regra chamada e os
parâmetros que essa regra poderá receber(caso exista).

Parâmetro(s):
1. Caminho para armazenamento (Caso nulo será armazenado na "Upload" dentro do contexto do Webrun).
2. Nome de uma regra cliente para validação (Caso nulo, não haverá validação do arquivo antes do envio).
3. Nome de uma regra (Caso nulo a função realizará apenas o upload do arquivo).

Retorno:
Não possui.

Observações:
A regra chamada no 2º parâmetro pela função upload, receberá como parâmetro de entrada uma lista (Variante) de
arquivos a serem enviados. Esta lista possui informações como: nome do arquivo, tamanho (em bytes) e o tipo do 
arquivo (se identificado pelo browser).
2.  A regra chamada no 2º parâmetro pela função upload, caso seja definida, deverá retornar verdadeiro ou falso 
(Lógico) informando se deve ser permitido ou não o envio do arquivo.
3. A regra chamada no 2º parâmetro deve ser da camada CLIENTE.
4. A regra chamada no 3º parâmetro pela função upload, caso seja definida na camada servidor, não pode chamar um sub fluxo cliente.
5. A regra chamada no 3º parâmetro pela função upload, recebe como parâmetro de entrada o caminho para onde foi
enviado o arquivo. Para passar parâmetros adicionais, além do enviado automaticamente pelo Webrun, basta clicar no 
botão (com sinal de adição) que se encontra ao lado do nome da função.

### Código Servidor (Java)

```java
protected final Variant ebfUploadMultipleFiles2(Variant folder, Variant ruleValidation) throws Exception {
  return ebfUploadMultipleFiles2(folder, ruleValidation, Variant.VARIANT_NULL);
}

protected final Variant ebfUploadMultipleFiles2(Variant url, Variant ruleValidation, Variant ruleName) throws Exception {
  return ebfUploadMultipleFiles2(url, ruleValidation, ruleName, new Variant[0]);
}  

protected final Variant ebfUploadMultipleFiles2(Variant folder, Variant ruleValidation, Variant ruleName, Variant... params) throws Exception {
  boolean version1 = "1".equals(getSystem().getAdvancedProperty("VersaoSeguranca"));
  if (version1) {
    WFRSystem system = getSystem();
      
    java.lang.reflect.Method getHtmlUpload = system.getClass().getMethod("getHtmlUpload", (Class[]) null);
    Object htmlUpload = getHtmlUpload.invoke(system);
      
    java.lang.reflect.Method put = htmlUpload.getClass().getMethod("put", String.class);
    folder = VariantPool.get(String.class.cast(put.invoke(htmlUpload, folder.getString())));
  } 

  Variant[] paramsVar = new Variant[params.length + 3];
  paramsVar[0] = folder;      
  paramsVar[1] = ruleValidation;
  paramsVar[2] = ruleName;
  for (int i = 0; i < params.length; i++) {
    paramsVar[i + 3] = params[i];
  }    

  return callClientFunction("ebfUploadMultipleFiles2", paramsVar);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfUploadMultipleFiles2(url, ruleValidation, ruleName) {
  var securityVersion1 = false;
  try { securityVersion1 = (securityVersion == "1"); } catch (e) { }
  if (isNullable(url) || (securityVersion1 && !(/^(\w+-)+\w+$/.test(url)))) url = "";
  if (isNullable(ruleName)) ruleName = "";
  if (isNullable(ruleValidation)) ruleValidation = "";

  var params = "";
  if (arguments.length > 3) {
    for (var i = 3; i < arguments.length; i++) {
      params += ("&P_" + (i - 3) + "=" + URLEncode(arguments[i], "GET"));
    }
  }  

  openRuleUpload(sysCode, idForm, ruleName, url, params, ruleValidation, true);
}
```

---

## É Arquivo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsFile` |
| **Código** | 156 |
| **Assinatura** | `É Arquivo? (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se o parâmetro é um arquivo.

Parâmetro:
1. Elemento que será verificado. (Letras)

Retorno: 
Se for arquivo retorna "True", senão retorna "False". (Lógico)

Exemplos: 
1. Assumindo o parâmetro como "C:\Softwell\Maker.txt" (Letras), o retorno seria "True".
2. Assumindo o parâmetro como "C:\Softwell" (Letras), o retorno seria "False".

### Código Servidor (Java)

```java
protected final Variant ebfIsFile(Variant value) throws Exception {
  return new Variant(getWfrFileFunctions().isFile(getSystem(), value.getString()));
}
```

---

## É Diretório/Pasta?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIsDirectory` |
| **Código** | 157 |
| **Assinatura** | `É Diretório/Pasta? (Letras): Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 14 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica se o parâmetro é um diretório/pasta.

Parâmetro:
1. Elemento que será verificado. (Letras)

Retorno: 
Se for diretório retorna "True" e se não for retorna "False". (Lógico)

Observação: 
Caso o diretório/pasta esteja em rede deve-se passar o caminho do diretório na rede e não a unidade mapeada, 
exemplo: \\servidor\softwell.

Exemplos: 
1. Assumindo o parâmetro como C:\Softwell\Maker.txt" (Letras), o retorno seria "False".
2. Assumindo o parâmetro como "C:\Softwell" (Letras), o retorno seria "True".

### Código Servidor (Java)

```java
protected final Variant ebfIsDirectory(Variant value) throws Exception {
  return new Variant(getWfrFileFunctions().isDirectory(getSystem(), value.getString()));
}
```

---

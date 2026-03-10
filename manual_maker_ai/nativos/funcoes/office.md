# Funções Nativas - Office

Total: **26** funções

[← Voltar para Funções Nativas](README.md)

---

## DOCX para PDF

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDocxToPdf` |
| **Código** | 1007 |
| **Assinatura** | `DOCX para PDF (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função converte um arquivo Word (.docx) para PDF.

Parâmetro(s):
1. Caminho do arquivo Word (.docx). (Letras)
2. Caminho para salvar o arquivo PDF. (Letras)

Retorno:
Não possui.

Observação:
O caminho para o salvar o arquivo PDF deve conter o caminho do arquivo juntamente com o nome do arquivo e a extensão.

Exemplo:
Assumindo o 1º Parâmetro como "C:\Program Files\arquivo.docx" e o 2º Parâmetro como "C:\Program Files\arquivo.pdf".

### Código Servidor (Java)

```java
protected final void ebfDocxToPdf(Variant pathDocx, Variant pathPdf) throws Exception {
  java.io.FileInputStream docxFile = null;
  java.io.OutputStream pdfFile = null;
  org.apache.poi.xwpf.usermodel.XWPFDocument doc = null;

  try {
    docxFile = new java.io.FileInputStream(pathDocx.getString());
    java.io.File file = new java.io.File(pathDocx.getString());
    doc = new org.apache.poi.xwpf.usermodel.XWPFDocument(docxFile);
    fr.opensagres.poi.xwpf.converter.pdf.PdfOptions options = fr.opensagres.poi.xwpf.converter.pdf.PdfOptions.create();
    pdfFile = new java.io.FileOutputStream(pathPdf.getString());
    fr.opensagres.poi.xwpf.converter.pdf.PdfConverter.getInstance().convert(doc, pdfFile, options);
  } finally {
    if (doc != null) doc.close();
    if (pdfFile != null) pdfFile.close();
    if (docxFile != null) docxFile.close();
  }
}
```

---

## Excel - Abrir Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenExcel` |
| **Código** | 775 |
| **Assinatura** | `Excel - Abrir Arquivo (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abre um arquivo de acordo o caminho especificado e retorna uma referência para o arquivo.

Parâmetro:
1. Caminho do arquivo. (Letras)

Retorno:
Referência do arquivo. (Variante)

Observação:
A função possui suporte para arquivos Excel 2007 e superior.

Exemplo:
Assumindo o parâmetro como "\\servidor\maquina\diretorio\exemplo.xlsx", o retorno seria uma referência para o arquivo.

### Código Servidor (Java)

```java
protected final Variant ebfOpenExcel (Variant dir) throws Exception {
  return new Variant(WFROffice.openExcel(dir, getSystem()));
}
```

---

## Excel - Atualizar Linha do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExcelUpdateRow` |
| **Código** | 776 |
| **Assinatura** | `Excel - Atualizar Linha do Arquivo (Variante;Variante;Letras;Inteiro;Letras)` |
| **Parâmetros** | Variante;Variante;Letras;Inteiro;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função atualiza uma linha do arquivo de acordo os parâmetros informados.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Lista com os dados a serem atualizados. (Variante)
3. Nome da folha. (Letras, Opcional)
4. Número da linha. (Inteiro)
5. Formatação. (Letras, Opcional) (Ver Observação 6)

Retorno:
Não possui.

Observações:
1. Caso na lista seja passado um parâmetro nulo, a célula referente à este parâmetro não será alterado, desta forma, para atualizar apenas uma ou mais colunas do arquivo, basta passar os demais parâmetros da lista como nulo, ex.: [null, "Softwell", "Maker", null, null], assim, apenas as colunas 2 e 3 serão atualizadas em um linha com cinco colunas.
2. Esta função apenas altera as células em que o parâmetro é passado, diferente da função "Excel - Preencher Arquivo" que substitui a linha inteira por uma nova.
3. O terceiro parâmetro, referente ao nome da folha a ser acessada, é opcional. Caso não passado, o arquivo fará atualização da primeira folha.
4. Após a atualização do arquivo, recomenda-se utilizar a função "Excel - Salvar Arquivo", caso contrário nenhuma mudança será salva.
5. Para inserir data, utilize a função Hoje ou Criar Data sem formatação.
6. O quinto parâmetro formatará uma célula do tipo Data, caso não seja informada a formatação a mesma assumirá o valor "dd/MM/yyyy".

Exemplo:
Assumindo os parâmetros como a referência do arquivo, uma lista com os elementos ["Roger", "2", "", "5"], "Folha 1" e 3, a linha 3 da "Folha 1" será atualizada apenas com os valores passados sem alterar outras células.

### Código Servidor (Java)

```java
protected final Variant ebfExcelUpdateRow(Variant excel, Variant list, Variant sheetName, Variant rowNumber, Variant formatDate) throws Exception {
  wfr.util.WFROffice.excelUpdateRow(excel, list, sheetName, rowNumber, formatDate, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

## Excel - Criar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateExcel` |
| **Código** | 777 |
| **Assinatura** | `Excel - Criar Arquivo (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função cria o arquivo no caminho especificado.

Parâmetro(s):
1. Caminho do arquivo. (Letras)
2. Nome da folha ou Lista de Nomes. (Variante, Opcional)

Retorno:
A referência para o arquivo. (Variante)

Observações:
1. Caso o arquivo já exista, será recriado totalmente em branco.
2. Caso o nome da folha não seja especificado a mesma assumirá o valor "Folha1".

Exemplo:
Assumindo como parâmetro da função o texto "\\servidor\maquina\diretorio\exemplo.xlsx", o retorno será uma referência para o arquivo ?exemplo.xlsx?.

### Código Servidor (Java)

```java
protected final Variant ebfCreateExcel (Variant dir, Variant sheetName) throws Exception {
  return new Variant(WFROffice.createExcel(dir, sheetName, getSystem()));
}
```

---

## Excel - Criar Nova Folha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExcelNewSheet` |
| **Código** | 826 |
| **Assinatura** | `Excel - Criar Nova Folha (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função cria uma nova folha de acordo o(s) valor(es) passado(s) no segundo parâmetro.

Parâmetro(s):
1. Caminho para o arquivo. (Letras)
2. Nome da Folha ou Lista de Nomes. (Variante)

Retorno:
Referência para o arquivo. (Variante)

Observação:
1. Caso já exista uma folha com a mesma descrição uma exceção será lançada.
2. Para que as alteração no arquivo persistam é necessário utilizar a função "Excel - Salvar Arquivo".

### Código Servidor (Java)

```java
protected final Variant ebfExcelNewSheet (Variant file, Variant sheetName) throws Exception{
  return new Variant(WFROffice.createNewSheet(file, sheetName, getSystem()));
}
```

---

## Excel - Deletar Linha do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExcelDeleteRow` |
| **Código** | 778 |
| **Assinatura** | `Excel - Deletar Linha do Arquivo (Variante;Letras;Número;Lógico)` |
| **Parâmetros** | Variante;Letras;Número;Lógico |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função deleta a linha do arquivo.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Nome da folha (Letras, Opcional) (Ver observação 2)
3. Número da linha a ser deletada. (Número)
4. Remover Linha em Branco? (Lógico, Opcional)

Retorno:
Não possui.

Observações:
1. Esta função de alteração deve ser seguida pela função "Excel - Salvar Arquivo", caso contrário as mudanças não serão aplicadas.
2. Caso o nome da folha não seja informado, as alterações serão realizadas na primeira folha do arquivo.
3. Se o quarto parâmetro for verdadeiro a função removerá todas as linhas em branco da folha.

Exemplo:
Assumindo como parâmetro a referência do arquivo e o nome da folha "Folha 1" e o número da linha 3, a função deletará a linha 3 da "Folha 1".

### Código Servidor (Java)

```java
protected final Variant ebfExcelDeleteRow (Variant excel, Variant sheetName, Variant rowNumber, Variant blankRow) throws Exception {
  WFROffice.excelDeleteRow(excel, sheetName, rowNumber, blankRow, getSystem());
  return Variant.VARIANT_NULL;  
}
```

---

## Excel - Ler Dados do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReadExcel` |
| **Código** | 780 |
| **Assinatura** | `Excel - Ler Dados do Arquivo (Variante;Letras;Inteiro;Inteiro;Letras): Variante` |
| **Parâmetros** | Variante;Letras;Inteiro;Inteiro;Letras |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função ler a folha do arquivo passado por parâmetro retornado uma lista de lista com os dados obtidos.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Nome da folha. (Letras, Opcional)
3. Número da linha. (Inteiro, Opcional)
4. Número da coluna. (Inteiro, Opcional)
5. Formatação. (Letras, Opcional) (Ver observação 3)

Retorno:
Lista de lista contendo os dados. (Variante)

Observações:
1. A função sempre retornará uma Lista de Lista, incluindo também as células nulas.
2. Caso o nome da folha não seja informado a mesma assumirá automaticamente a primeira folha como parâmetro.
3. O quinto parâmetros aplica-se apenas para campos do tipo Data, caso não seja preenchido o mesmo assumirá automaticamente o valor "dd/MM/yyyy".

Exemplos:
1. Assumindo como parâmetro a referência do arquivo e o nome da folha "Folha 1", o retorno será uma lista de lista com todos os dados armazenados na "Folha 1" do arquivo.
2. Assumindo como parâmetro a referência do arquivo e o número da linha 1, o retorno será uma matriz com todos os dados armazenados na linha 1 da primeira folha do arquivo.
3. Assumindo como parâmetro a referência do arquivo, o número da linha 3 e o número da coluna 4, o retorno será uma matriz com todos o dado armazenado na linha 3 e coluna 4 na primeira folha do arquivo.

### Código Servidor (Java)

```java
protected final Variant ebfReadExcel (Variant excel, Variant sheetName, Variant rowsNumbers, Variant colsNumbers, Variant formatDate) throws Exception {
  return new Variant(WFROffice.readExcel(excel, sheetName, rowsNumbers, colsNumbers, formatDate, getSystem()));
}
```

---

## Excel - Preencher Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFillExcel` |
| **Código** | 781 |
| **Assinatura** | `Excel - Preencher Arquivo (Variante;Variante;Letras;Inteiro;Letras)` |
| **Parâmetros** | Variante;Variante;Letras;Inteiro;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função preenche o arquivo com os dados passados por parâmetro.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Lista de Lista contendo os dados. (Variante)
3. Nome da folha. (Letras, Opcional)
4. Número da linha. (Inteiro, Opcional)
5. Formatação. (Letras, Opcional) (Ver observação 3)

Retorno:
Não possui.

Observações:
1. O 3º Parâmetro quando não informado assumirá automaticamente a primeira folha como parâmetro.
2. Para que as alterações no arquivo persistam é necessário utilizar a função "Excel - Salvar Arquivo".
3. O 5º Prâmetro aplica-se apenas para campos do tipo Data, caso não seja preenchido o mesmo assumirá automaticamente o valor "dd/MM/yyyy".

Exemplos:
1. Assumindo como parâmetro a referência do arquivo, uma lista de lista com os dados a serem inseridos e o nome da folha "Folha 1", a função preencherá o arquivo com estes dados a partir da primeira linha.
2. Assumindo como parâmetro a referência do arquivo, uma matriz com os dados a serem inseridos e o número da linha 3, a função preencherá o arquivo com estes dados a partir da terceira linha.

### Código Servidor (Java)

```java
protected final Variant ebfFillExcel(Variant excel, Variant list, Variant sheetName, Variant number, Variant formatDate) throws Exception {
  wfr.util.WFROffice.fillExcel(excel, list, sheetName, number, formatDate, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

## Excel - Salvar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSaveExcel` |
| **Código** | 779 |
| **Assinatura** | `Excel - Salvar Arquivo (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função salva as alterações feitas no arquivo.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Diretório em que o arquivo será salvo. (Letras)

Retorno:
Não possui.

Observação:
O diretório passado pode ser o mesmo do arquivo, assim o arquivo será sobrescrito. Caso seja um diretório diferente, um novo arquivo será criado.

Exemplo:
Assumindo como parâmetro a referência para o arquivo e o diretório "\\servidor\maquina\diretorio\exemplo.xlsx", todas as alterações deste arquivo serão salvas no diretório passado.

### Código Servidor (Java)

```java
protected final Variant ebfSaveExcel (Variant excel, Variant dir) throws Exception {
  WFROffice.saveExcel(excel, dir, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

## PDF - Assinar com Certificado Digital

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSignPDF` |
| **Código** | 1034 |
| **Assinatura** | `PDF - Assinar com Certificado Digital (Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função assina um documento PDF com certificado digital.

Parâmetro(s):
1. Caminho do arquivo (PDF de origem). (Letras)
2. Caminho do arquivo (PDF de destino). (Letras)
3. Caminho do arquivo (Certificado Digital). (Letras)
4. Senha do Certificado Digital (Letras)
5. Alias. (Letras)
6. Razão. (Letras)
7. Localização. (Letras)
8. Contato. (Letras)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfSignPDF (
    Variant pdfPath,
    Variant outputPDFPath,
    Variant digitalCertificatePath,
    Variant passwordCertificate,
    Variant aliases,
    Variant reason,
    Variant location,
    Variant contact)
throws Exception {

  String _pdfPath = Functions.getDirectory(getSystem(), pdfPath.getString());
  String _digitalCertificatePath = Functions.getDirectory(getSystem(), digitalCertificatePath.getString());
  String _outputPDFPath = Functions.getDirectory(getSystem(), outputPDFPath.getString());

  // Adiciona o provedor de segurança Bouncy Castle
  java.security.Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());

  // Carrega o certificado digital
  java.security.KeyStore keyStore = java.security.KeyStore.getInstance("PKCS12");
  try (java.io.FileInputStream fis = new java.io.FileInputStream(_digitalCertificatePath)) {
    keyStore.load(fis, passwordCertificate.getString().toCharArray());
  }

  // Obtém o alias do certificado.
  String alias = aliases.getString();
  if (alias.isEmpty())
    alias = keyStore.aliases().nextElement();

  // Obtém a chave privada e o certificado
  java.security.PrivateKey privateKey = (java.security.PrivateKey) keyStore.getKey(
      alias,
      passwordCertificate.getString().toCharArray()
      );

  java.security.cert.Certificate[] chain = keyStore.getCertificateChain(keyStore.aliases().nextElement());
  com.itextpdf.text.pdf.PdfReader reader = new com.itextpdf.text.pdf.PdfReader(_pdfPath);
  java.io.FileOutputStream os = new java.io.FileOutputStream(_outputPDFPath);

  // Cria um novo PdfStamper para assinatura digital
  com.itextpdf.text.pdf.PdfStamper stamper = com.itextpdf.text.pdf.PdfStamper.createSignature(
      reader, os, '\0', null, true);
  com.itextpdf.text.pdf.PdfSignatureAppearance appearance = stamper.getSignatureAppearance();
  appearance.setLocation(location.getString());
  appearance.setReason(reason.getString());
  appearance.setContact(contact.getString());

  // Define o algoritmo de assinatura digital
  com.itextpdf.text.pdf.security.ExternalSignature signature = new com.itextpdf.text.pdf.security.PrivateKeySignature(
      privateKey,
      com.itextpdf.text.pdf.security.DigestAlgorithms.SHA256,
      "BC"
      );

  com.itextpdf.text.pdf.security.MakeSignature.signDetached (
      appearance,
      new com.itextpdf.text.pdf.security.BouncyCastleDigest(),
      signature,
      chain,
      null,
      null,
      null,
      0,
      com.itextpdf.text.pdf.security.MakeSignature.CryptoStandard.CMS
      );
}
```

---

## PDF - Atualizar Metadados do Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUpdateMDToPdf` |
| **Código** | 1038 |
| **Assinatura** | `PDF - Atualizar Metadados do Arquivo (Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras)` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Letras;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função atualiza os metadados do PDF.

Parâmetro(s):
1. Caminho do arquivo (PDF origem). (Letras)
2. Caminho do arquivo (PDF destino). (Letras)
3. Autor. (Letras)
4. Criador. (Letras)
5. Título. (Letras)
6. Sujeito. (Letras)
7. Palavras-Chave. (Letras)
8. Produtor. (Letras)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfUpdateMDToPdf(Variant pdfPath, Variant pdfPathToSave, Variant author, Variant creator,
    Variant title, Variant subject, Variant keyWords, Variant producer) throws Exception {

  com.itextpdf.text.pdf.PdfReader reader = null;
  com.itextpdf.text.pdf.PdfStamper stamper = null;
  com.itextpdf.text.xml.xmp.XmpWriter xmp = null;

  try (java.io.FileOutputStream file = new java.io.FileOutputStream(Functions.getDirectory(getSystem(), pdfPathToSave.getString()));
      java.io.ByteArrayOutputStream byteData = new java.io.ByteArrayOutputStream()
  ) {

    reader = new com.itextpdf.text.pdf.PdfReader(Functions.getDirectory(getSystem(), pdfPath.getString()));
    stamper = new com.itextpdf.text.pdf.PdfStamper(reader, file);
    java.util.HashMap<String, String> data = reader.getInfo();
    data.put("Subject", subject.getString());
    data.put("Title", title.getString());
    data.put("Author", author.getString());
    data.put("Keywords", keyWords.getString());
    data.put("Creator", creator.getString());
    data.put("Producer", producer.getString());
    stamper.setMoreInfo(data);
    xmp = new com.itextpdf.text.xml.xmp.XmpWriter(byteData, data);
    stamper.setXmpMetadata(byteData.toByteArray());
  } finally {
    if (xmp !=  null)
      xmp.close();

    if (stamper != null)
      stamper.close();
  }
}
```

---

## PDF - Deletar Metadados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDeleteMDPDF` |
| **Código** | 1036 |
| **Assinatura** | `PDF - Deletar Metadados (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função deleta os metadados de um PDF.

Parâmetro(s):
1. Caminho do arquivo (PDF - Origem). (Letras)
2. Caminho do arquivo (PDF - Destino). (Letras)

Retorno:
Objeto JSON (Variante).

### Código Servidor (Java)

```java
protected final void ebfDeleteMDPDF(Variant pdfPath, Variant pdfPathToSave) throws Exception {
  com.itextpdf.text.pdf.PdfReader reader = null;
  com.itextpdf.text.pdf.PdfStamper stamper = null;
  java.io.FileOutputStream file = new java.io.FileOutputStream(
      Functions.getDirectory(getSystem(), pdfPathToSave.getString())
  );

  try {
    reader = new com.itextpdf.text.pdf.PdfReader(
        Functions.getDirectory(getSystem(), pdfPath.getString())
    );
    
    stamper = new com.itextpdf.text.pdf.PdfStamper(reader, file);
    java.util.HashMap<String, String> data = reader.getInfo();
    data.put("Subject", null);
    data.put("Title", null);
    data.put("Keywords", null);
    data.put("Creator", null);
    data.put("Producer", null);
    stamper.setMoreInfo(data);

    reader.getCatalog().remove(com.itextpdf.text.pdf.PdfName.METADATA);
    reader.removeUnusedObjects();
  } finally {
    if (stamper != null && reader != null && file != null) {
      stamper.close();
      reader.close();
      file.close();
    }
  }
}
```

---

## PDF - Extrair Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExtractPdfText` |
| **Código** | 1020 |
| **Assinatura** | `PDF - Extrair Texto (Letras;Inteiro): Letras` |
| **Parâmetros** | Letras;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função extrai o texto de uma página de um arquivo PDF.

Parâmetro(s):
1. Caminho do arquivo. (Letras)
2. Número da página. (Inteiro)

Retorno:
Texto contendo o conteúdo da página. (Letras)

Observação:
Os caminhos dos arquivos informados devem conter a extensão arquivo .pdf.

### Código Servidor (Java)

```java
protected final Variant ebfExtractPdfText(Variant pdfPath, Variant pageNumber) throws Exception {
  com.itextpdf.text.pdf.PdfReader reader = new com.itextpdf.text.pdf.PdfReader(
      Functions.getDirectory(getSystem(), pdfPath.getString())
  );

  String text = com.itextpdf.text.pdf.parser.PdfTextExtractor.getTextFromPage(
      reader,
      Integer.parseInt(pageNumber.getString())
  );

  return VariantPool.get(text);
}
```

---

## PDF - Inserir Metadados Customizados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInsertCustomMdToPdf` |
| **Código** | 1037 |
| **Assinatura** | `PDF - Inserir Metadados Customizados (Letras;Letras;Variante)` |
| **Parâmetros** | Letras;Letras;Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função insere metadados  customizados ao arquivo PDF.

Parâmetro(s):
1. Caminho do arquivo.(PDF - Origem) (Letras)
2. Caminho do arquivo.(PDF - Destino) (Letras) 
3. Propriedades customizadas.(JSON). (Variante) Ver observação 1

Retorno:
Não possui.

Observações:
1. As propriedades customizadas trata-se de um json contendo a chave(o nome da propriedade desejada) e o valor da propriedade.
Ex: {"softwell":"2007"}. 
1. Deve-se utilizar a função "JSON - Criar Objeto".

### Código Servidor (Java)

```java
protected final void ebfInsertCustomMdToPdf(Variant pdfSource, Variant pdfTarget, Variant customProperty) throws Exception {
  com.itextpdf.text.xml.xmp.XmpWriter xmp = null;
  com.itextpdf.text.pdf.PdfReader reader = new com.itextpdf.text.pdf.PdfReader(
      Functions.getDirectory(getSystem(), pdfSource.getString()));

  com.itextpdf.text.pdf.PdfStamper stamper = new com.itextpdf.text.pdf.PdfStamper(reader,
      new java.io.FileOutputStream(Functions.getDirectory(getSystem(), pdfTarget.getString())));

  jakarta.json.JsonObject customPropJson = (jakarta.json.JsonObject) customProperty.getObject();
  java.util.Map<String, String> infoData = new java.util.HashMap<>();
  for (String key : customPropJson.keySet()) {
    String value = customPropJson.getString(key.toString());
    infoData.put(key.toString(), value.toString());
  }

  stamper.setMoreInfo(infoData);
  try (com.itextpdf.io.source.ByteArrayOutputStream baos = new com.itextpdf.io.source.ByteArrayOutputStream()) {
    xmp = new com.itextpdf.text.xml.xmp.XmpWriter(baos, infoData);
    stamper.setXmpMetadata(baos.toByteArray());
  } finally {
    if (xmp != null)
      xmp.close();

    if (stamper != null)
      stamper.close();
  }
}
```

---

## PDF - Juntar PDF

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJoinPDF` |
| **Código** | 1018 |
| **Assinatura** | `PDF - Juntar PDF (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função junta dois ou mais arquivos no formato PDF.

Parâmetro(s):
1. Lista contendo o caminho de cada arquivo. (Variante)
2. Caminho para salvar o novo arquivo criado. (Letras)

Retorno:
Não possui.

Observação:
A sequência com os caminhos dos arquivos na lista serão os mesmo no arquivo gerado como saída.

Exemplo:
Assumindo no 1º Parâmetro uma lista contendo os arquivos [C:/arquivo1.pdf, C:/arquivo2.pdf ], será gerado um novo arquivo com conteúdo do arquivo1.pdf e arquivo2.pdf em sequência.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final void ebfJoinPDF(Variant files,  Variant destination) throws Exception {
  com.itextpdf.text.Document doc =  null;
  try (java.io.FileOutputStream outputStream  = new java.io.FileOutputStream(Functions.getDirectory(getSystem(), destination.getString()))) {
    List<Variant> filesList = (List<Variant>) files.getObject();
    doc = new com.itextpdf.text.Document();
    com.itextpdf.text.pdf.PdfCopy copy = new com.itextpdf.text.pdf.PdfCopy(doc, outputStream);
    doc.open();
    for (Object file : filesList) {
      com.itextpdf.text.pdf.PdfReader pdfReader = new com.itextpdf.text.pdf.PdfReader(new java.io.FileInputStream(Functions.getDirectory(getSystem(), file.toString())));
      for (int i = 1; i <= pdfReader.getNumberOfPages(); i++) {
        com.itextpdf.text.pdf.PdfImportedPage page = copy.getImportedPage(pdfReader, i);
        copy.addPage(page);
      }

      pdfReader.close();
    }
  } finally {
    if(doc != null) {
      doc.close();
    }
  }
}
```

---

## PDF - Obter Metadados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetMetaDataPDF` |
| **Código** | 1138 |
| **Assinatura** | `PDF - Obter Metadados (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função obtêm o metadado de um PDF.

Parâmetro(s):
1. Caminho do arquivo (PDF). (Letras)

Retorno:
Objeto JSON (Variante).

### Código Servidor (Java)

```java
protected final Variant ebfGetMetaDataPDF(Variant pdfPath) throws Exception {
  com.itextpdf.text.pdf.PdfReader reader = new com.itextpdf.text.pdf.PdfReader(
      Functions.getDirectory(getSystem(), pdfPath.getString())
  );

  Map<String, String> metadata = reader.getInfo();
  String json = new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(metadata);
  jakarta.json.JsonReader jsonReader = jakarta.json.Json.createReader(new java.io.StringReader(json));
  jakarta.json.JsonObject jsonObj = jsonReader.readObject();
  reader.close();
  return VariantPool.get(jsonObj);
}
```

---

## PDF - Obter Número de Páginas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCountPDFPages` |
| **Código** | 1039 |
| **Assinatura** | `PDF - Obter Número de Páginas (Letras): Inteiro` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna o número de páginas de um PDF.

Parâmetro(s):
1. Caminho do arquivo (PDF). (Letras)

Retorno:
Número de páginas (Inteiro).

### Código Servidor (Java)

```java
protected final Variant ebfCountPDFPages(Variant pdfPath) throws Exception{
  com.itextpdf.text.pdf.PdfReader reader = new com.itextpdf.text.pdf.PdfReader(
      Functions.getDirectory(getSystem(), pdfPath.getString())
  );

  int numPages = reader.getNumberOfPages();
  reader.close();

  return VariantPool.get(numPages);
}
```

---

## PDF - Remover Página

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemovePagePDF` |
| **Código** | 1019 |
| **Assinatura** | `PDF - Remover Página (Letras;Letras;Variante)` |
| **Parâmetros** | Letras;Letras;Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função remove uma página de um arquivo PDF.

Parâmetro(s):
1. Caminho do arquivo. (Letras) (Ver observação 1)
2. Caminho do novo arquivo que será salvo com a página removida. (Letras) (Ver observação 1)
3. Lista contendo o número das páginas a serem removidas. (Variante) (Ver observação 2)

Retorno:
Não possui.

Observação:
1.Os caminhos dos arquivos informados devem conter a extensão arquivo .pdf.
2. Lista contendo o número das páginas, recomenda-se utilizar a função "Criar Lista a partir dos Elementos".

Exemplo:
Assumindo o caminho do arquivo referência como "C:/arquivo1.pdf" e o caminho do novo arquivo como "C:/arquivo2.pdf" e o número da página como "1", o ?arquivo2.pdf? será salvo com a página removida.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final void ebfRemovePagePDF(Variant source, Variant destination, Variant pageToRemove) throws Exception {
  com.itextpdf.kernel.pdf.PdfDocument pdfDocument = null;
  java.util.ArrayList<Object> pagesToRemove = null;

  if (pageToRemove.getObject() instanceof java.util.List) {
    pagesToRemove = (java.util.ArrayList<Object>) pageToRemove.getObject();
    java.util.Comparator<Object> comparator = java.util.Collections.reverseOrder();
    java.util.Collections.sort(pagesToRemove, comparator);
  }

  try {
    pdfDocument = new com.itextpdf.kernel.pdf.PdfDocument(new com.itextpdf.kernel.pdf.PdfReader(
        Functions.getDirectory(getSystem(), source.getString())),
        new com.itextpdf.kernel.pdf.PdfWriter(
            Functions.getDirectory(getSystem(), destination.getString())
            )
    );

    if (pagesToRemove != null) {
      for (int i = 0; i < pagesToRemove.size(); i++) {
        pdfDocument.removePage(Integer.parseInt(pagesToRemove.get(i).toString()));
      }
    }
  } finally {
    if (pdfDocument != null) {
      pdfDocument.close();
    }
  }
}
```

---

## Word - Abrir Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenDocumentWord` |
| **Código** | 802 |
| **Assinatura** | `Word - Abrir Arquivo (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Abri um arquivo retornando sua referência.

Parâmetro:
1. Diretório do arquivo. (Letras)

Retorno:
Referência para o arquivo. (Variante)

Observação:
Essa função possui suporte a versões do Word 2007 ou superior.

### Código Servidor (Java)

```java
protected final Variant ebfOpenDocumentWord (Variant dir) throws Exception {  
  return new Variant(WFROffice.openDocumentWord(dir, getSystem()));
}
```

---

## Word - Criar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateDocumentWord` |
| **Código** | 803 |
| **Assinatura** | `Word - Criar Arquivo (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função cria um novo arquivo retornando a referência do mesmo.

Parâmetro(s):
1. Diretório para criação. (Letras)

Retorno:
Referência do arquivo. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfCreateDocumentWord (Variant dir) throws Exception {
  return new Variant(WFROffice.createDocumentWord(dir, getSystem()));
}
```

---

## Word - Criar Parágrafo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateParagraphDocumentWord` |
| **Código** | 806 |
| **Assinatura** | `Word - Criar Parágrafo (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função cria um novo parágrafo para o arquivo.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Texto. (Letras)

Retorno:
Não possui.

Observação:
Para que as alterações no arquivo entre em vigor é necessário utilizar a função "Word - Salvar Arquivo".

### Código Servidor (Java)

```java
protected final Variant ebfCreateParagraphDocumentWord (Variant word, Variant text) throws Exception {
  WFROffice.createParagraphDocumentWord(word, text, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

## Word - Criar Tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateWordTable` |
| **Código** | 807 |
| **Assinatura** | `Word - Criar Tabela (Variante;Variante)` |
| **Parâmetros** | Variante;Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria uma tabela no arquivo.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Lista de lista com os dados. (Variante)

Retorno:
Não possui.

Observação:
Para que as alterações do arquivo entre em vigor é necessário utilizar a função "Word - Salvar Arquivo".

### Código Servidor (Java)

```java
protected final Variant ebfCreateWordTable (Variant word, Variant allCells) throws Exception {
  WFROffice.createWordTable(word, allCells, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

## Word - Ler Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReadDocumentWord` |
| **Código** | 804 |
| **Assinatura** | `Word - Ler Arquivo (Variante;Inteiro): Letras` |
| **Parâmetros** | Variante;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função realiza a leitura de um arquivo passado como parâmetro retornando seu conteúdo.

Parâmetro(s):
1. Referência do arquivo. (Variante)
2. Linha do arquivo. (Inteiro, Opcional)

Retorno:
Conteúdo do arquivo. (Letras)

Observações:
1. Essa função possui suporte para arquivos Word 2007 ou superior.
2. Caso o 2º Parâmetro não seja informado, todo o arquivo será lido.

### Código Servidor (Java)

```java
protected final Variant ebfReadDocumentWord (Variant word, Variant paragraphNumber) throws Exception {
  return new Variant(WFROffice.readDocumentWord(word, paragraphNumber, getSystem())); 
}
```

---

## Word - Ler Tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReadWordTable` |
| **Código** | 808 |
| **Assinatura** | `Word - Ler Tabela (Variante;Inteiro;Inteiro;Inteiro): Variante` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Inteiro |
| **Retorno** | Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Ler toda tabela ou somente uma linha da tabela de acordo com os parâmetros passados.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Número da linha. (Inteiro, Opcional)
3. Número da coluna. (Inteiro, Opcional)
4. Número da Tabela. (Inteiro, Opcional) 

Retorno:
Lista de conteúdo. (Variante)

Observação:
O 4º Parâmetro refere-se ao número de tabelas existente no arquivo, ou seja se existir duas tabelas no arquivo ao ser informado o número 2, será retornado o conteúdo da segunda tabela. Caso não seja informado nenhum valor, será retornado o conteúdo da primeira tabela.

### Código Servidor (Java)

```java
protected final Variant ebfReadWordTable (Variant word, Variant rowNumber, Variant colNumber, Variant tableNumber) throws Exception {
  return new Variant(WFROffice.readWordTable(word, rowNumber, colNumber, tableNumber, getSystem()));
}
```

---

## Word - Mala Direta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWordDirectMail` |
| **Código** | 809 |
| **Assinatura** | `Word - Mala Direta (Letras;Letras;Variante)` |
| **Parâmetros** | Letras;Letras;Variante |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função manipula arquivos do Word executando uma atualização no mesmo de acordo com as informações passadas por parâmetros.
Como em uma Mala Direta, informando um arquivo de entrada padronizado com as informações a serem substituídas, será gerado um arquivo de saída com as modificações requeridas.

Parâmetro(s):
1. Caminho do Arquivo de Entrada. (Letras)
2. Caminho do Arquivo de Saída. (Letras)
3. Lista de Lista contendo o texto a ser encontrado e o texto a ser substituído. (Variante)

Retorno:
Não possui.

Observação:
No 3º Parâmetro será passado uma Lista contendo uma ou mais Listas com 2 elementos cada, o primeiro elemento deve ser
o texto a ser encontrado/substituído e o segundo elemento deve ser o texto a ser inserido no índice encontrado.

### Código Servidor (Java)

```java
protected final Variant ebfWordDirectMail(Variant pathDocIn, Variant pathDocOut, Variant list) throws Exception {
  WFROffice.wordDirectMail(pathDocIn, pathDocOut, list, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

## Word - Salvar Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSaveDocumentWord` |
| **Código** | 805 |
| **Assinatura** | `Word - Salvar Arquivo (Variante;Letras)` |
| **Parâmetros** | Variante;Letras |
| **Tipo** | 40 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função salva as alterações feitas no arquivo.

Parâmetro(s):
1. Referência para o arquivo. (Variante)
2. Diretório em que o arquivo será salvo. (Letras)

Observação:
O diretório passado pode ser o mesmo do arquivo, assim o arquivo será sobrescrito. Caso seja um diretório diferente, um novo arquivo será criado.

Exemplo:
Assumindo como parâmetro a referência para o arquivo e o diretório "\\servidor\maquina\diretorio\exemplo.docx", todas as alterações deste arquivo serão salvas no diretório passado.

### Código Servidor (Java)

```java
protected final Variant ebfSaveDocumentWord (Variant word, Variant dir) throws Exception{
  WFROffice.saveDocumentWord(word, dir, getSystem());
  return Variant.VARIANT_NULL;
}
```

---

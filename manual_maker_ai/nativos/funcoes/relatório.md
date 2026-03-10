# Funções Nativas - Relatório

Total: **8** funções

[← Voltar para Funções Nativas](README.md)

---

## Abrir Relatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenReport` |
| **Código** | 66 |
| **Assinatura** | `Abrir Relatório (Letras;Lógico;Letras;Letras)` |
| **Parâmetros** | Letras;Lógico;Letras;Letras |
| **Tipo** | 13 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Esta função abre um determinado relatório podendo este estar ou não filtrado, a depender do parâmetro 
passado. Se for filtrado, o segundo parâmetro deve receber valor lógico "verdadeiro" e no terceiro parâmetro 
deve ter o filtro. Se não for filtrado, o segundo parâmetro deve ter valor lógico "falso" e o terceiro não deve 
ser preenchido.

Parâmetro(s):
1. Nome do relatório que será aberto. (Letras)
2. Para abrir filtrado, "verdadeiro", caso contrário, "falso". (Opcional, Lógico)
3. Filtro personalizado a ser passado. (Letras, Opcional)
4. Título da Janela. (Letras, Opcional)

Retorno:
Não possui.

Observações:
1. O 2º Parâmetro que recebe "verdadeiro" ou "falso" indica se o relatório deve ser filtrado pelo 
formulário que o abre. Para casos em que os campos do filtro coincidem com campos presentes na consulta 
do formulário. Exemplo: se o relatório tiver um filtro chamado "PES_COD" e esse campo estiver presente na 
consulta do formulário chamador, o relatório resultante será filtrado pelo valor corrente do campo em questão.
2. Caso o relatório tenha sido feito pelo gerador de relatórios legado (RB7), o filtro do terceiro parâmetro deve 
ser montado com a seguinte sintaxe: <campo>=<valor>[;<campo>=<valor>[;...]].
Exemplo: PES_UF=BA; PES_CIDADE=4. Também pode usar uma lista com tamanho par, onde os índices 
ímpares são os nomes dos campos e os pares são os valores. O valor do campo utilizado nesse parâmetro 
sobrepõe o valor do campo que coincidir com a consulta do formulário, conforme explicado no segundo 
parâmetro.
2.1. Caso o relatório tenha sido feito pelo RB10, deve ser utilizado o nome do parâmetro definido no critério da 
consulta.
3. Caso o relatório possua o filtro between (Entre), deve ser utilizada ao fim a expressão _copy (em 
minúsculo).

Exemplo:
Assumindo como parâmetros o nome do relatório "Cidade" (Letras), a opção de filtro "verdadeiro" (Lógico) e o 
filtro "cidade=Salvador", o resultado seria a abertura do relatório "Cidade" somente onde o campo Cidade 
fosse Salvador.

### Código Servidor (Java)

```java
protected final Variant ebfOpenReport(Variant reportID) throws Exception {
    return ebfOpenReport(reportID, Variant.VARIANT_TRUE, Variant.VARIANT_STRING_EMPTY);
  }
  protected final Variant ebfOpenReport(Variant reportID, Variant useForm, Variant filter) throws Exception {
    String openReport = "$mainform().openWFRReport2('" + client.getSystem().getCode() + "', '" + reportID.getString() + "', '" + fields.getForm().getCode() + "', '" + reportID.getString() + "', " +useForm.getBoolean() + ", '"+filter.getString()+"');";
    client.command(openReport);
    return Variant.VARIANT_NULL;
  }  
  protected final Variant ebfOpenReport(Variant reportID, Variant useForm, Variant filter, Variant windowTitle) throws Exception {
    String openReport = "$mainform().openWFRReport2('" + client.getSystem().getCode() + "', '" + reportID.getString() + "', '" + fields.getForm().getCode() + "', '" + windowTitle.getString() + "', " +useForm.getBoolean() + ", '"+filter.getString()+"');";
    client.command(openReport);
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfOpenReport(reportID, useForm, filter, title) {
  openWFRReport2(sysCode, reportID, idForm, title?title:reportID, useForm, filter);
}
```

---

## Abrir Relatório Imediatamente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenReportInline` |
| **Código** | 169 |
| **Assinatura** | `Abrir Relatório Imediatamente (Letras;Letras;Letras;Lógico;Lógico)` |
| **Parâmetros** | Letras;Letras;Letras;Lógico;Lógico |
| **Tipo** | 13 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Abre um relatório, passado no 1º parâmetro, sem desviar para uma tela ou perguntar por parâmetros.

Parâmetro(s):
1. Código/Nome do Relatório. (Letras)
2. Parâmetros do Relatório. (Letras)
3. Tipo do relatório gerado (PDF, HTM, JPG, XLS, TXT, SCR). (Letras)
4. Abrir em uma nova janela? (Lógico)
5. Usar o gerador local? (Lógico)

Retorno:
Não possui.

Observações: 
1. O tipo SCR que pode ser informado no 3º parâmetro desta função está relacionado a abertura do relatório 
em tela.
2. Caso o relatório tenha sido criado no Report Builder 7 (Gerador de Relatórios legado), o filtro funciona da 
seguinte forma: CAMPO=valor
3. Caso o relatório tenha sido criado no Report Builder 10, o filtro deve ser o nome do parâmetro definido no 
critério da consulta: PARAMETRO=valor.
4. Caso queira definir vários parâmetros, basta separá-los por ponto e vírgula(;). Exemplo: 
PARAMETRO1=valor;PARAMETRO2=valor2.
5. Caso o relatório tenha sido criado no Report Builder 7, o filtro between (Entre), deve ser utilizada ao fim a 
expressão _copy. Exemplo: CAMPO=valor ; CAMPO_copy = valor. As datas devem ser separadas por ponto 
e vírgula e o copy deve ser todo minúsculo.
6. Caso o relatório tenha sido criado no Report Builder 10, basta passar os parâmetros inicial e final 
separados por ponto e vírgula.

### Código Servidor (Java)

```java
protected final Variant ebfOpenReportInline(Variant reportIDVar, Variant paramsVar, Variant typeVar, Variant popupVar, Variant localVar) throws Exception {
  if ((getSystem().getReport(reportIDVar.getString(), connection) instanceof wfr.com.WFRMakerReport)) {  
    callClientFunction("ebfOpenReportInline", reportIDVar, new Variant("GUID=" + wfr.sys.WFRLoader.errorMessagesManager.put(paramsVar.getString())), typeVar, popupVar, localVar);
  } else {  
    callClientFunction("ebfOpenReportInline", reportIDVar, paramsVar, typeVar, popupVar, localVar);
  }
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfOpenReportInline(reportID, params, type, popup, local) {
  url = "wfrcore";
  url += "?action=reportOpenExternal&Order=";
  url += "&localreport=" + (local?"ON":"OFF");
  url += "&nopopup=" + (!popup?"true":"false");
  url += "&sys=" + sysCode;
  url += "&reportID=" + URLEncode(reportID, "GET");
  url += "&exptype=" + type;
  url += "&callfunction=true"  
  params = URLEncode(params, "GET");
  if (params != null) {                             
    url += ("&" + params.replace(/%3B/g,"&").replace(/%3D/g,'='));
  }
  IframeTransporter(url);
}
```

---

## Abrir Relatório Imediatamente com Ordenação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenReportInlineOrder` |
| **Código** | 326 |
| **Assinatura** | `Abrir Relatório Imediatamente com Ordenação(Letras;Letras;Letras;Letras;Letras;Lógico;Lógico);` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Lógico;Lógico |
| **Tipo** | 13 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Abre um relatório passado no 1º parâmetro com ordenação, sem desviar para uma tela ou perguntar por 
parâmetros.

Parâmetro(s):
1. Código/Nome do Relatório. (Letras)
2. Parâmetros do Relatório. (Letras)
3. Ordenação do Relatório. (Letras)
4. Tipo do relatório a ser gerado (PDF, HTM, JPG, XLS, TXT, SCR). (Letras)
5. Abrir em uma nova janela? (Lógico)
6. Usar o gerador local? (Lógico)

Retorno:
Não possui.

Observações:
1. A ordenação deve estar no formato: tabela.campo1|[0|1][;tabela.campo2|[0|1][;tabela.campoN|[0|1]]], sendo: 
"0" descendente e "1" ascendente. (Opcional) Exemplo: pessoa.cod_pessoa|1;pessoa.nome|0
2. Caso o relatório tenha sido criado pelo gerador de relatórios legado (Report Builder 7), o filtro funciona a 
partir do campo. Exemplo: CAMPO=valor;
3. Caso o relatório tenha sido criado pelo Report Builder 10, o filtro funciona a partir do nome do parâmetro 
definido no critério da consulta do relatório. Exemplo: PARAMETRO=valor;
4. O filtro a ser passado no 2° parâmetro deve existir no relatório.
5. Caso o relatório no Report Builder 7 possua o filtro between (Entre), deve ser utilizada ao fim a expressão 
_copy. Exemplo: Data_Pagamento_copy=14/11/1987,14/11/2009. As datas devem ser separadas por vírgula 
e o copy deve ser todo minúsculo.

### Código Servidor (Java)

```java
protected final Variant ebfOpenReportInlineOrder(Variant reportIDVar, Variant paramsVar, Variant orderVar, Variant typeVar, Variant popupVar, Variant localVar) throws Exception {
  callClientFunction("ebfOpenReportInlineOrder", reportIDVar, new Variant("GUID=" + WFRLoader.errorMessagesManager.put(paramsVar.getString())), orderVar, typeVar, popupVar, localVar);
  return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfOpenReportInlineOrder(reportID, params, order, type, popup, local) {
  url = "wfrcore";
  url += "?action=reportOpenExternal&Order="+URLEncode(order, "GET");
  url += "&localreport=" + (local?"ON":"OFF");
  url += "&nopopup=" + (!popup?"true":"false");
  url += "&sys=" + sysCode;
  url += "&reportID=" + URLEncode(reportID, "GET");
  url += "&exptype=" + type; 
  url += "&callfunction=true";
  params = URLEncode(params, "GET");
  if (params != null) {
    url += ("&" + params.replace(/%3B/g,"&").replace(/%3D/g,'='));
  }
  IframeTransporter(url);
}
```

---

## Exibir Mensagem de Impressão de Relatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfShowMainMessage` |
| **Código** | 941 |
| **Assinatura** | `Exibir Mensagem de Impressão de Relatório (Letras): Variante` |
| **Parâmetros** | Letras |
| **Tipo** | 13 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Exibe uma mensagem de impressão de relatório.

Parâmetro:
1. Mensagem. (Letras)

Retorno:
Não possui.

Observação:
Essa função deve ser utilizada antes das funções de "Abrir Relatório Imediatamente" ou "Abrir relatório imediatamente com ordenação".

Exemplo:
Assumindo como 1º Parâmetro "O relatório está sendo gerado...", tal mensagem será exibida antes do relatório 
ser gerado.

### Código Servidor (Java)

```java
protected final Variant ebfShowMainMessage(Variant msg) throws Exception {
    callClientFunction("ebfShowMainMessage", msg);
    return Variant.VARIANT_NULL;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfShowMainMessage(msg) {
  showMainMessage(msg, null);
}
```

---

## Gerar Relatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReportGeneration` |
| **Código** | 281 |
| **Assinatura** | `Gerar Relatório (Letras, Letras, Letras, Letras) : Letras` |
| **Parâmetros** | Letras;Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 13 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Gera o relatório solicitado sendo que o mesmo não será impresso na tela do usuário.
Após criado o relatório, a função retornará o caminho absoluto do arquivo gerado.

Parâmetro(s):
1. Nome ou código do relatório a ser gerado. (Letras)
2. Tipo do relatório a ser gerado. (Letras)
3. Filtro a ser executado no relatório a ser gerado. Para mais de um filtro, separe com ponto e vírgula (;). (Letras)
4. Ordenação do relatório a ser gerado. (Letras)

Retorno: 
Caminho absoluto do arquivo gerado. (Letras)

Observações:
1. Caso o relatório tenha sido feito no RB7, deve ser utilizado o filtro no formato tabela.campo=valor.
2. No caso de gerar um relatório RB10, os parâmetros devem ser utilizados no formato nome_do_parametro=valor.
3. Caso o relatório possua o filtro between (Entre), deve ser utilizada ao fim a expressão _copy.
    Ex: Data_Pagamento_copy=14/11/1987,14/11/2009;
    As datas devem ser separadas por vírgula e o copy deve ser todo minúsculo.
4. Ao utilizar Servidor de Relatórios, esta função não pode ser utilizada no Agendador de Tarefas. Neste caso, utilize a função "Gerar Relatório - Servidor Externo".
5. Caso esteja utilizando essa função após o uso da função Executar Atualização no mesmo fluxo, deve-se utilizar as funções "Transação: Abrir e Transação: Commit" juntamente com "Executar Atualização". Deste modo, a ordem de execução do fluxo ficará da seguinte forma:
	Transação: Abrir -> Executar Atualização -> Transação: Commit -> Gerar Relatório.
6. No 4° Parâmetro, defina "1" para ascendente e "0" para descendente. Separe com pipe (barra vertical), vide 
exemplo. 

Exemplo:
Assumindo os parâmetros como:
Parâmetro 1: Relatório de Teste
Parâmetro 2: PDF, HTM, SCR (Tela), TXT, XLS, RTF
Parâmetro 3: CIDADE.NOME=Salvador;CIDADE.UF=BA (RB7) | cidade=Salvador;estado=BA (RB10)
Parâmetro 4: CIDADE.NOME|0;CIDADE.UF|1

### Código Servidor (Java)

```java
protected final Variant ebfReportGeneration(Variant reportName, Variant reportType, Variant filter, Variant sort) throws Exception {
  wfr.com.WFRReport report = manager.getSys().getReport(reportName.toString(), connection);
  java.io.PrintWriter out = new java.io.PrintWriter(new java.io.StringWriter());

  wfr.sys.HTMLInterface.HTMLReport htmlReport = new wfr.sys.HTMLInterface.HTMLReport(null, client.getData(), report, out);    

  String absoluteFilePath = htmlReport.createReport(htmlReport.parseParams(filter.toString().trim()), "Sort=" + sort.toString().trim(), reportType.toString().trim(),
      connection.getSessionID(), wfr.com.WFRSystem.DEFAULT_USER, manager.getSys().getCode(), false, true, (request != null ? Functions.getURL(request) : ""), false);

  return VariantPool.get(absoluteFilePath);
}
```

---

## Gerar Relatório - Servidor Externo (ReportServer)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReportGenerationExternalServer` |
| **Código** | 434 |
| **Assinatura** | `Gerar Relatório - Servidor Externo (Letras, Letras, Letras, Letras,Letras) : Letras` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 13 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Gera o relatório solicitado sendo que o mesmo não será impresso na tela do usuário.
Após criado o relatório, a função retornará o caminho absoluto do arquivo gerado.

Parâmetro(s):
1. Nome ou código do relatório a ser gerado. (Letras)
2. Tipo do relatório a ser gerado. (Letras)
3. Filtro a ser executado no relatório a ser gerado. Para mais de um filtro, separe com ponto e vírgula (;). (Letras)
4. Ordenação do relatório a ser gerado. (Letras)
5. URL do servidor. (Letras)

Retorno: 
Caminho absoluto do arquivo gerado. (Letras)

Observações:
1. No caso de gerar um relatório RB10, os parâmetros devem ser utilizados no formato nome_do_parametro=valor.
2. No 5º Parâmetro, deverá ser informado a URL do servidor da aplicação que receberá o retorno do relatório (PDF, XLS, 
JPG e etc) enviado pelo ReportServer (Servidor de relatório). É necessário definir a barra final. Exemplo: http://192.168.0.1:8080/webrun/.
3. Caso esteja utilizando essa função após o uso da função "Executar Atualização" no mesmo fluxo, deve-se utilizar as funções "Transação: Abrir e Transação: Commit" juntamente com "Executar Atualização". Deste modo, a ordem de execução do fluxo ficará da seguinte forma:
	Transação: Abrir -> Executar Atualização -> Transação: Commit -> Gerar Relatório.
4. No 4° Parâmetro, defina 1 para ascendente e 0 para descendente. Separe com pipe (barra vertical), vide exemplo. 

Exemplo:
Assumindo os parâmetros como:
Parâmetro 1: Relatório de Teste
Parâmetro 2: PDF, HTM, SCR (Tela), TXT, XLS, RTF
Parâmetro 3: CIDADE.NOME=Salvador;CIDADE.UF=BA (RB7) | cidade=Salvador;estado=BA 
Parâmetro 4: CIDADE.NOME|0;CIDADE.UF|1

### Código Servidor (Java)

```java
protected final Variant ebfReportGenerationExternalServer(Variant reportName, Variant reportType, Variant filter, Variant sort, Variant serverURL) throws Exception {
    wfr.com.WFRReport report = manager.getSys().getReport(reportName.toString(), connection);
    java.io.PrintWriter out = new java.io.PrintWriter(new java.io.StringWriter());

    wfr.sys.HTMLInterface.HTMLReport htmlReport = new wfr.sys.HTMLInterface.HTMLReport(null, client.getData(), report, out);

    String absoluteFilePath = htmlReport.createReport(htmlReport.parseParams(filter.toString().trim()), "Sort=" + sort.toString().trim(), reportType.toString().trim(),
        connection.getSessionID(), wfr.com.WFRSystem.DEFAULT_USER, manager.getSys().getCode(), false, true, serverURL.getTrimString(), false);

    return VariantPool.get(absoluteFilePath);
  }
```

---

## Jasper - Gerar Relatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfJasperGenerateReport` |
| **Código** | 700 |
| **Assinatura** | `Jasper - Gerar Relatório (Letras;Letras;Variante;Letras;Lógico;Lógico;Variante;Letras)` |
| **Parâmetros** | Letras;Letras;Variante;Letras;Lógico;Lógico;Variante;Letras |
| **Tipo** | 13 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função gera um arquivo de saída a partir de um relatório Jasper (JRXML).

Parâmetro(s):
1. Caminho para o arquivo JRXML. (Letras) (Ver observação 1)
2. Caminho para o arquivo de saída. (Letras) (Ver observação 1)
3. Mapa de Parâmetros. (Variante, Opcional)
4. Formato do arquivo de saída. (Letras)
5. Atualizar arquivo binário JASPER? (Lógico, Opcional)
6. Abrir arquivo gerado? (Lógico, Opcional)
7. Conexão adicional. (Variante, Opcional)
8. Ordenação. (Variante, Opcional)

Retorno:
Não possui.

Observações:
1. O 1º e 2º parâmetro deve caminho relativo a partir do contexto ou absoluto do seus respectivos parâmetros.
1. Formatos suportados no 4º Parâmetro:
PDF, HTML, TXT, RTF, XML, XLSX, DOCX, PPTX, JPG, PNG, GIF, ODS, ODT e CSV.
2. Caso não exista o arquivo binário JASPER, será criado um independente da opção escolhida no parâmetro 5.
3. A ordenação deve estar no formato: campo1|[0|1][;campo2|[0|1][;campoN|[0|1]]], sendo: 
"0" descendente e "1" ascendente. (Opcional) Exemplo: cod_pessoa|1;nome|0

### Código Servidor (Java)

```java
protected void ebfJasperGenerateReport(Variant jrxml, Variant exportFile, Variant paramsVar, Variant format, Variant update, Variant open, Variant connectionAdd, Variant order) throws Exception {
  // Concatena caminho para o contexto do Webrun com o caminho relativo do
  // arquivo .jrxml ou absoluto passado como parâmetro
  String pathJRXML = getWfrFileFunctions().getDirectory(getSystem(), jrxml.getString());
  if (new java.io.File(pathJRXML).isAbsolute()) {
    jrxml = new Variant(pathJRXML);
  } else {
    jrxml = new Variant(wfr.util.WFRConfig.dir().toString() + java.io.File.separator + pathJRXML);
  }

  // Concatena caminho para o contexto do Webrun com o caminho relativo do
  // arquivo de saída ou absoluto passado como parâmetro
  String pathExport = getWfrFileFunctions().getDirectory(getSystem(), exportFile.getString());
  if (new java.io.File(pathExport).isAbsolute()) {
    exportFile = new Variant(pathExport);
  } else {
    exportFile = new Variant(wfr.util.WFRConfig.dir().toString() + java.io.File.separator + pathExport);
  }
  
  // Gera uma URL que será utilizada caso o parâmetro "open" seja true
  String url = null;
  if (open.getBoolean()) {
      url = exportFile.getString().replace("\\", "/").replace("//", "/").replace(wfr.util.WFRConfig.dir().toString().replace("\\", "/"), "");
  }

  // Criar pastas caso não existam
  new java.io.File(org.apache.commons.io.FilenameUtils.getFullPathNoEndSeparator(
    exportFile.getString())).mkdirs();

  //Obtém o do Webrun para aplicar automaticamente o separadores decimais.    
  Map < String, Object > map = new HashMap<String, Object>();

  // Obtém o valor correto do elemento no mapa quando este é passa via cliente para o servidor. Como o Webrun sempre trabalha com a classe Variant é necessário onter o objeto.
  if (paramsVar.getObject() != null) {
    map = (Map<String, Object>) paramsVar.getObject();
    for (String key : map.keySet()) {
      if (map.get(key) instanceof Variant) {
        if (((Variant) map.get(key)).getObject() instanceof Integer) {
        int vi = (Integer)((Variant) map.get(key)).getObject();
          map.put(key, Long.valueOf(vi));
        }
      else map.put(key, ((Variant) map.get(key)).getObject());
      }
    }
  }

  if (request != null) {
    java.util.Locale locale = wfr.util.Resources.getInstance(request).getLocale();
    map.put(net.sf.jasperreports.engine.JRParameter.REPORT_LOCALE, locale);
  }

  // Remove extensão do caminho para o arquivo .jrxml que depois será usado
  // para gerar o .jasper com o mesmo nome do .jrxml
  String fileNameWithouthExtension = org.apache.commons.io.FilenameUtils.removeExtension(jrxml.getString());
  String jasperFile = fileNameWithouthExtension + ".jasper";
  java.io.File file = new java.io.File(jasperFile);

  // Gerar arquivo compilado .jasper caso o parâmetro "update" seja true ou
  // não exista o binário, se for falso e existir o .jasper, é pulado essa
  // etapa o que acelera a geração do relatório final desconsiderando as
  // modificações no .jrxml que foram feitas depois do último .jasper gerado
  if (!file.exists() || update.getBoolean()) {
    net.sf.jasperreports.engine.JasperCompileManager.compileReportToFile(
      jrxml.getString(), jasperFile);
  }

  //aqui ordena pelo nome do campo da tabela.
  if (!(order == null || order.getString().equalsIgnoreCase(""))) {
    List < net.sf.jasperreports.engine.JRSortField > sortList = null;
    sortList = new ArrayList<net.sf.jasperreports.engine.JRSortField>();
    net.sf.jasperreports.engine.design.JRDesignSortField sortField = null;
    String coluna = null;
    String[] items = order.getString().split(";");
    for (int i = 0; i < items.length; i++) {
      coluna = items[i].replace("|", "");
      if (coluna.endsWith("0")) {
        coluna = coluna.substring(0, coluna.length() - 1);
        sortField = new net.sf.jasperreports.engine.design.JRDesignSortField();
        sortField.setName(coluna);
        sortField.setOrder(net.sf.jasperreports.engine.type.SortOrderEnum.DESCENDING);
      } else if (coluna.endsWith("1")) {
        coluna = coluna.substring(0, coluna.length() - 1);
        sortField = new net.sf.jasperreports.engine.design.JRDesignSortField();
        sortField.setName(coluna);
        sortField.setOrder(net.sf.jasperreports.engine.type.SortOrderEnum.ASCENDING);
      }
      sortField.setType(net.sf.jasperreports.engine.type.SortFieldTypeEnum.FIELD);
      sortList.add(sortField);
    }
    map.put(net.sf.jasperreports.engine.JRParameter.SORT_FIELDS, sortList);
  }
  // Usa conexão adicional se for passado como parâmetro em connectionAdd, se
  // não existir usa a padrão do sistema 
  java.sql.Connection conn;
  if (connectionAdd.equals(Variant.VARIANT_NULL)) {
    conn = connection.getConnection();
  } else {
    conn = ((DBConnection) connectionAdd.getObject()).getConnection();
  }

  // Gera o relatório internamente fazendo a conexão com o banco e trazendo os
  // dados
  net.sf.jasperreports.engine.JasperPrint jasperPrint = net.sf.jasperreports.engine.JasperFillManager.fillReport(jasperFile, map, conn);

  // Gera o arquivo de saída a depender do formato especificado no parâmetro
  // "format"
  if (format.getString().equalsIgnoreCase("pdf")) {
    net.sf.jasperreports.engine.JasperExportManager.exportReportToPdfFile(
      jasperPrint, exportFile.getString());
  } else if (format.getString().equalsIgnoreCase("html")) {
    net.sf.jasperreports.engine.export.HtmlExporter exporter = new net.sf.jasperreports.engine.export.HtmlExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(jasperPrint));
    if (!Settings.CHARSET.equalsIgnoreCase("UTF-8")) {
     // Crie o Writer com a codificação ISO-8859-1
      try (java.io.OutputStreamWriter writer = new java.io.OutputStreamWriter(new java.io.FileOutputStream(exportFile.getString()), Settings.CHARSET)) {
          net.sf.jasperreports.export.SimpleHtmlExporterOutput output = new net.sf.jasperreports.export.SimpleHtmlExporterOutput(writer);
          exporter.setExporterOutput(output);
          exporter.exportReport();
      }

      String htmlContent = new String(java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(exportFile.getString())), Settings.CHARSET);
      htmlContent = htmlContent.replace("charset=UTF-8", "charset=" + Settings.CHARSET);
      java.nio.file.Files.write(java.nio.file.Paths.get(exportFile.getString()), htmlContent.getBytes(Settings.CHARSET));
    } else {
      net.sf.jasperreports.export.SimpleHtmlExporterOutput output = new net.sf.jasperreports.export.SimpleHtmlExporterOutput(exportFile.getString());
      exporter.setExporterOutput(output);
      exporter.exportReport();
    }
  } else if (format.getString().equalsIgnoreCase("xml")) {
    if (!Settings.CHARSET.equalsIgnoreCase("UTF-8")) {
      // Exporta para um ByteArrayOutputStream (sempre em UTF-8, que é o padrão do Jasper)
      java.io.ByteArrayOutputStream byteOut = new java.io.ByteArrayOutputStream();
      net.sf.jasperreports.engine.JasperExportManager.exportReportToXmlStream(jasperPrint, byteOut);

      // Converte o conteúdo exportado para String
      String xmlContent = byteOut.toString("UTF-8");

      // Altera a declaração de encoding no XML
      xmlContent = xmlContent.replace("encoding=\"UTF-8\"", "encoding=\"" + Settings.CHARSET + "\"");

      // Grava o arquivo final no charset configurado
      java.nio.file.Files.write(
          java.nio.file.Paths.get(exportFile.getString()),
          xmlContent.getBytes(Settings.CHARSET)
      );
    } else {
        // Exporta normalmente em UTF-8
      net.sf.jasperreports.engine.JasperExportManager.exportReportToXmlFile(
          jasperPrint, exportFile.getString(), true);
    }
  } else if (format.getString().equalsIgnoreCase("odt")) {
    net.sf.jasperreports.engine.export.oasis.JROdtExporter exporter = new net.sf.jasperreports.engine.export.oasis.JROdtExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(jasperPrint));
    exporter.setExporterOutput(new net.sf.jasperreports.export.SimpleOutputStreamExporterOutput(exportFile.getString()));
    exporter.exportReport();
    
  } else if (format.getString().equalsIgnoreCase("ods")) {
    net.sf.jasperreports.engine.export.oasis.JROdsExporter exporter = new net.sf.jasperreports.engine.export.oasis.JROdsExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(jasperPrint));
    exporter.setExporterOutput(new net.sf.jasperreports.export.SimpleOutputStreamExporterOutput(exportFile.getString()));
    exporter.exportReport();  
  } else if (format.getString().equalsIgnoreCase("csv")) {
    net.sf.jasperreports.engine.export.JRCsvExporter exporter = new net.sf.jasperreports.engine.export.JRCsvExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(jasperPrint));
    exporter.setExporterOutput(new net.sf.jasperreports.export.SimpleWriterExporterOutput(exportFile.getString()));
    exporter.exportReport();
  } else if (format.getString().equalsIgnoreCase("txt")) {
    net.sf.jasperreports.engine.export.JRTextExporter txtExporter = new net.sf.jasperreports.engine.export.JRTextExporter();
    net.sf.jasperreports.export.SimpleExporterInput seInput = new net.sf.jasperreports.export.SimpleExporterInput(jasperPrint);
    net.sf.jasperreports.export.SimpleWriterExporterOutput sweOUT = new net.sf.jasperreports.export.SimpleWriterExporterOutput(exportFile.getString());
    net.sf.jasperreports.export.SimpleTextExporterConfiguration steConf = new net.sf.jasperreports.export.SimpleTextExporterConfiguration();
    steConf.setOverrideHints(false);
    txtExporter.setConfiguration(steConf);
    net.sf.jasperreports.export.SimpleTextReportConfiguration strConf = new net.sf.jasperreports.export.SimpleTextReportConfiguration();
    strConf.setCharHeight(Float.valueOf(10));
    strConf.setCharWidth(Float.valueOf(4));
    strConf.setOverrideHints(false);
    txtExporter.setConfiguration(strConf);
    txtExporter.setExporterInput(seInput);
    txtExporter.setExporterOutput(sweOUT);
    txtExporter.exportReport();
  } else if (format.getString().equalsIgnoreCase("rtf")) {
    net.sf.jasperreports.engine.export.JRRtfExporter rtfExporter = new net.sf.jasperreports.engine.export.JRRtfExporter();
    net.sf.jasperreports.export.SimpleExporterInput seInput = new net.sf.jasperreports.export.SimpleExporterInput(jasperPrint);
    net.sf.jasperreports.export.SimpleWriterExporterOutput sweOUT = new net.sf.jasperreports.export.SimpleWriterExporterOutput(exportFile.getString());
    rtfExporter.setExporterInput(seInput);
    rtfExporter.setExporterOutput(sweOUT);
    rtfExporter.exportReport();
  } else if (format.getString().equalsIgnoreCase("xlsx")) {
    net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter exporter = new net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(
      jasperPrint));
    exporter.setExporterOutput(new net.sf.jasperreports.export.SimpleOutputStreamExporterOutput(
      exportFile.getString()));
    exporter.exportReport();
  } else if (format.getString().equalsIgnoreCase("docx")) {
    net.sf.jasperreports.engine.export.ooxml.JRDocxExporter exporter = new net.sf.jasperreports.engine.export.ooxml.JRDocxExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(
      jasperPrint));
    exporter.setExporterOutput(new net.sf.jasperreports.export.SimpleOutputStreamExporterOutput(
      exportFile.getString()));
    exporter.exportReport();

  } else if (format.getString().equalsIgnoreCase("pptx")) {
    net.sf.jasperreports.engine.export.ooxml.JRPptxExporter exporter = new net.sf.jasperreports.engine.export.ooxml.JRPptxExporter();
    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(
      jasperPrint));
    exporter.setExporterOutput(new net.sf.jasperreports.export.SimpleOutputStreamExporterOutput(
      exportFile.getString()));
    exporter.exportReport();

  } else if (format.getString().equalsIgnoreCase("jpg")
      || format.getString().equalsIgnoreCase("png")
      || format.getString().equalsIgnoreCase("gif")
  ) {

    net.sf.jasperreports.engine.export.JRGraphics2DExporter exporter = new net.sf.jasperreports.engine.export.JRGraphics2DExporter();
    net.sf.jasperreports.export.SimpleGraphics2DReportConfiguration reportConfiguration = new net.sf.jasperreports.export.SimpleGraphics2DReportConfiguration();
    exporter.setConfiguration(reportConfiguration);
    int totalPaginas = jasperPrint.getPages().size();

    // Para imagem, pula 1 pixel para cada página, assim deixando uma linha
    // preta por não desenhar, dividindo uma página da outra
    int pageWidth = jasperPrint.getPageWidth(), pageHeight = jasperPrint.getPageHeight() + 1;
    int imageType;

    // Formato com canal Alpha (transparência) para PNG e GIF, sem Alpha para
    // JPG por não suportar
    if (format.getString().equalsIgnoreCase("jpg")) {
      imageType = java.awt.image.BufferedImage.TYPE_INT_RGB;
    } else {
      imageType = java.awt.image.BufferedImage.TYPE_INT_ARGB;
    }

    // Buffer de imagem onde será desenhado pelo Exporter do Jasper a imagem
    // de saída, um pixel a menos no final para não desenhar a última linha
    // preta
    java.awt.image.BufferedImage image = new java.awt.image.BufferedImage(
      pageWidth, pageHeight * totalPaginas - 1, imageType);

    final java.awt.Graphics2D graphics = image.createGraphics();

    exporter.setExporterInput(new net.sf.jasperreports.export.SimpleExporterInput(
      jasperPrint));

    // Desenha página por página, no buffer de imagem
    for (int index = 0; index < totalPaginas; index++) {
      reportConfiguration.setPageIndex(index);
      exporter.exportReportToGraphics2D(graphics);
      graphics.translate(0, pageHeight);
    }

    // Escreve em disco a imagem do buffer de imagem
    javax.imageio.ImageIO.write(image, format.getString(), new java.io.File(exportFile.getString()));
  }

  // Abre o arquivo gerado caso o parâmetro "open" seja true, a depender do
  // arquivo gerado, se o navegador consegue exibir, é aberto um
  // popup mostrando o arquivo final, caso contrário aparece um link para
  // baixar
  if (open.getBoolean()) {
    if (format.getString().equalsIgnoreCase("xlsx")
        || format.getString().equalsIgnoreCase("docx") 
        || format.getString().equalsIgnoreCase("pptx")
        || format.getString().equalsIgnoreCase("txt")
        || format.getString().equalsIgnoreCase("rtf")
        || format.getString().equalsIgnoreCase("ods")
        || format.getString().equalsIgnoreCase("odt")
        || format.getString().equalsIgnoreCase("csv")
    ) {
      callClientFunction("__jasperDownloadStart", new Variant(url));
    } else {
      callClientFunction("__jasperOpenReportConnectionAdd", new Variant(url));
    }
  }
}
```

### Código Cliente (JavaScript)

```javascript
function __jasperOpenReportConnectionAdd(fileURL) {
  var altura = window.screen.availHeight, largura = window.screen.availWidth; 
  if(isChrome){
    altura -= 70;
    largura -= 19;
  }

  window.open(fileURL, fileURL, "menubar=0,toolbar=0,location=0,personalbar=0,status=0,dependent=0,scrollbars=1,resizable=1,height="+altura+",width="+largura+",screenX=0,screenY=0,fullscreen=1");
}

function __jasperDownloadStart(fileURL) {
  var invertNameFile = ebfStringReverse(fileURL);
  var indice = invertNameFile.indexOf("/");
  var nameFile = ebfStringReverse(invertNameFile.substring(0, indice));   
  var link = document.createElement("a");
  link.download = nameFile;
  link.href = fileURL;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  delete link;
}
```

---

## Recarregar Relatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReloadReport` |
| **Código** | 695 |
| **Assinatura** | `Recarregar Relatório (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 13 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Força a recarga de um relatório informado por parâmetro.

Parâmetro:
1. Nome ou Código do relatório. (Letras)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final void ebfReloadReport(Variant reportId) throws Exception {
  client.getSystem().reloadReport(reportId.getString());
}
```

---

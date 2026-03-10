# Funções Nativas - Banco de Dados

Total: **53** funções

[← Voltar para Funções Nativas](README.md)

---

## A Conexão está aberta?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCheckConnectionIsOpen` |
| **Código** | 1031 |
| **Assinatura** | `A Conexão está aberta? (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função verifica se uma conexão passada por parâmetro está aberta.

Parâmetro:
1. Conexão.(Referência da Conexão)

Retorno:
Valor lógico informando se está aberta. (Lógico)

Observação:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfCheckConnectionIsOpen(Variant connection) throws Exception {
  if (connection.getObject() instanceof DBConnection) {
    DBConnection conn = (DBConnection) connection.getObject();
    return VariantPool.get(conn.isConnected());
  }
  return Variant.VARIANT_FALSE;
}
```

---

## Abrir Conexão DB2

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLDB2OpenConnection` |
| **Código** | 737 |
| **Assinatura** | `Abrir Conexão DB2 (Letras;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados em DB2, para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados.

Parâmetro(s):
1. Host do Banco de Dados. (Letras)
2. Nome do Banco de Dados. (Letras)
3. Login. (Letras)
4. Senha. (Letras)
5. Porta. (Letras, Opcional)

Retorno: 
Retorna a referência da conexão DB2. (Variante)

Observação:
Caso a porta não seja definida no 5º parâmetro, a conexão assumirá a porta padrão (50000). 

Exemplo: 
Assumindo como 1° Parâmetro: 127.0.0.1, como 2° parâmetro o nome: SAMPLE, como 3° parâmetro: db2admin, como 4° parâmetro: 123456 e como 5º parâmetro: nulo. O retorno será a referência da conexão.

### Código Servidor (Java)

```java
protected final Variant ebfSQLDB2OpenConnection(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar, Variant portVar) throws Exception {
    String database = "DB2";
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    String datafile = databaseVar.getString();
    String port = portVar.getString();
    String charset = wfr.database.DBConnection.ISO8859;
    validateDBConnectionData(hostName, user, password);

    wfr.database.DBConnection.DBConnectionProperties properties = new wfr.database.DBConnection.DBConnectionProperties();

    Config config = WFRConfig.database();
    String url = config.get(database, "URL");

    if (config.get(database, "DatabaseField").length() > 0) {
      url = Functions.replaceParam(url, config.get(database, "DatabaseField"), datafile);
    }

    if (config.get(database, "ServerField").length() > 0) {
      url = Functions.replaceParam(url, config.get(database, "ServerField"), hostName);
    }

    url = Functions.replaceParam(url, "ServerCharSet", charset);
    
    if ((port != null) && (port.trim().length() > 0))
      url = Functions.replaceParam(url, "Port", port);

    if (url.indexOf("$") != -1) {
      java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\$[^:\\$]+:([^\\$]+)\\$", java.util.regex.Pattern.CASE_INSENSITIVE);
      java.util.regex.Matcher matcher = pattern.matcher(url);

      StringBuffer buffer = new StringBuffer();

      while (matcher.find()) {
        String defaultValue = matcher.group(1);
        matcher.appendReplacement(buffer, defaultValue);
      }

      matcher.appendTail(buffer);

      url = buffer.toString();
    }

    if (url.indexOf("$") != -1) {
      java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\$.+\\$");
      java.util.regex.Matcher matcher = pattern.matcher(url);
      url = matcher.replaceAll("");
    }

    properties.hostname = hostName;
    properties.fullHostname = hostName;
    properties.port = port;
    properties.drivername = database;
    properties.className = config.get(database, "Driver");
    properties.url = url;
    properties.user = user;
    properties.password = password;
    properties.autocommit = config.getBoolean(database, "AutoCommit");
    properties.commitClausule = config.get(database, "CommitClausule").trim();
    properties.startTransactionClausule = config.get(database, "StartTransactionClausule").trim();
    properties.rollbackTransactionClausule = config.get(database, "RollbackTransactionClausule").trim();
    properties.trimstr = config.getBoolean(database, "TrimString");
    properties.fetchsize = config.getInt(database, "FetchSize");
    properties.caseSensitive = config.getBoolean(database, "CaseSensitive");
    properties.forceLowerCase = config.getBoolean(database, "ForceLowerCase");

    properties.generator = config.get(database, "Generator");
    properties.append4MeataData = config.get(database, "AppendSQL4MetaData");
    properties.modify4MeataData = config.get(database, "ModifySQL4MetaData");
    properties.insert4MeataData = config.get(database, "InsertOnStarSQL4MetaData");
    properties.addCondition4MeataData = config.get(database, "AddCondition4MetaData");
    properties.removeOrderBy4MeataData = Functions.stringToBoolean(config.get(database, "RemoveOrderBy4MetaData"));
    properties.useCachedResultset4Metadata = Functions.stringToBoolean(config.get(database, "UseCachedResultset4Metadata"));
    properties.connectionFailMessage = config.get(database, "ConnectionFailMessage");
    properties.timeout = config.getInt(database, "TimeOut");
    properties.exceptForeignKey = config.getList(database, "ExceptionForeignKey");
    properties.exceptPrimaryKey = config.getList(database, "ExceptionPrimaryKey");
    properties.autoinc = config.get(database, "Autoinc");
    properties.initializeCommand = config.getList(database, "InitializeCommand");
    properties.insertBeforeParameter = config.get(database, "InsertBeforeParameter");
    properties.appendAfterParameter = config.get(database, "AppendAfterParameter");

    if (config.get(database, "SupportTransaction").trim().length() > 0) {
      properties.supportTransaction = config.getBoolean(database, "SupportTransaction");
      if (!properties.supportTransaction) {
        properties.autocommit = true;
      }
    }

    wfr.database.DBConnection conn = new wfr.database.DBConnection(properties);

    String server = hostName;
    if (server != null && server.indexOf(":") != -1) {
      server = server.substring(0, server.indexOf(":"));
    }
    
    conn.setServer(server);
    conn.initialize();
    conn.startTransaction();
    openedResultSetList.add(conn);
    return VariantPool.get(conn);
}
```

---

## Abrir Conexão Definindo Porta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenDBConnectionPort` |
| **Código** | 1035 |
| **Assinatura** | `Abrir Conexão Definindo Porta (Letras;Letras;Letras;Letras;Letras;Letras;Lógico): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados informado por parâmetro na qual o usuário define a porta em que deseja abrir conexão,
uma vez a conexão aberta o usuário poderá executar comandos ou seleções no banco de dados.

Parâmetros:
1. Servidor de banco de dados (Observação 1)
2. Hostname
3. Nome do Banco
4. Usuário
5. Senha
6. Porta
7. Fechar automaticamente

Retorno:
Retorna a referência da conexão MSSQL (Variante).

Exemplo: 
Assumindo como:
  1º Parâmetro: POSTGRESQL
  2° Parâmetro: 127.0.0.1
  3° Parâmetro: bd_treinamento
  4° Parâmetro: postgres
  5° Parâmetro: softwell 
  6° Parâmetro: 5491
  7° Parâmetro: true

O retorno será a referência para uma conexão, caso efetuada com sucesso.

Observação:
1. O primeiro parâmetro dessa função possui suporte para os seguintes valores:
  1º DB2 
  2° FIREBIRD 
  3° MSSQL
  4° MYSQL
  5° ORACLE
  6° POSTGRESQL

### Código Servidor (Java)

```java
protected final Variant ebfOpenDBConnectionPort(Variant dbServer, Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar, Variant portVar, Variant closedConnection) throws Exception {
  String databaseServer = dbServer.getString().trim();

  if(databaseServer.isEmpty()) {
    throw new WFRRuleException(ExceptionMessage.ERROR_RULE_DATA_DATABASE_CONNECTION_REQUIRED, this.ruleName, ExceptionMessage.LABEL_DATABASE);
  } else {
    if(DBConnection.DB2.equalsIgnoreCase(databaseServer)) databaseServer = DBConnection.DB2;
    else if(DBConnection.FIREBIRD.equalsIgnoreCase(databaseServer)) databaseServer = DBConnection.FIREBIRD;
    else if(DBConnection.MSSQL.equalsIgnoreCase(databaseServer)) databaseServer = DBConnection.MSSQL;
    else if(DBConnection.MYSQL.equalsIgnoreCase(databaseServer)) databaseServer = DBConnection.MYSQL;
    else if(DBConnection.POSTGRESQL.equalsIgnoreCase(databaseServer)) databaseServer = DBConnection.POSTGRESQL;
    else if(DBConnection.ORACLE.equalsIgnoreCase(databaseServer)) databaseServer = DBConnection.ORACLE;
    else throw new WFRRuleException(ExceptionMessage.ERROR_DATABASE_NOT_SUPPORTED, this.ruleName, ExceptionMessage.LABEL_DATABASE);
  }

  String hostName = hostNameVar.getString();
  String user = userVar.getString();
  String password = passwordVar.getString();
  String datafile = databaseServer.equals(DBConnection.FIREBIRD) ? null : databaseVar.getString();
  String port = portVar.getString();
  boolean isClose = closedConnection.isNull() ? true : closedConnection.getBoolean();

  validateDBConnectionData(hostName, user);

  DBConnection conn = DBConnection.createConnection(databaseServer, hostName, datafile, user, password, DBConnection.ISO8859, port);

  String server = hostName;
  if (server != null && server.indexOf(":") != -1) {
    server = server.substring(0, server.indexOf(":"));
  }

  conn.setServer(server);
  conn.initialize();
  conn.startTransaction();

  if(isClose) openedResultSetList.add(conn);

  return VariantPool.get(conn);
}
```

---

## Abrir Conexão Firebird

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLFirebirdOpenConnection` |
| **Código** | 9 |
| **Assinatura** | `Abrir Conexão Firebird (Letras;Letras;Letras) : Variante` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados "Firebird", para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados. 

Parâmetro(s):
1. Host do Banco de Dados. (Letras)
2. Login. (Letras)
3. Senha. (Letras)

Retorno: 
Retorna a referência de uma conexão firebird. (Variante)

Exemplos: 
1.  No 1º Parâmetro pode ser utilizado "127.0.0.1:C:\Firebird\Nome do Banco.FDB".
2. Assumindo como 1º Parâmetro: 127.0.0.1:C:\Firebird\Treinamento.FDB, 2º Parâmetro: SYSDBA e 3º Parâmetro: masterkey,
 o retorno será a referência para uma conexão Firebird caso a conexão seja efetuada com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfSQLFirebirdOpenConnection(Variant hostNameVar, Variant userVar, Variant passwordVar) throws Exception {
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    validateDBConnectionData(hostName, user);
    DBConnection conn = DBConnection.createConnection(DBConnection.FIREBIRD, hostName, null, user, password, DBConnection.ISO8859);
    conn.startTransaction();
    openedResultSetList.add(conn);
    return VariantPool.get(conn);
  }
```

---

## Abrir Conexão Informix

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateDBConnectionInformix` |
| **Código** | 850 |
| **Assinatura** | `Abrir Conexão Informix (Variante;Variante;Variante;Variante;Variante): Variante` |
| **Parâmetros** | Variante;Variante;Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados Informix, para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados.

Parâmetro(s):
1. Host do Banco de Dados. (Variante)
2. Nome do Banco de Dados. (Variante)
3. Login. (Variante)
4. Senha. (Variante)
5. Porta. (Variante)

Retorno:
Referência da conexão Informix. (Variante)

Exemplo: 
Assumindo como 1° Parâmetro: 127.0.0.1, 2° Parâmetro: bd_treinamento, 3° Parâmetro: informix , 4° Parâmetro: softwell e 5º Parâmetro: 9088 
o retorno será a referência para uma conexão Informix caso a conexão seja efetuada com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfCreateDBConnectionInformix(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar, Variant portVar) throws Exception {
  String database = "Informix";
  String hostName = hostNameVar.getString();
  String user = userVar.getString();
  String password = passwordVar.getString();
  String datafile = databaseVar.getString();
  String port = portVar.getString();
  String charset = wfr.database.DBConnection.ISO8859;
  validateDBConnectionData(hostName, user);

  wfr.database.DBConnection.DBConnectionProperties properties = new wfr.database.DBConnection.DBConnectionProperties();

  Config config = WFRConfig.database();
  String url = config.get(database, "URL");

  if (config.get(database, "DatabaseField").length() > 0) {
    url = Functions.replaceParam(url, config.get(database, "DatabaseField"), datafile);
  }

  if (config.get(database, "ServerField").length() > 0) {
    url = Functions.replaceParam(url, config.get(database, "ServerField"), hostName);
  }

  url = Functions.replaceParam(url, "ServerCharSet", charset);
  
  if ((port != null) && (port.trim().length() > 0))
    url = Functions.replaceParam(url, "Port", port);

  if (url.indexOf("$") != -1) {
    java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\$[^:\\$]+:([^\\$]+)\\$", java.util.regex.Pattern.CASE_INSENSITIVE);
    java.util.regex.Matcher matcher = pattern.matcher(url);

    StringBuffer buffer = new StringBuffer();

    while (matcher.find()) {
      String defaultValue = matcher.group(1);
      matcher.appendReplacement(buffer, defaultValue);
    }

    matcher.appendTail(buffer);

    url = buffer.toString();
  }

  if (url.indexOf("$") != -1) {
    java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\$.+\\$");
    java.util.regex.Matcher matcher = pattern.matcher(url);
    url = matcher.replaceAll("");
  }

  properties.hostname = hostName;
  properties.fullHostname = hostName;
  properties.port = port;
  properties.drivername = database;
  properties.className = config.get(database, "Driver");
  properties.url = url;
  properties.user = user;
  properties.password = password;
  properties.autocommit = config.getBoolean(database, "AutoCommit");
  properties.commitClausule = config.get(database, "CommitClausule").trim();
  properties.startTransactionClausule = config.get(database, "StartTransactionClausule").trim();
  properties.rollbackTransactionClausule = config.get(database, "RollbackTransactionClausule").trim();
  properties.trimstr = config.getBoolean(database, "TrimString");
  properties.fetchsize = config.getInt(database, "FetchSize");
  properties.caseSensitive = config.getBoolean(database, "CaseSensitive");
  properties.forceLowerCase = config.getBoolean(database, "ForceLowerCase");

  properties.generator = config.get(database, "Generator");
  properties.append4MeataData = config.get(database, "AppendSQL4MetaData");
  properties.modify4MeataData = config.get(database, "ModifySQL4MetaData");
  properties.insert4MeataData = config.get(database, "InsertOnStarSQL4MetaData");
  properties.addCondition4MeataData = config.get(database, "AddCondition4MetaData");
  properties.removeOrderBy4MeataData = Functions.stringToBoolean(config.get(database, "RemoveOrderBy4MetaData"));
  properties.useCachedResultset4Metadata = Functions.stringToBoolean(config.get(database, "UseCachedResultset4Metadata"));
  properties.connectionFailMessage = config.get(database, "ConnectionFailMessage");
  properties.timeout = config.getInt(database, "TimeOut");
  properties.exceptForeignKey = config.getList(database, "ExceptionForeignKey");
  properties.exceptPrimaryKey = config.getList(database, "ExceptionPrimaryKey");
  properties.autoinc = config.get(database, "Autoinc");
  properties.initializeCommand = config.getList(database, "InitializeCommand");
  properties.insertBeforeParameter = config.get(database, "InsertBeforeParameter");
  properties.appendAfterParameter = config.get(database, "AppendAfterParameter");

  if (config.get(database, "SupportTransaction").trim().length() > 0) {
    properties.supportTransaction = config.getBoolean(database, "SupportTransaction");
    if (!properties.supportTransaction) {
      properties.autocommit = true;
    }
  }

  wfr.database.DBConnection conn = new wfr.database.DBConnection(properties);

  String server = hostName;
  if (server != null && server.indexOf(":") != -1) {
    server = server.substring(0, server.indexOf(":"));
  }
  
  conn.setServer(server);
  conn.initialize();
  conn.startTransaction();
  openedResultSetList.add(conn);
  return VariantPool.get(conn);
}
```

---

## Abrir Conexão MSSQL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLMSSQLOpenConnection` |
| **Código** | 608 |
| **Assinatura** | `Abrir Conexão MSSQL (Letras;Letras;Letras;Letras;Lógico) : Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados "MSSQL", para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados. 

Parâmetro(s):
1. Host do Banco. (Letras)
2. Nome do Banco. (Letras)
3. Login. (Letras)
4. Senha. (Letras)
5. Fechar conexão automaticamente? (Lógico)

Retorno: 
Retorna a referência de uma conexão MSSQL. (Variante)

Exemplo: 
Assumindo como 1° Parâmetro: 127.0.0.1, 2° Parâmetro: bd_treinamento: 3° Parâmetro: sa, 4° Parâmetro: 123456 e 5° Parâmetro: true, 
o retorno será a referência para uma conexão MSSQL caso a conexão seja efetuada com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfSQLMSSQLOpenConnection(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar) throws Exception  {
  return ebfSQLMSSQLOpenConnection(hostNameVar, databaseVar, userVar,  passwordVar, Variant.VARIANT_TRUE);
}
protected final Variant ebfSQLMSSQLOpenConnection(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar, Variant closeWhenDone) throws Exception {
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    String database = databaseVar.getString();
    validateDBConnectionData(hostName, database, user);
    DBConnection conn = DBConnection.createConnection(DBConnection.MSSQL, hostName, database, user, password, DBConnection.ISO8859);
    conn.startTransaction();
    if (closeWhenDone.getBoolean()) 
      openedResultSetList.add(conn);
    return VariantPool.get(conn);
  }
```

---

## Abrir Conexão Oracle

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLOracleOpenConnection` |
| **Código** | 147 |
| **Assinatura** | `Abrir Conexão Oracle (Letras;Letras;Letras;Letras) : Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados Oracle, para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados.

Parâmetro(s):
1. Host do Banco de Dados. (Letras)
2. Nome do Banco. (Letras)
3. Login. (Letras)
4. Senha. (Letras)

Retorno: 
Retorna a referência de uma conexão Oracle. (Variante)

Exemplos: 
1. No 1º Parâmetro pode ser utilizado "127.0.0.1".
2. Assumindo como 1° Parâmetro: Nulo, 2° Parâmetro: 127.0.0.1:8081:XE, 3° Parâmetro: sa e 4° Parâmetro: 123456 
o retorno será a referência para uma conexão Oracle caso a conexão seja efetuada com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfSQLOracleOpenConnection(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar) throws Exception {
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    String database = databaseVar.getString();
    DBConnection conn = DBConnection.createConnection("Oracle", hostName, database, user, password, "ISO8859_1");
    conn.startTransaction();
    openedResultSetList.add (conn);
    return VariantPool.get(conn);
  }
```

---

## Abrir Conexão Postgres

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLPostgresOpenConnection` |
| **Código** | 242 |
| **Assinatura** | `Abrir Conexão Postgres (Letras;Letras;Letras;Letras) : Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados em PostgreSQL, para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados.

Parâmetro(s):
1. Host do Banco de Dados. (Letras)
2. Nome do Banco. (Letras)
3. Login. (Letras)
4. Senha. (Letras)

Retorno:
Retorna a referência da conexão PostgreSQL. (Variante)

Observações:
1. Ao utilizar esta função, uma conexão e aberta com a porta default do Postgres: 5432.
2. Para abrir uma conexão com uma porta diferente da default, utilize a função: "Abrir Conexão Postgres definindo Porta".

Exemplos: 
1. No 1º Parâmetro pode ser utilizado "127.0.0.1".
2. Assumindo como 1° Parâmetro: 127.0.0.1, 2° Parâmetro: bd_treinamento, 3° Parâmetro: postgres e 4° Parâmetro: softwell 
o retorno será a referência para uma conexão PostgreSQL caso a conexão seja efetuada com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfSQLPostgresOpenConnection(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar) throws Exception {
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    String database = databaseVar.getString();
    validateDBConnectionData(hostName, user);
    DBConnection conn = DBConnection.createConnection("PostgreSQL", hostName, database, user, password, DBConnection.ISO8859);
    conn.startTransaction();
    openedResultSetList.add(conn);
    return VariantPool.get(conn);
  }
```

---

## Abrir Conexão Postgres Definindo Porta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLPostgresOpenConnectionPort` |
| **Código** | 480 |
| **Assinatura** | `Abrir Conexão Postgres Definindo Porta (Letras;Letras;Letras;Letras;Letras) : Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados em Postgres, na qual o usuário define a porta em que deseja abrir conexão
uma vez a conexão aberta o usuário poder executar comandos ou seleções no banco de dados.

Parâmetro(s):
1. Host do Banco. (Letras)
2. Nome do Banco. (Letras)
3. Usuário. (Letras)
4. Senha. (Letras)
5. Porta. (Letras)

Retorno:
Retorna a referência da conexão Postgres. (Variante)

Exemplo: 
Assumindo como 1° Parâmetro: 127.0.0.1, 2° Parâmetro: bd_treinamento, 3° Parâmetro: postgres, 4° Parâmetro: softwell e 5° Parâmetro: 5491 
o retorno será a referência para uma conexão postgres caso a conexão seja efetuada com sucesso.

### Código Servidor (Java)

```java
protected final Variant ebfSQLPostgresOpenConnectionPort(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar, Variant portVar) throws Exception {
    String database = "PostgreSQL";
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    String datafile = databaseVar.getString();
    String port = portVar.getString();
    String charset = wfr.database.DBConnection.ISO8859;
    validateDBConnectionData(hostName, user);

    wfr.database.DBConnection.DBConnectionProperties properties = new wfr.database.DBConnection.DBConnectionProperties();

    Config config = WFRConfig.database();
    String url = config.get(database, "URL");

    if (config.get(database, "DatabaseField").length() > 0) {
      url = Functions.replaceParam(url, config.get(database, "DatabaseField"), datafile);
    }

    if (config.get(database, "ServerField").length() > 0) {
      url = Functions.replaceParam(url, config.get(database, "ServerField"), hostName);
    }

    url = Functions.replaceParam(url, "ServerCharSet", charset);
    
    if ((port != null) && (port.trim().length() > 0))
      url = Functions.replaceParam(url, "Port", port);

    if (url.indexOf("$") != -1) {
      java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\$[^:\\$]+:([^\\$]+)\\$", java.util.regex.Pattern.CASE_INSENSITIVE);
      java.util.regex.Matcher matcher = pattern.matcher(url);

      StringBuffer buffer = new StringBuffer();

      while (matcher.find()) {
        String defaultValue = matcher.group(1);
        matcher.appendReplacement(buffer, defaultValue);
      }

      matcher.appendTail(buffer);

      url = buffer.toString();
    }

    if (url.indexOf("$") != -1) {
      java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\$.+\\$");
      java.util.regex.Matcher matcher = pattern.matcher(url);
      url = matcher.replaceAll("");
    }

    properties.hostname = hostName;
    properties.fullHostname = hostName;
    properties.port = port;
    properties.drivername = database;
    properties.className = config.get(database, "Driver");
    properties.url = url;
    properties.user = user;
    properties.password = password;
    properties.autocommit = config.getBoolean(database, "AutoCommit");
    properties.commitClausule = config.get(database, "CommitClausule").trim();
    properties.startTransactionClausule = config.get(database, "StartTransactionClausule").trim();
    properties.rollbackTransactionClausule = config.get(database, "RollbackTransactionClausule").trim();
    properties.trimstr = config.getBoolean(database, "TrimString");
    properties.fetchsize = config.getInt(database, "FetchSize");
    properties.caseSensitive = config.getBoolean(database, "CaseSensitive");
    properties.forceLowerCase = config.getBoolean(database, "ForceLowerCase");

    properties.generator = config.get(database, "Generator");
    properties.append4MeataData = config.get(database, "AppendSQL4MetaData");
    properties.modify4MeataData = config.get(database, "ModifySQL4MetaData");
    properties.insert4MeataData = config.get(database, "InsertOnStarSQL4MetaData");
    properties.addCondition4MeataData = config.get(database, "AddCondition4MetaData");
    properties.removeOrderBy4MeataData = Functions.stringToBoolean(config.get(database, "RemoveOrderBy4MetaData"));
    properties.useCachedResultset4Metadata = Functions.stringToBoolean(config.get(database, "UseCachedResultset4Metadata"));
    properties.connectionFailMessage = config.get(database, "ConnectionFailMessage");
    properties.timeout = config.getInt(database, "TimeOut");
    properties.exceptForeignKey = config.getList(database, "ExceptionForeignKey");
    properties.exceptPrimaryKey = config.getList(database, "ExceptionPrimaryKey");
    properties.autoinc = config.get(database, "Autoinc");
    properties.initializeCommand = config.getList(database, "InitializeCommand");
    properties.insertBeforeParameter = config.get(database, "InsertBeforeParameter");
    properties.appendAfterParameter = config.get(database, "AppendAfterParameter");

    if (config.get(database, "SupportTransaction").trim().length() > 0) {
      properties.supportTransaction = config.getBoolean(database, "SupportTransaction");
      if (!properties.supportTransaction) {
        properties.autocommit = true;
      }
    }

    wfr.database.DBConnection conn = new wfr.database.DBConnection(properties);

    String server = hostName;
    if (server != null && server.indexOf(":") != -1) {
      server = server.substring(0, server.indexOf(":"));
    }
    
    conn.setServer(server);
    conn.initialize();
    conn.startTransaction();
    openedResultSetList.add(conn);
    return VariantPool.get(conn);
}
```

---

## Abrir Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteQuery` |
| **Código** | 549 |
| **Assinatura** | `Abrir Consulta (SQL Consulta;Variante) : Tabela` |
| **Parâmetros** | SQL Consulta;Variante |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Executa um comando de Seleção [SELECT] no Banco de Dados.

Parâmetro(s):
1. Comando de Seleção ou Wizard. (SQL Consulta)
2. Conexão com o banco de dados. (Variante, Opcional) (Ver observação 6)

Retorno: 
Retorna uma Consulta. (Tabela) 

Observações:
1. A partir da versão 1.0.0.1 a função passa a validar se a consulta passada por parâmetro contém apenas a instrução SELECT.
2. Essa função é usada para fazer um SELECT (seleção) no banco de dados desejado. Utilize a função: "tabela para Lista" para visualizar todo o conteúdo do retorno.
3. Caso seja necessário executar a consulta em um outro banco de dados, é necessário passar a conexão no 2° Parâmetro. 
4. Para criar essa conexão consulte a ajuda sobre a função "Abrir Conexão MSSQL" ,  "Abrir Conexão Firebird" ou qualquer outro banco.
5. Esta função não suporta :: para conversão de dados.
6. Se passado nulo, a função assume que a consulta será feita na conexão principal.

Exemplo: 
Assumindo como 1º Parâmetro: Select fr_acao.aco_codigo, fr_acao.aco_nome From fr_acao e 2º Parâmetro (conexão) - sendo opcional. 
o resultado será um resultset de uma tabela.

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteQuery(String sql, int paramsQtt, Variant... variants) throws Exception {
  wfr.util.Functions.checkInvalidCommand(sql);
  Long startTimeFunction = System.currentTimeMillis();  

  ResultSet rSet = null;
  DBConnection conn = null;
  if (variants != null) {
    Variant connVar = variants[variants.length-1];
    if (connVar.getObject() instanceof DBConnection) {
      conn = (DBConnection) connVar.getObject();
    }
  }

  if (developmentMode) {
    System.out.println("### SELECT BEGIN [" + this.ruleName + "] ###");
    System.out.println(sql);
    System.out.println();
  }

  DBConnection tempConn = (conn == null ? connection : conn);
  PreparedStatement pStmt = tempConn.getPreparedStatement(sql);
  if (variants != null) {
    for (int i = 0; i < paramsQtt; i++) {
      Variant variant = variants[i];
      
      if (developmentMode) {
        System.out.print("[" + (i + 1) + "] - ");
        if (variant.isNull()) {
          System.out.println("NULL");
        } else {
          System.out.println(variant.toString());
        }
      }
      
      if (variant.getType() == WFRRuleType.NULL) {
        try {
          pStmt.setNull(i + 1, pStmt.getParameterMetaData().getParameterType(i + 1));
        } catch (Exception ex) {
          pStmt.setNull(i + 1, Types.NULL);
        }
      } else if (variant.getType() == WFRRuleType.LONG) {
        pStmt.setLong(i + 1, variant.getLong());
      } else if (variant.getType() == WFRRuleType.DOUBLE) {
        pStmt.setDouble(i + 1, variant.getDouble());
      } else if (variant.getType() == WFRRuleType.BOOLEAN) {
        pStmt.setBoolean(i + 1, variant.getBoolean());
      } else if (variant.getType() == WFRRuleType.DATE) {
        pStmt.setTimestamp(i + 1, new Timestamp(variant.getDate().getTime()));
      } else if (variant.getType() == WFRRuleType.STRING) {
        pStmt.setString(i + 1, variant.getString());
      } else {
        pStmt.setObject(i + 1, variant.getObject());
      }
    }
  }

  if (developmentMode) {
    System.out.println("### SELECT END [" + this.ruleName + "] ###");
    System.out.println();
  }

  rSet = tempConn.execQueryStatement(pStmt);
  rSet.next();
  openedResultSetList.add(rSet);

  Long endTimeFunction = System.currentTimeMillis();
  wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteQuery", startTimeFunction, endTimeFunction);

  return VariantPool.get(rSet);
}
```

---

## Abrir Consulta Dinâmica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLDynamicQuery` |
| **Código** | 114 |
| **Assinatura** | `Abrir Consulta Dinâmica (Letras;Variante;Inteiro;Variante...) : Tabela` |
| **Parâmetros** | Letras;Variante;Inteiro;N'Variante |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Executa uma consulta SQL dinâmica e retorna uma tabela com os dados.
Caso seja necessário passar parâmetros, este deve estar na consulta com uma interrogação (?) na ordem da passagem dos mesmos.

Parâmetro(s):
1. Comando de Seleção. (Letras)
2. Conexão. (Variante, Opcional)
3. Quantidade de Parâmetros. (Inteiro)
4. Lista contendo parâmetros ou parâmetro. (N' Variante)

Retorno: 
Retorna uma Consulta Dinâmica. (Tabela) 

Observação: 
Essa função é usada para fazer um SELECT (seleção) no banco de dados desejado.

Exemplo: 
1° Parâmetro: SELECT TAB_COD FROM TABELA WHERE TAB_COD = ?
2° Parâmetro: (Null) - *Conexão Principal
3° Parâmetro: 1
4° Parâmetro: 10

### Código Servidor (Java)

```java
protected final Variant ebfSQLDynamicQuery(Variant sql, Variant conn, Variant paramsQtt, Variant... paramsVar) throws Exception {
    Variant[] params;
    if (paramsVar[0].getObject() instanceof List) {
      int paramsQuantity = paramsQtt.getLong().intValue();
      List paramsList = List.class.cast(paramsVar[0].getObject());
      params = new Variant[paramsQuantity + 1];
      for (int i = 0; i < paramsQuantity; i++) {
        if (paramsList.get(i) instanceof Variant)
          params[i] = (Variant) paramsList.get(i);
        else
          params[i] = new Variant(paramsList.get(i));
      }
      params[paramsQuantity] = conn;
    } else {      
      int paramsQuantity = paramsVar.length;
      params = new Variant[paramsQuantity + 1];
      System.arraycopy(paramsVar, 0, params, 0, paramsQuantity);
      params[paramsQuantity] = conn;
    }
    return ebfSQLExecuteQuery(sql.getString(), paramsQtt.getLong().intValue(), params);
  }
```

---

## Abrir Consulta Dinâmica Avançada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOpenAdvancedQuery` |
| **Código** | 694 |
| **Assinatura** | `Abrir Consulta Dinâmica Avançada (Letras;Variante;Inteiro;Variante): Tabela` |
| **Parâmetros** | Letras;Variante;Inteiro;Variante |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa uma consulta SQL e retorna uma tabela com os dados. Caso a consulta possua parâmetros avançados a
mesma será convertida retornando os dados de acordo o valor passado por parâmetro.

Parâmetro(s):
1. Consulta SQL. (Letras)
2. Conexão Adicional. (Variante, Opcional)
3. Quantidade de Parâmetros. (Inteiro, Opcional)
4. Lista de Parâmetros. (Variante, Opcional)

Retorno:
Tabela. (Tabela)

Observação: 
Esta função não suporta :: para conversão de dados.

Exemplo: 
Assumindo o script SELECT ACO_CODIGO,ACO_NOME FROM FR_ACAO WHERE (ACO_CODIGO =: FUNCAO_sessao_VALOR); o retorno será o(s)
dado(s) de acordo o valor da Variável de Sessão.

### Código Servidor (Java)

```java
protected final Variant ebfOpenAdvancedQuery(Variant sqlVar) throws Exception {
    return ebfOpenAdvancedQuery(sqlVar, Variant.VARIANT_NULL, Variant.VARIANT_NULL, Variant.VARIANT_NULL);
}
protected final Variant ebfOpenAdvancedQuery(Variant sqlVar, Variant conn, Variant paramsQttUserVar, Variant paramsVar) throws Exception {
   
    String sql =  getData().parseSystemParams(sqlVar.getString());
    List<String> arrayFieldsFilter = ebfOpenAdvancedQueryParser(sql);
    wfr.sys.PreparedSQL preparedSQL = new wfr.sys.PreparedSQL(sql, getData(), request);
    int auxUser = 0, auxSQL = 0, auxIntParams = 0;
    List<String> auxParams = new ArrayList<String>();   
    int paramsQtt = arrayFieldsFilter.size();
    //Obtém a quantidade de parâmetros igual a "?" no SQL; 
    for(int i=0; i< paramsQtt; i++){
      if(arrayFieldsFilter.get(i).toString().trim().equals("")){
	 auxParams.add(arrayFieldsFilter.get(i));
      }
    }
    auxIntParams = auxParams.size();
    String pSQL = preparedSQL.getSQL();
    List<Object> arrayValuesSQL = preparedSQL.getValues();
    List<Object> arrayValuesUser = new ArrayList<Object>();    
    if (paramsVar.getObject() instanceof List) {
      arrayValuesUser = (List<Object>) paramsVar.getObject(); 
    }
    //Realiza a equivalência da quantidade de parâmetros passado pelo usuário e o retorno da variável arrayFieldsFilter;
    while(auxIntParams != arrayValuesUser.size()){
    	paramsQtt = paramsQtt - 1;
    	auxIntParams = auxIntParams - 1;
    }    
   
    Variant[] params;
    if (conn.getObject() instanceof DBConnection) {
      params = new Variant[paramsQtt + 1];
      params[paramsQtt] = conn;
    } else {
      params = new Variant[paramsQtt];
    }
    
    for (int i = 0; i < paramsQtt; i++) {  
      if (arrayFieldsFilter.get(i).toString().trim().equals("")) {
      	if(arrayValuesUser.size() > 0){
          params[i] = new Variant(arrayValuesUser.get(auxUser++));
      	}
      } else if(!arrayFieldsFilter.get(i).toString().trim().equals("")) {
        params[i] = new Variant(arrayValuesSQL.get(auxSQL++));
      }
    }
   
    params = params.length == 0? null : params;
    return ebfSQLExecuteScrollQuery(pSQL, paramsQtt, params);
}

protected final List<String> ebfOpenAdvancedQueryParser(String SQL) {
      SQL = SQL + " ";
      final String escapes = " \n\t\r\'\":)(,-+<>=[]";
      List<String> params = new ArrayList<String>();
      boolean in = false;
      boolean reading = false;
      String p = "";
      for (int i = 0; i < SQL.length(); i++) {
        char c = SQL.charAt(i);

        if (reading) {
          if (escapes.indexOf(c) >= 0) {
            reading = false;

            params.add(p);
            p = "";
          } else {
            p = p + c;
          }
        }

        if (c == '\'') {
          in = !in;
        }

        if (!in) {
          if (c == ':' || c == '?') {
            p = "";
            reading = true;
          }
        }
      }

      if (p.length() > 0) {
        params.add(p);
      }

      return params;
}
```

---

## Abrir Consulta Dinâmica Navegável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLDynamicScrollQuery` |
| **Código** | 308 |
| **Assinatura** | `Abrir Consulta Dinâmica (Letras;Variante;Inteiro;Variante...) : Tabela` |
| **Parâmetros** | Letras;Variante;Inteiro;N'Variante |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Executa um comando de Seleção [SELECT] no Banco de dados retornando dinamicamente uma tabela com os dados.
Caso seja necessário passar parâmetros, este deve estar na consulta com uma interrogação (?) na ordem da passagem dos mesmos.

Parâmetro(s):
1. Comando de Seleção. (Letras)
2. Conexão. (Variante, Opcional)
3. Quantidade de Parâmetros. (Inteiro)
4. Lista contendo os parâmetros. (N' Variante)

Retorno: 
Retorna uma Consulta Dinâmica. (Tabela)

Observações:
1. Essa função é usada para fazer um SELECT (seleção) no banco de dados desejado. Utilize a função "Tabela para Lista" para visualizar todo o conteúdo do retorno.
2. Caso seja necessário executar a consulta em um outro banco de dados, é necessário passar a conexão no 2° Parâmetro. 
3. Para criar essa conexão consulte a ajuda sobre a função "Abrir Conexão MSSQL" ,  "Abrir Conexão Firebird" ou qualquer outro banco.

Exemplo: 
Assumindo como 1° Parâmetro = SELECT aco_codigo, aco_nome FROM fr_acao WHERE aco_codigo = ?, 2° Parâmetro = (Null) - *Conexão Principal, 3° Parâmetro = 1 e 4° Parâmetro = 10.

### Código Servidor (Java)

```java
protected final Variant ebfSQLDynamicScrollQuery(Variant sql, Variant conn, Variant paramsQtt, Variant... paramsVar) throws Exception {
    Variant[] params;
    
    if (paramsVar[0].getObject() instanceof List) {
      
      int paramsQuantity = paramsQtt.getLong().intValue();
      
      List paramsList = List.class.cast(paramsVar[0].getObject());
      
      params = new Variant[paramsQuantity + 1];
      
      for (int i = 0; i < paramsQuantity; i++) {
        if (paramsList.get(i) instanceof Variant)
          params[i] = (Variant) paramsList.get(i);
        else
          params[i] = new Variant(paramsList.get(i));
      }
      
      params[paramsQuantity] = conn;
      
    } else {      
      int paramsQuantity = paramsVar.length;
      
      params = new Variant[paramsQuantity + 1];
      System.arraycopy(paramsVar, 0, params, 0, paramsQuantity);

      params[paramsQuantity] = conn;
    }

    return ebfSQLExecuteScrollQuery(sql.getString(), paramsQtt.getLong().intValue(), params);
  }
```

---

## Abrir Consulta Navegável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteScrollQuery` |
| **Código** | 276 |
| **Assinatura** | `Abrir Consulta Navegável (SQL Consulta;Variante) : Tabela` |
| **Parâmetros** | SQL Consulta;Variante |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Executa um comando de Seleção no Banco de Dados e permite navegação nesses dados. 
Permite o uso das funções "Próximo Registro", "Registro Anterior", "Último Registro", "Primeiro Registro" e "Ir para Registro" da categoria Banco de Dados e também o uso na função "Modificar Consulta do Formulário ou Grade".

Parâmetro(s):
1. Comando de Seleção SQL. (SQL Consulta)
2. Conexão. (Variante, Opcional)

Retorno: 
Retorna uma Consulta. (Tabela)

Observações:
1. A partir da versão 1.0.0.2 a função passa a validar se a consulta passada por parâmetro contém apenas a instrução SELECT.
2. Essa função é usada para fazer um SELECT (seleção) no banco de dados desejado.
3. Caso seja utilizada a função "Obter Conexão Adicional" no segundo parâmetro, as entidades do banco de dados da conexão adicional aparecerão automaticamente no "Wizard SQL".
4. Caso seja utilizada funções de "Abrir Conexão MySQL/FireBird/Oracle..." não será possível montar a consulta por diagrama.
5. Caso seja necessário executar a consulta em um outro banco de dados, é necessário 
passar a conexão para este. Para criar essa conexão consulte a ajuda sobre a função "Abrir Conexão MSSQL"  ou "Abrir Conexão Firebird".
6. Esta função não suporta :: para conversão de dados.

Exemplo: 
Assumindo como 1º parâmetro o comando de seleção que será passado para o banco de dados para motn, 2°parâmetro(conexão), sendo opcional.

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteScrollQuery(String sql, int paramsQtt, Variant... variants) throws Exception {
  Long startTimeFunction = System.currentTimeMillis();
  wfr.util.Functions.checkInvalidCommand(sql);
  ResultSet rSet = null;
  DBConnection conn = null;

  if (variants != null) {
    Variant connVar = variants[variants.length - 1];
    if (connVar.getObject() instanceof DBConnection) {
      conn = (DBConnection) connVar.getObject();
    }
  }

  DBConnection tempConn = (conn == null ? connection : conn);
  List<Object> rsParams = new ArrayList<Object>();
  if (variants != null) {
    for (int i = 0; i < paramsQtt; i++) {
      Variant variant = variants[i];
      Object data = null;
      if (variant.getType() == WFRRuleType.NULL) {
        data = new wfr.sys.Data(null, 0);
      } else if (variant.getType() == WFRRuleType.LONG) {
        data = variant.getLong();
      } else if (variant.getType() == WFRRuleType.DOUBLE) {
        data = variant.getDouble();
      } else if (variant.getType() == WFRRuleType.BOOLEAN) {
        data = variant.getBoolean();
      } else if (variant.getType() == WFRRuleType.DATE) {
        data = new java.sql.Timestamp(variant.getDate().getTime());
      } else if (variant.getType() == WFRRuleType.STRING) {
        data = variant.getString();
      } else {
        data = variant.getObject();
      }
      rsParams.add(data);
    }
  }

  rSet = tempConn.getResultSet2(sql, rsParams);
  rSet.next();
  openedResultSetList.add(rSet);

  Long endTimeFunction = System.currentTimeMillis();
  wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteScrollQuery", startTimeFunction, endTimeFunction);

  return VariantPool.get(rSet);
}
```

---

## Abrir Consulta Não Gerenciada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteQueryUnmanaged` |
| **Código** | 104 |
| **Assinatura** | `Abrir Consulta Não Gerenciada (SQL Consulta; [Conexão]) : Tabela;` |
| **Parâmetros** | SQL Consulta;Variante |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para abrir uma consulta no Banco de Dados, atribuindo esta consulta em uma variável do tipo tabela.
Exerce quase a mesmo papel da função "Abrir Consulta", com a única diferença que a consulta não é fechada automaticamente, 
sendo necessário o uso da função "Fechar Consulta". Vide descrições das funções "Abrir Consulta" e "Fechar Consulta".

Parâmetro(s):
1. SQL Consulta.
2. Conexão ao Banco de Dados. (Variante)

Retorno: 
Retorna a consulta passada no 1º Parâmetro. (Tabela)

Observações:
1. A partir da versão 1.0.0.1 a função passa a validar se a consulta passada por parâmetro contém apenas a instrução SELECT.
2. É necessário que após a utilização da consulta criada pela função "Abrir Consulta Não Gerenciada" a mesma seja fechada com a função "Fechar Consulta".
3. Caso seja utilizada a função "Obter Conexão Adicional" no 2º Parâmetro, as entidades do banco de dados.
da conexão adicional aparecerão automaticamente no "Wizard SQL".
4. Caso seja utilizada funções de "Abrir Conexão MySQL/FireBird/Oracle..." não será possível montar a consulta por diagrama.
5. Esta função não suporta :: para conversão de dados.

Exemplo: 
Assumindo como 1° Parâmetro a função Abrir Consulta Não Gerenciada, 2° Parâmetro: consulta a ser realizada no Wizard SQL, atribua seu retorno a variável tabela e feche a consulta com a função (Fechar Consulta).

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteQueryUnmanaged(String sql, int paramsQtt, Variant... variants) throws Exception {
  Long startTimeFunction = System.currentTimeMillis();
  wfr.util.Functions.checkInvalidCommand(sql);
  ResultSet rSet = null;
  DBConnection conn = null;
  PreparedStatement pStmt;

  if (variants != null) {
    Variant connVar = variants[variants.length-1];
    if (connVar.getObject() instanceof DBConnection) {
      conn = (DBConnection) connVar.getObject();
    }
  }

  if (conn == null) {
    pStmt = connection.getPreparedStatement(sql);
  } else {
    pStmt = conn.getPreparedStatement(sql); 
  }

  if (variants != null) {
    for (int i = 0; i < paramsQtt; i++) {
      Variant variant = variants[i];
      if (variant.getType() == NULL) {
        pStmt.setNull(i + 1, Types.VARCHAR);
      } else if (variant.getType() == LONG) {
        pStmt.setLong(i + 1, variant.getLong());
      } else if (variant.getType() == DOUBLE) {
        pStmt.setDouble(i + 1, variant.getDouble());
      } else if (variant.getType() == BOOLEAN) {
        pStmt.setBoolean(i + 1, variant.getBoolean());
      } else if (variant.getType() == DATE) {
        pStmt.setTimestamp(i + 1, new Timestamp(variant.getDate().getTime()));
      } else if (variant.getType() == STRING) {
        pStmt.setString(i + 1, variant.getString());
      } else {
        pStmt.setObject(i + 1, variant.getObject());
      }
    }
  }

  rSet = pStmt.executeQuery();
  rSet.next();

  Long endTimeFunction = System.currentTimeMillis();
  wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteQueryUnmanaged", startTimeFunction, endTimeFunction);
  return VariantPool.get(rSet);
}
```

---

## Abrir Nova Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetNewConnection` |
| **Código** | 416 |
| **Assinatura** | `Abrir nova conexão (Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função abre uma nova conexão, retornando a referência de uma conexão passada como parâmetro. 
Caso nenhuma conexão seja informada, será feita uma nova conexão com a conexão principal do sistema.

Parâmetro:
1. Conexão.

Retorno:
Referência da Conexão aberta. (Variante)

Observação:
Caso deseje abrir uma nova conexão com um banco que não seja o principal, deve-se usar as funções "Abrir Conexão" da categoria "Banco de Dados".

### Código Servidor (Java)

```java
protected final Variant ebfGetNewConnection (Variant newConnection) throws Exception {
  DBConnection conn = null;
  if (newConnection.getObject() instanceof DBConnection) {
    conn = (DBConnection) newConnection.getObject();
    return new Variant(conn.getNewDBConnection());
  }
  return new Variant(this.getSystem().getNewDBConnection());
}
```

---

## Abrir conexão MYSQL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLMYSQLOpenConnection` |
| **Código** | 306 |
| **Assinatura** | `Abrir conexão MYSQL(Letras;Letras;Letras;Letras:Lógico) : Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Lógico |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função abre uma conexão com um banco de dados em MYSQL, para a partir da mesma, o usuário poder executar comandos ou seleções no banco de dados.

Parâmetro(s):
1. Host do Banco de Dados. (Letras)
2. Nome do Banco de Dados. (Letras)
3. Login. (Letras)
4. Senha. (Letras)
5. Fechar Conexão quando terminar? (Lógico)

Retorno: 
Retorna uma conexão. (Variante) 

Exemplo: 
Assumindo como 1° parâmetro: 127.0.0.1, 2° parâmetro: o nome do banco, 3°parâmetro: SA, 4° parâmetro: 123456 e 5°parâmetro o valor falso o retorno será uma conexão com o banco MYSQL.

### Código Servidor (Java)

```java
protected final Variant ebfSQLMYSQLOpenConnection(Variant hostNameVar, Variant databaseVar, Variant userVar, Variant passwordVar, Variant closeWhenDone) throws Exception {
    String hostName = hostNameVar.getString();
    String user = userVar.getString();
    String password = passwordVar.getString();
    String database = databaseVar.getString();

    validateDBConnectionData(hostName, database, user);

    DBConnection conn = DBConnection.createConnection(DBConnection.MYSQL, hostName, database, user, password, DBConnection.ISO8859);
    conn.startTransaction();

    if (closeWhenDone.getBoolean()) 
      openedResultSetList.add(conn);

    return VariantPool.get(conn);
  }
```

---

## Apagar Registros Tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteDynamicDelete` |
| **Código** | 591 |
| **Assinatura** | `Apagar Registros Tabela(N'Letras)` |
| **Parâmetros** | N'Letras |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função recebe como parâmetro o nome de uma tabela, e executa o comando [DELETE FROM] e apagando assim todos os registros da mesma.
Nessa função é possível acrescentar mais parâmetros, ou seja, passar mais tabelas para a exclusão do seu conteúdo.

Parâmetro:
1. Nome da Tabela. (N' Letras)

Retorno: 
Não Possui.

Observações:
1. Essa função é usada para apagar todos os registros das tabelas passadas por parâmetro.
2. A função pode receber vários parâmetros. (Tabelas)

Exemplo: 
Assumindo como 1° Parâmetro: NOME_TABELA  e 2° Parâmetro: NOME_TABELA_2L

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteDynamicDelete(Variant... tables) throws Exception {
    Statement stmt = null;
    try {
      if (tables != null) {
        stmt = connection.getConnection().createStatement();
        for (Variant tableVariant : tables) {
          String table = tableVariant.getString();
          if (table != null && !table.trim().equals("")) {
            stmt.addBatch("DELETE FROM " + table);
          }
        }
      }
      stmt.executeBatch();
    } catch (Exception ex) {
      logger.error(WFRSystem.DEFAULT_USER, WFRSystem.DEFAULT_SYSTEM, ex);
      throw ex;
    } finally {
      DBConnection.close(stmt);
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Campo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLField` |
| **Código** | 551 |
| **Assinatura** | `Campo (Tabela;Campo) : Variante` |
| **Parâmetros** | Tabela;Campo |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função recebe como parâmetro o resultado de uma consulta e uma constante do tipo campo. 
A função procura dentro da consulta SQL, a constante do tipo campo que foi passada como 
parâmetro e retorna o conteúdo da mesma.

Parâmetro(s):
1. Resultado de uma consulta. (Tabela)
2. Campo.

Exemplo:
Não possui.

Retorno: 
Retorna o Valor do Campo desejado. (Variante)

Observações:
1. Essa função é usada para obter um campo de uma SELECT (Comando de Seleção do Banco de Dados).
2. A consulta geralmente é uma consulta SQL feita através da função "Abrir Consulta" da categoria Banco de Dados.

### Código Servidor (Java)

```java
protected final Variant ebfSQLField(Variant variantRSet, Variant variantField) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    ResultSet rs = variantRSet.getResultSet();
    if (hasData(rs)) {
      Object valueObj = rs.getObject(variantField.getString());
      if (valueObj instanceof oracle.sql.TIMESTAMP) {
        oracle.sql.TIMESTAMP timestamp = (oracle.sql.TIMESTAMP) valueObj;
        value = VariantPool.get(timestamp.dateValue());
      } else {
        value = VariantPool.get(valueObj);
      }
    }
    return value;
  }
```

---

## Campos do SQL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLFieldList` |
| **Código** | 25 |
| **Assinatura** | `Campos do SQL (Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função recebe como parâmetro um comando de Seleção e retorna em uma lista com os campos selecionados.

Parâmetro(s):
1. Comando de Seleção do Banco de Dados. (Letras)
2. Fonte de Dados (Nome da Conexão Adicional). (Letras)

Retorno: 
Retorna os Nomes dos Campos Desejados. (Variante)

Observações: 
1. Essa função é usada para obter os campos de uma SELECT (Comando de Seleção do Banco de Dados), retornando uma lista com os títulos dos campos.
2. Cada vez que esta função for executada, uma nova consulta será realizada no banco de dados para obter a lista de campos.

Exemplo: 
Assumindo como 1º Parâmetro: SELECT TAB_COD, TAB_NOME FROM TABELA
Retorno será: [TAB_COD,TAB_NOME]

### Código Servidor (Java)

```java
protected final Variant ebfSQLFieldList(Variant VarSQL) throws Exception {
  return ebfSQLFieldList(VarSQL, new Variant(""));
}  

protected final Variant ebfSQLFieldList(Variant VarSQL, Variant AddConn) throws Exception {
  List<String> l = new ArrayList<String>(); 
  String sql = VarSQL.toString();	
  List<String> paramsList = WFRData.getParams(sql);
  // Substitui os parâmetros (:...) por interrogação (?)
  List<String> paramsListReverse = new ArrayList<String>(paramsList);
  Collections.sort(paramsListReverse);
  Collections.reverse(paramsListReverse);
  for (String param : paramsListReverse) {
    sql = sql.replaceAll(":" + param, "?");
  }
  DBConnection conn = null;	
  if(AddConn.getString().equals("")){    
     conn = connection;
  }else{
     conn = client.getData().connection(AddConn.getString());
  }	
    
  PreparedStatement pStmt = conn.getPreparedStatement(sql);
  int qtt = paramsList.size();
  for (int i = 1; i <= qtt; i++) {
    pStmt.setNull(i, Types.VARCHAR);
  }   
  ResultSet rSet = pStmt.executeQuery();
  java.sql.ResultSetMetaData rsmd = rSet.getMetaData();
  int numberOfColumns = rsmd.getColumnCount();    
  for (int i = 1; i <= numberOfColumns; i++) {
    l.add(rsmd.getColumnName(i));
  }
  return VariantPool.get(l);
}
```

---

## Executar Atualização

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteUpdate` |
| **Código** | 542 |
| **Assinatura** | `Executar Atualização (SQL Atualização;Variante) : Inteiro` |
| **Parâmetros** | SQL Atualização;Variante |
| **Retorno** | Inteiro |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Executa um comando SQL de Inserção, Atualização ou Exclusão no banco de dados. 

Parâmetro(s):
1. SQL Atualização. (Wizard SQL)
2. Conexão (Variante, Opcional)

Retorno: 
ID da tabela (Para o banco MSSQL e MySQL). (Inteiro)

Observações:
1. Para criar essa conexão consulte a ajuda sobre a função "Abrir Conexão MSSQL",  "Abrir Conexão Firebird" ou outro banco.
2. Caso seja utilizada a função "Obter Conexão Adicional" no segundo parâmetro, as entidades do banco de dados da conexão adicional aparecerão automaticamente no "Wizard SQL"
3. É possível utilizar as funções try/catch com esta função para a captura e tratamento dos erros.
4. Para fazer Exclusão/Alteração/Inserção em conexões adicionais é necessário utilizar as funções de transação "Transação: Abrir" e "Transação: Commit".

Exemplo: 
Assumindo como 1° Parâmetro o comando de inserção, atualização ou exclusão que será passado para o banco de dados e o 2° parâmetro (conexão). 
O retorno será o id (Para o banco MSSQL e MySQL)

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteUpdate(String sql, int paramsQtt, Variant... variants) throws Exception {
  Long startTimeFunction = System.currentTimeMillis();
  PreparedStatement pStmt = null;
  long autoinc = -1;
  try {
    DBConnection conn = null;
    if (variants != null) {
      Variant connVar = variants[variants.length - 1];
      if (connVar.getObject() instanceof DBConnection) {
        conn = (DBConnection) connVar.getObject();
      }
    }

    if (developmentMode) {
      System.out.println("### SQL BEGIN [" + this.ruleName + "] ###");
      System.out.println(sql);
      System.out.println();
    }
    
    DBConnection tempConn = (conn == null ? connection : conn);
    if (tempConn.getMetaData().hasAutoincSuport() && tempConn.getAutoinc().length() == 0) {
      pStmt = tempConn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    } else {
      pStmt = tempConn.getConnection().prepareStatement(sql);
    }

    if (variants != null) {
      for (int i = 0; i < paramsQtt; i++) {
        Variant variant = variants[i];
        
        if (developmentMode) {
          System.out.print("[" + (i + 1) + "] - ");
          if (variant.isNull()) {
            System.out.println("NULL");
          } else {
            System.out.println(variant.toString());
          }
        }

        if (variant.isNull()) {
          try {
            pStmt.setNull(i + 1, pStmt.getParameterMetaData().getParameterType(i + 1));
          } catch (Exception ex) {
            pStmt.setNull(i + 1, Types.NULL);
          }
        } else if (variant.getType() == WFRRuleType.LONG) {
          pStmt.setLong(i + 1, variant.getLong());
        } else if (variant.getType() == WFRRuleType.DOUBLE) {
          pStmt.setDouble(i + 1, variant.getDouble());
        } else if (variant.getType() == WFRRuleType.BOOLEAN) {
          pStmt.setBoolean(i + 1, variant.getBoolean());
        } else if (variant.getType() == WFRRuleType.DATE) {
          pStmt.setTimestamp(i + 1, new Timestamp(variant.getDate().getTime()));
        } else if (variant.getType() == WFRRuleType.STRING) {
          pStmt.setString(i + 1, variant.getString());
        } else {
          pStmt.setObject(i + 1, variant.getObject());
        }
      }
    }
    tempConn.execStatement(pStmt);
    try {
      if (tempConn.getMetaData().hasAutoincSuport() && tempConn.getAutoinc().length() == 0) {
        ResultSet keys = pStmt.getGeneratedKeys();
        if (keys.next()) {
          autoinc = keys.getLong(1);
          
          if (developmentMode) {
            System.out.println("[GENERATED KEY] - " + autoinc);
          }
        }
      }
    } catch (Exception ex) {
      logger.error(WFRSystem.DEFAULT_USER, WFRSystem.DEFAULT_SYSTEM, ex);
    }
  } catch (Exception ex) {
    logger.error(WFRSystem.DEFAULT_USER, WFRSystem.DEFAULT_SYSTEM, ex);
    throw ex;
  } finally {
    if (developmentMode) {
      System.out.println("### SQL END [" + this.ruleName + "] ###");
      System.out.println();
    }

    DBConnection.close(pStmt);
    Long endTimeFunction = System.currentTimeMillis();
    wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteUpdate", startTimeFunction, endTimeFunction);
  }
  return VariantPool.get(autoinc);
}
```

---

## Executar Comandos SQL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteBatch` |
| **Código** | 652 |
| **Assinatura** | `Executar Comandos SQL (Letras;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função recebe como parâmetro uma constante do tipo letras, onde dentro dessa constante pode conter apenas 
um comando SQL. Essa função executa o comando SQL no banco de dados.
Caso seja necessário passar parâmetros, este deve estar na consulta com uma interrogação (?) na ordem da 
passagem dos mesmos.

Parâmetro(s):
1. Comando SQL a ser executado. (Letras)
2. Conexão com outro banco de dados. (Variante, Opcional)
3. Lista de parâmetros. (Variante, Opcional)

Retorno: 
Retorna NULO caso o comando SQL seja executado com sucesso. Caso haja algum erro, este será retornado.
(Variante)

Observações:
1. Não é possível o uso da instrução SELECT uma vez que o retorno NULO indica que foi executado com sucesso
2. Deve ser executado apenas um comando na função.

Exemplo: 
1. Assumindo como 1° Parâmetro : INSERT INTO EMPRESA (CODIGO, DESCRICAO) VALUES (1,"Softwell"), 2° e 3° parâmetro NULO,  o retorno será NULO caso o comando seja executado com sucesso, ou variante caso ocorra algum erro durante a execução da instrução SQL.
2. Assumindo os valores como:
1° Parâmetro:  INSERT INTO EMPRESA (CODIGO, DESCRICAO) VALUES (?, ?).
2° Parâmetro: (Null) - *Conexão Principal.
3° Parâmetro: Lista com os valores 1 e "Softwell".

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteBatch(Variant sql) throws Exception {
    return ebfSQLExecuteBatch(sql, null);
  }
  protected final Variant ebfSQLExecuteBatch(Variant sql, Variant connectionVar) throws Exception {
    DBConnection connection;
    if (connectionVar.getObject() instanceof DBConnection) {
      connection = DBConnection.class.cast(connectionVar.getObject());
    } else {    
      connection = this.connection;
    }    

    Statement stm = null;
    try {
      stm = connection.getConnection().createStatement();
      stm.addBatch(sql.getString());
      stm.executeBatch();
      return Variant.VARIANT_NULL;
    } catch (Exception e) {
      return VariantPool.get("Erro: " + e.getMessage());
    } finally {    
      DBConnection.close(stm);      
    }
  }  
  protected final Variant ebfSQLExecuteBatch(Variant sql, Variant connectionVar, Variant variants) throws Exception {
    DBConnection connection;
    ResultSet rSet = null;
    if (connectionVar.getObject() instanceof DBConnection) {
      connection = DBConnection.class.cast(connectionVar.getObject());
    } else {
      connection = this.connection;
    }

    PreparedStatement pStmt = connection.getPreparedStatement(sql.getString());
    Statement stm = null;

  if (!variants.isNull()) {
      List<?> variantList = List.class.cast(variants.getObject());
      for (int i = 0; i < variantList.size(); i++) {
        Variant variant = new Variant(variantList.get(i));
        if (developmentMode) {
          System.out.print("[" + (i + 1) + "] - ");
          if (variant.isNull() ) {
            System.out.println("NULL");
          } else {
            System.out.println(variant.toString());
          }
        }

        if (variant.getType() == WFRRuleType.NULL) {
          try {
            pStmt.setNull(i + 1, pStmt.getParameterMetaData().getParameterType(i + 1));
          } catch (Exception ex) {
            pStmt.setNull(i + 1, Types.NULL);
          }
        } else if (variant.getType() == WFRRuleType.LONG) {
          pStmt.setLong(i + 1, variant.getLong());
        } else if (variant.getType() == WFRRuleType.DOUBLE) {
          pStmt.setDouble(i + 1, variant.getDouble());
        } else if (variant.getType() == WFRRuleType.BOOLEAN) {
          pStmt.setBoolean(i + 1, variant.getBoolean());
        } else if (variant.getType() == WFRRuleType.DATE) {
          pStmt.setTimestamp(i + 1, new Timestamp(variant.getDate().getTime()));
        } else if (variant.getType() == WFRRuleType.STRING) {
          pStmt.setString(i + 1, variant.getString());
        } else {
          pStmt.setObject(i + 1, variant.getObject());
        }
      }
      
      connection.execStatement(pStmt);
      return Variant.VARIANT_NULL;
    } else {
      try {
        stm = connection.getConnection().createStatement();
        stm.addBatch(sql.getString());
        stm.executeBatch();
        return Variant.VARIANT_NULL;
      } catch (Exception e) {
        return VariantPool.get("Erro: " + e.getMessage());
      } finally {
        DBConnection.close(stm);
      }
    }
  }
```

---

## Executar Comandos SQL Sem Transação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteBatchNoTransaction` |
| **Código** | 307 |
| **Assinatura** | `Executar Comandos SQL Sem Transação (Variante;Variante): Letras` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Letras |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função executa um comando ou uma lista de comandos SQL no banco de dados que serão executados sem estar em uma transação.

Parâmetro(s):
1. Comando ou lista de comandos SQL. (Variante)
2. Conexão com outro banco de dados. (Variante, Opcional)

Retorno: 
Retorna NULO caso o comando SQL seja executado com sucesso. Caso haja algum erro, este será retornado. (Letras)

Exemplo: 
Assumindo como Parâmetro 1° insert into empresa (codigo,descrição) values (1,"Softwell") o retorno será  nulo caso o comando seja executado com sucesso ou letras caso haja algum erro.

### Código Servidor (Java)

```java
protected final Variant ebfSQLExecuteBatchNoTransaction(Variant sql, Variant connectionVar) throws Exception {
  DBConnection connection;     
  if (connectionVar.getObject() instanceof DBConnection) {
      connection = DBConnection.class.cast(connectionVar.getObject());
  } else {    
      connection = this.connection;
  }
  boolean supportTransaction = connection.getSupportTransaction();
  boolean autocommit = connection.getAutoCommit();    
  try {
    connection.setSupportTransaction(false);
    connection.setAutoCommit(true);  
    java.sql.Statement stm = null;
    try {
      stm = connection.getConnection().createStatement();
      if(sql.getObject() instanceof ArrayList){
         ArrayList list = (ArrayList) sql.getObject();
         for(int i = 0; i < list.size(); i++){           
             stm.addBatch(list.get(i).toString());
         }
         stm.executeBatch();
         return Variant.VARIANT_NULL;
      }else{
  stm.addBatch(sql.getString());
  stm.executeBatch();        
  return Variant.VARIANT_NULL;
      }   
    }catch (Exception e) {
       return VariantPool.get("Erro: " + e.getMessage());
    }finally {      
       DBConnection.close(stm);
    }
  }finally {
    connection.setSupportTransaction(supportTransaction);
    connection.setAutoCommit(autocommit);
  }
}
```

---

## Executar Procedure

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteProcedure` |
| **Código** | 250 |
| **Assinatura** | `Executar Procedure(Letras,Variante,Variante,Variante) : Variante` |
| **Parâmetros** | Letras;Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função executa uma procedure do banco de dados. 

Parâmetro(s):
1. Nome da procedure a ser executada. (Letras)
2. Lista contendo parâmetros de entrada da procedure. (Variante) (Ver observação 4)
3. Conexão. (Variante) (Ver observação 5)
4. Lista de número referente ao tipo de dados que serão retornados. (Variante) (Ver observação 6)

Retorno: 
Uma lista de Variantes. (Variante)
Segue a tabela com os tipos que podem ser retornados:
----  12 - VARCHAR
         2 - NUMERIC
       16 - BOOLEAN
       91 - DATE
       92 - TIME
       93 - TIMESTAMP       
         8 - DOUBLE
         6 - FLOAT
         7 - REAL       
         2 - BINARY        
         1 - CHAR
   2004 - BLOB 
   2005 - CLOB
         5 - BIGINT
----  10 - CURSOR (ORACLE) (É necessário avançar para o primeiro registro)

Observações:
1. Se no lugar da lista informada do quarto parâmetro for fornecido um valor nulo, a função entenderá que a procedure não possui retorno.
2. Os números que forem inclusos na lista do 4º parâmetro devem ser do tipo INT.
3. Ao executar procedures com parâmetros IN,OUT é necessário que os parâmetros OUT sejam declarados ao final.
4. O 2º Parâmetro será nulo se a procedure não tiver parâmetros de entrada.
5. Caso no 3º Parâmetro a conexão seja nula, será usada a conexão principal do sistema.
6. No 4º Parâmetro deve ser verificado o número correspondente na tabela.

Exemplo: 
Suponhamos que temos uma procedure no banco de dados que faz a soma de dois números ( parâmetros de entrada IN ) e retorna o resultado desta soma (OUT). 
O 1° parâmetro será o nome da função "sp_soma", o 2° parâmetro fará o uso da função: "Criar Lista a partir dos elementos" com os valores Num1 e Num 2, 3° parâmetro será uma conexão (passando nulo para usar a conexão principal do sistema) e o 4° parâmetro 
faremos o uso da função "Criar Lista a partir dos elementos" com o valor do resultado com o mesmo tipo da procedure do banco (inteiro).

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfSQLExecuteProcedure(Variant procedureName, Variant paramsListVar, Variant connectionVar, Variant returnType) throws Exception {
  Long startTimeFunction = System.currentTimeMillis();
  int returnValuesSize = 0;
  List<Long> returnTypeList = null;
  List<Integer>returnTypeListInteger = null;
  if (!returnType.isNull() && returnType.getObject() instanceof List) {
    returnTypeList = List.class.cast(returnType.getObject());
    if(!(returnTypeList.get(0) instanceof Long)){
      returnTypeListInteger = List.class.cast(returnType.getObject());
    }
    returnValuesSize = returnTypeList.size();
  }

  int listSize = 0;
  List<Object> paramsList = null;
  if (!paramsListVar.isNull() && paramsListVar.getObject() instanceof List) {
    paramsList = List.class.cast(paramsListVar.getObject());
    listSize = paramsList.size();
  }

  int argumentsSize = listSize + returnValuesSize;

  StringBuilder sql = new StringBuilder();
  sql.append("{call ").append(procedureName.getString()).append("(");
  if (argumentsSize > 0) {
    while (argumentsSize-- > 0) {
      sql.append("?,");
    }
    sql.deleteCharAt(sql.length() - 1);
  }
  sql.append(")}");

  DBConnection conn = connection;
  if (!connectionVar.isNull() && connectionVar.getObject() instanceof DBConnection) {
    conn = DBConnection.class.cast(connectionVar.getObject());
  }

  java.sql.CallableStatement call = conn.getConnection().prepareCall(sql.toString());
  openedResultSetList.add(call);

  for (int i = 0; i < listSize; i++) {
    Variant param = VariantPool.get(paramsList.get(i));
    if (param.getType() == WFRRuleType.NULL) {
      try {
        call.setNull(i + 1, call.getParameterMetaData().getParameterType(i + 1));
      } catch (Exception ex) {
        call.setNull(i + 1, java.sql.Types.NULL);
      }
    } else if (param.getType() == WFRRuleType.LONG) {
      call.setLong(i + 1, param.getLong());
    } else if (param.getType() == WFRRuleType.DOUBLE) {
      call.setDouble(i + 1, param.getDouble());
    } else if (param.getType() == WFRRuleType.BOOLEAN) {
      call.setBoolean(i + 1, param.getBoolean());
    } else if (param.getType() == WFRRuleType.DATE) {
      call.setTimestamp(i + 1, new java.sql.Timestamp(param.getDate().getTime()));
    } else if (param.getType() == WFRRuleType.STRING) {
      call.setString(i + 1, param.getString());
    } else {
      call.setObject(i + 1, param.getObject());
    }
  }
  
  for (int i = 1; i <= returnValuesSize; i++) {
    if(returnTypeListInteger != null){
      if (returnTypeListInteger.get(i - 1) == -10) {
        call.registerOutParameter(listSize + i, oracle.jdbc.OracleTypes.CURSOR);
      } else {
        call.registerOutParameter(listSize + i, returnTypeListInteger.get(i - 1).intValue());
      }
    } else {
      if (returnTypeList.get(i - 1) == -10) {
        call.registerOutParameter(listSize + i, oracle.jdbc.OracleTypes.CURSOR);
      } else {
        call.registerOutParameter(listSize + i, returnTypeList.get(i - 1).intValue());
      }
    }
  }
  
  call.execute();
  
  List<Variant> values = new ArrayList<Variant>(returnValuesSize);
  for (int i = 1; i <= returnValuesSize; i++) {
    Object value = call.getObject(listSize + i);
    values.add(VariantPool.get(value));
  }

  Long endTimeFunction = System.currentTimeMillis();
  wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteProcedure", startTimeFunction, endTimeFunction);
  return VariantPool.get(values);
}
```

---

## Executar Procedure In Out

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteProcedureInOutOracle` |
| **Código** | 378 |
| **Assinatura** | `Executar Procedure In Out(Letras,Variante,Variante,Variante,Variante) : Variante` |
| **Parâmetros** | Letras;Variante;Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função executa uma procedure do banco de dados Oracle.
 
Parâmetro(s):
1. Nome da procedure a ser executada. (Letras)
2. Lista contendo parâmetros de entrada da procedure. (Variante) (Ver observação 1)
3. Conexão. (Variante) (Ver observação 2)
4. Uma lista de número referente ao tipo de dados que serão retornados. (Variante) (Ver observação 3)
5. Lista especificando os tipos de parâmetros da procedure (IN ou OUT). (Variante)

Retorno: 
Uma lista de Variantes.
Tipos que podem ser retornados:
       12 - VARCHAR
         2 - NUMERIC
       16 - BOOLEAN
       91 - DATE
       92 - TIME
       93 - TIMESTAMP       
         8 - DOUBLE
         6 - FLOAT
         7 - REAL       
       - 2 - BINARY        
         1 - CHAR
   2004 - BLOB 
   2005 - CLOB
     - 10 - CURSOR (ORACLE) (É necessário avançar para o primeiro registro)

Observações:
1. O 2º Parâmetro será nulo se a procedure não tiver parâmetros de entrada.
2. Caso a conexão do 3º Parâmetro seja nula, será usada a conexão principal do sistema. 
3. No 4º Parâmetro deve ser Verificado o número correspondente na tabela.
4. Se no lugar da lista informada do quarto parâmetro for fornecido um valor nulo, a função entenderá que a procedure não possui retorno.
    4.2 ProcedureExecutarComando  
    4.3 Valores de entrada 
    4.4 Conexão
    4.5 Retornos (12,8)  
         Legenda referente aos elementos de retorno da procedure
         Primeiro elemento da lista   = Tipo 12 (Varchar)
         Terceiro elemento da lista  = Tipo 8 (Double)
    4.6 Lista especificando cada parâmetros da procedure Ex.: {IN, IN OUT, OUT} (Letras)
5. Os números que forem inclusos na lista do 4º parâmetro devem ser do tipo INT.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfSQLExecuteProcedureInOutOracle(Variant procedureName, Variant paramsListVar, Variant connectionVar, Variant returnType, Variant listVarInOut)
  throws Exception {
  Variant paramsTypeListVar = null;
  return ebfSQLExecuteProcedureInOutOracle(procedureName, paramsListVar, connectionVar, returnType, listVarInOut, paramsTypeListVar);
}

@SuppressWarnings("unchecked")
protected final Variant ebfSQLExecuteProcedureInOutOracle(Variant procedureName, Variant paramsListVar, Variant connectionVar, Variant returnType, Variant listVarInOut, Variant paramsTypeListVar)
  throws Exception {

  Long startTimeFunction = System.currentTimeMillis();
  int returnValuesSize = 0;
  List<Long> returnTypeList = null;
  List<Integer>returnTypeListInteger = null;

  if (!returnType.isNull() && returnType.getObject() instanceof List) {
    returnTypeList = List.class.cast(returnType.getObject());
    if(!(returnTypeList.get(0) instanceof Long)){
      returnTypeListInteger = List.class.cast(returnType.getObject());  
    }
    returnValuesSize = returnTypeList.size();
  }

  int listSize = 0;
  List<Object> paramsList = null;
  if (!paramsListVar.isNull() && paramsListVar.getObject() instanceof List) {
    paramsList = List.class.cast(paramsListVar.getObject());
    listSize = paramsList.size();
  }

  List<Object> paramsTypeList = null;
  if (paramsTypeListVar != null) {
    if (!paramsTypeListVar.isNull() && paramsTypeListVar.getObject() instanceof List) {
      paramsTypeList = List.class.cast(paramsTypeListVar.getObject());
    }
  }

  List<String> listInOut = null;
  if (!listVarInOut.isNull() && listVarInOut.getObject() instanceof List) {
    listInOut = List.class.cast(listVarInOut.getObject());
  }

  int sizeInOut = listInOut.size();
  int countInOut = 0;
  for (int i = 0; i < sizeInOut; i++) {
    if (((listInOut.get(i).toString()).toUpperCase()).equals("IN OUT")) {
      countInOut++;
    }
  }

  int argumentsSize = (listSize - countInOut) + returnValuesSize;

  StringBuilder sql = new StringBuilder();
  sql.append("{call ").append(procedureName.getString()).append("(");
  if (argumentsSize > 0) {
    while (argumentsSize-- > 0) {
      sql.append("?,");
    }
    sql.deleteCharAt(sql.length() - 1);
  }
  sql.append(")}");

  DBConnection conn = connection;
  if (!connectionVar.isNull() && connectionVar.getObject() instanceof DBConnection) {
    conn = DBConnection.class.cast(connectionVar.getObject());
  }

  java.sql.CallableStatement call = null;
  try {
    call = conn.getConnection().prepareCall(sql.toString());
    for (int i = 0; i < listSize; i++) {
      Variant param = VariantPool.get(paramsList.get(i));
      if (param.getType() == WFRRuleType.NULL) {
        try {
        Variant paramType =  VariantPool.get(paramsTypeList.get(i));
          call.setNull(i + 1, Integer.parseInt(paramType.toString()));
        } catch (Exception e) {
          try {
            call.setNull(i + 1, call.getParameterMetaData().getParameterType(i + 1));
          } catch (Exception ex) {
            call.setNull(i + 1, java.sql.Types.NULL);
          }
        }
      } else if (param.getType() == WFRRuleType.LONG) {
        call.setLong(i + 1, param.getLong());
      } else if (param.getType() == WFRRuleType.DOUBLE) {
        call.setDouble(i + 1, param.getDouble());
      } else if (param.getType() == WFRRuleType.BOOLEAN) {
        call.setBoolean(i + 1, param.getBoolean());
      } else if (param.getType() == WFRRuleType.DATE) {
        call.setTimestamp(i + 1, new java.sql.Timestamp(param.getDate().getTime()));
      } else if (param.getType() == WFRRuleType.STRING) {
        call.setString(i + 1, param.getString());
      } else {
        call.setObject(i + 1, param.getObject());
      }
    }

    int count = 0;
    for (int i = 0; i < sizeInOut; i++) {
      if ((listInOut.get(i).toString().toUpperCase()).equals("OUT") || ((listInOut.get(i).toString()).toUpperCase()).equals("IN OUT")) {
        if(returnTypeListInteger != null){
          if (returnTypeListInteger.get(count) == -10) {
            call.registerOutParameter(i + 1, oracle.jdbc.OracleTypes.CURSOR);
          } else {
            call.registerOutParameter(i + 1, returnTypeListInteger.get(count).intValue());
          }
        } else {
          if (returnTypeList.get(count) == -10) {
            call.registerOutParameter(i + 1, oracle.jdbc.OracleTypes.CURSOR);
          } else {
            call.registerOutParameter(i + 1, returnTypeList.get(count).intValue());
          }  
        }
      count++;
      }
    }

    call.execute();

    List<Variant> values = new ArrayList<Variant>(returnValuesSize);
    for (int i = 0; i < sizeInOut; i++) {
      Object value = null;
      if ((listInOut.get(i).toString().toUpperCase()).equals("OUT") || ((listInOut.get(i).toString()).toUpperCase()).equals("IN OUT")) {
        value = call.getObject(i + 1);
        values.add(VariantPool.get(value));
      }
    }

    return VariantPool.get(values);
  } catch (Exception e) {
    throw e;
  } finally {
    DBConnection.close(call);
    Long endTimeFunction = System.currentTimeMillis();
    wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteProcedureInOutOracle", startTimeFunction, endTimeFunction);      
  }
}
```

---

## Executar Procedure com Retorno Complexo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLExecuteProcedureComplex` |
| **Código** | 415 |
| **Assinatura** | `Executar Procedure com Retorno Complexo (Letras;Variante;Variante;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Variante;Variante;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função executa uma procedure do banco de dados. 

Parâmetro(s):
1. Nome da procedure a ser executada. (Letras)
2. Lista contendo parâmetros de entrada da procedure. (Variante) (Ver observação 1)
3. Conexão. (Variante) (Ver observação 2)
4. Uma lista de número referente ao tipo de dados que serão retornados. (Variante) (Ver observação 3)
5. Uma lista de Tipos Complexos. Ex.: [tipo_complexo_1, tipo_complexo_2]. (Variante)

Retorno: 
Uma lista de Variantes. (Variante)
Segue os tipos que podem ser retornados:
       12 - VARCHAR
         2 - NUMERIC
       16 - BOOLEAN
       91 - DATE
       92 - TIME
       93 - TIMESTAMP       
         8 - DOUBLE
         6 - FLOAT
         7 - REAL       
       - 2 - BINARY        
         1 - CHAR
   2004 - BLOB 
   2005 - CLOB
         5 - BIGINT
     - 10 - CURSOR (ORACLE) (É necessário avançar para o primeiro registro)

Observações:
1. O 2º Parâmetro será nulo se a procedure não tiver parâmetros de entrada.
2. Caso a conexão do 2º Parâmetro seja nula, será usada a conexão principal do sistema.
3. No 4º Parâmetro deve ser verificado número correspondente na tabela.
4. Se no lugar da lista informada do quarto parâmetro for fornecido um valor nulo, a função entenderá que a procedure não possui retorno.
5. Os números que forem inclusos na lista do 4º parâmetro devem ser do tipo INT.
6. Função para banco de dados Oracle.
7. Ao executar procedures com parâmetros IN,OUT é necessário que os parâmetros OUT sejam declarados ao final.

Exemplo: 
PROCEDURE_1(NOME IN VARCHAR2, IDADE IN NUMBER, ID_SEQUENCE OUT NUMBER).

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
protected final Variant ebfSQLExecuteProcedureComplex(Variant procedureName, Variant paramsListVar, Variant connectionVar, Variant returnType,
    Variant paramsListTypeComplexVar) throws Exception {

  Long startTimeFunction = System.currentTimeMillis();
  int returnValuesSize = 0;
  List<Long> returnTypeList = null;
  if (!returnType.isNull() && returnType.getObject() instanceof List) {
    returnTypeList = List.class.cast(returnType.getObject());
    returnValuesSize = returnTypeList.size();
  }

  int listSize = 0;
  List<Object> paramsList = null;
  if (!paramsListVar.isNull() && paramsListVar.getObject() instanceof List) {
    paramsList = List.class.cast(paramsListVar.getObject());
    listSize = paramsList.size();
  }

  int listSizeTypeComplex = 0;
  List<Object> paramsListTypeComplex = null;
  if (!paramsListTypeComplexVar.isNull() && paramsListTypeComplexVar.getObject() instanceof List) {
    paramsListTypeComplex = List.class.cast(paramsListTypeComplexVar.getObject());
    listSizeTypeComplex = paramsListTypeComplex.size();
  }

  int argumentsSize = listSize + returnValuesSize;

  StringBuilder sql = new StringBuilder();
  sql.append("{call ").append(procedureName.getString()).append("(");
  if (argumentsSize > 0) {
    while (argumentsSize-- > 0) {
      sql.append("?,");
    }
    sql.deleteCharAt(sql.length() - 1);
  }
  sql.append(")}");

  DBConnection conn = connection;
  if (!connectionVar.isNull() && connectionVar.getObject() instanceof DBConnection) {
    conn = DBConnection.class.cast(connectionVar.getObject());
  }

  java.sql.CallableStatement call = conn.getConnection().prepareCall(sql.toString());
  openedResultSetList.add(call);

  for (int i = 0; i < listSize; i++) {
    Variant param = VariantPool.get(paramsList.get(i));
    if (param.getType() == WFRRuleType.NULL) {
      try {
        call.setNull(i + 1, call.getParameterMetaData().getParameterType(i + 1));
      } catch (Exception ex) {
        call.setNull(i + 1, java.sql.Types.NULL);
      }
    } else if (param.getType() == WFRRuleType.LONG) {
      call.setLong(i + 1, param.getLong());
    } else if (param.getType() == WFRRuleType.DOUBLE) {
      call.setDouble(i + 1, param.getDouble());
    } else if (param.getType() == WFRRuleType.BOOLEAN) {
      call.setBoolean(i + 1, param.getBoolean());
    } else if (param.getType() == WFRRuleType.DATE) {
      call.setTimestamp(i + 1, new java.sql.Timestamp(param.getDate().getTime()));
    } else if (param.getType() == WFRRuleType.STRING) {
      call.setString(i + 1, param.getString());
    } else {
      call.setObject(i + 1, param.getObject());
    }
  }

  int aux = 0;
  for (int i = 1; i <= returnValuesSize; i++) {
    if (returnTypeList.get(i - 1) == -10) {
      call.registerOutParameter(listSize + i, oracle.jdbc.OracleTypes.CURSOR);
    } else if (returnTypeList.get(i - 1) == -11 && aux < listSizeTypeComplex) {
      call.registerOutParameter(listSize + i, oracle.jdbc.OracleTypes.ARRAY, paramsListTypeComplex.get(aux).toString());
      aux++;
    } else {
      call.registerOutParameter(listSize + i, returnTypeList.get(i - 1).intValue());
    }
  }

  call.execute();

  final String OBJ_ARRAY = "oracle.sql.ARRAY";
  List<Variant> values = new ArrayList<Variant>(returnValuesSize);
  for (int i = 1; i <= returnValuesSize; i++) {
    Object value = null;
    if ((call.getObject(listSize + i).toString().length() >= 16) && (call.getObject(listSize + i).toString().substring(0, 16).equals(OBJ_ARRAY))) {
      java.sql.Array array = (java.sql.Array) call.getObject(listSize + i);
      ResultSet rs = array.getResultSet();
      rs.next();
      value = rs.getObject(rs.getRow() + 1);
      rs.close();
    } else {
      value = call.getObject(listSize + i);
    }
    values.add(VariantPool.get(value));
  }

  Long endTimeFunction = System.currentTimeMillis();
  wfr.rules.monitoring.MonitoringManager.getInstance().addMonitoringDatabase(getSystem(), this.ruleName, "ebfSQLExecuteProcedureComplex", startTimeFunction, endTimeFunction);
  return VariantPool.get(values);
}
```

---

## Existem Registros

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLEOF` |
| **Código** | 567 |
| **Assinatura** | `Existem Registros (Tabela) : Lógico` |
| **Parâmetros** | Tabela |
| **Retorno** | Lógico |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função recebe como parâmetro uma consulta SQL que vai estar armazenada em uma variável tabela e verifica se existem registros na consulta, ou seja, se retorna algum resultado. 
Essa função tem o retorno do tipo lógico. Caso haja algum resultado retornará então verdadeiro, caso contrário retornará falso.

Parâmetro:
1. Consulta SQL. (Tabela)

Retorno: 
Retorna verdadeiro ou falso. (Lógico)

Observação:
Essa função é mais usada para decisões por ter um retorno Lógico.

Exemplo: 
Assumindo como 1° Parâmetro a tabela o retorno será true (se houver registros) ou false (se não houver).

### Código Servidor (Java)

```java
protected final Variant ebfSQLEOF(Variant variant) throws Exception {
    ResultSet rs = variant.getResultSet();
    String rsClass = rs.toString();
    try {
      if (rsClass.contains("net.sourceforge.jtds") || rsClass.contains("oracle.jdbc.driver.OracleResultSetImpl")
          || rsClass.contains("org.apache.commons.dbcp.DelegatingResultSet")) {
        if (rs instanceof wfr.database.WFRResultSet)
          return VariantPool.get(rs.getRow() != 0);
        rs.getObject(1);
        return Variant.VARIANT_TRUE;
      } else {
        return VariantPool.get(rs.getRow() != 0);
      }
    } catch (Exception ex) {
    }
    return Variant.VARIANT_FALSE;
  }
```

---

## Exportar tabela para DBF 3

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDataExportToDBF` |
| **Código** | 122 |
| **Assinatura** | `Exportar tabela para DBF 3` |
| **Parâmetros** | Tabela;Letras |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Exporta uma tabela passada como parâmetro para um arquivo dBASE (O formato de arquivo do dBase, o DBF).
 
Parâmetro(s):
1. Tabela. 
2. Caminho do Arquivo de Destino. (Letras)

Retorno: 
Não possui.

Observação:
No diretório passado no 2° parâmetro é criado dois arquivos com as extensões .DBF e .DBT. Ex. BANCO.DBF e BANCO.DBT.

Exemplos:
1. No 1º Parâmetro o retorno da função abrir Consulta.
2. Assumindo o uso da função Abrir Consulta, efetuando uma consulta na tabela "fr_acao", o seu retorno será atribuído a uma variável do tipo tabela,
esta variável do tipo tabela será usada como 1° parâmetro, e no 2° parâmetro o do arquivo C:/Banco.dbf

---

## Fechar Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLCloseConnection` |
| **Código** | 10 |
| **Assinatura** | `Fechar Conexão (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função fecha uma conexão com o banco de dados impedindo que seja emitido qualquer comando para o banco de dados da conexão que foi fechada. Essa função recebe a variável que foi armazenada a conexão.

Parâmetro:
1. Conexão. (Variante)

Retorno: 
Não possui.

Observação: 
Essa função é usada para fechar a conexão que não seja mais útil.

Exemplo: 
Assumindo como 1° uma conexão, ela será fechada.

### Código Servidor (Java)

```java
protected final Variant ebfSQLCloseConnection(Variant connVar) throws Exception {
    DBConnection conn = (DBConnection) connVar.getObject();
    if (conn != null) {
      conn.commitTransaction();
      conn.closeConnection();
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Fechar Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLClose` |
| **Código** | 511 |
| **Assinatura** | `Fechar Consulta (Tabela)` |
| **Parâmetros** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para fechar uma consulta aberta pelas funções "Abrir Consulta", "Abrir Consulta Dinâmica", "Abrir Consulta Navegável", "Abrir Consulta Não Gerenciada" e "Abrir Consulta Dinâmica Navegável".

Parâmetro:
1. Consulta. (Tabela)

Retorno: 
Não possui.

Exemplo: 
Selecionando uma das funções para abrir consulta, definindo a consulta a ser realizada no Wizard SQL, atribua o retorno a uma variável tabela e em seguida feche a consulta com a função (Fechar Consulta).

### Código Servidor (Java)

```java
protected final Variant ebfSQLClose(Variant variant) throws Exception {
    ResultSet rs = variant.getResultSet();
    if (rs != null) {
      closeDBObject(rs);
    }
    return Variant.VARIANT_TRUE;
  }
```

---

## Ir para posição da Tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetAbsolute` |
| **Código** | 129 |
| **Assinatura** | `Ir para posição da Tabela` |
| **Parâmetros** | Tabela;Inteiro |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para navegar entre os registros da tabela passada por parâmetro. 

Parâmetro(s):
1. Tabela com a Consulta.
2. Posição do registro na tabela. (Inteiro)

Retorno: 
Tabela (Com o cursor apontando para o registro informado). (Tabela)

Observação:
A tabela passada como parâmetro deve ser obtida com a função "Obter Tabela do Formulário".

Exemplo: 
Selecione uma função para ir para a posição da tabela, atribua ao 1º Parâmetro a consulta da tabela de um formulário com a função "Obter tabela do formulário", escolha de qual formulário deseja obter a tabela, atribua ao 2º Parâmetro o índice do registro que deseja obter, inserir a cima a função (Campo) para obter um campo deste registro e clica em salvar, selecione o campo que deseja obter a função e atribua o resultado a uma variável do tipo tabela.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetAbsolute(Variant variantRS, Variant index) throws Exception {
    ResultSet rs = variantRS.getResultSet();
    if (!(rs instanceof wfr.database.CachedResultSet))
      throw new Exception("A tabela não dá suporte a esse tipo de navegação");
    rs.absolute(index.getLong().intValue());
    return new Variant(rs);
  }
```

---

## Manter Cursores Após Commit

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConnectionHoldCursorsOverCommit` |
| **Código** | 405 |
| **Assinatura** | `Manter Cursores Após Commit (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Mantém os cursores de uma consulta aberto mesmo após ser dado um commit.

Parâmetro:
1. Conexão com o banco de dados. (Variante, Opcional) (Ver observação 1)

Retorno: 
Não possui.

Observações:
1. Se o 1º Parâmetro for passado nulo, a função assume que a conexão principal será considerada.
2. É recomendável utilizar esta função em projetos postgres que utilizem pool de conexões e estejam manipulando funções de transações de banco de daos (Abrir, commit e rolback)

### Código Servidor (Java)

```java
protected final Variant ebfConnectionHoldCursorsOverCommit(Variant connectionVar) throws Exception {
    DBConnection conn = connection;
    if (connectionVar.getObject() instanceof DBConnection) {
      conn = DBConnection.class.cast(connectionVar.getObject());
    }    
    conn.getConnection().setHoldability(java.sql.ResultSet.HOLD_CURSORS_OVER_COMMIT);
    return Variant.VARIANT_NULL;
  }
```

---

## Obter Campos da Tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetGetColumns` |
| **Código** | 152 |
| **Assinatura** | `Obter Campos da Tabela (Tabela) : Variante` |
| **Parâmetros** | Tabela |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para obter em uma lista (variante) com os nomes de todos os campos da tabela passada como parâmetro. Para obter o nome do campo da lista deve usar a função "Obter Objeto numa Lista".
Vide descrição da função "Obter Objeto numa Lista".

Parâmetro:
1. Consulta. (Tabela)

Retorno: 
Retorna uma lista com o nome dos campos da tabela passada como parâmetro. (Variante)

Observação: 
A lista de retorno é iniciada a partir da posição 0 (zero).

Exemplo: 
Defina uma consulta com a função "Abrir consulta", usando o Wizard SQL, inseria acima a função "obter Campos da tabela" e clique no botão salvar. Atribua seu retorno a uma variável do tipo variante e observe que a variável escolhida receberá o retorno da função.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetGetColumns(Variant resultSetVar) throws Exception {
    if (resultSetVar.getType() == WFRRuleType.NULL || !(resultSetVar.getObject() instanceof ResultSet)) {
      return VariantPool.get(Collections.emptyList());
    }
    List<String> columns = new ArrayList<String>();
    ResultSet rSet = (ResultSet) resultSetVar.getObject();
    int columnCount = rSet.getMetaData().getColumnCount();
    for (int i = 1; i <= columnCount; i++) {
      // Adiciona o nome da coluna à lista
      columns.add(rSet.getMetaData().getColumnLabel(i));
    }
    return VariantPool.get(columns);
  }
```

---

## Obter Conexão Adicional

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetAditionalConnection` |
| **Código** | 239 |
| **Assinatura** | `Obter Conexão Adicional (Letras) : Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém uma conexão adicional definida no sistema.

Parâmetro:
1. Chave da conexão. (Letras) (Ver observação 1)

Retorno:
Retorna a referência da conexão adicional. (Variante)

Observações:
1. No 1º Parâmetro o nome da Conexão Adicional é definida no cadastro de Conexões Adicionais.
2. Caso a chave não seja informada, será retornado a referência da conexão principal.

Exemplo: 
Banco de Cidades, Conexão Principal, etc. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfGetAditionalConnection(Variant name) throws Exception {
    return new Variant(client.getData().connection(name.getString()));    
  }
```

---

## Obter Informações da Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetGetInfo` |
| **Código** | 898 |
| **Assinatura** | `Obter Informações da Consulta (Tabela): Variante` |
| **Parâmetros** | Tabela |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função recebe por parâmetro uma consulta e retorna uma lista de lista. 

Parâmetro:
1. Consulta. (Tabela)

Retorno:
Lista de Lista (Variante), contendo: 
1 - O nome da tabela (Letras);
2 - O nome do campo (Letras);
3 - A descrição do campo de acordo com o dicionário de dados (Letras);
4 - O tipo do campo (Letras);
5 - O tamanho do campo (Inteiro);
6 - A precisão do campo (Inteiro);
7 - Se o campo é autoincremento (Lógico);
8 - Se o campo aceita nulo (1 aceita e 0 não aceita);
9 - O alias (se existir) ou o nome do campo (Letras).

Observação:
Em banco de dados Oracle devido a uma limitação no drive, essa função não irá retornar o nome da tabela e nem descrição do campo de acordo o dicionário de dados.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetGetInfo(Variant resultSetVar) throws Exception {
    if (resultSetVar.getType() == WFRRuleType.NULL || !(resultSetVar.getObject() instanceof ResultSet)) {
      return VariantPool.get(Collections.emptyList());
    }
    List<List<String>> columns      = new ArrayList<List<String>>();
    ResultSet rSet                  = (ResultSet) resultSetVar.getObject();
    String mainTable = "";
    try {mainTable = WFRData.getMainTable(((wfr.database.CachedResultSet) rSet).getSQL());} catch (Exception e) {}
    java.sql.ResultSetMetaData rsmd = rSet.getMetaData();
    int columnCount                 = rsmd.getColumnCount();
    
    for (int i = 1; i <= columnCount; i++) {
      List<String> currentColumnInfo = new ArrayList<String>();
      String tableName, columnName;
      
      // Adiciona o nome da tabela à lista
      if (rSet instanceof org.postgresql.PGResultSetMetaData) {
        tableName = org.postgresql.PGResultSetMetaData.class.cast(rsmd).getBaseTableName(i);
      }else {
        tableName = rsmd.getTableName(i);
        if (tableName.isEmpty()) tableName = mainTable.isEmpty() ? "" : mainTable;
      }
      currentColumnInfo.add(tableName);
      
      // Adiciona o nome da coluna à lista
      if (rSet instanceof net.sourceforge.jtds.jdbc.JtdsResultSet) {

        net.sourceforge.jtds.jdbc.JtdsResultSetMetaData jrsmd = (net.sourceforge.jtds.jdbc.JtdsResultSetMetaData) rsmd;
        java.lang.reflect.Method method = jrsmd.getClass().getDeclaredMethod("getColumn", int.class);
        method.setAccessible(true);
        net.sourceforge.jtds.jdbc.ColInfo colInfo = (net.sourceforge.jtds.jdbc.ColInfo) method.invoke(jrsmd, i);
        java.lang.reflect.Field field = colInfo.getClass().getDeclaredField("realName");
        field.setAccessible(true);
        columnName = (String) field.get(colInfo);
      } else {
        columnName = rsmd.getColumnName(i);
      }
      currentColumnInfo.add(columnName);
      
      // Adiciona a descrição da coluna de acordo com o dicionário de dados
      if (getSystem().getField(tableName, columnName) != null) {
        currentColumnInfo.add(getSystem().getField(tableName, columnName).getDescription());
      } else {
        currentColumnInfo.add("");
      }

      // Adiciona as informações: ColumnType, DisplaySize, Precision, Scale, AutoIncrement?, Nullable?
      currentColumnInfo.add(rsmd.getColumnTypeName(i).toString());
      currentColumnInfo.add(String.valueOf(rsmd.getPrecision(i)));
      currentColumnInfo.add(String.valueOf(rsmd.getScale(i)));
      currentColumnInfo.add(String.valueOf(rsmd.isAutoIncrement(i)));
      currentColumnInfo.add(String.valueOf(rsmd.isNullable(i)));
      
      // Adicionar alias ou nome da coluna
      currentColumnInfo.add(rsmd.getColumnLabel(i));
      
      // Adiciona as informações a lista principal
      columns.add(currentColumnInfo);
    }
    return VariantPool.get(columns);
  }
```

---

## Obter Informações da Consulta (String)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfParseSqlColumns` |
| **Código** | 1182 |
| **Assinatura** | `Obter Informações da Consulta (String) (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função recebe por parâmetro uma string SQL e retorna uma lista de lista. 

Parâmetro:
1. Comando SQL. (Letras)

Retorno:
Lista de Lista (Variante), contendo: 
1 - O nome da tabela (Letras);
2 - O nome do campo (Letras);
3 - O alias (se existir) ou o nome do campo (Letras).

### Código Servidor (Java)

```java
protected final Variant ebfParseSqlColumns(Variant sqlVar) throws Exception {
  String sql = (sqlVar != null && sqlVar.getType() != WFRRuleType.NULL) ? String.valueOf(sqlVar.getObject()) : null;
  if (sql == null || sql.trim().isEmpty()) return VariantPool.get(Collections.emptyList());

  String selectPart = _extractSelectList(sql);
  if (selectPart.isEmpty()) return VariantPool.get(Collections.emptyList());

  List<String> items = _splitTopLevelByComma(selectPart);
  List<List<String>> out = new ArrayList<>(items.size());

  for (String rawItem : items) {
    String item = rawItem.trim();
    String alias = _extractAlias(item);
    String base  = _stripAlias(item);

    if (_looksLikeExpression(base)) {
      out.add(Arrays.asList("", "", alias));
      continue;
    }

    String[] tc = _parseQualifiedName(base);
    String table = tc[0];
    String column = tc[1];

    out.add(Arrays.asList(table, column, alias));
  }

  return VariantPool.get(out);
}


private static String _extractSelectList(String sql) {
  String s = sql.trim();
  int sel = _indexOfWordIgnoreCase(s, "SELECT", 0);
  if (sel < 0) return "";
  int from = _findTopLevelFrom(s, sel + 6);
  if (from < 0) return s.substring(sel + 6);
  return s.substring(sel + 6, from);
}

private static int _findTopLevelFrom(String s, int start) {
  int depthPar = 0;
  boolean inSQ = false, inDQ = false;
  for (int i = start; i < s.length(); i++) {
    char c = s.charAt(i);
    if (c == '\'' && !inDQ) inSQ = !inSQ;
    else if (c == '\"' && !inSQ) inDQ = !inDQ;
    else if (!inSQ && !inDQ) {
      if (c == '(') depthPar++;
      else if (c == ')') depthPar = Math.max(0, depthPar - 1);
      else if (depthPar == 0 && _startsWithWordIgnoreCase(s, "FROM", i)) return i;
    }
  }
  return -1;
}

private static List<String> _splitTopLevelByComma(String s) {
  List<String> parts = new ArrayList<>();
  int depthPar = 0;
  boolean inSQ = false, inDQ = false;
  int last = 0;
  for (int i = 0; i < s.length(); i++) {
    char c = s.charAt(i);
    if (c == '\'' && !inDQ) inSQ = !inSQ;
    else if (c == '\"' && !inSQ) inDQ = !inDQ;
    else if (!inSQ && !inDQ) {
      if (c == '(') depthPar++;
      else if (c == ')') depthPar = Math.max(0, depthPar - 1);
      else if (c == ',' && depthPar == 0) {
        parts.add(s.substring(last, i));
        last = i + 1;
      }
    }
  }
  parts.add(s.substring(last));
  return parts;
}

private static boolean _looksLikeExpression(String s) {
  String u = s.trim();
  if (u.isEmpty()) return true;
  String U = u.toUpperCase(Locale.ROOT);
  return u.contains("(") || u.contains(")") || u.contains("||") ||
         u.contains("+") || u.contains("-") || u.contains("*") || u.contains("/") ||
         U.contains("CASE ") || U.contains(" CAST(") || u.contains("::");
}

private static String _extractAlias(String item) {
  java.util.regex.Matcher mAS = java.util.regex.Pattern
    .compile("(?is)\\s+AS\\s+(\"[^\"]+\"|[A-Za-z_][\\w$]*)\\s*$")
    .matcher(item);
  if (mAS.find()) return _unquote(mAS.group(1));

  java.util.regex.Matcher mTrail = java.util.regex.Pattern
    .compile("(?is)^.*?\\s+(\"[^\"]+\"|[A-Za-z_][\\w$]*)\\s*$")
    .matcher(item);
  if (mTrail.find()) {
    String base = _stripAlias(item);
    if (!base.equals(item)) return _unquote(mTrail.group(1));
  }
  return "";
}

private static String _stripAlias(String item) {
  String s = item;

  java.util.regex.Matcher mAS = java.util.regex.Pattern
    .compile("(?is)(.*?)\\s+AS\\s+(\"[^\"]+\"|[A-Za-z_][\\w$]*)\\s*$")
    .matcher(s);
  if (mAS.matches()) return mAS.group(1).trim();

  java.util.regex.Matcher mTrail = java.util.regex.Pattern
    .compile("(?is)(.*?)\\s+(\"[^\"]+\"|[A-Za-z_][\\w$]*)\\s*$")
    .matcher(s);
  if (mTrail.matches()) {
    String left = mTrail.group(1).trim();
    if (!left.endsWith(".")) return left;
  }
  return s.trim();
}

private static String[] _parseQualifiedName(String base) {
  List<String> tokens = new ArrayList<>();
  StringBuilder cur = new StringBuilder();
  boolean inDQ = false;
  for (int i = 0; i < base.length(); i++) {
    char c = base.charAt(i);
    if (c == '\"') { inDQ = !inDQ; cur.append(c); }
    else if (c == '.' && !inDQ) { tokens.add(cur.toString().trim()); cur.setLength(0); }
    else { cur.append(c); }
  }
  if (cur.length() > 0) tokens.add(cur.toString().trim());

  for (int i = 0; i < tokens.size(); i++) tokens.set(i, _unquote(tokens.get(i)));

  String table = "";
  String column = "";
  if (tokens.size() >= 1) column = tokens.get(tokens.size() - 1);
  if (tokens.size() >= 2) table  = tokens.get(tokens.size() - 2);
  return new String[]{ table, column };
}

private static String _unquote(String s) {
  if (s == null) return "";
  s = s.trim();
  if (s.length() >= 2 && s.startsWith("\"") && s.endsWith("\"")) {
    return s.substring(1, s.length() - 1);
  }
  return s;
}

private static int _indexOfWordIgnoreCase(String s, String w, int from) {
  for (int i = from; i <= s.length() - w.length(); i++) {
    if (_startsWithWordIgnoreCase(s, w, i)) return i;
  }
  return -1;
}

private static boolean _startsWithWordIgnoreCase(String s, String w, int pos) {
  int n = w.length();
  if (pos < 0 || pos + n > s.length()) return false;
  if (!s.regionMatches(true, pos, w, 0, n)) return false;
  boolean leftOK  = pos == 0 || !Character.isLetterOrDigit(s.charAt(pos - 1));
  boolean rightOK = (pos + n == s.length()) || !Character.isLetterOrDigit(s.charAt(pos + n));
  return leftOK && rightOK;
}
```

---

## Obter Nome dos Parâmetros da Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLParameterList` |
| **Código** | 755 |
| **Assinatura** | `Obter Nome dos Parâmetros da Consulta (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna uma lista com todos os parâmetros da consulta SQL informada no parâmetro.

Parâmetro:
1. Consulta SQL. (Variante)

Retorno:
Lista de parâmetros da consulta. (Variante)

Exemplo: 
Assumindo como parâmetro a seguinte consulta SQL:
"SELECT 
   VER_DESCRICAO,
   VER_VERSAO 
 FROM FR_VERSAO
 WHERE 
   VER_CODIGO = :codigo
AND
  VER_TIPO = :tipo"

O retorno será uma lista contendo "codigo" e "tipo".

### Código Servidor (Java)

```java
protected final Variant ebfSQLParameterList(Variant sqlVar) throws Exception{
  String SQL =  getData().parseSystemParams(sqlVar.getString());
  SQL = SQL + " ";
  final String escapes = " \n\t\r\'\":)(,-+<>=";
  List<String> params = new ArrayList<String>();
  boolean in = false;
  boolean reading = false;
  String p = "";
  for (int i = 0; i < SQL.length(); i++) {
    char c = SQL.charAt(i);

    if (reading) {
      if (escapes.indexOf(c) >= 0) {
        reading = false;

      if (p.length() > 1) {
        params.add(p);
      }
        p = "";
      } else {
        p = p + c;
      }
    }

    if (c == '\'') {
      in = !in;
    }

    if (!in) {
      if (c == ':' || c == '?') {
        p = "";
        reading = true;
      }
    }
  }

  if (p.length() > 1) {
    params.add(p);
  }
  return VariantPool.get(params);
}
```

---

## Obter Propriedades da Conexão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetConnProperties` |
| **Código** | 723 |
| **Assinatura** | `Obter Propriedades da Conexão (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna um mapa com as propriedades da conexão passada por parâmetro.

Parâmetro:
1. Referência da conexão. (Variante) (Ver observação 1)

Retorno:
Mapa com propriedades da conexão adicional. (Variante)

Observação:
O 1º Parâmetro pode ser obtido através da função "Abrir Conexão ou Obter Conexão adicional".

Exemplo: 
Chaves do Mapa: URL, Host, Port, Database, User e Password.

### Código Servidor (Java)

```java
protected final Variant ebfGetConnProperties(Variant vConn) throws Exception {
    DBConnection db = (DBConnection) vConn.getObject();
    Map<String, String> map = new TreeMap <String, String>();
    map.put("url", db.getProperties().url);
    map.put("host", db.getProperties().hostname);
    map.put("port", db.getProperties().port);    
    map.put("database", db.getProperties().database);
    map.put("user", db.getProperties().user);     
    map.put("password", db.getProperties().password);
    map.put("upperFunctionStart", db.getMetaData().getUpperFunctionStart());
    map.put("upperFunctionEnd", db.getMetaData().getUpperFunctionEnd());
    return new Variant(map);    
  }
```

---

## Obter SQL do Editor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSQLParametersEditor` |
| **Código** | 909 |
| **Assinatura** | `Obter SQL do Editor (SQL Consulta;Variante): Variante` |
| **Parâmetros** | SQL Consulta;Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o SQL do Assistente SQL.

Parâmetro(s):
1. SQL Consulta.
2. Conexão. (Variante)

Retorno:
SQL. (Variante)

Observação:
Retorna o SQL e seus parâmetros caso exista com seus respectivos valores.

### Código Servidor (Java)

```java
protected final Variant ebfGetSQLParametersEditor (String SQL, int qtd, Variant... variants) throws Exception {
  if(variants != null && variants.length > 0){ 
    return VariantPool.get(wfr.util.Functions.getSQLParameters(SQL, qtd, variants));
  }
  return Variant.VARIANT_NULL;
}
```

---

## Obter Valor dos Parâmetos da Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLParameterListValue` |
| **Código** | 756 |
| **Assinatura** | `Obter Valor dos Parâmetos da Consulta (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função retorna uma lista com todos os valores dos parâmetros da consulta SQL informada no parâmetro.

Parâmetro:
1. Consulta SQL. (Variante)

Retorno:
Lista contendo os valores dos parâmetros da consulta. (Variante)

Exemplo: 
Assumindo como parâmetro a seguinte consulta SQL:
"SELECT 
   VER_DESCRICAO,
   VER_VERSAO 
 FROM FR_VERSAO
 WHERE 
   VER_CODIGO = :codigo
AND
  VER_TIPO = :tipo"

O retorno será uma lista contendo os valores dos parâmetros "codigo" e "tipo".

### Código Servidor (Java)

```java
protected final Variant ebfSQLParameterListValue(Variant sqlVar) throws Exception{
  String SQL =  getData().parseSystemParams(sqlVar.getString());
  wfr.sys.PreparedSQL preparedSQL = new wfr.sys.PreparedSQL(SQL, getData(), request);
  String pSQL = preparedSQL.getSQL();
  List<Object> arrayValuesSQL = preparedSQL.getValues();
  return VariantPool.get(arrayValuesSQL);
}
```

---

## Obter quantidade de colunas em uma tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfColumnCount` |
| **Código** | 290 |
| **Assinatura** | `Obter quantidade de colunas em uma tabela (Tabela)` |
| **Parâmetros** | Tabela |
| **Retorno** | Inteiro |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém a quantidade de colunas de uma tabela (ResultSet).

Parâmetro:
1. Tabela. (Ver observação 1)

Retorno:
Quantidade de Colunas da tabela passada no primeiro parâmetro. (Inteiro)

Observação:
O 1º parâmetro é o Retorno da função "Abrir consulta".

### Código Servidor (Java)

```java
protected final Variant ebfColumnCount(Variant tabela) throws Exception {
	   
	    ResultSet rs = (ResultSet)tabela.getObject();
	    java.sql.ResultSetMetaData metaData = rs.getMetaData();
	    int count = metaData.getColumnCount();
	    
	    
	    return VariantPool.get(count);
	    
	}
```

---

## Posição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetRecNo` |
| **Código** | 131 |
| **Assinatura** | `Posição` |
| **Parâmetros** | Tabela |
| **Retorno** | Inteiro |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para obter em qual posição corrente da consulta passada como parâmetro.
Vide descrições das funções "Próximo Registro", "Primeiro Registro", "Último Registro" e "Registro Anterior".

Parâmetro:
1. Consulta. (Tabela)

Retorno: 
Retorna em a posição do registro corrente (primeiro registro da consulta retorna 1). (Inteiro)

Observações:
1. Uma consulta que não sofreu nenhuma alteração, retornará a posição corrente 1.
2. A depender do banco de dados, a posição inicial pode variar.

Exemplo: 
Defina uma consulta com a função "Abrir Consulta", usando o Wizard SQL, como essa função tem retorno uma variável do tipo tabela, 
pode-se usá-la diretamente na função "Posição", insira a função "Posição" e clique no botão salvar, atribua o retorno a uma variável do tipo inteiro. 
Observe que a variável escolhida receberá o retorno da função "Posição".

### Código Servidor (Java)

```java
protected final Variant ebfResultSetRecNo(Variant variantRS) throws Exception {
    ResultSet rs = variantRS.getResultSet();
    return new Variant(rs.getRow());
  }
```

---

## Próximo valor de sequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetNextGeneratorValue` |
| **Código** | 88 |
| **Assinatura** | `Próximo valor de seqüência(Generator, [Conexão]): Inteiro` |
| **Parâmetros** | Letras; Variante |
| **Retorno** | Inteiro |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para obter o próximo valor de uma sequência passada como parâmetro, gerado pelo Banco de Dados.

Parâmetro(s):
1. Nome da sequência (gerador de sequência, auto incremento). (Letras)
2. Conexão ao Banco de Dados. (Variante, Opcional)

Retorno: 
Retorna o próximo valor da sequência passada por parâmetro. (Inteiro)

Observação: 
Alguns Bancos de Dados diferem letras maiúsculas de minúsculas, por isso definir o nome da sequência exatamente igual ao do Bando de Dados.

Exemplo: 
Selecionando a função "Próximo valor da sequência" nas funções de Banco de dados, defina o nome de uma sequência existente no banco de dados, defina a variável que atribuirá o próximo valor da sequência, observe que o valor da sequência irá ser atribuído à variável escolhida.

### Código Servidor (Java)

```java
protected final Variant ebfGetNextGeneratorValue(Variant generatorVar, Variant conn) throws Exception {
    DBConnection db;
    if ((conn != null) && (conn.getObject() instanceof DBConnection)) {
      db = (DBConnection) conn.getObject();
    } else {
      db = connection;
    }  
    String generator = generatorVar.getString();
    return VariantPool.get(db.getGenID(generator, generator, generator));      
  }
```

---

## Retornar Tipo Campo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetMetaDataField` |
| **Código** | 29 |
| **Assinatura** | `Função que retorna o tipo de campo` |
| **Parâmetros** | Tabela;Campo |
| **Retorno** | Letras |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para retornar o tipo de campo da tabela e do campo passado como parâmetro.
Vide descrição da função (Tipo do Campo SQL).

Parâmetro(s):
1. Consulta. (Tabela)
2. Campo.

Retorno: 
Retorna o tipo de campo (Varchar, inteiro, entre outros). (Letras)

Observação: 
O 2º parâmetro deve ser uma constante letras, explicitando o nome do campo que deseja retornar o tipo.

Exemplo:
Defina uma consulta usando a função(Abrir consulta) e o Wizard SQL, atribua a consulta a uma variável do tipo tabela, use a função retornar o tipo do campo passando como parâmetro a variável escolhida e preenchendo com a constante letras o nome do campo e atribua o valor de retorno a uma variável do tipo letras.

### Código Servidor (Java)

```java
protected final Variant ebfGetMetaDataField(Variant resultSet, Variant field) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    java.sql.ResultSet rs = resultSet.getResultSet();
    if (rs != null) {
      String fieldName = field.getString();
      java.sql.ResultSetMetaData metaData = rs.getMetaData();
      for (int i = 1; i <= metaData.getColumnCount(); i++) {
        String columnName = metaData.getColumnName(i);
        if (columnName.equals(fieldName)) {
          value = VariantPool.get(metaData.getColumnTypeName(i));
          break;
        }
      }
    }
    return value;
  }
```

---

## Tabela - Primeiro Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetFirst` |
| **Código** | 132 |
| **Assinatura** | `Tabela - Primeiro Registro (Tabela)` |
| **Parâmetros** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para mover a posição corrente da tabela passada por parâmetro para a primeira posição (primeiro registro).
Vide descrição das funções "Abrir Consulta" e "Existem Registros".

Parâmetro(s):
1. Consulta navegável. (Tabela)

Retorno: 
Não possui.

Observação:
A tabela que esta função recebe por parâmetro também pode ser obtida com a função 
"Obter Tabela do Formulário" da categoria Formulário. Função muito usada quando deseja voltar ao primeiro registro depois de percorrer uma tabela.

Exemplo:
Define uma consulta usando a função "Abrir consulta navegável", atribua a consulta a uma variável do tipo tabela e use a função "Primeiro registro" no objeto decisão do fluxograma,
retornando em "sim" o primeiro registro da tabela e "não" uma mensagem de erro.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetFirst(Variant variantRS) throws Exception {
    ResultSet rs = variantRS.getResultSet();
    if (!(rs instanceof wfr.database.CachedResultSet))
      throw new Exception("A tabela não dá suporte a esse tipo de navegação");
    return VariantPool.get(rs.first());
  }
```

---

## Tabela - Próximo Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLNext` |
| **Código** | 550 |
| **Assinatura** | `Tabela Próximo Registro (Tabela)` |
| **Parâmetros** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para mover a posição corrente da tabela passada por parâmetro para a próxima posição. Vide descrição das funções "Abrir Consulta" e "Existem Registros".

Parâmetro(s):
1. Consulta. (Tabela)

Retorno: 
Não possui.

Observação: 
Função muito usada quando deseja fazer loop com os registros de uma tabela (consulta), vinculado a uma condição com a função "Existem Registros".

Exemplo:
Define uma consulta usando a função (Abrir consulta navegável), atribua a consulta a uma variável do tipo tabela e use a função primeiro registro para ir ao primeiro registro.

### Código Servidor (Java)

```java
protected final Variant ebfSQLNext(Variant variant) throws Exception {
    return VariantPool.get(variant.getResultSet().next());
  }
```

---

## Tabela - Registro Anterior

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetPrevious` |
| **Código** | 134 |
| **Assinatura** | `Tabela - Registro Anterior (Tabela)` |
| **Parâmetros** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para mover a posição corrente da tabela passada por parâmetro para a posição anterior. Vide descrição das funções "Abrir Consulta" e "Existem Registros".

Parâmetro:
1. Consulta navegável. (Tabela)

Retorno: 
Não possui.

Observação:
A tabela que esta função recebe por parâmetro pode ser apenas aquela obtida com a função "Obter Tabela do Formulário" da categoria Formulário. Função usada depois de percorrer uma tabela e deseja voltar ao registro anterior.

Exemplo: 
Defina uma consulta usando a função "Abrir consulta navegável", atribua a consulta a uma variável do tipo tabela e use a função registro anterior para passar para o registro anterior.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetPrevious(Variant variantRS) throws Exception {
    ResultSet rs = variantRS.getResultSet();
    if (!(rs instanceof wfr.database.CachedResultSet))
      throw new Exception("A tabela não dá suporte a esse tipo de navegação");
    //Vai para o último registro
    return VariantPool.get(rs.previous());
  }
```

---

## Tabela - Último Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetLast` |
| **Código** | 133 |
| **Assinatura** | `Tabela - Último Registro (Tabela)` |
| **Parâmetros** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para mover a posição corrente da tabela passada como parâmetro para a última posição. Vide descrição das funções "Abrir Consulta" e "Existem Registros".

Parâmetro:
1. Consulta navegável. (Tabela)

Retorno: 
Não possui.

Observação:
A tabela que esta função recebe por parâmetro deve ser obtida apenas com a função "Obter Tabela do Formulário" da categoria Formulário.

Exemplo: 
Defina uma consulta usando a função "Abrir consulta navegável", atribua a consulta a uma variável do tipo tabela e use a função "Último registro" para passar para o último registro.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetLast(Variant variantRS) throws Exception {
    ResultSet rs = variantRS.getResultSet();
    if (!(rs instanceof wfr.database.CachedResultSet))
      throw new Exception("A tabela não dá suporte a esse tipo de navegação");
    return VariantPool.get(rs.last());
  }
```

---

## Tipo do Campo SQL

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetSQLMetaDataField` |
| **Código** | 47 |
| **Assinatura** | `Tipo do Campo SQL(SQL, Campo): Tipo` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para retornar o tipo de campo da consulta e do campo passado por parâmetro, ambos como constantes do tipo Letras. Tem a mesma funcionalidade da função "Retornar Tipo Campo", com a diferença de que todos os seus parâmetros são constantes do tipo Letras. Vide descrição da função "Retornar Tipo Campo". 

Parâmetro(s):
1. Consulta. (Letras)
2. Campo. (Letras)

Retorno: 
Retorna o tipo de campo (Varchar, inteiro). (Letras)

Observação: 
O 2º parâmetro deve ser uma constante Letras, explicitando o nome do campo que deseja retornar o tipo.

Exemplo:
Utilize a função tipo do campo SQL, informe como 1º parâmetro: uma constante do tipo letras com a consulta, 2º parâmetro: O campo e atribua o valor de retorno a uma variável do tipo Letras.

### Código Servidor (Java)

```java
protected final Variant ebfGetSQLMetaDataField(Variant varSQL, Variant field) throws Exception {
    String sql = varSQL.toString();
    List<String> paramsList = WFRData.getParams(sql);
    // Substitui os parâmetros (:...) por interrogação (?)
    List<String> paramsListReverse = new ArrayList<String>(paramsList);
    Collections.sort(paramsListReverse);
    Collections.reverse(paramsListReverse);
    for (String param : paramsListReverse) {
      sql = sql.replaceAll(":" + param, "?");
    }   
    DBConnection conn = null;
    //conn = ((connVar != null) && (connVar.getObject() instanceof DBConnection)) ? (DBConnection) connVar.getObject() : connection;
    conn = connection;
    PreparedStatement pStmt = conn.getPreparedStatement(sql);
    int qtt = paramsList.size();
    for (int i = 1; i <= qtt; i++) {
      pStmt.setNull(i, java.sql.Types.VARCHAR);
    }   
    ResultSet rSet = pStmt.executeQuery();
    java.sql.ResultSetMetaData rsmd = rSet.getMetaData();
    int numberOfColumns = rsmd.getColumnCount();
    String fieldName = field.getString();
    for (int i = 1; i <= numberOfColumns; i++) {
      if(rsmd.getColumnName(i).equals(fieldName)) {
        String fieldType = rsmd.getColumnTypeName(i);
        if (fieldType.equalsIgnoreCase("varchar") || fieldType.equalsIgnoreCase("char"))
          return VariantPool.get(fieldType + "(" + rsmd.getColumnDisplaySize(i) + ")");
        else  
          return VariantPool.get(fieldType);
      }
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Tornar consulta não gerenciável

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLSetNonManaged` |
| **Código** | 441 |
| **Assinatura** | `Tornar consulta não gerenciável (Tabela)` |
| **Parâmetros** | Tabela |
| **Retorno** | Tabela |
| **Tipo** | Componente |
| **Compatibilidade** | Banco de Dados |

### Descrição

Torna consulta não gerenciável, ou seja, o Maker não a fechará automaticamente.

Parâmetro: 
1. Tabela com o resultado da consulta desejada. (Tabela)

Retorno: 
A consulta não gerenciada da tabela passada por parâmetro. (Tabela)

Exemplo:
Assumindo que o 1° parâmetro seja o retorno (Tabela) da função "Abrir Consulta Não Gerenciada" (pode ser outra função),
o retorno, será atribuído a uma variável do tipo tabela, que conterá a mesma consulta anterior, porém não gerenciada.

### Código Servidor (Java)

```java
protected final Variant ebfSQLSetNonManaged(Variant rsVar) throws Exception {
    openedResultSetList.remove(rsVar.getResultSet());
    return rsVar;
  }
```

---

## Transação: Abrir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLOpenTransaction` |
| **Código** | 69 |
| **Assinatura** | `Transação: Abrir (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para abrir uma transação no Banco de Dados.

Parâmetro:
1. Conexão com o Banco de Dados. (Variante)

Retorno: 
Não possui.

Observações:
1. Deve ser fechada ou concluída pelo uso da função Transação: Commit ou Transação: Rollback.
2. Vide descrição das funções Transação: Commit e Transação: Rollback.
3. Caso nenhum parâmetro seja passado, a transação identificará a conexão principal.

Exemplo: 
Transação aberta com a função "Transação: Abrir", atualize alguma tabela do sistema com a função "Executar Atualização" e confirme as mudanças feitas no banco de dados, no caso da atualização com a função "Transação: Commit".

### Código Servidor (Java)

```java
protected final Variant ebfSQLOpenTransaction(Variant con) throws Exception {
    DBConnection connection = this.connection;
    if (con.getObject() != null && con.getObject() instanceof DBConnection)
      connection = (DBConnection) con.getObject();
    connection.startTransaction();
    return Variant.VARIANT_NULL;
  }
```

---

## Transação: Commit

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLCommitTransaction` |
| **Código** | 68 |
| **Assinatura** | `Transação: Commit (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para a confirmação de todas as alterações feitas no Banco de Dados após a abertura de uma transação. 

Parâmetro(s):
1. Conexão com o Banco de Dados. (Variante)

Retorno: 
Não possui.

Observação:
Esta função deve ser usada após a função "Transação: Abrir". Vide descrição da função "Transação: Abrir".

Exemplo: 
Transação aberta com a função "Transação: Abrir", atualize alguma tabela do sistema com a função "Executar Atualização"
e confirme as mudanças feitas no banco de dados, no caso da atualização com a função "Transação: Commit".

### Código Servidor (Java)

```java
protected final Variant ebfSQLCommitTransaction(Variant con) throws Exception {
    DBConnection connection = this.connection;
    if (con.getObject() != null && con.getObject() instanceof DBConnection)
      connection = (DBConnection) con.getObject();
    connection.commitTransaction();
    return Variant.VARIANT_NULL;
  }
```

---

## Transação: Rollback

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSQLRollbackTransaction` |
| **Código** | 70 |
| **Assinatura** | `Transação: Rollback (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | Componente |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Função usada para desfazer todas as alterações feitas no Banco de Dados após a abertura de uma transação.

Parâmetro:
1. Conexão com o Banco de Dados. (Variante)

Retorno: 
Não possui.

Observação:
Esta função deve ser usada após a função "Transação: Abrir". Vide descrição da função "Transação: Abrir".

Exemplo: 
Transação aberta com a função "Transação: Abrir", atualize alguma tabela do sistema com a função "Executar atualização" e desfaça as mudanças feitas no banco de dados, no caso a atualização, com a função "Transação; Roolback".

### Código Servidor (Java)

```java
protected final Variant ebfSQLRollbackTransaction(Variant con) throws Exception {
    DBConnection connection = this.connection;
    if (con.getObject() != null && con.getObject() instanceof DBConnection)
      connection = (DBConnection) con.getObject();
    connection.rollbackTransaction();
    return Variant.VARIANT_NULL;
  }
```

---

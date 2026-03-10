# Arquivo DATABASES.XML

> Fonte: https://manual.softwell.com.br/docs/webrun/estrutura_de_pastas_e_arquivos/Pasta_CONFIG/arquivo_databases_xml

# Arquivo DATABASES.XML

As declarações das chaves de conexão encontram-se nas tags group. Este arquivo está composto pelas chaves de conexão com os bancos de dados que o Webrun suporta.

Cada banco de dados possui a sua própria sintaxe de chaves e particularidades nas configurações. O Webrun lê o conteúdo do arquivo \*.wfre e substitui as informações nas chaves. Por exemplo:

![image675.jpg](/assets/images/image675-382329ba355ec51f7b08fbc9efe57a9b.jpg)

Chaves que identificam o driver de conexão:

- Para PostgreSQL 9:
  org.postgresql.Driver
- Para FireBird:
  org.firebirdsql.jdbc.FBDriver
- Para MSSQL:
  net.sourceforge.jtds.jdbc.Driver
- Para Oracle:
  oracle.jdbc.driver.OracleDriver
- Para MySQL:
  com.mysql.jdbc.Driver
- Para DB2:
  com.ibm.db2.jcc.DB2Driver
- Para ODBC:
  sun.jdbc.odbc.JdbcOdbcDriver

Chaves que identificam a URL de conexão:

- Para PostgreSQL:
  jdbc:postgresql://$HostName$:$Port:5432$/$DataBase$?charSet=$ServerCharSet:LATIN1$
- Para FireBird:
  jdbc:firebirdsql:$Database$?lc\_ctype=$ServerCharSet$
- Para MSSQL:
  :jtds:sqlserver://$HostName$:$Port:1433$/$DataBase$;charset=$SQLServerCharSet:ISO-8859-1$;useLOBs=false;sendStringParametersAsUnicode=false;useCursors=true
- Para Oracle:
  jdbc:oracle:thin:@$DataBase$
- Para MySQL:
  jdbc:mysql://$HostName$:$Port:3306$/$DataBase$
- Para DB2:
  jdbc:db2j:net://$HostName$:$Port:50000$/$DataBase$
- Para ODBC:
  jdbc:odbc:$DataBase$;Server=$HostName$

Chave que identifica o usuário:
User\_Name

Chave que identifica o Servidor:

- Para Interbase e Firebird:
  Database
- Para MSSQL, Oracle, PostgreSQL e MySQL:
  HostName

Chave que executa o comando Commit:
AutoCommit = 1

Chave que executa o CommitClausule (Firebird):
CommitClausule = COMMIT RETAIN

Chave que executa o TrimString:
TrimString = 1

Chave que executa o FetchSize:
FetchSize = 100

Chave que executa o TimeOut:
TimeOut = -1

Chave que executa o Generator:

- Para PostgreSQL:
  SELECT NEXTVAL('$generator$')
- Para FireBird:
  SELECT GEN\_ID($generator$,1) FROM RDB$DATABASE
- Para MSSQL:
  DECLARE @AUTOINC INT EXEC SP\_GEN\_ID '$generator$', 1, @AUTOINC OUT SELECT @AUTOINC
- Para Oracle:
  SELECT $generator$.NEXTVAL FROM dual
- Para DB2:
  SELECT NEXTVAL FOR $generator$ FROM SYSIBM.DUAL

Chave que executa o ExceptionPrimaryKey:

- PostgreSQL:
  unique constraint
- FireBird:
  violation of PRIMARY
  UNIQUE KEY
- MSSQL:
  Violation of PRIMARY
  duplicate key
  UNIQUE KEY
- Oracle:
  ORA-00001
  ORA-01400
- MySQL:
  Duplicate entry
- DB2:
  DB2 SQL error: SQLCODE: -803

(... segue com ExceptionForeignKey, AppendSQL4MetaData, Autoinc, AutoincSupport, CaseSensitive, SchemaField, Schema, InsertOnStarSQL4MetaData, ConcatOperator ...)

---

Uma vez instalado o databases.xml, o atualizador automático não o altera, e por isso, é criado o databases.dist para receber as atualizações. Isso ocorre para quando o usuário fizer alguma alteração e queira retornar às configurações.

## CheckSQLCommand no datatabase.xml

Caso o usuário esteja logado e, por algum motivo, a conexão do banco cair, é possível continuar sem necessidade de logar novamente no banco, mas o banco de dados deve estar ativo.

Para que o Webrun restabeleça essa conexão, use "CheckSQLCommand" no databases.xml e defina uma consulta.  
Exemplo para MySQL:

SELECT 1

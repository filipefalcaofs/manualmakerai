# Arquivo DBXDRIVERS.WIN

> Fonte: https://manual.softwell.com.br/docs/maker/estrutura_de_pastas_e_arquivos/arquivo_dbxdrivers_win

# Arquivo DBXDRIVERS.WIN

Os drivers e conexões são definidos em dois arquivos de configuração. O primeiro, dbxdrivers.win, lista os drivers instalados e as bibliotecas (DLLs) requeridos pela conexão. O segundo, dbxconnections.win, lista as configurações da conexão. Esses arquivos encontram-se no diretório C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap .

O dbExpress não suporta bancos locais, como Paradox e DBase. Isso porque o dbExpress nada mais é que uma camada sobre a API do banco de dados SQL. Como Paradox e DBase não são servidores SQL (SDBDs), não são suportados pelo dbExpress (opção adotada no Maker pois compatibiliza a conexão com uma gama de SGDBs).

O usuário poderá conectar-se com bancos Paradox e Dbase, por meio de fluxos, utilizando a função Abrir Conexão ODBC. O Maker permite, ainda, que o usuário possa, por exemplo, criar uma função que utilize JDBC.

Define os parâmetros de configuração para conexão com os bancos de dados homologados para uso no Maker. Este arquivo encontra-se na pasta C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap

PostgreSQL

GetDriverFunc=getSQLDriverPOSTGRESQL

LibraryName=dbexppge.dll

VendorLib=libpq.dll

HostName=ServerName

DataBase=Database Name

User\_Name=user

Password=password

RoleName=public

Port=5432

CharSet=LATIN1

Interbase

GetDriverFunc=getSQLDriverINTERBASE

LibraryName=dbexpint.dll

VendorLib=gds32.dll

Database=database.gdb

RoleName=RoleName

User\_Name=sysdba

Password=masterkey

ServerCharSet=NONE

SQLDialect=3

BlobSize=-1

CommitRetain=False

WaitOnLocks=True

ErrorResourceFile=

LocaleCode=0000

Interbase TransIsolation=ReadCommited

Trim Char=False

MySQL

GetDriverFunc=getSQLDriverMySQL

LibraryName=dbexpmda.dll

VendorLib=libmysql.dll

BlobSize=-1

HostName=

DataBase=

User\_Name=

Password=

MySQL Direct

GetDriverFunc=getSQLDriverMySQLDirect

LibraryName=dbexpmda.dll

VendorLib=not used

BlobSize=-1

HostName=

DataBase=

User\_Name=

Password=

Oracle

GetDriverFunc=getSQLDriverORANET

LibraryName=dbexpoda.dll

VendorLib=dbexpoda.dll

BlobSize=-1

DataBase=DataBase Name

ErrorResourceFile=

LocaleCode=0000

Password=password

Oracle TransIsolation=ReadCommited

User\_Name=user

EnableBCD=False

RoleName=Normal

ServerCharSet=WE8ISO8859P1

MSSQL

GetDriverFunc=getSQLDriverSQLServer

LibraryName=dbexpsda.dll

VendorLib=sqloledb.dll

HostName=ServerName

DataBase=Database Name

User\_Name=user

Password=password

BlobSize=-1

ServerCharSet=ISO8859\_1

ErrorResourceFile=

LocaleCode=0000

MSSQL TransIsolation=ReadCommited

OS Authentication=False

SchemaName=dbo

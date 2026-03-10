# Configurações do Webrun

## Arquivos de Configuração

O Webrun utiliza arquivos XML na pasta `webrun/` para suas configurações. O formato padrão é:

```xml
<config>
  <group>
    <group-name>NomeDoGrupo</group-name>
    <item>
      <item-name>NomeDaConfig</item-name>
      <item-param>Valor</item-param>
    </item>
  </group>
</config>
```

---

## config.xml — Configuração Geral

Configurações principais do runtime do Webrun.

### Grupo: Sessão

| Configuração | Valor Padrão | Descrição |
|-------------|-------------|-----------|
| `RuleTimeout` | `300` | Timeout de execução de regras (segundos) |
| `Tempo` | `3600` | Tempo de sessão HTTP (segundos = 1 hora) |
| `DebugCachedFiles` | `0` | Habilita debug de cache de arquivos (0=não, 1=sim) |
| `DebugMode` | `0` | Habilita modo de depuração (0=não, 1=sim) |
| `CarregarSistemasNaAbertura` | *(comentado)* | Carregar todos os sistemas ao iniciar |
| `BufferSize` | *(comentado)* | Tamanho do buffer de resposta HTTP |
| `Bloqueios` | *(comentado)* | IPs bloqueados (regex) |
| `PrefixoExterno` | *(comentado)* | Prefixo de IP externo para controle de acesso |
| `PrefixoInterno` | *(comentado)* | Prefixo de IP interno |
| `FormulariosExternos` | *(comentado)* | Códigos de formulários acessíveis externamente |

### Grupo: Componentes

| Configuração | Valor Padrão | Descrição |
|-------------|-------------|-----------|
| `CarregarMoreLookup` | `1` | Habilita carregamento incremental de lookups |
| `PaginacaoMoreLookup` | `100` | Registros por página em lookups |
| `PaginacaoGrid` | `100` | Registros por página em grids |
| `PaginacaoConsulta` | `100` | Registros por página em consultas |

### Grupo: Relatório

| Configuração | Valor Padrão | Descrição |
|-------------|-------------|-----------|
| `GeradorLocalPadrao` | `0` | Gerador de relatório local padrão (0=servidor) |
| `Servidor` | *(comentado)* | IP:porta do servidor de relatórios |
| `ServidorRetorno` | *(comentado)* | Retorno do servidor de relatórios |

### Grupo: Agendador

| Configuração | Valor Padrão | Descrição |
|-------------|-------------|-----------|
| `Tempo` | `600000` | Intervalo do agendador de tarefas (ms = 10 min) |

---

## databases.xml — Templates de Conexão

Define os templates de conexão JDBC para cada SGBD suportado. O arquivo contém **916 linhas** com configurações para cada banco.

### Bancos Configurados

| Banco | Driver JDBC | Formato URL |
|-------|------------|-------------|
| **Firebird/Interbase** | `org.firebirdsql.jdbc.FBDriver` | `jdbc:firebirdsql:$Database$?lc_ctype=$ServerCharSet$` |
| **SQL Server** | `com.microsoft.sqlserver.jdbc.SQLServerDriver` | `jdbc:sqlserver://$Server$:$Port$;databaseName=$Database$;...` |
| **PostgreSQL** | `org.postgresql.Driver` | `jdbc:postgresql://$Server$:$Port$/$Database$` |
| **Oracle** | `oracle.jdbc.driver.OracleDriver` | `jdbc:oracle:thin:@$Server$:$Port$:$Database$` |
| **MySQL** | `com.mysql.cj.jdbc.Driver` | `jdbc:mysql://$Server$:$Port$/$Database$?...` |
| **DB2** | `com.ibm.db2.jcc.DB2Driver` | `jdbc:db2://$Server$:$Port$/$Database$` |
| **Progress** | `com.ddtek.jdbc.openedge.OpenEdgeDriver` | `jdbc:datadirect:openedge://$Server$:$Port$;...` |
| **DBF** | `com.hxtt.sql.dbf.DBFDriver` | `jdbc:DBF:/$Database$` |
| **MongoDB** | `mongodb.jdbc.MongoDriver` | `jdbc:mongo://$Server$:$Port$/$Database$?...` |

### Variáveis de Template

| Variável | Descrição |
|----------|-----------|
| `$Server$` | Endereço do servidor de banco |
| `$Port$` | Porta de conexão |
| `$Database$` | Nome do banco de dados |
| `$ServerCharSet$` | Charset do servidor |
| `$CHARSET$` | Charset da aplicação |

### Propriedades por Banco

Cada banco define:
- **Driver**: Classe JDBC do driver
- **URL**: Template de URL de conexão
- **UserField / PasswordField**: Nomes dos campos de autenticação
- **AutoCommit**: Modo de auto-commit (0/1)
- **CommitClausule**: Cláusula de commit (ex: `COMMIT RETAIN` para Firebird)
- **TrimString**: Aplicar trim automático em strings (0/1)
- **FetchSize**: Tamanho do fetch de resultados
- **TruncateTable**: Comando para truncar tabela
- **SequenceValue / NextSequenceValue**: Sintaxe de sequences
- **ConcatSQLOperator**: Operador de concatenação SQL
- **DateFormat / DateTimeFormat / TimeFormat**: Formatos de data/hora

---

## admin.xml — Administrador

Credenciais do administrador do Webrun.

> ⚠️ **Segurança**: Em produção, altere as credenciais padrão.

| Campo | Valor Padrão |
|-------|-------------|
| Login | `admin` |
| Senha | `webrun` |

---

## dependences.xml — Dependências Externas

Define grupos de arquivos necessários para funcionalidades opcionais:

| Grupo | Arquivos | Descrição |
|-------|----------|-----------|
| Biometria | `DigitalCapture.jar`, etc. | Captura de impressão digital |
| Conector DB2 | `db2jcc.jar` | Driver JDBC para DB2 |
| Conector DBF | `DBF_JDBC30.jar` | Driver JDBC para DBF |
| Conector Firebird | `jaybird-full-2.1.6.jar` | Driver JDBC para Firebird |
| Conector MySQL | `mysql-connector-java-5.1.17-bin.jar` | Driver JDBC para MySQL |
| Conector Postgres | `postgresql-9.0-801.jdbc3.jar` | Driver JDBC para PostgreSQL |
| Conector SQL Server | `jtds-1.2.5.jar`, `sqljdbc.jar` | Driver JDBC para SQL Server |
| Gerador de código fonte | `autodeploy/` | Pacotes FRZ compilados |
| Gerador de relatório Local | `LocalReport.jar` | Relatórios lado cliente |
| Impressora Bematech | `BematechPrinter.jar` | Impressora térmica Bematech |
| Impressora Local | `TextPrinter.jar` | Impressão local de texto |
| Jasper | `jasperreports-3.1.2.jar`, etc. | JasperReports |
| Linux | `xalan.jar` | Suporte a XSLT em Linux |

---

## wfrskins.xml — Skins Registradas

Lista de skins (temas visuais) disponíveis.

| Skin Padrão | Caminho |
|-------------|---------|
| Default | `Skins/Default/` |

### Skins CSS Disponíveis

| Skin | Arquivo CSS |
|------|------------|
| Jupiter | `assets/skins/Jupiter.css` |
| Saturno | `assets/skins/Saturno.css` |
| Venus | `assets/skins/Venus.css` |

---

## wfrusers.xml — Configurações por Usuário

Permite configurar skin por usuário.

```xml
<group>
  <group-name>adm</group-name>
  <item>
    <item-name>Skin</item-name>
    <item-param>Skins/Default/</item-param>
  </item>
</group>
```

---

## web.xml — Deployment Descriptor

O `web.xml` utiliza a especificação **Servlet 3.1** e define:

- **1 Listener**: `WebrunContextListener` — inicialização da aplicação
- **7 Filtros**: Segurança, compressão, cache, charset, contexto
- **20 Servlets**: Controller, Core AJAX, uploads, reports, Web Services
- **Distribuível**: `<distributable />` — suporta clustering

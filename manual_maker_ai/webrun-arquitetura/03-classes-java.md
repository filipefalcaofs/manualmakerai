# Classes Java do Webrun

## Visão Geral

O Webrun possui **~280 classes Java** (incluindo classes internas) organizadas em **15 pacotes** dentro do namespace `wfr.*`. Estas classes formam o backend do servidor de aplicação.

### Arquitetura de Pacotes

```
wfr.*
├── code          → Gerador de código (Maker → Java)
├── com           → Modelo de domínio (WFRSystem, WFRForm, WFRComponent...)
├── database      → Acesso a dados multi-banco
├── exceptions    → Hierarquia de exceções
├── rules         → Motor de regras e compilador
│   └── monitoring → Monitoramento em tempo real
│       └── flows  → Monitoramento de fluxos
├── sys           → Núcleo do sistema
│   ├── HTMLInterface → Geração HTML server-side
│   └── plugins   → Plugins (busca, estatísticas, DDL)
│       └── database → Gerenciamento DDL multi-banco
├── tags          → Tag Libraries JSP
├── util          → Utilitários diversos
│   ├── RabbitMQ  → Integração com mensageria
│   └── dfm       → Parser de formulários Delphi
└── web           → Camada HTTP (servlets, filtros)
    ├── actions   → ~60 ações do controlador MVC
    └── websocket → Chat em tempo real
```

---

## Gerador de Código (`wfr.code`)

Responsável por gerar código Java a partir das definições do Maker AI. Compila sistemas, formulários e componentes em classes Java executáveis.

| Classe | Descrição |
|--------|----------|
| `CodeGenerator` | Classe principal que orquestra a geração de código Java a partir de XMLs do Maker |
| `CompilationPool` | Pool de compilação assíncrona com fila de tarefas |
| `ComponentCodeGenerator` | Gera classes Java para componentes individuais |
| `FormCodeGenerator` | Gera classes Java para formulários do Maker |
| `SystemCodeGenerator` | Gera classes Java para sistemas do Maker |

---

## Modelo de Domínio (`wfr.com`)

Contém as classes que representam os objetos de negócio do Webrun: sistemas, formulários, componentes, menus, relatórios e configurações.

| Classe | Descrição |
|--------|----------|
| `ActionType` | Enum dos tipos de ação disponíveis |
| `AutoDeploy` | Deploy automático de pacotes FRZ |
| `CodeGeneratorProgressInterface` |  |
| `CommandLineSystem` |  |
| `ComponentInterface` |  |
| `FlowJob` | Execução de jobs de fluxo de trabalho |
| `FlowJobController` | Controlador de jobs de fluxo |
| `FlowJobPrecision` |  |
| `FlowJobTaskController` |  |
| `FormRuleDependence` |  |
| `ImageType` |  |
| `Job` |  |
| `MakerFlowComponents` | Componentes visuais do Maker Flow |
| `ReportSubconnectionData` |  |
| `ReportSubconnectionFactory` |  |
| `ReportSubconnectionMemoryData` |  |
| `WFRAccess` | Controle de acesso a formulários |
| `WFRAccessGroup` | Grupo de acesso |
| `WFRAccessPermission` | Permissão específica de acesso |
| `WFRAccessUser` | Acesso por usuário |
| `WFRAction` | Ação associada a componente ou formulário |
| `WFRAppearance` |  |
| `WFRComponent` | Representa um componente visual de formulário |
| `WFRCustomForm` |  |
| `WFRDB2XML` |  |
| `WFRDBForm` |  |
| `WFRDBSystem` |  |
| `WFRDataType` | Tipos de dados suportados |
| `WFRDefaultValue` | Valores padrão de campos |
| `WFRDigitalCapture` |  |
| `WFREFile` | Arquivo de conexão WFRE (criptografado) |
| `WFRExport` | Exportação de dados |
| `WFRField` | Definição de campo de formulário |
| `WFRFieldDefaultValue` |  |
| `WFRForm` | Representa um formulário com seus campos, regras e ações |
| `WFRGridShowInterface` |  |
| `WFRImage` | Gerenciamento de imagens |
| `WFRJasperReport` | Relatório Jasper Reports |
| `WFRMailSenderOauth2` | Envio de e-mail via OAuth2 |
| `WFRMakerReport` | Relatório nativo Maker |
| `WFRMenu` | Estrutura de menu de um sistema |
| `WFRMenuGeneric` |  |
| `WFRMenuItem` | Item individual de menu |
| `WFRMenuMakerReport` |  |
| `WFRMenuReport` |  |
| `WFRMenuSeparator` |  |
| `WFRMetaData` |  |
| `WFRPersistence` | Persistência de dados |
| `WFRProfile` | Perfil de acesso e permissões |
| `WFRReport` | Representação de relatório (Jasper, Maker, etc.) |
| `WFRReportFactory` |  |
| `WFRSerial` |  |
| `WFRShortcut` | Atalhos de navegação |
| `WFRShortcutType` |  |
| `WFRSkin` | Gerenciamento de skins/temas visuais |
| `WFRSystem` | Representa um sistema Maker com suas propriedades, formulários e menus |
| `WFRTab` | Representação de aba de formulário |
| `WFRTabable` |  |
| `WFRTabableField` |  |
| `WFRXMLAction` |  |
| `WFRXMLComponent` |  |
| `WFRXMLForm` |  |
| `WFRXMLMenuItem` |  |
| `WFRXMLSystem` |  |
| `WebrunProperties` | Propriedades globais do Webrun |
| `WebrunSocket` |  |

---

## Acesso a Banco de Dados (`wfr.database`)

Camada de acesso a dados com suporte multi-banco. Inclui pool de conexões, metadados por SGBD, resultsets especializados e importação de dados.

| Classe | Descrição |
|--------|----------|
| `CachedResultSet` | ResultSet em cache para otimizar consultas repetidas |
| `CachedUpdate` |  |
| `DBConnection` | Conexão principal com o banco de dados, gerencia transações |
| `DBGenericMetadata` | Metadados genéricos para bancos não suportados nativamente |
| `DBInterbaseMetadata` | Metadados específicos para Firebird/Interbase |
| `DBMSSQLMetadata` | Metadados específicos para SQL Server |
| `DBMetadata` | Interface base para metadados de banco de dados |
| `DBOracleMetadata` | Metadados específicos para Oracle |
| `DBPool` | Pool de conexões JDBC com reutilização inteligente |
| `DBPostgreSQLMetadata` | Metadados específicos para PostgreSQL |
| `DBProgressMetadata` | Metadados específicos para Progress |
| `DatabaseEnvConfigReader` | Leitura de configuração de banco via variáveis de ambiente |
| `InsertResultSet` | ResultSet para operações de inserção em lote |
| `LoggableStatement` | PreparedStatement com logging para depuração |
| `PagedResultSet` | ResultSet com paginação para grandes volumes |
| `TrimResultSet` | ResultSet que aplica trim automático (Firebird) |
| `WFRResultSet` | ResultSet wrapper do Webrun |
| `XMLResultSet` | ResultSet baseado em XML |
| `XMLResultSetMetaData` |  |
| `XMLResultSetMetaDataItem` |  |

---

## Hierarquia de Exceções (`wfr.exceptions`)

Exceções customizadas do Webrun para tratamento de erros específicos.

| Classe | Descrição |
|--------|----------|
| `ChangePasswordException` | Erro na alteração de senha |
| `ExceptionMessage` |  |
| `GoogleRecaptchaErrors` |  |
| `InnerException` | Exceção interna encapsulada |
| `SystemNotFoundException` | Sistema não encontrado |
| `WFRAccessDenied` | Acesso negado a recurso |
| `WFRAccessFormDeniedException` | Acesso negado a formulário |
| `WFRCompileException` | Erro de compilação de regra |
| `WFRException` | Exceção base do Webrun |
| `WFRMustChangePassword` | Senha expirada, usuário deve alterar |
| `WFRReportException` | Erro na geração de relatório |
| `WFRRuleException` | Erro na execução de regra |
| `WFRRuleStopException` | Parada proposital de regra (stop rule) |
| `WFRSystemExpired` | Sistema com licença expirada |
| `WFRUserNotLogged` | Usuário não autenticado |
| `WebrunException` | Exceção genérica do Webrun |

---

## Motor de Regras (`wfr.rules`)

Compilador e executor de regras de negócio. Suporta regras server-side (Java compilado), client-side (JavaScript) e integração com Web Services.

| Classe | Descrição |
|--------|----------|
| `DebugManager` | Depurador de regras com breakpoints |
| `DotNetFlowMethodsManager` |  |
| `FlowAuditTime` |  |
| `FlowDotNetInterface` |  |
| `FlowMethod` | Método individual de um fluxo |
| `FlowMethodCategory` | Categoria de métodos de fluxo |
| `FlowMethodsManager` | Gerenciador de métodos de fluxo de trabalho |
| `InvalidVariant` |  |
| `ProfileManager` | Gerenciador de perfis de acesso em regras |
| `Rule` |  |
| `RuleCommandLine` |  |
| `RuleCommandLineExecutor` |  |
| `RuleFunctionOperator` |  |
| `RuleOperator` |  |
| `RulesClassLoader` | ClassLoader especializado para classes de regras |
| `RulesConstants` | Constantes usadas pelo motor de regras |
| `RulesFunctions` | Implementação das funções nativas das regras (server-side) |
| `RulesMessages` |  |
| `Variant` | Tipo dinâmico para variáveis de regra (similar a Variant do VB) |
| `VariantPool` | Pool de variáveis Variant reutilizáveis |
| `WFRAvailableRuleType` |  |
| `WFRExternalRule` | Regra externa (JAR/classe Java) |
| `WFRJSRule` | Regra JavaScript server-side |
| `WFRRule` | Representação de uma regra de negócio com código compilável |
| `WFRRuleActivities` | Atividades associadas a regras |
| `WFRRuleClient` | Regra client-side |
| `WFRRuleCompiler` | Compilador de regras server-side para SQL Server |
| `WFRRuleCompilerAb` | Compilador base abstrato de regras |
| `WFRRuleCompilerInterbase` | Compilador de regras para Firebird/Interbase |
| `WFRRuleCompilerOracle` | Compilador de regras para Oracle |
| `WFRRuleCompilerPostgreSQL` | Compilador de regras para PostgreSQL |
| `WFRRuleJSCompiler` | Compilador de regras client-side (JavaScript) |
| `WFRRuleJSDependence` |  |
| `WFRRuleJSManager` | Gerenciador de regras JavaScript |
| `WFRRuleJSSystemManager` |  |
| `WFRRuleManager` | Gerenciador geral de regras |
| `WFRRuleMetaData` |  |
| `WFRRuleType` |  |
| `WFRSystemRulesFilenameFilter` |  |
| `WebServiceExporter` | Exportação de regras como Web Services |
| `WebServiceExporterFactoryInterface` |  |
| `WebServiceImporter` | Importação/consumo de Web Services (Axis 1.x) |
| `WebServiceImporter2` | Importação de Web Services (Axis 2.x) |
| `WebServiceImporter3` | Importação de Web Services (CXF 3.x) |
| `WebSocketProxy` | Proxy de WebSocket para regras |

---

## Monitoramento (`wfr.rules.monitoring`)

Sistema de monitoramento em tempo real do Webrun, incluindo métricas de banco, ambiente, sessões e filas de mensageria.

| Classe | Descrição |
|--------|----------|
| `MonitoringController` | Controlador principal do monitoramento |
| `MonitoringDatabase` | Monitoramento de conexões com banco |
| `MonitoringEnvironment` | Monitoramento do ambiente (JVM, memória, disco) |
| `MonitoringGetAdmUsers` |  |
| `MonitoringJSONKeys` |  |
| `MonitoringJob` | Job de coleta periódica de métricas |
| `MonitoringJobController` |  |
| `MonitoringJobTaskController` |  |
| `MonitoringManager` | Gerenciador de coleta de métricas |
| `MonitoringMessagingQueues` | Monitoramento de filas RabbitMQ |
| `MonitoringMessagingSystem` |  |

---

## Monitoramento de Fluxos (`wfr.rules.monitoring.flows`)

Monitoramento específico de execução de fluxos de trabalho BPM.

| Classe | Descrição |
|--------|----------|
| `MonitoringFlows` | Monitoramento de fluxos em execução |
| `MonitoringFlowsJSONKeys` |  |
| `MonitoringFlowsJob` | Job periódico de monitoramento de fluxos |
| `MonitoringFlowsJobTaskController` |  |

---

## Núcleo do Sistema (`wfr.sys`)

Core do Webrun responsável pelo processamento de requisições, navegação entre formulários, gerenciamento de dados e agendamento.

| Classe | Descrição |
|--------|----------|
| `BinaryData` | Dados binários (uploads, imagens) |
| `Bytes` |  |
| `Criteria` | Critérios de pesquisa (WHERE dinâmico) |
| `Data` | Container de dados para processamento |
| `ErrorMessagesManager` | Gerenciador de mensagens de erro internacionalizadas |
| `InnerPrintWriter` |  |
| `PreparedSQL` | SQL preparado com parâmetros tipados |
| `ResultSetModes` | Modos de operação de ResultSets |
| `ResultSetProperties` |  |
| `WFR` | Classe central do Webrun - gerencia sessão, sistemas carregados e dados |
| `WFRData` | Dados de sessão do Webrun |
| `WFRFormData` | Dados de um formulário aberto na sessão |
| `WFRHandleSystemLoaded` | Handler de evento de sistema carregado |
| `WFRLoader` | Carregador de sistemas e formulários do banco de dados |
| `WFRNavigation` | Navegação entre formulários e registros |
| `WFRPrintWriter` | PrintWriter customizado para saída HTML |
| `WFRScheduler` | Agendador de tarefas periódicas (jobs, fluxos) |

---

## Interface HTML (Server-Side) (`wfr.sys.HTMLInterface`)

Classes server-side que geram o HTML/JavaScript dos componentes. Cada componente visual tem uma classe correspondente aqui que produz o código de renderização.

| Classe | Descrição |
|--------|----------|
| `AccessType` |  |
| `ComponentProperty` |  |
| `GridEventParam` |  |
| `HTMLAccordion` |  |
| `HTMLAction` |  |
| `HTMLActionButton` |  |
| `HTMLAdminInterface` | Interface de administração HTML |
| `HTMLButton` | Geração HTML de botões |
| `HTMLCalendar` |  |
| `HTMLCard` |  |
| `HTMLChart` | Geração HTML de gráficos |
| `HTMLChat` |  |
| `HTMLCheckbox` | Geração HTML de checkboxes |
| `HTMLColorPicker` |  |
| `HTMLComboBox` | Geração HTML de combo boxes |
| `HTMLConstants` | Constantes HTML compartilhadas |
| `HTMLContainer` |  |
| `HTMLDetailPanel` |  |
| `HTMLDownload` | Geração HTML para downloads |
| `HTMLDualList` |  |
| `HTMLEdit` | Geração HTML de campos de edição |
| `HTMLElement` | Base para geração HTML de elementos |
| `HTMLElementFactory` | Factory que cria elementos HTML baseado no tipo |
| `HTMLElementInstance` |  |
| `HTMLError` | Geração HTML de páginas de erro |
| `HTMLExecuteScript` | Execução de scripts SQL via interface |
| `HTMLExecuteScriptFireBird` |  |
| `HTMLExecuteScriptOracle` |  |
| `HTMLExecuteScriptOthers` |  |
| `HTMLExecuteScriptPostgre` |  |
| `HTMLExecuteScriptResult` |  |
| `HTMLExecuteScriptSQLServer` |  |
| `HTMLForm` | Geração HTML de formulários |
| `HTMLFormSearch` | Geração HTML da tela de pesquisa |
| `HTMLGrid` | Geração HTML da grid de dados |
| `HTMLGroupBox` |  |
| `HTMLHidden` |  |
| `HTMLImage` |  |
| `HTMLImageGallery` |  |
| `HTMLIntegration` |  |
| `HTMLInterface` | Interface principal que coordena a geração HTML de formulários |
| `HTMLLabel` |  |
| `HTMLLookup` | Geração HTML de lookups |
| `HTMLMakerFlowComponent` |  |
| `HTMLMemo` |  |
| `HTMLMenu` | Geração HTML de menus |
| `HTMLMultiSelect` |  |
| `HTMLNavigation` | Geração HTML da barra de navegação |
| `HTMLNavigationShow` |  |
| `HTMLPanel` |  |
| `HTMLPlayer` |  |
| `HTMLQuery` |  |
| `HTMLRadioGroup` |  |
| `HTMLReport` | Geração HTML para visualização de relatórios |
| `HTMLReportBuilder` |  |
| `HTMLRssFeed` |  |
| `HTMLSerie` |  |
| `HTMLShortcut` | Geração HTML de atalhos |
| `HTMLSlider` |  |
| `HTMLSliderPanel` |  |
| `HTMLTabComponent` |  |
| `HTMLTimer` |  |
| `HTMLTree` | Geração HTML de treeviews |
| `HTMLTreeViewLevel` |  |
| `HTMLTreeview` |  |
| `HTMLUpload` |  |
| `HTMLUploadComponent` |  |
| `HTMLWait` |  |

---

## Plugins do Sistema (`wfr.sys.plugins`)

Funcionalidades plugáveis como busca textual (Lucene), estatísticas, visão hierárquica e conversão de Excel para banco.

| Classe | Descrição |
|--------|----------|
| `ConvertExcelToDatabase` | Conversão de planilhas Excel para tabelas de banco |
| `HierarchicalView` | Visualização hierárquica de dados |
| `HierarchyConstants` |  |
| `MasterSkin` | Geração dinâmica de CSS de temas (Master Skin) |
| `SystemStatistics` | Estatísticas de uso do sistema |
| `SystemStatisticsQueries` |  |
| `TextualSearch` | Busca textual full-text usando Apache Lucene |

---

## Gerenciamento de Banco (Plugin) (`wfr.sys.plugins.database`)

Plugin para gerenciamento de estrutura de banco de dados (DDL) com suporte a múltiplos SGBDs.

| Classe | Descrição |
|--------|----------|
| `DatabaseManager` | Gerenciador DDL de tabelas e campos |
| `DatabaseManagerInterface` |  |
| `DatabaseParser` | Parser de definições de tabela |
| `FirebirdDatabase` | DDL específico para Firebird |
| `MSSQLDatabase` | DDL específico para SQL Server |
| `MySQLDatabase` | DDL específico para MySQL |
| `OracleDatabase` | DDL específico para Oracle |
| `PostgresDatabase` | DDL específico para PostgreSQL |

---

## Tag Libraries JSP (`wfr.tags`)

Tags customizadas JSP para uso nas páginas do Webrun.

| Classe | Descrição |
|--------|----------|
| `ErrorMessageTag` | Tag para exibição de erros |
| `ImportTag` | Tag para importação de recursos |
| `JSPAdminControllerTag` | Tag de controle para páginas de administração |
| `JSPControllerTag` | Tag principal que controla o fluxo do JSP |
| `JspFunctionsTag` | Tag com funções utilitárias para JSP |
| `MessageParamTag` | Tag para parâmetros de mensagens |
| `MessageTag` | Tag para exibição de mensagens i18n |

---

## Utilitários (`wfr.util`)

Classes utilitárias para funções diversas: compressão, configuração, internacionalização, REST, AWS, criptografia, etc.

| Classe | Descrição |
|--------|----------|
| `AnyFunction` |  |
| `ApplicationResources` | Recursos i18n da aplicação |
| `ArrayListCI` |  |
| `BridgedFunctions` | Funções ponte entre Java e JavaScript |
| `CompressJS` | Compressor de JavaScript (YUI Compressor) |
| `Compression` | Compressão GZIP de respostas |
| `Config` | Leitura de configurações XML do Webrun |
| `CookieKeys` | Chaves de cookies |
| `Functions` | Funções utilitárias gerais (strings, datas, conversões) |
| `GUIDInterface` |  |
| `Int` |  |
| `JS` | Utilitários JavaScript |
| `JSMin` | Minificação de JavaScript |
| `JsonConverter` | Conversão JSON |
| `Language` | Gerenciamento de idiomas e localização |
| `LocalCaptcha` |  |
| `Logger` | Sistema de logging do Webrun |
| `LogicalExpression` |  |
| `LogicalExpressionException` |  |
| `MergeFiles` | Merge de múltiplos arquivos (JS/CSS) |
| `RandomGUID` | Geração de GUIDs aleatórios |
| `Resources` | Acesso a recursos do classpath |
| `SQLFormatter` | Formatação de SQL para exibição |
| `SerializedList` |  |
| `SessionKeys` | Chaves de sessão do Webrun |
| `Settings` |  |
| `SimpleAuthenticator` | Autenticador simples para e-mail SMTP |
| `StringSemaphore` |  |
| `TableNameParser` | Parser de nomes de tabela em SQL |
| `WFRAWS` | Integração com Amazon AWS (S3, KMS) |
| `WFRChatAPIWhatsApp` | Integração com API do WhatsApp |
| `WFRConfig` | Configuração avançada do Webrun |
| `WFRJson` |  |
| `WFRNFeSignature` | Assinatura digital de NF-e |
| `WFROffice` | Manipulação de documentos Office (Word, Excel) |
| `WFRRestCall` | Cliente REST para chamadas HTTP externas |
| `WebrunClassLoader` |  |
| `WebrunClassLoaderInterface` |  |
| `WebrunCompiler` | Compilação dinâmica de classes Java |
| `WebrunCompilerInterface` |  |
| `WebrunSSLSocketFactory` | Factory de sockets SSL customizada |
| `WebrunShell` | Execução de comandos shell no servidor |
| `WebrunShellInterface` |  |

---

## Mensageria (RabbitMQ) (`wfr.util.RabbitMQ`)

Integração com RabbitMQ para mensageria assíncrona entre sistemas.

| Classe | Descrição |
|--------|----------|
| `WebrunRabbitMQ` | Cliente RabbitMQ para envio e recebimento de mensagens |

---

## Parser DFM (Delphi) (`wfr.util.dfm`)

Parser de arquivos DFM (Delphi Form Module) para importação de formulários legados.

| Classe | Descrição |
|--------|----------|
| `DFMParser` | Parser de formulários Delphi (.dfm) para migração |

---

## Camada Web (Servlets e Filtros) (`wfr.web`)

Servlets, filtros e classes de suporte para a camada HTTP do Webrun.

| Classe | Descrição |
|--------|----------|
| `Action` | Classe base para todas as ações HTTP |
| `ActionFactory` | Factory que instancia Actions baseado no tipo da requisição |
| `AdminCore` | Controlador de administração do sistema |
| `CellStyleCacheManager` |  |
| `CompressAndCacheFilter` | Filtro de compressão GZIP e cache |
| `ContextFilter` | Filtro de contexto global |
| `Controller` | Servlet controlador MVC principal - roteia todas as ações |
| `Download` | Download de arquivos e documentos |
| `ExternalRulesServlet` | Execução de regras externas via HTTP |
| `FileUpload` | Upload de arquivos (commons-fileupload) |
| `FilterTest` |  |
| `FlowPlay` | Executor de fluxos de trabalho via HTTP |
| `ForbiddenAccessFilter` | Filtro de bloqueio de acesso a diretórios protegidos |
| `ForbiddenServlet` | Servlet para acesso proibido (403) |
| `GZIPFilter` | Filtro de compressão GZIP |
| `GZIPResponseStream` |  |
| `GZIPResponseWrapper` |  |
| `GetDate` | Retorna data/hora do servidor |
| `GetDependences` | Download de dependências para cliente |
| `GetImage` | Servlet que serve imagens do banco de dados |
| `GetRTM` |  |
| `ImageFilter` | Filtro de cache para imagens |
| `InsertDataFileImport` | Importação de dados de arquivo |
| `InsertImport` | Importação de dados em massa |
| `MakerWebController` | Controlador para Maker Web (SPA) |
| `ManifestJson` | Geração de manifest.json para PWA |
| `NewFileUpload` | Upload moderno com multipart |
| `RemainSession` | Keep-alive de sessão HTTP |
| `ResponseHeaderFilter` | Filtro de configuração de headers HTTP |
| `UploadProgressBar` |  |
| `WFRAdminWebService` | Web Service de administração |
| `WFRChatExport` | Exportação de histórico de chat |
| `WFRCore` | Core AJAX do Webrun - processa ações assíncronas |
| `WFRGridExport` | Exportação de grids (Excel, CSV, PDF) |
| `WFRWebService` | Exposição de regras como Web Service |
| `WebrunContextListener` | Listener de inicialização da aplicação |
| `WebrunRequestWrapper` |  |
| `WebrunSessionWrapper` |  |
| `WebrunXSSRequestWrapper` | Wrapper de request com proteção XSS |

---

## Ações HTTP (Action Pattern) (`wfr.web.actions`)

Implementações do padrão Action para cada tipo de operação do Webrun. Cada ação trata um tipo específico de requisição do usuário.

| Classe | Descrição |
|--------|----------|
| `AccessUpdateGroupsAction` |  |
| `ActiondigitalcaptureAction` |  |
| `AddAdvancedFieldAction` |  |
| `ChangeAccessPageConfigAction` |  |
| `ChangeModeAction` | Alternância entre modos de operação |
| `ChangeaccessAction` | Alteração de permissões |
| `ChangeallaccessAction` | Alteração de permissões em lote |
| `ChangepasswordAction` | Alteração de senha |
| `ClearAdvancedFieldAction` |  |
| `CloseformAction` | Fechamento de formulários |
| `ClosereportAction` |  |
| `ClosesystemAction` | Fechamento de sistemas |
| `ComponentDataAction` | Carregamento de dados de componentes via AJAX |
| `ConfigureSubconnectionsAction` |  |
| `CopyaccessAction` | Cópia de permissões entre perfis |
| `DebugJSAction` | Depuração de JavaScript no servidor |
| `DigitalCaptureQueryAction` |  |
| `ExecuteFunctionAction` | Execução de funções nativas |
| `ExecuteRuleAction` | Execução de regras de negócio |
| `ExecuteSqlAction` | Execução de SQL dinâmico |
| `ExternalAction` |  |
| `FieldTabeableAction` |  |
| `FileUploadAction` | Upload de arquivos via action |
| `FormAction` | Abertura e carregamento de formulários |
| `FormProgressBarAction` |  |
| `GridAction` | Ações sobre grids (seleção, ordenação) |
| `GridEditAction` | Edição inline em grids |
| `GridOpenFormAction` |  |
| `ImportExcelFileAction` | Importação de dados de Excel |
| `JspAction` |  |
| `LogGetFormFieldsAction` |  |
| `LogonAction` | Autenticação de usuários |
| `LogondigitalcaptureAction` |  |
| `LookupShowValueAction` | Exibição de valor em lookups |
| `NavigateAction` | Navegação entre registros (primeiro, anterior, próximo, último) |
| `OpenAction` | Abertura de sistemas |
| `OpenImageStreamFromGaleryAction` |  |
| `OpenReportAction` | Abertura de relatórios |
| `OpenReportFilterAction` |  |
| `OpenformAction` | Abertura de formulários |
| `OpenimagestreamAction` |  |
| `OpenkeyimagestreamAction` |  |
| `OrderAction` | Ordenação de registros |
| `PasteaccessAction` |  |
| `QuerydigitalcaptureAction` |  |
| `RedoaccessAction` |  |
| `RefreshAction` | Atualização de dados do formulário |
| `ReloadFormAction` | Recarregamento de formulário |
| `ReloadSystemAction` | Recarregamento de sistema sem restart |
| `RemainSessionAction` |  |
| `RemoveAdvancedFieldAction` |  |
| `RemoveFieldDefaultValueAction` |  |
| `RemoveSavedQueryAction` |  |
| `RemoveshortcutAction` |  |
| `ReportAction` | Geração de relatórios |
| `ReportOpenAction` |  |
| `ReportOpenExternalAction` |  |
| `ResetFormAction` |  |
| `ResetMenusAction` |  |
| `RestoreAdvancedFieldAction` |  |
| `RevertDefaultGridAction` |  |
| `RuleDebugKillAction` |  |
| `RuleDebugPauseAction` |  |
| `RuleDebugResumeAllAction` |  |
| `RuleDebugResumeNextAction` |  |
| `RuleopenformAction` |  |
| `RuntimeContentAction` |  |
| `SaveAdvancedFieldAction` |  |
| `SaveFieldDefaultValueAction` |  |
| `SaveGridFilterAction` |  |
| `SaveshortcutAction` | Salvamento de atalhos do usuário |
| `SearchAction` | Pesquisa de registros com critérios |
| `SearchnavigateAction` |  |
| `SerialAction` |  |
| `SessionManagerAction` | Gerenciamento de sessões ativas |
| `SetGridAction` |  |
| `SetlogAction` |  |
| `SetsizeAction` |  |
| `SizeGridAction` |  |
| `StoredprocedureAction` |  |
| `SystemCheckFixAction` |  |
| `TreeViewFilterAction` |  |
| `TreeViewLoadAction` |  |
| `UpGridAction` |  |
| `UploadFileAction` |  |
| `UploadMultipleFilesAction` |  |

---

## Chat via WebSocket (`wfr.web.websocket.chat`)

Sistema de chat em tempo real via WebSocket.

| Classe | Descrição |
|--------|----------|
| `ChatComponentInstance` |  |
| `ChatComponentInstanceData` |  |
| `ChatGroup` |  |
| `ChatMessage` |  |
| `ChatMessageState` |  |
| `ChatUser` |  |
| `ChatUserState` |  |
| `WFRChatManager` |  |

---

## Bancos de Dados Suportados

O Webrun possui implementações específicas de metadados e DDL para cada SGBD:

| Banco | Classe de Metadados | Classe DDL | Driver JDBC |
|-------|-------------------|-----------|-------------|
| SQL Server | `DBMSSQLMetadata` | `MSSQLDatabase` | `mssql-jdbc-7.2.2.jre8.jar` |
| PostgreSQL | `DBPostgreSQLMetadata` | `PostgresDatabase` | `postgresql-42.7.3.jar` |
| Oracle | `DBOracleMetadata` | `OracleDatabase` | `ojdbc5-11.2.0.3.jar` |
| Firebird/Interbase | `DBInterbaseMetadata` | `FirebirdDatabase` | `jaybird-4.0.5.java8.jar` |
| MySQL | *(genérico)* | `MySQLDatabase` | `mysql-connector-java-8.0.17.jar` |
| Progress | `DBProgressMetadata` | *(não disponível)* | *(externo)* |
| DB2 | *(genérico)* | *(não disponível)* | `db2jcc.jar` |
| DBF | *(genérico)* | *(não disponível)* | `DBF_JDBC-3.0.jar` |

## Compiladores de Regras por Banco

| Banco | Compilador |
|-------|-----------|
| SQL Server | `WFRRuleCompiler` |
| PostgreSQL | `WFRRuleCompilerPostgreSQL` |
| Oracle | `WFRRuleCompilerOracle` |
| Firebird/Interbase | `WFRRuleCompilerInterbase` |
| JavaScript (client) | `WFRRuleJSCompiler` |

# Arquitetura do Webrun (Runtime WAR)

## Visão Geral

O **Webrun** é o motor de execução (runtime) da plataforma Maker AI. Ele é distribuído como um arquivo WAR (Web Application Archive) que roda em servidores de aplicação Java (Servlet 3.1+, como Apache Tomcat).

O Webrun é responsável por:
- **Renderizar formulários** criados no Maker AI como páginas web HTML/JavaScript
- **Compilar e executar regras** de negócio (server-side e client-side)
- **Gerenciar conexões** com múltiplos bancos de dados
- **Processar ações** do usuário (navegação, inserção, exclusão, pesquisa)
- **Gerar relatórios** (Jasper, relatórios nativos)
- **Expor/consumir Web Services** (SOAP/REST via Apache Axis e CXF)
- **Gerenciar fluxos de trabalho** (BPM)
- **Controlar acesso** e permissões de usuários

### Versão

| Propriedade | Valor |
|------------|-------|
| Webrun Version | **5.0.0.46** |
| Servlet API | 3.1 |
| Encoding | ISO-8859-1 |
| Specification | Java EE / Jakarta EE |

## Estatísticas do WAR

| Métrica | Valor |
|---------|-------|
| Tamanho Total | **169.2 MB** |
| Total de Arquivos | **1806** |

### Arquivos por Tipo

| Extensão | Quantidade |
|----------|-----------|
| .class | 642 |
| .png | 390 |
| .js | 295 |
| .jar | 206 |
| .gif | 63 |
| .jsp | 56 |
| .css | 41 |
| .xml | 20 |
| .html | 16 |
| .svg | 15 |
| .frz | 11 |
| .ttf | 11 |
| .woff2 | 6 |
| .properties | 4 |
| .woff | 3 |
| .otf | 3 |
| .eot | 3 |
| .template | 3 |
| .xsd | 2 |
| .txt | 2 |

## Estrutura de Diretórios

```
webrun5/                         # Raiz do WAR
├── WEB-INF/                     # Configuração Java EE
│   ├── web.xml                  # Deployment descriptor (servlets, filtros)
│   ├── classes/                 # Classes Java compiladas (wfr.*)
│   │   └── wfr/                 # Pacote principal do Webrun
│   │       ├── code/            # Gerador de código
│   │       ├── com/             # Modelo de domínio (WFRForm, WFRSystem, etc.)
│   │       ├── database/        # Acesso a banco de dados
│   │       ├── exceptions/      # Hierarquia de exceções
│   │       ├── rules/           # Compilador e executor de regras
│   │       ├── sys/             # Núcleo do sistema e interface HTML
│   │       ├── tags/            # Tag libraries JSP
│   │       ├── util/            # Utilitários diversos
│   │       └── web/             # Servlets, filtros e ações HTTP
│   │           └── actions/     # ~60 ações do controlador MVC
│   └── lib/                     # 205 JARs de terceiros
├── components/                  # Componentes visuais JavaScript
│   ├── *.js                     # 63 componentes HTML (HTMLEdit, HTMLGrid, etc.)
│   ├── component-dependences.xml # Mapa de dependências entre componentes
│   ├── chart/                   # Componentes de gráfico (OrgChart)
│   ├── codemirror/              # Editor de código (CodeMirror)
│   ├── grid/                    # Grid avançada (Bootstrap Table)
│   ├── isomorphic/              # SmartClient (skins, grids isomórficas)
│   └── trumbowyg/               # Editor WYSIWYG
├── codeTemplates/               # Templates de geração de código
│   ├── system.template          # Template para classes de Sistema
│   ├── form.template            # Template para classes de Formulário
│   ├── component.template       # Template para classes de Componente
│   └── metadata.xml             # Metadados de propriedades
├── webrun/                      # Configurações do Webrun
│   ├── config.xml               # Configuração geral (sessão, paginação, etc.)
│   ├── databases.xml            # Templates de conexão para cada SGBD
│   ├── admin.xml                # Credenciais do administrador
│   ├── dependences.xml          # Mapa de dependências externas
│   ├── wfrskins.xml             # Skins registradas
│   └── wfrusers.xml             # Configurações por usuário
├── assets/                      # Recursos estáticos
│   ├── skins/                   # Temas CSS (Jupiter, Saturno, Venus)
│   ├── fontawesome/             # Ícones FontAwesome
│   ├── pages/                   # CSS por página
│   └── *.min.js                 # Libs (Bootstrap, jQuery, Moment.js)
├── i18n/                        # Internacionalização
│   ├── messages_pt_BR.properties
│   ├── messages_en_US.properties
│   ├── messages_es_ES.properties
│   └── messages_fr_FR.properties
├── schemas/                     # XML Schemas de validação
├── autodeploy/                  # Pacotes FRZ para deploy automático
├── *.jsp                        # 56 páginas JSP
├── wfr.js                       # Engine principal JavaScript (6660 linhas)
├── rulesFunctions.js            # Funções de regras client-side (1121 linhas)
├── wfr_masks.js                 # Máscaras de entrada (1049 linhas)
└── FlowFunctions.class.js       # Definição de funções de fluxo
```

## Fluxo de Requisição HTTP

```
[Browser] → HTTP Request
    ↓
[ContextFilter]         ← Filtro global (/*) 
    ↓
[ImageFilter]           ← Cache de imagens (.gif, .png, .jpg)
[CompressAndCacheFilter] ← Compressão + cache (.js, .css, .xml)
[ResponseHeaderFilter]  ← Headers de cache (.jpg, .gif, .htm)
[CharsetFilter]         ← Encoding (.jsp, .htm, .html)
[ForbiddenAccessFilter] ← Bloqueia acesso direto (/webrun/*, /WEB-INF/*)
    ↓
[Controller Servlet]    ← Roteamento principal (wfr.web.Controller)
    ↓
[ActionFactory]         ← Cria a Action apropriada baseada no parâmetro
    ↓
[*Action]               ← Executa a ação (NavigateAction, SearchAction, etc.)
    ↓
[WFRForm / WFRSystem]  ← Modelo de domínio
    ↓
[DBConnection / DBPool] ← Acesso ao banco de dados
    ↓
[JSP Page]              ← Renderização (form.jsp, system.jsp, etc.)
    ↓
[Browser] ← HTML + JavaScript Response
```

## Servlets Registrados

| Servlet | Classe | URL | Função |
|---------|--------|-----|--------|
| Controller | `wfr.web.Controller` | `/Controller` | Controlador MVC principal |
| WFRCore | `wfr.web.WFRCore` | `/wfrcore` | Core AJAX do Webrun |
| AdminCore | `wfr.web.AdminCore` | `/admincore` | Administração do sistema |
| FileUpload | `wfr.web.FileUpload` | `/fileupload` | Upload de arquivos |
| NewFileUpload | `wfr.web.NewFileUpload` | `/NewFileUpload` | Upload moderno |
| Download | `wfr.web.Download` | `/download` | Download de arquivos |
| GetImage | `wfr.web.GetImage` | `/getimage` | Servir imagens do banco |
| GetDate | `wfr.web.GetDate` | `/getdate` | Data do servidor |
| WFRGridExport | `wfr.web.WFRGridExport` | `/WFRGridExport` | Exportação de grids |
| WFRChatExport | `wfr.web.WFRChatExport` | `/WFRChatExport` | Exportação de chat |
| FlowPlay | `wfr.web.FlowPlay` | `/FlowPlay` | Execução de fluxos |
| MasterSkin | `wfr.sys.plugins.MasterSkin` | `/MasterSkin` | Geração de tema CSS |
| MwebController | `wfr.web.MakerWebController` | `/MwebController` | Controlador Maker Web |
| ExternalRules | `wfr.web.ExternalRulesServlet` | `/ExternalRules` | Regras externas |
| TextualSearch | `wfr.sys.plugins.TextualSearch` | `/TextualSearch` | Busca textual full-text |
| SystemStatistics | `wfr.sys.plugins.SystemStatistics` | `/SystemStatistics` | Estatísticas do sistema |
| HierarchicalView | `wfr.sys.plugins.HierarchicalView` | `/HierarchicalView` | Visão hierárquica |
| AxisServlet | `org.apache.axis.transport.http.AxisServlet` | `/services/*` | Web Services SOAP |
| InsertImport | `wfr.web.InsertImport` | `/InsertImport` | Importação de dados |
| RemainSession | `wfr.web.RemainSession` | `/RemainSession` | Keep-alive de sessão |

## Filtros de Segurança

| Filtro | Padrão URL | Função |
|--------|-----------|--------|
| `SecurityFilter` (Waffle NTLM) | `/ntlm.jsp` | Autenticação Windows NTLM/Negotiate |
| `ForbiddenAccessFilter` | `/webrun/*`, `/system/*`, `/WEB-INF/*` | Bloqueio de acesso direto a configs |
| `ContextFilter` | `/*` | Filtro de contexto global |
| `CompressAndCacheFilter` | `*.js`, `*.css`, `*.xml` | Compressão GZIP + cache |
| `ImageFilter` | `*.gif`, `*.png`, `*.jpg` | Cache de imagens |
| `ResponseHeaderFilter` | diversos | Headers de cache HTTP |
| `CharsetFilter` | `*.jsp`, `*.htm`, `*.html` | Configuração de charset |

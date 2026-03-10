# Páginas JSP do Webrun

## Visão Geral

O Webrun possui **56 páginas JSP** que compõem a interface web. As JSPs utilizam Tag Libraries customizadas do Webrun (`wfr.tags`) e são processadas pelo servidor Java EE.

---

### Formulários e Sistema

| JSP | Descrição |
|-----|----------|
| `index.jsp` | Página inicial — carregamento do sistema e login |
| `system.jsp` | Renderização de um sistema Maker (menus, formulários) |
| `form.jsp` | Renderização de um formulário Maker com seus componentes |
| `logon.jsp` | Tela de autenticação (login) do usuário |
| `auth.jsp` | Autenticação especial (SSO, token) |
| `ntlm.jsp` | Autenticação Windows NTLM/Negotiate |
| `exit.jsp` | Logout e encerramento de sessão |
| `password.jsp` | Alteração de senha do usuário |

### Consultas e Pesquisa

| JSP | Descrição |
|-----|----------|
| `query.jsp` | Tela de consulta/pesquisa de registros |
| `basic_query.jsp` | Consulta básica simplificada |
| `advanced_query.jsp` | Consulta avançada com múltiplos critérios |
| `zoom.jsp` | Popup de zoom/lookup ampliado |
| `customZoom.jsp` | Zoom customizado pelo desenvolvedor |
| `textualSearch.jsp` | Busca textual full-text (Lucene) |

### Relatórios

| JSP | Descrição |
|-----|----------|
| `report.jsp` | Visualização de relatórios gerados |
| `openreport.jsp` | Abertura de relatório por código |
| `reportBuilder.jsp` | Construtor visual de relatórios |
| `queryReport.jsp` | Relatório baseado em consulta |

### Importação/Exportação

| JSP | Descrição |
|-----|----------|
| `export.jsp` | Exportação de dados (Excel, CSV, PDF) |
| `import.jsp` | Importação de dados de arquivos |
| `importContent.jsp` | Conteúdo de importação (modal) |
| `importadorDados.jsp` | Importador de dados avançado |
| `excelToDataBase.jsp` | Conversão de Excel para tabela de banco |
| `upload.jsp` | Upload de arquivos |
| `download.jsp` | Download de arquivos e documentos |

### Administração

| JSP | Descrição |
|-----|----------|
| `configManager.jsp` | Gerenciador de configurações do Webrun (admin) |
| `indexConfig.jsp` | Índice da configuração administrativa |
| `advancedAdmin.jsp` | Administração avançada do sistema |
| `comaccess.jsp` | Gerenciamento de permissões de acesso |
| `log.jsp` | Visualização de logs do sistema |
| `systemCheck.jsp` | Verificação de saúde do sistema |
| `autoTest.jsp` | Testes automatizados do Webrun |
| `systemStatistics.jsp` | Estatísticas do sistema |

### Temas e Aparência

| JSP | Descrição |
|-----|----------|
| `masterSkin.jsp` | Geração dinâmica de CSS do tema (Master Skin) |
| `chooseIcon.jsp` | Seleção de ícone para componentes |
| `chooseNavbar.jsp` | Seleção de estilo de barra de navegação |

### Fluxos e Processos

| JSP | Descrição |
|-----|----------|
| `flowplay.jsp` | Execução visual de fluxos de trabalho |

### Utilitárias

| JSP | Descrição |
|-----|----------|
| `camera.jsp` | Captura de câmera/webcam |
| `digitalcapture.jsp` | Captura de impressão digital |
| `serial.jsp` | Comunicação serial (periféricos) |
| `helpform.jsp` | Ajuda contextual de formulários |
| `keepSession.jsp` | Manutenção de keep-alive da sessão |
| `offline.jsp` | Página de modo offline (Service Worker) |
| `progressbar.jsp` | Barra de progresso para operações longas |
| `hierarchicalView.jsp` | Visão hierárquica de dados |
| `defaultValues.jsp` | Configuração de valores padrão por campo |
| `interactionException.jsp` | Exibição de exceções de interação do usuário |

### Scripts e Desenvolvimento

| JSP | Descrição |
|-----|----------|
| `ExecuteScript.jsp` | Execução de scripts SQL diretamente |
| `reloadProcedures.jsp` | Recarregamento de procedures do banco |
| `runScript.jsp` | Execução de scripts (admin) |

### Páginas de Erro

| JSP | Descrição |
|-----|----------|
| `errors/400.jsp` | Página de erro 400 (Bad Request) |
| `errors/403.jsp` | Página de erro 403 (Forbidden) |
| `errors/404.jsp` | Página de erro 404 (Not Found) |
| `errors/500.jsp` | Página de erro 500 (Internal Server Error) |
| `errors/888.jsp` | Página de erro customizado 888 |

### Web Services

| JSP | Descrição |
|-----|----------|
| `webservices/index.jsp` | Listagem de Web Services disponíveis |


#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gerador de documentação da arquitetura Webrun (WAR) para o Manual Maker AI.
Analisa a estrutura do WAR extraído e gera documentação em Markdown.
"""

import os
import xml.etree.ElementTree as ET
import re
from pathlib import Path
from collections import defaultdict

# ── Caminhos ──────────────────────────────────────────────────────
WAR_DIR = os.path.join(os.path.dirname(__file__), "webrun5")
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "manual_maker_ai", "webrun-arquitetura")

def ensure_dir(path):
    os.makedirs(path, exist_ok=True)

# ── Helpers ───────────────────────────────────────────────────────

def count_lines(filepath):
    try:
        with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
            return sum(1 for _ in f)
    except:
        return 0

def read_file_text(filepath, encoding="utf-8"):
    try:
        with open(filepath, "r", encoding=encoding, errors="ignore") as f:
            return f.read()
    except:
        return ""

def extract_js_methods(filepath):
    """Extrai métodos prototype de um arquivo JS de componente."""
    text = read_file_text(filepath)
    methods = []
    pattern = re.compile(r'^(\w+)\.prototype\.(\w+)\s*=\s*function\s*\(([^)]*)\)', re.MULTILINE)
    for m in pattern.finditer(text):
        cls, method, params = m.group(1), m.group(2), m.group(3).strip()
        methods.append((cls, method, params))
    return methods

def extract_js_inherits(filepath):
    """Extrai herança de um arquivo JS."""
    text = read_file_text(filepath)
    m = re.search(r'(\w+)\.inherits\((\w+)\)', text)
    if m:
        return m.group(1), m.group(2)
    return None, None

def extract_js_properties(filepath):
    """Extrai propriedades prototype estáticas."""
    text = read_file_text(filepath)
    props = []
    pattern = re.compile(r'^(\w+)\.prototype\.(\w+)\s*=\s*(?!function)(.+?);', re.MULTILINE)
    for m in pattern.finditer(text):
        cls, prop, val = m.group(1), m.group(2), m.group(3).strip()
        if prop not in ('name', 'instance'):
            props.append((prop, val))
    return props

# ── 1. Visão Geral da Arquitetura ────────────────────────────────

def generate_overview():
    """Gera documento de visão geral da arquitetura Webrun."""

    # Contar arquivos por tipo
    file_counts = defaultdict(int)
    total_size = 0
    for root, dirs, files in os.walk(WAR_DIR):
        for f in files:
            ext = os.path.splitext(f)[1].lower()
            file_counts[ext] += 1
            total_size += os.path.getsize(os.path.join(root, f))

    sorted_exts = sorted(file_counts.items(), key=lambda x: -x[1])

    md = """# Arquitetura do Webrun (Runtime WAR)

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
| Tamanho Total | **{size_mb:.1f} MB** |
| Total de Arquivos | **{total_files}** |

### Arquivos por Tipo

| Extensão | Quantidade |
|----------|-----------|
""".format(
        size_mb=total_size / (1024 * 1024),
        total_files=sum(file_counts.values())
    )

    for ext, count in sorted_exts[:20]:
        ext_display = ext if ext else "(sem extensão)"
        md += f"| {ext_display} | {count} |\n"

    md += """
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
"""

    return md

# ── 2. Componentes JavaScript ────────────────────────────────────

def generate_components_doc():
    """Gera documentação dos 63 componentes JavaScript."""

    components_dir = os.path.join(WAR_DIR, "components")
    dep_file = os.path.join(components_dir, "component-dependences.xml")

    # Parse dependências
    deps = {}
    try:
        tree = ET.parse(dep_file)
        for comp in tree.findall(".//component"):
            name = comp.get("name", "")
            dep_list = [d.text for d in comp.findall("dependent") if d.text]
            deps[name] = dep_list
    except:
        pass

    # Hierarquia de componentes
    hierarchy = {
        "Base": {
            "desc": "Classes base de todos os componentes",
            "components": ["HTMLObject", "HTMLElementBase", "HTMLElementController", "HTMLLabeledComponent"]
        },
        "Entrada de Dados": {
            "desc": "Componentes para entrada e edição de dados",
            "components": ["HTMLEdit", "HTMLMemo", "HTMLComboBox", "HTMLLookup", "HTMLCheckbox",
                          "HTMLRadioGroup", "HTMLColorPicker", "HTMLSlider", "HTMLMultiSelect", "HTMLDualList"]
        },
        "Exibição": {
            "desc": "Componentes de exibição de informações",
            "components": ["HTMLLabel", "HTMLImage", "HTMLImageGallery", "HTMLProgressBar", "HTMLPlayer",
                          "HTMLRssFeed", "HTMLShape", "HTMLShapeBase"]
        },
        "Contêineres": {
            "desc": "Componentes que agrupam outros componentes",
            "components": ["HTMLPanel", "HTMLGroupBox", "HTMLTab", "HTMLTabComponent", "HTMLContainer",
                          "HTMLAccordion", "HTMLDetailPanel", "HTMLSliderPanel", "HTMLPage"]
        },
        "Grids e Tabelas": {
            "desc": "Componentes de grade de dados",
            "components": ["HTMLGrid", "HTMLNavigationGrid", "HTMLPaging", "HTMLQuery"]
        },
        "Navegação": {
            "desc": "Componentes de navegação e botões",
            "components": ["HTMLButton", "HTMLImageButton", "HTMLActionButton", "HTMLNavigationButton",
                          "HTMLNavigationButtonSingleImage", "HTMLNavigation", "HTMLNavigationForm",
                          "HTMLNavigationQuery"]
        },
        "Visualização": {
            "desc": "Componentes de gráfico, calendário e árvore",
            "components": ["HTMLChart", "HTMLSerie", "HTMLCalendar", "HTMLTreeview", "HTMLTreeviewNode",
                          "HTMLTreeViewLevel", "HTMLCard"]
        },
        "Interação": {
            "desc": "Componentes de interação e comunicação",
            "components": ["HTMLChat", "HTMLMessage", "HTMLAlert", "HTMLUploadComponent", "HTMLWait", "HTMLTimer"]
        },
        "Especiais": {
            "desc": "Componentes especiais e de integração",
            "components": ["HTMLHidden", "HTMLIntegration", "HTMLMakerController", "HTMLMakerFlowComponent",
                          "HTMLPermissionForm", "HTMLObject", "ImageObject"]
        }
    }

    md = """# Componentes JavaScript do Webrun

## Visão Geral

O Webrun utiliza **63 componentes JavaScript** que implementam a interface visual dos formulários criados no Maker AI. Todos os componentes seguem um padrão de herança baseado em prototypes JavaScript.

### Padrão de Implementação

```javascript
// Construtor
function HTMLEdit(sys, formID, code, posX, posY, width, height, description, value) {
  this.create(sys, formID, code, posX, posY, width, height, description, value);
  // ... inicialização específica
}

// Herança
HTMLEdit.inherits(HTMLLabeledComponent);

// Métodos via prototype
HTMLEdit.prototype.getValue = function() { ... };
HTMLEdit.prototype.setValue = function(value) { ... };
```

### Parâmetros Base (HTMLElementBase)

Todos os componentes visuais herdam de `HTMLElementBase` e recebem:

| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| `sys` | String | Código do sistema |
| `formID` | String | Código do formulário |
| `code` | String | Código do componente |
| `posX` | Number | Posição X (pixels) |
| `posY` | Number | Posição Y (pixels) |
| `width` | Number | Largura (pixels) |
| `height` | Number | Altura (pixels) |
| `description` | String | Descrição/label do componente |
| `value` | String | Valor inicial |

### Propriedades Base

| Propriedade | Padrão | Descrição |
|-------------|--------|-----------|
| `enabled` | `true` | Componente habilitado |
| `visible` | `true` | Componente visível |
| `readonly` | `false` | Apenas leitura |
| `required` | `false` | Campo obrigatório |
| `tabable` | `true` | Participa da tabulação |
| `zindex` | `1` | Ordem Z de empilhamento |
| `tagName` | `'input'` | Tag HTML gerada |

---

## Hierarquia de Herança

```
HTMLObject
└── HTMLElementBase
    ├── HTMLLabeledComponent
    │   ├── HTMLEdit
    │   │   └── HTMLMemo
    │   ├── HTMLLookup
    │   │   └── HTMLComboBox
    │   │       └── HTMLMultiSelect
    │   ├── HTMLAccordion
    │   └── HTMLSlider
    ├── HTMLGroupBox
    │   ├── HTMLRadioGroup
    │   ├── HTMLDetailPanel
    │   └── HTMLChat
    ├── HTMLGrid
    ├── HTMLButton
    │   └── HTMLNavigationButton
    ├── HTMLCheckbox
    ├── HTMLImage
    ├── HTMLDualList
    ├── HTMLChart
    └── (demais componentes)
```

---

## Mapa de Dependências

Cada componente pode depender de outros para funcionar. O arquivo `component-dependences.xml` define essas relações:

| Componente | Depende de |
|-----------|-----------|
"""

    for name in sorted(deps.keys()):
        dep_list = deps[name]
        if dep_list:
            md += f"| `{name}` | {', '.join(f'`{d}`' for d in dep_list)} |\n"
        else:
            md += f"| `{name}` | *(nenhuma)* |\n"

    md += "\n---\n\n## Componentes por Categoria\n\n"

    # Para cada categoria, documentar componentes
    for cat_name, cat_info in hierarchy.items():
        md += f"### {cat_name}\n\n"
        md += f"*{cat_info['desc']}*\n\n"

        for comp_name in cat_info["components"]:
            js_file = os.path.join(components_dir, f"{comp_name}.js")
            if not os.path.exists(js_file):
                continue

            lines = count_lines(js_file)
            child, parent = extract_js_inherits(js_file)
            methods = extract_js_methods(js_file)
            props = extract_js_properties(js_file)

            md += f"#### `{comp_name}`\n\n"
            if parent:
                md += f"- **Herda de**: `{parent}`\n"
            if comp_name in deps:
                dep_list = deps[comp_name]
                if dep_list:
                    md += f"- **Dependências**: {', '.join(f'`{d}`' for d in dep_list)}\n"
            md += f"- **Linhas**: {lines}\n"

            if props:
                md += f"\n**Propriedades:**\n\n"
                md += "| Propriedade | Valor Padrão |\n|-------------|-------------|\n"
                for pname, pval in props[:15]:
                    md += f"| `{pname}` | `{pval}` |\n"
                if len(props) > 15:
                    md += f"| ... | *({len(props) - 15} mais)* |\n"

            # Agrupar métodos por tipo
            if methods:
                getters = [(m, p) for _, m, p in methods if m.startswith("get")]
                setters = [(m, p) for _, m, p in methods if m.startswith("set")]
                others = [(m, p) for _, m, p in methods if not m.startswith("get") and not m.startswith("set")]

                md += f"\n**Métodos principais** ({len(methods)} total):\n\n"

                if others:
                    md += "| Método | Parâmetros |\n|--------|------------|\n"
                    for mname, mparams in others[:20]:
                        md += f"| `{mname}` | `{mparams}` |\n"
                    if len(others) > 20:
                        md += f"| ... | *({len(others) - 20} mais)* |\n"

                if getters:
                    getter_names = ", ".join(f"`{m}`" for m, _ in getters[:10])
                    md += f"\n**Getters**: {getter_names}"
                    if len(getters) > 10:
                        md += f" *e mais {len(getters) - 10}*"
                    md += "\n"

                if setters:
                    setter_names = ", ".join(f"`{m}`" for m, _ in setters[:10])
                    md += f"\n**Setters**: {setter_names}"
                    if len(setters) > 10:
                        md += f" *e mais {len(setters) - 10}*"
                    md += "\n"

            md += "\n---\n\n"

    return md

# ── 3. Classes Java ──────────────────────────────────────────────

def generate_java_classes_doc():
    """Gera documentação das classes Java do Webrun."""

    classes_dir = os.path.join(WAR_DIR, "WEB-INF", "classes")

    # Coletar todas as classes
    packages = defaultdict(list)
    for root, dirs, files in os.walk(classes_dir):
        for f in files:
            if f.endswith(".class") and "$" not in f:
                rel = os.path.relpath(os.path.join(root, f), classes_dir)
                fqn = rel.replace(os.sep, ".").replace(".class", "")
                parts = fqn.rsplit(".", 1)
                if len(parts) == 2:
                    pkg, cls = parts
                else:
                    pkg, cls = "(default)", parts[0]
                packages[pkg].append(cls)

    # Descrições dos pacotes
    pkg_desc = {
        "wfr.code": {
            "name": "Gerador de Código",
            "desc": "Responsável por gerar código Java a partir das definições do Maker AI. Compila sistemas, formulários e componentes em classes Java executáveis.",
            "classes_desc": {
                "CodeGenerator": "Classe principal que orquestra a geração de código Java a partir de XMLs do Maker",
                "CompilationPool": "Pool de compilação assíncrona com fila de tarefas",
                "FormCodeGenerator": "Gera classes Java para formulários do Maker",
                "SystemCodeGenerator": "Gera classes Java para sistemas do Maker",
                "ComponentCodeGenerator": "Gera classes Java para componentes individuais",
            }
        },
        "wfr.com": {
            "name": "Modelo de Domínio",
            "desc": "Contém as classes que representam os objetos de negócio do Webrun: sistemas, formulários, componentes, menus, relatórios e configurações.",
            "classes_desc": {
                "WFRSystem": "Representa um sistema Maker com suas propriedades, formulários e menus",
                "WFRForm": "Representa um formulário com seus campos, regras e ações",
                "WFRComponent": "Representa um componente visual de formulário",
                "WFRMenu": "Estrutura de menu de um sistema",
                "WFRMenuItem": "Item individual de menu",
                "WFRReport": "Representação de relatório (Jasper, Maker, etc.)",
                "WFRSkin": "Gerenciamento de skins/temas visuais",
                "WFRProfile": "Perfil de acesso e permissões",
                "WFRField": "Definição de campo de formulário",
                "WFRAction": "Ação associada a componente ou formulário",
                "ActionType": "Enum dos tipos de ação disponíveis",
                "WebrunProperties": "Propriedades globais do Webrun",
                "AutoDeploy": "Deploy automático de pacotes FRZ",
                "FlowJob": "Execução de jobs de fluxo de trabalho",
                "FlowJobController": "Controlador de jobs de fluxo",
                "WFRAccess": "Controle de acesso a formulários",
                "WFRAccessGroup": "Grupo de acesso",
                "WFRAccessUser": "Acesso por usuário",
                "WFRAccessPermission": "Permissão específica de acesso",
                "WFRImage": "Gerenciamento de imagens",
                "WFRExport": "Exportação de dados",
                "WFRPersistence": "Persistência de dados",
                "WFREFile": "Arquivo de conexão WFRE (criptografado)",
                "WFRJasperReport": "Relatório Jasper Reports",
                "WFRMakerReport": "Relatório nativo Maker",
                "WFRDataType": "Tipos de dados suportados",
                "WFRDefaultValue": "Valores padrão de campos",
                "WFRShortcut": "Atalhos de navegação",
                "WFRTab": "Representação de aba de formulário",
                "WFRMailSenderOauth2": "Envio de e-mail via OAuth2",
                "MakerFlowComponents": "Componentes visuais do Maker Flow",
            }
        },
        "wfr.database": {
            "name": "Acesso a Banco de Dados",
            "desc": "Camada de acesso a dados com suporte multi-banco. Inclui pool de conexões, metadados por SGBD, resultsets especializados e importação de dados.",
            "classes_desc": {
                "DBConnection": "Conexão principal com o banco de dados, gerencia transações",
                "DBPool": "Pool de conexões JDBC com reutilização inteligente",
                "DBMetadata": "Interface base para metadados de banco de dados",
                "DBMSSQLMetadata": "Metadados específicos para SQL Server",
                "DBOracleMetadata": "Metadados específicos para Oracle",
                "DBPostgreSQLMetadata": "Metadados específicos para PostgreSQL",
                "DBInterbaseMetadata": "Metadados específicos para Firebird/Interbase",
                "DBProgressMetadata": "Metadados específicos para Progress",
                "DBGenericMetadata": "Metadados genéricos para bancos não suportados nativamente",
                "CachedResultSet": "ResultSet em cache para otimizar consultas repetidas",
                "PagedResultSet": "ResultSet com paginação para grandes volumes",
                "TrimResultSet": "ResultSet que aplica trim automático (Firebird)",
                "InsertResultSet": "ResultSet para operações de inserção em lote",
                "XMLResultSet": "ResultSet baseado em XML",
                "LoggableStatement": "PreparedStatement com logging para depuração",
                "DatabaseEnvConfigReader": "Leitura de configuração de banco via variáveis de ambiente",
                "WFRResultSet": "ResultSet wrapper do Webrun",
            }
        },
        "wfr.rules": {
            "name": "Motor de Regras",
            "desc": "Compilador e executor de regras de negócio. Suporta regras server-side (Java compilado), client-side (JavaScript) e integração com Web Services.",
            "classes_desc": {
                "WFRRule": "Representação de uma regra de negócio com código compilável",
                "WFRRuleCompiler": "Compilador de regras server-side para SQL Server",
                "WFRRuleCompilerAb": "Compilador base abstrato de regras",
                "WFRRuleCompilerInterbase": "Compilador de regras para Firebird/Interbase",
                "WFRRuleCompilerOracle": "Compilador de regras para Oracle",
                "WFRRuleCompilerPostgreSQL": "Compilador de regras para PostgreSQL",
                "WFRRuleJSCompiler": "Compilador de regras client-side (JavaScript)",
                "WFRRuleJSManager": "Gerenciador de regras JavaScript",
                "WFRRuleManager": "Gerenciador geral de regras",
                "RulesFunctions": "Implementação das funções nativas das regras (server-side)",
                "Variant": "Tipo dinâmico para variáveis de regra (similar a Variant do VB)",
                "VariantPool": "Pool de variáveis Variant reutilizáveis",
                "FlowMethodsManager": "Gerenciador de métodos de fluxo de trabalho",
                "FlowMethod": "Método individual de um fluxo",
                "FlowMethodCategory": "Categoria de métodos de fluxo",
                "DebugManager": "Depurador de regras com breakpoints",
                "ProfileManager": "Gerenciador de perfis de acesso em regras",
                "WebServiceExporter": "Exportação de regras como Web Services",
                "WebServiceImporter": "Importação/consumo de Web Services (Axis 1.x)",
                "WebServiceImporter2": "Importação de Web Services (Axis 2.x)",
                "WebServiceImporter3": "Importação de Web Services (CXF 3.x)",
                "WFRRuleClient": "Regra client-side",
                "WFRRuleActivities": "Atividades associadas a regras",
                "WFRExternalRule": "Regra externa (JAR/classe Java)",
                "WFRJSRule": "Regra JavaScript server-side",
                "RulesClassLoader": "ClassLoader especializado para classes de regras",
                "RulesConstants": "Constantes usadas pelo motor de regras",
                "WebSocketProxy": "Proxy de WebSocket para regras",
            }
        },
        "wfr.rules.monitoring": {
            "name": "Monitoramento",
            "desc": "Sistema de monitoramento em tempo real do Webrun, incluindo métricas de banco, ambiente, sessões e filas de mensageria.",
            "classes_desc": {
                "MonitoringController": "Controlador principal do monitoramento",
                "MonitoringManager": "Gerenciador de coleta de métricas",
                "MonitoringDatabase": "Monitoramento de conexões com banco",
                "MonitoringEnvironment": "Monitoramento do ambiente (JVM, memória, disco)",
                "MonitoringMessagingQueues": "Monitoramento de filas RabbitMQ",
                "MonitoringJob": "Job de coleta periódica de métricas",
            }
        },
        "wfr.rules.monitoring.flows": {
            "name": "Monitoramento de Fluxos",
            "desc": "Monitoramento específico de execução de fluxos de trabalho BPM.",
            "classes_desc": {
                "MonitoringFlows": "Monitoramento de fluxos em execução",
                "MonitoringFlowsJob": "Job periódico de monitoramento de fluxos",
            }
        },
        "wfr.sys": {
            "name": "Núcleo do Sistema",
            "desc": "Core do Webrun responsável pelo processamento de requisições, navegação entre formulários, gerenciamento de dados e agendamento.",
            "classes_desc": {
                "WFR": "Classe central do Webrun - gerencia sessão, sistemas carregados e dados",
                "WFRLoader": "Carregador de sistemas e formulários do banco de dados",
                "WFRNavigation": "Navegação entre formulários e registros",
                "WFRScheduler": "Agendador de tarefas periódicas (jobs, fluxos)",
                "WFRData": "Dados de sessão do Webrun",
                "WFRFormData": "Dados de um formulário aberto na sessão",
                "Criteria": "Critérios de pesquisa (WHERE dinâmico)",
                "Data": "Container de dados para processamento",
                "PreparedSQL": "SQL preparado com parâmetros tipados",
                "ErrorMessagesManager": "Gerenciador de mensagens de erro internacionalizadas",
                "WFRHandleSystemLoaded": "Handler de evento de sistema carregado",
                "WFRPrintWriter": "PrintWriter customizado para saída HTML",
                "BinaryData": "Dados binários (uploads, imagens)",
                "ResultSetModes": "Modos de operação de ResultSets",
            }
        },
        "wfr.sys.HTMLInterface": {
            "name": "Interface HTML (Server-Side)",
            "desc": "Classes server-side que geram o HTML/JavaScript dos componentes. Cada componente visual tem uma classe correspondente aqui que produz o código de renderização.",
            "classes_desc": {
                "HTMLInterface": "Interface principal que coordena a geração HTML de formulários",
                "HTMLForm": "Geração HTML de formulários",
                "HTMLElement": "Base para geração HTML de elementos",
                "HTMLElementFactory": "Factory que cria elementos HTML baseado no tipo",
                "HTMLGrid": "Geração HTML da grid de dados",
                "HTMLEdit": "Geração HTML de campos de edição",
                "HTMLComboBox": "Geração HTML de combo boxes",
                "HTMLLookup": "Geração HTML de lookups",
                "HTMLCheckbox": "Geração HTML de checkboxes",
                "HTMLButton": "Geração HTML de botões",
                "HTMLChart": "Geração HTML de gráficos",
                "HTMLMenu": "Geração HTML de menus",
                "HTMLNavigation": "Geração HTML da barra de navegação",
                "HTMLReport": "Geração HTML para visualização de relatórios",
                "HTMLTree": "Geração HTML de treeviews",
                "HTMLAdminInterface": "Interface de administração HTML",
                "HTMLConstants": "Constantes HTML compartilhadas",
                "HTMLShortcut": "Geração HTML de atalhos",
                "HTMLFormSearch": "Geração HTML da tela de pesquisa",
                "HTMLDownload": "Geração HTML para downloads",
                "HTMLError": "Geração HTML de páginas de erro",
                "HTMLExecuteScript": "Execução de scripts SQL via interface",
            }
        },
        "wfr.sys.plugins": {
            "name": "Plugins do Sistema",
            "desc": "Funcionalidades plugáveis como busca textual (Lucene), estatísticas, visão hierárquica e conversão de Excel para banco.",
            "classes_desc": {
                "TextualSearch": "Busca textual full-text usando Apache Lucene",
                "SystemStatistics": "Estatísticas de uso do sistema",
                "HierarchicalView": "Visualização hierárquica de dados",
                "MasterSkin": "Geração dinâmica de CSS de temas (Master Skin)",
                "ConvertExcelToDatabase": "Conversão de planilhas Excel para tabelas de banco",
            }
        },
        "wfr.sys.plugins.database": {
            "name": "Gerenciamento de Banco (Plugin)",
            "desc": "Plugin para gerenciamento de estrutura de banco de dados (DDL) com suporte a múltiplos SGBDs.",
            "classes_desc": {
                "DatabaseManager": "Gerenciador DDL de tabelas e campos",
                "DatabaseParser": "Parser de definições de tabela",
                "FirebirdDatabase": "DDL específico para Firebird",
                "MSSQLDatabase": "DDL específico para SQL Server",
                "MySQLDatabase": "DDL específico para MySQL",
                "OracleDatabase": "DDL específico para Oracle",
                "PostgresDatabase": "DDL específico para PostgreSQL",
            }
        },
        "wfr.tags": {
            "name": "Tag Libraries JSP",
            "desc": "Tags customizadas JSP para uso nas páginas do Webrun.",
            "classes_desc": {
                "JSPControllerTag": "Tag principal que controla o fluxo do JSP",
                "JSPAdminControllerTag": "Tag de controle para páginas de administração",
                "ImportTag": "Tag para importação de recursos",
                "MessageTag": "Tag para exibição de mensagens i18n",
                "MessageParamTag": "Tag para parâmetros de mensagens",
                "ErrorMessageTag": "Tag para exibição de erros",
                "JspFunctionsTag": "Tag com funções utilitárias para JSP",
            }
        },
        "wfr.util": {
            "name": "Utilitários",
            "desc": "Classes utilitárias para funções diversas: compressão, configuração, internacionalização, REST, AWS, criptografia, etc.",
            "classes_desc": {
                "Functions": "Funções utilitárias gerais (strings, datas, conversões)",
                "Config": "Leitura de configurações XML do Webrun",
                "WFRConfig": "Configuração avançada do Webrun",
                "Language": "Gerenciamento de idiomas e localização",
                "ApplicationResources": "Recursos i18n da aplicação",
                "Resources": "Acesso a recursos do classpath",
                "CompressJS": "Compressor de JavaScript (YUI Compressor)",
                "Compression": "Compressão GZIP de respostas",
                "Logger": "Sistema de logging do Webrun",
                "WFRRestCall": "Cliente REST para chamadas HTTP externas",
                "WFRAWS": "Integração com Amazon AWS (S3, KMS)",
                "WFRChatAPIWhatsApp": "Integração com API do WhatsApp",
                "WFRNFeSignature": "Assinatura digital de NF-e",
                "WFROffice": "Manipulação de documentos Office (Word, Excel)",
                "WebrunCompiler": "Compilação dinâmica de classes Java",
                "WebrunShell": "Execução de comandos shell no servidor",
                "RandomGUID": "Geração de GUIDs aleatórios",
                "SQLFormatter": "Formatação de SQL para exibição",
                "SessionKeys": "Chaves de sessão do Webrun",
                "CookieKeys": "Chaves de cookies",
                "JsonConverter": "Conversão JSON",
                "JS": "Utilitários JavaScript",
                "JSMin": "Minificação de JavaScript",
                "SimpleAuthenticator": "Autenticador simples para e-mail SMTP",
                "TableNameParser": "Parser de nomes de tabela em SQL",
                "BridgedFunctions": "Funções ponte entre Java e JavaScript",
                "WebrunSSLSocketFactory": "Factory de sockets SSL customizada",
                "MergeFiles": "Merge de múltiplos arquivos (JS/CSS)",
            }
        },
        "wfr.util.RabbitMQ": {
            "name": "Mensageria (RabbitMQ)",
            "desc": "Integração com RabbitMQ para mensageria assíncrona entre sistemas.",
            "classes_desc": {
                "WebrunRabbitMQ": "Cliente RabbitMQ para envio e recebimento de mensagens",
            }
        },
        "wfr.util.dfm": {
            "name": "Parser DFM (Delphi)",
            "desc": "Parser de arquivos DFM (Delphi Form Module) para importação de formulários legados.",
            "classes_desc": {
                "DFMParser": "Parser de formulários Delphi (.dfm) para migração",
            }
        },
        "wfr.web": {
            "name": "Camada Web (Servlets e Filtros)",
            "desc": "Servlets, filtros e classes de suporte para a camada HTTP do Webrun.",
            "classes_desc": {
                "Controller": "Servlet controlador MVC principal - roteia todas as ações",
                "WFRCore": "Core AJAX do Webrun - processa ações assíncronas",
                "AdminCore": "Controlador de administração do sistema",
                "ActionFactory": "Factory que instancia Actions baseado no tipo da requisição",
                "Action": "Classe base para todas as ações HTTP",
                "GetImage": "Servlet que serve imagens do banco de dados",
                "FileUpload": "Upload de arquivos (commons-fileupload)",
                "NewFileUpload": "Upload moderno com multipart",
                "Download": "Download de arquivos e documentos",
                "GetDate": "Retorna data/hora do servidor",
                "FlowPlay": "Executor de fluxos de trabalho via HTTP",
                "MakerWebController": "Controlador para Maker Web (SPA)",
                "ExternalRulesServlet": "Execução de regras externas via HTTP",
                "WFRGridExport": "Exportação de grids (Excel, CSV, PDF)",
                "WFRChatExport": "Exportação de histórico de chat",
                "WFRWebService": "Exposição de regras como Web Service",
                "WFRAdminWebService": "Web Service de administração",
                "InsertImport": "Importação de dados em massa",
                "InsertDataFileImport": "Importação de dados de arquivo",
                "GetDependences": "Download de dependências para cliente",
                "RemainSession": "Keep-alive de sessão HTTP",
                "ManifestJson": "Geração de manifest.json para PWA",
                "ContextFilter": "Filtro de contexto global",
                "ForbiddenAccessFilter": "Filtro de bloqueio de acesso a diretórios protegidos",
                "CompressAndCacheFilter": "Filtro de compressão GZIP e cache",
                "ResponseHeaderFilter": "Filtro de configuração de headers HTTP",
                "ImageFilter": "Filtro de cache para imagens",
                "GZIPFilter": "Filtro de compressão GZIP",
                "WebrunContextListener": "Listener de inicialização da aplicação",
                "WebrunXSSRequestWrapper": "Wrapper de request com proteção XSS",
                "ForbiddenServlet": "Servlet para acesso proibido (403)",
            }
        },
        "wfr.web.actions": {
            "name": "Ações HTTP (Action Pattern)",
            "desc": "Implementações do padrão Action para cada tipo de operação do Webrun. Cada ação trata um tipo específico de requisição do usuário.",
            "classes_desc": {
                "NavigateAction": "Navegação entre registros (primeiro, anterior, próximo, último)",
                "SearchAction": "Pesquisa de registros com critérios",
                "FormAction": "Abertura e carregamento de formulários",
                "GridAction": "Ações sobre grids (seleção, ordenação)",
                "GridEditAction": "Edição inline em grids",
                "OpenAction": "Abertura de sistemas",
                "OpenformAction": "Abertura de formulários",
                "CloseformAction": "Fechamento de formulários",
                "ClosesystemAction": "Fechamento de sistemas",
                "LogonAction": "Autenticação de usuários",
                "ChangepasswordAction": "Alteração de senha",
                "ExecuteRuleAction": "Execução de regras de negócio",
                "ExecuteFunctionAction": "Execução de funções nativas",
                "ExecuteSqlAction": "Execução de SQL dinâmico",
                "ReportAction": "Geração de relatórios",
                "OpenReportAction": "Abertura de relatórios",
                "FileUploadAction": "Upload de arquivos via action",
                "LookupShowValueAction": "Exibição de valor em lookups",
                "RefreshAction": "Atualização de dados do formulário",
                "OrderAction": "Ordenação de registros",
                "ChangeaccessAction": "Alteração de permissões",
                "ChangeallaccessAction": "Alteração de permissões em lote",
                "CopyaccessAction": "Cópia de permissões entre perfis",
                "DebugJSAction": "Depuração de JavaScript no servidor",
                "ImportExcelFileAction": "Importação de dados de Excel",
                "SessionManagerAction": "Gerenciamento de sessões ativas",
                "ReloadSystemAction": "Recarregamento de sistema sem restart",
                "ReloadFormAction": "Recarregamento de formulário",
                "ComponentDataAction": "Carregamento de dados de componentes via AJAX",
                "SaveshortcutAction": "Salvamento de atalhos do usuário",
                "ChangeModeAction": "Alternância entre modos de operação",
            }
        },
        "wfr.web.websocket.chat": {
            "name": "Chat via WebSocket",
            "desc": "Sistema de chat em tempo real via WebSocket.",
            "classes_desc": {}
        },
        "wfr.exceptions": {
            "name": "Hierarquia de Exceções",
            "desc": "Exceções customizadas do Webrun para tratamento de erros específicos.",
            "classes_desc": {
                "WFRException": "Exceção base do Webrun",
                "WFRAccessDenied": "Acesso negado a recurso",
                "WFRAccessFormDeniedException": "Acesso negado a formulário",
                "WFRCompileException": "Erro de compilação de regra",
                "WFRRuleException": "Erro na execução de regra",
                "WFRRuleStopException": "Parada proposital de regra (stop rule)",
                "WFRReportException": "Erro na geração de relatório",
                "WFRUserNotLogged": "Usuário não autenticado",
                "WFRSystemExpired": "Sistema com licença expirada",
                "WFRMustChangePassword": "Senha expirada, usuário deve alterar",
                "ChangePasswordException": "Erro na alteração de senha",
                "SystemNotFoundException": "Sistema não encontrado",
                "InnerException": "Exceção interna encapsulada",
                "WebrunException": "Exceção genérica do Webrun",
            }
        },
    }

    md = """# Classes Java do Webrun

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

"""

    for pkg_name in sorted(pkg_desc.keys()):
        info = pkg_desc[pkg_name]
        classes = sorted(packages.get(pkg_name, []))

        md += f"## {info['name']} (`{pkg_name}`)\n\n"
        md += f"{info['desc']}\n\n"

        if classes:
            md += "| Classe | Descrição |\n|--------|----------|\n"
            for cls in classes:
                desc = info.get("classes_desc", {}).get(cls, "")
                md += f"| `{cls}` | {desc} |\n"
            md += "\n"

        md += "---\n\n"

    # Bancos suportados
    md += """## Bancos de Dados Suportados

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
"""

    return md

# ── 4. Configurações ─────────────────────────────────────────────

def generate_config_doc():
    """Gera documentação dos arquivos de configuração."""

    md = """# Configurações do Webrun

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
"""

    return md

# ── 5. Páginas JSP ───────────────────────────────────────────────

def generate_jsp_doc():
    """Gera documentação das páginas JSP."""

    jsps = {
        "index.jsp": "Página inicial — carregamento do sistema e login",
        "logon.jsp": "Tela de autenticação (login) do usuário",
        "system.jsp": "Renderização de um sistema Maker (menus, formulários)",
        "form.jsp": "Renderização de um formulário Maker com seus componentes",
        "query.jsp": "Tela de consulta/pesquisa de registros",
        "basic_query.jsp": "Consulta básica simplificada",
        "advanced_query.jsp": "Consulta avançada com múltiplos critérios",
        "report.jsp": "Visualização de relatórios gerados",
        "openreport.jsp": "Abertura de relatório por código",
        "reportBuilder.jsp": "Construtor visual de relatórios",
        "queryReport.jsp": "Relatório baseado em consulta",
        "zoom.jsp": "Popup de zoom/lookup ampliado",
        "customZoom.jsp": "Zoom customizado pelo desenvolvedor",
        "masterSkin.jsp": "Geração dinâmica de CSS do tema (Master Skin)",
        "configManager.jsp": "Gerenciador de configurações do Webrun (admin)",
        "indexConfig.jsp": "Índice da configuração administrativa",
        "advancedAdmin.jsp": "Administração avançada do sistema",
        "comaccess.jsp": "Gerenciamento de permissões de acesso",
        "auth.jsp": "Autenticação especial (SSO, token)",
        "ntlm.jsp": "Autenticação Windows NTLM/Negotiate",
        "exit.jsp": "Logout e encerramento de sessão",
        "password.jsp": "Alteração de senha do usuário",
        "log.jsp": "Visualização de logs do sistema",
        "upload.jsp": "Upload de arquivos",
        "download.jsp": "Download de arquivos e documentos",
        "export.jsp": "Exportação de dados (Excel, CSV, PDF)",
        "import.jsp": "Importação de dados de arquivos",
        "importContent.jsp": "Conteúdo de importação (modal)",
        "importadorDados.jsp": "Importador de dados avançado",
        "excelToDataBase.jsp": "Conversão de Excel para tabela de banco",
        "camera.jsp": "Captura de câmera/webcam",
        "digitalcapture.jsp": "Captura de impressão digital",
        "serial.jsp": "Comunicação serial (periféricos)",
        "flowplay.jsp": "Execução visual de fluxos de trabalho",
        "helpform.jsp": "Ajuda contextual de formulários",
        "keepSession.jsp": "Manutenção de keep-alive da sessão",
        "offline.jsp": "Página de modo offline (Service Worker)",
        "progressbar.jsp": "Barra de progresso para operações longas",
        "chooseIcon.jsp": "Seleção de ícone para componentes",
        "chooseNavbar.jsp": "Seleção de estilo de barra de navegação",
        "hierarchicalView.jsp": "Visão hierárquica de dados",
        "systemStatistics.jsp": "Estatísticas do sistema",
        "textualSearch.jsp": "Busca textual full-text (Lucene)",
        "defaultValues.jsp": "Configuração de valores padrão por campo",
        "systemCheck.jsp": "Verificação de saúde do sistema",
        "interactionException.jsp": "Exibição de exceções de interação do usuário",
        "autoTest.jsp": "Testes automatizados do Webrun",
        "ExecuteScript.jsp": "Execução de scripts SQL diretamente",
        "reloadProcedures.jsp": "Recarregamento de procedures do banco",
        "runScript.jsp": "Execução de scripts (admin)",
        "errors/400.jsp": "Página de erro 400 (Bad Request)",
        "errors/403.jsp": "Página de erro 403 (Forbidden)",
        "errors/404.jsp": "Página de erro 404 (Not Found)",
        "errors/500.jsp": "Página de erro 500 (Internal Server Error)",
        "errors/888.jsp": "Página de erro customizado 888",
        "webservices/index.jsp": "Listagem de Web Services disponíveis",
    }

    md = """# Páginas JSP do Webrun

## Visão Geral

O Webrun possui **56 páginas JSP** que compõem a interface web. As JSPs utilizam Tag Libraries customizadas do Webrun (`wfr.tags`) e são processadas pelo servidor Java EE.

### Mapeamento de Tags JSP

| Tag | Classe | Função |
|-----|--------|--------|
| `<wfr:controller>` | `JSPControllerTag` | Controlador principal da página |
| `<wfr:admin-controller>` | `JSPAdminControllerTag` | Controlador de admin |
| `<wfr:import>` | `ImportTag` | Importação de recursos |
| `<wfr:message>` | `MessageTag` | Mensagens i18n |
| `<wfr:error-message>` | `ErrorMessageTag` | Mensagens de erro |
| `<wfr:functions>` | `JspFunctionsTag` | Funções utilitárias |

---

## Páginas por Categoria

### Formulários e Sistema

| JSP | Descrição |
|-----|-----------|
"""

    # Agrupar JSPs por categoria
    categories = {
        "Formulários e Sistema": ["index.jsp", "system.jsp", "form.jsp", "logon.jsp", "auth.jsp", "ntlm.jsp", "exit.jsp", "password.jsp"],
        "Consultas e Pesquisa": ["query.jsp", "basic_query.jsp", "advanced_query.jsp", "zoom.jsp", "customZoom.jsp", "textualSearch.jsp"],
        "Relatórios": ["report.jsp", "openreport.jsp", "reportBuilder.jsp", "queryReport.jsp"],
        "Importação/Exportação": ["export.jsp", "import.jsp", "importContent.jsp", "importadorDados.jsp", "excelToDataBase.jsp", "upload.jsp", "download.jsp"],
        "Administração": ["configManager.jsp", "indexConfig.jsp", "advancedAdmin.jsp", "comaccess.jsp", "log.jsp", "systemCheck.jsp", "autoTest.jsp", "systemStatistics.jsp"],
        "Temas e Aparência": ["masterSkin.jsp", "chooseIcon.jsp", "chooseNavbar.jsp"],
        "Fluxos e Processos": ["flowplay.jsp"],
        "Utilitárias": ["camera.jsp", "digitalcapture.jsp", "serial.jsp", "helpform.jsp", "keepSession.jsp", "offline.jsp", "progressbar.jsp", "hierarchicalView.jsp", "defaultValues.jsp", "interactionException.jsp"],
        "Scripts e Desenvolvimento": ["ExecuteScript.jsp", "reloadProcedures.jsp", "runScript.jsp"],
        "Páginas de Erro": ["errors/400.jsp", "errors/403.jsp", "errors/404.jsp", "errors/500.jsp", "errors/888.jsp"],
        "Web Services": ["webservices/index.jsp"],
    }

    md = """# Páginas JSP do Webrun

## Visão Geral

O Webrun possui **56 páginas JSP** que compõem a interface web. As JSPs utilizam Tag Libraries customizadas do Webrun (`wfr.tags`) e são processadas pelo servidor Java EE.

---

"""

    for cat_name, jsp_list in categories.items():
        md += f"### {cat_name}\n\n"
        md += "| JSP | Descrição |\n|-----|----------|\n"
        for jsp in jsp_list:
            desc = jsps.get(jsp, "")
            md += f"| `{jsp}` | {desc} |\n"
        md += "\n"

    return md

# ── 6. JavaScript Principal ──────────────────────────────────────

def generate_js_engine_doc():
    """Gera documentação do engine JavaScript principal."""

    md = """# Engine JavaScript do Webrun

## Arquivos JavaScript Principais

### wfr.js — Engine Principal

O `wfr.js` é o coração do cliente Webrun com **6.660 linhas** de código. Ele é responsável por:

- Gerenciamento de sessão no cliente
- Comunicação AJAX com o servidor (WFRCore)
- Manipulação do DOM para formulários dinâmicos
- Sistema de herança de componentes (`.inherits()`)
- Controle de navegação entre formulários
- Gerenciamento de ações (inserir, editar, excluir, pesquisar)
- Cache de componentes carregados
- Tratamento de eventos (teclado, mouse, foco)
- Suporte a responsive/mobile

#### Constantes Globais

| Constante | Valor | Descrição |
|-----------|-------|-----------|
| `VERSION` | `"5.0.0.46"` | Versão do Webrun |
| `ENCODING` | `"ISO-8859-1"` | Encoding padrão |

### rulesFunctions.js — Funções de Regras Client-Side

O `rulesFunctions.js` contém **1.121 linhas** com extensões dos prototypes nativos do JavaScript para suportar as funções de regras compiladas para o cliente.

#### Extensões de Number

| Método | Descrição |
|--------|-----------|
| `Number.prototype.trunc()` | Trunca número decimal |
| `Number.prototype.formatMoney(places, symbol, thousand, decimal)` | Formata como moeda |
| `Number.prototype.round(decimals)` | Arredonda com casas decimais |

#### Extensões de Date

| Método | Descrição |
|--------|-----------|
| `Date.prototype.incDay(days)` | Incrementa dias |
| `Date.prototype.incMonth(months)` | Incrementa meses |
| `Date.prototype.incYear(years)` | Incrementa anos |
| `Date.prototype.subtractDay(days)` | Subtrai dias |
| `Date.prototype.subtractMonth(months)` | Subtrai meses |
| `Date.prototype.subtractYear(years)` | Subtrai anos |
| `Date.prototype.daysBetween(date)` | Dias entre duas datas |
| `Date.prototype.monthsBetween(date)` | Meses entre duas datas |
| `Date.prototype.yearsBetween(date)` | Anos entre duas datas |
| `Date.prototype.format(pattern)` | Formata data com padrão |

> Estas funções são os equivalentes client-side das funções nativas do Maker documentadas na seção de Nativos.

### wfr_masks.js — Máscaras de Entrada

O `wfr_masks.js` contém **1.049 linhas** com implementação de máscaras de formatação para campos de entrada:

- Máscaras de CPF, CNPJ, CEP, telefone
- Máscaras de data e hora
- Máscaras numéricas (moeda, percentual)
- Máscaras customizáveis com caracteres especiais
- Validação em tempo real de entrada

### FlowFunctions.class.js — Funções de Fluxo

Definição de metadados para funções de fluxo de trabalho client-side.

```javascript
function FlowFunctions() {
  this.code;         // Código da função
  this.name;         // Nome da função
  this.description;  // Descrição
  this.realName;     // Nome real (interno)
  this.params;       // Array de parâmetros
  this.returnValue;  // Valor de retorno
  this.type;         // Tipo da função
}
```

### sw.js — Service Worker

Service Worker para funcionalidade offline (PWA):
- Cache de recursos estáticos
- Página offline quando sem conexão

### i18n_template.js — Template de Internacionalização

Template JavaScript para carregar mensagens internacionalizadas no cliente.

### bcp.min.js — Browser Compatibility Polyfills

Polyfills minificados para compatibilidade cross-browser.

---

## Bibliotecas de Terceiros (JavaScript)

| Biblioteca | Versão | Uso |
|-----------|--------|-----|
| jQuery | *(minificada)* | Manipulação DOM e AJAX |
| Bootstrap | *(bundle min)* | Framework CSS responsivo |
| Moment.js | *(minificada)* | Manipulação de datas |
| Bootstrap Datetimepicker | *(minificada)* | Seletor de data/hora |
| FontAwesome | *(all min)* | Ícones vetoriais |
| QRCode.js | *(minificada)* | Geração de QR Codes |
| FSLightbox | *(minificada)* | Lightbox para imagens |
| CodeMirror | *(completo)* | Editor de código (regras) |
| Trumbowyg | *(minificada)* | Editor WYSIWYG (HTML) |
| Bootstrap Table | *(completo)* | Grid avançada com extensões |
| SmartClient (Isomorphic) | *(completo)* | Grid isomórfica avançada |
| ColResizable | *(minificada)* | Colunas redimensionáveis |
| ExifReader | *(minificada)* | Leitura de EXIF de imagens |
| RandomColor | *(não minificada)* | Geração de cores aleatórias |
"""

    return md

# ── 7. Propriedades de Componentes (metadata.xml) ────────────────

def generate_metadata_doc():
    """Gera documentação das propriedades de componentes do metadata.xml."""
    
    metadata_file = os.path.join(WAR_DIR, "codeTemplates", "metadata.xml")
    
    properties = []
    try:
        text = read_file_text(metadata_file, encoding="latin-1")
        # Parse simples porque o XML tem encoding issues
        pattern = re.compile(r'<PROPERTY\s+KEY="([^"]+)">(.*?)</PROPERTY>', re.DOTALL)
        for m in pattern.finditer(text):
            key = m.group(1)
            desc = m.group(2).strip()
            properties.append((key, desc))
    except:
        pass

    md = """# Propriedades de Componentes (Metadata)

## Visão Geral

O arquivo `codeTemplates/metadata.xml` define as propriedades disponíveis para todos os componentes do Maker AI. Estas propriedades são usadas pelo gerador de código ao compilar formulários.

---

## Lista de Propriedades

| Propriedade | Descrição |
|------------|-----------|
"""

    for key, desc in properties:
        # Limpar encoding
        desc = desc.replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&")
        desc = desc.replace("\n", " ").strip()
        if desc:
            md += f"| `{key}` | {desc} |\n"
        else:
            md += f"| `{key}` | *(sem descrição)* |\n"

    md += """
---

## Templates de Geração de Código

O Webrun utiliza templates na pasta `codeTemplates/` para gerar código Java a partir das definições do Maker:

### system.template (323 linhas)

Gera uma classe Java para cada **sistema** Maker. A classe gerada:
- Estende funcionalidade base do WFRSystem
- Registra formulários e menus do sistema
- Define propriedades avançadas e de segurança
- Configura conexões com banco de dados

### form.template (115 linhas)

Gera uma classe Java para cada **formulário** Maker. A classe gerada:
- Estende funcionalidade base do WFRForm
- Registra componentes do formulário
- Define campos, tabelas e SQL associados
- Configura regras e ações do formulário

### component.template (59 linhas)

Gera uma classe Java para cada **componente** que possui lógica server-side. A classe gerada:
- Estende WFRComponent
- Define propriedades visuais e de dados
- Registra eventos e ações do componente

### Variáveis de Template

Os templates usam a sintaxe `<%VARIAVEL%>` que é substituída pelo gerador de código:

| Variável | Descrição |
|----------|-----------|
| `<%PACKAGE%>` | Pacote Java da classe gerada |
| *(outras)* | Propriedades específicas de cada tipo |
"""

    return md

# ── 8. Dependências (JARs) ───────────────────────────────────────

def generate_dependencies_doc():
    """Gera documentação das 205 dependências JAR."""

    lib_dir = os.path.join(WAR_DIR, "WEB-INF", "lib")
    jars = sorted([f for f in os.listdir(lib_dir) if f.endswith(".jar")])

    # Categorizar JARs
    categories = {
        "Banco de Dados (JDBC)": [],
        "Web Services (SOAP/REST)": [],
        "Relatórios": [],
        "XML/JSON": [],
        "Segurança e Criptografia": [],
        "Apache Commons": [],
        "Google/Cloud": [],
        "HTTP/Web": [],
        "Servidor": [],
        "Logging": [],
        "Office/Documentos": [],
        "Mensageria": [],
        "Cache/Dados": [],
        "Outros": [],
    }

    for jar in jars:
        jl = jar.lower()
        if any(x in jl for x in ["jdbc", "postgres", "mysql", "oracle", "ojdbc", "jtds", "mssql", "jaybird", "firebird", "db2", "dbf", "mongo", "borland"]):
            categories["Banco de Dados (JDBC)"].append(jar)
        elif any(x in jl for x in ["axis", "cxf", "wsdl", "soap", "geronimo-ws", "jaxrpc", "jaxb", "woden", "xmlschema"]):
            categories["Web Services (SOAP/REST)"].append(jar)
        elif any(x in jl for x in ["jasper", "jfreechart", "olap", "itext", "teechart"]):
            categories["Relatórios"].append(jar)
        elif any(x in jl for x in ["xml", "json", "xstream", "castor", "jdom", "xalan", "xerces", "stax", "woodstox", "xpp3", "xmlpull", "neethi", "serializer"]):
            categories["XML/JSON"].append(jar)
        elif any(x in jl for x in ["bcprov", "bcpkix", "waffle", "xmlsec", "xmldsig", "jjwt", "encoder"]):
            categories["Segurança e Criptografia"].append(jar)
        elif "commons-" in jl:
            categories["Apache Commons"].append(jar)
        elif any(x in jl for x in ["google", "firebase", "grpc", "opencensus", "protobuf", "guava", "checker", "error_prone", "failureaccess", "j2objc", "auto-value", "listenablefuture"]):
            categories["Google/Cloud"].append(jar)
        elif any(x in jl for x in ["http", "jetty", "servlet", "javax.ws", "jsr311"]):
            categories["HTTP/Web"].append(jar)
        elif any(x in jl for x in ["slf4j", "jcl-over", "log"]):
            categories["Logging"].append(jar)
        elif any(x in jl for x in ["poi", "ooxml", "opensagres", "tika"]):
            categories["Office/Documentos"].append(jar)
        elif any(x in jl for x in ["rabbit", "amqp"]):
            categories["Mensageria"].append(jar)
        elif any(x in jl for x in ["connector", "geronimo-jta"]):
            categories["Servidor"].append(jar)
        else:
            categories["Outros"].append(jar)

    md = """# Dependências de Terceiros (JARs)

## Visão Geral

O Webrun inclui **205 JARs** de terceiros no diretório `WEB-INF/lib/`. Estas bibliotecas fornecem funcionalidades como acesso a banco de dados, Web Services, relatórios, XML processing e mais.

---

"""

    for cat_name, jar_list in categories.items():
        if not jar_list:
            continue
        md += f"## {cat_name} ({len(jar_list)})\n\n"
        md += "| JAR | Versão Estimada |\n|-----|----------------|\n"
        for jar in sorted(jar_list):
            # Extrair versão do nome
            version_match = re.search(r'-(\d[\d.]*[\d\w.-]*?)\.jar$', jar)
            version = version_match.group(1) if version_match else "-"
            name = jar.replace(".jar", "")
            md += f"| `{name}` | {version} |\n"
        md += "\n"

    return md

# ── 9. Internacionalização ───────────────────────────────────────

def generate_i18n_doc():
    """Gera documentação de internacionalização."""

    i18n_dir = os.path.join(WAR_DIR, "i18n")
    
    langs = {}
    if os.path.exists(i18n_dir):
        for f in sorted(os.listdir(i18n_dir)):
            if f.endswith(".properties"):
                filepath = os.path.join(i18n_dir, f)
                lines = count_lines(filepath)
                # Extrair locale
                m = re.search(r'messages_(\w+)\.properties', f)
                locale = m.group(1) if m else f
                
                # Contar chaves
                text = read_file_text(filepath)
                keys = [l for l in text.split("\n") if "=" in l and not l.startswith("#")]
                langs[locale] = {"file": f, "lines": lines, "keys": len(keys)}

    md = """# Internacionalização (i18n)

## Visão Geral

O Webrun suporta múltiplos idiomas através de arquivos de propriedades Java (`.properties`) no diretório `i18n/`.

## Idiomas Suportados

| Idioma | Locale | Arquivo | Chaves |
|--------|--------|---------|--------|
"""

    locale_names = {
        "pt_BR": "Português (Brasil)",
        "en_US": "Inglês (EUA)",
        "es_ES": "Espanhol (Espanha)",
        "fr_FR": "Francês (França)",
    }

    for locale, info in langs.items():
        name = locale_names.get(locale, locale)
        md += f"| {name} | `{locale}` | `{info['file']}` | {info['keys']} |\n"

    md += """
## Formato dos Arquivos

```properties
# Exemplo de messages_pt_BR.properties
logon.title=Autenticação
logon.user=Usuário
logon.password=Senha
logon.button=Entrar
error.access.denied=Acesso negado
```

## Arquivo de Traduções Estáticas

Além dos `.properties`, existe o arquivo `static_translations.xml` para traduções fixas de componentes.

## Uso nas JSPs

```jsp
<wfr:message key="logon.title"/>
```

## Uso no JavaScript

O arquivo `i18n_template.js` carrega as mensagens no cliente para uso em componentes JavaScript.
"""

    return md

# ── MAIN ──────────────────────────────────────────────────────────

def main():
    ensure_dir(OUTPUT_DIR)

    generators = [
        ("01-visao-geral.md", generate_overview, "Visão Geral da Arquitetura"),
        ("02-componentes-javascript.md", generate_components_doc, "Componentes JavaScript"),
        ("03-classes-java.md", generate_java_classes_doc, "Classes Java"),
        ("04-configuracoes.md", generate_config_doc, "Configurações"),
        ("05-paginas-jsp.md", generate_jsp_doc, "Páginas JSP"),
        ("06-engine-javascript.md", generate_js_engine_doc, "Engine JavaScript"),
        ("07-propriedades-metadata.md", generate_metadata_doc, "Propriedades e Metadata"),
        ("08-dependencias-jars.md", generate_dependencies_doc, "Dependências (JARs)"),
        ("09-internacionalizacao.md", generate_i18n_doc, "Internacionalização"),
    ]

    print("=" * 60)
    print("Gerador de Documentação do Webrun (WAR)")
    print("=" * 60)
    print(f"Diretório WAR: {WAR_DIR}")
    print(f"Diretório saída: {OUTPUT_DIR}")
    print()

    total_files = 0
    for filename, generator, description in generators:
        print(f"  Gerando: {description}...")
        md_content = generator()
        filepath = os.path.join(OUTPUT_DIR, filename)
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(md_content)
        total_files += 1
        print(f"    → {filename} ({len(md_content):,} bytes)")

    # Gerar índice
    index_md = """# Documentação da Arquitetura Webrun

## Sobre

Esta seção documenta a **arquitetura interna do Webrun**, o motor de execução (runtime) da plataforma Maker AI. O Webrun é distribuído como um arquivo WAR (Web Application Archive) e é responsável por converter as definições criadas no Maker AI em aplicações web funcionais.

### O Triângulo da Documentação

| Camada | Fonte | Seção do Manual |
|--------|-------|----------------|
| **Como usar** | Manual oficial | `manual_maker_ai/` (raspagem) |
| **Como funciona internamente** | XMLs nativos | `nativos/` |
| **O que é gerado** | WAR (Webrun) | `webrun-arquitetura/` ← **você está aqui** |

## Índice

| # | Documento | Descrição |
|---|----------|-----------|
"""

    for i, (filename, _, description) in enumerate(generators, 1):
        index_md += f"| {i} | [{filename}]({filename}) | {description} |\n"

    index_md += """
## Versão

- **Webrun**: 5.0.0.46
- **Servlet API**: 3.1
- **Maker AI**: 6.1.0.14
"""

    index_path = os.path.join(OUTPUT_DIR, "README.md")
    with open(index_path, "w", encoding="utf-8") as f:
        f.write(index_md)
    total_files += 1

    print()
    print(f"✅ Gerados {total_files} arquivos em {OUTPUT_DIR}")
    print("=" * 60)


if __name__ == "__main__":
    main()

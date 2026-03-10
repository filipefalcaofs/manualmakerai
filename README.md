# 📘 Manual Completo do Maker AI

Repositório com a documentação completa da plataforma **Maker AI (v6.1.0.14)** da Softwell Solutions, incluindo o manual oficial, estrutura do banco de dados e referência técnica de todos os componentes nativos.

> **658 arquivos markdown** · **~10 MB** de documentação técnica

---

## 📂 Estrutura do Repositório

```
manual_maker_ai/
├── intro.md                      # Introdução ao Maker AI
├── INDEX.md                      # Índice geral do manual
│
├── maker/                        # Documentação do Maker (IDE)
│   ├── componentes/              # Componentes visuais
│   ├── boas_praticas/            # Boas práticas de desenvolvimento
│   ├── gerador_de_codigo/        # Gerador de código
│   └── instalacoes/              # Instalação e configuração
│
├── webrun/                       # Documentação do Webrun (Runtime)
│   ├── geracao_de_codigo_fonte/  # Geração de código fonte
│   ├── servidores_de_aplicacoes/ # Configuração de servidores
│   └── tela_de_configuracoes/    # Telas de configuração
│
├── maker-mobile/                 # Maker Mobile
│   ├── boas_praticas/            # Boas práticas mobile
│   ├── como_fazer/               # Tutoriais
│   └── exportando_projetos/      # Exportação de projetos
│
├── banco-de-dados/               # Banco de dados (manual oficial)
├── ai/                           # Funcionalidades de IA
├── dicas-e-truques/              # Dicas e truques por categoria
├── topicos-de-erros/             # Resolução de erros comuns
├── FAQ/                          # Perguntas frequentes
├── geral/                        # Documentação geral
├── mindsoft/                     # Mindsoft
├── tags/                         # Tags e marcadores
├── historico_de_alteracoes/      # Changelog de versões
│
├── estrutura-banco-de-dados/     # 🗄️ Estrutura do BD (97 entidades)
│   ├── README.md
│   ├── visao-geral.md
│   ├── nucleo-do-sistema-core.md
│   ├── seguranca-e-permissões.md
│   ├── acões-e-fluxos-de-automacao.md
│   ├── compilador-e-geracao-de-codigo.md
│   ├── consultas-e-manipulacao-de-dados-sql.md
│   ├── dependencias-e-rastreabilidade.md
│   ├── documentacao-e-casos-de-uso.md
│   ├── internacionalizacao-e-localizacao.md
│   ├── menus-e-navegacao.md
│   ├── relatorios.md
│   ├── versionamento-e-historico.md
│   └── outras-tabelas-do-sistema.md
│
├── nativos/                      # 🔧 Componentes nativos do Maker
│   ├── README.md
│   ├── funcoes/                  # 1.186 funções nativas (47 categorias)
│   ├── fluxos/                   # 68 fluxogramas nativos
│   ├── templates-fluxos/         # 5 templates de fluxos
│   ├── formularios/              # 11 formulários do sistema
│   ├── dados-tabelas/            # 98 tabelas com 6.406 registros
│   ├── compilador/               # 302 descritores do compilador
│   └── dicionario-dados/         # Dicionário de dados
│
└── webrun-arquitetura/           # ⚙️ Arquitetura do Webrun (WAR)
    ├── README.md
    ├── 01-visao-geral.md         # Visão geral, servlets e filtros
    ├── 02-componentes-javascript.md # 63 componentes HTML/JS
    ├── 03-classes-java.md        # ~280 classes em 15 pacotes
    ├── 04-configuracoes.md       # Configurações XML do runtime
    ├── 05-paginas-jsp.md         # 56 páginas JSP
    ├── 06-engine-javascript.md   # Engine JS principal (wfr.js)
    ├── 07-propriedades-metadata.md # Metadados de componentes
    ├── 08-dependencias-jars.md   # 205 JARs de terceiros
    └── 09-internacionalizacao.md # i18n (4 idiomas)

└── recursos-ide/                 # 🧰 Recursos da IDE Maker AI
    ├── README.md
    ├── 01-componentes-adicionais.md # 23 componentes adicionais
    ├── 02-plugins.md             # 7 plugins da IDE
    ├── 03-propriedades-runner.md # Propriedades no runtime
    ├── 04-templates-projeto.md   # Templates Júpiter/Saturno/Vênus
    ├── 05-skins-e-cores.md       # Skins e esquemas de cores
    ├── 06-dicionarios.md         # Dicionários da IDE
    ├── 07-configuracoes.md       # Configurações SGBD/portal
    └── 08-api-versoes.md         # 19 versões da API
```

---

## 📊 O que contém

### Manual Oficial
Raspagem completa do [manual.softwell.com.br](https://manual.softwell.com.br/docs/intro) — **563 páginas** convertidas em Markdown, cobrindo:
- Instalação e configuração do Maker e Webrun
- Componentes visuais e formulários
- Gerador de código e fluxogramas
- Maker Mobile
- Boas práticas, dicas e resolução de erros

### Estrutura do Banco de Dados
Documentação de **97 entidades** (tabelas `FR_*`) do framework, extraídas do `spfa.xml`, organizadas em 12 domínios funcionais:
- Núcleo do sistema, segurança e permissões
- Fluxos de automação e regras de negócio
- Compilador e geração de código
- Documentação, versionamento e rastreabilidade

### Arquitetura do Webrun (WAR)
Documentação completa da arquitetura do **Webrun v5.0.0.46**, o runtime que executa as aplicações Maker, extraída do WAR:

| Seção | Conteúdo |
|-------|----------|
| **Visão Geral** | Estrutura do WAR, fluxo de requisições, servlets e filtros |
| **Componentes JS** | 63 componentes HTML/JavaScript com herança, métodos e propriedades |
| **Classes Java** | ~280 classes em 15 pacotes (wfr.*) com descrição de cada uma |
| **Configurações** | config.xml, databases.xml, web.xml e demais configurações |
| **Páginas JSP** | 56 páginas JSP categorizadas por função |
| **Engine JS** | wfr.js (6.660 linhas), rulesFunctions.js, wfr_masks.js |
| **Dependências** | 205 JARs de terceiros categorizados |
| **i18n** | 4 idiomas (PT-BR, EN-US, ES-ES, FR-FR) |

### Componentes Nativos
Referência técnica extraída dos XMLs nativos do Maker:

| Seção | Quantidade | Descrição |
|-------|-----------|-----------|
| **Funções Nativas** | 1.186 | Funções built-in com descrição, parâmetros, retorno e código-fonte (Java/JS/SQL) |
| **Fluxos Nativos** | 68 | Fluxogramas pré-definidos com variáveis e parâmetros |
| **Templates de Fluxos** | 5 | Templates reutilizáveis para fluxogramas |
| **Formulários Nativos** | 11 | Formulários de sistema pré-definidos |
| **Dados das Tabelas** | 98 tabelas / 6.406 registros | Dados de referência e configuração do framework |
| **Compilador** | 302 descritores | Referência completa do gerador de código |

### Recursos da IDE
Documentação dos recursos internos da IDE Maker AI, extraídos da pasta `Resources/`:

| Seção | Conteúdo |
|-------|----------|
| **Componentes Adicionais** | 23 componentes (Aba, Card, Chat, Calendário, QueryCopilot, etc.) com propriedades, eventos e funções |
| **Plugins** | 7 plugins da IDE (Busca Textual, Estatísticas, Excel→BD, FabricaHub, Ficha Técnica, Publicação Nuvem, Visão Hierárquica) |
| **Propriedades Runner** | 20 definições de propriedades e eventos dos componentes no runtime |
| **Templates** | 3 templates de projeto (Júpiter, Saturno, Vênus) com formulários pré-configurados |
| **Skins e Cores** | Skin Bootstrap + 2 esquemas de cores (Visual Dark, Visual Dark Blue) com 8 formas de fluxo |
| **Dicionários** | Inspetor de propriedades, palavras acentuadas, traduções PT/EN, tipos de componentes |
| **Configurações** | Compatibilidade de SGBDs, portal Maker Mobile, funções de pacote |
| **Versões da API** | 19 versões da API (12.2.3 → 12.2.35) |

---

## 🚀 Como usar

### Navegação
Comece por [`manual_maker_ai/INDEX.md`](manual_maker_ai/INDEX.md) para o índice geral, ou acesse diretamente:
- [Introdução](manual_maker_ai/intro.md)
- [Estrutura do Banco de Dados](manual_maker_ai/estrutura-banco-de-dados/README.md)
- [Componentes Nativos](manual_maker_ai/nativos/README.md)
- [Funções Nativas](manual_maker_ai/nativos/funcoes/README.md)
- [Referência do Compilador](manual_maker_ai/nativos/compilador/README.md)
- [Arquitetura do Webrun](manual_maker_ai/webrun-arquitetura/README.md)
- [Recursos da IDE](manual_maker_ai/recursos-ide/README.md)

### Para IA / LLM
Este repositório foi criado para servir como **base de conhecimento** para assistentes de IA trabalharem com o Maker AI. Todo o conteúdo está em Markdown puro, ideal para indexação e RAG.

---

## 🛠️ Scripts de Geração

| Script | Função |
|--------|--------|
| `scraper.py` | Raspa o manual oficial do site manual.softwell.com.br |
| `generate_db_docs.py` | Gera documentação da estrutura do BD a partir do `spfa.xml` |
| `generate_nativos_docs.py` | Gera documentação dos XMLs nativos (funções, fluxos, formulários, etc.) |
| `generate_war_docs.py` | Gera documentação da arquitetura do Webrun a partir do WAR extraído |
| `generate_resources_docs.py` | Gera documentação dos recursos da IDE a partir da pasta Resources/ |

### Dependências
```bash
python -m venv .venv
source .venv/bin/activate
pip install requests beautifulsoup4 lxml markdownify
```

### Regenerar documentação
```bash
# Raspar manual (requer internet)
python scraper.py

# Gerar docs do banco de dados (requer spfa.xml)
python generate_db_docs.py

# Gerar docs dos nativos (requer pasta NativosMakerAi/)
python generate_nativos_docs.py

# Gerar docs da arquitetura Webrun (requer pasta webrun5/)
python generate_war_docs.py

# Gerar docs dos recursos da IDE (requer pasta Resources/)
python generate_resources_docs.py
```

---

## 📋 Fontes dos Dados

| Fonte | Origem |
|-------|--------|
| Manual oficial | [manual.softwell.com.br](https://manual.softwell.com.br/docs/intro) |
| `spfa.xml` | Exportação do projeto Maker (Entity Schema) |
| `FuncoesNativasMakerAi.xml` | Funções nativas exportadas do Maker |
| `FluxosNativosMakerAi.xml` | Fluxogramas nativos exportados |
| `TemplatesFluxosMakerAi.xml` | Templates de fluxos exportados |
| `FormulariosNativosMakerAi.xml` | Formulários nativos exportados |
| `DadosTabelasNativaMakerAi.xml` | Dados das tabelas nativas exportadas |
| `DicionarioDeDadosMakerAi.xml` | Dicionário de dados exportado |
| `webrun5/` (WAR extraído) | Arquivo WAR do Webrun extraído para análise |
| `Resources/` (pasta da IDE) | Recursos internos da IDE Maker AI (componentes, plugins, templates, skins, dicionários) |

---

## 📄 Licença

Este repositório contém documentação da plataforma **Maker AI** da [Softwell Solutions](https://www.softwell.com.br/). Todo o conteúdo é de propriedade da Softwell Solutions e está disponibilizado aqui exclusivamente para fins de referência e estudo.

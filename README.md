# 📘 Manual Completo do Maker AI

Repositório com a documentação completa da plataforma **Maker AI (v6.1.0.14)** da Softwell Solutions, incluindo o manual oficial, estrutura do banco de dados e referência técnica de todos os componentes nativos.

> **639 arquivos markdown** · **~10 MB** de documentação técnica

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
└── nativos/                      # 🔧 Componentes nativos do Maker
    ├── README.md
    ├── funcoes/                  # 1.186 funções nativas (47 categorias)
    ├── fluxos/                   # 68 fluxogramas nativos
    ├── templates-fluxos/         # 5 templates de fluxos
    ├── formularios/              # 11 formulários do sistema
    ├── dados-tabelas/            # 98 tabelas com 6.406 registros
    ├── compilador/               # 302 descritores do compilador
    └── dicionario-dados/         # Dicionário de dados
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

---

## 🚀 Como usar

### Navegação
Comece por [`manual_maker_ai/INDEX.md`](manual_maker_ai/INDEX.md) para o índice geral, ou acesse diretamente:
- [Introdução](manual_maker_ai/intro.md)
- [Estrutura do Banco de Dados](manual_maker_ai/estrutura-banco-de-dados/README.md)
- [Componentes Nativos](manual_maker_ai/nativos/README.md)
- [Funções Nativas](manual_maker_ai/nativos/funcoes/README.md)
- [Referência do Compilador](manual_maker_ai/nativos/compilador/README.md)

### Para IA / LLM
Este repositório foi criado para servir como **base de conhecimento** para assistentes de IA trabalharem com o Maker AI. Todo o conteúdo está em Markdown puro, ideal para indexação e RAG.

---

## 🛠️ Scripts de Geração

| Script | Função |
|--------|--------|
| `scraper.py` | Raspa o manual oficial do site manual.softwell.com.br |
| `generate_db_docs.py` | Gera documentação da estrutura do BD a partir do `spfa.xml` |
| `generate_nativos_docs.py` | Gera documentação dos XMLs nativos (funções, fluxos, formulários, etc.) |

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

---

## 📄 Licença

Este repositório contém documentação da plataforma **Maker AI** da [Softwell Solutions](https://www.softwell.com.br/). Todo o conteúdo é de propriedade da Softwell Solutions e está disponibilizado aqui exclusivamente para fins de referência e estudo.

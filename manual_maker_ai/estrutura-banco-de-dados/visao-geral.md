# Estrutura do Banco de Dados — Maker AI

> Documentação gerada automaticamente a partir do arquivo de projeto `spfa.xml` (Maker AI v6.1.0.14)

## Visão Geral

O banco de dados do Maker AI é composto por **97 tabelas** (entidades) que formam o "código-fonte" da plataforma. 
Todas as tabelas utilizam o prefixo `FR_` (Framework) e são organizadas em domínios funcionais que refletem os pilares da plataforma:

- **Formulários e Componentes** — a camada visual (UI)
- **Ações e Regras** — a lógica de negócio (automações)
- **Consultas SQL** — a camada de dados
- **Relatórios** — geração de informações
- **Segurança** — controle de acesso
- **Deploy** — publicação e distribuição
- **Documentação** — rastreabilidade de requisitos

### Estatísticas

| Métrica | Valor |
|---------|-------|
| Total de Tabelas | 97 |
| Total de Colunas | 501 |
| Total de Chaves Primárias | 95 |
| Total de Foreign Keys | 63 |
| Domínios Funcionais | 12 |

### Domínios Funcionais

| Domínio | Tabelas | Descrição |
|---------|:-------:|-----------|
| **Núcleo do Sistema (Core)** | 16 | Tabelas fundamentais que sustentam toda a estrutura do Maker AI, incluindo sistemas, formulários, co... |
| **Ações e Fluxos de Automação** | 12 | Tabelas que gerenciam as ações, regras de negócio, fluxogramas e automações sem código (no-code). |
| **Compilador e Geração de Código** | 2 | Tabelas do compilador interno que traduz os projetos visuais em código executável para diferentes ba... |
| **Consultas e Manipulação de Dados (SQL)** | 5 | Tabelas do assistente SQL e consultas avançadas que permitem manipulação de dados sem escrever códig... |
| **Dependências e Rastreabilidade** | 8 | Tabelas de mapeamento de dependências entre formulários, regras, relatórios, tabelas e componentes —... |
| **Documentação e Casos de Uso** | 24 | Tabelas que armazenam a documentação de projeto, casos de uso, atores, diagramas de contexto, requis... |
| **Relatórios** | 2 | Tabelas que definem relatórios, seus parâmetros, fontes de dados e configurações de impressão. |
| **Segurança e Permissões** | 6 | Tabelas de controle de acesso, grupos, permissões de formulários, relatórios e funções. |
| **Menus e Navegação** | 1 | Tabelas que definem a estrutura de menus e navegação das aplicações publicadas. |
| **Internacionalização e Localização** | 3 | Tabelas para suporte multi-idioma e localização de aplicações. |
| **Versionamento e Histórico** | 4 | Tabelas de controle de versões de formulários, regras e relatórios. |
| **Outras Tabelas do Sistema** | 14 | Tabelas adicionais que complementam a estrutura do Maker AI. |

### Lista Completa de Tabelas

| # | Tabela | Colunas | FKs | Referenciada por |
|---|--------|:-------:|:---:|:----------------:|
| 1 | `FR_ACAO` | 2 | 0 | 2 |
| 2 | `FR_ACAOCOMPONENTE` | 5 | 2 | 1 |
| 3 | `FR_ACAOPARAMETRO` | 3 | 2 | 0 |
| 4 | `FR_ACPTIPO` | 2 | 0 | 1 |
| 5 | `FR_CAMPO` | 5 | 1 | 0 |
| 6 | `FR_CATEGORIA` | 2 | 0 | 4 |
| 7 | `FR_COMPILADOR` | 2 | 0 | 1 |
| 8 | `FR_COMPILADOR_DATABASE` | 3 | 2 | 0 |
| 9 | `FR_COMPONENTE` | 4 | 1 | 2 |
| 10 | `FR_COMPONENTE_CATEGORIA` | 3 | 1 | 0 |
| 11 | `FR_CONFIGURACAO` | 5 | 0 | 0 |
| 12 | `FR_CONSULTA_AVANCADA` | 4 | 1 | 0 |
| 13 | `FR_CONTEXTO` | 7 | 1 | 0 |
| 14 | `FR_DATABASE` | 2 | 0 | 1 |
| 15 | `FR_DEP_FORMULARIO_CAMPO` | 3 | 0 | 0 |
| 16 | `FR_DEP_FORMULARIO_FORMULARIO` | 2 | 0 | 0 |
| 17 | `FR_DEP_FORMULARIO_REGRA` | 2 | 0 | 0 |
| 18 | `FR_DEP_FORMULARIO_RELATORIO` | 2 | 0 | 0 |
| 19 | `FR_DEP_FORMULARIO_TABELA` | 2 | 0 | 0 |
| 20 | `FR_DEP_REGRA_CAMPO` | 3 | 0 | 0 |
| 21 | `FR_DEP_REGRA_COMPONENTE` | 3 | 0 | 0 |
| 22 | `FR_DEP_REGRA_FORMULARIO` | 2 | 0 | 0 |
| 23 | `FR_DEP_REGRA_FUNCAO` | 2 | 0 | 0 |
| 24 | `FR_DEP_REGRA_REGRA` | 2 | 0 | 0 |
| 25 | `FR_DEP_REGRA_RELATORIO` | 2 | 0 | 0 |
| 26 | `FR_DEP_REGRA_TABELA` | 2 | 0 | 0 |
| 27 | `FR_DIAGRAMA` | 10 | 0 | 0 |
| 28 | `FR_DOC_APROVACAO` | 4 | 1 | 0 |
| 29 | `FR_DOC_ATOR` | 8 | 1 | 2 |
| 30 | `FR_DOC_BENEFICIO` | 3 | 1 | 0 |
| 31 | `FR_DOC_CASO_USO` | 7 | 1 | 3 |
| 32 | `FR_DOC_CASO_USO_ATOR` | 5 | 1 | 0 |
| 33 | `FR_DOC_CASO_USO_EXTENSAO` | 4 | 1 | 0 |
| 34 | `FR_DOC_CASO_USO_GENERALIZACAO` | 3 | 1 | 0 |
| 35 | `FR_DOC_CASO_USO_INCLUSAO` | 3 | 1 | 0 |
| 36 | `FR_DOC_DIAGRAMA_CONTEXTO` | 4 | 1 | 1 |
| 37 | `FR_DOC_DIAG_CONT_CAS_USO_ATO` | 2 | 1 | 0 |
| 38 | `FR_DOC_FORMULARIO` | 3 | 1 | 0 |
| 39 | `FR_DOC_FORMULARIO_IMAGEM` | 6 | 1 | 0 |
| 40 | `FR_DOC_HIPOTESE_TRABALHO` | 3 | 1 | 0 |
| 41 | `FR_DOC_INTERFACE` | 3 | 1 | 0 |
| 42 | `FR_DOC_INTERPRETACAO_CAMPO` | 3 | 1 | 0 |
| 43 | `FR_DOC_LIMITE` | 2 | 1 | 0 |
| 44 | `FR_DOC_MATERIAL_REFERENCIA` | 3 | 1 | 0 |
| 45 | `FR_DOC_MODO_OPERACAO` | 2 | 1 | 0 |
| 46 | `FR_DOC_PRINCIPAL` | 14 | 1 | 17 |
| 47 | `FR_DOC_REGRAS_IMAGEM` | 6 | 2 | 0 |
| 48 | `FR_DOC_RELATORIO` | 5 | 2 | 0 |
| 49 | `FR_DOC_REQUISITO` | 3 | 1 | 0 |
| 50 | `FR_DOC_RESTRICAO` | 3 | 1 | 0 |
| 51 | `FR_DOC_VERSAO` | 4 | 1 | 0 |
| 52 | `FR_FONTEDADOS` | 14 | 1 | 0 |
| 53 | `FR_FORMULARIO` | 31 | 1 | 7 |
| 54 | `FR_FORMULARIO_CATEGORIA` | 2 | 2 | 0 |
| 55 | `FR_FORMULARIO_SISTEMA` | 2 | 2 | 0 |
| 56 | `FR_GRUPO` | 4 | 0 | 2 |
| 57 | `FR_HISTORICO_SQL` | 5 | 1 | 0 |
| 58 | `FR_IDIOMA` | 4 | 0 | 1 |
| 59 | `FR_IMAGEM` | 3 | 0 | 1 |
| 60 | `FR_LISTAGEM` | 7 | 0 | 0 |
| 61 | `FR_LISTAGEM_FILTROS` | 4 | 0 | 0 |
| 62 | `FR_LISTAGEM_LISTA_FILTROS` | 4 | 0 | 0 |
| 63 | `FR_LOG` | 1 | 0 | 0 |
| 64 | `FR_LOG_EVENT` | 12 | 0 | 0 |
| 65 | `FR_MENU` | 12 | 2 | 1 |
| 66 | `FR_OPERADOR` | 4 | 0 | 0 |
| 67 | `FR_OPERANDO` | 4 | 0 | 0 |
| 68 | `FR_PARAMETRO` | 6 | 1 | 0 |
| 69 | `FR_PERMISSAO` | 12 | 3 | 0 |
| 70 | `FR_PERMISSAO_MAKER` | 7 | 0 | 0 |
| 71 | `FR_PROCESSAMENTO` | 8 | 0 | 0 |
| 72 | `FR_PROPRIEDADE` | 4 | 1 | 0 |
| 73 | `FR_REGRAS` | 17 | 1 | 2 |
| 74 | `FR_REGRAS_ATIVIDADES` | 7 | 0 | 0 |
| 75 | `FR_REGRAS_BANCO` | 3 | 0 | 0 |
| 76 | `FR_REGRAS_CATEGORIAS` | 3 | 0 | 1 |
| 77 | `FR_REGRAS_FUNCOES` | 13 | 0 | 0 |
| 78 | `FR_REGRAS_FUNCOES_TIPOS` | 2 | 0 | 0 |
| 79 | `FR_REGRAS_TIPOS` | 14 | 0 | 0 |
| 80 | `FR_REGRAS_TRIGGERS` | 6 | 0 | 0 |
| 81 | `FR_RELATORIO` | 7 | 0 | 3 |
| 82 | `FR_RELATORIO_CATEGORIA` | 2 | 1 | 0 |
| 83 | `FR_SCHEMA` | 2 | 0 | 0 |
| 84 | `FR_SESSAO` | 7 | 0 | 0 |
| 85 | `FR_SISTEMA` | 13 | 1 | 5 |
| 86 | `FR_SISTEMA_CATEGORIA` | 2 | 1 | 0 |
| 87 | `FR_TABELA` | 2 | 0 | 1 |
| 88 | `FR_TAREFA` | 9 | 2 | 1 |
| 89 | `FR_TAREFA_TEMPO` | 4 | 1 | 0 |
| 90 | `FR_TIPODADO` | 4 | 0 | 0 |
| 91 | `FR_TIPO_EVENT` | 3 | 0 | 0 |
| 92 | `FR_TRADUCAO` | 4 | 0 | 1 |
| 93 | `FR_TRADUCAO_IDIOMA` | 5 | 2 | 0 |
| 94 | `FR_USUARIO` | 12 | 0 | 2 |
| 95 | `FR_USUARIO_GRUPO` | 3 | 2 | 0 |
| 96 | `FR_USUARIO_SISTEMA` | 9 | 1 | 0 |
| 97 | `FR_VERSAO` | 9 | 0 | 0 |

### Tabelas Mais Referenciadas (Entidades Centrais)

Estas são as tabelas mais importantes do sistema — referenciadas por muitas outras:

| Tabela | Referenciada por (qtd) | Dependentes |
|--------|:---------------------:|-------------|
| `FR_DOC_PRINCIPAL` | 17 | `FR_DOC_APROVACAO`, `FR_DOC_ATOR`, `FR_DOC_BENEFICIO`, `FR_DOC_CASO_USO`, `FR_DOC_DIAGRAMA_CONTEXTO` +12 mais |
| `FR_FORMULARIO` | 7 | `FR_COMPONENTE`, `FR_CONSULTA_AVANCADA`, `FR_FONTEDADOS`, `FR_FORMULARIO_CATEGORIA`, `FR_FORMULARIO_SISTEMA` +2 mais |
| `FR_SISTEMA` | 5 | `FR_CONTEXTO`, `FR_DOC_PRINCIPAL`, `FR_FORMULARIO_SISTEMA`, `FR_HISTORICO_SQL`, `FR_TAREFA` |
| `FR_CATEGORIA` | 4 | `FR_COMPONENTE_CATEGORIA`, `FR_FORMULARIO_CATEGORIA`, `FR_RELATORIO_CATEGORIA`, `FR_SISTEMA_CATEGORIA` |
| `FR_DOC_CASO_USO` | 3 | `FR_DOC_CASO_USO_EXTENSAO`, `FR_DOC_CASO_USO_GENERALIZACAO`, `FR_DOC_CASO_USO_INCLUSAO` |
| `FR_RELATORIO` | 3 | `FR_DOC_RELATORIO`, `FR_FORMULARIO`, `FR_PERMISSAO` |
| `FR_COMPONENTE` | 2 | `FR_ACAOCOMPONENTE`, `FR_PROPRIEDADE` |
| `FR_ACAO` | 2 | `FR_ACAOCOMPONENTE`, `FR_ACAOPARAMETRO` |
| `FR_DOC_ATOR` | 2 | `FR_DOC_CASO_USO_ATOR`, `FR_DOC_HIPOTESE_TRABALHO` |
| `FR_REGRAS` | 2 | `FR_DOC_REGRAS_IMAGEM`, `FR_TAREFA` |
| `FR_GRUPO` | 2 | `FR_PERMISSAO`, `FR_USUARIO_GRUPO` |
| `FR_USUARIO` | 2 | `FR_USUARIO_GRUPO`, `FR_USUARIO_SISTEMA` |
| `FR_ACPTIPO` | 1 | `FR_ACAOPARAMETRO` |
| `FR_TABELA` | 1 | `FR_CAMPO` |
| `FR_COMPILADOR` | 1 | `FR_COMPILADOR_DATABASE` |

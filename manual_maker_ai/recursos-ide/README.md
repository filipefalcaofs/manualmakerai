# 🧰 Recursos da IDE Maker AI

Documentação dos recursos internos da IDE do Maker AI, incluindo componentes adicionais,
plugins, templates de projeto, skins, esquemas de cores, dicionários e configurações do runner.

## 📂 Estrutura da Pasta Resources

```
Resources/
├── PT/                    # Recursos em Português
│   ├── Components/        # 23 componentes adicionais
│   ├── Plugins/           # 7 plugins da IDE
│   ├── ColorSchemes/      # Esquemas de cores
│   ├── Systems/           # Sistemas de exemplo
│   ├── api_12.2.*.frz     # 18 pacotes de API (versões)
│   ├── dbsystem.frz       # Definição do banco do sistema
│   ├── package.xml        # Funções de pacote
│   ├── dbinfo.ini         # Compatibilidade de SGBDs
│   ├── runner-portal.xml  # Configuração do Maker Mobile
│   ├── inspector.dic      # Dicionário do inspetor de propriedades
│   ├── words.dic          # Dicionário de palavras acentuadas
│   └── dicionario.dic     # Traduções PT→EN do portal
│
├── EN/                    # Recursos em Inglês
│   ├── Components/        # 22 componentes (sem QueryCopilot)
│   ├── Plugins/           # 6 plugins (sem FabricaHub)
│   └── componente.dic     # Dicionário de tipos de componentes
│
├── runner/                # Definições do Runner (runtime)
│   └── *.list             # 20 arquivos de propriedades de componentes
│
├── Skins/                 # Skins visuais
│   └── Bootstrap/         # Skin Bootstrap com formas de fluxo
│
└── Templates/             # Templates de projeto
    ├── Jupiter/           # Template Júpiter v1.0.0.2
    ├── Saturno/           # Template Saturno v1.0.0.3
    └── Venus/             # Template Vênus v1.0.0.2
```

## 📊 Estatísticas

| Métrica | Valor |
|---------|-------|
| Total de arquivos | 251 |
| Tamanho total | 34.6 MB |
| Componentes adicionais (PT) | 23 |
| Componentes adicionais (EN) | 22 |
| Plugins | 7 (PT) / 6 (EN) |
| Templates de projeto | 3 |
| Esquemas de cores | 2 |
| Arquivos de propriedades (runner) | 20 |

**Tipos de arquivo:**

| Extensão | Quantidade |
|----------|-----------|
| .bmp | 90 |
| .xml | 66 |
| .frz | 35 |
| .list | 20 |
| .ico | 13 |
| .png | 8 |
| .dic | 7 |
| .ini | 3 |
| .json | 3 |
| .rtm | 2 |
| .changes | 2 |
| .mkr | 2 |

## 📄 Arquivos desta Seção

| # | Arquivo | Descrição |
|---|---------|-----------|
| 1 | [01-componentes-adicionais.md](01-componentes-adicionais.md) | 23 componentes adicionais da IDE |
| 2 | [02-plugins.md](02-plugins.md) | 7 plugins da IDE |
| 3 | [03-propriedades-runner.md](03-propriedades-runner.md) | Propriedades dos componentes no runtime |
| 4 | [04-templates-projeto.md](04-templates-projeto.md) | Templates Júpiter, Saturno e Vênus |
| 5 | [05-skins-e-cores.md](05-skins-e-cores.md) | Skins e esquemas de cores |
| 6 | [06-dicionarios.md](06-dicionarios.md) | Dicionários da IDE |
| 7 | [07-configuracoes.md](07-configuracoes.md) | Configurações (SGBD, portal, pacotes) |
| 8 | [08-api-versoes.md](08-api-versoes.md) | Histórico de versões da API |

# maker-flow-engine

MCP Server especializado na criacao de FRZ para o Maker (WebRun/fmaker).

Gera fluxogramas (regras de negocio) e telas completas (formularios com regras vinculadas) prontos para importar no Maker.

## Setup

```bash
cd mcp_maker
./setup.sh
```

Ou manualmente:

```bash
cd mcp_maker
python3.13 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

## Configuracao no Cursor

Adicione ao `.cursor/mcp.json` do projeto (ou ao global `~/.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "maker-flow-engine": {
      "command": "/caminho/para/mcp_maker/.venv/bin/python3.13",
      "args": ["-m", "mcp_maker"],
      "cwd": "/caminho/para/manual_maker_ai",
      "env": {
        "PYTHONPATH": "/caminho/para/manual_maker_ai"
      }
    }
  }
}
```

Reinicie o Cursor ou clique em **Reload MCP Servers**.

## Tools (44)

### Consulta de funcoes
| Tool | Descricao |
|---|---|
| `buscar_funcao(termo)` | Busca funcoes nativas por nome/descricao (hibrido keyword + semantico) |
| `detalhar_funcao(nome_real)` | Assinatura, params, retorno, compatibilidade |
| `listar_funcoes(camada, categoria)` | Filtrar por servidor/cliente e categoria |

### Referencia e padroes
| Tool | Descricao |
|---|---|
| `padroes_fluxo(padrao)` | Composicoes de funcoes de 2371 regras reais |
| `boas_praticas()` | Performance, seguranca, nomenclatura |
| `buscar_regra_real(termo)` | Exemplos do sistema de producao |
| `guia_fluxograma(topico)` | Guia de desenvolvimento orientado a fluxograma |
| `spec_fluxograma()` | Spec tecnica: DFM, Script XML, encoding |
| `spec_componentes()` | Catalogo de COM_TIPO com properties |
| `spec_design()` | Design premium: cards, CSS, Bootstrap |
| `estrutura_frz()` | Estrutura XML completa do FRZ |
| `schema_banco()` | Modelo de dados do SIG_MAKER |
| `eventos_disponiveis(evento)` | Matriz de eventos do ciclo de vida |
| `padroes_logica(padrao)` | 14 padroes reutilizaveis para projetar_regra |

### Geracao de FRZ
| Tool | Descricao |
|---|---|
| `validar_fluxo(spec_json)` | Valida spec antes de gerar |
| `gerar_fluxo(spec_json, output_path)` | Gera FRZ com regras |
| `gerar_tela_completa(spec_json, output_path)` | Gera FRZ com formulario + regras |
| `gerar_tabela_dados(spec_json, output_path)` | Gera FRZ com ENTITY_SCHEMA + seed data |
| `gerar_expressao(funcao, params_json, retorno)` | Gera DFM de uma funcao (debug) |
| `gerar_funcao(spec_json, output_path)` | Gera FRZ com funcoes customizadas |

### Recipes enterprise
| Tool | Descricao |
|---|---|
| `gerar_crud(spec_json, output_path)` | CRUD corporativo com cards, validacao, MasterSkin |
| `gerar_dashboard(spec_json, output_path)` | Dashboard com paineis/cards e SQL |
| `gerar_login(spec_json, output_path)` | Tela de login corporativa |
| `projetar_regra(spec_json)` | Projeta regra com padroes modulares |

### Banco / materialiacao
| Tool | Descricao |
|---|---|
| `materializar_sistema(spec_json)` | Materializa sistema completo (direct ou FRZ) |
| `introspectar_tabela(tabela)` | Introspecao SQL Server para gerar_crud |
| `inspecionar_metadados(frm_codigo)` | Debug de form/regra/tabela no banco |
| `executar_sql(sql)` | SQL arbitrario no banco de metadados |

### GSD (Get Shit Done)
| Tool | Descricao |
|---|---|
| `gsd_criar_sistema(descricao, campos)` | One-shot: descreva e materializa |
| `gsd_diagnosticar(frm_codigo)` | Auto-fix de metadados de formulario |
| `gsd_manual(secao)` | Manual operacional completo do MCP |

### Manual do Maker (NOVO)
| Tool | Descricao |
|---|---|
| `buscar_manual(termo)` | Busca semantica no manual completo (668+ paginas, chunked) |
| `ler_pagina_manual(caminho)` | Retorna conteudo COMPLETO de uma pagina do manual |
| `indice_manual(categoria)` | Lista todas as paginas organizadas por categoria |
| `troubleshoot_erro(descricao)` | Diagnostica erros buscando em topicos de erros + FAQ |
| `config_banco(tipo_banco)` | Configuracao de SQL Server, MySQL, Oracle, PostgreSQL, etc. |
| `dica_maker(topico, area)` | 170+ dicas e truques do Maker |
| `faq_maker(topico)` | FAQ oficial: bancos, hardware, instalacao, versoes |
| `arquitetura_webrun(secao)` | Arquitetura interna: JS (63), Java (280), JARs (205) |
| `webrun_docs(topico)` | Docs operacionais: servidores, deploy, admin, APIs |
| `maker_docs(topico)` | Docs Maker Studio: componentes, forms, relatorios |
| `config_mobile(topico)` | Maker Mobile: exportacao, sync, boas praticas |
| `recursos_ide(topico)` | Recursos IDE: plugins, skins, templates, configs |
| `estrutura_banco_dados(secao)` | Estrutura interna do SIG_MAKER (tabelas FR_*) |

## Base de conhecimento

- **1186 funcoes nativas** em 48 categorias (servidor + cliente)
- **2445 regras reais** de um sistema de producao
- **668+ paginas do manual** indexadas com busca semantica (chunked)
- **Padroes de composicao** calibrados com dados reais (SQL, JSON, Validacao, etc.)
- **Spec de componentes** com properties extraidas de FRZs reais
- **Design premium** com Bootstrap 5, Font Awesome, CSS WebRun
- **286K+ properties** mapeadas do banco de producao

## Arquitetura

```
mcp_maker/
  server.py           — MCP server com 44 tools (FastMCP, transporte stdio)
  builder.py          — RuleBuilder, FormBuilder, FrzBuilder (gera DFM + Script XML + gzip)
  encoder.py          — Encoding base64, XML escape, write_frz (gzip com VERSAO)
  parser.py           — Parser de funcoes nativas + indexacao full-text do manual
  models.py           — Dataclasses (FuncaoMaker, PaginaManual, etc.)
  rag_engine.py       — Motor RAG com sentence-transformers + chunking + cache
  logic_engine.py     — 14 padroes de fluxo + RuleBlueprint + decisao de camada
  enterprise.py       — Recipes enterprise (CRUD, Dashboard, Login) + MasterSkin CSS
  direct_access.py    — Direct Access Engine (materializa no banco de metadados)
  padroes_composicao.md       — Blocos reutilizaveis de funcoes
  regras_sistema_real.json    — 2445 regras extraidas de producao
  catalogo_funcoes.json       — 1186 funcoes com assinaturas
```

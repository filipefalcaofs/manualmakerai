# Estrutura do Banco de Dados do Maker AI

> O código-fonte do Maker AI é o banco de dados. Todo projeto, formulário, regra, relatório e configuração é armazenado em tabelas com prefixo `FR_`.

## Como o Maker AI Funciona Internamente

O Maker AI é uma plataforma **low-code/no-code** onde **o banco de dados É o código-fonte**. 
Diferente de sistemas tradicionais onde o código é armazenado em arquivos de texto, no Maker AI:

1. **Formulários** são definições armazenadas na tabela `FR_FORMULARIO` e seus componentes visuais em `FR_COMPONENTE`
2. **Regras de negócio** são registros em `FR_REGRA` com seus passos em `FR_REGRA_FUNCAO`
3. **Fluxogramas** são grafos armazenados em `FR_FLUXOGRAMA` com objetos em `FR_FLUXO_OBJETO`
4. **Relatórios** são definições em `FR_RELATORIO` com suas fontes de dados
5. **Menus** e navegação ficam em `FR_MENU` e `FR_ITEM_MENU`
6. **Permissões** são controladas por `FR_GRUPO` e tabelas de permissão associadas
7. **Deploy/Publicação** envolve o compilador (`FR_COMPILADOR`) que gera código a partir dessas definições

Isso significa que **exportar um projeto** (spfa.xml) é essencialmente exportar todo o banco de dados do framework.

## Arquitetura do Schema

```
┌─────────────────────────────────────────────────────────────┐
│                     MAKER AI - SCHEMA FR_                   │
├─────────────┬───────────────┬───────────────┬───────────────┤
│  SISTEMA    │  FORMULÁRIOS  │  FLUXOGRAMAS  │  RELATÓRIOS   │
│ FR_SISTEMA  │ FR_FORMULARIO │ FR_FLUXOGRAMA │ FR_RELATORIO  │
├─────────────┼───────────────┼───────────────┼───────────────┤
│ COMPONENTES │  AÇÕES/REGRAS │  CONSULTAS    │  DOCUMENTAÇÃO │
│ FR_COMPONENTE│ FR_REGRA     │ FR_CONSULTA_  │ FR_DOC_       │
│ FR_CAMPO    │ FR_ACAO       │   AVANCADA    │   PRINCIPAL   │
├─────────────┼───────────────┼───────────────┼───────────────┤
│ SEGURANÇA   │  COMPILADOR   │  MENUS        │  DIAGRAMAS    │
│ FR_GRUPO    │ FR_COMPILADOR │ FR_MENU       │ FR_DIAGRAMA   │
│ FR_PERMISSAO│ FR_COMPILADOR_│ FR_ITEM_MENU  │               │
│             │   DATABASE    │               │               │
├─────────────┴───────────────┴───────────────┴───────────────┤
│                   DEPENDÊNCIAS E RASTREABILIDADE            │
│    FR_DEP_FORMULARIO_*  │  FR_DEP_REGRA_*  │  FR_CONTEXTO  │
└─────────────────────────────────────────────────────────────┘
```

**Total:** 97 tabelas | Versão Maker: 6.1.0.14

## Documentação por Domínio

- [**Visão Geral Completa**](visao-geral.md) — Estatísticas, lista de todas as tabelas e entidades centrais

- [**Núcleo do Sistema (Core)**](nucleo-do-sistema-core.md) — 16 tabelas
- [**Ações e Fluxos de Automação**](acões-e-fluxos-de-automacao.md) — 12 tabelas
- [**Compilador e Geração de Código**](compilador-e-geracao-de-codigo.md) — 2 tabelas
- [**Consultas e Manipulação de Dados (SQL)**](consultas-e-manipulacao-de-dados-sql.md) — 5 tabelas
- [**Dependências e Rastreabilidade**](dependencias-e-rastreabilidade.md) — 8 tabelas
- [**Documentação e Casos de Uso**](documentacao-e-casos-de-uso.md) — 24 tabelas
- [**Relatórios**](relatorios.md) — 2 tabelas
- [**Segurança e Permissões**](seguranca-e-permissões.md) — 6 tabelas
- [**Menus e Navegação**](menus-e-navegacao.md) — 1 tabelas
- [**Internacionalização e Localização**](internacionalizacao-e-localizacao.md) — 3 tabelas
- [**Versionamento e Histórico**](versionamento-e-historico.md) — 4 tabelas
- [**Outras Tabelas do Sistema**](outras-tabelas-do-sistema.md) — 14 tabelas

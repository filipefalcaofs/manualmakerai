# Documentação da Arquitetura Webrun

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
| 1 | [01-visao-geral.md](01-visao-geral.md) | Visão Geral da Arquitetura |
| 2 | [02-componentes-javascript.md](02-componentes-javascript.md) | Componentes JavaScript |
| 3 | [03-classes-java.md](03-classes-java.md) | Classes Java |
| 4 | [04-configuracoes.md](04-configuracoes.md) | Configurações |
| 5 | [05-paginas-jsp.md](05-paginas-jsp.md) | Páginas JSP |
| 6 | [06-engine-javascript.md](06-engine-javascript.md) | Engine JavaScript |
| 7 | [07-propriedades-metadata.md](07-propriedades-metadata.md) | Propriedades e Metadata |
| 8 | [08-dependencias-jars.md](08-dependencias-jars.md) | Dependências (JARs) |
| 9 | [09-internacionalizacao.md](09-internacionalizacao.md) | Internacionalização |

## Versão

- **Webrun**: 5.0.0.46
- **Servlet API**: 3.1
- **Maker AI**: 6.1.0.14

# PostgreSQL

> Fonte: https://manual.softwell.com.br/docs/banco-de-dados/postgresql

# PostgreSQL

# Atualização de Suporte: Maker AI agora é compatível com PostgreSQL 17

A plataforma Maker AI foi atualizada para oferecer suporte completo ao ecossistema do PostgreSQL 17. Anteriormente limitado à versão 14, este avanço permite que desenvolvedores utilizem instâncias de banco de dados modernas (versões 15, 16 e 17) em seus projetos.

Esta atualização desbloqueia um vasto conjunto de recursos de performance, segurança e manipulação de dados que agora podem ser nativamente utilizados nas aplicações construídas com o Maker AI.

---

## Novas Funcionalidades Desbloqueadas na Plataforma

Com o novo suporte, suas aplicações Maker AI agora podem tirar proveito de funcionalidades avançadas que antes eram inacessíveis.

### Manipulação de Dados e SQL Moderno

| Recurso | O Que Muda para o Desenvolvedor Maker AI |
| --- | --- |
| **`JSON_TABLE()`** | Permite converter dados JSON em formato de tabela diretamente via SQL, simplificando a lógica de suas funções e eliminando a necessidade de manipulação complexa no código. |
| **Construtores SQL/JSON** | Agora é possível usar `JSON_OBJECT()`, `JSON_ARRAY()`, e outras funções padrão SQL/JSON para criar estruturas JSON de forma declarativa e eficiente dentro do banco de dados. |
| **Melhorias em `DISTINCT`** | Consultas que utilizam `SELECT DISTINCT` em seus formulários e relatórios podem experimentar uma execução mais rápida devido a otimizações internas do banco. |

### Performance e Otimização

| Recurso | Impacto na Performance da Aplicação |
| --- | --- |
| **Otimização de `IN (...)`** | Consultas com grandes listas de valores (cláusula `IN`) terão performance drasticamente melhorada, beneficiando relatórios e buscas com múltiplos filtros. |
| **Build Paralelo de Índices** | A criação de índices em tabelas muito grandes, comum durante manutenções ou implantações, será significativamente mais rápida. |
| **`VACUUM` Otimizado** | Operações de manutenção do banco de dados consumirão menos memória, resultando em maior estabilidade para o ambiente em produção. |

### Segurança e Administração

| Recurso | Benefícios para a Gestão e Segurança do Projeto |
| --- | --- |
| **Backup Incremental** | A rotina de backup dos seus projetos se torna mais rápida e econômica, pois o `pg_basebackup` agora suporta cópias apenas das alterações. |
| **Replicação Lógica** | Simplifica a atualização de ambientes de alta disponibilidade, pois os slots de replicação são preservados durante o upgrade do PostgreSQL. |
| **TLS Direto (`sslnegotiation=direct`)** | As conexões seguras entre sua aplicação Maker AI e o banco de dados são estabelecidas mais rapidamente, otimizando a comunicação. |

---

## Comparativo: O Que Muda para Seus Projetos Maker AI

| Funcionalidade | Maker com PostgreSQL 14 (Suporte Anterior) | Maker AI com PostgreSQL 17 (Novo Suporte) |
| --- | --- | --- |
| **Compatibilidade com PG 15+** | ❌ | ✅ |
| **Uso de `JSON_TABLE()`** | ❌ | ✅ |
| **Construtores SQL/JSON Padrão** | ❌ | ✅ |
| **Otimização Avançada de `IN (...)`** | Parcial | ✅ |
| **Backup Incremental Nativo** | ❌ | ✅ |
| **Índices BRIN Paralelos** | ❌ | ✅ |
| **Slots de Replicação Persistentes** | ❌ | ✅ |
| **`VACUUM` com Menor Uso de Memória** | ❌ | ✅ |
| **Handshake TLS Otimizado** | ❌ | ✅ |

---

## Estimativa de Ganhos para Aplicações Desenvolvidas com Maker AI

🚀

Performance

Até 80% mais rápido

🛡️

Segurança

Até 50% mais robusto

💾

Backup

Até 70% mais eficiente

> **Aviso:** As porcentagens abaixo são estimativas e podem variar dependendo da arquitetura da sua aplicação Maker AI, do hardware e da carga de trabalho específica. Elas servem como uma referência do potencial de melhoria.

| Área | Ganho Potencial | Justificativa |
| --- | --- | --- |
| **Lógica com JSON/JSONB** | 50–80% | Uso de funções nativas do banco, reduzindo a complexidade e o tempo de processamento no servidor de aplicação. |
| **Backups e Recuperação** | 40–70% | Rotinas de backup mais rápidas e com menor impacto no I/O do disco. |
| **Relatórios e Buscas** | 10–30% | Melhorias no planejador de consultas, otimizações de índices e filtros. |
| **Robustez da Segurança** | 30-50% | Suporte a protocolos de criptografia modernos (TLS 1.3) e políticas de acesso mais granulares. |

## Conclusão: Um Novo Patamar para Seus Projetos

A integração do suporte ao PostgreSQL 17 no Maker AI não é apenas uma atualização técnica; é um convite para inovar. Ao adotar as versões mais recentes do PostgreSQL, você poderá construir aplicações mais robustas, rápidas e seguras, utilizando todo o potencial que um banco de dados moderno pode oferecer diretamente na plataforma Maker AI.

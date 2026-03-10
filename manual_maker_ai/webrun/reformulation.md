# Reformulação da Concorrência e Processos de Build

> Fonte: https://manual.softwell.com.br/docs/webrun/reformulation

# Reformulação da Concorrência e Processos de Build

### **Visão Geral**

O objetivo principal desta iniciativa foi substituir o antigo e limitado modelo de concorrência, por uma arquitetura moderna e robusta de gerenciamento de tarefas. As mudanças resultaram em ganhos expressivos de performance, estabilidade e manutenibilidade para a plataforma.

### Reformulação do Agendador de Tarefas

#### Cenário Anterior

A implementação legada do agendamento de tarefas apresentava duas deficiências críticas:

**Execução Single-Threaded:** O `Timer` utiliza uma única thread para executar todas as tarefas. Uma tarefa longa ou travada bloqueava a execução de todas as outras subsequentes.

#### Nova Arquitetura:

A implementação antiga foi completamente substituída por um mecanismo moderno que gerencia um pool de threads.

- **Mecanismo:** Todas as tarefas agendadas no WebrunAI agora são orquestradas por este novo sistema, garantindo a execução concorrente e isolada.
- **Vantagens Técnicas:**

  - **Execução Concorrente:** Múltiplas tarefas podem rodar em paralelo, cada uma em sua própria thread do pool.
  - **Tolerância a Falhas:** A exceção em uma tarefa não afeta as demais. A thread utilizada é liberada e o pool continua operacional para as próximas execuções.
  - **Gerenciamento Centralizado:** A centralização do agendamento em um único ponto de controle facilita o monitoramento e o debug das tarefas agendadas em toda a plataforma.

### Otimização da Compilação de Sistemas (JAR/WAR)

#### Cenário Anterior

O processo de build, que transforma os fluxogramas visuais em classes Java e os empacota, era executado de forma majoritariamente sequencial. Isso não aproveitava o poder de processamento dos processadores multi-core modernos, tornando-se um gargalo em sistemas grandes.

#### Nova Arquitetura

A mesma arquitetura de gerenciamento de tarefas concorrentes foi aplicada para otimizar o processo de compilação.

A tarefa de compilação de um sistema é agora dividida em múltiplas sub-tarefas independentes. Cada sub-tarefa é submetida a um `ExecutorService`, que utiliza um pool de threads para processá-las em paralelo.

### Aceleração do Carregamento Inicial do Sistema

Em um dos nossos testes, tivemos a expressiva redução no tempo do primeiro carregamento (de **~1m33s** para **~0m46s**). Este é um resultado direto da sinergia das melhorias implementadas.

Para evidenciar o ganho, foram realizados dois novos cenários de teste controlados, ambos no mesmo ambiente e condições:

| Cenário | Java 8 | Java 17 | Ganho |
| --- | --- | --- | --- |
| Primeira carga pós criação | 01:33 | 00:46 | ~50% |

**Comparativo em Vídeo**

**Webrun 5 – Primeira Carga pós criação**

[](/videos/maker5_primeiro_carregamento.mp4)

**Webrun AI – Primeira Carga pós criação**

[](/videos/makerai_primeiro_carregamento.mp4)

## Conclusão

1. **Compilação em Lote (Batch Compilation):** **É o principal fator contribuinte**. A substituição do método de compilação *arquivo por arquivo* por uma única chamada ao compilador com a lista completa de fontes eliminou o maior gargalo do processo de inicialização.
2. **Otimizações da JVM (Java 17):** A Máquina Virtual do Java 17 possui otimizações internas no compilador Just-In-Time (JIT) e nos mecanismos de carregamento de classes, que também contribuem para um startup mais rápido.
3. **Eficiência do Servidor de Aplicação (Tomcat 11):** O Tomcat 11 possui um processo de inicialização mais enxuto, reduzindo o overhead durante o deploy da aplicação.

As refatorações implementadas resultaram em uma plataforma WebrunAI comprovadamente mais **robusta**, **performática** e **escalável**. A modernização do agendador de tarefas eliminou pontos de fragilidade, enquanto a otimização do processo de compilação resolveu um gargalo de performance, estabelecendo uma base de código mais limpa e de fácil manutenção para futuras evoluções.

# Modernização da API de Funções: Migração de Javax para Jakarta

> Fonte: https://manual.softwell.com.br/docs/webrun/api_refactoring

# Modernização da API de Funções: Migração de Javax para Jakarta

### O que mudou?

Como parte de um esforço contínuo de modernização e aprimoramento, o Maker e o Webrun passaram por uma atualização significativa em sua base tecnológica, migrando do **Java 8 para o Java 17**. Essa evolução nos alinha com as práticas mais recentes da comunidade de desenvolvimento e nos permite incorporar tecnologias mais robustas e seguras.

Uma das mudanças mais importantes dessa transição foi a refatoração de nossa API para remover recursos depreciados e substituir a biblioteca `javax` pela sua sucessora, a `jakarta`. Essa mudança não é apenas uma troca de nomes; é um passo fundamental para garantir que nossa plataforma permaneça segura, performática e pronta para o futuro.

Essa atualização representa uma evolução estrutural na base tecnológica do Maker/Webrun. Trocamos tecnologias obsoletas por componentes modernos, com ganhos diretos em segurança, performance, aderência a padrões e sustentabilidade a longo prazo.

### Principais Benefícios

Essa atualização arquitetônica proporciona mais segurança, praticidade e modernização para nossa API, trazendo vantagens diretas para os desenvolvedores:

- **Arquitetura Moderna:** Alinhamento com o Jakarta EE, o padrão atual para o desenvolvimento de aplicações Java corporativas, garantindo maior compatibilidade e acesso a inovações.
- **Mais Segurança:** Ao utilizar um ecossistema ativamente mantido pela comunidade, garantimos que nossas funções recebam atualizações de segurança contínuas.
- **Melhor Desempenho:** A refatoração permitiu otimizar a implementação de diversas funções, resultando em uma execução mais eficiente.
- **Manutenção Simplificada:** A remoção de tecnologias legadas e a adoção de padrões modernos facilitam a manutenção e a evolução da plataforma.

### Segurança e Sustentação: Da versão 8 para a 17 do Java

A migração do **Java 8 para o Java 17** foi um passo crucial para garantir a continuidade e a segurança da plataforma:

Com o fim do suporte oficial ao Java 8, diversas vulnerabilidades críticas deixaram de ser corrigidas. O Java 17 traz melhorias robustas de segurança, melhor uso de memória, suporte a novos algoritmos criptográficos e refinamentos na execução de código assíncrono.

### E se eu estiver usando funções legadas nativas?

- **Não é necessário alterar o código**: a interface pública permanece estável.
- **Internamente**, a biblioteca foi atualizada, então o comportamento foi mantido, mas com uma nova base de execução.
- **Você pode continuar usando as mesmas nomenclaturas e formatos anteriores.**

Esta modernização reforça nosso compromisso em fornecer uma plataforma de desenvolvimento de alta performance, segura e alinhada com as melhores práticas do mercado.

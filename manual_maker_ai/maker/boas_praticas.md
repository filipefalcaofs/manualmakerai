# Boas Práticas

> Fonte: https://manual.softwell.com.br/docs/maker/boas_praticas

[## 📄️ Guia de Boas Práticas

Este tópico tem como objetivo demonstrar melhores práticas de desenvolvimento com fluxogramas, com intuito de melhorar o seu entendimento, evitar problemas de escalabilidade, legibilidade, suporte futuro ao sistema, erros de compilação e etc. Não há nenhuma pretensão de se construir um guia no estilo “how to” visto a flexibilidade de programar em fluxos, as diferentes necessidades de uma regra de negócio e os diferentes padrões de projeto que os desenvolvedores podem adotar. Abaixo, constam os subtópicos relacionados a este guia.](/docs/maker/boas_praticas/boas_praticas_)

[## 📄️ Descrevendo os objetos do fluxo

Cada objeto existente no fluxo possui a propriedade Descrição, tal propriedade é muito útil para descrever a ação que um determinado componente realiza durante a execução da regra. Observe o fluxo abaixo:](/docs/maker/boas_praticas/descrevendo_os_objetos_do_fluxo)

[## 📄️ Melhorando o aspecto visual de um fluxo utilizando o objeto comentário

Esse exemplo tem o intuito de auxiliar aos desenvolvedores na organização dos seus fluxos, fazendo com que se tornem mais “amigáveis”, de fácil compreensão e de se realizar manutenções. Para isso, segue abaixo alguns pontos práticos de organização de fluxos utilizando o objeto “Comentário”.](/docs/maker/boas_praticas/melhorando_o_aspecto_visual_de_um_fluxo_utilizando_o_objeto_comentario)

[## 📄️ Melhorar desempenho na execução de regras

Muitas vezes os sistemas são desenvolvidos sem a preocupação com o desempenho da aplicação, porém este é um ponto importante em se tratando de aplicações corporativas onde escalabilidade e confiabilidade são atributos imprescindíveis.](/docs/maker/boas_praticas/melhorar_desempenho_na_execucao_de_regras)

[## 📄️ Organização de Fluxos através de subfluxos

A utilização de fluxos com muitos IFs (objeto decisão) e fluxos extensos demais, pode ocasionar erros de compilação devido a uma limitação da Máquina Virtual Java, onde os métodos têm limite de 65, 535 bytes de bytecode. Neste caso é recomendado que o fluxo seja dividido em subfluxos para evitar problemas de compilação no momento de execução da regra.](/docs/maker/boas_praticas/organizacao_de_fluxos_atraves_de_subfluxos)

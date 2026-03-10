# Criando fluxogramas

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/criando_fluxo

# Criando fluxogramas

Este tutorial tem como objetivo apresentar ao usuário a criação de fluxograma.

- Crie um formulário com as seguintes características:

  ![](/assets/images/criando_fluxo-fdce8e32113a4167f62d3fce85c69622.jpg)

  O formulário não possui fonte de dados e a propriedade navegação está determinada como **Não**.
- Com o formulário pronto, é hora de partir para a criação do fluxograma.  
  Para uma melhor compreensão o fluxo ficará da seguinte forma:

  ![](/assets/images/criando_fluxo_1_-f4d96805e8d5774a65b42758d7cc8751.jpg)
- Clique no objeto inicio e determine o seguinte parâmetro de entrada:

  ![](/assets/images/criando_fluxo_2_-d5a47333dfe859455d4ed766707c1867.jpg)
- Adicione uma variável chamada **Conteúdo** do tipo *Letras*.

  ![](/assets/images/cirando_fluxo_3-0ad1c9295a22188ef49394daaee3b20a.jpg)
- Adicione um objeto processamento e no montador de expressão, selecione a função **Concatenação** e retorne seu valor a variável **conteúdo**.

  ![](/assets/images/cirando_fluxo5-0d18abeea0072e6b5d8fa986507ec307.jpg)

  - No 1º parâmetro informe o parâmetro de entrada Nome
  - No 2º parâmetro informe ", seja bem vindo a era da mobilidade corporativa"
- Adicione um objeto interação e informe a variável conteúdo.

  ![](/assets/images/criando_fluxo6-e08941d84aca194072a3fd52b0443174.jpg)
- Salve o fluxo com o nome **bem\_vindo**.
- Associe o fluxo ao botão Clique aqui e associe seu parâmetro de entrada a caixa de texto.

  ![](/assets/images/criando_fluxo7-15c80ed71e33f2d8d420d3a07ae67e0f.jpg)
- Salve o formulário, exporte o projeto para a plataforma desejada e execute a aplicação.

  ![](/assets/images/criando_fluxo8-a3e143be1dc57e71c4efc7a68d42d64c.png)

# Incluindo, atualizando e excluindo dados no Maker Mobile através de fluxograma

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/incluindo_deletando_dados

# Incluindo, atualizando e excluindo dados no Maker Mobile através de fluxograma

- Crie um formulário com o seguinte layout (o formulário não possui fonte de dados e as propriedades **Navegação** e **Aba Localizar** estão marcadas como **Não**).

  ![](/assets/images/incluindo_1-6787998e8a5dd19b49bb6a7833a88eb1.jpg)
- Criado o formulário é hora de criar os fluxogramas. Em 1º lugar será criado o fluxo que será associado ao botão Inserir, em segundo o Atualizar e por útimo o Deletar. Os fluxos serão criados nesta ordem respectivamente. Para um melhor entedimento, o 1º fluxo ficará da seguinte forma:

  ![](/assets/images/incluindo_deletando-16-147e5c03b3eb60306c7fc5e29959c643.jpg)
- Clique sobre o objeto Inicio e determine o seguinte parâmetro de entrada:

![](/assets/images/incluindo_deletando_2-2e92f27f7490b944c041735e3ab3bcbf.jpg)

- Adicione um objeto processamento e no montador de expressão selecione a função **Executar Atualização**.

![](/assets/images/incluindo_deletando_dado_3-46128b3bd9f5e6920c5310002399cf6b.jpg)

![](/assets/images/incluindo_deletando_5-a2577b5709bfffcf5b193143dd253a1a.jpg)

- O construtor SQL deverá ficar da seguinte forma:

  ![](/assets/images/incluindo_deletando_6-f44dbd6a1ce0b1bc1be3ecaa9b64afc3.jpg)

Deverá ser adicionado a tabela o parâmetro de entrada Nome, parâmetro que fora determinado anteriormente.

- Adicione um objeto interação e informe a mensagem "Contéudo Inserido".

  ![](/assets/images/incluindo_deletando_7-8875bbd046ba04a805eef6bca9e90844.jpg)
- Criado o fluxo, salve-o e associe-o ao botão Inserir, em seguida, defina o parâmetro nome para o componente **Nome**.

  ![](/assets/images/incluindo_deletando_8-15b879489bb1cd0d44b97e13ce462d53.jpg)
- Com o primeiro fluxo criado é hora de se definir o segundo. Para um melhor entendimento o fluxo ficará da seguinte forma:

  ![](/assets/images/incluindo_deletando_10-3cc394e34749d01e8119dd7286f81452.jpg)
- Clique sobre o objeto Inicio e determine os seguintes parâmetros de entrada.

  ![](/assets/images/incluindo_deletando_11-782ad840705d8940354cc57d2674de7f.jpg)
- Adicione um objeto processamento e no Montador de Expressão selecione a função **Executar Atualização**.

  ![](/assets/images/incluindo_deletando_12-fff5b2ccce9311b51f8e870cf3fc0359.jpg)
- Clique sobre o botão Wizard SQL e defina a seguinte consulta.

  ![](/assets/images/incluindo_deletando_13-d4995ffe09039c6342242128ff804c9a.jpg)
- Adicione um objeto interação e informe a seguinte mensagem **Conteúdo Atualizado.**

  ![](/assets/images/incluindo_deletando_14-02c6740c3dd70bd993b147fb37d9279d.jpg)
- Salve o fluxo e associe-o ao botão Atualizar, em seguida associe o parâmetro de entrada aos componentes **Codigo** e **Nome**.

  ![](/assets/images/incluindo_deletando_15-7d5e5a6b160603d0c919ecfe147173df.jpg)
- Por fim, crie o 3º e ultimo fluxo. Para um melhor entedimento o fluxo ficará da seguinte forma:

  ![](/assets/images/incluindo_deletando_16-63a08dc4e04f07415ee0181153e7a40d.jpg)
- Clique sobre o objeto inicio e determine os seguintes parametros de entrada:

  ![](/assets/images/incluindo_deletando_17-2072cae97fa99e2083ae70ee98a2f330.jpg)
- Adicione um objeto processamento e no Montador de Expressão selecione a função **Executar Atualização**.

  ![](/assets/images/incluindo_deletando_18-88256c09c9b9711a17427e0f689c82a2.jpg)
- Clique sobre o botão **Wizard SQL** e determine a seguinte consulta.

  ![](/assets/images/incluindo_deletando_19-3ca84f241588cc6e918a79a36bb38904.jpg)
- Adicione um objeto interação e determine a seguinte mensagem "Remoção Concluída".

  ![](/assets/images/incluindo_deletando_21-2eb33d68cc6b28e781e690ca49f602e9.jpg)
- Salve o fluxo e associe-o ao botão deletar, associe os parâmetros de entrada ao componentes Codigo e Nome.

  ![](/assets/images/incluindo_deletando_22-c7e8aad5424f6e88ff38f6e7b16335a5.jpg)
- Salve o formulário, exporte a plataforma desejada e execute a aplicação.

  ![](/assets/images/incluindo_deletando_23-bf06b565b59c30143060e42d55b85ac3.png)

Observações:

1. Operadores suportados no Maker Mobile através da função:
   - Igual
   - É Nulo
   - Iniciando com
   - Terminando com

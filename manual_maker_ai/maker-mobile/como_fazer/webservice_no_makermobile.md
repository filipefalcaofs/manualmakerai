# Utilização do WebService no Maker Mobile

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/webservice_no_makermobile

# Utilização do WebService no Maker Mobile

Veja a observação sobre os tipos aceitáveis no Webservice, clicando [aqui](#obs_webservice).

Este exemplo tem por finalidade demonstrar a utilização do WebService no Maker Mobile. Primeiramente imagine que seja necessário preencher um formulário de cadastro e que neste formulário seja necessário informar o CEP para consulta do Estado, Bairro e Cidade. Com base nesta linha de raciocínio, siga os passos abaixo.

- Crie um formulário com o seguinte layout. O formulário não possui fonte de dados e a propriedade **Navegação** está definida como **Não**.

  ![](/assets/images/webservice_2-bb1a5b2be1eaa5348485369a74f716ca.jpg)
- Criado o layout, é hora de partir para a criação do fluxograma, que será associado ao botão **Obter Logradouro**.  
  Para um melhor entendimento o fluxo ficará da seguinte forma:

  ![](/assets/images/webservice_3-a0bdd19bdb21f7c73e7e987d29c713e3.jpg)
- Clique sobre o objeto início e defina o parâmetro de entrada **cep**.

  ![](/assets/images/webservice4-e7be507a233a625f2a58842416551d38.jpg)
- Adicione duas variáveis. A primeira, do tipo **Variante**, será chamada de ***Lista*** e a segunda, do tipo de **Letras**, será chamada de **retorno**.

  ![](/assets/images/webservice5-28b4b0d337d67d8307a2c6d48abeff5b.jpg)
- Adicione um objeto processamento e no montador de expressão, selecione a função **Chamar Serviço Web para Dispositivos Móveis** ( esta função é exclusiva da API do Maker Mobile).

  ![](/assets/images/webservice_7-5b2c6bf2c6a50cb7b65cf548b7b6c709.jpg)

  - No primeiro parâmetro informe o endereço do WebService, neste exemplo será utilizado o **endereço** [http://www.byjg.com.br/site/webservice.php/ws/cep?WSDL](http://www.byjg.com.br/xmlnuke-php/webservice.php/ws/cep?WSDL)**.**
  - No segundo parâmetro será informado a porta do WebService, neste exemplo será utilizado **CEPServicePort.**
  - No terceiro parâmetro será informado o nome do método, neste exemplo será utilizado **obterLogradouro**
  - No quarto parâmetro será informado a lista dos parâmetros que são esperados pelo WebService. Observe que o nome do parâmetro deve ser exatamente igual ao definido no WebService a ser consumido.
  - No quinto será informado a lista dos parâmetros que serão enviados ao WebService, neste exemplo a variável **cep.**
  > **Nota:** Como o retorno do WebService não vem da maneira que se deseja obter, é necessário tratá-lo. Adicione um objeto processamento e no montador de expressão selecione as funções **Troca Subsequência** e **Quebra de texto**, seu retorno será associado a variável **Lista.**
- ![](/assets/images/webservice_8-3b41fd0416d95a133b8346cc9ff4a7c6.jpg)

  1. No primeiro parâmetro informe a variável **Retorno**, que é o retorno do WebService;
  2. No segundo parâmetro informe **VOCE PRECISA ESTAR AUTENTICADO. MAIORES INFO ACESSE O SITE**. (só é necessário utilizar este tratamento para usuários não cadastrados);
  3. No terceiro parâmetro informe **nulo**;
  4. Acima da função **Troca Subsequência** informe a função **Quebrar Texto** e em seu segundo parâmetro informe “,” (vírgula). Para que a string retornada pelo WebService seja transformada em lista separando cada elemento por, (vírgula). Por fim, retorne seu valor a variável **Lista**.
  > Com o retorno do WebService tratado da maneira correta, é hora de se definir onde serão introduzidos os seus dados. Adicione um objeto processamento e no montador de expressão selecione a função **Alterar valor do componente**.

  ![](/assets/images/webservice_10-84eeac5b1a808674542441820d62714f.jpg)

  - No primeiro parâmetro informe o formulário **Cadastro**;
  - No segundo parâmetro informe o componente **Bairro**;
  - No terceiro parâmetro informa a função **Obter Objeto da Lista**, como primeiro parâmetro desta função informe a variável **Lista** e no segundo parâmetro informe o valor **2**. Onde será retornado o bairro como elemento.
- Adicione um objeto processamento e no montador de expressão selecione a função **Alterar valor do componente**.

  ![](/assets/images/webservice_10jpg-2cc0f801ac9457c96e40b204268afbcc.jpg)

  - No primeiro parâmetro informe o formulário **Cadastro.**
  - No segundo parâmetro informe o componente **Cidade**.
  - No terceiro parâmetro informe a função **Obter Objeto da Lista**, como primeiro parâmetro desta função, informe a variável **Lista** e em seu segundo parâmetro informe o valor **3**. Onde será retornado a cidade como elemento.
- Adicione um objeto processamento e no montador de expressão selecione a função **Alterar valor do componente.**

  ![](/assets/images/webservice_11-8d3300e05a69211bbc0bd0641a3fdc00.jpg)

  - No primeiro parâmetro informe o formulário **Cadastro.**
  - No segundo parâmetro informe o componente **Estado**.
  - No terceiro parâmetro informa a função **Obter Objeto da Lista**, como primeiro parâmetro desta função informe a variável **Lista** e no segundo parâmetro informe o valor **4**. Onde será retornado o **Estado** como elemento.
- Salve o fluxo com o nome **Obter logradouro** e associe o fluxo ao componente botão, associando o componente **Cep** , para que seja  referência do parâmetro de entrada **Cep.**

  ![](/assets/images/webservice_12-14f30118f47d5f4bfa06f78e0355bbd0.jpg)
- Exporte o sistema para a plataforma desejada e execute o exemplo. Veja na imagem abaixo:

  ![](/assets/images/webservice_13-0d46e673dd4704d4ccc0778efbdc5304.png)

Atualmente, o Maker Mobile em sua versão 1.0 suporta apenas o consumo de Webservices que retornem tipos primitivos como "Letras", "Data/Hora", "Fracionado", "Inteiro" ou "Lógico". Desta forma, caso o Webservice consumido retorne tipos como "Lista", "Mapa" ou "Variantes" o retorno será tratado como "Nulo" não sendo possível obter o valor retornado.

Caso seja necessário o consumo de Webservice com retornos do tipo “Variante”, sugerimos que outro [Webservice](/docs/maker-mobile/como_fazer/criando_consumindo_webservice) consuma o serviço e retorne para o Mobile ‘texto formatado’ conforme imagem abaixo.

#### Observação sobre os tipos aceitáveis no Webservice

![](/assets/images/webservice_observacao-50eb142f46d3e29feca7b99eac607d85.jpg)

Veja um exemplo de consumo de [Webservice com ‘texto formatado’.](/docs/maker-mobile/informacoes_adicionais/utilizando_texto_formatado_no_webservice)

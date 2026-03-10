# Criando e consumindo um Webservice através de um dispositivo móvel

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/criando_consumindo_webservice

# Criando e consumindo um Webservice através de um dispositivo móvel

Para utilizar serviços Web no Maker Mobile é simples, siga os passos abaixo para aprender a criar e consumir um serviço web.

- Crie um formulário com o seguinte layout (saiba como criar formulários no Maker Mobile acessando [aqui](/docs/maker-mobile/como_fazer/criando_formulario)).

  ![](/assets/images/criando_e_consumindo_um_webservice-1eb5fafe068698cb29aefd7c40c7bd21.jpg)
- Agora será feito a criação do **Webservice**, o qual receberá os dados informados no formulário.

  Para um melhor entendimento o fluxo ficará da seguinte forma:

  ![](/assets/images/criando_e_consumindo_webservice_3-3adf1397d86508b37778734a366cc7e3.jpg)
- Clique sobre o objeto início e determine os seguintes parâmetros de entrada.

  ![](/assets/images/criando_e_consumindo_webservice_4-526ae440371913d3e60133ad7e8b4fb3.jpg)
- Adicione um objeto processamento e no *Montador de Expressão* selecione a função **Executar Atualização**.

  ![](/assets/images/criando_e_consumindo_webservice_5-9251eea76db78bc781a14b640672acd9.jpg)
- A atualização deverá ficar da seguinte forma (observe que os parâmetros de entrada **Nome**, **Telefone** e **CPF** serão inseridos na tabela).

  ![](/assets/images/criando_e_consumindo_webservice_8-aabe72d0d3d6a3aa82ca9791010456d3.jpg)

Salve o fluxo com o nome **executando\_web\_service** na camada **Servidor.** Com o fluxo salvo, volte à tela de trabalho do maker, selecione o objeto fluxo, localize o fluxo criado e clique com o botão direito sobre mesmo, em seguida marque a opção **Publicar fluxo como Webservice**, como demonstra a figura abaixo.

![](/assets/images/criando_e_consumindo_webservice_10-cdbcbe42e797e079fa2d5009f91c17f8.jpg)

Consumindo o Webservice a partir de um fluxo mobile.

- Agora criaremos um fluxo que irá chamar o fluxo anterior. Para um melhor entendimento o fluxo ficará da seguinte maneira:

  ![](/assets/images/criando_e_consumindo_o_webservice_12-f3e0c9bdcea1bd6a20f6e22b2818a1ed.jpg)
- Clique sobre o objeto Inicio e determine os seguintes parâmetros de entrada.

  ![](/assets/images/criando_e_consumindo_webservice_13-fba8709bc556457a13545e8afd433c87.jpg)
- Adicione um objeto processamento e no **Montador de Expressão** selecione a função **Chamar serviço Web para Dispositivos Móveis**. A função será parametrizada da seguinte forma:

![](/assets/images/chamar_servico_11-bc6306a827737988e72235f8044f2e21.jpg)

- No primeiro parâmetro será informado o endereço do **Webservice**, neste exemplo:

**http://`<servidor>`:`<porta utilizada>`\_/webrun/webservices/CJBServices.jws?wsdl**

- No segundo parâmetro será informada a porta do serviço, neste exemplo:

**CJBServices**

- No terceiro parâmetro será informado o nome do parâmetro do **Webservice**, neste exemplo:

  **ExecutandoWebService**
- No quarto parâmetro será informada a função **Criar lista a partir dos Elementos**, com três parâmetros, os três serão *Constantes* do tipo *Letras*: **Nome**, **Cpf** e **Telefone**.
- No quinto parâmetro será informado à função **Criar Lista a partir dos Elementos**, informando os parâmetros de entrada como elementos da Lista.
- Salve o fluxo com o nome **chama\_servico\_web** na camada servidor.
- Associe o fluxo ao botão **Cadastrar**, e associe os seguintes parâmetros de entrada.

  ![](/assets/images/chamar_servico_web_12-a47503a0c8fea796b43aa4197979e662.jpg)

Salve o formulário, exporte sua aplicação para um dispositivo móvel de sua preferência.

![](/assets/images/chamar_servico_web_13-fda640fa11a7b6823e570054cfc23ef5.png)

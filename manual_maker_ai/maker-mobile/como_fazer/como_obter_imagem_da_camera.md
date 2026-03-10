# Obtendo imagem da câmera

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/como_obter_imagem_da_camera

# Obtendo imagem da câmera

No Maker Mobile, é possível obter a imagem da câmera de um dispositivo móvel através da função **Obter imagem da câmera**.

Antes de utilizar a função em questão, é necessário desenvolver outros dois fluxos (caso não existam) para compor a chamada desta função, os passos abaixo demonstram a criação desses fluxos e utilização da função.

- Crie um novo fluxo, efetue duplo-clique no objeto **Início** e adicione uma variável de entrada do tipo *Variante*. Chamaremos de "imagem", em seguida clique em **OK** para confirmar as alterações.

  ![](/assets/images/como_obter_imagem_1_-3eb74d5d4da58aad67f8a6131327cdbf.jpg)
- Adicione um processamento e utilize a função **Alterar imagem do componente**. No primeiro parâmetro, informe o nome do componente Imagem que irá ser alterado e, no segundo parâmetro informe a variável "imagem" que foi declarada como parâmetro de entrada anteriormente.

  ![](/assets/images/obter_imagem3-8cf7377784341c323d6297df15087855.jpg)
- Ao final, o fluxo deverá ficar da seguinte forma:

  ![](/assets/images/obter_imagem4-43ea05186ddbceb59ab2df8f7956c740.jpg)

  Salve o fluxo (camada cliente ou servidor), este será usado posteriormente.
- Repita os procedimentos anteriores fazendo a seguinte alteração:

  - Troque o nome da variável declarada no parâmetro de entrada para "Mensagem de erro", do tipo *Letras*.
  - Adicione um processamento e chame a função **Alertar Aguardando Ok** e nela passe como parâmetro a variável anteriormente declarada, "Mensagem de erro".
    ![](/assets/images/obter_imagem5-593a237069113a77a3862a7a342d32f1.jpg)

  Salve o fluxo, o resultado deverá ficar como na imagem:

  ![](/assets/images/obter_imagem6-8da309cf84ec6c8e8a7faf0211cec82b.jpg)
- Criados os fluxos, abra o editor de fluxos novamente e adicione um novo processamento. Dentro deste processamento utilize a função **Obter imagem da câmera**. Esta função possui 03 parâmetros:

  - O primeiro é o fluxo que será executado caso a imagem seja obtida com sucesso;
  - O segundo parâmetro é o fluxo que será executado caso ocorra um erro ao obter a imagem;
  - O terceiro é um *inteiro* que representa a qualidade da imagem (de 0 a 100).

  O seu processamento deverá ficar conforme a imagem:

  ![](/assets/images/obter_imagem7-f46f5a2ef95f620f28a89a3d07e916cc.jpg)
- Ao final, o fluxo deverá ficar assim:

  ![](/assets/images/obter_imagem8-cdd435e611bdbd246e6c53fe5d119fcf.jpg)

Salve o fluxo (camada cliente ou servidor) e associe ao evento *Ao Clicar* de um componente Botão em seu formulário. Ao clicar no botão, a câmera do dispositivo será aberta e uma nova foto será tirada, caso a operação seja realizada com sucesso, o fluxo "Alterar Imagem" será executado, caso contrário, o fluxo com mensagem de erro será executado informando qual o erro apresentado.

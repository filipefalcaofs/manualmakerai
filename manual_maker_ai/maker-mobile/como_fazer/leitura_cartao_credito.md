# Obter os dados do cartão de crédito

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/leitura_cartao_credito

# Obter os dados do cartão de crédito

- Para utilizar a função de leitura e validação de cartão de crédito, basta utilizá-la no Maker com a função *Cartão de Crédito - Obter dados*.

  ![](/assets/images/credit_card-3e5445941fc0d93b102fe7eac5d2d564.png)

  Esta função passará um JSON para o fluxo do primeiro parâmetro, caso obtenha sucesso na leitura/validação.
- Ao executar a função, será aberto um formulário com a câmera, capaz de identificar os números contidos no cartão e validá-los.

  ![](/assets/images/cardio-b3d01959ec1c2609a14fd83ee593b4fc.png)

  > Esta função não possui suporte a leitura de **cartões de débito**.
- OBS: Será escaneado o número do cartão de crédito e será retornado um JSON com todos os dados do cartão de crédito.

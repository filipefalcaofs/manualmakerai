# Obtendo as coordenadas de um dispositivo móvel com GPS

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/como_obter_as_coordenadas_de_um_dispositivo_movel_com_gps

# Obtendo as coordenadas de um dispositivo móvel com GPS

No Maker Mobile, é possível obter as coordenadas de um dispositivo GPS utilizando a função **Obter Coordenadas**.

- Crie um novo fluxo, efetue duplo-clique no objeto **Início** e adicione uma variável de entrada do tipo *Variante.*  
  Chamaremos de "Coordenadas", em seguida clique em **OK** para confirmar as alterações.

  ![](/assets/images/obter_coordenas_1_-7dc04af9f291f08b5f4021502f262c72.jpg)
- Adicione um novo processamento e utilize a função **Alertar Aguardando Ok** informando como parâmetro a variável "Coordenadas".

  ![](/assets/images/obter_coordenadas_2-087d9acfe414b9972135d145a53c25e3.jpg)

  > **Nota:** Neste exemplo, estamos alertando todo o valor contido no objeto "Coordenadas". Pode-se utilizar as funções da categoria **Mapa** para manipular os valores conforme necessidade.
- Ao final o fluxo deverá esta conforme a imagem abaixo:

  ![](/assets/images/obter_cordenadas_10-50bf188acc89d320831dcfa01f92753c.jpg)
- Salve o fluxo, este fluxo será utilizado posteriormente. O chamaremos de "Coordenadas obtidas".
- O próximo passo é criar um fluxo que será utilizado para possíveis falhas no momento de obter as coordenadas. Para isso, repita os passos anteriores com as seguintes alterações:

  - No primeiro passo, a variável de entrada deverá ser do tipo *Letras* ao invés de *Variante* e a chamaremos de "Mensagem de erro".
  - No segundo passo, informe a variável "Mensagem de Erro" criada.
  - Salve o fluxo com o nome "Erro ao tentar obter coordenada".

  Ao final, o fluxo deverá ficar conforme a imagem abaixo:

  ![](/assets/images/obter_cordenadas_5-4965e1678411f4ceb946dc3e3541cbfd.jpg)
- Agora, será criado o fluxo que obterá as coordenadas GPS do dispositivo móvel.  
  Crie um novo fluxo, adicione um processamento e utilize a função **Obter Coordenadas**, esta função espera 02 parâmetros do tipo *Fluxo*:

  - O primeiro será executado caso a obtenção das coordenadas tenha sido executada com sucesso.
  - O segundo será executado caso algum erro ocorra durante este processo.

  Informe os fluxos criados anteriormente conforme imagem abaixo:

  ![](/assets/images/obter_cordenadas_7-c07c2154dbb271b123a80450295ebdfb.jpg)
- Salve o fluxo e associe-o ao evento *Ao clicar* de um componente **Botão** em seu formulário.  
  Ao chamar o fluxo, caso a operação tenha sido realizada com sucesso, o primeiro fluxo será chamado, caso contrário, o segundo fluxo será chamado. Para o primeiro fluxo, será passado um mapa com as chaves e valores abaixo:

  Chave

  Valor(\*)

  longitude

  Dinâmico

  latitude

  Dinâmico

  altitude

  Dinâmico

  accuracy

  Dinâmico

  altitude Acuracy

  Dinâmico

  heading

  Dinâmico

  speed

  Dinâmico

  Timestamp

  Dinâmico

  \*Os valores serão obtidos de acordo com a posição do GPS do aparelho.

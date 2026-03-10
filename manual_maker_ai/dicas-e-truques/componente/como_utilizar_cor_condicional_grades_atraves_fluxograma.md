# Como utilizar cor condicional em grades por meio de fluxograma

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/como_utilizar_cor_condicional_grades_atraves_fluxograma

# Como utilizar cor condicional em grades por meio de fluxograma

Existem duas maneiras de interagir com a Propriedade Cor Condicional do componente [Grade](/docs/dicas-e-truques/utilizando_a_propriedade_grade_mestre) pelo fluxo de ações:

- utilizando um fluxo que retorne um valor lógico;
- utilizando um fluxo retornando uma cor.

Exemplo 1: Fluxo retornando um valor lógico:

Crie um novo fluxo e defina dois Parâmetros de Entrada: mapeamento (do tipo Variante) e linha corrente (do tipo Inteiro).

Observação: É obrigatória a exata definição desses parâmetros nessa ordem e tipo:

![imagens665.jpg](/assets/images/imagens665-27a487d1b92b81e2349fe9ebdc8bc983.jpg)

O parâmetro denominado linha corrente, do tipo inteiro, receberá a linha corrente do componente Grade, e o parâmetro denominado mapeamento, do tipo variante, receberá o mapeamento do tipo [coluna, valor da coluna].

O parâmentro mapeamento passa como chave o campo do banco de dados em UperCase, ou seja, passa a palavra em maiúsculo. Por exemplo, caso se queira uma chave que tem como nome fun\_cod, deve-se obter o valor da chave FUN\_COD do objeto.

Mesmo que não utilize esses parâmetros, mantenha-os. Para apenas ilustrar o exemplo, o fluxo terá uma ligação direta do Início ao Fim.

- O fluxo será assim:

![imagens.jpg](/assets/images/imagens-c291a01901a625a217bed62987eb441d.jpg)

- Insira uma Decisão para comparar se a variável linha é par.

![](/assets/images/imagens3-55f5b402e1d8c10a2d4ab74c4ad0cc7b.jpg)

- Insira um processamento para atribuir o valor "TRUE" a variável do tipo lógico "Retorno".

![imagens1.jpg](/assets/images/imagens1-16191921046a636e5c0a7a54f3b27dfa.jpg)

- Insira um processamento para atribuir o valor "FALSE" a variável do tipo lógico "Retorno".

![imagens2.jpg](/assets/images/imagens2-7db56e030652554f28601143829bc650.jpg)

- No "Fim", o retorno do valor lógico (usar constante).

![imagens666.jpg](/assets/images/imagens666-3f701218948bbc3c2d85ad21f3a97f1b.jpg)

- No Webrun ficará assim:

![imagens4.jpg](/assets/images/imagens4-ae4615a12ea8fe6abd4720da6747c6ad.jpg)

O fluxo poderá ser salvo tanto na camada Cliente como na camada Servidor.

Observação: O preenchimento será feito somente se o Valor de retorno for True.

Retornando ao formulário, ative a Propriedade Cor Condicional do componente Grade e observe, na ilustração abaixo, como aplicar o fluxo com a propriedade:

![imagens667.jpg](/assets/images/imagens667-16940df5ea0bf629ab57c1b7a636d63d.jpg)

No campo Condição, utilizamos um parâmetro comum denominado FUNCAO (o mesmo utilizado para definir Valor Padrão dos campos para formulário), definindo FUNCAO(fluxo:<nome do fluxo>) e, na coluna Cor, selecione a cor desejada. No campo abaixo, selecione o campo da grade que será formatado.

Observação: Os parâmetros de entrada poderão ser utilizados com componentes Decisão para definir critérios para aplicar a Cor Condicional. Os valores para as declarações dos Parâmetros de Entrada especificados neste exemplo serão passados automaticamente pelo Webrun que reconhece estas variáveis.

Exemplo 2: Fluxo retornando uma cor:

Basicamente, aplicam-se os mesmos procedimentos descritos acima, mudando apenas na utilização da Constante Cor:

![imagens668.jpg](/assets/images/imagens668-7875b4f12e72381543385ff643fdca3c.jpg)

Observação: Como é necessário definir a cor no Editor condicional de cores para grade, a grade exibirá a cor definida no fluxo porque possui prioridade.

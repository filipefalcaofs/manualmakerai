# Slider Panel

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/slider_panel

# Slider Panel

Componente desenvolvido a finalidade de exibir imagens fazendo a transição dinamicamente.

![](/assets/images/sliderpanel_com_imagem-f9f8f0d732a092dde99cc034ef81d1f0.png)

**Propriedades em comum:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Altura | Define a altura do componente | Inteiro | 250 |
| Código | Informa o código gerado pelo Maker ao qual o componente/formulário foi associado. De forma geral, não interfere nas características do componente. | Inteiro | 5 |
| Container | Informa em qual container o componente irá ser inserido. | Indefinido |  |
| Dica | Armazena uma dica para o componente, o qual se torna acessível no modo de inserção ou alteração. | Letras | "Digite o CPF do cliente" |
| Habilitado | Torna o componente possível ser editado ou manipulado. | Lógico | Sim |
| PosiçãoX e PosiçãoY | O "X" determina a posição do componente em relação à esquerda do formulário, e o "Y" em relação ao topo. | Inteiro | 100 |
| Tabulação | Indica a ordem de tabulação do componente em relação aos outros que compõem a aba do formulário na qual está posto. Essa ordem pode ser observada quando o usuário altera o estado do formulário/grade para o modo de inclusão ou edição e navega entre os componentes/campos usando a tecla Tab. | Inteiro | 2 |
| Tabular | Selecionando a opção Sim, quando o usuário estiver navegando entre os componentes, como foi descrito no item anterior, o componente receberá foco (observada a ordem de tabulação). | Lógico | Sim |
| Tamanho | Aplicado a todos - determina a largura do componente ou formulário. | Inteiro | 100 |
| Visível | Aplicada a todos os componentes, com exceção da Moldura e do objeto formulário - Selecionando a opção Sim, o componente aparece no formulário. | Lógico | Sim |
| Nome | Aplicada a todos os componentes e para o objeto formulário - apresenta o nome do componente. O Maker sugere um nome diferente dos nomes dos componentes existentes no formulário para evitar que mais de um componente possua o mesmo nome. | Letras | "Tabela de Consumidores" |
| Descrição | Aplicada a todos os componentes exceto para os componentes Árvore, Grade, Moldura, Imagem e para o objeto formulário - É a legenda que aparece sobre o componente para identificar (resumidamente) qual a sua função. Observação: Ao selecionar um determinado campo o Maker irá sugerir uma descrição obtida no dicionários de dados, caso o usuário deseje deixar o campo da descrição em branco basta apagá-lo e clicar fora do componente. | Letras | "Insira aqui a idade do consumidor" |

**Propriedades em específico do componente Slider Panel:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Lista de imagens | Ao clicar nesta propriedade será aberto uma tela onde o desenvolvedor poderá adicionar sua lista de imagens. | Indefinido | - |
| URL | Campo onde sera definida a url que conterá a imagem, ao associar um link a imagem ao realizar um duplo clique sobre a mesma o link associado será aberto em uma nova aba (guia) do browser; | Letras | [www.softwell.com.br/softwell.png](http://www.softwell.com.br/softwell.png) |
| Descrição | Descrição da imagem que irá ser exibida | Letras | "Exemplo Descrição" |
| Tempo (ms) | Tempo definido para a passagem das imagens em milisegundos; | Inteiro | 1000 |
| Cor de fundo do texto | Cor de fundo do texto que será apresentado no componente; | Lista | Preto |
| Cor do Rodapé Ativo | Cor que será atribuida ao rodapé. | Lista | Prata |

> Exemplo da tela de Lista de Imagens:

![](/assets/images/sliderpanel_com_imagem2-391c5bb61bc605acc28d809e16da9e5d.png)

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

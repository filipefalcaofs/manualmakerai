# Aba

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/aba

# Aba

Componente desenvolvido para facilitar a criação de múltiplos formulários dentro de um formulário pai.

![](/assets/images/image1-87e6dd6b40f499841a29ad57d9da76a2.png)

Ao selecionar uma lista de formulários os mesmos serão associados as abas.

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

**Propriedades específicas do componente Aba:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Lista de Formulários | Nesta propriedade serão informados todos os formulários que serão representados por abas no formulário de trabalho. Para tal tarefa existe uma tela de escolha, que permite selecioná-los. | Indefinido | - |
| Propriedade Imagem da aba selecionada / Propriedade Imagem da aba | Essa propriedade é o caminho da imagem usada para o fundo da aba selecionada. Observação: Essa imagem é a repetição de 1px apenas, ou seja, essa imagem será repetida por todo corpo da aba. | Letras | C://documentos/imagem.png |
| Propriedade Fechar aba | Essa propriedade indicará se a opção fechar aba será ou não disponibilizada. Caso a mesma seja marcada como sim, aparecerá um “x” na parte esquerda de cada aba. Caso essa opção seja clicada, a aba será fechada. | Lógico | Sim |
| Tamanho Máximo das Abas | O tamanho máximo em que a aba pode ocupar. | Inteiro | 1000 |
| Acessível | Torna o componente acessível ou não no formulário quando não está em modo de edição/inclusão. | Lista | Todos os modos |
| Separar Formulário | Permite o formulário ser aberto em pop-up. | Lógico | Sim |

Nesta propriedade serão informados todos os formulários que serão representados por abas no formulário de trabalho. Para tal tarefa existe uma tela de escolha, que permite selecioná-los.

![](/assets/images/image2-98f003b236b3aac1950ba1d2882cf1a0.png)

Através do seletor de formulário (componente lista no formulário acima) serão escolhidos os formulários que serão representados nas abas. A grade serve para visualizar os formulários escolhidos e também excluí-los. Com um simples clique sobre um item da grade será removida a aba referente ao formulário.

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

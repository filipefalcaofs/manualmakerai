# Opções

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/opcoes

# Opções

![image169.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAaCAIAAADNH2CaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABcSURBVEhLY7S2tmagEmCC0tQAI8EslLDv7u6GsogDpaWlUBYYUNNdLFAaCaSkpEBZYDBnzhwoixDAYhZWQIwFxJpFjOuoGfaj4UUAjIbXoMnbo+U9aWBwmsXAAABfXSfjSV8HwwAAAABJRU5ErkJggg==)

Este componente possibilita ao usuário uma escolha entre os itens listados por ele. A depender da escolha feita pelo usuário, este componente gravará um determinado valor no banco de dados (utilizar o tipo Char equivalente a (um) caracter para o campo). Ele possui uma propriedade denominada Lista e outra denominada Valores onde se devem colocar as opções listadas pelo componente. O campo onde essas informações serão gravadas é informado na propriedade chamada Campo.

Ao clicar na propriedade Lista ou Valor, é chamada uma janela e é nessa janela que cadastramos os itens que serão visualizados pelo usuário no sistema. Na propriedade Colunas, podemos alterar a quantidade de colunas.

Todos os componentes possuem Propriedades e Eventos. Para conhecê-los [clique aqui](/docs/maker/propriedades_e_eventos_comum).

Observação: Para adição de uma nova linha na tela "Lista de valores e descrição", pressione a tecla [Tab] ou [Insert].

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

**Propriedades escpecíficas do componente Opções:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Colunas | Determina a quantidade de colunas nas quais as opções cadastradas na propriedade Lista/Valores serão organizadas. O número máximo de colunas é 12. | Inteiro | 1 |
| Lista | Ao clicar sobre o botão nessa opção, aparece a tela Lista de valores e descrição. Essa tela contém: Uma grade com as colunas: Valor - o valor contido nesta coluna é o valor que será gravado no campo apontado pelo usuário (propriedade Campo do menu suspenso), assim que o usuário selecionar uma das opções no componente; Descrição - o valor contido nessa coluna é o valor que aparece no componente para facilitar a escolha do usuário. Esta propriedade, não suporta valores em branco, ou seja, vazio. Caso seja necessário simular uma descrição vazia, informe um caracter em branco. Botão OK - clicando sobre ele, a tela fecha e todas as configurações executadas são gravadas; Botão Cancelar - ao clicar sobre ele, todas as configurações feitas, desde o momento em que a tela foi aberta, serão desconsideradas e a tela é fechada. | Letras | 1 |
| Valores | Esta propriedade possui a mesma função da propriedade descrita pela propriedade Lista. | Letras | 2 |
| Modo Clássico | Selecionando a opção Sim, o componente será renderizado com layout legado. | Lógico | Não |

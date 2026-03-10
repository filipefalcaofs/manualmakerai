# Check

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/check

# Check

![image146.png](data:image/png;base64,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)

Este componente dá uma possibilidade de escolha ao usuário. Ele pode ser marcado ou simplesmente ficar em branco. Quando marcado ou desmarcado, o Check grava um dado em um campo de uma tabela no banco de dados.

Utilize as Propriedades Valor Marcado e Valor Desmarcado para definir o que será armazenado na gravação do registro.

Quando inserimos este componente no formulário, vem como padrão Verdadeiro para a propriedade Valor Marcado, e Falso para Valor Desmarcado. O desenvolvedor pode alterar esses padrões, de acordo com o tipo de campo definido na tabela de origem.

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

**Propriedades específicas do componente Check:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Valor Desmarcado | Representa o valor do componente no estado Desmarcado. Caso o componente esteja desmarcado no momento da confirmação da inclusão ou edição de um formulário/grade, o valor informado pelo usuário nesta propriedade é o valor que será gravado no campo da fonte de dados vinculada ao formulário/grade. | Letras | "Exemplo de valor desmarcado" |
| Valor Marcado | Representa o valor do componente no estado Marcado. Caso o componente esteja marcado no momento da confirmação da inclusão ou edição de um formulário/grade, o valor informado pelo usuário nesta propriedade é o valor que será gravado no campo da fonte de dados vinculada ao formulário/grade. | Letras | "Exemplo de valor marcado" |

Observação: Caso necessite alterar e tipo de retorno do componente é necessário ir a propriedade "Valor Marcado" e "Valor Desmarcado" para valores lógicos. Caso não deseje alterar essas propriedades no fluxo o valor passado deverá ser do tipo letras Ex: "true" e "false".

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

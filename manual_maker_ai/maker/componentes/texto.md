# Texto

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/texto

# Texto

![image147.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAVCAIAAADNQonCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABXSURBVDhPY7S2tmagDDBBaQoAFYxA8Uh3dzeUhReUlpZCWWBABVewQGkYQLYB7iisgnBA7eBE8yRWgKlmcETqqBEIMDiMwF5eYM1vuBLesClyKDaCgQEAfdURq5cH5z0AAAAASUVORK5CYII=)

O Texto é um componente que é utilizado em conjunto com elementos de formulário. Ele pode servir para dar um título a outro componente ou a um formulário, como também pode ser relacionado com uma tabela qualquer e retornar um conteúdo de um campo.

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

**Propriedades em específico do componente Texto:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Alinhamento Horizontal | Determina o alinhamento horizontal do conteúdo do componente. Este alinhamento pode ser à direita, ao centro ou à esquerda. | Lista | Esquerda |
| Alinhamento Vertical | Determina o alinhamento vertical do conteúdo do componente. Este alinhamento pode ser o topo, a base ou ao centro. | Lista | Topo |
| Quebra Automática | Quando o conteúdo do texto exceder a largura do componente, o texto continua a ser comportado na linha seguinte. | Lógico | Sim |

Quando o conteúdo do texto exceder a largura do componente, o texto continua a ser comportado na linha seguinte.

Observação: Ao copiar um componente Texto que não possua valor na propriedadeDescrição, será automaticamente atribuído o valor TEXTO FIXO à propriedade do componente.

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

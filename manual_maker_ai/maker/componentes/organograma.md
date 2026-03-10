# Organograma

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/organograma

# Organograma

O componente Organograma tem a funcionalidade de criar um gráfico de estrutura hierárquica e não somente isso, também pode ser usado como um representante gráfico para agrupamento e que representa simultaneamente os diferentes elementos do grupo e as suas ligações. baseado em uma consulta SQL ou através da sua propriedade Estrutura.

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAABuCAIAAACiDgqvAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAARzSURBVHhe7ZzddeMgEIXztj2lINeTEraKnJNaUkx2gAFdfmxL18KSs/d78BkPwwCfiPOmtx+xB/K4D+7xr2BJAuXxUZLAymOKxUpQmjzyoDR55EFp8siD0uSRB6WNPX5/vL9l3j++PStqUNrAY5C4yPu8SOUVUFrv0cTV3syrJeLnh0l9u3ymZLquRiyHRP7u9YE4B4s80fZZZoWCUc/LJeYunz6YGrWVTwGk9R7jSeqdmFnfdj59uKSLmqY+lqeTeY0/mmVWGAxR16daBVh6xsXCvBwMV38Ki7RtHkt+GIdDZizT1zSZYU/MGKEsg6PDwOuedyMXaVv/rj2NJWW0pPr6YcY8DvtUNflLM9oEfWUMZwPS1v+fqfYHAspJIBEGsd7j0Cr9zYWaEN3qk2d5WPVsgr4yxrNBaQOPRthNxn9tYK+B4CQT8yUR/hPUZ6uO7VX5N6zpU69ytWcXtJVx+mxQ2tjjBuwEu/yu79XniaA00iNco4dOv1efQ0BpD9/H/xiUJo88KE0eeVCaPPKgNHnkQWnyyIPS5JEHpckjD0qTRx6UJo88KE0eeVCaPPKgNHnkQWnyyIPS5JEHpckjD0qTRx6UJo88KE0eeVCaPPKgtGM8/nmMr6+v9ImUvOHLTAalySMPSpNHHpR2ao9J0JB+NGXiPHmsKV4aijWk5A1fZjIo7YU99sjjmBu+rpEKfJnJoLSX9HgXX2YyKE0eeVCaPPKgNP0+8qC0Yzz6oWuSAmSYNO7mfZnJoLSz3EfCo30iJW/4MpNBaae4j6gAGSaNMgUpecOXmQxKk0celHYij5vop6RMsKj72DBMGmUKUvKGLzMZlCaPPCjtGI/ptEhRgAyTRrGGlLzhy0wGpZ3iPiaSAmSYNO7mfZnJoLSz3MchN3xdIxX4MpNBaS/p8S6+zGRQmjzyoDR55EFp+n3kQWmv6tGjGnkcc9uXfSIlb/gyk0Fp8siD0s7u8Rr9aMrEefK4jmINKXnDl5kMSpNHHpQmjzwo7RiPvwOUJo88KI32GF9p9HrvihkRXn7DvDsJpZEeg8UsMRp1nvUqp70xldu3jtI4j8uyQeKyA/bJHg9ejLWgNMrjorF7jrYfS8TP13rpZmyGJ7kPSmM8LksOFjezr/nSTYzXgdKmeSz5YWyB34jlZlU1TWbYEzNGKMvg6DDwOriRZXQ1KO0xj/0jTmO4JywpoyXV1w8z5nHYp6rJX5rRJugrY3jAfUQ1uKs4EL/h/ppqC2HUp2O9x6FVOleoCdGtPnmWh1XPJugrc5zDtaA0yiMeKe0m40+02VRwkon5kjjNSzfDYhuv4w4eqWUNOwExq2evPgVr6EI3gNJIj35b1h2mPP+1E66wV5+W0He7xZ08CnncCZQmjzwoTR55UJo88qA0eeRBafLIg9LkkQelySMPSpNHHpQmjzwoTR55UJo88qA0eeRBafLIg9LkkQelySMPSpNHHpQmjzwoTR55UJo88qC0yqMgSALl8VGSQPcoHkQe90Ee9+Dn5x8UtKC51L8K1AAAAABJRU5ErkJggg==)

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

**Propriedades específicas do componente Organograma:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Raiz | Nome da raiz do organograma. | Letras | "Organograma Exemplo" |
| Estrutura | Propriedade que irá gerar a estrutura do componente organograma, caso um SQL sejá definido essa propriedade é ignorada. | Indefinido | - |
| Permitir Contrair | Define se os nós do componentes podem ser contraidos. | Lógico | Sim |
| Exibir Legenda | Define se a legenda da consulta será exibida no componente Gráfico. | Lógico | Sim |
| Posição da Legenda | Posição em que a legenda do componente será exibida (no Gráfico de Série "Pizza" essa propriedade será sempre a direita). | Lista | Esquerda |
| Renderizar HTML | Define se os campos do componente organograma iram renderizar tags HTML. | Lógico | Sim |
| Tamanho do Item | Define o tamanho da fonte dos itens do componente organograma. Podendo ser Pequeno, Médio e Grande. | Lista | Médio |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao expandir | Este evento executará o fluxo informado quando expandir um item. | - |
| Ao clicar | Este evento executará o fluxo informado quando clicar no componente. | - |

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

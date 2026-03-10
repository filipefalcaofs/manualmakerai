# Subformulário

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/subformulario

# Subformulário

![image171.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAXCAIAAABxgXNEAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAD/SURBVDhPY7S2tmYgEVy8ciUpIfnihbN//vyBCoEBE5QmBSjJy2/buUNdXQvKhwFyzOLl5f308f33X7+EhUWhQmBAjllAAHTa5q2bNDR1WFhYoEJkm8XMzCwlJrZu4zodXX2oEAMDIuy7u7shDOJBeESEgZEJFwfHk8cPgVwy3QUB0lJShw4d4Obm4efnB3LJSRPI4OevX3cePIiLigUmEYr8WFpaCiQ/f/78/tPnkKBQRCzAAUQFQQC3G5hEgK7bvXc3FrOAgKAb0ewTERZ+9PgxRWGPDORkZbG7i0hvogHq+BECqOZHIBg1izRAzTRBhfwIB5SWE8iAeuHFwAAA+3JPM9v3xf8AAAAASUVORK5CYII=)

O SubFormulário é um componente com capacidade de agregar um formulário já existente no seu formulário. Com ele podemos fazer relacionamentos um para um entre formulários.

**Propriedade em comum:**

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

**Propriedades específicas do componente SubFormulário:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Formulário | É nesta propriedade é informado o código do formulário que estará fazendo parte do Subformulário; | Letras | -44444 |
| Parâmetros | É Nesta propriedade que indicamos um ou mais campos de ligação entre o formulário principal e o Subformulário; | Letras | cli\_id = usr\_id |
| Excluir Se Invisível | Ao configurar esta propriedade como Sim, o registro só será gravado no formulário e os parâmetros não serão repassados para o Subformulário. Caso esta propriedade esteja configurada como Não, quando o usuário confirma a inserção de um registro em qualquer formulário que contenha um Subformulário, os parâmetros de ligação são passados do formulário para o Sub-Formulário. | Lógico | Sim |

> Propriedade parâmetro:

![image322.jpg](/assets/images/image159-81c33365da4615d299c410689e999942.png)

Selecione o Campo do formulário detalhe que irá relacionar com o Campo do formulário master e clique no botão ![image139.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAWCAYAAAArdgcFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAABCSURBVEhLY8zMzPzPQCPABKVpAkYNxwpGDccKhq7hBHNoVVUVlIUK2traoCzcgKbZf+i6fDQpYgWjhmMFQ9VwBgYAM9sRSuKqkxMAAAAASUVORK5CYII=) (equivalente). Mais abaixo, defina o Tipo de ligação, informando:

Selecione o Campo do formulário detalhe que irá relacionar com o Campo do formulário master e clique no botão " = "(equivalente). Mais abaixo, defina o Tipo de ligação, informando:

Padrão (AND) - a ligação entre os dados é verdadeira quando forem iguais;

Ignorar Nulo - a ligação será verdadeira mesmo que os dados do formulário detalhe sejam nulos;

União (OR) - a ligação será verdadeira contendo valores do formulário detalhe ou apenas do formulário master.

Observações:

1. Ao utilizar mais de um subformulário ou grade num mesmo formulário master, não deverá existir mais de um componente (subformulário ou grade) vinculado ao mesmo formulário detalhe.
2. No Webrun, quando o componente do subformulário estiver excedendo à área limite, é necessário ajustar o subformulário no formulário do Maker.
3. Um formulário que será utilizado como subformulario deverá conter apenas uma aba, caso o mesmo possua mais de uma serão exibidos o(s) componente(s) de todas as  abas sobrepostos.
4. Os eventos Ao Entrar, Ao Navegar, Ao Pressionar Tecla, Ao Sair não se aplicam quando o formulário está em um subform.
5. O subform não é um copia perfeita do formulário é apenas uma pré-visualização do mesmo. Sendo assim alguns componentes demonstrados no formulário, podem não ser demonstrados da mesma forma no subform.

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

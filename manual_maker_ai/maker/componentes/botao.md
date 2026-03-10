# Botão

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/botao

# Botão

![image158.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAZCAIAAABGlWJzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABqSURBVEhL7ZXBCQAxCAS9tGVdVmHTOYhPdzEPDw6cT/JYRwlCHlWVNlacPYwdMXYE23d3jxvGzOKWAWevqF94LLcX1QcSTuxX6gMq+fPOfG7nS5aCSvLZrxqQMHyZYgMem78JMXZEp11kA1uTF0MxM+/aAAAAAElFTkSuQmCC)

Este componente pode ser usado para chamadas de outros formulários, de listagens e de relatórios, além de outras ações que podem ser atribuídas a ele em um de seus eventos.

Este componente pode informar o nome do formulário, caso ele chame algum. Dessa forma, este botão pode servir como um filtro, passando informações do formulário "pai" para o novo formulário. O formulário "filho" chamado será filtrado, com informações vinculadas a um campo, passadas pelo formulário "pai".

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

**Propriedades específicas do componente Botão:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Formulário | Nesta propriedade, é informado o nome do formulário que será chamado, caso o botão seja clicado; O botão ficará desabilitado caso o formulário onde o componente se encontra não contenha registro. | Letras | "Cadastro Pessoas" |
| Propriedade Parâmetros | É nesta propriedade que indicamos um ou mais campos de ligação entre o formulário e o Botão. | Letras | cli\_id = usr\_id |
| Imagem | Esta propriedade aplica uma imagem para exibição ao lado esquerdo da Descrição do componente botão. A imagem a ser selecionada deve existir na Galeria de Imagens. Para vincular uma imagem, selecione a imagem (a imagem ficará com a borda laranjada) e clique no botão Selecionar (imagens podem ser gravadas no Maker pela opção Galeria de Imagens do menu Projeto); Para desvincular uma imagem do formulário, clique no botão Nenhum; | Letras | imagem.png |

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

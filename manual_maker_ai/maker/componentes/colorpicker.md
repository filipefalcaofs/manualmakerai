# ColorPicker

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/colorpicker

# ColorPicker

O Componente ColorPicker tem como funcionalidade mostrar um seletor de cores no formulário.

ColorPicker:

![](/assets/images/colorpicker_image-ef2e19442fcd43db66a611c46c203666.png)  
*Imagem 1 - Interface Componente ColorPicker*

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

**Propriedades específicas do componente Calendário:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Campo | Campo da consulta do formulário que armazenará as referências das seleções |  |  |
| Acessível | Torna o componente acessível ou não no formulário quando não está em modo de edição/inclusão. | Lista | Todos os modos |
| Texto Quando Nulo | Define um texto que irá ser exibido como valor do componente quando ele estiver nulo/vazio. Essa propriedade não altera o valor do componente, é apenas um elemento visual. | Letras | Nome |
| Opcidade | Define se o componente vai conter opacidade na escolha da cor. | Lógico | Não |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao Modificar | Executado ao modificar a cor do componente. | Valor hexadecimal da cor |

[Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

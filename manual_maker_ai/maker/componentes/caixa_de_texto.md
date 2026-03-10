# Caixa de Texto

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/caixa_de_texto

# Caixa de Texto

A Caixa de Texto é um componente adicionado no formulário, que permite a inserção e a leitura de dados de uma tabela por meio de um campo de edição. A sua configuração é simples, a propriedade Campo recebe o nome do campo da tabela / consulta do formulário que estará relacionado com esse componente. Dessa forma, quando um formulário for acionado para gravar um registro, esse componente irá direcionar aquele dado que nele está armazenado, para o campo de destino.

Observação: Dentro de um formulário contendo um componente Caixa de Texto maior do que o formulário, ou seja, fora da área visual, só é possível visualizar os dados do componente se a Propriedade Barra de Navegação estiver desabilitada ou se o formulário estiver no estado de Inserção ou Alteração.

Caixa de Texto:

![](/assets/images/caixa_de_texto_image-c23544d4fa1e5a5b4414301d76ca784b.png)

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

**Propriedades específicas do componente Caixa de Texto:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Apenas Leitura | Ao selecionar a opção Sim, o componente aparece somente em modo de leitura, não podendo ser editado. | Lógico | Não |
| Campo | Esta propriedade representa a coluna da tabela selecionada como fonte de dados do formulário. São disponibilizados para seleção todos os campos da fonte de dados vinculada. O campo no banco de dados deve ser de um tipo que dê suporte à imagem ou de um tipo texto (campo que suporte alta precisão). Utilizando a primeira opção, o byte da imagem será gravado no campo da tabela vinculada ao formulário; já na segunda opção, o Webrun copiará a imagem para a pasta C:\Arquivos de Programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps<contexto do Webrun>\files, guardando o caminho do arquivo no campo. | Letras | campo\_nome |
| Cor | Define a cor de fundo do componente. | Lista | Estender |
| Fonte | Define a fonte do texto dentro da caixa de texto. | Fonte | MS Sans Serif,8,0000,clWindowText |
| Fonte da Descrição | Define a fonte do texto da descrição do componente. | Fonte | MS Sans Serif,8,0000,clWindowText |
| Tipo | Permite escolher um tipo de dado para se aplicar uma máscara. Caso o campo não esteja ligado ao banco, ela deverá ser usada junto com a propriedade Conteúdo. | Lista | Conteúdo |
| Posição da Descrição | Define a posição da descrição em relação ao componente. - Acima: A descrição irá se posicionar acima do componente (padrão). - Abaixo: A descrição irá se posicionar abaixo do componente. - Esquerda: A descrição irá se posicionar ao lado esquerdo do componente. - Direita: A descrição irá se posicionar ao lado direito do componente. | Lista | Acima |
| Texto Quando Nulo | Define um texto que irá ser exibido como valor do componente quando ele estiver nulo/vazio. Essa propriedade não altera o valor do componente, é apenas um elemento visual. | Letras | Nome |
| Auto Completar | Define se a caixa de texto irá se auto completar com uma pesquisa ou dado já feito ou salvo. | Lógico | Sim |
| Senha | Ao selecionar a opção Sim, o texto do componente é substituído por asteriscos (\*), independentemente do estado em que se encontre o formulário no qual está inserido. | Lógico | Não |
| Tamanha Máximo | Determina o limite de caracteres que podem ser digitados no componente. | Inteiro | 0 |
| Conteúdo | Configura uma máscara no componente para evitar que o usuário digite valores não compatíveis. Opções disponíveis: - Número: O usuário não poderá digitar outro valor que não seja o de um valor numérico. - Data: O usuário não poderá digitar outro valor que não seja uma data válida, quando a mesmo não estiver ligado a campo, a verificação/validação da data só será realizada ao sair do componente. - Livre: O usuário não poderá informar qualquer valor, levando em consideração as restrições do tipo que foi definido para o campo no banco de dados. - Maiúsculas: Todos os caracteres digitados serão transformados para caracteres em caixa-alta (maiúsculos). - Minúsculas: Todos os caracteres digitados serão transformados para caracteres em caixa-baixa (minúsculas). - Número com 2 decimais: Esta opção é observada quando o usuário cria um novo campo na tabela associada ao formulário por meio do próprio formulário (tela Assistente de Banco de Dados). | Lista | Livre |

**Eventos:**

| Evento | Descrição | Parâmetros Automáticos |
| --- | --- | --- |
| Ao Clicar | Executado ao clicar no componente. | - |
| Ao Entrar | Executado assim que o usuário efetua um clique com o botão esquerdo do mouse sobre o componente ou quando o componente recebe o foco. | - |
| Ao Modificar | Executado assim que o usuário efetua qualquer modificação no valor contido no componente e também quando navega entre os registros, desde que o valor contido no componente em um registro difira do valor contido no componente para o qual o usuário navegar: o próximo registro ou o registro anterior. | - |
| Ao Pressionar Tecla | Executado ao pressionar qualquer tecla no componente. Observações: 1. O evento é disparado quando QUALQUER tecla for pressionada. Isso não vale para as teclas Alt, Ctrl e Shift, pois elas são capturadas quando executadas em conjunto com outra tecla. Exemplo: Ctrl + S. 2. O evento não detecta o disparo das teclas Tab, Enter, Backspace e Setas de Navegação uma vez que essas teclas possuem o efeito de tabulação e acesso para o próximo componente. Logo, caso queira que ocorra algo quando essas teclas sejam pressionadas, deve ser utilizado no evento Ao Sair. 3. Caso o evento Ao Pressionar Tecla associado a um componente retorne CANCELEVENT, o evento não será propagado, ou seja, poderá ser criada uma verificação em um fluxo que a depender do resultado, permite impedir que um determinado conteúdo não vá diretamente para o componente. Exemplo: 1. Caso o usuário tecle a letra "a", podemos verificar, no fluxo, caso o caractere tenha sido "a" retornamos "CANCELEVENT" (Letras) e desta forma o caractere "a" não será escrito no componente. | Três valores lógicos indicando se as teclas Alt, Ctrl e Shift, respectivamente, estão pressionadas; um inteiro representando o código da tecla; o caractere da tecla pressionada. |
| Ao Sair | Executado assim que o componente perde o foco | - |

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

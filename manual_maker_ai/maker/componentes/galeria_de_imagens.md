# Galeria de Imagens

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/galeria_de_imagens

# Galeria de Imagens

O componente Galeria de Imagens foi criado para possibilitar a visualização de um conjunto de imagens a partir de uma fonte de dados (tabela) definida pelo usuário.

Galeria de Imagens:

![galeria_de_imagens_image.png](/assets/images/galeria_de_imagens_image-aaf98e452b61584653280f037c2a0266.png)

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

**Propriedades específicas do componente Galeria de Imagens:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| SQL | Propriedade que permitirá ao usuário apontar para tabela, onde estará os campos requeridos pelo componente. NOTA: Este componente não suporta :: para conversão de dados. | SQL | SELECT \* FROM tabela\_imagens |
| Campo ID | Campo na tabela que identificará as imagens inseridas na tabela. | Letras | campo\_id |
| Campo Miniatura | Campo na tabela que armazena as miniaturas das imagens. | Letras | campo\_thumb |
| Campo Imagem | Campo na tabela que armazena as imagens em seus tamanhos originais. | Letras | campo\_imagem |
| Acessível | Torna o componente acessível ou não no formulário quando não está em modo de edição/inclusão. | Lista | Todos os modos |
| Permitir Download | Cria uma opção no menu de contexto para possibilitar o download da imagem. | Lógico | Sim |
| Permitir Upload | Permite ao usuário fazer o Upload ou não das imagens. | Lógico | Sim |
| Permitir Exclusão | Permite excluir ou não as imagens já inseridas. | Lógico | Sim |
| Orientação | Permite ao usuário determinar como o componente poderá ser visualizado no Webrun. - Horizontal: As imagens serão dispostas horizontalmente na área do componente. - Vertical: As imagens serão dispostas verticalmente na área do componente. | Lista | Vertical |
| Tamanho Miniatura | Define a largura, em pixels, das miniaturas que serão exibidas no componente. | Inteiro | 100 |
| Altura Miniatura | Define a altura, em pixels, das miniaturas que serão exibidas no componente. | Inteiro | 100 |
| Expandir ao Clicar | Define se as imagens serão expandidas em tela ao serem clicadas. | Lógico | Sim |
| Bordas | Cria bordas nos limites da área do componente. | Lógico | Sim |

**Eventos:**

| Evento | Descrição | Parâmetros Automáticos |
| --- | --- | --- |
| Ao Selecionar | Executado ao selecionar uma imagem no componente. | Recebe como primeiro parâmetro o valor correspondente ao Campo ID relacionado à imagem selecionada. |

**Definindo a Fonte de Dados**

Após criar o componente, defina na propriedade SQL uma tabela e selecione os campos apresentados que serão atribuídos aos campos: ID, Miniatura e Imagem.

![](/assets/images/comp5-6db127442058a7dcb92c4049c6f31651.png)  
Imagem 1 – Tabela criada para armazenar as imagens inseridas na fonte de dados.

**Observações**

• Ao efetuar o *upload* de uma imagem, o componente Galeria de Imagens fará a conversão para miniatura e salvará no campo referente a mesma e a imagem original será salva no Campo Imagem.

• A janela de Upload é acessível clicando no item que possui um ícone de *+* ou pressionando botão direito na área do componente e clicando no item *Enviar Imagem...*

• Ao utilizar alias nos campos da Consulta SQL, os recursos de inserção/alteração não serão permitidos.

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

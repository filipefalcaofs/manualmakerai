# Menu

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/menu

# Menu

Um dos componentes mais aperfeiçoados pelos designers no desenvolvimento web, é o componente Menu. O Menu tem o poder de tornar a experiência do usuário agradável facilitando que o usuário retorne a aquele endereço ou pode tornar a experiência estressante fazendo com que o usuário deseje nunca mais retornar aquele site ou sistema. O Maker 3 trás o componente Menu com a possibilidade de ter a apresentação facilmente personalizada.

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

**Propriedades específicas do componente Menu:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Estrutura do Menu | Essa propriedade fica responsável por determinar a estrutura do componente Menu. Ao acessarmos essa propriedade será aberto um formulário onde torna-se possível criar a estrutura e visualizá-la previamente através do botão "Preview". Para a criação da estrutura pode-se utilizar menu, formulário, relatório, fluxo ou ações pré-definidas. | Variante | - |
| Menu Legado | Define se o componente Menu utilizará a estrutura definida na propriedade anterior ou se utilizará o menu legado da versão 2.7; Esta propriedade se configurada como "Sim" terá prioridade sobre a propriedade "Estrutura do Menu" terá a estrutura do menu do projeto ou não. Se definirmos o valor Sim para essa propriedade, a estrutura do componente será a mesma do menu criado no Maker para aquele projeto. | Lógico | Não |
| Orientação | Define a orientação do menu. - Horizontal: Os itens do menu serão dispostos horizontalmente. - Vertical: Os itens do menu serão dispostos verticalmente. | Lista | Vertical |
| Componente Aba | Nome do componente aba onde os formulários colocados no menu serão abertos. Deixe em branco para abrir o formulário normalmente (flutuante ou popup). | Letras | "Aba" |
| Ativar Pesquisa | Define se o menu deverá possuir um campo de pesquisa para possibilitar a busca por itens. | Lógico | Sim |
| Posição da Pesquisa | Define a posição do campo de pesquisa do menu. Para o menu vertical os valores possíveis são Acima e Abaixo. Para o menu horizontal os valores possíveis são Esquerda e Direita. | Lista | Acima |
| Texto da Pesquisa | Define o texto que será exibido quando o campo de pesquisa estiver vazio. | Letras | "Buscar no menu" |
| Alinhamento | Define o alinhamento do componente em relação ao formulário. Veja os valores possíveis para essa propriedade abaixo dessa tabela. | Lista | Esquerda |
| Auto Retrair | Define se o menu irá retrair automaticamente quando um item é pressionado ou quando um clique é realizado fora do menu. Em menus verticais, essa propriedade só é aplicada quando possui Alinhamento definido. | Lógico | Sim |

**Valores possíveis para a propriedade Alinhamento:**

| Alinhamento | Descrição |
| --- | --- |
| Nenhum | O componente irá possuir posicionamento e tamanho absolutos (comportamento padrão dos componentes Maker). |
| Acima | O componente irá ocupar toda a largura do formulário começando da sua posição X e irá se dispor no topo do formulário começando da sua posição Y. |
| Esquerda | O componente irá ocupar toda a altura do formulário começando da sua posição Y e irá se dispor no lado esquerdo do formulário começando da sua posição X. Em modo responsivo, o menu irá colapsar e um botão de expandir irá aparecer no seu lugar. |
| Direita | O componente irá ocupar toda a altura do formulário começando da sua posição Y e irá se dispor no lado direito do formulário começando da sua posição X. Em modo responsivo, o menu irá colapsar e um botão de expandir irá aparecer no seu lugar. |

**Eventos:**

| Evento | Descrição | Parâmetros Automáticos |
| --- | --- | --- |
| Antes de Carregar | Executado antes do componente ser carregado. Ao especificar um fluxo à esse evento o fluxo terá que retornar o XML do menu para ser renderizado. Se não houver retorno, o menu não será renderizado. | - |
| Ao Soltar Atalho | Executado ao soltar um atalho, após arrastar o item do menu. O evento permite ao usuário a customização onde os atalhos serão anexados na aplicação. | 1. (Variante) Referência do elemento do atalho criado. |
| Ao Clicar | Executado ao clicar num item no menu. Ao especificar um fluxo à esse evento o menu não irá executar a ação do item (com exceção à itens de ação pré-definida). | 1. (Letras) GUID do Formulário / ID do Relatório / Nome do fluxo / Nome da Ação Pré Definida. 2. (Letras) Descrição do item do menu. 3. (Inteiro) Tipo do item: (1) Formulário, (2) Relatório, (3) Fluxo, (4) Ação |

**Estrutura do Menu:**

É importante observar que a estrutura do Menu utiliza um processo de compressão para otimização do conteúdo gerado (XML). Desta forma, os fluxos associados a um ou mais itens do Menu não são reconhecidos como dependência do componente em questão.

Ao selecionar a propriedade *Estrutura do Menu* no *Inspetor de Objetos* do Maker, note que irá aparecer o botão ![](data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QCqRXhpZgAATU0AKgAAAAgACQEaAAUAAAABAAAAegEbAAUAAAABAAAAggEoAAMAAAABAAIAAAExAAIAAAAQAAAAigMBAAUAAAABAAAAmgMDAAEAAAABAAAAAFEQAAEAAAABAQAAAFERAAQAAAABAAAOw1ESAAQAAAABAAAOwwAAAAAAAXbyAAAD6AABdvIAAAPocGFpbnQubmV0IDQuMS42AAABhqAAALGP/9sAQwABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB/9sAQwEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB/8AAEQgAEAAQAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/oh0LQvhZ4W+FnwCVfgF8A/EF74g+Afws8T6xrHif4WeHdV1nUdZ1Xw7CNQvb3UBDby3c93Lb/arm5uvOu7i6muJ57iRpPlNd0L4WeKfhZ8fVb4BfAPw/e+H/gH8U/E+j6x4Y+Fnh3StZ07WdK8OzDT72y1Aw3EtpPaS3H2q2ubXybu3uobeeC4jaP5uk8CfEH4WXvwl+B0a/F/9l+C90v4H/BHRNY0z4ieP/DsXiDRNZ8H6ZBqGoaQbIXry6bFdy3H9keI7C6Ed3PFDcWE8Vs0e9jx38QfhZZfCX44xt8X/ANl+e91T4H/G7RNH0z4d+P8Aw7L4g1vWfGGmT6hp+kCyN6kupRWktv8A2R4csLUSXcEU1vYQRXLSb1AP/9k=). Pressione nele para abrir o formulário de edição do menu.

![](/assets/images/montar_menu-1327f08822b4cb8ab94da183498865e3.png)

No formulário que compõe a estrutura do menu, selecione a categoria desejada e arraste e solte o objeto sobre a árvore ao lado esquerdo na posição desejada. Observe que na primeira edição da estrutura existe somente a opção de adicionar o objeto na raiz.

![](/assets/images/estrutura_menu-4ea6e8a4d0a2cb481055ab10a391efa4.png)

![](/assets/images/form_com_menu-e4903e24a8c7404b6267493060633f84.png)

Após a finalização da edição, pressione o botão OK na parte inferior da janela para aplicar a estrutura no menu.

**Personalizando Itens do Menu:**

Ao pressionar botão direito sob um item na árvore, um menu de contexto com as seguintes opções irá aparecer:

![](/assets/images/estrutura_menu_2-a3d023571a0798aa9e9f70ec3a32b847.png)

Elemento Selecionado:

- Renomear: Renomeia o item selecionado na árvore.
- Remover: Remove o item selecionado na árvore.
- Definir Ícone: Define o ícone do item selecionado na árvore.

Inserir Submenu:

- Inserir Após: Insere um submenu após o item selecionado.
- Inserir Dentro: Insere um submenu dentro do item selecionado.

Para definir um ícone no item basta clicar no item *Definir Ícone...* no menu de contexto. A tela de escolha de ícone irá aparecer e você poderá escolher um ícone clicando nele e poderá também estar personalizando a cor e tamanho na aba *Estilo*.

![](/assets/images/estrutura_menu_3-1c8cb27539d947113de81d740f82bbb9.png)

**Personalizando Tema do Menu Horizontal:**

O menu horizontal utiliza a *navbar* do Bootstrap que tem a possibilidade de escolha de temas. Para escolher um tema para o menu horizontal, clique com o botão direito do mouse no elemento *Raiz* na árvore e clique no item *Definir Tema...*

![](/assets/images/estrutura_menu_4-8d653e3ca44fcb4c63d9ffa3ad7092f5.png)

![](/assets/images/estrutura_menu_5-462787311064da338d2ce5d609c165f2.png)

**Visualizando Alterações:**

Para visualizar as alterações na estrutura do menu, pressione no botão *Preview* na parte inferior do formulário.

![](/assets/images/estrutura_menu_6-c801b7f87fc17a5eb9bdfa318f0a85ea.png)

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

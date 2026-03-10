# Leitor de RSS

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/rss

# Leitor de RSS

O componente RSS tem como finalidade permitir o carregamento de Feeds de sites que atualizam o seu conteúdo regularmente, desta forma o usuário pode permanecer informado de diversas atualizações sem a necessidade de visitar os sites.

![](data:image/jpeg;base64,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)  
Imagem 1 - Imagem do componente RSS

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

**Propriedades específicas do componente RSS:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| URL | Essa propriedade receberá a URL que contém o RSS do site informado. | Letras | <http://globoesporte.com/times/bahia/feed.rss> |
| Tempo de Espera | Determina o tempo que cada Feed será apresentada, por padrão o tempo de espera são de 3 segundos. | Inteiro | 3 |
| Quantidade de Itens | Determina a quantidade de itens que serão apresentados. | Inteiro | 5 |
| Abrir em outra aba | Determina se o item selecionado no RSS será aberto dentro do formulário em que ele se encontra ou em outra aba. | Lógico | Não |
| Exibir imagens | Especifica se as imagens das notícias devem ser exibidas. | Lógico | Sim |
| Exibir títulos | Especifica se os títulos das notícias devem ser exibidos. | Lógico | Sim |
| Tamanho das imagens | Especifica o tamanho das imagens no feed, em porcentagem. Pode ser especificado valores em px, pt, rem, vw ou vh exemplo (2rem). | Letras | 100px |
| Exibir Data de Publicação | Especifica se as datas de publicações das notícias devem ser exibidas. | Lógico | Sim |
| Estilo do Conteúdo | - Padrão: Cria um elemento media. - Cartão: Cria um elemento card. | Lista | Padrão |
| Modo de Exibição | Animado: O componente irá animar a barra de rolagem automaticamente. Barra de Rolagem: O componente irá restringir a área do feed e irá colocar uma barra de rolagem para que o usuário possa navegar pelo feed. Livre: O componente não irá restringir a área do feed. | Lista | Animado |
| Tamanho Máximo dos Itens | Especifica o tamanho dos itens no feed, em porcentagem. Se essa propriedade não for definida, ele irá botar 100% por padrão. Pode ser especificado valores em px, pt, rem, vw ou vh exemplo (2rem). | Letras | 100px |

**OBSERVAÇÕES:**

- Na propriedade \_\_URL \_\_o link informado é um \_\_XML \_\_com o Feed que será carregado pelo componente RSS, o conteúdo XML não pode está na codificação UTF-8.
- O formato do **XML** que o componente **RSS** irá fazer a leitura tem que possuir a tag `<channel>`, senão o mesmo não será carregado pelo Webrun

**Apresentação do Componente no Webrun:**

![](/assets/images/rss-b8f8af1f9917f5264365f1940f982702.png)

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

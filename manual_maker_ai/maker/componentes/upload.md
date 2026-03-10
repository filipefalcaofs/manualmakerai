# Upload

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/upload

# Upload

O componente Upload permite ao usuário enviar arquivos de forma fácil e rápida. Com a sua interface intuitiva e moderna, o processo de upload de arquivos se torna simplificado, permitindo que os arquivos sejam selecionados via *drag-and-drop* na área do componente ou da forma convencional. Seguem os exemplos das imagens 1 e 2.

Após clicar em Upload, o componente transferirá os arquivos para o servidor. Ao final da operação, será exibida uma mensagem de sucesso ou falha, como pode ser visto na imagem 3.

Por padrão os arquivos serão armazenados na pasta *Upload* do contexto da aplicação.

![](/assets/images/componente_upload-6592ef83ea7a0e07ecc883d4658dc1e3.png)

*Imagem 1 - Interface do componente carregado no Webrun.*

![](/assets/images/componente_upload_2-02c318a60d3a30994573cd90ee80113f.png)

*Imagem 2 - Interface do componente com dados para upload.*

![](/assets/images/componente_upload_3-f483bda7fd4efbc088336792a8383840.png)

*Imagem 3 - Interface do componente após envio de arquivos.*

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

**Propriedades específicas do componente Upload:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Modo de Upload | Especifica se o componente permite o upload de somente um arquivo ou múltiplos arquivos. | Lista | Múltiplo |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao Anexar | Executado quando um usuário anexa um arquivo ao componente. O retorno do fluxo associado a esse evento, deve retornar um valor lógico indicando se o usuário pode enviar os arquivos ou não. | 1. Lista de lista contendo: 1) Nome do Arquivo; 2) Tamanho do Arquivo; 3) Tipo do Arquivo |
| Ao Enviar | Executado após o usuário enviar os arquivos. | 1. Lista contendo os caminhos dos arquivos enviados. |

### Observações:

- `Evento Ao Anexar`: O Fluxo associado ao evento deve ser da **camada cliente** e receberá automaticamente como argumento uma lista de lista contendo informações sobre o(s) arquivo(s) anexado(s), caso identificado pelo navegador. O fluxo deve retornar o valor lógico *(true ou false)* indicando se o upload deve ser permitido ou não.
- `Evento Ao Enviar`: O Fluxo associado ao evento deve ser da **camada servidor** e receberá automaticamente como argumento uma lista contendo o(s) caminho(s) para o(s) arquivo(s).

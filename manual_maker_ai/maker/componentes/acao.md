# Ação

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/acao

# Ação

Componente desenvolvido para exercer funções predefinidas, sem a necessidade de criação de regras.

![](/assets/images/comp3-213d69a0ade3cd3279906edb31a46077.jpg)

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

**Propriedades específicas do componente Ação:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Ação Pré-Definida | Define qual ação pré-definida será executada ao clicar no componente. Veja os valores possíveis para essa propriedade abaixo dessa tabela. | Lista | Usuários |
| Imagem | Determina a imagem que será utilizada no componente. | Imagem | image.png |
| Imagem Ao Clicar | Determina qual imagem será utilizada, ao executar o evento ao clicar. | Imagem | image\_click.png |
| Imagem Ao Passar o Mouse | Determina qual imagem será utilizado ao passar o mouse sobre o componente. | Imagem | image\_hover.png |
| URL Imagem | Propriedade com a mesma característica da propriedade imagem, só que com a possibilidade de informar o caminho da imagem. | Letras | <https://example.com/image.png> |
| URL Imagem Ao Clicar | Propriedade com a mesma característica da propriedade Imagem Ao Clicar, só que com a possibilidade de informar o caminho da imagem. | Letras | <https://example.com/image_click.png> |
| URL Ao Passar o Mouse | Propriedade com a mesma característica da propriedade Imagem Ao Passar o Mouse, só que com a possibilidade de informar o caminho da imagem. | Letras | <https://example.com/image_hover.png> |
| Modo de Exibição da Imagem | Define o modo de exibição da imagem. - Ajustar Imagem: A imagem será redimensionada para ajustar a área do componente. - Centralizado: A imagem não é redimensionada, mas centralizada na área do componente. | Lista | Ajustar Imagem |
| Acessível | Torna o componente acessível ou não no formulário quando não está em modo de edição/inclusão. | Lista | Todos os modos |

**Ações Pré-Definidas:**

| Ação Pré-Definida | Descrição |
| --- | --- |
| Configurar Conexões Adicionais | Ao selecionar esta propriedade, o componente ação abrirá o formulário de conexões adicionais. |
| Grupos | Ao selecionar esta propriedade, o componente ação abrirá o formulário de grupos. |
| Usuários | Ao selecionar esta propriedade, o componente ação abrirá o formulário de Usuários. |
| LOG | Ao selecionar esta propriedade, o componente ação abrirá o formulário de LOG. |
| Alteração de Senha | Ao selecionar esta propriedade, o componente ação abrirá o formulário de Alteração de Senha. |
| Executar Script SQL | Ao selecionar esta propriedade, o componente ação abrirá o formulário Executar Script SQL. |
| Recarregar Sistema | Ao selecionar esta propriedade, o componente ação executará a função do botão recarregar sistema. |
| Modo Normal | Ao selecionar esta propriedade, o componente ação fará com que o projeto entre em modo Normal. |
| Modo Gerente | Ao selecionar esta propriedade, o componente ação fará com que o projeto entre em modo Gerente. |
| Modo Projeto | Ao selecionar esta propriedade, o componente ação fará com que o projeto entre em modo Projeto. |
| Alterar Usuário | Ao selecionar esta propriedade, o componente ação fará logoff do sistema para executar o login com outro usuário. |
| Sair | Ao selecionar esta propriedade, o componente ação fará logoff do sistema. |
| Modo de Inserção | Ao selecionar esta propriedade, o componente ação entrará em modo de inserção no formulário corrente. |
| Modo de Alteração | Ao selecionar esta propriedade, o componente ação entrará em modo de alteração no formulário corrente. |
| Excluir | Ao selecionar esta propriedade, o componente ação excluirá o registro corrente. |
| Gravar | Ao selecionar esta propriedade, o componente ação gravará o registro corrente. |
| Gravar + | Ao selecionar esta propriedade, o componente ação irá gravar mais de um registro simultaneamente. |
| Cancelar | Ao selecionar esta propriedade, o componente ação irá cancelar as alterações efetuadas no formulário corrente. |
| Próximo Registro | Ao selecionar esta propriedade, o componente ação irá para o próximo registro do formulário corrente. |
| Registro Anterior | Ao selecionar esta propriedade, o componente ação irá para o registro anterior do formulário corrente. |
| Último Registro | Ao selecionar esta propriedade, o componente ação irá para o último registro do formulário corrente. |

**Eventos:**

| Evento | Descrição | Parâmetros Automáticos |
| --- | --- | --- |
| Ao Clicar | Executado ao clicar no componente. | - |

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

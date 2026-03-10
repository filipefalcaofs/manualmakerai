# Tabela

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/tabela

# Tabela

O componente tabela permite que os dados sejam representados em formato "Grade" com linhas e colunas. Os dados são definidos através de uma consulta SQL.

![image123.gif](/assets/images/Tabela-0f4df7177944d692d65d9995116bec16.png)

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

**Propriedades específicas do componente Tabela:**

| Lógico | Sim | Tipo | Exemplo |
| --- | --- | --- | --- |
| Propriedade SQL | Nesta propriedade será informado o SQL da Tabela que montará a grade. Ao abrir o assistente SQL, escolha a(s) tabela(s) e colunas que serão listadas no componente. A partir do Maker 3.8, caso o tipo da coluna seja "Lógico", o componente criará automaticamente um "CheckBox". O mesmo vale para o tipo "Binário" e relacionados, uma imagem será criada para renderização do conteúdo. A partir da versão 3.9, é possível definir o tipo da coluna tais como: Caixa de Texto, Lista Dinâmica, Lista, Botão ou Imagem. | SQL | SELECT \* FROM tabela\_teste |
| Paginação | Permite escolher a quantidade de itens que serão listados na grade do componente. Ao definir a quantidade de itens a listar, a grade criará setas de rolagem para as páginas. | Inteiro | 3 |
| Cabeçalho | Essa propriedade tem como finalidade criar o cabeçalho das colunas da tabela. | Indefinido | - |
| Ativar Pesquisa | Essa propriedade permite mostrar/ocultar a opção da pesquisa que se localiza acima da tabela. Vem setado como "Sim" por Default. | Lógico | Sim |
| Acessível Todos os Modos | Essa propriedade tem como finalidade definir se o componente ficará acessível ou não nos modos de alteração e/ou inclusão. | Lógico | Sim |
| Fonte de Dados | Propriedade destinada a conexão ao banco de dados. | Conexão | - |
| Permitir Inclusão | Propriedade que permite a inclusão de registros através do componente. | Lógico | Sim |
| Permitir Edição | Propriedade que permite a edição do registro selecionados. | Lógico | Sim |
| Permirtir Exclusão | Permite a exclusão dos registros selecionados através do componente. | Lógico | Sim |
| Coluna Chave | Na versão 3.8, Determina a coluna cujo registro irá filtrar o formulário referenciado na propriedade "Formulário". A partir da versão 3.9, determina a coluna que será utilizada para atualização ou exclusão do registro. | Lista | Id |
| Agrupamento | Habilita o agrupamento de colunas em tempo de execução. | Lógico | Sim |
| Coluna Sumário | Coluna que será utilizada como sumário de acordo com a propriedade "Operação". Ex.: Soma, Média, etc. | Lista | Id |
| Alinhamento Sumário | Determina a posição em que a coluna sumário será apresentada. | Lista | Centro |
| Resumo Geral Sumário | Habilita o resumo de todos agrupamentos do sumário. | Lógico | Não |
| Exibir Quantidade de Registros Sumário | Determina se a quantidade de registros da coluna sumário será exibida. | Lógico | Não |
| Operação | Determina qual operação será aplicada à coluna sumário. Ex.: Soma, Média, etc. | Lista | Soma |
| Tabela Principal | Por características do driver JDBC da Oracle, não é possível identificar o nome da Tabela através do Metadados de uma consulta. Devido a esta característica, esta propriedade ser torna obrigatória em projetos Oracle (ou quando utilizado conexão adicional para bancos de dados Oracle). Esta propriedade é utilizada para compor os scripts de INSERT, UPDATE e DELETE através do componente Tabela. (Obs.: Para outros bancos essa propriedade não se torna obrigatória, pois o driver JDBC de cada banco permite obter esta informação automaticamente). | Indefinido | - |
| Texto do Resumo | Texto que irá identificar o resumo no agrupamento. | Letras | "Texto do Resumo" |
| Cor Condicional | Determina a cor da linha caso a condição definida seja verdadeira. A cor é aplicada a linha como um todo. | Letras | - |
| Desabilitar Linhas | Essa propriedade irá desabilitar a linha de acordo com a condição determinada. | Lógico | Não |
| Auto-Ajuste do Conteúdo | A altura da linha será ajustada automaticamente caso o tamanho do conteúdo ultrapasse a largura definida na coluna. | Lógico | Não |
| Altura da Linha | Determina a altura das linhas do componente (Essa propriedade será ignorada caso a propriedade "Auto-Ajuste do Conteúdo" esteja habilitada). | Inteiro | 16 |
| Mensagem Quando Vazia | Mensagem que será exibida caso a tabela não possua registros. | Letras | "Mensagem quando vazia" |
| Ativar Pesquisa | Propriedade que permite habilitar a pesquisa no componente. A pesquisa é realizada seguindo o padrão CONTENDO (LIKE) e é aplicada à coluna em questão. | Lógico | Sim |
| Seleção de Múltiplas Linhas | Propriedade que permite o usuário selecionar uma ou mais linhas. | Lógico | Sim |

### Eventos do Componente

\*\*

O componente Tabela possui os seguintes eventos:

\*\*

![](data:image/png;base64,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)

- **Ao Clicar:** Este evento executará o fluxo informado quando for efetuado um clique na linha do componente.
- **Ao Duplo Clique:** O evento será executado ao realizar o duplo clique na linha do componente.
- **Ao Modificar:** O evento será executado ao modificar a seleção de linha do componente.
- **Ao Modificar Consulta:** O evento será executado a consulta do componente for modificada. Ex.: Ao realizar um filtro, mover a barra de rolagem (Será passado a consulta modificada como parâmetro automático).

O componente Tabela tem algumas restrições e observações de acordo com o auto relacionamento de algumas propriedades segue abaixo uma lista com as mesmas:

- Quando a propriedade "Agrupamento" for habilitada, a propriedade "Pesquisa" será ignorada dando prioridade a propriedade "Agrupamento".
- A propriedade "Paginação" será ignorada quando a propriedade "Agrupamento" for habilitada. O componente assumirá a paginação de "100" registros automaticamente.
- Caso seja inserido no componente uma consulta que contenha valores nulos e agrupar pelo mesmo, o mau comportamento do componente pode ocorrer.
- A propriedade "Alinhamento Sumário" só terá funcionalidade caso uma das propriedades "Coluna Sumário" ou "Exibir Quantidade de Registros".
- A propriedade "Resumo Geral Sumário" só irá funcionar corretamente se pelo menos umas das propriedades "Coluna Sumário" ou "Exibir Quantidade de Registros" estiverem habilitadas.
- Quando a propriedade "Operação" for definida é necessário que a propriedade Coluna Sumário esteja ativa, caso contrario a mesma não terá funcionalidade.

# Mudanças no componente Tabela para o Maker 3.9

O componente Tabela, na versão 3.9, foi reestruturado para suporte a edição direto no componente. Com isso, diversas melhorias foram realizadas para melhor atendimento a usabilidade e funcionalidades do componente.

Entre as melhorias realizadas destacamos:

![](/assets/images/TabelaEditando-dd4f9a6c7393cc9dcad33f329a933a0e.png)

- As colunas podem ser do tipo: Lista, Lista Dinâmica, Botão, Imagem ou Caixa de Texto.

  ![](/assets/images/TabelaCrudInterfaceTipo-8b0486967b55ffebe2b484fda2a5605c.png)
- Suporte a eventos nas colunas (Em modo de Inclusão ou Edição) de acordo com o tipo.

  ![](/assets/images/TabelaCRUDInterfaceEventosCampos-06e58b9990568c3800ff288dad5ca1f4.png)
- Suporte aos eventos Antes de Alterar, Antes de Inserir, Antes de Excluir, Depois de Alterar, Depois de Inserir e Depois de Excluir.

  ![](/assets/images/TabelaCRUDEventos-73dee73908cf6d16cc0e5626244ec6b3.png)
- A edição do cabeçalho foi reestruturada:

  ![](/assets/images/TabelaCRUDInterface-1cdfbd21ca659afb2bed23747435d2a7.png)

  - **Formatação (Máscara):** Permite aplicar uma máscara na coluna selecionada.
  - **Tipo:** Define o tipo do componente que será usado ao editar ou incluir um registro.
  - **Ordenação:** Permite selecionar a ordem de exibição das colunas.
  - **Criar Cabeçalho:** Permite criar o cabeçalho automaticamente a partir da consulta definida na propriedade SQL (Obs.: esta opção substituirá o cabeçalho existente).
  - **Eventos:** Define o evento que será executado nas colunas (Em modo de Inclusão ou Edição) de acordo com o tipo.
  - **Fluxos:** Define o fluxo que será executado no evento selecionado anteriormente.
  - **Lista de Parâmetros:** Serão exibidos os parâmetros de entrada do fluxo selecionado anteriormente.
  - **Configuração das Listas:** Define o SQL para criação da lista Dinâmica ou valores para criação da Lista.

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

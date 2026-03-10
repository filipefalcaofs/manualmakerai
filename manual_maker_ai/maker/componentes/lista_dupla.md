# Lista Dupla

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/lista_dupla

# Lista Dupla

![image165.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAVCAYAAABVAo5cAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAABUSURBVEhLY7S2tv7PQEfABKXpBkYtpDrASDTd3d1QFiYoLS1FkUfnowOQPDoYjUMMAAomGCYHkGwhKM5gmBwwGocYYDQOCQG6WzhaH1IdDHcLGRgA7+EgOJaa8jcAAAAASUVORK5CYII=)

O componente Lista Dupla é utilizado para suporte à relação de muitos para muitos entre tabelas. Devem ser envolvidas no processo de configuração do componente três tabelas: duas contendo identificadores únicos (chaves primárias) e uma terceira armazenando a relação das duas anteriores por meio de seus identificadores (chaves estrangeiras).

Neste componente é possível selecionar um ou mais registros ao mesmo tempo para serem inseridos na tabela que relaciona as tabelas que contêm os identificadores únicos.

O componente só é manipulável se o formulário estiver em modo de inserção ou alteração:

![image321.jpg](/assets/images/image166-72f60e25dda3ae3dceb1aaaeb661ca66.png)

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

**Propriedades específicas do componentes Lista Dupla:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Adicionar Item | Ao selecionar a opção Não, o botão > ficará invisível. O botão > é utilizado para a retirada de um registro que está contido na área esquerda do componente (disponível) e, em seguida, inclusão do mesmo registro na área direita do componente (selecionado). Por padrão, esta propriedade vem configurada como Sim. | Lógico | Sim |
| Adicionar Todos | Ao selecionar a opção Não, o botão >> ficará invisível. O botão >> é utilizado para a retirada de vários registros que estão contidos na área esquerda do componente (disponíveis) e, em seguida, inclusão dos mesmos registros na área direita do componente (selecionados). Por padrão, esta propriedade vem configurada como Sim. | Lógico | Sim |
| Campo-Chave Principal | Esta propriedade representa o campo-chave (identificador único) selecionado durante a configuração da propriedade SQL Principal, o qual identifica a tabela que se quer relacionar com a tabela associada ao formulário no qual está contido o componente. | Letras | usuario\_id |
| Campo-Chave Selecionados | Esta propriedade representa o campo ao qual será atribuído o código do registro que é selecionado na área esquerda do componente. | Letras | usuario\_email |
| Campo Lista Principal | Exibe a descrição do campo-chave selecionado na propriedade Campo-Chave Principal. | Letras | usuario\_nome |
| Campo Lista Selecionados | Exibe a descrição do campo-chave selecionado na propriedade Campo-Chave Selecionados. Normalmente é feita uma junção entre a tabela que contém os registros que aparecem na área esquerda do componente (registros disponíveis) e a tabela que relaciona as tabelas do formulário e dos registros disponíveis para projetar o campo da descrição do registro selecionado. | Letras | usuario\_nome |
| Descrição Principal | Descrição que identifica a área dos registros que estão disponíveis para seleção. | Letras | Principal |
| Descrição Selecionados | Descrição que identifica a área dos registros que foram selecionados e estão relacionados com o registro corrente no formulário. | Letras | Selecionados |
| Duplo Clique | Selecionando a opção: Sim - após a efetuação de clique duplo sobre um registro que esteja na área esquerda do componente (registro disponível), este passará para a área direita do componente (registro selecionado); Não - um registro que esteja na área esquerda do componente (registro disponível) só poderá passar para a área direita do componente (registro selecionado) através dos botões de seleção posicionados entre a área esquerda e direita do componente. | Lógico | Sim |
| Fonte Descrição Principal | Utilizada para edição da fonte contida na expressão definida para a propriedade Descrição Principal. Esta propriedade é idêntica à propriedade Fonte. | Letras | Tahoma,8,0000,clWindowText |
| Fonte Descrição Selecionados | Utilizada para edição da fonte contida na expressão definida para a propriedade Descrição Selecionados. É semelhante à propriedade Fonte. | Letras | Tahoma,8,0000,clWindowText |
| Parâmetro Principal | Esta propriedade identifica a relação entre os registros da área Principal do componente Lista Dupla com o formulário principal ou com outros componentes. Caso se queira filtrar os dados da área esquerda do componente, deve ser relacionado um (ou mais) campo da tabela associada ao formulário a um (ou mais) campo correspondente na tabela que contém os registros que poderão ser selecionados. Esta propriedade é idêntica à propriedade Parâmetros. | Letras | nwa\_gri\_id = nwb\_gri\_id |
| Remover Item | Ao selecionar a opção Não, o botão `<` ficará invisível. O botão `<` é utilizado para a retirada de um registro que estava contido na área direita do componente (selecionado) e, em seguida, inclusão do mesmo registro na área direita do componente (disponível). Por padrão, esta propriedade vem configurada como Sim. | Lógico | Sim |
| Remover Todos | Ao selecionar a opção Não, o botão `<<` ficará invisível. O botão ````` <<````<< ````` é utilizado para a retirada de vários registros que estavam contidos na área direita do componente (selecionados) e, em seguida, inclusão dos mesmos registros na área esquerda do componente (disponíveis). Por padrão, esta propriedade vem configurada como Sim. | Lógico | Sim |
| SQL Principal | Consulta que contém a tabela que se quer relacionar com a tabela associada ao formulário no qual está contido o componente. Esta propriedade tem o mesmo comportamento da propriedade SQL. | SQL | SELECT \* FROM tablea\_principal |
| SQL Selecionados | Consulta que contém a tabela que possui os campos que relacionam registros da tabela associada ao formulário e a tabela selecionada na consulta da propriedade SQL Principal (registros disponíveis). Esta propriedade tem o mesmo comportamento da propriedade SQL. | SQL | SELECT \* FROM tabela\_selecionados |

Observações:

1. O componente Lista Dupla não suporta a utilização de chave composta
2. Não é possível selecionar uma conexão adicional a este componente.
3. Este componente não registra Log, ou seja, não aparecerá nos Logs do webrun as ações de inserções, alterações ou deleções deste componente (Lista Dupla).
4. O número de vezes que o evento será executado está relacionado em quantos registros foram selecionados para inserção ou remoção ao mesmo tempo;
5. Todo fluxo de ação, uma vez vinculado a qualquer um dos eventos do componente Lista Dupla, recebe dois parâmetros automáticos. Para que esses parâmetros sejam obtidos corretamente pelo fluxo de ação, quando executados no Webrun, é necessária a criação de dois Parâmetros de Entrada: o primeiro parâmetro pode ser chamado de Campo Chave (nome opcional - correspondendo ao código do registro (ou registros) que participará do evento); e o segundo parâmetro pode ser chamado de Campo Lista (nome opcional - correspondendo à descrição do registro (ou registros) que participará do evento).
6. Caso um registro (nome do registro) contido na área direita ou esquerda do componente exceda a largura de uma das áreas, basta posicionar o ponteiro do mouse sobre o registro para que apareça um hint (dica) demonstrado o nome completo do registro.
7. Este recurso está disponível apenas para a versão Enterprise.
8. O hint (Dica) só será exibido ao passar o mouse sobre a moldura que envolve o componente.

Acesse o exemplo [Utilizando o componente Lista Dupla](/docs/dicas-e-truques/componente/utilizando_o_componente_lista_dupla_).

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Antes de Adicionar Item | O evento ocorre entre o momento que o usuário clica sobre o botão direita.png para adicionar o registro selecionado na área Principal para a área Selecionados. | Campo Id e Campo Descrição |
| Antes de Remover Item | O evento ocorre entre o momento em que o usuário clica sobre o botão esquerda.png para retirada de um registro selecionado na área Selecionados para a área Principal. | Campo Id e Campo Descrição |
| Antes de Remover Todos | O evento ocorre entre o momento em que o usuário clica sobre o botão esquerda2.png para mover todos os registros contidos na área Selecionados para área Principal. | - |
| Depois de Adicionar Item | O evento ocorre após o momento que o usuário clica sobre o botão direita.png (Adicionar item). | Campo Id e Campo Descrição |
| Depois de Adicionar Todos | O evento ocorre após o momento em que o usuário clica sobre o botão direita2.png (Adicionar todos). | - |
| Depois de Remover Item | O evento ocorre após o momento em que o usuário clica sobre o botão esquerda.png (Remover item). | Campo Id e Campo Descrição |
| Depois de Remover Todos | O evento ocorre apóse o momento que o usuário clica sobre o botão esquerda2.png (Remover todos). | - |
| Ao Duplo Clicar | O evento ocorre no momento em que o usuário efetua um Duplo-Clique sobre qualquer registro contido na área esquerda ou direita do componente. | - |

**Filtros e Seleção Múltipla:**

É possível selecionar múltiplos itens da lista, através da combinação CTRL + clique. O utilizador pode também filtrar os resultados realizando uma busca no campo de filtro. Assim, poderá incluir um novo item a sua lista de seleção ou iniciar uma nova lista de seleção se apenas fizer um clique, sem utilizar o control.

![](/assets/images/lista_dupla_filtros_e_selecao_multipla-1e01210762d378c504926175c3bc37e7.png)

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

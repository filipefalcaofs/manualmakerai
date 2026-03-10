# Lista Dinâmica

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/lista_dinamica

# Lista Dinâmica

![image148.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAIAAAACtmMCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACoSURBVEhL5ZRLDsIwDEQDyq1yrpwiV86CkcbQCn+kGi8QvEXqVO50pq5yG2O0OnrvdymL2HsXK4JfVVxrSWVxzDruA3NOrOc23nnjskeqYAWmiUxqinrkJ0OD2mZekU61X3syca6YLleF+dWJnsnZwUepieyfuB6B7gYvdyjQoKMcivr5IDgxG/KpPdwTl6Fkc4VIUaqQgsmQ4H3/6dFVTFP/P36/YmsPV3hI3scyucoAAAAASUVORK5CYII=)

A Lista Dinâmica é um componente que permite ao usuário visualizar uma lista de dados proveniente de uma determinada tabela, que não é a tabela principal do formulário atual. Quando a informação é selecionada desta lista, o dado é gravado em um campo correspondente da tabela principal.

Podemos configurar a Lista Dinâmica para consultas e informações de tabelas existentes no sistema. Para isso, utilizamos as propriedades Campo, Descrição, SQL, Campo-Chave, Campo Lista e as demais propriedades, se assim for necessário.

**Propriedades em comum:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Altura | Define a altura do componente. | Inteiro | 250 |
| Código | Informa o código gerado pelo Maker ao qual o componente/formulário foi associado. De forma geral, não interfere nas características do componente. | Inteiro | 5 |
| Container | Informa em qual container o componente irá ser inserido. | Indefinido | - |
| Dica | Armazena uma dica para o componente, o qual se torna acessível no modo de inserção ou alteração. | Letras | "Digite o CPF do cliente" |
| Habilitado | Torna o componente possível ser editado ou manipulado. | Lógico | Sim |
| PosiçãoX e PosiçãoY | O "X" determina a posição do componente em relação à esquerda do formulário, e o "Y" em relação ao topo. | Inteiro | 100 |
| Tabulação | Indica a ordem de tabulação do componente em relação aos outros que compõem a aba do formulário na qual está posto. Essa ordem pode ser observada quando o usuário altera o estado do formulário/grade para o modo de inclusão ou edição e navega entre os componentes/campos usando a tecla Tab. | Inteiro | 2 |
| Tabular | Selecionando a opção Sim, quando o usuário estiver navegando entre os componentes, como foi descrito no item anterior, o componente receberá foco (observada a ordem de tabulação). | Lógico | Sim |
| Tamanho | Aplicado a todos - determina a largura do componente ou formulário. | Inteiro | 100 |
| Visível | Aplicada a todos os componentes, com exceção da Moldura e do objeto formulário - Selecionando a opção Sim, o componente aparece no formulário. | Lógico | Sim |
| Nome | Aplicada a todos os componentes e para o objeto formulário - apresenta o nome do componente. O Maker sugere um nome diferente dos nomes dos componentes existentes no formulário para evitar que mais de um componente possua o mesmo nome. | Letras | "Tabela de Consumidores" |
| Descrição | Aplicada a todos os componentes exceto para os componentes Árvore, Grade, Moldura, Imagem e para o objeto formulário - É a legenda que aparece sobre o componente para identificar (resumidamente) qual a sua função. Observação: Ao selecionar um determinado campo o Maker irá sugerir uma descrição obtida no dicionários de dados, caso o usuário deseje deixar o campo da descrição em branco basta apagá-lo e clicar fora do componente. | Letras | "Insira aqui a idade do consumidor" |

**Propriedades específicas do componente Lista Dinâmica:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| SQL Feriado | Permite fazer uma consulta SQL para mostrar os feriados. | SQL | SELECT \* FROM tabela\_feriados |
| Campo Data | Seleciona o campo que vai receber a data do SQL Feriado. | Data | 21/04/2020 |
| Campo Descrição | Seleciona o campo que vai conter a descrição do SQL Feriado. | Letras | data\_feriado |
| SQL Atividade | Permite fazer uma consulta SQL para mostrar as atividades agendadas. | SQL | SELECT \* FROM tabela\_atividades |
| Campo Data Início | Seleciona o campo que vai receber a data inicial do SQL Atividade. | Letras | data\_inicio |
| Campo Data Fim | Seleciona o campo que vai receber a data final do SQL Atividade. | Letras | data\_fim |
| Campo Descrição | Seleciona o campo que vai receber a descrição do SQL Atividade. | Letras | ati\_descricao |
| Exibir Números dos Dias | Exibe os números do dias em certas partes do calendário. | Lógico | Sim |
| Botão Avançar Para Dia Atual | Avança para o dia atual no Calendário. | Lógico | Sim |
| Exibir Mês e Ano Atual | Exibe título do calendário, determinando mês e ano atual. | Lógico | Sim |
| Destacar Horário Comercial | Destaca no calendário, o horário de comercial. (Segunda à Sexta, das 9am - 5pm). | Lógico | Sim |
| Modo de Visualização | Define o modo de visualização do calendário. - Mês: Visualização padrão de um calendário, exibindo todos itens do mês. - Semana: Visualização dos dias da semana. - Dia: Visualização das horas do dia. Observação: O usuário poderá alterar a visualização pela barra de navegação do calendário, essa propriedade define qual vai ser o modo de visualização inicial. | Lista | Mês |
| Permitir Alterar Modo de Visualização | Permite alterar o modo de visualização do calendário. | Lógico | Sim |
| Menu de Contexto | Define se poderá ser aberto o Menu de Contexto no calendário ao pressionar o botão direito. | Lógico | Sim |
| Permitir Inclusão | Possibilita inserir dados na consulta SQL através do formulário que o mesmo está. | Lógico | Sim |

**Eventos do componente Lista Dinâmica:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao Clicar | Executa ao clicar no componente. | - |
| Ao Entrar | Executa ao entrar no componente. | - |
| Ao Modificar | Executa o evento assim que o usuário efetua qualquer modificação no valor contido no componente e também quando navega entre os registros, desde que o valor contido no componente em um registro difira do valor contido no componente para qual o usuário navegar: o próximo registro ou o registro anterior. | - |
| Ao preencher lista | Aplicado ao componente Lista Dinâmica - esta ação deve ser utilizada em conjunto com o método Executar Regra de negócio (tela Ações - usada para associar ações e fluxos aos componentes ou objeto formulário. Na propriedade Nome do método citado, deve ser selecionado um fluxo de ações que retorne uma lista com as opções que poderão ser selecionadas pelo usuário no componente. Após ter sido feita essa configuração, a configuração desenvolvida para as propriedades do componente SQL, CampoChave e CampoLista deverão ser desfeitas. | Constante de controle interno, valor do filtro e tipo do filtro. |
| Ao pressionar tecla | Executa ao pressionar alguma tecla no componente. | Tela Alt, Tecla Ctrl, Tecla Shift, Código da Tecla e Caracter da Tecla. |
| Ao receber dados | Executa ao formulário ser carregado. | - |
| Ao sair | Executa evento assim que o componente perde o foco. | - |

Observações:

1. É comum utilizar a propriedade Formulário para indicar a origem da lista e a propriedades Subformulário, definindo SIM, para permitir a chamada da origem pelo clique no botão ![image127.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAQCAIAAAB7ptM1AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABASURBVDhPY/z//z8DWYAJSpMOQHa2bnwE5REC1f5yUBZEJ5RJIiBsJ7I9yICWdiKDUX+SAgbCn+SneHJ1MjAAAFmbOO3aaUKgAAAAAElFTkSuQmCC) (Exibir formulário de origem);
2. O componente lista dinâmica possibilita a utilização de chave composta. [Saiba como!](/docs/dicas-e-truques/componente/utilizando_o_componente_lista_dinamica_com_chave_composta)
3. O componente suporta Common Table Expression (CTE (recurso do MSSQL)) apenas para listagem de dados, não sendo possível realizar pesquisa nos registros. Caso deseje utilizar o filtro de pesquisa é necessário criar uma VIEW com o CTE e associar o SELECT desta VIEW ao componente.
4. O componente suporta FUNCTIONS do banco de dados apenas para listagem de dados. Para demais funcionalidades, é necessário que seja criado uma VIEW no banco de dados e posteriormente, associar o SELECT desta view no componente.

A propriedade Campo definirá onde a informação selecionada será guardada. Colocamos o nome de um campo que esteja presente na consulta do SQL criada na tela principal.

A propriedade Descrição definirá o rótulo do campo no formulário.

A propriedade SQL determinará a consulta que proporcionará os dados para o campo. Nesta propriedade, abre-se uma janela para construirmos o código em SQL que será necessário para alimentar a lista apresentada na Lista Dinâmica. Esse SQL é particular desse componente, ou seja, só ocorrerá quando ele for solicitado.

A propriedade Campo Lista exibirá o conteúdo para o campo do formulário, e a propriedade Campo Chave refere-se ao campo que será o relacionamento lógico entre a tabela principal do formulário e a consulta para o campo.

![image53.jpg](/assets/images/image150-25d07e534a44e456a2baaf9b36a28262.png)

*Imagem 1 - Interface do componente Lista dinamica.*

O componente Lista Dinâmica possui algumas funcionalidades que são nativas em modo de execução.

- Quando está editando um campo, em modo de inserção ou alteração, o componente possui controles para facilitar a busca de informações:
- - Os controles ![image128.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAIAAAD9MqGbAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC3SURBVDhPY+jZeIUMNHPmTIb/ZIFXn/8T0Pnrz9+vP35DOUiAgM73X34uPHBn9bEHUD4SwKfz6duvE7ZcA3pp2eF7UCEkgFPn9Scf4IFBgs79V57DtRGrExgeW88+RtaGW+d3FJ1otkEQdp1H28nW2Y/uT0zNJITQxQfvyNQJBA9ff4FEJi6dt9elY9cJBK8/fp+24wZuO9/j1AkEkNRHmmvhAJjcyUnxeABIJyQYSEXk2/n//38A1OPc28eQtXAAAAAASUVORK5CYII=) (iniciando por), ![image129.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAARCAIAAACw+gCQAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADbSURBVDhPY+jaeOw/WYCJAQN8+/n795+/UA5ugEXnhtM3lx29+uHrDygfB8CiEwheffy64OCl5++/QPnYAHadQAB08JLDl68/fQPlYwCcOiFgy9nbB64+hHJQAQGdQHD67rNt5+9ghhlhnUBw9fHrozefQDkwQJROrIAonabKUg7a8lAODBDW6aavhKkNCPDpZGVhDrPU0pcXh/JRAU6dAtwcCfZ68qL8UD4GwK5TjJ871EITqBnKxwow88rXH79+/f4D5eAGWOzkYmcF+hDKwQ0YgXZCmSQBBgYAzjWmBJeALOUAAAAASUVORK5CYII=) (terminando por), ![image130.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAATCAIAAADwLNHcAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACMSURBVDhPY5i88Qx5aCYYgPT/Jwu8+gxCw03/qw9fbz5+ixUBpaCKwACLfqAKIBcPQjaCBvqBAKjiyetPWBGyZiDArp94gEX/r99/Dl1+tPLANawIKAVVBwZY9AMdCeTiQUAFUKVY9X/98WvejovIGpDR4j2XgQqgSmnif5LA4NFPHoLqh5pGHvj/HwBZIz1hDtqHbQAAAABJRU5ErkJggg==) (igual a) e ![image131.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAIAAADQR7l6AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEuSURBVDhPY/gHBh2LT/8nC7z6/J8RqB/I6l52rjzGhAEGVu27JcDDDuUwMLz+8F1dTtBEQxzKRwKvvzAw/P3798+fP2iu2HnyAZQFBudvvQKKAEkoHwkAXcEEov/9g5qJA7CyMJlpSQAZt598gIggA5ARQJ9AeTjA959/7jz5wM3Jeuraiwu3X0NFYQBsBCFXKEjwsTAzARlAt9x6/B4iCAdgI/7+hfJwABEBTgNVUVUZASBCDmYIYAI64S8hV+AHTCBvUGoEEWGBHzABo4NgWOAHREUqfgAKC6ApUB5ZgAmom2DqxA8YP7x///3794V7n6JlMy52FigHFXz7+SfMSQ3KgWSz9+/fP3v2jKLM/v7du+8/fiza+xRqLIkgKcAEbMT375JSUlAxUgEDAwDFFEJSyEcKPwAAAABJRU5ErkJggg==) (contendo), alternam-se ao receber um clique ou, quando combinamos com as teclas CTRL + `<barra de espaço>`, auxiliam para busca de contexto;
  - A Barra de Digitação corresponde ao espaço para entrada do contexto da busca;
  - O botão ![image132.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAIAAAAC64paAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHLSURBVDhPlVK7TgJREF2QpyCPBKICGqP4KEjUBBu1sDB2JsbfsPBD/AI6CxL9ACtjYUNhMKDxGaEgIqCC8lyWBZb1kNkAblaEk5vJ3Llz7rkzd1SBQIBhmKLFDzsUDvd9qs+yCM9ppsgvJN5LL8kCxzfhG/WaWZfF67bR0dFp5GB3UU0bGRrN1uXNW/j5o8jy9aaABScay56HX9laQ8ppNJTJoGULnE4zsuFz7W3OYcEZNWhxReguQzk8zyuQ0zk2lauAue2fcjlMWo0aC86Of5r4KAdptVpNgQwm7LLXYTJoKULAFateJxwicxynQM6XeVi7WU/bXjhtRthipQ5brVaVax4Eysr2sbZmKsfSthdUkdWsg+UUlekzHhJfaDhFCIjfxnNwFjx2WLkyfW+HA/8x8Y1tscLHU4WL6yQ+HGWj8zjFV3UnDMzQfVqmJoPbYV5bGkfbMWEe4UlSVmRCZGbCYjXpsUDDnKz7JsGkU0yYpBxLZKgZHYCJ7E6qDFB2sFHpbN5jw0iRD4C5teL5i0kQBEE6RjaeRHxiUrwPRFHs3g0OmkGvlUJ9IbZaUs3HZxEKDQ5L/koFdXilUnvWh8JJMNivJf+AYX4AvyPkFnkL6U4AAAAASUVORK5CYII=) (Localizar) executa a busca.
- Quando se está editando um campo, em modo de inserção ou alteração, ao pressionar a tecla F5, o formulário declarado na Propriedade Formulário, é aberto. Observe que isso depende também da Propriedade Subformulário definida SIM.
- Além das funcionalidades citadas, também é possível criar um formulário a partir da "Lista Dinâmica". Para isso, devem ser seguidos os seguintes passos:

1. Insira o componente Lista Dinâmica no formulário;
2. Com o duplo clique sobre a componente, abrirá a tela Assistente de Criação de Novo Formulário (nesta tela devem ser feitas as configurações necessárias para a criação do formulário);
3. Salve o novo formulário criado, fechando-o em seguida.

Observação: Concluídos esses passos, as propriedades "Descrição", "SQL", "Campo Chave", "Campo Lista" e "Formulário" serão preenchidas automaticamente.

Todos os componentes possuem Propriedades e Eventos. Para conhecê-los [clique aqui](/docs/maker/propriedades_e_eventos_comum).

#### Atualização da Propriedade Permitir Inclusão

Conforme novidades do \_Maker 5, a propriedade \_*Permitir Inclusão* do componente Lista dinâmica recebeu atualizações. Com isso, surgue apartir das versões com o *Framework Bootstrap 5* uma nova maneira de implementar alterações nesta funcionalidade. Agora através da propriedade chamada "Permitir Inclusão" no próprio componente no formulário é possível habilitar inclusões por meio da interface, buscando facilidade e praticidade no momento da construção dos projetos. Conforme exemplo abaixo:

![Componente lista dinâmica atualização da propriedade](/assets/images/componente_lista_dinamica_propriedade-3cb124cec3b6683a98c9663246fda4c8.png)

*Imagem 2 - Interface do componente Lista dinamica ativando propriedade.*

Sendo assim, para ativar a propriedade basta estar na lista dinâmica em questão e ativar caso necessário, conforme pode ser visto na **imagem 4**. Mas caso a sua versão seja **Maker Studio Bootstrap**, deve seguir o passo a passo abaixo para conseguir utiliza-la.

Propriedade avançada **`ListaDinamica:CODIGO:PermitirInclusao`**:

- Disponível a partir da versão do Webrun Studio - Edição Bootstrap 1.2.0.68 esse recurso habilita a inclusão de dados diretamente no componente Lista Dinâmica.
  Para habilitar esse recurso é necessário na área de trabalho do Maker abrir Propriedades Avançadas e realizar a inserção da propriedade, onde o valor CODIGO deve ser substituido pelo código do componente que terá o recurso habilitado e inserir como argumento o valor true.

![image54.jpg](/assets/images/lista_inclusao-0b959632da9a00606f12d2027109f79a.png)

*Imagem 3 - Interface da Prorpriedade Avançada.*

- Após realizar os procedimentos acima, reinicie o servidor de aplicações e acesse o sistema, abra o formulário com a lista dinâmica e digite alguma informação que não exista na lista.

![image55.jpg](/assets/images/lista_inclusao2-9280a39793c2ccf2654f24d91013ba69.png)

*Imagem 4 - Interface do componente Lista dinamica com prorpriedade a ativa.*

Observações:

1. Ao vincular dados ao componente Lista Dinâmica, os campos "Campo Chave" ou "Campo Lista" deverão ser marcados, pois caso a aba de navegação do formulário esteja hablitada um erro será apresentado.
2. Definindo a lista dinâmica como Apenas Leitura pelo [Modo Gerente](/docs/webrun/trabalhando_modo_gerente) (Webrun), o acesso ao formulário do componente sempre estará habilitado (para Inclusão, Alteração ou Exclusão).
3. Uma vez utilizada uma concatenação (propriedade SQL) para o Campo Lista (propriedade) do componente Lista Dinâmica, não é possível utilizar o filtro de pesquisa disponibilizado pelo próprio componente (em um formulário no Webrun). Para funcionar corretamente, será necessário a definição de um alias para a concatenação e utilizar esse alias na propriedade Campo Lista.
4. Tecla [Enter] - Aplica o filtro informado na lista dinâmica.
5. Na tela de relatório o componente não suporta "UNION" na definição da consulta, caso seja necessário a utilização do recurso "UNION", é necessário definir uma "VIEW".

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

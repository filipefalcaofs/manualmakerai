# Assistente de Banco de Dados

> Fonte: https://manual.softwell.com.br/docs/maker/assistente_banco_dados

# Assistente de Banco de Dados

No Assistente de Banco de Dados, é possível criar ou adicionar novos campos à estrutura de uma tabela (tabela do banco de dados sobre o qual o projeto foi criado) a partir de um formulário.

A tela Assistente de Banco de Dados aparece quando é:

- Criado um novo formulário que não esteja vinculado a uma tabela, então, no momento do salvamento do formulário, aparece a tela Assistente de Banco de Dados sugerindo a criação de uma tabela, a qual será vinculada ao próprio formulário que está sendo editado e de um campo do tipo Autonumeração, chamado Chave Primária, vinculado à tabela que será criada.

Importante:

- Caso não conste nenhum componente no formulário ou conste pelo menos um componente, mas que não tenha sido preenchida a propriedade Descrição, a tela Assistente de Banco de Dados aparecerá apenas para a criação do campo de autonumeração;

  Caso conste pelo menos um componente no formulário e tenha sido preenchida a propriedade Descrição deste componente, então a tela Assistente de Banco de Dados aparecerá sugerindo a criação do campo de autonumeração, além dos demais campos que serão associados aos componentes.
- É adicionado pelo menos um novo componente em um formulário já existente e que esteja vinculado a uma tabela, tendo sido preenchida a propriedade Descrição desse componente. Executado esse passo, então, deve-se clicar com o botão direito do mouse sobre a área em que aparecem as abas do formulário e escolher a opção Criar Tabela.... Em seguida, a tela Assistente de Banco de Dados aparecerá sugerindo a criação de um novo campo, após observar o novo componente contido no formulário.

Na existência de componentes contidos no formulário com a propriedade Descrição idêntica, a tela Assistente de Banco de Dados sugerirá o nome do campo adicionado de um número sequencial, observada a quantidade de componentes que se enquadre na situação.

A primeira visão da tela Assistente de Banco de Dados apresenta:

![image862.jpg](/assets/images/assistente_sql-c4719706c291eecc53fcf56188d09bd7.png)

- Campo Descrição da tabela - apresenta o nome do formulário, que aparecerá na tela "Dicionário de Dados" como a descrição da tabela;
- Campo Nome da tabela - apresenta o nome da tabela que será criada no banco de dados. Esta aparecerá na tela Dicionário de Dados como o nome real da tabela. O nome da tabela está restrito à quantidade de 30 (trinta) caracteres. Após a criação da tabela, não será mais possível alterar o seu nome pela tela Assistente de Banco de Dados;
- Campo Lista de Campos - lista os campos que serão adicionados à tabela no momento de sua criação/edição. Nele constam as colunas:

  - Chave - informa se o campo a ser  criado será campo-chave (primary key) da tabela. Para marcar o campo como campo-chave, deve ser efetuado um clique sobre a tupla posicionada na mesma linha do campo. Executado esse passo, aparecerá a imagem de uma chave na cor dourada na tupla;
  - Descrição (título da coluna na visão somente leitura) ou Nome (título da coluna na visão avançada) - apresenta o conteúdo da propriedade Descrição de um componente contido no formulário, que aparecerá na tela Dicionário de Dados como sendo a descrição do campo da tabela. Para alterar o conteúdo da coluna, basta clicar sobre ela e informar um novo valor;
  - Nome (título da coluna na visão somente leitura) ou Nome Físico (título da coluna na visão avançada) - apresenta o nome real do campo que será criado na tabela e, em seguida, vinculado ao componente contido no formulário. Esse dado aparecerá na tela "Dicionário de Dados" como o nome real do campo da tabela. Para alterar o conteúdo da coluna, basta clicar sobre ela e informar um novo valor;
  - Tipo - informa o tipo do campo que será criado na tabela. Os tipos disponíveis para seleção são Letras, Texto, Inteiro, Numérico, Ponto Flutuante, Data, Data e Hora, Hora, Texto Longo, Binário (Arquivos, Fotos, ...) e Lógico (Verdadeiro/Falso). Para alterar o conteúdo da coluna, basta selecionar um novo tipo;
  - Requerido - informa se o campo a ser criado será identificado como campo obrigatório no momento da gravação de um registro na tabela. Para alterar o conteúdo da coluna, basta clicar sobre ela;
  - Tamanho - informa a quantidade de caracteres que será aceita pelo campo no momento da gravação de um registro na tabela. Para alterar o conteúdo da coluna, basta utilizar as setas de controle contidas nela ou informar manualmente um novo valor;
  - Precisão - informa a quantidade de casas decimais que será aceita pelo campo no momento da gravação de um registro na tabela. Para alterar o conteúdo da coluna, basta utilizar as setas de controle contidas nela ou informar manualmente um novo valor.
- Botão ![avançado](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFEAAAAYCAIAAAANuobFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADKSURBVFhH7ZhRCsQgDETdZS/rFTyA595AZAixFeO69SN5H3YMipmklLavnHNyxrtdPRGefRCefRCepymlNPUguw6NPs9B9a61Hmn1Fj7t+htcBaVRFExRKbmYxUwE9GtMmD3TeXwSjdCXyKRZKyG3Q6uIWoM4ItDz7OkzkutTlAzyG+zazornmbTG5u9Y22XF9gzjnCTIjDWNPLXyP4c9e+7tHlmOO1TJVIQZR3iXlfPfz2RgLfVlDr+TqB4+Q/wn8UF49kF49kBKX673ium/SqaPAAAAAElFTkSuQmCC) - ao clicar neste botão, a tela será modificada e a lista de campos se transformará em uma lista editável, oferecendo a possibilidade de modificação das propriedades dos campos; e para confirmar qualquer modificação feita, é necessário pressionar a tela seta para baixo do teclado:

![image863.jpg](/assets/images/assistente_sql-c4719706c291eecc53fcf56188d09bd7.png)

- Botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAaCAYAAACkVDyJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADFSURBVEhLY3z58t1/BiBoa2sEUTQFVVX1DExQNt3AqIVUB6MWUh2MWogKpLwZKiuTGJIqJzBMmADEScZQCeIB6T4UF2d4ubCAoaCgi2G3eCwDqXaSbuHLSwznn4EYzxjOX3rJIC4hBRYmFgyBRCOux2AI9pQUg6EeMHhfgL1LNCAjSIHBGA9KNGUMri8XM8w7CxUnEpARpC8ZdrSDEg0Qk2obEAzyOHy2laG9fSswfZIPBrkPqQBGLaQ6oLuF8IYwfQADAwCESjKxCb1PNwAAAABJRU5ErkJggg==) - após ter sido selecionado um campo da "lista de campos" e, em seguida, ser efetuado um clique sobre esse botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAaCAYAAACkVDyJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADFSURBVEhLY3z58t1/BiBoa2sEUTQFVVX1DExQNt3AqIVUB6MWUh2MWogKpLwZKiuTGJIqJzBMmADEScZQCeIB6T4UF2d4ubCAoaCgi2G3eCwDqXaSbuHLSwznn4EYzxjOX3rJIC4hBRYmFgyBRCOux2AI9pQUg6EeMHhfgL1LNCAjSIHBGA9KNGUMri8XM8w7CxUnEpARpC8ZdrSDEg0Qk2obEAzyOHy2laG9fSswfZIPBrkPqQBGLaQ6oLuF8IYwfQADAwCESjKxCb1PNwAAAABJRU5ErkJggg==), o campo selecionado se moverá para o topo da "lista de campos";
- Botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAXCAYAAAD+4+QTAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABhSURBVEhLY8zPz//PQGPABKVpCkYtIQmMWkISGGSWSHkzVFYmMSRVTmCYMCEJKkgcIM0n4uIMLxcWMBQUzIMKEAdIs+TlJYbzz6BsEsBIjHgKwGhRTxIYtYQkMFwsYWAAAEj8EIHdDIMUAAAAAElFTkSuQmCC) - após ter sido selecionado um campo da "lista de campos" e, em seguida, ser efetuado um clique sobre esse botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAXCAYAAAD+4+QTAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABhSURBVEhLY8zPz//PQGPABKVpCkYtIQmMWkISGGSWSHkzVFYmMSRVTmCYMCEJKkgcIM0n4uIMLxcWMBQUzIMKEAdIs+TlJYbzz6BsEsBIjHgKwGhRTxIYtYQkMFwsYWAAAEj8EIHdDIMUAAAAAElFTkSuQmCC), o campo selecionado se moverá para o lugar do campo imediatamente anterior ao selecionado na "lista de campos";
- Botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC9SURBVEhL7ZSxCcQwDEV/bokcHiKNZzAEPEOaLBBXgUwQSOUJ0ngGV5nhmgyRQ82tcOcj7qXGnR8YI1Q8S0Zqpmn6oiCPfBejCliqgKW4QDBoCnaZYdo7omPDGq87EMBXoHsYCnDOpRNApofOKQm84E2gboD3Hn4EdrfjlVMS5LtIWSyzwb9TZ3DYhRa2AmWX9PLUlCtiTW0KJ9A+Vc7yiCrQo8fQ5YAObGuE9JvrumapApYqYGmIPgUHDfgBL7A2UhU1nd0AAAAASUVORK5CYII=) - após ter sido selecionado um campo da "lista de campos" e, em seguida, ser efetuado um clique sobre este botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC9SURBVEhL7ZSxCcQwDEV/bokcHiKNZzAEPEOaLBBXgUwQSOUJ0ngGV5nhmgyRQ82tcOcj7qXGnR8YI1Q8S0Zqpmn6oiCPfBejCliqgKW4QDBoCnaZYdo7omPDGq87EMBXoHsYCnDOpRNApofOKQm84E2gboD3Hn4EdrfjlVMS5LtIWSyzwb9TZ3DYhRa2AmWX9PLUlCtiTW0KJ9A+Vc7yiCrQo8fQ5YAObGuE9JvrumapApYqYGmIPgUHDfgBL7A2UhU1nd0AAAAASUVORK5CYII=), o campo selecionado se moverá para o lugar do campo imediatamente posterior ao selecionado na "lista de campos";
- Botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAYCAYAAADpnJ2CAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC7SURBVEhLY3z58t3/trZGBlqDqqp6MM0EJukIRi2kOhi1kOpg1EIUYJw0gWHCBCCu9GbwBrKTjKESJADiLTROYogV383QVVDAULCQgUFPDypOIiDaQmN9PYZLu7YyPANxnm1l2HUJLEwyGLxxePbiJQY9N28GKTDPmAHoYbIA8T48O49h8UtXhjJQopmgz8BAjyA9Ow+YYECJpmAew0WoGKlg8MYhOgD5dt5ZKIcEMHR8SC4YtZDKgIEBAOaBK++ymRVFAAAAAElFTkSuQmCC) - após ter sido selecionado um campo da "lista de campos" e, em seguida, ser efetuado um clique sobre esse botão ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAYCAYAAADpnJ2CAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC7SURBVEhLY3z58t3/trZGBlqDqqp6MM0EJukIRi2kOhi1kOpg1EIUYJw0gWHCBCCu9GbwBrKTjKESJADiLTROYogV383QVVDAULCQgUFPDypOIiDaQmN9PYZLu7YyPANxnm1l2HUJLEwyGLxxePbiJQY9N28GKTDPmAHoYbIA8T48O49h8UtXhjJQopmgz8BAjyA9Ow+YYECJpmAew0WoGKlg8MYhOgD5dt5ZKIcEMHR8SC4YtZDKgIEBAOaBK++ymRVFAAAAAElFTkSuQmCC), o campo selecionado se moverá para o fim da "lista de campos";
- Botão ![ddl](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFEAAAATCAIAAABnfXYGAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABzSURBVFhH7ZexDcAwCARJtmUFBmARFg1KKCxFuINEeq56f3eWbeSDmQkJMzsjIjHOGFTdZxGJRKSqkbb9uqyj9j67w8Pq6UT76tvoONuZ3lfa84ZhMM4YdDhncyjrq/nRfI50U7cXPp/nj4HBOGMwzggQXaWgNvsp07G2AAAAAElFTkSuQmCC) - ao clicar neste botão, aparecerá uma área para edição da linguagem de definição de dados que foi utilizada para a criação/edição da tabela.

Observação: As modificações feitas na aba DDL não se repercutem ao navegar para a aba Avançado ou tela normal.

- ![ignorar](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAAAZCAIAAAD2akRBAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACvSURBVFhH7ZfdDoAgCIWtdekr+iI+gM8d7TDHauvHaInju0hA2jxCNqcYY0opjMvM47i4Qvu4QvsoKMw5s9UlXkP7LDwqITu2lEIunnARrzmIyNmTqWY0FdKCjjJqEMYuB3aNnEw183mXPloiCQPsa9DRd0jCaDsAhzTwk+YJtPeXDSZzdrW683oDX92e0HLs/MpbhbIgsgKdyCP8BmwfV2gfV2if8RVufws2hySEFZU5U2jV0tnJAAAAAElFTkSuQmCC) - ao clicar neste botão, a tela Assistente de banco de dados fechará, e as sugestões de criação da tabela e de campos para a tabela serão desconsideradas;
- ![executar](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAAAZCAIAAAD2akRBAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADRSURBVFhH7ZdRDoQgDERxs59clCtwAM5t12kaYpEFlEQI70OHsQiDEuNmrTVTsznnWE7Kh8/zshKOz0o4PvMnbPlaeO9ZHYQQWL2SxoSdUvW489qHxcirGwuAJsFtVUlo81d3EDehq/jyuRIZ7OqlogK5BK0d6BPi6+KrLnkaE+rByKGpQMBBM0nJXDPdq+i4DymGwFYxeG6ArVae3IeYkF77v44ueJC7+5BILnMcFQUZ5yToKM595v8/rE6YXFpaclbvY/3jj89KOD4r4egYswOGiHxM+kWazAAAAABJRU5ErkJggg==) - ao clicar neste botão, as sugestões de criação da tabela e de campos para a tabela serão executadas;
- ![cancelar](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAXCAIAAAAjok4PAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADOSURBVFhH7ZdBDsQgCEXpZJZe0Yt4AM89JBhC1DZKmUSJb+MvtZQPTZteIYQYIzjlU1anHHs7c+ztjHN7yg9DSqkogJxzURZgZsOEmulRBYy0uhoGDyc6LGo9vmW1gMdIhmnIFOQWVHuQNkK02ViPY2lPVsw1ScGHDxHSSBuXZwf5y/SYh4Jk9SQq7uJTmNmTvZ+qrNsCdbYKg1eL7vbtVW9s3KGZHvZVlkJtroJd5J72KooQI9lGcP6/N22v21TZ+KU4f+s7c+ztjGt7AD9aQnWjAuDhJQAAAABJRU5ErkJggg==) - ao clicar neste botão, todas as atividades que estiverem sendo executadas serão canceladas e a tela fechará automaticamente.

Os tipos de dados sugeridos para cada campo que será criado se baseiam no tipo de componente:

- Imagem - Se houver este componente no formulário, por exemplo, o "Assistente de Banco de Dados" sugerirá que o campo que será criado seja do tipo "Imagem";
- No caso do componente Caixa de Texto:

  - Referente à largura definida para o componente - baseando-se na largura definida para o componente, à medida que se aumenta ou diminui essa largura aparece um hint (informativo) alertando a quantidade de caracteres que será associada ao tipo de dado;
  - Clicando com o botão direito do mouse no componente, a propriedade Conteúdo sugere a criação de um campo do tipo Texto (opção "Livre", "Maiúsculas" ou "Minúsculas"), Numérico (opção "Número"), Data (opção "Data") ou Número Fracionário (opção "Número com 2 Casas Decimais").

Tipos de dados sugeridos pelo Assistente de Banco de Dados:

- Banco de dados POSTGRESQL:

  - Autoincremento: inteiro;
  - Hora: time;
  - Data e Hora: timestamp;
  - Letras: varchar;
  - Inteiro: integer;
  - Numérico: numeric com duas casas decimais;
  - Ponto Flutuante: Float8;
  - Data: date;
  - Binário: bytea;
  - Texto Longo: text;
  - Lógico: bool.
- Banco de dados ORACLE:

  - Autoincremento: number;
  - Hora: date;
  - Data e hora: date;
  - Letras: varchar2;
  - Inteiro: number;
  - Numérico: number com duas casas decimais;
  - Ponto flutuante: Float;
  - Data: date;
  - Bináro: blob;
  - Texto Longo: clob;
  - Lógico: number.
- Banco de dados FIREBIRD:

  - Autoincremento: inteiro;
  - Hora: time;
  - Data e Hora: timestamp;
  - Letras: varchar;
  - Inteiro: integer;
  - Numérico: numeric com duas casas decimais;
  - Ponto Flutuante: Float;
  - Data: date;
  - Binário: blob;
  - Texto Longo: blob sub\_type 1;
  - Lógico: smallint.
- Banco de dados MySQL:

  - Autoincremento: bigint auto\_increment
  - Hora: time;
  - Data e Hora: timestamp;
  - Letras: varchar;
  - Inteiro: bigint;
  - Numérico: decimal com duas casas decimais;
  - Ponto Flutuante: Float;
  - Data: date;
  - Binário: longblob;
  - Texto Longo: longtext;
  - Lógico: boolean.
- Banco de dados SQL SERVER:

  - Autoincremento: identity;
  - Hora: DATETIME;
  - Data e Hora: datetime;
  - Letras: varchar;
  - Inteiro: integer;
  - Numérico: numeric com duas casas decimais;
  - Ponto Flutuante: Float;
  - Data: datetime;
  - Binário: varbinary (MAX);;
  - Texto Longo: varchar (MAX);
  - Lógico: bit.
- SQL Server 2005:

  - Autonumeracão = integer;
  - Letras = varchar;
  - Texto = varchar;
  - Inteiro = integer;
  - Numérico = numeric(9,2);
  - Ponto flutuante = float;
  - Data = datetime;
  - Data e hora = datetime;
  - Hora = char(8);
  - Texto longo = text;
  - Binário = image;
  - Lógico = bit.
- SQL Server 2008:

  - Autonumeracao = integer;
  - Letras = varchar;
  - Texto = varchar;
  - Inteiro = integer;
  - Numérico = numeric(9,2);
  - Ponto flutuante = float;
  - Data = datetime;
  - Data e hora = datetime;
  - Hora = datetime;
  - Texto longo = varchar(max);
  - Binário = varbinary(max);
  - Lógico = bit.

Observações:

1. O Assistente de Banco de dados não suporta campos do tipo UUID e GUID.
2. O Assistente de criação de tabelas só suporta nomes de objetos do banco de dados com no máximo 30 caracteres.
3. Ao clicar com o botão direito do mouse sobre o formulário, aparece um menu suspenso. Nesse menu, ao selecionar a opção Edição, pode ser escolhida a opção Salvar (salva todas as modificações feitas no formulário). Se houver um novo componente que não foi associado a nenhum campo, antes do salvamento do formulário, aparecerá a tela Assistente de Banco de Dados, sugerindo a criação do campo;
4. Caso tenha sido associada uma fonte de dados que possui chave primária composta ao formulário, no momento que o Assistente de Criação de Tabelas sugerir a criação da chave primária composta como chave estrangeira composta na fonte de dados que está associada ao formulário vinculado à grade, será mostrada uma mensagem de erro, pois o recurso de criação só suporta a criação de chave estrangeira simples.

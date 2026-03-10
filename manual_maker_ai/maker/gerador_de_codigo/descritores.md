# Descritores

> Fonte: https://manual.softwell.com.br/docs/maker/gerador_de_codigo/descritores

# Descritores

Todo o processo de geração de código está baseado na construção dos Descritores. É importante conhecer o comportamento de cada um deles dentro do processamento do gerador.

Nos itens abaixo descrevemos o funcionamento de cada Descritor:

- ## BodyProcedure

Representa a estrutura de um procedimento que não retorna valor. Nele existem quatro parâmetros, descritos abaixo:

%1 - Nome do procedimento;

%2 - Lista de parâmetros;

%3 - Bloco de declaração de variáveis;

%4 - Bloco de execução de comandos.

O primeiro parâmetro é obtido pelo próprio gerador, pelo arquivo XML. O segundo parâmetro é obtido pelo resultado conjunto dos descritores DeclareParamIn, ParamSeparator e DeclareParamOut. O terceiro parâmetro é obtido pelo retorno do descritor DeclareVar. O quarto parâmetro é obtido pelo resultado conjunto de todos os outros descritores.

- ## BodyFunction

Representa a estrutura de uma função que retorna um valor de um determinado tipo. Nele existem cinco parâmetros, descritos abaixo:

%1 - Nome do procedimento;

%2 - Lista de parâmetros;

%3 - Bloco de declaração de variáveis;

%4 - Bloco de execução de comandos;

%5 - Tipo de retorno da função.

Os quatro primeiros parâmetros são equivalentes aos do descritor acima. O quinto parâmetro é obtido pelo retorno do descritor do tipo encontrado no arquivo XML. Os descritores que fazem referência aos tipos têm o mesmo nome encontrado no XML:

- Letras;
- Inteiro;
- Fracionado;
- Data;
- Hora;
- Lógico;
- Tabela;
- Variante;
- DeclareParamIn.

Representa o formato de declaração de parâmetros de entrada de procedimentos e funções. Nele existem 2 parâmetros, descritos abaixo:

%1 - Tipo do parâmetro;

%2 - Identificador do parâmetro.

O primeiro parâmetro é obtido pelo arquivo XML e convertido pelo descritor do tipo correspondente. O segundo parâmetro é obtido pelo resultado conjunto entre o descritor PrefixVar e o nome do parâmetro no arquivo XML. O resultado completo é obtido em conjunto com o descritor ParamSeparator.

- ## DeclareParamOut

Representa o formato de declaração de parâmetros de saída de procedimentos que retornam um valor. Nele existem dois parâmetros, descritos abaixo:

%1 - Tipo do parâmetro;

%2 - Identificador do parâmetro.

O primeiro parâmetro é obtido pelo arquivo XML e convertido pelo descritor do tipo correspondente. O segundo parâmetro é obtido pelo resultado conjunto dos descritores PrefixVar e ReturnName.

- ## ParamSeparator

Representa o conjunto de caracteres utilizados como separadores dos parâmetros de entrada. Este descritor não possui parâmetros.

- ## PrefixVar

Representa o conjunto de caracteres utilizados como prefixos para nomes de variáveis. Este descritor não possui parâmetros.

- ## DeclareVar

Representa o formato de declaração de variáveis. Nele existem dois parâmetros, descritos abaixo:

%1 - Tipo da variável;

%2 - Identificador da variável.

O primeiro parâmetro é obtido pelo arquivo XML e convertido pelo descritor do tipo correspondente. O segundo parâmetro é obtido pelo resultado conjunto entre o descritor PrefixVar e o nome da variável no arquivo XML.

- ## ReturnName

Representa o nome da variável de saída utilizada em procedimentos que retornam valores. Este descritor é utilizado para linguagens que não implementam função e necessitam retornar um valor por meio de procedimentos. Este descritor não possui parâmetros.

- ## RuleExit

Representa a sintaxe do comando de encerramento de um procedimento. Não é utilizado em funções. Este descritor não possui parâmetros.

- ## RuleReturn

Representa a sintaxe do comando de encerramento de uma função ou procedimento que retorna um valor. Nele existem dois parâmetros descritos abaixo:

%1 - Nome da variável de retorno;

%2 - Valor a ser retornado.

O primeiro parâmetro é obtido pelo conteúdo do descritor ReturnName. O segundo parâmetro é obtido pelo arquivo XML. Quando utilizado em uma função, normalmente só o segundo parâmetro é necessário.

- ## RuleReturnBoolean

Representa a sintaxe do comando de encerramento de uma função ou procedimento que retorna um valor de tipo lógico. Nele existem dois parâmetros, descritos abaixo:

%1 - Nome da variável de retorno;

%2 - Valor de tipo lógico a ser retornado.

O primeiro parâmetro é obtido pelo conteúdo do descritor ReturnName. O segundo parâmetro é obtido pelo arquivo XML. Quando utilizado em uma função, normalmente só o segundo parâmetro é necessário.

- ## SetVar

Representa a sintaxe do comando de atribuição de um valor a uma variável. Nele existem dois parâmetros, descritos abaixo:

%1 - Nome da variável;

%2 - Valor a ser atribuído.

O primeiro parâmetro é obtido pelo resultado conjunto entre o descritor PrefixVar e o arquivo XML. O segundo parâmetro é obtido pelo arquivo XML. Quando a expressão não atribui valores a uma variável, SetVar não é utilizado.

- ## SetBoolean

Representa a sintaxe do comando de atribuição de um valor do tipo lógico a uma variável do tipo lógico. Nele existem dois parâmetros, descritos abaixo:

%1 - Nome da variável do tipo lógico;

%2 - Valor do tipo lógico a ser atribuído.

O primeiro parâmetro é obtido pelo resultado conjunto entre o descritor PrefixVar e o arquivo XML. O segundo parâmetro é obtido pelo arquivo XML. Quando a expressão não atribui valores a uma variável, SetBoolean não é utilizado.

- ## CallRule

Representa a sintaxe da chamada de uma função ou procedimento. Nele existem dois parâmetros, descritos abaixo:

%1 - Nome da função ou procedimento;

%2 - Lista de parâmetros.

Todos os parâmetros são obtidos pelo arquivo XML. Quando um procedimento retorna um valor, é adicionado ao segundo parâmetro o resultado do descritor CallRuleReturn.

- ## CallRuleReturn

Representa a sintaxe do parâmetro de retorno da chamada de um procedimento. Nele existe um parâmetro, descrito abaixo:

%1 - Nome da variável receptora do valor de retorno do procedimento.

O parâmetro é obtido pelo arquivo XML.

- ## CallRuleParamSeparator

Representa o conjunto de caracteres utilizados como separadores dos parâmetros de entrada na chamada de uma função ou procedimento. Este descritor não possui parâmetros.

- ## CallRuleInExpression

Representa o valor 0 ou 1; onde 0 indica que, dentro de uma expressão, não será permitida a chamada de uma função, utilizando-se o seu valor de retorno; e 1 permite o uso de funções dentro de uma expressão. Este descritor não possui parâmetros.

- ## BeginWhile

Representa a sintaxe do início de um laço condicional. Nele existe um parâmetro, descrito abaixo:

%1 - Condição lógica.

O parâmetro é obtido pelo arquivo XML.

- ## EndWhile

Representa a sintaxe de fim de um laço condicional. Este descritor não possui parâmetros.

- ## IFBegin

Representa a sintaxe do início de uma estrutura condicional. Nele existe um parâmetro, descrito abaixo:

%1 - Condição lógica.

O parâmetro é obtido pelo arquivo XML.

- ## IFElse

Representa a sintaxe do separador entre o bloco de execução para condição verdadeira e o bloco de execução para condição falsa da estrutura condicional. Este descritor não possui parâmetros.

- ## IFEnd

Representa a sintaxe de fim de uma estrutura condicional. Este descritor não possui parâmetros.

- ## CommentBegin

Representa um conjunto de caracteres utilizado como marcador para início de bloco de comentário. Este descritor não possui parâmetros.

- ## CommentEnd

Representa um conjunto de caracteres utilizado como marcador para fim de bloco de comentário. Este descritor não possui parâmetros.

- ## CommentLine

Representa um conjunto de caracteres utilizado como marcador para linha de comentário. Este descritor não possui parâmetros.

- ## StringDelimiterAtStart

Representa um conjunto de caracteres utilizado como delimitador para início de constantes letras. Este descritor não possui parâmetros.

- ## StringDelimiterAtEnd

Representa um conjunto de caracteres utilizado como delimitador para fim de constantes letras. Este descritor não possui parâmetros.

- ## BooleanFormat

Representa o formato de apresentação de expressões lógicas. Nele existe um parâmetro, descrito abaixo:

%1 - Constante lógica.

O parâmetro é obtido pelo descritor lógico, que retorna à constante lógica, definida para a linguagem.

- ## ActWarningMessage

Representa a sintaxe do comando para emissão de uma mensagem de alerta. Nele existe um parâmetro, descrito abaixo:

%1 - Mensagem a ser exibida.

O parâmetro é obtido pelo arquivo XML.

- ## ActErrorMessage

Representa a sintaxe do comando para emissão de uma mensagem de erro. Nele existe um parâmetro, descrito abaixo:

%1 - Mensagem a ser exibida.

O parâmetro é obtido pelo arquivo XML.

- ## DecimalSeparator

Representa o símbolo de separação de decimais para números fracionados. Este descritor não possui parâmetros.

- ## const\_data

Representa o formato de apresentação da constante do tipo data. Nele existem sete parâmetros, descritos abaixo:

%D - Dia;

%M - Mês;

%Y - Ano;

%H - Hora;

%N - Minuto;

%S - Segundo;

%1 - Valor data sem formatação.

Os seis primeiros parâmetros indicam as partes que compõem a data/hora. Poderão ser posicionados na ordem que for desejada para apresentação da constante data. O segundo parâmetro é o valor da data, obtido pelo arquivo XML.

- ## const\_hora

Representa o formato de apresentação da constante do tipo hora. Nele existem quatro parâmetros, descritos abaixo:

%H - Hora;

%N - Minuto;

%S - Segundo;

%1 - Valor data sem formatação.

Os três primeiros parâmetros indicam as partes que compõem a hora. Poderão ser posicionados na ordem que for desejada para apresentação da constante hora. O segundo parâmetro é o valor da hora, obtido pelo arquivo XML.

- ## const\_false

Representa o formato de apresentação da constante FALSO do tipo lógico. Este descritor não possui parâmetros.

- ## const\_true

Representa o formato de apresentação da constante VERDADEIRO do tipo lógico. Este descritor não possui parâmetros.

- ## const\_null

Representa o formato de apresentação da constante NULO. Normalmente os padrões reservam a palavra NULL para informar que o valor será NULO, portanto, se o formato desejado for NULL, este deve ser precedido de % (símbolo percentual) resultando ”%NULL”. Este descritor não possui parâmetros.

- ## Letras

Representa a sintaxe de declaração do tipo letras. Nele existe um parâmetro, descrito abaixo:

%1 - Tamanho do texto

Este descritor é utilizado para a declaração de variáveis do tipo letras. O parâmetro representa a quantidade máxima de caracteres permitida.

- ## Inteiro

Representa a sintaxe de declaração do tipo numérico inteiro. Este descritor não possui parâmetros.

- ## Fracionado

Representa a sintaxe de declaração do tipo numérico fracionado. Este descritor não possui parâmetros.

- ## Data

Representa a sintaxe de declaração do tipo data. Este descritor não possui parâmetros.

- ## Hora

Representa a sintaxe de declaração do tipo hora. Este descritor não possui parâmetros.

- ## Lógico

Representa a sintaxe de declaração do tipo lógico. Este descritor não possui parâmetros.

- ## Tabela

Representa a sintaxe de declaração do tipo tabela. Este tipo representa um conjunto de registros recuperados de uma tabela contida em um banco de dados. Normalmente está relacionado diretamente com o tipo CURSOR do banco de dados. Este descritor não possui parâmetros.

- ## Variante

Representa a sintaxe de declaração do tipo variante, que representa um tipo indeterminado, podendo ser utilizado para diversos fins. Normalmente está relacionado diretamente com tipos de classes de objetos ou ponteiros para outros tipos. Este descritor não possui parâmetros.

- ## And

Representa a sintaxe do operador ”E”, que retorna um valor lógico por meio de uma função lógica conjuntiva. Normalmente é utilizado para avaliar expressões lógicas de 'n' elementos que se apresentam aqui como parâmetros. Os parâmetros estão representados com o símbolo ”%\*”, que significa uma lista de parâmetros de quantidade variável. O mínimo, neste caso, são dois parâmetros, para que seja possível a operação ”E” lógica. O conteúdo que está entre os símbolos ”[]” representa o conjunto de caracteres que será inserido como operador entre os parâmetros. A regra para utilização desses símbolos é: %\* seguido de separador.

Exemplos:

- - Conteúdo do descritor: (%\*[ and ])
  - Resultado do gerador: (p1 and p2 and p3)
  - Conteúdo do descritor: fAnd(%\*[, ])
  - Resultado do gerador: fAnd(p1, p2, p3)
- ## Or

Representa a sintaxe do operador ”OU”, que retorna um valor lógico por meio de uma função lógica disjuntiva. Normalmente é utilizado para avaliar expressões lógicas de 'n' elementos que se apresentam aqui como parâmetros. Os parâmetros estão representados com o símbolo ”%\*”, que significa uma lista de parâmetros de quantidade variável. O mínimo, neste caso, são dois parâmetros, para que seja possível a operação ”OU” lógica. O conteúdo que está entre os símbolos ”[]” representa o conjunto de caracteres que será inserido como operador entre os parâmetros. A regra para utilização desses símbolos é: %\* seguido de separador.

Exemplos:

- Conteúdo do descritor: (%\*[ or ])
- Resultado do gerador: (p1 or p2 or p3)
- Conteúdo do descritor: fOr(%\*[, ])
- Resultado do gerador: fOr(p1, p2, p3)
- ## Not

Representa a sintaxe do operador ”NÃO”, que retorna um valor lógico por meio de uma função lógica de negação. Normalmente é utilizado para negar expressões lógicas. Nele existe um parâmetro.

%1 - Expressão lógica a ser negada

O parâmetro indicado por %1 representa a expressão lógica a ser negada, que pode ser uma constante ou uma função lógica.

Exemplos:

- Conteúdo do descritor: NOT( %1 )
- Resultado do gerador: NOT( (p1 and p2 and p3) )
- Conteúdo do descritor: !( %1 )
- Resultado do gerador: !( fAnd(p1, p2, p3) )
- ## isEqual

Representa a sintaxe do operador ”IGUAL”, que retorna um valor lógico por meio de uma função de igualdade lógica. Nele existem dois parâmetros, descritos abaixo:

%1 - Primeira expressão a ser comparada

%2 - Segunda expressão a ser comparada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## isDiferent

Representa a sintaxe do operador ”DIFERENTE” que retorna um valor lógico por meio de uma função de diferença lógica. Nele existem dois parâmetros descritos abaixo:

%1 - Primeira expressão a ser comparada

%2 - Segunda expressão a ser comparada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## isGreater

Representa a sintaxe do operador ”MAIOR QUE”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MAIOR QUE o segundo parâmetro; caso contrário é FALSO. Nele existem dois parâmetros, descritos abaixo:

%1 - Primeira expressão a ser comparada

%2 - Segunda expressão a ser comparada

Os dois parâmetros serão obtidos por outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## isMinor

Representa a sintaxe do operador ”MENOR QUE”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MENOR QUE o segundo parâmetro; caso contrário é FALSO. Nele existem dois parâmetros, descritos abaixo:

%1 - Primeira expressão a ser comparada

%2 - Segunda expressão a ser comparada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## isGreaterOrEqual

Representa a sintaxe do operador ”MAIOR OU IGUAL”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MAIOR OU IGUAL ao segundo parâmetro; caso contrário é FALSO. Nele existem dois parâmetros, descritos abaixo:

%1 - Primeira expressão a ser comparada

%2 - Segunda expressão a ser comparada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## isMinorOrEqual

Representa a sintaxe do operador ”MENOR OU IGUAL”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MENOR OU IGUAL ao segundo parâmetro; caso contrário, é FALSO. Nele existem dois parâmetros, descritos abaixo:

%1 - Primeira expressão a ser comparada

%2 - Segunda expressão a ser comparada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## isNull

Representa a sintaxe do operador ”É NULO”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o parâmetro for NULO; caso contrário, é FALSO. Nele existe um parâmetro, descrito abaixo:

%1 - Expressão a ser testada

O parâmetro é obtido por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## soEqual

Representa a sintaxe do operador ”IGUAL”, que retorna um valor lógico por meio de uma função de igualdade lógica. Este descritor é equivalente ao isEqual, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soNotEqual

Representa a sintaxe do operador ”DIFERENTE”, que retorna um valor lógico por meio de uma função de diferença lógica. Este descritor é equivalente ao isDiferent, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soGreaterThan

Representa a sintaxe do operador ”MAIOR QUE”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MAIOR QUE o segundo parâmetro; caso contrário, é FALSO. Este descritor é equivalente ao isGreater, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soLessThan

Representa a sintaxe do operador ”MENOR QUE”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MENOR QUE o segundo parâmetro; caso contrário, é FALSO. Este descritor é equivalente ao isMinor, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soGreaterThanOrEqualTo

Representa a sintaxe do operador ”MAIOR OU IGUAL”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MAIOR OU IGUAL ao segundo parâmetro; caso contrário, é FALSO. Este descritor é equivalente ao isGreaterOrEqual, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soLessThanOrEqualTo

Representa a sintaxe do operador ”MENOR OU IGUAL”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o primeiro parâmetro for MENOR OU IGUAL ao segundo parâmetro; caso contrário, é FALSO. Este descritor é equivalente ao isMinorOrEqual, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soIsNull

Representa a sintaxe do operador ”É NULO”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o parâmetro for NULO; caso contrário, é FALSO. Este descritor é equivalente ao isNull, no entanto sua sintaxe será utilizada em cláusulas WHERE do SQL.

- ## soLike

Representa a sintaxe do operador ”CONTENDO”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o segundo parâmetro estiver contido no primeiro; caso contrário, é FALSO. Este descritor é utilizado em cláusulas WHERE do SQL. Nele existem dois parâmetros, descritos abaixo:

%1 - Expressão em que será pesquisada

%2 - Expressão a ser localizada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções. Deve-se obedecer à ordem dos parâmetros, sabendo-se que o segundo parâmetro é o que deverá estar contido no primeiro.

Exemplo:

- - Conteúdo do descritor: (%1 LIKE '%' + %2 + '%')
  - Resultado do gerador: (NOME LIKE ’%’ + ’WELL’ + ’%’)
- ## soLikeStarting

Representa a sintaxe do operador ”INICIANDO COM”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o segundo parâmetro estiver contido no início do primeiro; caso contrário, é FALSO. Este descritor é utilizado em cláusulas WHERE do SQL. Nele existem dois parâmetros, descritos abaixo:

%1 - Expressão na qual será pesquisada

%2 - Expressão a ser localizada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções. Deve-se obedecer à ordem dos parâmetros, sabendo-se que o segundo parâmetro é o que deverá estar contido no início do primeiro.

Exemplo:

- - Conteúdo do descritor: (%1 LIKE %2 + '%')
  - Resultado do gerador: (NOME LIKE ’SOFT’ + ’%’)
- ## soLikeEnd

Representa a sintaxe do operador ”TERMINANDO COM”, que retorna um valor lógico por meio de uma função lógica em que o resultado é VERDADEIRO quando o segundo parâmetro estiver contido no final do primeiro; caso contrário, é FALSO. Este descritor é utilizado em cláusulas WHERE do SQL. Nele existem dois parâmetros, descritos abaixo:

%1 - Expressão na qual será pesquisada

%2 - Expressão a ser localizada

Os dois parâmetros serão obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções. Deve-se obedecer à ordem dos parâmetros, sabendo-se que o segundo parâmetro é o que deverá estar contido no final do primeiro.

Exemplo:

- - Conteúdo do descritor: (%1 LIKE '%' + %2)
  - Resultado do gerador: (NOME LIKE ’%’ + ’WELL’)
- ## SQLInsert

Representa a sintaxe do comando ”INSERT” do SQL, que insere registros em uma tabela do banco de dados. Nele existem três parâmetros, descritos abaixo:

%1 - Nome da tabela do banco de dados

%2 - Lista de campos

%3 - Lista de valores a serem inseridos

Os parâmetros são obtidos pelo arquivo XML.

- ## SQLUpdate

Representa a sintaxe do comando ”UPDATE” do SQL, que altera registros em uma tabela do banco de dados. Nele existem dois parâmetros, descritos abaixo:

%1 - Nome da tabela do banco de dados

%2 - Lista de alterações (campo = valor)

Os parâmetros são obtidos pelo arquivo XML.

- ## SQLDelete

Representa a sintaxe do comando ”DELETE” do SQL, que apaga registros em uma tabela do banco de dados. Nele existe um parâmetro, descrito abaixo:

%1 - Nome da tabela do banco de dados

O parâmetro é obtido pelo arquivo XML.

- ## SQLRestriction

Representa a sintaxe da cláusula de restrição ”WHERE” para comandos SQL, utilizada para SELECT, UPDATE e DELETE. Nele existe um parâmetro, descrito abaixo:

%1 - Expressão lógica restritiva

O parâmetro é obtido pelo arquivo XML e por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções. Este descritor é usado apenas pelos descritores SQLInsert, SQLUpdate e SQLDelete.

- ## SubqueryInCondition

Representa o valor 0 ou 1; onde 0 indica que não será permitida uma consulta SQL dentro de uma expressão condicional; e 1 indica que será permitida. Este descritor não possui parâmetros.

- ## OpenCursor

Representa a sintaxe do comando de declaração e abertura de um ”CURSOR” no SQL, que permite gerenciar um conjunto de dados dinâmico, por meio de uma variável do tipo TABELA.

Nele existem três parâmetros, descritos abaixo:

%1 - Variável do tipo TABELA

%2 - Comando SELECT do SQL que retorna um conjunto de dados dinâmico

%3 - Lista de variáveis utilizadas pelo comando FETCH

O primeiro parâmetro é sempre o nome da variável de tipo TABELA. É obtido pelo arquivo XML. O segundo parâmetro é o comando SELECT, que retornará um conjunto de registros que será gerenciado pelo CURSOR, por meio da variável do tipo TABELA. O terceiro parâmetro é a lista de variáveis utilizadas pelo comando FETCH. Este comando faz avançar um registro no CURSOR, atribuindo os valores dos campos do SELECT para as variáveis que se encontram na lista.

Exemplo:

Conteúdo do descritor:

OPEN %1 FOR %2;

FETCH %1 INTO %3;

Resultado do gerador:

OPEN tb\_produto FOR (select codproduto, decricao from produto);

FETCH tb\_produto INTO tb\_produto\_codproduto, tb\_produto\_descricao;

Em alguns casos, podem ser utilizadas algumas técnicas para auxiliar a geração do código. No exemplo abaixo, utilizamos um recurso do gerador para suprir uma falta de recursos de um determinado banco de dados:

--@n`<declaração da variável>`

Esta notação informa ao gerador que o texto encontrado após a sequência ”--@n” entrará na lista de declaração de variáveis, permitindo que seja declarada uma variável para uso interno do código e sem o conhecimento do criador do fluxo de origem. Nesse caso. o gerador não utilizará o descritor DeclareVar, sendo necessário informar a sintaxe da declaração completa na linguagem escrita. A letra ”n” indica um número que significa a ordem na qual a declaração entrará na lista. Caso seja necessário posicionar a declaração no topo da lista então ”n”, deve ser 1, e assim por diante. Caso o gerador encontre várias declarações com o mesmo número de ordem ”n”, elas serão colocadas na lista na ordem em que aparecem, permitindo organizar grupos de declarações na ordem desejada.

Exemplo:

Conteúdo do descritor:

SET %1 = CURSOR FOR %2

OPEN %1

FETCH NEXT FROM %1 INTO %3

SET @%1\_FETCH\_STATUS = @@FETCH\_STATUS

--@1DECLARE @%1\_FETCH\_STATUS INT

Resultado do gerador:

SET tb\_cargo = CURSOR FOR (select codcargo, descrição from cargo)

OPEN tb\_cargo

FETCH NEXT FROM tb\_cargo INTO tb\_cargo\_codcargo, tb\_cargo\_descricao

SET @tb\_cargo\_FETCH\_STATUS = @@FETCH\_STATUS

--@1DECLARE @tb\_cargo\_FETCH\_STATUS INT

No exemplo acima, está definido um CURSOR com o nome ”tb\_cargo”. A próxima instrução abre o CURSOR e, logo depois, é usado um FETCH que avança um registro no CURSOR. Em seguida, é atribuído o valor da variável global @@FETCH\_STATUS para a variável @tb\_cargo\_FETCH\_STATUS, que não existe no fluxo original, mas será declarada graças ao recurso do sinalizador --@1, que incluirá a declaração que se segue no bloco de declaração de variáveis, seguindo a ordem indicada pelo número após o @.

Esse é um exemplo de como é possível reunir várias instruções para atingir um único resultado para qual o descritor se propõe.

- ## toString

Representa a sintaxe da função de conversão de um tipo qualquer de dado para o tipo LETRAS. Nele existe um parâmetro, descrito abaixo:

%1 - Expressão a ser convertida

O parâmetro é obtido por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## toLong

Representa a sintaxe da função de conversão de um tipo qualquer de dado para o tipo INTEIRO. Nele existe um parâmetro, descrito abaixo:

%1 - Expressão a ser convertida

O parâmetro é obtido por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## toDouble

Representa a sintaxe da função de conversão de um tipo qualquer de dado para o tipo FRACIONADO. Nele existe um parâmetro, descrito abaixo:

%1 - Expressão a ser convertida

O parâmetro é obtido por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções.

- ## toDate

Representa a sintaxe da função de conversão de um dado do tipo LETRAS para o tipo DATA/HORA. Nele existem dois parâmetros, descritos abaixo:

%1 - Expressão do tipo LETRAS a ser convertida

%2 - Expressão do tipo LETRAS indicando o formato da expressão convertida (OPCIONAL)

Os dois parâmetros são obtidos por meio dos outros descritores que retornam várias formas de expressão, podendo ser constantes, variáveis ou funções. O segundo parâmetro é OPCIONAL.

- ## oprAdd

Representa a sintaxe da função ”SOMA”, que retorna um somatório. Normalmente é utilizado para somar expressões numéricas de 'n' valores que se apresentam aqui como parâmetros. Os parâmetros estão representados com o símbolo ”%\*”, que significa uma lista de parâmetros de quantidade variável. O mínimo, neste caso, são dois parâmetros, para que seja possível uma operação ”SOMA”. O conteúdo que está entre os símbolos ”[]” representa o conjunto de caracteres que será inserido como operador entre os parâmetros. A regra para a utilização desses símbolos é: %\* seguido de separador.

Exemplos:

- Conteúdo do descritor: (%\*[ + ])
- Resultado do gerador: (p1 + p2 + p3)
- Conteúdo do descritor: fAdd(%\*[, ])
- Resultado do gerador: fAdd(p1, p2, p3)
- ## oprSubtract

Representa a sintaxe da função ”SUBTRAÇÃO”, que retorna um somatório. Normalmente é utilizado para subtrair expressões numéricas de 'n' valores que se apresentam aqui como parâmetros. Os parâmetros estão representados com o símbolo ”%\*”, que significa uma lista de parâmetros de quantidade variável. O mínimo, neste caso, são dois parâmetros, para que seja possível uma operação ”SUBTRAÇÃO”. O conteúdo que está entre os símbolos ”[]” representa o conjunto de caracteres que será inserido como operador entre os parâmetros. A regra para a utilização desses símbolos é: %\* seguido de [ separador ].

Exemplos:

- Conteúdo do descritor: (%\*[ - ])
- Resultado do gerador: (p1 - p2 - p3)
- Conteúdo do descritor: fSubtract(%\*[, ])
- Resultado do gerador: fSubtract (p1, p2, p3)
- ## oprAnd

Representa a sintaxe do operador ”E”, que retorna um valor lógico por meio de uma função lógica conjuntiva. Este descritor é equivalente ao And, descrito anteriormente.

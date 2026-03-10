# Referência do Compilador/Gerador de Código do Maker AI

O compilador do Maker AI utiliza **descritores** para gerar código em diferentes
linguagens (Servidor/Java, Cliente/JavaScript, Banco de Dados/SQL).

Cada descritor define um padrão de sintaxe usado na geração do código a partir
dos fluxogramas visuais.

Total de descritores: **302**

[← Voltar para Nativos](../README.md)

---

## Categorias

- [Comparações (is*)](#comparações-(is_)) (23 descritores)
- [Constantes](#constantes) (5 descritores)
- [Controle de Fluxo e Sintaxe](#controle-de-fluxo-e-sintaxe) (18 descritores)
- [Conversões (to*)](#conversões-(to_)) (16 descritores)
- [Estruturas de Código](#estruturas-de-código) (28 descritores)
- [Funções Built-in (ebf*)](#funções-built-in-(ebf_)) (128 descritores)
- [Operadores (opr*)](#operadores-(opr_)) (19 descritores)
- [Outros](#outros) (57 descritores)
- [Tipos de Dados](#tipos-de-dados) (8 descritores)

## Comparações (is*)

### `isDiferent`

Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se os termos forem diferentes e FALSO se forem iguais.

---

### `isDiferent(#inteiro#letras)`

Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo
LETRAS, retornando VERDADEIRO se os termos forem diferentes e FALSO se forem iguais.

---

### `isDiferent(#letras#inteiro)`

Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo INTEIRO, retornando VERDADEIRO se os termos forem diferentes e FALSO se forem iguais.

---

### `isDiferent(#letras#letras)`

Descritor para função de verificação de iugualdade entre Strings

---

### `isDiferent(#lógico#lógico)`

Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo do tipo LÓGICO e %2 é o segundo termo também do tipo LÓGICO, retornando VERDADEIRO se os termos forem diferentes e FALSO se forem iguais.

---

### `isEqual`

Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se os termos forem iguais e FALSO se forem diferentes.

---

### `isEqual(#inteiro#letras)`

Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo LETRAS, retornando VERDADEIRO se os termos forem iguais e FALSO se forem diferentes.

---

### `isEqual(#letras#inteiro)`

Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo INTEIRO, retornando VERDADEIRO se os termos forem iguais e FALSO se forem diferentes.

---

### `isEqual(#letras#letras)`

Função para  verificação de igualdade entra 2 Strings

---

### `isEqual(#lógico#lógico)`

Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo do tipo LÓGICO e %2 é o segundo termo também do tipo LÓGICO, retornando VERDADEIRO se os termos forem iguais e FALSO se forem diferentes.

---

### `isGreater`

Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se o primeiro termo for maior que o segundo e FALSO caso contrário.

---

### `isGreater(#inteiro#letras)`

Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo LETRAS, retornando VERDADEIRO se o primeiro termo for maior que o segundo e FALSO caso contrário.

---

### `isGreater(#letras#inteiro)`

Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo INTEIRO, retornando VERDADEIRO se o primeiro termo for maior que o segundo e FALSO caso contrário.

---

### `isGreaterOrEqual`

Formato da sintaxe de comparação MAIOR OU IGUAL, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se o primeiro termo for maior ou igual ao segundo, do contrário retorna FALSO.

---

### `isGreaterOrEqual(#inteiro#letras)`

Formato da sintaxe de comparação MAIOR OU IGUAL, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo LETRAS, retornando VERDADEIRO se o primeiro termo for maior ou igual ao segundo, do contrário retorna FALSO.

---

### `isGreaterOrEqual(#letras#inteiro)`

Formato da sintaxe de comparação MAIOR OU IGUAL, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo INTEIRO, retornando VERDADEIRO se o primeiro termo for maior ou igual ao segundo, do contrário retorna FALSO.

---

### `isMinor`

Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se o primeiro termo for menor que o segundo, do contrário retorna FALSO.

---

### `isMinor(#inteiro#letras)`

Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo LETRAS, retornando VERDADEIRO se o primeiro termo for menor que o segundo, do contrário retorna FALSO.

---

### `isMinor(#letras#inteiro)`

Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo INTEIRO, retornando VERDADEIRO se o primeiro termo for menor que o segundo, do contrário retorna FALSO.

---

### `isMinorOrEqual`

Formato da sintaxe de comparação MENOR OU IGUAL, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se o primeiro termo for menor ou igual ao segundo, do contrário retorna FALSO.

---

### `isMinorOrEqual(#inteiro#letras)`

Formato da sintaxe de comparação MENOR OU IGUAL, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo LETRAS, retornando VERDADEIRO se o primeiro termo for menor ou igual ao segundo, do contrário retorna FALSO.

---

### `isMinorOrEqual(#letras#inteiro)`

Formato da sintaxe de comparação MENOR OU IGUAL, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo INTEIRO, retornando VERDADEIRO se o primeiro termo for menor ou igual ao segundo, do contrário retorna FALSO.

---

### `isNull`

Função que retorna VERDADEIRO caso %1 seja NULO, caso contrário retorna FALSO.

---

## Constantes

### `const_data`

Formato da constante do tipo DATA.

---

### `const_false`

Valor de representação da constante lógica FALSO.

---

### `const_hora`

Formato da constante do tipo HORA.

---

### `const_null`

Valor de representação da constante NULO.

---

### `const_true`

Valor de representação da constante lógica VERDADEIRO.

---

## Controle de Fluxo e Sintaxe

### `BeginWhile`

Início do bloco "FAÇA ENQUANTO" que representa o início de um LAÇO para uma determinada condição lógica passada como parâmetro
representada por %1.

---

### `CommentBegin`

Conjunto de caracteres que indicam o início de bloco de comentário.

---

### `CommentEnd`

Conjunto de caracteres que indicam o fim de bloco de comentário.

---

### `CommentInitialColumn`

Define a coluna em que deve iniciar a linha de comentário (CommentLine). O valor 0 (zero) indica texto livre, ou seja, acompanha o identamento normal do texto.

---

### `CommentLine`

Conjunto de caracteres que indicam uma linha de comentário.

---

### `CommentStyle`

Define o estilo de comentário que será utilizado na geração do código.
Os possíveis valores são: 

B (block) indica que serão utilizados comentários de bloco, usando início e fim de comentário (CommentBegin / CommentEnd).

L (line) indica que serão utilizados comentários de linha, usando o marcador de linha (CommentLine).

---

### `DecimalSeparator`

Símbolo utilizado como separador de decimais em valores fracionados.

---

### `EndWhile`

END

---

### `EscapeStrings`

Lista de correlações para SUBSTITUIÇÃO em constantes do tipo LETRAS. Consiste em uma lista de pares de strings utilizadas na substituição das constantes.

Exemplo:

'=''  ->  Aspa simples será substituída por 2 aspas simples consecutivas.
"=\"  ->  Aspa dupla será substituída por uma barra + aspa dupla.

O caracter "=" serve como separador.

---

### `ExecuteAfterTrigger`

Representa um ou um conjunto de comandos SQL que serão executados após a criação da TRIGGER através do descritor "BodyTrigger".

---

### `IFBegin`

Formato da sintaxe do comando IF, onde %1 é a expressão condicional que retornará VERDADEIRO ou FALSO.

---

### `IFElse`

Formato da sintaxe do bloco ELSE do comando IF, onde será finalizado o primeiro bloco executado quando a condição do IF for VERDADEIRA e será iniciado o segundo bloco executado quando a condição for FALSA.

---

### `IFEnd`

Formato da sintaxe do fim de bloco do comando IF, onde indica o fim de execução do bloco de comandos.

---

### `NewLineSQL`

Conjunto de caracteres que representam a QUEBRA DE LINHA de uma constante do tipo SQL. Caso não seja informado o gerador assumirá a quebra de linha padrão.

---

### `NewLineString`

Conjunto de caracteres que representam a QUEBRA DE LINHA de uma constante do tipo LETRAS. Caso não seja informado o gerador assumirá a quebra de linha padrão.

---

### `ParamSeparator`

Símbolo utilizado como SEPARADOR da lista de parâmetros na declaração da procedure/função.

---

### `PrefixVar`

Símbolo caracter que antecede o nome da variável, assumindo como prefixo padrão do formato dos nomes de variáveis.

---

### `ReturnName`

Nome da VARIÁVEL de RETORNO ou SAÍDA para sistemas que utilizam Stored Procedures que retornam valores através de parâmetros
do tipo OUTPUT.

---

## Conversões (to*)

### `toBoolean`

Função de conversão para o tipo LÒGICO, onde %1 é o valor a ser convertido.

---

### `toBytes(#variante)`

Função que recebe um Object e retorna os bytes deste objeto.

---

### `toDate`

Função de conversão para o tipo DATA, onde %1 é o valor a ser convertido.

---

### `toDouble`

Função de conversão para o tipo FRACIONADO, onde %1 é o valor a ser convertido.

---

### `toDouble(#inteiro)`

Função de conversão para o tipo FRACIONADO, onde %1 é o valor do tipo INTEIRO a ser convertido.

---

### `toDouble(#letras)`

Função de conversão para o tipo FRACIONADO, onde %1 é o valor do tipo LETRAS a ser convertido.

---

### `toDouble(#variante)`

Função de conversão para o tipo VARIANTE onde %1 é o valor do tipo VARIANTE a ser convertido.

---

### `toLong`

Função de conversão para o tipo INTEIRO, onde %1 é o valor a ser convertido.

---

### `toLong(#fracionado)`

Função de conversão para o tipo INTEIRO, onde %1 é o valor FRACIONADO a ser convertido.

---

### `toLong(#letras)`

Função de conversão para o tipo INTEIRO, onde %1 é o valor em LETRAS a ser convertido.

---

### `toLong(#variante)`

Função de conversão para o tipo INTEIRO, onde %1 é o valor VARIANTE a ser convertido.

---

### `toString`

Função de conversão para o tipo LETRAS, onde %1 é o valor a ser convertido.

---

### `toString(#data)`

Converte uma data para String

---

### `toString(#fracionado)`

Função de conversão para o tipo LETRAS, onde %1 é o valor FRACIONADO a ser convertido.

---

### `toString(#inteiro)`

Função de conversão para o tipo LETRAS, onde %1 é o valor INTEIRO a ser convertido.

---

### `toString(#variante)`

Função de conversão para o tipo LETRAS, onde %1 é o valor VARIANTE a ser convertido.

---

## Estruturas de Código

### `BodyFunction`

Formato do corpo de declaração de FUNÇÕES, onde %1 é o nome da função, %2 é a lista de parâmetros, %3 é o bloco declarativo de variáveis, %4 é o bloco de execução e %5 é a declaração do valor de retorno.

---

### `BodyProcedure`

Formato do corpo de declaração de PROCEDIMENTOS, onde %1 é o nome do procedimento, %2 é a lista de parâmetros, %3 é o bloco declarativo de variáveis e %4 é o bloco de execução.

---

### `BodyTrigger`

Formato do corpo de declaração de TRIGGERS, onde os parâmetros são: 
%1 Nome da trigger
%2 Nome da tabela
%3 Tipo da trigger (INSERT, UPDATE, DELETE)
%4 Lista de variáveis
%5 Tabela virtual
%6 Lista de campos relacionados aos parâmetros
%7 Nome da regra
%8 Lista de parâmetros do FETCH
%9 Lista de parâmetros de entrada da regra

---

### `CallRule`

Formato de sintaxe para chamada de REGRAS onde %1 é o nome da regra e %2 representa a lista de parâmetros, caso existam.

---

### `CallRuleFormatExpression`

Formato de sintaxe para chamada de REGRAS contidas em EXPRESSÕES, onde %1 é o nome da regra e %2 representa a lista de parâmetros,
caso existam.

---

### `CallRuleInsideExpression`

Descritor que determina se poderá haver CHAMADAS de REGRAS dentro de EXPRESSÕES, permitindo que as regras retornem valores
dentro da expressão montada.

---

### `CallRuleParamSeparator`

Símbolo utilizado como SEPARADOR da lista de parâmetros na chamada de EXECUÇÃO da procedure/função quando for subregra.

---

### `CallRuleReturn`

Formato de sintaxe para o parâmetro de SAÍDA ou de RETORNO na chamada de uma regra, onde %1 é o nome da variável que receberá o
valor de retorno da regra.

---

### `DeclareCursorBefore`

Descritor que armazena apenas os valores 0 ou 1, indicando que a definição SQL do cursor deverá ser feita na declaração da variável ou não. O valor 1 indica que deverá ser definido o SQL ao declarar a variável, o valor 0 isenta essa possibilidade, permitindo que o SQL do cursor declarado seja definido no bloco de execução.

---

### `DeclareParamIn`

Formato de declaração de parâmetros de entrada em Procedures e Stored Procedures, onde %1 é o tipo e %2 é o identificador.

---

### `DeclareParamInVar`

Sinalizador que declara todo parâmetro da regra na sessão de declaração de variáveis.

---

### `DeclareParamOut`

Formato de declaração de parâmetros de SAÍDA em procedures e funções, onde %1 é o tipo e %2 é o identificador.

---

### `DeclareParams`

Formato de declaração de parâmetros de entrada e saída na assinatura do procedimento ou função, onde %1 é a lista de PARÂMETROS.

---

### `DeclareVar`

Formato de DECLARAÇÃO de VARIÁVEIS, onde %1 é o tipo da variável e %2 é o identificador.

---

### `DropFunction`

Sequencia de comandos que executam um DROP no objeto FUNCTION do banco de dados, testando a existência do objeto evitando a
geração de erros.

---

### `DropProcedure`

Sequencia de comandos que executam um DROP no objeto PROCEDURE do banco de dados, testando a existência do objeto evitando a
geração de erros.

---

### `DropTrigger`

Sequencia de comandos que executam um DROP no objeto TRIGGER do banco de dados, testando a existência do objeto evitando a geração de erros, onde %1 é o nome da TRIGGER e %2 é o nome da TABELA.

---

### `FormatSQLField`

Formato de apresentação da constante CAMPO, onde %1 é o número de ordem do campo na consulta e %2 é o nome do campo.

---

### `FormatSQLParam`

Formato de apresentação dos parâmetros no código SQL, onde %1 é o parâmetro do SQL que pode ser uma constante, uma variável ou uma função.

---

### `FormatVar`

Formato de apresentação das variáveis no corpo da regra (Function/Procedure) que contém código SQL, onde %1 é nome da variável da forma declarada, podendo conter ou não prefixo definido no descritor PrefixVar.

---

### `OpenCursor`

Formato da sintaxe para ABERTURA de uma variável do tipo TABELA, onde %1 é a variável TABELA, %2 é o comando SQL SELECT que define a TABELA e %3 é a lista de variáveis para atribuição dos valores de campos da TABELA.

---

### `RuleExit`

Formato da sintaxe de SAÍDA ou ENCERRAMENTO da regra. RuleExit é usado pelo compilador quando a regra não retorna nenhum valor.

---

### `RuleNameByCamelCase`

Define o estilo do nome da regra. Caso o valor seja 1 será gerado o nome da regra em CamelCase. Caso seja 0 serão substituídos os espaços em branco e caracteres especiais por caracteres simples e UNDERLINE.
Ex:
Nome da regra:  "Teste nome da regra"
em CamelCase:    - TesteNomeDaRegra.
sem CamelCase:  - TESTE_NOME_DA_REGRA

---

### `RuleReturn`

Formato da sintaxe para o RETORNO de valor de uma regra, onde %1 é o nome da variável de retorno e %2 é o valor ou a expressão a ser
retornada. RuleReturn é usado pelo compilador quando a regra retorna um valor.

---

### `RuleReturnBoolean`

Formato da sintaxe para o RETORNO de valor de uma regra do tipo LÓGICO, onde %1 é o nome da variável de retorno e %2 é o valor ou a
expressão LÓGICA a ser retornada.

---

### `SetBoolean`

Formato da sintaxe de ATRIBUIÇÃO de variáveis LÓGICAS, convertendo os valores booleanos TRUE e FALSE para 1 e 0 respectivamente
quando necessário.

---

### `SetNumeric`

Formato da sintaxe de ATRIBUIÇÃO de variáveis NUMÉRICAS, utilizando a sintaxe correta para este tipo de variável.

---

### `SetVar`

Formato de ATRIBUIÇÃO onde %1 é a variável e %2 é o valor atribuído.

---

## Funções Built-in (ebf*)

### `ebfAddRMSRecord`

Função para adcionar registros.

---

### `ebfAlterRMSRecord`

Descritor da função para alterar dados de um registro.

---

### `ebfAsciiToBinary`

Função responsavél por converter caracteres normais para valores binarios.

---

### `ebfBase64ToBinary(#letras)`

Função responsavél por converter uma base64 para binario.

---

### `ebfBase64ToString(#letras)`

Função para converter uma string para base64, recebendo como parametro uma string.

---

### `ebfBinaryToAscii(#letras)`

Função responsável por converter um texto em formato binário para texto normal.

---

### `ebfBinaryToBase64(#letras)`

Função responsável por converter um texto BINÁRIO para BASE64.

---

### `ebfButtonNew`

Cria um novo botão

---

### `ebfCallPhoneNumber`

Descritor utilizado para função que irá executar uma chamada telefônica a partir de uma String contendo o número telefônico que deseja chamar.

---

### `ebfCharAt`

Função que retorna o CARACTER na posição determinada por %2 na sequencia de letras representada por %1.

---

### `ebfCharacter`

Retorna o CARACTER de um determinado código ASCII, representado por %1.

---

### `ebfCheckBoxNew`

Cria um novo CheckBox

---

### `ebfChrToAscii`

Função que retorna o código ASCII de um determinado caracter, onde %1 é o caracter a ser convertido.

---

### `ebfComboBoxNew`

Cria um novo ComboBox

---

### `ebfConcat`

Função que retorna a concatenação de um texto de 1..n parâmetros representados por %*.

---

### `ebfConcatLeft`

Função que retorna a concatenação do texto passado no 1º parâmetro com o caracter passado no 2º parâmetro, sendo que o valor será do tamanho indicado no 3º parâmetro, os parâmentros são representados por %*. Observação: o caracter será repetido no início da da String passada no 1º parâmetro.

---

### `ebfConcatRight`

Função que retorna a concatenação do texto passado no 1º parâmetro com o caracter passado no 2º parâmetro, sendo que o valor será do tamanho indicado no 3º parâmetro, os parâmentros são representados por %*. Observação: o caracter será repetido no fim da da String passada no 1º parâmetro.

---

### `ebfConvTokxmlParser`

Converte um objeto para kxmlParser.

---

### `ebfConvertBase64`

Chamada para função que converte valores para base64.

---

### `ebfCreateDate`

Cria uma data a partir da passagem do ano, mês, dia, hora, minuto e segundo.

---

### `ebfDatasetFirst(#variante)`

Descritor para função responsavél por mover para o primeiro registro do dataset.

---

### `ebfDatasetLast(#variante)`

Passa para o utimo registro de um datatset.

---

### `ebfDatasetNext(#variante)`

Passa para o próximo registro de um dataset, que é passado como parâmetro.

---

### `ebfDatasetPrevious(#variante)`

Passa para o regiatro anterior de um dataset.

---

### `ebfDateDate`

Função que retorna apenas a DATA da data e hora representada por %1.

---

### `ebfDateDay`

Função que retorna apenas o DIA da data representada por %1.

---

### `ebfDateDayDifference`

Função que retorna a DIFERENÇA de DIAS entre duas datas, onde %1 é a data maior e %2 a data menor.

---

### `ebfDateHour`

Função que retorna apenas a HORA da data e hora representada por %1.

---

### `ebfDateIncDay`

Função que INCREMENTA DIA a uma data, onde %1 é a data e %2 é o quantidade de dias a ser incrementado.

---

### `ebfDateIncMonth`

Função que INCREMENTA MÊS a uma data, onde %1 é a data e %2 é o quantidade de meses a ser incrementado.

---

### `ebfDateIncYear`

Função que INCREMENTA ANO a uma data, onde %1 é a data e %2 é o quantidade de anos a ser incrementado.

---

### `ebfDateMinute`

Função que retorna apenas os MINUTOS da data e hora representada por %1.

---

### `ebfDateMonth`

Função que retorna apenas o MÊS da data representada por %1.

---

### `ebfDateMonthDifference`

Função que retorna a DIFERENÇA de MESES entre duas datas, onde %1 é a data maior e %2 a data menor.

---

### `ebfDateSecond`

Função que retorna apenas os SEGUNDOS da data e hora representada por %1.

---

### `ebfDateToday`

Função que retorna a DATA ATUAL do sistema.

---

### `ebfDateYear`

Função que retorna apenas o ANO da data representada por %1.

---

### `ebfDateYearDifference`

Função que retorna a DIFERENÇA de ANOS entre duas datas, onde %1 é a data maior e %2 a data menor.

---

### `ebfDeleteRMSRecord`

Descritor da função para deletar um registro que atenda a um determinado criterio

---

### `ebfEditNew`

Cria uma nova Caixa de Texto

---

### `ebfFileAppend`

Função que ADICIONA TEXTO no final de um arquivo, onde %1 é a referência ao arquivo e %2 é o texto
a ser adicionado. A função não retorna valores.

---

### `ebfFileCanRead`

Descritor utilizado para funções que fazem verificação de possibilidade de leitura de um arquivo.

---

### `ebfFileCanWrite`

descritor responsavél pela identificação de funções que verificam a possibilidade de escrita em arquivos.

---

### `ebfFileClose`

Função que FECHA um ARQUIVO aberto para leitura ou escrita, onde %1 é a referência ao arquivo.

---

### `ebfFileCreate`

Responsavel pela criação de um novo arquivo.

---

### `ebfFileEoF`

Função que INDICA se já está no FIM do ARQUIVO, onde %1 é a referência ao arquivo. A função retorna
VERDADEIRO caso já esteja no fim do arquivo, caso contrário retorna FALSO.

---

### `ebfFileExists`

Verifica  a existência de um arquivo.

---

### `ebfFileFlush`

Função que DESCARREGA o conteúdo de um ARQUIVO para o meio físico, onde %1 é a referência
ao arquivo. A função não retorna valores.

---

### `ebfFileGetSize`

Função que retorna o TAMANHO do ARQUIVO em bytes, onde %1 é a referência ao arquivo.

---

### `ebfFileOpenReadWrite`

Descritor utilizada funções responsavéis pela abertura de de arquivos em modo de escrita e leitura.

---

### `ebfFileOpenToRead`

Função que ABRE um ARQUIVO para LEITURA, onde %1 é o nome do arquivo.
A função retorna uma referência para o arquvo do tipo VARIANTE.

---

### `ebfFileOpenToWrite`

Função que ABRE um ARQUIVO para ESCRITA, onde %1 é o nome do arquivo e %2 é um valor lógico onde:

- FALSO indica que o arquivo será aberto e seu conteúdo será sobrescrito.
- VERDADEIRO indica que o arquivo será aberto e escrito após o seu conteúdo existente.

A função retorna uma referência para o arquivo do tipo VARIANTE.

---

### `ebfFileRead`

Função que LÊ uma quantidade de caracteres de um ARQUIVO, onde %1 é a referência ao arquivo e %2
é a quantidade de caracteres a serem lidos. A função retorna a sequencia lida de caracteres do arquivo.

---

### `ebfFileReadLine`

Função que LÊ uma linha inteira de um ARQUIVO, onde %1 é a referência ao arquivo. A função retorna
a sequencia de caracteres até o final da linha.

---

### `ebfFirstDay`

Retorna a data com o primeiro dia do mês. com o ano e o mes passado por parametro

---

### `ebfFormChangeComponentValue`

Função utilizada para alterar valor de um componente.

---

### `ebfFormEditMode`

Colocar formulário em modo de edição

---

### `ebfFormGetComponent`

Descritor utilizado para função responsável por obter o componente de um formulário.

---

### `ebfFormGetComponentField`

Obter campo vinvulado a um componente no formulário

---

### `ebfFormGetComponentValue`

Obtém o valor de um componente onde, %1 é o formulario ao qual pertence o componente, e %2 é o componente do qual se deseja obter o valor.

---

### `ebfFormGetDatasetName`

Obter o nome do dataset vinculado a um formulario

---

### `ebfFormInsertMode`

Colocar formulário em mode de insersão

---

### `ebfFormOpenFilteredForm`

Abre um formuário e aplica um filtro.

---

### `ebfFormOpenSelectedRecord`

Descritor da função responsável por abrir um formulário em determinado registro.

---

### `ebfGetElementFromList`

Descritor utulizado para obter um elemento apartir de uma lista.

---

### `ebfGetGridDataset`

Descritor utilizado para função responsável por obter o DATASET de um formulário.

---

### `ebfGetNextGeneratorValue`

Próximo valor da sequencia.

---

### `ebfGetParser`

Converte um objeto do tipo inputstrean para um objeto do tipo kxmlParser, que é utilizado para manipular um XML.

---

### `ebfGetParserFromWS`

Abrir um XML apartir de um WebService.

---

### `ebfGetTimeSince70`

Descritor responsavel por retornar os milissegundos desde 1970 até a data que recebe como parametro.

---

### `ebfGridGetSelectedRow`

Essa função retorna o número da linha selecionada na grade. Informando apenas a Grade
Parâmetros:
%1. Nome da Grade

Retorno: 
Retorna o numero da linha selecionada.

---

### `ebfGridGetValue`

Essa função retorna o valor que está na Grade, a partir da informação da linha (a primeira linha da Grade é 
a linha "0" (zero)) e a coluna que deseja obter o valor.

Parâmetros:
%1. Componente Grade
%2. Número da Linha (N-1)
%3. Nome da Coluna

Retorno:
Valor obtido. (Letras)

---

### `ebfGridSetValue`

Essa função atribui um valor na Grade, informando o nome da grade, a linha, nome da coluna e o valor que deseja atribuir a respectiva linha e coluna.

Parâmetros:
1. Nome da Grade
2. Número da Linha (De 0 à N-1)
3. Nome da Coluna
4. Valor a ser atribuído

---

### `ebfInPort`

Função que LÊ um BYTE de uma PORTA serial, onde %1 é o número da porta. A função retorna o byte lido.

---

### `ebfIndexOf`

Função que retorna o ÍNDICE DA POSIÇÃO do texto representado por %1 em relação ao texto representado por %2. Caso não encontre %1 em %2 retorna ZERO.

---

### `ebfIntToHex(#inteiro)`

Função responsavé por converter um valor inteiro para bytes.

---

### `ebfLastDay`

Retorna a data com o último dia do mês. com o ano e o mes passado por parametro

---

### `ebfLastIndexOf`

Função que retorna o ÍNDICE DA POSIÇÃO DA ÚLTIMA OCORRÊNCIA do texto representado por %1 em relação ao texto representado por %2. Caso não encontre %1 em %2 retorna ZERO.

---

### `ebfLength`

Função que retorna o TAMANHO de um texto representado por %1.

---

### `ebfListLength`

Retorna o tamanho da lista passada por parametro

---

### `ebfListParamsCreate`

Cria Lista a partir de objetos passado por parametro

---

### `ebfNavDeleteCurrentRecord`

Exclui o registro atual

---

### `ebfNavEditCancel`

Cancela modo de edição

---

### `ebfNavEditSaveRecord`

Salva alterações

---

### `ebfNavIncludeCancel`

Cancela modo de insersão

---

### `ebfNavIncludeSaveRecord`

INcluir novo registro

---

### `ebfNavNextRecord`

Proximo registro

---

### `ebfNavPreviousRecord`

Registro anterior

---

### `ebfNewLine`

Retorna uma quantidade determinada de QUEBRAS DE LINHA, onde %1 é a quantidade desejada.

---

### `ebfOutPort`

Função que ENVIA um BYTE para uma PORTA serial, onde %1 é o número da porta e %2 é o byte que será
enviado. A função não retorna valores.

---

### `ebfRemoveSubstring`

Função que REMOVE uma sequencia de caracteres de um determinado texto, onde %1 é o texto de onde será removido, %2 é a posição inicial da sequencia a ser removida e %3 é a quantidade de caracteres a serem removidos a partir de %2.

---

### `ebfReplace`

Função que SUBSTITUI a primeira ocorrência de uma sequencia de caracteres por outra em um determinado texto, onde %1 é o texto original, %2 é a sequencia a ser substituída e %3 é a nova sequencia que irá substituir a %2.

---

### `ebfReplaceAll`

Função que SUBSTITUI TODAS as ocorrências de uma sequencia de caracteres por outra em um determinado texto, onde %1 é o texto original, %2 é a sequencia a ser substituída e %3 é a nova sequencia que irá substituir a %2.

---

### `ebfResultSetPrevious`

Retorna para o registro imediatamente anterior em uma tabela passada como parâmetro.

---

### `ebfSQLClose`

Função que FECHA uma variável do tipo TABELA representada por %1.

---

### `ebfSQLCommitTransaction`

Função que ENCERRA e CONFIRMA uma TRANSAÇÃO no banco de dados.

---

### `ebfSQLEOF`

Função que retorna VERDADEIRO se EXISTIR REGISTROS na tabela representada por %1, caso contrário retorna FALSO.

---

### `ebfSQLExecuteBatch`

Função que EXECUTA um bloco de COMANDOS SQL, onde %1 é o conjunto de comandos.

---

### `ebfSQLExecuteDynamicDelete`

Função que APAGA TODOS OS REGISTROS das tabelas passadas por parâmetro, onde %* são os nomes das tabelas.

---

### `ebfSQLExecuteQuery`

Formato de sintaxe para o comando SQL SELECT, onde %1 é o próprio comando SQL.

---

### `ebfSQLExecuteQueryUnmanaged`

Formato de sintaxe para o comando SQL SELECT, onde %1 é o próprio comando SQL.

---

### `ebfSQLExecuteUpdate`

Comando SQL para executar uma atualização, que pode ser de INSERT, UPDATE ou DELETE.

---

### `ebfSQLExists`

Formato de sintaxe da função EXISTS do SQL quando o parâmetro %1 ao invés de uma variável TABELA (CURSOR), for uma função
ABRIR CONSULTA (Single SELECT).

---

### `ebfSQLField`

Função que retorna o valor de um determinado campo de uma tabela do Banco de Dados, onde %1 é o nome da tabela e %2 é o nome do campo.

---

### `ebfSQLGetFieldFromForm`

Obtem o valor do campo especificado de um formulário especificado.

---

### `ebfSQLNext`

Função que AVANÇA para o PRÓXIMO REGISTRO de uma tabela, onde %1 é uma variável do tipo TABELA e os marcadores /* e */ representam a posição da lista de variáveis que contém os valores dos campos.

---

### `ebfSQLOpenTransaction`

Função que ABRE uma TRANSAÇÃO no banco de dados.

---

### `ebfSQLRollbackTransaction`

Função que CANCELA quaisquer modificações e ENCERRA uma TRANSAÇÃO no banco de dados.

---

### `ebfSQLSelectField`

Função que retorna o valor de um determinado campo de um SQL SELECT do Banco de Dados, onde %1 é o SELECT e %2 é o nome do campo.

---

### `ebfSearchSubstring`

Função que retorna VERDADEIRO caso o sequencia de caracteres contida em %1 exista em %2. Caso contrário retorna FALSO.

---

### `ebfSplit`

Separa o texto em um determinado caractere passado no 2° parâmetro e  retorna cada parte deste texto em uma posição de uma lista, %* represnta os parâmetros.

---

### `ebfStringReverse`

Função que recebe um TEXTO como parâmetro e retorna o texto INVERTIDO.

---

### `ebfStringToBase64(#letras)`

Função responsavél por converter uma stirng para base 64.

---

### `ebfSubstring`

Função que retorna uma SEQUENCIA DE CARACTERES de um determinado texto, onde %1 é o texto pesquisado, %2 é a posição inicial da sequencia e %3 é a quantidade de caracteres da sequencia.

---

### `ebfSubstringInverse`

Função que retorna uma SEQUENCIA DE CARACTERES de um determinado texto, onde %1 é o texto pesquisado, %2 é a posição inicial da sequencia e %3 é a quantidade de caracteres da sequencia, sendo que a contagem dos caracteres é feita do fim para o início do primeiro parâmetro.

---

### `ebfTextMD5`

Função que recebe um TEXTO como parâmetro e retorna o seu MD5 DIGEST em HEXADECIMAL.

---

### `ebfTimeOfDateTime`

Recebe como parâmetro uma data/hora e a retorna com a data modificada para  01/01/1900

---

### `ebfToLowerCase`

Função que retorna o texto representado por %1 convertido para texto em MINÚSCULO.

---

### `ebfToUpperCase`

Função que retorna o texto representado por %1 convertido para texto em MAIÚSCULO.

---

### `ebfTrim`

Função que REMOVE OS ESPAÇOS antes e depois do texto representado por %1

---

### `ebfWSCall`

Função que faz a chamada de um WebService

---

### `ebfXMLGetAttribute`

Obter atributo do elemento XML passado.

---

### `ebfXMLGetChildElement`

Obter filhos do XML

---

### `ebfXMLGetChildrenElement`

Obter filhos do elemento XML passado

---

### `ebfXMLGetElementValue`

Obter valores do elemento xml passado.

---

### `ebfXMLGetParentElement`

Obter pai do elemento xml.

---

### `ebfXMLGetRoot`

Obter raiz do XML.

---

### `ebfXMLOpenFromFile`

Chamada utilizada para abrir um XML apartir de um arquivo.

---

## Operadores (opr*)

### `oprAdd`

Função que executa a soma de 1..n parâmetros identifcados por %*.

---

### `oprAnd`

Função que retorna uma operação lógica E, onde %* representa 1..n parâmetros lógicos.

---

### `oprBetween`

Função que executa uma operação lógica ENTRE, onde %1 é o valor a ser testado, %2 é o valor inicial da faixa e %3 é o valor final da faixa. Caso %1 esteja entre a faixa determinada por %2 e %3 a operação retorna VERDADEIRO, caso contrário retorna FALSO.

---

### `oprDivide`

Função que executa uma operação de DIVISÃO entre dois números, onde %1 é o dividendo e %2 é o divisor.

---

### `oprFalse`

Função que retorna a constante lógica FALSO.

---

### `oprIf`

Função que executa uma condição SE. Caso a expressão lógica contida em %1 seja VERDADEIRA retorna o valor de %2, caso contrário
retorna o valor de %3.

---

### `oprMaximum`

Função que retorna o MAIOR número entre o conjunto de argumentos numéricos representados por %*.

---

### `oprMinimum`

Função que retorna o MENOR número entre o conjunto de argumentos numéricos representados por %*.

---

### `oprMod`

Função que retorna o RESTO DA DIVISÃO entre dois números, onde %1 é o dividendo e %2 é o divisor.

---

### `oprModulus`

Função que retorna o valor ABSOLUTO ou MÓDULO de um número qualquer onde %1 é o número a ser avaliado.

Ex:
O valor absoluto do número 7.4  é 7.4.
O valor absoluto do número -7.5 é 7.5.

---

### `oprMultiply`

Função que executa a multiplicação de 1..n parâmetros identifcados por %*.

---

### `oprNot`

Função que retorna uma operação lógica NÃO, onde %1 representa o valor lógico a ser negado.

---

### `oprOr`

Função que retorna uma operação lógica OU, onde %* representa 1..n parâmetros lógicos.

---

### `oprPow`

Função que retorna a POTÊNCIA de um número qualquer onde %1 é o número a ser elevado e %2 é a potência elevada.

---

### `oprRound`

Função que ARREDONDA um número decimal para o seu inteiro mais próximo onde %1 é o número decimal a ser arredondado.

Ex:
O resultado do arredondamento do número 7.4 é 7.0.
O resultado do arredondamento do número 7.5 é 8.0.

---

### `oprSqrt`

Função que retorna a RAIZ QUADRADA de um número qualquer onde %1 é o número a ser avaliado.

---

### `oprSubtract`

Função que executa a subtração de 1..n parâmetros identifcados por %*.

---

### `oprTrue`

Função que retorna a constante lógica VERDADEIRO.

---

### `oprTrunc`

Função que TRUNCA um número decimal para a sua parte inteira onde %1 é o número decimal a ser truncado.

Ex:
O resultado do truncamento do número 7.13242 é 7.
O resultado do truncamento do número 7.98635 é 7.

---

## Outros

### `AND`

Descritor lógico de conjunção E, onde %* representa 1..n parâmetros lógicos. Este descritor é utilizado para cláusulas WHERE dos comandos UPDATE e DELETE do SQL.

---

### `ActErrorMessage`

Formato da sintaxe de comando para envio de MENSAGENS de ERRO, onde %1 é a mensagem a ser exibida.

---

### `ActWarningMessage`

Formato da sintaxe de comando para envio de mensagens de ALERTA, onde %1 é a mensagem a ser exibida.

---

### `AmountIdentityText`

Representa a quantidade de identamento de todo o bloco de texto gerado. Caso o valor seja 0 (ZERO) não haverá identamento.

---

### `AsmGenerator`

Sinalizador que indica se na geração de código o fluxo a ser utilizado será de baixo ou alto nível. O valor "1" indica que será utilizado o fluxo de baixo nível e "0" de alto nível.

---

### `BooleanFormat`

Formato de representação para expressões lógicas ou booleanas.

---

### `NOT`

Descritor lógico de negação NÃO, onde %1 representa o parâmetro lógico a ser negado. Este descritor é utilizado para cláusulas WHERE dos comandos UPDATE e DELETE do SQL.

---

### `OR`

Descritor lógico de conjunção OU, onde %* representa 1..n parâmetros lógicos. Este descritor é utilizado para cláusulas WHERE dos comandos UPDATE e DELETE do SQL.

---

### `RemoveDelimiterNoParams`

Sinalizador que indica se na declaração de parâmetros de FUNCTIONS e PROCEDURES removerá ou não os parênteses. Caso o valor do descritor seja 1, quando não houver parâmetros na declaração o gerador de código removerá os parênteses. Caso contrário permanecerá os parênteses vazios "()".

---

### `RemoveInternalVariables`

Sinalizador que indica se haverá a declaração de variáveis internas, utilizadas no comando FETCH. Caso o valor do descritor seja 0, quando houver um código SQL executando um comando SELECT, para cada campo na lista do SELECT será declarada uma variável que corresponde ao tipo do campo. Caso o valor seja 1, essas variáveis não serão declaradas.

---

### `SQLDelete`

Formato de sintaxe do comando SQL DELETE, onde %1 é o nome da tabela do banco de dados.

---

### `SQLInsert`

Formato de sintaxe do comando SQL INSERT INTO, onde %1 é o nome da tabela do banco de dados, %2 é a lista de campos e %3 é a lista de valores.

---

### `SQLRestriction`

Formato da sintaxe de restrição para comandos SQL, onde %1 é a expressão lógica restritiva.

---

### `SQLUpdate`

Formato de sintaxe do comando SQL UPDATE, onde %1 é o nome da tabela do banco de dados e %2 é a lista de campos.

---

### `StringDelimiterAtEnd`

Representa o CARACTER utilizado para DELIMITAR o FINAL de constantes do tipo LETRA. Na maioria dos
casos as constantes são delimitadas por aspas simples ('), mas há casos onde é necessário utilizar
aspas dupla (").

---

### `StringDelimiterAtStart`

Representa o CARACTER utilizado para DELIMITAR o INÍCIO de constantes do tipo LETRA. Na maioria dos
casos as constantes são delimitadas por aspas simples ('), mas há casos onde é necessário utilizar
aspas dupla (").

---

### `SubqueryInCondition`

Sinalizador para permitir compilação do fluxo permitindo subselect em operações lógicas. Caso o banco de dados seja compatível com esse contexto o valor atribuído deverá ser 1, caso contrário 0.

---

### `Tabela`

Tipo de dados que representa um conjunto de registros de uma tabela ou consulta no banco de dados.

---

### `TriggerAfter`

Palavra reservada para TRIGGER de AFTER

---

### `TriggerAfterDel`

Informa a tabela virtual que deverá ser utilizada na passagem de parâmetros das regras para as triggers de AFTER DELETE.

---

### `TriggerAfterIns`

Informa a tabela virtual que deverá ser utilizada na passagem de parâmetros das regras para as triggers de AFTER INSERT.

---

### `TriggerAfterUpd`

Informa a tabela virtual que deverá ser utilizada na passagem de parâmetros das regras para as triggers de AFTER UPDATE.

---

### `TriggerBefore`

Palavra reservada para TRIGGER de BEFORE

---

### `TriggerBeforeDel`

Informa a tabela virtual que deverá ser utilizada na passagem de parâmetros das regras para as triggers de BEFORE DELETE.

---

### `TriggerBeforeIns`

Informa a tabela virtual que deverá ser utilizada na passagem de parâmetros das regras para as triggers de BEFORE INSERT.

---

### `TriggerBeforeUpd`

Informa a tabela virtual que deverá ser utilizada na passagem de parâmetros das regras para as triggers de BEFORE UPDATE.

---

### `TriggerName`

Formato de composição do NOME da TRIGGER, onde %1 é o nome da tabela e %2 é o tipo ou evento da trigger.

Ex:   TR_%1_%2
  >>  TR_CLIENTE_INSERT

---

### `TriggerTabNew`

Nome da TABELA VIRTUAL que armazena os novos valores do registro quando inserido ou alterado no contexto de uma TRIGGER.

---

### `TriggerTabOld`

Nome da TABELA VIRTUAL que armazena os antigos valores do registro quando alterado ou excluído no contexto de uma TRIGGER.

---

### `TriggerTypeDel`

Descrição do TIPO de declaração da TRIGGER para o contexto de EXCLUSÃO.

---

### `TriggerTypeIns`

Descrição do TIPO de declaração da TRIGGER para o contexto de INSERÇÃO.

---

### `TriggerTypeUpd`

Descrição do TIPO de declaração da TRIGGER para o contexto de ALTERAÇÃO.

---

### `Variante`

Tipo de dados que representa um valor VARIÁVEL, ou seja, de tipo indeterminado ou genérico, podendo
representar valores de vários tipos diferentes ou abstratos, como objetos e ponteiros de referência.

---

### `getDayOfWeek`

Função que retorna o dia da semana que pertence a data passada por parametro

---

### `newMetodo`

Cria um novo metodo no fluxo.

---

### `soEqual`

Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo
compatível com o primeiro, retornando VERDADEIRO se os termos forem iguais e FALSO se forem diferentes. Este descritor é utilizado
em cláusulas WHERE do SQL.

---

### `soGreaterThan`

Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o
primeiro, retornando VERDADEIRO se o primeiro termo for maior que o segundo. Caso contrário retorna FALSO. Este descritor é utilizado em
cláusulas WHERE do SQL.

---

### `soGreaterThanOrEqualTo`

Formato da sintaxe de comparação MAIOR OU IGUAL A, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível
com o primeiro, retornando VERDADEIRO se o primeiro termo for maior ou igual ao segundo. Caso contrário retorna FALSO. Este descritor é
utilizado em cláusulas WHERE do SQL.

---

### `soIsNull`

Formato da sintaxe de comparação de igualdade com a constante NULO, onde %1 é o campo da tabela do banco de dados a ser comparado.

---

### `soLessThan`

Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o
primeiro, retornando VERDADEIRO se o primeiro termo for menor que o segundo. Caso contrário retorna FALSO. Este descritor é utilizado em
cláusulas WHERE do SQL.

---

### `soLessThanOrEqualTo`

Formato da sintaxe de comparação MENOR OU IGUAL A, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível
com o primeiro, retornando VERDADEIRO se o primeiro termo for menor ou igual ao segundo. Caso contrário retorna FALSO. Este descritor é
utilizado em cláusulas WHERE do SQL.

---

### `soLike`

Formato da sintaxe de comparação LIKE, onde %1 é o conjunto de caracteres indicando o valor na comparação CONTENDO EM. Se o valor representado por %1 for encontrado em qualquer posição do valor comparado retornará VERDADEIRO. Caso contrário retorna FALSO. Este descritor é utilizado em cláusulas WHERE do SQL.

---

### `soLikeEnd`

Formato da sintaxe de comparação LIKE, onde %1 é o conjunto de caracteres indicando o valor na comparação TERMINANDO EM. Se o valor representado por %1 for encontrado na posição final do valor comparado retornará VERDADEIRO. Caso contrário retorna FALSO. Este descritor é utilizado em cláusulas WHERE do SQL.

---

### `soLikeStarting`

Formato da sintaxe de comparação LIKE, onde %1 é o conjunto de caracteres indicando o valor na comparação INICIANDO EM. Se o valor representado por %1 for encontrado na posição inicial do valor comparado retornará VERDADEIRO. Caso contrário retorna FALSO. Este descritor é utilizado em cláusulas WHERE do SQL.

---

### `soNotEqual`

Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo compatível com o primeiro, retornando VERDADEIRO se os termos forem diferentes e FALSO se forem iguais. Este descritor é utilizado em cláusulas WHERE do SQL.

---

### `sqlAdd`

Função que retorna o somatório de valores de 1..n parâmetros em uma instrução SQL.

---

### `sqlAnd`

Operador lógico de conjunção E, onde %1 representa o primeiro termo lógico e %2 o segundo termo lógico da conjunção. Este descritor é utilizado para cláusulas WHERE do SQL.

---

### `sqlAvg`

Função que retorna a MÉDIA de um campo numérico contido em uma instrução SQL, onde %1 é o nome do campo.

---

### `sqlConcat`

Função que retorna a concatenação de um texto de 1..n parâmetros representados por %* em uma instrução SQL.

---

### `sqlContaining`

Formato da sintaxe de comparação LIKE, onde %1 é o conjunto de caracteres indicando o valor na comparação CONTENDO EM. Se o valor representado por %1 for encontrado em qualquer posição do valor comparado retornará VERDADEIRO. Caso contrário retorna FALSO. Utilizado em comparações de instruções SQL.

---

### `sqlDivide`

Função que executa uma operação de DIVISÃO entre dois números, onde %1 é o dividendo e %2 é o divisor, em uma instrução SQL.

---

### `sqlEnding`

Formato da sintaxe de comparação LIKE, onde %1 é o conjunto de caracteres indicando o valor na comparação TERMINANDO EM. Se o valor representado por %1 for encontrado na posição final do valor comparado retornará VERDADEIRO. Caso contrário retorna FALSO. Utilizado em comparações de instruções SQL.

---

### `sqlMultiply`

Função que executa a multiplicação de 1..n parâmetros identifcados por %* em uma instrução SQL.

---

### `sqlNot`

Operador lógico de negação NÃO, onde %1 representa o valor lógico a ser negado. Este descritor é utilizado para cláusulas WHERE do SQL.

---

### `sqlOr`

Operador lógico de disjunção OU, onde %1 representa o primeiro termo lógico e %2 representa o segundo termo lógico da disjunção. Este descritor é utilizado para cláusulas WHERE do SQL.

---

### `sqlStarting`

Formato da sintaxe de comparação LIKE, onde %1 é o conjunto de caracteres indicando o valor na comparação INICIANDO EM. Se o valor representado por %1 for encontrado na posição inicial do valor comparado retornará VERDADEIRO. Caso contrário retorna FALSO. Utilizado em comparações de instruções SQL.

---

### `sqlSubtract`

Função que retorna a subtração de valores de 1..n parâmetros em uma instrução SQL.

---

## Tipos de Dados

### `Componente`

Tipo de dados que representa um componente

---

### `Data`

Tipo de dados que representa uma "DATA" válida.

---

### `Formulário`

Tipo de dados que representa o componente FORMULÁRIO

---

### `Fracionado`

Tipo de dados que representa um valor numérico de alta precisão.

---

### `Hora`

Tipo de dados que representa um horário válido.

---

### `Inteiro`

Tipo de dados que representa um valor numérico inteiro e sem precisão.

---

### `Letras`

Tipo de dados que representa um conjunto de caracteres alfa-numéricos, onde %1 é o tamanho máximo que este conjunto poderá representar.

---

### `Lógico`

Tipo de dados que representa um valor lógico assumindo apenas um conjunto de dois valores, onde um deles representará um valor VERDADEIRO e o outro um valor FALSO.

---

## Compiladores por Banco de Dados

| Database | Descritor | Valor |
|----------|-----------|-------|
|  | `ebfGetNextGeneratorValue` |  |
|  | `ActErrorMessage` |  |
|  | `ActErrorMessage` |  |
|  | `ActErrorMessage` |  |
|  | `ActErrorMessage` |  |
|  | `ActErrorMessage` |  |
|  | `AND` |  |
|  | `AND` |  |
|  | `AND` |  |
|  | `AND` |  |
|  | `AND` |  |
|  | `AND` |  |
|  | `BeginWhile` |  |
|  | `BeginWhile` |  |
|  | `BeginWhile` |  |
|  | `BeginWhile` |  |
|  | `BeginWhile` |  |
|  | `BeginWhile` |  |
|  | `BodyFunction` |  |
|  | `BodyFunction` |  |
|  | `BodyFunction` |  |
|  | `BodyFunction` |  |
|  | `BodyFunction` |  |
|  | `BodyFunction` |  |
|  | `BodyProcedure` |  |
|  | `BodyProcedure` |  |
|  | `BodyProcedure` |  |
|  | `BodyProcedure` |  |
|  | `BodyProcedure` |  |
|  | `BodyProcedure` |  |
|  | `BodyTrigger` |  |
|  | `BodyTrigger` |  |
|  | `BodyTrigger` |  |
|  | `BodyTrigger` |  |
|  | `BodyTrigger` |  |
|  | `BodyTrigger` |  |
|  | `BooleanFormat` |  |
|  | `BooleanFormat` |  |
|  | `BooleanFormat` |  |
|  | `BooleanFormat` |  |
|  | `BooleanFormat` |  |
|  | `BooleanFormat` |  |
|  | `CallRule` |  |
|  | `CallRule` |  |
|  | `CallRule` |  |
|  | `CallRule` |  |
|  | `CallRule` |  |
|  | `CallRule` |  |
|  | `CallRuleFormatExpression` |  |
|  | `CallRuleFormatExpression` |  |
|  | `CallRuleFormatExpression` |  |
|  | `CallRuleFormatExpression` |  |
|  | `CallRuleInsideExpression` |  |
|  | `CallRuleInsideExpression` |  |
|  | `CallRuleInsideExpression` |  |
|  | `CallRuleInsideExpression` |  |
|  | `CallRuleInsideExpression` |  |
|  | `CallRuleInsideExpression` |  |
|  | `CallRuleParamSeparator` |  |
|  | `CallRuleParamSeparator` |  |
|  | `CallRuleParamSeparator` |  |
|  | `CallRuleParamSeparator` |  |
|  | `CallRuleParamSeparator` |  |
|  | `CallRuleParamSeparator` |  |
|  | `CallRuleReturn` |  |
|  | `CallRuleReturn` |  |
|  | `CommentBegin` |  |
|  | `CommentBegin` |  |
|  | `CommentBegin` |  |
|  | `CommentBegin` |  |
|  | `CommentBegin` |  |
|  | `CommentBegin` |  |
|  | `CommentEnd` |  |
|  | `CommentEnd` |  |
|  | `CommentEnd` |  |
|  | `CommentEnd` |  |
|  | `CommentEnd` |  |
|  | `CommentEnd` |  |
|  | `CommentLine` |  |
|  | `CommentLine` |  |
|  | `CommentLine` |  |
|  | `CommentLine` |  |
|  | `CommentLine` |  |
|  | `CommentLine` |  |
|  | `const_data` |  |
|  | `const_data` |  |
|  | `const_data` |  |
|  | `const_data` |  |
|  | `const_data` |  |
|  | `const_data` |  |
|  | `const_false` |  |
|  | `const_false` |  |
|  | `const_false` |  |
|  | `const_false` |  |
|  | `const_false` |  |
|  | `const_false` |  |
|  | `const_hora` |  |
|  | `const_hora` |  |
|  | `const_hora` |  |
|  | `const_hora` |  |

---

*Documentação gerada automaticamente a partir de FR_COMPILADOR/FR_COMPILADOR_DATABASE*

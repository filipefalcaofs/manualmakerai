# FR_COMPILADOR

[← Voltar para Dados das Tabelas](README.md)

## FR_COMPILADOR

*Alias:* fr_compilador

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CPL_DESCRITOR | string | 80 |
| CPL_ESPECIFICACAO | string | 350 |

**Dados (302 registros):**

| CPL_DESCRITOR | CPL_ESPECIFICACAO |
|---|---|
| ActErrorMessage | Formato da sintaxe de comando para envio de MENSAGENS de ERRO, onde %1 é a mensagem a ser exibida. |
| ActWarningMessage | Formato da sintaxe de comando para envio de mensagens de ALERTA, onde %1 é a mensagem a ser exibida. |
| AmountIdentityText | Representa a quantidade de identamento de todo o bloco de texto gerado. Caso o valor seja 0 (ZERO) não haverá identam... |
| AND | Descritor lógico de conjunção E, onde %* representa 1..n parâmetros lógicos. Este descritor é utilizado para cláusula... |
| AsmGenerator | Sinalizador que indica se na geração de código o fluxo a ser utilizado será de baixo ou alto nível. O valor "1" indic... |
| BeginWhile | Início do bloco "FAÇA ENQUANTO" que representa o início de um LAÇO para uma determinada condição lógica passada como ... |
| ebfGetNextGeneratorValue | Próximo valor da sequencia. |
| BodyFunction | Formato do corpo de declaração de FUNÇÕES, onde %1 é o nome da função, %2 é a lista de parâmetros, %3 é o bloco decla... |
| BodyProcedure | Formato do corpo de declaração de PROCEDIMENTOS, onde %1 é o nome do procedimento, %2 é a lista de parâmetros, %3 é o... |
| BodyTrigger | Formato do corpo de declaração de TRIGGERS, onde os parâmetros são:  %1 Nome da trigger %2 Nome da tabela %3 Tipo da ... |
| BooleanFormat | Formato de representação para expressões lógicas ou booleanas. |
| CallRule | Formato de sintaxe para chamada de REGRAS onde %1 é o nome da regra e %2 representa a lista de parâmetros, caso existam. |
| CallRuleFormatExpression | Formato de sintaxe para chamada de REGRAS contidas em EXPRESSÕES, onde %1 é o nome da regra e %2 representa a lista d... |
| CallRuleInsideExpression | Descritor que determina se poderá haver CHAMADAS de REGRAS dentro de EXPRESSÕES, permitindo que as regras retornem va... |
| CallRuleParamSeparator | Símbolo utilizado como SEPARADOR da lista de parâmetros na chamada de EXECUÇÃO da procedure/função quando for subregra. |
| CallRuleReturn | Formato de sintaxe para o parâmetro de SAÍDA ou de RETORNO na chamada de uma regra, onde %1 é o nome da variável que ... |
| CommentBegin | Conjunto de caracteres que indicam o início de bloco de comentário. |
| CommentEnd | Conjunto de caracteres que indicam o fim de bloco de comentário. |
| CommentInitialColumn | Define a coluna em que deve iniciar a linha de comentário (CommentLine). O valor 0 (zero) indica texto livre, ou seja... |
| CommentLine | Conjunto de caracteres que indicam uma linha de comentário. |
| CommentStyle | Define o estilo de comentário que será utilizado na geração do código. Os possíveis valores são:   B (block) indica q... |
| Componente | Tipo de dados que representa um componente |
| const_data | Formato da constante do tipo DATA. |
| const_false | Valor de representação da constante lógica FALSO. |
| const_hora | Formato da constante do tipo HORA. |
| const_null | Valor de representação da constante NULO. |
| const_true | Valor de representação da constante lógica VERDADEIRO. |
| Data | Tipo de dados que representa uma "DATA" válida. |
| DecimalSeparator | Símbolo utilizado como separador de decimais em valores fracionados. |
| DeclareCursorBefore | Descritor que armazena apenas os valores 0 ou 1, indicando que a definição SQL do cursor deverá ser feita na declaraç... |
| DeclareParamIn | Formato de declaração de parâmetros de entrada em Procedures e Stored Procedures, onde %1 é o tipo e %2 é o identific... |
| DeclareParamInVar | Sinalizador que declara todo parâmetro da regra na sessão de declaração de variáveis. |
| DeclareParamOut | Formato de declaração de parâmetros de SAÍDA em procedures e funções, onde %1 é o tipo e %2 é o identificador. |
| DeclareParams | Formato de declaração de parâmetros de entrada e saída na assinatura do procedimento ou função, onde %1 é a lista de ... |
| DeclareVar | Formato de DECLARAÇÃO de VARIÁVEIS, onde %1 é o tipo da variável e %2 é o identificador. |
| DropFunction | Sequencia de comandos que executam um DROP no objeto FUNCTION do banco de dados, testando a existência do objeto evit... |
| DropProcedure | Sequencia de comandos que executam um DROP no objeto PROCEDURE do banco de dados, testando a existência do objeto evi... |
| DropTrigger | Sequencia de comandos que executam um DROP no objeto TRIGGER do banco de dados, testando a existência do objeto evita... |
| ebfAddRMSRecord | Função para adcionar registros. |
| ebfAlterRMSRecord | Descritor da função para alterar dados de um registro. |
| ebfAsciiToBinary | Função responsavél por converter caracteres normais para valores binarios. |
| ebfBase64ToBinary(#letras) | Função responsavél por converter uma base64 para binario. |
| ebfBase64ToString(#letras) | Função para converter uma string para base64, recebendo como parametro uma string. |
| ebfBinaryToAscii(#letras) | Função responsável por converter um texto em formato binário para texto normal. |
| ebfBinaryToBase64(#letras) | Função responsável por converter um texto BINÁRIO para BASE64. |
| ebfButtonNew | Cria um novo botão |
| ebfCallPhoneNumber | Descritor utilizado para função que irá executar uma chamada telefônica a partir de uma String contendo o número tele... |
| ebfCharacter | Retorna o CARACTER de um determinado código ASCII, representado por %1. |
| ebfCharAt | Função que retorna o CARACTER na posição determinada por %2 na sequencia de letras representada por %1. |
| ebfCheckBoxNew | Cria um novo CheckBox |
| ebfChrToAscii | Função que retorna o código ASCII de um determinado caracter, onde %1 é o caracter a ser convertido. |
| ebfComboBoxNew | Cria um novo ComboBox |
| ebfConcat | Função que retorna a concatenação de um texto de 1..n parâmetros representados por %*. |
| ebfConcatLeft | Função que retorna a concatenação do texto passado no 1º parâmetro com o caracter passado no 2º parâmetro, sendo que ... |
| ebfConcatRight | Função que retorna a concatenação do texto passado no 1º parâmetro com o caracter passado no 2º parâmetro, sendo que ... |
| ebfConvertBase64 | Chamada para função que converte valores para base64. |
| ebfConvTokxmlParser | Converte um objeto para kxmlParser. |
| ebfCreateDate | Cria uma data a partir da passagem do ano, mês, dia, hora, minuto e segundo. |
| ebfDatasetFirst(#variante) | Descritor para função responsavél por mover para o primeiro registro do dataset. |
| ebfDatasetLast(#variante) | Passa para o utimo registro de um datatset. |
| ebfDatasetNext(#variante) | Passa para o próximo registro de um dataset, que é passado como parâmetro. |
| ebfDatasetPrevious(#variante) | Passa para o regiatro anterior de um dataset. |
| ebfDateDate | Função que retorna apenas a DATA da data e hora representada por %1. |
| ebfDateDay | Função que retorna apenas o DIA da data representada por %1. |
| ebfDateDayDifference | Função que retorna a DIFERENÇA de DIAS entre duas datas, onde %1 é a data maior e %2 a data menor. |
| ebfDateHour | Função que retorna apenas a HORA da data e hora representada por %1. |
| ebfDateIncDay | Função que INCREMENTA DIA a uma data, onde %1 é a data e %2 é o quantidade de dias a ser incrementado. |
| ebfDateIncMonth | Função que INCREMENTA MÊS a uma data, onde %1 é a data e %2 é o quantidade de meses a ser incrementado. |
| ebfDateIncYear | Função que INCREMENTA ANO a uma data, onde %1 é a data e %2 é o quantidade de anos a ser incrementado. |
| ebfDateMinute | Função que retorna apenas os MINUTOS da data e hora representada por %1. |
| ebfDateMonth | Função que retorna apenas o MÊS da data representada por %1. |
| ebfDateMonthDifference | Função que retorna a DIFERENÇA de MESES entre duas datas, onde %1 é a data maior e %2 a data menor. |
| ebfDateSecond | Função que retorna apenas os SEGUNDOS da data e hora representada por %1. |
| ebfDateToday | Função que retorna a DATA ATUAL do sistema. |
| ebfDateYear | Função que retorna apenas o ANO da data representada por %1. |
| ebfDateYearDifference | Função que retorna a DIFERENÇA de ANOS entre duas datas, onde %1 é a data maior e %2 a data menor. |
| ebfDeleteRMSRecord | Descritor da função para deletar um registro que atenda a um determinado criterio |
| ebfEditNew | Cria uma nova Caixa de Texto |
| ebfFileAppend | Função que ADICIONA TEXTO no final de um arquivo, onde %1 é a referência ao arquivo e %2 é o texto a ser adicionado. ... |
| ebfFileCanRead | Descritor utilizado para funções que fazem verificação de possibilidade de leitura de um arquivo. |
| ebfFileCanWrite | descritor responsavél pela identificação de funções que verificam a possibilidade de escrita em arquivos. |
| ebfFileClose | Função que FECHA um ARQUIVO aberto para leitura ou escrita, onde %1 é a referência ao arquivo. |
| ebfFileCreate | Responsavel pela criação de um novo arquivo. |
| ebfFileEoF | Função que INDICA se já está no FIM do ARQUIVO, onde %1 é a referência ao arquivo. A função retorna VERDADEIRO caso j... |
| ebfFileExists | Verifica  a existência de um arquivo. |
| ebfFileFlush | Função que DESCARREGA o conteúdo de um ARQUIVO para o meio físico, onde %1 é a referência ao arquivo. A função não re... |
| ebfFileGetSize | Função que retorna o TAMANHO do ARQUIVO em bytes, onde %1 é a referência ao arquivo. |
| ebfFileOpenReadWrite | Descritor utilizada funções responsavéis pela abertura de de arquivos em modo de escrita e leitura. |
| ebfFileOpenToRead | Função que ABRE um ARQUIVO para LEITURA, onde %1 é o nome do arquivo. A função retorna uma referência para o arquvo d... |
| ebfFileOpenToWrite | Função que ABRE um ARQUIVO para ESCRITA, onde %1 é o nome do arquivo e %2 é um valor lógico onde:  - FALSO indica que... |
| ebfFileRead | Função que LÊ uma quantidade de caracteres de um ARQUIVO, onde %1 é a referência ao arquivo e %2 é a quantidade de ca... |
| ebfFileReadLine | Função que LÊ uma linha inteira de um ARQUIVO, onde %1 é a referência ao arquivo. A função retorna a sequencia de car... |
| ebfFirstDay | Retorna a data com o primeiro dia do mês. com o ano e o mes passado por parametro |
| ebfFormChangeComponentValue | Função utilizada para alterar valor de um componente. |
| ebfFormEditMode | Colocar formulário em modo de edição |
| ebfFormGetComponent | Descritor utilizado para função responsável por obter o componente de um formulário. |
| ebfFormGetComponentField | Obter campo vinvulado a um componente no formulário |
| ebfFormGetComponentValue | Obtém o valor de um componente onde, %1 é o formulario ao qual pertence o componente, e %2 é o componente do qual se ... |
| ebfFormGetDatasetName | Obter o nome do dataset vinculado a um formulario |
| ebfFormInsertMode | Colocar formulário em mode de insersão |
| ebfFormOpenFilteredForm | Abre um formuário e aplica um filtro. |
| ebfFormOpenSelectedRecord | Descritor da função responsável por abrir um formulário em determinado registro. |
| ebfGetElementFromList | Descritor utulizado para obter um elemento apartir de uma lista. |
| ebfGetGridDataset | Descritor utilizado para função responsável por obter o DATASET de um formulário. |
| ebfGetParser | Converte um objeto do tipo inputstrean para um objeto do tipo kxmlParser, que é utilizado para manipular um XML. |
| ebfGetParserFromWS | Abrir um XML apartir de um WebService. |
| ebfGetTimeSince70 | Descritor responsavel por retornar os milissegundos desde 1970 até a data que recebe como parametro. |
| ebfXMLGetChildrenElement | Obter filhos do elemento XML passado |
| ebfGridGetSelectedRow | Essa função retorna o número da linha selecionada na grade. Informando apenas a Grade Parâmetros: %1. Nome da Grade  ... |
| ebfGridGetValue | Essa função retorna o valor que está na Grade, a partir da informação da linha (a primeira linha da Grade é  a linha ... |
| ebfGridSetValue | Essa função atribui um valor na Grade, informando o nome da grade, a linha, nome da coluna e o valor que deseja atrib... |
| ebfIndexOf | Função que retorna o ÍNDICE DA POSIÇÃO do texto representado por %1 em relação ao texto representado por %2. Caso não... |
| ebfInPort | Função que LÊ um BYTE de uma PORTA serial, onde %1 é o número da porta. A função retorna o byte lido. |
| ebfIntToHex(#inteiro) | Função responsavé por converter um valor inteiro para bytes. |
| ebfLastDay | Retorna a data com o último dia do mês. com o ano e o mes passado por parametro |
| ebfLastIndexOf | Função que retorna o ÍNDICE DA POSIÇÃO DA ÚLTIMA OCORRÊNCIA do texto representado por %1 em relação ao texto represen... |
| ebfLength | Função que retorna o TAMANHO de um texto representado por %1. |
| ebfListLength | Retorna o tamanho da lista passada por parametro |
| ebfListParamsCreate | Cria Lista a partir de objetos passado por parametro |
| ebfNavDeleteCurrentRecord | Exclui o registro atual |
| ebfNavEditCancel | Cancela modo de edição |
| ebfNavEditSaveRecord | Salva alterações |
| ebfNavIncludeCancel | Cancela modo de insersão |
| ebfNavIncludeSaveRecord | INcluir novo registro |
| ebfNavNextRecord | Proximo registro |
| ebfNavPreviousRecord | Registro anterior |
| ebfNewLine | Retorna uma quantidade determinada de QUEBRAS DE LINHA, onde %1 é a quantidade desejada. |
| ebfOutPort | Função que ENVIA um BYTE para uma PORTA serial, onde %1 é o número da porta e %2 é o byte que será enviado. A função ... |
| ebfRemoveSubstring | Função que REMOVE uma sequencia de caracteres de um determinado texto, onde %1 é o texto de onde será removido, %2 é ... |
| ebfReplace | Função que SUBSTITUI a primeira ocorrência de uma sequencia de caracteres por outra em um determinado texto, onde %1 ... |
| ebfReplaceAll | Função que SUBSTITUI TODAS as ocorrências de uma sequencia de caracteres por outra em um determinado texto, onde %1 é... |
| ebfResultSetPrevious | Retorna para o registro imediatamente anterior em uma tabela passada como parâmetro. |
| ebfSearchSubstring | Função que retorna VERDADEIRO caso o sequencia de caracteres contida em %1 exista em %2. Caso contrário retorna FALSO. |
| ebfSplit | Separa o texto em um determinado caractere passado no 2° parâmetro e  retorna cada parte deste texto em uma posição d... |
| ebfSQLClose | Função que FECHA uma variável do tipo TABELA representada por %1. |
| ebfSQLCommitTransaction | Função que ENCERRA e CONFIRMA uma TRANSAÇÃO no banco de dados. |
| ebfSQLEOF | Função que retorna VERDADEIRO se EXISTIR REGISTROS na tabela representada por %1, caso contrário retorna FALSO. |
| ebfSQLExecuteBatch | Função que EXECUTA um bloco de COMANDOS SQL, onde %1 é o conjunto de comandos. |
| ebfSQLExecuteDynamicDelete | Função que APAGA TODOS OS REGISTROS das tabelas passadas por parâmetro, onde %* são os nomes das tabelas. |
| ebfSQLExecuteQuery | Formato de sintaxe para o comando SQL SELECT, onde %1 é o próprio comando SQL. |
| ebfSQLExecuteQueryUnmanaged | Formato de sintaxe para o comando SQL SELECT, onde %1 é o próprio comando SQL. |
| ebfSQLExecuteUpdate | Comando SQL para executar uma atualização, que pode ser de INSERT, UPDATE ou DELETE. |
| ebfSQLExists | Formato de sintaxe da função EXISTS do SQL quando o parâmetro %1 ao invés de uma variável TABELA (CURSOR), for uma fu... |
| ebfSQLField | Função que retorna o valor de um determinado campo de uma tabela do Banco de Dados, onde %1 é o nome da tabela e %2 é... |
| ebfSQLGetFieldFromForm | Obtem o valor do campo especificado de um formulário especificado. |
| ebfSQLNext | Função que AVANÇA para o PRÓXIMO REGISTRO de uma tabela, onde %1 é uma variável do tipo TABELA e os marcadores /* e *... |
| ebfSQLOpenTransaction | Função que ABRE uma TRANSAÇÃO no banco de dados. |
| ebfSQLRollbackTransaction | Função que CANCELA quaisquer modificações e ENCERRA uma TRANSAÇÃO no banco de dados. |
| ebfSQLSelectField | Função que retorna o valor de um determinado campo de um SQL SELECT do Banco de Dados, onde %1 é o SELECT e %2 é o no... |
| ebfStringReverse | Função que recebe um TEXTO como parâmetro e retorna o texto INVERTIDO. |
| ebfStringToBase64(#letras) | Função responsavél por converter uma stirng para base 64. |
| ebfSubstring | Função que retorna uma SEQUENCIA DE CARACTERES de um determinado texto, onde %1 é o texto pesquisado, %2 é a posição ... |
| ebfSubstringInverse | Função que retorna uma SEQUENCIA DE CARACTERES de um determinado texto, onde %1 é o texto pesquisado, %2 é a posição ... |
| ebfTextMD5 | Função que recebe um TEXTO como parâmetro e retorna o seu MD5 DIGEST em HEXADECIMAL. |
| ebfTimeOfDateTime | Recebe como parâmetro uma data/hora e a retorna com a data modificada para  01/01/1900 |
| ebfToLowerCase | Função que retorna o texto representado por %1 convertido para texto em MINÚSCULO. |
| ebfToUpperCase | Função que retorna o texto representado por %1 convertido para texto em MAIÚSCULO. |
| ebfTrim | Função que REMOVE OS ESPAÇOS antes e depois do texto representado por %1 |
| ebfWSCall | Função que faz a chamada de um WebService |
| ebfXMLGetAttribute | Obter atributo do elemento XML passado. |
| ebfXMLGetChildElement | Obter filhos do XML |
| ebfXMLGetElementValue | Obter valores do elemento xml passado. |
| ebfXMLGetParentElement | Obter pai do elemento xml. |
| ebfXMLGetRoot | Obter raiz do XML. |
| ebfXMLOpenFromFile | Chamada utilizada para abrir um XML apartir de um arquivo. |
| EndWhile | END |
| EscapeStrings | Lista de correlações para SUBSTITUIÇÃO em constantes do tipo LETRAS. Consiste em uma lista de pares de strings utiliz... |
| ExecuteAfterTrigger | Representa um ou um conjunto de comandos SQL que serão executados após a criação da TRIGGER através do descritor "Bod... |
| FormatSQLField | Formato de apresentação da constante CAMPO, onde %1 é o número de ordem do campo na consulta e %2 é o nome do campo. |
| FormatSQLParam | Formato de apresentação dos parâmetros no código SQL, onde %1 é o parâmetro do SQL que pode ser uma constante, uma va... |
| FormatVar | Formato de apresentação das variáveis no corpo da regra (Function/Procedure) que contém código SQL, onde %1 é nome da... |
| Formulário | Tipo de dados que representa o componente FORMULÁRIO |
| Fracionado | Tipo de dados que representa um valor numérico de alta precisão. |
| getDayOfWeek | Função que retorna o dia da semana que pertence a data passada por parametro |
| Hora | Tipo de dados que representa um horário válido. |
| IFBegin | Formato da sintaxe do comando IF, onde %1 é a expressão condicional que retornará VERDADEIRO ou FALSO. |
| IFElse | Formato da sintaxe do bloco ELSE do comando IF, onde será finalizado o primeiro bloco executado quando a condição do ... |
| IFEnd | Formato da sintaxe do fim de bloco do comando IF, onde indica o fim de execução do bloco de comandos. |
| Inteiro | Tipo de dados que representa um valor numérico inteiro e sem precisão. |
| isDiferent | Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser ... |
| isDiferent(#inteiro#letras) | Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo ter... |
| isDiferent(#letras#inteiro) | Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo term... |
| isDiferent(#letras#letras) | Descritor para função de verificação de iugualdade entre Strings |
| isDiferent(#lógico#lógico) | Formato da sintaxe de comparação de DIFERENÇA LÓGICA, onde %1 é o primeiro termo do tipo LÓGICO e %2 é o segundo term... |
| isEqual | Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser ... |
| isEqual(#inteiro#letras) | Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo ter... |
| isEqual(#letras#inteiro) | Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo term... |
| isEqual(#letras#letras) | Função para  verificação de igualdade entra 2 Strings |
| isEqual(#lógico#lógico) | Formato da sintaxe de comparação de IGUALDADE LÓGICA, onde %1 é o primeiro termo do tipo LÓGICO e %2 é o segundo term... |
| isGreater | Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo co... |
| isGreater(#inteiro#letras) | Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo... |
| isGreater(#letras#inteiro) | Formato da sintaxe de comparação MAIOR QUE, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo ... |
| isGreaterOrEqual | Formato da sintaxe de comparação MAIOR OU IGUAL, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de ti... |
| isGreaterOrEqual(#inteiro#letras) | Formato da sintaxe de comparação MAIOR OU IGUAL, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do... |
| isGreaterOrEqual(#letras#inteiro) | Formato da sintaxe de comparação MAIOR OU IGUAL, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do ... |
| isMinor | Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de tipo co... |
| isMinor(#inteiro#letras) | Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo do tipo INTEIRO e %2 é o segundo termo do tipo... |
| isMinor(#letras#inteiro) | Formato da sintaxe de comparação MENOR QUE, onde %1 é o primeiro termo do tipo LETRAS e %2 é o segundo termo do tipo ... |
| isMinorOrEqual | Formato da sintaxe de comparação MENOR OU IGUAL, onde %1 é o primeiro termo e %2 é o segundo termo que deve ser de ti... |
| toDouble(#variante) | Função de conversão para o tipo VARIANTE onde %1 é o valor do tipo VARIANTE a ser convertido. |

*... e mais 102 registros*


---


*Documentação gerada automaticamente*

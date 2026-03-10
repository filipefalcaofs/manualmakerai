# Funções da Aba Cálculo

> Fonte: https://manual.softwell.com.br/docs/maker/aba_calculo/funcoes_da_aba_calculo

# Funções da Aba Cálculo

## Texto

- Capitalize (primeira letra maiúscula) - modifica todas as primeiras letras de todas as palavras que constam no texto para maiúsculo. O único parâmetro recebe um texto.

Exemplo:

variable1.Text := Capitalize(’Texto’);

- CompareText (compara texto) - verifica se dois valores são iguais. Caso sejam iguais, a função retorna zero, caso sejam diferentes, a função retorna um. O primeiro e o segundo parâmetros são os textos a serem comparados.

Exemplo:

variable1.Value := CompareText(’Texto1’,’Texto2’);

- Copy (cópia) - retorna determinados trechos de um texto. O primeiro parâmetro recebe o texto do qual se quer copiar certo trecho; o segundo parâmetro é a posição do primeiro caractere do texto que deverá ser copiado; e o terceiro parâmetro é usado para determinar a quantidade de caracteres que devem ser copiados a partir do valor determinado no segundo parâmetro.

Exemplo:

variable1.Text := Copy(DBText1.Text, 1, 5);

- Delete (apaga) - exclui determinados trechos de uma variável do tipo texto (declarada na aba de Cálculo). Não retorna nenhum valor. O primeiro parâmetro recebe a variável da qual se quer excluir certo trecho; o segundo parâmetro é a posição do primeiro caractere da variável que deverá ser excluído; e o terceiro parâmetro é usado para determinar a quantidade de caracteres que devem ser excluídos a partir do valor determinado no segundo parâmetro.

Exemplo:

Delete(VariávelDeclarada, 1, 5);

- Insert (insere) - inclui determinados trechos em uma variável do tipo texto (declarada na aba de Cálculo). Não retorna nenhum valor. O primeiro parâmetro recebe a variável da qual se quer incluir certo trecho; o segundo parâmetro é o texto que deverá ser incluído; e o terceiro parâmetro é usado para determinar a partir de que posição o texto definido no segundo parâmetro deverá ser incluído.

Exemplo:

Insert(’Texto’, VariávelDeclarada, 5);

- Length (tamanho) - retorna o tamanho de um texto. O único parâmetro recebe o texto do qual se quer saber o tamanho.

Exemplo:

variable1.Value := Length(DBText1.Text);

- LowerCase (minúsculo) - modifica todos os caracteres de um determinado texto para minúsculo. O único parâmetro recebe um texto.

Exemplo:

variable1.Text := LowerCase(’Texto’);

- Pos (posição) - retorna à posição inicial de uma combinação de caracteres contidos em um texto. O primeiro parâmetro é a combinação de caracteres que se quer encontrar no texto. O segundo parâmetro é o texto que servirá de foco para a procura.

Exemplo:

variable1.Text := Pos(’xto’, ’texto’);

- Trim (espaços contidos à direita e à esquerda) - retorna o texto que foi recebido como parâmetro (único parâmetro), retirando espaços existentes à direita e à esquerda do texto.

Exemplo:

variable1.Text := Trim(’Texto’);

- TrimLeft (espaços contidos à esquerda) - retorna o texto que foi recebido como parâmetro (único parâmetro), retirando espaços existentes à esquerda do texto.

Exemplo:

variable1.Text := TrimLeft(’Texto’);

- TrimRight (espaços contidos à direita) - retorna o texto que foi recebido como parâmetro (único parâmetro), retirando espaços existentes à direita do texto.

Exemplo:

variable1.Text := TrimRight(’Texto’);

- UpperCase (maiúsculo) - modifica todos os caracteres de um determinado texto para maiúsculo. O único parâmetro recebe um texto.

Exemplo:

variable1.Text := UpperCase(’Texto’);

## Conversão

- Chr (letra) - retorna o caractere que se refere ao valor inteiro (tabela AscII; fonte de consulta [http://pt.wikipedia.org/wiki/ASCII](https://pt.wikipedia.org/wiki/ASCII)) passado como parâmetro.

Exemplo:

variable1.Text := Chr(39);

- CurrToStr (moeda para texto) - retorna o valor monetário convertido para o formato texto. O único parâmetro recebido pela função é um valor monetário.

Exemplo:

variable1.Text := CurrToStr(1.23);

- DateTimeToStr (data/hora para texto) - retorna uma data/hora convertida para o formato texto. O único parâmetro recebido pela função é uma data/hora.

Exemplo:

variable1.Text := DateTimeToStr(’01/01/2001 09:01:02’);

- DateToStr (data para texto) - retorna uma data convertida para o formato texto. O único parâmetro recebido pela função é uma data.

Exemplo:

variable1.Text := DateTimeToStr(’01/01/2001’);

- FloatToStr (decimal para texto) - retorna um valor decimal convertido para o formato texto. O único parâmetro recebido pela função é um valor decimal.

Exemplo:

variable1.Text := FloatToStr(1.2345);

- IntToStr (inteiro para texto) - retorna um valor inteiro convertido para o formato texto. O único parâmetro recebido pela função é um valor inteiro.

Exemplo:

variable1.Text := FloatToStr(1);

- RGB (cor) - retorna o valor inteiro a partir da combinação das cores vermelha, verde e azul. Os três parâmetros podem variar de 0 a 255. Quanto menor o valor do parâmetro, mais escuro é o tom da cor; quanto maior o valor do parâmetro, mais claro é o tom da cor. O primeiro parâmetro é relativo ao tom vermelho. O segundo parâmetro é relativo ao tom verde. O terceiro parâmetro é relativo ao tom azul.

Exemplo:

label1.Caption.Font.Color := RGB(255, 50, 100);

- StrToCurr (texto para moeda) - retorna o texto convertido para o formato monetário. O único parâmetro recebido pela função é um texto.

Exemplo:

variable1.Value := StrToCurr(’1.23’);

- StrToDate (texto para data) - retorna um texto convertido para o formato data. O único parâmetro recebido pela função é um texto.

Exemplo:

variable1.Value := StrToDate(’01/01/2001’);

- StrToDateTime (texto para data/hora) - retorna um texto convertido para o formato data/hora. O único parâmetro recebido pela função é um texto.

Exemplo:

variable1.Value := StrToDateTime(’01/01/2001 09:01:02’);

- StrToFloat (texto para decimal) - retorna um texto convertido para o formato decimal. O único parâmetro recebido pela função é um texto.

Exemplo:

variable1.Value := StrToFloat(’1.234’);

- StrToInt (texto para inteiro) - retorna um texto convertido para o formato inteiro. O único parâmetro recebido pela função é um texto.

Exemplo:

variable1.Value := StrToInt(’1’);

- StrToIntDef (texto para inteiro) - retorna um texto convertido para o formato inteiro. Difere da função do item StrToInt, pois, naquela, quando é passado como parâmetro (único) um valor que não seja inteiro (no formato texto), ela gera uma exceção. Aqui, é possível definir um valor predefinido, caso aconteça uma situação como essa. O primeiro parâmetro é o texto que deverá ser convertido para inteiro. O segundo parâmetro é o valor que se quer retornar, se o primeiro parâmetro passado não for um valor inteiro.

Exemplo:

variable1.Value := StrToIntDef(’1’);

- StrToTime (texto para hora) - retorna um texto convertido para o formato hora. O único parâmetro recebido pela função é um texto.

Exemplo:

variable1.Value := StrToTime(’01:02:55’);

- TimeToStr (hora para texto) - retorna uma hora convertida para o formato texto. O único parâmetro recebido pela função é uma hora.

Exemplo:

variable1.Text := TimeToStr(’01:02:55’);

## Formato

- FormatCurr (moeda em string) - o valor monetário é convertido para o formato texto. Os parâmetros recebidos pela função são o tipo do formato monetário e o valor monetário.

Exemplo:

variable1.text := FormatCurr(’00000', 123);

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- FormatDateTime (data/hora para texto) - retorna uma data/hora convertida para o formato texto. Os parâmetros recebidos pela função são o tipo do formato da data/hora e um campo tipo DateTime vindo do banco.

Exemplo:

variable2.Text := FormatDateTime('dd / mm / yy 00:00:00', DataHora);

Observação: O campo DataHora deve ser declarado na aba Cálculo com o tipo DateTime.

- FormatFloat (float para texto) - retorna um valor decimal convertido para o formato texto. Os parâmetros recebidos pela função são o tipo do formato e o valor.

Exemplo:

variable1.Text := FormatFloat('#.#', 1.1515);

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- FormatMaskText (Máscara para texto) - retorna uma máscara no formato texto. Os parâmetros recebidos pela função são o tipo do formato (máscara) e um valor.

Exemplo:

variable1.Text := FormatMaskText('00 - 0', ’123’);

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- FormatString (Máscara para texto) - retorna uma máscara no formato texto. Os parâmetros recebidos pela função são o tipo do formato (máscara) e um valor.

Exemplo:

variable1.Text := FormatString('000000', 'MAKER');

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

## DataHora

- CurrentDate (data atual) - retorna a data atual do sistema. Não é necessário passar parâmetro.

Exemplo:

variable1.value := CurrentDate;

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- CurrentDateTime (data e hora atual) - retorna a data e a hora atual do sistema. Não é necessário passar parâmetro.

Exemplo:

variable1.value := CurrentDateTime;

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- CurrentTime (hora atual) - retorna a hora atual do sistema. Não é necessário passar parâmetro.

Exemplo:

variable1.value := CurrentTime;

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- DayOfWeek (dia da semana) - retorna o dia da semana. O único parâmetro recebido pela função é uma data.

Exemplo:

variable1.value := DayOfWeek(dia);

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto e na aba Cálculo a variável "dia" deverá ser declarada o tipo Date.

- DecodeDate (mostra dia, mês e ano) - retorna a dia, mês e ano a partir de uma função. Os parâmetros recebidos pela procedure são: CurrentDate, ano, mês e dia.

Exemplo: DecodeDate(CurrentDate,ano,mes,dia);

Variable1.value := ano;

Variable2.value := mes;

Variable3.value := dia;

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto, e na aba Cálculo, as variáveis (ano, mês e dia) deverão ser declarados do tipo integer.

- DecodeTime (mostra a hora, minuto, segundo e milissegundo) - retorna a hora, o minuto, o segundo e o milissegundo a partir de uma função. Os parâmetros  recebidos pela procedure são CurrentTime, hora, min, seg e mseg.

Exemplo: DecodeTime (CurrentTime, hora, min, seg, mseg);

Variable1.value := hora;

Variable2.value := min;

Variable3.value := seg;

Variable4.value := mseg;

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo texto e na aba Cálculo as variáveis (hora, min, seg, mseg) deverão ser declaradas do tipo integer.

- EncodeDate (data) - retorna o ano, o mês e o dia no formato DateTime. Os parâmetros recebidos pela função são, ano, mês e dia.

Exemplo:

variable1.value := EncodeDate(2008,09,01);

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo Data.

- EncodeTime (hora) - retorna a hora, o minuto, o segundo e o milissegundo no formato DateTime. Os parâmetros recebidos pela função são, hora, min, seg e mseg.

Exemplo:

variable1.value := EncodeTime (09,27,30,12);

Observação: O campo Variable1 deve ser declarado na aba Desenho com o tipo Hora.

## Matemática

Observação: Para todas as funções abaixo, o campo Variable1 deve ser declarado na aba Desenho com o tipo Texto.

- ArcTan  (Arco Tangente) - Calcula o arco tangente de um número oferecido.

Exemplo:

variable1.value := ArcTan (1);

Observação: o campo Variable1 deve ser declarado na aba Desenho com o tip texto.

- Cos (Cosseno) - calcula o cosseno de um ângulo.

Exemplo:

variable1.value := Cos (180);

Observação: o campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- Cosh (Cosseno Hiperbólica) - calcula o cosseno hiperbólica de um ângulo.

Exemplo:

variable1.value :=  Cosh (45);

Observação: o campo Variable1 deve ser declarado na aba Desenho com o tipo texto.

- Cotan (Cotangente) - calcula o cotangente de um ângulo.

Exemplo:

variable1.value := Cotan (90);

- Exp (Exponencial) - retorna o exponencial do valor passado como parâmetro.

Exemplo:

variable1.value := Exp (1);

- Frac (Fracionario) - retorna a parte fracionária do número passado como parâmetro.

Exemplo:

variable1.value := Frac (10.65);

- Int (Inteiro) - retorna a parte inteira do número passado como parâmetro.

Exemplo:

variable1.value := Int (10.65);

- IntPower (Integral Poderosa) - calcula a integral mais forte de um valor-base.

Exemplo:

variable1.value :=  IntPower (10, 5);

- Ln (Log da base e) - retorna o log natural de uma expressão real.

Exemplo:

variable1.value :=  Ln (10);

- Power (força) - levanta base para qualquer força.

Exemplo:

variable1.value := Power (10, 2);

- Round (Arredondar) - retorna o valor de um número passado arredondado para o número inteiro mais próximo.

Exemplo:

variable1.value := Round (10.45);

- Sin (Sine) - retorna o *sine* do ângulo em radianos.

Exemplo:

variable1.value := Sin (10.15);

- Sqr (Quadrado) - retorna o quadrado do número passado como parâmetro.

Exemplo:

variable1.value := Sqr (3);

- Sqrt (Raiz Quadrada) - retorna a raiz quadrada do valor passado como parâmetro.

Exemplo:

variable1.value := Sqrt (9);

- Tan (Tangente) - retorna a tangente do valor passado como parâmetro.

Exemplo:

variable1.value := Tan (90);

- Tanh (Hipérbole da tangente) - retorna a hipérbole da tangente do valor passado como parâmetro.

Exemplo:

variable1.value := Tanh (90);

- Trunc (Truncar) - trunca um número real para um inteiro.

Exemplo:

variable1.value :=Trunc (12.6);

## Utility

- MessageBeep (Som de Beep) - esta função toca um som de beep.

Exemplo:

MessageBeep;

- ShowMessage (Messagem) - apresenta uma mensagem.

Exemplo:

ShowMessage (’Maker’);

## DataBase Utility

- ChangeAccent (Retirar Acento) - retirar o acento de qualquer palavra passada como parâmetro.

Exemplo:

variable1.text := ChangeAccent ('Maker', Report);

- ExecSql (Executar código SQL) - executa uma consulta SQL. São parâmetros da função:
- Report - define o nome do relatório;
- Select - define o comando que será executado;
- TStringList - define uma variável que dá suporte a uma lista de textos:

Exemplo para declaração da variável Local:

var

Retorno: TStringList;

Begin

Retorno := TStringList.Create;

End;

Para declaração Global, é necessário declarar a variável na Aba Cálculo, clicando com o botão direito do *mouse* na área branca da Faixas do Relatório e marcando a opção Variáveis.

- InSequence - define se os dados devem vir ordenados em ordem alfanumérica.

Exemplo:

ExecSql(Report, 'select sis\_descricao from fr\_sistema where sis\_codigo =' + Chr(39) + 'SSS' + Chr(39), Retorno, false);

(Para este exemplo, considere que foi declarada e criada a variável Retorno).

Observação: Quando utilizado o execSql no relatório é necessário adicionar anteriormente uma fonte de dados(tabela), ao relatório.

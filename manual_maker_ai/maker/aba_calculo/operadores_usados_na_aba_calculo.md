# Operadores usados na Aba Cálculo

> Fonte: https://manual.softwell.com.br/docs/maker/aba_calculo/operadores_usados_na_aba_calculo

# Operadores usados na Aba Cálculo

- Atribuição - mostra como atribui um valor a uma variável.

Exemplo:

variable1.value `:=` Date;

- ## Boleano
- - And (E lógico) - liga a condição. A condição é satisfeita quando as duas proposições são verdadeiras.

Exemplo:

If (a `>` 0) and (b `<` 15) then

a `=` a + b;

- Not (negação) - nega uma variável.

Exemplo:

not (a`>` 10);

- Or (OU lógico) - liga uma condição. A condição é satisfeita quando uma das duas proposições é verdadeira.

Exemplo:

If (a `>` 30) or (b `<` 15) then

a `=` a + b;

- Xor (OU-Exclusivo lógico) - liga uma condição. A condição é satisfeita quando uma das duas proposições é falsa.

Exemplo:

If (a `>` 30) and (b `<` 15) then

a `=` a + b;

- ## Matemática
- - - (subtração) - operação realizada entre duas variáveis. Realiza a operação subtração.

Exemplo:

a `=` a - b;

- \* (multiplicação) - operação realizada entre duas variáveis. Realiza a operação multiplicação.

Exemplo:

a `=` a \* b;

- / (divisão) - operação realizada entre duas variáveis. Realiza a operação divisão.

Exemplo:

a `=` a \* b;

- - (adição) - operação realizada entre duas variáveis. Realiza a operação soma.

Exemplo:

a `=` a + b;

- div (divisão inteira) - operação realizada entre duas variáveis. Realiza a operação divisão e o resultado será a parte inteira da divisão.

Exemplo:

a `=` (a div b);

- mod (divisão inteira) - operação realizada entre duas variáveis. Realiza a operação divisão e o resultado será a parte inteira da divisão.

Exemplo:

a :`=` (a mod b);

- ## Relacional
- - `<` (menor que) - realiza comparação de uma ou mais variáveis.

Exemplo:

If (a `<` 6) then

a `=` a + b;

- `` <`= `` (menor ou igual) - realiza comparação de uma ou mais variáveis.

Exemplo:

If (a `` <`= `` 5) then

a `=` a + b;

- `<>` (não igual / diferente) - realiza comparação de uma ou mais variáveis.

Exemplo:

If (a `<>` 7) then

a `=` a + b;

- `=` (igual) - realiza comparação de uma ou mais variáveis.

Exemplo:

If (a = 5) then

a = a + b;

- `>` (maior que) - realiza comparação de uma ou mais variáveis.

Exemplo:

If (a `>` 4) then

a `=` a + b;

- `` >`= `` (igual maior que) - realiza comparação de uma ou mais variáveis.

Exemplo:

If (a `>=` 4) then

a `=` a + b;

- Texto

- (concatenação) - junta as variáveis.

Exemplo:

variable1.text `:=` 'Maker';

variable2.text `:=` 'Softwell';

variable3.text `:=` variable1.text + variable2.text;

## Tipos Enumerados

- Boolean
- - False (falso) - declara a variável com o valor ”falso”.

Exemplo:

variable1.value `:=` False;

- True (verdadeiro): declara a variável com o valor ”verdadeiro”.

Exemplo:

variable1.value `:=` True;

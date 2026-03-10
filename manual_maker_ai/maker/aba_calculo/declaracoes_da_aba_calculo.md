# Declarações da Aba Cálculo

> Fonte: https://manual.softwell.com.br/docs/maker/aba_calculo/declaracoes_da_aba_calculo

# Declarações da Aba Cálculo

- Begin...end (início...fim): delimita uma expressão.

Exemplo:

Begin

a := 5;

b := 10;

End;

• Case...end (caso...fim) - cria condição para uma expressão. Caso satisfaça a condição, será executada.

Exemplo:

Case (a < b) of

a := b;

end;

- For (para/laço) - cria condição de um laço e, enquanto estiver satisfazendo a condição, estará executando.

Exemplo:

For a to b do

begin

c := a + b;

end;

- If...then (se..então) - cria condição para uma expressão. Caso satisfaça a condição, será executada.

Exemplo:

If (a > 4) then

a := a + 1;

- If...then...else (se...então...senão) - cria duas condições para uma expressão. Caso a primeira condição não seja satisfatória, executará a segunda condição.

Exemplo:

If b < a then

a := a + 1;

Else

b := b + 1;

- Repeat (repita/laço) - repete o laço e testa a condição no final. O laço será repetido enquanto estiver satisfazendo a condição.

Exemplo:

Repeat

c := a + b;

a := c + b;

Until b < a;

- While (enquanto) - enquanto o laço estiver satisfazendo a condição, ela será executada.

Exemplo:

While a > b do

begin

c := a + b;

end;

# Utilizando Procedures com parâmetros IN OUT

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/utilizando_procedures_com_parametros_in_out

# Utilizando Procedures com parâmetros IN OUT

Crie uma procedure, segue abaixo o script usado para este exemplo em banco Oracle.

create or replace

PROCEDURE   PROC\_SOMA  ( A IN NUMBER, B IN NUMBER, C  OUT NUMBER) AS

BEGIN

     C := A + B;

     RETURN;

END PROC\_SOMA;

Esta procedure irá obter dois números como parâmetros de entrada e retornar a soma deles.

Crie um fluxo com dois parâmetros de entrada(Inteiro) e um processamento, neste processamento utilize a função ‘Executar Procedure In Out’ assim como está montada na imagem abaixo.

![image1795.jpg](/assets/images/list8-240d68999e5adc5b2423343a17b44222.png)

1. Defina no 1º parâmetro o nome da função, neste exemplo: ‘PROC\_SOMA’.
2. No 2º parâmetro é onde serão definidos os parâmetros de entrada, neste exemplo passamos os Parâmetros de Entrada que foram criados no fluxo.
3. No 3º defina a conexão (Caso a conexão seja nula, será usada a conexão principal do sistema)
4. No 4º parâmetro é passada uma lista com os tipos de retorno da função, neste caso passe para lista ‘2’ referente ao tipo NUMBER
5. No 5º parâmetro é passada uma lista referente aos tipos dos parâmetros no caso temos dois parâmetros IN e um parâmetro OUT.

Observação: Ao criar sua procedure sempre defina os parâmetros OUT ao final.

Ex: ‘create procedure proc\_exemplo1 (A IN NUMBER , B OUT NUMBER)’

       ‘create procedure proc\_exemplo2 (A IN VARCHAR, B IN NUMBER, C IN VARCHAR, D IN NUMBER, E OUT NUMBER, F OUT VARCHAR)’.

Após salvar a regra crie um formulário com dois componentes ‘caixa de texto’ e um botão, vincule a regra ao evento do botão e passe como parâmetros de entrada os componentes ‘caixa de texto’.

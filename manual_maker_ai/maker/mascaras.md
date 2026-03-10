# Máscaras

> Fonte: https://manual.softwell.com.br/docs/maker/mascaras

# Máscaras

A Máscara é utilizada para formatar a apresentação do contexto digitado em um campo. a Máscara possui uma estrutura composta por duas informações separadas por ; `(ponto e vírgula)`:

`<parte1>;<parte2>`

- `<parte1>` - é a máscara em sí: parte composta por uma modelagem de caracteres especiais, cuja relação encontra-se logo abaixo;
- `<parte2>` - é a utilização do número 1 ou 0 que permite salva ou não o contexto da `<parte1>`.

Sobre a `<parte2>` da máscara: o 0 (zero) serve para não gravar a máscara na base de dados (1 é o oposto). Exemplo: telefone com código de área: (000)0000-0000;0. Digamos que o cadastro no formulário seja (071)2108-3800. Então, como a `<parte2>` da mascara é o 0 (zero), o registro ficará gravado na base de dados da seguinte forma: 07121083800 e se (000)0000-0000;1 o registro ficará gravado da seguinte forma: (071)2108-3800.

Os caracteres especiais utilizados com a máscara são:

- - Utilizado para marcar determinado caractere não especial como fixo, não podendo sobrescrevê-lo.

Exemplo: `!\\(999\\)000-0000;0`

- L - Caracteres alfabéticos (A-Z, a-z).

Exemplo: `LLL-9999;1`

- A - Caracteres alfanuméricos (A-Z, a-z, 0-9).

Exemplo: `AAA-9999;1`

- 0 ou 9 - Caracteres numéricos (0-9).Preenchimento obrigatório.

Exemplo: `009;0`

- : Utilizado como separador de horas, minutos e segundos.

Exemplo: `00:00:00;1`

- / Utilizado como separador de dia, mês e ano.

Exemplo: `99/99/9999;1`

- ; Separa os dois campos da máscara;
- U> - Converte os caracteres para maiúsculo a partir deste símbolo U>.

Observação: Caso a máscara seja apenas U> todos os caracteres serão convertidos para maiúsculo.

Pode ser utilizado para apenas um caracter também: UUU-9999;1 - Resultado: JPA-2525.

- I> (letra ele em minúsculo, seguida pelo sinal `\>`) - Converte os caracteres para minúsculo a partir deste símbolo l>.

Observação: Caso a máscara seja apenas l> todos os caracteres serão convertidos para minúsculo.

Exemplos: `99l>` - Resultado: 15 anos.

- `l>` - Resultado:  "todos os caracteres ficarão em minúsculo".

Pode ser utilizado para apenas um caracter também: `lll-9999;1` - Resultado: jpa-2525

- $ (valor monetário) - o valor monetário é preenchido da direita para esquerda.

Exemplos:

1. - ao digitar o número 1 (um) o resultado será 0,01;
   - ao digitar o número 10 (dez) o resultado será 0,10;
   - ao digitar o número 100 (cem) o resultado será 1,00;

Observação: Esta Máscara só será funcional se a propriedade contéudo estiver preenchido como Numérico.

- IP - Usado para validar um endereço IP.
- `#` - permite números. Preenchimento opcional.
- $X - (Onde X é um numero inteiro) - Máscara para valores com X casas decimais.

Exemplo: $4 - para definir máscara para valores com 4 (quatro) casas decimais.

Observação: Essa máscara só está disponível a partir da versão 2.5.0.45e do Webrun.

Observações:

- Caso o segundo campo não tenha informação (a máscara seja apenas (00)0000-0000)), o modelo do registro a ser gravado no banco de dados é o mesmo do formulário, ou seja, no caso do exemplo acima seria gravado no banco (071)2108-3800;
- Abaixo constam nomes de [Tipos de Dados](/docs/maker/tipos_de_dados) e respectivas máscaras:

Tipo

Máscara

Exemplo

HORA: `!90:90;1`

`10:20`

HORA5: `##:##;1`

`10:20`

HORA SEM SEGUNDOS: `##:##`

`10:20`

`HORA\_1`: `99:99:99`

`10:20:55`

`HORA\_SIMPLES`: `!90:90:90;1`

`10:20:55`

HORA-MIN: `00:00:00`

`10:20:55`

PIS/PASEP: `999\\.99999\\.99\\-9;0`

PLANODECONTA: `99.99.99.999.999;0`

PORCENTAGEM: `###.##`

PROCESSO: `99999/9999`

RECEITA: `9.9.99.99.99.99;0`

- O desenvolvedor deve observar o tipo do campo para aplicar a devida Máscara. Por exemplo, o tipo Hora só pode ser aplicado em campos do tipo HORA ou DATA / HORA.
- Ao inserir uma nova máscara no sistema é necessário que o mesmo seja reiniciado, para que as alterações entrem em vigor.

Mascarando valores - Esse vídeo exemplifica como mascarar valores de um campo utilizando o Editor de Fluxos de Ações.

# Propriedades dos Componentes

> Fonte: https://manual.softwell.com.br/docs/maker/aba_calculo/propriedades_dos_componentes

# Propriedades dos Componentes

Segue abaixo a relação de Propriedades aplicáveis aos componentes usados na criação de relatórios (ativados pelo menu Visualizar Barras de Ferramentas - aba Desenho):

Propriedade

Descrição

Componente

Exemplo

AddOnCode

(adição de dígito)

A finalidade é adicionar dígito ao código de barra.

BarCode e DBBarCode

Alignment

(alinhamento)

A finalidade é determinar a posição de qualquer texto legível ao código de barras. Posição:

• taLeftJustify - alinha texto ao lado esquerdo do controle

• taCenter - alinha texto horizontalmente ao centro do controle)

• taRightJustify - alinha o texto ao lado direito do controle

BarCode, DBBarCode

barcode1.Alignment := taLeftJustify

AsBoolean

(como boleano)

A finalidade é determinar o valor da variável, ou seja, declara falso, desativando o componente

Variável

variable1.AsBoolean

AsChar

(como caractere)

A finalidade é definir a variável com o tipo char, guardando apenas um caractere

Variável

variable1.AsChar

AsDate

(como data)

A finalidade é definir a variável com o tipo data. Mostra a data do servido, porém a variável deve estar definida com o tipo data, na aba Desenho

Variável

variable1.AsDate;

AsDateTime

(como data e hora)

A finalidade é definir a variável com o tipo data e hora. Mostra a data e a hora do servido, porém a variável deve estar definida com o tipo data e hora, na aba Desenho

Variável

variable1.AsDateTime;

AsDouble

(como duplo)

A finalidade é definir para a variável o tipo ”duplo”. A variável deve estar definida com o tipo duplo, na aba Desenho

Variável

variable1.AsDouble;

AsExtended

(como extendido)

A finalidade é definir a variável com o tipo ”estendido”. A variável deve estar definida com o tipo estendido, na aba Desenho

Variável

variable1.AsExtended

AsInteger

(como inteiro)

A finalidade é definir a variável com o tipo ”inteiro”. A variável deve estar definida com o tipo inteiro na aba Desenho

Variável

variable1.AsInteger;

Assign

(cópia exata)

A finalidade é atribuir o conteúdo do componente ao outro, ou seja, é feito uma cópia exata do componente original. Quando a procedure é chamada, copia os valores para si próprio. O parâmetro de entrada é o componente que vai ser copiado

Texto, Memorando, Texto Formatado, Variável do Sistema, Imagem, Linha, Gráfico, Extenso, Campo Texto, Campo Memorando, Campo Texto Formatado, Campo Calculado, Campo Imagem, Campo Gráfico, Campo Extenso, Região, Sub-relatório, Referância Cruzada.

variable1.Assign(label1);

AsSingle

(como único)

A finalidade é atribuir um valor único ao componente

Variável

variable1.AsSingle:=15

AsString

(como string)

A finalidade é definir a variável com o tipo ”string”

Variável

variable1.AsString:='Maker'

AsTime

(como string)

A finalidade é definir a variável com o tipo ”string” e mostra a data atual

Variável

variable1.AsTime

AutoDisplay

(autoexibe)

A finalidade é exibir o conteúdo do banco de dados do componente automaticamente. Essa propriedade possui valor ”true”

Campo Memorando, Campo Texto Formatado e Campo Imagem.

memo1.AutoDisplay;

AutoEncode

(autocodifica)

Facilita a aplicação do Código 128 (código de barra). O componente já vem com o valor ”false”. Definir a AutoEncode ”True” invoca um algoritmo proprietário que irá automaticamente codificar os dados da forma mais eficiente possível

Código de Barras e Campo Código de Barras.

barCode1.AutoEncode := true;

AutoSizeFont

(automatiza tamanho da fonte)

Por padrão, o texto está definido como uma norma de aceite e o tamanho da fonte é baseado no tamanho do código de barras. A propriedade possui o valor ”True”. A fim de tomar o controle manual da fonte, à propriedade deve ser atribuído o valor ”False”

Código de Barras e Campo Código de Barras.

barCode1.AutoSizeFont := false;

Band

(banda)

A finalidade é atribuir implicitamente em tempo de desenvolvimento, quando se usa o *mouse* para arrastar o componente para a sua faixa pretendida na área do relatório

Texto, Memorando, Texto Formatado, Variável do sistema, Variável, Imagem, Linha, Gráfico, Código de Barras, Extenso, Campo Texto, Campo Memorando, Campo Texto Formatado, Cálculo, Campo Imagem, Campo Código de Barras, Campo Gráfico, Campo Extenso, Região, Sub-relatório e Referência Cruzada.

barCode1.AutoSizeFont := false;

BarCodeType

(tipo de código de barra)

A finalidade é definir a simbologia usada para criar o código de barras. Quando se define o BarCodeType, a propriedade dos dados, será verificada para garantir que os dados sejam aceitáveis para o tipo escolhido. As possibilidades de valores são: bcCodabar, bcCode128, bcCode39, bcEAN\_8, bcEAN\_13, bcInt2of5, bcPostnet, bcUPC\_A, bcUPC\_E

Código de Barras e Campo Código de Barras

barCode1.BarCodeType := bcCodabar

BarColor

(cor)

A finalidade é definir uma cor para as barras do código de barra. O ideal são barras pretas sobre o fundo branco

Código de Barras e Campo Código de Barras

barCode1.BarColor := clblue;

BarWidth

(largura da barra)

A finalidade é alterar a largura de cada barra. BarWidth é calculado com base na propriedade WideBarRatio. Para que a largura da barra aumente, é necessário ter a propriedade AutoSize para ”true” e atribuir um valor a WideBarRatio

Código de Barras e Campo Código de Barras

barCode1.AutoSize;

barCode1.BarWidth;

barCode1.WideBarRatio := 5;

BearerBars

(portador barra)

O portador barras são linhas horizontais que correm ao longo da parte superior e inferior do código. Quando o portador ”bares” está presente, uma varredura parcial, às vezes, pode ser interpretada como uma varredura completa. Essa propriedade só funciona para o tipo do código Interleaved 2 de 5 (Int2of5).

Código de Barras e Campo Código de Barras.

barCode1.BearerBars;

BlankWhenZero

(branco em zero)

Quando o valor for igual a zero, a propriedade BlankWhenZero permite imprimir um valor em branco em vez de um 0 (zero). Por padrão, o valor do componente é ”false”

Texto e Cálculo

dBCalc1.BlankWhenZero

Brush

(branco em zero)

A finalidade é determinar o preenchimento de cor e padrão de um relatório.

Região

region1.Brush.color:=clblue;

BottomOffset

(espaço vertical)

A finalidade é definir o espaço vertical, que será exibido após a propriedade ”band”. O relatório BottomOffset é expresso em unidades

Memorando, Texto Formatado, Campo Memorando, Campo Texto Formatado, Região, Sub-relatório e Referência Cruzada

dBMemo2.BottomOffset :=50

CalcCheckDigit

(gera dígito)

A finalidade é gerar dígito automaticamente para o código de barra UPC-A e EAN-13. Se for atribuído ”false” devem-se fornecer todos os 12 dígitos do código UPC-A

Código de Barras e Campo Código d Barras

barCode1.CalcCheckDigit

CalcComponent

(calcula componente)

A finalidade é especificar o grupo ou dados que irá notificar a variável quando for o momento para o cálculo do valor

Variável

CalcOrder

(ordena cálculo)

A finalidade é determinar a ordem na qual a variável será calculada, em relação às outras variáveis do mesmo grupo

Variável

Caption

(captura)

A propriedade Caption é o texto que aparece no canto superior esquerdo da janela do relatório

Texto, Memorando, Texto Formatado, Extenso e Região

label1.Caption := 'MAKER'

Center

(centro)

A finalidade é centralizar a imagem ao interior do controle, ou seja, ao tamanho posicionado do componente ”image”

Imagem e Campo Imagem

dBImage1.Center;

CentPluralName

(centavos)

No final do valor por extenso coloca centavos.

Extenso e Campo Extenso.

extenso1.CentPluralName := 'cents';

extenso1.CentSingularName := 'cent';

extenso1.Value := 56.01;

CentSingularName

(centavo)

No final do valor por extenso coloca ”centavo”

Extenso e Campo Extenso.

extenso1.CentPluralName := 'cents';

extenso1.CentSingularName := 'cent';

extenso1.Value := 56.01;

Clear

(limpa)

A finalidade é limpar todas as linhas, colunas e valores definidos

Gráfico

Color

(cor)

A finalidade é atribuir cor ao componente. As cores que podem ser utilizadas na propriedade são: clBlack, clMaroon, clGreen , clOlive, clNavy, clPurple, clTeal, clGray, clSilver, clRed, clLime, clYellow, clBlue, clFuchsia, clAqua, clLtGray, clDkGray e clWhite

Texto, Memorando, Texto formatado, Variável do sistema, Variável, Código de barras, Extenso, Campo Texto, Campo Memorando, Campo Texto Formatado, Campo Calculado, Campo Código de Barras e Campo Extenso.

label1.text := 'Maker';

label1.font.Color := clblue;

Create

(cria objeto)

Esta propriedade aloca memória para criar o componente e iniciar os dados conforme a necessidade. O ReportBuilder cria e destrói o objeto. O parâmetro passado é o componente. É necessário construir um objeto para chamar o método Create para alocar memória e dispor o objeto

Texto, Memorando, Texto Formatado, Variável do sistema, Variável, Imagem, Linha, Gráfico, Código de Barras, Extenso, Texto, Campo Memorando, Campo Texto Formatado, Cálculo, Campo Imagem, Campo Código de Barras, Campo Gráfico, Campo Extenso, Região, Sub-relatório e Referência Cruzada.

CurrencyPluralName

(valor no plural)

A finalidade é alterar a extensão da moeda corrente do componente colocando-o no plural. É necessário informar a moeda que está presente

Extenso e Campo Extenso.

extenso1.CurrencyPluralName := 'dólares';

extenso1.CentPluralName := 'cents';

extenso1.Value := 12.25;

Data

(dados)

Essa propriedade contém os dados recuperados a partir do banco de dados, que serão codificados. Funciona em tempo de execução e somente para leitura

Código de Barras

DataField

(campo de dados)

A finalidade é especificar o campo na propriedade DataPipeline que contém os dados que devem serem codificados

Campo Texto, Campo Texto Formatado, Campo Calculado, Campo Imagem, Campo Código de Barras e Campo Extenso.

DataType

(tipo de dados)

A finalidade é especificar e definir o tipo de dados do componente. Por padrão, o componente possui o valor ”string”

Variável e Campo Extenso.

DirectDraw

(mostra direção)

A finalidade é indicar se a imagem será enviada diretamente para a impressora ou a um intermediário bitmap e depois para a impressora. O valor padrão é ”false”, mas, para obter a imagem para ser impressa, defina a propriedade para ”true”

Imagem e Campo Imagem.

image1.DirectDraw := true;

DisplayFormat

(formata dado)

A finalidade é controlar a forma como os dados serão apresentados no relatório

Variável de Sistema e Variável

variable1.DisplayFormat:='#,0';

variable1.value := 10000;

Font

(fonte)

A propriedade Font deve ser utilizada para associar as outras propriedades

Texto, Memorando, Variável de Sistema, Variával, Imagem, Código de Barras, Extenso, Campo Texto, Campo Memorando, Campo Calculado, Campo Imagem, Campo Código de Barras, Campo Extenso.

label1.Font.color := clred;

label1.text := 'Maker';

ForceJustifyLastLine

(fonte)

A finalidade é determinar se a última linha de um componente é justificada. Por padrão, a propriedade possui o valor ”false”. Só se aplica quando TextAlignment está definido para taFullJustified ou atribuindo ”true” a proriedade ForceJustifyLastLine

Memorando e Campo Memorando.

memo1.ForceJustifyLastLine := true;

memo1.text := 'Softwell Solution - Maker na cabeça';

Grid Lines

(linhas da grade)

Define a aparição de linhas  na exibição do componente Referência Cruzada (Cross Tab)

Referência Cruzada

crosstab1.gridlines:=false;

Resultado: as linhas da tabela da referência cruzada não aparecerão.

Height

(altura)

Define a altura do componente. A unidade de medida depende da configuração em Unidades (*menu* Relatório, aba Desenho)

(Todos)

label1.Height:=5;

Keeptogether

(manter junto)

Corresponde à quebra de linha. Essa propriedade impede que os dados sejam truncados para a visualização. É interessante o uso em concomitância com a propriedade  Strecht (ajustar)

Memorando, Texto Formatado, Campo do Memorando, Região, Sub-relatório

memo1.keeptogether:=True;

Leading

Essa propriedade permite manipular a quantidade de espaços entre as linhas do componente

Memorando, Campo Memorando.

memo1.Leading:=0.005;

Left

(esquerda)

Controla a margem esquerda de um componente com base na margem do componente acima dele. A unidade de medida depende da configuração em Unidades (*menu* Relatório, aba Desenho)

(Todos)

Considere que a cima do label2 temos o memo1:

label2.Left:=1.5;

O conteúdo do label2 será apresentado a 1.5cm da margem do memo1.

Lines

(linhas)

Retorna um *array* de *strings*. Para utilizá-la é preciso declarar e criar a variável *array*, e depois atribuir um valor a essa variável

Memorando

Para o exemplo a seguir, considere que o componente memo1 já tenha um valor incorporado:

Procedure reportbeforeprint;

Var

  Linhas: tstringlist;

Begin

  Linhas := tstringlist.Create;

  Linhas := memo1.Lines;

  memo2.Text := Linhas.Text;

End;

O memo2 terá o mesmo valor que memo1.

Loadfromfile

(carregar a partir de arquivo)

Preencher componente

Texto Formatado, Campo Texto Formatado

richtext1.loadfromfile('C:\trabalho\ usuario.teste\softwell.txt')

Lookahead

Soma os valores atribuídos até a página onde o objeto localiza

Variável, Campo Calculado

dbcalc1.lookahead:=True;

Maintainaspectratio

(manter proporções)

O componente imagem sofrerá uma escala proporcional. Obs.: Essa propriedade  é executada se e somente a propriedade Strecht for true

Imagem, Campo de Imagem

Image1.Stretch:=true;

Image1.maintainaspectratio:=true;

Name

(nome)

Retorna o nome do componente

(Todos)

label1.Caption:=dbtext4.Name

O componente label1 terá o nome do componente como valor.

Newprintjob

(novo trabalho de impressão)

Permite a visualização do conteúdo do subrelatório

Sub-relatório

subreport1.newprintjob:=true;

O conteúdo do sub-relatório não será impresso.

Orientation

(orientação)

Determina a orientação de exibição do componente

Código de Barras e Campo Código de Barras

barcode1.Orientation:=orrighttoleft;

Resultado:Apresentação invertida (cabeça para baixo) do código de barras.

barcode1.Orientation:=orlefttoright;

Resultado: Apresentação correta do código de barras.

Overflowoffset

Essa propriedade trata ocorrência de ”overflow” em componentes. O valor inserido na propriedade é a margem superior do texto na próxima página

Memorando, Campo Memorando, Campo Texto Formatado, Texto Formatado, Região, Sub-relatório, Referência Cruzada

richtext1.overflowoffset:=0.56;

Owner

(dono)

Obter as propriedades do componente pai (banda a qual pertence)

(Todos)

Considere que o componente dbtext2 pertence a banda cabeçalho de um grupo do relatório e variablecount é uma propriedade desse grupo, logo o comando: dbtext2.Owner.variablecount;

Trará a quantidade de variáveis dessa banda.

Pagination

(paginação)

Determina  a ordem de impressão do conteúdo da matriz interna ao componente referência cruzada

• ***Ctpacrossthendown***: a impressão dos elementos é iniciada de cima para baixo

• ***Ctpdownthenacross***: a impressão dos elementos  acontece de baixo para cima

Referência Cruzada

crosstab1.Pagination:=ctptdownthenacross;

Parentheight

(altura do antecessor)

Altera a altura do componente para compatibilizar com a de seu antecessor

Linha, Região, Polígono

Shape1.parentheight:=True;

Parentwidth

(largura do antecessor)

Essa propriedade força o componente a ter a mesma largura que o antecessor que pode ser uma banda ou região

Linha, Região, Sub-relatório, Referência Cruzada

line1.parentwidth:=True;

Pen

(caneta)

Determina a espessura da linha dos componentes. Caso o valor setado seja igual a zero, o gerador de relatório não segue a apresentação semelhante ao Delph, a linha fica translúcida

Linha, Região

line1.Pen:=25;

Picture

(gravura)

Exibe a imagem de acordo com o caminho especificado

Imagem

image1.Picture.loadfromfile('C:\local\fluxofilt.bmp');

(O texto após o parâmetro ”Picture” deve ser digitado, pois não se encontra na caixa de nomes das propriedades).

Printbehavior

(imprima de acordo com comportamento

Formas de impressão do subrelátório. Cada um dos três tipos de comportamento referencia a quantidade de elementos em cada impressão de relatório

• Pbchild (Sucessor): Imprime todos os itens do sub-relatório

• Pdfixed (Fixo): Imprime apenas os campos complementares ao relatório

• Pdsection (Seção): Imprime o conteúdo do sub-relatório na página subsequente a do relatório

Sub-relatório

Subreport1.printbehavior:=pbchild;

Subreport1.printbehavior:=pbfixed;

Subreport1.printbehavior:=pbsection;

Printhumanreadable

(imprima texto para leitura humana)

Habilitar a escrita do significado das barras do código de barras

Código de Barras, Campo Código de Barras

barcode1.printhumanreadable:=false;

ResetComponente

(reinicializar componente)

Usado para reinicializar o componente Variável inserido em um contexto de grupo

•Vedatapipelinetraversal: a  reinicialização ocorre quando acontece um cruzamento de dados

•VegroupbeforeheaderValue: O valor do componente acontece antes da impressão do cabeçalho de grupo

•VegroupbeforefooterValue: O *reset* ocorre antes da criação do cabeçalho de grupo

•Vegroupstart: O valor é zerado antes da ocorrência de um *break* no grupo

•Vegroupend: O valor é zerado depois da ocorrência de um *break* no grupo

Variável

Resettype

(tipos de reinicialização)

Escolha o momento de zerar o conteúdo do componente Variável

• Vetraversal - a cada novo cálculo de registro transversal, a variável sofre um reset

• Vedatapipelinetraversal - a cada novo cálculo de registro transversal em um data pipeline a variável sofre um reset

• Vepagestart - a cada início de uma nova página a variável é reinicializada

• Vepageend - a cada término de uma nova página acontece um reset na variável

• Vecolumnstart - a cada término de uma coluna  a variável é reiniciada

• Vegroupbeforeheader - o valor da variável é calculado antes de imprimir o cabeçalho e precisa ser tratado no evento *onreset* e ter habilitado para o grupo a característica de imprimir em nova página

• Vegroupbeforefooter - na criação da banda rodapé, o conteúdo da variável é recalculada

• Vegroupstart - a cada nova apresentação do grupo o valor da variável é recalculada

• Vegroupend - a cada término da nova apresentação do grupo o valor da variável é recalculado

Variável

Variable1.resettype:= vetraversal;

Variable1.resettype:= vedatapipelinetraversal;

Variable1.resettype:= vepagestart;

Variable1.resettype:= vepageend;

Variable1.resettype:= vecolumnstart;

Variable1.resettype:= vegroupbeforeheader;

Variable1.resettype:= vegroupbeforefooter;

Variable1.resettype:= vegroupstart;

Variable1.resettype:= vegroupend;

Richtext

(texto formatado):

Atribuir valor ao componente Terxto Formatado

Texto Formatado

richtext1.richtext:='Softwell

Save

(salvar)

Controlar os componentes que serão salvos em arquivo de texto. Para guardar a ordenação veja saveorder

Texto, Variável do Sistema, Variável, Extenso, Campo Texto, Campo Calculado, Campo Extenso

label1.Save:=true;

Savelength

(tamanho do arquivo)

Tamanho máximo do arquivo a ser gravado

Texto, Variável do Sistema,Variável, Extenso, Campo Texto, Campo Calculado,Campo Extenso

label1.savelength:=90;

Saveorder

(salvar ordenação)

Guarda a ordem dos componentes no arquivo salvo

Texto, Variável do Sistema,Variável, Extenso, Campo Texto, Campo Calculado,Campo Extenso

label1.saveorder:=1;

Savetofile

(salvar em arquivo)

Cria um arquivo no caminho especificado, contendo os valores dos componentes

Texto Formatado e Campo Texto Formatado

dbrichtext1.savetofile('C:\TESTE');

richtext1.savetofile('C:\TESTE2');

Shape

(forma)

Determina a forma das figuras:

• Stellipse - forma elipsoide;

• Strectangle - forma retangular;

• Stroundrect - retângulo com extremidades arredondadas;

• Stsquare - quadrado;

• Stroundsquare - quadrado com extremidades arredondadas;

• Stcircle - forma circular;

Polígono

shape1.shape:=stellipse;

shape1.shape:=strectangle;

shape1.shape:=stroundrectangle;

shape1.shape:=stsquare;

shape1.shape:=stroundsquare;

shape1.shape:=stcircle;

Shiftrelativeto

(mover relativamente a)

A mobilidade do componente depende da posição escolhida: essa propriedade serve para impedir a impressão sobreposta dos componentes

Memorando, Texto Formatado, Região, Referência Cruzada,  Sub-relatório e Page Break (quebra de página)

memo2.shiftrelativeto:=memo1;

Shiftwithparent

(mover com antecessor)

Evita que o componente posicionado acima sobrescreva a região do componente que chamou a propriedade

Texto, Memorando,Texto Formatado,Variável do Sistema, Variável, Imagem, Linha, Código de Barras, Extenso, Campo texto, Campo Memorando, Campo Calculável, Campo Imagem, Campo Código de Barras, Região  e Polígono

Image1.shiftwithparent:=true;

Stopposition

(posicionamento máximo)

Determina o tamanho vertical máximo de um componente com tamanho automático

Sub- Relatório,Referência Cruzada

Stretch

(ajustar)

Permite que a imagem se ajuste ou redimensione para caber no componente de imagem. O mesmo efeito é alcançado ao clicar com o botão direito do *mouse* em cima do componente e selecionar ajustar

Memorando, Imagem, Campo Memorando,Campo Imagem, Região e Referência Cruzada

image1.stretch:=true;

Strechwithparent

(altura do antecessor)

Ajusta as linhas verticais, redimensionando o tamanho delas

Linha, Região e Polígono

shape1.stretchwithparent:=True;

Style

(estilo)

Apresentação dos componentes:

• Linha - duplo ou simples;

• Crosstable - padrão ou Repeated Captions (Legendas Repetidas). A diferença entre os estilos é que legendas repetidas obriga a reimpressão dos registros que não couberem em uma linha

Linha e Referência Cruzada

line1.style:=lsdouble;

line1.style:=lssingle;

crosstab1.style:='Repeated Captions';

Suppressrepeatdvalues

(suprimir valores repetidos)

Os valores duplicados no banco não serão exibidos repetidamente

Campo de Texto, Campo Memorando, Campo Calculado

dbmemo1.suppressrepeatedvalues:=True;

Text

(Texto)

Inserir valor no componente

Memorando, Extenso, Campo Extenso

extenso1.Text:='Softwell';

Textalignment

(alinhamento do texto)

Alinhamento do texto

Texto, Memorando, Variável do Sistema, Variável, Extenso, Campo Texto,Campo Memorando, Campo Extenso

Top

(topo)

Determina o limite superior de um componente

(Todos)

memo1.Top:=5;

Transparent

(transparente)

Determina se o plano de fundo de um componente é opaco ou transparente no momento da impressão

Texto, Memorando, Texto Formatado, Variável do Sistema,Variável, Imagem, Código de Barras, Extenso, Campo Texto,Campo Memorando, Campo Texto Formatado, Campo Calculado, Campo Imagem, Campo Código de Barras,Campo Extenso, Região

dbtext1.Transparent:=false;

Traversealldata

(todos os dados cruzados)

A proprieddade assegura que os dados cruzados não sejam truncados, forçando a impressão em páginas posteriores

Sub-Relatório

Username

(nome de usuário)

Cada componente tem nome único em um mesmo relatório, por esse motivo a propriedade Standart Delph Name não deve ser utilizada. O nome pode ser composto por qualquer caracter válido para Pascal, sem espaços

(Todos)

variable2.value:=899;

Value

(valor)

Inserir Valor em Componentes

Variável, Campo Calculado, Campo Extenso

Vartype

(tipo de variável)

declaração explícita do tipo do componente variável do sistema

• VtdateCurrent - data do sistema

• Vtdatetime - data e hora do sistema

• Vtdocumentname - nome de documento, obtido com a propriedade

• Vtprintdatetime - data e hora da impressão do relatório, será impresso em todas as páginas

• Vtpageset - número da página atual e total de páginas do sub-relatório

• Vtpagesetdesc - a palavra ”page” e  número da página atual e total de páginas do sub-relatório

• Vtpageno - número da página atual

• Vtpagedesc - a palavra ”page” e número da página

• Vttime - hora do sistema

printersetup.documentname property

Visible

(visível)

Determina a visibilidade do componente

(Todos)

memo1.Visible:=false;

Weight

(expessura)

Determina a expessura do componente linha

Linha

line1.Weight:=3.0;

Widebarratio

(proporção barra larga)

Expessura das barras do componente código de barras (barcode). O valor desse componente será multipilicado pelo *barwidth* do componente

Código de Barras e Campo Código de Barras

barcode1.widebarratio:=7.0;

Width

(comprimento)

Manipular o comprimento

(Todos)

shape2.Width:=10.0;

Wordwrap

Essa propriedade quando habilitada não permite que a visualização dos dados em um componente sejam truncados no momento de visualização

Texto,Variável do Sistema, Variável, Extenso, Campo Texto, Campo Calculado, Campo Extenso

variable1.wordwrap:=True;

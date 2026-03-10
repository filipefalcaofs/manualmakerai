# Passagem de parâmetro entre fontes de dados (condutores de dados)

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relat%C3%B3rio/passagem_de_parametro_entre_fontes_de_dados

# Passagem de parâmetro entre fontes de dados (condutores de dados)

Para exemplificar este recurso, na aba Desenho, acesse o menu Relatório, e como sugestão, selecione Título (este apresenta o conteúdo somente na primeira página).

1. Na aba Dados, defina duas fontes de dados.
2. Na aba Cálculo, em Objetos Relatórios, clique com o botão direito do mouse e ative a opção Eventos.
3. Em seguida, selecione Title e, em Eventos para Título, clique em BeforePrint.
4. Clique na área abaixo para ser criada uma procedure. e desenvolva:

procedure TitleBeforePrint;

var

FiltrodePesquisa : TStringList;

ValorInformado : String;

begin

FiltrodePesquisa := TStringList.Create;

ValorInformado :=  Report.AutoSearchCriteriaByName ('fr\_acao', 'aco\_codigo').SearchExpression;

FiltrodePesquisa.Add ('aco\_codigo=' + ValorInformado);

ChangeAutoSearch ('fr\_acaoparametro', FiltrodePesquisa, Report);

end;

É nessa procedure que será criada a expressão de passagem de parâmetro entre fontes de dados.

Para início, abaixo da procedure e antes do begin, escreva var para informar as variáveis que serão declaradas. Declare duas variáveis: FiltrodePesquisa: TStringList  - é uma classe que permite criar e manipular em memória uma lista de strings, como exemplo, um arquivo texto, e ValorInformado : String  - essa variável receberá o código passado pela fonte de dados. Em begin, crie/inicialize a variável que foi declarada anteriormente (FiltrodePesquisa), recebendo o valor TStringList.Create. Em seguida, na outra linha, ValorInformado receberá Report.AutoSearchCriteriaByName, passando dois parâmetros entre parênteses e apóstrofos:

- 1º parâmetro - a fonte de dados origem;
- 2º parâmetro - o campo que possui o filtro.

Após o segundo parâmetro, coloque um ponto e adicione SearchExpression. Agora, em outra linha, adicione o valor passado para a variável FiltrodePesquisa.Add informando dois parâmetros:

- 1º parâmetro (entre parêntese e entre apóstrofos) - o campo que possui o filtro ('aco\_codigo=');
- 2º parâmetro concatenado (+) - o conteúdo da variável (ValorInformado);

Por último, em outra linha, coloque o comando ChangeAutoSearch passando três parâmetros:

- 1º parâmetro (entre parênteses e apóstrofos) - a fonte de dados destino ('fr\_acaoparametro');
- 2º parâmetro - FiltrodePesquisa e
- 3º parâmetro - Report.

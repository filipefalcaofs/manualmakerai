# Alternação da cor dos dados impressos (linhas) em um relatório

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relatório/alternacao_da_cor_dos_dados_impressos_linhas_em_um_relatorio

# Alternação da cor dos dados impressos (linhas) em um relatório

Para desenvolver um relatório (Gerador de Relatórios) que alterne a cor dos dados das linhas impressas no relatório, devem ser seguidos os passos abaixo. São eles:

1º passo: na aba "Data/Dados", crie uma fonte de dados de sua escolha:

![image990.jpg](/assets/images/image990-1c73d2d9ef5cccb8dd6cb03357391123.jpg)

2º passo: na aba "Design/Desenho"

- cole um componente "Region/Região" na banda "Detail/Detalhe", o qual deve ser redimensionado de maneira que ocupe toda a área da banda.
- cole os componentes que serão utilizados para a projeção dos dados sobre o componente "Region/Região":

![image991.jpg](/assets/images/image991-e3425b9d368304337e696c784ebab7b4.jpg)

3º passo: na aba "Calc/Cálculo"

- Clique com o botão direito do mouse sobre o quadrante superior esquerdo da aba e selecione a opção "Module/Módulo":

![image992.jpg](/assets/images/image992-47142d40af16643f39a9a5235b641ec7.jpg)

- No mesmo quadrante, selecione a opção "Declarations/Declarações". Feito esse passo, efetue um clique sobre a opção "Variables/Variáveis" (quadrante superior direito) e, em seguida, efetue um clique no quadrante inferior esquerdo e declare uma variável do tipo inteiro (após a palavra "var"), a qual servirá de base para a mudança da cor de cada linha (banda "Detail/Detalhe" da aba "Design/Desenho") de dado impressa:

![image993.jpg](/assets/images/image993-c990b0a6f908ee8eb363d6a65e76bf8e.jpg)

4º passo: clique com o botão direito do mouse sobre o quadrante superior esquerdo da aba e selecione a opção "Events/Eventos":

![image994.jpg](/assets/images/image994-b38f035e249d16c2014d526594efc978.jpg)

5º passo: o mesmo quadrante, selecione a opção "Report/Relatório". Feito esse passo, efetue um clique sobre a opção "BeforePrint" (quadrante superior direito) e, em seguida, inicialize a variável "Contador" com o valor "0":

![image995.jpg](/assets/images/image995-d3bef18aa41301561603e3039dad123f.jpg)

6º passo: no mesmo quadrante superior esquerdo, selecione a opção "Detail/Detalhe". Feito este passo, efetue um clique sobre a opção "BeforePrint" e, em seguida, desenvolva um algoritmo que verifique se o valor da variável "Contador" é par, incrementando-o na sequência:

![image997.jpg](/assets/images/image997-8702318e73f8c00b786b03ad530e59bc.jpg)

Observação: Algoritmo que foi desenvolvido acima:

 begin

if ((Contador mod 2)= 0) then

begin

Region1.Brush color:= clYellow;

end

else

begin

Region1.Brush. Color:=clWhite;

end;

Contador:=Contador+1;

end;

7º passo: na aba "Preview/Visualização", visualize o relatório gerado.

![image998.jpg](/assets/images/image998-646b86d5fd3884339a5827ace48e42d6.jpg)

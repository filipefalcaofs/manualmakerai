# Como personalizar a cor do gráfico no Maker Reports

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relat%C3%B3rio/como_personalizar_a_cor_do_grafico_no_maker_reports

# Como personalizar a cor do gráfico no Maker Reports

Selecione na consulta (fonte de dados) um campo que retorne as cores desejáveis.

Exemplo:

![image1299.jpg](/assets/images/image1299-6f1fbaca4e0df6703afa5432b6b30b18.jpg)

Veja que o campo cor traz os valores em hexadecimal (HTML) ou no padrão Delphi correspondente as descrições do campo Nome.

Com isso, basta selecionar o campo cor no condutor de dados da série de um gráfico. (Um novo componente (combo) chamado Cor foi habilitado, veja na imagem abaixo:)

![image1300.jpg](/assets/images/image1300-f305e2e292a793be172610925256fdef.jpg)

Feito isto, veja o resultado do gráfico:

![image1301.jpg](/assets/images/image1301-f202b3391503ec7b714e4c8e6a47065a.jpg)

Observações:

1. Esta personalização de cor não funciona para o gráfico do tipo Linha rápida.
2. Não será respeitada o valor da cor quando selecionado numa constante. Ex: select ‘#FF1493’ AS COR from tabela.
3. Caso não queira personalizar a cor, basta deixa o componente Cor sem valor.
4. Deve ser utilizado a versão 2.5.1.133 ou superior do gerador de relatório para funcionar corretamente no Webrun.

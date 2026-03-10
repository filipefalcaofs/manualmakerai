# Utilizando a Função Criar Novo Arquivo

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/funcoes/Utilizando_a_Funcao_Criar_Novo_Arquivo

# Utilizando a Função Criar Novo Arquivo

Este exemplo demonstra a utilização da função Criar Novo Arquivo.

1. Crie um formulário com as seguintes características:

![](/assets/images/exe62-9ca871286e8f4d09ced5ab7def5af53e.png)

2. Para  um melhor entendimento o fluxo deverá  ficar da seguinte forma:

![img22144.JPG](/assets/images/exe63-a9a98dad85b202730988e535c4b23475.png)

3. Crie um novo fluxo e informe o seguinte parâmetro de entrada:

![](/assets/images/exe64-d73a478858157dba2a3db2f7078165fe.png)

4. Insira um objeto Decisão e selecione a seguinte função: Existe Subsequência:

![img22144.JPG](/assets/images/exe65-cf8747b3d7ce21e8986f533983d565ad.png)

5. Insira um objeto Processamento para a decisão SIM e selecione a seguinte função: Cria Novo Arquivo:

![img22145.JPG](/assets/images/exe66-d8392f00c658e7d3479dfafe49178e21.png)

6. Insira um objeto Interação para a decisão Não, informando: “Informe o valor correto”.

![](/assets/images/exe67-c386b92d03923972242b7641a4cc67ee.png)

7. Salve o fluxo na camada servidor e associe-o ao botão Criar do formulário.
8. Execute-o no Webrun:

![](/assets/images/img22147-b81529d496998879ce7ad4008aa1990c.JPG)

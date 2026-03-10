# Como Utilizar a Função Importar Conteúdo da Folha Estilo

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/funcoes/Como_Utilizar_a_Funcao_Importar_conteudo_da_folha_estilo

# Como Utilizar a Função Importar Conteúdo da Folha Estilo

Esse exemplo irá demonstrar o uso da função Importar conteúdo da folha estilo.

1. Crie um formulário com o seguinte layout:

![img22114.JPG](/assets/images/fun3-f8f99c06c8440e83c7656f9c6a1f7ca3.png)

2. Crie um Fluxo;
3. Adicione um objeto [Processamento](http://ares/manual2.6/objeto_processamento) e no [Montador de Expressões](http://ares/manual2.6/montador_de_expressoes) e selecione a Função Importar conteudo da folha estilo:

![img22112.JPG](/assets/images/fun4-53e439669f3d663bdec97d6009a4975a.png)

4. Informe como parâmetro o conteúdo da folha de estilo no padrão CSS, por exemplo:
5. Se desejar alterar a cor de um componente  [Caixa de Texto](http://ares/manual2.6/caixa_de_texto)  e o plano de fundo do formulario

`.label { color: #FF0000 !important; }`

`.tabArea { background- color: #FFFF0F !important; }`

![img22113.JPG](/assets/images/fun5-66142068c6164155b627b2dc7b9c95e4.png)

5. Salve o fluxo na camada cliente e adicione ao evento Ao entrar do formulário.
6. Execute o formulário no webrun:

![img22111.JPG](/assets/images/fun6-a77725f05db19c5edaa7f5bf0a194c0d.png)

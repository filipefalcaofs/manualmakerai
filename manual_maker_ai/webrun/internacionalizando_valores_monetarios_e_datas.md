# Internacionalizando valores monetários e datas

> Fonte: https://manual.softwell.com.br/docs/webrun/internacionalizando_valores_monetarios_e_datas

# Internacionalizando valores monetários e datas

A partir da versão Webrun 3, ao selecionar um idioma (Inglês ou Português) os valores monetários e datas terão o formato de apresentação conforme o idioma, independente do conteúdo gravado no banco de dados. Ex.: Um campo data, que está gravado no banco no formato inglês mm/DD/yyyy, ao selecionar o idioma Português a exibição do conteúdo será no formato dd/MM/yyyy. O mesmo vale para os valores monetários que no formato americano, os pontos são separadores de decimais e as vírgulas separadoras de milhares.

Para utilizar esta nova funcionalidade é muito fácil! Basta selecionar o idioma desejado na tela de acesso ao sistema e todos os valores serão internacionalizados automaticamente.

![acesso_webrun1.jpg](/assets/images/acesso_webrun1-3bc3edc93837e328d3d82301276c9ff5.jpg)

Observe que o usuário seleciona o idioma English (USA):

![acesso_webrun_ingles.jpg](/assets/images/acesso_webrun_ingles-8c7f67774ee143a6fa8d4c83d35fc391.jpg)

Tela de cadastro de pedido do Sistema Exemplo Controle de Estoque:

![image1542.jpg](/assets/images/image1542-28071e108a44713f9b60ee1e222b8aa4.jpg)

Observe o campo Data do pedido, a data é 11/05/2015 no idioma português, enquanto que no idioma selecionado (Inglês) o conteúdo é apresentado no formato mm/DD/yyyy.

Abaixo, a mesma tela no idioma Português. Observe que a formatação foi modificada.

![image1543.jpg](/assets/images/image1543-e34d463997d7ab321033fedf5ced5eca.jpg)

Nesta mesma tela, observe o destaque dado aos campos Valor do Seguro e Descontos. O separador de casas decimais é o ponto (.) no idioma Inglês e vírgula (,) no idioma Português.

Formato Português:

![image1544.jpg](/assets/images/image1544-e0fd4f5f65aea95ade88a62f5feb50d7.jpg)

Formato Inglês:

![image1545.jpg](/assets/images/image1545-ee41ed8082c95b447148767f95fbd99d.jpg)

1. A internacionalização é válida somente para os idiomas Inglês e Português;
2. A formatação é apenas na camada de apresentação, os valores não são alterados internamente de acordo com o idioma.

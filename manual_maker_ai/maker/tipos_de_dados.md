# Tipos de Dados

> Fonte: https://manual.softwell.com.br/docs/maker/tipos_de_dados

# Tipos de Dados

Esta tela permite definir Máscaras para formatação da exibição de dados para formulários. Acesse esse recurso por meio do menu Utilitários e deste clique em Tipos de Dados.

![image69.gif](/assets/images/image20-b8903cb81db63f88263eda5ea136d6a7.jpg)

A tela possui uma Barra de Ferramentas para a navegação e edição dos registros e os seguintes campos:

- **Descrição** - Local para determinar o nome da máscara;
- **[Máscara](/docs/maker/mascaras)** - É a expressão que define a aparência dos dados apresentados nos campos (componentes) do formulário. Abaixo consta uma imagem que exemplifica a utilização da máscara no campo CPF:

![image917.jpg](/assets/images/image40-80ccee828f37c50bc5ee14637e399f7c.jpg)

Observações:

1. Qualquer tipo de dados, com a descrição iniciada com "HORA" será validada pelo Webrun como o tipo HORA.
2. A máscara de CPF, CNPJ e CEP só se aplica a campos do tipo VARCHAR.
3. As máscaras CPF e CNPJ servem para formatação dos componentes e validação das informações. Ao inserir os dados nos campos vinculados às máscaras e gravá-los, é lançada uma mensagem de erro se os valores forem inválidos;
4. O Webrun se baseia pelos nome CPF ou CNPJ para efetuar a validação, caso o desenvolvedor modifique o nome desses tipos, não ocorrerá validação.

# Gmail - Enviar Email - Oauth 2.0

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/funcoes/oauth2_gmail

# Gmail - Enviar Email - Oauth 2.0

O OAuth 2 é um protocolo de autorização que permite que aplicativos obtenham acesso limitado a contas de usuários em um serviço HTTP sem a necessidade de enviar seu usuário e senha. Basicamente, o usuário delega, a um determinado aplicativo, acesso aos seus dados em um determinado serviço ou API.

Para utilizar a função Gmail - Enviar Email - Oauth 2.0 no Maker, é nescessário fazer algumas configurações em um projeto existente no serviço de Cloud da Google(Google Cloud).

1. - O primeiro passo é entrar no seu console do Google Cloud e pesquisar por "Gmail API":

![image1357.jpg](/assets/images/oauth2_gmail_1-4f6731d50ca5b6d0c8ed7b40fcf00c5a.png)

2. - Ative a API referente ao seu projeto:

![image1357.jpg](/assets/images/oauth2_gmail_2-c24d375b936c9fd61cb5d7a4bc39c74c.png)

3. - Volte para a tela do seu projeto, clique em credenciais e criar credenciais:

![image1357.jpg](/assets/images/oauth2_gmail_4-7b245980dbef884d70a512bcdd72eaaa.png)

4. - Selecione a opção "Ajude-me a escolher":

![image1357.jpg](/assets/images/oauth2_gmail_5-0d2c5676afc390387d5c003f707a3b03.png)

5. - Você será redirecionado para a tela referente a configuração da sua credencial, selecione a opção "Gmail API":

![image1357.jpg](/assets/images/oauth2_gmail_6-b3e0725e4f5edd548fa1162c349765ba.png)

![image1357.jpg](/assets/images/oauth2_gmail_7-fc6d61acde6f5d702f15604706680201.png)

6. - Em seguida, configure as informações do seu aplicativo:

![image1357.jpg](/assets/images/oauth2_gmail_8-f691695b708deea04928f3b566e9d9ee.png)

7. - Clique em "Adicionar ou remover escopos", para configurar os escopos da sua credencial:

![image1357.jpg](/assets/images/oauth2_gmail_9-4f3a9e70cea689bc97c064d1424ae9c0.png)

8. - Pesquise por "Gmail API", selecione a opção, logo abaixo atualize as credenciais e salve as alterações feitas:

![image1357.jpg](/assets/images/oauth2_gmail_10-fb2502521c2e1a091eca6e6d66e2a924.png)

![image1357.jpg](/assets/images/oauth2_gmail_11-fa3cad3af64527461a252d6c7a95e34d.png)

![image1357.jpg](/assets/images/oauth2_gmail_12-65aa2c8bce655e696ac9206878eb8aab.png)

9. - Após esses passos, clique em criar, para criar o ID do cliente Oauth, por fim clique em download para ter acesso ao arquivo JSON contendo suas credencias:

![image1357.jpg](/assets/images/oauth2_gmail_13-d367d2c9e8d4f559d6b3846f741fd98d.png)
![image1357.jpg](/assets/images/oauth2_gmail_14-d3eb53f9f20c0322ac25f775b96bcb92.png)

# Hotmail - Enviar Email - Oauth 2.0

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/funcoes/oauth_2_hotmail

# Hotmail - Enviar Email - Oauth 2.0

O OAuth 2 é um protocolo de autorização que permite que aplicativos obtenham acesso limitado a contas de usuários em um serviço HTTP sem a necessidade de enviar seu usuário e senha. Basicamente, o usuário delega, a um determinado aplicativo, acesso aos seus dados em um determinado serviço ou API.

Para a utilzição da função Hotmail - Enviar Email - Oauth 2.0 deve-se seguir alguns protocolos para gerar o token de acesso e poder realizar o envio de emails utilizando uma autenticação moderna e segura.

O mais importante é ter uma conta no serviço de Cloud da Microsft(Azure), para este exemplo utilizarei o Postman para requisitar o token.

1.Registrar um aplicativo na Azure.

Para registrar um aplicativo basta estar logado em sua conta da AZure e pesquisar por "Registro de Aplicativo", clique em novo registro e defina um nome.

![image1357.jpg](/assets/images/hotmail_ouath2_1-d5fb622deaee0fb0d7b37221f8f79041.png)

![image1357.jpg](/assets/images/hotmail_ouath2_2-4312f2287074580e84d6d87031ef7ac9.png)

![image1357.jpg](/assets/images/hotmail_ouath2_3-79e0151a58d59a82e72d2bd31f21d74e.png)

2. Adicionar uma permissão

Para adicionar uma nova permisão, na aba lateral direita do seu aplicativo clique em permissões de APIs, selecione opção "APIs da Microsfot",
em seguida selecione a opção "Microsoft Graph", clique em "Permissões delegadas", procure por "SMTP" e adicione essa permissão ao seu aplicativo.

![image1357.jpg](/assets/images/hotmail_ouath2_4-d66c7be2bcd47590ecd65c468842b9b6.png)

![image1357.jpg](/assets/images/hotmail_ouath2_5-c2533e31eeb5aa3ab1b8037d9a489f81.png)

![image1357.jpg](/assets/images/hotmail_ouath2_6-5ee7bc7b74e6babeaad8a6ef8d8f76db.png)

![image1357.jpg](/assets/images/hotmail_ouath2_7-f45f9e21c01f038cd782c23cc8fce1ec.png)

3. Redirect URI

Para configurar um redirecionamento basta ir no menu lateral e ir "autenticação" e clicar em "adicionar uma plataforma", neste caso como é para finalidade de testes irei adicionar o CallBack URL do Postman("<https://www.postman.com/oauth2/callback>") por fim clique em configurar.

![image1357.jpg](/assets/images/hotmail_ouath2_8-645a0237792ec382531ee0262220a603.png)

![image1357.jpg](/assets/images/hotmail_ouath2_9-7ce9d603842a23113c7c2865e7be1e24.png)

4. Secret Key

Para criar um novo segredo basta ir no menu lateral e procurar por "certificados e segredos", criar um novo segredo e salvar seu valor pois será nescessário para fazer a requisição com o Postman.

![image1357.jpg](/assets/images/hotmail_ouath2_10-cc5980d7e3870898f07f1d1d3fe7c7fc.png)

5. Requisitar Token

Referente a requisição to token basta abrir um o seu Postman e criar uma nova requisição do tipo "GET" e setar o "Authorization" como Oauth 2.0.
Para configurar o "Auth URL" e o "Access Token" basta ir na aba "visão geral" referente ao seu projeto o copiar os valores que serão mostrados em tela referente a cada um dos campos.

![image1357.jpg](/assets/images/hotmail_ouath2_11-4adff052b212e5f1ae0d106271bfaaac.png)

![image1357.jpg](/assets/images/hotmail_ouath2_12-3bf97a15aa7017592269476662166852.png)

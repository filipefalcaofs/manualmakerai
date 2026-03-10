# Parâmetros de Configuração - reCaptcha

> Fonte: https://manual.softwell.com.br/docs/webrun/tela_de_configuracoes/Parametros_de_configuracao/parametro_de_configuracao_recaptcha

# Parâmetros de Configuração - reCaptcha

Visando cada vez mais a segurança na utilização de aplicações desenvolvidas com a **IDE Maker** compatibilizamos a partir da versão do *Webrun 5.0.0.21* a utilização do *Google ReCaptcha v3*.
Um dos mecanismos mais utilizados para a proteção de ambiente online contra *spam e outras atividades abusivas realizadas por robôs*.

O ReCaptcha v3 atribui uma pontuação de risco para cada interação do usuário, variando de `0.0 a 1.0`, onde `0.0` indica alta probabilidade de ser um robô e `1.0` indica alta probabilidade de ser um usuário legítimo.

> #### Considerações importantes!

- **Recomendamos a utilização deste recurso somente no ambiente de homologação/produção**.
- Para utilizar o *Google ReCaptcha v3* é necessário registrar o site no **Google Console**.

> #### Configurações Google Console:

Para utilizarmos o *Google ReCaptcha* é necessário registrar o site no **Google Console** para obtermos as chaves de site e a secreta.

- Acesse o [Console da Google](https://www.google.com/recaptcha/about/) e realize login com uma conta **Google**.
- Certifique-se que a opção *Com base em pontuação (v3)* esteja marcada.
- Insira as informações de etiqueta e os domínios nos seus respectivos campos e clique em enviar.

![Google Console - Imagem 1](/assets/images/recaptchav3_1-133269e739ca5d670f62563ecd53756d.png)

- Nessa tela copie as informações da chave de site e a chave privada.

![Google Console - Imagem 2](/assets/images/recaptchav3_2-4ee693da23c869fe4979137d125822e6.png)

> #### Configurações Webrun

Após a configuração no **Google Console** vamos inserir as informações da chave de site e chave secreta na interface de configurações do **Webrun**.

- Na interface de configurações vamos criar um novo grupo denominado `ReCaptcha`.
- Adicionaremos dois parâmetros com os seguintes valores:
  - `secretKey` e valor da chave copiada no console *(Chave Secreta)*.
  - `siteKey` e o valor da chave copiada no console *(Chave de Site)*.

![Configuração Webrun - Imagem 3](/assets/images/recaptchav3_3-081fa090b8b2ae665c6a7d92d9165de3.png)

- Após a configuração, reinicie o servidor de aplicações.
- Depois de configurado os parâmetros, o **Webrun** habilitará o ReCaptcha na interface.

![Configuração Webrun - Imagem 5](/assets/images/recaptchav3_4-61e730da4133d5d85825c11febadd4bb.png)

- **A validação do Token gerado pela API da Google é realizada no momento que o usuário tenta fazer o login na:**
  - **Interface de Login Administrativo**
  - **Interface de Login da Aplicação**

> #### Observações:

- A validação é realizada automaticamente pelo **Webrun** quando os parâmetros do grupo *ReCaptcha* estão configurados corretamente.
- Caso alguma informação estaja equívocada, é necessário realizar a edição das configurações por meio do arquivo *config.xml*. Já que a tela administrativa realizará a validação do *Captcha* na tentativa de login.
- O **Webrun** suporta somente a versão `Google ReCaptcha v3`

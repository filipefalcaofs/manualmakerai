# Publicando um sistema

> Fonte: https://manual.softwell.com.br/docs/webrun/webrun_NET/publicando_um_sistema_net

# Publicando um sistema

**A publicação para a plataforma.net é bastante simples, seguindo o mesmo padrão de publicação do Webrun java. Abaixo serão exemplificados o passo a passo para conseguirmos realizar uma publicação utilizando a versão .net:**

- Acesse o Webrun. Para mais informações [clique aqui](/docs/webrun/acessando_webrun). Após acessar o Webrun clique em **Configurações**.

![image1879.jpg](/assets/images/net_publicar_1-453671b5f9d5f14e3c433403d1ff7737.png)

1. Por padrão, a senha do painel administrativo onde realiza a autenticação para publicação é:

- Usuáro: admin;
- Senha: webrun;

Após inserir os dados clique em *Acessar*.

![image1879.jpg](/assets/images/net_publicar_2-3bec18baa9cf1d9a54dbd08ecd9d9ca7.png)

1. Após autenticar, a seguinte tela será aberta;
2. Selecione a opção gerenciar sistemas onde são listados todos os sistemas que estejam referenciados na pasta systems do Webrun.

![image1879.jpg](/assets/images/net_publicar_3-2853fab9a90503234adf29bd79835805.png)

- Realize uma busca pelo sistema que deseja realizar a exportação. Selecione **Configurações** e em seguida **Exportar**.

![image1879.jpg](/assets/images/net_publicar_4-d4de49cb670d7b5523ac97450a078521.png)

2. Feito isso, será apresentado uma tela onde o desenvolvedor possui duas formas de exportação:

- **Exportar Código.Net(zip) / Exportar Aplicação (zip)** – gera código-fonte do sistema selecionado, para ser utilizado na pasta systems, do diretório onde instalou o Webrun.

  - Por padrão o ZIP é baixado na pasta *Downloads*, direcione o arquivo para a pasta systems do Webrun. Renomeie o arquivo ZIP para o mesmo nome do WFRE do sistema exportado;
  - Reinicie o Webrun;
- **Publicar Aplicação.Net(zip) / Exportar Aplicação e Framework/Webrun (zip)** - gera um arquivo com extensão \*.zip, para ser utilizado em uma pasta que sirva de repositório do servidor de aplicações, em máquinas sem o Webrun instalado.

![image1879.jpg](/assets/images/net_publicar_6-d53cef62fde220fd0aebfbdfd01a9245.png)

3. Neste exemplo utilizaremos a opção **Publicar Aplicação.Net(zip) / Exportar Aplicação e Framework/Webrun (zip)**.

![image1879.jpg](/assets/images/net_publicar_7-c8e2b79579e265ed96a0315d91ab9154.png)

Após clicar em *Exportar*, é necessário realizar a extração dos arquivos com um programa de descompactação, porém antes sugerimos a criação de uma pasta que servirá como repositório, englobando as demais versões do aplicativo. Nesta exemplificações iremos utilizar a partição *C:\Publicando.NET* e iremos inserir o arquivo extraído.

![image1879.jpg](/assets/images/net_publicar_8-0d351806701c513e9d8fc1e016958246.png)

Ao descompactar, os arquivos na pasta solicitada, vá ao *Gerenciador do serviços de informações da internet (IIS)*

- Ao abrir o gerenciador será possível visualizar a interface de controle do servidor de aplicações.

![net_gerenciador_iss_2.png](/assets/images/net_gerenciador_iis_2-8400f6531e7720bf0072dc43c59b9fd0.png)

Clique com o botão direito sobre *Default Web Site* e selecione *Adicionar Aplicativo*

![net_add_app.png](/assets/images/net_add_app-25b4648eb6589c611d51cb0eae5311ae.png)

- Uma nova interface será aberta e iremos passar os parâmetros:

  - Alias: **Nome\_da\_Aplicação**
  - Pool de aplicativos: Para mais informações sobre como configurar *Pool de aplicativos* [clique aqui](/docs/webrun/webrun_NET/instalacao_do_webrun_dotnet)
  - Caminho físico: **Caminho da Aplicação** *Neste caso o caminho do nosso repositorio do sistema que queremos publicar*
  - Clique em OK

  ![net_add_app.png](/assets/images/net_publicar_9-c3044bae4f9ecda8bfae5b911f044bc5.png)
- Após isso, irá carregar a sua aplicação;

![net_add_app.png](/assets/images/net_publicar_10-1f04341cf0ae73abec207ed5daa60448.png)

- Agora basta selecionar o aplicativo e clicar em *Procurar Aplicativo* e aguardar o carregamento do aplicativo pelo navegador.

![net_add_app.png](/assets/images/net_publicar_12-d2c9af6890c4fa643f6ee5453f574300.png)

- Visualização da aplicação carregada no navegador.

![net_add_app.png](/assets/images/net_publicar_11-e79f9036a8e47fd56940a904b10a0fdd.png)

---

---

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

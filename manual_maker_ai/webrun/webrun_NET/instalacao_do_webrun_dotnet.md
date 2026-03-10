# Configurações do Webrun.Net

> Fonte: https://manual.softwell.com.br/docs/webrun/webrun_NET/instalacao_do_webrun_dotnet

# Configurações do Webrun.Net

#### Para que a configuração seja realizado com sucesso, precisamos seguir os passos abaixo:

##### Configurações do servidor de aplicações IIS - Internet Information Services

**O IIS é o servidor web da Microsoft necessário para rodar aplicações ASP ou ASP.NET. O Webrun.Net está configurado para rodar a partir da versão 6.0 do IIS**.

Como o **IIS** é um componente adicional do **Sistema Operacional Windows**, por padrão este é desativado. Para ativar o recurso são necessário realizar as seguintes configurações:

1. O primeiro passo é abrir o editor de ativação de recursos **Ativar ou Desativar Recursos do Windows**. Para tal, basta pressionar a tecla *Window* e realizar a busca, conforme imagem abaixo.

![net_ativar_recurso.png](/assets/images/net_ativar_recurso-c3945852d023a483899385d76130ffef.png)

2. Agora precisamos ativar alguns recursos para o correto funcionamento do *Gerenciador do IIS* que são:

- Serviços de Informações da Internet
  - Ferramentas de Gerenciamento da Web
    - Console de Gerenciamento do IIS
    - Scripts e Ferramentas de Gerenciamento do IIS
    - Serviço de Gerenciamento do IIS
  - Serviço da World Wide Web
    - Recursos de Desenvolvimento de Aplicativos
      - .NET Extensibility 4.8
      - ASP
      - ASP.NET 3.5
      - ASP.NET 4.8
      - CGI
      - Estensibilidade .NET 3.5
      - Extensões ISAPI
      - Filtros ISAPI
      - Inicialização de aplicativos

![net_ativar_recurso_iss.png](/assets/images/net_ativar_recurso_iis-5a1bde4b0016c5c20e75ad04da26d816.png)

Clique em Ok e aguarde o processo da ativação dos recursos, pode ser necessário reiniciar o sistema operacional para a total efetivação dos recursos.

3. Após à ativação será possível realizar o gerenciamento do servidor de aplicações, para isso, basta pressionar a tecla *Window* e realizar uma busca por *IIS*.

![net_gerenciador_iss.png](/assets/images/net_gerenciador_iis-851738715f25a42524d14341c9a13303.png)

4. Ao abrir o gerenciador será possível visualizar a interface de controle do servidor de aplicações.

![net_gerenciador_iss_2.png](/assets/images/net_gerenciador_iis_2-8400f6531e7720bf0072dc43c59b9fd0.png)

5. O próximo passo é criarmos nosso *Pool de Aplicativo* que será utilizado na criação dos nossos aplicativos. Para isso siga os seguintes passos:

- Clique em Pool de Aplicativos no *Gerenciador IIS*
- Localize *Ações* e clique em **Adicionar Pool de Aplicativos** e configure corforme imagem abaixo:

![net_pool_conf.png](/assets/images/net_pool_conf-0c8b810e5ce03d1554c9fc74e587aba1.png)

- Nome: **Nome\_Para\_o\_Seu\_Pool**
- Versão do .NET CLR: Precisa **definir a versão 4**
- Modo de pipeline gerenciado: **Integrado**
- Marcar a opção para inicialização do pool de aplicativos imediatamente.

6. Realizado os passos acima, precisamos habilitar nas configurações avançadas a compatibilidade para aplicativos de 32Bits, basta modificar o valor do argumento para **True** e pressionar OK.

![net_pool_conf_avancada.png](/assets/images/net_pool_conf_avancada-9417e8d926f1002f4359ab82bb0916e4.png)

7. O próximo passo será configurar um novo aplicativo, para isso precisamos realizar o download da versão do *Webrun.NET*. Para obter a versão mais recente [clique aqui.](http://download.softwell.com.br/makerstudiobootstrap/WebrunDotNet/WebrunStudio.NET_1.2.0.88_Bootstrap.zip)
8. Após realizar o download da versão do *Webrun.NET* é necessário realizar a extração dos arquivos com um programa de descompactação, porém antes sugerimos a criação de uma pasta que servirá como repositório, englobando as demais versões do aplicativo. Nesta exemplificações iremos utilizar a partição **C:\Webrun.NET** e iremos inserir o arquivo extraído.

![net_contexto.png](/assets/images/net_contexto-03a6e9bb0ec0a9b1e0d66b81ea340321.png)

9. Agora vamos adicionar um novo aplicativo no *Gerenciador IIS*:

- Clicar com o botão direito do mouse sobre *Default Web Site*
- Clique em *Adicionar Aplicativo*

![net_add_app.png](/assets/images/net_add_app-25b4648eb6589c611d51cb0eae5311ae.png)

- Uma nova interface será aberta e iremos passar os parâmetros:
  - Alias: **Nome\_do\_Contexto**
  - Pool de aplicativos: **Pool que configuramos anteriormente**
  - Caminho físico: **Caminho da Aplicação** *Neste caso o caminho do nosso repositorio com a a versão*
  - Clique em OK

![net_add_app_2.png](/assets/images/net_add_app_2-41fd923fc35c8e669595058965e7ee21.png)

10. Agora basta selecionar o aplicativo que adicionamos e clicar em *Procurar Aplicativo* e aguardar o carregamento do aplicativo pelo navegador.

![net_procurar.png](/assets/images/net_procurar-705d83ecdcf00b5047ccabe4dd3e8c45.png)

11. Visualização da aplicação carregada no navegador.

![net_visualizacao.png](/assets/images/net_visualizacao-a6df8e431471c9c69bd505d4c1df050d.png)

#### Observações:

1. Em alguns casos pode ser apresentado bloqueio de acesso à aplicação, sendo necessário editar as permissões do aplicativo pelo próprio *Gerenciador IIS*. Para tal, basta realizar um clique com o botão direito do mouse sobre o aplicativo e clicar em editar permissões.
2. Em alguns casos a lista de sistema não é carregada, sendo assim, é necessário realizar a criação da variável de ambiente **WBERUN\_HOME**, esta variável aponta para o diretório onde as pastas **REPORTS, CONFIG e SYSTEMS** se encontram. O valor desta variável pode ser personalizado pelo desenvolvedor para apontar para o diretório desejado. É necessário reiniciar o servidor de aplicações para leitura do parâmetro.
3. Por padrão o *Gerenciador IIS* vem configurado na porta 80.

##### Pronto, agora é possível desfrutar da versão do Webrun.NET!

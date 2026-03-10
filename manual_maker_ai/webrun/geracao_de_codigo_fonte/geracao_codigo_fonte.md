# Geração de Código-Fonte

> Fonte: https://manual.softwell.com.br/docs/webrun/geracao_de_codigo_fonte/geracao_codigo_fonte

# Geração de Código-Fonte

É possível exportar um sistema para ser utilizado independentemente da instalação do Webrun e ser executado a partir de um servidor de aplicações. Para tal, utilizaremos o WAR (Web application ARchive), que é um pacote cujo conteúdo são os arquivos do contexto da aplicação web. Utilizando este formato de arquivo a aplicação se torna “portável”, pois não depende da estrutura do Webrun para ser executado.

Outra forma é a exportação do JAR (Java ARchive), que é um arquivo compactado usado para distribuir um conjunto de classes Java. É usado para armazenar classes compiladas e metadados que constituem uma aplicação. Utilizando este formato de arquivo, sua execução só será possível se no ambiente tiver o Webrun instalado, pois o arquivo \*.JAR deverá possuir o mesmo nome do \*.WFRE e ficar na mesma pasta (systems).

Para a utilização deste recurso, siga os passos:

- Acesse o Webrun. Para mais informações [clique aqui](/docs/webrun/acessando_webrun).

![image1879.jpg](/assets/images/net_publicar_1-453671b5f9d5f14e3c433403d1ff7737.png)

- Por padrão, a senha do painel administrativo onde realiza a autenticação para realizar a publicação é: login: admin e senha: webrun. Após inserir os dados clique em *Acessar*.

![image1879.jpg](/assets/images/net_publicar_2-3bec18baa9cf1d9a54dbd08ecd9d9ca7.png)

1. Após autenticar no Painel de admistração, a seguinte tela será aberta;
2. Selecione a opção gerenciar sistemas para que sejam listados todos os sistemas que estejam referenciados na pasta Systems do Webrun.

![image1879.jpg](/assets/images/net_publicar_3-2853fab9a90503234adf29bd79835805.png)

- Realize uma busca pelo sistema que deseja realizar a exportação. Selecione **Configurações** e em seguida **Exportar**.

![image1879.jpg](/assets/images/net_publicar_4-d4de49cb670d7b5523ac97450a078521.png)

3. Feito isso, será apresentado uma tela com duas formas de exportação:

![image1134.jpg](/assets/images/publicar_java1-c977124ec0f837ddef25cdea4fed579a.png)

6. Siga as instruções da tela e execute uma das opções disponíveis:

   1. Exportar Código (jar) - gera código-fonte do sistema selecionado, para ser utilizado na pasta systems, do diretório onde instalou o Webrun. Saiba mais acessando o tópico [Exportar Código (jar)](/docs/webrun/geracao_de_codigo_fonte/exportar_codigo_jar);
   2. Publicar (war) - gera um arquivo com extensão \*.war, para ser utilizado na pasta de deploy do seu Servidor de Aplicação Web (como exemplo, Tomcat, JBoss e IBM WebShere), em máquinas sem o Webrun instalado. Saiba mais acessando o tópico [Publicar (war)](/docs/webrun/geracao_de_codigo_fonte/publicar_war).

Para distribuir uma aplicação desenvolvida e publicada é necessário verificar alguns pré-requisitos no ambiente onde esta aplicação será instalada:

- Java 1.5 Para versões do Maker até 3.5, Java 1.6 para versões até 3.9 ou Java 1.8 para versões do Maker Studio em diante;
- Servidor de aplicações Java. Atualmente Tomcat 8.5, JBoss 4.2.1GA, Websphere 6/7 são os servidores homologados;
- Wine 1.6(ver observação 2);
- As aplicações desenvolvidas funcionam nas seguintes plataformas: Windows, Linux ou Mac, contanto que sigam as especificações supracitadas.

Observações:

1. Para utilizá-lo em ambiente Linux, é necessário que seja utilizado o Wine para emular aplicações Windows. Caso não deseje utilizar o Wine, pode ser usado o Jasper. No Maker existe um conversor ReportBuilder -> Jasper integrado à ferramenta;

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

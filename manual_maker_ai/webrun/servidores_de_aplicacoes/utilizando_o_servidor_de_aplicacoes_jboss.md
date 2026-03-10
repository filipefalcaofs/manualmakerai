# Utilizando o Servidor de Aplicações JBoss

> Fonte: https://manual.softwell.com.br/docs/webrun/servidores_de_aplicacoes/utilizando_o_servidor_de_aplicacoes_jboss

# Utilizando o Servidor de Aplicações JBoss

Esse exemplo mostra como instalar e configurar o JBoss para funcionar perfeitamente com o Webrun e as aplicações criadas em Maker.

A versão homologada é a 4.2.1.GA que pode ser baixada no link a seguir.

Softwares necessários:

1. [Máquina Virtual Java JDK](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk7-downloads-1880260.html)
2. [JBoss-4.2.1.GA](http://sourceforge.net/projects/jboss/files/JBoss/JBoss-4.2.1.GA/)

Baixe o JDK e instale.

Concluindo a instalação do JDK baixe o JBoss e o extraia em uma pasta qualquer, nesse exemplo foi extraído na unidade raiz C:\ jboss-4.2.1.GA.

Depois de descompactar, deve-se configurar a variável de ambiente do Windows que o JBoss utilizará.

Vá em Iniciar -> Meu computador clique com o botão direito sobre o mesmo e em seguida clique em Propriedades, siga para a aba Configurações avançadas do Sistema e posteriormente clique em Variáveis de Ambiente. A seguinte tela será exibida.

![image1719.jpg](/assets/images/image1719-6b849b2c5dbb992b6dd060e2cc795f0e.jpg)

No segundo quadro Variáveis do Sistema clique no botão Novo...

![image1720.jpg](/assets/images/image1720-dc7e0dcca70f52c37671a5155b10eec7.jpg)

No campo Nome da variável adicione JBOSS\_HOME.

No campo Valor da variável adicione C:\jboss-4.2.1.GA (Caminho onde esta a pasta do JBOSS que foi descompactada).

Ficando assim:

![image1721.jpg](/assets/images/image1721-1fbdfd1b6c2cbe8810e41cc3a041cdf3.jpg)

Nessa mesma tela configure a variável WEBRUN\_HOME. Esta variável é utilizada pelo Webrun para carregar os arquivos de configuração, projetos e relatórios.

Clique em Novo... novamente:

No campo Nome da variável coloque WEBRUN\_HOME.

No campo Valor da variável adicione o caminho onde está a pasta que contém os projetos do Maker, nesse exemplo estão em C:\Program Files\Softwell Solutions\Webrun.

Ficando dessa forma:

![image1722.jpg](/assets/images/image1722-bcb49459ee4705e4b17d2bd1c57421bd.jpg)

Crie também caso já não exista, a Variável de ambiente JAVA\_HOME que terá como Valor da variável o valor C:\Program Files\Java\jdk7 (Pasta onde está instalado o JDK).

Ficando assim

![image1723.jpg](/assets/images/image1723-274b3c658b48b95250a57ef83dae6881.jpg)

Clique em OK nessa e nas outras telas abertas para que as configurações sejam salvas.

Finalizado essa parte, é necessário configurar o arquivo web.xml do JBoss que fica no diretório C:\jboss-4.2.1.GA\server\default\deploy\jboss-web.deployer\conf\web.xml.

Abra-o com um editor de texto e encontre a seguinte parte.

jsp
org.apache.jasper.servlet.JspServlet

fork

false

xpoweredBy

false

Logo abaixo adicione os seguintes parâmetros:

compilerSourceVM

1.5

compilerTargetVM

1.5

Ficando assim:

jsp
org.apache.jasper.servlet.JspServlet

fork

false

xpoweredBy

false

compilerSourceVM

1.5

compilerTargetVM

1.5

Observação: a parte em negrito foi a parte adicionada.

Terminado essas configurações, abra o seguinte diretório C:\jboss-4.2.1.GA\bin, nela execute arquivo run.bat.

O servidor será iniciado, e ao término mostrará a seguinte tela

![image1724.jpg](/assets/images/image1724-ca4e9dead18d541da1a760e6271ca3ae.jpg)

O próximo passo é colocar o webrun.war no diretório C:\jboss-4.2.1.GA\server\default\deploy para que seja feita a publicação.

![image1725.jpg](/assets/images/image1725-a2dceea9c7b0602e11cf722e3fa35f65.jpg)

Agora acesse o webrun localhost:8036/webrun/

![image1827.jpg](/assets/images/image1827-dd7cdb77e6b78c13c577d3e8171a0a7d.jpg)

Por padrão o JBoss utiliza a porta 8036. Essa porta pode ser modificada no arquivo server.xml que fica em C:\jboss-4.2.1.GA\server\default\deploy\jboss-web.deployer.

Logo ao no início do arquivo encontre:

`<Connector port="8036" address="${jboss.bind.address}"`

         maxThreads="250" maxHttpHeaderSize="8192"

         emptySessionPath="true" protocol="HTTP/1.1"

         enableLookups="false" redirectPort="8443" acceptCount="100"

         connectionTimeout="20000" disableUploadTimeout="true" />

O valor de cor vermelha representa a porta que o servidor está utilizando, basta alterá-la e salvar o arquivo.

No exemplo foi aplicada a porta ficando assim:

`<Connector port="<Port>" address="${jboss.bind.address}"`

         maxThreads="250" maxHttpHeaderSize="8192"

         emptySessionPath="true" protocol="HTTP/1.1"

         enableLookups="false" redirectPort="8443" acceptCount="100"

         connectionTimeout="20000" disableUploadTimeout="true" />

Observação: Por padrão, o JBoss aceita somente conexões locais. Para aceitar conexões remotas, é necessário executar o arquivo run.bat com o parâmetro -b 0.0.0.0; Mais informações em: <http://community.jboss.org/wiki/JBoss42FAQ>.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

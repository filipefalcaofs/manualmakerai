# Procedimentos para instalação de um ambiente dedicado para o Webrun no Linux

> Fonte: https://manual.softwell.com.br/docs/webrun/webrun_no_linux/procedimentos_para_instalacao_de_um_ambiente_dedicado_para_o_webrun_no_linux

# Procedimentos para instalação de um ambiente dedicado para o Webrun no Linux

Arquivos necessários:

- Apache Tomcat 6 ou superior, sendo a versão recomendada na data da edição desse documento encontrada em Tomcat 6;
- JDK 6 ou superior, recomendada a distribuição da Oracle, sendo a versão recomendada na edição desse documento encontrada em JRockit6-R28.2.7 JDK Linux (x86 - 32 bit) ou JRockit6-R28.2.7 JDK Linux (Intel EM64T & AMD64 - 64 bit);
- Siga os passos abaixo:

1. webrun-start.sh
2. webrun-stop.sh

Procedimento de Instalação

1. Crie uma pasta e copie os arquivos necessários para a instalação. É recomendado que seja criada a pasta /usr/local/webrun e dentro dela colocada uma pasta para cada ambiente dedicado. Neste exemplo, usaremos o diretório sample (/usr/local/webrun/sample) para tal.
2. Descompacte/instale os requisitos:

cd /usr/local/webrun/sample

tar zxf apache-tomcat-6.tar.gz

tar zxf [scripts-webrun.tar.gz](http://download.softwell.com.br/webrun/linux/webrun-scripts-20091126.tar.gz)

./JRockit6-R28.2.7-jdk6-linux-ia32.bin

ln -s apache-tomcat-6.0.16 tomcat

ln -s JRockit6-R28.2.7-jdk6 jdk

mkdir conf

mkdir webapps

Deve existir um link simbólico para a jdk e tomcat escolhidos conforme o exemplo.

3. Edite o arquivo /usr/local/webrun/sample/tomcat/conf/server.xml, trocando as portas para não colidirem com serviços em execução no sistema:

`<Server port="8047" shutdown="SHUTDOWN">`

…

`<Connector port="8036" protocol="HTTP/1.1"`

`connectionTimeout="20000"`

`redirectPort="8443" />`

...

`<Connector port="9037" protocol="AJP/1.3" redirectPort="8443" />`

4. Ainda no mesmo arquivo, mude a pasta\_base do contexto do Tomcat, mudando de:

`<Host name="localhost"  appBase="webapps"`

`unpackWARs="true" autoDeploy="true"`

`xmlValidation="false" xmlNamespaceAware="false">`

Para:

`<Host name="localhost"`

`appBase="/usr/local/webrun/sample/webapps"`

`unpackWARs="true" autoDeploy="true"`

`xmlValidation="false" xmlNamespaceAware="false">`

5. Copie o arquivo webrun.war da sua distribuição do Webrun para a pasta /usr/local/webrun/sample/webapps, renomeando-o em seguida para ROOT.war.
6. Copie as pastas systems, config e reports da sua distribuição do Webrun para a pasta /usr/local/webrun/sample/conf.
7. Você agora poderá usar os scripts /usr/local/webrun/sample/webrun-start.sh para iniciar o Webrun e /usr/local/webrun/sample/webrun-stop.sh para parar o Webrun.

Observações:

1. Substitua sample pelo nome da instância dedicada que deseja criar.
2. Caso não funcione após executar o webrun-star.sh, basta ir em /usr/local/webrun/sample/tomcat/bin e usar o comando ./catalina.sh run.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

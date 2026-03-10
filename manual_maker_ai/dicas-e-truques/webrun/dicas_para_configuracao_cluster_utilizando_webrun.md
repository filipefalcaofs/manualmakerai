# Dicas para a configuração de um cluster utilizando o Webrun

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/dicas_para_configuracao_cluster_utilizando_webrun

# Dicas para a configuração de um cluster utilizando o Webrun

- Servidor FrontEnd: Apache 2.2.25 ou superior

<http://www.superdownloads.com.br/download/99/apache/>

- Servidores BackEnd: Apache Tomcat 8.0

<http://www.superdownloads.com.br/download/153/apache-tomcat/>

1. Configuração do arquivo httpd.conf da máquina Servidor FrontEnd:
2. 1. Módulos requeridos:

      1. LoadModule proxy\_module modules/mod\_proxy.so
      2. LoadModule proxy\_balancer\_module modules/mod\_proxy\_balancer.so
   2. Configuração adicional:

      1. Include conf/extra/httpd-webrun-balancer.conf

   Observação: O arquivo httpd.conf encontra-se na pasta C:\Arquivos de programas\Apache Software Foundation\Apache2.2.25\conf da máquina Servidor FrontEnd. Localize os módulos descritos acima e retire a marca de comentário, ou seja, o símbolo "#". E, inclua a Configuração adicional no final do documento.
3. Configuração do arquivo server.xml em cada Servidor BackEnd:

   1. Localizar `<Engine name="Catalina" defaultHost="localhost">` e mudar para `<Engine name="Catalina" defaultHost="localhost" jvmRoute="\[nome do jvmroute\]">` e adicionar `<attribute name="UseJK">true</attribute>` logo abaixo.

Observação: O arquivo server.xml encontra-se na pasta C:\Arquivos de programas\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\conf da máquina Servidor FrontEnd. O parâmetro [nome do jvmroute] corresponde a uma identificação para a máquina que compõe o cluster. Exemplo:

`<Engine name="Catalina" defaultHost="localhost" jvmRoute="noh01">`

Na pasta C:\Arquivos de programas\Apache Software Foundation\Apache2.2.25\conf\extra, deve existir o arquivo http-webrun-balancer.conf para especificar os servidores que fazem parte do cluster:

`<Proxy balancer://webrun>`

BalancerMember ajp://[servidor 1]:[porta ajp] route=[nome do jvmroute] ping=[valor do ping]

BalancerMember ajp://[servidor 2]:[porta ajp] route=[nome do jvmroute] ping=[valor do ping]

BalancerMember ajp://[servidor 3]:[porta ajp] route=[nome do jvmroute] ping=[valor do ping]

`</Proxy>`

ProxyPass / balancer://webrun/ stickysession=JSESSIONID nofailover=On

Observações:

1. O parâmetro [servidor 1] corresponde ao IP das máquinas do cluster;
2. O parâmetro [porta ajp] corresponde à porta do Webrun das máquinas do cluster;
3. O parâmetro [nome do jvmroute] corresponde à identificação aplicada no item 2 (configuração no arquivo server.xml);
4. O parâmetro [valor do ping] corresponde a um valor em milissegundos.

Exemplo:

`<Proxy balancer://webrun>`

BalancerMember ajp://192.168.1.101:8036 route=noh01 ping=1

BalancerMember ajp://192.168.1.102:8036 route=noh02 ping=1

`</Proxy>`

BalancerMember ajp://192.168.1.103:8036 route=noh03 ping=1

`</Proxy>`

ProxyPass / balancer://webrun/ stickysession=JSESSIONID nofailover=On

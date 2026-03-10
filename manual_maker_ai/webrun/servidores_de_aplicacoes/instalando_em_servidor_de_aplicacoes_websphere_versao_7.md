# Instalando em servidor de aplicações WebSphere

> Fonte: https://manual.softwell.com.br/docs/webrun/servidores_de_aplicacoes/instalando_em_servidor_de_aplicacoes_websphere_versao_7

# Instalando em servidor de aplicações WebSphere

## Websphere Application Server 7.0

Os usuários poderão utilizar o Websphere Application Server 7.0 ou superior, sendo compatível com o Webrun 3 ou superior.

WebSphere é o nome de uma família de softwares da IBM para criação e execução de aplicações baseadas no padrão Java J2EE, fornecendo também infraestrutura para a integração de aplicações corporativas.

WebSphere Application Server (WAS) é um dos principais servidores para J2EE e web services e oferece uma máquina transacional de alta disponibilidade com capacidades avançadas de performance e gerenciamento. É um produto da IBM e tem uma grande fatia do mercado.

É o único servidor de aplicação capaz de executar em todas as plataformas importantes do mercado como Windows, Linux, vários Unix, AS/400 e até mesmo no mainframe onde tem crescido em larga escala.

A IBM também fornece uma versão gratuita de servidor de aplicação baseada no Apache Geronimo que tem o nome de WebSphere Application Server Community Edition.

A versão homologada encontra-se em:

<http://www.ibm.com/developerworks/downloads/ws/was/>

Aversão Community homologada encontra-se em:

<http://www.ibm.com/developerworks/downloads/ws/wasce/?S_TACT=105AGX10&S_CMP=LP>

## Websphere Application Server 6.1

Para o Websphere Application Server 6.1 funcionar corretamente, o seguinte procedimento deve ser feito: ativar a versão 1.5 do JAVA:

1. Abra o arquivo ibm-web-ext.xmi que se encontra na pasta:

C:\Arquivos de programas\IBM\WebSphere\AppServer\profiles\`<profilename>`\config\cells\`<cellname>`\applications\`<enterpriseappname>`\deployments\`<deployedname>`\`<webmodulename>`\WEB-INF

Os parâmetros de configuração do mecanismo JSP estão armazenados em um diretório de configuração de um módulo da Web ou em um diretório de binários de um módulo da Web, neste arquivo.

2. Edite o arquivo incluindo o parâmetro de configuração no seguinte formato:

;

3. Salve o arquivo.
4. Reinicie o Aplicativo Corporativo. Não é necessário reiniciar o servidor para que as alterações de parâmetros tenham efeito. No entanto, alguns parâmetros de configuração do mecanismo de JSP afetam o código-fonte Java que é gerado para uma JSP. Se um desses parâmetros for alterado, será preciso converter novamente os arquivos JSP no módulo da Web para gerar novamente a fonte Java. Você pode utilizar o Compilador de .bat para converter novamente todos os arquivos JSP em um módulo da Web. O Compilador de .bat utiliza os parâmetros de configuração do mecanismo de JSP que foram definidos no arquivo ibm-web-ext.xmi, a menos que você os substitua especificamente.

Mais informações:

<http://publib.boulder.ibm.com/infocenter/wasinfo/v6r1/index.jsp?topic=/com.ibm.websphere.base.doc/info/aes/ae/rweb_jspengine.html>

<http://www.ibm.com/developerworks/forums/thread.jspa?messageID=14169625>

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

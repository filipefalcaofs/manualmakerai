# Instalando o Webrun no Fedora Core 9

> Fonte: https://manual.softwell.com.br/docs/webrun/webrun_no_linux/instalando_o_webrun_no_fedora_Core9_

# Instalando o Webrun no Fedora Core 9

#### Observação: Quando seguir os passos desta parte do manual observa-se que que utiliza a versão TOMCAT 7 , JDK6 e JRokit6 essas versões não são fixas você pode utilizar versões mais atuais, lembrando que este tutorial só funcionará no FEDORA versão 9, pode-se tentar esses passos nas versões posteriores do FEDORA, porém, não garantimos 100% de funcionalidade nestas versões!

O Webrun funciona perfeitamente dentro do Fedora Core 9, usando as seguintes recomendações:

## Instalador Automático

O objetivo é ter um instalador automático para o Webrun, mas, enquanto ele não existe, a instalação é feita de forma manual.

## Imagens para o VMWare

Fedora Core 9 64 bits

<http://download.softwell.com.br/webrun/linux/webrun.virtual.machine.x64.rar>

## Softwares Necessários

- Oracle JRockit JDK
- Wine - Contido na distribuição
- cabextract - Contido na distribuição
- winetricks

<http://www.kegel.com/wine/winetricks>

- Apache Tomcat 7

<https://tomcat.apache.org/download-70.cgi>

## Diretório de Trabalho

Assume-se que o diretório de trabalho será /usr/webrun:

#mkdir /usr/webrun

#cd /usr/webrun

## Instalando a JDK

Faça o download da JDK [6] e coloque na pasta de trabalho. Se preferir, você pode fazer o download pelo terminal:

#cd /usr/webrun

#wget

Inicie o instalador da JDK

#chmod 755 /usr/webrun/JRockit6-R28.2.7-linux-ia32.bin

#/usr/webrun/JRockit6-R28.2.7-linux-ia32.bin `<- ou ->` #/usr/webrun/JRockit6-R28.2.7-linux-ia64.bin

Mude a pasta de instalação para dentro da pasta de trabalho conforme a imagem abaixo:

![image848.jpg](/assets/images/image848-05de03ec1678081bf543663e0b7b7a5b.jpg)

Crie um link simbólico para a pasta da JDK:

#ln -s /usr/webrun/JRockit6-R28.2.7-linux-ia32 /usr/webrun/jdk `<- ou ->` #ln -s /usr/webrun/JRockit6-R28.2.7-linux-ia64 /usr/webrun/jdk

## Instalando o Wine

A instalação do WINE é bem simples, apenas execute como root:

#yum install wine

e, para os pacotes adicionais, execute como root:

#yum install cabextract

#cd /usr/webrun

#wget [www.kegel.com/wine/winetricks](http://www.kegel.com/wine/winetricks)

#sh winetricks riched20

#sh winetricks mdac28

## Instalando o Tomcat

Faça o download do Apache Tomcat [7] e coloque na pasta de trabalho.

Se preferir, você pode fazer o download pelo terminal:

#cd /usr/webrun

#wget <https://tomcat.apache.org/download-70.cgi>

Descompacte o Apache Tomcat

#cd /usr/webrun

#tar zxf apache-tomcat-7.0.62.tar.gz

Crie um link simbólico para a pasta do tomcat

#ln -s /usr/webrun/apache-tomcat-7.0.62 /usr/webrun/tomcat

## Instalando o Webrun

Copie o Webrun.war do DVD do Maker para a pasta /usr/webrun/tomcat/webapps e execute os comandos:

#rm -Rf /usr/webrun/tomcat/webapps/ROOT

#mv /usr/webrun/tomcat/webapps/webrun.war /usr/webrun/tomcat/webapps/ROOT.war

Crie a pasta de configurações do Webrun

#mkdir /usr/webrun/conf

Copie as pastas especiais do Webrun (config, reports e systems) do DVD do Maker ou de [7] para a pasta /usr/webrun/conf recém-criada

É necessário copiar a DLL winsocks.dll que pode ser obtida em Media:WINSOCK.zip e colocar na pasta /usr/webrun/conf/reports

## Scripts de Inicialização

Descompacte o arquivo de Scripts de inicialização contido no DVD ou em [8] do Maker na pasta /usr/webrun

## Finalização da Instalação

Agora pode iniciar o Webrun executando o script webrun-start.sh e parar usando o webrun-stop.sh:

#/usr/webrun/webrun-start.sh

#/usr/webrun/webrun-stop.sh

Os scripts devem ser executados de dentro da interface gráfica.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

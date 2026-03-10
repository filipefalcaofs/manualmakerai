# Certificação Digital no ambiente Webrun

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/certificacao_digital_ambiente_webrun

# Certificação Digital no ambiente Webrun

Certificado Digital é um documento eletrônico que contém informações da identidade de uma pessoa ou de uma instituição. Existem duas maneiras para se obter um Certificado Digital, solicitando a uma Autoridade Certificadora (Certificate Authority ou CA) ou gerando por conta própria, por meio de ferramentas adequadas, por exemplo, a ferramenta gratuita OpenSSL.

Iremos utilizar as seguintes ferramentas:

![image358.jpg](data:image/jpeg;base64,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)

A ferramenta OpenSSL pode ser baixada no site [www.openssl.org](https://www.openssl.org) juntamente com sua documentação e esta será utilizada para demonstrar como gerar seu próprio Certificado Digital.

Recomendações:

- Para gerar o Certificado Digital, é necessária a instalação do Tomcat a partir da versão 6.
- Sugere-se criar uma pasta C:\CertificadoSSL.

Criando Sua Própria Autoridade Certificadora

Gerando Chaves Privadas e Certificados para sua própria CA

Execute os seguintes passos:

1. Crie uma pasta chamada CertificadoSSL.
2. Execute o seguinte comando no diretório C:\OpenSSL\bin:

openssl req -new -newkey rsa:1024 -nodes -out C:\CertificadoSSL\CA.csr -keyout C:\CertificadoSSL\CA.key

![image374.jpg](/assets/images/image374-ceb2ba9c3d22fb78ff13028e3500ae1d.jpg)

A mensagem exibida abaixo do comando significa que a chave foi gerada. Mensagem de confirmação.

3. Preencha as informações solicitas:

Country Name (2 letter code) [AU]:BR

State or Province Name (full name) [Some-State]:Bahia

Locality Name (eg, city) []:Salvador

Organization Name (eg, company) [Internet Widgits Pty Ltd]:Softwell Solutions

Organizational Unit Name (eg, section) []:Softwell Solutions

Common Name (eg, YOUR name) []:localhost

Email Address []:admin@softwell.com.br

e

A challenge password []:123456

An optional company name []:Softwell Solutions

![image375.jpg](/assets/images/image375-384090fe769873919ca74fb2dfb00727.jpg)

Não é necessário preencher os três últimos campos, entretanto é importante definir o campo Common Name como sendo o endereço correto do servidor.

Gerando o Arquivo CA.pem

O Arquivo CA.pem contém as informações da chave privada.

Para gerar o arquivo, execute o seguinte comando no diretório C:\OpenSSL\bin:

openssl x509 -trustout -signkey "C:\CertificadoSSL\CA.key" -days 1825 -req -in "C:\CertificadoSSL\CA.csr" -out "C:\CertificadoSSL\CA.pem"

![image376.jpg](/assets/images/image376-83ad1dc162bb7196dade11b5d162814b.jpg)

A mensagem exibida abaixo do comando significa que o arquivo foi gerado.

![image377.jpg](/assets/images/image377-8a406068092c6de8ae967d0f3ef9bca0.jpg)

Gerando os Certificados

Para a criação do certificado do servidor, é utilizada a ferramenta keytool que vem instalada na versão do J2SE. A keytool armazena as chaves e os certificados em um local chamado keystore. O keystore é normalmente implementado na forma de arquivos, protegendo as chaves privadas com passwords.

A keytool fica na pasta bin do diretório do j2sdk.

Certificado do Servidor

Para a criação do certificado do servidor, acesse o diretório C:\Arquivos de programas\Java\jdk6\bin e execute:

*keytool -genkey -alias softwell -keyalg RSA -keystore "C:\CertificadoSSL\softwell.keystore"*

![image378.jpg](/assets/images/image378-e09278666d211d0a55bb5ffe6d877b63.jpg)

Preencha os campos:

Enter keystore password: 123456

What is your first and last name?

[Unknown]: admin

What is the name of your organizational unit?

[Unknown]: Softwell Solutions

What is the name of your organization?

[Unknown]: Softwell Solutions

What is the name of your City or Locality?

[Unknown]: Salvador

What is the name of your State or Province?

[Unknown]: Bahia

What is the two-letter country code for this unit?

[Unknown]: BR

Is CN=admin, OU=Softwell Solutions, O= Softwell Solutions, L=Salvador, ST=Bahia, C=BR correct?

[no]: yes

Enter key password for `<tomcat>`

(RETURN if same as keystore password): 123456

![image379.jpg](/assets/images/image379-96b9843d598b824765be11e2eb6ffdd9.jpg)

O comando acima gera um certificado referenciado pelo alias softwell e que será armazenado em um arquivo chamado softwell.keystore.

O certificado foi gerado utilizando o algoritmo RSA e foi solicitada uma senha para o armazenamento da chave no keystore.

O algoritmo RSA é utilizado, preferencialmente, por ser considerado um algoritmo seguro e por ser compatível com a maioria dos servidores de componentes.

Gerado o arquivo keystore, o próximo passo a realizar é editar o arquivo de configuração do servidor Tomcat.

Abra o arquivo de configuração do servidor server.xml que se encontra na pasta conf do diretório onde o Tomcat está instalado e inclua o código abaixo na tag `<Service>`:

`<Connector port\="8443" protocol\="HTTP/1.1" SSLEnabled\="true"`

`maxThreads\="150" scheme\="https" secure\="true`

`keystoreFile\="c:\\CertificadoSSL\\softwell.keystore"`

`keystorePass\="123456"`

`truststoreFile\="c:\\CertificadoSSL\\softwell.keystore"`

`truststorePass\="123456"`

`clientAuth\="true" sslProtocol\="TLS" />`

Defina uma porta para o conector SSL. Por padrão, é utilizada a 8443. Informe o caminho onde o arquivo keystore se encontra.

Certificado do Cliente

Para a criação do certificado do cliente, é utilizado o comando abaixo no diretório C:\OpenSSL\bin:

openssl req -new -newkey rsa:1024 -nodes -out C:\CertificadoSSL\CLIENTE.req -keyout C:\CertificadoSSL\CLIENTE.key

![image366.jpg](/assets/images/image366-59d1d641f9e75c76bebe378e7224f744.jpg)

A mensagem abaixo significa que o arquivo foi criado.

![image367.jpg](/assets/images/image367-881a262fc9a0610fea8d879c765c0d32.jpg)

Preencha as informações:

Country Name (2 letter code) [AU]:BR

State or Province Name (full name) [Some-State]:Bahia

Locality Name (eg, city) []:Salvador

Organization Name (eg, company) [Internet Widgits Pty Ltd]:

Organizational Unit Name (eg, section) []:

Common Name (eg, YOUR name) []:JOAO DA SILVA

Email Address []:

Please enter the following 'extra' attributes

to be sent with your certificate request

A challenge password []:123456

An optional company name []:

![image368.jpg](/assets/images/image368-05c83bb94fb4b3c4c00cbc02290814c0.jpg)

Assinar os certificados

Importando as informações da Chave Privada Para o arquivo keystore do Servidor

Execute o seguinte comando no diretório C:\Arquivos de programas\Java\jdk6\bin:

keytool -import -keystore C:\CertificadoSSL\softwell.keystore -file C:\CertificadoSSL\CA.pem -alias myautoCA

![image369.jpg](/assets/images/image369-a6980e76b5e6cbf6327770c8df645122.jpg)

Enter keystore password: 123456

Owner: EMAILADDRESS=[[email protected]](/cdn-cgi/l/email-protection#f392979e9a9db3809c958784969f9fdd909c9edd9181), CN=localhost, OU=Softwell Solutions,

O=Softwell Solutions, L=Salvador, ST=Bahia, C=BR

Issuer: EMAILADDRESS=[[email protected]](/cdn-cgi/l/email-protection#fc9d98919592bc8f939a888b999090d29f9391d29e8e), CN=localhost, OU=Softwell Solutions,

O=Softwell Solutions, L=Salvador, ST=Bahia, C=BR

`Serial number: e4d11b87e3619e81`

`Valid from: Wed Aug 13 14:12:31 BRT 2008 until: Mon Aug 12 14:12:31 BRT 2013`

Certificate fingerprints:

MD5: `F1:35:6F:42:1E:48:CA:0C:7D:C5:78:77:76:74:52:8C`

SHA1: `2B:9D:D4:E4:C9:92:79:54:62:33:BA:4D:B4:52:15:4B:C2:E5:DB:26`

Trust this certificate? [no]: yes

Certificate was added to keystore

![image370.jpg](/assets/images/image370-a23130652009bc4b0118d0d1996fc94c.jpg)

Assinando o Certificado do Cliente

Execute o seguinte comando no diretório C:\OpenSSL\bin:

openssl x509 -req -in C:\CertificadoSSL\CLIENTE.req -CA C:\CertificadoSSL\CA.pem -CAkey C:\CertificadoSSL\CA.key -CAcreateserial -out C:\**CertificadoSSL**\CLIENTE.pem

![image372.jpg](/assets/images/image372-ec1473f41cfa5602f47c4a2550775020.jpg)

A mensagem que será exibida abaixo do comando significa que o Certificado foi assinado.

Gerando o Arquivo CLIENTE.p12

O arquivo CLIENTE.p12 contém as informações do certificado digital gerado e da chave privada do servidor.

Para gerar o arquivo, execute o seguinte comando no diretório C:\OpenSSL\bin:

openssl pkcs12 -export -in "C:\CertificadoSSL\CLIENTE.pem" -inkey "C:\CertificadoSSL\CLIENTE.key" -out "C:\CertificadoSSL\CLIENTE.p12"

![image373.jpg](/assets/images/image373-33f3f73b15111c8f98be6121518e5557.jpg)

Enter export password: 123321

Verifying export password: 123321

O certificado está pronto e já pode ser utilizado.

Como carregar o Certificado Digital no browser

Internet Explorer:

1. Selecione o menu Ferramentas, em seguida, Opção da Internet.
2. Abra a aba Conteúdo. Clique no botão Certificados, importe o certificado e digite uma senha.
3. Clique no botão Avançar e depois no botão Procurar. Em seguida, localize o certificado e confirme todos os passos.

Mozilla Firefox:

1. Selecione o menu Ferramentas, na aba Criptografia, clique no botão Certificados, em seguida, importe o certificado.
2. Localize o certificado, digite uma senha e confirme todos os passos.

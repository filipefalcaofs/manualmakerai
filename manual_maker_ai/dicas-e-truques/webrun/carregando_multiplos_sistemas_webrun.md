# Carregando múltiplos sistemas no Webrun

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/carregando_multiplos_sistemas_webrun

# Carregando múltiplos sistemas no Webrun

É possível acessar sistemas idênticos contidos em bases de dados diferentes a partir de um único apontador (arquivo \*.wfre), por meio da tela de login de sistemas no Webrun.

**Siga os passos:**

**1.** Para isso, será necessário instanciar o arquivo WFRE de um sistema apontado como principal. Defina a propriedade **Nome da Instância** do arquivo WFRE principal.

![image1375.jpg](/assets/images/image1375-dfbf90834a65282de43e05fb9a76c430.jpg)

**2.** Deve ser criada uma pasta com o mesmo nome do arquivo WFRE que representa o sistema principal dentro da pasta de sistemas:

![image354.jpg](/assets/images/image354-00649bca742c589e0caa6cf791e9b1b9.jpg)

**3.** Em seguida, dentro da pasta criada, deve ser criada uma outra pasta chamada **DataConnections**:

![image355.jpg](/assets/images/image355-3498fd365ad7d013648e74ada0cf067d.jpg)

**4.** Dentro da pasta **DataConnections**, insira os arquivos WFRE que representam os sistemas, sendo que o WFRE principal deverá permanecer na pasta systems.

![image356.jpg](/assets/images/image356-1952ed51090c04f6d302c3b4f74ca14d.jpg)

**5.** Nos demais arquivos WFRE defina diferentes valores para a propriedade **Nome da Instância**.

![image1376.jpg](/assets/images/image1376-6d7aaee1c5e9026a8c03080b5aa5960e.jpg)

![image1376.jpg](/assets/images/image1377-6540a5837b63334e715cf9d131e7c0ab.jpg)

**6.** Agora, reinicie o serviço do Webrun.

**7.** Na tela de login do seu sistema, localize o *DataConnection* que deseja acessar:

![image1467.jpg](/assets/images/image1467-889dba878ba42faffd235426e50138dd.jpg)

**Observações:**

**1.** Caso existam objetos externos no sistema, os objetos acessados serão sempre do sistema principal.

**2.** Quando utilizamos este recurso, a opção de **Modo Projeto** não fica acessível para os usuários mesmo se o sistema estiver em desenvolvimento.

**3.** Este Procedimento não é feito com apenas um projeto. Para conseguir realizar, além de ter um projeto já criado você deverá criar outro projeto com um banco de dados diferente, realizando um backup do projeto principal, não é importando os dados no maker e sim realizando o backup no banco de dados principal, ex: PostgreSQL, MS SQL Server, Firebird ...., os parametros da criação do novo banco tem que está do mesmo modo que o banco do projeto principal e realizando a restauração do backup no banco de dados criado.

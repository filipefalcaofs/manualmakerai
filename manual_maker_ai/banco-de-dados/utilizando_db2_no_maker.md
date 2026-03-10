# DB2 9.5

> Fonte: https://manual.softwell.com.br/docs/banco-de-dados/utilizando_db2_no_maker

# DB2 9.5

Para utilizar o banco DB2 no Maker é necessário ter o CLIENT instalado na máquina de desenvolvimento.

Devido às configurações necessárias do banco não é possível criá-lo através do Maker, por isso a base de dados deverá ser criada através do CLIENT.

As seguintes configurações deverão ser aplicadas a base de dados:

1. Crie o banco através do cliente DB2:

1.1. Parâmetro Bufferpool padrão e tamanho da página do espaço de tabelas deverá ser configurado com 32K.

![image1789.jpg](/assets/images/image1789-89233248b905f9e647c12872cd90e347.jpg)

2. Deverá ser dado permissões ao usuário que irá acessar pelo Maker

![image1790.jpg](/assets/images/image1790-7b379d134181c85a7f77aae554880a85.jpg)

Após ter configurado o banco crie um novo projeto no Maker

![image1791.jpg](/assets/images/image1791-bf024d0d74daf2f8d2f923d5dd152e71.jpg)

O Maker irá iniciá-lo criando as tabelas FR’s do sistema.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

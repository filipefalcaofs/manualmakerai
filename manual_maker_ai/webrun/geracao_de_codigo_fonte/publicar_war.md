# Publicar (war)

> Fonte: https://manual.softwell.com.br/docs/webrun/geracao_de_codigo_fonte/publicar_war

# Publicar (war)

#### Exporte um sistema para ser utilizado independentemente da instalação do Webrun.

- Acesse o Webrun. Para mais informações [clique aqui](/docs/webrun/acessando_webrun). Após acessar clique em **Configurações**.

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

Na tela consta as seguintes opções:

- Exportar relatórios? - Ao ser marcada esta opção, será criada uma pasta reports no .war ou .jar, onde todos os relatórios do sistema serão incluídos e não será mais necessário manter a tabela FR\_relatorio.
- Exportar todas as regras? - Ao ser marcada, esta opção exportará todas as regras independente de estarem vinculadas a formulários ou não. Caso não seja marcado, somente serão exportadas as regras que estão vinculadas a formulários e/ou componentes e suas dependências. Por questões de arquitetura dos componentes Maker 3 e derivados, as regras associadas a estes através da interface própria do componente não são consideradas como dependência.

1. Clique em *Publicar(war)* e em seguida clique em *Exportar*:

![image302.png](/assets/images/publicar_java3-cba214dcb1a662d2598f0eb36ddb75fc.png)

Feito o passo anterior, espere finalizar a exportação e logo após irá ser baixado um arquivo *.war*.

1. Por padrão, o arquivo é baixado na pasta *Downloads*. Após baixado direcione para a pasta deploy do seu Servidor de Aplicação Web (caso utilize Tomcat, direcione para ...\tomcat\webapps; *Caso utilize JBoss, direcione para ...\jboss\server\default\deploy*);
2. Reinicie seu servidor de aplicações e aguarde até que o \*.war seja lido. O arquivo gerado contém o nome originado da sigla do sistema, e um contexto com este mesmo nome ficará disponível no servidor de aplicações. Nesta fase, o sistema já aparece no navegador;

Ao clicar [aqui](/docs/dicas-e-truques/diversos/exemplo_script_da_publicacao_war_jar), pode-se observar a lista de objetos (tabelas, visões, gatilhos e funções) que devem ser mantidos no banco de dados para o perfeito funcionamento do sistema (em tempo de produção).

Pronto, o seu sistema feito no Maker já pode ser acessado localmente.

Nota: O Webrun 5 é compatível com a versão do `Apache Tomcat 9`.

Observações:

1. AUX, por se tratar de uma palavra reservada, não é possível exportar sistemas que possuam componentes com esse nome.
2. Se forem mantidas as tabelas do Maker, após o sistema ser publicado, qualquer outro cliente que tenha o Maker poderá reeditar o projeto.
3. Não é possível publicar um sistema a partir de um sistema já publicado. É necessário publicar sempre a partir do projeto do sistema no Webrun.

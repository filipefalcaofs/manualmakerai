# Exportar Código (jar)

> Fonte: https://manual.softwell.com.br/docs/webrun/geracao_de_codigo_fonte/exportar_codigo_jar

# Exportar Código (jar)

Esta opção exporta o conjunto de códigos-fonte do sistema para um arquivo que será utilizado na pasta systems da instalação do Webrun. Depois de exportadas as fontes do sistema, você tem a opção de utilizá-lo sem necessitar recompilar o webrun. Para isso, você deve colocar o arquivo gerado na mesma pasta onde se encontra o \*.wfre do sistema.

O sistema exportado por meio dessa opção terá desativada a funcionalidade do Modo Projeto, ou seja, não será possível fazer mudanças no sistema, a não ser que ele seja novamente gerado.

Se os códigos-fonte do sistema já tiverem sido previamente exportados, depois de efetuada a nova exportação, você deve reiniciar o servidor de aplicações, para que o novo sistema exportado possa ser novamente publicado. Siga as etapas:

1. [Acesse o Webrun](/docs/webrun/acessando_webrun) e clique em configurações:

   ![image1879.jpg](/assets/images/net_publicar_1-453671b5f9d5f14e3c433403d1ff7737.png)
2. Na tela Acesso à Tela de Configurações, informe o Usuário: **admin**, a Senha: **webrun** e clique no botão Acessar:

   ![image1879.jpg](/assets/images/net_publicar_2-3bec18baa9cf1d9a54dbd08ecd9d9ca7.png)
3. Na Tela de Configuração, clique em Gerenciar Sistemas:

   ![image1879.jpg](/assets/images/net_publicar_3-2853fab9a90503234adf29bd79835805.png)
4. Escolha o sistema a ser publicado, selecione **Configurações** e em seguida **Exportar**:

   ![image1879.jpg](/assets/images/net_publicar_4-d4de49cb670d7b5523ac97450a078521.png)
5. A tela abaixo será apresentada:

   ![image1134.jpg](/assets/images/publicar_java1-c977124ec0f837ddef25cdea4fed579a.png)
6. Na tela consta as seguintes opções:

   - Exportar relatórios? - Ao ser marcada esta opção, será criada uma pasta reports no .war ou .jar, onde todos os relatórios do sistema serão incluídos e não será mais necessário manter a tabela FR\_relatorio.
   - Exportar todas as regras? - Ao ser marcada, esta opção exportará todas as regras independente de estarem vinculadas a formulários ou não. Caso não seja marcado, somente serão exportadas as regras que estão vinculadas a formulários e/ou componentes e suas dependências. Por questões de arquitetura dos componentes Maker 3 e derivados, as regras associadas a estes através da interface própria do componente não são consideradas como dependência.
   - Você deseja também fazer a compilação do código gerado? - Ao ser marcada, esta opção irá compilar o código gerado exportando todas as classes existente no sistema.
7. Ao selecionar as opções desejadas e clique em **Exportar**.
8. Uma tela de Geração de Código Fonte será exibida. Aguarde enquanto a exportação é realizada.
9. Direcione o arquivo JAR baixado para a pasta systems do Webrun e renomeie-o para o mesmo nome do WFRE do projeto.
10. [Reinicie o Webrun](/docs/webrun/atualizacoes_configuracoes_webrun).

Ao clicar [aqui](/docs/dicas-e-truques/diversos/exemplo_script_da_publicacao_war_jar), pode-se observar a lista de objetos (tabelas, visões, gatilhos e funções) que devem ser mantidos no banco de dados para o perfeito funcionamento do sistema (em tempo de produção).

A aba de **Desfazer Exportação** irá apagar as classes exportadas que já foram descompactadas no Webrun. Utilize essa opção e delete o arquivo \*.jar, quando for gerar outro arquivo \*.jar com as atualizações do sistema.

![desfazer_exportacao.jpg](/assets/images/desfazer_exportacao-d8d5234b93ce8a5660de1a33ad305610.jpg)

Observações:

1. Não é permitido ter mais de um formulário com o mesmo nome em um sistema, pois a duplicação do mesmo pode acarretar erros ao exportar o código do sistema (Jar).
2. Não é suportado formulários com nome maior que 160 caracteres na exportação de um .jar.
3. Um sistema publicado (.jar) não pode conter instância.

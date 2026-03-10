# Limpar a Lista de Projetos recentes

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/limpar_a_lista_de_projetos_recentes

# Limpar a Lista de Projetos recentes

Caso o desenvolvedor exclua o banco de dados e o arquivo \*.WFRE de um projeto, o seu nome permanece na lista dos Projetos recentes. Observe os passos para editar a lista.

O Maker cria o arquivo maker.ini na pasta C:\Documents and Settings\`<nome do usuário>`\Configurações locais\Dados de aplicativos\Softwell Solutions (originalmente, este arquivo possui o atributo Oculto).

![image772.jpg](/assets/images/java3-352e4e2c5714d94187428fa3c1dbfdf8.png)

Abra e edite o arquivo: apague os dados contidos na linha FILE n=, ou seja, apague o caminho referente ao arquivo que é exibido na tela Projetos recentes:

![image773.jpg](/assets/images/java4-f5903c71d49a29a0ce7f9f94a7d25192.png)

Ao retornar ao Maker, a lista Projetos recentes se apresentará limpa.

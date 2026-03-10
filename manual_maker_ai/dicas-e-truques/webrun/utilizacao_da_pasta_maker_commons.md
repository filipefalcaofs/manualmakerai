# Utilização da pasta Maker.Commons

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/utilizacao_da_pasta_maker_commons

# Utilização da pasta Maker.Commons

É uma pasta que pode ser criada dentro da estrutura C:\Arquivos de programas\Softwell Solutions\Maker 3\Webrun 3\systems, com a função de restaurar componentes personalizados do usuário (estruturas de bibliotecas de terceirtos, applets, imagens e outros).

Nesse exemplo iremos demonstrar como personalizar apenas 1 contexto, mesmo que haja outros na máquina.

Na pasta systems, que se encontra no diretório C:\Arquivos de programas\Softwell Solutions\Maker 3\Webrun 3, vamos criar uma pasta com o nome do contexto que queremos atualizar, nesse caso Webrun\_Exemplos.

1. Criando pasta Webrun\_Exemplos.

![image1787.jpg](/assets/images/image1787-328657f8c27b537a4780c1f68ba4bb3b.jpg)

Depois de criarmos a pasta Webrun\_Exemplos (Nome do contexto), vamos adicionar dentro da mesma a pasta Maker.Commons.

2. Criando pasta Maker.Commons

![image1673.jpg](/assets/images/image1673-e83a75a15763aab84d5f8c549d7c3647.jpg)

Dentro da pasta Maker.Commons, vamos colocar as pastas que serão modificadas. Nesse exemplo vamos mexer na pasta Skins, que é uma das pastas que existe no contexto(Webrun\_Exemplos).

3. Criando pasta Skins

![image1674.jpg](/assets/images/image1674-d0dae2d6c257ece1461edbedde14e563.jpg)

Dentro da pasta Skins, existe um subpasta com o nome Default.

4. Criando pasta Default

![image1675.jpg](/assets/images/image1675-19df2d7144741b667347157b9a5735a8.jpg)

Dentro da pasta Default vamos, colocar os arquivos personalizados, quando reiniciarmos o servidor, todos os arquivos que estiverem dentro dessa pasta serão carregados para todos os sistemas que utilizarem o contexto “Webrun\_Exemplos”. O nome de cada arquivo deve ser o mesmo do arquivo original, para verificar o nome do arquivo, basta ir até a pasta que será atualizada.

5. Colocando arquivos personalizados na pasta Default

![image1676.jpg](/assets/images/image1676-f5471aa179ad37b0bb8be25a8c4d088b.jpg)

Depois de adicionar os arquivos, pare o serviço do servidor de aplicação, limpe o cache tanto do servidor quanto do browser , levante o serviço do servidor de aplicações e acesse o contexto que nesse caso é Webrun\_Exemplos.

6. Acessando o contexto

![image1677.jpg](/assets/images/image1677-4af3aacaaed73dfd47ec5a7171c2acf1.jpg)

Para demonstrar os componentes da barra de navegação personalizados vamos utilizar o sistema Sistema de Treinamento formulário Cadastro de Funcionário

7. Mostrando barra de navegação personalizada.

![image1678.jpg](/assets/images/image1678-2dbedafe2b36422395fac805afce1194.jpg)

Observação: Caso exista apenas um contexto ou deseja atualizar todos os contextos existentes, a pasta Maker.Commons deve ficar na pasta systems.

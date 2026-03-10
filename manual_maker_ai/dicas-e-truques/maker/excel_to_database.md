# Excel para Maker

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/maker/excel_to_database

# Excel para Maker

Em sistemas legados, ainda utiliza-se arquivos `.xlsx` para gerir uma determinada parte das informações de um sistema. Sendo assim, o processo de migração dessas informações se torna um desafio. Tendo em vista essa problemática, criou-se o plug-in **Excel para Maker**.

O plug-in tem como principal característica, realizar a criação de tabelas no banco de dados caso não exista e preenche-lás com as informações contidas nas folhas correntes do arquivo que está sendo importado.

> #### Considerações Importantes!

Para que a utilização do plug-in tenha efetividade e os dados sejam migrados é necessário seguir as especificações descritas abaixo:

- Cada folha do arquivo Excel se tornará uma tabela no banco de dados e cada coluna do arquivo um campo da tabela. A tabela a ser criada sempre seguirá a padronização de criação de tabelas da *IDE MAKER5*.

  Exemplo: Suponhamos que o projeto que estará importando o arquivo tenha a sigla *MKR* e a folha do arquivo tenha a nomenclatura *PESSOAS*, então a tabela possuirá o nome **MKR\_PESSOAS** e suas respectivas colunas terão o nome **MKR\_PES\_NOMEDACOLUNA**.
- Como o plug-in criará uma nova tabela no banco de dados é **essencial que o arquivo possua as seguintes características:**

  - O nome de cada folha do arquivo representará o respectivo nome da tabela criada no banco de dados, caso não exista.
  - A primeira linha do arquivo deve representar as colunas que serão criadas para a tabela.
  - A segunda linha do arquivo representará o tipo de dado para cada coluna, caso identificada na leitura do arquivo.
  - *É de fundamental importância que essas duas primeiras linhas estejam preenchidas para o correto funcionamento do plug-in*.

![image1357.jpg](/assets/images/excel_to_data_base_3-1c9624f5e1d337fa0ea417bcb649da14.png)

- O plug-in utiliza a biblioteca da *Apache POI* para realizar a leitura do arquivo `.xlsx`  e a mesma na sua especificação informa as limitações de uso que podem ser consultadas [aqui](https://poi.apache.org/components/spreadsheet/limitations.html). Sendo assim, é importante o desenvolvedor verificar se possuí memória RAM suficiente alocada para o servidor de aplicações, pois quanto maior for o tamanho do arquivo, maior será a necessidade de memória RAM, caso contrário uma exceção `OutOfMemoryError` pode ser ocasionada.

> #### Tipo de dados

- Os tipos de dados que podem ser convertido para a tabela, são:
  - Letras
  - Numérico
  - Data
  - Lógico

> #### Utilização do Plug-In

Abaixo segue a exemplificação da utilização do plug-in.

1. Na tela inicial da IDE Maker localize a aba **Plug-in -> Excel para Maker**

![image1357.jpg](/assets/images/excel_to_data_base_1-465a17dbbd17a0c6d0f64d41b3db2a35.png)
*Imagem 1 - Interface do Maker 5.*

2. Será aberta a interface do Plug-in.
3. A opção para sobrescrever os dados por padrão é verdadeira, sendo assim, caso a tabela exista os dados serão apagados e inseridos novamente pelas informações contido no arquivo, caso contrário, apenas acrescidos.
4. Para iniciar o processo de migração basta clicar no botão `Upload` e carregar o arquivo para que o processo de migração seja iniciado.

![image1357.jpg](/assets/images/excel_to_data_base_2-f6ec22c7d31f2190694e0696337d8859.jpeg)
*Imagem 2 - Interface do Maker 5 - Plugin Excel para Maker.*

5. Caso a migração seja realizada com sucesso, a IDE Maker criará o(s) formulário(s) correspondente(s) para cada tabela criada no banco de dados.

![image1357.jpg](/assets/images/excel_to_data_base_5-93bc7e6aeeb5708ad96d4f6e5b0e05c5.png)
*Imagem 3 - Interface do Maker 5 - Retorno do Plugin.*

> #### Observações:

1- Caso já tenha realizado a migração e exista a necessidade de importar o arquivo novamente, após a efitividade da migração a IDE Maker criará novamente o(s) formulário(s).

2- Somente arquivo com a extensão `.xlsx` é permitida.

3- A maioria das exceções são tratadas pelo plug-in, sendo assim, caso ocorra alguma inconsistência após o processo de migração consulte o log da aplicação.

4- Os tipos de dados devem ser correspondentes para as linhas correntes, ou seja, não se deve ter para a mesma coluna um tipo de dado numérico e uma data.

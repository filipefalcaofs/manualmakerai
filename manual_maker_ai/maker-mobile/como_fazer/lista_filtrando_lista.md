# Lista dinâmica filtrando lista dinâmica

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/lista_filtrando_lista

# Lista dinâmica filtrando lista dinâmica

É possível filtrar um componente Lista dinâmica através de outro componente Lista dinâmica no Maker Mobile.

- Com o objeto formulário selecionado, clique no botão Novo para abrir o assistente de criação de Novo Formulário. Informe "Cadastrando Cidades" para o nome do formulário, como demonstrando abaixo:

  ![](/assets/images/lista_lista_1-004668bf54e39e45eeec06b2acfa4dba.jpg)
- Com o formulário criado, adicione 2 componentes **Lista dinâmica**.

  ![](/assets/images/lista_filtrando_lista-dba06e78b1f3ad881a45b5f431c14201.jpg)
- Para o primeiro componente Lista dinâmica, informe a seguinte consulta:

  ![](/assets/images/listra_filtrando_lista_5-d53deabf2472590b07f0486e50fc8cae.jpg)

  Para sua propriedade **Campo Chave** informe **est\_id** e para a sua propriedade **Campo Lista** informe **est\_nome**.
- Para o segundo componente Lista dinâmica, informe a seguinte consulta:

  ![](/assets/images/lisa_filtrando_lista_7-899ffd01d6cfea7d4f36340da9a72fad.jpg)

  Observe o critério que fora utilizado.  
  Para sua propriedade Campo Chave determine **cid\_id** e para sua propriedade Campo Lista determine **cid\_nome**.
- Salve o formulário, defina sua propriedade navegação como **Não**, exporte para a plataforma desejada e execute a aplicação.

![](/assets/images/lista_filtrando_lista8-5f3a9009bfc9eef5f259919c05a14741.png)

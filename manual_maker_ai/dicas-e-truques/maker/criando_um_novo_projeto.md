# Criando um Novo Projeto

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/maker/criando_um_novo_projeto

# Criando um Novo Projeto

Após acessar o Maker, clique no botão Novo para a criação de um novo projeto.

![image500.jpg](/assets/images/nov1-578b5f8bd80762dedcbc344e31a06abb.png)

Observe as opções da tela:

- Tipo de banco de dados - selecione entre as opções: Oracle 11gMicrosoft SQLServer, PostgreSQL 9.0, 9.1, MySQL 5.0, 5.1 ou 5.5. Caso seja escolhida a opção Firebird 2.5, ao abrir a janela para apontar a localização do banco de dados, só serão listados bancos de dados com a extensão FDB. Neste caso, o recomendado é que o usuário informe o caminho do banco de dados manualmente no campo Nome do banco de dados.
- Dependendo do tipo de banco de dados selecionado, informe no campo Servidor a máquina em que estará localizado o seu banco de dados;
- Informe o Nome do banco de dados, que será criado ou utilizado. O endereço e nomenclatura a ser utilizada dependerão do tipo;
- Informe o Login do usuário e a Senha para o acesso ao banco de dados;
- Com a finalidade de checar as configurações da conexão do projeto ou edição da base de dados, utilize a opção Configurações avançadas. Este ponto do sistema exige um conhecimento dos drivers no SGBD que deseja utilizar, para configurar os parâmetros de conexão. Complementando este tópico, saiba mais, acessando o tópico Informações adicionais da estrutura do Maker;
- Para efetivar a conexão com o banco de dados, utilize o botão ![image693.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGEAAAAaCAIAAAAogaX2AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEcSURBVFhH7ZZRDsQgCETbvW2v4AF67jUhIUS6ToPYrsn4V4IIzwG7H8excXUJfMgHEiAjiGgjIzLCBLAHdURGmAD2oI4wo33w/6iUooec54kPXNBjiFEFZLk0n4M0cqONJJPZay/qyMpZcHhLGFMmI02i5ifLpmstUsMdi0ZoAjYI6vVAS5hRZq9pPSoo6RfJXoxq8T4di6UvAS816+0pDTtFR/7GfEleR53Z33G2Z01S00OMLqnVkmT1u0C0cN/TRvs7HcXGZNa4ndRolfjQPGqeDztQ5DLtDGqmlaL5tUuHlz/lDo4UBUnOo4zCj8VCG+OMLjsLDpeF0GiqcUYrVhvL+bV3LZbuK7vICGMnIzLCBLAHdURGmAD2+ALcWbadbrFE5wAAAABJRU5ErkJggg==) ou, antes disso,
- Caso o banco de dados não exista, o Maker solicita a confirmação da criação.Se o banco for de uma versão anterior, o Maker  solicitará a confirmação da atualização.

Após identificar dados sobre o acesso ao banco de dados, informe:

- Criar novo projeto - permite gerar um novo projeto numa base de dados existente ou numa nova base;
- Configurar um projeto existente - esta opção estará disponível apenas quando for utilizada uma base que possui projetos que possam ser aproveitados para fins de atualização.

Na área Projeto, temos as opções:

- Defina o Nome do Projeto;
- Defina uma Sigla composta por três letras;
- No campo Quais as categorias às quais pertencem o projeto? - selecione as opções de categorias a fim de que seja identificado o ramo, atividade ou negócio a que se aplica. Utilize o botão ![image694.gif](data:image/gif;base64,R0lGODdhFwAXAPcAAAAAAAA5cxBKeyFShEpjhFJ7nGuMpXt7e3ucvaWlra29xrW1tb3O3sbGxtbWxtbe797evd7ezufe1ufn1ufn3u/n3u/n5+/vzu/v3u/v5+/v7/f37/f39//vAP//3v//9////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAFwAXAAAI/wAnGBgQoKDBgwgLCjAQwUABBh9ASJxIsSKIBwUGMrDI0SIDghQjTtwgkcNEkyULguDwwSSAlwBWmvygQWJLCxkKtmTJAUAHCQBafoAJk8OGnAGM9nwJoUPRDRyUQtVAoWDUnj87gPgJIOqGA2APcMhQwarRmB08dGgKYINbqEY3aLBQ8OhSnw6KauAQ9sDRqgGg2gVwwSkHDW6Ves1AN6ndu22hEn1pgWpdxBoyyD0sVzNmuX+tgsbs+XPfzIDtfl59dIMFtxkypM48ujVmDaczSKhbujRtxII7z449VgMGzRk0TAagocLuALEzJ9dAvbp16rIBM2ZMAbV32d4tUCvYLaDBBAkRJKBXn369+wgOFAgoUCCBg/v48+u/v4CAAQwIEJTQgAYttEFAADs=) Adicionar Categoria para criar e associar novas opções. É possível também a exclusão com a opção ![image695.gif](data:image/gif;base64,R0lGODdhEwASAPcAACkAADk5OUIxMUJKSkJrlEopKUoxMUo5OUpKSkpzlEpznEp7nFJSUlJzjFopKVpaUlpaWlp7nFqEnGMpKWOEnGOEpWOMpWOMrWspKWuMnGuMrXOMnHOUpXOUtXt7e3uctYSEe4SEhISltZSlrZStrZStxpylrZytrZyttaWlnKWlpbW1tbW9vb29tb29vb3GxsbGvcbGxsbOxsbOzs7Oxs7Wxs7Wzs7W1s7W59bWztbe1t7e3udCQufn1ufn3u/n1u/n3u/v3u/v5+/v7+/37+/39/fv3vfv5/fv7/f37/f39/9aWv/39///9////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAEwASAAAI/wB/yKDQIEHBBg0IGDyYYEOOHzQslMBBsSKOGRZxfODQ48QFJyBDihSpZEGOER1GhlQypOWQJkwU2CChwQmRGS9YvHixQwUCBg8gDEki00TNFQAmYJjgYIATIS5WuDiSJIGNEzVTTFjClYcAJ0pguHBBBInVETVdBDBw4ECBByBjuIgh5EiCG1jBJhlCZEiRJi1AeAARQohZG0ab7FWSpLESFyEiF7Z7g2YTIknKYn7pRCyMIUKsJk6CJMheJEgYu2jhou5dyy018/Wxo8WKFUJCX9XQ5AiRI0NMM0nxkwEEH3avVmgC2qWQIT6iRxcC5C4KCUeMAAkSZLsQI0eChCYHkoOAjhoRNphAYcLEifbu45ugkOG7Dg4VKlzIb0G///wiCJFEQAA7) Excluir Categoria;
- No campo Para que serve e como será utilizado o seu novo projeto?, faça uma descrição breve sobre a aplicação e objetivo do projeto que será criado ou utilizado.

Finalizando:

- Clique no botão OK.

Na próxima tela, deve-se definir o nome do projeto. Este arquivo de extensão \*.WFRE é também utilizado pelo WebRun para acessar o sistema por meio do navegador. Este será criado na pasta ...\Softwell Solutions\Maker 3\Webrun 3\systems do seu diretório de instalação do Maker.

Após definir o nome do projeto, clique no botão Salvar.

Observações:

1. Ao tentar criar um novo sistema com as siglas CON, AUX, PRN e NULL o Maker exibirá uma mensagem, informando que o sistema operacional pode estar utilizando tais siglas, como demonstra a figura abaixo:

![image1437.jpg](/assets/images/nov3-db4cf6c4dd73aac61cbca164269cd7a4.png)

1. Lembrete: a Softwell Solutions não recomenda a criação de sistemas com estas siglas, por ser palavras reservadas do sistema operacional.
2. As funções disponíveis para o [Editor de Fluxo de Ações](/docs/maker/editor_de_fluxo_de_acoes) sempre aparecerão na linguagem de acordo com o idioma escolhido quando o Maker foi acessado;
3. A [API de funções](/docs/maker/estrutura_de_pastas_e_arquivos/api_de_funcoes) será atualizada nos novos bancos de dados a cada atualização do Maker, logo após acessar um projeto do banco de dados.

# Histórico de SQL

> Fonte: https://manual.softwell.com.br/docs/maker/historico_de_sql

# Histórico de SQL

Nesta tela constam todos os comandos de criações de campos e tabelas executados pela tela [Assistente de Banco de Dados](/docs/maker/assistente_banco_dados) (aberta por meio do formulário).

![image749.jpg](/assets/images/historico_sql-5ea2bb7c96ab0b0c99ddc6397a90b0aa.png)

Na barra de ferramentas desta tela, consta o botão ![image775.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEQSURBVEhL7ZJBCoJAGIU7VSBI0aZtYXSEaBNBgbTUFnULXXgHL+DCa008YWL45+mMZUXg4oN//nm+T8HJdBqqX/CSOAjmqiiKBsws4+Il8e12V3VdN2BmGRe9xbvd/inVYMeyXfQSr9cbVVWVJcZutdrQZ9rwFi8WS1WWpSXV4A4Z9izDSxwEM5XnORWaZFnWZFmHxEucplcqYiRJSjskvX8uJgMs28UodsKkgGW7GMVOmBSwbBeWOIq2Ko4vDZjlPZMCmXP1WOLT6fwswyzvTZmJzLl6/kd8OBwpMje42Je3xEMxioEl/hZeYvPt5c4869kHb3HbWc8fEQMUM8nHxeDrYpRq2nby7KLXFw9HqB5gZEA0GXDWVgAAAABJRU5ErkJggg==) (Exportar históricos), a partir do qual há suporte para a exportação dos históricos de comandos SQL executados. Para isso, devem ser executados os seguintes passos:

1. Efetue um clique sobre o botão ![image775.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEQSURBVEhL7ZJBCoJAGIU7VSBI0aZtYXSEaBNBgbTUFnULXXgHL+DCa008YWL45+mMZUXg4oN//nm+T8HJdBqqX/CSOAjmqiiKBsws4+Il8e12V3VdN2BmGRe9xbvd/inVYMeyXfQSr9cbVVWVJcZutdrQZ9rwFi8WS1WWpSXV4A4Z9izDSxwEM5XnORWaZFnWZFmHxEucplcqYiRJSjskvX8uJgMs28UodsKkgGW7GMVOmBSwbBeWOIq2Ko4vDZjlPZMCmXP1WOLT6fwswyzvTZmJzLl6/kd8OBwpMje42Je3xEMxioEl/hZeYvPt5c4869kHb3HbWc8fEQMUM8nHxeDrYpRq2nby7KLXFw9HqB5gZEA0GXDWVgAAAABJRU5ErkJggg==) (Exportar históricos) para abrir a tela Exportar para TXT;
2. Assim que for aberta a tela, defina o período de referência dos comandos SQL que foram executados. O cadastro dos campos é obrigatório e com uma data válida;
3. Por fim, clique no botão Exportar, definindo o nome do arquivo texto que conterá os comandos SQL executados.

Na tela constam os componentes:

- Código - mostra o código da alteração;
- Data - mostra a data e hora em que foi feita a alteração na tabela;
- Sistema - mostra o sistema que contém o formulário a partir do qual foi feita a alteração na tabela;
- Tabela - mostra a tabela que foi criada ou alterada após a execução do comando;
- Memorando SQL - mostra o comando que foi executado.

Observações:

1. Caso o Projeto tenha sido criado na versão anterior ao Maker 3, é necessário acessar o histórico para que comece a guardar tais informações (Projeto -> Histórico SQL).
2. Este recurso está disponível apenas para a versão Enterprise.

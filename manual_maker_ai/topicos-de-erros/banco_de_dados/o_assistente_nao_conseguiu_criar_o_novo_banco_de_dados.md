# O assistente não conseguiu criar o novo banco de dados

> Fonte: https://manual.softwell.com.br/docs/topicos-de-erros/banco_de_dados/o_assistente_nao_conseguiu_criar_o_novo_banco_de_dados

# O assistente não conseguiu criar o novo banco de dados

![image1811.jpg](/assets/images/banco2-15e8b8602181045593c6a3f91ed5d809.png)

Causa: Ocorre porque o Charset Latin1 não está disponível nesta versão do Postgres.

Solução: Ir até Configurações Avançadas e modificar o parâmetro CharSet de Latin1 para Win1252.

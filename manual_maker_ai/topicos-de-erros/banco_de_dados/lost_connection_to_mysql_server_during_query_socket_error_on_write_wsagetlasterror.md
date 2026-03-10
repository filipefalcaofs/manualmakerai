# Lost connection to MYSQL server during query socket error on write. WSAGetLastError

> Fonte: https://manual.softwell.com.br/docs/topicos-de-erros/banco_de_dados/lost_connection_to_mysql_server_during_query_socket_error_on_write_wsagetlasterror

# Lost connection to MYSQL server during query socket error on write. WSAGetLastError

![image1769.jpg](/assets/images/banco1-620d94d631fd2a88d64ce1351f404980.png)

Solução: defina um novo tamanho máximo para pacotes de dados no servidor através das seguintes opções:

Primeira opção - por meio da linha de comando de inicialização do servidor:

shell>mysql--max\_allowed\_packed=16M

Segunda opção - por meio da adição de um parâmetro no INI de configuração do servidor:

[mysqld]

max\_allowed\_packet=16M

ou

[mysqld]

set-variable = max\_allowed\_packet=10240000

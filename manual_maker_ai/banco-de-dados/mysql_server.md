# MySQL Server 5.6/5.7/8.0

> Fonte: https://manual.softwell.com.br/docs/banco-de-dados/mysql_server

# MySQL Server 5.6/5.7/8.0

O Maker suporta bancos MySQL Server 5.6 e superior com a engine **InnoDB** com algumas restrições:

- O campo do tipo YEAR não é suportado, quando o projeto está em modo de execução pelo Webrun.
- A função LIMIT (opção Limitar registros, tela Construtor de Consultas) não funciona no Gerador de Relatórios:

![image305.jpg](/assets/images/image305-8de66e25a01086782fd569011042439a.jpg)

- Caso haja algum problema com a definição de Apelido para campos na aba Localizar (campos de pesquisa ou campos para a grade), será preciso utilizar a função CAST. Observe o exemplo abaixo:

```prism-code
Select fr\_acaoparametro.aco\_codigo,  
Cast(fr\_acao.aco\_nome As Char) As 'Nome da Ação'  
From  
fr\_acaoparametro Inner Join  
fr\_acao On fr\_acaoparametro.aco\_codigo = fr\_acao.aco\_codigo
```

Observações:

1. A função CAST é aplicada na coluna Expressão do Assistente SQL. Para um bom funcionamento da função no Maker, é necessário criar colocar um Apelido;
2. Os campos-chave que tenham Sequences associados a eles não podem ser obrigatórios.
3. A configuração do Charset do banco deve ser Latin1 e COLLATION padrão para que o Maker consiga inicializar o banco de dados com as tabelas FR's necessárias e utilizá-las posteriormente no desenvolvimento do projeto.
4. Banco de dados com charset UTF8 não são suportados.
5. Para MySQL 8, é necessário que o servidor esteja configurado com método de autenticação "Legacy". Conforme imagem abaixo:
   ![image305.jpg](/assets/images/mysql_auth-fbdc4c4fbcada0e84f83b9fe0e040f0a.png)

## Erro ao tentar gravar imagens

Alguns fluxos, relatórios ou formulários podem eventualmente exceder o tamanho máximo do BLOB que vem configurado por padrão no MySQL, demonstrando o seguinte erro:

Erro: Lost connection to MYSQL server during query socket error on write. WSAGetLastError return 1004($2746)

![image1267.jpg](/assets/images/image1267-a95330752102259ac0eb2050d0a2bfe3.jpg)

Para corrigir, defina um novo tamanho máximo para pacotes de dados no servidor através das seguintes opções:

Primeira opção - por meio da linha de comando de inicialização do servidor:

```prism-code
shell>mysql--max\_allowed\_packed=16M
```

Segunda opção - por meio da adição de um parâmetro no INI de configuração do servidor:

```prism-code
\[mysqld\]  
max\_allowed\_packet=16M
```

ou

```prism-code
\[mysqld\]  
set-variable = max\_allowed\_packet=10240000
```

## Autoincremento no Webrun

O Webrun não reconhece o campo autoincremento no momento da gravação de um registro. Para que o campo seja reconhecido, o desenvolvedor deve definir o campo-chave como apenas leitura e retirar a obrigatoriedade em [Campos Obrigatórios](/docs/maker/barra_de_ferramentas_da_tela).

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

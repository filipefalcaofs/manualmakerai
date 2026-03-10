# Usando o MySQL no Linux

> Fonte: https://manual.softwell.com.br/docs/webrun/webrun_no_linux/usando_mysql_no_linux

# Usando o MySQL no Linux

Para a utilização do MySQL no linux, é necessário atualizar o Maker para a versão 3 ou superior, e configurar o servidor para trabalhar com identificadores case insensitive. Para forçar o MySQL a trabalhar com os identificadores case insensitive, defina a variável de sistema lower\_case\_table\_names system variable na inicialização do mysqld.

Caso não tenha permissão para a opção acima, outra alternativa consiste em executar o script adicional listado abaixo:

--Aliases para compatibilidade com o LINUX (Unix-Like)

create view FR\_ACAO as select \* from fr\_acao;

create view FR\_ACAOCOMPONENTE as select \* from fr\_acaocomponente;

create view FR\_ACAOPARAMETRO as select \* from fr\_acaoparametro;

create view FR\_ACPTIPO as select \* from fr\_acptipo;

create view FR\_CAMPO as select \* from fr\_campo;

create view FR\_CATEGORIA as select \* from fr\_categoria;

create view FR\_COMPILADOR as select \* from fr\_compilador;

create view FR\_COMPILADOR\_DATABASE as select \* from fr\_compilador\_database;

create view FR\_COMPONENTE as select \* from fr\_componente;

create view FR\_COMPONENTE\_CATEGORIA as select \* from fr\_componente\_categoria;

create view FR\_CONFIGURACAO as select \* from fr\_configuracao;

create view FR\_CONSULTA\_AVANCADA as select \* from fr\_consulta\_avancada;

create view FR\_DATABASE as select \* from fr\_database;

create view FR\_DIAGRAMA as select \* from fr\_diagrama;

create view FR\_DICIONARIO\_VI as select distinct

't'.'TABLE\_NAME' AS 'tabela',

'c'.'COLUMN\_NAME' AS 'campo',

coalesce(convert('fr\_campo'.'cmp\_descricao' using utf8),'c'.'COLUMN\_NAME') AS 'descricao',

'c'.'DATA\_TYPE' AS 'tipo'

from

(('information\_schema'.'tables' 't'

join 'information\_schema'.'columns' 'c' on(('c'.'TABLE\_NAME' = 't'.'TABLE\_NAME')))

left join 'fr\_campo' on(((convert('fr\_campo'.'tab\_nome' using utf8) = 't'.'TABLE\_NAME') and

(convert('fr\_campo'.'cmp\_nome' using utf8) = 'c'.'COLUMN\_NAME'))))

where

(('t'.'TABLE\_SCHEMA' = database()) and ('t'.'TABLE\_TYPE' in (\_utf8'VIEW',\_utf8'BASE TABLE')));

create view FR\_FONTEDADOS as select \* from fr\_fontedados;

create view FR\_FORMULARIO as select \* from fr\_formulario;

create view FR\_FORMULARIO\_CATEGORIA as select \* from fr\_formulario\_categoria;

create view FR\_FORMULARIO\_SISTEMA as select \* from fr\_formulario\_sistema;

create view FR\_GRUPO as select \* from fr\_grupo;

create view FR\_IMAGEM as select \* from fr\_imagem;

create view FR\_LOG as select \* from fr\_log;

create view FR\_LOG\_EVENT as select \* from fr\_log\_event;

create view FR\_MENU as select \* from fr\_menu;

create view FR\_OPERADOR as select \* from fr\_operador;

create view FR\_OPERANDO as select \* from fr\_operando;

create view FR\_PARAMETRO as select \* from fr\_parametro;

create view FR\_PERMISSAO as select \* from fr\_permissao;

create view FR\_PERMISSAO\_MAKER as select \* from fr\_permissao\_maker;

create view FR\_PROPRIEDADE as select \* from fr\_propriedade;

create view FR\_REGRAS as select \* from fr\_regras;

create view FR\_REGRAS\_ATIVIDADES as select \* from fr\_regras\_atividades;

create view FR\_REGRAS\_BANCO as select \* from fr\_regras\_banco;

create view FR\_REGRAS\_CATEGORIAS as select \* from fr\_regras\_categorias;

create view FR\_REGRAS\_FUNCOES as select \* from fr\_regras\_funcoes;

create view FR\_REGRAS\_FUNCOES\_TIPOS as select \* from fr\_regras\_funcoes\_tipos;

create view FR\_REGRAS\_TIPOS as select \* from fr\_regras\_tipos;

create view FR\_REGRAS\_TRIGGERS as select \* from fr\_regras\_triggers;

create view FR\_RELATORIO as select \* from fr\_relatorio;

create view FR\_RELATORIO\_CATEGORIA as select \* from fr\_relatorio\_categoria;

create view FR\_SESSAO as select \* from fr\_sessao;

create view FR\_SESSAO\_VI as select

'fr\_sessao'.'ses\_conexao' AS 'ses\_conexao',

'fr\_sessao'.'ses\_datahora\_login' AS 'ses\_datahora\_login',

'fr\_sessao'.'ses\_usuario' AS 'ses\_usuario',

'fr\_sessao'.'ses\_nome\_usuario' AS 'ses\_nome\_usuario',

'fr\_sessao'.'ses\_nome\_maquina' AS 'ses\_nome\_maquina',

'fr\_sessao'.'ses\_end\_ip' AS 'ses\_end\_ip',

'fr\_sessao'.'sis\_codigo' AS 'sis\_codigo'

from

'fr\_sessao'

where

('fr\_sessao'.'ses\_conexao' = connection\_id());

create view FR\_SISTEMA as select \* from fr\_sistema;

create view FR\_SISTEMA\_CATEGORIA as select \* from fr\_sistema\_categoria;

create view FR\_TABELA as select \* from fr\_tabela;

create view FR\_TAREFA as select \* from fr\_tarefa;

create view FR\_TAREFA\_TEMPO as select \* from fr\_tarefa\_tempo;

create view FR\_TIPO\_EVENT as select \* from fr\_tipo\_event;

create view FR\_TIPODADO as select \* from fr\_tipodado;

create view FR\_USUARIO as select \* from fr\_usuario;

create view FR\_USUARIO\_GRUPO as select \* from fr\_usuario\_grupo;

create view FR\_USUARIO\_SISTEMA as select \* from fr\_usuario\_sistema;

create view FR\_VERSAO as select \* from fr\_versao;

Observação : As demais tabelas proprietárias do sistema devem ser executado um select dependendo de como esteja o nome da tabela no banco

Exemplo: Se os nomes das tabelas estiverem em maiúsculo, o select terá que ser executado com o nome da tabela em maiúsculo e vice-versa.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

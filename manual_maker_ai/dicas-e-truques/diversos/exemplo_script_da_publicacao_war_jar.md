# Estrutura de tabelas FR para o ambiente de produção(.war / .jar)

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/exemplo_script_da_publicacao_war_jar

# Estrutura de tabelas FR para o ambiente de produção(.war / .jar)

Na base de dados que será utilizada com um sistema publicado (extensões war ou jar), devem ser mantidas:

Tabelas:

[Tabelas do Agendador de tarefas](javascript:throw new Error('React has blocked a javascript: URL as a security precaution.')) - Tabelas referente ao Agendador de tarefas.

Necessário apenas para casos de utilização do Agendador de Tarefas.

 Entidade

Descrição

FR\_TAREFA

Entidade responsável por armazenar as referências das tarefas que estão sendo executadas temporiariamente pelo sistema.

 Relacionamentos:

 Entidades

- FR\_REGRAS vinculada ao campo REG\_CODIGO.

 Entidade

Descrição

FR\_TAREFA\_TEMPO

Entidade responsável por armazenar o tempo das tarefas agendadas.

 Relacionamentos:

 Entidades

- FR\_TAREFA vinculada ao campo TRF\_CODIGO.

 Entidade

Descrição

FR\_REGRAS

Entidade responsável por amazenar as informações sobre os fluxogramas criados.

Observação: Basta manter o contéudo dos campos REG\_COD e REG\_NOME, o conteúdo dos demais campos pode ser apagado.

 Relacionamentos:

 Não possui

[Tabelas do Usuário](javascript:throw new Error('React has blocked a javascript: URL as a security precaution.')) - Tabelas referente ao controle de usuários.

Entidade

Descrição

FR\_USUARIO

Entidade responsável pelo armazenamento dos usuários cadastrados no sistema. É utilizada tanto em modo de produção quanto em modo de desenvolvimento.

 Relacionamentos:

 Entidades

- FR\_USUARIO\_GRUPO vinculada ao campo USR\_CODIGO.
- FR\_USUARIO\_SISTEMA vinculada ao campo USR\_CODIGO.

 Entidade

Descrição

FR\_GRUPO

Entidade responsável por armazenar os grupos criados para controle de permissões aos usuários.

 Relacionamentos:

Entidade:

- FR\_PERMISSAO vinculada aos campos GRP\_CODIGO e SIS\_CODIGO.
- FR\_USUARIO\_GRUPO vinculada aos campos GRP\_CODIGO E SIS\_CODIGO.

 Entidade

Descrição

FR\_PERMISSAO

Entidade responsável por armazenar as permissões para acesso ao Maker referente a cada usuário, vinculada a tabela fr\_grupo, fr\_relatorio e fr\_formulario.

 Relacionamentos:

 Não possui

 Entidade

Descrição

FR\_USUARIO\_GRUPO

Entidade responsável por relacionar os usuários com os grupos criados, tabela fr\_grupo.

 Relacionamentos:

 Não possui

[Tabelas do Sistema](javascript:throw new Error('React has blocked a javascript: URL as a security precaution.')) - Tabelas referente aos sistemas do Maker.

 Entidade

Descrição

FR\_SISTEMA

Entidade responsável por armazenar as informações dos sistemas que pertencem a base de dados em uso.

 Relacionamentos:

Não possui

 Entidade

Descrição

FR\_SESSAO

Entidade responsável por armazenar as informações da sessão dos usuários ao logar no sistema.

span> Relacionamentos:

 Não possui

 Entidade

Descrição

FR\_LOG

Entidade responsável por armazenar um log de alterações indentificando o usuário, data e hora e valores antigos e novos.

 Relacionamentos:

 Não possui

 Entidade

Descrição

FR\_USUARIO\_SISTEMA

Entidade responsável por armazenar as informações de usuários para as permissões de acesso ao sistema.

 Relacionamentos:

 Não possui

 Entidade

Descrição

FR\_LOG\_EVENT

Entidade responsável por armazenar todo o log referente a eventos do sistema. Ex: Inclusão, alteração e etc.

 Relacionamentos:

 Não possui

[Outros objetos](javascript:throw new Error('React has blocked a javascript: URL as a security precaution.'))

Visões:

FR\_SESSAO\_VI

Triggers:

FR\_SESSAO\_BI0 (SQL Server 2000/2005/2008, PostgreSQL, Oracle e FireBird)

FR\_SESSAO\_BEFORE\_INSERT (Apenas MySQL)

Funções:

FR\_SESSAO\_HORA (PostgreSQL)

[Script de publicação](javascript:throw new Error('React has blocked a javascript: URL as a security precaution.'))

O script abaixo exemplifica a linguagem de definição de dados dos objetos necessários, caso tenha sido utilizado o banco de dados Postgresql no projeto.

CREATE TABLE fr\_grupo

(

grp\_codigo integer NOT NULL,

sis\_codigo character varying(3) NOT NULL,

grp\_nome character varying(40) NOT NULL

);

CREATE TABLE fr\_log

(

log character varying(6000)

);

CREATE TABLE fr\_log\_event

(

log\_id integer NOT NULL,

log\_data timestamp without time zone,

log\_hora character(8),

log\_codform integer,

log\_descform character varying(100),

log\_operacao character(1),

log\_usuario character varying(30),

log\_sistema character(3),

log\_chave character varying(200),

log\_chavecont character varying(128),

log\_conteudo text

);

CREATE TABLE fr\_permissao

(

per\_codigo integer NOT NULL,

grp\_codigo integer NOT NULL,

sis\_codigo character varying(3) NOT NULL,

rel\_codigo integer,

frm\_codigo integer,

com\_codigo integer,

mnu\_codigo integer,

per\_adicionar character(1) DEFAULT 'N'::bpchar,

per\_excluir character(1) DEFAULT 'N'::bpchar,

per\_editar character(1) DEFAULT 'N'::bpchar NOT NULL,

per\_visualizar character(1) DEFAULT 'N'::bpchar NOT NULL,

per\_habilitado character(1) DEFAULT 'N'::bpchar NOT NULL

);

CREATE TABLE fr\_relatorio

(

rel\_codigo integer NOT NULL,

sis\_codigo character(3) NOT NULL,

rel\_nome character varying(255) NOT NULL,

rel\_conteudo text,

rel\_modificado timestamp without time zone,

rel\_tamanho integer,

usr\_codigo integer

);

CREATE TABLE fr\_sessao

(

ses\_conexao integer NOT NULL,

ses\_datahora\_login timestamp without time zone,

ses\_usuario character varying(20),

ses\_nome\_usuario character varying(40),

ses\_nome\_maquina character varying(40),

ses\_end\_ip character varying(20),

sis\_codigo character(3)

);

CREATE VIEW fr\_sessao\_vi AS

SELECT s.ses\_conexao, s.ses\_datahora\_login, s.ses\_usuario, s.ses\_nome\_usuario, s.ses\_nome\_maquina, s.ses\_end\_ip, s.sis\_codigo

FROM fr\_sessao s

WHERE (s.ses\_conexao = pg\_backend\_pid());

CREATE TABLE fr\_sistema

(

sis\_codigo character varying(3) NOT NULL,

sis\_descricao character varying(30) NOT NULL,

img\_codigo integer,

img\_codigo\_icone integer,

sis\_sqldatalimite character varying(2000),

sis\_sqldadosentidade character varying(2000),

sis\_sqlinformacoes character varying(2000),

sis\_check character varying(30),

sis\_grupoexterno integer,

sis\_resumo character varying(1000)

);

CREATE TABLE fr\_usuario

(

usr\_codigo integer NOT NULL,

usr\_login character varying(20) NOT NULL,

usr\_senha character varying(64),

usr\_administrador character(1) DEFAULT 'N'::bpchar,

usr\_tipo\_expiracao character(1) NOT NULL,

usr\_dias\_expiracao integer,

usr\_imagem\_digital bytea,

usr\_foto bytea,

usr\_nome character varying(60) NOT NULL,

usr\_email character varying(60),

usr\_digital integer,

usr\_inicio\_expiracao timestamp without time zone,

CONSTRAINT fr\_usuario\_usr\_login\_check CHECK ((btrim((usr\_login)::text) `<>` ''::text)),

CONSTRAINT fr\_usuario\_usr\_nome\_check CHECK ((btrim((usr\_nome)::text) `<>` ''::text))

);

CREATE TABLE fr\_usuario\_grupo

(

grp\_codigo integer NOT NULL,

sis\_codigo character varying(3) NOT NULL,

usr\_codigo integer NOT NULL

);

CREATE TABLE fr\_usuario\_sistema

(

usr\_codigo integer NOT NULL,

sis\_codigo character varying(3) NOT NULL,

uss\_acesso\_externo character(1) DEFAULT 'N'::bpchar NOT NULL,

uss\_administrador character(1) DEFAULT 'N'::bpchar NOT NULL,

uss\_acesso\_maker character(1) DEFAULT 'N'::bpchar NOT NULL,

uss\_criar\_formulario character(1) DEFAULT 'N'::bpchar NOT NULL,

uss\_criar\_relatorio character(1) DEFAULT 'N'::bpchar NOT NULL,

uss\_acessar character(1) DEFAULT 'N'::bpchar NOT NULL,

uss\_criar\_regra character(1) DEFAULT 'N'::bpchar NOT NULL

);

ALTER TABLE ONLY fr\_grupo

ADD CONSTRAINT fr\_grupo\_grp\_nome\_unq UNIQUE (grp\_nome, sis\_codigo);

ALTER TABLE ONLY fr\_grupo

ADD CONSTRAINT fr\_grupo\_pk PRIMARY KEY (grp\_codigo, sis\_codigo);

ALTER TABLE ONLY fr\_permissao

ADD CONSTRAINT fr\_permissao\_pk PRIMARY KEY (per\_codigo);

ALTER TABLE ONLY fr\_relatorio

ADD CONSTRAINT fr\_relatorio\_nome\_sis\_unq UNIQUE (sis\_codigo, rel\_nome);

ALTER TABLE ONLY fr\_relatorio

ADD CONSTRAINT fr\_relatorio\_pk PRIMARY KEY (rel\_codigo);

ALTER TABLE ONLY fr\_relatorio

ADD CONSTRAINT fr\_relatorio\_rel\_codigo\_key UNIQUE (rel\_codigo, sis\_codigo);

ALTER TABLE ONLY fr\_usuario

ADD CONSTRAINT fr\_usuario\_usr\_login\_key UNIQUE (usr\_login);

ALTER TABLE ONLY fr\_sistema

ADD CONSTRAINT pk\_fr\_sistema PRIMARY KEY (sis\_codigo);

ALTER TABLE ONLY fr\_usuario

ADD CONSTRAINT pk\_fr\_usuario PRIMARY KEY (usr\_codigo);

ALTER TABLE ONLY fr\_usuario\_grupo

ADD CONSTRAINT pk\_fr\_usuario\_grupo PRIMARY KEY (grp\_codigo, sis\_codigo, usr\_codigo);

ALTER TABLE ONLY fr\_usuario\_sistema

ADD CONSTRAINT pk\_fr\_usuario\_sistema PRIMARY KEY (usr\_codigo, sis\_codigo);

CREATE INDEX fki\_fr\_relatorio\_usuario\_fk2 ON fr\_relatorio USING btree (usr\_codigo);

CREATE INDEX fki\_fr\_sistema\_imagem\_fk ON fr\_sistema USING btree (img\_codigo);

CREATE INDEX fki\_fr\_usuario\_grupo\_grupo\_fk ON fr\_usuario\_grupo USING btree (grp\_codigo, sis\_codigo);

CREATE INDEX fki\_fr\_usuario\_grupo\_usuario\_fk ON fr\_usuario\_grupo USING btree (usr\_codigo);

CREATE INDEX fki\_fr\_usuario\_sistema\_sistema\_fk ON fr\_usuario\_sistema USING btree (sis\_codigo);

CREATE INDEX fki\_fr\_usuario\_sistema\_ususario\_fk ON fr\_usuario\_sistema USING btree (usr\_codigo);

CREATE UNIQUE INDEX ix\_fr\_sessao ON fr\_sessao USING btree (ses\_conexao);

CREATE FUNCTION fr\_sessao\_hora() RETURNS "trigger"

AS $$

BEGIN delete from fr\_sessao where ses\_conexao = pg\_backend\_pid(); NEW.ses\_conexao := pg\_backend\_pid(); NEW.ses\_datahora\_login := current\_timestamp; RETURN NEW; END;

$$

LANGUAGE plpgsql;

CREATE TRIGGER fr\_sessao\_bi0

BEFORE INSERT ON fr\_sessao

FOR EACH ROW

EXECUTE PROCEDURE fr\_sessao\_hora();

ALTER TABLE ONLY fr\_relatorio

ADD CONSTRAINT fr\_relatorio\_usuario\_fk FOREIGN KEY (usr\_codigo) REFERENCES fr\_usuario(usr\_codigo) ON

UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY fr\_usuario\_grupo

ADD CONSTRAINT fr\_usuario\_grupo\_grupo\_fk FOREIGN KEY (grp\_codigo, sis\_codigo) REFERENCES fr\_grupo(grp\_codigo, sis\_codigo) ON UPDATE RESTRICT ON

DELETE CASCADE;

ALTER TABLE ONLY fr\_usuario\_grupo

ADD CONSTRAINT fr\_usuario\_grupo\_usuario\_fk FOREIGN KEY (usr\_codigo) REFERENCES fr\_usuario(usr\_codigo) ON

UPDATE RESTRICT ON DELETE CASCADE;

ALTER TABLE ONLY fr\_usuario\_sistema

ADD CONSTRAINT fr\_usuario\_sistema\_sistema\_fk FOREIGN KEY (sis\_codigo) REFERENCES fr\_sistema(sis\_codigo) ON

UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY fr\_usuario\_sistema

ADD CONSTRAINT fr\_usuario\_sistema\_ususario\_fk FOREIGN KEY (usr\_codigo) REFERENCES fr\_usuario(usr\_codigo) ON

UPDATE CASCADE ON DELETE CASCADE;

-- Tabelas para o agendador de tarefas

CREATE TABLE fr\_regras

(

reg\_cod integer NOT NULL,

reg\_nome character varying(255),

CONSTRAINT fr\_regras\_pkey PRIMARY KEY (reg\_cod)

);

CREATE TABLE fr\_tarefa

(

trf\_codigo integer NOT NULL,

trf\_descricao character varying(255) NOT NULL,

sis\_codigo character varying(3) NOT NULL,

reg\_codigo integer NOT NULL,

trf\_data\_inicial date,

trf\_data\_final date,

trf\_ativa character(1) NOT NULL,

trf\_regra\_parametros text,

trf\_tipo\_agendamento character varying(15),

CONSTRAINT fr\_tarefa\_pkey PRIMARY KEY (trf\_codigo),

CONSTRAINT fk\_fr\_tarefa\_fr\_sistem FOREIGN KEY (sis\_codigo)

REFERENCES fr\_sistema (sis\_codigo) MATCH SIMPLE

ON UPDATE NO ACTION ON DELETE NO ACTION,

CONSTRAINT fk\_fr\_tarefa\_fr\_sistemfk\_fr\_tarefa\_fr\_regra FOREIGN KEY (reg\_codigo)

REFERENCES fr\_regras (reg\_cod) MATCH SIMPLE

ON UPDATE NO ACTION ON DELETE NO ACTION,

CONSTRAINT fr\_tarefa\_trf\_descricao\_key UNIQUE (trf\_descricao)

)

CREATE TABLE fr\_tarefa\_tempo

(

trt\_codigo integer NOT NULL,

trf\_codigo integer NOT NULL,

trt\_tipo character varying(15) NOT NULL,

trt\_valor integer NOT NULL,

CONSTRAINT fr\_tarefa\_tempo\_pkey PRIMARY KEY (trt\_codigo),

CONSTRAINT fk\_fr\_tarefa\_tempo\_fr\_taref FOREIGN KEY (trf\_codigo)

REFERENCES fr\_tarefa (trf\_codigo) MATCH SIMPLE

ON UPDATE NO ACTION ON DELETE NO ACTION

)

Observações:

1. No ambiente de produção a tabela FR\_PERMISSAO só tem integridade referencial com as tabelas FR\_USUARIO e FR\_GRUPO.
2. O Webrun utiliza as procedures SP\_GEN\_ID e SP\_GEN\_LOG para gerar os id's.
3. Somente será necessário a exportação da tabela **FR\_REGRAS**, caso o usuário utilize tarefas agendadas em seu sistema.
4. [**Servidores homologados**](/docs/FAQ/versoes_homologadas#servidor_de_aplicacao)

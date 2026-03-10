# Utilizando a tabela FR_SESSAO em sistemas com MySQL e Oracle

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/banco_de_dados/utilizando_tabela_fr_sessao_com_mysql_e_oracle

# Utilizando a tabela FR\_SESSAO em sistemas com MySQL e Oracle

## MSQL:

As instruções informadas abaixo é necessária devido a restrição do banco de dados.

Para que as instruções abaixo entre em vigor é necessário alterar a permissão do usuário do banco de dados para que ele possa criar Triggers.

1. Criar no sistema a view "fr\_sessao\_vi", no menu (Utilitários), na opção Executor de Script SQL o seguinte script deve ser executado:

   ![image776.jpg](/assets/images/bancoview-c897ea65b32b76d17f6d45d725269307.png)

   Script Executado:

   CREATE OR REPLACE VIEW name\_database.fr\_sessao\_vi AS SELECT  
     s.ses\_conexao,  
     s.ses\_datahora\_login,  
     s.ses\_usuario,  
     s.ses\_nome\_usuario,  
     s.ses\_nome\_maquina,  
     s.ses\_end\_ip,  
     s.sis\_codigo  
   FROM fr\_sessao s  
   WHERE  
     s.ses\_conexao = connection\_id();
2. Criar no sistema a "trigger" que será disparada antes da inserção realizada pelo Webrun:

   ![image776.jpg](/assets/images/bancoview1-52e4e3f6765edd69f3dd8d0d8820e95b.png)

   Script Executado:

   O seguinte script deve ser executado

   DELIMITER $$  
     CREATE TRIGGER trigger\_name BEFORE INSERT  
     ON fr\_sessao FOR EACH ROW  
     BEGIN  
       set new.ses\_conexao = connection\_id();  
       set new.ses\_datahora\_login = now();  
     END; $$  
   DELIMITER;
3. Alterar a tabela "fr\_sessao" para que mesma tenha um valor "Default":

   ![image776.jpg](/assets/images/bancoview2-6c4d17f1fa6eaa4d739fdfe4d361f7ed.png)

   Script Executado:

   ALTER TABLE fr\_sessao MODIFY COLUMN ses\_conexao INT(11) NOT NULL DEFAULT 0;

## Oracle:

1. No ORACLE só é necessário a criação da TRIGGER no SCHEMA utilizado:

   ![bancovieworacle.png](/assets/images/bancovieworacle-2d6df28f3f7fbaffb691ddc8d54cc42e.png)

   Script Executado:

     CREATE OR REPLACE TRIGGER "SCHEMA\_NAME"."FR\_SESSAO"  
     BEFORE INSERT ON "SCHEMA\_NAME"."FR\_SESSAO"  
     REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW  
     BEGIN  
       DELETE FROM "SCHEMA\_NAME"."FR\_SESSAO"  
       WHERE SES\_CONEXAO = SYS\_CONTEXT('userenv','sessionid');  
       :NEW.ses\_conexao := SYS\_CONTEXT('userenv','sessionid');  
       :NEW.ses\_datahora\_login := sysdate;  
     END;

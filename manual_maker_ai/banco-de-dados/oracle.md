# Oracle 10g/11g/12c

> Fonte: https://manual.softwell.com.br/docs/banco-de-dados/oracle

# Oracle 10g/11g/12c

A Softwell nos últimos anos tem se empenhado em homologar todas as versões do Oracle liberadas por seu fabricante tão logo elas sejam consideradas “versões estáveis”. Atualmente são suportadas para desenvolvimento e produção as seguintes versões do Oracle:

- Oracle 10g/11g/12c.

## Permissões necessárias

O Maker (IDE) faz diversas consultas aos metadados do Oracle para identificar tabelas, colunas, tipos de dados, restrições de PK, FK, UNQ, entre diversas outras, para conseguir obter essas informações do SGDB é necessário permissão de leitura (SELECT) nas seguintes tabelas/views do SGDB:

1. SYS.IND$
2. SYS.ICOL$
3. SYS.OBJ$
4. SYS.USER$
5. SYS.COL$
6. SYS.CDEF$
7. SYS.CCOL$
8. SYS.USER\_SYS\_PRIVS
9. ALL\_TABLES
10. ALL\_VIEWS
11. ALL\_TAB\_COLUMNS
12. SYS.ALL\_CONS\_COLUMNS
13. SYS.ALL\_CONSTRAINTS
14. SYS.ALL\_CONS\_COLUMNS
15. ALL\_IND\_COLUMNS
16. ALL\_CONSTRAINTS
17. ALL\_COL\_COMMENTS
18. ALL\_OBJECTS

São feitas consultas diretas às tabelas e views do sistema do banco por questões de performance, já que em testes internos obtivemos melhorias de performance muito grandes, em média conseguimos recuperar as informações 9,8 vezes mais rápido que usando as VIEWS mais comumente usadas como “ALL\_TABLES”, “USER\_VIEWS” e similares.

O Maker tentará modificar os seguintes atributos da sessão:

```prism-code
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD/MM/RRRR HH24:MI:SS'  
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/RRRR HH24:MI:SS'  
ALTER SESSION SET NLS_LANGUAGE='BRAZILIAN PORTUGUESE'  
ALTER SESSION SET NLS_TERRITORY='BRAZIL'
```

Dica: Ao criar um formulário, caso exista um campo do tipo CLOB, que serve para gravar texto longo, o componente que dá suporte é [Texto Longo](/docs/maker/componentes/texto_longo). Se o usuário desejar utilizar este campo em uma [Grade](/docs/dicas-e-truques/utilizando_a_propriedade_grade_mestre), não será possível editar.

## Alocação e liberação de recursos

Na configuração padrão do Webrun, para cada usuário conectado ao sistema é criado uma conexão com o Oracle que será usada exclusivamente para executar os comandos do usuário, essa conexão é liberada assim que a sessão do usuário é encerrada na aplicação, as sessões de usuário expiram automaticamente após 30 minutos de inatividade (parâmetro configurável). Há ainda a possibilidade de utilização de pool de conexões discutido adiante.

## Versionamento de objetos (FR\_VERSAO)

Por questões de retrocompatibilidade com versões legadas (de projetos criados com as versões iniciais do Maker 2.6/2.7 e anteriores), O Maker realiza uma consulta com "Max" na coluna VER\_CODIGO para obter o próximo ID para versionamento de um objeto. Esta operação atende a maioria dos casos e não é necessário intervenção do desenvolvedor Maker.

Caso durante o desenvolvimento do projeto apresente erros constantes (geralmente ORA-00001 restrição exclusiva ou Field 'VER\_TIPO' must have a value), recomendamos o uso de uma trigger para efetuar o gerenciamento do campo VER\_CODIGO.  
Siga as instruções abaixo:

- Criação da SEQUENCE 'FR\_VERSAO\_VER\_CODIGO\_SEQ': Caso não exista esta sequence no banco de dados, utilize o script create sequence FR\_VERSAO\_VER\_CODIGO\_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE; É recomendado que o valor "WITH 1" seja atualizado para o maior valor do campo VER\_CODIGO, exemplo "WITH 1021".
- Criação da TRIGGER:

```prism-code
CREATE TRIGGER FR\_VERSAO\_VER\_CODIGO\_NEXTVAL    
BEFORE INSERT ON FR\_VERSAO    
REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW    
begin    
select FR\_VERSAO\_VER\_CODIGO\_SEQ.nextval into :new.VER\_CODIGO from dual;  
end;
```

## Ambiente de produção

Aqui considerado como o ambiente (Hardware e Softwares) onde a aplicação final ficará hospedada depois de concluída, e também o ambiente utilizado para homologação de novas versões do software. Neste ambiente somente o Webrun é instalado e utiliza um driver JDBC fornecido pela própria Oracle para realizar a comunicação com os bancos de dados, não sendo necessárias as permissões de DBA, ou qualquer tipo de privilégio especial. Os requisitos de permissões devem se basear nas necessidades das aplicações desenvolvidas, liberando-se o acesso de SELECT, UPDATE, INSERT, DELETE entre outros somente sobre os objetos que a aplicação usa.

Tabelas necessárias para a publicação das aplicações com JAR ou WAR.

Controle de acesso

**FR\_SISTEMA** --> Lista de sistemas

**FR\_USUARIO** --> Lista de usuários do sistema

**FR\_GRUPO** --> Grupos de usuário

**FR\_USUARIO\_GRUPO** --> Usuários x Grupos

**FR\_USUARIO\_SISTEMA** --> Usuários x Sistemas

**FR\_PERMISSAO** --> Permissões

**FR\_LOG** --> Log de atividades

**FR\_LOG\_EVENT** --> Usada para gravar um log de alterações, identificando o usuário, data e hora e valores antigos e novos.

**FR\_TAREFA** --> Agendador de tarefas

**FR\_TAREFA\_TEMPO** --> Permite agendar tarefas que são executadas temporariamente pelo sistema.

**FR\_REGRAS** --> Identificação do usuário no SGBD

**FR\_SESSAO** --> Usada para identificar o usuário em procedures e outros objetos do banco de dados.

Observações:

- Caso seja necessário adicionar um alias na tabela é necessario a ativação do parâmetro OracleExtendedMetadada no arquivo [Maker3.ini](/docs/maker/estrutura_de_pastas_e_arquivos/arquivo_maker3_ini).
- O número de tabelas envolvidas pode cair ainda mais de acordo com os recursos utilizados por cada aplicativo.
- No ambiente de produção não há a necessidade de instalação do Maker (IDE).
- O Maker ignora os objetos (tabelas/views) nas seguintes table space: SYSTEM, SYSAUX;
- O table space DEFAULT do usuário não pode ser SYSTEM ou SYSAUX:
- Os campos-chave que tenham Sequences associados a eles não podem ser obrigatórios.
- Caso o filtro do componente Lista dinâmica esteja case sensitive, localize o grupo “Oracle” no arquivo databases.xml (diretório de instalação\Webrun Studio Bootstrap\config\) e adicione a seguinte chave:

```prism-code
<item>  
   <item-name> CaseSensitive</item-name>  
   <item-param>1</item-param>  
</item>
```

Abaixo, script para criação de usuário/banco.

```prism-code
CREATE USER "<nome do usuário>"  
  
IDENTIFIED BY "<senha do usuário>"  
  
TABLESPACE USERS  
  
TABLESPACE TEMP  
  
"DEFAULT"  
  
UNLOCK;  
  
TABLESPACE TO "<nome do usuário>";  
  
GRANT "CONNECT" TO "<nome do usuário>";  
  
GRANT DBA TO "<nome do usuário>";  
  
GRANT "RESOURCE" TO "<nome do usuário>";
```

Desempenho

1. A partir da versão 3 do Maker é possível adicionar no arquivo Maker3.ini um parâmetro chamado “OptimizeOracle” que instrui a IDE a utilizar consultas de baixo nível ao metadado do Oracle ignorando as VIEWS do sistema. Para tal edite o Maker3.ini e defina o parâmetro como 1 (True) conforme o exemplo abaixo:

[MAKER] OptimizeOracle=1

2. No WFRE, adicione o parâmetro SchemaList e como valor informe o nome do(s) esquema(s) que será(ão) utilizado(s).

Exemplo:

WFRE

SchemaList=MAKER,SYSTEM,SYS

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

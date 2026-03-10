# Considerações Gerais

> Fonte: https://manual.softwell.com.br/docs/banco-de-dados/consideracoes_gerais

# Considerações Gerais

Durante a inicialização de um Banco de Dados, serão criados os seguintes objetos:

- 92 tabelas com nomes prefixados por fr\_\*;
- Clique aqui para conhecê-las.
- 2 Views:
- fr\_dicionario\_v;
- fr\_sessao\_vi;
- 1 sequence/generator (gen\_log);
- 1 Trigger de Before/Instead Of Insert em fr\_sessao;

Outras informações:

- O usuário deve ter permissão de criação de tables, views, sequences/generators.
- O usuário deve ter permissão de inclusão, alteração e exclusão nas tabelas fr\_\*.
- O Maker não fará nenhuma alteração no conteúdo das tabelas, exceto nas fr\_\*.
- Sempre que possível, o Maker trabalhará somente com a definição do SQL, não retornando dados (TOP/LIMIT/ROWNUM/FIRST).

#### Charset

- Tipo de charset dos SGBD:
- Interbase/Firebird: ISO8859\_1
- Oracle: WE8ISO8859P1
- PostgreSQL: LATIN1
- MS SQL 2000/2005/2008: ISO8859\_1
- MySQL Server: LATIN1
- O banco, as tabelas e os campos devem ser criados em maiúsculo, com exceção do PostgreSQL, que deve ser minúsculo.
- Alterar Sequence - uma vez modificada (a sequência de um campo autoincremento), este não mais será considerado um autoincremento pelo webrun.
- Não é possivel utilizar em projetos Maker\Webrun, tabelas que tenha no inicio de suas nomeclaturas números.

Ex: 02\_Teste

Observações:

1. Ao criar uma sequence manualmente(no banco de dados) para que o Webrun possa reconhecê-la é necessário que a mesma tenha sido criada no seguinte padrão: nomedatabela\_nomedocampo\_nomedasequence.
2. É necessário possuir o client do banco de dados instalado na máquina onde o gerador de relatórios será utilizado. Caso contrário, uma mensagem de erro Required Provided not Installed será apresentada.
3. Quando um campo é alimentado por uma trigger, ao gravar o registro no formulário (Webrun), ele é posicionado ao primeiro registro;
4. Quando um campo serial é modificado, ao gravar o registro no formulário (Webrun) ele é posicionado ao primeiro registro.
5. Ao alterar a porta de um banco Firebird, ela deve ser acrescentada em Configurações, como demonstra a figura abaixo e, em seguida, o Webrun deve ser reiniciado.

![image1108.jpg](/assets/images/banco-81306193ac7dd0ca384b00b95065b851.png)

5. Caso a nomeclatura dos objetos do banco de dados exceda 30 caracteres alguns recursos como exportação e importação de estrutura e dados e o assistente de criação de tabela reduzirá a nomeclatura excedida para 30 caracteres utilizando hash.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

# Inconsistências nas tabelas FR_

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/inconsistencias_nas_tabelas_fr

# Inconsistências nas tabelas FR\_

Aqui você encontrará solução para alguns dos problemas que podem ocorrer na estrutura interna das tabelas do Maker.

## Formulário não encontrados na exportação do WAR

Se o sistema que você estiver tentando exportar para WAR/JAR apresentar erros de Formulário não encontrado ou algo similiar no sistema gerado e não apresentar esse erro quando você usa o webrun.war genérico, provavelmente você tem formulários que estão no mesmo banco de dados, mas não fazem parte do seus sistemas, por isso não são exportados junto com os demais formulários do sistema. Para solucionar tal situação, é necessário localizar todos os formulários que estão associados a eventos ou propriedades de botão, grades e outros componentes e que não estão vinculados ao sistema, e vinculá-los (não copie) pelo repositório.

Há uma procedure que automatiza esse processo. Para isso, faça o seguinte:

1. Crie a procedure MKR\_CORRIGIR\_FORMULARIOS\_DO\_SISTEMA.
2. Execute-a passando a Sigla (3 letras) do sistema com problemas.
3. Execute MKR\_CORRIGIR\_FORMULARIOS\_DO\_SISTEMA 'COD'.

Código para MS-SQL Server:

CREATE PROCEDURE dbo.MKR\_CORRIGIR\_FORMULARIOS\_DO\_SISTEMA @SIS varchar(3)AS

BEGIN WHILE (EXISTS(select \* from FR\_PROPRIEDADE P

INNER JOIN FR\_FORMULARIO f on (cast(f.FRM\_CODIGO as varchar) = p.PRO\_VALOR) --Exclue os formulários que não existem

INNER JOIN FR\_FORMULARIO\_SISTEMA fs on (fs.FRM\_CODIGO = p.FRM\_CODIGO) and (fs.SIS\_CODIGO = @SIS) where (P.PRO\_NOME='CodigoForm') and (isNumeric(p.PRO\_VALOR) = 1) and (p.PRO\_VALOR not in ('-1', '0'))          and (p.PRO\_VALOR not in (select cast(fs2.FRM\_CODIGO as varchar) from FR\_FORMULARIO\_SISTEMA fs2                                   where (fs2.SIS\_CODIGO = @SIS)))))

BEGIN -- Insere os formulários no sistema

insert into FR\_FORMULARIO\_SISTEMA (FRM\_CODIGO, SIS\_CODIGO) select distinct case when isNumeric(p.PRO\_VALOR) = 1 then cast(cast(p.PRO\_VALOR as float) as int) else null end, @SIS from FR\_PROPRIEDADE P

INNER JOIN FR\_FORMULARIO f on (cast(f.FRM\_CODIGO as varchar) = p.PRO\_VALOR) --Exclue os formulários que não existem

INNER JOIN FR\_FORMULARIO\_SISTEMA fs on (fs.FRM\_CODIGO = p.FRM\_CODIGO) and                                               (fs.SIS\_CODIGO = @SIS)

where (P.PRO\_NOME='CodigoForm') and (isNumeric(p.PRO\_VALOR) = 1)

and (p.PRO\_VALOR not in ('-1', '0')) and (p.PRO\_VALOR not in (select cast(fs2.FRM\_CODIGO as varchar)

from FR\_FORMULARIO\_SISTEMA fs2 where (fs2.SIS\_CODIGO = @SIS)))

END

WHILE (EXISTS(select \* from FR\_PARAMETRO p

LEFT OUTER JOIN FR\_FORMULARIO f on (f.FRM\_GUID = p.PAR\_VALOR)

INNER JOIN FR\_FORMULARIO f1 on (cast(f1.FRM\_CODIGO as varchar)= case

when (len(p.PAR\_VALOR) > 10) then

cast(f.FRM\_CODIGO as varchar)

else

p.PAR\_VALOR

end) --Exclue os formulários que não existem

INNER JOIN FR\_FORMULARIO\_SISTEMA fs on (fs.FRM\_CODIGO = p.FRM\_CODIGO) and                                                             (fs.SIS\_CODIGO = @SIS)

where ((p.PAR\_NOME = 'Código de Formulário') or (p.PAR\_NOME = 'Cod.Formulario')) and

(case when (len(p.PAR\_VALOR) > 10) then

cast(f.FRM\_CODIGO as varchar)

else

p.PAR\_VALOR end not in (select cast(fs2.FRM\_CODIGO as varchar)

from FR\_FORMULARIO\_SISTEMA fs2

where (fs2.SIS\_CODIGO = @SIS)))))

BEGIN insert into FR\_FORMULARIO\_SISTEMA (FRM\_CODIGO, SIS\_CODIGO)

select distinct

case

when (len(p.PAR\_VALOR) > 10) then

cast(f.FRM\_CODIGO as varchar)

else

cast(cast(p.PAR\_VALOR as float) as int)

end as c1, @SIS

from FR\_PARAMETRO p

LEFT OUTER JOIN FR\_FORMULARIO f on (f.FRM\_GUID = p.PAR\_VALOR)

INNER JOIN FR\_FORMULARIO f1 on (cast(f1.FRM\_CODIGO as varchar) = case

when (len(p.PAR\_VALOR) > 10) then

cast(f.FRM\_CODIGO as varchar)

else

p.PAR\_VALOR

end) --Exclue os formulários que não existem

INNER JOIN FR\_FORMULARIO\_SISTEMA fs on (fs.FRM\_CODIGO = p.FRM\_CODIGO) and                                                             (fs.SIS\_CODIGO = @SIS)

where ((p.PAR\_NOME = 'Código de Formulário') or (p.PAR\_NOME = 'Cod.Formulario')) and

(case when (len(p.PAR\_VALOR) > 10) then

cast(f.FRM\_CODIGO as varchar)

else

p.PAR\_VALOR

end not in (select cast(fs2.FRM\_CODIGO as varchar)

from FR\_FORMULARIO\_SISTEMA fs2

where (fs2.SIS\_CODIGO = @SIS)))

ENDEND

Observação: A procedure abaixo foi feita para MS-SQL Server, mas pode ser adaptada facilmente para outros SGDB's.

## Problemas de FK entre FR\_FORMULARIO e FR\_FORMULARIO\_SISTEMA

Se você experimentar mensagens de erro do tipo: "Violation of PRIMARY KEY constraint 'PK\_FR\_FORMULARIO\_SISTEMA'. Cannot insert duplicate key in object 'dbo.FR\_FORMULARIO\_SISTEMA", provavelmente houve algum erro na criação das estruturas das FRs e a chave estrangeira entre as tabelas FR\_FORMULARIO e FR\_FORMULARIO\_SISTEMA não foi criada.

Para corrigir tal problema, primeiro, remova o lixo da tabela FR\_FORMULARIO com o comando abaixo:

delete from FR\_FORMULARIO\_SISTEMA where FRM\_CODIGO not in (select FRM\_CODIGO from FR\_FORMULARIO)

Depois, crie a chave estrangeira entre as duas tabelas de acordo com a sintaxe do seu banco. Esta FK é do tipo CASCADE, ou seja, quando se deleta um formulário, o registro correspondente é removido da tabela FR\_FORMULARIO\_SISTEMA.

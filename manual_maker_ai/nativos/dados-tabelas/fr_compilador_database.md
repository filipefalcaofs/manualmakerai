# FR_COMPILADOR_DATABASE

[← Voltar para Dados das Tabelas](README.md)

## FR_COMPILADOR_DATABASE

*Alias:* fr_compilador_database

**Estrutura:**

| Coluna | Tipo | Tamanho |
|--------|------|---------|
| CPL_DESCRITOR | string | 80 |
| DBA_CODIGO | string | 10 |
| CDB_SINTAXE | string | 2000 |

**Dados (1001 registros):**

| CPL_DESCRITOR | DBA_CODIGO | CDB_SINTAXE |
|---|---|---|
| ebfGetNextGeneratorValue | postgres82 | nextval(%1); |
| ActErrorMessage | db2v9 | SIGNAL SQLSTATE '75000' SET MESSAGE_TEXT = %1; |
| ActErrorMessage | firebird2 | EXCEPTION "GENERAL EXCEPTION" '\|' \|\| %1; |
| ActErrorMessage | mssql2000 | RAISERROR('%s', 16, 1, %1) |
| ActErrorMessage | oracle10g | RAISE_APPLICATION_ERROR(-20001, TO_CHAR(%1)); |
| ActErrorMessage | postgres82 | RAISE EXCEPTION '%', %1; |
| AND | db2v9 | (%*[ AND ]) |
| AND | firebird2 | (%*[ AND ]) |
| AND | mssql2000 | (%*[ AND ]) |
| AND | mysql5 | (%*[ AND ]) |
| AND | oracle10g | (%*[ AND ]) |
| AND | postgres82 | (%*[ AND ]) |
| BeginWhile | db2v9 | WHILE %1 DO |
| BeginWhile | firebird2 | WHILE %1 DO BEGIN |
| BeginWhile | mssql2000 | WHILE %1 BEGIN |
| BeginWhile | mysql5 | WHILE %1 DO |
| BeginWhile | oracle10g | WHILE %1 LOOP |
| BeginWhile | postgres82 | WHILE %1 LOOP |
| BodyFunction | db2v9 | --BEGIN GROUP CREATE PROCEDURE %1%2 SPECIFIC %1 LANGUAGE SQL BEGIN %3 %4 END @ --END GROUP |
| BodyFunction | firebird2 | --BEGIN GROUP RECREATE PROCEDURE %1%2 RETURNS(rulereturn__firebird__maker2 %5) AS %3 BEGIN %4 END --END GROUP |
| BodyFunction | mssql2000 | --BEGIN GROUP CREATE PROCEDURE %1 %2 AS %3 BEGIN %4 END --END GROUP |
| BodyFunction | mysql5 | CREATE FUNCTION %1 %2 RETURNS %5 BEGIN %3 %4 END |
| BodyFunction | oracle10g | --BEGIN GROUP CREATE OR REPLACE FUNCTION %1 %2 RETURN %5 IS   TYPE CURSOR_TYPE IS REF CURSOR; %3 BEGIN %4 END; --END ... |
| BodyFunction | postgres82 | --BEGIN GROUP CREATE OR REPLACE FUNCTION %1%2 RETURNS %5 AS $BODY$ %3 BEGIN %4 END; $BODY$ LANGUAGE 'plpgsql' VOLATIL... |
| BodyProcedure | db2v9 | --BEGIN GROUP CREATE PROCEDURE %1%2 SPECIFIC %1 LANGUAGE SQL BEGIN %3 %4 END --END GROUP |
| BodyProcedure | firebird2 | --BEGIN GROUP RECREATE PROCEDURE %1%2 AS %3 BEGIN %4 END --END GROUP |
| BodyProcedure | mssql2000 | --BEGIN GROUP CREATE PROCEDURE %1 %2 AS %3 BEGIN %4 END --END GROUP |
| BodyProcedure | mysql5 | CREATE PROCEDURE %1 %2 BEGIN %3 %4 END |
| BodyProcedure | oracle10g | --BEGIN GROUP CREATE OR REPLACE PROCEDURE %1 %2 IS   TYPE CURSOR_TYPE IS REF CURSOR; %3 BEGIN %4 END; --END GROUP |
| BodyProcedure | postgres82 | --BEGIN GROUP CREATE OR REPLACE FUNCTION %1%2 RETURNS void AS $BODY$ %3 BEGIN %4 END; $BODY$ LANGUAGE 'plpgsql' VOLAT... |
| BodyTrigger | db2v9 | --BEGIN GROUP CREATE TRIGGER %1 %3 ON %2 REFERENCING %5 AS %5 FOR EACH ROW BEGIN ATOMIC   CALL %7(%6); END --END GROUP |
| BodyTrigger | firebird2 | --BEGIN GROUP RECREATE TRIGGER %1 FOR %2 %3 AS BEGIN   EXECUTE PROCEDURE %7 %6; END --END GROUP |
| BodyTrigger | mssql2000 | --BEGIN GROUP /* % 1 - Nome da trigger % 2 - Nome da tabela % 3 - Tipo da trigger (INSERT, UPDATE, DELETE) % 4 - List... |
| BodyTrigger | mysql5 | CREATE TRIGGER %1 %3 ON %2 FOR EACH ROW BEGIN   CALL %7(%6); END; |
| BodyTrigger | oracle10g | --BEGIN GROUP CREATE OR REPLACE TRIGGER %1 %3 ON %2 REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW BEGIN   %7(%6); EN... |
| BodyTrigger | postgres82 | --BEGIN GROUP CREATE OR REPLACE FUNCTION TFN_%1() RETURNS "trigger" AS $BODY$ BEGIN   PERFORM %7(%6);   RETURN %5; EN... |
| BooleanFormat | db2v9 | (%1 = 1) |
| BooleanFormat | firebird2 | (%1 = 1) |
| BooleanFormat | mssql2000 | (%1 = 1) |
| BooleanFormat | mysql5 | (%1) |
| BooleanFormat | oracle10g | (%1 = 1) |
| BooleanFormat | postgres82 | (%1) |
| CallRule | db2v9 | CALL %1(%2%3); |
| CallRule | firebird2 | EXECUTE PROCEDURE %1 %2; |
| CallRule | mssql2000 | CREATE TABLE #RESULT_%4 (VALUE VARCHAR(5000))  SET @__exec__ = 'DECLARE @RESULT VARCHAR(5000)' + CHAR(13) + 'EXECUTE ... |
| CallRule | mysql5 | CALL %1(%2); |
| CallRule | oracle10g | %1(%2); |
| CallRule | postgres82 | SELECT %1(%2); |
| CallRuleFormatExpression | firebird2 | (SELECT rulereturn__firebird__maker2 FROM %1/*[(%2)]*/) |
| CallRuleFormatExpression | mysql5 | %1(%2) |
| CallRuleFormatExpression | oracle10g | %1(%2) |
| CallRuleFormatExpression | postgres82 | %1(%2) |
| CallRuleInsideExpression | db2v9 | 0 |
| CallRuleInsideExpression | firebird2 | 1 |
| CallRuleInsideExpression | mssql2000 | 0 |
| CallRuleInsideExpression | mysql5 | 1 |
| CallRuleInsideExpression | oracle10g | 1 |
| CallRuleInsideExpression | postgres82 | 1 |
| CallRuleParamSeparator | db2v9 | , |
| CallRuleParamSeparator | firebird2 | , |
| CallRuleParamSeparator | mssql2000 | AS SYSNAME) + ''', ''' + CAST( |
| CallRuleParamSeparator | mysql5 | , |
| CallRuleParamSeparator | oracle10g | , |
| CallRuleParamSeparator | postgres82 | , |
| CallRuleReturn | db2v9 | , %1 |
| CallRuleReturn | mssql2000 | %1 = |
| CommentBegin | db2v9 | /* |
| CommentBegin | firebird2 | /* |
| CommentBegin | mssql2000 | /* |
| CommentBegin | mysql5 | /* |
| CommentBegin | oracle10g | /* |
| CommentBegin | postgres82 | /* |
| CommentEnd | db2v9 | */ |
| CommentEnd | firebird2 | */ |
| CommentEnd | mssql2000 | */ |
| CommentEnd | mysql5 | */ |
| CommentEnd | oracle10g | */ |
| CommentEnd | postgres82 | */ |
| CommentLine | db2v9 | -- |
| CommentLine | firebird2 | -- |
| CommentLine | mssql2000 | -- |
| CommentLine | mysql5 | #-- |
| CommentLine | oracle10g | -- |
| CommentLine | postgres82 | -- |
| const_data | db2v9 | TIMESTAMP_FORMAT('%D/%M/%Y %H:%N:%S', 'DD/MM/YYYY HH24:MI:SS') |
| const_data | firebird2 | CAST('%M-%D-%Y %H:%N:%S' AS TIMESTAMP) |
| const_data | mssql2000 | '%Y-%M-%D %H:%N:%S' |
| const_data | mysql5 | '%Y-%M-%D %H:%N:%S' |
| const_data | oracle10g | TO_DATE('%D/%M/%Y', 'DD/MM/YYYY') |
| const_data | postgres82 | '%Y-%M-%D %H:%N:%S'::TIMESTAMP |
| const_false | db2v9 | (1 = 0) |
| const_false | firebird2 | (1 = 0) |
| const_false | mssql2000 | (1 = 0) |
| const_false | mysql5 | FALSE |
| const_false | oracle10g | (1 = 0) |
| const_false | postgres82 | FALSE |
| const_hora | db2v9 | TIME(TIMESTAMP_FORMAT('%H:%N:%S', 'HH24:MI:SS')) |
| const_hora | firebird2 | CAST('%H:%N:%S' AS TIME) |
| const_hora | mssql2000 | '%H:%N:%S' |
| const_hora | mysql5 | '%H:%N:%S' |
| const_hora | oracle10g | TO_TIMESTAMP('%H:%N:%S', 'HH24:MI:SS') |
| const_hora | postgres82 | '%H:%N:%S'::TIME |
| const_null | db2v9 | %NULL |
| const_null | firebird2 | %NULL |
| const_null | mssql2000 | %NULL |
| const_null | mysql5 | %NULL |
| const_null | oracle10g | %NULL |
| const_null | postgres82 | %NULL |
| const_true | db2v9 | (1 = 1) |
| const_true | firebird2 | (1 = 1) |
| const_true | mssql2000 | (1 = 1) |
| const_true | mysql5 | TRUE |
| const_true | oracle10g | (1 = 1) |
| const_true | postgres82 | TRUE |
| Data | db2v9 | TIMESTAMP |
| Data | firebird2 | TIMESTAMP |
| Data | mssql2000 | DATETIME |
| Data | mysql5 | DATETIME |
| Data | oracle10g | DATE |
| Data | postgres82 | TIMESTAMP |
| DecimalSeparator | db2v9 | . |
| DecimalSeparator | firebird2 | . |
| DecimalSeparator | mssql2000 | . |
| DecimalSeparator | mysql5 | . |
| DecimalSeparator | oracle10g | . |
| DecimalSeparator | postgres82 | . |
| DeclareCursorBefore | db2v9 | 1 |
| DeclareCursorBefore | firebird2 | 1 |
| DeclareCursorBefore | mssql2000 | 0 |
| DeclareCursorBefore | mysql5 | 1 |
| DeclareParamIn | db2v9 | %2%1 |
| DeclareParamIn | firebird2 | %2%1 |
| DeclareParamIn | mssql2000 | %2%1 |
| DeclareParamIn | mysql5 | %2%1 |
| DeclareParamIn | oracle10g | %2%1 |
| DeclareParamIn | postgres82 | %2%1 |
| DeclareParamOut | db2v9 | %*[, ]OUT %2%1 |
| DeclareParamOut | mssql2000 | %*[, ]   %2%1 OUTPUT |
| DeclareVar | db2v9 | DECLARE %2%1; |
| DeclareVar | firebird2 | DECLARE VARIABLE %2%1; |
| DeclareVar | mssql2000 | DECLARE %2%1 |
| DeclareVar | mysql5 | DECLARE %2%1; |
| DeclareVar | oracle10g | %2%1; |
| DeclareVar | postgres82 | DECLARE %2%1; |
| DropFunction | db2v9 | --BEGIN GROUP DROP PROCEDURE %1; --END GROUP |
| DropFunction | firebird2 | --BEGIN GROUP RECREATE PROCEDURE %1_ AS BEGIN   IF (EXISTS(SELECT * FROM RDB$PROCEDURES WHERE RDB$PROCEDURE_NAME = '%... |
| DropFunction | mssql2000 | --BEGIN GROUP if exists (select * from sysobjects where id = object_id(N'[%1]') and OBJECTPROPERTY(id, N'IsScalarFunc... |
| DropFunction | mysql5 | DROP FUNCTION IF EXISTS %1 |
| DropFunction | oracle10g | --BEGIN GROUP CREATE OR REPLACE PROCEDURE SP_DROP_OBJECT IS   REC_COUNT NUMBER; BEGIN   SELECT COUNT(*) INTO REC_COUN... |
| DropFunction | postgres82 | --BEGIN GROUP CREATE OR REPLACE FUNCTION FN_DROP_OBJECT() RETURNS VOID AS $BODY$ DECLARE   REC_PARAMETERS RECORD;   P... |
| DropProcedure | db2v9 | --BEGIN GROUP DROP PROCEDURE %1; --END GROUP |
| DropProcedure | firebird2 | --BEGIN GROUP RECREATE PROCEDURE %1_ AS BEGIN   IF (EXISTS(SELECT * FROM RDB$PROCEDURES WHERE RDB$PROCEDURE_NAME = '%... |
| DropProcedure | mssql2000 | --BEGIN GROUP if exists (select * from sysobjects where id = object_id(N'[%1]') and OBJECTPROPERTY(id, N'IsProcedure'... |
| DropProcedure | mysql5 | DROP PROCEDURE IF EXISTS %1 |
| DropProcedure | oracle10g | --BEGIN GROUP CREATE OR REPLACE PROCEDURE SP_DROP_OBJECT IS   REC_COUNT NUMBER; BEGIN   SELECT COUNT(*) INTO REC_COUN... |
| ebfDateMonth | postgres82 | EXTRACT(MONTH FROM %1) |
| ebfDateMonthDifference | db2v9 | TIMESTAMPDIFF(64, CHAR(%1 - %2)) |
| ebfDateMonthDifference | firebird2 | ((CAST(%1 AS DATE) - CAST(%2 AS DATE)) / 30) |
| ebfDateMonthDifference | mssql2000 | DATEDIFF(MONTH, %2, %1) |
| DropProcedure | postgres82 | --BEGIN GROUP CREATE OR REPLACE FUNCTION FN_DROP_OBJECT() RETURNS VOID AS $BODY$ DECLARE   REC_PARAMETERS RECORD;   P... |
| DropTrigger | db2v9 | --BEGIN GROUP DROP TRIGGER %1; --END GROUP |
| DropTrigger | firebird2 | --BEGIN GROUP RECREATE PROCEDURE %1_ AS BEGIN   IF (EXISTS(SELECT * FROM RDB$TRIGGERS WHERE RDB$TRIGGER_NAME = '%1'))... |
| DropTrigger | mssql2000 | --BEGIN GROUP if exists (select * from sysobjects where id = object_id(N'[%1]') and OBJECTPROPERTY(id, N'IsTrigger') ... |
| DropTrigger | mysql5 | DROP TRIGGER IF EXISTS %1 |
| DropTrigger | oracle10g | --BEGIN GROUP CREATE OR REPLACE PROCEDURE SP_DROP_OBJECT IS   REC_COUNT NUMBER; BEGIN   SELECT COUNT(*) INTO REC_COUN... |
| DropTrigger | postgres82 | --BEGIN GROUP DROP TRIGGER IF EXISTS %1 ON %2; --END GROUP  --BEGIN GROUP DROP FUNCTION IF EXISTS TFN_%1(); --END GROUP |
| ebfCharacter | db2v9 | CHR(%1) |
| ebfCharacter | firebird2 | ASCII_CHAR(%1) |
| ebfCharacter | mssql2000 | CHAR(%1) |
| ebfCharacter | mysql5 | CHAR(%1) |
| ebfCharacter | oracle10g | CHR(%1) |
| ebfCharacter | postgres82 | CHR(%1) |
| ebfCharAt | db2v9 | SUBSTR(%1, %2, 1) |
| ebfCharAt | firebird2 | SUBSTRING(%1 FROM %2 FOR 1) |
| ebfCharAt | mssql2000 | SUBSTRING(%1, %2, 1) |
| ebfCharAt | mysql5 | SUBSTRING(%1, %2, 1) |
| ebfCharAt | oracle10g | SUBSTR(%1, %2, 1) |
| ebfCharAt | postgres82 | SUBSTR(%1, %2, 1) |
| ebfChrToAscii | db2v9 | ASCII(%1) |
| ebfChrToAscii | firebird2 | ASCII_VAL(%1) |
| ebfChrToAscii | mssql2000 | ASCII(%1) |
| ebfChrToAscii | mysql5 | ASCII(%1) |
| ebfChrToAscii | oracle10g | ASCII(%1) |
| ebfChrToAscii | postgres82 | ASCII(%1) |
| ebfConcat | db2v9 | (%*[ \|\| ]) |
| ebfConcat | firebird2 | (%*[ \|\| ]) |
| ebfConcat | mssql2000 | (%*[ + ]) |
| ebfConcat | mysql5 | CONCAT(%*[, ]) |
| ebfConcat | oracle10g | (%*[ \|\| ]) |
| ebfConcat | postgres82 | (%*[ \|\| ]) |
| ebfConcatLeft | mysql5 | LPAD(%1, LENGTH(%1) + %2, %3) |
| ebfConcatRight | mysql5 | RPAD(%1, LENGTH(%1) + %2, %3) |
| ebfDateDate | db2v9 | DATE(%1) |
| ebfDateDate | firebird2 | CAST(%1 AS DATE) |
| ebfDateDate | mssql2000 | CONVERT(DATETIME, CONVERT(VARCHAR(10), %1, 112), 100) |
| ebfDateDate | mysql5 | DATE(%1) |
| ebfDateDate | oracle10g | TO_DATE(TO_CHAR(%1, 'DD/MM/YYYY'), 'DD/MM/YYYY') |
| ebfDateDate | postgres82 | %1::DATE |
| ebfDateDay | db2v9 | DAY(%1) |
| ebfDateDay | firebird2 | EXTRACT(DAY FROM %1) |

*... e mais 801 registros*


---


*Documentação gerada automaticamente*

#!/usr/bin/env python3
"""
Gera FRZ com UMA regra complexa de servidor para teste de importacao.

Regra: "Verificar Email Duplicado"
- Recebe parametro: emailDigitado (Letras)
- Variaveis: consulta (Tabela), existe (Logico), msgErro (Letras)
- Fluxo:
  1. Abre consulta SQL para verificar se email ja existe
  2. Decision: existem registros?
     - SIM: monta mensagem de erro, exibe alerta, interrompe fluxo
     - NAO: segue adiante (fim normal)
"""

import base64
import gzip
import hashlib
import os
import struct
import time
import zlib


def encode_dfm_b64(text: str) -> str:
    crlf = text.replace("\r\n", "\n").replace("\n", "\r\n")
    data = crlf.encode("iso-8859-1")
    return base64.b64encode(data).decode("ascii")


def encode_script_b64(text: str) -> str:
    crlf = text.replace("\r\n", "\n").replace("\n", "\r\n")
    data = crlf.encode("iso-8859-1")
    return base64.b64encode(data).decode("ascii")


def xml_escape_attr(text: str) -> str:
    out = []
    for ch in text:
        cp = ord(ch)
        if ch == ' ':
            out.append("&#x0020;")
        elif ch == ',':
            out.append("&#x002C;")
        elif ch == ';':
            out.append("&#x003B;")
        elif ch == '{':
            out.append("&#x007B;")
        elif ch == '}':
            out.append("&#x007D;")
        elif cp > 127:
            out.append(f"&#x{cp:04X};")
        else:
            out.append(ch)
    return "".join(out)


RULE_NAME = "Verificar Email Duplicado (Servidor)"
RULE_COD = 50
RULE_DESTINO = 2  # servidor


def build_dfm() -> str:
    """DFM do fluxograma — layout visual com todos os componentes."""
    return r"""object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 456
    Top = 40
    Width = 38
    Height = 38
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ChangeDescription = False
    OutputNames = 'FlowLine1'
    Description = 'Inicio'
    Variables = 'consulta,Tabela,,;existe,L'#243'gico,,;msgErro,Letras,,'
    WorkFormCod = -1
  end
  object FlowExpression1: TFlowExpression
    Left = 400
    Top = 110
    Width = 150
    Height = 57
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine2'
    Description = 'Consultar email na base'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'consulta'
    Expression = '<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"><PSQL>'#13#10'<COMMAND>'#13#10'Select count(*) as total From fr_usuario Where fr_usuario.usr_email = :email'#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="email">'#13#10'<VARIABLE NAME="emailDigitado"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL Consulta</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression2: TFlowExpression
    Left = 400
    Top = 195
    Width = 150
    Height = 57
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3'
    Description = 'Verificar se existem registros'
    Text = 'Existem Registros(@consulta)'
    ReturnVar = 'existe'
    Expression = '<FUNCTION NAME="Existem&#x20;Registros" REALNAME="ebfSQLEOF">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="consulta"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLEOF</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L'#243'gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>consulta</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision1: TFlowDecision
    Left = 400
    Top = 280
    Width = 150
    Height = 60
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4;FlowLine5'
    Description = 'Email j'#225' existe?'
    DiagramXml = '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L'#243'gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>existe</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L'#243'gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L'#243'gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="existe"/>'#13#10'<CONSTANT TYPE="L'#243'gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression3: TFlowExpression
    Left = 400
    Top = 370
    Width = 150
    Height = 57
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = True
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = 'Montar mensagem de erro'
    Text = 'Concatena'#231#227'o(O e-mail ,@emailDigitado, j'#225' est'#225' cadastrado.)'
    ReturnVar = 'msgErro'
    Expression = '<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >O e-mail </CONSTANT>'#13#10'<VARIABLE NAME="emailDigitado"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  > j'#225' est'#225' cadastrado.</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<VALOR>O e-mail </VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>emailDigitado</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<VALOR> j'#225' est'#225' cadastrado.</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression4: TFlowExpression
    Left = 400
    Top = 455
    Width = 150
    Height = 57
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = True
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine7'
    Description = 'Abortar com mensagem de erro'
    Text = 'Abortar(@msgErro)'
    Expression = '<FUNCTION NAME="Abortar" REALNAME="ebfAbortMsg">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="msgErro"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfAbortMsg</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>msgErro</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>6.1.0.14</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowEnd1: TFlowEnd
    Left = 650
    Top = 300
    Width = 38
    Height = 38
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine4;FlowLine7'
    Description = 'Fim'
  end
  object FlowLine1: TFlowLine
    Left = 455
    Top = 58
    Width = 40
    Height = 72
    Color = clWhite
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowStart1'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine2: TFlowLine
    Left = 455
    Top = 147
    Width = 40
    Height = 68
    Color = 9079434
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
    Left = 455
    Top = 232
    Width = 40
    Height = 68
    Color = 9079434
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 530
    Top = 290
    Width = 140
    Height = 41
    Color = clBlack
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowEnd1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine5: TFlowLine
    Left = 455
    Top = 320
    Width = 64
    Height = 70
    Color = clBlack
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression3'
    Description = 'SIM'
    Region = 0
    Style = psDash
    Decision = True
  end
  object FlowLine6: TFlowLine
    Left = 455
    Top = 407
    Width = 40
    Height = 68
    Color = 9079434
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 530
    Top = 465
    Width = 180
    Height = 41
    Color = 9079434
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end
"""


def build_script() -> str:
    """Script XML da regra — logica de execucao."""
    name_escaped = "Verificar&#x20;Email&#x20;Duplicado&#x20;(Servidor)"
    return f"""<?xml version="1.0" encoding="ISO-8859-1"?>
<RULE ID="{RULE_COD}" NAME="{name_escaped}" COMPONENTNAME="FlowStart1" DESCRIPTION="Inicio" DEBUG="FALSE">
<HEADER>
<AUTHOR>master</AUTHOR>
<DATE>31/03/2026 12:00:00</DATE>
<RANKING>10,0</RANKING>
</HEADER>
<PARAM TYPE="Letras" SIZE="">emailDigitado</PARAM>
<VAR TYPE="Tabela" SIZE="">consulta</VAR>
<VAR TYPE="L\xf3gico" SIZE="">existe</VAR>
<VAR TYPE="Letras" SIZE="">msgErro</VAR>
<DECLARERETURN TYPE="" SIZE=""/>
<ACTION>
<EXPRESSION RETURN="consulta" COMPONENTNAME="FlowExpression1" DESCRIPTION="Consultar&#x20;email&#x20;na&#x20;base">
<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery">
<PARAMS>
<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"><PSQL>
<COMMAND>
Select count(*) as total From fr_usuario Where fr_usuario.usr_email = :email


/*WHERE_ADD*/
/*ORDER_NEW*/
</COMMAND>
<PARAMS>
<DEFINE NAME="email">
<VARIABLE NAME="emailDigitado"/>
</DEFINE>
</PARAMS>
</PSQL>
</CONSTANT>
<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>
</PARAMS>
</FUNCTION>
</EXPRESSION>
<EXPRESSION RETURN="existe" COMPONENTNAME="FlowExpression2" DESCRIPTION="Verificar&#x20;se&#x20;existem&#x20;registros">
<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">
<PARAMS>
<VARIABLE NAME="consulta"/>
</PARAMS>
</FUNCTION>
</EXPRESSION>
<DECISION COMPONENTNAME="FlowDecision1" DESCRIPTION="Email&#x20;j\xe1&#x20;existe?">
<CONDITION>
<FUNCTION NAME="Igual" REALNAME="isEqual">
<PARAMS>
<VARIABLE NAME="existe"/>
<CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT>
</PARAMS>
</FUNCTION>
</CONDITION>
<IFTRUE>
<ACTION>
<EXPRESSION RETURN="msgErro" COMPONENTNAME="FlowExpression3" DESCRIPTION="Montar&#x20;mensagem&#x20;de&#x20;erro">
<FUNCTION NAME="Concatena\xe7\xe3o" REALNAME="ebfConcat">
<PARAMS>
<CONSTANT TYPE="Letras" NULL="FALSE"  >O e-mail </CONSTANT>
<VARIABLE NAME="emailDigitado"/>
<CONSTANT TYPE="Letras" NULL="FALSE"  > j\xe1 est\xe1 cadastrado.</CONSTANT>
</PARAMS>
</FUNCTION>
</EXPRESSION>
<EXPRESSION COMPONENTNAME="FlowExpression4" DESCRIPTION="Abortar&#x20;com&#x20;mensagem&#x20;de&#x20;erro">
<FUNCTION NAME="Abortar" REALNAME="ebfAbortMsg">
<PARAMS>
<VARIABLE NAME="msgErro"/>
</PARAMS>
</FUNCTION>
</EXPRESSION>
<RULERETURN COMPONENTNAME="FlowEnd1" DESCRIPTION="Fim">
</RULERETURN>
</ACTION>
</IFTRUE>
<IFFALSE>
<ACTION>
<RULERETURN COMPONENTNAME="FlowEnd1" DESCRIPTION="Fim">
</RULERETURN>
</ACTION>
</IFFALSE>
</DECISION>
</ACTION>
</RULE>
"""


def build_xml() -> str:
    """Monta o XML completo do FRZ."""
    dfm_b64 = encode_dfm_b64(build_dfm())
    script_b64 = encode_script_b64(build_script())

    nome_escaped = xml_escape_attr(RULE_NAME)
    variaveis_escaped = xml_escape_attr("consulta,Tabela,,;existe,L\xf3gico,,;msgErro,Letras,,")
    params_escaped = xml_escape_attr("emailDigitado,Letras,,")

    return f"""<?xml version="1.0" encoding="iso-8859-1" ?>
<fmaker version="2.3" maker_version="6.1.0.14"  xml:space="preserve">
    <global>
        <rules>
            <rule REG_NOME="{nome_escaped}" REG_COD="{RULE_COD}">
                <property name="REG_COD">{RULE_COD}</property>
                <property name="REG_NOME">{nome_escaped}</property>
                <property name="REG_DESCRICAO">Verifica&#x0020;se&#x0020;email&#x0020;j&#x00E1;&#x0020;existe&#x0020;na&#x0020;base</property>
                <property name="REG_PARAMS">{params_escaped}</property>
                <property name="REG_VARIAVEIS">{variaveis_escaped}</property>
                <property name="REG_PARAMS_OUT"></property>
                <property name="REG_DATA"></property>
                <property name="REG_HORA"></property>
                <property name="REG_COMPILADA"></property>
                <property name="REG_DESTINO">{RULE_DESTINO}</property>
                <property name="REG_HASH"></property>
                <property name="REG_INTERFACE" binary-encoded="True"><![CDATA[{dfm_b64}]]></property>
                <property name="REG_SCRIPT" binary-encoded="True"><![CDATA[{script_b64}]]></property>
            </rule>
        </rules>
    </global>
</fmaker>
"""


def write_frz(xml_bytes: bytes, output_path: str):
    mtime = int(time.time())
    header = b"\x1f\x8b"
    header += b"\x08"
    header += b"\x08"
    header += struct.pack("<I", mtime)
    header += b"\x00"
    header += b"\x00"
    header += b"VERSAO\x00"

    cobj = zlib.compressobj(9, zlib.DEFLATED, -zlib.MAX_WBITS)
    compressed = cobj.compress(xml_bytes)
    compressed += cobj.flush()

    crc = zlib.crc32(xml_bytes) & 0xFFFFFFFF
    size = len(xml_bytes) & 0xFFFFFFFF

    with open(output_path, "wb") as f:
        f.write(header)
        f.write(compressed)
        f.write(struct.pack("<I", crc))
        f.write(struct.pack("<I", size))


def main():
    xml_content = build_xml()
    xml_crlf = xml_content.replace("\r\n", "\n").replace("\n", "\r\n")
    xml_bytes = xml_crlf.encode("iso-8859-1")

    output_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "TesteRegraServidor.frz"
    )

    write_frz(xml_bytes, output_path)
    print(f"FRZ gerado: {output_path}")
    print(f"Tamanho: {os.path.getsize(output_path)} bytes")


if __name__ == "__main__":
    main()

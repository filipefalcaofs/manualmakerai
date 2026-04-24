object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 266
    Top = 93
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
    InputParams = 'vlMotivo,Letras,1,'
    Variables = 'tabela,Tabela,,'
    WorkFormCod = -1
    WorkFormGUID = '{0F92569B-00E7-4B7F-A69D-DEEDB258EA04}'
  end
  object FlowEnd1: TFlowEnd
    Left = 266
    Top = 618
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine10'
    Description = 'Fim'
  end
  object FlowDecision1: TFlowDecision
    Left = 210
    Top = 233
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine2;FlowLine4'
    Description = 'Motivo = Inclus'#227'o'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLFiel' +
      'd</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>t' +
      'abela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</' +
      'TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VA' +
      'LOR>SMB_CAD_CODIGO_SIGLA</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29<' +
      '/MKR_VERSION>'#13#10'<VALOR>I</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="' +
      'tabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "1" >SMB_' +
      'CAD_CODIGO_SIGLA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >I</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision2: TFlowDecision
    Left = 210
    Top = 308
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine5;FlowLine3'
    Description = 'Motivo = Substitui'#231#227'o'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLFiel' +
      'd</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjVariable>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>t' +
      'abela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</' +
      'TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VA' +
      'LOR>SMB_CAD_CODIGO_SIGLA</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29<' +
      '/MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="' +
      'tabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "1" >SMB_' +
      'CAD_CODIGO_SIGLA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine2: TFlowLine
    Left = 265
    Top = 273
    Width = 64
    Height = 55
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowDecision2'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression1: TFlowExpression
    Left = 400
    Top = 234
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine6'
    Description = 'Deabilita componente DO VEICULO'
    Text = 'Habilitar Componente(Veiculo Substitu'#237'do (edtDoVeculo2),false)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{0F92569B-00E7-4B7F-A69D-DEEDB258EA04}">edtDoVeculo2</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Veiculo&#x' +
      '20;Substitu&#237;do&#x20;(edtDoVeculo2)</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{0F92569B-00E7-4B7F-A69D-DEEDB25' +
      '8EA04}</GUID>'#13#10'<SPECIALCODE>edtDoVeculo2</SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR' +
      '>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowEnd3: TFlowEnd
    Left = 1026
    Top = 318
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
    InputNames = 'FlowLine8;FlowLine12'
    Description = 'Fim'
  end
  object FlowLine4: TFlowLine
    Left = 340
    Top = 243
    Width = 80
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression3: TFlowExpression
    Left = 400
    Top = 309
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine7'
    Description = 'Habilita componente DO VEICULO'
    Text = 'Habilitar Componente(Veiculo Substitu'#237'do (edtDoVeculo2),true)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{0F92569B-00E7-4B7F-A69D-DEEDB258EA04}">edtDoVeculo2</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Veiculo&#x' +
      '20;Substitu&#237;do&#x20;(edtDoVeculo2)</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{0F92569B-00E7-4B7F-A69D-DEEDB25' +
      '8EA04}</GUID>'#13#10'<SPECIALCODE>edtDoVeculo2</SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR' +
      '>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 340
    Top = 318
    Width = 80
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression3'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression4: TFlowExpression
    Left = 780
    Top = 234
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine11'
    Description = 'Alterar para vazioo do veiculo'
    Text = 'Alterar Campo(SMB_DO_VEICULO,)'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Campo" REALNAME="ebfSQLSetFormField' +
      '">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "13" G' +
      'UID = "{0F92569B-00E7-4B7F-A69D-DEEDB258EA04}">SMB_DO_VEICULO</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLSetFormField' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>SMB_DO_VEICULO' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>13</FIELDINDEX>'#13#10'<GUID>{0F9256' +
      '9B-00E7-4B7F-A69D-DEEDB258EA04}</GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>' +
      #13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression5: TFlowExpression
    Left = 210
    Top = 159
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine9'
    Description = 'Abrir consulta'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'tabela'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuer' +
      'y">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ' +
      '><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'  SMB_CADASTRO_DE_VEICULO_MOTIVO.SMB' +
      '_CAD_ID,'#13#10'  SMB_CADASTRO_DE_VEICULO_MOTIVO.SMB_CAD_CODIGO_SIGLA'#13 +
      #10'From'#13#10'  SMB_CADASTRO_DE_VEICULO_MOTIVO'#13#10'Where'#13#10'  SMB_CADASTRO_D' +
      'E_VEICULO_MOTIVO.SMB_CAD_ID = :id'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NE' +
      'W*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="id">'#13#10'<VARIABLE NAME="v' +
      'lMotivo"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VA' +
      'LOR><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'  SMB_CADASTRO_DE_VEICULO_MOTIVO.' +
      'SMB_CAD_ID,'#13#10'  SMB_CADASTRO_DE_VEICULO_MOTIVO.SMB_CAD_CODIGO_SIG' +
      'LA'#13#10'From'#13#10'  SMB_CADASTRO_DE_VEICULO_MOTIVO'#13#10'Where'#13#10'  SMB_CADASTR' +
      'O_DE_VEICULO_MOTIVO.SMB_CAD_ID = :id'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER' +
      '_NEW*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="id">'#13#10'<VARIABLE NAME' +
      '="vlMotivo"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmN' +
      'vZGluZz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8U1FMPg0KU2VsZWN0DQomI3g' +
      'yMDsmI3gyMDtTTUJfQ0FEQVNUUk9fREVfVkVJQ1VMT19NT1RJVk8uU01CX0NBRF9' +
      'JRCwNCiYjeDIwOyYjeDIwO1NNQl9DQURBU1RST19ERV9WRUlDVUxPX01PVElWTy5' +
      'TTUJfQ0FEX0NPRElHT19TSUdMQQ0KRnJvbQ0KJiN4MjA7JiN4MjA7U01CX0NBREF' +
      'TVFJPX0RFX1ZFSUNVTE9fTU9USVZPDQpXaGVyZQ0KJiN4MjA7JiN4MjA7U01CX0N' +
      'BREFTVFJPX0RFX1ZFSUNVTE9fTU9USVZPLlNNQl9DQURfSUQmI3gyMDs9JiN4MjA' +
      '7OmlkDQovKldIRVJFX0FERCovDQovKk9SREVSX05FVyovDQo8L1NRTD4NCg0KPFB' +
      'BUkFNUz4NCjxERUZJTkUgTkFNRT0iaWQiPg0KPFZBTFVFPg0KQHZsTW90aXZvDQo' +
      '8L1ZBTFVFPg0KPERJQUdSQU1YTUw+DQpQRDk0Yld3Z2RtVnljMmx2YmowaU1TNHd' +
      'JaUJsYm1OdlpHbHVaejBpU1ZOUExUZzROVGt0TVNJL1BnMEtQRkpQVDFRK0RRbzh' +
      'WRTlpYWxaaGNtbGhZbXhsUGcwS1BFbEVQakU4TDBsRVBnMEtQRTVQVFVVK1ZrRlN' +
      'TVUZDVEVVOEwwNVBUVVUrRFFvOFZFVllWRDUyYkUxdmRHbDJiend2VkVWWVZENE5' +
      'DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZFbFF' +
      'UejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZ' +
      'URDROQ2p4TlMxSmZWa1ZTVTBsUFRqNDFMakF1TUM0eU9Ud3ZUVXRTWDFaRlVsTkp' +
      'UMDQrRFFvOEwxUlBZbXBXWVhKcFlXSnNaVDROQ2p3dlVrOVBWRDROQ2c9PQ0KPC9' +
      'ESUFHUkFNWE1MPg0KPEVYUFJFU1NJT04+DQpQRlpCVWtsQlFreEZJRTVCVFVVOUl' +
      'uWnNUVzkwYVhadklpOCsNCjwvRVhQUkVTU0lPTj4NCjwvREVGSU5FPg0KPC9QQVJ' +
      'BTVM+DQo8L1JPT1Q+DQo=</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<V' +
      'ALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 92
    Width = 40
    Height = 116
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine9: TFlowLine
    Left = 265
    Top = 168
    Width = 40
    Height = 115
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression6: TFlowExpression
    Left = 970
    Top = 234
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine12'
    Description = 'Fechar consulta'
    Text = 'Fechar Consulta(@tabela)'
    Expression = 
      '<FUNCTION NAME="Fechar&#x20;Consulta" REALNAME="ebfSQLClose">'#13#10'<' +
      'PARAMS>'#13#10'<VARIABLE NAME="tabela"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLClose</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression7: TFlowExpression
    Left = 780
    Top = 309
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine8'
    Description = 'Fechar consulta'
    Text = 'Fechar Consulta(@tabela)'
    Expression = 
      '<FUNCTION NAME="Fechar&#x20;Consulta" REALNAME="ebfSQLClose">'#13#10'<' +
      'PARAMS>'#13#10'<VARIABLE NAME="tabela"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLClose</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine8: TFlowLine
    Left = 910
    Top = 318
    Width = 136
    Height = 40
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowEnd3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression8: TFlowExpression
    Left = 210
    Top = 534
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
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine10'
    Description = 'Fechar consulta'
    Text = 'Fechar Consulta(@tabela)'
    Expression = 
      '<FUNCTION NAME="Fechar&#x20;Consulta" REALNAME="ebfSQLClose">'#13#10'<' +
      'PARAMS>'#13#10'<VARIABLE NAME="tabela"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLClose</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine10: TFlowLine
    Left = 265
    Top = 571
    Width = 40
    Height = 67
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine11: TFlowLine
    Left = 910
    Top = 243
    Width = 80
    Height = 40
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
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine12: TFlowLine
    Left = 1025
    Top = 271
    Width = 40
    Height = 67
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowEnd3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
    Left = 210
    Top = 459
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine13'
    Description = 'Habilita componente DO VEICULO'
    Text = 'Habilitar Componente(Veiculo Substitu'#237'do (edtDoVeculo2),false)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{0F92569B-00E7-4B7F-A69D-DEEDB258EA04}">edtDoVeculo2</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Veiculo&#x' +
      '20;Substitu&#237;do&#x20;(edtDoVeculo2)</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{0F92569B-00E7-4B7F-A69D-DEEDB25' +
      '8EA04}</GUID>'#13#10'<SPECIALCODE>edtDoVeculo2</SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR' +
      '>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine13: TFlowLine
    Left = 265
    Top = 496
    Width = 40
    Height = 58
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression2: TFlowExpression
    Left = 590
    Top = 234
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
    OutputNames = 'FlowLine14'
    Description = 'Torna componente obrigat'#243'rio'
    Text = 
      'Definir Obrigatoriedade de Componente(Veiculo Substitu'#237'do (edtDo' +
      'Veculo2),false)'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Compon' +
      'ente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="' +
      'Componente" NULL="FALSE"  GUID = "{0F92569B-00E7-4B7F-A69D-DEEDB' +
      '258EA04}">edtDoVeculo2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" ' +
      'NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Veiculo&#' +
      'x20;Substitu&#237;do&#x20;(edtDoVeculo2)</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{0F92569B-00E7-4B7F-A69D-DEEDB2' +
      '58EA04}</GUID>'#13#10'<SPECIALCODE>edtDoVeculo2</SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALO' +
      'R>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine6: TFlowLine
    Left = 530
    Top = 243
    Width = 80
    Height = 40
    Color = 9079434
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
  object FlowLine14: TFlowLine
    Left = 720
    Top = 243
    Width = 80
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression10: TFlowExpression
    Left = 590
    Top = 309
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
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine15'
    Description = 'Torna componente obrigat'#243'rio'
    Text = 
      'Definir Obrigatoriedade de Componente(Veiculo Substitu'#237'do (edtDo' +
      'Veculo2),true)'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Compon' +
      'ente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="' +
      'Componente" NULL="FALSE"  GUID = "{0F92569B-00E7-4B7F-A69D-DEEDB' +
      '258EA04}">edtDoVeculo2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" ' +
      'NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Veiculo&#' +
      'x20;Substitu&#237;do&#x20;(edtDoVeculo2)</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{0F92569B-00E7-4B7F-A69D-DEEDB2' +
      '58EA04}</GUID>'#13#10'<SPECIALCODE>edtDoVeculo2</SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALO' +
      'R>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine7: TFlowLine
    Left = 530
    Top = 318
    Width = 80
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine15: TFlowLine
    Left = 720
    Top = 318
    Width = 80
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression12: TFlowExpression
    Left = 210
    Top = 384
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
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine16'
    Description = 'Torna componente obrigat'#243'rio'
    Text = 
      'Definir Obrigatoriedade de Componente(Veiculo Substitu'#237'do (edtDo' +
      'Veculo2),false)'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Compon' +
      'ente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="' +
      'Componente" NULL="FALSE"  GUID = "{0F92569B-00E7-4B7F-A69D-DEEDB' +
      '258EA04}">edtDoVeculo2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" ' +
      'NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Veiculo&#' +
      'x20;Substitu&#237;do&#x20;(edtDoVeculo2)</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{0F92569B-00E7-4B7F-A69D-DEEDB2' +
      '58EA04}</GUID>'#13#10'<SPECIALCODE>edtDoVeculo2</SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALO' +
      'R>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine3: TFlowLine
    Left = 265
    Top = 318
    Width = 64
    Height = 115
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression12'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine16: TFlowLine
    Left = 265
    Top = 393
    Width = 40
    Height = 115
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

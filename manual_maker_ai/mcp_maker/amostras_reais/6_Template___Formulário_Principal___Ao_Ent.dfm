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
    Variables = 'Lista de Par'#226'metros,Variante,,;Tabela,Tabela,,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 836
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine11;FlowLine12'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Lista de Par'#226'metros</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9'</TObjVar' +
      'iable>'#13#10'</ROOT>'#13#10
    Expression = #9'<VARIABLE NAME="Lista de Par'#226'metros"/>'#13#10
    Text = '@Lista de Par'#226'metros'
    OutPutParam = 'Variante,    '
  end
  object FlowExpression1: TFlowExpression
    Left = 400
    Top = 84
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
    Description = 'Cria Lista de Retorno'
    Text = 'Criar Objeto Lista()'
    ReturnVar = 'Lista de Par'#226'metros'
    Expression = 
      #9'<FUNCTION NAME="Criar Objeto Lista" REALNAME="ebfListCreate">'#13#10 +
      #9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfListCreate</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9'</TObjFunction>'#13 +
      #10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 92
    Width = 230
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression2: TFlowExpression
    Left = 590
    Top = 84
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
    Description = '1. Adiciona o Nome do Usuario na lista'
    Text = 
      'Inserir Objeto na Lista(@Lista de Par'#226'metros,Campo(Abrir Consult' +
      'a(SQL CONSULTA,),usr_nome),)'
    Expression = 
      #9'<FUNCTION NAME="Inserir Objeto na Lista" REALNAME="ebfSetElemen' +
      'tAtList">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Lista de Par'#226'metros"/>' +
      #13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARAMS' +
      '>'#13#10#9#9#9#9#9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQ' +
      'uery">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="SQL Consulta" NUL' +
      'L="FALSE"><PSQL>'#13#10#9#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  fr_usuario.usr_c' +
      'odigo,'#13#10'  fr_usuario.usr_nome'#13#10'From'#13#10'  fr_usuario'#13#10'Where'#13#10'  fr_u' +
      'suario.usr_codigo = :codigo'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'<' +
      '/COMMAND>'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="codigo">'#13#10 +
      #9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="ID do Usu'#225'rio" REALNAME="ebfGetUserCo' +
      'de">'#13#10#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9'</PA' +
      'RAMS>'#13#10#9#9#9#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9#9#9#9'</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYP' +
      'E="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNC' +
      'TION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX="1">usr_no' +
      'me</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE=' +
      '"Inteiro" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetElementAtList</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9'<TEXT>Lista de Par'#226'metros</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9 +
      '<TObjFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<' +
      'TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>1.0.0.501</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9 +
      #9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQL' +
      'ExecuteQuery</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela<' +
      '/TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VER' +
      'SION>1.0.0.501</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>SQL Consulta' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MK' +
      'R_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9 +
      #9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  fr_usuario.usr_codigo,'#13#10'  fr_usuario.us' +
      'r_nome'#13#10'From'#13#10'  fr_usuario'#13#10'Where'#13#10'  fr_usuario.usr_codigo = :co' +
      'digo'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="codigo">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION' +
      ' NAME="ID do Usu'#225'rio" REALNAME="ebfGetUserCode">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'</' +
      'FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<' +
      '/PSQL>'#13#10#9#9#9#9#9#9#9#9'</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
      #9#9#9#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8Uk9PVD4NCgk8U' +
      '1FMPg0KU2VsZWN0DQogIGZyX3VzdWFyaW8udXNyX2NvZGlnbywNCiAgZnJfdXN1Y' +
      'XJpby51c3Jfbm9tZQ0KRnJvbQ0KICBmcl91c3VhcmlvDQpXaGVyZQ0KICBmcl91c' +
      '3VhcmlvLnVzcl9jb2RpZ28gPSA6Y29kaWdvDQovKldIRVJFX0FERCovDQovKk9SR' +
      'EVSX05FVyovDQo8L1NRTD4NCgk8UEFSQU1TPg0KCQk8REVGSU5FIE5BTUU9ImNvZ' +
      'GlnbyI+DQoJCQk8VkFMVUU+SUQgZG8gVXN14XJpbygpPC9WQUxVRT4NCgkJCTxES' +
      'UFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84VWs5UFZEN' +
      'E5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK01Ud3ZTVVErRFFvSkNUe' +
      'E9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1FrOFZFVllWRDVsWW1aSFpYU' +
      'lZjMlZ5UTI5a1pUd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnM' +
      'EtDUWs4VkVsUVR6NU8rbTFsY204OEwxUkpVRTgrRFFvSkNUeEpUa05QVFZCQlZFb' +
      'FdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0pQRTFMVWw5V1JWS' +
      'lRTVTlPUGpFdU1DNHdMalV3TVR3dlRVdFNYMVpGVWxOSlQwNCtEUW9KUEM5VVQyS' +
      'nFSblZ1WTNScGIyNCtEUW84TDFKUFQxUStEUW89PC9ESUFHUkFNWE1MPg0KCQkJP' +
      'EVYUFJFU1NJT04+DQpQRVpWVGtOVVNVOU9JRTVCVFVVOUlrbEVKaU40TWpBN1pHO' +
      'G1JM2d5TUR0VmMzVW1Jekl5TlR0eWFXOGlJRkpGUVV4T1FVMUZQU0psWW1aSFpYU' +
      'lZjMlZ5UTI5a1pTSStEUW84TDBaVlRrTlVTVTlPUGc9PQ0KPC9FWFBSRVNTSU9OP' +
      'g0KCQk8L0RFRklORT4NCgk8L1BBUkFNUz4NCjwvUk9PVD4NCg==</DIAGRAMXML>' +
      #13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9 +
      #9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION' +
      '>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9 +
      #9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9 +
      #9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PAR' +
      'AMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10 +
      #9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      '<VALOR>usr_nome</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
      #9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FI' +
      'ELDINDEX>1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunc' +
      'tion>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>' +
      #13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.' +
      '0.0.501</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO' +
      '>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFun' +
      'ction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 455
    Top = 93
    Width = 230
    Height = 40
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression3: TFlowExpression
    Left = 590
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
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4'
    Description = '2. Adiciona a Sigla do Sistema'
    Text = 
      'Inserir Objeto na Lista(@Lista de Par'#226'metros,Subsequ'#234'ncia(Sigla ' +
      'do Sistema,1,3),)'
    Expression = 
      #9'<FUNCTION NAME="Inserir Objeto na Lista" REALNAME="ebfSetElemen' +
      'tAtList">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Lista de Par'#226'metros"/>' +
      #13#10#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9 +
      #9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Sigla do Sistema" REALNAME="ebfG' +
      'etFullSystemID">'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Inteiro' +
      '" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL=' +
      '"FALSE">3</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTAN' +
      'T TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTI' +
      'ON>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetElementAtList</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9 +
      #9#9'<TEXT>Lista de Par'#226'metros</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TOb' +
      'jFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>ebfSubstring</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.' +
      '2.0.5</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<I' +
      'D>4</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfGetFullSys' +
      'temID</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13 +
      #10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.' +
      '2.0.5</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9 +
      #9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13 +
      #10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.5</MKR_V' +
      'ERSION>'#13#10#9#9#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9 +
      #9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9 +
      #9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.5</MKR' +
      '_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>3</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13 +
      #10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9 +
      #9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONS' +
      'TANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>' +
      'Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR' +
      '_VERSION>1.2.0.5</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>T' +
      'RUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10 +
      #9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9 +
      '</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression4: TFlowExpression
    Left = 400
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
    ChangeDescription = True
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine5'
    Description = '3. Adiciona Usu'#225'rio - Administrador ou N'#227'o'
    Text = 
      'Inserir Objeto na Lista(@Lista de Par'#226'metros,Existem Registros(A' +
      'brir Consulta(SQL CONSULTA,)),)'
    Expression = 
      #9'<FUNCTION NAME="Inserir Objeto na Lista" REALNAME="ebfSetElemen' +
      'tAtList">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Lista de Par'#226'metros"/>' +
      #13#10#9#9#9'<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">'#13#10#9 +
      #9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfS' +
      'QLExecuteQuery">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="SQL Con' +
      'sulta" NULL="FALSE"><PSQL>'#13#10#9#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  fr_usu' +
      'ario.usr_codigo'#13#10'From'#13#10'  fr_usuario'#13#10'  Left Join'#13#10'  fr_usuario_s' +
      'istema On fr_usuario.usr_codigo = fr_usuario_sistema.usr_codigo'#13 +
      #10'Where ('#13#10'  (fr_usuario.usr_codigo = :usuario And'#13#10'  fr_usuario.' +
      'usr_administrador = '#39'S'#39') Or'#13#10'  (fr_usuario.usr_codigo = :usuario' +
      ' And'#13#10'  fr_usuario.usr_codigo = :usuario And'#13#10'  fr_usuario_siste' +
      'ma.sis_codigo = :sistema And'#13#10'  fr_usuario_sistema.uss_administr' +
      'ador = '#39'S'#39'))'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9 +
      #9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="usuario">'#13#10#9#9#9#9#9#9#9#9#9#9#9'<FU' +
      'NCTION NAME="ID do Usu'#225'rio" REALNAME="ebfGetUserCode">'#13#10#9#9#9#9#9#9#9#9 +
      #9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="usu' +
      'ario">'#13#10#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="ID do Usu'#225'rio" REALNAME="ebfG' +
      'etUserCode">'#13#10#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9 +
      #9#9#9#9#9'<DEFINE NAME="usuario">'#13#10#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="ID do U' +
      'su'#225'rio" REALNAME="ebfGetUserCode">'#13#10#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="sistema">'#13#10#9#9#9#9#9#9#9#9#9#9#9'<' +
      'FUNCTION NAME="C'#243'digo do Sistema" REALNAME="ebfGetSystemID">'#13#10#9#9 +
      #9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9#9#9#9'</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9 +
      #9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="' +
      'TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetElementAtList</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9 +
      #9#9'<TEXT>Lista de Par'#226'metros</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TOb' +
      'jFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>ebfSQLEOF</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0' +
      '.5</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>4' +
      '</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLExecuteQue' +
      'ry</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0' +
      '.5</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<I' +
      'D>5</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13#10#9#9#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.' +
      '2.0.5</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<COMMAND>'#13 +
      #10'Select'#13#10'  fr_usuario.usr_codigo'#13#10'From'#13#10'  fr_usuario'#13#10'  Left Joi' +
      'n'#13#10'  fr_usuario_sistema On fr_usuario.usr_codigo = fr_usuario_si' +
      'stema.usr_codigo'#13#10'Where ('#13#10'  (fr_usuario.usr_codigo = :usuario A' +
      'nd'#13#10'  fr_usuario.usr_administrador = '#39'S'#39') Or'#13#10'  (fr_usuario.usr_' +
      'codigo = :usuario And'#13#10'  fr_usuario.usr_codigo = :usuario And'#13#10' ' +
      ' fr_usuario_sistema.sis_codigo = :sistema And'#13#10'  fr_usuario_sist' +
      'ema.uss_administrador = '#39'S'#39'))'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13 +
      #10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="usuari' +
      'o">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="ID do Usu'#225'rio" REALNAME="ebfGet' +
      'UserCode">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9 +
      #9#9#9#9#9#9'<DEFINE NAME="usuario">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="ID do' +
      ' Usu'#225'rio" REALNAME="ebfGetUserCode">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9 +
      #9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="usuario">'#13#10#9#9#9#9#9#9#9 +
      #9#9#9#9#9'<FUNCTION NAME="ID do Usu'#225'rio" REALNAME="ebfGetUserCode">'#13#10 +
      #9#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<DEFIN' +
      'E NAME="sistema">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="C'#243'digo do Sistema' +
      '" REALNAME="ebfGetSystemID">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9 +
      #9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9#9#9#9#9'</VA' +
      'LOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML>P' +
      'D94bWwgdmVyc2lvbj0iMS4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogI' +
      'GZyX3VzdWFyaW8udXNyX2NvZGlnbw0KRnJvbQ0KICBmcl91c3VhcmlvDQogIExlZ' +
      'nQgSm9pbg0KICBmcl91c3VhcmlvX3Npc3RlbWEgT24gZnJfdXN1YXJpby51c3JfY' +
      '29kaWdvID0gZnJfdXN1YXJpb19zaXN0ZW1hLnVzcl9jb2RpZ28NCldoZXJlICgNC' +
      'iAgKGZyX3VzdWFyaW8udXNyX2NvZGlnbyA9IDp1c3VhcmlvIEFuZA0KICBmcl91c' +
      '3VhcmlvLnVzcl9hZG1pbmlzdHJhZG9yID0gJ1MnKSBPcg0KICAoZnJfdXN1YXJpb' +
      'y51c3JfY29kaWdvID0gOnVzdWFyaW8gQW5kDQogIGZyX3VzdWFyaW8udXNyX2NvZ' +
      'GlnbyA9IDp1c3VhcmlvIEFuZA0KICBmcl91c3VhcmlvX3Npc3RlbWEuc2lzX2NvZ' +
      'GlnbyA9IDpzaXN0ZW1hIEFuZA0KICBmcl91c3VhcmlvX3Npc3RlbWEudXNzX2Fkb' +
      'WluaXN0cmFkb3IgPSAnUycpKQ0KLypXSEVSRV9BREQqLw0KLypPUkRFUl9ORVcqL' +
      'w0KPC9TUUw+DQoJPFBBUkFNUz4NCgkJPERFRklORSBOQU1FPSJ1c3VhcmlvIj4NC' +
      'gkJCTxWQUxVRT5JRCBkbyBVc3XhcmlvKCk8L1ZBTFVFPg0KCQkJPERJQUdSQU1YT' +
      'Uw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWo4K0RRbzhVazlQVkQ0TkNnazhWR' +
      'TlpYWtaMWJtTjBhVzl1UGcwS0NRazhTVVErTVR3dlNVUStEUW9KQ1R4T1QwMUZQa' +
      '1pWVGtOVVNVOU9QQzlPVDAxRlBnMEtDUWs4VkVWWVZENWxZbVpIWlhSVmMyVnlRM' +
      'jlrWlR3dlZFVllWRDROQ2drSlBGTlJURDVHUVV4VFJUd3ZVMUZNUGcwS0NRazhWR' +
      'WxRVHo1TyttMWxjbTg4TDFSSlVFOCtEUW9KQ1R4SlRrTlBUVkJCVkVsV1JVdytSa' +
      '0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2drSlBFMUxVbDlXUlZKVFNVOU9Qa' +
      'kV1TUM0d0xqVXdNVHd2VFV0U1gxWkZVbE5KVDA0K0RRb0pQQzlVVDJKcVJuVnVZM' +
      '1JwYjI0K0RRbzhMMUpQVDFRK0RRbz08L0RJQUdSQU1YTUw+DQoJCQk8RVhQUkVTU' +
      '0lPTj4NClBFWlZUa05VU1U5T0lFNUJUVVU5SWtsRUppTjRNakE3Wkc4bUkzZ3lNR' +
      'HRWYzNVbUl6SXlOVHR5YVc4aUlGSkZRVXhPUVUxRlBTSmxZbVpIWlhSVmMyVnlRM' +
      'jlrWlNJK0RRbzhMMFpWVGtOVVNVOU9QZz09DQo8L0VYUFJFU1NJT04+DQoJCTwvR' +
      'EVGSU5FPg0KCQk8REVGSU5FIE5BTUU9InVzdWFyaW8iPg0KCQkJPFZBTFVFPklEI' +
      'GRvIFVzdeFyaW8oKTwvVkFMVUU+DQoJCQk8RElBR1JBTVhNTD5QRDk0Yld3Z2RtV' +
      'nljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2drOFZFOWlha1oxYm1OMGFXO' +
      'XVQZzBLQ1FrOFNVUStNVHd2U1VRK0RRb0pDVHhPVDAxRlBrWlZUa05VU1U5T1BDO' +
      'U9UMDFGUGcwS0NRazhWRVZZVkQ1bFltWkhaWFJWYzJWeVEyOWtaVHd2VkVWWVZEN' +
      'E5DZ2tKUEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLQ1FrOFZFbFFUejVPK20xbGNtO' +
      'DhMMVJKVUU4K0RRb0pDVHhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwO' +
      'U5VRUZVU1ZaRlRENE5DZ2tKUEUxTFVsOVdSVkpUU1U5T1BqRXVNQzR3TGpVd01Ud' +
      '3ZUVXRTWDFaRlVsTkpUMDQrRFFvSlBDOVVUMkpxUm5WdVkzUnBiMjQrRFFvOEwxS' +
      'lBUMVErRFFvPTwvRElBR1JBTVhNTD4NCgkJCTxFWFBSRVNTSU9OPg0KUEVaVlRrT' +
      'lVTVTlPSUU1QlRVVTlJa2xFSmlONE1qQTdaRzhtSTNneU1EdFZjM1VtSXpJeU5Ud' +
      'HlhVzhpSUZKRlFVeE9RVTFGUFNKbFltWkhaWFJWYzJWeVEyOWtaU0krRFFvOEwwW' +
      'lZUa05VU1U5T1BnPT0NCjwvRVhQUkVTU0lPTj4NCgkJPC9ERUZJTkU+DQoJCTxER' +
      'UZJTkUgTkFNRT0idXN1YXJpbyI+DQoJCQk8VkFMVUU+SUQgZG8gVXN14XJpbygpP' +
      'C9WQUxVRT4NCgkJCTxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d' +
      '0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK' +
      '01Ud3ZTVVErRFFvSkNUeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1FrO' +
      'FZFVllWRDVsWW1aSFpYUlZjMlZ5UTI5a1pUd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R' +
      '1FVeFRSVHd2VTFGTVBnMEtDUWs4VkVsUVR6NU8rbTFsY204OEwxUkpVRTgrRFFvS' +
      'kNUeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0T' +
      'kNna0pQRTFMVWw5V1JWSlRTVTlPUGpFdU1DNHdMalV3TVR3dlRVdFNYMVpGVWxOS' +
      'lQwNCtEUW9KUEM5VVQySnFSblZ1WTNScGIyNCtEUW84TDFKUFQxUStEUW89PC9ES' +
      'UFHUkFNWE1MPg0KCQkJPEVYUFJFU1NJT04+DQpQRVpWVGtOVVNVOU9JRTVCVFVVO' +
      'UlrbEVKaU40TWpBN1pHOG1JM2d5TUR0VmMzVW1Jekl5TlR0eWFXOGlJRkpGUVV4T' +
      '1FVMUZQU0psWW1aSFpYUlZjMlZ5UTI5a1pTSStEUW84TDBaVlRrTlVTVTlPUGc9P' +
      'Q0KPC9FWFBSRVNTSU9OPg0KCQk8L0RFRklORT4NCgkJPERFRklORSBOQU1FPSJza' +
      'XN0ZW1hIj4NCgkJCTxWQUxVRT5D82RpZ28gZG8gU2lzdGVtYSgpPC9WQUxVRT4NC' +
      'gkJCTxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84V' +
      'Ws5UFZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK01Ud3ZTVVErR' +
      'FFvSkNUeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1FrOFZFVllWRDVsW' +
      'W1aSFpYUlRlWE4wWlcxSlJEd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd2V' +
      'TFGTVBnMEtDUWs4VkVsUVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFvSkNUeEpUa05QV' +
      'FZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0pQRTFMV' +
      'Ww5V1JWSlRTVTlPUGpFdU1DNHdMalV3TVR3dlRVdFNYMVpGVWxOSlQwNCtEUW9KU' +
      'EM5VVQySnFSblZ1WTNScGIyNCtEUW84TDFKUFQxUStEUW89PC9ESUFHUkFNWE1MP' +
      'g0KCQkJPEVYUFJFU1NJT04+DQpQRVpWVGtOVVNVOU9JRTVCVFVVOUlrTW1JekkwT' +
      'Xp0a2FXZHZKaU40TWpBN1pHOG1JM2d5TUR0VGFYTjBaVzFoSWlCU1JVRk1Ua0ZOU' +
      'lQwaVpXSm1SMlYwVTNsemRHVnRTVVFpUGcwS1BDOUdWVTVEVkVsUFRqND0NCjwvR' +
      'VhQUkVTU0lPTj4NCgkJPC9ERUZJTkU+DQoJPC9QQVJBTVM+DQo8L1JPT1Q+DQo=<' +
      '/DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>' +
      '6</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9 +
      #9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.5</M' +
      'KR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE' +
      '</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GU' +
      'ID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9 +
      #9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFu' +
      'nction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOM' +
      'E>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.5</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO' +
      '>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFun' +
      'ction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine4: TFlowLine
    Left = 455
    Top = 168
    Width = 230
    Height = 40
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression6: TFlowExpression
    Left = 210
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
    OutputNames = 'FlowLine7'
    Description = '5. Adiciona o Modo do Projeto'
    Text = 
      'Inserir Objeto na Lista(@Lista de Par'#226'metros,Mai'#250'sculo(Projeto e' +
      'm que Modo Est'#225'?),)'
    Expression = 
      '<FUNCTION NAME="Inserir&#x20;Objeto&#x20;na&#x20;Lista" REALNAME' +
      '="ebfSetElementAtList">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Lista&#x20;de' +
      '&#x20;Par&#226;metros"/>'#13#10'<FUNCTION NAME="Mai&#250;sculo" REALNA' +
      'ME="ebfToUpperCase">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Projeto&#x20;em&' +
      '#x20;que&#x20;Modo&#x20;Est&#225;?" REALNAME="ebfUserAccessWhich' +
      'Mode">'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Int' +
      'eiro" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetElementAtLis' +
      't</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Li' +
      'sta&#x20;de&#x20;Par&#226;metros</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.5</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjFunction>'#13#10'<ID>3' +
      '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfToUpperCase</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfUserAccessWhichM' +
      'ode</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.5</MKR_VERSION>'#13#10'</TOb' +
      'jFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>I' +
      'nteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.5</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression7: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine8'
    Description = 'Obter a foto do Usu'#225'rio'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'Tabela'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuer' +
      'y">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ' +
      '><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;fr_usuario.usr_foto'#13#10'Fro' +
      'm'#13#10'&#x20;&#x20;fr_usuario'#13#10'Where&#x20;('#13#10'&#x20;&#x20;(Not&#x20;f' +
      'r_usuario.usr_foto&#x20;Is&#x20;Null)&#x20;And'#13#10'&#x20;&#x20;(fr_' +
      'usuario.usr_codigo&#x20;=&#x20;:usuario))'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*' +
      'ORDER_NEW*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="usuario">'#13#10'<FUN' +
      'CTION NAME="ID&#x20;do&#x20;Usu&#225;rio" REALNAME="ebfGetUserCo' +
      'de">'#13#10'</FUNCTION>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</CONSTANT>'#13#10'<' +
      'CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.2.3</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.2.3</MKR_VERSION>'#13#10'<VALO' +
      'R><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;fr_usuario.usr_foto'#13#10'Fr' +
      'om'#13#10'&#x20;&#x20;fr_usuario'#13#10'Where&#x20;('#13#10'&#x20;&#x20;(Not&#x20;' +
      'fr_usuario.usr_foto&#x20;Is&#x20;Null)&#x20;And'#13#10'&#x20;&#x20;(fr' +
      '_usuario.usr_codigo&#x20;=&#x20;:usuario))'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/' +
      '*ORDER_NEW*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="usuario">'#13#10'<FU' +
      'NCTION NAME="ID&#x20;do&#x20;Usu&#225;rio" REALNAME="ebfGetUserC' +
      'ode">'#13#10'</FUNCTION>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIi' +
      'BlbmNvZGluZz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8U1FMPg0KU2VsZWN0DQ' +
      'omI3gyMDsmI3gyMDtmcl91c3VhcmlvLnVzcl9mb3RvDQpGcm9tDQomI3gyMDsmI3' +
      'gyMDtmcl91c3VhcmlvDQpXaGVyZSYjeDIwOygNCiYjeDIwOyYjeDIwOyhOb3QmI3' +
      'gyMDtmcl91c3VhcmlvLnVzcl9mb3RvJiN4MjA7SXMmI3gyMDtOdWxsKSYjeDIwO0' +
      'FuZA0KJiN4MjA7JiN4MjA7KGZyX3VzdWFyaW8udXNyX2NvZGlnbyYjeDIwOz0mI3' +
      'gyMDs6dXN1YXJpbykpDQovKldIRVJFX0FERCovDQovKk9SREVSX05FVyovDQo8L1' +
      'NRTD4NCg0KPFBBUkFNUz4NCjxERUZJTkUgTkFNRT0idXN1YXJpbyI+DQo8VkFMVU' +
      'U+DQpJRCYjeDIwO2RvJiN4MjA7VXN1JiMyMjU7cmlvKCkNCjwvVkFMVUU+DQo8RE' +
      'lBR1JBTVhNTD4NClBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84VWs5UF' +
      'ZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK01Ud3ZTVVErRFFvSk' +
      'NUeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1FrOFZFVllWRDVsWW1aSF' +
      'pYUlZjMlZ5UTI5a1pUd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd2VTFGTV' +
      'BnMEtDUWs4VkVsUVR6NU8rbTFsY204OEwxUkpVRTgrRFFvSkNUeEpUa05QVFZCQl' +
      'ZFbFdSVXcrVkZKVlJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS0NRazhUVXRTWDFaRl' +
      'VsTkpUMDQrTVM0d0xqQXVOVEF4UEM5TlMxSmZWa1ZTVTBsUFRqNE5DZ2s4TDFSUF' +
      'ltcEdkVzVqZEdsdmJqNE5Dand2VWs5UFZENE5DZz09DQo8L0RJQUdSQU1YTUw+DQ' +
      'o8RVhQUkVTU0lPTj4NClBFWlZUa05VU1U5T0lFNUJUVVU5SWtsRUppTjRNakE3Wk' +
      'c4bUkzZ3lNRHRWYzNVbUl6SXlOVHR5YVc4aUlGSkZRVXhPUVUxRlBTSmxZbVpIWl' +
      'hSVmMyVnlRMjlrWlNJK0RRbzhMMFpWVGtOVVNVOU9QZz09DQo8L0VYUFJFU1NJT0' +
      '4+DQo8L0RFRklORT4NCjwvUEFSQU1TPg0KPC9ST09UPg0K</DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.2.3</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision1: TFlowDecision
    Left = 590
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine10;FlowLine9'
    Description = 'Existem Registros ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLEOF</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVa' +
      'riable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Ta' +
      'bela</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.0.0.501</' +
      'MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13 +
      #10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">'#13#10#9#9'<PA' +
      'RAMS>'#13#10#9#9#9'<VARIABLE NAME="Tabela"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine8: TFlowLine
    Left = 530
    Top = 243
    Width = 80
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 340
    Top = 243
    Width = 80
    Height = 40
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
    Left = 645
    Top = 93
    Width = 40
    Height = 115
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector1: TFlowConnector
    Left = 840
    Top = 247
    Width = 30
    Height = 30
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
    ChangeDescription = False
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine11'
  end
  object FlowLine10: TFlowLine
    Left = 720
    Top = 243
    Width = 140
    Height = 41
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowConnector1'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine11: TFlowLine
    Left = 835
    Top = 242
    Width = 40
    Height = 115
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
    InputNames = 'FlowConnector1'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psDash
    Decision = False
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
    ChangeDescription = True
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = '4. Adiciona Publicado ou N'#227'o'
    Text = 'Inserir Objeto na Lista(@Lista de Par'#226'metros,'#201' publicado?,)'
    Expression = 
      #9'<FUNCTION NAME="Inserir Objeto na Lista" REALNAME="ebfSetElemen' +
      'tAtList">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Lista de Par'#226'metros"/>' +
      #13#10#9#9#9'<FUNCTION NAME="'#201' publicado?" REALNAME="ebfIsReloadable">'#13#10 +
      #9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="TRUE"></CONSTA' +
      'NT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetElementAtList</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9'<TEXT>Lista de Par'#226'metros</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9 +
      '<TObjFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<' +
      'TEXT>ebfIsReloadable</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'g' +
      'ico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VER' +
      'SION>1.0.0.501</MKR_VERSION>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.0.0.501</MKR_VERSION>' +
      #13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 265
    Top = 168
    Width = 230
    Height = 40
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 265
    Top = 196
    Width = 40
    Height = 58
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine12'
    Description = '6. Adiciona Imagem do Usu'#225'rio'
    Text = 
      'Inserir Objeto na Lista(@Lista de Par'#226'metros,Remover Quebra de L' +
      'inha do Texto(Bin'#225'rio para Base 64(Campo(@Tabela,usr_foto)),))'
    Expression = 
      '<FUNCTION NAME="Inserir&#x20;Objeto&#x20;na&#x20;Lista" REALNAME' +
      '="ebfSetElementAtList">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Lista&#x20;de' +
      '&#x20;Par&#226;metros"/>'#13#10'<FUNCTION NAME="Remover&#x20;Quebra&#x' +
      '20;de&#x20;Linha&#x20;do&#x20;Texto" REALNAME="ebfRemoveLineBrea' +
      'k">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Bin&#225;rio&#x20;para&#x20;Base&' +
      '#x20;64" REALNAME="ebfBytesToBase64">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME=' +
      '"Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabel' +
      'a"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "0" >usr_foto<' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetElementAtLis' +
      't</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>L' +
      'ista&#x20;de&#x20;Par&#226;metros</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjFunction>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfRemoveLineBreak</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Function>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfBytesToBa' +
      'se64</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>' +
      'ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VE' +
      'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VER' +
      'SION>'#13#10'<VALOR>usr_foto</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>0</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERS' +
      'ION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine9: TFlowLine
    Left = 645
    Top = 273
    Width = 60
    Height = 56
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression9'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine12: TFlowLine
    Left = 645
    Top = 317
    Width = 230
    Height = 41
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end
                                                                                                                                                                                                                             
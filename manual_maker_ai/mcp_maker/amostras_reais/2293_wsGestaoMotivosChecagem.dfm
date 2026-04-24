object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 76
    Top = 18
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
    Variables = 
      'vCorpo,Letras,50,;vRetorno,Letras,50,;vCabecalho,Variante,,;vSec' +
      'ret,Letras,50,;vToken,Letras,50,;vPayload,Variante,,;vCodigoUsua' +
      'rioSha1,Inteiro,,;vCodigoChecagem,Inteiro,,;vRetornoFuncao,L'#243'gic' +
      'o,,;vDadosChecagem,Variante,,;vDadosPendencias,Variante,,;vDados' +
      'Usuario,Variante,,;vTotalizadores,Variante,,;vStatusSoltura,Inte' +
      'iro,,'
    WorkFormCod = -1
  end
  object FlowExpression14: TFlowExpression
    Left = 210
    Top = 460
    Width = 149
    Height = 56
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
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine5'
    Description = 'Obtendo corpo do REST'
    Text = 'Alterar Charset(REST - Obter Conte'#250'do do Corpo,ISO-8859-1,UTF-8)'
    ReturnVar = 'vCorpo'
    Expression = 
      #9'<FUNCTION NAME="Alterar Charset" REALNAME="ebfValueChangeCharse' +
      't">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="REST - Obter Conte'#250'do do Cor' +
      'po" REALNAME="ebfRestGetBodyContent">'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE">ISO-8859-1</CONSTANT>'#13#10#9#9#9'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE">UTF-8</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</' +
      'FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>4</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfValueChangeCharset</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9 +
      #9#9#9'<TEXT>ebfRestGetBodyContent</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
      #9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<T' +
      'ObjConst>'#13#10#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT>' +
      '</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_V' +
      'ERSION>'#13#10#9#9#9#9'<VALOR>ISO-8859-1</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
      #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>7<' +
      '/ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>U' +
      'TF-8</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</' +
      'TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision9: TFlowDecision
    Left = 210
    Top = 533
    Width = 149
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine11;FlowLine7'
    Description = 'Corpo = null ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>9</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprOr</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunctio' +
      'n>'#13#10#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>isNull' +
      'OrEmpty</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29' +
      '</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>11<' +
      '/ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vCorpo</TEXT>'#13#10#9#9 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9 +
      #9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>12</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9 +
      #9#9'<TEXT>isEqual</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9 +
      #9'<ID>13</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vCorpo</T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>' +
      '14</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION' +
      '>'#13#10#9#9#9#9#9#9'<VALOR>""</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
      #9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObj' +
      'Function>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Ou" REALNAME="oprOr">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION' +
      ' NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9#9#9'<PARAMS>'#13 +
      #10#9#9#9#9#9'<VARIABLE NAME="vCorpo"/>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10 +
      #9#9#9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9'<VARIABLE NAME="vCorpo"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE">""</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>' +
      #13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowExpression12: TFlowExpression
    Left = 210
    Top = 85
    Width = 149
    Height = 56
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3'
    Description = 'Define Acesso Cross Origin'
    Text = 
      'Resposta Web: Atribuir Valor ao Cabe'#231'alho(Access-Control-Allow-O' +
      'rigin,*)'
    Expression = 
      #9'<FUNCTION NAME="Resposta Web: Atribuir Valor ao Cabe'#231'alho" REAL' +
      'NAME="ebfSetHeader">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE">Access-Control-Allow-Origin</CONSTANT>'#13#10#9#9#9'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE">*</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
      '>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetHeader</TEXT>'#13#10#9#9'<SQL>FALSE' +
      '</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>Access-Control-Allow-Origin</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE<' +
      '/NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9 +
      #9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10#9#9#9#9 +
      '<VALOR>*</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression6: TFlowExpression
    Left = 20
    Top = 85
    Width = 149
    Height = 56
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
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4'
    Description = 'Define Acesso Cross Origin'
    Text = 
      'Resposta Web: Atribuir Valor ao Cabe'#231'alho(Access-Control-Allow-M' +
      'ethods,POST)'
    Expression = 
      #9'<FUNCTION NAME="Resposta Web: Atribuir Valor ao Cabe'#231'alho" REAL' +
      'NAME="ebfSetHeader">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE">Access-Control-Allow-Methods</CONSTANT>'#13#10#9#9#9'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE">POST</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNC' +
      'TION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetHeader</TEXT>'#13#10#9#9'<SQL>FALSE' +
      '</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>Access-Control-Allow-Methods</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE' +
      '</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9 +
      #9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9 +
      #9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9 +
      #9'<VALOR>POST</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine3: TFlowLine
    Left = 75
    Top = 93
    Width = 230
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
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine5: TFlowLine
    Left = 265
    Top = 468
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
    InputNames = 'FlowExpression14'
    OutputNames = 'FlowDecision9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression4: TFlowExpression
    Left = 20
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
    OutputNames = 'FlowLine15'
    Description = 'JSON - Obter Cabecalho da Requisi'#231#227'o'
    Text = 'REST - Obter Conte'#250'do do Cabe'#231'alho()'
    ReturnVar = 'vCabecalho'
    Expression = 
      #9'<FUNCTION NAME="REST - Obter Conte'#250'do do Cabe'#231'alho" REALNAME="e' +
      'bfRestGetHeadersContent">'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfRestGetHeadersContent</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine4: TFlowLine
    Left = 75
    Top = 93
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision4: TFlowDecision
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
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine19;FlowLine6'
    Description = 'Token v'#225'lido ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>4</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfValidateJWTToken</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9 +
      #9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9 +
      #9'<TEXT>vToken</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9 +
      #9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>vSecret</TEXT>' +
      #13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>' +
      'CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NU' +
      'LO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUI' +
      'D>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="JWT - Validar Token" REALNAME="ebfValidateJWTTo' +
      'ken">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vToken"/>'#13#10#9#9#9'<VARIABLE NA' +
      'ME="vSecret"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTAN' +
      'T>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowExpression8: TFlowExpression
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
    InputNames = 'FlowLine23'
    OutputNames = 'FlowLine20'
    Description = 'Remove bearer'
    Text = 
      'Trocar Todas as Subseq'#252#234'ncias(JSON - Obter Valor(@vCabecalho,aut' +
      'horization),Bearer ,)'
    ReturnVar = 'vToken'
    Expression = 
      #9'<FUNCTION NAME="Trocar Todas as Subseq'#252#234'ncias" REALNAME="ebfRep' +
      'laceAll">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JSON - Obter Valor" RE' +
      'ALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NA' +
      'ME="vCabecalho"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">aut' +
      'horization</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE">Bearer </CONSTANT>'#13#10#9#9#9'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>' +
      #13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfReplaceAll</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jFunction>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>V' +
      'ariante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vC' +
      'abecalho</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</T' +
      'IPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst' +
      '>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></' +
      'TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29<' +
      '/MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>authorization</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NU' +
      'LO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID>' +
      '</GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9 +
      #9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>' +
      #13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>Beare' +
      'r </VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TO' +
      'bjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NO' +
      'ME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NU' +
      'LO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowEnd8: TFlowEnd
    Left = 76
    Top = 543
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
    InputNames = 'FlowLine11'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"error","msg": "' +
      'Dados n'#227'o informados"}</VALOR>'#13#10#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
      #9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO>'#13#10#9#9'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9'</TObjConst>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"error","msg": "' +
      'Dados n'#227'o informados"}</CONSTANT>'#13#10
    Text = '{"status":"error","msg": "Dados n'#227'o informados"}'
    OutPutParam = 'Variante,    '
  end
  object FlowLine20: TFlowLine
    Left = 265
    Top = 243
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowDecision4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd3: TFlowEnd
    Left = 76
    Top = 393
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
    InputNames = 'FlowLine24'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"error","msg": "' +
      'Token Inv'#225'lido"}</VALOR>'#13#10#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO>'#13#10#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9'</TO' +
      'bjConst>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"error","msg": "' +
      'Token Inv'#225'lido"}</CONSTANT>'#13#10
    Text = '{"status":"error","msg": "Token Inv'#225'lido"}'
    OutPutParam = 'Variante,    '
  end
  object FlowLine11: TFlowLine
    Left = 75
    Top = 542
    Width = 230
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
    InputNames = 'FlowDecision9'
    OutputNames = 'FlowEnd8'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression10: TFlowExpression
    Left = 210
    Top = 609
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
    Description = 'Json criar objeto'
    Text = 'JSON - Criar Objeto(@vCorpo)'
    ReturnVar = 'vCorpo'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar Objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCorpo"/>'#13#10#9#9'</PARAMS>'#13#10#9'<' +
      '/FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9 +
      #9#9'<TEXT>vCorpo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</T' +
      'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine7: TFlowLine
    Left = 265
    Top = 543
    Width = 64
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
    InputNames = 'FlowDecision9'
    OutputNames = 'FlowExpression10'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression11: TFlowExpression
    Left = 210
    Top = 684
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine10'
    Description = 'Obtem codigo do usuario'
    Text = 'JSON - Obter Valor(@vPayload,usrCodigo)'
    ReturnVar = 'vCodigoUsuarioSha1'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vPayload"/>'#13#10#9#9#9'<CONSTANT' +
      ' TYPE="Letras" NULL="FALSE">usrCodigo</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9 +
      '</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9'<TEXT>vPayload</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Varia' +
      'nte</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13 +
      #10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9 +
      #9#9#9'<VALOR>usrCodigo</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9 +
      #9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT' +
      '>'#13#10
  end
  object FlowLine8: TFlowLine
    Left = 265
    Top = 618
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowExpression11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision1: TFlowDecision
    Left = 400
    Top = 683
    Width = 149
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
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine12;FlowLine9'
    Description = 'codigo do usuario  = null ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>vCodigoUsuarioSha1</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inte' +
      'iro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCodigoUsuarioSha1"/>'#13#10#9#9'</PARAMS>'#13#10 +
      #9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine10: TFlowLine
    Left = 340
    Top = 693
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression2: TFlowExpression
    Left = 210
    Top = 10
    Width = 149
    Height = 56
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
    Description = 'Atributo cabe'#231'alho'
    Text = 
      'Resposta Web: Atribuir Valor ao Cabe'#231'alho(Content-Type,applicati' +
      'on/json; charset=UTF-8)'
    Expression = 
      #9'<FUNCTION NAME="Resposta Web: Atribuir Valor ao Cabe'#231'alho" REAL' +
      'NAME="ebfSetHeader">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE">Content-Type</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE">application/json; charset=UTF-8</CONSTANT>'#13#10#9#9'</PARAM' +
      'S>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetHeader</TEXT>'#13#10#9#9'<SQL>FALSE' +
      '</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>Content-Type</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9 +
      #9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>applicat' +
      'ion/json; charset=UTF-8</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 75
    Top = 17
    Width = 230
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine2: TFlowLine
    Left = 265
    Top = 18
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowExpression12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression7: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine22'
    Description = 'Obtendo payload'
    Text = 'JSON - Criar Objeto(JWT - Obter Payload(@vToken,))'
    ReturnVar = 'vPayload'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar Objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JWT - Obter Payload" REALN' +
      'AME="ebfGetPayloadJWT">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vTok' +
      'en"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9 +
      #9#9#9'<TEXT>ebfGetPayloadJWT</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
      'O>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MK' +
      'R_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariab' +
      'le>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>' +
      'vToken</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>' +
      #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9 +
      #9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR' +
      '_VERSION>'#13#10#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9 +
      #9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'<' +
      '/TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine19: TFlowLine
    Left = 265
    Top = 318
    Width = 60
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression7'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine22: TFlowLine
    Left = 265
    Top = 393
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowExpression14'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression16: TFlowExpression
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine23'
    Description = 'Consulta secret'
    Text = 'Campo(Abrir Consulta(SQL CONSULTA,),PGL_JWT_SECRET)'
    ReturnVar = 'vSecret'
    Expression = 
      #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
      '<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13#10 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><P' +
      'SQL>'#13#10#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  SMB_PARAMETROS_GLOBAIS.PGL_JWT' +
      '_SECRET'#13#10'From'#13#10'  SMB_PARAMETROS_GLOBAIS'#13#10#13#10#13#10'/*WHERE_NEW*/'#13#10'/*OR' +
      'DER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9 +
      '</PSQL>'#13#10#9#9#9#9#9'</CONSTANT>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TR' +
      'UE"></CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYP' +
      'E="Campo" NULL="FALSE" INDEX="0">PGL_JWT_SECRET</CONSTANT>'#13#10#9#9'</' +
      'PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
      'EL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
      'Function>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
      'ebfSQLExecuteQuery</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabel' +
      'a</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
      #9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
      #9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13#10#9#9#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</M' +
      'KR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  S' +
      'MB_PARAMETROS_GLOBAIS.PGL_JWT_SECRET'#13#10'From'#13#10'  SMB_PARAMETROS_GLO' +
      'BAIS'#13#10#13#10#13#10'/*WHERE_NEW*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9'<PAR' +
      'AMS>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9#9#9'</VALOR>'#13#10#9#9#9#9#9#9'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj' +
      '0iMS4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIFNNQl9QQVJBTUVUUk' +
      '9TX0dMT0JBSVMuUEdMX0pXVF9TRUNSRVQNCkZyb20NCiAgU01CX1BBUkFNRVRST1' +
      'NfR0xPQkFJUw0KLypXSEVSRV9ORVcqLw0KLypPUkRFUl9ORVcqLw0KPC9TUUw+DQ' +
      'oJPFBBUkFNUz4NCgk8L1BBUkFNUz4NCjwvUk9PVD4NCg==</DIAGRAMXML>'#13#10#9#9#9 +
      #9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9 +
      '<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjCon' +
      'st>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</N' +
      'OME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>L' +
      'etras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<M' +
      'KR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9 +
      #9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9 +
      '<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjCon' +
      'st>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>' +
      '3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>' +
      'PGL_JWT_SECRET</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>' +
      '0</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine23: TFlowLine
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
    InputNames = 'FlowExpression16'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd7: TFlowEnd
    Left = 456
    Top = 787
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
    InputNames = 'FlowLine12'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"error","msg":"E' +
      'rro nos dados informados"}</VALOR>'#13#10#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO>'#13#10#9#9'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"error","msg":"E' +
      'rro nos dados informados"}</CONSTANT>'#13#10
    Text = '{"status":"error","msg":"Erro nos dados informados"}'
    OutPutParam = 'Variante,    '
  end
  object FlowLine12: TFlowLine
    Left = 454
    Top = 723
    Width = 62
    Height = 84
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
    OutputNames = 'FlowEnd7'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine15: TFlowLine
    Left = 75
    Top = 168
    Width = 230
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
    OutputNames = 'FlowExpression16'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression13: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine24'
    Description = 'Define status error'
    Text = 'Resposta Web: Definir Status(403)'
    Expression = 
      #9'<FUNCTION NAME="Resposta Web: Definir Status" REALNAME="ebfSetS' +
      'tatusCode">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE' +
      '">403</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetStatusCode</TEXT>'#13#10#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9'<VALOR>403</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9 +
      #9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT' +
      '>'#13#10
  end
  object FlowLine6: TFlowLine
    Left = 75
    Top = 318
    Width = 230
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression13'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine24: TFlowLine
    Left = 75
    Top = 318
    Width = 40
    Height = 114
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowEnd3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression3: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine21'
    Description = 'Atualizar json retorno'
    Text = 
      'JSON - Criar JSON a Partir dos Elementos(Criar lista a partir do' +
      's Elementos(Criar lista a partir dos Elementos(status,success),C' +
      'riar lista a partir dos Elementos(msg,Requisi'#231#227'o feita com suces' +
      'so!),Criar lista a partir dos Elementos(codPai,@vCodigoChecagem)' +
      '),true)'
    ReturnVar = 'vRetorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar JSON a Partir dos Elementos" REALN' +
      'AME="ebfJSONParamsCreate">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Criar' +
      ' lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elem' +
      'entos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">status</CONSTANT>'#13#10#9#9#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">success</CONSTANT>'#13#10#9#9#9#9#9#9'</P' +
      'ARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a par' +
      'tir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAM' +
      'S>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">msg</CONSTANT>'#13#10 +
      #9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">Requisi'#231#227'o feita com' +
      ' sucesso!</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<F' +
      'UNCTION NAME="Criar lista a partir dos Elementos" REALNAME="ebfL' +
      'istParamsCreate">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE">codPai</CONSTANT>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="vCodigo' +
      'Checagem"/>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="L'#243'gico" NULL="FALSE">true</CON' +
      'STANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfJSONParamsCreate</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9 +
      #9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFu' +
      'nction>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<T' +
      'EXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<T' +
      'IPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13 +
      #10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>' +
      'Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9 +
      #9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>status</V' +
      'ALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID' +
      '>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
      #9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29<' +
      '/MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>success</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<' +
      'NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9 +
      '<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TOb' +
      'jConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFuncti' +
      'on>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>' +
      'ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>' +
      'Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9 +
      #9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TO' +
      'bjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9 +
      #9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letr' +
      'as</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<' +
      'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>msg</VALOR>'#13#10 +
      #9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>' +
      #13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VE' +
      'RSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>Requisi'#231#227'o feita com sucesso!</VALOR>'#13#10#9#9 +
      #9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9 +
      #9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME' +
      '>'#13#10#9#9#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARA' +
      'MS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONST' +
      'ANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
      #9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALO' +
      'R>codPai</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<T' +
      'EXT>vCodigoChecagem</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<T' +
      'IPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariab' +
      'le>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</' +
      'TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTAN' +
      'T</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'g' +
      'ico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>true</VALOR>'#13#10#9#9#9#9'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>' +
      'FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>' +
      #13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13 +
      #10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression5: TFlowExpression
    Left = 400
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
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine13'
    Description = 'Obtem codigo da checagem'
    Text = 'JSON - Obter Valor(@vCorpo,codPai)'
    ReturnVar = 'vCodigoChecagem'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCorpo"/>'#13#10#9#9#9'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE">codPai</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUN' +
      'CTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>3</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9'<TEXT>vCorpo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION' +
      '>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9 +
      #9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<' +
      'VALOR>codPai</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision2: TFlowDecision
    Left = 400
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
    InputNames = 'FlowLine30'
    OutputNames = 'FlowLine29;FlowLine26'
    Description = 'Codigo da soltura nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>vCodigoChecagem</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro' +
      '</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10#9#9'</PARAMS>'#13#10#9'</' +
      'FUNCTION>'#13#10
    Loop = False
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 400
    Top = 158
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
    ChangeDescription = False
    InputNames = 'FlowLine29;FlowLine35'
    OutputNames = 'FlowLine18'
    Description = 'Mobile - Percorre Pendencias - Checagem'
    Id = 2306
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosPendencias</TEXT>'#13#10#9#9'<SQL>F' +
          'ALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariabl' +
          'e>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vCodigoChecagem</TEXT>'#13#10#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosPendencias"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = '@vDadosPendencias'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    Return = 'vRetornoFuncao'
    ObjectName = 'Mobile - Percorre Pendencias - Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine29: TFlowLine
    Left = 455
    Top = 168
    Width = 64
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowSubRoutine1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd1: TFlowEnd
    Left = 1406
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
    InputNames = 'FlowLine66'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vRetorno</TEXT>'#13#10#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</RO' +
      'OT>'#13#10
    Expression = #9'<VARIABLE NAME="vRetorno"/>'#13#10
    Text = '@vRetorno'
    OutPutParam = 'Variante,    '
  end
  object FlowSubRoutine2: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine26'
    OutputNames = 'FlowLine28'
    Description = 'Mobile - Criar Checagem'
    Id = 2304
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'vParametros'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9'<SQL>FAL' +
          'SE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoServidor'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>serCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'vParametros'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosChecagem"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoServidor'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >serCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'vParametros'
        ParamType = ptInput
        Value = '@vDadosChecagem'
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoServidor'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,serCod)'
      end>
    Return = 'vCodigoChecagem'
    ObjectName = 'Mobile - Criar Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine26: TFlowLine
    Left = 455
    Top = 243
    Width = 230
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowSubRoutine2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowConnector1: TFlowConnector
    Left = 650
    Top = 172
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
    InputNames = 'FlowLine28'
    OutputNames = 'FlowLine35'
  end
  object FlowLine28: TFlowLine
    Left = 645
    Top = 167
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
    InputNames = 'FlowSubRoutine2'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine35: TFlowLine
    Left = 455
    Top = 167
    Width = 230
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
    InputNames = 'FlowConnector1'
    OutputNames = 'FlowSubRoutine1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression1: TFlowExpression
    Left = 400
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
    ChangeDescription = True
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine14'
    Description = 'Obtem dados das pendencias'
    Text = 'JSON - Obter Valor(@vCorpo,subMotivos)'
    ReturnVar = 'vDadosPendencias'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCorpo"/>'#13#10#9#9#9'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE">subMotivos</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'<' +
      '/FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS' +
      '>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
      #10#9#9#9#9'<TEXT>vCorpo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras' +
      '</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9 +
      #9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9 +
      '<VALOR>subMotivos</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13 +
      #10
  end
  object FlowLine13: TFlowLine
    Left = 455
    Top = 468
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
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression15: TFlowExpression
    Left = 400
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine16'
    Description = 'Obtem dados da checagem'
    Text = 'JSON - Remover Elemento(@vCorpo,subMotivos)'
    ReturnVar = 'vDadosChecagem'
    Expression = 
      #9'<FUNCTION NAME="JSON - Remover Elemento" REALNAME="ebfJSONRemov' +
      'eElement">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCorpo"/>'#13#10#9#9#9'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE">subMotivos</CONSTANT>'#13#10#9#9'</PARAMS>' +
      #13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfJSONRemoveElement</TEXT>'#13#10#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9'<TEXT>vCorpo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION' +
      '>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9 +
      #9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<' +
      'VALOR>subMotivos</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine14: TFlowLine
    Left = 455
    Top = 393
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression15'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine3: TFlowSubRoutine
    Left = 400
    Top = 608
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
    OutputNames = 'FlowLine17'
    Description = 'Mobile - Obtem dados do usuario'
    Id = 2307
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'vCodigo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vCodigoUsuarioSha1</TEXT>'#13#10#9#9'<SQL' +
          '>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INC' +
          'OMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariab' +
          'le>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'vCodigo'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vCodigoUsuarioSha1"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'vCodigo'
        ParamType = ptInput
        Value = '@vDadosUsuarioSha1'
      end>
    Return = 'vDadosUsuario'
    ObjectName = 'Mobile - Consulta Codigo Usuario'
    RealName = 'CALLRULE'
  end
  object FlowLine9: TFlowLine
    Left = 454
    Top = 648
    Width = 65
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
    OutputNames = 'FlowSubRoutine3'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine17: TFlowLine
    Left = 455
    Top = 543
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
    InputNames = 'FlowSubRoutine3'
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine18: TFlowLine
    Left = 455
    Top = 93
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine4: TFlowSubRoutine
    Left = 400
    Top = 8
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
    ChangeDescription = False
    InputNames = 'FlowLine21'
    OutputNames = 'FlowLine25'
    Description = 'Mobile - Filtra Totalizadores Checagem'
    Id = 2308
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE<' +
          '/INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS' +
          '>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
          #10#9#9#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
          'O>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObj' +
          'Const>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></T' +
          'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMP' +
          'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERS' +
          'ION>'#13#10#9#9#9#9'<VALOR>autorizatario</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</D' +
          'MLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
          #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFuncti' +
          'on>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
          'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13#10#9#9#9'<CO' +
          'NSTANT TYPE="Letras" NULL="FALSE">autorizatario</CONSTANT>'#13#10#9#9'</' +
          'PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,autorizatario)'
      end>
    Return = 'vTotalizadores'
    ObjectName = 'Mobile - Filtra Totalizadores Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine21: TFlowLine
    Left = 455
    Top = 18
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowSubRoutine4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
    Left = 590
    Top = 9
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
    InputNames = 'FlowLine25'
    OutputNames = 'FlowLine27'
    Description = 'Adiciona totalizadores ao retorno'
    Text = 'JSON - Atualizar Valor(@vRetorno,totalizadores,@vTotalizadores)'
    ReturnVar = 'vRetorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Atualizar Valor" REALNAME="ebfUpdateValu' +
      'eObjectJson">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vRetorno"/>'#13#10#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">totalizadores</CONSTANT>'#13#10#9#9#9 +
      '<VARIABLE NAME="vTotalizadores"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfUpdateValueObjectJson</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRU' +
      'E</INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARA' +
      'MS>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME' +
      '>'#13#10#9#9#9#9'<TEXT>vRetorno</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>totalizadores</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>4</ID' +
      '>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>vTotalizadores</TEXT>'#13#10#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13 +
      #10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine25: TFlowLine
    Left = 455
    Top = 18
    Width = 230
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
    InputNames = 'FlowSubRoutine4'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
    Left = 400
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
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine30;FlowLine31'
    Description = 'Option = checagem?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vDadosC' +
      'hecagem</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>option</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE' +
      '</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13 +
      #10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PAR' +
      'AMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<N' +
      'OME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>c</VALOR>'#13#10#9#9 +
      #9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9 +
      #9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID' +
      '></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</' +
      'PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13#10#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">option</CONSTANT>'#13#10#9#9#9#9'</PARA' +
      'MS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">c</' +
      'CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine16: TFlowLine
    Left = 455
    Top = 318
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
    InputNames = 'FlowExpression15'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine30: TFlowLine
    Left = 455
    Top = 243
    Width = 60
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowDecision2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowDecision5: TFlowDecision
    Left = 780
    Top = 383
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
    InputNames = 'FlowLine32'
    OutputNames = 'FlowLine36;FlowLine34'
    Description = 'Option = finalizar?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vDadosC' +
      'hecagem</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>option</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE' +
      '</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13 +
      #10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PAR' +
      'AMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<N' +
      'OME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>f</VALOR>'#13#10#9#9 +
      #9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9 +
      #9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID' +
      '></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</' +
      'PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13#10#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">option</CONSTANT>'#13#10#9#9#9#9'</PARA' +
      'MS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">f</' +
      'CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowDecision6: TFlowDecision
    Left = 590
    Top = 383
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
    InputNames = 'FlowLine41'
    OutputNames = 'FlowLine32;FlowLine33'
    Description = 'Option = checagem complementar?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vDadosC' +
      'hecagem</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>option</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE' +
      '</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13 +
      #10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PAR' +
      'AMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<N' +
      'OME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>cc</VALOR>'#13#10#9 +
      #9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9 +
      #9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUI' +
      'D></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'<' +
      '/PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13#10#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">option</CONSTANT>'#13#10#9#9#9#9'</PARA' +
      'MS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cc<' +
      '/CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine32: TFlowLine
    Left = 645
    Top = 393
    Width = 230
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowDecision5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd2: TFlowEnd
    Left = 646
    Top = 693
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
    InputNames = 'FlowLine67'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfJSONParamsCreat' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>e' +
      'bfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.29</MKR_VERSION>'#13#10'<VALOR>status</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10 +
      '<VALOR>success</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.29</MKR_VERSION>'#13#10'<VALOR>msg</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<T' +
      'EXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VA' +
      'LOR>Requisi&#231;&#227;o&#x20;feita&#x20;com&#x20;sucesso!</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfL' +
      'istParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION' +
      '>'#13#10'<VALOR>codPai</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChe' +
      'cagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<' +
      '/TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VAL' +
      'OR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;JSON&#x20;a&#x20;Par' +
      'tir&#x20;dos&#x20;Elementos" REALNAME="ebfJSONParamsCreate">'#13#10'<P' +
      'ARAMS>'#13#10'<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20' +
      ';dos&#x20;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x2' +
      '0;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  >status</CONSTANT>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >success</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;do' +
      's&#x20;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >msg</CONSTANT>'#13#10'<CONSTANT TY' +
      'PE="Letras" NULL="FALSE"  >Requisi&#231;&#227;o&#x20;feita&#x20;' +
      'com&#x20;sucesso!</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Elemento' +
      's" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Le' +
      'tras" NULL="FALSE"  >codPai</CONSTANT>'#13#10'<VARIABLE NAME="vCodigoC' +
      'hecagem"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CON' +
      'STANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'
    Text = 
      'JSON - Criar JSON a Partir dos Elementos(Criar lista a partir do' +
      's Elementos(Criar lista a partir dos Elementos(status,success),C' +
      'riar lista a partir dos Elementos(msg,Requisi'#231#227'o feita com suces' +
      'so!),Criar lista a partir dos Elementos(codPai,@vCodigoChecagem)' +
      '),true)'
    OutPutParam = 'Variante,    '
  end
  object FlowEnd5: TFlowEnd
    Left = 1026
    Top = 393
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
    InputNames = 'FlowLine36;FlowLine53'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"error", "msg":"' +
      'nenhuma op'#231#227'o v'#225'lida foi informada!"}</VALOR>'#13#10#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO>'#13 +
      #10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"error", "msg":"' +
      'nenhuma op'#231#227'o v'#225'lida foi informada!"}</CONSTANT>'#13#10
    Text = '{"status":"error", "msg":"nenhuma op'#231#227'o v'#225'lida foi informada!"}'
    OutPutParam = 'Variante,    '
  end
  object FlowLine36: TFlowLine
    Left = 835
    Top = 392
    Width = 230
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowEnd5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision7: TFlowDecision
    Left = 780
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
    InputNames = 'FlowLine40'
    OutputNames = 'FlowLine37;FlowLine44'
    Description = 'Codigo da soltura nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>vCodigoChecagem</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro' +
      '</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10#9#9'</PARAMS>'#13#10#9'</' +
      'FUNCTION>'#13#10
    Loop = False
  end
  object FlowSubRoutine5: TFlowSubRoutine
    Left = 780
    Top = 83
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
    ChangeDescription = False
    InputNames = 'FlowLine39'
    OutputNames = 'FlowLine38'
    Description = 'Mobile - Criar Checagem'
    Id = 2304
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'vParametros'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9'<SQL>FAL' +
          'SE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoServidor'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>serCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'vParametros'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosChecagem"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoServidor'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >serCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'vParametros'
        ParamType = ptInput
        Value = '@vDadosChecagem'
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoServidor'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,serCod)'
      end>
    Return = 'vCodigoChecagem'
    ObjectName = 'Mobile - Criar Checagem'
    RealName = 'CALLRULE'
  end
  object FlowExpression17: TFlowExpression
    Left = 780
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
    InputNames = 'FlowLine37'
    OutputNames = 'FlowLine39'
    Description = 'Atualiza status para finalizado'
    Text = 
      'JSON - Atualizar Valor(@vDadosChecagem,status,JSON - Criar Objet' +
      'o({"cod":1}))'
    ReturnVar = 'vDadosChecagem'
    Expression = 
      #9'<FUNCTION NAME="JSON - Atualizar Valor" REALNAME="ebfUpdateValu' +
      'eObjectJson">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13 +
      #10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">status</CONSTANT>'#13#10#9#9#9'<' +
      'FUNCTION NAME="JSON - Criar Objeto" REALNAME="ebfCreateObjectJSO' +
      'N">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">{"c' +
      'od":1}</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9 +
      '</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfUpdateValueObjectJson</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PAR' +
      'AMS>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOM' +
      'E>'#13#10#9#9#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<' +
      'TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<T' +
      'ObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT>' +
      '</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_V' +
      'ERSION>'#13#10#9#9#9#9'<VALOR>status</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>4</' +
      'ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfCreateObjectJSON</T' +
      'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VE' +
      'RSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9 +
      '<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR' +
      '>{"cod":1}</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction' +
      '>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine37: TFlowLine
    Left = 835
    Top = 168
    Width = 60
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowExpression17'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine39: TFlowLine
    Left = 835
    Top = 93
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
    InputNames = 'FlowExpression17'
    OutputNames = 'FlowSubRoutine5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector2: TFlowConnector
    Left = 650
    Top = 322
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
    InputNames = 'FlowLine31'
    OutputNames = 'FlowLine41'
  end
  object FlowLine31: TFlowLine
    Left = 455
    Top = 317
    Width = 230
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowConnector2'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine41: TFlowLine
    Left = 645
    Top = 317
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
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowDecision6'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowSubRoutine6: TFlowSubRoutine
    Left = 970
    Top = 83
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
    ChangeDescription = False
    InputNames = 'FlowLine38;FlowLine46'
    OutputNames = 'FlowLine42'
    Description = 'Mobile - Filtra Totalizadores Checagem'
    Id = 2308
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE<' +
          '/INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS' +
          '>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
          #10#9#9#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
          'O>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObj' +
          'Const>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></T' +
          'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMP' +
          'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERS' +
          'ION>'#13#10#9#9#9#9'<VALOR>autorizatario</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</D' +
          'MLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
          #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFuncti' +
          'on>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
          'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13#10#9#9#9'<CO' +
          'NSTANT TYPE="Letras" NULL="FALSE">autorizatario</CONSTANT>'#13#10#9#9'</' +
          'PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,autorizatario)'
      end>
    Return = 'vTotalizadores'
    ObjectName = 'Mobile - Filtra Totalizadores Checagem'
    RealName = 'CALLRULE'
  end
  object FlowExpression19: TFlowExpression
    Left = 1160
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
    InputNames = 'FlowLine42'
    OutputNames = 'FlowLine43'
    Description = 'Adiciona totalizadores ao retorno'
    Text = 'JSON - Atualizar Valor(@vRetorno,totalizadores,@vTotalizadores)'
    ReturnVar = 'vRetorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Atualizar Valor" REALNAME="ebfUpdateValu' +
      'eObjectJson">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vRetorno"/>'#13#10#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">totalizadores</CONSTANT>'#13#10#9#9#9 +
      '<VARIABLE NAME="vTotalizadores"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfUpdateValueObjectJson</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRU' +
      'E</INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARA' +
      'MS>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME' +
      '>'#13#10#9#9#9#9'<TEXT>vRetorno</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>totalizadores</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID' +
      '>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>vTotalizadores</TEXT>'#13#10#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13 +
      #10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine42: TFlowLine
    Left = 1025
    Top = 93
    Width = 230
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
    InputNames = 'FlowSubRoutine6'
    OutputNames = 'FlowExpression19'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine7: TFlowSubRoutine
    Left = 970
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
    ChangeDescription = False
    InputNames = 'FlowLine44'
    OutputNames = 'FlowLine45'
    Description = 'Mobile - Atualizar Status Checagem'
    Id = 2312
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vCodigoChecagem</TEXT>'#13#10#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDadosChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9'<SQL>FAL' +
          'SE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDadosChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosChecagem"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end
      item
        DataType = ftString
        Name = 'pDadosChecagem'
        ParamType = ptInput
        Value = '@vDadosChecagem'
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end>
    Return = 'vRetornoFuncao'
    ObjectName = 'Mobile - Atualizar Status Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine44: TFlowLine
    Left = 835
    Top = 243
    Width = 230
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowSubRoutine7'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine38: TFlowLine
    Left = 835
    Top = 93
    Width = 230
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
    InputNames = 'FlowSubRoutine5'
    OutputNames = 'FlowSubRoutine6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression18: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine34'
    OutputNames = 'FlowLine40'
    Description = 'Atualizar json retorno'
    Text = 
      'JSON - Criar JSON a Partir dos Elementos(Criar lista a partir do' +
      's Elementos(Criar lista a partir dos Elementos(status,success),C' +
      'riar lista a partir dos Elementos(msg,Requisi'#231#227'o feita com suces' +
      'so!)),true)'
    ReturnVar = 'vRetorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar JSON a Partir dos Elementos" REALN' +
      'AME="ebfJSONParamsCreate">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Criar' +
      ' lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elem' +
      'entos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">status</CONSTANT>'#13#10#9#9#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">success</CONSTANT>'#13#10#9#9#9#9#9#9'</P' +
      'ARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a par' +
      'tir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAM' +
      'S>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">msg</CONSTANT>'#13#10 +
      #9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">Requisi'#231#227'o feita com' +
      ' sucesso!</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</P' +
      'ARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="L'#243'gico" NULL="FALSE">' +
      'true</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfJSONParamsCreate</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9 +
      #9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFu' +
      'nction>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<T' +
      'EXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<T' +
      'IPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13 +
      #10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>' +
      'Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9 +
      #9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>status</V' +
      'ALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID' +
      '>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
      #9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29<' +
      '/MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>success</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<' +
      'NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9 +
      '<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TOb' +
      'jConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFuncti' +
      'on>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>' +
      'ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>' +
      'Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9 +
      #9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TO' +
      'bjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9 +
      #9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letr' +
      'as</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<' +
      'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>msg</VALOR>'#13#10 +
      #9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>' +
      #13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VE' +
      'RSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>Requisi'#231#227'o feita com sucesso!</VALOR>'#13#10#9#9 +
      #9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9 +
      #9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>' +
      #13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>true<' +
      '/VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjC' +
      'onst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine34: TFlowLine
    Left = 835
    Top = 318
    Width = 60
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression18'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine40: TFlowLine
    Left = 835
    Top = 243
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
    InputNames = 'FlowExpression18'
    OutputNames = 'FlowDecision7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression20: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine45'
    OutputNames = 'FlowLine46'
    Description = 'Atualiza valor de status'
    Text = 
      'JSON - Atualizar Valor(JSON - Atualizar Valor(@vRetorno,status,J' +
      'SON - Obter Valor(@vRetornoFuncao,status)),msg,JSON - Obter Valo' +
      'r(@vRetornoFuncao,msg))'
    ReturnVar = 'vRetorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Atualizar Valor" REALNAME="ebfUpdateValu' +
      'eObjectJson">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JSON - Atualizar V' +
      'alor" REALNAME="ebfUpdateValueObjectJson">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<' +
      'VARIABLE NAME="vRetorno"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">status</CONSTANT>'#13#10#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor' +
      '" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VAR' +
      'IABLE NAME="vRetornoFuncao"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE">status</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13 +
      #10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL=' +
      '"FALSE">msg</CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="JSON - Obter Valor" R' +
      'EALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE N' +
      'AME="vRetornoFuncao"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '">msg</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'<' +
      '/FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfUpdateValueObjectJson</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRU' +
      'E</INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARA' +
      'MS>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME' +
      '>'#13#10#9#9#9#9'<TEXT>ebfUpdateValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9 +
      #9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>' +
      #13#10#9#9#9#9#9#9'<TEXT>vRetorno</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TI' +
      'PO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9 +
      #9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9 +
      #9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</T' +
      'IPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>status</VALOR>'#13#10#9#9#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
      #9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<' +
      'GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjCons' +
      't>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION<' +
      '/NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9 +
      #9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<' +
      'NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>vRetornoFuncao</TEXT>'#13#10#9#9#9#9#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR' +
      '_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<' +
      'ID>6</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13 +
      #10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.2' +
      '9</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>status</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9 +
      '<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9 +
      #9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TO' +
      'bjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10 +
      #9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CO' +
      'NSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
      'O>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MK' +
      'R_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>msg</VALOR>'#13#10#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<N' +
      'ULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></G' +
      'UID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObj' +
      'Function>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
      'ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Va' +
      'riante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vR' +
      'etornoFuncao</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>L'#243'gico<' +
      '/TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjCon' +
      'st>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT>' +
      '</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.2' +
      '9</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>msg</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE' +
      '</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13 +
      #10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PAR' +
      'AMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>' +
      #13#10
  end
  object FlowLine45: TFlowLine
    Left = 1025
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
    InputNames = 'FlowSubRoutine7'
    OutputNames = 'FlowExpression20'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine46: TFlowLine
    Left = 1025
    Top = 93
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
    InputNames = 'FlowExpression20'
    OutputNames = 'FlowSubRoutine6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine8: TFlowSubRoutine
    Left = 590
    Top = 533
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
    ChangeDescription = False
    InputNames = 'FlowLine48'
    OutputNames = 'FlowLine47'
    Description = 'Mobile - Salvar Pendencias/Liberacoes'
    Id = 2329
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosPendencias</TEXT>'#13#10#9#9'<SQL>F' +
          'ALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariabl' +
          'e>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vCodigoChecagem</TEXT>'#13#10#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosPendencias"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = '@vDadosPendencias'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    Return = 'vRetornoFuncao'
    ObjectName = 'Mobile - Salvar Pendencias/Liberacoes'
    RealName = 'CALLRULE'
  end
  object FlowDecision8: TFlowDecision
    Left = 590
    Top = 458
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
    InputNames = 'FlowLine33'
    OutputNames = 'FlowLine48;FlowLine49'
    Description = 'Acao = Salvar?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '29</MKR_VERSION>'#13#10'<VALOR>acao</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.29</MKR_VERSION>'#13#10'<VALOR>s</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >acao</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >s</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine33: TFlowLine
    Left = 645
    Top = 393
    Width = 60
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowDecision8'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine48: TFlowLine
    Left = 645
    Top = 498
    Width = 60
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
    InputNames = 'FlowDecision8'
    OutputNames = 'FlowSubRoutine8'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowDecision10: TFlowDecision
    Left = 780
    Top = 458
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
    InputNames = 'FlowLine49'
    OutputNames = 'FlowLine51;FlowLine50'
    Description = 'Acao = Finalizar?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '29</MKR_VERSION>'#13#10'<VALOR>acao</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.29</MKR_VERSION>'#13#10'<VALOR>f</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >acao</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >f</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine49: TFlowLine
    Left = 645
    Top = 468
    Width = 230
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
    InputNames = 'FlowDecision8'
    OutputNames = 'FlowDecision10'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine9: TFlowSubRoutine
    Left = 970
    Top = 533
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
    ChangeDescription = False
    InputNames = 'FlowLine54'
    OutputNames = 'FlowLine52'
    Description = 'Mobile - Atualizar Status Checagem'
    Id = 2312
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vCodigoChecagem</TEXT>'#13#10#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDadosChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9'<SQL>FAL' +
          'SE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDadosChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosChecagem"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end
      item
        DataType = ftString
        Name = 'pDadosChecagem'
        ParamType = ptInput
        Value = '@vDadosChecagem'
      end
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end>
    Return = 'vRetornoFuncao'
    ObjectName = 'Mobile - Atualizar Status Checagem'
    RealName = 'CALLRULE'
  end
  object FlowExpression21: TFlowExpression
    Left = 970
    Top = 609
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
    InputNames = 'FlowLine52'
    OutputNames = 'FlowLine55'
    Description = 'Atualiza valor de status'
    Text = 
      'JSON - Criar JSON a Partir dos Elementos(Criar lista a partir do' +
      's Elementos(Criar lista a partir dos Elementos(status,JSON - Obt' +
      'er Valor(@vRetornoFuncao,status)),Criar lista a partir dos Eleme' +
      'ntos(msg,JSON - Obter Valor(@vRetornoFuncao,msg)),true))'
    ReturnVar = 'vRetorno'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;JSON&#x20;a&#x20;Par' +
      'tir&#x20;dos&#x20;Elementos" REALNAME="ebfJSONParamsCreate">'#13#10'<P' +
      'ARAMS>'#13#10'<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20' +
      ';dos&#x20;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x2' +
      '0;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  >status</CONSTANT>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vRetornoFuncao"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >status</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Criar&#x20;lista&' +
      '#x20;a&#x20;partir&#x20;dos&#x20;Elementos" REALNAME="ebfListPar' +
      'amsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >ms' +
      'g</CONSTANT>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor"' +
      ' REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vR' +
      'etornoFuncao"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >msg</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfJSONParamsCreat' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MK' +
      'R_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION' +
      '</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.29</MKR_VERSION>'#13#10'<VALOR>status</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME' +
      '>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>V' +
      'ariante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>7</ID>'#13#10'<' +
      'NOME>VARIABLE</NOME>'#13#10'<TEXT>vRetornoFuncao</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>status</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>msg</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10 +
      '<NOME>VARIABLE</NOME>'#13#10'<TEXT>vRetornoFuncao</TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>msg</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13 +
      #10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowLine52: TFlowLine
    Left = 1025
    Top = 573
    Width = 40
    Height = 56
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
    InputNames = 'FlowSubRoutine9'
    OutputNames = 'FlowExpression21'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine10: TFlowSubRoutine
    Left = 780
    Top = 533
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
    ChangeDescription = False
    InputNames = 'FlowLine50'
    OutputNames = 'FlowLine54'
    Description = 'Mobile - Salvar Pendencias/Liberacoes'
    Id = 2329
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vDadosPendencias</TEXT>'#13#10#9#9'<SQL>F' +
          'ALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariabl' +
          'e>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vCodigoChecagem</TEXT>'#13#10#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vDadosPendencias"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vCodigoChecagem"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pDados'
        ParamType = ptInput
        Value = '@vDadosPendencias'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    Return = 'vRetornoFuncao'
    ObjectName = 'Mobile - Salvar Pendencias/Liberacoes'
    RealName = 'CALLRULE'
  end
  object FlowLine54: TFlowLine
    Left = 910
    Top = 544
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
    InputNames = 'FlowSubRoutine10'
    OutputNames = 'FlowSubRoutine9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector3: TFlowConnector
    Left = 1030
    Top = 472
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
    InputNames = 'FlowLine51'
    OutputNames = 'FlowLine53'
  end
  object FlowLine51: TFlowLine
    Left = 835
    Top = 467
    Width = 230
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
    InputNames = 'FlowDecision10'
    OutputNames = 'FlowConnector3'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine53: TFlowLine
    Left = 1025
    Top = 392
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
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowEnd5'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowEnd6: TFlowEnd
    Left = 646
    Top = 768
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
    InputNames = 'FlowLine64'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfUpdateValueObje' +
      'ctJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<T' +
      'EXT>vRetorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VER' +
      'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VER' +
      'SION>'#13#10'<VALOR>codStatus</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>1</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Atualizar&#x20;Valor" REALNAME=' +
      '"ebfUpdateValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vRetorno"' +
      '/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >codStatus</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >1</CONSTANT>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'
    Text = 'JSON - Atualizar Valor(@vRetorno,codStatus,1)'
    OutPutParam = 'Variante,    '
  end
  object FlowSubRoutine11: TFlowSubRoutine
    Left = 780
    Top = 608
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
    ChangeDescription = False
    InputNames = 'FlowLine55'
    OutputNames = 'FlowLine56'
    Description = 'Mobile - Filtra Totalizadores Checagem'
    Id = 2308
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE<' +
          '/INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS' +
          '>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
          #10#9#9#9#9'<TEXT>vDadosChecagem</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
          'O>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObj' +
          'Const>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></T' +
          'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMP' +
          'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERS' +
          'ION>'#13#10#9#9#9#9'<VALOR>autorizatario</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</D' +
          'MLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
          #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFuncti' +
          'on>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
          'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="vDadosChecagem"/>'#13#10#9#9#9'<CO' +
          'NSTANT TYPE="Letras" NULL="FALSE">autorizatario</CONSTANT>'#13#10#9#9'</' +
          'PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,autorizatario)'
      end>
    Return = 'vTotalizadores'
    ObjectName = 'Mobile - Filtra Totalizadores Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine55: TFlowLine
    Left = 910
    Top = 618
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
    InputNames = 'FlowExpression21'
    OutputNames = 'FlowSubRoutine11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression22: TFlowExpression
    Left = 780
    Top = 684
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
    InputNames = 'FlowLine56'
    OutputNames = 'FlowLine57'
    Description = 'Adiciona totalizadores ao retorno'
    Text = 
      'JSON - Atualizar Valor(JSON - Atualizar Valor(@vRetorno,totaliza' +
      'dores,@vTotalizadores),codPai,@vCodigoChecagem)'
    ReturnVar = 'vRetorno'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Atualizar&#x20;Valor" REALNAME=' +
      '"ebfUpdateValueObjectJson">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20' +
      ';-&#x20;Atualizar&#x20;Valor" REALNAME="ebfUpdateValueObjectJson' +
      '">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vRetorno"/>'#13#10'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE"  >totalizadores</CONSTANT>'#13#10'<VARIABLE NAME="vTot' +
      'alizadores"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE"  >codPai</CONSTANT>'#13#10'<VARIABLE NAME="vCodigoChecagem' +
      '"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfUpdateValueObje' +
      'ctJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfUpdateValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Vari' +
      'ante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOM' +
      'E>VARIABLE</NOME>'#13#10'<TEXT>vRetorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>totalizadores</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VAR' +
      'IABLE</NOME>'#13#10'<TEXT>vTotalizadores</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>' +
      'codPai</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVariable' +
      '>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVaria' +
      'ble>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine56: TFlowLine
    Left = 835
    Top = 648
    Width = 40
    Height = 56
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
    InputNames = 'FlowSubRoutine11'
    OutputNames = 'FlowExpression22'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine50: TFlowLine
    Left = 835
    Top = 498
    Width = 60
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
    InputNames = 'FlowDecision10'
    OutputNames = 'FlowSubRoutine10'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowDecision11: TFlowDecision
    Left = 970
    Top = 683
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
    InputNames = 'FlowLine57'
    OutputNames = 'FlowLine59;FlowLine58'
    Description = 'Checagem de Soltura?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '29</MKR_VERSION>'#13#10'<VALOR>chkSoltura</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >chkSoltura</CONSTANT>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true<' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine57: TFlowLine
    Left = 910
    Top = 693
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
    InputNames = 'FlowExpression22'
    OutputNames = 'FlowDecision11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine12: TFlowSubRoutine
    Left = 1160
    Top = 683
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
    ChangeDescription = False
    InputNames = 'FlowLine59'
    OutputNames = 'FlowLine60'
    Description = 'Mobile - Obter Status Soltura'
    Id = 2347
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoSoltura'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>solturaCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
          #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
          '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
          'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoSoltura'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >solturaCod</CONSTANT>'#13 +
          #10'</PARAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoSoltura'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,solturaCod)'
      end>
    Return = 'vStatusSoltura'
    ObjectName = 'Mobile - Obter Status Soltura'
    RealName = 'CALLRULE'
  end
  object FlowLine59: TFlowLine
    Left = 1100
    Top = 694
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
    InputNames = 'FlowDecision11'
    OutputNames = 'FlowSubRoutine12'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowEnd4: TFlowEnd
    Left = 1406
    Top = 693
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
    InputNames = 'FlowLine65'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfUpdateValueObje' +
      'ctJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<T' +
      'EXT>vRetorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VER' +
      'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VER' +
      'SION>'#13#10'<VALOR>codStatus</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vSt' +
      'atusSoltura</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSI' +
      'ON>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Atualizar&#x20;Valor" REALNAME=' +
      '"ebfUpdateValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vRetorno"' +
      '/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >codStatus</CONSTANT>'#13 +
      #10'<VARIABLE NAME="vStatusSoltura"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Text = 'JSON - Atualizar Valor(@vRetorno,codStatus,@vStatusSoltura)'
    OutPutParam = 'Variante,    '
  end
  object FlowSubRoutine13: TFlowSubRoutine
    Left = 1159
    Top = 8
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
    ChangeDescription = False
    InputNames = 'FlowLine43;FlowLine27'
    OutputNames = 'FlowLine61'
    Description = 'Mobile - Atualiza Dados Firebase - Checagem'
    Id = 2348
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>cod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
          'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
          'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
          #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>autorizatario</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
          'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
          '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
          'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTAN' +
          'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'<VALOR>garagem</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTAN' +
          'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'<VALOR>veiculo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
          '>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
          '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.2' +
          '9</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VAR' +
          'IABLE</NOME>'#13#10'<TEXT>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
          'PO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1' +
          '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
          'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>status</VALOR>'#13#10'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
          '<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
          'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
          'R_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>dateTime</VALOR>'#13#10'<DMLT' +
          'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
          'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT' +
          '>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >cod</CONSTANT>'#13#10'</PARA' +
          'MS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >autorizatario</CONSTAN' +
          'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >garagem</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >veiculo</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20' +
          ';Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10 +
          '<VARIABLE NAME="vDadosChecagem"/>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
          '"FALSE"  >status</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >dateTime</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
          'NCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,cod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,autorizatario)'
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,garagem)'
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,veiculo)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          'JSON - Obter Valor(JSON - Obter Valor(@vDadosChecagem,status),da' +
          'teTime)'
      end>
    ObjectName = 'Mobile - Atualiza Dados Firebase - Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine43: TFlowLine
    Left = 1214
    Top = 48
    Width = 41
    Height = 56
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
    InputNames = 'FlowExpression19'
    OutputNames = 'FlowSubRoutine13'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine27: TFlowLine
    Left = 720
    Top = 18
    Width = 459
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowSubRoutine13'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine14: TFlowSubRoutine
    Left = 970
    Top = 758
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
    ChangeDescription = False
    InputNames = 'FlowLine58'
    OutputNames = 'FlowLine62'
    Description = 'Mobile - Atualiza Dados Firebase - Checagem'
    Id = 2348
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>cod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
          'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
          'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
          #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>autorizatario</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
          'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
          '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
          'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>garagem</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
          'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
          'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTAN' +
          'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'<VALOR>veiculo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
          '>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
          '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.2' +
          '9</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VAR' +
          'IABLE</NOME>'#13#10'<TEXT>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
          'PO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1' +
          '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
          'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>status</VALOR>'#13#10'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
          '<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
          'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
          'R_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>dateTime</VALOR>'#13#10'<DMLT' +
          'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
          'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT' +
          '>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >cod</CONSTANT>'#13#10'</PARA' +
          'MS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >autorizatario</CONSTAN' +
          'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >garagem</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >veiculo</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20' +
          ';Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10 +
          '<VARIABLE NAME="vDadosChecagem"/>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
          '"FALSE"  >status</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >dateTime</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
          'NCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,cod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,autorizatario)'
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,garagem)'
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,veiculo)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          'JSON - Obter Valor(JSON - Obter Valor(@vDadosChecagem,status),da' +
          'teTime)'
      end>
    ObjectName = 'Mobile - Atualiza Dados Firebase - Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine58: TFlowLine
    Left = 1025
    Top = 723
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
    InputNames = 'FlowDecision11'
    OutputNames = 'FlowSubRoutine14'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine15: TFlowSubRoutine
    Left = 1160
    Top = 758
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
    ChangeDescription = False
    InputNames = 'FlowLine60'
    OutputNames = 'FlowLine63'
    Description = 'Mobile - Atualiza Dados Firebase - Checagem'
    Id = 2348
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>cod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
          'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
          'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
          #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>autorizatario</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
          'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
          '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
          'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_' +
          'VERSION>'#13#10'<VALOR>garagem</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
          'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
          'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTAN' +
          'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_V' +
          'ERSION>'#13#10'<VALOR>veiculo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
          '>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
          '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.2' +
          '9</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VAR' +
          'IABLE</NOME>'#13#10'<TEXT>vDadosChecagem</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
          'PO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1' +
          '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
          'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>status</VALOR>'#13#10'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
          '<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
          'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
          'R_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>dateTime</VALOR>'#13#10'<DMLT' +
          'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
          'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT' +
          '>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >cod</CONSTANT>'#13#10'</PARA' +
          'MS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >autorizatario</CONSTAN' +
          'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >garagem</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosChecagem"/' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >veiculo</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20' +
          ';Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10 +
          '<VARIABLE NAME="vDadosChecagem"/>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
          '"FALSE"  >status</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >dateTime</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
          'NCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoVeiculo'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,cod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoAutorizatario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,autorizatario)'
      end
      item
        DataType = ftString
        Name = 'pCodigoGaragem'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,garagem)'
      end
      item
        DataType = ftString
        Name = 'pCodigoOrdem'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosChecagem,veiculo)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end
      item
        DataType = ftString
        Name = 'pDataFormatada'
        ParamType = ptInput
        Value = 
          'JSON - Obter Valor(JSON - Obter Valor(@vDadosChecagem,status),da' +
          'teTime)'
      end>
    ObjectName = 'Mobile - Atualiza Dados Firebase - Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine60: TFlowLine
    Left = 1215
    Top = 723
    Width = 40
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
    InputNames = 'FlowSubRoutine12'
    OutputNames = 'FlowSubRoutine15'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine18: TFlowSubRoutine
    Left = 1350
    Top = 8
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
    ChangeDescription = False
    InputNames = 'FlowLine61'
    OutputNames = 'FlowLine66'
    Description = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    Id = 2352
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    ObjectName = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine61: TFlowLine
    Left = 1289
    Top = 19
    Width = 81
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowSubRoutine13'
    OutputNames = 'FlowSubRoutine18'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine66: TFlowLine
    Left = 1405
    Top = 48
    Width = 40
    Height = 65
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowSubRoutine18'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine17: TFlowSubRoutine
    Left = 1350
    Top = 758
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
    ChangeDescription = False
    InputNames = 'FlowLine63'
    OutputNames = 'FlowLine65'
    Description = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    Id = 2352
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    ObjectName = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine63: TFlowLine
    Left = 1290
    Top = 769
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
    InputNames = 'FlowSubRoutine15'
    OutputNames = 'FlowSubRoutine17'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine65: TFlowLine
    Left = 1405
    Top = 711
    Width = 40
    Height = 67
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowSubRoutine17'
    OutputNames = 'FlowEnd4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine16: TFlowSubRoutine
    Left = 780
    Top = 758
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
    ChangeDescription = False
    InputNames = 'FlowLine62'
    OutputNames = 'FlowLine64'
    Description = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    Id = 2352
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    ObjectName = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine62: TFlowLine
    Left = 910
    Top = 769
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
    InputNames = 'FlowSubRoutine14'
    OutputNames = 'FlowSubRoutine16'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine64: TFlowLine
    Left = 664
    Top = 768
    Width = 136
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowSubRoutine16'
    OutputNames = 'FlowEnd6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine20: TFlowSubRoutine
    Left = 590
    Top = 608
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
    ChangeDescription = False
    InputNames = 'FlowLine47'
    OutputNames = 'FlowLine67'
    Description = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    Id = 2352
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'vDadosUsuario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT' +
          '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VE' +
          'RSION>'#13#10'<VALOR>usrCod</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vCodigoChecagem</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVar' +
          'iable>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDadosUsuario"/>' +
          #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >usrCod</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vCodigoChecagem"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCodigoUsuario'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@vDadosUsuario,usrCod)'
      end
      item
        DataType = ftString
        Name = 'pCodigoChecagem'
        ParamType = ptInput
        Value = '@vCodigoChecagem'
      end>
    ObjectName = 'Mobile - Remove Sinal Vermelho - Semafaro Checagem'
    RealName = 'CALLRULE'
  end
  object FlowLine47: TFlowLine
    Left = 645
    Top = 543
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
    InputNames = 'FlowSubRoutine8'
    OutputNames = 'FlowSubRoutine20'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine67: TFlowLine
    Left = 645
    Top = 618
    Width = 40
    Height = 114
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowSubRoutine20'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

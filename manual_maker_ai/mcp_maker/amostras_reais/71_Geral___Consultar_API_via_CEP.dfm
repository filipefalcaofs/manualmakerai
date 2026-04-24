object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 836
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
    InputParams = 'CEP,Letras,50,'
    Variables = 'Retorno,Variante,,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 836
    Top = 468
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
    InputNames = 'FlowLine4'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Retorno</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROO' +
      'T>'#13#10
    Expression = '<VARIABLE NAME="Retorno"/>'
    Text = '@Retorno'
    OutPutParam = 'Variante,    '
  end
  object FlowExpression3: TFlowExpression
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine3'
    Description = 'Criar objeto json'
    Text = 'JSON - Criar Objeto(@Retorno)'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;Objeto" REALNAME="eb' +
      'fCreateObjectJSON">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9'<TEXT>Retorno</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.23</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision1: TFlowDecision
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
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4;FlowLine5'
    Description = 'Erro?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfJSONExistsKey</TEXT>'#13#10#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<' +
      'TObjVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<T' +
      'EXT>Retorno</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.' +
      '2.0.97</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<I' +
      'D>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
      'OR>erro</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9 +
      #9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REAL' +
      'NAME="ebfJSONExistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '<CONSTANT TYPE="Letras" NULL="FALSE"  >erro</CONSTANT>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine4: TFlowLine
    Left = 835
    Top = 423
    Width = 64
    Height = 65
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
  object FlowActivity1: TFlowActivity
    Left = 970
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
    ChangeDescription = False
    InputNames = 'FlowLine5'
    Description = 'Mensagem de Erro'
    Id = 7
    ObjectName = 'Mensagem de Erro'
    RealName = 'ActNewErrorMessage'
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Erro</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</N' +
          'ULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>CEP inv'#225'lido. Verifique se' +
          ' digitou corretamente e tente novamente.</VALOR>'#13#10#9#9'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NUL' +
          'O>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Nulo</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NU' +
          'LO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Nulo</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NU' +
          'LO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >Erro</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >CEP&#x20;inv&#225;lido.&#' +
          'x20;Verifique&#x20;se&#x20;digitou&#x20;corretamente&#x20;e&#x20' +
          ';tente&#x20;novamente.</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  >Nulo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  >Nulo</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = 'Erro'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          'CEP inv'#225'lido. Verifique se digitou corretamente e tente novament' +
          'e.'
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = 'Nulo'
      end>
  end
  object FlowLine5: TFlowLine
    Left = 910
    Top = 394
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowActivity1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine3: TFlowLine
    Left = 835
    Top = 346
    Width = 40
    Height = 57
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
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision2: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine7;FlowLine6'
    Description = 'CEP vazio?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>CEP</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</M' +
      'KR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10 +
      '</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="CEP"/>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'
    Loop = False
  end
  object FlowLine1: TFlowLine
    Left = 835
    Top = 36
    Width = 40
    Height = 67
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
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd2: TFlowEnd
    Left = 1026
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
    InputNames = 'FlowLine7'
    Description = 'Fim'
  end
  object FlowLine7: TFlowLine
    Left = 910
    Top = 93
    Width = 136
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowEnd2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowDecision3: TFlowDecision
    Left = 780
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
    ChangeDescription = True
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine9;FlowLine2'
    Description = 'CEP>8'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isMinor</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfLe' +
      'ngth</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</' +
      'MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>4</ID' +
      '>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>CEP</TEXT>'#13#10#9#9#9#9#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10 +
      #9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TOb' +
      'jConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></' +
      'TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VE' +
      'RSION>'#13#10#9#9#9#9'<VALOR>8</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
      #9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
    Expression = 
      '<FUNCTION NAME="Menor" REALNAME="isMinor">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="' +
      'CEP"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="F' +
      'ALSE"  >8</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowActivity2: TFlowActivity
    Left = 970
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
    InputNames = 'FlowLine9'
    Description = 'Mensagem de Erro'
    Id = 7
    ObjectName = 'Mensagem de Erro'
    RealName = 'ActNewErrorMessage'
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Erro</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</N' +
          'ULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>CEP inv'#225'lido. Verifique se' +
          ' digitou corretamente e tente novamente.</VALOR>'#13#10#9#9'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NUL' +
          'O>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Nulo</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NU' +
          'LO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Nulo</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NU' +
          'LO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >Erro</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >CEP&#x20;inv&#225;lido.&#' +
          'x20;Verifique&#x20;se&#x20;digitou&#x20;corretamente&#x20;e&#x20' +
          ';tente&#x20;novamente.</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  >Nulo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  >Nulo</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = 'Erro'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          'CEP inv'#225'lido. Verifique se digitou corretamente e tente novament' +
          'e.'
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = 'Nulo'
      end>
  end
  object FlowLine6: TFlowLine
    Left = 835
    Top = 123
    Width = 64
    Height = 55
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowDecision3'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine9: TFlowLine
    Left = 910
    Top = 169
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowActivity2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression2: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine8'
    Description = 'Consultar via CEP'
    Text = 
      'REST - Consumir WebService(GET,Concatena'#231#227'o(https://viacep.com.b' +
      'r/ws/,@CEP,/json/),,,,Criar Objeto Mapa com Par'#226'metros(Criar lis' +
      'ta a partir dos Elementos(Content-Type,application/json)),,UTF-8' +
      ',,)'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="REST&#x20;-&#x20;Consumir&#x20;WebService" REALN' +
      'AME="ebfRestCallNew">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE"  >GET</CONSTANT>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" ' +
      'REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE"  >https://viacep.com.br/ws/</CONSTANT>'#13#10'<VARIABLE NAME="CE' +
      'P"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >/json/</CONSTANT>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></' +
      'CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<C' +
      'ONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME=' +
      '"Criar&#x20;Objeto&#x20;Mapa&#x20;com&#x20;Par&#226;metros" REAL' +
      'NAME="ebfMapCreateFromList">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Criar&#x' +
      '20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Elementos" REALNAME="e' +
      'bfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE"  >Content-Type</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE"  >application/json</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >UTF-8</CONSTANT>'#13#10 +
      '<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfRestCallNew</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>GET</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>3</ID' +
      '>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>https://viacep.com.br/ws/</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>5</I' +
      'D>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>CEP</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>/json/</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
      '<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCT' +
      'ION</NOME>'#13#10'<TEXT>ebfMapCreateFromList</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>1' +
      '1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>12</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Content-Type' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>13' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>application/json</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>14</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>18</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>UTF-8</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>16</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>17</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunct' +
      'ion>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 835
    Top = 198
    Width = 64
    Height = 56
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowExpression2'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 835
    Top = 271
    Width = 40
    Height = 58
    Color = 9079434
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
end

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
    InputParams = 
      'Formul'#225'rio,Formul'#225'rio,,;Campo,Letras,50,;Valor,Letras,50,;Modo,I' +
      'nteiro,50,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 266
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
    ChangeDescription = False
    InputNames = 'FlowLine2;FlowLine7'
    Description = 'Fim'
  end
  object FlowExpression1: TFlowExpression
    Left = 20
    Top = 383
    Width = 150
    Height = 58
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
    OutputNames = 'FlowLine2'
    Description = 'Abrir formul'#225'rio'
    Text = 
      'Abrir Formul'#225'rio Filtro e Modo(@Formul'#225'rio,Concatena'#231#227'o(@Campo,@' +
      'Valor),@Modo)'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Formul&#225;rio&#x20;Filtro&#x20;e&#x' +
      '20;Modo" REALNAME="ebfFormOpenFilterAndMode">'#13#10'<PARAMS>'#13#10'<VARIAB' +
      'LE NAME="Formul&#225;rio"/>'#13#10'<FUNCTION NAME="Concatena&#231;&#22' +
      '7;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Campo"/>'#13#10 +
      '<VARIABLE NAME="Valor"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME' +
      '="Modo"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormOpenFilterA' +
      'ndMode</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Form' +
      'ul&#225;rio</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<' +
      'NOME>VARIABLE</NOME>'#13#10'<TEXT>Campo</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjVariable>'#13#10'<ID>6' +
      '</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Valor</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>' +
      #13#10'<TEXT>Modo</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERS' +
      'ION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 150
    Top = 393
    Width = 136
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
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression2: TFlowExpression
    Left = 20
    Top = 308
    Width = 150
    Height = 58
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
    OutputNames = 'FlowLine3'
    Description = 'Guardar modo em vari'#225'vel de sessao'
    Text = 'Definir vari'#225'vel da sess'#227'o(C'#243'digo do Formul'#225'rio,@Modo,false)'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;vari&#225;vel&#x20;da&#x20;sess&#22' +
      '7;o" REALNAME="ebfSetSessionAttribute">'#13#10'<PARAMS>'#13#10'<FUNCTION NAM' +
      'E="C&#243;digo&#x20;do&#x20;Formul&#225;rio" REALNAME="ebfGetFor' +
      'mID">'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME="Modo"/>'#13#10'<CONSTANT TYPE="L&#' +
      '243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetSessionAttri' +
      'bute</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>' +
      'ebfGetFormID</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERS' +
      'ION>'#13#10'</TObjFunction>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABL' +
      'E</NOME>'#13#10'<TEXT>Modo</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gic' +
      'o</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression3: TFlowExpression
    Left = 20
    Top = 233
    Width = 150
    Height = 58
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
    OutputNames = 'FlowLine4'
    Description = 'Guardar c'#243'd em vari'#225'vel de sessao'
    Text = 'Definir vari'#225'vel da sess'#227'o(CodForm,C'#243'digo do Formul'#225'rio,false)'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;vari&#225;vel&#x20;da&#x20;sess&#22' +
      '7;o" REALNAME="ebfSetSessionAttribute">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >CodForm</CONSTANT>'#13#10'<FUNCTION NAME="C&' +
      '#243;digo&#x20;do&#x20;Formul&#225;rio" REALNAME="ebfGetFormID">' +
      #13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetSessionAttri' +
      'bute</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Cod' +
      'Form</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13 +
      #10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetFormID</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjFunction>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>fals' +
      'e</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine4: TFlowLine
    Left = 75
    Top = 242
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision1: TFlowDecision
    Left = 20
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine5;FlowLine6'
    Description = 'Valor '#233' nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEmpty</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Camp' +
      'o</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObj' +
      'Variable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Campo"/>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'
    Loop = False
  end
  object FlowLine5: TFlowLine
    Left = 75
    Top = 198
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression3'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowActivity1: TFlowActivity
    Left = 210
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine7'
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
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10'<VALOR>Erro</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
          'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
          'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10'<VALOR>Selecione&#x20;um&#x2' +
          '0;registro&#x20;para&#x20;abri-lo.</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
          'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
          'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
          #10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
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
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Selecione&#x20;um&#x20;re' +
          'gistro&#x20;para&#x20;abri-lo.</CONSTANT>'
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
        Value = 'Selecione um registro para abri-lo.'
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
    Left = 150
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowActivity1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine3: TFlowLine
    Left = 75
    Top = 317
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
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 265
    Top = 198
    Width = 40
    Height = 215
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
    InputNames = 'FlowActivity1'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision2: TFlowDecision
    Left = 20
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
    OutputNames = 'FlowLine8;FlowLine9'
    Description = 'Est'#225' em modo de inser'#231#227'o?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormIsInInsertM' +
      'ode</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Est&#225;&#x20;em&#x20;Modo&#x20;de&#x20;Inser&#' +
      '231;&#227;o?" REALNAME="ebfFormIsInInsertMode">'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine8: TFlowLine
    Left = 75
    Top = 123
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowDecision1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd2: TFlowEnd
    Left = 456
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
    InputNames = 'FlowLine10'
    Description = 'Fim'
  end
  object FlowActivity2: TFlowActivity
    Left = 210
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine10'
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
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Aten&#231;&#227;o!</V' +
          'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
          'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
          'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
          'KR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Conclua&#x20;a&#x20;in' +
          'ser&#231;&#227;o&#x20;do&#x20;registro&#x20;para&#x20;clicar&#x2' +
          '0;no&#x20;bot&#227;o!</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Posi'#231#227'o'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Aten&#231;&#227;o!</CONST' +
          'ANT>'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Conclua&#x20;a&#x20;inser' +
          '&#231;&#227;o&#x20;do&#x20;registro&#x20;para&#x20;clicar&#x20;n' +
          'o&#x20;bot&#227;o!</CONSTANT>'
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
        Value = 'Aten'#231#227'o!'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 'Conclua a inser'#231#227'o do registro para clicar no bot'#227'o!'
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
  object FlowLine9: TFlowLine
    Left = 150
    Top = 94
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowActivity2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine10: TFlowLine
    Left = 265
    Top = 92
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
    InputNames = 'FlowActivity2'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine1: TFlowLine
    Left = 75
    Top = 36
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

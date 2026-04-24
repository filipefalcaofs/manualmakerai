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
      'vHoraProgramada,Componente,,;vHoraReal,Componente,,;vRetornoVali' +
      'da,L'#243'gico,,'
    WorkFormCod = -1
    WorkFormGUID = '{FAE82A1E-D017-454B-9B33-5A6A66B4795D}'
  end
  object FlowEnd1: TFlowEnd
    Left = 456
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
    InputNames = 'FlowLine6;FlowLine9'
    Description = 'Fim'
  end
  object FlowExpression1: TFlowExpression
    Left = 20
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
    Description = 'Obter valor da Hora programada'
    Text = 
      'Obter Valor do Componente(Cadastro de Soltura,Hor'#225'rio Programado' +
      ' (txtHorarioSoltura))'
    ReturnVar = 'vHoraProgramada'
    Expression = 
      '<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNA' +
      'ME="ebfFormGetComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul' +
      '&#225;rio" NULL="FALSE"  GUID = "{FAE82A1E-D017-454B-9B33-5A6A66' +
      'B4795D}">{FAE82A1E-D017-454B-9B33-5A6A66B4795D}</CONSTANT>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{FAE82A1E-D017-454' +
      'B-9B33-5A6A66B4795D}">txtHorarioSoltura</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormGetComponen' +
      'tValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>' +
      #13#10'<VALOR>Cadastro&#x20;de&#x20;Soltura</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{FAE82A1E-D017-454B-9B33-5A6A66B4' +
      '795D}</GUID>'#13#10'<SPECIALCODE>{FAE82A1E-D017-454B-9B33-5A6A66B4795D' +
      '}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '32</MKR_VERSION>'#13#10'<VALOR>Hor&#225;rio&#x20;Programado&#x20;(txtH' +
      'orarioSoltura)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID>{FAE82A1E-D017-454B-9B33-5A6A66B4795D}</GUID>'#13#10'<SPECIALCO' +
      'DE>txtHorarioSoltura</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 75
    Top = 36
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 20
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
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine3'
    Description = 'Geral - Hora Maior Menor'
    Id = 799
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pHoraMenor'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vHoraProgramada</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>F' +
          'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObj' +
          'Variable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pHoraMaior'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vHoraReal</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariab' +
          'le>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pMensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pTitulo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pTempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13 +
          #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
          'IALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pPosicao'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pComponenteLimpar'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>txtHorarioSoltura</VA' +
          'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
          'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
          'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDescMenorpara'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Hora&#x20;Programada<' +
          '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
          #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
          #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pDescMaior'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Hora&#x20;Real</VALOR' +
          '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
          '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
          'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pFormulario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>{FAE82A1E-D017-454B-9' +
          'B33-5A6A66B4795D}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
          'ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pHoraMenor'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vHoraProgramada"/>'
      end
      item
        DataType = ftString
        Name = 'pHoraMaior'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vHoraReal"/>'
      end
      item
        DataType = ftString
        Name = 'pMensagem'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pTitulo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pTempo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pPosicao'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pComponenteLimpar'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >txtHorarioSoltura</CONSTA' +
          'NT>'
      end
      item
        DataType = ftString
        Name = 'pDescMenorpara'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Hora&#x20;Programada</CON' +
          'STANT>'
      end
      item
        DataType = ftString
        Name = 'pDescMaior'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >Hora&#x20;Real</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pFormulario'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >{FAE82A1E-D017-454B-9B33-' +
          '5A6A66B4795D}</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pHoraMenor'
        ParamType = ptInput
        Value = '@vHoraProgramada'
      end
      item
        DataType = ftString
        Name = 'pHoraMaior'
        ParamType = ptInput
        Value = '@vHoraReal'
      end
      item
        DataType = ftString
        Name = 'pMensagem'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'pTitulo'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'pTempo'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'pPosicao'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'pComponenteLimpar'
        ParamType = ptInput
        Value = 'txtHorarioSoltura'
      end
      item
        DataType = ftString
        Name = 'pDescMenorpara'
        ParamType = ptInput
        Value = 'Hora Programada'
      end
      item
        DataType = ftString
        Name = 'pDescMaior'
        ParamType = ptInput
        Value = 'Hora Real'
      end
      item
        DataType = ftString
        Name = 'pFormulario'
        ParamType = ptInput
        Value = '{FAE82A1E-D017-454B-9B33-5A6A66B4795D}'
      end>
    ObjectName = 'Geral - Hora Maior Menor'
    RealName = 'CALLRULE'
  end
  object FlowExpression3: TFlowExpression
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine10'
    Description = 'Obter valor da hora real'
    Text = 
      'Obter Valor do Componente(Cadastro de Soltura,Hor'#225'rio Real (txtH' +
      'orarioReal3))'
    ReturnVar = 'vHoraReal'
    Expression = 
      '<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNA' +
      'ME="ebfFormGetComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul' +
      '&#225;rio" NULL="FALSE"  GUID = "{FAE82A1E-D017-454B-9B33-5A6A66' +
      'B4795D}">{FAE82A1E-D017-454B-9B33-5A6A66B4795D}</CONSTANT>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{FAE82A1E-D017-454' +
      'B-9B33-5A6A66B4795D}">txtHorarioReal3</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormGetComponen' +
      'tValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>' +
      #13#10'<VALOR>Cadastro&#x20;de&#x20;Soltura</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{FAE82A1E-D017-454B-9B33-5A6A66B4' +
      '795D}</GUID>'#13#10'<SPECIALCODE>{FAE82A1E-D017-454B-9B33-5A6A66B4795D' +
      '}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '32</MKR_VERSION>'#13#10'<VALOR>Hor&#225;rio&#x20;Real&#x20;(txtHorario' +
      'Real3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{' +
      'FAE82A1E-D017-454B-9B33-5A6A66B4795D}</GUID>'#13#10'<SPECIALCODE>txtHo' +
      'rarioReal3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunctio' +
      'n>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 75
    Top = 121
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
    Left = 20
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine15;FlowLine16'
    Description = 'Hora Programada '#233' nulo ou vazio ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEmpty</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vHor' +
      'aProgramada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vHoraProgramada"/>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression5: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine18'
    Description = 'Atualiza Hora real com valor da hora programada'
    Text = 
      'Alterar Valor do Componente(Cadastro de Soltura,Hor'#225'rio Real (tx' +
      'tHorarioReal3),@vHoraProgramada)'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{FAE82A1E-D017-454B-9B33-5' +
      'A6A66B4795D}">{FAE82A1E-D017-454B-9B33-5A6A66B4795D}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{FAE82A1E-D01' +
      '7-454B-9B33-5A6A66B4795D}">txtHorarioReal3</CONSTANT>'#13#10'<VARIABLE' +
      ' NAME="vHoraProgramada"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Soltura</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID>{FAE82A1E-D017-454B-9B33-5A6A66B4795D' +
      '}</GUID>'#13#10'<SPECIALCODE>{FAE82A1E-D017-454B-9B33-5A6A66B4795D}</S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</' +
      'MKR_VERSION>'#13#10'<VALOR>Hor&#225;rio&#x20;Real&#x20;(txtHorarioReal' +
      '3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{FAE8' +
      '2A1E-D017-454B-9B33-5A6A66B4795D}</GUID>'#13#10'<SPECIALCODE>txtHorari' +
      'oReal3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10 +
      '<NOME>VARIABLE</NOME>'#13#10'<TEXT>vHoraProgramada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision4: TFlowDecision
    Left = 20
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
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine17;FlowLine19'
    Description = 'Hora real '#233' nula vazia ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEmpty</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vHor' +
      'aReal</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vHoraReal"/>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowEnd3: TFlowEnd
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
    InputNames = 'FlowLine15;FlowLine18'
    Description = 'Fim'
  end
  object FlowSubRoutine2: TFlowSubRoutine
    Left = 20
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
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine11'
    Description = 'Ger - Tratativa Hora Invalida'
    Id = 542
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pComponente'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'<VALOR>txtHorarioSoltura</VA' +
          'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
          'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
          'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pValorHora'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vHoraProgramada</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>F' +
          'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObj' +
          'Variable>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pComponente'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >txtHorarioSoltura</CONSTA' +
          'NT>'
      end
      item
        DataType = ftString
        Name = 'pValorHora'
        ParamType = ptInput
        Value = '<VARIABLE NAME="vHoraProgramada"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pComponente'
        ParamType = ptInput
        Value = 'txtHorarioSoltura'
      end
      item
        DataType = ftString
        Name = 'pValorHora'
        ParamType = ptInput
        Value = '@vHoraProgramada'
      end>
    Return = 'vRetornoValida'
    ObjectName = 'Ger - Tratativa Hora Invalida'
    RealName = 'CALLRULE'
  end
  object FlowLine10: TFlowLine
    Left = 75
    Top = 196
    Width = 40
    Height = 57
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
    OutputNames = 'FlowSubRoutine2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine15: TFlowLine
    Left = 150
    Top = 393
    Width = 136
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
    OutputNames = 'FlowEnd3'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine16: TFlowLine
    Left = 75
    Top = 423
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowDecision4'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine17: TFlowLine
    Left = 75
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression5'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine18: TFlowLine
    Left = 265
    Top = 392
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowEnd3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine19: TFlowLine
    Left = 75
    Top = 468
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowSubRoutine1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression6: TFlowExpression
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine5'
    Description = 'Definir motivo de atraso como obrigat'#243'rio'
    Text = 
      'Definir Obrigatoriedade de Componente(Motivo de Atraso (txtMotiv' +
      'oAtraso4),true)'
    Expression = 
      #9'<FUNCTION NAME="Definir Obrigatoriedade de Componente" REALNAME' +
      '="ebfFormSetRequired">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Component' +
      'e" NULL="FALSE" GUID="{FAE82A1E-D017-454B-9B33-5A6A66B4795D}">tx' +
      'tMotivoAtraso4</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="L'#243'gico" NULL="FALS' +
      'E">true</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfFormSetRequired</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Componente</TIPO>'#13#10#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_' +
      'VERSION>'#13#10#9#9#9#9'<VALOR>Motivo de Atraso (txtMotivoAtraso4)</VALOR>' +
      #13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<' +
      'GUID>{FAE82A1E-D017-454B-9B33-5A6A66B4795D}</GUID>'#13#10#9#9#9#9'<SPECIAL' +
      'CODE>txtMotivoAtraso4</SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSIO' +
      'N>'#13#10#9#9#9#9'<VALOR>true</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9 +
      #9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT' +
      '>'#13#10
  end
  object FlowExpression7: TFlowExpression
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
    Description = 'Definir motivo de atraso como N'#195'O obrigat'#243'rio'
    Text = 
      'Definir Obrigatoriedade de Componente(Motivo de Atraso (txtMotiv' +
      'oAtraso4),false)'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Compon' +
      'ente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="' +
      'Componente" NULL="FALSE"  GUID = "{FAE82A1E-D017-454B-9B33-5A6A6' +
      '6B4795D}">txtMotivoAtraso4</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gi' +
      'co" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Motivo&#x' +
      '20;de&#x20;Atraso&#x20;(txtMotivoAtraso4)</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{FAE82A1E-D017-454B-9B33-5A6A6' +
      '6B4795D}</GUID>'#13#10'<SPECIALCODE>txtMotivoAtraso4</SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10 +
      '<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression8: TFlowExpression
    Left = 400
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = 'Habilitar componente Motivo do atraso'
    Text = 'Habilitar Componente(txtMotivoAtraso4,true)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >txtMo' +
      'tivoAtraso4</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE' +
      '"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>txtMotivoAtraso' +
      '4</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression9: TFlowExpression
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
    OutputNames = 'FlowLine9'
    Description = 'Desabilitar componente Motivo do atraso'
    Text = 'Habilitar Componente(txtMotivoAtraso4,false)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >txtMo' +
      'tivoAtraso4</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE' +
      '"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>txtMotivoAtraso' +
      '4</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision2: TFlowDecision
    Left = 210
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
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4;FlowLine7'
    Description = 'Hora Programada > = Hora Real?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isGreater</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toLong</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfRe' +
      'place</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>vHoraReal</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>:</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>toLong</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfReplace</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>5</ID>'#13#10'<NOM' +
      'E>VARIABLE</NOME>'#13#10'<TEXT>vHoraProgramada</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst' +
      '>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>:</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Maior" REALNAME="isGreater">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="Para&#x20;Inteiro" REALNAME="toLong">'#13#10'<PARAMS>'#13#10'<FUNCTI' +
      'ON NAME="Trocar&#x20;Subsequ&#234;ncia" REALNAME="ebfReplace">'#13#10 +
      '<PARAMS>'#13#10'<VARIABLE NAME="vHoraReal"/>'#13#10'<CONSTANT TYPE="Letras" ' +
      'NULL="FALSE"  >:</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Para&#x20;Inteiro" REALNAME="toLong">'#13#10'<PARAMS>' +
      #13#10'<FUNCTION NAME="Trocar&#x20;Subsequ&#234;ncia" REALNAME="ebfRe' +
      'place">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vHoraProgramada"/>'#13#10'<CONSTANT' +
      ' TYPE="Letras" NULL="FALSE"  >:</CONSTANT>'#13#10'<CONSTANT TYPE="Letr' +
      'as" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine3: TFlowLine
    Left = 75
    Top = 543
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 265
    Top = 543
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
    OutputNames = 'FlowExpression6'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine5: TFlowLine
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 455
    Top = 618
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 265
    Top = 543
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression7'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine9: TFlowLine
    Left = 265
    Top = 692
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision5: TFlowDecision
    Left = 20
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
    Description = 'Hora '#233' valida?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vRetornoVa' +
      'lida</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VER' +
      'SION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="vRetornoValida"/>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALS' +
      'E"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowConnector2: TFlowConnector
    Left = 270
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
  end
  object FlowLine11: TFlowLine
    Left = 75
    Top = 273
    Width = 40
    Height = 130
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowSubRoutine2'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
end
                                                                                                                                                                                                                             
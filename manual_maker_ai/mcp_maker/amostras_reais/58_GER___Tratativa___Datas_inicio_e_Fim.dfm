object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 456
    Top = 168
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
    OutputNames = 'FlowLine8'
    Description = 'Inicio'
    InputParams = 
      'Comp_dt_ini,Data,,;Comp_dt_fim,Data,,;Comp_toClean,Componente,,;' +
      'FORM,Formul'#225'rio,,;dt_ativacao,Data,,;dt_desativacao,Data,,'
    WorkFormCod = -1
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
    InputNames = 'FlowLine19;FlowLine16'
    Description = 'Fim'
  end
  object FlowDecision1: TFlowDecision
    Left = 400
    Top = 533
    Width = 150
    Height = 60
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine4;FlowLine12'
    Description = 'Data da Ativa'#231#227'o igual data de hoje'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isGreater</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>23</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toDate<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjVariable>'#13#10'<ID>24</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>dt_ati' +
      'vacao</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TO' +
      'bjVariable>'#13#10'<TObjConst>'#13#10'<ID>25</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<T' +
      'EXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VA' +
      'LOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GU' +
      'ID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'<TObjFunction>'#13#10'<ID>26</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10 +
      '<TEXT>ebfDateToday</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_V' +
      'ERSION>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Maior" REALNAME="isGreater">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="Para&#x20;Data" REALNAME="toDate">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="dt_ativacao"/>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Hoje" REALNAME=' +
      '"ebfDateToday">'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowActivity1: TFlowActivity
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
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine4'
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
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>Aten'#231#227'o!</VALOR>'#13#10#9#9'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALS' +
          'E</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
          'KR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>A&#x20;&lt;strong&gt;d' +
          'ata&#x20;de&#x20;ativa&#231;&#227;o&lt;/strong&gt;&#x20;n&#227;o' +
          '&#x20;pode&#x20;ser&#x20;maior&#x20;que&#x20;&lt;b&gt;Hoje&lt;/b' +
          '&gt;!</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
          'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
          'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
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
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">Aten'#231#227'o!</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >A&#x20;&lt;strong&gt;data' +
          '&#x20;de&#x20;ativa&#231;&#227;o&lt;/strong&gt;&#x20;n&#227;o&#x' +
          '20;pode&#x20;ser&#x20;maior&#x20;que&#x20;&lt;b&gt;Hoje&lt;/b&gt' +
          ';!</CONSTANT>'
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
        Value = 
          'A <strong>data de ativa'#231#227'o</strong> n'#227'o pode ser maior que <b>Ho' +
          'je</b>!'
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
  object FlowConnector1: TFlowConnector
    Left = 1030
    Top = 547
    Width = 30
    Height = 30
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine10;FlowLine24'
    OutputNames = 'FlowLine7'
  end
  object FlowActivity2: TFlowActivity
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
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine23'
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
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>Aten'#231#227'o!</VALOR>'#13#10#9#9'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALS' +
          'E</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
          'KR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>A&#x20;&lt;strong&gt;d' +
          'ata&#x20;de&#x20;in&#237;cio&lt;/strong&gt;&#x20;n&#227;o&#x20;p' +
          'ode&#x20;ser&#x20;maior&#x20;que&#x20;&lt;b&gt;Hoje&lt;/b&gt;!</' +
          'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
          '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
          '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
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
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">Aten'#231#227'o!</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >A&#x20;&lt;strong&gt;data' +
          '&#x20;de&#x20;in&#237;cio&lt;/strong&gt;&#x20;n&#227;o&#x20;pode' +
          '&#x20;ser&#x20;maior&#x20;que&#x20;&lt;b&gt;Hoje&lt;/b&gt;!</CON' +
          'STANT>'
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
        Value = 
          'A <strong>data de in'#237'cio</strong> n'#227'o pode ser maior que <b>Hoje' +
          '</b>!'
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
  object FlowConnector2: TFlowConnector
    Left = 1030
    Top = 397
    Width = 30
    Height = 30
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine11;FlowLine23'
    OutputNames = 'FlowLine17'
  end
  object FlowLine10: TFlowLine
    Left = 720
    Top = 543
    Width = 330
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
    InputNames = 'FlowActivity1'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 530
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowActivity1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowActivity3: TFlowActivity
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
    ChangeDescription = False
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine3'
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
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>Aten'#231#227'o!</VALOR>'#13#10#9#9'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALS' +
          'E</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
          'KR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>A&#x20;&lt;strong&gt;d' +
          'ata&#x20;fim&lt;/strong&gt;&#x20;n&#227;o&#x20;pode&#x20;ser&#x2' +
          '0;menor&#x20;que&#x20;a&#x20;&lt;strong&gt;data&#x20;de&#x20;in&' +
          '#237;cio!&lt;/strong&gt;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
          'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
          'st>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
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
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">Aten'#231#227'o!</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >A&#x20;&lt;strong&gt;data' +
          '&#x20;fim&lt;/strong&gt;&#x20;n&#227;o&#x20;pode&#x20;ser&#x20;m' +
          'enor&#x20;que&#x20;a&#x20;&lt;strong&gt;data&#x20;de&#x20;in&#23' +
          '7;cio!&lt;/strong&gt;</CONSTANT>'
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
        Value = 
          'A <strong>data fim</strong> n'#227'o pode ser menor que a <strong>dat' +
          'a de in'#237'cio!</strong>'
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
  object FlowConnector3: TFlowConnector
    Left = 1030
    Top = 247
    Width = 30
    Height = 30
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine14'
  end
  object FlowLine3: TFlowLine
    Left = 910
    Top = 243
    Width = 140
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
    InputNames = 'FlowActivity3'
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector5: TFlowConnector
    Left = 1030
    Top = 697
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
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine19'
  end
  object FlowLine19: TFlowLine
    Left = 474
    Top = 693
    Width = 576
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
    InputNames = 'FlowConnector5'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowDecision13: TFlowDecision
    Left = 400
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine2;FlowLine5'
    Description = 'Data maior que Hoje'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isGreater</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toDate</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Comp_dt_' +
      'ini</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObj' +
      'Variable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR' +
      '></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfDateToday</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSI' +
      'ON>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Maior" REALNAME="isGreater">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="Para&#x20;Data" REALNAME="toDate">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="Comp_dt_ini"/>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Hoje" REALNAME=' +
      '"ebfDateToday">'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision6: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine13;FlowLine16'
    Description = 'Data de desativa'#231#227'o  menor que Data ativa'#231#227'o?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isMinor</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprNot</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isN' +
      'ullOrEmpty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>dt_desativacao</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17' +
      '</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIA' +
      'BLE</NOME>'#13#10'<TEXT>dt_ativacao</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Da' +
      'ta</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Menor" REALNAME="isMinor">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="N&#227;o" REALNAME="oprNot">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="&#' +
      '201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<P' +
      'ARAMS>'#13#10'<VARIABLE NAME="dt_desativacao"/>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME="dt_ativacao"/>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowActivity4: TFlowActivity
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
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine18'
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
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>Aten'#231#227'o!</VALOR>'#13#10#9#9'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALS' +
          'E</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
          'KR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>A&#x20;&lt;strong&gt;d' +
          'ata&#x20;da&#x20;desativa&#231;&#227;o&lt;/strong&gt;&#x20;n&#22' +
          '7;o&#x20;pode&#x20;ser&#x20;menor&#x20;que&#x20;a&#x20;&lt;stron' +
          'g&gt;data&#x20;de&#x20;ativa&#231;&#227;o!&lt;/strong&gt;</VALOR' +
          '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
          '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
          'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
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
          'MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NUL' +
          'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
          'PECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'T'#237'tulo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">Aten'#231#227'o!</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >A&#x20;&lt;strong&gt;data' +
          '&#x20;da&#x20;desativa&#231;&#227;o&lt;/strong&gt;&#x20;n&#227;o' +
          '&#x20;pode&#x20;ser&#x20;menor&#x20;que&#x20;a&#x20;&lt;strong&g' +
          't;data&#x20;de&#x20;ativa&#231;&#227;o!&lt;/strong&gt;</CONSTANT' +
          '>'
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
        Value = 
          'A <strong>data da desativa'#231#227'o</strong> n'#227'o pode ser menor que a ' +
          '<strong>data de ativa'#231#227'o!</strong>'
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
  object FlowConnector4: TFlowConnector
    Left = 1680
    Top = 772
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
  object FlowLine13: TFlowLine
    Left = 530
    Top = 619
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowActivity4'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine16: TFlowLine
    Left = 455
    Top = 648
    Width = 64
    Height = 65
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
    OutputNames = 'FlowEnd1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector10: TFlowConnector
    Left = 1030
    Top = 622
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
    InputNames = 'FlowLine18;FlowLine7'
    OutputNames = 'FlowLine20'
  end
  object FlowLine18: TFlowLine
    Left = 720
    Top = 618
    Width = 330
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
    InputNames = 'FlowActivity4'
    OutputNames = 'FlowConnector10'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine20: TFlowLine
    Left = 1025
    Top = 632
    Width = 40
    Height = 85
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
    InputNames = 'FlowConnector10'
    OutputNames = 'FlowConnector5'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 1025
    Top = 557
    Width = 40
    Height = 85
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
    OutputNames = 'FlowConnector10'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine12: TFlowLine
    Left = 455
    Top = 573
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
    OutputNames = 'FlowDecision6'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision5: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    Description = 'Data fim '#233' menor que a data Inicio  ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isMinor</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toDate</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprNot</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isN' +
      'ullOrEmpty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>Comp_dt_fim</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSI' +
      'ON>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTI' +
      'ON</NOME>'#13#10'<TEXT>toDate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIAB' +
      'LE</NOME>'#13#10'<TEXT>Comp_dt_ini</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Dat' +
      'a</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.17</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
      #13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Menor" REALNAME="isMinor">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="Para&#x20;Data" REALNAME="toDate">'#13#10'<PARAMS>'#13#10'<FUNCTION NA' +
      'ME="N&#227;o" REALNAME="oprNot">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="&#20' +
      '1;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<PAR' +
      'AMS>'#13#10'<VARIABLE NAME="Comp_dt_fim"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  >Nulo' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Para&#x20;D' +
      'ata" REALNAME="toDate">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Comp_dt_ini"/' +
      '>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  >Nulo</CONSTANT>'#13#10'</PARA' +
      'MS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision3: TFlowDecision
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    Description = 'Data fim '#233' menor que a data Inicio  ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isMinor</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprNot</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isN' +
      'ullOrEmpty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>Comp_dt_fim</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE' +
      '</NOME>'#13#10'<TEXT>Comp_dt_ini</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.1' +
      '7</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Menor" REALNAME="isMinor">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="N&#227;o" REALNAME="oprNot">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="&#' +
      '201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<P' +
      'ARAMS>'#13#10'<VARIABLE NAME="Comp_dt_fim"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME="Comp_dt_ini"/>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision4: TFlowDecision
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine6;FlowLine9'
    Description = 'Data fim, '#233' menor que inicio?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isMinor</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toDate</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Comp_dt_fi' +
      'm</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVa' +
      'riable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'<TObjVariable>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Co' +
      'mp_dt_ini</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10 +
      '</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Menor" REALNAME="isMinor">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="Para&#x20;Data" REALNAME="toDate">'#13#10'<PARAMS>'#13#10'<VARIABLE NA' +
      'ME="Comp_dt_fim"/>'#13#10'<CONSTANT TYPE="Data" NULL="TRUE"  ></CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME="Comp_dt_ini"/>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision2: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    Description = 'Data fim '#233' menor que a data Inicio  ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isMinor</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprNot</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isN' +
      'ullOrEmpty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>Comp_dt_fim</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE' +
      '</NOME>'#13#10'<TEXT>Comp_dt_ini</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.1' +
      '7</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Menor" REALNAME="isMinor">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="N&#227;o" REALNAME="oprNot">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="&#' +
      '201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<P' +
      'ARAMS>'#13#10'<VARIABLE NAME="Comp_dt_fim"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME="Comp_dt_ini"/>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision7: TFlowDecision
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine21;FlowLine1'
    Description = 'Data fim, '#233' maior que inicio?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isGreater</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toDate</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>FORM</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</' +
      'TObjVariable>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>' +
      #13#10'<TEXT>Comp_dt_fim</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_' +
      'VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjVari' +
      'able>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Comp_dt_ini</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Maior" REALNAME="isGreater">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="Para&#x20;Data" REALNAME="toDate">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="FORM"/>'#13#10'<VARIABLE NAME="Comp_dt_fim"/>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<VARIABLE NAME="Comp_dt_ini"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine6: TFlowLine
    Left = 455
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowDecision7'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector6: TFlowConnector
    Left = 1030
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
    InputNames = 'FlowLine14;FlowLine21'
    OutputNames = 'FlowLine11'
  end
  object FlowLine14: TFlowLine
    Left = 1025
    Top = 257
    Width = 40
    Height = 85
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
    OutputNames = 'FlowConnector6'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine21: TFlowLine
    Left = 530
    Top = 318
    Width = 520
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowConnector6'
    Description = 'SIM'
    Region = 0
    Style = psDash
    Decision = True
  end
  object FlowLine1: TFlowLine
    Left = 455
    Top = 348
    Width = 64
    Height = 55
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowDecision13'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 455
    Top = 186
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
    OutputNames = 'FlowDecision4'
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine15'
    Description = 'Limpar componente'
    Text = 
      'Alterar Valor do Componente(Cadastro de Linhas de Transporte,Dat' +
      'a Fim (TMAKEREDIT1),)'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-F' +
      'D3FE310D821}">{70291062-0AA0-48AD-AB9F-FD3FE310D821}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA' +
      '0-48AD-AB9F-FD3FE310D821}">TMAKEREDIT1</CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Linhas&#x20;de&#x20;Transporte</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062-0AA0' +
      '-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>{70291062-0AA0-48A' +
      'D-AB9F-FD3FE310D821}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Data&#x20;Fim&#x20;(' +
      'TMAKEREDIT1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE' +
      '>TMAKEREDIT1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine9: TFlowLine
    Left = 530
    Top = 243
    Width = 80
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine15: TFlowLine
    Left = 720
    Top = 243
    Width = 80
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowActivity3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector8: TFlowConnector
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
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine24'
  end
  object FlowLine11: TFlowLine
    Left = 1025
    Top = 332
    Width = 40
    Height = 85
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowConnector6'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine23: TFlowLine
    Left = 910
    Top = 393
    Width = 140
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowActivity2'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine17: TFlowLine
    Left = 1025
    Top = 407
    Width = 40
    Height = 85
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowConnector8'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine24: TFlowLine
    Left = 1025
    Top = 482
    Width = 40
    Height = 85
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowConnector8'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine2: TFlowLine
    Left = 455
    Top = 393
    Width = 64
    Height = 190
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision13'
    OutputNames = 'FlowDecision1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression1: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine22'
    Description = 'Limpar componente'
    Text = 
      'Alterar Valor do Componente(Cadastro de Linhas de Transporte,Dat' +
      'a In'#237'cio (edtDataInicio),)'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-F' +
      'D3FE310D821}">{70291062-0AA0-48AD-AB9F-FD3FE310D821}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA' +
      '0-48AD-AB9F-FD3FE310D821}">edtDataInicio</CONSTANT>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Linhas&#x20;de&#x20;Transporte</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062-0AA0' +
      '-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>{70291062-0AA0-48A' +
      'D-AB9F-FD3FE310D821}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Data&#x20;In&#237;ci' +
      'o&#x20;(edtDataInicio)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<S' +
      'PECIALCODE>edtDataInicio</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 455
    Top = 393
    Width = 230
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision13'
    OutputNames = 'FlowExpression1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine22: TFlowLine
    Left = 645
    Top = 393
    Width = 230
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
    OutputNames = 'FlowActivity2'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

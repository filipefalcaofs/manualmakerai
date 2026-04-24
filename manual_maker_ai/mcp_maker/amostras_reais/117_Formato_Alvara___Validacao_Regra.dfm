object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 266
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
    InputParams = 'Alvara,Letras,50,'
    WorkFormCod = -1
    WorkFormGUID = '{4BFF0AEE-DC1B-4281-A31B-1315DCD6447B}'
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
    InputNames = 'FlowLine14;FlowLine8'
    Description = 'Fim'
  end
  object FlowDecision6: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine3;FlowLine2'
    Description = 'Alvar'#225' com, no m'#237'nimo, 4 caracteres'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfValidateTextER</TEXT>'#13#10#9#9'<SQL>' +
      'FALSE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
      '<TObjVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<' +
      'TEXT>Alvara</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.17</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>' +
      '2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9#9#9'<VALOR' +
      '>^D-\d{4}$</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Validar&#x20;Texto&#x20;Utilizando&#x20;Express&' +
      '#227;o&#x20;Regular" REALNAME="ebfValidateTextER">'#13#10'<PARAMS>'#13#10'<V' +
      'ARIABLE NAME="Alvara"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      '^D-\d{4}$</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowActivity6: TFlowActivity
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
    ChangeDescription = False
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine14'
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
          'SION>5.0.0.17</MKR_VERSION>'#13#10#9#9'<VALOR>Formato do n'#186' do alvar'#225'!</' +
          'VALOR>'#13#10#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10#9#9'<NULO>FALSE</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID' +
          '></GUID>'#13#10#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13 +
          #10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
          'KR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>&lt;div&#x20;class=&qu' +
          'ot;text-left&quot;&gt;'#13#10#13#10'&lt;b&gt;O&#x20;formato&#x20;do&#x20;n' +
          '&#250;mero&#x20;do&#x20;alvar&#225;&#x20;dever&#225;&#x20;seguir' +
          '&#x20;as&#x20;seguintes&#x20;regras:'#13#10#13#10'Come&#231;ar&#x20;com&#x' +
          '20;a&#x20;letra&#x20;'#39'D'#39';'#13#10'Ser&#x20;seguido&#x20;por&#x20;um&#x2' +
          '0;hifen&#x20;'#39'-'#39';'#13#10'Contendo&#x20;quatro&#x20;d&#237;gitos&#x20;n' +
          'um&#233;ricos'#13#10'&lt;/div&gt;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
          #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
          '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
          'Const>'#13#10'</ROOT>'#13#10
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
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Formato&#x20;do&#x20;n&#1' +
          '86;&#x20;do&#x20;alvar&#225;!</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&lt;div&#x20;class=&quot;' +
          'text-left&quot;&gt;'#13#10#13#10'&lt;b&gt;O&#x20;formato&#x20;do&#x20;n&#2' +
          '50;mero&#x20;do&#x20;alvar&#225;&#x20;dever&#225;&#x20;seguir&#x' +
          '20;as&#x20;seguintes&#x20;regras:'#13#10#13#10'Come&#231;ar&#x20;com&#x20;' +
          'a&#x20;letra&#x20;'#39'D'#39';'#13#10'Ser&#x20;seguido&#x20;por&#x20;um&#x20;h' +
          'ifen&#x20;'#39'-'#39';'#13#10'Contendo&#x20;quatro&#x20;d&#237;gitos&#x20;num&' +
          '#233;ricos'#13#10'&lt;/div&gt;</CONSTANT>'
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
        Value = 'Formato do n'#186' do alvar'#225'!'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<div class="text-left"><b>O formato do n'#250'mero do alvar'#225' dever'#225' s' +
          'eguir as seguintes regras:Come'#231'ar com a letra '#39'D'#39';Ser seguido po' +
          'r um hifen '#39'-'#39';Contendo quatro d'#237'gitos num'#233'ricos</div>'
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
  object FlowDecision1: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine11;FlowLine4'
    Description = 'Alvara contendo, pelo menos, uma letra'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprOr</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunctio' +
      'n>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfVali' +
      'dateTextER</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0' +
      '.17</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>' +
      '3</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Alvara</TEXT>'#13#10 +
      #9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>2</ID>' +
      #13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9#9#9 +
      #9#9'<VALOR>.*D.*</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9 +
      #9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunc' +
      'tion>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NO' +
      'ME>'#13#10#9#9#9#9'<TEXT>ebfValidateTextER</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9 +
      #9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9 +
      #9'<TEXT>Alvara</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras' +
      '</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.17</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT' +
      '></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.' +
      '17</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>.*D.*</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FA' +
      'LSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUI' +
      'D>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</' +
      'PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
    Expression = 
      '<FUNCTION NAME="Ou" REALNAME="oprOr">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME=' +
      '"Validar&#x20;Texto&#x20;Utilizando&#x20;Express&#227;o&#x20;Reg' +
      'ular" REALNAME="ebfValidateTextER">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="A' +
      'lvara"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >.*D.*</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Validar&#x20;Texto&#x' +
      '20;Utilizando&#x20;Express&#227;o&#x20;Regular" REALNAME="ebfVal' +
      'idateTextER">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Alvara"/>'#13#10'<CONSTANT TY' +
      'PE="Letras" NULL="FALSE"  >.*D.*</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowDecision3: TFlowDecision
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine13;FlowLine6'
    Description = 'Alvar'#225' contendo, pelo menos, quatro n'#250'meros'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfValidateTextER</TEXT>'#13#10#9#9'<SQL>' +
      'FALSE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
      '<TObjVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<' +
      'TEXT>Alvara</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.17</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>' +
      '4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9#9#9'<VALOR' +
      '>.*\d{4}.*</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Validar&#x20;Texto&#x20;Utilizando&#x20;Express&' +
      '#227;o&#x20;Regular" REALNAME="ebfValidateTextER">'#13#10'<PARAMS>'#13#10'<V' +
      'ARIABLE NAME="Alvara"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      '.*\d{4}.*</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine3: TFlowLine
    Left = 265
    Top = 93
    Width = 60
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowDecision1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowConnector1: TFlowConnector
    Left = 460
    Top = 97
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine7'
  end
  object FlowLine2: TFlowLine
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowConnector1'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector2: TFlowConnector
    Left = 460
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
    InputNames = 'FlowLine7;FlowLine11'
    OutputNames = 'FlowLine5'
  end
  object FlowLine7: TFlowLine
    Left = 455
    Top = 92
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
    InputNames = 'FlowConnector1'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector4: TFlowConnector
    Left = 460
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
    InputNames = 'FlowLine13;FlowLine5'
    OutputNames = 'FlowLine9'
  end
  object FlowLine11: TFlowLine
    Left = 265
    Top = 167
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowConnector2'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine13: TFlowLine
    Left = 340
    Top = 243
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowConnector4'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 284
    Top = 393
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
    InputNames = 'FlowActivity6'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 265
    Top = 198
    Width = 60
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
    OutputNames = 'FlowDecision3'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine5: TFlowLine
    Left = 455
    Top = 167
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
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowConnector4'
    Region = 0
    Style = psDash
    Decision = False
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine12;FlowLine8'
    Description = 'Parametro > 20'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isGreater</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFun' +
      'ction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebf' +
      'Length</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.17' +
      '</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>3</' +
      'ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Alvara</TEXT>'#13#10#9#9#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.17</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.17</MK' +
      'R_VERSION>'#13#10#9#9#9#9'<VALOR>4</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Maior" REALNAME="isGreater">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME' +
      '="Alvara"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE"  >4</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine6: TFlowLine
    Left = 265
    Top = 273
    Width = 60
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowDecision2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowConnector3: TFlowConnector
    Left = 460
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
    InputNames = 'FlowLine9;FlowLine12'
    OutputNames = 'FlowLine10'
  end
  object FlowLine9: TFlowLine
    Left = 455
    Top = 257
    Width = 40
    Height = 85
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
    InputNames = 'FlowConnector4'
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine12: TFlowLine
    Left = 340
    Top = 318
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowConnector3'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 17
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
    OutputNames = 'FlowDecision6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine10: TFlowLine
    Left = 455
    Top = 332
    Width = 40
    Height = 71
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
    OutputNames = 'FlowActivity6'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 265
    Top = 348
    Width = 60
    Height = 65
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowEnd1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
end

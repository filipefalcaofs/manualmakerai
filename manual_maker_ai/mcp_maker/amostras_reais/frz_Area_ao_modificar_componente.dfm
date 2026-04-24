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
    InputParams = 'pAJ_ID,Inteiro,,'
    Variables = 'vTabela,Tabela,,;vDados,Letras,250,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 836
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
    ChangeDescription = False
    InputNames = 'FlowLine13;FlowLine8'
    Description = 'Fim'
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine7;FlowLine6'
    Description = 'AJ_ID '#233' nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>pAJ_ID</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunctio' +
      'n>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="pAJ_ID"/>'#13#10'</PARAMS>'#13#10 +
      '</FUNCTION>'
    Loop = False
  end
  object FlowConnector1: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine7;FlowLine17'
    OutputNames = 'FlowLine12'
  end
  object FlowLine7: TFlowLine
    Left = 340
    Top = 168
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowConnector1'
    Description = 'SIM'
    Region = 0
    Style = psDash
    Decision = True
  end
  object FlowDecision2: TFlowDecision
    Left = 210
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine3;FlowLine9'
    Description = 'O campo dados de servidor '#233' nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEmpty</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vDad' +
      'os</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TOb' +
      'jVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="vDados"/>'#13#10'</PARAMS>'#13#10 +
      '</FUNCTION>'
    Loop = False
  end
  object FlowConnector2: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine12;FlowLine16'
    OutputNames = 'FlowLine13'
  end
  object FlowLine12: TFlowLine
    Left = 835
    Top = 182
    Width = 40
    Height = 310
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
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine13: TFlowLine
    Left = 835
    Top = 482
    Width = 40
    Height = 81
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
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression5: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine10'
    Description = 'Marcar CheckBox'
    Text = 
      'Alterar Valor do Componente(Cadastro de Linhas de Transporte,Res' +
      'pons'#225'vel n'#227'o Padr'#227'o (TMAKERCHECKBOX),S)'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-F' +
      'D3FE310D821}">{70291062-0AA0-48AD-AB9F-FD3FE310D821}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA' +
      '0-48AD-AB9F-FD3FE310D821}">TMAKERCHECKBOX</CONSTANT>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Linhas&#x20;de&#x20;Transporte</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062-0AA0' +
      '-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>{70291062-0AA0-48A' +
      'D-AB9F-FD3FE310D821}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Respons&#225;vel&#x2' +
      '0;n&#227;o&#x20;Padr&#227;o&#x20;(TMAKERCHECKBOX)</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB' +
      '9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>TMAKERCHECKBOX</SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression2: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine11'
    Description = 'Desmarcar CheckBox'
    Text = 
      'Alterar Valor do Componente(Cadastro de Linhas de Transporte,Res' +
      'pons'#225'vel n'#227'o Padr'#227'o (TMAKERCHECKBOX),N)'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-F' +
      'D3FE310D821}">{70291062-0AA0-48AD-AB9F-FD3FE310D821}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA' +
      '0-48AD-AB9F-FD3FE310D821}">TMAKERCHECKBOX</CONSTANT>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE"  >N</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Linhas&#x20;de&#x20;Transporte</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062-0AA0' +
      '-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>{70291062-0AA0-48A' +
      'D-AB9F-FD3FE310D821}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Respons&#225;vel&#x2' +
      '0;n&#227;o&#x20;Padr&#227;o&#x20;(TMAKERCHECKBOX)</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB' +
      '9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>TMAKERCHECKBOX</SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR>N</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine3: TFlowLine
    Left = 265
    Top = 498
    Width = 64
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression2'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine9: TFlowLine
    Left = 340
    Top = 468
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
    OutputNames = 'FlowExpression5'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression7: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine16'
    Description = 'Marcar CheckBox(fluxo)'
    Text = 
      'Executar Fluxo(CDL - exibir componente ao clicar,Criar lista a p' +
      'artir dos Elementos(S))'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Fluxo" REALNAME="ebfFlowExecute">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >CDL&#x20;-&#x2' +
      '0;exibir&#x20;componente&#x20;ao&#x20;clicar</CONSTANT>'#13#10'<FUNCTI' +
      'ON NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Eleme' +
      'ntos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFlowExecute</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>CDL&#x20;' +
      '-&#x20;exibir&#x20;componente&#x20;ao&#x20;clicar</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>' +
      '4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression8: TFlowExpression
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine8'
    Description = 'Ocultar CheckBox(fluxo)'
    Text = 
      'Executar Fluxo(CDL - exibir componente ao clicar,Criar lista a p' +
      'artir dos Elementos(N))'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Fluxo" REALNAME="ebfFlowExecute">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >CDL&#x20;-&#x2' +
      '0;exibir&#x20;componente&#x20;ao&#x20;clicar</CONSTANT>'#13#10'<FUNCTI' +
      'ON NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Eleme' +
      'ntos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >N</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFlowExecute</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>CDL&#x20;' +
      '-&#x20;exibir&#x20;componente&#x20;ao&#x20;clicar</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>' +
      '4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>N</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</ROOT>'#13#10
  end
  object FlowLine11: TFlowLine
    Left = 340
    Top = 543
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine10: TFlowLine
    Left = 530
    Top = 468
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine16: TFlowLine
    Left = 720
    Top = 468
    Width = 140
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
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 530
    Top = 543
    Width = 326
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression1: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine2'
    Description = 'Abrir consulta'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'vTabela'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuer' +
      'y">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ' +
      '><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;SMB_AREA_JURISDICAO.AJ_I' +
      'D,'#13#10'&#x20;&#x20;SERVIDOR_VI.DADOS_SERVIDOR'#13#10'From'#13#10'&#x20;&#x20;SM' +
      'B_AREA_JURISDICAO'#13#10'&#x20;&#x20;Left&#x20;Join'#13#10'&#x20;&#x20;SERVI' +
      'DOR_VI&#x20;On&#x20;SERVIDOR_VI.SER_ID&#x20;=&#x20;SMB_AREA_JURI' +
      'SDICAO.SER_ID_RESPONSAVEL'#13#10'Where'#13#10'&#x20;&#x20;SMB_AREA_JURISDICA' +
      'O.AJ_ID&#x20;=&#x20;:AJ_ID'#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMM' +
      'AND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="AJ_ID">'#13#10'<VARIABLE NAME="pAJ_ID"/>' +
      #13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</CONSTANT>'#13#10'<CONSTANT TYPE="Le' +
      'tras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VA' +
      'LOR><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;SMB_AREA_JURISDICAO.A' +
      'J_ID,'#13#10'&#x20;&#x20;SERVIDOR_VI.DADOS_SERVIDOR'#13#10'From'#13#10'&#x20;&#x20' +
      ';SMB_AREA_JURISDICAO'#13#10'&#x20;&#x20;Left&#x20;Join'#13#10'&#x20;&#x20;SE' +
      'RVIDOR_VI&#x20;On&#x20;SERVIDOR_VI.SER_ID&#x20;=&#x20;SMB_AREA_J' +
      'URISDICAO.SER_ID_RESPONSAVEL'#13#10'Where'#13#10'&#x20;&#x20;SMB_AREA_JURISD' +
      'ICAO.AJ_ID&#x20;=&#x20;:AJ_ID'#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</C' +
      'OMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="AJ_ID">'#13#10'<VARIABLE NAME="pAJ_ID' +
      '"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iS' +
      'VNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8U1FMPg0KU2VsZWN0DQomI3gyMDsmI3gyM' +
      'DtTTUJfQVJFQV9KVVJJU0RJQ0FPLkFKX0lELA0KJiN4MjA7JiN4MjA7U0VSVklET' +
      '1JfVkkuREFET1NfU0VSVklET1INCkZyb20NCiYjeDIwOyYjeDIwO1NNQl9BUkVBX' +
      '0pVUklTRElDQU8NCiYjeDIwOyYjeDIwO0xlZnQmI3gyMDtKb2luDQomI3gyMDsmI' +
      '3gyMDtTRVJWSURPUl9WSSYjeDIwO09uJiN4MjA7U0VSVklET1JfVkkuU0VSX0lEJ' +
      'iN4MjA7PSYjeDIwO1NNQl9BUkVBX0pVUklTRElDQU8uU0VSX0lEX1JFU1BPTlNBV' +
      'kVMDQpXaGVyZQ0KJiN4MjA7JiN4MjA7U01CX0FSRUFfSlVSSVNESUNBTy5BSl9JR' +
      'CYjeDIwOz0mI3gyMDs6QUpfSUQNCjwvU1FMPg0KDQo8UEFSQU1TPg0KPERFRklOR' +
      'SBOQU1FPSJBSl9JRCI+DQo8VkFMVUU+DQpAcEFKX0lEDQo8L1ZBTFVFPg0KPERJQ' +
      'UdSQU1YTUw+DQpQRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWR' +
      'DROQ2drOFZFOWlhbFpoY21saFlteGxQZzBLQ1FrOFNVUStNVHd2U1VRK0RRb0pDV' +
      'HhPVDAxRlBsWkJVa2xCUWt4RlBDOU9UMDFGUGcwS0NRazhWRVZZVkQ1d1FVcGZTV' +
      'VE4TDFSRldGUStEUW9KQ1R4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2drSlBGUkpVR' +
      'TgrU1c1MFpXbHliend2VkVsUVR6NE5DZ2tKUEVsT1EwOU5VRUZVU1ZaRlRENVVVb' +
      'FZGUEM5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1R4TlMxSmZWa1ZTVTBsUFRqNDFMa' +
      'kF1TUM0ek16d3ZUVXRTWDFaRlVsTkpUMDQrRFFvSlBDOVVUMkpxVm1GeWFXRmliR' +
      '1UrRFFvOEwxSlBUMVErRFFvPQ0KPC9ESUFHUkFNWE1MPg0KPEVYUFJFU1NJT04+D' +
      'QpQRlpCVWtsQlFreEZJRTVCVFVVOUluQkJTbDlKUkNJdlBnPT0NCjwvRVhQUkVTU' +
      '0lPTj4NCjwvREVGSU5FPg0KPC9QQVJBTVM+DQo8L1JPT1Q+DQo=</DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine6: TFlowLine
    Left = 265
    Top = 198
    Width = 64
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine2: TFlowLine
    Left = 265
    Top = 271
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
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression6: TFlowExpression
    Left = 210
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine4'
    Description = 'Obter dados Servidor'
    Text = 'Campo(@vTabela,DADOS_SERVIDOR)'
    ReturnVar = 'vDados'
    Expression = 
      '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIA' +
      'BLE NAME="vTabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX ' +
      '= "1" >DADOS_SERVIDOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>vTabela</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVari' +
      'able>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>DADO' +
      'S_SERVIDOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression3: TFlowExpression
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine5'
    Description = 'Fechar consulta'
    Text = 'Fechar Consulta(@vTabela)'
    Expression = 
      '<FUNCTION NAME="Fechar&#x20;Consulta" REALNAME="ebfSQLClose">'#13#10'<' +
      'PARAMS>'#13#10'<VARIABLE NAME="vTabela"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLClose</TEXT>'#13#10#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVariabl' +
      'e>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>vTabela' +
      '</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 265
    Top = 421
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
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 265
    Top = 346
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
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
    OutputNames = 'FlowLine14;FlowLine15'
    Description = 'Est'#225' em modo navega'#231#227'o?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormIsInBrowser' +
      'Mode</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Est&#225;&#x20;em&#x20;Modo&#x20;de&#x20;Navega&' +
      '#231;&#227;o?" REALNAME="ebfFormIsInBrowserMode">'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 17
    Width = 40
    Height = 116
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowStart1'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 265
    Top = 93
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowDecision1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector3: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine17'
  end
  object FlowLine15: TFlowLine
    Left = 265
    Top = 92
    Width = 610
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowConnector3'
    Description = 'SIM'
    Region = 0
    Style = psDash
    Decision = True
  end
  object FlowLine17: TFlowLine
    Left = 835
    Top = 92
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
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
end

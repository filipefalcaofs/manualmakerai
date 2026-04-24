object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
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
    ChangeDescription = False
    OutputNames = 'FlowLine1'
    Description = 'Inicio'
    InputParams = 
      'Itinerario,Variante,,;ITI_ID,Inteiro,,;Sentido,Letras,50,;TIPO,L' +
      'etras,50,'
    Variables = 
      'ITD_ID,Inteiro,,;ExisteItinerario,L'#243'gico,,;Contador,Inteiro,,1;T' +
      'amanho da Lista,Inteiro,,;Bairro,Letras,50,;EnderecoCepOsm,Varia' +
      'nte,,;DadosBairro,Variante,,;URLApiNominatim,Letras,50,;TabelaAP' +
      'I,Tabela,,;JsonTexto,Letras,50,;DistanciaKM,Inteiro,,;Insert,Let' +
      'ras,50,;Erro,Letras,50,'
    WorkFormCod = -1
    WorkFormGUID = '{70291062-0AA0-48AD-AB9F-FD3FE310D821}'
  end
  object FlowDecision2: TFlowDecision
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
    InputNames = 'FlowLine8;FlowLine4'
    OutputNames = 'FlowLine2;FlowLine7'
    Description = 'Possui elemento ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isMinorOrEqual</TEXT>'#13#10#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>Contador</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.0' +
      '.1</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID' +
      '>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Tamanho da Lista</' +
      'TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.0.1</MKR_VER' +
      'SION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT' +
      '>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Menor ou Igual" REALNAME="isMinorOrEqual">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Contador"/>'#13#10#9#9#9'<VARIABLE NAME="Tama' +
      'nho da Lista"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = True
  end
  object FlowExpression4: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine5;FlowLine12;FlowLine15'
    OutputNames = 'FlowLine8'
    Description = 'Incrementa o contador'
    Text = 'Soma(@Contador,1)'
    ReturnVar = 'Contador'
    Expression = 
      #9'<FUNCTION NAME="Soma" REALNAME="oprAdd">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIA' +
      'BLE NAME="Contador"/>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">' +
      '1</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprAdd</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
      #13#10#9#9'<TIPO>N'#250'mero</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Contador' +
      '</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.0.1</MKR_V' +
      'ERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9 +
      #9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10#9#9#9#9'<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>1</VALOR>'#13 +
      #10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<G' +
      'UID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9 +
      #9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression2: TFlowExpression
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
    InputNames = 'FlowLine3;FlowLine19'
    OutputNames = 'FlowLine4'
    Description = 'Tamanho da lista'
    Text = 'Tamanho da Lista(@Itinerario)'
    ReturnVar = 'Tamanho da Lista'
    Expression = 
      #9'<FUNCTION NAME="Tamanho da Lista" REALNAME="ebfListLength">'#13#10#9#9 +
      '<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Itinerario"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNC' +
      'TION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfListLength</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TO' +
      'bjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEX' +
      'T>Itinerario</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</T' +
      'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine8: TFlowLine
    Left = 910
    Top = 468
    Width = 80
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision1: TFlowDecision
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine10;FlowLine9'
    Description = 'Itiner'#225'rio '#233' nulo?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>Itinerario</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFu' +
      'nction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Itinerario"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCT' +
      'ION>'#13#10
    Loop = False
  end
  object FlowEnd2: TFlowEnd
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
    ChangeDescription = False
    InputNames = 'FlowLine10'
    Description = 'Fim'
  end
  object FlowExpression11: TFlowExpression
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine16'
    Description = 'Obter URL da api API Nominatim'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'TabelaAPI'
    Expression = 
      #9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13 +
      #10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><PSQL' +
      '>'#13#10#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  SMB_CONFIGURACAO_API.API_COD,'#13#10'  SM' +
      'B_CONFIGURACAO_API.API_DESCRICAO,'#13#10'  SMB_CONFIGURACAO_API.API_PR' +
      'ODUCAO,'#13#10'  SMB_CONFIGURACAO_API.API_ACAO,'#13#10'  SMB_CONFIGURACAO_AP' +
      'I.API_URL_HOMOLOGACAO,'#13#10'  SMB_CONFIGURACAO_API.API_URL_PRODUCAO,' +
      #13#10'  SMB_CONFIGURACAO_API.PGL_COD,'#13#10'  Case'#13#10'    When SMB_CONFIGUR' +
      'ACAO_API.API_PRODUCAO ='#13#10'    '#39'S'#39' Then SMB_CONFIGURACAO_API.API_U' +
      'RL_PRODUCAO'#13#10'    Else SMB_CONFIGURACAO_API.API_URL_HOMOLOGACAO E' +
      'nd As API_URL_USADA'#13#10'From'#13#10'  SMB_CONFIGURACAO_API'#13#10'Where'#13#10'  SMB_' +
      'CONFIGURACAO_API.API_DESCRICAO = '#39'API Nominatim'#39#13#10#13#10#13#10'/*WHERE_AD' +
      'D*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9#9'</PSQL></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></' +
      'CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>5</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteQuery</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13 +
      #10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  ' +
      'SMB_CONFIGURACAO_API.API_COD,'#13#10'  SMB_CONFIGURACAO_API.API_DESCRI' +
      'CAO,'#13#10'  SMB_CONFIGURACAO_API.API_PRODUCAO,'#13#10'  SMB_CONFIGURACAO_A' +
      'PI.API_ACAO,'#13#10'  SMB_CONFIGURACAO_API.API_URL_HOMOLOGACAO,'#13#10'  SMB' +
      '_CONFIGURACAO_API.API_URL_PRODUCAO,'#13#10'  SMB_CONFIGURACAO_API.PGL_' +
      'COD,'#13#10'  Case'#13#10'    When SMB_CONFIGURACAO_API.API_PRODUCAO ='#13#10'    ' +
      #39'S'#39' Then SMB_CONFIGURACAO_API.API_URL_PRODUCAO'#13#10'    Else SMB_CON' +
      'FIGURACAO_API.API_URL_HOMOLOGACAO End As API_URL_USADA'#13#10'From'#13#10'  ' +
      'SMB_CONFIGURACAO_API'#13#10'Where'#13#10'  SMB_CONFIGURACAO_API.API_DESCRICA' +
      'O = '#39'API Nominatim'#39#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND' +
      '>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</PSQL></VALOR>'#13#10#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iM' +
      'S4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIFNNQl9DT05GSUdVUkFDQ' +
      'U9fQVBJLkFQSV9DT0QsDQogIFNNQl9DT05GSUdVUkFDQU9fQVBJLkFQSV9ERVNDU' +
      'klDQU8sDQogIFNNQl9DT05GSUdVUkFDQU9fQVBJLkFQSV9QUk9EVUNBTywNCiAgU' +
      '01CX0NPTkZJR1VSQUNBT19BUEkuQVBJX0FDQU8sDQogIFNNQl9DT05GSUdVUkFDQ' +
      'U9fQVBJLkFQSV9VUkxfSE9NT0xPR0FDQU8sDQogIFNNQl9DT05GSUdVUkFDQU9fQ' +
      'VBJLkFQSV9VUkxfUFJPRFVDQU8sDQogIFNNQl9DT05GSUdVUkFDQU9fQVBJLlBHT' +
      'F9DT0QsDQogIENhc2UNCiAgICBXaGVuIFNNQl9DT05GSUdVUkFDQU9fQVBJLkFQS' +
      'V9QUk9EVUNBTyA9DQogICAgJ1MnIFRoZW4gU01CX0NPTkZJR1VSQUNBT19BUEkuQ' +
      'VBJX1VSTF9QUk9EVUNBTw0KICAgIEVsc2UgU01CX0NPTkZJR1VSQUNBT19BUEkuQ' +
      'VBJX1VSTF9IT01PTE9HQUNBTyBFbmQgQXMgQVBJX1VSTF9VU0FEQQ0KRnJvbQ0KI' +
      'CBTTUJfQ09ORklHVVJBQ0FPX0FQSQ0KV2hlcmUNCiAgU01CX0NPTkZJR1VSQUNBT' +
      '19BUEkuQVBJX0RFU0NSSUNBTyA9ICdBUEkgTm9taW5hdGltJw0KLypXSEVSRV9BR' +
      'EQqLw0KLypPUkRFUl9ORVcqLw0KPC9TUUw+DQoJPFBBUkFNUz4NCgk8L1BBUkFNU' +
      'z4NCjwvUk9PVD4NCg==</DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>5</ID>'#13#10 +
      #9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR' +
      '>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<' +
      'GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10 +
      #9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision5: TFlowDecision
    Left = 400
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
    OutputNames = 'FlowLine20;FlowLine26'
    Description = 'Existe API cadastrada?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLEOF</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVar' +
      'iable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Tab' +
      'elaAPI</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>' +
      #13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">'#13#10#9#9'<PA' +
      'RAMS>'#13#10#9#9#9'<VARIABLE NAME="TabelaAPI"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
      '>'#13#10
    Loop = False
  end
  object FlowLine16: TFlowLine
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowDecision5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression12: TFlowExpression
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
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine22'
    Description = 'Pega URL de dev'
    Text = 'http://23.23.190.42:5088/reverse?lat={lat}&lon={lon}&format=json'
    ReturnVar = 'URLApiNominatim'
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">http://23.23.190.42:5088/r' +
      'everse?lat={lat}&amp;lon={lon}&amp;format=json</CONSTANT>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>1</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<VALOR>http://23.23.190.42:5088/r' +
      'everse?lat={lat}&amp;lon={lon}&amp;format=json</VALOR>'#13#10#9#9'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALS' +
      'E</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
  end
  object FlowLine20: TFlowLine
    Left = 455
    Top = 421
    Width = 64
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression12'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector6: TFlowConnector
    Left = 650
    Top = 397
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
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine19'
  end
  object FlowLine22: TFlowLine
    Left = 530
    Top = 393
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
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowConnector6'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression13: TFlowExpression
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
    InputNames = 'FlowLine26'
    OutputNames = 'FlowLine29'
    Description = 'Pega URL cadastrada'
    Text = 'Campo(@TabelaAPI,API_URL_USADA)'
    ReturnVar = 'URLApiNominatim'
    Expression = 
      #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
      '<VARIABLE NAME="TabelaAPI"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NULL="FA' +
      'LSE" INDEX="7">API_URL_USADA</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTIO' +
      'N>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
      'EL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
      'TabelaAPI</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13 +
      #10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3<' +
      '/ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>AP' +
      'I_URL_USADA</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>7</' +
      'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine26: TFlowLine
    Left = 455
    Top = 498
    Width = 60
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression13'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowConnector8: TFlowConnector
    Left = 650
    Top = 547
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
    InputNames = 'FlowLine29'
    OutputNames = 'FlowLine3'
  end
  object FlowLine29: TFlowLine
    Left = 530
    Top = 543
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowConnector8'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowDecision7: TFlowDecision
    Left = 1350
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
    InputNames = 'FlowLine28'
    OutputNames = 'FlowLine12;FlowLine11'
    Description = 'bairro homologado '#233' nulo?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>5</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>Bairro</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction' +
      '>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Bairro"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>' +
      #13#10
    Loop = False
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 1350
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
    ChangeDescription = False
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine34'
    Description = 'Geral - Obter dados do bairro'
    Id = 1331
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'C'#243'digo do Bairro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VE' +
          'RSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<VALOR></VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NULO>' +
          #13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE' +
          '></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Nome do Bairro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>9</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
          #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>14</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
          #10#9#9#9#9'<TEXT>EnderecoCepOsm</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
          'O>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
          'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObj' +
          'Const>'#13#10#9#9#9#9'<ID>13</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></' +
          'TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOM' +
          'PATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VER' +
          'SION>'#13#10#9#9#9#9'<VALOR>bairro</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
          '>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<F' +
          'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Sigla do Bairro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<VALOR></VALOR>'#13#10#9#9'<DMLTYPE>dtSel' +
          'ect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NULO>'#13 +
          #10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'C'#243'digo do Bairro'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Nome do Bairro'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
          'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9'<CO' +
          'NSTANT TYPE="Letras" NULL="FALSE">bairro</CONSTANT>'#13#10#9#9'</PARAMS>' +
          #13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'Sigla do Bairro'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'C'#243'digo do Bairro'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'Nome do Bairro'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@EnderecoCepOsm,bairro)'
      end
      item
        DataType = ftString
        Name = 'Sigla do Bairro'
        ParamType = ptInput
        Value = 'Nulo'
      end>
    Return = 'DadosBairro'
    ObjectName = 'Geral - Obter dados do bairro'
    RealName = 'CALLRULE'
  end
  object FlowExpression16: TFlowExpression
    Left = 1350
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
    InputNames = 'FlowLine34'
    OutputNames = 'FlowLine27'
    Description = 'Obter nome do bairro'
    Text = 
      'JSON - Obter Valor(Obter Objeto da Lista(@DadosBairro,1),nome_ba' +
      'irro)'
    ReturnVar = 'Bairro'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Obter Objeto da Lista" RE' +
      'ALNAME="ebfGetElementFromList">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NA' +
      'ME="DadosBairro"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">1' +
      '</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="L' +
      'etras" NULL="FALSE">nome_bairro</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNC' +
      'TION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10 +
      #9#9#9#9'<TEXT>ebfGetElementFromList</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TO' +
      'bjVariable>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9 +
      #9#9'<TEXT>DadosBairro</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>' +
      'Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9 +
      #9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9 +
      #9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</T' +
      'IPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NU' +
      'LO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID>' +
      '</GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9 +
      #9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>' +
      #13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>nome_' +
      'bairro</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9 +
      '</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine34: TFlowLine
    Left = 1405
    Top = 273
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowExpression16'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine5: TFlowSubRoutine
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
    InputNames = 'FlowLine31'
    OutputNames = 'FlowLine32'
    Description = 'LTI - Consultar se existe itiner'#225'rio detalhado'
    Id = 1599
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'ITI_ID'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>ITI_ID</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
          #13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          #9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>' +
          #13#10
      end
      item
        DataType = ftString
        Name = 'Sentido'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Sentido</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
          '>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          #9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>' +
          #13#10
      end
      item
        DataType = ftString
        Name = 'lat'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
          #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
          #9#9#9#9'<TEXT>EnderecoCepOsm</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO' +
          '>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<M' +
          'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjC' +
          'onst>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TE' +
          'XT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPA' +
          'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
          'ON>'#13#10#9#9#9#9'<VALOR>latitude</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
          '>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<F' +
          'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'lon'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
          #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
          #9#9#9#9'<TEXT>EnderecoCepOsm</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO' +
          '>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<M' +
          'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjC' +
          'onst>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TE' +
          'XT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPA' +
          'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
          'ON>'#13#10#9#9#9#9'<VALOR>longitude</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<' +
          'FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10 +
          '</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'ITI_ID'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="ITI_ID"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'Sentido'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="Sentido"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'lat'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
          'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9'<CO' +
          'NSTANT TYPE="Letras" NULL="FALSE">latitude</CONSTANT>'#13#10#9#9'</PARAM' +
          'S>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'lon'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
          'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9'<CO' +
          'NSTANT TYPE="Letras" NULL="FALSE">longitude</CONSTANT>'#13#10#9#9'</PARA' +
          'MS>'#13#10#9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'ITI_ID'
        ParamType = ptInput
        Value = '@ITI_ID'
      end
      item
        DataType = ftString
        Name = 'Sentido'
        ParamType = ptInput
        Value = '@Sentido'
      end
      item
        DataType = ftString
        Name = 'lat'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@EnderecoCepOsm,latitude)'
      end
      item
        DataType = ftString
        Name = 'lon'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@EnderecoCepOsm,longitude)'
      end>
    Return = 'ExisteItinerario'
    ObjectName = 'LTI - Consultar se existe itiner'#225'rio detalhado'
    RealName = 'CALLRULE'
  end
  object FlowDecision6: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine32'
    OutputNames = 'FlowLine5;FlowLine6'
    Description = 'Existe itiner'#225'rio?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>ExisteItinerario</TEXT>'#13#10#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9'</TObjVariable>' +
      #13#10'</ROOT>'#13#10
    Expression = #9'<VARIABLE NAME="ExisteItinerario"/>'#13#10
    Loop = False
  end
  object FlowLine32: TFlowLine
    Left = 910
    Top = 244
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
    InputNames = 'FlowSubRoutine5'
    OutputNames = 'FlowDecision6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine3: TFlowSubRoutine
    Left = 780
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
    ShowHint = False
    ChangeDescription = False
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine31'
    Description = 'LTI - Montar JSON tratado do OSM'
    Id = 1729
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'UrlApi'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfReplace</TEXT>'#13#10#9#9'<SQL>FALSE</' +
          'SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
          '>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFu' +
          'nction>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>eb' +
          'fReplace</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10 +
          #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.3' +
          '3</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>1<' +
          '/ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>URLApiNominatim</' +
          'TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9 +
          '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33<' +
          '/MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID' +
          '>1</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9 +
          #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVE' +
          'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
          '>'#13#10#9#9#9#9#9#9'<VALOR>{lat}</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>' +
          #13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9 +
          #9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPEC' +
          'IALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10 +
          #9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfRe' +
          'place</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13 +
          #10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.' +
          '0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9 +
          #9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>eb' +
          'fGetElementFromList</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<T' +
          'IPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10 +
          #9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9 +
          #9#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>FU' +
          'NCTION</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>ebfGetElementFromList</TEXT>'#13#10#9#9#9 +
          #9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9 +
          #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5' +
          '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<TObjVaria' +
          'ble>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
          #10#9#9#9#9#9#9#9#9#9#9#9#9'<TEXT>Itinerario</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQ' +
          'L>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL' +
          '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VE' +
          'RSION>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9 +
          #9#9#9#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9 +
          #9#9#9#9#9#9'<TEXT>Contador</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9 +
          #9#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9 +
          #9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</TObjFu' +
          'nction>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<' +
          'NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VE' +
          'RSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect<' +
          '/DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9#9#9'<NULO>' +
          'FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9'<' +
          'GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9'</' +
          'TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9'<T' +
          'ObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9 +
          #9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Let' +
          'ras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9 +
          '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>,</VALOR>'#13#10#9 +
          #9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRA' +
          'MXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCOD' +
          'E>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13 +
          #10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<' +
          'SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATI' +
          'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VER' +
          'SION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>.</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLT' +
          'YPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NU' +
          'LO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13 +
          #10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9 +
          #9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFuncti' +
          'on>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10 +
          #9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>' +
          #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0' +
          '.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>{lon}</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSele' +
          'ct</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NU' +
          'LO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SP' +
          'ECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9 +
          #9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfReplace</T' +
          'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMP' +
          'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERS' +
          'ION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9 +
          #9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfGetElementFromList</TEXT>' +
          #13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<IN' +
          'COMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR' +
          '_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>2<' +
          '/ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfGetElement' +
          'FromList</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Variant' +
          'e</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<M' +
          'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<T' +
          'ObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NO' +
          'ME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>Itinerario</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQ' +
          'L>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FAL' +
          'SE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
          #13#10#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<' +
          'ID>2</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>Cont' +
          'ador</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Inteiro' +
          '</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9 +
          #9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10 +
          #9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9 +
          #9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>' +
          '</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13 +
          #10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSIO' +
          'N>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>2</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DML' +
          'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
          #9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9 +
          #9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9 +
          '</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjC' +
          'onst>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEX' +
          'T></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9 +
          #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0' +
          '.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>,</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSele' +
          'ct</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE' +
          '</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13 +
          #10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TOb' +
          'jConst>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<T' +
          'EXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10 +
          #9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0' +
          '.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>.</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FAL' +
          'SE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID' +
          '>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</P' +
          'ARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROO' +
          'T>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'UrlApi'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Trocar Subsequ'#234'ncia" REALNAME="ebfReplace">'#13#10#9#9 +
          '<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Trocar Subsequ'#234'ncia" REALNAME="ebfR' +
          'eplace">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="URLApiNominatim"/>'#13 +
          #10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">{lat}</CONSTANT>'#13#10#9#9#9 +
          #9#9'<FUNCTION NAME="Trocar Subsequ'#234'ncia" REALNAME="ebfReplace">'#13#10#9 +
          #9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Obter Objeto da Lista" REA' +
          'LNAME="ebfGetElementFromList">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<FUNC' +
          'TION NAME="Obter Objeto da Lista" REALNAME="ebfGetElementFromLis' +
          't">'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Itinerario"/' +
          '>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Contador"/>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10 +
          #9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FA' +
          'LSE">1</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9 +
          #9'<CONSTANT TYPE="Letras" NULL="FALSE">,</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONS' +
          'TANT TYPE="Letras" NULL="FALSE">.</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
          #9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYP' +
          'E="Letras" NULL="FALSE">{lon}</CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="Tro' +
          'car Subsequ'#234'ncia" REALNAME="ebfReplace">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FU' +
          'NCTION NAME="Obter Objeto da Lista" REALNAME="ebfGetElementFromL' +
          'ist">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Obter Objeto da Li' +
          'sta" REALNAME="ebfGetElementFromList">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9 +
          #9#9#9'<VARIABLE NAME="Itinerario"/>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Conta' +
          'dor"/>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'<CONSTANT ' +
          'TYPE="Inteiro" NULL="FALSE">2</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9 +
          '</FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">,</CONSTA' +
          'NT>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">.</CONSTANT>'#13#10#9#9#9 +
          #9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'UrlApi'
        ParamType = ptInput
        Value = 
          'Trocar Subsequ'#234'ncia(Trocar Subsequ'#234'ncia(@URLApiNominatim,{lat},T' +
          'rocar Subsequ'#234'ncia(Obter Objeto da Lista(Obter Objeto da Lista(@' +
          'Itinerario,@Contador),1),,,.)),{lon},Trocar Subsequ'#234'ncia(Obter O' +
          'bjeto da Lista(Obter Objeto da Lista(@Itinerario,@Contador),2),,' +
          ',.))'
      end>
    Return = 'EnderecoCepOsm'
    ObjectName = 'LTI - Montar JSON tratado do OSM'
    RealName = 'CALLRULE'
  end
  object FlowLine31: TFlowLine
    Left = 835
    Top = 273
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
    InputNames = 'FlowSubRoutine3'
    OutputNames = 'FlowSubRoutine5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine10: TFlowLine
    Left = 75
    Top = 498
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowEnd2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine1: TFlowLine
    Left = 75
    Top = 411
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine9: TFlowLine
    Left = 150
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression11'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 720
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine5: TFlowLine
    Left = 1025
    Top = 273
    Width = 60
    Height = 206
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
    OutputNames = 'FlowExpression4'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine12: TFlowLine
    Left = 1100
    Top = 468
    Width = 270
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
    OutputNames = 'FlowExpression4'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine6: TFlowLine
    Left = 1100
    Top = 244
    Width = 270
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
    OutputNames = 'FlowSubRoutine1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
    Left = 1350
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
    InputNames = 'FlowLine27'
    OutputNames = 'FlowLine28'
    Description = 'Obter texto do json'
    Text = 'JSON - Obter Texto(@EnderecoCepOsm,)'
    ReturnVar = 'JsonTexto'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Texto" REALNAME="ebfGetJSONText">'#13 +
      #10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9'<CONSTANT ' +
      'TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
      '>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetJSONText</TEXT>'#13#10#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TO' +
      'bjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEX' +
      'T>EnderecoCepOsm</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9 +
      #9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9 +
      #9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine27: TFlowLine
    Left = 1405
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
    InputNames = 'FlowExpression16'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine28: TFlowLine
    Left = 1405
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowDecision7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
    Left = 1350
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine17;FlowLine13'
    Description = 'logradouro '#233' nulo ou vazio'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>V' +
      'ariante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariabl' +
      'e>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>E' +
      'nderecoCepOsm</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Varian' +
      'te</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>logradouro</VALOR>'#13#10#9#9#9#9#9#9'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<' +
      'NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUI' +
      'D></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13 +
      #10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction' +
      '>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGet' +
      'ValueObjectJson">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="EnderecoCe' +
      'pOsm"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">logradouro</C' +
      'ONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTIO' +
      'N>'#13#10
    Loop = False
  end
  object FlowLine11: TFlowLine
    Left = 1405
    Top = 498
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowDecision3'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression19: TFlowExpression
    Left = 1350
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine14'
    Description = ' Criar itiner'#225'rio detalhado (OSM)'
    Text = 'Executar Atualiza'#231#227'o(SQL ATUALIZA'#199#195'O,)'
    ReturnVar = 'ITD_ID'
    Expression = 
      #9'<FUNCTION NAME="Executar Atualiza'#231#227'o" REALNAME="ebfSQLExecuteUp' +
      'date">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="SQL Atualiza'#231#227'o" NULL="FA' +
      'LSE"><SQL TYPE="INSERT">'#13#10#9#9#9#9#9'<TABLE>SMB_ITINERARIO_DETALHE</TA' +
      'BLE>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITI_ID">'#13#10#9#9#9#9#9#9'<VARIABLE NAME="ITI_I' +
      'D"/>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITD_SEQUENCIA">'#13#10#9#9 +
      #9#9#9#9'<VARIABLE NAME="Contador"/>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIEL' +
      'D NAME="ITD_LOGRADOURO">'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Val' +
      'or" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9 +
      '<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE">logradouro</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'<' +
      '/FUNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITD_NUMERO">'#13 +
      #10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValue' +
      'ObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoC' +
      'epOsm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">numero</C' +
      'ONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13 +
      #10#9#9#9#9#9'<SQLFIELD NAME="ITD_BAIRRO">'#13#10#9#9#9#9#9#9'<VARIABLE NAME="Bairro' +
      '"/>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITD_MUNICIPIO">'#13#10#9#9#9 +
      #9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObje' +
      'ctJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOs' +
      'm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cidade</CONST' +
      'ANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9 +
      #9#9'<SQLFIELD NAME="ITD_UF">'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter V' +
      'alor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9 +
      #9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE">estado</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</F' +
      'UNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITD_CEP">'#13#10#9#9#9#9 +
      #9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjec' +
      'tJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOsm' +
      '"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cep</CONSTANT>' +
      #13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<S' +
      'QLFIELD NAME="ITD_PAIS">'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Val' +
      'or" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9 +
      '<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE">pais</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCT' +
      'ION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITD_LATITUDE">'#13#10#9#9#9 +
      #9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObje' +
      'ctJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOs' +
      'm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">latitude</CON' +
      'STANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9 +
      #9#9#9#9'<SQLFIELD NAME="ITD_LONGITUDE">'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON ' +
      '- Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS' +
      '>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE">longitude</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS' +
      '>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="ITD' +
      '_SENTIDO">'#13#10#9#9#9#9#9#9'<VARIABLE NAME="Sentido"/>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10 +
      #9#9#9#9#9'<SQLFIELD NAME="ITD_MD5_ARQUIVO">'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Le' +
      'tras" NULL="FALSE">OSM</CONSTANT>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9'</SQL>'#13 +
      #10#9#9#9'</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTA' +
      'NT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteUpdate</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<' +
      'TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>SQL Atualiza'#231#227'o</T' +
      'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR><SQL TYPE="INSERT">'#13#10#9#9#9#9#9#9'<TA' +
      'BLE>SMB_ITINERARIO_DETALHE</TABLE>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITI_ID' +
      '">'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="ITI_ID"/>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<' +
      'SQLFIELD NAME="ITD_SEQUENCIA">'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="Contador"' +
      '/>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_LOGRADOURO">'#13#10#9 +
      #9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueO' +
      'bjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Endereco' +
      'CepOsm"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">logrado' +
      'uro</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</S' +
      'QLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_NUMERO">'#13#10#9#9#9#9#9#9#9'<FUNCTION N' +
      'AME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9 +
      #9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">numero</CONSTANT>'#13#10#9#9#9#9#9 +
      #9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLF' +
      'IELD NAME="ITD_BAIRRO">'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="Bairro"/>'#13#10#9#9#9#9#9 +
      #9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_MUNICIPIO">'#13#10#9#9#9#9#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13 +
      #10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cidade</CONSTANT>' +
      #13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9 +
      #9#9'<SQLFIELD NAME="ITD_UF">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter ' +
      'Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9 +
      #9#9#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE">estado</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9 +
      #9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_CEP' +
      '">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetV' +
      'alueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="End' +
      'erecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">ce' +
      'p</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQL' +
      'FIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_PAIS">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME=' +
      '"JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">pais</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</P' +
      'ARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD N' +
      'AME="ITD_LATITUDE">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" ' +
      'REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<V' +
      'ARIABLE NAME="EnderecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE">latitude</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</' +
      'FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_LONGITUD' +
      'E">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGet' +
      'ValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="En' +
      'derecoCepOsm"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">l' +
      'ongitude</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9 +
      #9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="ITD_SENTIDO">'#13#10#9#9#9#9#9#9#9'<VARI' +
      'ABLE NAME="Sentido"/>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="' +
      'ITD_MD5_ARQUIVO">'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">O' +
      'SM</CONSTANT>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'</SQL>'#13#10#9#9#9#9'</VALOR>'#13#10#9#9#9 +
      #9'<DMLTYPE>dtInsert</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj' +
      '0iMS4wIj8+DQo8Uk9PVD4NCgk8VERNTFRhYmxlPjxOQU1FPlNNQl9JVElORVJBUk' +
      'lPX0RFVEFMSEU8L05BTUU+PFJFQUxOQU1FPlNNQl9JVElORVJBUklPX0RFVEFMSE' +
      'U8L1JFQUxOQU1FPjxESUFHUkFNWE1MPjwvRElBR1JBTVhNTD48L1RETUxUYWJsZT' +
      '4NCgk8VERNTEZpZWxkPjxOQU1FPklkZW50aWZpY2Fkb3IgKElUSV9JRCk8L05BTU' +
      'U+PFJFQUxOQU1FPklUSV9JRDwvUkVBTE5BTUU+PERJQUdSQU1YTUw+UEQ5NGJXd2' +
      'dkbVZ5YzJsdmJqMGlNUzR3SWo4K0RRbzhVazlQVkQ0TkNnazhWRTlpYWxaaGNtbG' +
      'hZbXhsUGcwS0NRazhTVVErTVR3dlNVUStEUW9KQ1R4T1QwMUZQbFpCVWtsQlFreE' +
      'ZQQzlPVDAxRlBnMEtDUWs4VkVWWVZENUpWRWxmU1VROEwxUkZXRlErRFFvSkNUeF' +
      'RVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pQRlJKVUU4K1NXNTBaV2x5Ynp3dlZFbF' +
      'FUejROQ2drSlBFbE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUk' +
      'pWa1ZNUGcwS0NRazhUVXRTWDFaRlVsTkpUMDQrTlM0d0xqQXVNek04TDAxTFVsOV' +
      'dSVkpUU1U5T1BnMEtDVHd2VkU5aWFsWmhjbWxoWW14bFBnMEtQQzlTVDA5VVBnME' +
      's8L0RJQUdSQU1YTUw+PFZBTFVFPkBJVElfSUQ8L1ZBTFVFPg0KCQk8RVhQUkVTU0' +
      'lPTj48VkFSSUFCTEUgTkFNRT0iSVRJX0lEIi8+PC9FWFBSRVNTSU9OPg0KCTwvVE' +
      'RNTEZpZWxkPg0KCTxURE1MRmllbGQ+PE5BTUU+U2VxdWVuY2lhIChJVERfU0VRVU' +
      'VOQ0lBKTwvTkFNRT48UkVBTE5BTUU+SVREX1NFUVVFTkNJQTwvUkVBTE5BTUU+PE' +
      'RJQUdSQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWo4K0RRbzhVazlQVk' +
      'Q0TkNnazhWRTlpYWxaaGNtbGhZbXhsUGcwS0NRazhTVVErTVR3dlNVUStEUW9KQ1' +
      'R4T1QwMUZQbFpCVWtsQlFreEZQQzlPVDAxRlBnMEtDUWs4VkVWWVZENURiMjUwWV' +
      'dSdmNqd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtDUWs4Vk' +
      'VsUVR6NUpiblJsYVhKdlBDOVVTVkJQUGcwS0NRazhTVTVEVDAxUVFWUkpWa1ZNUG' +
      'taQlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRb0pDVHhOUzFKZlZrVlNVMGxQVG' +
      'o0MUxqQXVNQzR5T1R3dlRVdFNYMVpGVWxOSlQwNCtEUW9KUEM5VVQySnFWbUZ5YV' +
      'dGaWJHVStEUW84TDFKUFQxUStEUW89PC9ESUFHUkFNWE1MPjxWQUxVRT5AQ29udG' +
      'Fkb3I8L1ZBTFVFPg0KCQk8RVhQUkVTU0lPTj48VkFSSUFCTEUgTkFNRT0iQ29udG' +
      'Fkb3IiLz48L0VYUFJFU1NJT04+DQoJPC9URE1MRmllbGQ+DQoJPFRETUxGaWVsZD' +
      '48TkFNRT5JVERfTE9HUkFET1VSTzwvTkFNRT48UkVBTE5BTUU+SVREX0xPR1JBRE' +
      '9VUk88L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTV' +
      'M0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1' +
      'VRK01Ud3ZTVVErRFFvSkNUeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1' +
      'FrOFZFVllWRDVsWW1aSFpYUldZV3gxWlU5aWFtVmpkRXB6YjI0OEwxUkZXRlErRF' +
      'FvSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pQRlJKVUU4K1ZtRnlhV0Z1ZE' +
      'dVOEwxUkpVRTgrRFFvSkNUeEpUa05QVFZCQlZFbFdSVXcrVkZKVlJUd3ZTVTVEVD' +
      'AxUVFWUkpWa1ZNUGcwS0NRazhUVXRTWDFaRlVsTkpUMDQrTlM0d0xqQXVNek04TD' +
      'AxTFVsOVdSVkpUU1U5T1BnMEtDUWs4VUVGU1FVMVRQZzBLQ1FrSlBGUlBZbXBXWV' +
      'hKcFlXSnNaVDROQ2drSkNRazhTVVErT0R3dlNVUStEUW9KQ1FrSlBFNVBUVVUrVm' +
      'tGU1NVRkNURVU4TDA1UFRVVStEUW9KQ1FrSlBGUkZXRlErUlc1a1pYSmxZMjlEWl' +
      'hCUGMyMDhMMVJGV0ZRK0RRb0pDUWtKUEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLQ1' +
      'FrSkNUeFVTVkJQUGxaaGNtbGhiblJsUEM5VVNWQlBQZzBLQ1FrSkNUeEpUa05QVF' +
      'ZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0pDUWs4VF' +
      'V0U1gxWkZVbE5KVDA0K05TNHdMakF1TXpNOEwwMUxVbDlXUlZKVFNVOU9QZzBLQ1' +
      'FrSlBDOVVUMkpxVm1GeWFXRmliR1UrRFFvSkNRazhWRTlpYWtOdmJuTjBQZzBLQ1' +
      'FrSkNUeEpSRDR6UEM5SlJENE5DZ2tKQ1FrOFRrOU5SVDVEVDA1VFZFRk9WRHd2VG' +
      's5TlJUNE5DZ2tKQ1FrOFZFVllWRDQ4TDFSRldGUStEUW9KQ1FrSlBGTlJURDVHUV' +
      'V4VFJUd3ZVMUZNUGcwS0NRa0pDVHhVU1ZCUFBreGxkSEpoY3p3dlZFbFFUejROQ2' +
      'drSkNRazhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUl' +
      'V3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1U5T1BqVXVNQzR3TGpNelBDOU5TMUpmVm' +
      'tWU1UwbFBUajROQ2drSkNRazhWa0ZNVDFJK2JHOW5jbUZrYjNWeWJ6d3ZWa0ZNVD' +
      'FJK0RRb0pDUWtKUEVSTlRGUlpVRVUrWkhSVFpXeGxZM1E4TDBSTlRGUlpVRVUrRF' +
      'FvSkNRa0pQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEtDUWtKQ1' +
      'R4T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS0NRa0pDVHhHU1VWTVJFbE9SRVZZUG' +
      'kweFBDOUdTVVZNUkVsT1JFVllQZzBLQ1FrSkNUeEhWVWxFUGp3dlIxVkpSRDROQ2' +
      'drSkNRazhVMUJGUTBsQlRFTlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5DZ2tKQ1' +
      'R3dlZFOWlha052Ym5OMFBnMEtDUWs4TDFCQlVrRk5VejROQ2drOEwxUlBZbXBHZF' +
      'c1amRHbHZiajROQ2p3dlVrOVBWRDROQ2c9PTwvRElBR1JBTVhNTD48VkFMVUU+Sl' +
      'NPTiAtIE9idGVyIFZhbG9yKEBFbmRlcmVjb0NlcE9zbSxsb2dyYWRvdXJvKTwvVk' +
      'FMVUU+DQoJCTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJKU09OIC0gT2J0ZX' +
      'IgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg0KCQkJCT' +
      'xQQVJBTVM+DQoJCQkJCTxWQVJJQUJMRSBOQU1FPSJFbmRlcmVjb0NlcE9zbSIvPg' +
      '0KCQkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+bG9ncm' +
      'Fkb3VybzwvQ09OU1RBTlQ+DQoJCQkJPC9QQVJBTVM+DQoJCQk8L0ZVTkNUSU9OPj' +
      'wvRVhQUkVTU0lPTj4NCgk8L1RETUxGaWVsZD4NCgk8VERNTEZpZWxkPjxOQU1FPk' +
      'lURF9OVU1FUk88L05BTUU+PFJFQUxOQU1FPklURF9OVU1FUk88L1JFQUxOQU1FPj' +
      'xESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84VWs5UF' +
      'ZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK01URThMMGxFUGcwS0' +
      'NRazhUazlOUlQ1R1ZVNURWRWxQVGp3dlRrOU5SVDROQ2drSlBGUkZXRlErWldKbV' +
      'IyVjBWbUZzZFdWUFltcGxZM1JLYzI5dVBDOVVSVmhVUGcwS0NRazhVMUZNUGtaQl' +
      'RGTkZQQzlUVVV3K0RRb0pDVHhVU1ZCUFBsWmhjbWxoYm5SbFBDOVVTVkJQUGcwS0' +
      'NRazhTVTVEVDAxUVFWUkpWa1ZNUGxSU1ZVVThMMGxPUTA5TlVFRlVTVlpGVEQ0Tk' +
      'Nna0pQRTFMVWw5V1JWSlRTVTlPUGpVdU1DNHdMak16UEM5TlMxSmZWa1ZTVTBsUF' +
      'RqNE5DZ2tKUEZCQlVrRk5VejROQ2drSkNUeFVUMkpxVm1GeWFXRmliR1UrRFFvSk' +
      'NRa0pQRWxFUGpFMVBDOUpSRDROQ2drSkNRazhUazlOUlQ1V1FWSkpRVUpNUlR3dl' +
      'RrOU5SVDROQ2drSkNRazhWRVZZVkQ1RmJtUmxjbVZqYjBObGNFOXpiVHd2VkVWWV' +
      'ZENE5DZ2tKQ1FrOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvSkNRa0pQRlJKVUU4K1' +
      'ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRFFvSkNRa0pQRWxPUTA5TlVFRlVTVlpGVEQ1R1' +
      'FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWtKQ1R4TlMxSmZWa1ZTVTBsUF' +
      'RqNDFMakF1TUM0ek16d3ZUVXRTWDFaRlVsTkpUMDQrRFFvSkNRazhMMVJQWW1wV1' +
      'lYSnBZV0pzWlQ0TkNna0pDVHhVVDJKcVEyOXVjM1ErRFFvSkNRa0pQRWxFUGpFeF' +
      'BDOUpSRDROQ2drSkNRazhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2drSk' +
      'NRazhWRVZZVkQ0OEwxUkZXRlErRFFvSkNRa0pQRk5SVEQ1R1FVeFRSVHd2VTFGTV' +
      'BnMEtDUWtKQ1R4VVNWQlBQa3hsZEhKaGN6d3ZWRWxRVHo0TkNna0pDUWs4U1U1RF' +
      'QwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1FrSl' +
      'BFMUxVbDlXUlZKVFNVOU9QalV1TUM0d0xqTXpQQzlOUzFKZlZrVlNVMGxQVGo0Tk' +
      'Nna0pDUWs4VmtGTVQxSStiblZ0WlhKdlBDOVdRVXhQVWo0TkNna0pDUWs4UkUxTV' +
      'ZGbFFSVDVrZEZObGJHVmpkRHd2UkUxTVZGbFFSVDROQ2drSkNRazhSRWxCUjFKQl' +
      'RWaE5URDQ4TDBSSlFVZFNRVTFZVFV3K0RRb0pDUWtKUEU1VlRFOCtSa0ZNVTBVOE' +
      'wwNVZURTgrRFFvSkNRa0pQRVpKUlV4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RV' +
      'JWZytEUW9KQ1FrSlBFZFZTVVErUEM5SFZVbEVQZzBLQ1FrSkNUeFRVRVZEU1VGTV' +
      'EwOUVSVDQ4TDFOUVJVTkpRVXhEVDBSRlBnMEtDUWtKUEM5VVQySnFRMjl1YzNRK0' +
      'RRb0pDVHd2VUVGU1FVMVRQZzBLQ1R3dlZFOWlha1oxYm1OMGFXOXVQZzBLUEM5U1' +
      'QwOVVQZzBLPC9ESUFHUkFNWE1MPjxWQUxVRT5KU09OIC0gT2J0ZXIgVmFsb3IoQE' +
      'VuZGVyZWNvQ2VwT3NtLG51bWVybyk8L1ZBTFVFPg0KCQk8RVhQUkVTU0lPTj48Rl' +
      'VOQ1RJT04gTkFNRT0iSlNPTiAtIE9idGVyIFZhbG9yIiBSRUFMTkFNRT0iZWJmR2' +
      'V0VmFsdWVPYmplY3RKc29uIj4NCgkJCQk8UEFSQU1TPg0KCQkJCQk8VkFSSUFCTE' +
      'UgTkFNRT0iRW5kZXJlY29DZXBPc20iLz4NCgkJCQkJPENPTlNUQU5UIFRZUEU9Ik' +
      'xldHJhcyIgTlVMTD0iRkFMU0UiPm51bWVybzwvQ09OU1RBTlQ+DQoJCQkJPC9QQV' +
      'JBTVM+DQoJCQk8L0ZVTkNUSU9OPjwvRVhQUkVTU0lPTj4NCgk8L1RETUxGaWVsZD' +
      '4NCgk8VERNTEZpZWxkPjxOQU1FPklURF9CQUlSUk88L05BTUU+PFJFQUxOQU1FPk' +
      'lURF9CQUlSUk88L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybH' +
      'ZiajBpTVM0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFsWmhjbWxoWW14bFBnME' +
      'tDUWs4U1VRK01Ud3ZTVVErRFFvSkNUeE9UMDFGUGxaQlVrbEJRa3hGUEM5T1QwMU' +
      'ZQZzBLQ1FrOFZFVllWRDVDWVdseWNtODhMMVJGV0ZRK0RRb0pDVHhUVVV3K1JrRk' +
      '1VMFU4TDFOUlRENE5DZ2tKUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcwS0NRaz' +
      'hTVTVEVDAxUVFWUkpWa1ZNUGxSU1ZVVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0' +
      'pQRTFMVWw5V1JWSlRTVTlPUGpVdU1DNHdMak16UEM5TlMxSmZWa1ZTVTBsUFRqNE' +
      '5DZ2s4TDFSUFltcFdZWEpwWVdKc1pUNE5Dand2VWs5UFZENE5DZz09PC9ESUFHUk' +
      'FNWE1MPjxWQUxVRT5AQmFpcnJvPC9WQUxVRT4NCgkJPEVYUFJFU1NJT04+PFZBUk' +
      'lBQkxFIE5BTUU9IkJhaXJybyIvPjwvRVhQUkVTU0lPTj4NCgk8L1RETUxGaWVsZD' +
      '4NCgk8VERNTEZpZWxkPjxOQU1FPklURF9NVU5JQ0lQSU88L05BTUU+PFJFQUxOQU' +
      '1FPklURF9NVU5JQ0lQSU88L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG' +
      '1WeWMybHZiajBpTVM0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFrWjFibU4wYV' +
      'c5dVBnMEtDUWs4U1VRK01UVThMMGxFUGcwS0NRazhUazlOUlQ1R1ZVNURWRWxQVG' +
      'p3dlRrOU5SVDROQ2drSlBGUkZXRlErWldKbVIyVjBWbUZzZFdWUFltcGxZM1JLYz' +
      'I5dVBDOVVSVmhVUGcwS0NRazhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRb0pDVHhVU1' +
      'ZCUFBsWmhjbWxoYm5SbFBDOVVTVkJQUGcwS0NRazhTVTVEVDAxUVFWUkpWa1ZNUG' +
      'xSU1ZVVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0pQRTFMVWw5V1JWSlRTVTlPUG' +
      'pVdU1DNHdMak16UEM5TlMxSmZWa1ZTVTBsUFRqNE5DZ2tKUEZCQlVrRk5VejROQ2' +
      'drSkNUeFVUMkpxVm1GeWFXRmliR1UrRFFvSkNRa0pQRWxFUGpJelBDOUpSRDROQ2' +
      'drSkNRazhUazlOUlQ1V1FWSkpRVUpNUlR3dlRrOU5SVDROQ2drSkNRazhWRVZZVk' +
      'Q1RmJtUmxjbVZqYjBObGNFOXpiVHd2VkVWWVZENE5DZ2tKQ1FrOFUxRk1Qa1pCVE' +
      'ZORlBDOVRVVXcrRFFvSkNRa0pQRlJKVUU4K1ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRF' +
      'FvSkNRa0pQRWxPUTA5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVm' +
      'tWTVBnMEtDUWtKQ1R4TlMxSmZWa1ZTVTBsUFRqNDFMakF1TUM0ek16d3ZUVXRTWD' +
      'FaRlVsTkpUMDQrRFFvSkNRazhMMVJQWW1wV1lYSnBZV0pzWlQ0TkNna0pDVHhVVD' +
      'JKcVEyOXVjM1ErRFFvSkNRa0pQRWxFUGpFNVBDOUpSRDROQ2drSkNRazhUazlOUl' +
      'Q1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2drSkNRazhWRVZZVkQ0OEwxUkZXRlErRF' +
      'FvSkNRa0pQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtDUWtKQ1R4VVNWQlBQa3hsZE' +
      'hKaGN6d3ZWRWxRVHo0TkNna0pDUWs4U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUE' +
      'M5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1FrSlBFMUxVbDlXUlZKVFNVOU9QalV1TU' +
      'M0d0xqTXpQQzlOUzFKZlZrVlNVMGxQVGo0TkNna0pDUWs4VmtGTVQxSStZMmxrWV' +
      'dSbFBDOVdRVXhQVWo0TkNna0pDUWs4UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2Uk' +
      'UxTVZGbFFSVDROQ2drSkNRazhSRWxCUjFKQlRWaE5URDQ4TDBSSlFVZFNRVTFZVF' +
      'V3K0RRb0pDUWtKUEU1VlRFOCtSa0ZNVTBVOEwwNVZURTgrRFFvSkNRa0pQRVpKUl' +
      'V4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW9KQ1FrSlBFZFZTVVErUE' +
      'M5SFZVbEVQZzBLQ1FrSkNUeFRVRVZEU1VGTVEwOUVSVDQ4TDFOUVJVTkpRVXhEVD' +
      'BSRlBnMEtDUWtKUEM5VVQySnFRMjl1YzNRK0RRb0pDVHd2VUVGU1FVMVRQZzBLQ1' +
      'R3dlZFOWlha1oxYm1OMGFXOXVQZzBLUEM5U1QwOVVQZzBLPC9ESUFHUkFNWE1MPj' +
      'xWQUxVRT5KU09OIC0gT2J0ZXIgVmFsb3IoQEVuZGVyZWNvQ2VwT3NtLGNpZGFkZS' +
      'k8L1ZBTFVFPg0KCQk8RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT0iSlNPTiAtIE' +
      '9idGVyIFZhbG9yIiBSRUFMTkFNRT0iZWJmR2V0VmFsdWVPYmplY3RKc29uIj4NCg' +
      'kJCQk8UEFSQU1TPg0KCQkJCQk8VkFSSUFCTEUgTkFNRT0iRW5kZXJlY29DZXBPc2' +
      '0iLz4NCgkJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJhcyIgTlVMTD0iRkFMU0UiPm' +
      'NpZGFkZTwvQ09OU1RBTlQ+DQoJCQkJPC9QQVJBTVM+DQoJCQk8L0ZVTkNUSU9OPj' +
      'wvRVhQUkVTU0lPTj4NCgk8L1RETUxGaWVsZD4NCgk8VERNTEZpZWxkPjxOQU1FPk' +
      'lURF9VRjwvTkFNRT48UkVBTE5BTUU+SVREX1VGPC9SRUFMTkFNRT48RElBR1JBTV' +
      'hNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2drOF' +
      'ZFOWlha1oxYm1OMGFXOXVQZzBLQ1FrOFNVUStNend2U1VRK0RRb0pDVHhPVDAxRl' +
      'BrWlZUa05VU1U5T1BDOU9UMDFGUGcwS0NRazhWRVZZVkQ1bFltWkhaWFJXWVd4MV' +
      'pVOWlhbVZqZEVwemIyNDhMMVJGV0ZRK0RRb0pDVHhUVVV3K1JrRk1VMFU4TDFOUl' +
      'RENE5DZ2tKUEZSSlVFOCtWbUZ5YVdGdWRHVThMMVJKVUU4K0RRb0pDVHhKVGtOUF' +
      'RWQkJWRWxXUlV3K1ZGSlZSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWs4VFV0U1' +
      'gxWkZVbE5KVDA0K05TNHdMakF1TXpNOEwwMUxVbDlXUlZKVFNVOU9QZzBLQ1FrOF' +
      'VFRlNRVTFUUGcwS0NRa0pQRlJQWW1wV1lYSnBZV0pzWlQ0TkNna0pDUWs4U1VRK0' +
      '56d3ZTVVErRFFvSkNRa0pQRTVQVFVVK1ZrRlNTVUZDVEVVOEwwNVBUVVUrRFFvSk' +
      'NRa0pQRlJGV0ZRK1JXNWtaWEpsWTI5RFpYQlBjMjA4TDFSRldGUStEUW9KQ1FrSl' +
      'BGTlJURDVHUVV4VFJUd3ZVMUZNUGcwS0NRa0pDVHhVU1ZCUFBsWmhjbWxoYm5SbF' +
      'BDOVVTVkJQUGcwS0NRa0pDVHhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1' +
      'EwOU5VRUZVU1ZaRlRENE5DZ2tKQ1FrOFRVdFNYMVpGVWxOSlQwNCtOUzR3TGpBdU' +
      '16TThMMDFMVWw5V1JWSlRTVTlPUGcwS0NRa0pQQzlVVDJKcVZtRnlhV0ZpYkdVK0' +
      'RRb0pDUWs4VkU5aWFrTnZibk4wUGcwS0NRa0pDVHhKUkQ0elBDOUpSRDROQ2drSk' +
      'NRazhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2drSkNRazhWRVZZVkQ0OE' +
      'wxUkZXRlErRFFvSkNRa0pQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtDUWtKQ1R4VV' +
      'NWQlBQa3hsZEhKaGN6d3ZWRWxRVHo0TkNna0pDUWs4U1U1RFQwMVFRVlJKVmtWTV' +
      'BrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1FrSlBFMUxVbDlXUlZKVF' +
      'NVOU9QalV1TUM0d0xqTXpQQzlOUzFKZlZrVlNVMGxQVGo0TkNna0pDUWs4VmtGTV' +
      'QxSStaWE4wWVdSdlBDOVdRVXhQVWo0TkNna0pDUWs4UkUxTVZGbFFSVDVrZEZObG' +
      'JHVmpkRHd2UkUxTVZGbFFSVDROQ2drSkNRazhSRWxCUjFKQlRWaE5URDQ4TDBSSl' +
      'FVZFNRVTFZVFV3K0RRb0pDUWtKUEU1VlRFOCtSa0ZNVTBVOEwwNVZURTgrRFFvSk' +
      'NRa0pQRVpKUlV4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW9KQ1FrSl' +
      'BFZFZTVVErUEM5SFZVbEVQZzBLQ1FrSkNUeFRVRVZEU1VGTVEwOUVSVDQ4TDFOUV' +
      'JVTkpRVXhEVDBSRlBnMEtDUWtKUEM5VVQySnFRMjl1YzNRK0RRb0pDVHd2VUVGU1' +
      'FVMVRQZzBLQ1R3dlZFOWlha1oxYm1OMGFXOXVQZzBLUEM5U1QwOVVQZzBLPC9ESU' +
      'FHUkFNWE1MPjxWQUxVRT5KU09OIC0gT2J0ZXIgVmFsb3IoQEVuZGVyZWNvQ2VwT3' +
      'NtLGVzdGFkbyk8L1ZBTFVFPg0KCQk8RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT' +
      '0iSlNPTiAtIE9idGVyIFZhbG9yIiBSRUFMTkFNRT0iZWJmR2V0VmFsdWVPYmplY3' +
      'RKc29uIj4NCgkJCQk8UEFSQU1TPg0KCQkJCQk8VkFSSUFCTEUgTkFNRT0iRW5kZX' +
      'JlY29DZXBPc20iLz4NCgkJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJhcyIgTlVMTD' +
      '0iRkFMU0UiPmVzdGFkbzwvQ09OU1RBTlQ+DQoJCQkJPC9QQVJBTVM+DQoJCQk8L0' +
      'ZVTkNUSU9OPjwvRVhQUkVTU0lPTj4NCgk8L1RETUxGaWVsZD4NCgk8VERNTEZpZW' +
      'xkPjxOQU1FPklURF9DRVA8L05BTUU+PFJFQUxOQU1FPklURF9DRVA8L1JFQUxOQU' +
      '1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84VW' +
      's5UFZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK09Ed3ZTVVErRF' +
      'FvSkNUeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1FrOFZFVllWRDVsWW' +
      '1aSFpYUldZV3gxWlU5aWFtVmpkRXB6YjI0OEwxUkZXRlErRFFvSkNUeFRVVXcrUm' +
      'tGTVUwVThMMU5SVEQ0TkNna0pQRlJKVUU4K1ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRF' +
      'FvSkNUeEpUa05QVFZCQlZFbFdSVXcrVkZKVlJUd3ZTVTVEVDAxUVFWUkpWa1ZNUG' +
      'cwS0NRazhUVXRTWDFaRlVsTkpUMDQrTlM0d0xqQXVNek04TDAxTFVsOVdSVkpUU1' +
      'U5T1BnMEtDUWs4VUVGU1FVMVRQZzBLQ1FrSlBGUlBZbXBXWVhKcFlXSnNaVDROQ2' +
      'drSkNRazhTVVErTVRJOEwwbEVQZzBLQ1FrSkNUeE9UMDFGUGxaQlVrbEJRa3hGUE' +
      'M5T1QwMUZQZzBLQ1FrSkNUeFVSVmhVUGtWdVpHVnlaV052UTJWd1QzTnRQQzlVUl' +
      'ZoVVBnMEtDUWtKQ1R4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2drSkNRazhWRWxRVH' +
      'o1V1lYSnBZVzUwWlR3dlZFbFFUejROQ2drSkNRazhTVTVEVDAxUVFWUkpWa1ZNUG' +
      'taQlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1' +
      'U5T1BqVXVNQzR3TGpNelBDOU5TMUpmVmtWU1UwbFBUajROQ2drSkNUd3ZWRTlpYW' +
      'xaaGNtbGhZbXhsUGcwS0NRa0pQRlJQWW1wRGIyNXpkRDROQ2drSkNRazhTVVErT0' +
      'R3dlNVUStEUW9KQ1FrSlBFNVBUVVUrUTA5T1UxUkJUbFE4TDA1UFRVVStEUW9KQ1' +
      'FrSlBGUkZXRlErUEM5VVJWaFVQZzBLQ1FrSkNUeFRVVXcrUmtGTVUwVThMMU5SVE' +
      'Q0TkNna0pDUWs4VkVsUVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFvSkNRa0pQRWxPUT' +
      'A5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWtKQ1' +
      'R4TlMxSmZWa1ZTVTBsUFRqNDFMakF1TUM0ek16d3ZUVXRTWDFaRlVsTkpUMDQrRF' +
      'FvSkNRa0pQRlpCVEU5U1BtTmxjRHd2VmtGTVQxSStEUW9KQ1FrSlBFUk5URlJaVU' +
      'VVK1pIUlRaV3hsWTNROEwwUk5URlJaVUVVK0RRb0pDUWtKUEVSSlFVZFNRVTFZVF' +
      'V3K1BDOUVTVUZIVWtGTldFMU1QZzBLQ1FrSkNUeE9WVXhQUGtaQlRGTkZQQzlPVl' +
      'V4UFBnMEtDUWtKQ1R4R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUG' +
      'cwS0NRa0pDVHhIVlVsRVBqd3ZSMVZKUkQ0TkNna0pDUWs4VTFCRlEwbEJURU5QUk' +
      'VVK1BDOVRVRVZEU1VGTVEwOUVSVDROQ2drSkNUd3ZWRTlpYWtOdmJuTjBQZzBLQ1' +
      'FrOEwxQkJVa0ZOVXo0TkNnazhMMVJQWW1wR2RXNWpkR2x2Ymo0TkNqd3ZVazlQVk' +
      'Q0TkNnPT08L0RJQUdSQU1YTUw+PFZBTFVFPkpTT04gLSBPYnRlciBWYWxvcihARW' +
      '5kZXJlY29DZXBPc20sY2VwKTwvVkFMVUU+DQoJCTxFWFBSRVNTSU9OPjxGVU5DVE' +
      'lPTiBOQU1FPSJKU09OIC0gT2J0ZXIgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYW' +
      'x1ZU9iamVjdEpzb24iPg0KCQkJCTxQQVJBTVM+DQoJCQkJCTxWQVJJQUJMRSBOQU' +
      '1FPSJFbmRlcmVjb0NlcE9zbSIvPg0KCQkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cm' +
      'FzIiBOVUxMPSJGQUxTRSI+Y2VwPC9DT05TVEFOVD4NCgkJCQk8L1BBUkFNUz4NCg' +
      'kJCTwvRlVOQ1RJT04+PC9FWFBSRVNTSU9OPg0KCTwvVERNTEZpZWxkPg0KCTxURE' +
      '1MRmllbGQ+PE5BTUU+SVREX1BBSVM8L05BTUU+PFJFQUxOQU1FPklURF9QQUlTPC' +
      '9SRUFMTkFNRT48RElBR1JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJaj' +
      'grRFFvOFVrOVBWRDROQ2drOFZFOWlha1oxYm1OMGFXOXVQZzBLQ1FrOFNVUStNen' +
      'd2U1VRK0RRb0pDVHhPVDAxRlBrWlZUa05VU1U5T1BDOU9UMDFGUGcwS0NRazhWRV' +
      'ZZVkQ1bFltWkhaWFJXWVd4MVpVOWlhbVZqZEVwemIyNDhMMVJGV0ZRK0RRb0pDVH' +
      'hUVVV3K1JrRk1VMFU4TDFOUlRENE5DZ2tKUEZSSlVFOCtWbUZ5YVdGdWRHVThMMV' +
      'JKVUU4K0RRb0pDVHhKVGtOUFRWQkJWRWxXUlV3K1ZGSlZSVHd2U1U1RFQwMVFRVl' +
      'JKVmtWTVBnMEtDUWs4VFV0U1gxWkZVbE5KVDA0K05TNHdMakF1TXpNOEwwMUxVbD' +
      'lXUlZKVFNVOU9QZzBLQ1FrOFVFRlNRVTFUUGcwS0NRa0pQRlJQWW1wV1lYSnBZV0' +
      'pzWlQ0TkNna0pDUWs4U1VRK056d3ZTVVErRFFvSkNRa0pQRTVQVFVVK1ZrRlNTVU' +
      'ZDVEVVOEwwNVBUVVUrRFFvSkNRa0pQRlJGV0ZRK1JXNWtaWEpsWTI5RFpYQlBjMj' +
      'A4TDFSRldGUStEUW9KQ1FrSlBGTlJURDVHUVV4VFJUd3ZVMUZNUGcwS0NRa0pDVH' +
      'hVU1ZCUFBsWmhjbWxoYm5SbFBDOVVTVkJQUGcwS0NRa0pDVHhKVGtOUFRWQkJWRW' +
      'xXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DZ2tKQ1FrOFRVdFNYMV' +
      'pGVWxOSlQwNCtOUzR3TGpBdU16TThMMDFMVWw5V1JWSlRTVTlPUGcwS0NRa0pQQz' +
      'lVVDJKcVZtRnlhV0ZpYkdVK0RRb0pDUWs4VkU5aWFrTnZibk4wUGcwS0NRa0pDVH' +
      'hKUkQ0elBDOUpSRDROQ2drSkNRazhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVD' +
      'ROQ2drSkNRazhWRVZZVkQ0OEwxUkZXRlErRFFvSkNRa0pQRk5SVEQ1R1FVeFRSVH' +
      'd2VTFGTVBnMEtDUWtKQ1R4VVNWQlBQa3hsZEhKaGN6d3ZWRWxRVHo0TkNna0pDUW' +
      's4U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW' +
      '9KQ1FrSlBFMUxVbDlXUlZKVFNVOU9QalV1TUM0d0xqTXpQQzlOUzFKZlZrVlNVMG' +
      'xQVGo0TkNna0pDUWs4VmtGTVQxSStjR0ZwY3p3dlZrRk1UMUkrRFFvSkNRa0pQRV' +
      'JOVEZSWlVFVStaSFJUWld4bFkzUThMMFJOVEZSWlVFVStEUW9KQ1FrSlBFUkpRVW' +
      'RTUVUxWVRVdytQQzlFU1VGSFVrRk5XRTFNUGcwS0NRa0pDVHhPVlV4UFBrWkJURk' +
      '5GUEM5T1ZVeFBQZzBLQ1FrSkNUeEdTVVZNUkVsT1JFVllQaTB4UEM5R1NVVk1SRW' +
      'xPUkVWWVBnMEtDUWtKQ1R4SFZVbEVQand2UjFWSlJENE5DZ2tKQ1FrOFUxQkZRMG' +
      'xCVEVOUFJFVStQQzlUVUVWRFNVRk1RMDlFUlQ0TkNna0pDVHd2VkU5aWFrTnZibk' +
      '4wUGcwS0NRazhMMUJCVWtGTlV6NE5DZ2s4TDFSUFltcEdkVzVqZEdsdmJqNE5Dan' +
      'd2VWs5UFZENE5DZz09PC9ESUFHUkFNWE1MPjxWQUxVRT5KU09OIC0gT2J0ZXIgVm' +
      'Fsb3IoQEVuZGVyZWNvQ2VwT3NtLHBhaXMpPC9WQUxVRT4NCgkJPEVYUFJFU1NJT0' +
      '4+PEZVTkNUSU9OIE5BTUU9IkpTT04gLSBPYnRlciBWYWxvciIgUkVBTE5BTUU9Im' +
      'ViZkdldFZhbHVlT2JqZWN0SnNvbiI+DQoJCQkJPFBBUkFNUz4NCgkJCQkJPFZBUk' +
      'lBQkxFIE5BTUU9IkVuZGVyZWNvQ2VwT3NtIi8+DQoJCQkJCTxDT05TVEFOVCBUWV' +
      'BFPSJMZXRyYXMiIE5VTEw9IkZBTFNFIj5wYWlzPC9DT05TVEFOVD4NCgkJCQk8L1' +
      'BBUkFNUz4NCgkJCTwvRlVOQ1RJT04+PC9FWFBSRVNTSU9OPg0KCTwvVERNTEZpZW' +
      'xkPg0KCTxURE1MRmllbGQ+PE5BTUU+SVREX0xBVElUVURFPC9OQU1FPjxSRUFMTk' +
      'FNRT5JVERfTEFUSVRVREU8L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG' +
      '1WeWMybHZiajBpTVM0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFrWjFibU4wYV' +
      'c5dVBnMEtDUWs4U1VRK01qd3ZTVVErRFFvSkNUeE9UMDFGUGtaVlRrTlVTVTlPUE' +
      'M5T1QwMUZQZzBLQ1FrOFZFVllWRDVsWW1aSFpYUldZV3gxWlU5aWFtVmpkRXB6Yj' +
      'I0OEwxUkZXRlErRFFvSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pQRlJKVU' +
      'U4K1ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRFFvSkNUeEpUa05QVFZCQlZFbFdSVXcrVk' +
      'ZKVlJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS0NRazhUVXRTWDFaRlVsTkpUMDQrTl' +
      'M0d0xqQXVNek04TDAxTFVsOVdSVkpUU1U5T1BnMEtDUWs4VUVGU1FVMVRQZzBLQ1' +
      'FrSlBGUlBZbXBXWVhKcFlXSnNaVDROQ2drSkNRazhTVVErTVRBOEwwbEVQZzBLQ1' +
      'FrSkNUeE9UMDFGUGxaQlVrbEJRa3hGUEM5T1QwMUZQZzBLQ1FrSkNUeFVSVmhVUG' +
      'tWdVpHVnlaV052UTJWd1QzTnRQQzlVUlZoVVBnMEtDUWtKQ1R4VFVVdytSa0ZNVT' +
      'BVOEwxTlJURDROQ2drSkNRazhWRWxRVHo1V1lYSnBZVzUwWlR3dlZFbFFUejROQ2' +
      'drSkNRazhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUl' +
      'V3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1U5T1BqVXVNQzR3TGpNelBDOU5TMUpmVm' +
      'tWU1UwbFBUajROQ2drSkNUd3ZWRTlpYWxaaGNtbGhZbXhsUGcwS0NRa0pQRlJQWW' +
      '1wRGIyNXpkRDROQ2drSkNRazhTVVErTmp3dlNVUStEUW9KQ1FrSlBFNVBUVVUrUT' +
      'A5T1UxUkJUbFE4TDA1UFRVVStEUW9KQ1FrSlBGUkZXRlErUEM5VVJWaFVQZzBLQ1' +
      'FrSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pDUWs4VkVsUVR6NU1aWFJ5WV' +
      'hNOEwxUkpVRTgrRFFvSkNRa0pQRWxPUTA5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1' +
      'U1RFQwMVFRVlJKVmtWTVBnMEtDUWtKQ1R4TlMxSmZWa1ZTVTBsUFRqNDFMakF1TU' +
      'M0ek16d3ZUVXRTWDFaRlVsTkpUMDQrRFFvSkNRa0pQRlpCVEU5U1BteGhkR2wwZF' +
      'dSbFBDOVdRVXhQVWo0TkNna0pDUWs4UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2Uk' +
      'UxTVZGbFFSVDROQ2drSkNRazhSRWxCUjFKQlRWaE5URDQ4TDBSSlFVZFNRVTFZVF' +
      'V3K0RRb0pDUWtKUEU1VlRFOCtSa0ZNVTBVOEwwNVZURTgrRFFvSkNRa0pQRVpKUl' +
      'V4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW9KQ1FrSlBFZFZTVVErUE' +
      'M5SFZVbEVQZzBLQ1FrSkNUeFRVRVZEU1VGTVEwOUVSVDQ4TDFOUVJVTkpRVXhEVD' +
      'BSRlBnMEtDUWtKUEM5VVQySnFRMjl1YzNRK0RRb0pDVHd2VUVGU1FVMVRQZzBLQ1' +
      'R3dlZFOWlha1oxYm1OMGFXOXVQZzBLUEM5U1QwOVVQZzBLPC9ESUFHUkFNWE1MPj' +
      'xWQUxVRT5KU09OIC0gT2J0ZXIgVmFsb3IoQEVuZGVyZWNvQ2VwT3NtLGxhdGl0dW' +
      'RlKTwvVkFMVUU+DQoJCTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJKU09OIC' +
      '0gT2J0ZXIgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg' +
      '0KCQkJCTxQQVJBTVM+DQoJCQkJCTxWQVJJQUJMRSBOQU1FPSJFbmRlcmVjb0NlcE' +
      '9zbSIvPg0KCQkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRS' +
      'I+bGF0aXR1ZGU8L0NPTlNUQU5UPg0KCQkJCTwvUEFSQU1TPg0KCQkJPC9GVU5DVE' +
      'lPTj48L0VYUFJFU1NJT04+DQoJPC9URE1MRmllbGQ+DQoJPFRETUxGaWVsZD48Tk' +
      'FNRT5JVERfTE9OR0lUVURFPC9OQU1FPjxSRUFMTkFNRT5JVERfTE9OR0lUVURFPC' +
      '9SRUFMTkFNRT48RElBR1JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJaj' +
      'grRFFvOFVrOVBWRDROQ2drOFZFOWlha1oxYm1OMGFXOXVQZzBLQ1FrOFNVUStNan' +
      'd2U1VRK0RRb0pDVHhPVDAxRlBrWlZUa05VU1U5T1BDOU9UMDFGUGcwS0NRazhWRV' +
      'ZZVkQ1bFltWkhaWFJXWVd4MVpVOWlhbVZqZEVwemIyNDhMMVJGV0ZRK0RRb0pDVH' +
      'hUVVV3K1JrRk1VMFU4TDFOUlRENE5DZ2tKUEZSSlVFOCtWbUZ5YVdGdWRHVThMMV' +
      'JKVUU4K0RRb0pDVHhKVGtOUFRWQkJWRWxXUlV3K1ZGSlZSVHd2U1U1RFQwMVFRVl' +
      'JKVmtWTVBnMEtDUWs4VFV0U1gxWkZVbE5KVDA0K05TNHdMakF1TXpNOEwwMUxVbD' +
      'lXUlZKVFNVOU9QZzBLQ1FrOFVFRlNRVTFUUGcwS0NRa0pQRlJQWW1wV1lYSnBZV0' +
      'pzWlQ0TkNna0pDUWs4U1VRK01UQThMMGxFUGcwS0NRa0pDVHhPVDAxRlBsWkJVa2' +
      'xCUWt4RlBDOU9UMDFGUGcwS0NRa0pDVHhVUlZoVVBrVnVaR1Z5WldOdlEyVndUM0' +
      '50UEM5VVJWaFVQZzBLQ1FrSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pDUW' +
      's4VkVsUVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNna0pDUWs4U1U1RFQwMVFRVl' +
      'JKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1FrSlBFMUxVbD' +
      'lXUlZKVFNVOU9QalV1TUM0d0xqTXpQQzlOUzFKZlZrVlNVMGxQVGo0TkNna0pDVH' +
      'd2VkU5aWFsWmhjbWxoWW14bFBnMEtDUWtKUEZSUFltcERiMjV6ZEQ0TkNna0pDUW' +
      's4U1VRK05qd3ZTVVErRFFvSkNRa0pQRTVQVFVVK1EwOU9VMVJCVGxROEwwNVBUVV' +
      'UrRFFvSkNRa0pQRlJGV0ZRK1BDOVVSVmhVUGcwS0NRa0pDVHhUVVV3K1JrRk1VMF' +
      'U4TDFOUlRENE5DZ2tKQ1FrOFZFbFFUejVNWlhSeVlYTThMMVJKVUU4K0RRb0pDUW' +
      'tKUEVsT1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZz' +
      'BLQ1FrSkNUeE5TMUpmVmtWU1UwbFBUajQxTGpBdU1DNHpNend2VFV0U1gxWkZVbE' +
      '5KVDA0K0RRb0pDUWtKUEZaQlRFOVNQbXh2Ym1kcGRIVmtaVHd2VmtGTVQxSStEUW' +
      '9KQ1FrSlBFUk5URlJaVUVVK1pIUlRaV3hsWTNROEwwUk5URlJaVUVVK0RRb0pDUW' +
      'tKUEVSSlFVZFNRVTFZVFV3K1BDOUVTVUZIVWtGTldFMU1QZzBLQ1FrSkNUeE9WVX' +
      'hQUGtaQlRGTkZQQzlPVlV4UFBnMEtDUWtKQ1R4R1NVVk1SRWxPUkVWWVBpMHhQQz' +
      'lHU1VWTVJFbE9SRVZZUGcwS0NRa0pDVHhIVlVsRVBqd3ZSMVZKUkQ0TkNna0pDUW' +
      's4VTFCRlEwbEJURU5QUkVVK1BDOVRVRVZEU1VGTVEwOUVSVDROQ2drSkNUd3ZWRT' +
      'lpYWtOdmJuTjBQZzBLQ1FrOEwxQkJVa0ZOVXo0TkNnazhMMVJQWW1wR2RXNWpkR2' +
      'x2Ymo0TkNqd3ZVazlQVkQ0TkNnPT08L0RJQUdSQU1YTUw+PFZBTFVFPkpTT04gLS' +
      'BPYnRlciBWYWxvcihARW5kZXJlY29DZXBPc20sbG9uZ2l0dWRlKTwvVkFMVUU+DQ' +
      'oJCTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJKU09OIC0gT2J0ZXIgVmFsb3' +
      'IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg0KCQkJCTxQQVJBTV' +
      'M+DQoJCQkJCTxWQVJJQUJMRSBOQU1FPSJFbmRlcmVjb0NlcE9zbSIvPg0KCQkJCQ' +
      'k8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+bG9uZ2l0dWRlPC' +
      '9DT05TVEFOVD4NCgkJCQk8L1BBUkFNUz4NCgkJCTwvRlVOQ1RJT04+PC9FWFBSRV' +
      'NTSU9OPg0KCTwvVERNTEZpZWxkPg0KCTxURE1MRmllbGQ+PE5BTUU+SVREX1NFTl' +
      'RJRE88L05BTUU+PFJFQUxOQU1FPklURF9TRU5USURPPC9SRUFMTkFNRT48RElBR1' +
      'JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2' +
      'drOFZFOWlhbFpoY21saFlteGxQZzBLQ1FrOFNVUStNVHd2U1VRK0RRb0pDVHhPVD' +
      'AxRlBsWkJVa2xCUWt4RlBDOU9UMDFGUGcwS0NRazhWRVZZVkQ1VFpXNTBhV1J2UE' +
      'M5VVJWaFVQZzBLQ1FrOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvSkNUeFVTVkJQUG' +
      't4bGRISmhjend2VkVsUVR6NE5DZ2tKUEVsT1EwOU5VRUZVU1ZaRlRENVVVbFZGUE' +
      'M5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1R4TlMxSmZWa1ZTVTBsUFRqNDFMakF1TU' +
      'M0ek16d3ZUVXRTWDFaRlVsTkpUMDQrRFFvSlBDOVVUMkpxVm1GeWFXRmliR1UrRF' +
      'FvOEwxSlBUMVErRFFvPTwvRElBR1JBTVhNTD48VkFMVUU+QFNlbnRpZG88L1ZBTF' +
      'VFPg0KCQk8RVhQUkVTU0lPTj48VkFSSUFCTEUgTkFNRT0iU2VudGlkbyIvPjwvRV' +
      'hQUkVTU0lPTj4NCgk8L1RETUxGaWVsZD4NCgk8VERNTEZpZWxkPjxOQU1FPk1kNS' +
      'BBcnF1aXZvIChJVERfTUQ1X0FSUVVJVk8pPC9OQU1FPjxSRUFMTkFNRT5JVERfTU' +
      'Q1X0FSUVVJVk88L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybH' +
      'ZiajBpTVM0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFrTnZibk4wUGcwS0NRaz' +
      'hTVVErTUR3dlNVUStEUW9KQ1R4T1QwMUZQa05QVGxOVVFVNVVQQzlPVDAxRlBnME' +
      'tDUWs4VkVWWVZENDhMMVJGV0ZRK0RRb0pDVHhUVVV3K1JrRk1VMFU4TDFOUlRENE' +
      '5DZ2tKUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcwS0NRazhTVTVEVDAxUVFWUk' +
      'pWa1ZNUGxSU1ZVVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0pQRTFMVWw5V1JWSl' +
      'RTVTlPUGpVdU1DNHdMak16UEM5TlMxSmZWa1ZTVTBsUFRqNE5DZ2tKUEZaQlRFOV' +
      'NQazlUVFR3dlZrRk1UMUkrRFFvSkNUeEVUVXhVV1ZCRlBtUjBVMlZzWldOMFBDOU' +
      'VUVXhVV1ZCRlBnMEtDUWs4UkVsQlIxSkJUVmhOVEQ0OEwwUkpRVWRTUVUxWVRVdy' +
      'tEUW9KQ1R4T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS0NRazhSa2xGVEVSSlRrUk' +
      'ZXRDR0TVR3dlJrbEZURVJKVGtSRldENE5DZ2tKUEVkVlNVUStQQzlIVlVsRVBnME' +
      'tDUWs4VTFCRlEwbEJURU5QUkVVK1BDOVRVRVZEU1VGTVEwOUVSVDROQ2drOEwxUl' +
      'BZbXBEYjI1emRENE5Dand2VWs5UFZENE5DZz09PC9ESUFHUkFNWE1MPjxWQUxVRT' +
      '5PU008L1ZBTFVFPg0KCQk8RVhQUkVTU0lPTj48Q09OU1RBTlQgVFlQRT0iTGV0cm' +
      'FzIiBOVUxMPSJGQUxTRSI+T1NNPC9DT05TVEFOVD48L0VYUFJFU1NJT04+DQoJPC' +
      '9URE1MRmllbGQ+DQo8L1JPT1Q+DQo=</DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NU' +
      'LO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
      'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VA' +
      'LOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</T' +
      'ObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowConnector3: TFlowConnector
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
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowLine17;FlowLine30'
    OutputNames = 'FlowLine15'
  end
  object FlowLine3: TFlowLine
    Left = 645
    Top = 496
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
    InputNames = 'FlowConnector8'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine19: TFlowLine
    Left = 645
    Top = 407
    Width = 40
    Height = 72
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
    InputNames = 'FlowConnector6'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psDash
    Decision = False
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
    InputNames = 'FlowLine7'
    Description = 'Fim'
    OutPutParam = ',    '
  end
  object FlowLine2: TFlowLine
    Left = 835
    Top = 348
    Width = 60
    Height = 130
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
    OutputNames = 'FlowSubRoutine3'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine15: TFlowLine
    Left = 1025
    Top = 496
    Width = 40
    Height = 71
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine17: TFlowLine
    Left = 1040
    Top = 543
    Width = 330
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
  object FlowConnector1: TFlowConnector
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine30'
  end
  object FlowLine30: TFlowLine
    Left = 1025
    Top = 557
    Width = 40
    Height = 160
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowConnector1'
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine13: TFlowLine
    Left = 1405
    Top = 543
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowExpression19'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 1025
    Top = 692
    Width = 420
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression19'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression6: TFlowExpression
    Left = 590
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    Description = 'Obter distancia KM'
    Text = 'Mapa - Obter dist'#226'ncia em KM de um PolyLine(@Itinerario)'
    ReturnVar = 'DistanciaKM'
    Expression = 
      '<FUNCTION NAME="Mapa&#x20;-&#x20;Obter&#x20;dist&#226;ncia&#x20;' +
      'em&#x20;KM&#x20;de&#x20;um&#x20;PolyLine" REALNAME="EbfCalcularD' +
      'istanciaItinerario">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Itinerario"/>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>EbfCalcularDistanc' +
      'iaItinerario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>Itinerario</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowSubRoutine9: TFlowSubRoutine
    Left = 590
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    Description = 'LTI - Guardar dist'#226'ncia do itiner'#225'rio'
    Id = 1305
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'Dist'#226'ncia'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>DistanciaKM</TEXT>' +
          #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariabl' +
          'e>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'ITI_ID'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>ITI_ID</TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Sentido'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Sentido</TEXT>'#13#10'<S' +
          'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>TIPO</TEXT>'#13#10'<SQL>' +
          'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
          'VEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</RO' +
          'OT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'Dist'#226'ncia'
        ParamType = ptInput
        Value = '<VARIABLE NAME="DistanciaKM"/>'
      end
      item
        DataType = ftString
        Name = 'ITI_ID'
        ParamType = ptInput
        Value = '<VARIABLE NAME="ITI_ID"/>'
      end
      item
        DataType = ftString
        Name = 'Sentido'
        ParamType = ptInput
        Value = '<VARIABLE NAME="Sentido"/>'
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
        Value = '<VARIABLE NAME="TIPO"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'Dist'#226'ncia'
        ParamType = ptInput
        Value = '@DistanciaKM'
      end
      item
        DataType = ftString
        Name = 'ITI_ID'
        ParamType = ptInput
        Value = '@ITI_ID'
      end
      item
        DataType = ftString
        Name = 'Sentido'
        ParamType = ptInput
        Value = '@Sentido'
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
        Value = '@TIPO'
      end>
    ObjectName = 'LTI - Guardar dist'#226'ncia do itiner'#225'rio'
    RealName = 'CALLRULE'
  end
  object FlowLine7: TFlowLine
    Left = 835
    Top = 498
    Width = 64
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
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 456
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
      'id,Letras,50,;campoId,Letras,50,;criterio,Letras,50,;tabelaForm,' +
      'Letras,50,;nomeCampoCriterio,Letras,50,;apelidoCampoCriterio,Let' +
      'ras,50,;tipo,Letras,50,'
    Variables = 'tabela,Tabela,,;select,Letras,50,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 456
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
    InputNames = 'FlowLine4;FlowLine10;FlowLine7'
    Description = 'Fim'
  end
  object FlowDecision1: TFlowDecision
    Left = 400
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
    OutputNames = 'FlowLine2;FlowLine8'
    Description = 'Descri'#231#227'o '#233' nulo ou vazio'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>3.9.2.4</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
      'criterio</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.2.4' +
      '</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction' +
      '>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="criterio"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTIO' +
      'N>'#13#10
    Loop = False
  end
  object FlowDecision2: TFlowDecision
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine4;FlowLine5'
    Description = 'Existem registros?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLEOF</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>3.9.2.4</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVari' +
      'able>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>tabe' +
      'la</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.2.4</MKR_' +
      'VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</R' +
      'OOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">'#13#10#9#9'<PA' +
      'RAMS>'#13#10#9#9#9'<VARIABLE NAME="tabela"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine1: TFlowLine
    Left = 455
    Top = 17
    Width = 40
    Height = 116
    Color = 10132122
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
  object FlowLine4: TFlowLine
    Left = 455
    Top = 348
    Width = 64
    Height = 65
    Color = 10132122
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
    OutputNames = 'FlowEnd1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression2: TFlowExpression
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
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine11'
    Description = 'Abre consulta com filtro'
    Text = 'Abrir Consulta Din'#226'mica Avan'#231'ada(@SELECT,,,)'
    ReturnVar = 'tabela'
    Expression = 
      #9'<FUNCTION NAME="Abrir Consulta Din'#226'mica Avan'#231'ada" REALNAME="ebf' +
      'OpenAdvancedQuery">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="select"/>'#13#10#9 +
      #9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT ' +
      'TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfOpenAdvancedQuery</TEXT>'#13#10#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>3.9.2.4</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9 +
      #9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9 +
      #9'<TEXT>select</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.' +
      '9.2.4</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID' +
      '>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>' +
      'FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.2.4</MKR_VERSION>'#13#10#9#9#9#9'<VALOR' +
      '></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObj' +
      'Const>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME' +
      '>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</T' +
      'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3' +
      '.9.2.4</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>' +
      #13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>' +
      '5</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.2.4</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>' +
      '</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjC' +
      'onst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression3: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3'
    Description = 'Montar Select'
    Text = 
      'Concatena'#231#227'o(SELECT * FROM ,@tabelaForm, WHERE (,@campoId, <> ,S' +
      'e('#201' Nulo ou Vazio(@id),-1,@id),) AND (,@nomeCampoCriterio,Se(Igu' +
      'al(@tipo,S), = '#39', = ),@criterio,Se(Igual(@tipo,S),'#39'),)))'
    ReturnVar = 'select'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >SELECT&#x20;*&#x' +
      '20;FROM&#x20;</CONSTANT>'#13#10'<VARIABLE NAME="tabelaForm"/>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >&#x20;WHERE&#x20;(</CONSTANT>'#13#10'<' +
      'VARIABLE NAME="campoId"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE" ' +
      ' >&#x20;&lt;&gt;&#x20;</CONSTANT>'#13#10'<FUNCTION NAME="Se" REALNAME=' +
      '"oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x2' +
      '0;Vazio" REALNAME="isNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="id' +
      '"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >-1</CONSTANT>'#13#10'<VARIABLE NAME="id"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >)&#x20;AND&#x20;(</CONS' +
      'TANT>'#13#10'<VARIABLE NAME="nomeCampoCriterio"/>'#13#10'<FUNCTION NAME="Se"' +
      ' REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Igual" REALNAME="i' +
      'sEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tipo"/>'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >&#x20;=&#x20;'#39'</CONSTANT>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >&#x20;=&#x20;</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<VARIABLE NAME="criterio"/>'#13#10'<FUNCTION NAME' +
      '="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Igual" REALNA' +
      'ME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tipo"/>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE"  >'#39')</CONSTANT>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >)</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>SELECT&#x20;*&#x20' +
      ';FROM&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVar' +
      'iable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabelaForm</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'</TObjVariabl' +
      'e>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>&#x20;W' +
      'HERE&#x20;(</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVar' +
      'iable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>campoId</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'</TObjVariable>'#13 +
      #10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>&#x20;&lt' +
      ';&gt;&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>12</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEmpt' +
      'y</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>15</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEX' +
      'T>id</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'</TO' +
      'bjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>12</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>-1</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>16</ID>'#13#10'<NOME>VARIABLE</NOME>' +
      #13#10'<TEXT>id</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>' +
      '12</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>)&#x20;AND&#x20;(</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<' +
      'NOME>VARIABLE</NOME>'#13#10'<TEXT>nomeCampoCriterio</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjFunct' +
      'ion>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjVariable>'#13#10'<ID>13</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tipo</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'</TObjVari' +
      'able>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>S</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>&#x' +
      '20;=&#x20;'#39'</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>&#x20;=&#x20;</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunctio' +
      'n>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>cri' +
      'terio</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjFunction>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>13</ID>'#13#10'<NOME>VARIA' +
      'BLE</NOME>'#13#10'<TEXT>tipo</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</' +
      'MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</' +
      'MKR_VERSION>'#13#10'<VALOR>'#39')</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.9</MKR_VERSION>'#13#10'<VALOR>)</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunctio' +
      'n>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 455
    Top = 93
    Width = 64
    Height = 115
    Color = 10132122
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
  object FlowLine3: TFlowLine
    Left = 455
    Top = 196
    Width = 40
    Height = 58
    Color = 10132122
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
  object FlowLine11: TFlowLine
    Left = 455
    Top = 271
    Width = 40
    Height = 57
    Color = 10132122
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
  object FlowConnector1: TFlowConnector
    Left = 270
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine9'
  end
  object FlowLine8: TFlowLine
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowConnector1'
    Description = 'SIM'
    Region = 0
    Style = psDash
    Decision = True
  end
  object FlowConnector2: TFlowConnector
    Left = 270
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine10'
  end
  object FlowLine9: TFlowLine
    Left = 265
    Top = 92
    Width = 40
    Height = 340
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
  object FlowLine10: TFlowLine
    Left = 280
    Top = 393
    Width = 196
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
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector3: TFlowConnector
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine7'
  end
  object FlowLine7: TFlowLine
    Left = 474
    Top = 393
    Width = 196
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
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowActivity1: TFlowActivity
    Left = 590
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
    ChangeDescription = False
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
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
          'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<VALOR>Duplicidade n'#227'o permitida!' +
          '</VALOR>'#13#10#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAM' +
          'XML>'#13#10#9#9'<NULO>FALSE</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GU' +
          'ID></GUID>'#13#10#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT' +
          '>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOM' +
          'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
          'nst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
          'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
          '>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>O&#x20;Registro&#' +
          'x20;&lt;b&gt;'#39#9'</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
          'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
          #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TOb' +
          'jVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>criterio</T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
          '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVari' +
          'able>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
          'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
          '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>'#39'&l' +
          't;/b&gt;&#x20;j&#225;&#x20;se&#x20;encontra&#x20;cadastrado&#x20' +
          ';para&#x20;&lt;b&gt;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
          'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
          'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
          #10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>apelid' +
          'oCampoCriterio</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
          'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VER' +
          'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT<' +
          '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
          'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VER' +
          'SION>'#13#10'<VALOR>&lt;/b&gt;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
          'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
          'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tempo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
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
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Nulo</VALOR>'#13#10'<DMLTYP' +
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
          #9'<CONSTANT TYPE="Letras" NULL="FALSE">Duplicidade n'#227'o permitida!' +
          '</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;Registro&' +
          '#x20;&lt;b&gt;'#39#9'</CONSTANT>'#13#10'<VARIABLE NAME="criterio"/>'#13#10'<CONST' +
          'ANT TYPE="Letras" NULL="FALSE"  >'#39'&lt;/b&gt;&#x20;j&#225;&#x20;s' +
          'e&#x20;encontra&#x20;cadastrado&#x20;para&#x20;&lt;b&gt;</CONSTA' +
          'NT>'#13#10'<VARIABLE NAME="apelidoCampoCriterio"/>'#13#10'<CONSTANT TYPE="Le' +
          'tras" NULL="FALSE"  >&lt;/b&gt;</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
          'N>'
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
        Value = 'Duplicidade n'#227'o permitida!'
      end
      item
        DataType = ftString
        Name = 'Mensagem'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(O Registro <b>'#39#9',@criterio,'#39'</b> j'#225' se encontra cad' +
          'astrado para <b>,@apelidoCampoCriterio,</b>)'
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
    Left = 455
    Top = 318
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowActivity1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine6: TFlowLine
    Left = 645
    Top = 318
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
    InputNames = 'FlowActivity1'
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
end

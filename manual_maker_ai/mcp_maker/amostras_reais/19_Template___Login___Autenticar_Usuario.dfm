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
    InputParams = 'usuario,Letras,50,;senha,Letras,50,;conexao,Letras,50,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 266
    Top = 243
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
    InputNames = 'FlowLine2'
    Description = 'Fim'
  end
  object FlowExpression1: TFlowExpression
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine2'
    Description = 'Autenticar usu'#225'rio'
    Text = 
      'Autenticar Usu'#225'rio(@usuario,@senha,true,Se(Ou('#201' Nulo ou Vazio(@c' +
      'onexao),Igual(@conexao,-1)),,@conexao))'
    Expression = 
      '<FUNCTION NAME="Autenticar&#x20;Usu&#225;rio" REALNAME="ebfAuthU' +
      'ser">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="usuario"/>'#13#10'<VARIABLE NAME="sen' +
      'ha"/>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTAN' +
      'T>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION N' +
      'AME="Ou" REALNAME="oprOr">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="&#201;&#x2' +
      '0;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<PARAMS>'#13#10 +
      '<VARIABLE NAME="conexao"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NA' +
      'ME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="conexa' +
      'o"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >-1</CONSTANT>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letr' +
      'as" NULL="TRUE"  ></CONSTANT>'#13#10'<VARIABLE NAME="conexao"/>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfAuthUser</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>usuario</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10 +
      '<TObjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>senha</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVar' +
      'iable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VAL' +
      'OR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunct' +
      'ion>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprOr</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEm' +
      'pty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<' +
      'TEXT>conexao</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSI' +
      'ON>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>12</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Variable>'#13#10'<ID>13</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>conexao</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVaria' +
      'ble>'#13#10'<TObjConst>'#13#10'<ID>14</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>-1<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0' +
      '.97</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjVariable>'#13#10'<ID>15</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
      'conexao</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10 +
      '</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 111
    Width = 40
    Height = 68
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
  object FlowLine2: TFlowLine
    Left = 265
    Top = 196
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end
                                  
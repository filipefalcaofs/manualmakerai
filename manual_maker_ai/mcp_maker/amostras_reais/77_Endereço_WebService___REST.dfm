object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 836
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
    InputParams = 'CEP,Letras,50,'
    Variables = 'Json,Letras,50,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 836
    Top = 600
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
    InputNames = 'FlowLine6'
    Description = 'Fim'
  end
  object FlowExpression1: TFlowExpression
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine2'
    Description = 'Chamar WebService ViaCEP'
    Text = 
      'JSON - Criar Objeto(REST - Consumir WebService(GET,Concatena'#231#227'o(' +
      'http://viacep.com.br/ws/,@CEP,/json/),,,,,,,,))'
    ReturnVar = 'Json'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;Objeto" REALNAME="eb' +
      'fCreateObjectJSON">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="REST&#x20;-&#x20;' +
      'Consumir&#x20;WebService" REALNAME="ebfRestCallNew">'#13#10'<PARAMS>'#13#10 +
      '<CONSTANT TYPE="Letras" NULL="FALSE"  >GET</CONSTANT>'#13#10'<FUNCTION' +
      ' NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10 +
      '<CONSTANT TYPE="Letras" NULL="FALSE"  >http://viacep.com.br/ws/<' +
      '/CONSTANT>'#13#10'<VARIABLE NAME="CEP"/>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="FALSE"  >/json/</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Fluxo" ' +
      'NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ' +
      '></CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TY' +
      'PE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Fluxo" NU' +
      'LL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ><' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfCreateObjectJSO' +
      'N</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fRestCallNew</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<' +
      'VALOR>GET</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunct' +
      'ion>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>http://viacep.c' +
      'om.br/ws/</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>CEP</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>/json/</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>T' +
      'RUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Fluxo<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.2' +
      '3</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR></VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.23</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR></' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.23</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Fluxo</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALO' +
      'R></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 835
    Top = 111
    Width = 40
    Height = 68
    Color = 9079434
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
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3'
    Description = 'Exibir Logradouro'
    Text = 
      'Alterar Valor do Componente(Cadastro de Endere'#231'o - Pessoa Fisica' +
      ',Logradouro (logradouro),JSON - Obter Valor(@Json,logradouro))'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{33890A82-3294-407C-9A2D-C' +
      'C73DA25B77D}">{33890A82-3294-407C-9A2D-CC73DA25B77D}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{33890A82-329' +
      '4-407C-9A2D-CC73DA25B77D}">logradouro</CONSTANT>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json"/>'#13#10'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE"  >logradouro</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Endere&#231;o&#x20;-&#x20;Pessoa&#x20' +
      ';Fisica</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<SPECIALCODE>{338' +
      '90A82-3294-407C-9A2D-CC73DA25B77D}</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>Lograd' +
      'ouro&#x20;(logradouro)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<S' +
      'PECIALCODE>logradouro</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJso' +
      'n</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjVariable>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>J' +
      'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'</TO' +
      'bjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VAL' +
      'OR>logradouro</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
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
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4'
    Description = 'Exibir bairro'
    Text = 
      'Alterar Valor do Componente(Cadastro de Endere'#231'o - Pessoa Fisica' +
      ',Bairro (bairro),JSON - Obter Valor(@Json,bairro))'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{33890A82-3294-407C-9A2D-C' +
      'C73DA25B77D}">{33890A82-3294-407C-9A2D-CC73DA25B77D}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{33890A82-329' +
      '4-407C-9A2D-CC73DA25B77D}">bairro</CONSTANT>'#13#10'<FUNCTION NAME="JS' +
      'ON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson' +
      '">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json"/>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE"  >bairro</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Endere&#231;o&#x20;-&#x20;Pessoa&#x20' +
      ';Fisica</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<SPECIALCODE>{338' +
      '90A82-3294-407C-9A2D-CC73DA25B77D}</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>Bairro' +
      '&#x20;(bairro)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID>{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<SPECIALCO' +
      'DE>bairro</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>5</ID' +
      '>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjV' +
      'ariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'</TObjVariable>'#13 +
      #10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>bairro</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunct' +
      'ion>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression4: TFlowExpression
    Left = 780
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
    Description = 'Exibir cidade'
    Text = 
      'Alterar Valor do Componente(Cadastro de Endere'#231'o - Pessoa Fisica' +
      ',Munic'#237'pio (localidade),JSON - Obter Valor(@Json,localidade))'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{33890A82-3294-407C-9A2D-C' +
      'C73DA25B77D}">{33890A82-3294-407C-9A2D-CC73DA25B77D}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{33890A82-329' +
      '4-407C-9A2D-CC73DA25B77D}">localidade</CONSTANT>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json"/>'#13#10'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE"  >localidade</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Endere&#231;o&#x20;-&#x20;Pessoa&#x20' +
      ';Fisica</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<SPECIALCODE>{338' +
      '90A82-3294-407C-9A2D-CC73DA25B77D}</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>Munic&' +
      '#237;pio&#x20;(localidade)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID>{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>' +
      #13#10'<SPECIALCODE>localidade</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjec' +
      'tJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TE' +
      'XT>Json</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10 +
      '</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10 +
      '<VALOR>localidade</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression5: TFlowExpression
    Left = 780
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = 'Exibir UF'
    Text = 
      'Alterar Valor do Componente(Cadastro de Endere'#231'o - Pessoa Fisica' +
      ',UF (uf),JSON - Obter Valor(@Json,uf))'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{33890A82-3294-407C-9A2D-C' +
      'C73DA25B77D}">{33890A82-3294-407C-9A2D-CC73DA25B77D}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{33890A82-329' +
      '4-407C-9A2D-CC73DA25B77D}">uf</CONSTANT>'#13#10'<FUNCTION NAME="JSON&#' +
      'x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10 +
      '<PARAMS>'#13#10'<VARIABLE NAME="Json"/>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
      '"FALSE"  >uf</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Endere&#231;o&#x20;-&#x20;Pessoa&#x20' +
      ';Fisica</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<SPECIALCODE>{338' +
      '90A82-3294-407C-9A2D-CC73DA25B77D}</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>UF&#x2' +
      '0;(uf)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{' +
      '33890A82-3294-407C-9A2D-CC73DA25B77D}</GUID>'#13#10'<SPECIALCODE>uf</S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUN' +
      'CTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<I' +
      'D>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json</TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>' +
      #13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALOR>uf</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 835
    Top = 168
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
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
  object FlowLine4: TFlowLine
    Left = 835
    Top = 346
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine5: TFlowLine
    Left = 835
    Top = 421
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 835
    Top = 496
    Width = 40
    Height = 124
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

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
    InputParams = 'Comando,Letras,50,'
    Variables = 
      'Retorno,Letras,50,;Json Entrada,Variante,,;vencimento,Data,,;Dig' +
      ' geral,Letras,50,;Valor,Fracionado,,;Cod DAM,Inteiro,,;teste,Var' +
      'iante,,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 1026
    Top = 768
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine2'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
      'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      '/ROOT>'#13#10
    Expression = '<VARIABLE NAME="Retorno"/>'
    Text = '@Retorno'
    OutPutParam = 'Letras,50  '
  end
  object FlowExpression2: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine5'
    Description = 'validar campo: DAM_IDPS'
    Text = 
      'Concatena'#231#227'o(@Retorno,Se(JSON - Existe a chave?(@Json Entrada,DA' +
      'M_IDPS),Se(Igual(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_ID' +
      'PS)),2),Se('#233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_IDPS)),' +
      ',Concatena'#231#227'o(Informe apenas n'#250'meros na chave: ,DAM_IDPS)),Conca' +
      'tena'#231#227'o(Chave com tamanho inv'#225'lido: ,DAM_IDPS)),Concatena'#231#227'o(Cha' +
      've inexistente: ,DAM_IDPS)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<FUNCTION NAME="Se" REALNAM' +
      'E="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Existe&#x' +
      '20;a&#x20;chave?" REALNAME="ebfJSONExistsKey">'#13#10'<PARAMS>'#13#10'<VARIA' +
      'BLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE"  >DAM_IDPS</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NA' +
      'ME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Igual" REAL' +
      'NAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanho" REALNAME="eb' +
      'fLength">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20' +
      ';Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE N' +
      'AME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE" ' +
      ' >DAM_IDPS</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >2</CONSTANT>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARA' +
      'MS>'#13#10'<CALLRULE ID="82" NAME="&#233;&#x20;n&#250;mero" PARAMSCOUN' +
      'T="1"> '#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;V' +
      'alor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAM' +
      'E="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      'DAM_IDPS</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRU' +
      'LE>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTIO' +
      'N NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Informe&#x20;apenas&#x20' +
      ';n&#250;meros&#x20;na&#x20;chave:&#x20;</CONSTANT>'#13#10'<CONSTANT TY' +
      'PE="Letras" NULL="FALSE"  >DAM_IDPS</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&' +
      '#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE"  >Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&' +
      '#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_IDP' +
      'S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<F' +
      'UNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PA' +
      'RAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Chave&#x20;inexist' +
      'ente:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >D' +
      'AM_IDPS</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,&#x20;</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjV' +
      'ariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariabl' +
      'e>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>opr' +
      'If</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVE' +
      'L>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>e' +
      'bfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<NOME>VARIABL' +
      'E</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLengt' +
      'h</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<NOME>VARIABL' +
      'E</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>2</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>10</ID>'#13#10'<NOME>CALLRULE</NOM' +
      'E>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10 +
      '<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrad' +
      'a</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TO' +
      'bjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<T' +
      'EXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VA' +
      'LOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<RULEID>82</RULEID>'#13#10'</TObjRule>' +
      #13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>' +
      #13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>10</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Informe&#x20;apenas&#x20;n&#25' +
      '0;meros&#x20;na&#x20;chave:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<V' +
      'ALOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCons' +
      't>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;com&#x20' +
      ';tamanho&#x20;inv&#225;lido:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<V' +
      'ALOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCons' +
      't>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexiste' +
      'nte:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCons' +
      't>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_IDPS</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_V' +
      'ERSION>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = 'validar campo: DAM_ID_VAL_REF'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_ID_VAL_REF),Se(' +
      'Igual(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_ID_VAL_REF)),' +
      '1),Se('#233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_ID_VAL_REF))' +
      ',,Concatena'#231#227'o(Informe apenas n'#250'meros na chave: ,DAM_ID_VAL_REF)' +
      '),Concatena'#231#227'o(Chave com tamanho inv'#225'lido: ,DAM_ID_VAL_REF)),Con' +
      'catena'#231#227'o(Chave inexistente: ,DAM_ID_VAL_REF)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_ID_VAL_REF</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PA' +
      'RAMS>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FU' +
      'NCTION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTION' +
      ' NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueO' +
      'bjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >DAM_ID_VAL_REF</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="L' +
      'etras" NULL="FALSE"  >1</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUN' +
      'CTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="82" N' +
      'AME="&#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNC' +
      'TION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetVa' +
      'lueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_ID_VAL_REF</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME="Concatena&' +
      '#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="L' +
      'etras" NULL="FALSE"  >Informe&#x20;apenas&#x20;n&#250;meros&#x20' +
      ';na&#x20;chave:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >DAM_ID_VAL_REF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REAL' +
      'NAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&#x20;</CONST' +
      'ANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_ID_VAL_REF</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTIO' +
      'N NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Chave&#x20;inexistente:&' +
      '#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_ID_' +
      'VAL_REF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,&#x20;</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_VAL_REF</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>op' +
      'rIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME' +
      '>'#13#10'<TEXT>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION' +
      '</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_VAL_R' +
      'EF</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</I' +
      'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>11</I' +
      'D>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueO' +
      'bjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCO' +
      'MPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</NOME>'#13 +
      #10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variant' +
      'e</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0' +
      '.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_VAL_REF</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<RU' +
      'LEID>82</RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfC' +
      'oncat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>I' +
      'nforme&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20;chave:&#x20;</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_VAL_REF</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_V' +
      'ERSION>'#13#10'<VALOR>Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&' +
      '#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_VAL_REF</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUN' +
      'CTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexistente:&#x20;</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<VALOR>DAM_ID_VAL_REF</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>' +
      ',&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 530
    Top = 168
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine7;FlowLine4'
    Description = 'Retorno = Nulo?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNullOrEmpty</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfS' +
      'ubstring</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<T' +
      'EXT>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL' +
      '>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<T' +
      'EXT>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<I' +
      'D>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="i' +
      'sNullOrEmpty">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REA' +
      'LNAME="ebfSubstring">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CO' +
      'NSTANT TYPE="Inteiro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAM' +
      'E="Subtra&#231;&#227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNC' +
      'TION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE N' +
      'AME="Retorno"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracion' +
      'ado" NULL="FALSE"  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARA' +
      'MS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression5: TFlowExpression
    Left = 590
    Top = 759
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
    Description = 'retorno'
    Text = 
      'Concatena'#231#227'o({"status":"ERRO", '#10'"mensagem":"Json inv'#225'lido ou cha' +
      've com tamanho diferente do esperando",'#10'"result":",Subsequ'#234'ncia(' +
      '@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno),2)),"})'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;status&qu' +
      'ot;:&quot;ERRO&quot;,&#x20;'#13#10'&quot;mensagem&quot;:&quot;Json&#x2' +
      '0;inv&#225;lido&#x20;ou&#x20;chave&#x20;com&#x20;tamanho&#x20;di' +
      'ferente&#x20;do&#x20;esperando&quot;,'#13#10'&quot;result&quot;:&quot;' +
      '</CONSTANT>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSub' +
      'string">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="' +
      'Inteiro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#23' +
      '1;&#227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Ta' +
      'manho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"' +
      '/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FA' +
      'LSE"  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;}</CONSTANT>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>{&quot;status&qu' +
      'ot;:&quot;ERRO&quot;,&#x20;'#13#10'&quot;mensagem&quot;:&quot;Json&#x2' +
      '0;inv&#225;lido&#x20;ou&#x20;chave&#x20;com&#x20;tamanho&#x20;di' +
      'ferente&#x20;do&#x20;esperando&quot;,'#13#10'&quot;result&quot;:&quot;' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID' +
      '>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariab' +
      'le>'#13#10'<ID>9</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      'TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>1</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13 +
      #10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10 +
      '<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLength</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVari' +
      'able>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Fracionado' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      'TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>&quot;}</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'</ROOT>'#13#10
  end
  object FlowLine7: TFlowLine
    Left = 645
    Top = 723
    Width = 64
    Height = 56
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
    OutputNames = 'FlowExpression5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector2: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine8;FlowLine20'
    OutputNames = 'FlowLine2'
  end
  object FlowLine8: TFlowLine
    Left = 645
    Top = 767
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression6: TFlowExpression
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
    OutputNames = 'FlowLine11'
    Description = 'Criar Json Entrada'
    Text = 'JSON - Criar objeto(@Comando)'
    ReturnVar = 'Json Entrada'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;objeto" REALNAME="eb' +
      'fCreateObjectJSON">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Comando"/>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfCreateObjectJSO' +
      'N</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>C' +
      'omando</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      '/TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 835
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
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression7: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine14'
    Description = 'validar campo: DAM_VALOR'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_VALOR),Se('#201' Nul' +
      'o ou Vazio(JSON - Obter Valor(@Json Entrada,DAM_VALOR)),Concaten' +
      'a'#231#227'o(Valor nulo na chave: ,DAM_VALOR),Se(Igual('#233' n'#250'mero(JSON - O' +
      'bter Valor(@Json Entrada,DAM_VALOR)),S),Se(Menor ou Igual(Para I' +
      'nteiro(JSON - Obter Valor(@Json Entrada,DAM_VALOR)),0),Concatena' +
      #231#227'o(Valor deve ser superior a zero: ,DAM_VALOR,),Se(Igual(Tamanh' +
      'o(JSON - Obter Valor(@Json Entrada,DAM_VALOR)),11),,Concatena'#231#227'o' +
      '(Chave com tamanho inv'#225'lido: ,DAM_VALOR)),Concatena'#231#227'o(Informe s' +
      'omente n'#250'meros na chave: ,DAM_VALOR)),Concatena'#231#227'o(Chave inexist' +
      'ente: ,DAM_VALOR)),, )))'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>' +
      #13#10'<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME=' +
      '"isNullOrEmpty">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obt' +
      'er&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VAR' +
      'IABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME=' +
      '"ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >V' +
      'alor&#x20;nulo&#x20;na&#x20;chave:&#x20;</CONSTANT>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNC' +
      'TION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="8' +
      '2" NAME="&#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<' +
      'FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfG' +
      'etValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada' +
      '"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<' +
      'FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="' +
      'Menor&#x20;ou&#x20;Igual" REALNAME="isMinorOrEqual">'#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="Para&#x20;Inteiro" REALNAME="toLong">'#13#10'<PARAMS>'#13 +
      #10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="eb' +
      'fGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entra' +
      'da"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TY' +
      'PE="Inteiro" NULL="FALSE"  >0</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Valor&#x20;dev' +
      'e&#x20;ser&#x20;superior&#x20;a&#x20;zero:&#x20;</CONSTANT>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tama' +
      'nho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;' +
      '-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PAR' +
      'AMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letr' +
      'as" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      '11</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o' +
      '" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
      '"FALSE"  >Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&#x20;<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAM' +
      'E="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ' +
      '>Informe&#x20;somente&#x20;n&#250;meros&#x20;na&#x20;chave:&#x20' +
      ';</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALN' +
      'AME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >Chave&#x20;inexistente:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ' +
      '>,&#x20;</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isNu' +
      'llOrEmpty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10 +
      '<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10'<VALOR>Valor&#x20;nulo&#x20;na&#x20;chave:&#x2' +
      '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
      '9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Function>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjRule>'#13#10'<ID>11</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>&#233;' +
      '&#x20;n&#250;mero</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</I' +
      'D>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'</PARAMS>'#13#10'<RULEID>82</RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13 +
      #10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFu' +
      'nction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isMinorOrEqua' +
      'l</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>toLong</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13 +
      #10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Var' +
      'iante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</' +
      'MKR_VERSION>'#13#10'<VALOR>0</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOM' +
      'E>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>Valor&#x20;deve&#x20;ser&#x20;superi' +
      'or&#x20;a&#x20;zero:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DA' +
      'M_VALOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13 +
      #10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VAR' +
      'IABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<I' +
      'D>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<VALOR>11</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VE' +
      'RSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Function>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x' +
      '20;com&#x20;tamanho&#x20;inv&#225;lido:&#x20;</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FU' +
      'NCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'<VALOR>Informe&#x20;somente&#x20;n&#250;meros&#' +
      'x20;na&#x20;chave:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_' +
      'VALOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunct' +
      'ion>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>e' +
      'bfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR' +
      '>Chave&#x20;inexistente:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR' +
      '>DAM_VALOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>' +
      '10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine6: TFlowLine
    Left = 455
    Top = 168
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
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression8: TFlowExpression
    Left = 400
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
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine15'
    Description = 'validar campo: DAM_ID_PREF'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_ID_PREF),Se(Igu' +
      'al(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_ID_PREF)),4),Se(' +
      #233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_ID_PREF)),,Concate' +
      'na'#231#227'o(Informe apenas n'#250'meros na chave: ,DAM_ID_PREF)),Concatena'#231 +
      #227'o(Chave com tamanho inv'#225'lido: ,DAM_ID_PREF)),Concatena'#231#227'o(Chave' +
      ' inexistente: ,DAM_ID_PREF)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_ID_PREF</CONSTANT>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAM' +
      'S>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCT' +
      'ION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTION NA' +
      'ME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObje' +
      'ctJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >DAM_ID_PREF</CONSTANT>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE"  >4</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="82" NAME="&' +
      '#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNCTION N' +
      'AME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObj' +
      'ectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONS' +
      'TANT TYPE="Letras" NULL="FALSE"  >DAM_ID_PREF</CONSTANT>'#13#10'</PARA' +
      'MS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME="Concatena&#231;&#22' +
      '7;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE"  >Informe&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20;' +
      'chave:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      'DAM_ID_PREF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfCon' +
      'cat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Chave&#x' +
      '20;com&#x20;tamanho&#x20;inv&#225;lido:&#x20;</CONSTANT>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >DAM_ID_PREF</CONSTANT>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concate' +
      'na&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >Chave&#x20;inexistente:&#x20;</CONSTANT' +
      '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_ID_PREF</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >,&#x20;</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_PREF</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
      #13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>is' +
      'Equal</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10 +
      '<TEXT>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</N' +
      'OME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13 +
      #10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObj' +
      'Const>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_PREF</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'<VALOR>4</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>11</ID>'#13#10'<N' +
      'OME>CALLRULE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
      'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
      'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</' +
      'MKR_VERSION>'#13#10'<VALOR>DAM_ID_PREF</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<RULEID>82</' +
      'RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFu' +
      'nction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Informe&#x' +
      '20;apenas&#x20;n&#250;meros&#x20;na&#x20;chave:&#x20;</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_PREF</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<T' +
      'EXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VA' +
      'LOR>Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&#x20;</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_PREF</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<VALOR>Chave&#x20;inexistente:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<VALOR>DAM_ID_PREF</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCons' +
      't>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
  end
  object FlowLine14: TFlowLine
    Left = 455
    Top = 243
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine16'
    Description = 'validar campo: DAM_VENCIMENTO'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_VENCIMENTO),Se(' +
      'Igual(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_VENCIMENTO)),' +
      '8),Se('#233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_VENCIMENTO))' +
      ',Se(Igual(Validar Data DAM(JSON - Obter Valor(@Json Entrada,DAM_' +
      'VENCIMENTO)),S),,Concatena'#231#227'o(Data inv'#225'lida na chave: ,DAM_VENCI' +
      'MENTO)),Concatena'#231#227'o(Informe apenas n'#250'meros na chave: ,DAM_VENCI' +
      'MENTO)),Concatena'#231#227'o(Chave com tamanho inv'#225'lido: ,DAM_VENCIMENTO' +
      ')),Concatena'#231#227'o(Chave inexistente: ,DAM_VENCIMENTO)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PA' +
      'RAMS>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FU' +
      'NCTION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTION' +
      ' NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueO' +
      'bjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="L' +
      'etras" NULL="FALSE"  >8</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUN' +
      'CTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="82" N' +
      'AME="&#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNC' +
      'TION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetVa' +
      'lueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<FUNCTION NAM' +
      'E="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Igual" REALN' +
      'AME="isEqual">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="197" NAME="Validar&#x20;' +
      'Data&#x20;DAM" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON' +
      '&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">' +
      #13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME="Concatena&#2' +
      '31;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE"  >Data&#x20;inv&#225;lida&#x20;na&#x20;chave:&' +
      '#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VEN' +
      'CIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat"' +
      '>'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Informe&#x20' +
      ';apenas&#x20;n&#250;meros&#x20;na&#x20;chave:&#x20;</CONSTANT>'#13#10 +
      '<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME' +
      '="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONS' +
      'TANT TYPE="Letras" NULL="FALSE"  >Chave&#x20;com&#x20;tamanho&#x' +
      '20;inv&#225;lido:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="FALSE"  >DAM_VENCIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" RE' +
      'ALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FAL' +
      'SE"  >Chave&#x20;inexistente:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >,&#x20;</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>op' +
      'rIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME' +
      '>'#13#10'<TEXT>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION' +
      '</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMEN' +
      'TO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR>8</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</I' +
      'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>11</I' +
      'D>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueO' +
      'bjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCO' +
      'MPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</NOME>'#13 +
      #10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variant' +
      'e</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0' +
      '.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<RU' +
      'LEID>82</RULEID>'#13#10'</TObjRule>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOM' +
      'E>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>V' +
      'ariante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10 +
      '<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>11</' +
      'ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>Validar&#x20;Data&#x20;DAM</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetV' +
      'alueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</N' +
      'OME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Va' +
      'riante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>' +
      #13#10'<RULEID>197</RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>Data&#x20;inv&#225;lida&#x20;na&#x20;chave:&#x20;</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'<VALOR>Informe&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20;ch' +
      'ave:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCons' +
      't>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NO' +
      'ME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;com&#x20;tamanho&#x20;inv' +
      '&#225;lido:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMEN' +
      'TO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID' +
      '>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexistente:&#x20;<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine15: TFlowLine
    Left = 455
    Top = 318
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression11: TFlowExpression
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
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine17'
    Description = 'validar campo: DAM_COD_RECEITA'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_COD_RECEITA),Se' +
      '(Igual(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_COD_RECEITA)' +
      '),2),Se('#233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_COD_RECEIT' +
      'A)),,Concatena'#231#227'o(Informe apenas n'#250'meros na chave: ,DAM_COD_RECE' +
      'ITA)),Concatena'#231#227'o(Chave com tamanho inv'#225'lido: ,DAM_COD_RECEITA)' +
      '),Concatena'#231#227'o(Chave inexistente: ,DAM_COD_RECEITA)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_COD_RECEITA</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<P' +
      'ARAMS>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<F' +
      'UNCTION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValue' +
      'ObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE"  >DAM_COD_RECEITA</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<F' +
      'UNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="82"' +
      ' NAME="&#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FU' +
      'NCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGet' +
      'ValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/' +
      '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_COD_RECEITA</CONST' +
      'ANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME="Concate' +
      'na&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >Informe&#x20;apenas&#x20;n&#250;meros&#' +
      'x20;na&#x20;chave:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE"  >DAM_COD_RECEITA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" ' +
      'REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE"  >Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&#x20;</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_COD_RECEITA' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FU' +
      'NCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PAR' +
      'AMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Chave&#x20;inexiste' +
      'nte:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DA' +
      'M_COD_RECEITA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,&#x20;</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_RECEITA</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunct' +
      'ion>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>o' +
      'prIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</' +
      'ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      'TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_REC' +
      'EITA</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11<' +
      '/ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>11<' +
      '/ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Varia' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_RECEITA</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10 +
      '<RULEID>82</RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>e' +
      'bfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALO' +
      'R>Informe&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20;chave:&#x20' +
      ';</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_RECEITA</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCT' +
      'ION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<VALOR>Chave&#x20;com&#x20;tamanho&#x20;inv&#225;li' +
      'do:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_RECEITA</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunctio' +
      'n>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOM' +
      'E>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexistente:&#x20;</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_RECEITA</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine16: TFlowLine
    Left = 455
    Top = 393
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowExpression11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression12: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine18'
    Description = 'validar campo: DAM_TIPO_LANCAMENTO'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_TIPO_LANCAMENTO' +
      '),Se(Igual(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_TIPO_LAN' +
      'CAMENTO)),2),Se('#233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_TI' +
      'PO_LANCAMENTO)),,Concatena'#231#227'o(Informe apenas n'#250'meros na chave: ,' +
      'DAM_TIPO_LANCAMENTO)),Concatena'#231#227'o(Chave com tamanho inv'#225'lido: ,' +
      'DAM_TIPO_LANCAMENTO)),Concatena'#231#227'o(Chave inexistente: ,DAM_TIPO_' +
      'LANCAMENTO)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_TIPO_LANCAMENTO</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">' +
      #13#10'<PARAMS>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>' +
      #13#10'<FUNCTION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUN' +
      'CTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetV' +
      'alueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>' +
      #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_TIPO_LANCAMENTO</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE' +
      ' ID="82" NAME="&#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARA' +
      'MS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME' +
      '="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;E' +
      'ntrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_TIPO_LANCA' +
      'MENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>' +
      #13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION N' +
      'AME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE"  >Informe&#x20;apenas&#x20;n&' +
      '#250;meros&#x20;na&#x20;chave:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >DAM_TIPO_LANCAMENTO</CONSTANT>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concaten' +
      'a&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >Chave&#x20;com&#x20;tamanho&#x20;inv&#22' +
      '5;lido:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ' +
      '>DAM_TIPO_LANCAMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAM' +
      'E="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ' +
      '>Chave&#x20;inexistente:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE"  >DAM_TIPO_LANCAMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >,&#x20;</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_TIPO_LANCAMENT' +
      'O</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10 +
      '<TEXT>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR' +
      '_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUN' +
      'CTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID' +
      '>9</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable' +
      '>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_TIP' +
      'O_LANCAMENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<I' +
      'D>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13 +
      #10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13 +
      #10'<ID>11</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;me' +
      'ro</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIAB' +
      'LE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_TIPO_LANCAMENTO</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'</PARAMS>'#13#10'<RULEID>82</RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NO' +
      'ME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<VALOR>Informe&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20' +
      ';chave:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_TIPO_LANCAM' +
      'ENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</' +
      'ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;com&#x20;tamanho&' +
      '#x20;inv&#225;lido:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_' +
      'TIPO_LANCAMENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexis' +
      'tente:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_TIPO_LANCAMEN' +
      'TO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine17: TFlowLine
    Left = 455
    Top = 468
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowExpression12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression13: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine19'
    Description = 'validar campo: DAM_ED'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_ED),Se(Igual(Ta' +
      'manho(JSON - Obter Valor(@Json Entrada,DAM_ED)),2),Se('#233' n'#250'mero(J' +
      'SON - Obter Valor(@Json Entrada,DAM_ED)),,Concatena'#231#227'o(Informe a' +
      'penas n'#250'meros na chave: ,DAM_ED)),Concatena'#231#227'o(Chave com tamanho' +
      ' inv'#225'lido: ,DAM_ED)),Concatena'#231#227'o(Chave inexistente: ,DAM_ED)),,' +
      ' )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13 +
      #10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<' +
      'FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION N' +
      'AME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="J' +
      'SON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJso' +
      'n">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FAL' +
      'SE"  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" ' +
      'REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="82" NAME="&#233;&#x20' +
      ';n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&' +
      '#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13 +
      #10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ' +
      '></CONSTANT>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="' +
      'ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >In' +
      'forme&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20;chave:&#x20;</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_ED</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NA' +
      'ME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >Chave&#x20;com&#x20;tamanho&' +
      '#x20;inv&#225;lido:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME' +
      '="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      'Chave&#x20;inexistente:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,&#x2' +
      '0;</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ED</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13 +
      #10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Var' +
      'iante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<NOM' +
      'E>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst' +
      '>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ED</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTI' +
      'ON</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>11</ID>'#13#10'<NOME>CALLRU' +
      'LE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>11' +
      '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20' +
      ';Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'<VALOR>DAM_ED</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<RULEID>82</RULEID>'#13#10'</TObj' +
      'Rule>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR></' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>11' +
      '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID' +
      '>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Informe&#x20;apenas&#x20;' +
      'n&#250;meros&#x20;na&#x20;chave:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'<VALOR>DAM_ED</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;com&#' +
      'x20;tamanho&#x20;inv&#225;lido:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<VALOR>DAM_ED</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexist' +
      'ente:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ED</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_V' +
      'ERSION>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine18: TFlowLine
    Left = 455
    Top = 571
    Width = 40
    Height = 58
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
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowExpression13'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression14: TFlowExpression
    Left = 400
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
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine3'
    Description = 'validar campo: DAM_NOSSO_NUMERO'
    Text = 
      'Concatena'#231#227'o(Subsequ'#234'ncia(@Retorno,1,Subtra'#231#227'o(Tamanho(@Retorno)' +
      ',2)),Se(JSON - Existe a chave?(@Json Entrada,DAM_NOSSO_NUMERO),S' +
      'e(Igual(Tamanho(JSON - Obter Valor(@Json Entrada,DAM_NOSSO_NUMER' +
      'O)),11),Se('#233' n'#250'mero(JSON - Obter Valor(@Json Entrada,DAM_NOSSO_N' +
      'UMERO)),,Concatena'#231#227'o(Informe apenas n'#250'meros na chave: ,DAM_NOSS' +
      'O_NUMERO)),Concatena'#231#227'o(Chave com tamanho inv'#225'lido: ,DAM_NOSSO_N' +
      'UMERO)),Concatena'#231#227'o(Chave inexistente: ,DAM_NOSSO_NUMERO)),, )'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Subsequ&#234;ncia" REALNAME="ebfSubstri' +
      'ng">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE"  >1</CONSTANT>'#13#10'<FUNCTION NAME="Subtra&#231;&#' +
      '227;o" REALNAME="oprSubtract">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Tamanh' +
      'o" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Fracionado" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Existe&#x20;a&#x20;chave?" REALNAME="ebfJSONE' +
      'xistsKey">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >DAM_NOSSO_NUMERO</CONSTANT>'#13#10 +
      '</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<' +
      'FUNCTION NAME="Tamanho" REALNAME="ebfLength">'#13#10'<PARAMS>'#13#10'<FUNCTI' +
      'ON NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValu' +
      'eObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_NOSSO_NUMERO</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >11</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<CALLRULE ID="' +
      '82" NAME="&#233;&#x20;n&#250;mero" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
      'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrad' +
      'a"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_NOSSO_NUMERO</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<FUNCTION NAME="Con' +
      'catena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE"  >Informe&#x20;apenas&#x20;n&#250;mer' +
      'os&#x20;na&#x20;chave:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE"  >DAM_NOSSO_NUMERO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Concatena&#231;&#22' +
      '7;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE"  >Chave&#x20;com&#x20;tamanho&#x20;inv&#225;lido:&#x2' +
      '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_NOSSO_' +
      'NUMERO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">' +
      #13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Chave&#x20;in' +
      'existente:&#x20;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >DAM_NOSSO_NUMERO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,&#x20;<' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstring' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Ret' +
      'orno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</T' +
      'ObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprSubtract</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>N&#250;mero</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfLen' +
      'gth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<' +
      'INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfJSONExistsKey</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMERO</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>' +
      'oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NO' +
      'ME>'#13#10'<TEXT>ebfLength</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTI' +
      'ON</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9<' +
      '/ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10 +
      '<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_' +
      'NUMERO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>11</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>' +
      '11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjRule>'#13#10'<ID>' +
      '11</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>&#233;&#x20;n&#250;mero</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetV' +
      'alueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE</N' +
      'OME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Va' +
      'riante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMERO</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAM' +
      'S>'#13#10'<RULEID>82</RULEID>'#13#10'</TObjRule>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'<TObjFunction>'#13#10'<ID>11</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'VALOR>Informe&#x20;apenas&#x20;n&#250;meros&#x20;na&#x20;chave:&' +
      '#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMERO</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;com&#x20;tamanho&#x20;inv&#2' +
      '25;lido:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMER' +
      'O</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>' +
      #13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Chave&#x20;inexistente:&#x20;</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMERO</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<VALOR>,&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine19: TFlowLine
    Left = 455
    Top = 646
    Width = 40
    Height = 58
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowExpression14'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression10: TFlowExpression
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine22'
    Description = 'Concat dos dados para gerar o digito geral'
    Text = 
      'Concatena'#231#227'o(JSON - Obter Valor(@Json Entrada,DAM_IDPS),JSON - O' +
      'bter Valor(@Json Entrada,DAM_ID_VAL_REF),JSON - Obter Valor(@Jso' +
      'n Entrada,DAM_VALOR),JSON - Obter Valor(@Json Entrada,DAM_ID_PRE' +
      'F),JSON - Obter Valor(@Json Entrada,DAM_VENCIMENTO),JSON - Obter' +
      ' Valor(@Json Entrada,DAM_COD_RECEITA),JSON - Obter Valor(@Json E' +
      'ntrada,DAM_TIPO_LANCAMENTO),JSON - Obter Valor(@Json Entrada,DAM' +
      '_ED),JSON - Obter Valor(@Json Entrada,DAM_NOSSO_NUMERO))'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REAL' +
      'NAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x' +
      '20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_IDPS</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#' +
      'x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS' +
      '>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE"  >DAM_ID_VAL_REF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="' +
      'ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Ent' +
      'rada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CONST' +
      'ANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;O' +
      'bter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<V' +
      'ARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="FALSE"  >DAM_ID_PREF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNC' +
      'TION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetVa' +
      'lueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VENCIMENTO</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obte' +
      'r&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARI' +
      'ABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE"  >DAM_COD_RECEITA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUN' +
      'CTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetV' +
      'alueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>' +
      #13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_TIPO_LANCAMENTO</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x2' +
      '0;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13 +
      #10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTI' +
      'ON NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValu' +
      'eObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_NOSSO_NUMERO</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueOb' +
      'jectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOM' +
      'PATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>3</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<' +
      'TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'<VALOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>5</' +
      'ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Variable>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;En' +
      'trada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<VALOR>DAM_ID_VAL_REF</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10 +
      '<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVaria' +
      'ble>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_' +
      'VALOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13 +
      #10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Var' +
      'iante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOM' +
      'E>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst' +
      '>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ID_PREF</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetV' +
      'alueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Var' +
      'iante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
      'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
      'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
      'Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'<VALOR>DAM_COD_RECEITA</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6' +
      '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;' +
      'Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'<VALOR>DAM_TIPO_LANCAMENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13 +
      #10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVari' +
      'able>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrad' +
      'a</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TO' +
      'bjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VAL' +
      'OR>DAM_ED</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NO' +
      'ME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10 +
      '<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMERO' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression15: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine23'
    Description = 'Dig Geral'
    Text = 'DigitoBase10(@Retorno)'
    ReturnVar = 'Dig geral'
    Expression = 
      '<CALLRULE ID="195" NAME="DigitoBase10" PARAMSCOUNT="1"> '#13#10'<PARAM' +
      'S>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjRule>'#13 +
      #10'<ID>1</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>DigitoBase10</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVa' +
      'riable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable' +
      '>'#13#10'</PARAMS>'#13#10'<RULEID>195</RULEID>'#13#10'</TObjRule>'#13#10'</ROOT>'#13#10
  end
  object FlowLine22: TFlowLine
    Left = 645
    Top = 543
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowExpression15'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression17: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine23'
    OutputNames = 'FlowLine10'
    Description = 'C'#243'digo completo'
    Text = 
      'Concatena'#231#227'o(JSON - Obter Valor(@Json Entrada,DAM_IDPS),JSON - O' +
      'bter Valor(@Json Entrada,DAM_ID_VAL_REF),JSON - Obter Valor(JSON' +
      ' - Criar objeto(@Dig geral),result),JSON - Obter Valor(@Json Ent' +
      'rada,DAM_VALOR),JSON - Obter Valor(@Json Entrada,DAM_ID_PREF),JS' +
      'ON - Obter Valor(@Json Entrada,DAM_VENCIMENTO),JSON - Obter Valo' +
      'r(@Json Entrada,DAM_COD_RECEITA),JSON - Obter Valor(@Json Entrad' +
      'a,DAM_TIPO_LANCAMENTO),JSON - Obter Valor(@Json Entrada,DAM_ED),' +
      'JSON - Obter Valor(@Json Entrada,DAM_NOSSO_NUMERO))'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REAL' +
      'NAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x' +
      '20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_IDPS</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#' +
      'x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS' +
      '>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE"  >DAM_ID_VAL_REF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="' +
      'ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#' +
      'x20;Criar&#x20;objeto" REALNAME="ebfCreateObjectJSON">'#13#10'<PARAMS>' +
      #13#10'<VARIABLE NAME="Dig&#x20;geral"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >result</CONSTANT>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor' +
      '" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="J' +
      'son&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_' +
      'VALOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#' +
      'x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10 +
      '<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="' +
      'Letras" NULL="FALSE"  >DAM_ID_PREF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNA' +
      'ME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20' +
      ';Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VENCIMEN' +
      'TO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSON&#x20' +
      ';-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PA' +
      'RAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE"  >DAM_COD_RECEITA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALN' +
      'AME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x2' +
      '0;Entrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_TIPO_LA' +
      'NCAMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="JSO' +
      'N&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >DAM_ED</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME' +
      '="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;E' +
      'ntrada"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM_NOSSO_NUME' +
      'RO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueOb' +
      'jectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOM' +
      'PATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<' +
      'TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'<VALOR>DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</' +
      'ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Variable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;En' +
      'trada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<VALOR>DAM_ID_VAL_REF</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10 +
      '<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfCreateObjectJSON</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjVariable>'#13#10'<ID>12</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Dig&' +
      '#x20;geral</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID' +
      '>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>result</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunct' +
      'ion>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObject' +
      'Json</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATI' +
      'VEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEX' +
      'T>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<VALOR>DAM_VALOR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>12</' +
      'ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Variable>'#13#10'<ID>13</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;E' +
      'ntrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>14</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'<VALOR>DAM_ID_PREF</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>15</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10 +
      '<ID>16</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVari' +
      'able>'#13#10'<TObjConst>'#13#10'<ID>17</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DA' +
      'M_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>18</ID>'#13#10'<NOME>FUNCTION' +
      '</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>19</' +
      'ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      'TObjConst>'#13#10'<ID>20</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_COD_RE' +
      'CEITA</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>21</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Va' +
      'riante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>22</ID>'#13#10'<N' +
      'OME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>23</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_TIPO_LANCAMEN' +
      'TO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'<TObjFunction>'#13#10'<ID>24</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Varia' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>25</ID>'#13#10'<NOME' +
      '>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>' +
      #13#10'<ID>26</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_ED</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObj' +
      'Function>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValue' +
      'ObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INC' +
      'OMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>28</ID>'#13#10'<NOME>VARIABLE</NOME>' +
      #13#10'<TEXT>Json&#x20;Entrada</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Varian' +
      'te</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>29</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>DAM_NOSSO_NUMERO</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine23: TFlowLine
    Left = 645
    Top = 468
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
    InputNames = 'FlowExpression15'
    OutputNames = 'FlowExpression17'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression25: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine9'
    Description = 'pegando chave primaria do insert into'
    Text = 'Campo(Abrir Consulta(SQL CONSULTA,),@@IDENTITY)'
    ReturnVar = 'Cod DAM'
    Expression = 
      '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<FUNCT' +
      'ION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ><PSQL' +
      '>'#13#10'<COMMAND>'#13#10'SELECT @@IDENTITY AS [@@IDENTITY];'#13#10'</COMMAND>'#13#10'<P' +
      'ARAMS>'#13#10'</PARAMS>'#13#10'</PSQL></CONSTANT>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE' +
      '="Campo" NULL="FALSE" INDEX = "0" >@@IDENTITY</CONSTANT>'#13#10'</PARA' +
      'MS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExec' +
      'uteQuery</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<VALOR><PSQL>'#13#10'<COMMAND>'#13#10'SELECT @@IDENTITY AS [@@IDENTITY]' +
      ';'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'</PARAMS>'#13#10'</PSQL></VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZG' +
      'luZz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8U1FMPg0KU0VMRUNUJiN4MjA7QE' +
      'BJREVOVElUWSYjeDIwO0FTJiN4MjA7W0BASURFTlRJVFldOw0KPC9TUUw+DQoNCj' +
      'xQQVJBTVM+DQo8L1BBUkFNUz4NCjwvUk9PVD4=</DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'<VALOR>@@IDENTITY</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>0' +
      '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowRemark1: TFlowRemark
    Left = 1416
    Top = 0
    Width = 397
    Height = 226
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
    Description = 
      'MODELO:'#13#10'{'#13#10'"DAM_IDPS":"81",'#13#10'"DAM_ID_VAL_REF":"6",'#13#10'"DAM_VALOR"' +
      ':"00000016645",'#13#10'"DAM_ID_PREF":"3776",'#13#10'"DAM_VENCIMENTO":"202107' +
      '30",'#13#10'"DAM_COD_RECEITA":"83",'#13#10'"DAM_TIPO_LANCAMENTO":"01",'#13#10'"DAM' +
      '_ED":"21",'#13#10'"DAM_NOSSO_NUMERO":"01000006101",'#13#10'"TTL_COD":}'
  end
  object FlowLine2: TFlowLine
    Left = 835
    Top = 767
    Width = 230
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
  object FlowExpression4: TFlowExpression
    Left = 1160
    Top = 759
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
    ChangeDescription = False
    Text = 'Alertar Aguardando Ok(@Cod DAM)'
    Expression = 
      '<FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAl' +
      'ertMessage">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Cod&#x20;DAM"/>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfAlertMessage</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjV' +
      'ariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Cod&#x20;DAM<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjV' +
      'ariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine3: TFlowLine
    Left = 530
    Top = 693
    Width = 80
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
    InputNames = 'FlowExpression14'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 645
    Top = 646
    Width = 60
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowExpression10'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression1: TFlowExpression
    Left = 780
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
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine20'
    Description = 'retorno'
    Text = 
      'Concatena'#231#227'o({"status":"OK", '#13#10'"mensagem":"Sucesso",'#13#10'"result":"' +
      ',@Cod DAM,"})'
    ReturnVar = 'Retorno'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;status&qu' +
      'ot;:&quot;OK&quot;,&#x20;'#13#10'&quot;mensagem&quot;:&quot;Sucesso&qu' +
      'ot;,'#13#10'&quot;result&quot;:&quot;</CONSTANT>'#13#10'<VARIABLE NAME="Cod&' +
      '#x20;DAM"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;}</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>{&quot;status&qu' +
      'ot;:&quot;OK&quot;,&#x20;'#13#10'&quot;mensagem&quot;:&quot;Sucesso&qu' +
      'ot;,'#13#10'&quot;result&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<' +
      'TEXT>Cod&#x20;DAM</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR' +
      '_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR' +
      '_VERSION>'#13#10'<VALOR>&quot;}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine20: TFlowLine
    Left = 835
    Top = 543
    Width = 40
    Height = 264
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
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression20: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    Description = 'Atualizar o valor do DAM conforme tabela de ajuste'
    Text = 
      'Executar Comandos SQL(Concatena'#231#227'o(update GER_DAM set DAM_VALOR ' +
      '= (select (VS_GER_TITULO.TTL_VALOR_TITULO) from VS_GER_TITULO wh' +
      'ere VS_GER_TITULO.TTL_COD = GER_DAM.TTL_COD),'#13#10'DAM_VL_JUROS = (s' +
      'elect CASE WHEN VS_GER_TITULO.TTL_VALOR_JUROS_DIARIO IS NULL THE' +
      'N 0 ELSE VS_GER_TITULO.TTL_VALOR_JUROS_DIARIO END from VS_GER_TI' +
      'TULO where VS_GER_TITULO.TTL_COD = GER_DAM.TTL_COD),'#13#10'DAM_VL_MOR' +
      'A = (select CASE WHEN VS_GER_TITULO.TTL_VALOR_JUROS_MENSAL IS NU' +
      'LL THEN 0 ELSE VS_GER_TITULO.TTL_VALOR_JUROS_MENSAL END from VS_' +
      'GER_TITULO where VS_GER_TITULO.TTL_COD = GER_DAM.TTL_COD),'#13#10'DAM_' +
      'VL_BASE = (select CASE WHEN VS_GER_TITULO.TTL_VALOR_BASE IS NULL' +
      ' THEN 0 ELSE VS_GER_TITULO.TTL_VALOR_BASE END from VS_GER_TITULO' +
      ' where VS_GER_TITULO.TTL_COD = GER_DAM.TTL_COD),'#13#10'DAM_VL_DESCONT' +
      'O = (select CASE WHEN VS_GER_TITULO.TTL_VALOR_DESCONTO IS NULL T' +
      'HEN 0 ELSE VS_GER_TITULO.TTL_VALOR_DESCONTO END from VS_GER_TITU' +
      'LO where VS_GER_TITULO.TTL_COD = GER_DAM.TTL_COD)'#13#10#13#10'WHERE GER_D' +
      'AM.DAM_COD = ,@Cod DAM,;),)'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Comandos&#x20;SQL" REALNAME="ebfSQ' +
      'LExecuteBatch">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;' +
      'o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="FALSE"  >update&#x20;GER_DAM&#x20;set&#x20;DAM_VALOR&#x20;=&#x' +
      '20;(select&#x20;(VS_GER_TITULO.TTL_VALOR_TITULO)&#x20;from&#x20;' +
      'VS_GER_TITULO&#x20;where&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;' +
      'GER_DAM.TTL_COD),'#13#10'DAM_VL_JUROS&#x20;=&#x20;(select&#x20;CASE&#x' +
      '20;WHEN&#x20;VS_GER_TITULO.TTL_VALOR_JUROS_DIARIO&#x20;IS&#x20;N' +
      'ULL&#x20;THEN&#x20;0&#x20;ELSE&#x20;VS_GER_TITULO.TTL_VALOR_JURO' +
      'S_DIARIO&#x20;END&#x20;from&#x20;VS_GER_TITULO&#x20;where&#x20;V' +
      'S_GER_TITULO.TTL_COD&#x20;=&#x20;GER_DAM.TTL_COD),'#13#10'DAM_VL_MORA&' +
      '#x20;=&#x20;(select&#x20;CASE&#x20;WHEN&#x20;VS_GER_TITULO.TTL_V' +
      'ALOR_JUROS_MENSAL&#x20;IS&#x20;NULL&#x20;THEN&#x20;0&#x20;ELSE&#' +
      'x20;VS_GER_TITULO.TTL_VALOR_JUROS_MENSAL&#x20;END&#x20;from&#x20' +
      ';VS_GER_TITULO&#x20;where&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20' +
      ';GER_DAM.TTL_COD),'#13#10'DAM_VL_BASE&#x20;=&#x20;(select&#x20;CASE&#x' +
      '20;WHEN&#x20;VS_GER_TITULO.TTL_VALOR_BASE&#x20;IS&#x20;NULL&#x20' +
      ';THEN&#x20;0&#x20;ELSE&#x20;VS_GER_TITULO.TTL_VALOR_BASE&#x20;EN' +
      'D&#x20;from&#x20;VS_GER_TITULO&#x20;where&#x20;VS_GER_TITULO.TTL' +
      '_COD&#x20;=&#x20;GER_DAM.TTL_COD),'#13#10'DAM_VL_DESCONTO&#x20;=&#x20;' +
      '(select&#x20;CASE&#x20;WHEN&#x20;VS_GER_TITULO.TTL_VALOR_DESCONT' +
      'O&#x20;IS&#x20;NULL&#x20;THEN&#x20;0&#x20;ELSE&#x20;VS_GER_TITUL' +
      'O.TTL_VALOR_DESCONTO&#x20;END&#x20;from&#x20;VS_GER_TITULO&#x20;' +
      'where&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;GER_DAM.TTL_COD)'#13#10#13 +
      #10'WHERE&#x20;GER_DAM.DAM_COD&#x20;=&#x20;</CONSTANT>'#13#10'<VARIABLE N' +
      'AME="Cod&#x20;DAM"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >;</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
      '"TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteBatch' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>' +
      'update&#x20;GER_DAM&#x20;set&#x20;DAM_VALOR&#x20;=&#x20;(select&' +
      '#x20;(VS_GER_TITULO.TTL_VALOR_TITULO)&#x20;from&#x20;VS_GER_TITU' +
      'LO&#x20;where&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;GER_DAM.TTL' +
      '_COD),'#13#10'DAM_VL_JUROS&#x20;=&#x20;(select&#x20;CASE&#x20;WHEN&#x2' +
      '0;VS_GER_TITULO.TTL_VALOR_JUROS_DIARIO&#x20;IS&#x20;NULL&#x20;TH' +
      'EN&#x20;0&#x20;ELSE&#x20;VS_GER_TITULO.TTL_VALOR_JUROS_DIARIO&#x' +
      '20;END&#x20;from&#x20;VS_GER_TITULO&#x20;where&#x20;VS_GER_TITUL' +
      'O.TTL_COD&#x20;=&#x20;GER_DAM.TTL_COD),'#13#10'DAM_VL_MORA&#x20;=&#x20' +
      ';(select&#x20;CASE&#x20;WHEN&#x20;VS_GER_TITULO.TTL_VALOR_JUROS_' +
      'MENSAL&#x20;IS&#x20;NULL&#x20;THEN&#x20;0&#x20;ELSE&#x20;VS_GER_' +
      'TITULO.TTL_VALOR_JUROS_MENSAL&#x20;END&#x20;from&#x20;VS_GER_TIT' +
      'ULO&#x20;where&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;GER_DAM.TT' +
      'L_COD),'#13#10'DAM_VL_BASE&#x20;=&#x20;(select&#x20;CASE&#x20;WHEN&#x2' +
      '0;VS_GER_TITULO.TTL_VALOR_BASE&#x20;IS&#x20;NULL&#x20;THEN&#x20;' +
      '0&#x20;ELSE&#x20;VS_GER_TITULO.TTL_VALOR_BASE&#x20;END&#x20;from' +
      '&#x20;VS_GER_TITULO&#x20;where&#x20;VS_GER_TITULO.TTL_COD&#x20;=' +
      '&#x20;GER_DAM.TTL_COD),'#13#10'DAM_VL_DESCONTO&#x20;=&#x20;(select&#x2' +
      '0;CASE&#x20;WHEN&#x20;VS_GER_TITULO.TTL_VALOR_DESCONTO&#x20;IS&#' +
      'x20;NULL&#x20;THEN&#x20;0&#x20;ELSE&#x20;VS_GER_TITULO.TTL_VALOR' +
      '_DESCONTO&#x20;END&#x20;from&#x20;VS_GER_TITULO&#x20;where&#x20;' +
      'VS_GER_TITULO.TTL_COD&#x20;=&#x20;GER_DAM.TTL_COD)'#13#10#13#10'WHERE&#x20' +
      ';GER_DAM.DAM_COD&#x20;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TE' +
      'XT>Cod&#x20;DAM</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_V' +
      'ERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_V' +
      'ERSION>'#13#10'<VALOR>;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_V' +
      'ERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression16: TFlowExpression
    Left = 970
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
    Description = 'Comando Aplicar Atualiza'#231#227'o CGI_INDICE_AJUSTE'
    Text = 
      'insert into CGI_INDICE_ITENS (IDA_COD, TTL_COD, IDA_VALOR_TITUDO' +
      ', IDA_VALOR_AJUSTE) (select CGI_INDICE_AJUSTE.IDA_COD, CGI_TITUL' +
      'O.TTL_COD, CGI_TITULO.TTL_VALOR_BASE, CGI_INDICE_AJUSTE.IDA_PERC' +
      'ENTUALfrom CGI_TITULO INNER JOIN GER_DAM ON CGI_TITULO.TTL_COD =' +
      ' GER_DAM.TTL_CODINNER JOIN CGI_LICENCA ON CGI_LICENCA.LIC_COD = ' +
      'CGI_TITULO.LIC_CODinner join CGI_ITENS_TAB_PRECO ON CGI_ITENS_TA' +
      'B_PRECO.ITP_COD = CGI_LICENCA.ITP_CODinner join CGI_TABELA_PRECO' +
      ' on CGI_TABELA_PRECO.TBP_COD = CGI_ITENS_TAB_PRECO.TBP_CODINNER ' +
      'JOIN CGI_INDICE_AJUSTE ON CGI_INDICE_AJUSTE.IDA_DATA_BASE <= GER' +
      '_DAM.DAM_DATA_REGWHERE CGI_TITULO.TTL_SITUACAO = '#39'A'#39'and CGI_TITU' +
      'LO.TTL_TIPO like '#39'L%'#39'and (select count(CGI_INDICE_ITENS.IDA_COD)' +
      ' from CGI_INDICE_ITENS where CGI_INDICE_ITENS.IDA_COD = CGI_INDI' +
      'CE_AJUSTE.IDA_COD AND CGI_INDICE_ITENS.TTL_COD = CGI_TITULO.TTL_' +
      'COD) = 0and CGI_TITULO.TTL_COD is not nullAND CGI_TABELA_PRECO.T' +
      'BP_DATA_BASE <= GER_DAM.DAM_DATA_REG)'
    ReturnVar = 'Comando'
    Expression = 
      '<CONSTANT TYPE="Letras" NULL="FALSE"  >insert&#x20;into&#x20;CGI' +
      '_INDICE_ITENS&#x20;(IDA_COD,&#x20;TTL_COD,&#x20;IDA_VALOR_TITUDO' +
      ',&#x20;IDA_VALOR_AJUSTE)&#x20;'#13#10'('#13#10'select&#x20;CGI_INDICE_AJUSTE' +
      '.IDA_COD,&#x20;CGI_TITULO.TTL_COD,&#x20;CGI_TITULO.TTL_VALOR_BAS' +
      'E,&#x20;CGI_INDICE_AJUSTE.IDA_PERCENTUAL'#13#10'from&#x20;CGI_TITULO&#' +
      'x20;INNER&#x20;JOIN&#x20;GER_DAM&#x20;ON&#x20;CGI_TITULO.TTL_COD' +
      '&#x20;=&#x20;GER_DAM.TTL_COD'#13#10'INNER&#x20;JOIN&#x20;CGI_LICENCA&#' +
      'x20;ON&#x20;CGI_LICENCA.LIC_COD&#x20;=&#x20;CGI_TITULO.LIC_COD'#13#10 +
      'inner&#x20;join&#x20;CGI_ITENS_TAB_PRECO&#x20;ON&#x20;CGI_ITENS_' +
      'TAB_PRECO.ITP_COD&#x20;=&#x20;CGI_LICENCA.ITP_COD'#13#10'inner&#x20;jo' +
      'in&#x20;CGI_TABELA_PRECO&#x20;on&#x20;CGI_TABELA_PRECO.TBP_COD&#' +
      'x20;=&#x20;CGI_ITENS_TAB_PRECO.TBP_COD'#13#10'INNER&#x20;JOIN&#x20;CGI' +
      '_INDICE_AJUSTE&#x20;ON&#x20;CGI_INDICE_AJUSTE.IDA_DATA_BASE&#x20' +
      ';&lt;=&#x20;GER_DAM.DAM_DATA_REG'#13#10'WHERE&#x20;CGI_TITULO.TTL_SITU' +
      'ACAO&#x20;=&#x20;'#39'A'#39#13#10'and&#x20;CGI_TITULO.TTL_TIPO&#x20;like&#x2' +
      '0;'#39'L%'#39#13#10'and&#x20;(select&#x20;count(CGI_INDICE_ITENS.IDA_COD)&#x' +
      '20;from&#x20;CGI_INDICE_ITENS&#x20;where&#x20;CGI_INDICE_ITENS.I' +
      'DA_COD&#x20;=&#x20;CGI_INDICE_AJUSTE.IDA_COD&#x20;AND&#x20;CGI_I' +
      'NDICE_ITENS.TTL_COD&#x20;=&#x20;CGI_TITULO.TTL_COD)&#x20;=&#x20;' +
      '0'#13#10'and&#x20;CGI_TITULO.TTL_COD&#x20;is&#x20;not&#x20;null'#13#10'AND&#' +
      'x20;CGI_TABELA_PRECO.TBP_DATA_BASE&#x20;&lt;=&#x20;GER_DAM.DAM_D' +
      'ATA_REG'#13#10')</CONSTANT>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
      #13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>insert&#x20;into&#x20' +
      ';CGI_INDICE_ITENS&#x20;(IDA_COD,&#x20;TTL_COD,&#x20;IDA_VALOR_TI' +
      'TUDO,&#x20;IDA_VALOR_AJUSTE)&#x20;'#13#10'('#13#10'select&#x20;CGI_INDICE_AJ' +
      'USTE.IDA_COD,&#x20;CGI_TITULO.TTL_COD,&#x20;CGI_TITULO.TTL_VALOR' +
      '_BASE,&#x20;CGI_INDICE_AJUSTE.IDA_PERCENTUAL'#13#10'from&#x20;CGI_TITU' +
      'LO&#x20;INNER&#x20;JOIN&#x20;GER_DAM&#x20;ON&#x20;CGI_TITULO.TTL' +
      '_COD&#x20;=&#x20;GER_DAM.TTL_COD'#13#10'INNER&#x20;JOIN&#x20;CGI_LICEN' +
      'CA&#x20;ON&#x20;CGI_LICENCA.LIC_COD&#x20;=&#x20;CGI_TITULO.LIC_C' +
      'OD'#13#10'inner&#x20;join&#x20;CGI_ITENS_TAB_PRECO&#x20;ON&#x20;CGI_IT' +
      'ENS_TAB_PRECO.ITP_COD&#x20;=&#x20;CGI_LICENCA.ITP_COD'#13#10'inner&#x2' +
      '0;join&#x20;CGI_TABELA_PRECO&#x20;on&#x20;CGI_TABELA_PRECO.TBP_C' +
      'OD&#x20;=&#x20;CGI_ITENS_TAB_PRECO.TBP_COD'#13#10'INNER&#x20;JOIN&#x20' +
      ';CGI_INDICE_AJUSTE&#x20;ON&#x20;CGI_INDICE_AJUSTE.IDA_DATA_BASE&' +
      '#x20;&lt;=&#x20;GER_DAM.DAM_DATA_REG'#13#10'WHERE&#x20;CGI_TITULO.TTL_' +
      'SITUACAO&#x20;=&#x20;'#39'A'#39#13#10'and&#x20;CGI_TITULO.TTL_TIPO&#x20;like' +
      '&#x20;'#39'L%'#39#13#10'and&#x20;(select&#x20;count(CGI_INDICE_ITENS.IDA_COD' +
      ')&#x20;from&#x20;CGI_INDICE_ITENS&#x20;where&#x20;CGI_INDICE_ITE' +
      'NS.IDA_COD&#x20;=&#x20;CGI_INDICE_AJUSTE.IDA_COD&#x20;AND&#x20;C' +
      'GI_INDICE_ITENS.TTL_COD&#x20;=&#x20;CGI_TITULO.TTL_COD)&#x20;=&#' +
      'x20;0'#13#10'and&#x20;CGI_TITULO.TTL_COD&#x20;is&#x20;not&#x20;null'#13#10'A' +
      'ND&#x20;CGI_TABELA_PRECO.TBP_DATA_BASE&#x20;&lt;=&#x20;GER_DAM.D' +
      'AM_DATA_REG'#13#10')</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowExpression19: TFlowExpression
    Left = 970
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    Description = 'Executar comando'
    Text = 'Executar Comandos SQL(@Comando,,)'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Comandos&#x20;SQL" REALNAME="ebfSQ' +
      'LExecuteBatch">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Comando"/>'#13#10'<CONSTANT' +
      ' TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteBatch' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Co' +
      'mando</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</' +
      'TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<V' +
      'ALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<I' +
      'D>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowRemark2: TFlowRemark
    Left = 1160
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
    Description = 
      'Ajustar o indice de ajuste desse sistema, baseado na taxa de ser' +
      'vi'#231'o atual'
  end
  object FlowExpression21: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine12'
    Description = 'Gravar no banco'
    Text = 'Executar Atualiza'#231#227'o(SQL ATUALIZA'#199#195'O,)'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Atualiza&#231;&#227;o" REALNAME="e' +
      'bfSQLExecuteUpdate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Atualiz' +
      'a&#231;&#227;o" NULL="FALSE"  ><SQL TYPE="INSERT">'#13#10'<TABLE>GER_D' +
      'AM</TABLE>'#13#10'<SQLFIELD NAME="DAM_IDPS">'#13#10'<FUNCTION NAME="JSON - O' +
      'bter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VAR' +
      'IABLE NAME="Json Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FAL' +
      'SE">DAM_IDPS</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<' +
      'SQLFIELD NAME="DAM_ID_VAL_REF">'#13#10'<FUNCTION NAME="JSON - Obter Va' +
      'lor" REALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE N' +
      'AME="Json Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM' +
      '_ID_VAL_REF</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<S' +
      'QLFIELD NAME="DAM_DIG_VER_GERAL">'#13#10'<FUNCTION NAME="JSON - Obter ' +
      'Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION' +
      ' NAME="JSON - Criar objeto" REALNAME="ebfCreateObjectJSON">'#13#10#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="Dig geral"/>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FU' +
      'NCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">result</CONSTANT' +
      '>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_VAL' +
      'OR">'#13#10'<FUNCTION NAME="Para&#x20;Fracionado" REALNAME="toDouble">' +
      #13#10'<PARAMS>'#13#10'<FUNCTION NAME="Inserir&#x20;Texto&#x20;na&#x20;Posi' +
      '&#231;&#227;o" REALNAME="ebfInsertStringAt">'#13#10'<PARAMS>'#13#10'<FUNCTIO' +
      'N NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValue' +
      'ObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >9</CO' +
      'NSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLF' +
      'IELD NAME="DAM_ID_PREF">'#13#10'<FUNCTION NAME="JSON - Obter Valor" RE' +
      'ALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Js' +
      'on Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_ID_PRE' +
      'F</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NA' +
      'ME="DAM_VENCIMENTO">'#13#10'<FUNCTION NAME="Para Data" REALNAME="toDat' +
      'e">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfCon' +
      'cat">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="' +
      'ebfSubstring">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obte' +
      'r Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9#9#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Le' +
      'tras" NULL="FALSE">DAM_VENCIMENTO</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10 +
      #9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">7' +
      '</CONSTANT>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">2</CONS' +
      'TANT>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letr' +
      'as" NULL="FALSE">/</CONSTANT>'#13#10#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia"' +
      ' REALNAME="ebfSubstring">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<FUNCTION NAME="' +
      'JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE">DAM_VENCIMENTO</CONSTANT>'#13#10#9#9#9#9#9#9#9 +
      '</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NUL' +
      'L="FALSE">5</CONSTANT>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FAL' +
      'SE">2</CONSTANT>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT' +
      ' TYPE="Letras" NULL="FALSE">/</CONSTANT>'#13#10#9#9#9#9'<FUNCTION NAME="Su' +
      'bsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<FUNC' +
      'TION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">' +
      #13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9#9#9 +
      #9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_VENCIMENTO</CONSTAN' +
      'T>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="I' +
      'nteiro" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro' +
      '" NULL="FALSE">4</CONSTANT>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9 +
      #9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"' +
      '></CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NA' +
      'ME="DAM_COD_RECEITA">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALN' +
      'AME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json ' +
      'Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_COD_RECEI' +
      'TA</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD N' +
      'AME="DAM_TIPO_LANCAMENTO">'#13#10'<FUNCTION NAME="JSON - Obter Valor" ' +
      'REALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="' +
      'Json Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_TIPO' +
      '_LANCAMENTO</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<S' +
      'QLFIELD NAME="DAM_ED">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REAL' +
      'NAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json' +
      ' Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_ED</CONS' +
      'TANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM' +
      '_NOSSO_NUMERO">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAME="e' +
      'bfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrad' +
      'a"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_NOSSO_NUMERO</C' +
      'ONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="' +
      'DAM_COD_BARRA">'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'</SQLFIELD>'#13#10'<SQLFI' +
      'ELD NAME="DAM_B1">'#13#10'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfC' +
      'oncat">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="eb' +
      'fSubstring">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9'<' +
      'CONSTANT TYPE="Inteiro" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9'<CONSTANT' +
      ' TYPE="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FU' +
      'NCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">-</CONSTANT>'#13#10#9#9 +
      '<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJ' +
      'son">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="JSON - Criar objeto" REA' +
      'LNAME="ebfCreateObjectJSON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<CALLRULE ID=' +
      '"195" NAME="DigitoBase10" PARAMSCOUNT="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9 +
      #9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9#9#9#9#9#9#9 +
      '<CONSTANT TYPE="Inteiro" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PA' +
      'RAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</CALLRULE>'#13 +
      #10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE">result</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_B2">'#13#10'<FUNC' +
      'TION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9'<PARAMS>'#13#10#9#9'<FU' +
      'NCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9'<PARAMS>' +
      #13#10#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" N' +
      'ULL="FALSE">12</CONSTANT>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FA' +
      'LSE">11</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE">-</CONSTANT>'#13#10#9#9'<FUNCTION NAME="JSON - O' +
      'bter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9 +
      '<FUNCTION NAME="JSON - Criar objeto" REALNAME="ebfCreateObjectJS' +
      'ON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<CALLRULE ID="195" NAME="DigitoBase10' +
      '" PARAMSCOUNT="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<FUNCTION NAME="Sub' +
      'sequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro"' +
      ' NULL="FALSE">12</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" ' +
      'NULL="FALSE">11</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTI' +
      'ON>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</CALLRULE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</' +
      'FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">result</CONS' +
      'TANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</S' +
      'QLFIELD>'#13#10'<SQLFIELD NAME="DAM_B3">'#13#10'<FUNCTION NAME="Concatena'#231#227'o' +
      '" REALNAME="ebfConcat">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="Subsequ'#234'nc' +
      'ia" REALNAME="ebfSubstring">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="R' +
      'etorno"/>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">23</CONSTAN' +
      'T>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9 +
      '</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '>-</CONSTANT>'#13#10#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="e' +
      'bfGetValueObjectJson">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="JSON - ' +
      'Criar objeto" REALNAME="ebfCreateObjectJSON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9 +
      #9#9#9#9'<CALLRULE ID="195" NAME="DigitoBase10" PARAMSCOUNT="1">'#13#10#9#9#9 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="eb' +
      'fSubstring">'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Retor' +
      'no"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">23</CONST' +
      'ANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">11</CONSTA' +
      'NT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10 +
      #9#9#9#9#9#9'</CALLRULE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE">result</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9 +
      '</FUNCTION>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAM' +
      'E="DAM_B4">'#13#10'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">' +
      #13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstr' +
      'ing">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE">34</CONSTANT>'#13#10#9#9#9#9'<CONSTANT TYPE=' +
      '"Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION' +
      '>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">-</CONSTANT>'#13#10#9#9'<FUNCT' +
      'ION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13 +
      #10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="JSON - Criar objeto" REALNAME=' +
      '"ebfCreateObjectJSON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<CALLRULE ID="195" ' +
      'NAME="DigitoBase10" PARAMSCOUNT="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<' +
      'FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9#9#9#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONST' +
      'ANT TYPE="Inteiro" NULL="FALSE">34</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTA' +
      'NT TYPE="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>' +
      #13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</CALLRULE>'#13#10#9#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">result</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="TTL_COD">'#13#10'<FUNCTION' +
      ' NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9'<' +
      'PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Le' +
      'tras" NULL="FALSE">TTL_COD</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10 +
      '</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_SITUACAO">'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE">A</CONSTANT>'#13#10'</SQLFIELD>'#13#10'</SQL>'#13#10'</CONSTANT>' +
      #13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10 +
      '</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteUpdat' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Atualiza&#231;&#227;o</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MK' +
      'R_VERSION>'#13#10'<VALOR><SQL TYPE="INSERT">'#13#10'<TABLE>GER_DAM</TABLE>'#13#10 +
      '<SQLFIELD NAME="DAM_IDPS">'#13#10'<FUNCTION NAME="JSON - Obter Valor" ' +
      'REALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="' +
      'Json Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_IDPS' +
      '</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAM' +
      'E="DAM_ID_VAL_REF">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAM' +
      'E="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json En' +
      'trada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_ID_VAL_REF<' +
      '/CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME' +
      '="DAM_DIG_VER_GERAL">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALN' +
      'AME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="JSON ' +
      '- Criar objeto" REALNAME="ebfCreateObjectJSON">'#13#10#9#9#9'<PARAMS>'#13#10#9#9 +
      #9#9'<VARIABLE NAME="Dig geral"/>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">result</CONSTANT>'#13#10#9'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_VALOR">'#13#10'<FUNCT' +
      'ION NAME="Para&#x20;Fracionado" REALNAME="toDouble">'#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="Inserir&#x20;Texto&#x20;na&#x20;Posi&#231;&#227;' +
      'o" REALNAME="ebfInsertStringAt">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON' +
      '&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">' +
      #13#10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Entrada"/>'#13#10'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE"  >DAM_VALOR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >9</CONSTANT>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >,</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="D' +
      'AM_ID_PREF">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfG' +
      'etValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrada"/' +
      '>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_ID_PREF</CONSTANT>' +
      #13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_VENC' +
      'IMENTO">'#13#10'<FUNCTION NAME="Para Data" REALNAME="toDate">'#13#10#9'<PARAM' +
      'S>'#13#10#9#9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring' +
      '">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REA' +
      'LNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIAB' +
      'LE NAME="Json Entrada"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE">DAM_VENCIMENTO</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNC' +
      'TION>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">7</CONSTANT>'#13 +
      #10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">2</CONSTANT>'#13#10#9#9#9#9#9 +
      '</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE">/</CONSTANT>'#13#10#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="e' +
      'bfSubstring">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter' +
      ' Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9 +
      #9#9#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE">DAM_VENCIMENTO</CONSTANT>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">5<' +
      '/CONSTANT>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">2</CONST' +
      'ANT>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE">/</CONSTANT>'#13#10#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" ' +
      'REALNAME="ebfSubstring">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<FUNCTION NAME="J' +
      'SON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9'<PA' +
      'RAMS>'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9#9#9#9#9#9#9'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE">DAM_VENCIMENTO</CONSTANT>'#13#10#9#9#9#9#9#9#9'<' +
      '/PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL' +
      '="FALSE">1</CONSTANT>'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALS' +
      'E">4</CONSTANT>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9'</PARAMS>'#13#10 +
      #9#9'</FUNCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>' +
      #13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_COD_' +
      'RECEITA">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetV' +
      'alueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10 +
      #9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_COD_RECEITA</CONSTANT' +
      '>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_TIP' +
      'O_LANCAMENTO">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAME="eb' +
      'fGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrada' +
      '"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_TIPO_LANCAMENTO<' +
      '/CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME' +
      '="DAM_ED">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGet' +
      'ValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrada"/>'#13 +
      #10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">DAM_ED</CONSTANT>'#13#10#9'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_NOSSO_NUMER' +
      'O">'#13#10'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<VARIABLE NAME="Json Entrada"/>'#13#10#9#9'<CON' +
      'STANT TYPE="Letras" NULL="FALSE">DAM_NOSSO_NUMERO</CONSTANT>'#13#10#9'<' +
      '/PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_COD_BARR' +
      'A">'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DA' +
      'M_B1">'#13#10'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9'<P' +
      'ARAMS>'#13#10#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">' +
      #13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9'<CONSTANT TYP' +
      'E="Inteiro" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9'<CONSTANT TYPE="Intei' +
      'ro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">-</CONSTANT>'#13#10#9#9'<FUNCTION NA' +
      'ME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="JSON - Criar objeto" REALNAME="ebfCr' +
      'eateObjectJSON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<CALLRULE ID="195" NAME="' +
      'DigitoBase10" PARAMSCOUNT="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<FUNCTI' +
      'ON NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9#9#9#9#9#9#9'<PARAM' +
      'S>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TY' +
      'PE="Inteiro" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE' +
      '="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9 +
      #9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</CALLRULE>'#13#10#9#9#9#9#9'</PARA' +
      'MS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">r' +
      'esult</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_B2">'#13#10'<FUNCTION NAME="C' +
      'oncatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME=' +
      '"Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIA' +
      'BLE NAME="Retorno"/>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">' +
      '12</CONSTANT>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">11</CON' +
      'STANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE">-</CONSTANT>'#13#10#9#9'<FUNCTION NAME="JSON - Obter Valor" ' +
      'REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<FUNCTION NA' +
      'ME="JSON - Criar objeto" REALNAME="ebfCreateObjectJSON">'#13#10#9#9#9#9#9'<' +
      'PARAMS>'#13#10#9#9#9#9#9#9'<CALLRULE ID="195" NAME="DigitoBase10" PARAMSCOUN' +
      'T="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" R' +
      'EALNAME="ebfSubstring">'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE ' +
      'NAME="Retorno"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE' +
      '">12</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE"' +
      '>11</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9 +
      '</PARAMS>'#13#10#9#9#9#9#9#9'</CALLRULE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9 +
      #9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">result</CONSTANT>'#13#10#9#9#9'</' +
      'PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<S' +
      'QLFIELD NAME="DAM_B3">'#13#10'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="' +
      'ebfConcat">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME' +
      '="ebfSubstring">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9 +
      #9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">23</CONSTANT>'#13#10#9#9#9#9'<CON' +
      'STANT TYPE="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9 +
      #9'</FUNCTION>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">-</CONSTANT' +
      '>'#13#10#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<FUNCTION NAME="JSON - Criar objeto' +
      '" REALNAME="ebfCreateObjectJSON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<CALLRUL' +
      'E ID="195" NAME="DigitoBase10" PARAMSCOUNT="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>' +
      #13#10#9#9#9#9#9#9#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">' +
      #13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9#9 +
      #9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">23</CONSTANT>'#13#10#9#9#9#9#9#9 +
      #9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9#9#9#9#9 +
      #9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</CALL' +
      'RULE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letr' +
      'as" NULL="FALSE">result</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13 +
      #10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="DAM_B4">'#13 +
      #10'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9'<PARAMS>'#13 +
      #10#9#9'<FUNCTION NAME="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9'<CONSTANT TYPE="Inte' +
      'iro" NULL="FALSE">34</CONSTANT>'#13#10#9#9#9#9'<CONSTANT TYPE="Inteiro" NU' +
      'LL="FALSE">11</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9#9'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE">-</CONSTANT>'#13#10#9#9'<FUNCTION NAME="JS' +
      'ON - Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9'<PARAMS>' +
      #13#10#9#9#9#9'<FUNCTION NAME="JSON - Criar objeto" REALNAME="ebfCreateOb' +
      'jectJSON">'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<CALLRULE ID="195" NAME="Digito' +
      'Base10" PARAMSCOUNT="1">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<FUNCTION NAM' +
      'E="Subsequ'#234'ncia" REALNAME="ebfSubstring">'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9 +
      #9#9#9#9#9#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="In' +
      'teiro" NULL="FALSE">34</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Int' +
      'eiro" NULL="FALSE">11</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</' +
      'FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</CALLRULE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10 +
      #9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">result' +
      '</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'</SQLFIELD>'#13#10'<SQLFIELD NAME="TTL_COD">'#13#10'<FUNCTION NAME="JSON ' +
      '- Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9'<PARAMS>'#13#10#9#9'<' +
      'VARIABLE NAME="Json Entrada"/>'#13#10#9#9'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE">TTL_COD</CONSTANT>'#13#10#9'</PARAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13 +
      #10'<SQLFIELD NAME="DAM_SITUACAO">'#13#10'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">A</CONSTANT>'#13#10'</SQLFIELD>'#13#10'</SQL>'#13#10'</VALOR>'#13#10'<DMLTYPE>dtIn' +
      'sert</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGlu' +
      'Zz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8VERNTFRhYmxlPjxOQU1FPkdFUl9E' +
      'QU08L05BTUU+PFJFQUxOQU1FPkdFUl9EQU08L1JFQUxOQU1FPjxESUFHUkFNWE1M' +
      'PjwvRElBR1JBTVhNTD48L1RETUxUYWJsZT4NCjxURE1MRmllbGQ+PE5BTUU+REFN' +
      'X0lEUFM8L05BTUU+PFJFQUxOQU1FPkRBTV9JRFBTPC9SRUFMTkFNRT48RElBR1JB' +
      'TVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJaUJsYm1OdlpHbHVaejBpU1ZO' +
      'UExUZzROVGt0TVNJL1BnMEtQRkpQVDFRK0RRbzhWRTlpYWtaMWJtTjBhVzl1UGcw' +
      'S1BFbEVQakU4TDBsRVBnMEtQRTVQVFVVK1JsVk9RMVJKVDA0OEwwNVBUVVUrRFFv' +
      'OFZFVllWRDVsWW1aSFpYUldZV3gxWlU5aWFtVmpkRXB6YjI0OEwxUkZXRlErRFFv' +
      'OFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbFFUejVXWVhKcFlXNTBaVHd2VkVs' +
      'UVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1Za' +
      'RlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxO' +
      'SlQwNCtEUW84VUVGU1FVMVRQZzBLUEZSUFltcFdZWEpwWVdKc1pUNE5DanhKUkQ0' +
      'eVBDOUpSRDROQ2p4T1QwMUZQbFpCVWtsQlFreEZQQzlPVDAxRlBnMEtQRlJGV0ZR' +
      'K1NuTnZiaVlqZURJd08wVnVkSEpoWkdFOEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZO' +
      'RlBDOVRVVXcrRFFvOFZFbFFUejVXWVhKcFlXNTBaVHd2VkVsUVR6NE5DanhKVGtO' +
      'UFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFK' +
      'ZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84TDFS' +
      'UFltcFdZWEpwWVdKc1pUNE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStNend2U1VR' +
      'K0RRbzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQand2VkVW' +
      'WVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3' +
      'dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVG' +
      'VVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFa' +
      'RlVsTkpUMDQrRFFvOFZrRk1UMUkrUkVGTlgwbEVVRk04TDFaQlRFOVNQZzBLUEVS' +
      'TlRGUlpVRVUrWkhSVFpXeGxZM1E4TDBSTlRGUlpVRVUrRFFvOFJFbEJSMUpCVFZo' +
      'TlRENDhMMFJKUVVkU1FVMVlUVXcrRFFvOFRsVk1UejVHUVV4VFJUd3ZUbFZNVHo0' +
      'TkNqeEdTVVZNUkVsT1JFVllQaTB4UEM5R1NVVk1SRWxPUkVWWVBnMEtQRWRWU1VR' +
      'K1BDOUhWVWxFUGcwS1BGTlFSVU5KUVV4RFQwUkZQand2VTFCRlEwbEJURU5QUkVV' +
      'K0RRbzhMMVJQWW1wRGIyNXpkRDROQ2p3dlVFRlNRVTFUUGcwS1BDOVVUMkpxUm5W' +
      'dVkzUnBiMjQrRFFvOEwxSlBUMVErRFFvPTwvRElBR1JBTVhNTD48VkFMVUU+SlNP' +
      'TiAtIE9idGVyIFZhbG9yKEBKc29uIEVudHJhZGEsREFNX0lEUFMpPC9WQUxVRT4N' +
      'Cgk8RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT0iSlNPTiAtIE9idGVyIFZhbG9y' +
      'IiBSRUFMTkFNRT0iZWJmR2V0VmFsdWVPYmplY3RKc29uIj4NCgkJCTxQQVJBTVM+' +
      'DQoJCQkJPFZBUklBQkxFIE5BTUU9Ikpzb24gRW50cmFkYSIvPg0KCQkJCTxDT05T' +
      'VEFOVCBUWVBFPSJMZXRyYXMiIE5VTEw9IkZBTFNFIj5EQU1fSURQUzwvQ09OU1RB' +
      'TlQ+DQoJCQk8L1BBUkFNUz4NCgkJPC9GVU5DVElPTj48L0VYUFJFU1NJT04+DQo8' +
      'L1RETUxGaWVsZD4NCjxURE1MRmllbGQ+PE5BTUU+REFNX0lEX1ZBTF9SRUY8L05B' +
      'TUU+PFJFQUxOQU1FPkRBTV9JRF9WQUxfUkVGPC9SRUFMTkFNRT48RElBR1JBTVhN' +
      'TD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJaUJsYm1OdlpHbHVaejBpU1ZOUExU' +
      'ZzROVGt0TVNJL1BnMEtQRkpQVDFRK0RRbzhWRTlpYWtaMWJtTjBhVzl1UGcwS1BF' +
      'bEVQakU4TDBsRVBnMEtQRTVQVFVVK1JsVk9RMVJKVDA0OEwwNVBUVVUrRFFvOFZF' +
      'VllWRDVsWW1aSFpYUldZV3gxWlU5aWFtVmpkRXB6YjI0OEwxUkZXRlErRFFvOFUx' +
      'Rk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbFFUejVXWVhKcFlXNTBaVHd2VkVsUVR6' +
      'NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRE' +
      'NE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQw' +
      'NCtEUW84VUVGU1FVMVRQZzBLUEZSUFltcFdZWEpwWVdKc1pUNE5DanhKUkQ0eFBD' +
      'OUpSRDROQ2p4T1QwMUZQbFpCVWtsQlFreEZQQzlPVDAxRlBnMEtQRlJGV0ZRK1Nu' +
      'TnZiaVlqZURJd08wVnVkSEpoWkdFOEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBD' +
      'OVRVVXcrRFFvOFZFbFFUejVXWVhKcFlXNTBaVHd2VkVsUVR6NE5DanhKVGtOUFRW' +
      'QkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZr' +
      'VlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84TDFSUFlt' +
      'cFdZWEpwWVdKc1pUNE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStNVHd2U1VRK0RR' +
      'bzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQand2VkVWWVZE' +
      'NE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZF' +
      'bFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNW' +
      'WkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVs' +
      'TkpUMDQrRFFvOFZrRk1UMUkrUkVGTlgwbEVYMVpCVEY5U1JVWThMMVpCVEU5U1Bn' +
      'MEtQRVJOVEZSWlVFVStaSFJUWld4bFkzUThMMFJOVEZSWlVFVStEUW84UkVsQlIx' +
      'SkJUVmhOVEQ0OEwwUkpRVWRTUVUxWVRVdytEUW84VGxWTVR6NUdRVXhUUlR3dlRs' +
      'Vk1UejROQ2p4R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUGcwS1BF' +
      'ZFZTVVErUEM5SFZVbEVQZzBLUEZOUVJVTkpRVXhEVDBSRlBqd3ZVMUJGUTBsQlRF' +
      'TlBSRVUrRFFvOEwxUlBZbXBEYjI1emRENE5Dand2VUVGU1FVMVRQZzBLUEM5VVQy' +
      'SnFSblZ1WTNScGIyNCtEUW84TDFKUFQxUStEUW89PC9ESUFHUkFNWE1MPjxWQUxV' +
      'RT5KU09OIC0gT2J0ZXIgVmFsb3IoQEpzb24gRW50cmFkYSxEQU1fSURfVkFMX1JF' +
      'Rik8L1ZBTFVFPg0KCTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJKU09OIC0g' +
      'T2J0ZXIgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg0K' +
      'CQkJPFBBUkFNUz4NCgkJCQk8VkFSSUFCTEUgTkFNRT0iSnNvbiBFbnRyYWRhIi8+' +
      'DQoJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJhcyIgTlVMTD0iRkFMU0UiPkRBTV9J' +
      'RF9WQUxfUkVGPC9DT05TVEFOVD4NCgkJCTwvUEFSQU1TPg0KCQk8L0ZVTkNUSU9O' +
      'PjwvRVhQUkVTU0lPTj4NCjwvVERNTEZpZWxkPg0KPFRETUxGaWVsZD48TkFNRT5E' +
      'QU1fRElHX1ZFUl9HRVJBTDwvTkFNRT48UkVBTE5BTUU+REFNX0RJR19WRVJfR0VS' +
      'QUw8L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0' +
      'd0lpQmxibU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcwS1BGSlBUMVErRFFv' +
      'OFZFOWlha1oxYm1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcwS1BFNVBUVVUrUmxW' +
      'T1ExUkpUMDQ4TDA1UFRVVStEUW84VkVWWVZENWxZbVpIWlhSV1lXeDFaVTlpYW1W' +
      'amRFcHpiMjQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVs' +
      'UVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtG' +
      'TVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJ' +
      'dU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhVRUZTUVUxVFBnMEtQRlJQWW1w' +
      'R2RXNWpkR2x2Ymo0TkNqeEpSRDR5UEM5SlJENE5DanhPVDAxRlBrWlZUa05VU1U5' +
      'T1BDOU9UMDFGUGcwS1BGUkZXRlErWldKbVEzSmxZWFJsVDJKcVpXTjBTbE5QVGp3' +
      'dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4VVNWQlBQbFpoY21s' +
      'aGJuUmxQQzlVU1ZCUFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1' +
      'RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5' +
      'TlMxSmZWa1ZTVTBsUFRqNE5DanhRUVZKQlRWTStEUW84VkU5aWFsWmhjbWxoWW14' +
      'bFBnMEtQRWxFUGpROEwwbEVQZzBLUEU1UFRVVStWa0ZTU1VGQ1RFVThMMDVQVFVV' +
      'K0RRbzhWRVZZVkQ1RWFXY21JM2d5TUR0blpYSmhiRHd2VkVWWVZENE5DanhUVVV3' +
      'K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZFbFFUejROQ2p4' +
      'SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4' +
      'TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFv' +
      'OEwxUlBZbXBXWVhKcFlXSnNaVDROQ2p3dlVFRlNRVTFUUGcwS1BDOVVUMkpxUm5W' +
      'dVkzUnBiMjQrRFFvOFZFOWlha052Ym5OMFBnMEtQRWxFUGpNOEwwbEVQZzBLUEU1' +
      'UFRVVStRMDlPVTFSQlRsUThMMDVQVFVVK0RRbzhWRVZZVkQ0OEwxUkZXRlErRFFv' +
      'OFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbFFUejVNWlhSeVlYTThMMVJKVUU4' +
      'K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3' +
      'K0RRbzhUVXRTWDFaRlVsTkpUMDQrTVM0eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5' +
      'T1BnMEtQRlpCVEU5U1BuSmxjM1ZzZER3dlZrRk1UMUkrRFFvOFJFMU1WRmxRUlQ1' +
      'a2RGTmxiR1ZqZER3dlJFMU1WRmxRUlQ0TkNqeEVTVUZIVWtGTldFMU1Qand2UkVs' +
      'QlIxSkJUVmhOVEQ0TkNqeE9WVXhQUGtaQlRGTkZQQzlPVlV4UFBnMEtQRVpKUlV4' +
      'RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW84UjFWSlJENDhMMGRWU1VR' +
      'K0RRbzhVMUJGUTBsQlRFTlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5Dand2VkU5' +
      'aWFrTnZibk4wUGcwS1BDOVFRVkpCVFZNK0RRbzhMMVJQWW1wR2RXNWpkR2x2Ymo0' +
      'TkNqd3ZVazlQVkQ0TkNnPT08L0RJQUdSQU1YTUw+PFZBTFVFPkpTT04gLSBPYnRl' +
      'ciBWYWxvcihKU09OIC0gQ3JpYXIgb2JqZXRvKEBEaWcgZ2VyYWwpLHJlc3VsdCk8' +
      'L1ZBTFVFPg0KCTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJKU09OIC0gT2J0' +
      'ZXIgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg0KCQkJ' +
      'PFBBUkFNUz4NCgkJCQk8RlVOQ1RJT04gTkFNRT0iSlNPTiAtIENyaWFyIG9iamV0' +
      'byIgUkVBTE5BTUU9ImViZkNyZWF0ZU9iamVjdEpTT04iPg0KCQkJCQk8UEFSQU1T' +
      'Pg0KCQkJCQkJPFZBUklBQkxFIE5BTUU9IkRpZyBnZXJhbCIvPg0KCQkJCQk8L1BB' +
      'UkFNUz4NCgkJCQk8L0ZVTkNUSU9OPg0KCQkJCTxDT05TVEFOVCBUWVBFPSJMZXRy' +
      'YXMiIE5VTEw9IkZBTFNFIj5yZXN1bHQ8L0NPTlNUQU5UPg0KCQkJPC9QQVJBTVM+' +
      'DQoJCTwvRlVOQ1RJT04+PC9FWFBSRVNTSU9OPg0KPC9URE1MRmllbGQ+DQo8VERN' +
      'TEZpZWxkPjxOQU1FPkRBTV9WQUxPUjwvTkFNRT48UkVBTE5BTUU+REFNX1ZBTE9S' +
      'PC9SRUFMTkFNRT48RElBR1JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJ' +
      'aUJsYm1OdlpHbHVaejBpU1ZOUExUZzROVGt0TVNJL1BnMEtQRkpQVDFRK0RRbzhW' +
      'RTlpYWtaMWJtTjBhVzl1UGcwS1BFbEVQakU4TDBsRVBnMEtQRTVQVFVVK1JsVk9R' +
      'MVJKVDA0OEwwNVBUVVUrRFFvOFZFVllWRDUwYjBSdmRXSnNaVHd2VkVWWVZENE5D' +
      'anhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBrWnlZV05wYjI1aFpHODhM' +
      'MVJKVUU4K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJW' +
      'RWxXUlV3K0RRbzhUVXRTWDFaRlVsTkpUMDQrTlM0d0xqQXVNVGM4TDAxTFVsOVdS' +
      'VkpUU1U5T1BnMEtQRkJCVWtGTlV6NE5DanhVVDJKcVJuVnVZM1JwYjI0K0RRbzhT' +
      'VVErTVR3dlNVUStEUW84VGs5TlJUNUdWVTVEVkVsUFRqd3ZUazlOUlQ0TkNqeFVS' +
      'VmhVUG1WaVprbHVjMlZ5ZEZOMGNtbHVaMEYwUEM5VVJWaFVQZzBLUEZOUlRENUdR' +
      'VXhUUlR3dlUxRk1QZzBLUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcwS1BFbE9R' +
      'MDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BFMUxV' +
      'bDlXUlZKVFNVOU9QalV1TUM0d0xqRTNQQzlOUzFKZlZrVlNVMGxQVGo0TkNqeFFR' +
      'VkpCVFZNK0RRbzhWRTlpYWtaMWJtTjBhVzl1UGcwS1BFbEVQakU4TDBsRVBnMEtQ' +
      'RTVQVFVVK1JsVk9RMVJKVDA0OEwwNVBUVVUrRFFvOFZFVllWRDVsWW1aSFpYUldZ' +
      'V3gxWlU5aWFtVmpkRXB6YjI0OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRV' +
      'VXcrRFFvOFZFbFFUejVXWVhKcFlXNTBaVHd2VkVsUVR6NE5DanhKVGtOUFRWQkJW' +
      'RWxXUlV3K1ZGSlZSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRT' +
      'VTlPUGpVdU1DNHdMakUzUEM5TlMxSmZWa1ZTVTBsUFRqNE5DanhRUVZKQlRWTStE' +
      'UW84VkU5aWFsWmhjbWxoWW14bFBnMEtQRWxFUGpFOEwwbEVQZzBLUEU1UFRVVStW' +
      'a0ZTU1VGQ1RFVThMMDVQVFVVK0RRbzhWRVZZVkQ1S2MyOXVKaU40TWpBN1JXNTBj' +
      'bUZrWVR3dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4VVNWQlBQ' +
      'bFpoY21saGJuUmxQQzlVU1ZCUFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1R1FVeFRS' +
      'VHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpVdU1DNHdM' +
      'akUzUEM5TlMxSmZWa1ZTVTBsUFRqNE5Dand2VkU5aWFsWmhjbWxoWW14bFBnMEtQ' +
      'RlJQWW1wRGIyNXpkRDROQ2p4SlJENHhQQzlKUkQ0TkNqeE9UMDFGUGtOUFRsTlVR' +
      'VTVVUEM5T1QwMUZQZzBLUEZSRldGUStQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRS' +
      'VHd2VTFGTVBnMEtQRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQZzBLUEVsT1EwOU5V' +
      'RUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUxTFVsOVdS' +
      'VkpUU1U5T1BqVXVNQzR3TGpFM1BDOU5TMUpmVmtWU1UwbFBUajROQ2p4V1FVeFBV' +
      'ajVFUVUxZlZrRk1UMUk4TDFaQlRFOVNQZzBLUEVSTlRGUlpVRVUrWkhSVFpXeGxZ' +
      'M1E4TDBSTlRGUlpVRVUrRFFvOFJFbEJSMUpCVFZoTlRENDhMMFJKUVVkU1FVMVlU' +
      'VXcrRFFvOFRsVk1UejVHUVV4VFJUd3ZUbFZNVHo0TkNqeEdTVVZNUkVsT1JFVllQ' +
      'aTB4UEM5R1NVVk1SRWxPUkVWWVBnMEtQRWRWU1VRK1BDOUhWVWxFUGcwS1BGTlFS' +
      'VU5KUVV4RFQwUkZQand2VTFCRlEwbEJURU5QUkVVK0RRbzhMMVJQWW1wRGIyNXpk' +
      'RDROQ2p3dlVFRlNRVTFUUGcwS1BDOVVUMkpxUm5WdVkzUnBiMjQrRFFvOFZFOWlh' +
      'a052Ym5OMFBnMEtQRWxFUGpFOEwwbEVQZzBLUEU1UFRVVStRMDlPVTFSQlRsUThM' +
      'MDVQVFVVK0RRbzhWRVZZVkQ0OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRV' +
      'VXcrRFFvOFZFbFFUejVKYm5SbGFYSnZQQzlVU1ZCUFBnMEtQRWxPUTA5TlVFRlVT' +
      'VlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRT' +
      'VTlPUGpVdU1DNHdMakUzUEM5TlMxSmZWa1ZTVTBsUFRqNE5DanhXUVV4UFVqNDVQ' +
      'QzlXUVV4UFVqNE5DanhFVFV4VVdWQkZQbVIwVTJWc1pXTjBQQzlFVFV4VVdWQkZQ' +
      'ZzBLUEVSSlFVZFNRVTFZVFV3K1BDOUVTVUZIVWtGTldFMU1QZzBLUEU1VlRFOCtS' +
      'a0ZNVTBVOEwwNVZURTgrRFFvOFJrbEZURVJKVGtSRldENHRNVHd2UmtsRlRFUkpU' +
      'a1JGV0Q0TkNqeEhWVWxFUGp3dlIxVkpSRDROQ2p4VFVFVkRTVUZNUTA5RVJUNDhM' +
      'MU5RUlVOSlFVeERUMFJGUGcwS1BDOVVUMkpxUTI5dWMzUStEUW84VkU5aWFrTnZi' +
      'bk4wUGcwS1BFbEVQakU4TDBsRVBnMEtQRTVQVFVVK1EwOU9VMVJCVGxROEwwNVBU' +
      'VVUrRFFvOFZFVllWRDQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytE' +
      'UW84VkVsUVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1Q' +
      'a1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpGVWxOSlQwNCtO' +
      'UzR3TGpBdU1UYzhMMDFMVWw5V1JWSlRTVTlPUGcwS1BGWkJURTlTUGl3OEwxWkJU' +
      'RTlTUGcwS1BFUk5URlJaVUVVK1pIUlRaV3hsWTNROEwwUk5URlJaVUVVK0RRbzhS' +
      'RWxCUjFKQlRWaE5URDQ4TDBSSlFVZFNRVTFZVFV3K0RRbzhUbFZNVHo1R1FVeFRS' +
      'VHd2VGxWTVR6NE5DanhHU1VWTVJFbE9SRVZZUGkweFBDOUdTVVZNUkVsT1JFVllQ' +
      'ZzBLUEVkVlNVUStQQzlIVlVsRVBnMEtQRk5RUlVOSlFVeERUMFJGUGp3dlUxQkZR' +
      'MGxCVEVOUFJFVStEUW84TDFSUFltcERiMjV6ZEQ0TkNqd3ZVRUZTUVUxVFBnMEtQ' +
      'QzlVVDJKcVJuVnVZM1JwYjI0K0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFi' +
      'bU4wYVc5dVBnMEtQQzlTVDA5VVBnMEs8L0RJQUdSQU1YTUw+PFZBTFVFPlBhcmEg' +
      'RnJhY2lvbmFkbyhJbnNlcmlyIFRleHRvIG5hIFBvc2nn428oSlNPTiAtIE9idGVy' +
      'IFZhbG9yKEBKc29uIEVudHJhZGEsREFNX1ZBTE9SKSw5LCwpKTwvVkFMVUU+DQoJ' +
      'PEVYUFJFU1NJT04+PEZVTkNUSU9OIE5BTUU9IlBhcmEgRnJhY2lvbmFkbyIgUkVB' +
      'TE5BTUU9InRvRG91YmxlIj4NCgkJCTxQQVJBTVM+DQoJCQkJPEZVTkNUSU9OIE5B' +
      'TUU9Ikluc2VyaXIgVGV4dG8gbmEgUG9zaefjbyIgUkVBTE5BTUU9ImViZkluc2Vy' +
      'dFN0cmluZ0F0Ij4NCgkJCQkJPFBBUkFNUz4NCgkJCQkJCTxGVU5DVElPTiBOQU1F' +
      'PSJKU09OIC0gT2J0ZXIgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVj' +
      'dEpzb24iPg0KCQkJCQkJCTxQQVJBTVM+DQoJCQkJCQkJCTxWQVJJQUJMRSBOQU1F' +
      'PSJKc29uIEVudHJhZGEiLz4NCgkJCQkJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJh' +
      'cyIgTlVMTD0iRkFMU0UiPkRBTV9WQUxPUjwvQ09OU1RBTlQ+DQoJCQkJCQkJPC9Q' +
      'QVJBTVM+DQoJCQkJCQk8L0ZVTkNUSU9OPg0KCQkJCQkJPENPTlNUQU5UIFRZUEU9' +
      'IkludGVpcm8iIE5VTEw9IkZBTFNFIj45PC9DT05TVEFOVD4NCgkJCQkJCTxDT05T' +
      'VEFOVCBUWVBFPSJMZXRyYXMiIE5VTEw9IkZBTFNFIj4sPC9DT05TVEFOVD4NCgkJ' +
      'CQkJPC9QQVJBTVM+DQoJCQkJPC9GVU5DVElPTj4NCgkJCTwvUEFSQU1TPg0KCQk8' +
      'L0ZVTkNUSU9OPjwvRVhQUkVTU0lPTj4NCjwvVERNTEZpZWxkPg0KPFRETUxGaWVs' +
      'ZD48TkFNRT5EQU1fSURfUFJFRjwvTkFNRT48UkVBTE5BTUU+REFNX0lEX1BSRUY8' +
      'L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lp' +
      'QmxibU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcwS1BGSlBUMVErRFFvOFZF' +
      'OWlha1oxYm1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcwS1BFNVBUVVUrUmxWT1Ex' +
      'UkpUMDQ4TDA1UFRVVStEUW84VkVWWVZENWxZbVpIWlhSV1lXeDFaVTlpYW1WamRF' +
      'cHpiMjQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6' +
      'NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUw' +
      'VThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1D' +
      'NDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhVRUZTUVUxVFBnMEtQRlJQWW1wV1lY' +
      'SnBZV0pzWlQ0TkNqeEpSRDR5UEM5SlJENE5DanhPVDAxRlBsWkJVa2xCUWt4RlBD' +
      'OU9UMDFGUGcwS1BGUkZXRlErU25OdmJpWWplREl3TzBWdWRISmhaR0U4TDFSRldG' +
      'UStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NVdZWEpwWVc1MFpU' +
      'd3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVF' +
      'RlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gx' +
      'WkZVbE5KVDA0K0RRbzhMMVJQWW1wV1lYSnBZV0pzWlQ0TkNqeFVUMkpxUTI5dWMz' +
      'UStEUW84U1VRK016d3ZTVVErRFFvOFRrOU5SVDVEVDA1VFZFRk9WRHd2VGs5TlJU' +
      'NE5DanhVUlZoVVBqd3ZWRVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNq' +
      'eFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1Jr' +
      'Rk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExq' +
      'SXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84VmtGTVQxSStSRUZOWDBsRVgx' +
      'QlNSVVk4TDFaQlRFOVNQZzBLUEVSTlRGUlpVRVUrWkhSVFpXeGxZM1E4TDBSTlRG' +
      'UlpVRVUrRFFvOFJFbEJSMUpCVFZoTlRENDhMMFJKUVVkU1FVMVlUVXcrRFFvOFRs' +
      'Vk1UejVHUVV4VFJUd3ZUbFZNVHo0TkNqeEdTVVZNUkVsT1JFVllQaTB4UEM5R1NV' +
      'Vk1SRWxPUkVWWVBnMEtQRWRWU1VRK1BDOUhWVWxFUGcwS1BGTlFSVU5KUVV4RFQw' +
      'UkZQand2VTFCRlEwbEJURU5QUkVVK0RRbzhMMVJQWW1wRGIyNXpkRDROQ2p3dlVF' +
      'RlNRVTFUUGcwS1BDOVVUMkpxUm5WdVkzUnBiMjQrRFFvOEwxSlBUMVErRFFvPTwv' +
      'RElBR1JBTVhNTD48VkFMVUU+SlNPTiAtIE9idGVyIFZhbG9yKEBKc29uIEVudHJh' +
      'ZGEsREFNX0lEX1BSRUYpPC9WQUxVRT4NCgk8RVhQUkVTU0lPTj48RlVOQ1RJT04g' +
      'TkFNRT0iSlNPTiAtIE9idGVyIFZhbG9yIiBSRUFMTkFNRT0iZWJmR2V0VmFsdWVP' +
      'YmplY3RKc29uIj4NCgkJCTxQQVJBTVM+DQoJCQkJPFZBUklBQkxFIE5BTUU9Ikpz' +
      'b24gRW50cmFkYSIvPg0KCQkJCTxDT05TVEFOVCBUWVBFPSJMZXRyYXMiIE5VTEw9' +
      'IkZBTFNFIj5EQU1fSURfUFJFRjwvQ09OU1RBTlQ+DQoJCQk8L1BBUkFNUz4NCgkJ' +
      'PC9GVU5DVElPTj48L0VYUFJFU1NJT04+DQo8L1RETUxGaWVsZD4NCjxURE1MRmll' +
      'bGQ+PE5BTUU+REFNX1ZFTkNJTUVOVE88L05BTUU+PFJFQUxOQU1FPkRBTV9WRU5D' +
      'SU1FTlRPPC9SRUFMTkFNRT48RElBR1JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2Ymow' +
      'aU1TNHdJaUJsYm1OdlpHbHVaejBpU1ZOUExUZzROVGt0TVNJL1BnMEtQRkpQVDFR' +
      'K0RRbzhWRTlpYWtaMWJtTjBhVzl1UGcwS1BFbEVQakU4TDBsRVBnMEtQRTVQVFVV' +
      'K1JsVk9RMVJKVDA0OEwwNVBUVVUrRFFvOFZFVllWRDUwYjBSaGRHVThMMVJGV0ZR' +
      'K0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1RVlYUmhQQzlVU1ZC' +
      'UFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtW' +
      'TVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBs' +
      'UFRqNE5DanhRUVZKQlRWTStEUW84VkU5aWFrWjFibU4wYVc5dVBnMEtQRWxFUGpR' +
      'OEwwbEVQZzBLUEU1UFRVVStSbFZPUTFSSlQwNDhMMDVQVFVVK0RRbzhWRVZZVkQ1' +
      'bFltWkRiMjVqWVhROEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFv' +
      'OFZFbFFUejVNWlhSeVlYTThMMVJKVUU4K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGta' +
      'QlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRbzhUVXRTWDFaRlVsTkpUMDQrTVM0' +
      'eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtQRkJCVWtGTlV6NE5DanhVVDJK' +
      'cVJuVnVZM1JwYjI0K0RRbzhTVVErTlR3dlNVUStEUW84VGs5TlJUNUdWVTVEVkVs' +
      'UFRqd3ZUazlOUlQ0TkNqeFVSVmhVUG1WaVpsTjFZbk4wY21sdVp6d3ZWRVZZVkQ0' +
      'TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhjend2VkVs' +
      'UVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1Za' +
      'RlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxO' +
      'SlQwNCtEUW84VUVGU1FVMVRQZzBLUEZSUFltcEdkVzVqZEdsdmJqNE5DanhKUkQ0' +
      'MlBDOUpSRDROQ2p4T1QwMUZQa1pWVGtOVVNVOU9QQzlPVDAxRlBnMEtQRlJGV0ZR' +
      'K1pXSm1SMlYwVm1Gc2RXVlBZbXBsWTNSS2MyOXVQQzlVUlZoVVBnMEtQRk5SVEQ1' +
      'R1FVeFRSVHd2VTFGTVBnMEtQRlJKVUU4K1ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRFFv' +
      'OFNVNURUMDFRUVZSSlZrVk1QbFJTVlVVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4' +
      'TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFv' +
      'OFVFRlNRVTFUUGcwS1BGUlBZbXBXWVhKcFlXSnNaVDROQ2p4SlJENDNQQzlKUkQ0' +
      'TkNqeE9UMDFGUGxaQlVrbEJRa3hGUEM5T1QwMUZQZzBLUEZSRldGUStTbk52YmlZ' +
      'amVESXdPMFZ1ZEhKaFpHRThMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3' +
      'K0RRbzhWRWxRVHo1V1lYSnBZVzUwWlR3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVs' +
      'V1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBs' +
      'UFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOEwxUlBZbXBXWVhK' +
      'cFlXSnNaVDROQ2p4VVQySnFRMjl1YzNRK0RRbzhTVVErT0R3dlNVUStEUW84VGs5' +
      'TlJUNURUMDVUVkVGT1ZEd3ZUazlOUlQ0TkNqeFVSVmhVUGp3dlZFVllWRDROQ2p4' +
      'VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4VVNWQlBQa3hsZEhKaGN6d3ZWRWxRVHo0' +
      'TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0' +
      'TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0' +
      'K0RRbzhWa0ZNVDFJK1JFRk5YMVpGVGtOSlRVVk9WRTg4TDFaQlRFOVNQZzBLUEVS' +
      'TlRGUlpVRVUrWkhSVFpXeGxZM1E4TDBSTlRGUlpVRVUrRFFvOFJFbEJSMUpCVFZo' +
      'TlRENDhMMFJKUVVkU1FVMVlUVXcrRFFvOFRsVk1UejVHUVV4VFJUd3ZUbFZNVHo0' +
      'TkNqeEdTVVZNUkVsT1JFVllQaTB4UEM5R1NVVk1SRWxPUkVWWVBnMEtQRWRWU1VR' +
      'K1BDOUhWVWxFUGcwS1BGTlFSVU5KUVV4RFQwUkZQand2VTFCRlEwbEJURU5QUkVV' +
      'K0RRbzhMMVJQWW1wRGIyNXpkRDROQ2p3dlVFRlNRVTFUUGcwS1BDOVVUMkpxUm5W' +
      'dVkzUnBiMjQrRFFvOFZFOWlha052Ym5OMFBnMEtQRWxFUGpjOEwwbEVQZzBLUEU1' +
      'UFRVVStRMDlPVTFSQlRsUThMMDVQVFVVK0RRbzhWRVZZVkQ0OEwxUkZXRlErRFFv' +
      'OFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbFFUejVKYm5SbGFYSnZQQzlVU1ZC' +
      'UFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtW' +
      'TVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBs' +
      'UFRqNE5DanhXUVV4UFVqNDNQQzlXUVV4UFVqNE5DanhFVFV4VVdWQkZQbVIwVTJW' +
      'c1pXTjBQQzlFVFV4VVdWQkZQZzBLUEVSSlFVZFNRVTFZVFV3K1BDOUVTVUZIVWtG' +
      'TldFMU1QZzBLUEU1VlRFOCtSa0ZNVTBVOEwwNVZURTgrRFFvOFJrbEZURVJKVGtS' +
      'RldENHRNVHd2UmtsRlRFUkpUa1JGV0Q0TkNqeEhWVWxFUGp3dlIxVkpSRDROQ2p4' +
      'VFVFVkRTVUZNUTA5RVJUNDhMMU5RUlVOSlFVeERUMFJGUGcwS1BDOVVUMkpxUTI5' +
      'dWMzUStEUW84VkU5aWFrTnZibk4wUGcwS1BFbEVQamc4TDBsRVBnMEtQRTVQVFVV' +
      'K1EwOU9VMVJCVGxROEwwNVBUVVUrRFFvOFZFVllWRDQ4TDFSRldGUStEUW84VTFG' +
      'TVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NUpiblJsYVhKdlBDOVVTVkJQUGcw' +
      'S1BFbE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcw' +
      'S1BFMUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0' +
      'TkNqeFdRVXhQVWo0eVBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldO' +
      'MFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0Ux' +
      'TVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0' +
      'dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVW' +
      'RFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNR' +
      'K0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFibU4wYVc5dVBnMEtQRlJQWW1w' +
      'RGIyNXpkRDROQ2p4SlJENDVQQzlKUkQ0TkNqeE9UMDFGUGtOUFRsTlVRVTVVUEM5' +
      'T1QwMUZQZzBLUEZSRldGUStQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRSVHd2VTFG' +
      'TVBnMEtQRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQZzBLUEVsT1EwOU5VRUZVU1Za' +
      'RlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUxTFVsOVdSVkpUU1U5' +
      'T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p4V1FVeFBVajR2UEM5' +
      'V1FVeFBVajROQ2p4RVRVeFVXVkJGUG1SMFUyVnNaV04wUEM5RVRVeFVXVkJGUGcw' +
      'S1BFUkpRVWRTUVUxWVRVdytQQzlFU1VGSFVrRk5XRTFNUGcwS1BFNVZURTgrUmtG' +
      'TVUwVThMMDVWVEU4K0RRbzhSa2xGVEVSSlRrUkZXRDR0TVR3dlJrbEZURVJKVGtS' +
      'RldENE5DanhIVlVsRVBqd3ZSMVZKUkQ0TkNqeFRVRVZEU1VGTVEwOUVSVDQ4TDFO' +
      'UVJVTkpRVXhEVDBSRlBnMEtQQzlVVDJKcVEyOXVjM1ErRFFvOFZFOWlha1oxYm1O' +
      'MGFXOXVQZzBLUEVsRVBqRXdQQzlKUkQ0TkNqeE9UMDFGUGtaVlRrTlVTVTlPUEM5' +
      'T1QwMUZQZzBLUEZSRldGUStaV0ptVTNWaWMzUnlhVzVuUEM5VVJWaFVQZzBLUEZO' +
      'UlRENUdRVXhUUlR3dlUxRk1QZzBLUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcw' +
      'S1BFbE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcw' +
      'S1BFMUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0' +
      'TkNqeFFRVkpCVFZNK0RRbzhWRTlpYWtaMWJtTjBhVzl1UGcwS1BFbEVQams4TDBs' +
      'RVBnMEtQRTVQVFVVK1JsVk9RMVJKVDA0OEwwNVBUVVUrRFFvOFZFVllWRDVsWW1a' +
      'SFpYUldZV3gxWlU5aWFtVmpkRXB6YjI0OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZO' +
      'RlBDOVRVVXcrRFFvOFZFbFFUejVXWVhKcFlXNTBaVHd2VkVsUVR6NE5DanhKVGtO' +
      'UFRWQkJWRWxXUlV3K1ZGSlZSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5' +
      'V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5DanhRUVZK' +
      'QlRWTStEUW84VkU5aWFsWmhjbWxoWW14bFBnMEtQRWxFUGprOEwwbEVQZzBLUEU1' +
      'UFRVVStWa0ZTU1VGQ1RFVThMMDVQVFVVK0RRbzhWRVZZVkQ1S2MyOXVKaU40TWpB' +
      'N1JXNTBjbUZrWVR3dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4' +
      'VVNWQlBQbFpoY21saGJuUmxQQzlVU1ZCUFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1' +
      'R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpF' +
      'dU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5Dand2VkU5aWFsWmhjbWxoWW14' +
      'bFBnMEtQRlJQWW1wRGIyNXpkRDROQ2p4SlJENDVQQzlKUkQ0TkNqeE9UMDFGUGtO' +
      'UFRsTlVRVTVVUEM5T1QwMUZQZzBLUEZSRldGUStQQzlVUlZoVVBnMEtQRk5SVEQ1' +
      'R1FVeFRSVHd2VTFGTVBnMEtQRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQZzBLUEVs' +
      'T1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUx' +
      'TFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p4' +
      'V1FVeFBVajVFUVUxZlZrVk9RMGxOUlU1VVR6d3ZWa0ZNVDFJK0RRbzhSRTFNVkZs' +
      'UVJUNWtkRk5sYkdWamREd3ZSRTFNVkZsUVJUNE5DanhFU1VGSFVrRk5XRTFNUGp3' +
      'dlJFbEJSMUpCVFZoTlRENE5DanhPVlV4UFBrWkJURk5GUEM5T1ZVeFBQZzBLUEVa' +
      'SlJVeEVTVTVFUlZnK0xURThMMFpKUlV4RVNVNUVSVmcrRFFvOFIxVkpSRDQ4TDBk' +
      'VlNVUStEUW84VTFCRlEwbEJURU5QUkVVK1BDOVRVRVZEU1VGTVEwOUVSVDROQ2p3' +
      'dlZFOWlha052Ym5OMFBnMEtQQzlRUVZKQlRWTStEUW84TDFSUFltcEdkVzVqZEds' +
      'dmJqNE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStNVEk4TDBsRVBnMEtQRTVQVFVV' +
      'K1EwOU9VMVJCVGxROEwwNVBUVVUrRFFvOFZFVllWRDQ4TDFSRldGUStEUW84VTFG' +
      'TVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NUpiblJsYVhKdlBDOVVTVkJQUGcw' +
      'S1BFbE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcw' +
      'S1BFMUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0' +
      'TkNqeFdRVXhQVWo0MVBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldO' +
      'MFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0Ux' +
      'TVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0' +
      'dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVW' +
      'RFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNR' +
      'K0RRbzhWRTlpYWtOdmJuTjBQZzBLUEVsRVBqRXpQQzlKUkQ0TkNqeE9UMDFGUGtO' +
      'UFRsTlVRVTVVUEM5T1QwMUZQZzBLUEZSRldGUStQQzlVUlZoVVBnMEtQRk5SVEQ1' +
      'R1FVeFRSVHd2VTFGTVBnMEtQRlJKVUU4K1NXNTBaV2x5Ynp3dlZFbFFUejROQ2p4' +
      'SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4' +
      'TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFv' +
      'OFZrRk1UMUkrTWp3dlZrRk1UMUkrRFFvOFJFMU1WRmxRUlQ1a2RGTmxiR1ZqZER3' +
      'dlJFMU1WRmxRUlQ0TkNqeEVTVUZIVWtGTldFMU1Qand2UkVsQlIxSkJUVmhOVEQ0' +
      'TkNqeE9WVXhQUGtaQlRGTkZQQzlPVlV4UFBnMEtQRVpKUlV4RVNVNUVSVmcrTFRF' +
      'OEwwWkpSVXhFU1U1RVJWZytEUW84UjFWSlJENDhMMGRWU1VRK0RRbzhVMUJGUTBs' +
      'QlRFTlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5Dand2VkU5aWFrTnZibk4wUGcw' +
      'S1BDOVFRVkpCVFZNK0RRbzhMMVJQWW1wR2RXNWpkR2x2Ymo0TkNqeFVUMkpxUTI5' +
      'dWMzUStEUW84U1VRK01UUThMMGxFUGcwS1BFNVBUVVUrUTA5T1UxUkJUbFE4TDA1' +
      'UFRVVStEUW84VkVWWVZENDhMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3' +
      'K0RRbzhWRWxRVHo1TVpYUnlZWE04TDFSSlVFOCtEUW84U1U1RFQwMVFRVlJKVmtW' +
      'TVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW84VFV0U1gxWkZVbE5KVDA0' +
      'K01TNHlMakF1TnpVOEwwMUxVbDlXUlZKVFNVOU9QZzBLUEZaQlRFOVNQaTg4TDFa' +
      'QlRFOVNQZzBLUEVSTlRGUlpVRVUrWkhSVFpXeGxZM1E4TDBSTlRGUlpVRVUrRFFv' +
      'OFJFbEJSMUpCVFZoTlRENDhMMFJKUVVkU1FVMVlUVXcrRFFvOFRsVk1UejVHUVV4' +
      'VFJUd3ZUbFZNVHo0TkNqeEdTVVZNUkVsT1JFVllQaTB4UEM5R1NVVk1SRWxPUkVW' +
      'WVBnMEtQRWRWU1VRK1BDOUhWVWxFUGcwS1BGTlFSVU5KUVV4RFQwUkZQand2VTFC' +
      'RlEwbEJURU5QUkVVK0RRbzhMMVJQWW1wRGIyNXpkRDROQ2p4VVQySnFSblZ1WTNS' +
      'cGIyNCtEUW84U1VRK01UVThMMGxFUGcwS1BFNVBUVVUrUmxWT1ExUkpUMDQ4TDA1' +
      'UFRVVStEUW84VkVWWVZENWxZbVpUZFdKemRISnBibWM4TDFSRldGUStEUW84VTFG' +
      'TVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFv' +
      'OFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFv' +
      'OFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlPUGcw' +
      'S1BGQkJVa0ZOVXo0TkNqeFVUMkpxUm5WdVkzUnBiMjQrRFFvOFNVUStPVHd2U1VR' +
      'K0RRbzhUazlOUlQ1R1ZVNURWRWxQVGp3dlRrOU5SVDROQ2p4VVJWaFVQbVZpWmtk' +
      'bGRGWmhiSFZsVDJKcVpXTjBTbk52Ymp3dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBV' +
      'OEwxTlJURDROQ2p4VVNWQlBQbFpoY21saGJuUmxQQzlVU1ZCUFBnMEtQRWxPUTA5' +
      'TlVFRlVTVlpGVEQ1VVVsVkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRbzhUVXRTWDFa' +
      'RlVsTkpUMDQrTVM0eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtQRkJCVWtG' +
      'TlV6NE5DanhVVDJKcVZtRnlhV0ZpYkdVK0RRbzhTVVErT1R3dlNVUStEUW84VGs5' +
      'TlJUNVdRVkpKUVVKTVJUd3ZUazlOUlQ0TkNqeFVSVmhVUGtwemIyNG1JM2d5TUR0' +
      'RmJuUnlZV1JoUEM5VVJWaFVQZzBLUEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLUEZS' +
      'SlVFOCtWbUZ5YVdGdWRHVThMMVJKVUU4K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGta' +
      'QlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRbzhUVXRTWDFaRlVsTkpUMDQrTVM0' +
      'eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtQQzlVVDJKcVZtRnlhV0ZpYkdV' +
      'K0RRbzhWRTlpYWtOdmJuTjBQZzBLUEVsRVBqazhMMGxFUGcwS1BFNVBUVVUrUTA5' +
      'T1UxUkJUbFE4TDA1UFRVVStEUW84VkVWWVZENDhMMVJGV0ZRK0RRbzhVMUZNUGta' +
      'QlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1TVpYUnlZWE04TDFSSlVFOCtEUW84U1U1' +
      'RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW84VFV0' +
      'U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZKVFNVOU9QZzBLUEZa' +
      'QlRFOVNQa1JCVFY5V1JVNURTVTFGVGxSUFBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZC' +
      'RlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5' +
      'RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84Umts' +
      'RlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFW' +
      'SlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5' +
      'VVQySnFRMjl1YzNRK0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFibU4wYVc5' +
      'dVBnMEtQRlJQWW1wRGIyNXpkRDROQ2p4SlJENHhOend2U1VRK0RRbzhUazlOUlQ1' +
      'RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQand2VkVWWVZENE5DanhUVVV3' +
      'K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBrbHVkR1ZwY204OEwxUkpVRTgrRFFv' +
      'OFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFv' +
      'OFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlPUGcw' +
      'S1BGWkJURTlTUGpFOEwxWkJURTlTUGcwS1BFUk5URlJaVUVVK1pIUlRaV3hsWTNR' +
      'OEwwUk5URlJaVUVVK0RRbzhSRWxCUjFKQlRWaE5URDQ4TDBSSlFVZFNRVTFZVFV3' +
      'K0RRbzhUbFZNVHo1R1FVeFRSVHd2VGxWTVR6NE5DanhHU1VWTVJFbE9SRVZZUGkw' +
      'eFBDOUdTVVZNUkVsT1JFVllQZzBLUEVkVlNVUStQQzlIVlVsRVBnMEtQRk5RUlVO' +
      'SlFVeERUMFJGUGp3dlUxQkZRMGxCVEVOUFJFVStEUW84TDFSUFltcERiMjV6ZEQ0' +
      'TkNqeFVUMkpxUTI5dWMzUStEUW84U1VRK01UZzhMMGxFUGcwS1BFNVBUVVUrUTA5' +
      'T1UxUkJUbFE4TDA1UFRVVStEUW84VkVWWVZENDhMMVJGV0ZRK0RRbzhVMUZNUGta' +
      'QlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1SmJuUmxhWEp2UEM5VVNWQlBQZzBLUEVs' +
      'T1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUx' +
      'TFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p4' +
      'V1FVeFBVajQwUEM5V1FVeFBVajROQ2p4RVRVeFVXVkJGUG1SMFUyVnNaV04wUEM5' +
      'RVRVeFVXVkJGUGcwS1BFUkpRVWRTUVUxWVRVdytQQzlFU1VGSFVrRk5XRTFNUGcw' +
      'S1BFNVZURTgrUmtGTVUwVThMMDVWVEU4K0RRbzhSa2xGVEVSSlRrUkZXRDR0TVR3' +
      'dlJrbEZURVJKVGtSRldENE5DanhIVlVsRVBqd3ZSMVZKUkQ0TkNqeFRVRVZEU1VG' +
      'TVEwOUVSVDQ4TDFOUVJVTkpRVXhEVDBSRlBnMEtQQzlVVDJKcVEyOXVjM1ErRFFv' +
      'OEwxQkJVa0ZOVXo0TkNqd3ZWRTlpYWtaMWJtTjBhVzl1UGcwS1BDOVFRVkpCVFZN' +
      'K0RRbzhMMVJQWW1wR2RXNWpkR2x2Ymo0TkNqeFVUMkpxUTI5dWMzUStEUW84U1VR' +
      'K016d3ZTVVErRFFvOFRrOU5SVDVEVDA1VFZFRk9WRHd2VGs5TlJUNE5DanhVUlZo' +
      'VVBqd3ZWRVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4' +
      'bGRISmhjend2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBs' +
      'T1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3' +
      'dlRVdFNYMVpGVWxOSlQwNCtEUW84VmtGTVQxSStQQzlXUVV4UFVqNE5DanhFVFV4' +
      'VVdWQkZQbVIwVTJWc1pXTjBQQzlFVFV4VVdWQkZQZzBLUEVSSlFVZFNRVTFZVFV3' +
      'K1BDOUVTVUZIVWtGTldFMU1QZzBLUEU1VlRFOCtWRkpWUlR3dlRsVk1UejROQ2p4' +
      'R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUGcwS1BFZFZTVVErUEM5' +
      'SFZVbEVQZzBLUEZOUVJVTkpRVXhEVDBSRlBqd3ZVMUJGUTBsQlRFTlBSRVUrRFFv' +
      'OEwxUlBZbXBEYjI1emRENE5Dand2VUVGU1FVMVRQZzBLUEM5VVQySnFSblZ1WTNS' +
      'cGIyNCtEUW84TDFKUFQxUStEUW89PC9ESUFHUkFNWE1MPjxWQUxVRT5QYXJhIERh' +
      'dGEoQ29uY2F0ZW5h5+NvKFN1YnNlcXXqbmNpYShKU09OIC0gT2J0ZXIgVmFsb3Io' +
      'QEpzb24gRW50cmFkYSxEQU1fVkVOQ0lNRU5UTyksNywyKSwvLFN1YnNlcXXqbmNp' +
      'YShKU09OIC0gT2J0ZXIgVmFsb3IoQEpzb24gRW50cmFkYSxEQU1fVkVOQ0lNRU5U' +
      'TyksNSwyKSwvLFN1YnNlcXXqbmNpYShKU09OIC0gT2J0ZXIgVmFsb3IoQEpzb24g' +
      'RW50cmFkYSxEQU1fVkVOQ0lNRU5UTyksMSw0KSksKTwvVkFMVUU+DQoJPEVYUFJF' +
      'U1NJT04+PEZVTkNUSU9OIE5BTUU9IlBhcmEgRGF0YSIgUkVBTE5BTUU9InRvRGF0' +
      'ZSI+DQoJCQk8UEFSQU1TPg0KCQkJCTxGVU5DVElPTiBOQU1FPSJDb25jYXRlbmHn' +
      '428iIFJFQUxOQU1FPSJlYmZDb25jYXQiPg0KCQkJCQk8UEFSQU1TPg0KCQkJCQkJ' +
      'PEZVTkNUSU9OIE5BTUU9IlN1YnNlcXXqbmNpYSIgUkVBTE5BTUU9ImViZlN1YnN0' +
      'cmluZyI+DQoJCQkJCQkJPFBBUkFNUz4NCgkJCQkJCQkJPEZVTkNUSU9OIE5BTUU9' +
      'IkpTT04gLSBPYnRlciBWYWxvciIgUkVBTE5BTUU9ImViZkdldFZhbHVlT2JqZWN0' +
      'SnNvbiI+DQoJCQkJCQkJCQk8UEFSQU1TPg0KCQkJCQkJCQkJCTxWQVJJQUJMRSBO' +
      'QU1FPSJKc29uIEVudHJhZGEiLz4NCgkJCQkJCQkJCQk8Q09OU1RBTlQgVFlQRT0i' +
      'TGV0cmFzIiBOVUxMPSJGQUxTRSI+REFNX1ZFTkNJTUVOVE88L0NPTlNUQU5UPg0K' +
      'CQkJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQkJCTwvRlVOQ1RJT04+DQoJCQkJCQkJ' +
      'CTxDT05TVEFOVCBUWVBFPSJJbnRlaXJvIiBOVUxMPSJGQUxTRSI+NzwvQ09OU1RB' +
      'TlQ+DQoJCQkJCQkJCTxDT05TVEFOVCBUWVBFPSJJbnRlaXJvIiBOVUxMPSJGQUxT' +
      'RSI+MjwvQ09OU1RBTlQ+DQoJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQk8L0ZVTkNU' +
      'SU9OPg0KCQkJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJhcyIgTlVMTD0iRkFMU0Ui' +
      'Pi88L0NPTlNUQU5UPg0KCQkJCQkJPEZVTkNUSU9OIE5BTUU9IlN1YnNlcXXqbmNp' +
      'YSIgUkVBTE5BTUU9ImViZlN1YnN0cmluZyI+DQoJCQkJCQkJPFBBUkFNUz4NCgkJ' +
      'CQkJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04gLSBPYnRlciBWYWxvciIgUkVBTE5B' +
      'TUU9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+DQoJCQkJCQkJCQk8UEFSQU1TPg0K' +
      'CQkJCQkJCQkJCTxWQVJJQUJMRSBOQU1FPSJKc29uIEVudHJhZGEiLz4NCgkJCQkJ' +
      'CQkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+REFNX1ZF' +
      'TkNJTUVOVE88L0NPTlNUQU5UPg0KCQkJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQkJ' +
      'CTwvRlVOQ1RJT04+DQoJCQkJCQkJCTxDT05TVEFOVCBUWVBFPSJJbnRlaXJvIiBO' +
      'VUxMPSJGQUxTRSI+NTwvQ09OU1RBTlQ+DQoJCQkJCQkJCTxDT05TVEFOVCBUWVBF' +
      'PSJJbnRlaXJvIiBOVUxMPSJGQUxTRSI+MjwvQ09OU1RBTlQ+DQoJCQkJCQkJPC9Q' +
      'QVJBTVM+DQoJCQkJCQk8L0ZVTkNUSU9OPg0KCQkJCQkJPENPTlNUQU5UIFRZUEU9' +
      'IkxldHJhcyIgTlVMTD0iRkFMU0UiPi88L0NPTlNUQU5UPg0KCQkJCQkJPEZVTkNU' +
      'SU9OIE5BTUU9IlN1YnNlcXXqbmNpYSIgUkVBTE5BTUU9ImViZlN1YnN0cmluZyI+' +
      'DQoJCQkJCQkJPFBBUkFNUz4NCgkJCQkJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04g' +
      'LSBPYnRlciBWYWxvciIgUkVBTE5BTUU9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+' +
      'DQoJCQkJCQkJCQk8UEFSQU1TPg0KCQkJCQkJCQkJCTxWQVJJQUJMRSBOQU1FPSJK' +
      'c29uIEVudHJhZGEiLz4NCgkJCQkJCQkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFz' +
      'IiBOVUxMPSJGQUxTRSI+REFNX1ZFTkNJTUVOVE88L0NPTlNUQU5UPg0KCQkJCQkJ' +
      'CQkJPC9QQVJBTVM+DQoJCQkJCQkJCTwvRlVOQ1RJT04+DQoJCQkJCQkJCTxDT05T' +
      'VEFOVCBUWVBFPSJJbnRlaXJvIiBOVUxMPSJGQUxTRSI+MTwvQ09OU1RBTlQ+DQoJ' +
      'CQkJCQkJCTxDT05TVEFOVCBUWVBFPSJJbnRlaXJvIiBOVUxMPSJGQUxTRSI+NDwv' +
      'Q09OU1RBTlQ+DQoJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQk8L0ZVTkNUSU9OPg0K' +
      'CQkJCQk8L1BBUkFNUz4NCgkJCQk8L0ZVTkNUSU9OPg0KCQkJCTxDT05TVEFOVCBU' +
      'WVBFPSJMZXRyYXMiIE5VTEw9IlRSVUUiPjwvQ09OU1RBTlQ+DQoJCQk8L1BBUkFN' +
      'Uz4NCgkJPC9GVU5DVElPTj48L0VYUFJFU1NJT04+DQo8L1RETUxGaWVsZD4NCjxU' +
      'RE1MRmllbGQ+PE5BTUU+REFNX0NPRF9SRUNFSVRBPC9OQU1FPjxSRUFMTkFNRT5E' +
      'QU1fQ09EX1JFQ0VJVEE8L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1W' +
      'eWMybHZiajBpTVM0d0lpQmxibU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcw' +
      'S1BGSlBUMVErRFFvOFZFOWlha1oxYm1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcw' +
      'S1BFNVBUVVUrUmxWT1ExUkpUMDQ4TDA1UFRVVStEUW84VkVWWVZENWxZbVpIWlhS' +
      'V1lXeDFaVTlpYW1WamRFcHpiMjQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5' +
      'VFVVdytEUW84VkVsUVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZC' +
      'QlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtW' +
      'U1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhVRUZTUVUx' +
      'VFBnMEtQRlJQWW1wV1lYSnBZV0pzWlQ0TkNqeEpSRDR4UEM5SlJENE5DanhPVDAx' +
      'RlBsWkJVa2xCUWt4RlBDOU9UMDFGUGcwS1BGUkZXRlErU25OdmJpWWplREl3TzBW' +
      'dWRISmhaR0U4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVs' +
      'UVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtG' +
      'TVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJ' +
      'dU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhMMVJQWW1wV1lYSnBZV0pzWlQ0' +
      'TkNqeFVUMkpxUTI5dWMzUStEUW84U1VRK01Ud3ZTVVErRFFvOFRrOU5SVDVEVDA1' +
      'VFZFRk9WRHd2VGs5TlJUNE5DanhVUlZoVVBqd3ZWRVZZVkQ0TkNqeFRVVXcrUmtG' +
      'TVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhKVGtO' +
      'UFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFK' +
      'ZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84VmtG' +
      'TVQxSStSRUZOWDBOUFJGOVNSVU5GU1ZSQlBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZC' +
      'RlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5' +
      'RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84Umts' +
      'RlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFW' +
      'SlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5' +
      'VVQySnFRMjl1YzNRK0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFibU4wYVc5' +
      'dVBnMEtQQzlTVDA5VVBnMEs8L0RJQUdSQU1YTUw+PFZBTFVFPkpTT04gLSBPYnRl' +
      'ciBWYWxvcihASnNvbiBFbnRyYWRhLERBTV9DT0RfUkVDRUlUQSk8L1ZBTFVFPg0K' +
      'CTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJKU09OIC0gT2J0ZXIgVmFsb3Ii' +
      'IFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg0KCQkJPFBBUkFNUz4N' +
      'CgkJCQk8VkFSSUFCTEUgTkFNRT0iSnNvbiBFbnRyYWRhIi8+DQoJCQkJPENPTlNU' +
      'QU5UIFRZUEU9IkxldHJhcyIgTlVMTD0iRkFMU0UiPkRBTV9DT0RfUkVDRUlUQTwv' +
      'Q09OU1RBTlQ+DQoJCQk8L1BBUkFNUz4NCgkJPC9GVU5DVElPTj48L0VYUFJFU1NJ' +
      'T04+DQo8L1RETUxGaWVsZD4NCjxURE1MRmllbGQ+PE5BTUU+REFNX1RJUE9fTEFO' +
      'Q0FNRU5UTzwvTkFNRT48UkVBTE5BTUU+REFNX1RJUE9fTEFOQ0FNRU5UTzwvUkVB' +
      'TE5BTUU+PERJQUdSQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWlCbGJt' +
      'TnZaR2x1WnowaVNWTlBMVGc0TlRrdE1TSS9QZzBLUEZKUFQxUStEUW84VkU5aWFr' +
      'WjFibU4wYVc5dVBnMEtQRWxFUGpFOEwwbEVQZzBLUEU1UFRVVStSbFZPUTFSSlQw' +
      'NDhMMDVQVFVVK0RRbzhWRVZZVkQ1bFltWkhaWFJXWVd4MVpVOWlhbVZqZEVwemIy' +
      'NDhMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1V1lY' +
      'SnBZVzUwWlR3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEww' +
      'bE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05U' +
      'd3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBXWVhKcFlX' +
      'SnNaVDROQ2p4SlJENHhQQzlKUkQ0TkNqeE9UMDFGUGxaQlVrbEJRa3hGUEM5T1Qw' +
      'MUZQZzBLUEZSRldGUStTbk52YmlZamVESXdPMFZ1ZEhKaFpHRThMMVJGV0ZRK0RR' +
      'bzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1V1lYSnBZVzUwWlR3dlZF' +
      'bFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNW' +
      'WkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVs' +
      'TkpUMDQrRFFvOEwxUlBZbXBXWVhKcFlXSnNaVDROQ2p4VVQySnFRMjl1YzNRK0RR' +
      'bzhTVVErTVR3dlNVUStEUW84VGs5TlJUNURUMDVUVkVGT1ZEd3ZUazlOUlQ0TkNq' +
      'eFVSVmhVUGp3dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4VVNW' +
      'QlBQa3hsZEhKaGN6d3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUw' +
      'VThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1D' +
      'NDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhWa0ZNVDFJK1JFRk5YMVJKVUU5ZlRF' +
      'Rk9RMEZOUlU1VVR6d3ZWa0ZNVDFJK0RRbzhSRTFNVkZsUVJUNWtkRk5sYkdWamRE' +
      'd3ZSRTFNVkZsUVJUNE5DanhFU1VGSFVrRk5XRTFNUGp3dlJFbEJSMUpCVFZoTlRE' +
      'NE5DanhPVlV4UFBrWkJURk5GUEM5T1ZVeFBQZzBLUEVaSlJVeEVTVTVFUlZnK0xU' +
      'RThMMFpKUlV4RVNVNUVSVmcrRFFvOFIxVkpSRDQ4TDBkVlNVUStEUW84VTFCRlEw' +
      'bEJURU5QUkVVK1BDOVRVRVZEU1VGTVEwOUVSVDROQ2p3dlZFOWlha052Ym5OMFBn' +
      'MEtQQzlRUVZKQlRWTStEUW84TDFSUFltcEdkVzVqZEdsdmJqNE5Dand2VWs5UFZE' +
      'NE5DZz09PC9ESUFHUkFNWE1MPjxWQUxVRT5KU09OIC0gT2J0ZXIgVmFsb3IoQEpz' +
      'b24gRW50cmFkYSxEQU1fVElQT19MQU5DQU1FTlRPKTwvVkFMVUU+DQoJPEVYUFJF' +
      'U1NJT04+PEZVTkNUSU9OIE5BTUU9IkpTT04gLSBPYnRlciBWYWxvciIgUkVBTE5B' +
      'TUU9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+DQoJCQk8UEFSQU1TPg0KCQkJCTxW' +
      'QVJJQUJMRSBOQU1FPSJKc29uIEVudHJhZGEiLz4NCgkJCQk8Q09OU1RBTlQgVFlQ' +
      'RT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+REFNX1RJUE9fTEFOQ0FNRU5UTzwvQ09O' +
      'U1RBTlQ+DQoJCQk8L1BBUkFNUz4NCgkJPC9GVU5DVElPTj48L0VYUFJFU1NJT04+' +
      'DQo8L1RETUxGaWVsZD4NCjxURE1MRmllbGQ+PE5BTUU+REFNX0VEPC9OQU1FPjxS' +
      'RUFMTkFNRT5EQU1fRUQ8L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1W' +
      'eWMybHZiajBpTVM0d0lpQmxibU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcw' +
      'S1BGSlBUMVErRFFvOFZFOWlha1oxYm1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcw' +
      'S1BFNVBUVVUrUmxWT1ExUkpUMDQ4TDA1UFRVVStEUW84VkVWWVZENWxZbVpIWlhS' +
      'V1lXeDFaVTlpYW1WamRFcHpiMjQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5' +
      'VFVVdytEUW84VkVsUVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZC' +
      'QlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtW' +
      'U1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhVRUZTUVUx' +
      'VFBnMEtQRlJQWW1wV1lYSnBZV0pzWlQ0TkNqeEpSRDR4UEM5SlJENE5DanhPVDAx' +
      'RlBsWkJVa2xCUWt4RlBDOU9UMDFGUGcwS1BGUkZXRlErU25OdmJpWWplREl3TzBW' +
      'dWRISmhaR0U4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVs' +
      'UVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtG' +
      'TVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJ' +
      'dU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhMMVJQWW1wV1lYSnBZV0pzWlQ0' +
      'TkNqeFVUMkpxUTI5dWMzUStEUW84U1VRK01Ud3ZTVVErRFFvOFRrOU5SVDVEVDA1' +
      'VFZFRk9WRHd2VGs5TlJUNE5DanhVUlZoVVBqd3ZWRVZZVkQ0TkNqeFRVVXcrUmtG' +
      'TVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhKVGtO' +
      'UFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFK' +
      'ZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84VmtG' +
      'TVQxSStSRUZOWDBWRVBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldO' +
      'MFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0Ux' +
      'TVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0' +
      'dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVW' +
      'RFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNR' +
      'K0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFibU4wYVc5dVBnMEtQQzlTVDA5' +
      'VVBnMEs8L0RJQUdSQU1YTUw+PFZBTFVFPkpTT04gLSBPYnRlciBWYWxvcihASnNv' +
      'biBFbnRyYWRhLERBTV9FRCk8L1ZBTFVFPg0KCTxFWFBSRVNTSU9OPjxGVU5DVElP' +
      'TiBOQU1FPSJKU09OIC0gT2J0ZXIgVmFsb3IiIFJFQUxOQU1FPSJlYmZHZXRWYWx1' +
      'ZU9iamVjdEpzb24iPg0KCQkJPFBBUkFNUz4NCgkJCQk8VkFSSUFCTEUgTkFNRT0i' +
      'SnNvbiBFbnRyYWRhIi8+DQoJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJhcyIgTlVM' +
      'TD0iRkFMU0UiPkRBTV9FRDwvQ09OU1RBTlQ+DQoJCQk8L1BBUkFNUz4NCgkJPC9G' +
      'VU5DVElPTj48L0VYUFJFU1NJT04+DQo8L1RETUxGaWVsZD4NCjxURE1MRmllbGQ+' +
      'PE5BTUU+REFNX05PU1NPX05VTUVSTzwvTkFNRT48UkVBTE5BTUU+REFNX05PU1NP' +
      'X05VTUVSTzwvUkVBTE5BTUU+PERJQUdSQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJq' +
      'MGlNUzR3SWlCbGJtTnZaR2x1WnowaVNWTlBMVGc0TlRrdE1TSS9QZzBLUEZKUFQx' +
      'UStEUW84VkU5aWFrWjFibU4wYVc5dVBnMEtQRWxFUGpFOEwwbEVQZzBLUEU1UFRV' +
      'VStSbFZPUTFSSlQwNDhMMDVQVFVVK0RRbzhWRVZZVkQ1bFltWkhaWFJXWVd4MVpV' +
      'OWlhbVZqZEVwemIyNDhMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RR' +
      'bzhWRWxRVHo1V1lYSnBZVzUwWlR3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JV' +
      'dytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRq' +
      'NHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BG' +
      'UlBZbXBXWVhKcFlXSnNaVDROQ2p4SlJENHhQQzlKUkQ0TkNqeE9UMDFGUGxaQlVr' +
      'bEJRa3hGUEM5T1QwMUZQZzBLUEZSRldGUStTbk52YmlZamVESXdPMFZ1ZEhKaFpH' +
      'RThMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1V1lY' +
      'SnBZVzUwWlR3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEww' +
      'bE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05U' +
      'd3ZUVXRTWDFaRlVsTkpUMDQrRFFvOEwxUlBZbXBXWVhKcFlXSnNaVDROQ2p4VVQy' +
      'SnFRMjl1YzNRK0RRbzhTVVErTVR3dlNVUStEUW84VGs5TlJUNURUMDVUVkVGT1ZE' +
      'd3ZUazlOUlQ0TkNqeFVSVmhVUGp3dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBVOEwx' +
      'TlJURDROQ2p4VVNWQlBQa3hsZEhKaGN6d3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZF' +
      'bFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1Uw' +
      'bFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhWa0ZNVDFJK1JF' +
      'Rk5YMDVQVTFOUFgwNVZUVVZTVHp3dlZrRk1UMUkrRFFvOFJFMU1WRmxRUlQ1a2RG' +
      'TmxiR1ZqZER3dlJFMU1WRmxRUlQ0TkNqeEVTVUZIVWtGTldFMU1Qand2UkVsQlIx' +
      'SkJUVmhOVEQ0TkNqeE9WVXhQUGtaQlRGTkZQQzlPVlV4UFBnMEtQRVpKUlV4RVNV' +
      'NUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW84UjFWSlJENDhMMGRWU1VRK0RR' +
      'bzhVMUJGUTBsQlRFTlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5Dand2VkU5aWFr' +
      'TnZibk4wUGcwS1BDOVFRVkpCVFZNK0RRbzhMMVJQWW1wR2RXNWpkR2x2Ymo0TkNq' +
      'd3ZVazlQVkQ0TkNnPT08L0RJQUdSQU1YTUw+PFZBTFVFPkpTT04gLSBPYnRlciBW' +
      'YWxvcihASnNvbiBFbnRyYWRhLERBTV9OT1NTT19OVU1FUk8pPC9WQUxVRT4NCgk8' +
      'RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT0iSlNPTiAtIE9idGVyIFZhbG9yIiBS' +
      'RUFMTkFNRT0iZWJmR2V0VmFsdWVPYmplY3RKc29uIj4NCgkJCTxQQVJBTVM+DQoJ' +
      'CQkJPFZBUklBQkxFIE5BTUU9Ikpzb24gRW50cmFkYSIvPg0KCQkJCTxDT05TVEFO' +
      'VCBUWVBFPSJMZXRyYXMiIE5VTEw9IkZBTFNFIj5EQU1fTk9TU09fTlVNRVJPPC9D' +
      'T05TVEFOVD4NCgkJCTwvUEFSQU1TPg0KCQk8L0ZVTkNUSU9OPjwvRVhQUkVTU0lP' +
      'Tj4NCjwvVERNTEZpZWxkPg0KPFRETUxGaWVsZD48TkFNRT5EQU1fQ09EX0JBUlJB' +
      'PC9OQU1FPjxSRUFMTkFNRT5EQU1fQ09EX0JBUlJBPC9SRUFMTkFNRT48RElBR1JB' +
      'TVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJaUJsYm1OdlpHbHVaejBpU1ZO' +
      'UExUZzROVGt0TVNJL1BnMEtQRkpQVDFRK0RRbzhWRTlpYWxaaGNtbGhZbXhsUGcw' +
      'S1BFbEVQakU4TDBsRVBnMEtQRTVQVFVVK1ZrRlNTVUZDVEVVOEwwNVBUVVUrRFFv' +
      'OFZFVllWRDVTWlhSdmNtNXZQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRSVHd2VTFG' +
      'TVBnMEtQRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQZzBLUEVsT1EwOU5VRUZVU1Za' +
      'RlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUxTFVsOVdSVkpUU1U5' +
      'T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p3dlZFOWlhbFpoY21s' +
      'aFlteGxQZzBLUEM5U1QwOVVQZzBLPC9ESUFHUkFNWE1MPjxWQUxVRT5AUmV0b3Ju' +
      'bzwvVkFMVUU+DQoJPEVYUFJFU1NJT04+PFZBUklBQkxFIE5BTUU9IlJldG9ybm8i' +
      'Lz48L0VYUFJFU1NJT04+DQo8L1RETUxGaWVsZD4NCjxURE1MRmllbGQ+PE5BTUU+' +
      'QjEgKERBTV9CMSk8L05BTUU+PFJFQUxOQU1FPkRBTV9CMTwvUkVBTE5BTUU+PERJ' +
      'QUdSQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWlCbGJtTnZaR2x1Wnow' +
      'aVNWTlBMVGc0TlRrdE1TSS9QZzBLUEZKUFQxUStEUW84VkU5aWFrWjFibU4wYVc5' +
      'dVBnMEtQRWxFUGpFOEwwbEVQZzBLUEU1UFRVVStSbFZPUTFSSlQwNDhMMDVQVFVV' +
      'K0RRbzhWRVZZVkQ1bFltWkRiMjVqWVhROEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZO' +
      'RlBDOVRVVXcrRFFvOFZFbFFUejVNWlhSeVlYTThMMVJKVUU4K0RRbzhTVTVEVDAx' +
      'UVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRbzhUVXRTWDFa' +
      'RlVsTkpUMDQrTVM0eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtQRkJCVWtG' +
      'TlV6NE5DanhVVDJKcVJuVnVZM1JwYjI0K0RRbzhTVVErTkR3dlNVUStEUW84VGs5' +
      'TlJUNUdWVTVEVkVsUFRqd3ZUazlOUlQ0TkNqeFVSVmhVUG1WaVpsTjFZbk4wY21s' +
      'dVp6d3ZWRVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4' +
      'bGRISmhjend2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBs' +
      'T1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3' +
      'dlRVdFNYMVpGVWxOSlQwNCtEUW84VUVGU1FVMVRQZzBLUEZSUFltcFdZWEpwWVdK' +
      'c1pUNE5DanhKUkQ0MVBDOUpSRDROQ2p4T1QwMUZQbFpCVWtsQlFreEZQQzlPVDAx' +
      'RlBnMEtQRlJGV0ZRK1VtVjBiM0p1Ynp3dlZFVllWRDROQ2p4VFVVdytSa0ZNVTBV' +
      'OEwxTlJURDROQ2p4VVNWQlBQa3hsZEhKaGN6d3ZWRWxRVHo0TkNqeEpUa05QVFZC' +
      'QlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtW' +
      'U1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhMMVJQWW1w' +
      'V1lYSnBZV0pzWlQ0TkNqeFVUMkpxUTI5dWMzUStEUW84U1VRK05qd3ZTVVErRFFv' +
      'OFRrOU5SVDVEVDA1VFZFRk9WRHd2VGs5TlJUNE5DanhVUlZoVVBqd3ZWRVZZVkQ0' +
      'TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGtsdWRHVnBjbTg4TDFS' +
      'SlVFOCtEUW84U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVs' +
      'V1JVdytEUW84VFV0U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZK' +
      'VFNVOU9QZzBLUEZaQlRFOVNQakU4TDFaQlRFOVNQZzBLUEVSTlRGUlpVRVUrWkhS' +
      'VFpXeGxZM1E4TDBSTlRGUlpVRVUrRFFvOFJFbEJSMUpCVFZoTlRENDhMMFJKUVVk' +
      'U1FVMVlUVXcrRFFvOFRsVk1UejVHUVV4VFJUd3ZUbFZNVHo0TkNqeEdTVVZNUkVs' +
      'T1JFVllQaTB4UEM5R1NVVk1SRWxPUkVWWVBnMEtQRWRWU1VRK1BDOUhWVWxFUGcw' +
      'S1BGTlFSVU5KUVV4RFQwUkZQand2VTFCRlEwbEJURU5QUkVVK0RRbzhMMVJQWW1w' +
      'RGIyNXpkRDROQ2p4VVQySnFRMjl1YzNRK0RRbzhTVVErTnp3dlNVUStEUW84VGs5' +
      'TlJUNURUMDVUVkVGT1ZEd3ZUazlOUlQ0TkNqeFVSVmhVUGp3dlZFVllWRDROQ2p4' +
      'VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4VVNWQlBQa2x1ZEdWcGNtODhMMVJKVUU4' +
      'K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3' +
      'K0RRbzhUVXRTWDFaRlVsTkpUMDQrTVM0eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5' +
      'T1BnMEtQRlpCVEU5U1BqRXhQQzlXUVV4UFVqNE5DanhFVFV4VVdWQkZQbVIwVTJW' +
      'c1pXTjBQQzlFVFV4VVdWQkZQZzBLUEVSSlFVZFNRVTFZVFV3K1BDOUVTVUZIVWtG' +
      'TldFMU1QZzBLUEU1VlRFOCtSa0ZNVTBVOEwwNVZURTgrRFFvOFJrbEZURVJKVGtS' +
      'RldENHRNVHd2UmtsRlRFUkpUa1JGV0Q0TkNqeEhWVWxFUGp3dlIxVkpSRDROQ2p4' +
      'VFVFVkRTVUZNUTA5RVJUNDhMMU5RUlVOSlFVeERUMFJGUGcwS1BDOVVUMkpxUTI5' +
      'dWMzUStEUW84TDFCQlVrRk5VejROQ2p3dlZFOWlha1oxYm1OMGFXOXVQZzBLUEZS' +
      'UFltcERiMjV6ZEQ0TkNqeEpSRDR6UEM5SlJENE5DanhPVDAxRlBrTlBUbE5VUVU1' +
      'VVBDOU9UMDFGUGcwS1BGUkZXRlErUEM5VVJWaFVQZzBLUEZOUlRENUdRVXhUUlR3' +
      'dlUxRk1QZzBLUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcwS1BFbE9RMDlOVUVG' +
      'VVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BFMUxVbDlXUlZK' +
      'VFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0TkNqeFdRVXhQVWo0' +
      'dFBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZC' +
      'RlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4' +
      'K1JrRk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVS' +
      'SlRrUkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0' +
      'OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNRK0RRbzhWRTlpYWta' +
      'MWJtTjBhVzl1UGcwS1BFbEVQamc4TDBsRVBnMEtQRTVQVFVVK1JsVk9RMVJKVDA0' +
      'OEwwNVBUVVUrRFFvOFZFVllWRDVsWW1aSFpYUldZV3gxWlU5aWFtVmpkRXB6YjI0' +
      'OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbFFUejVXWVhK' +
      'cFlXNTBaVHd2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1ZGSlZSVHd2U1U1' +
      'RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5' +
      'TlMxSmZWa1ZTVTBsUFRqNE5DanhRUVZKQlRWTStEUW84VkU5aWFrWjFibU4wYVc5' +
      'dVBnMEtQRWxFUGpnOEwwbEVQZzBLUEU1UFRVVStSbFZPUTFSSlQwNDhMMDVQVFVV' +
      'K0RRbzhWRVZZVkQ1bFltWkRjbVZoZEdWUFltcGxZM1JLVTA5T1BDOVVSVmhVUGcw' +
      'S1BGTlJURDVHUVV4VFJUd3ZVMUZNUGcwS1BGUkpVRTgrVm1GeWFXRnVkR1U4TDFS' +
      'SlVFOCtEUW84U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVs' +
      'V1JVdytEUW84VFV0U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZK' +
      'VFNVOU9QZzBLUEZCQlVrRk5VejROQ2p4VVQySnFVblZzWlQ0TkNqeEpSRDQ0UEM5' +
      'SlJENE5DanhPVDAxRlBrTkJURXhTVlV4RlBDOU9UMDFGUGcwS1BGUkZXRlErUkds' +
      'bmFYUnZRbUZ6WlRFd1BDOVVSVmhVUGcwS1BGTlJURDVHUVV4VFJUd3ZVMUZNUGcw' +
      'S1BGUkpVRTgrVEdWMGNtRnpQQzlVU1ZCUFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1' +
      'R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpF' +
      'dU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5DanhRUVZKQlRWTStEUW84VkU5' +
      'aWFrWjFibU4wYVc5dVBnMEtQRWxFUGpnOEwwbEVQZzBLUEU1UFRVVStSbFZPUTFS' +
      'SlQwNDhMMDVQVFVVK0RRbzhWRVZZVkQ1bFltWlRkV0p6ZEhKcGJtYzhMMVJGV0ZR' +
      'K0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1TVpYUnlZWE04TDFS' +
      'SlVFOCtEUW84U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVs' +
      'V1JVdytEUW84VFV0U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZK' +
      'VFNVOU9QZzBLUEZCQlVrRk5VejROQ2p4VVQySnFWbUZ5YVdGaWJHVStEUW84U1VR' +
      'K09Ed3ZTVVErRFFvOFRrOU5SVDVXUVZKSlFVSk1SVHd2VGs5TlJUNE5DanhVUlZo' +
      'VVBsSmxkRzl5Ym04OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFv' +
      'OFZFbFFUejVNWlhSeVlYTThMMVJKVUU4K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGta' +
      'QlRGTkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRbzhUVXRTWDFaRlVsTkpUMDQrTVM0' +
      'eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtQQzlVVDJKcVZtRnlhV0ZpYkdV' +
      'K0RRbzhWRTlpYWtOdmJuTjBQZzBLUEVsRVBqZzhMMGxFUGcwS1BFNVBUVVUrUTA5' +
      'T1UxUkJUbFE4TDA1UFRVVStEUW84VkVWWVZENDhMMVJGV0ZRK0RRbzhVMUZNUGta' +
      'QlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1SmJuUmxhWEp2UEM5VVNWQlBQZzBLUEVs' +
      'T1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUx' +
      'TFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p4' +
      'V1FVeFBVajR4UEM5V1FVeFBVajROQ2p4RVRVeFVXVkJGUG1SMFUyVnNaV04wUEM5' +
      'RVRVeFVXVkJGUGcwS1BFUkpRVWRTUVUxWVRVdytQQzlFU1VGSFVrRk5XRTFNUGcw' +
      'S1BFNVZURTgrUmtGTVUwVThMMDVWVEU4K0RRbzhSa2xGVEVSSlRrUkZXRDR0TVR3' +
      'dlJrbEZURVJKVGtSRldENE5DanhIVlVsRVBqd3ZSMVZKUkQ0TkNqeFRVRVZEU1VG' +
      'TVEwOUVSVDQ4TDFOUVJVTkpRVXhEVDBSRlBnMEtQQzlVVDJKcVEyOXVjM1ErRFFv' +
      'OFZFOWlha052Ym5OMFBnMEtQRWxFUGpnOEwwbEVQZzBLUEU1UFRVVStRMDlPVTFS' +
      'QlRsUThMMDVQVFVVK0RRbzhWRVZZVkQ0OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZO' +
      'RlBDOVRVVXcrRFFvOFZFbFFUejVKYm5SbGFYSnZQQzlVU1ZCUFBnMEtQRWxPUTA5' +
      'TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5' +
      'V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5DanhXUVV4' +
      'UFVqNHhNVHd2VmtGTVQxSStEUW84UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2UkUx' +
      'TVZGbFFSVDROQ2p4RVNVRkhVa0ZOV0UxTVBqd3ZSRWxCUjFKQlRWaE5URDROQ2p4' +
      'T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS1BFWkpSVXhFU1U1RVJWZytMVEU4TDBa' +
      'SlJVeEVTVTVFUlZnK0RRbzhSMVZKUkQ0OEwwZFZTVVErRFFvOFUxQkZRMGxCVEVO' +
      'UFJFVStQQzlUVUVWRFNVRk1RMDlFUlQ0TkNqd3ZWRTlpYWtOdmJuTjBQZzBLUEM5' +
      'UVFWSkJUVk0rRFFvOEwxUlBZbXBHZFc1amRHbHZiajROQ2p3dlVFRlNRVTFUUGcw' +
      'S1BGSlZURVZKUkQ0eE9UVThMMUpWVEVWSlJENE5Dand2VkU5aWFsSjFiR1UrRFFv' +
      'OEwxQkJVa0ZOVXo0TkNqd3ZWRTlpYWtaMWJtTjBhVzl1UGcwS1BGUlBZbXBEYjI1' +
      'emRENE5DanhKUkQ0NFBDOUpSRDROQ2p4T1QwMUZQa05QVGxOVVFVNVVQQzlPVDAx' +
      'RlBnMEtQRlJGV0ZRK1BDOVVSVmhVUGcwS1BGTlJURDVHUVV4VFJUd3ZVMUZNUGcw' +
      'S1BGUkpVRTgrVEdWMGNtRnpQQzlVU1ZCUFBnMEtQRWxPUTA5TlVFRlVTVlpGVEQ1' +
      'R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtQRTFMVWw5V1JWSlRTVTlPUGpF' +
      'dU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5DanhXUVV4UFVqNXlaWE4xYkhR' +
      'OEwxWkJURTlTUGcwS1BFUk5URlJaVUVVK1pIUlRaV3hsWTNROEwwUk5URlJaVUVV' +
      'K0RRbzhSRWxCUjFKQlRWaE5URDQ4TDBSSlFVZFNRVTFZVFV3K0RRbzhUbFZNVHo1' +
      'R1FVeFRSVHd2VGxWTVR6NE5DanhHU1VWTVJFbE9SRVZZUGkweFBDOUdTVVZNUkVs' +
      'T1JFVllQZzBLUEVkVlNVUStQQzlIVlVsRVBnMEtQRk5RUlVOSlFVeERUMFJGUGp3' +
      'dlUxQkZRMGxCVEVOUFJFVStEUW84TDFSUFltcERiMjV6ZEQ0TkNqd3ZVRUZTUVUx' +
      'VFBnMEtQQzlVVDJKcVJuVnVZM1JwYjI0K0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5' +
      'aWFrWjFibU4wYVc5dVBnMEtQQzlTVDA5VVBnMEs8L0RJQUdSQU1YTUw+PFZBTFVF' +
      'PkNvbmNhdGVuYefjbyhTdWJzZXF16m5jaWEoQFJldG9ybm8sMSwxMSksLSxKU09O' +
      'IC0gT2J0ZXIgVmFsb3IoSlNPTiAtIENyaWFyIG9iamV0byhEaWdpdG9CYXNlMTAo' +
      'U3Vic2VxdepuY2lhKEBSZXRvcm5vLDEsMTEpKSxyZXN1bHQpKSk8L1ZBTFVFPg0K' +
      'CTxFWFBSRVNTSU9OPjxGVU5DVElPTiBOQU1FPSJDb25jYXRlbmHn428iIFJFQUxO' +
      'QU1FPSJlYmZDb25jYXQiPg0KCQkJPFBBUkFNUz4NCgkJCQk8RlVOQ1RJT04gTkFN' +
      'RT0iU3Vic2VxdepuY2lhIiBSRUFMTkFNRT0iZWJmU3Vic3RyaW5nIj4NCgkJCQkJ' +
      'PFBBUkFNUz4NCgkJCQkJCTxWQVJJQUJMRSBOQU1FPSJSZXRvcm5vIi8+DQoJCQkJ' +
      'CQk8Q09OU1RBTlQgVFlQRT0iSW50ZWlybyIgTlVMTD0iRkFMU0UiPjE8L0NPTlNU' +
      'QU5UPg0KCQkJCQkJPENPTlNUQU5UIFRZUEU9IkludGVpcm8iIE5VTEw9IkZBTFNF' +
      'Ij4xMTwvQ09OU1RBTlQ+DQoJCQkJCTwvUEFSQU1TPg0KCQkJCTwvRlVOQ1RJT04+' +
      'DQoJCQkJPENPTlNUQU5UIFRZUEU9IkxldHJhcyIgTlVMTD0iRkFMU0UiPi08L0NP' +
      'TlNUQU5UPg0KCQkJCTxGVU5DVElPTiBOQU1FPSJKU09OIC0gT2J0ZXIgVmFsb3Ii' +
      'IFJFQUxOQU1FPSJlYmZHZXRWYWx1ZU9iamVjdEpzb24iPg0KCQkJCQk8UEFSQU1T' +
      'Pg0KCQkJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04gLSBDcmlhciBvYmpldG8iIFJF' +
      'QUxOQU1FPSJlYmZDcmVhdGVPYmplY3RKU09OIj4NCgkJCQkJCQk8UEFSQU1TPg0K' +
      'CQkJCQkJCQk8Q0FMTFJVTEUgSUQ9IjE5NSIgTkFNRT0iRGlnaXRvQmFzZTEwIiBQ' +
      'QVJBTVNDT1VOVD0iMSI+DQoJCQkJCQkJCQk8UEFSQU1TPg0KCQkJCQkJCQkJCTxG' +
      'VU5DVElPTiBOQU1FPSJTdWJzZXF16m5jaWEiIFJFQUxOQU1FPSJlYmZTdWJzdHJp' +
      'bmciPg0KCQkJCQkJCQkJCQk8UEFSQU1TPg0KCQkJCQkJCQkJCQkJPFZBUklBQkxF' +
      'IE5BTUU9IlJldG9ybm8iLz4NCgkJCQkJCQkJCQkJCTxDT05TVEFOVCBUWVBFPSJJ' +
      'bnRlaXJvIiBOVUxMPSJGQUxTRSI+MTwvQ09OU1RBTlQ+DQoJCQkJCQkJCQkJCQk8' +
      'Q09OU1RBTlQgVFlQRT0iSW50ZWlybyIgTlVMTD0iRkFMU0UiPjExPC9DT05TVEFO' +
      'VD4NCgkJCQkJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQkJCQkJPC9GVU5DVElPTj4N' +
      'CgkJCQkJCQkJCTwvUEFSQU1TPg0KCQkJCQkJCQk8L0NBTExSVUxFPg0KCQkJCQkJ' +
      'CTwvUEFSQU1TPg0KCQkJCQkJPC9GVU5DVElPTj4NCgkJCQkJCTxDT05TVEFOVCBU' +
      'WVBFPSJMZXRyYXMiIE5VTEw9IkZBTFNFIj5yZXN1bHQ8L0NPTlNUQU5UPg0KCQkJ' +
      'CQk8L1BBUkFNUz4NCgkJCQk8L0ZVTkNUSU9OPg0KCQkJPC9QQVJBTVM+DQoJCTwv' +
      'RlVOQ1RJT04+PC9FWFBSRVNTSU9OPg0KPC9URE1MRmllbGQ+DQo8VERNTEZpZWxk' +
      'PjxOQU1FPkIyIChEQU1fQjIpPC9OQU1FPjxSRUFMTkFNRT5EQU1fQjI8L1JFQUxO' +
      'QU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lpQmxibU52' +
      'WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcwS1BGSlBUMVErRFFvOFZFOWlha1ox' +
      'Ym1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcwS1BFNVBUVVUrUmxWT1ExUkpUMDQ4' +
      'TDA1UFRVVStEUW84VkVWWVZENWxZbVpEYjI1allYUThMMVJGV0ZRK0RRbzhVMUZN' +
      'UGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1TVpYUnlZWE04TDFSSlVFOCtEUW84' +
      'U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW84' +
      'VFV0U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZKVFNVOU9QZzBL' +
      'UEZCQlVrRk5VejROQ2p4VVQySnFSblZ1WTNScGIyNCtEUW84U1VRK01Ud3ZTVVEr' +
      'RFFvOFRrOU5SVDVHVlU1RFZFbFBUand2VGs5TlJUNE5DanhVUlZoVVBtVmlabE4x' +
      'WW5OMGNtbHVaend2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhV' +
      'U1ZCUFBreGxkSEpoY3p3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZN' +
      'VTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1' +
      'TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBX' +
      'WVhKcFlXSnNaVDROQ2p4SlJENHhQQzlKUkQ0TkNqeE9UMDFGUGxaQlVrbEJRa3hG' +
      'UEM5T1QwMUZQZzBLUEZSRldGUStVbVYwYjNKdWJ6d3ZWRVZZVkQ0TkNqeFRVVXcr' +
      'UmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhK' +
      'VGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhO' +
      'UzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84' +
      'TDFSUFltcFdZWEpwWVdKc1pUNE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStNVHd2' +
      'U1VRK0RRbzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQand2' +
      'VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBrbHVkR1Zw' +
      'Y204OEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05Q' +
      'VFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThMMDFM' +
      'VWw5V1JWSlRTVTlPUGcwS1BGWkJURTlTUGpFeVBDOVdRVXhQVWo0TkNqeEVUVXhV' +
      'V1ZCRlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcr' +
      'UEM5RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84' +
      'UmtsRlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2' +
      'UjFWSlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBL' +
      'UEM5VVQySnFRMjl1YzNRK0RRbzhWRTlpYWtOdmJuTjBQZzBLUEVsRVBqSThMMGxF' +
      'UGcwS1BFNVBUVVUrUTA5T1UxUkJUbFE4TDA1UFRVVStEUW84VkVWWVZENDhMMVJG' +
      'V0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1SmJuUmxhWEp2' +
      'UEM5VVNWQlBQZzBLUEVsT1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFR' +
      'UVZSSlZrVk1QZzBLUEUxTFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpm' +
      'VmtWU1UwbFBUajROQ2p4V1FVeFBVajR4TVR3dlZrRk1UMUkrRFFvOFJFMU1WRmxR' +
      'UlQ1a2RGTmxiR1ZqZER3dlJFMU1WRmxRUlQ0TkNqeEVTVUZIVWtGTldFMU1Qand2' +
      'UkVsQlIxSkJUVmhOVEQ0TkNqeE9WVXhQUGtaQlRGTkZQQzlPVlV4UFBnMEtQRVpK' +
      'UlV4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW84UjFWSlJENDhMMGRW' +
      'U1VRK0RRbzhVMUJGUTBsQlRFTlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5Dand2' +
      'VkU5aWFrTnZibk4wUGcwS1BDOVFRVkpCVFZNK0RRbzhMMVJQWW1wR2RXNWpkR2x2' +
      'Ymo0TkNqeFVUMkpxUTI5dWMzUStEUW84U1VRK01Ud3ZTVVErRFFvOFRrOU5SVDVE' +
      'VDA1VFZFRk9WRHd2VGs5TlJUNE5DanhVUlZoVVBqd3ZWRVZZVkQ0TkNqeFRVVXcr' +
      'UmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhK' +
      'VGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhO' +
      'UzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84' +
      'VmtGTVQxSStMVHd2VmtGTVQxSStEUW84UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2' +
      'UkUxTVZGbFFSVDROQ2p4RVNVRkhVa0ZOV0UxTVBqd3ZSRWxCUjFKQlRWaE5URDRO' +
      'Q2p4T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS1BFWkpSVXhFU1U1RVJWZytMVEU4' +
      'TDBaSlJVeEVTVTVFUlZnK0RRbzhSMVZKUkQ0OEwwZFZTVVErRFFvOFUxQkZRMGxC' +
      'VEVOUFJFVStQQzlUVUVWRFNVRk1RMDlFUlQ0TkNqd3ZWRTlpYWtOdmJuTjBQZzBL' +
      'UEZSUFltcEdkVzVqZEdsdmJqNE5DanhKUkQ0eVBDOUpSRDROQ2p4T1QwMUZQa1pW' +
      'VGtOVVNVOU9QQzlPVDAxRlBnMEtQRlJGV0ZRK1pXSm1SMlYwVm1Gc2RXVlBZbXBs' +
      'WTNSS2MyOXVQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtQRlJK' +
      'VUU4K1ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1QbFJT' +
      'VlVVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1' +
      'TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBH' +
      'ZFc1amRHbHZiajROQ2p4SlJENHlQQzlKUkQ0TkNqeE9UMDFGUGtaVlRrTlVTVTlP' +
      'UEM5T1QwMUZQZzBLUEZSRldGUStaV0ptUTNKbFlYUmxUMkpxWldOMFNsTlBUand2' +
      'VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBsWmhjbWxo' +
      'Ym5SbFBDOVVTVkJQUGcwS1BFbE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVE' +
      'VDAxUVFWUkpWa1ZNUGcwS1BFMUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlO' +
      'UzFKZlZrVlNVMGxQVGo0TkNqeFFRVkpCVFZNK0RRbzhWRTlpYWxKMWJHVStEUW84' +
      'U1VRK01qd3ZTVVErRFFvOFRrOU5SVDVEUVV4TVVsVk1SVHd2VGs5TlJUNE5DanhV' +
      'UlZoVVBrUnBaMmwwYjBKaGMyVXhNRHd2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4' +
      'TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZFbFFUejROQ2p4SlRrTlBUVkJC' +
      'VkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZT' +
      'VTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNRVTFU' +
      'UGcwS1BGUlBZbXBHZFc1amRHbHZiajROQ2p4SlJENHlQQzlKUkQ0TkNqeE9UMDFG' +
      'UGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLUEZSRldGUStaV0ptVTNWaWMzUnlhVzVu' +
      'UEM5VVJWaFVQZzBLUEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLUEZSSlVFOCtUR1Yw' +
      'Y21GelBDOVVTVkJQUGcwS1BFbE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVE' +
      'VDAxUVFWUkpWa1ZNUGcwS1BFMUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlO' +
      'UzFKZlZrVlNVMGxQVGo0TkNqeFFRVkpCVFZNK0RRbzhWRTlpYWxaaGNtbGhZbXhs' +
      'UGcwS1BFbEVQakk4TDBsRVBnMEtQRTVQVFVVK1ZrRlNTVUZDVEVVOEwwNVBUVVUr' +
      'RFFvOFZFVllWRDVTWlhSdmNtNXZQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRSVHd2' +
      'VTFGTVBnMEtQRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQZzBLUEVsT1EwOU5VRUZV' +
      'U1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUxTFVsOVdSVkpU' +
      'U1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p3dlZFOWlhbFpo' +
      'Y21saFlteGxQZzBLUEZSUFltcERiMjV6ZEQ0TkNqeEpSRDR5UEM5SlJENE5DanhP' +
      'VDAxRlBrTlBUbE5VUVU1VVBDOU9UMDFGUGcwS1BGUkZXRlErUEM5VVJWaFVQZzBL' +
      'UEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLUEZSSlVFOCtTVzUwWldseWJ6d3ZWRWxR' +
      'VHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpG' +
      'VEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5K' +
      'VDA0K0RRbzhWa0ZNVDFJK01USThMMVpCVEU5U1BnMEtQRVJOVEZSWlVFVStaSFJU' +
      'Wld4bFkzUThMMFJOVEZSWlVFVStEUW84UkVsQlIxSkJUVmhOVEQ0OEwwUkpRVWRT' +
      'UVUxWVRVdytEUW84VGxWTVR6NUdRVXhUUlR3dlRsVk1UejROQ2p4R1NVVk1SRWxP' +
      'UkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUGcwS1BFZFZTVVErUEM5SFZVbEVQZzBL' +
      'UEZOUVJVTkpRVXhEVDBSRlBqd3ZVMUJGUTBsQlRFTlBSRVUrRFFvOEwxUlBZbXBE' +
      'YjI1emRENE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStNand2U1VRK0RRbzhUazlO' +
      'UlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQand2VkVWWVZENE5DanhU' +
      'VVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBrbHVkR1ZwY204OEwxUkpVRTgr' +
      'RFFvOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcr' +
      'RFFvOFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlP' +
      'UGcwS1BGWkJURTlTUGpFeFBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZz' +
      'WldOMFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZO' +
      'V0UxTVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JG' +
      'V0Q0dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhU' +
      'VUVWRFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1' +
      'YzNRK0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFibU4wYVc5dVBnMEtQQzlR' +
      'UVZKQlRWTStEUW84VWxWTVJVbEVQakU1TlR3dlVsVk1SVWxFUGcwS1BDOVVUMkpx' +
      'VW5Wc1pUNE5Dand2VUVGU1FVMVRQZzBLUEM5VVQySnFSblZ1WTNScGIyNCtEUW84' +
      'VkU5aWFrTnZibk4wUGcwS1BFbEVQakk4TDBsRVBnMEtQRTVQVFVVK1EwOU9VMVJC' +
      'VGxROEwwNVBUVVUrRFFvOFZFVllWRDQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5G' +
      'UEM5VFVVdytEUW84VkVsUVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFvOFNVNURUMDFR' +
      'UVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpG' +
      'VWxOSlQwNCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlPUGcwS1BGWkJURTlT' +
      'UG5KbGMzVnNkRHd2VmtGTVQxSStEUW84UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2' +
      'UkUxTVZGbFFSVDROQ2p4RVNVRkhVa0ZOV0UxTVBqd3ZSRWxCUjFKQlRWaE5URDRO' +
      'Q2p4T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS1BFWkpSVXhFU1U1RVJWZytMVEU4' +
      'TDBaSlJVeEVTVTVFUlZnK0RRbzhSMVZKUkQ0OEwwZFZTVVErRFFvOFUxQkZRMGxC' +
      'VEVOUFJFVStQQzlUVUVWRFNVRk1RMDlFUlQ0TkNqd3ZWRTlpYWtOdmJuTjBQZzBL' +
      'UEM5UVFWSkJUVk0rRFFvOEwxUlBZbXBHZFc1amRHbHZiajROQ2p3dlVFRlNRVTFU' +
      'UGcwS1BDOVVUMkpxUm5WdVkzUnBiMjQrRFFvOEwxSlBUMVErRFFvPTwvRElBR1JB' +
      'TVhNTD48VkFMVUU+Q29uY2F0ZW5h5+NvKFN1YnNlcXXqbmNpYShAUmV0b3Jubywx' +
      'MiwxMSksLSxKU09OIC0gT2J0ZXIgVmFsb3IoSlNPTiAtIENyaWFyIG9iamV0byhE' +
      'aWdpdG9CYXNlMTAoU3Vic2VxdepuY2lhKEBSZXRvcm5vLDEyLDExKSkscmVzdWx0' +
      'KSkpPC9WQUxVRT4NCgk8RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT0iQ29uY2F0' +
      'ZW5h5+NvIiBSRUFMTkFNRT0iZWJmQ29uY2F0Ij4NCgkJCTxQQVJBTVM+DQoJCQkJ' +
      'PEZVTkNUSU9OIE5BTUU9IlN1YnNlcXXqbmNpYSIgUkVBTE5BTUU9ImViZlN1YnN0' +
      'cmluZyI+DQoJCQkJCTxQQVJBTVM+DQoJCQkJCQk8VkFSSUFCTEUgTkFNRT0iUmV0' +
      'b3JubyIvPg0KCQkJCQkJPENPTlNUQU5UIFRZUEU9IkludGVpcm8iIE5VTEw9IkZB' +
      'TFNFIj4xMjwvQ09OU1RBTlQ+DQoJCQkJCQk8Q09OU1RBTlQgVFlQRT0iSW50ZWly' +
      'byIgTlVMTD0iRkFMU0UiPjExPC9DT05TVEFOVD4NCgkJCQkJPC9QQVJBTVM+DQoJ' +
      'CQkJPC9GVU5DVElPTj4NCgkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxM' +
      'PSJGQUxTRSI+LTwvQ09OU1RBTlQ+DQoJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04g' +
      'LSBPYnRlciBWYWxvciIgUkVBTE5BTUU9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+' +
      'DQoJCQkJCTxQQVJBTVM+DQoJCQkJCQk8RlVOQ1RJT04gTkFNRT0iSlNPTiAtIENy' +
      'aWFyIG9iamV0byIgUkVBTE5BTUU9ImViZkNyZWF0ZU9iamVjdEpTT04iPg0KCQkJ' +
      'CQkJCTxQQVJBTVM+DQoJCQkJCQkJCTxDQUxMUlVMRSBJRD0iMTk1IiBOQU1FPSJE' +
      'aWdpdG9CYXNlMTAiIFBBUkFNU0NPVU5UPSIxIj4NCgkJCQkJCQkJCTxQQVJBTVM+' +
      'DQoJCQkJCQkJCQkJPEZVTkNUSU9OIE5BTUU9IlN1YnNlcXXqbmNpYSIgUkVBTE5B' +
      'TUU9ImViZlN1YnN0cmluZyI+DQoJCQkJCQkJCQkJCTxQQVJBTVM+DQoJCQkJCQkJ' +
      'CQkJCQk8VkFSSUFCTEUgTkFNRT0iUmV0b3JubyIvPg0KCQkJCQkJCQkJCQkJPENP' +
      'TlNUQU5UIFRZUEU9IkludGVpcm8iIE5VTEw9IkZBTFNFIj4xMjwvQ09OU1RBTlQ+' +
      'DQoJCQkJCQkJCQkJCQk8Q09OU1RBTlQgVFlQRT0iSW50ZWlybyIgTlVMTD0iRkFM' +
      'U0UiPjExPC9DT05TVEFOVD4NCgkJCQkJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQkJ' +
      'CQkJPC9GVU5DVElPTj4NCgkJCQkJCQkJCTwvUEFSQU1TPg0KCQkJCQkJCQk8L0NB' +
      'TExSVUxFPg0KCQkJCQkJCTwvUEFSQU1TPg0KCQkJCQkJPC9GVU5DVElPTj4NCgkJ' +
      'CQkJCTxDT05TVEFOVCBUWVBFPSJMZXRyYXMiIE5VTEw9IkZBTFNFIj5yZXN1bHQ8' +
      'L0NPTlNUQU5UPg0KCQkJCQk8L1BBUkFNUz4NCgkJCQk8L0ZVTkNUSU9OPg0KCQkJ' +
      'PC9QQVJBTVM+DQoJCTwvRlVOQ1RJT04+PC9FWFBSRVNTSU9OPg0KPC9URE1MRmll' +
      'bGQ+DQo8VERNTEZpZWxkPjxOQU1FPkIzIChEQU1fQjMpPC9OQU1FPjxSRUFMTkFN' +
      'RT5EQU1fQjM8L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZi' +
      'ajBpTVM0d0lpQmxibU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcwS1BGSlBU' +
      'MVErRFFvOFZFOWlha1oxYm1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcwS1BFNVBU' +
      'VVUrUmxWT1ExUkpUMDQ4TDA1UFRVVStEUW84VkVWWVZENWxZbVpEYjI1allYUThM' +
      'MVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhWRWxRVHo1TVpYUnlZ' +
      'WE04TDFSSlVFOCtEUW84U1U1RFQwMVFRVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBU' +
      'VkJCVkVsV1JVdytEUW84VFV0U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxV' +
      'bDlXUlZKVFNVOU9QZzBLUEZCQlVrRk5VejROQ2p4VVQySnFSblZ1WTNScGIyNCtE' +
      'UW84U1VRK01Ud3ZTVVErRFFvOFRrOU5SVDVHVlU1RFZFbFBUand2VGs5TlJUNE5D' +
      'anhVUlZoVVBtVmlabE4xWW5OMGNtbHVaend2VkVWWVZENE5DanhUVVV3K1JrRk1V' +
      'MFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZFbFFUejROQ2p4SlRrTlBU' +
      'VkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZW' +
      'a1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNR' +
      'VTFUUGcwS1BGUlBZbXBXWVhKcFlXSnNaVDROQ2p4SlJENHhQQzlKUkQ0TkNqeE9U' +
      'MDFGUGxaQlVrbEJRa3hGUEM5T1QwMUZQZzBLUEZSRldGUStVbVYwYjNKdWJ6d3ZW' +
      'RVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhj' +
      'end2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5V' +
      'RUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNY' +
      'MVpGVWxOSlQwNCtEUW84TDFSUFltcFdZWEpwWVdKc1pUNE5DanhVVDJKcVEyOXVj' +
      'M1ErRFFvOFNVUStNVHd2U1VRK0RRbzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5S' +
      'VDROQ2p4VVJWaFVQand2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5D' +
      'anhVU1ZCUFBrbHVkR1ZwY204OEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1Q' +
      'a1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpGVWxOSlQwNCtN' +
      'UzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlPUGcwS1BGWkJURTlTUGpJelBDOVdR' +
      'VXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZCRlBnMEtQ' +
      'RVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4K1JrRk1V' +
      'MFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVSSlRrUkZX' +
      'RDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0OEwxTlFS' +
      'VU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNRK0RRbzhWRTlpYWtOdmJuTjBQ' +
      'ZzBLUEVsRVBqSThMMGxFUGcwS1BFNVBUVVUrUTA5T1UxUkJUbFE4TDA1UFRVVStE' +
      'UW84VkVWWVZENDhMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRbzhW' +
      'RWxRVHo1SmJuUmxhWEp2UEM5VVNWQlBQZzBLUEVsT1EwOU5VRUZVU1ZaRlRENUdR' +
      'VXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUxTFVsOVdSVkpUU1U5T1BqRXVN' +
      'aTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p4V1FVeFBVajR4TVR3dlZrRk1U' +
      'MUkrRFFvOFJFMU1WRmxRUlQ1a2RGTmxiR1ZqZER3dlJFMU1WRmxRUlQ0TkNqeEVT' +
      'VUZIVWtGTldFMU1Qand2UkVsQlIxSkJUVmhOVEQ0TkNqeE9WVXhQUGtaQlRGTkZQ' +
      'QzlPVlV4UFBnMEtQRVpKUlV4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytE' +
      'UW84UjFWSlJENDhMMGRWU1VRK0RRbzhVMUJGUTBsQlRFTlBSRVUrUEM5VFVFVkRT' +
      'VUZNUTA5RVJUNE5Dand2VkU5aWFrTnZibk4wUGcwS1BDOVFRVkpCVFZNK0RRbzhM' +
      'MVJQWW1wR2RXNWpkR2x2Ymo0TkNqeFVUMkpxUTI5dWMzUStEUW84U1VRK01Ud3ZT' +
      'VVErRFFvOFRrOU5SVDVEVDA1VFZFRk9WRHd2VGs5TlJUNE5DanhVUlZoVVBqd3ZW' +
      'RVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVTVkJQUGt4bGRISmhj' +
      'end2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU5V' +
      'RUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVNQzQzTlR3dlRVdFNY' +
      'MVpGVWxOSlQwNCtEUW84VmtGTVQxSStMVHd2VmtGTVQxSStEUW84UkUxTVZGbFFS' +
      'VDVrZEZObGJHVmpkRHd2UkUxTVZGbFFSVDROQ2p4RVNVRkhVa0ZOV0UxTVBqd3ZS' +
      'RWxCUjFKQlRWaE5URDROQ2p4T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS1BFWkpS' +
      'VXhFU1U1RVJWZytMVEU4TDBaSlJVeEVTVTVFUlZnK0RRbzhSMVZKUkQ0OEwwZFZT' +
      'VVErRFFvOFUxQkZRMGxCVEVOUFJFVStQQzlUVUVWRFNVRk1RMDlFUlQ0TkNqd3ZW' +
      'RTlpYWtOdmJuTjBQZzBLUEZSUFltcEdkVzVqZEdsdmJqNE5DanhKUkQ0eVBDOUpS' +
      'RDROQ2p4T1QwMUZQa1pWVGtOVVNVOU9QQzlPVDAxRlBnMEtQRlJGV0ZRK1pXSm1S' +
      'MlYwVm1Gc2RXVlBZbXBsWTNSS2MyOXVQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRS' +
      'VHd2VTFGTVBnMEtQRlJKVUU4K1ZtRnlhV0Z1ZEdVOEwxUkpVRTgrRFFvOFNVNURU' +
      'MDFRUVZSSlZrVk1QbFJTVlVVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZW' +
      'a1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNR' +
      'VTFUUGcwS1BGUlBZbXBHZFc1amRHbHZiajROQ2p4SlJENHlQQzlKUkQ0TkNqeE9U' +
      'MDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLUEZSRldGUStaV0ptUTNKbFlYUmxU' +
      'MkpxWldOMFNsTlBUand2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5D' +
      'anhVU1ZCUFBsWmhjbWxoYm5SbFBDOVVTVkJQUGcwS1BFbE9RMDlOVUVGVVNWWkZU' +
      'RDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BFMUxVbDlXUlZKVFNVOU9Q' +
      'akV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0TkNqeFFRVkpCVFZNK0RRbzhW' +
      'RTlpYWxKMWJHVStEUW84U1VRK01qd3ZTVVErRFFvOFRrOU5SVDVEUVV4TVVsVk1S' +
      'VHd2VGs5TlJUNE5DanhVUlZoVVBrUnBaMmwwYjBKaGMyVXhNRHd2VkVWWVZENE5D' +
      'anhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZFbFFU' +
      'ejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZU' +
      'RDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVsTkpU' +
      'MDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBHZFc1amRHbHZiajROQ2p4SlJENHlQ' +
      'QzlKUkQ0TkNqeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLUEZSRldGUSta' +
      'V0ptVTNWaWMzUnlhVzVuUEM5VVJWaFVQZzBLUEZOUlRENUdRVXhUUlR3dlUxRk1Q' +
      'ZzBLUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcwS1BFbE9RMDlOVUVGVVNWWkZU' +
      'RDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BFMUxVbDlXUlZKVFNVOU9Q' +
      'akV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0TkNqeFFRVkpCVFZNK0RRbzhW' +
      'RTlpYWxaaGNtbGhZbXhsUGcwS1BFbEVQakk4TDBsRVBnMEtQRTVQVFVVK1ZrRlNT' +
      'VUZDVEVVOEwwNVBUVVUrRFFvOFZFVllWRDVTWlhSdmNtNXZQQzlVUlZoVVBnMEtQ' +
      'Rk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtQRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQ' +
      'ZzBLUEVsT1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1Q' +
      'ZzBLUEUxTFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBU' +
      'ajROQ2p3dlZFOWlhbFpoY21saFlteGxQZzBLUEZSUFltcERiMjV6ZEQ0TkNqeEpS' +
      'RDR5UEM5SlJENE5DanhPVDAxRlBrTlBUbE5VUVU1VVBDOU9UMDFGUGcwS1BGUkZX' +
      'RlErUEM5VVJWaFVQZzBLUEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLUEZSSlVFOCtT' +
      'VzUwWldseWJ6d3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThM' +
      'MGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDNO' +
      'VHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhWa0ZNVDFJK01qTThMMVpCVEU5U1BnMEtQ' +
      'RVJOVEZSWlVFVStaSFJUWld4bFkzUThMMFJOVEZSWlVFVStEUW84UkVsQlIxSkJU' +
      'VmhOVEQ0OEwwUkpRVWRTUVUxWVRVdytEUW84VGxWTVR6NUdRVXhUUlR3dlRsVk1U' +
      'ejROQ2p4R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUGcwS1BFZFZT' +
      'VVErUEM5SFZVbEVQZzBLUEZOUVJVTkpRVXhEVDBSRlBqd3ZVMUJGUTBsQlRFTlBS' +
      'RVUrRFFvOEwxUlBZbXBEYjI1emRENE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStN' +
      'and2U1VRK0RRbzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQ' +
      'and2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBrbHVk' +
      'R1ZwY204OEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpU' +
      'a05QVFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThM' +
      'MDFMVWw5V1JWSlRTVTlPUGcwS1BGWkJURTlTUGpFeFBDOVdRVXhQVWo0TkNqeEVU' +
      'VXhVV1ZCRlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlU' +
      'VXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtE' +
      'UW84UmtsRlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQ' +
      'and2UjFWSlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQ' +
      'ZzBLUEM5VVQySnFRMjl1YzNRK0RRbzhMMUJCVWtGTlV6NE5Dand2VkU5aWFrWjFi' +
      'bU4wYVc5dVBnMEtQQzlRUVZKQlRWTStEUW84VWxWTVJVbEVQakU1TlR3dlVsVk1S' +
      'VWxFUGcwS1BDOVVUMkpxVW5Wc1pUNE5Dand2VUVGU1FVMVRQZzBLUEM5VVQySnFS' +
      'blZ1WTNScGIyNCtEUW84VkU5aWFrTnZibk4wUGcwS1BFbEVQakk4TDBsRVBnMEtQ' +
      'RTVQVFVVK1EwOU9VMVJCVGxROEwwNVBUVVUrRFFvOFZFVllWRDQ4TDFSRldGUStE' +
      'UW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NU1aWFJ5WVhNOEwxUkpV' +
      'RTgrRFFvOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdS' +
      'VXcrRFFvOFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRT' +
      'VTlPUGcwS1BGWkJURTlTUG5KbGMzVnNkRHd2VmtGTVQxSStEUW84UkUxTVZGbFFS' +
      'VDVrZEZObGJHVmpkRHd2UkUxTVZGbFFSVDROQ2p4RVNVRkhVa0ZOV0UxTVBqd3ZS' +
      'RWxCUjFKQlRWaE5URDROQ2p4T1ZVeFBQa1pCVEZORlBDOU9WVXhQUGcwS1BFWkpS' +
      'VXhFU1U1RVJWZytMVEU4TDBaSlJVeEVTVTVFUlZnK0RRbzhSMVZKUkQ0OEwwZFZT' +
      'VVErRFFvOFUxQkZRMGxCVEVOUFJFVStQQzlUVUVWRFNVRk1RMDlFUlQ0TkNqd3ZW' +
      'RTlpYWtOdmJuTjBQZzBLUEM5UVFWSkJUVk0rRFFvOEwxUlBZbXBHZFc1amRHbHZi' +
      'ajROQ2p3dlVFRlNRVTFUUGcwS1BDOVVUMkpxUm5WdVkzUnBiMjQrRFFvOEwxSlBU' +
      'MVErRFFvPTwvRElBR1JBTVhNTD48VkFMVUU+Q29uY2F0ZW5h5+NvKFN1YnNlcXXq' +
      'bmNpYShAUmV0b3JubywyMywxMSksLSxKU09OIC0gT2J0ZXIgVmFsb3IoSlNPTiAt' +
      'IENyaWFyIG9iamV0byhEaWdpdG9CYXNlMTAoU3Vic2VxdepuY2lhKEBSZXRvcm5v' +
      'LDIzLDExKSkscmVzdWx0KSkpPC9WQUxVRT4NCgk8RVhQUkVTU0lPTj48RlVOQ1RJ' +
      'T04gTkFNRT0iQ29uY2F0ZW5h5+NvIiBSRUFMTkFNRT0iZWJmQ29uY2F0Ij4NCgkJ' +
      'CTxQQVJBTVM+DQoJCQkJPEZVTkNUSU9OIE5BTUU9IlN1YnNlcXXqbmNpYSIgUkVB' +
      'TE5BTUU9ImViZlN1YnN0cmluZyI+DQoJCQkJCTxQQVJBTVM+DQoJCQkJCQk8VkFS' +
      'SUFCTEUgTkFNRT0iUmV0b3JubyIvPg0KCQkJCQkJPENPTlNUQU5UIFRZUEU9Iklu' +
      'dGVpcm8iIE5VTEw9IkZBTFNFIj4yMzwvQ09OU1RBTlQ+DQoJCQkJCQk8Q09OU1RB' +
      'TlQgVFlQRT0iSW50ZWlybyIgTlVMTD0iRkFMU0UiPjExPC9DT05TVEFOVD4NCgkJ' +
      'CQkJPC9QQVJBTVM+DQoJCQkJPC9GVU5DVElPTj4NCgkJCQk8Q09OU1RBTlQgVFlQ' +
      'RT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+LTwvQ09OU1RBTlQ+DQoJCQkJPEZVTkNU' +
      'SU9OIE5BTUU9IkpTT04gLSBPYnRlciBWYWxvciIgUkVBTE5BTUU9ImViZkdldFZh' +
      'bHVlT2JqZWN0SnNvbiI+DQoJCQkJCTxQQVJBTVM+DQoJCQkJCQk8RlVOQ1RJT04g' +
      'TkFNRT0iSlNPTiAtIENyaWFyIG9iamV0byIgUkVBTE5BTUU9ImViZkNyZWF0ZU9i' +
      'amVjdEpTT04iPg0KCQkJCQkJCTxQQVJBTVM+DQoJCQkJCQkJCTxDQUxMUlVMRSBJ' +
      'RD0iMTk1IiBOQU1FPSJEaWdpdG9CYXNlMTAiIFBBUkFNU0NPVU5UPSIxIj4NCgkJ' +
      'CQkJCQkJCTxQQVJBTVM+DQoJCQkJCQkJCQkJPEZVTkNUSU9OIE5BTUU9IlN1YnNl' +
      'cXXqbmNpYSIgUkVBTE5BTUU9ImViZlN1YnN0cmluZyI+DQoJCQkJCQkJCQkJCTxQ' +
      'QVJBTVM+DQoJCQkJCQkJCQkJCQk8VkFSSUFCTEUgTkFNRT0iUmV0b3JubyIvPg0K' +
      'CQkJCQkJCQkJCQkJPENPTlNUQU5UIFRZUEU9IkludGVpcm8iIE5VTEw9IkZBTFNF' +
      'Ij4yMzwvQ09OU1RBTlQ+DQoJCQkJCQkJCQkJCQk8Q09OU1RBTlQgVFlQRT0iSW50' +
      'ZWlybyIgTlVMTD0iRkFMU0UiPjExPC9DT05TVEFOVD4NCgkJCQkJCQkJCQkJPC9Q' +
      'QVJBTVM+DQoJCQkJCQkJCQkJPC9GVU5DVElPTj4NCgkJCQkJCQkJCTwvUEFSQU1T' +
      'Pg0KCQkJCQkJCQk8L0NBTExSVUxFPg0KCQkJCQkJCTwvUEFSQU1TPg0KCQkJCQkJ' +
      'PC9GVU5DVElPTj4NCgkJCQkJCTxDT05TVEFOVCBUWVBFPSJMZXRyYXMiIE5VTEw9' +
      'IkZBTFNFIj5yZXN1bHQ8L0NPTlNUQU5UPg0KCQkJCQk8L1BBUkFNUz4NCgkJCQk8' +
      'L0ZVTkNUSU9OPg0KCQkJPC9QQVJBTVM+DQoJCTwvRlVOQ1RJT04+PC9FWFBSRVNT' +
      'SU9OPg0KPC9URE1MRmllbGQ+DQo8VERNTEZpZWxkPjxOQU1FPkI0IChEQU1fQjQp' +
      'PC9OQU1FPjxSRUFMTkFNRT5EQU1fQjQ8L1JFQUxOQU1FPjxESUFHUkFNWE1MPlBE' +
      'OTRiV3dnZG1WeWMybHZiajBpTVM0d0lpQmxibU52WkdsdVp6MGlTVk5QTFRnNE5U' +
      'a3RNU0kvUGcwS1BGSlBUMVErRFFvOFZFOWlha1oxYm1OMGFXOXVQZzBLUEVsRVBq' +
      'RThMMGxFUGcwS1BFNVBUVVUrUmxWT1ExUkpUMDQ4TDA1UFRVVStEUW84VkVWWVZE' +
      'NWxZbVpEYjI1allYUThMMVJGV0ZRK0RRbzhVMUZNUGtaQlRGTkZQQzlUVVV3K0RR' +
      'bzhWRWxRVHo1TVpYUnlZWE04TDFSSlVFOCtEUW84U1U1RFQwMVFRVlJKVmtWTVBr' +
      'WkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW84VFV0U1gxWkZVbE5KVDA0K01T' +
      'NHlMakF1TnpVOEwwMUxVbDlXUlZKVFNVOU9QZzBLUEZCQlVrRk5VejROQ2p4VVQy' +
      'SnFSblZ1WTNScGIyNCtEUW84U1VRK01Ud3ZTVVErRFFvOFRrOU5SVDVHVlU1RFZF' +
      'bFBUand2VGs5TlJUNE5DanhVUlZoVVBtVmlabE4xWW5OMGNtbHVaend2VkVWWVZE' +
      'NE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBreGxkSEpoY3p3dlZF' +
      'bFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNW' +
      'WkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVs' +
      'TkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBXWVhKcFlXSnNaVDROQ2p4SlJE' +
      'NHhQQzlKUkQ0TkNqeE9UMDFGUGxaQlVrbEJRa3hGUEM5T1QwMUZQZzBLUEZSRldG' +
      'UStVbVYwYjNKdWJ6d3ZWRVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNq' +
      'eFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1Jr' +
      'Rk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExq' +
      'SXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84TDFSUFltcFdZWEpwWVdKc1pU' +
      'NE5DanhVVDJKcVEyOXVjM1ErRFFvOFNVUStNVHd2U1VRK0RRbzhUazlOUlQ1RFQw' +
      'NVRWRUZPVkR3dlRrOU5SVDROQ2p4VVJWaFVQand2VkVWWVZENE5DanhUVVV3K1Jr' +
      'Rk1VMFU4TDFOUlRENE5DanhVU1ZCUFBrbHVkR1ZwY204OEwxUkpVRTgrRFFvOFNV' +
      'NURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvOFRV' +
      'dFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlPUGcwS1BG' +
      'WkJURTlTUGpNMFBDOVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldOMFBD' +
      'OUVUVXhVV1ZCRlBnMEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBn' +
      'MEtQRTVWVEU4K1JrRk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0dE1U' +
      'd3ZSa2xGVEVSSlRrUkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVWRFNV' +
      'Rk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNRK0RR' +
      'bzhWRTlpYWtOdmJuTjBQZzBLUEVsRVBqSThMMGxFUGcwS1BFNVBUVVUrUTA5T1Ux' +
      'UkJUbFE4TDA1UFRVVStEUW84VkVWWVZENDhMMVJGV0ZRK0RRbzhVMUZNUGtaQlRG' +
      'TkZQQzlUVVV3K0RRbzhWRWxRVHo1SmJuUmxhWEp2UEM5VVNWQlBQZzBLUEVsT1Ew' +
      'OU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNURUMDFRUVZSSlZrVk1QZzBLUEUxTFVs' +
      'OVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2p4V1FV' +
      'eFBVajR4TVR3dlZrRk1UMUkrRFFvOFJFMU1WRmxRUlQ1a2RGTmxiR1ZqZER3dlJF' +
      'MU1WRmxRUlQ0TkNqeEVTVUZIVWtGTldFMU1Qand2UkVsQlIxSkJUVmhOVEQ0TkNq' +
      'eE9WVXhQUGtaQlRGTkZQQzlPVlV4UFBnMEtQRVpKUlV4RVNVNUVSVmcrTFRFOEww' +
      'WkpSVXhFU1U1RVJWZytEUW84UjFWSlJENDhMMGRWU1VRK0RRbzhVMUJGUTBsQlRF' +
      'TlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5Dand2VkU5aWFrTnZibk4wUGcwS1BD' +
      'OVFRVkpCVFZNK0RRbzhMMVJQWW1wR2RXNWpkR2x2Ymo0TkNqeFVUMkpxUTI5dWMz' +
      'UStEUW84U1VRK01Ud3ZTVVErRFFvOFRrOU5SVDVEVDA1VFZFRk9WRHd2VGs5TlJU' +
      'NE5DanhVUlZoVVBqd3ZWRVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNq' +
      'eFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1Jr' +
      'Rk1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExq' +
      'SXVNQzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84VmtGTVQxSStMVHd2VmtGTVQx' +
      'SStEUW84UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2UkUxTVZGbFFSVDROQ2p4RVNV' +
      'RkhVa0ZOV0UxTVBqd3ZSRWxCUjFKQlRWaE5URDROQ2p4T1ZVeFBQa1pCVEZORlBD' +
      'OU9WVXhQUGcwS1BFWkpSVXhFU1U1RVJWZytMVEU4TDBaSlJVeEVTVTVFUlZnK0RR' +
      'bzhSMVZKUkQ0OEwwZFZTVVErRFFvOFUxQkZRMGxCVEVOUFJFVStQQzlUVUVWRFNV' +
      'Rk1RMDlFUlQ0TkNqd3ZWRTlpYWtOdmJuTjBQZzBLUEZSUFltcEdkVzVqZEdsdmJq' +
      'NE5DanhKUkQ0eVBDOUpSRDROQ2p4T1QwMUZQa1pWVGtOVVNVOU9QQzlPVDAxRlBn' +
      'MEtQRlJGV0ZRK1pXSm1SMlYwVm1Gc2RXVlBZbXBsWTNSS2MyOXVQQzlVUlZoVVBn' +
      'MEtQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtQRlJKVUU4K1ZtRnlhV0Z1ZEdVOEwx' +
      'UkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1QbFJTVlVVOEwwbE9RMDlOVUVGVVNW' +
      'WkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05Ud3ZUVXRTWDFaRlVs' +
      'TkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBHZFc1amRHbHZiajROQ2p4SlJE' +
      'NHlQQzlKUkQ0TkNqeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLUEZSRldG' +
      'UStaV0ptUTNKbFlYUmxUMkpxWldOMFNsTlBUand2VkVWWVZENE5DanhUVVV3K1Jr' +
      'Rk1VMFU4TDFOUlRENE5DanhVU1ZCUFBsWmhjbWxoYm5SbFBDOVVTVkJQUGcwS1BF' +
      'bE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BF' +
      'MUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0TkNq' +
      'eFFRVkpCVFZNK0RRbzhWRTlpYWxKMWJHVStEUW84U1VRK01qd3ZTVVErRFFvOFRr' +
      'OU5SVDVEUVV4TVVsVk1SVHd2VGs5TlJUNE5DanhVUlZoVVBrUnBaMmwwYjBKaGMy' +
      'VXhNRHd2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE5DanhVU1ZCUFBr' +
      'eGxkSEpoY3p3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdytSa0ZNVTBVOEww' +
      'bE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqNHhMakl1TUM0M05U' +
      'd3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFVFRlNRVTFUUGcwS1BGUlBZbXBHZFc1amRH' +
      'bHZiajROQ2p4SlJENHlQQzlKUkQ0TkNqeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1Qw' +
      'MUZQZzBLUEZSRldGUStaV0ptVTNWaWMzUnlhVzVuUEM5VVJWaFVQZzBLUEZOUlRE' +
      'NUdRVXhUUlR3dlUxRk1QZzBLUEZSSlVFOCtUR1YwY21GelBDOVVTVkJQUGcwS1BF' +
      'bE9RMDlOVUVGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BF' +
      'MUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0TkNq' +
      'eFFRVkpCVFZNK0RRbzhWRTlpYWxaaGNtbGhZbXhsUGcwS1BFbEVQakk4TDBsRVBn' +
      'MEtQRTVQVFVVK1ZrRlNTVUZDVEVVOEwwNVBUVVUrRFFvOFZFVllWRDVTWlhSdmNt' +
      'NXZQQzlVUlZoVVBnMEtQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtQRlJKVUU4K1RH' +
      'VjBjbUZ6UEM5VVNWQlBQZzBLUEVsT1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNV' +
      'NURUMDFRUVZSSlZrVk1QZzBLUEUxTFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBD' +
      'OU5TMUpmVmtWU1UwbFBUajROQ2p3dlZFOWlhbFpoY21saFlteGxQZzBLUEZSUFlt' +
      'cERiMjV6ZEQ0TkNqeEpSRDR5UEM5SlJENE5DanhPVDAxRlBrTlBUbE5VUVU1VVBD' +
      'OU9UMDFGUGcwS1BGUkZXRlErUEM5VVJWaFVQZzBLUEZOUlRENUdRVXhUUlR3dlUx' +
      'Rk1QZzBLUEZSSlVFOCtTVzUwWldseWJ6d3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZF' +
      'bFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1Uw' +
      'bFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhWa0ZNVDFJK016' +
      'UThMMVpCVEU5U1BnMEtQRVJOVEZSWlVFVStaSFJUWld4bFkzUThMMFJOVEZSWlVF' +
      'VStEUW84UkVsQlIxSkJUVmhOVEQ0OEwwUkpRVWRTUVUxWVRVdytEUW84VGxWTVR6' +
      'NUdRVXhUUlR3dlRsVk1UejROQ2p4R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJF' +
      'bE9SRVZZUGcwS1BFZFZTVVErUEM5SFZVbEVQZzBLUEZOUVJVTkpRVXhEVDBSRlBq' +
      'd3ZVMUJGUTBsQlRFTlBSRVUrRFFvOEwxUlBZbXBEYjI1emRENE5DanhVVDJKcVEy' +
      'OXVjM1ErRFFvOFNVUStNand2U1VRK0RRbzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRr' +
      'OU5SVDROQ2p4VVJWaFVQand2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRE' +
      'NE5DanhVU1ZCUFBrbHVkR1ZwY204OEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZr' +
      'Vk1Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpGVWxOSlQw' +
      'NCtNUzR5TGpBdU56VThMMDFMVWw5V1JWSlRTVTlPUGcwS1BGWkJURTlTUGpFeFBD' +
      'OVdRVXhQVWo0TkNqeEVUVXhVV1ZCRlBtUjBVMlZzWldOMFBDOUVUVXhVV1ZCRlBn' +
      'MEtQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEtQRTVWVEU4K1Jr' +
      'Rk1VMFU4TDA1VlRFOCtEUW84UmtsRlRFUkpUa1JGV0Q0dE1Ud3ZSa2xGVEVSSlRr' +
      'UkZXRDROQ2p4SFZVbEVQand2UjFWSlJENE5DanhUVUVWRFNVRk1RMDlFUlQ0OEwx' +
      'TlFSVU5KUVV4RFQwUkZQZzBLUEM5VVQySnFRMjl1YzNRK0RRbzhMMUJCVWtGTlV6' +
      'NE5Dand2VkU5aWFrWjFibU4wYVc5dVBnMEtQQzlRUVZKQlRWTStEUW84VWxWTVJV' +
      'bEVQakU1TlR3dlVsVk1SVWxFUGcwS1BDOVVUMkpxVW5Wc1pUNE5Dand2VUVGU1FV' +
      'MVRQZzBLUEM5VVQySnFSblZ1WTNScGIyNCtEUW84VkU5aWFrTnZibk4wUGcwS1BF' +
      'bEVQakk4TDBsRVBnMEtQRTVQVFVVK1EwOU9VMVJCVGxROEwwNVBUVVUrRFFvOFZF' +
      'VllWRDQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6' +
      'NU1aWFJ5WVhNOEwxUkpVRTgrRFFvOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBD' +
      'OUpUa05QVFZCQlZFbFdSVXcrRFFvOFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU56' +
      'VThMMDFMVWw5V1JWSlRTVTlPUGcwS1BGWkJURTlTUG5KbGMzVnNkRHd2VmtGTVQx' +
      'SStEUW84UkUxTVZGbFFSVDVrZEZObGJHVmpkRHd2UkUxTVZGbFFSVDROQ2p4RVNV' +
      'RkhVa0ZOV0UxTVBqd3ZSRWxCUjFKQlRWaE5URDROQ2p4T1ZVeFBQa1pCVEZORlBD' +
      'OU9WVXhQUGcwS1BFWkpSVXhFU1U1RVJWZytMVEU4TDBaSlJVeEVTVTVFUlZnK0RR' +
      'bzhSMVZKUkQ0OEwwZFZTVVErRFFvOFUxQkZRMGxCVEVOUFJFVStQQzlUVUVWRFNV' +
      'Rk1RMDlFUlQ0TkNqd3ZWRTlpYWtOdmJuTjBQZzBLUEM5UVFWSkJUVk0rRFFvOEwx' +
      'UlBZbXBHZFc1amRHbHZiajROQ2p3dlVFRlNRVTFUUGcwS1BDOVVUMkpxUm5WdVkz' +
      'UnBiMjQrRFFvOEwxSlBUMVErRFFvPTwvRElBR1JBTVhNTD48VkFMVUU+Q29uY2F0' +
      'ZW5h5+NvKFN1YnNlcXXqbmNpYShAUmV0b3JubywzNCwxMSksLSxKU09OIC0gT2J0' +
      'ZXIgVmFsb3IoSlNPTiAtIENyaWFyIG9iamV0byhEaWdpdG9CYXNlMTAoU3Vic2Vx' +
      'depuY2lhKEBSZXRvcm5vLDM0LDExKSkscmVzdWx0KSkpPC9WQUxVRT4NCgk8RVhQ' +
      'UkVTU0lPTj48RlVOQ1RJT04gTkFNRT0iQ29uY2F0ZW5h5+NvIiBSRUFMTkFNRT0i' +
      'ZWJmQ29uY2F0Ij4NCgkJCTxQQVJBTVM+DQoJCQkJPEZVTkNUSU9OIE5BTUU9IlN1' +
      'YnNlcXXqbmNpYSIgUkVBTE5BTUU9ImViZlN1YnN0cmluZyI+DQoJCQkJCTxQQVJB' +
      'TVM+DQoJCQkJCQk8VkFSSUFCTEUgTkFNRT0iUmV0b3JubyIvPg0KCQkJCQkJPENP' +
      'TlNUQU5UIFRZUEU9IkludGVpcm8iIE5VTEw9IkZBTFNFIj4zNDwvQ09OU1RBTlQ+' +
      'DQoJCQkJCQk8Q09OU1RBTlQgVFlQRT0iSW50ZWlybyIgTlVMTD0iRkFMU0UiPjEx' +
      'PC9DT05TVEFOVD4NCgkJCQkJPC9QQVJBTVM+DQoJCQkJPC9GVU5DVElPTj4NCgkJ' +
      'CQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+LTwvQ09OU1RB' +
      'TlQ+DQoJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04gLSBPYnRlciBWYWxvciIgUkVB' +
      'TE5BTUU9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+DQoJCQkJCTxQQVJBTVM+DQoJ' +
      'CQkJCQk8RlVOQ1RJT04gTkFNRT0iSlNPTiAtIENyaWFyIG9iamV0byIgUkVBTE5B' +
      'TUU9ImViZkNyZWF0ZU9iamVjdEpTT04iPg0KCQkJCQkJCTxQQVJBTVM+DQoJCQkJ' +
      'CQkJCTxDQUxMUlVMRSBJRD0iMTk1IiBOQU1FPSJEaWdpdG9CYXNlMTAiIFBBUkFN' +
      'U0NPVU5UPSIxIj4NCgkJCQkJCQkJCTxQQVJBTVM+DQoJCQkJCQkJCQkJPEZVTkNU' +
      'SU9OIE5BTUU9IlN1YnNlcXXqbmNpYSIgUkVBTE5BTUU9ImViZlN1YnN0cmluZyI+' +
      'DQoJCQkJCQkJCQkJCTxQQVJBTVM+DQoJCQkJCQkJCQkJCQk8VkFSSUFCTEUgTkFN' +
      'RT0iUmV0b3JubyIvPg0KCQkJCQkJCQkJCQkJPENPTlNUQU5UIFRZUEU9IkludGVp' +
      'cm8iIE5VTEw9IkZBTFNFIj4zNDwvQ09OU1RBTlQ+DQoJCQkJCQkJCQkJCQk8Q09O' +
      'U1RBTlQgVFlQRT0iSW50ZWlybyIgTlVMTD0iRkFMU0UiPjExPC9DT05TVEFOVD4N' +
      'CgkJCQkJCQkJCQkJPC9QQVJBTVM+DQoJCQkJCQkJCQkJPC9GVU5DVElPTj4NCgkJ' +
      'CQkJCQkJCTwvUEFSQU1TPg0KCQkJCQkJCQk8L0NBTExSVUxFPg0KCQkJCQkJCTwv' +
      'UEFSQU1TPg0KCQkJCQkJPC9GVU5DVElPTj4NCgkJCQkJCTxDT05TVEFOVCBUWVBF' +
      'PSJMZXRyYXMiIE5VTEw9IkZBTFNFIj5yZXN1bHQ8L0NPTlNUQU5UPg0KCQkJCQk8' +
      'L1BBUkFNUz4NCgkJCQk8L0ZVTkNUSU9OPg0KCQkJPC9QQVJBTVM+DQoJCTwvRlVO' +
      'Q1RJT04+PC9FWFBSRVNTSU9OPg0KPC9URE1MRmllbGQ+DQo8VERNTEZpZWxkPjxO' +
      'QU1FPkPzZGlnbyAoVFRMX0NPRCk8L05BTUU+PFJFQUxOQU1FPlRUTF9DT0Q8L1JF' +
      'QUxOQU1FPjxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lpQmxi' +
      'bU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNU0kvUGcwS1BGSlBUMVErRFFvOFZFOWlh' +
      'a1oxYm1OMGFXOXVQZzBLUEVsRVBqRThMMGxFUGcwS1BFNVBUVVUrUmxWT1ExUkpU' +
      'MDQ4TDA1UFRVVStEUW84VkVWWVZENWxZbVpIWlhSV1lXeDFaVTlpYW1WamRFcHpi' +
      'MjQ4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NVdZ' +
      'WEpwWVc1MFpUd3ZWRWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThM' +
      'MGxPUTA5TlVFRlVTVlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDNO' +
      'VHd2VFV0U1gxWkZVbE5KVDA0K0RRbzhVRUZTUVUxVFBnMEtQRlJQWW1wV1lYSnBZ' +
      'V0pzWlQ0TkNqeEpSRDR5UEM5SlJENE5DanhPVDAxRlBsWkJVa2xCUWt4RlBDOU9U' +
      'MDFGUGcwS1BGUkZXRlErU25OdmJpWWplREl3TzBWdWRISmhaR0U4TDFSRldGUStE' +
      'UW84VTFGTVBrWkJURk5GUEM5VFVVdytEUW84VkVsUVR6NVdZWEpwWVc1MFpUd3ZW' +
      'RWxRVHo0TkNqeEpUa05QVFZCQlZFbFdSVXcrUmtGTVUwVThMMGxPUTA5TlVFRlVT' +
      'VlpGVEQ0TkNqeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDNOVHd2VFV0U1gxWkZV' +
      'bE5KVDA0K0RRbzhMMVJQWW1wV1lYSnBZV0pzWlQ0TkNqeFVUMkpxUTI5dWMzUStE' +
      'UW84U1VRK016d3ZTVVErRFFvOFRrOU5SVDVEVDA1VFZFRk9WRHd2VGs5TlJUNE5D' +
      'anhVUlZoVVBqd3ZWRVZZVkQ0TkNqeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNqeFVT' +
      'VkJQUGt4bGRISmhjend2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1V' +
      'MFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0eExqSXVN' +
      'QzQzTlR3dlRVdFNYMVpGVWxOSlQwNCtEUW84VmtGTVQxSStWRlJNWDBOUFJEd3ZW' +
      'a0ZNVDFJK0RRbzhSRTFNVkZsUVJUNWtkRk5sYkdWamREd3ZSRTFNVkZsUVJUNE5D' +
      'anhFU1VGSFVrRk5XRTFNUGp3dlJFbEJSMUpCVFZoTlRENE5DanhPVlV4UFBrWkJU' +
      'Rk5GUEM5T1ZVeFBQZzBLUEVaSlJVeEVTVTVFUlZnK0xURThMMFpKUlV4RVNVNUVS' +
      'VmcrRFFvOFIxVkpSRDQ4TDBkVlNVUStEUW84VTFCRlEwbEJURU5QUkVVK1BDOVRV' +
      'RVZEU1VGTVEwOUVSVDROQ2p3dlZFOWlha052Ym5OMFBnMEtQQzlRUVZKQlRWTStE' +
      'UW84TDFSUFltcEdkVzVqZEdsdmJqNE5Dand2VWs5UFZENE5DZz09PC9ESUFHUkFN' +
      'WE1MPjxWQUxVRT5KU09OIC0gT2J0ZXIgVmFsb3IoQEpzb24gRW50cmFkYSxUVExf' +
      'Q09EKTwvVkFMVUU+DQoJPEVYUFJFU1NJT04+PEZVTkNUSU9OIE5BTUU9IkpTT04g' +
      'LSBPYnRlciBWYWxvciIgUkVBTE5BTUU9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+' +
      'DQoJCQk8UEFSQU1TPg0KCQkJCTxWQVJJQUJMRSBOQU1FPSJKc29uIEVudHJhZGEi' +
      'Lz4NCgkJCQk8Q09OU1RBTlQgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+VFRM' +
      'X0NPRDwvQ09OU1RBTlQ+DQoJCQk8L1BBUkFNUz4NCgkJPC9GVU5DVElPTj48L0VY' +
      'UFJFU1NJT04+DQo8L1RETUxGaWVsZD4NCjxURE1MRmllbGQ+PE5BTUU+REFNX1NJ' +
      'VFVBQ0FPPC9OQU1FPjxSRUFMTkFNRT5EQU1fU0lUVUFDQU88L1JFQUxOQU1FPjxE' +
      'SUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lpQmxibU52WkdsdVp6' +
      'MGlTVk5QTFRnNE5Ua3RNU0kvUGcwS1BGSlBUMVErRFFvOFZFOWlha052Ym5OMFBn' +
      'MEtQRWxFUGpBOEwwbEVQZzBLUEU1UFRVVStRMDlPVTFSQlRsUThMMDVQVFVVK0RR' +
      'bzhWRVZZVkQ0OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZF' +
      'bFFUejVNWlhSeVlYTThMMVJKVUU4K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRG' +
      'TkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRbzhUVXRTWDFaRlVsTkpUMDQrTVM0eUxq' +
      'QXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtQRlpCVEU5U1BrRThMMVpCVEU5U1Bn' +
      'MEtQRVJOVEZSWlVFVStaSFJUWld4bFkzUThMMFJOVEZSWlVFVStEUW84UkVsQlIx' +
      'SkJUVmhOVEQ0OEwwUkpRVWRTUVUxWVRVdytEUW84VGxWTVR6NUdRVXhUUlR3dlRs' +
      'Vk1UejROQ2p4R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUGcwS1BF' +
      'ZFZTVVErUEM5SFZVbEVQZzBLUEZOUVJVTkpRVXhEVDBSRlBqd3ZVMUJGUTBsQlRF' +
      'TlBSRVUrRFFvOEwxUlBZbXBEYjI1emRENE5Dand2VWs5UFZENE5DZz09PC9ESUFH' +
      'UkFNWE1MPjxWQUxVRT5BPC9WQUxVRT4NCgk8RVhQUkVTU0lPTj48Q09OU1RBTlQg' +
      'VFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+QTwvQ09OU1RBTlQ+PC9FWFBSRVNT' +
      'SU9OPg0KPC9URE1MRmllbGQ+DQo8L1JPT1Q+DQo=</DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.1' +
      '7</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine10: TFlowLine
    Left = 645
    Top = 393
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
    InputNames = 'FlowExpression17'
    OutputNames = 'FlowExpression21'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine12: TFlowLine
    Left = 645
    Top = 318
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
    InputNames = 'FlowExpression21'
    OutputNames = 'FlowExpression25'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine11: TFlowLine
    Left = 720
    Top = 168
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector1: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine13'
  end
  object FlowLine9: TFlowLine
    Left = 645
    Top = 317
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
    InputNames = 'FlowExpression25'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine13: TFlowLine
    Left = 835
    Top = 317
    Width = 40
    Height = 266
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
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psDash
    Decision = False
  end
end

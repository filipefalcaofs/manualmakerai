object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 646
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
    Variables = 'RetonoJSON,Variante,,'
    WorkFormCod = -1
    WorkFormGUID = '{773D90A1-6466-400D-A8B7-0AE860FB164B}'
  end
  object FlowDecision1: TFlowDecision
    Left = 590
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine6;FlowLine34'
    Description = 'Tipo de Servi'#231'o = '#39'S'#39'?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.29</MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >S</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression7: TFlowExpression
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
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine12'
    Description = 'Muda descri'#231#227'o para Cedente'
    Text = 'Mudar Descri'#231#227'o(Cedente (lkpRequerente),Cedente)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Descri&#231;&#227;o" REALNAME="ebfCha' +
      'ngeDescription">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FA' +
      'LSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequere' +
      'nte</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Cedente</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfChangeDescripti' +
      'on</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Cedente' +
      '&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SP' +
      'ECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>' +
      #13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Cedente</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowExpression20: TFlowExpression
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
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine3'
    Description = 'Mudar posi'#231#227'o de Obs, Doc, placa e alvara destino'
    Text = 
      'Concatena'#231#227'o(Mudar Posi'#231#227'o do Componente(Alvar'#225' (lkpAlvara),,167' +
      '),Mudar Posi'#231#227'o do Componente(Requerente (lkpRequerente),,167),M' +
      'udar Posi'#231#227'o do Componente(Observa'#231#227'o (edtObs),,300),Mudar Posi'#231 +
      #227'o do Componente( (dlDocumentos),,400),Mudar Posi'#231#227'o do Componen' +
      'te(Placa do Ve'#237'culo (lkpVeiculoBaixado),,234),Mudar Posi'#231#227'o do C' +
      'omponente(Cession'#225'rio (lkpCessionario),,234))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x' +
      '20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro' +
      '" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALS' +
      'E"  >167</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mud' +
      'ar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REALNAME="ebf' +
      'FormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="F' +
      'ALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequer' +
      'ente</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >167</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;' +
      'o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARA' +
      'MS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTANT TYPE' +
      '="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" N' +
      'ULL="FALSE"  >300</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'dlDocumentos</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  >' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >400</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#23' +
      '1;&#227;o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPosition"' +
      '>'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{' +
      '773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoBaixado</CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTA' +
      'NT TYPE="Inteiro" NULL="FALSE"  >234</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x' +
      '20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}">lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="In' +
      'teiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL=' +
      '"FALSE"  >234</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPos' +
      'ition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alva' +
      'r&#225;&#x20;(lkpAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>lkpAlvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13 +
      #10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>167</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compone' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-64' +
      '66-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente</S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFor' +
      'mSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VAL' +
      'OR>Observa&#231;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}</GUID>'#13#10'<SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRU' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>300</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10 +
      '<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(dlDocumentos)</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dlDocumentos</SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>400</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '<TObjFunction>'#13#10'<ID>26</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFor' +
      'mSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjConst>'#13#10'<ID>26</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VA' +
      'LOR>Placa&#x20;do&#x20;Ve&#237;culo&#x20;(lkpVeiculoBaixado)</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoBaixa' +
      'do</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>26</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>234<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'<TObjFunction>'#13#10'<ID>30</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>30</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR>Cession&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCons' +
      't>'#13#10'<ID>30</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>234</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 20
    Top = 8
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
    InputNames = 'FlowLine53'
    OutputNames = 'FlowLine4'
    Description = 'Gest'#227'o de Requerimentos - Preencher Taxa'
    Id = 725
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'idServico'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
          'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<P' +
          'ARAMS>'#13#10'<TObjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
          '>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
          'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
          'ION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</' +
          'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<IN' +
          'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
          'ION>'#13#10'<VALOR>idServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
          'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
          'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
          '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'idServico'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebf' +
          'GetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<' +
          'CONSTANT TYPE="Letras" NULL="FALSE"  >idServico</CONSTANT>'#13#10'</PA' +
          'RAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'idServico'
        ParamType = ptInput
        Value = 'JSON - Obter Valor(@RetonoJSON,idServico)'
      end>
    ObjectName = 'Gest'#227'o de Requerimentos - Preencher Taxa'
    RealName = 'CALLRULE'
  end
  object FlowDecision5: TFlowDecision
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine16;FlowLine8'
    Description = 'Tipo de Servi'#231'o = '#39'C'#39'?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>8</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.29</MKR_VERSION>'#13#10'<VALOR>C</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >C</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowSubRoutine2: TFlowSubRoutine
    Left = 400
    Top = 8
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine2'
    Description = 'GRS - Consultar Tipo Servi'#231'o'
    Id = 1179
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
    Return = 'RetonoJSON'
    ObjectName = 'GRS - Consultar Tipo Servi'#231'o'
    RealName = 'CALLRULE'
  end
  object FlowDecision4: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine7;FlowLine26'
    Description = 'Tipo de Servi'#231'o = '#39'R'#39'?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>8</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>R</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >R</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression11: TFlowExpression
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
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine22'
    Description = 'Ocultar e limpar componente Placa Ve'#237'culo e Alvar'#225' do ve'#237'culo'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Ve'#237'culo (lkpVeiculoTodo1),false)' +
      ',Alterar Valor do Componente(Cadastro de Requerimento de Servi'#231'o' +
      's,Ve'#237'culo (lkpVeiculoTodo1),),Mostrar Componente(Data da Baixa (' +
      'dtDataBaixa),false),Alterar Valor do Componente(Cadastro de Requ' +
      'erimento de Servi'#231'os,Data da Baixa (dtDataBaixa),),Mostrar Compo' +
      'nente(Data de Aquisi'#231#227'o (dtDataAquisicao),false),Alterar Valor d' +
      'o Componente(Cadastro de Requerimento de Servi'#231'os,Data de Aquisi' +
      #231#227'o (dtDataAquisicao),),Mostrar Componente(Forma de Aquisi'#231#227'o (l' +
      'kpFormaAquisicao),false),Alterar Valor do Componente(Cadastro de' +
      ' Requerimento de Servi'#231'os,Forma de Aquisi'#231#227'o (lkpFormaAquisicao)' +
      ',))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoT' +
      'odo1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fal' +
      'se</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#' +
      'x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeCompon' +
      'entValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componen' +
      'te" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALS' +
      'E"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostra' +
      'r&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTANT>'#13#10'<CONSTANT TYPE="L&' +
      '#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" ' +
      'REALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTANT>'#13#10'<CONSTANT' +
      ' TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSet' +
      'Visible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  G' +
      'UID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataAquisicao</' +
      'CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20;Va' +
      'lor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponentVal' +
      'ue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE"  G' +
      'UID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente" NU' +
      'LL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDa' +
      'taAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ><' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20' +
      ';Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT ' +
      'TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7' +
      '-0AE860FB164B}">lkpFormaAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="L&' +
      '#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" ' +
      'REALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}">lkpFormaAquisicao</CONSTANT>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#2' +
      '37;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</G' +
      'UID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjFunction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x20' +
      ';de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<S' +
      'PECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<T' +
      'EXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VA' +
      'LOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10 +
      '<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME' +
      '>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&' +
      '#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860' +
      'FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Comp' +
      'onente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtD' +
      'ataBaixa)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dt' +
      'DataBaixa</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>' +
      #13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&' +
      '#231;&#227;o&#x20;(dtDataAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164' +
      'B}</GUID>'#13#10'<SPECIALCODE>dtDataAquisicao</SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>' +
      'false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13 +
      #10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#22' +
      '5;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento' +
      '&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(dtData' +
      'Aquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>d' +
      'tDataAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3' +
      '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<' +
      'ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Forma&#x20;de&#x20;A' +
      'quisi&#231;&#227;o&#x20;(lkpFormaAquisicao)</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE' +
      '860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquisicao</SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTI' +
      'ON</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Re' +
      'querimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>Forma&#x20;de&#x20;Aquisi&#231;&#227;o&#' +
      'x20;(lkpFormaAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>lkpFormaAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine6: TFlowLine
    Left = 645
    Top = 93
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression11'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression3: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine37'
    OutputNames = 'FlowLine32'
    Description = 'Mostrar Placa de Ve'#237'culo Baixado/Em Cadastro'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Ve'#237'culo (lkpVeiculoTodo1),true),' +
      'Definir Obrigatoriedade de Componente(Ve'#237'culo (lkpVeiculoTodo1),' +
      'true),Mudar Descri'#231#227'o(Ve'#237'culo (lkpVeiculoTodo1),Novo Ve'#237'culo),CS' +
      'S - Definir Propriedade(HTML - Obter Elemento pelo ID(lkpVeiculo' +
      'Todo1),width,CSS - Obter Propriedade(HTML - Obter Elemento pelo ' +
      'ID(lkpAlvaraDestino),width)))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoT' +
      'odo1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tru' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x' +
      '20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSet' +
      'Required">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  ' +
      'GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoTodo1<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Desc' +
      'ri&#231;&#227;o" REALNAME="ebfChangeDescription">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >Novo&#x20;Ve&#237;culo</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x2' +
      '0;Propriedade" REALNAME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUN' +
      'CTION NAME="HTML&#x20;-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;' +
      'ID" REALNAME="ebfHtmlGetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >lkpVeiculoTodo1</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >width</CONSTA' +
      'NT>'#13#10'<FUNCTION NAME="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REA' +
      'LNAME="ebfHtmlCssGetStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >lkpAlvaraDestino</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#2' +
      '37;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</G' +
      'UID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0' +
      'AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfChangeDescription</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>12</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compone' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A' +
      '1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTo' +
      'do1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>Novo&#x20;Ve&#237;culo</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefin' +
      'eStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebf' +
      'HtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>lkpVeiculoTodo1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME' +
      '>'#13#10'<TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>13</ID>'#13#10'<NOME' +
      '>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<' +
      'ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>lkpAlvaraDestino</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
      #13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
  end
  object FlowExpression4: TFlowExpression
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
    InputNames = 'FlowLine32'
    OutputNames = 'FlowLine23'
    Description = 'Muda descri'#231#227'o para Cedente'
    Text = 'Mudar Descri'#231#227'o(Cedente (lkpRequerente),Cedente)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Descri&#231;&#227;o" REALNAME="ebfCha' +
      'ngeDescription">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FA' +
      'LSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequere' +
      'nte</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Cedente</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfChangeDescripti' +
      'on</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cedente' +
      '&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SP' +
      'ECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>' +
      #13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cedente</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowLine32: TFlowLine
    Left = 265
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine23'
    OutputNames = 'FlowLine25'
    Description = 'Mudar posi'#231#227'o de Obs, Doc, placa e alvara destino'
    Text = 
      'Concatena'#231#227'o(Mudar Posi'#231#227'o do Componente(Ve'#237'culo (lkpVeiculoTodo' +
      '1),,167),Mudar Posi'#231#227'o do Componente(Alvar'#225' de Destino (lkpAlvar' +
      'aDestino),,234),Mudar Posi'#231#227'o do Componente(Observa'#231#227'o (edtObs),' +
      ',303),Mudar Posi'#231#227'o do Componente( (dlDocumentos),,395))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x' +
      '20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYPE="I' +
      'nteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL' +
      '="FALSE"  >167</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAM' +
      'E="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REALNAM' +
      'E="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" N' +
      'ULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkp' +
      'AlvaraDestino</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ' +
      '></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >234</CONST' +
      'ANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#2' +
      '31;&#227;o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPosition' +
      '">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "' +
      '{773D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONS' +
      'TANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="I' +
      'nteiro" NULL="FALSE"  >303</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<' +
      'FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Compone' +
      'nte" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="C' +
      'omponente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860' +
      'FB164B}">dlDocumentos</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL=' +
      '"TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >39' +
      '5</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>12</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPo' +
      'sition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve' +
      '&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>14</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>15</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>I' +
      'nteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>1' +
      '7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13 +
      #10'<ID>18</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;' +
      'de&#x20;Destino&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860F' +
      'B164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvaraDestino</SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALO' +
      'R></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2' +
      '1</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>234</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosition</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Observa&#231' +
      ';&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<S' +
      'PECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
      '5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>303</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<VALOR>&#x20;(dlDocumentos)</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE' +
      '860FB164B}</GUID>'#13#10'<SPECIALCODE>dlDocumentos</SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR' +
      '></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>10' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>395</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine23: TFlowLine
    Left = 265
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd4: TFlowEnd
    Left = 266
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
    ChangeDescription = False
    InputNames = 'FlowLine38;FlowLine42;FlowLine56'
    Description = 'Fim'
  end
  object FlowExpression21: TFlowExpression
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
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine9'
    Description = 'Ocultar componente Alvar'#225' Destino'
    Text = 'Mostrar Componente(Alvar'#225' de Destino (lkpAlvaraDestino),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvaraDestino</CO' +
      'NSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225' +
      ';&#x20;de&#x20;Destino&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-' +
      '0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvaraDestino</SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine22: TFlowLine
    Left = 645
    Top = 168
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowExpression21'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression24: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine31'
    OutputNames = 'FlowLine37'
    Description = 'Mostrar componente Alvar'#225' de Destino/Obrigat'#243'rio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Alvar'#225' de Destino (lkpAlvaraDest' +
      'ino),true),Definir Obrigatoriedade de Componente(Alvar'#225' de Desti' +
      'no (lkpAlvaraDestino),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvaraDe' +
      'stino</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tr' +
      'ue</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#' +
      'x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSe' +
      'tRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvaraDestin' +
      'o</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar' +
      '&#225;&#x20;de&#x20;Destino&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvaraDestino</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Com' +
      'ponente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;de&#x20;Destino' +
      '&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>lkpAlvaraDestino</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine37: TFlowLine
    Left = 265
    Top = 243
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
    InputNames = 'FlowExpression24'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine12: TFlowLine
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowExpression20'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression13: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine29'
    OutputNames = 'FlowLine11'
    Description = 'Muda descri'#231#227'o para Cedente'
    Text = 'Mudar Descri'#231#227'o(Requerente (lkpRequerente),Cedente)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Descri&#231;&#227;o" REALNAME="ebfCha' +
      'ngeDescription">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FA' +
      'LSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequere' +
      'nte</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Cedente</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfChangeDescripti' +
      'on</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requere' +
      'nte&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cedente</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
  end
  object FlowConnector1: TFlowConnector
    Left = 460
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
    InputNames = 'FlowLine57'
    OutputNames = 'FlowLine38'
  end
  object FlowLine38: TFlowLine
    Left = 265
    Top = 767
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
    InputNames = 'FlowConnector1'
    OutputNames = 'FlowEnd4'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowEnd1: TFlowEnd
    Left = 646
    Top = 843
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
    InputNames = 'FlowLine58'
    Description = 'Fim'
  end
  object FlowExpression1: TFlowExpression
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
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine10'
    Description = 
      'Mostra/Obrigatorio componente Cession'#225'rio(CPF), Alvar'#225' e requere' +
      'nte'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Cession'#225'rio (lkpCessionario),tru' +
      'e),Definir Obrigatoriedade de Componente(Cession'#225'rio (lkpCession' +
      'ario),true),Mostrar Componente(Alvar'#225' (lkpAlvara),true),Definir ' +
      'Obrigatoriedade de Componente(Alvar'#225' (lkpAlvara),true),Mostrar C' +
      'omponente(Requerente (lkpRequerente),true),Definir Obrigatorieda' +
      'de de Componente(Requerente (lkpRequerente),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessiona' +
      'rio</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x2' +
      '0;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSetR' +
      'equired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  G' +
      'UID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessionario</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Comp' +
      'onente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE8' +
      '60FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NU' +
      'LL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Componente" REAL' +
      'NAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE" ' +
      ' >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostr' +
      'ar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}">lkpRequerente</CONSTANT>'#13#10'<CONSTANT TYPE=' +
      '"L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'#13#10'<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;' +
      'Componente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT ' +
      'TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7' +
      '-0AE860FB164B}">lkpRequerente</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243' +
      ';gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cessi' +
      'on&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>tru' +
      'e</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR>Cession&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUN' +
      'CTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compone' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FU' +
      'NCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compo' +
      'nente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Comp' +
      'onente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequ' +
      'erente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpR' +
      'equerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&' +
      '#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression23: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine13'
    Description = 'Mostrar Placa de Ve'#237'culo Baixado/Em Cadastro'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Ve'#237'culo (lkpVeiculoTodo1),true),' +
      'Definir Obrigatoriedade de Componente(Ve'#237'culo (lkpVeiculoTodo1),' +
      'true),Mudar Descri'#231#227'o(Ve'#237'culo (lkpVeiculoTodo1),Novo Ve'#237'culo),CS' +
      'S - Definir Propriedade(HTML - Obter Elemento pelo ID(lkpVeiculo' +
      'Todo1),width,CSS - Obter Propriedade(HTML - Obter Elemento pelo ' +
      'ID(lkpAlvaraDestino),width)))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoT' +
      'odo1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tru' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x' +
      '20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSet' +
      'Required">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  ' +
      'GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoTodo1<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Desc' +
      'ri&#231;&#227;o" REALNAME="ebfChangeDescription">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >Novo&#x20;Ve&#237;culo</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x2' +
      '0;Propriedade" REALNAME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUN' +
      'CTION NAME="HTML&#x20;-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;' +
      'ID" REALNAME="ebfHtmlGetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >lkpVeiculoTodo1</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >width</CONSTA' +
      'NT>'#13#10'<FUNCTION NAME="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REA' +
      'LNAME="ebfHtmlCssGetStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >lkpAlvaraDestino</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#2' +
      '37;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</G' +
      'UID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0' +
      'AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTI' +
      'ON</NOME>'#13#10'<TEXT>ebfChangeDescription</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compon' +
      'ente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoT' +
      'odo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<VALOR>Novo&#x20;Ve&#237;culo</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefi' +
      'neStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<VALOR>lkpVeiculoTodo1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOM' +
      'E>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10 +
      '<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>lkpAlvaraDestino</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '</ROOT>'#13#10
  end
  object FlowLine10: TFlowLine
    Left = 455
    Top = 243
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression23'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression27: TFlowExpression
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
    InputNames = 'FlowLine48'
    OutputNames = 'FlowLine20'
    Description = 'Mudar posi'#231#227'o de Obs, Doc, placa e alvara destino'
    Text = 
      'Concatena'#231#227'o(Mudar Posi'#231#227'o do Componente(Alvar'#225' (lkpAlvara),,167' +
      '),Mudar Posi'#231#227'o do Componente(Requerente (lkpRequerente),,167),M' +
      'udar Posi'#231#227'o do Componente(Observa'#231#227'o (edtObs),,365),Mudar Posi'#231 +
      #227'o do Componente( (dlDocumentos),,455),Mudar Posi'#231#227'o do Componen' +
      'te(Ve'#237'culo (lkpVeiculoTodo1),,298),Mudar Posi'#231#227'o do Componente(C' +
      'ession'#225'rio (lkpCessionario),,234))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x' +
      '20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro' +
      '" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALS' +
      'E"  >167</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mud' +
      'ar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REALNAME="ebf' +
      'FormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="F' +
      'ALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequer' +
      'ente</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >167</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;' +
      'o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARA' +
      'MS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTANT TYPE' +
      '="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" N' +
      'ULL="FALSE"  >365</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'dlDocumentos</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  >' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >455</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#23' +
      '1;&#227;o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPosition"' +
      '>'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{' +
      '773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT' +
      '>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT' +
      ' TYPE="Inteiro" NULL="FALSE"  >298</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20' +
      ';Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT' +
      ' TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B' +
      '7-0AE860FB164B}">lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="Inte' +
      'iro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="F' +
      'ALSE"  >234</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPos' +
      'ition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alva' +
      'r&#225;&#x20;(lkpAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>lkpAlvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13 +
      #10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>167</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compone' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-64' +
      '66-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente</S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFor' +
      'mSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VAL' +
      'OR>Observa&#231;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}</GUID>'#13#10'<SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRU' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>365</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10 +
      '<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(dlDocumentos)</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dlDocumentos</SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>455</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '<TObjFunction>'#13#10'<ID>12</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFor' +
      'mSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VA' +
      'LOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860F' +
      'B164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'<TObjConst>'#13#10'<ID>14</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR' +
      '></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>16' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>298</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13 +
      #10'<ID>17</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosition</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>18</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cession&#22' +
      '5;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>21</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>234</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '</ROOT>'#13#10
  end
  object FlowExpression28: TFlowExpression
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
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine24'
    Description = 'muda altura'
    Text = 'Mudar Altura(Observa'#231#227'o (edtObs),80)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Altura" REALNAME="ebfFormSetHeight">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE"  >80</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetHeight</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Observa&#23' +
      '1;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>80</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression18: TFlowExpression
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
    InputNames = 'FlowLine25'
    OutputNames = 'FlowLine28'
    Description = 'muda altura obs'
    Text = 'Mudar Altura(Observa'#231#227'o (edtObs),80)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Altura" REALNAME="ebfFormSetHeight">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE"  >80</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetHeight</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Observa&#23' +
      '1;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>80</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression19: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine29'
    Description = 'muda altura'
    Text = 'Mudar Altura(Observa'#231#227'o (edtObs),80)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Altura" REALNAME="ebfFormSetHeight">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE"  >80</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetHeight</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Observa&#23' +
      '1;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>80</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine20: TFlowLine
    Left = 455
    Top = 468
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
    InputNames = 'FlowExpression27'
    OutputNames = 'FlowExpression28'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine25: TFlowLine
    Left = 265
    Top = 468
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowExpression18'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
    Left = 645
    Top = 468
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
    InputNames = 'FlowExpression20'
    OutputNames = 'FlowExpression19'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine29: TFlowLine
    Left = 645
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
    InputNames = 'FlowExpression19'
    OutputNames = 'FlowExpression13'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine3: TFlowSubRoutine
    Left = 970
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
    InputNames = 'FlowLine45'
    OutputNames = 'FlowLine46'
    Description = 'GRS - Tipo Servi'#231'o = "O"'
    Id = 1178
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
    ObjectName = 'GRS - Tipo Servi'#231'o = "O"'
    RealName = 'CALLRULE'
  end
  object FlowDecision6: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine5;FlowLine35'
    Description = 'Tipo de Servi'#231'o = '#39'B'#39'?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>8</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>B</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >B</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine4: TFlowLine
    Left = 75
    Top = 18
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowDecision6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine5: TFlowLine
    Left = 75
    Top = 93
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowDecision4'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 265
    Top = 93
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
    OutputNames = 'FlowDecision5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd2: TFlowEnd
    Left = 1216
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
    InputNames = 'FlowLine44;FlowLine47'
    Description = 'Fim'
  end
  object FlowExpression2: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine35'
    OutputNames = 'FlowLine36'
    Description = 
      'Ocultar e Limpar componente Cession'#225'rio(CNPJ e CPF), Alvar'#225' Dest' +
      'ino e Placa de Ve'#237'culo Baixado'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Cession'#225'rio (lkpCessionario),fal' +
      'se),Alterar Valor do Componente(Cadastro de Requerimento de Serv' +
      'i'#231'os,Cession'#225'rio (lkpCessionario),),Mostrar Componente(Alvar'#225' de' +
      ' Destino (lkpAlvaraDestino),false),Mostrar Componente(Forma de A' +
      'quisi'#231#227'o (lkpFormaAquisicao),false),Alterar Valor do Componente(' +
      'Cadastro de Requerimento de Servi'#231'os,Forma de Aquisi'#231#227'o (lkpForm' +
      'aAquisicao),),Mostrar Componente(Data de Aquisi'#231#227'o (dtDataAquisi' +
      'cao),false),Alterar Valor do Componente(Cadastro de Requerimento' +
      ' de Servi'#231'os,Data de Aquisi'#231#227'o (dtDataAquisicao),))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessiona' +
      'rio</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fals' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x' +
      '20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeCompone' +
      'ntValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALS' +
      'E"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-64' +
      '66-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Component' +
      'e" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}"' +
      '>lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&' +
      '#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONST' +
      'ANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}">lkpAlvaraDestino</CONSTANT>'#13#10'<CONSTANT TYPE=' +
      '"L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFor' +
      'mSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE' +
      '"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpFormaAquis' +
      'icao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fal' +
      'se</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#' +
      'x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeCompon' +
      'entValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componen' +
      'te" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '">lkpFormaAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Most' +
      'rar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<C' +
      'ONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}">dtDataAquisicao</CONSTANT>'#13#10'<CONSTANT TY' +
      'PE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Compon' +
      'ente" REALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</' +
      'CONSTANT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataAquisicao</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10 +
      '</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cessi' +
      'on&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>fal' +
      'se</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;r' +
      'io</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x' +
      '20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR>Cession&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;de&#x20;Destino&#x20;(lkpAlva' +
      'raDestino)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>l' +
      'kpAlvaraDestino</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunct' +
      'ion>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Forma&#x2' +
      '0;de&#x20;Aquisi&#231;&#227;o&#x20;(lkpFormaAquisicao)</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquisicao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13 +
      #10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20' +
      ';de&#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B' +
      '7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Forma&#x20;de&#x20;Aquisi&#23' +
      '1;&#227;o&#x20;(lkpFormaAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B' +
      '}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquisicao</SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<' +
      'VALOR>Data&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(dtDataAquisica' +
      'o)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D' +
      '90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataAqu' +
      'isicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID' +
      '>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValu' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cad' +
      'astro&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;de&#x20;A' +
      'quisi&#231;&#227;o&#x20;(dtDataAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE86' +
      '0FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataAquisicao</SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR' +
      '></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine35: TFlowLine
    Left = 75
    Top = 93
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowExpression2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression8: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine43'
    OutputNames = 'FlowLine17'
    Description = 'muda altura'
    Text = 'Mudar Altura(Observa'#231#227'o (edtObs),100)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Altura" REALNAME="ebfFormSetHeight">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE"  >100</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetHeight</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Observa&#23' +
      '1;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>100</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowConnector3: TFlowConnector
    Left = 80
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
    InputNames = 'FlowLine54'
    OutputNames = 'FlowLine42'
  end
  object FlowLine42: TFlowLine
    Left = 75
    Top = 767
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
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowEnd4'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression10: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine36'
    OutputNames = 'FlowLine27'
    Description = 
      'Mostrar Placa de Ve'#237'culo Ativo e Alvara do ve'#237'culo, alvar'#225' e req' +
      'uerente'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Ve'#237'culo (lkpVeiculoTodo1),true),' +
      'Definir Obrigatoriedade de Componente(Ve'#237'culo (lkpVeiculoTodo1),' +
      'true),Mudar Descri'#231#227'o(Ve'#237'culo (lkpVeiculoTodo1),Ve'#237'culo),Mostrar' +
      ' Componente(Alvar'#225' (lkpAlvara),true),Habilitar Componente(Alvar'#225 +
      ' (lkpAlvara),false),Definir Obrigatoriedade de Componente(Alvar'#225 +
      ' (lkpAlvara),true),Mostrar Componente(Requerente (lkpRequerente)' +
      ',true),Definir Obrigatoriedade de Componente(Requerente (lkpRequ' +
      'erente),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoT' +
      'odo1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tru' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x' +
      '20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSet' +
      'Required">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  ' +
      'GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoTodo1<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Desc' +
      'ri&#231;&#227;o" REALNAME="ebfChangeDescription">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >Ve&#237;culo</CONSTANT>'#13#10'</PARAMS>'#13#10'</' +
      'FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="eb' +
      'fFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="F' +
      'ALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvara' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Habilitar&#x20' +
      ';Componente" REALNAME="ebfFormSetEnabled">'#13#10'<PARAMS>'#13#10'<CONSTANT ' +
      'TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7' +
      '-0AE860FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gic' +
      'o" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUN' +
      'CTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Componente' +
      '" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Comp' +
      'onente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="F' +
      'ALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME=' +
      '"Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS' +
      '>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}">lkpRequerente</CONSTANT>'#13#10'<CONSTANT' +
      ' TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de' +
      '&#x20;Componente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}">lkpRequerente</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#2' +
      '37;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</G' +
      'UID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0' +
      'AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTI' +
      'ON</NOME>'#13#10'<TEXT>ebfChangeDescription</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compon' +
      'ente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoT' +
      'odo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<VALOR>Ve&#237;culo</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<I' +
      'D>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst' +
      '>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x2' +
      '0;(lkpAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCOD' +
      'E>lkpAlvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>12</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>13</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>16</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;' +
      '&#x20;(lkpAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIA' +
      'LCODE>lkpAlvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>15' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>20</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequi' +
      'red</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjConst>'#13#10'<ID>21</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar' +
      '&#225;&#x20;(lkpAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>lkpAlvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>20</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TOb' +
      'jFunction>'#13#10'<ID>14</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSet' +
      'Visible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjConst>'#13#10'<ID>15</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>R' +
      'equerente&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</G' +
      'UID>'#13#10'<SPECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>16</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'<TObjFunction>'#13#10'<ID>22</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>22</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE8' +
      '60FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'<TObjConst>'#13#10'<ID>22</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<' +
      'VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine36: TFlowLine
    Left = 75
    Top = 168
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
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine16: TFlowLine
    Left = 455
    Top = 93
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowDecision1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression16: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine27'
    OutputNames = 'FlowLine40'
    Description = 'Mostrar data do ve'#237'culo'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Data da Baixa (dtDataBaixa),true' +
      '),Definir Obrigatoriedade de Componente(Data da Baixa (dtDataBai' +
      'xa),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataBaixa' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x20;O' +
      'brigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSetRequ' +
      'ired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTAN' +
      'T>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&' +
      '#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>tr' +
      'ue</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>' +
      #13#10
  end
  object FlowLine27: TFlowLine
    Left = 75
    Top = 243
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowExpression16'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression17: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine40'
    OutputNames = 'FlowLine43'
    Description = 'Mudar posi'#231#227'o de Obs, Doc, placa e alvara destino'
    Text = 
      'Concatena'#231#227'o(Mudar Posi'#231#227'o do Componente(Ve'#237'culo (lkpVeiculoTodo' +
      '1),,167),CSS - Definir Propriedade(HTML - Obter Elemento pelo ID' +
      '(lkpVeiculoTodo1),width,CSS - Obter Propriedade(HTML - Obter Ele' +
      'mento pelo ID(lkpServico),width)),Mudar Posi'#231#227'o do Componente(Da' +
      'ta da Baixa (dtDataBaixa),,167),Mudar Posi'#231#227'o do Componente(Alva' +
      'r'#225' (lkpAlvara),,234),Mudar Posi'#231#227'o do Componente(Requerente (lkp' +
      'Requerente),,234),Mudar Posi'#231#227'o do Componente(Observa'#231#227'o (edtObs' +
      '),,300),Mudar Posi'#231#227'o do Componente( (dlDocumentos),,416))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x' +
      '20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYPE="I' +
      'nteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL' +
      '="FALSE"  >167</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNAME="ebfHtmlCs' +
      'sDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter' +
      '&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementByI' +
      'd">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >lkpVeiculo' +
      'Todo1</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAME="CSS&#x20;-&#x' +
      '20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssGetStyle">'#13#10'<PARA' +
      'MS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20;Elemento&#x20;p' +
      'elo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10'<PARAMS>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >lkpServico</CONSTANT>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >width</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTI' +
      'ON NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" R' +
      'EALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Compone' +
      'nte" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B' +
      '}">dtDataBaixa</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE" ' +
      ' ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >167</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#' +
      '231;&#227;o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPositio' +
      'n">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = ' +
      '"{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvara</CONSTANT>'#13#10'<' +
      'CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Inteiro" NULL="FALSE"  >234</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Com' +
      'ponente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}">lkpRequerente</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" ' +
      'NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"' +
      '  >234</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar' +
      '&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REALNAME="ebfFo' +
      'rmSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CON' +
      'STANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CON' +
      'STANT TYPE="Inteiro" NULL="FALSE"  >300</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do' +
      '&#x20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}">dlDocumentos</CONSTANT>'#13#10'<CONSTANT TYPE="I' +
      'nteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL' +
      '="FALSE"  >416</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</' +
      'FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>12</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPo' +
      'sition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve' +
      '&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>14</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>16</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>I' +
      'nteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>1' +
      '9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineStyle</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>19</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlGetEleme' +
      'ntById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALO' +
      'R>lkpVeiculoTodo1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>19</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebf' +
      'HtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>19</ID>'#13#10'<NOME>FUNCTION</N' +
      'OME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>lkpServico</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID' +
      '>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>18</ID>'#13#10'<NOME>FUNCTION</NO' +
      'ME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>18</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A' +
      '1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa<' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>18</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'<TObjFunction>'#13#10'<ID>19</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>e' +
      'bfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Int' +
      'eiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>234</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>19<' +
      '/ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<' +
      'ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lk' +
      'pRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE' +
      '>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>19<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR>234</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</' +
      'NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<VALOR>Observa&#231;&#227;o&#x20;(edtObs)</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>edtObs</SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13 +
      #10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>300</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosit' +
      'ion</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
      '(dlDocumentos)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCO' +
      'DE>dlDocumentos</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>19</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR>416</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine40: TFlowLine
    Left = 75
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
    InputNames = 'FlowExpression16'
    OutputNames = 'FlowExpression17'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine43: TFlowLine
    Left = 75
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
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression26: TFlowExpression
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
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine19'
    Description = 
      'Ocultar componente Alvar'#225' Destino, veiculo baixado, alvara do ve' +
      'iculo'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Alvar'#225' de Destino (lkpAlvaraDest' +
      'ino),false),Alterar Valor do Componente(Cadastro de Requerimento' +
      ' de Servi'#231'os,Alvar'#225' de Destino (lkpAlvaraDestino),),Mostrar Comp' +
      'onente(Data da Baixa (dtDataBaixa),false),Alterar Valor do Compo' +
      'nente(Cadastro de Requerimento de Servi'#231'os,Data da Baixa (dtData' +
      'Baixa),),Mostrar Componente(Data de Aquisi'#231#227'o (dtDataAquisicao),' +
      'false),Alterar Valor do Componente(Cadastro de Requerimento de S' +
      'ervi'#231'os,Data de Aquisi'#231#227'o (dtDataAquisicao),),Mostrar Componente' +
      '(Forma de Aquisi'#231#227'o (lkpFormaAquisicao),false),Alterar Valor do ' +
      'Componente(Cadastro de Requerimento de Servi'#231'os,Forma de Aquisi'#231 +
      #227'o (lkpFormaAquisicao),))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvaraDe' +
      'stino</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fa' +
      'lse</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&' +
      '#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeCompo' +
      'nentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FA' +
      'LSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-' +
      '6466-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Compone' +
      'nte" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B' +
      '}">lkpAlvaraDestino</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Most' +
      'rar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<C' +
      'ONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente' +
      '" REALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT T' +
      'YPE="Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTANT>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormS' +
      'etVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataAquisicao' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20;' +
      'Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponentV' +
      'alue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente" ' +
      'NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dt' +
      'DataAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ' +
      '></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x' +
      '20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTAN' +
      'T TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}">lkpFormaAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente' +
      '" REALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT T' +
      'YPE="Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}">lkpFormaAquisicao</CONSTANT>'#13#10'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</' +
      'FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar' +
      '&#225;&#x20;de&#x20;Destino&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvaraDestino</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID' +
      '>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&' +
      '#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860' +
      'FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Comp' +
      'onente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;de&#x20;Destino&' +
      '#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>lkpAlvaraDestino</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFu' +
      'nction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisi' +
      'ble</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#' +
      'x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB16' +
      '4B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>fal' +
      'se</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;r' +
      'io</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x' +
      '20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NO' +
      'ME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MK' +
      'R_VERSION>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(d' +
      'tDataAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALC' +
      'ODE>dtDataAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<I' +
      'D>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChange' +
      'ComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT' +
      '></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&' +
      '#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773' +
      'D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#' +
      'x20;de&#x20;Aquisi&#231;&#227;o&#x20;(dtDataAquisicao)</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataAquisicao</SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>Forma&#x20;de&#x20;Aquisi&#231;&#227;o&#' +
      'x20;(lkpFormaAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>lkpFormaAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunctio' +
      'n>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebf' +
      'FormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</M' +
      'KR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x20;de&#' +
      'x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIA' +
      'LCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VA' +
      'LOR>Forma&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(lkpFormaAquisic' +
      'ao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773' +
      'D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpForma' +
      'Aquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
      #13#10'</ROOT>'#13#10
  end
  object FlowLine8: TFlowLine
    Left = 455
    Top = 93
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression26'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine19: TFlowLine
    Left = 455
    Top = 168
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
    InputNames = 'FlowExpression26'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression5: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine18'
    Description = 'Mostra componente Cession'#225'rio(CPF)/Obrigatorio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Cession'#225'rio (lkpCessionario),tru' +
      'e),Definir Obrigatoriedade de Componente(Cession'#225'rio (lkpCession' +
      'ario),true),Mostrar Componente(Alvar'#225' (lkpAlvara),true),Definir ' +
      'Obrigatoriedade de Componente(Alvar'#225' (lkpAlvara),true),Alterar V' +
      'alor do Componente(Cadastro de Requerimento de Servi'#231'os,Alvar'#225' (' +
      'lkpAlvara),),Habilitar Componente(Alvar'#225' (lkpAlvara),true),Mostr' +
      'ar Componente(Requerente (lkpRequerente),true),Definir Obrigator' +
      'iedade de Componente(Requerente (lkpRequerente),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessiona' +
      'rio</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x2' +
      '0;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSetR' +
      'equired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  G' +
      'UID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessionario</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Comp' +
      'onente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE8' +
      '60FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NU' +
      'LL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Componente" REAL' +
      'NAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE" ' +
      ' >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alter' +
      'ar&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeCo' +
      'mponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL=' +
      '"FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Comp' +
      'onente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Habilita' +
      'r&#x20;Componente" REALNAME="ebfFormSetEnabled">'#13#10'<PARAMS>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#2' +
      '43;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVi' +
      'sible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUI' +
      'D = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequerente</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x20;Obrigat' +
      'oriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSetRequired">' +
      #13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{7' +
      '73D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequerente</CONSTANT>'#13#10 +
      '<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cessi' +
      'on&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>tru' +
      'e</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR>Cession&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUN' +
      'CTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compone' +
      'nte</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FU' +
      'NCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compo' +
      'nente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#' +
      'x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE' +
      '860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860F' +
      'B164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Compo' +
      'nente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>ebfFormSetEnabled</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<T' +
      'EXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION' +
      '</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Com' +
      'ponente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A' +
      '1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerent' +
      'e</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gic' +
      'o</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'</ROOT>'#13#10
  end
  object FlowLine9: TFlowLine
    Left = 645
    Top = 243
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
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine18: TFlowLine
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision7: TFlowDecision
    Left = 970
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine49'
    OutputNames = 'FlowLine44;FlowLine45'
    Description = 'Tipo de Servi'#231'o = '#39'O'#39'?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.29</MKR_VERSION>'#13#10'<VALOR>O</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >O</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine44: TFlowLine
    Left = 1025
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowEnd2'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine45: TFlowLine
    Left = 1025
    Top = 93
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowSubRoutine3'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowConnector2: TFlowConnector
    Left = 1220
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
    InputNames = 'FlowLine46'
    OutputNames = 'FlowLine47'
  end
  object FlowLine46: TFlowLine
    Left = 1025
    Top = 167
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
    InputNames = 'FlowSubRoutine3'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine47: TFlowLine
    Left = 1215
    Top = 92
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
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression6: TFlowExpression
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
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine48'
    Description = 'Muda descri'#231#227'o para Cedente'
    Text = 'Mudar Descri'#231#227'o(Requerente (lkpRequerente),Cedente)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Descri&#231;&#227;o" REALNAME="ebfCha' +
      'ngeDescription">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FA' +
      'LSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequere' +
      'nte</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Cedente</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfChangeDescripti' +
      'on</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requere' +
      'nte&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cedente</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
  end
  object FlowLine13: TFlowLine
    Left = 455
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
    InputNames = 'FlowExpression23'
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine48: TFlowLine
    Left = 455
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression27'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision8: TFlowDecision
    Left = 780
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine34'
    OutputNames = 'FlowLine49;FlowLine50'
    Description = 'Tipo de Servi'#231'o = '#39'P'#39'?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValu' +
      'eObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</' +
      'MKR_VERSION>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.29</MKR_VERSION>'#13#10'<VALOR>P</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION ' +
      'NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueOb' +
      'jectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >P</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine34: TFlowLine
    Left = 645
    Top = 93
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowDecision8'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine49: TFlowLine
    Left = 835
    Top = 93
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
    InputNames = 'FlowDecision8'
    OutputNames = 'FlowDecision7'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression22: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine50'
    OutputNames = 'FlowLine51'
    Description = 
      'Ocultar e Limpar componente Cession'#225'rio(CNPJ e CPF), placa do ve' +
      #237'culo(ativo) e data da baixa'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Data da Baixa (dtDataBaixa),fals' +
      'e),Alterar Valor do Componente(Cadastro de Requerimento de Servi' +
      #231'os,Data da Baixa (dtDataBaixa),),Definir Obrigatoriedade de Com' +
      'ponente(Data da Baixa (dtDataBaixa),false),Mostrar Componente(Al' +
      'var'#225' (lkpAlvara),false),Alterar Valor do Componente(Cadastro de ' +
      'Requerimento de Servi'#231'os,Alvar'#225' (lkpAlvara),),Definir Obrigatori' +
      'edade de Componente(Alvar'#225' (lkpAlvara),false),Mostrar Componente' +
      '(Alvar'#225' de Destino (lkpAlvaraDestino),false),Alterar Valor do Co' +
      'mponente(Cadastro de Requerimento de Servi'#231'os,Alvar'#225' de Destino ' +
      '(lkpAlvaraDestino),),Definir Obrigatoriedade de Componente(Alvar' +
      #225' de Destino (lkpAlvaraDestino),false))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataBaixa' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20;' +
      'Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponentV' +
      'alue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente" ' +
      'NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dt' +
      'DataBaixa</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ></C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x20;O' +
      'brigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSetRequ' +
      'ired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTAN' +
      'T>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Component' +
      'e" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Comp' +
      'onente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="F' +
      'ALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME' +
      '="Alterar&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormC' +
      'hangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      '{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL=' +
      '"FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="D' +
      'efinir&#x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="e' +
      'bfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL=' +
      '"FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlva' +
      'ra</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x2' +
      '0;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT' +
      ' TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B' +
      '7-0AE860FB164B}">lkpAlvaraDestino</CONSTANT>'#13#10'<CONSTANT TYPE="L&' +
      '#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" ' +
      'REALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}">lkpAlvaraDestino</CONSTANT>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'<FUNCTION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x2' +
      '0;Componente" REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTAN' +
      'T TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}">lkpAlvaraDestino</CONSTANT>'#13#10'<CONSTANT TYPE="L' +
      '&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&' +
      '#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB1' +
      '64B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>fa' +
      'lse</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GU' +
      'ID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;' +
      'rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#' +
      'x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13 +
      #10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</N' +
      'OME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO><' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A' +
      '1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa<' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlva' +
      'ra)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773' +
      'D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvar' +
      'a</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gic' +
      'o</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro' +
      '&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlv' +
      'ara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlva' +
      'ra</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Co' +
      'mponente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara)</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-' +
      '6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara</SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT' +
      '</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</M' +
      'KR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;de&#x20;Dest' +
      'ino&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>lkpAlvaraDestino</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>' +
      'ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x20;d' +
      'e&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPE' +
      'CIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10 +
      '<VALOR>Alvar&#225;&#x20;de&#x20;Destino&#x20;(lkpAlvaraDestino)<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A' +
      '1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvaraDes' +
      'tino</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NO' +
      'ME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>3</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;de&#x20;Dest' +
      'ino&#x20;(lkpAlvaraDestino)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>lkpAlvaraDestino</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine50: TFlowLine
    Left = 835
    Top = 93
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
    InputNames = 'FlowDecision8'
    OutputNames = 'FlowExpression22'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression29: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine52'
    Description = 'Mudar posi'#231#227'o de Obs, Doc, placa e alvara destino'
    Text = 
      'Concatena'#231#227'o(Mudar Posi'#231#227'o do Componente(Ve'#237'culo (lkpVeiculoTodo' +
      '1),,167),CSS - Definir Propriedade(HTML - Obter Elemento pelo ID' +
      '(lkpVeiculoTodo1),width,CSS - Obter Propriedade(HTML - Obter Ele' +
      'mento pelo ID(lkpAlvara),width)),Mudar Posi'#231#227'o do Componente(Req' +
      'uerente (lkpRequerente),,167),Mudar Posi'#231#227'o do Componente(Forma ' +
      'de Aquisi'#231#227'o (lkpFormaAquisicao),,300),Mudar Posi'#231#227'o do Componen' +
      'te(Data de Aquisi'#231#227'o (dtDataAquisicao),,300),Mudar Posi'#231#227'o do Co' +
      'mponente(Observa'#231#227'o (edtObs),,365),Mudar Posi'#231#227'o do Componente( ' +
      '(dlDocumentos),,460),Mudar Posi'#231#227'o do Componente(Cession'#225'rio (lk' +
      'pCessionario),,234))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x' +
      '20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}">lkpVeiculoTodo1</CONSTANT>'#13#10'<CONSTANT TYPE="I' +
      'nteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL' +
      '="FALSE"  >167</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNAME="ebfHtmlCs' +
      'sDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter' +
      '&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementByI' +
      'd">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >lkpVeiculo' +
      'Todo1</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAME="CSS&#x20;-&#x' +
      '20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssGetStyle">'#13#10'<PARA' +
      'MS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20;Elemento&#x20;p' +
      'elo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10'<PARAMS>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >lkpAlvara</CONSTANT>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >width</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTIO' +
      'N NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" RE' +
      'ALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componen' +
      'te" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '">lkpRequerente</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"' +
      '  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >167</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&' +
      '#231;&#227;o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPositi' +
      'on">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID =' +
      ' "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpFormaAquisicao</CON' +
      'STANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CON' +
      'STANT TYPE="Inteiro" NULL="FALSE"  >300</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do' +
      '&#x20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CON' +
      'STANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}">dtDataAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE' +
      '="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" N' +
      'ULL="FALSE"  >300</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION ' +
      'NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'edtObs</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="TRUE"  ></CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >365</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mudar&#x20;Posi&#231;&#22' +
      '7;o&#x20;do&#x20;Componente" REALNAME="ebfFormSetPosition">'#13#10'<PA' +
      'RAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}">dlDocumentos</CONSTANT>'#13#10'<CONST' +
      'ANT TYPE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="In' +
      'teiro" NULL="FALSE"  >460</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<F' +
      'UNCTION NAME="Mudar&#x20;Posi&#231;&#227;o&#x20;do&#x20;Componen' +
      'te" REALNAME="ebfFormSetPosition">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Co' +
      'mponente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860F' +
      'B164B}">lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL' +
      '="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >2' +
      '34</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>26</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPo' +
      'sition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>26</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve' +
      '&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>26</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>I' +
      'nteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2' +
      '7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineStyle</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlGetEleme' +
      'ntById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALO' +
      'R>lkpVeiculoTodo1</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebf' +
      'HtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</N' +
      'OME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
      'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>lkpAlvara</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>' +
      '27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</M' +
      'KR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente</SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCons' +
      't>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>167</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObj' +
      'Function>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetP' +
      'osition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>F' +
      'orma&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(lkpFormaAquisicao)</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquis' +
      'icao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteir' +
      'o</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>30' +
      '0</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
      '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'<TObjFunction>'#13#10'<ID>27</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(dtData' +
      'Aquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>d' +
      'tDataAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR>300</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</' +
      'NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<VALOR>Observa&#231;&#227;o&#x20;(edtObs)</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-' +
      '400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>edtObs</SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13 +
      #10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>365</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetPosit' +
      'ion</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
      '(dlDocumentos)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCO' +
      'DE>dlDocumentos</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR>460</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>34</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>ebfFormSetPosition</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>Cession&#225;rio&#x20;(lkpCessionario)</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpCessionari' +
      'o</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>27</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>234</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunc' +
      'tion>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowEnd3: TFlowEnd
    Left = 836
    Top = 618
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
    InputNames = 'FlowLine55'
    Description = 'Fim'
  end
  object FlowExpression30: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine51'
    OutputNames = 'FlowLine14'
    Description = 'Mostra componente Cession'#225'rio(CPF)/Obrigatorio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Ve'#237'culo (lkpVeiculoTodo1),true),' +
      'Definir Obrigatoriedade de Componente(Ve'#237'culo (lkpVeiculoTodo1),' +
      'true),Mostrar Componente(Requerente (lkpRequerente),true),Mudar ' +
      'Descri'#231#227'o(Requerente (lkpRequerente),Cedente),Mostrar Componente' +
      '(Cession'#225'rio (lkpCessionario),true),Definir Obrigatoriedade de C' +
      'omponente(Cession'#225'rio (lkpCessionario),true),Mostrar Componente(' +
      'Forma de Aquisi'#231#227'o (lkpFormaAquisicao),true),Definir Obrigatorie' +
      'dade de Componente(Forma de Aquisi'#231#227'o (lkpFormaAquisicao),true),' +
      'Mostrar Componente(Data de Aquisi'#231#227'o (dtDataAquisicao),true),Def' +
      'inir Obrigatoriedade de Componente(Data de Aquisi'#231#227'o (dtDataAqui' +
      'sicao),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoT' +
      'odo1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tru' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x' +
      '20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSet' +
      'Required">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  ' +
      'GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpVeiculoTodo1<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Co' +
      'mponente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}">lkpRequerente</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gi' +
      'co" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUN' +
      'CTION NAME="Mudar&#x20;Descri&#231;&#227;o" REALNAME="ebfChangeD' +
      'escription">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"' +
      '  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequerente<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Cedente</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Comp' +
      'onente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE8' +
      '60FB164B}">lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gic' +
      'o" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNC' +
      'TION NAME="Definir&#x20;Obrigatoriedade&#x20;de&#x20;Componente"' +
      ' REALNAME="ebfFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Compo' +
      'nente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB16' +
      '4B}">lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NUL' +
      'L="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION N' +
      'AME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PA' +
      'RAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90' +
      'A1-6466-400D-A8B7-0AE860FB164B}">lkpFormaAquisicao</CONSTANT>'#13#10'<' +
      'CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x20;Obrigatoriedade' +
      '&#x20;de&#x20;Componente" REALNAME="ebfFormSetRequired">'#13#10'<PARAM' +
      'S>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-' +
      '6466-400D-A8B7-0AE860FB164B}">lkpFormaAquisicao</CONSTANT>'#13#10'<CON' +
      'STANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAM' +
      'S>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNA' +
      'ME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" N' +
      'ULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtD' +
      'ataAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALS' +
      'E"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="De' +
      'finir&#x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="eb' +
      'fFormSetRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="' +
      'FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">dtDataAq' +
      'uisicao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >' +
      'true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Ve&#2' +
      '37;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</G' +
      'UID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>Ve&#237;culo&#x20;(lkpVeiculoTodo1)</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0' +
      'AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpVeiculoTodo1</SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PAR' +
      'AMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerente)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequerente</SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</' +
      'NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>FUNCTION</NOME>'#13#10'<TEXT>ebfChangeDescription</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpRequerent' +
      'e)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D' +
      '90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRequer' +
      'ente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>Cedente</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cession&#225;rio&#x20;(' +
      'lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALC' +
      'ODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequi' +
      'red</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cessio' +
      'n&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}<' +
      '/GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10 +
      '<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>Forma&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(lkpFormaA' +
      'quisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lk' +
      'pFormaAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Forma&#x2' +
      '0;de&#x20;Aquisi&#231;&#227;o&#x20;(lkpFormaAquisicao)</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquisicao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&#231' +
      ';&#227;o&#x20;(dtDataAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</' +
      'GUID>'#13#10'<SPECIALCODE>dtDataAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(dtDataAqu' +
      'isicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDa' +
      'taAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine51: TFlowLine
    Left = 835
    Top = 168
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
    InputNames = 'FlowExpression22'
    OutputNames = 'FlowExpression30'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression31: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine52'
    OutputNames = 'FlowLine15'
    Description = 'muda altura'
    Text = 'Mudar Altura(Observa'#231#227'o (edtObs),80)'
    Expression = 
      '<FUNCTION NAME="Mudar&#x20;Altura" REALNAME="ebfFormSetHeight">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{77' +
      '3D90A1-6466-400D-A8B7-0AE860FB164B}">edtObs</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE"  >80</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetHeight</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Observa&#23' +
      '1;&#227;o&#x20;(edtObs)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>edtObs</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>80</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine52: TFlowLine
    Left = 835
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
    InputNames = 'FlowExpression29'
    OutputNames = 'FlowExpression31'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression25: TFlowExpression
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine26'
    OutputNames = 'FlowLine31'
    Description = 
      'Ocultar e Limpar componente Cession'#225'rio(CNPJ e CPF), placa do ve' +
      #237'culo(ativo) e data da baixa'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Cession'#225'rio (lkpCessionario),fal' +
      'se),Alterar Valor do Componente(Cadastro de Requerimento de Serv' +
      'i'#231'os,Cession'#225'rio (lkpCessionario),),Mostrar Componente(Data da B' +
      'aixa (dtDataBaixa),false),Alterar Valor do Componente(Cadastro d' +
      'e Requerimento de Servi'#231'os,Data da Baixa (dtDataBaixa),),Mostrar' +
      ' Componente(Alvar'#225' (lkpAlvara),false),Alterar Valor do Component' +
      'e(Cadastro de Requerimento de Servi'#231'os,Alvar'#225' (lkpAlvara),),Defi' +
      'nir Obrigatoriedade de Componente(Alvar'#225' (lkpAlvara),false),Most' +
      'rar Componente(Requerente (lkpRequerente),false),Definir Obrigat' +
      'oriedade de Componente(Requerente (lkpRequerente),false),Alterar' +
      ' Valor do Componente(Cadastro de Requerimento de Servi'#231'os,Requer' +
      'ente (lkpRequerente),),Mostrar Componente(Data de Aquisi'#231#227'o (dtD' +
      'ataAquisicao),false),Alterar Valor do Componente(Cadastro de Req' +
      'uerimento de Servi'#231'os,Data de Aquisi'#231#227'o (dtDataAquisicao),),Most' +
      'rar Componente(Forma de Aquisi'#231#227'o (lkpFormaAquisicao),false),Alt' +
      'erar Valor do Componente(Cadastro de Requerimento de Servi'#231'os,Fo' +
      'rma de Aquisi'#231#227'o (lkpFormaAquisicao),))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessiona' +
      'rio</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fals' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x' +
      '20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeCompone' +
      'ntValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALS' +
      'E"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-64' +
      '66-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Component' +
      'e" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}"' +
      '>lkpCessionario</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&' +
      '#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONST' +
      'ANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-' +
      'A8B7-0AE860FB164B}">dtDataBaixa</CONSTANT>'#13#10'<CONSTANT TYPE="L&#2' +
      '43;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" RE' +
      'ALNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE=' +
      '"Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7' +
      '-0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTANT' +
      '>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}">dtDataBaixa</CONSTANT>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVi' +
      'sible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUI' +
      'D = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvara</CONSTANT' +
      '>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20;Valor&#x20' +
      ';do&#x20;Componente" REALNAME="ebfFormChangeComponentValue">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE"  GUID = "{' +
      '773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6466-400D-A8B7-' +
      '0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente" NULL="FALS' +
      'E"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpAlvara</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#x20;Obrigatorieda' +
      'de&#x20;de&#x20;Componente" REALNAME="ebfFormSetRequired">'#13#10'<PAR' +
      'AMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A' +
      '1-6466-400D-A8B7-0AE860FB164B}">lkpAlvara</CONSTANT>'#13#10'<CONSTANT ' +
      'TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="e' +
      'bfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="' +
      'FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpReque' +
      'rente</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fa' +
      'lse</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&' +
      '#x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormS' +
      'etRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"' +
      '  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpRequerente<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20;V' +
      'alor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponentVa' +
      'lue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE"  ' +
      'GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente" N' +
      'ULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkp' +
      'Requerente</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ></' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;' +
      'Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT T' +
      'YPE="Componente" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-' +
      '0AE860FB164B}">dtDataAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#24' +
      '3;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REA' +
      'LNAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="' +
      'Formul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-' +
      '0AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTANT>' +
      #13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-64' +
      '66-400D-A8B7-0AE860FB164B}">dtDataAquisicao</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSe' +
      'tVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  ' +
      'GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpFormaAquisica' +
      'o</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false<' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x20' +
      ';Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponent' +
      'Value">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE"' +
      '  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-6466' +
      '-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente"' +
      ' NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">l' +
      'kpFormaAquisicao</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cessi' +
      'on&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>fal' +
      'se</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;r' +
      'io</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x' +
      '20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR>Cession&#225;rio&#x20;(lkpCessionario)</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8' +
      'B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpCessionario</SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13 +
      #10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;(dtDataBaixa)</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataBaixa</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13 +
      #10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20' +
      ';de&#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B' +
      '7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;da&#x20;Baixa&#x20;' +
      '(dtDataBaixa)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCOD' +
      'E>dtDataBaixa</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2<' +
      '/ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<I' +
      'D>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkp' +
      'Alvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpA' +
      'lvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243' +
      ';gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cada' +
      'stro&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466' +
      '-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400' +
      'D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lk' +
      'pAlvara)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkp' +
      'Alvara</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Alvar&#225;&#x20;(lkpAlvara' +
      ')</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D9' +
      '0A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpAlvara<' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.3' +
      '3</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20;(lkpReque' +
      'rente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{' +
      '773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpRe' +
      'querente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#' +
      '243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIE' +
      'LDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCons' +
      't>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requerente&#x20' +
      ';(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIAL' +
      'CODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFu' +
      'nction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeC' +
      'omponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&#' +
      '231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{' +
      '773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D' +
      '90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<' +
      'TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Requere' +
      'nte&#x20;(lkpRequerente)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10 +
      '<SPECIALCODE>lkpRequerente</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisibl' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x2' +
      '0;de&#x20;Aquisi&#231;&#227;o&#x20;(dtDataAquisicao)</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D' +
      '-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>dtDataAquisicao</SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID' +
      '>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&' +
      '#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0A' +
      'E860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860' +
      'FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Comp' +
      'onente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;de&#x20;Aquisi&#231;&#2' +
      '27;o&#x20;(dtDataAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>dtDataAquisicao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TOb' +
      'jFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetV' +
      'isible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>For' +
      'ma&#x20;de&#x20;Aquisi&#231;&#227;o&#x20;(lkpFormaAquisicao)</VA' +
      'LOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<N' +
      'ULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6' +
      '466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquisic' +
      'ao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gi' +
      'co</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</' +
      'ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeComponentValue</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastr' +
      'o&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-40' +
      '0D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A' +
      '8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Forma&#x20;de&#x20;Aqui' +
      'si&#231;&#227;o&#x20;(lkpFormaAquisicao)</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860' +
      'FB164B}</GUID>'#13#10'<SPECIALCODE>lkpFormaAquisicao</SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALO' +
      'R></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine26: TFlowLine
    Left = 265
    Top = 93
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression25'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine31: TFlowLine
    Left = 265
    Top = 168
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
    InputNames = 'FlowExpression25'
    OutputNames = 'FlowExpression24'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowRemark1: TFlowRemark
    Left = 1082
    Top = 287
    Width = 307
    Height = 251
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
      'Tipos de Servi'#231'os:'#13#10#13#10'S = Transfer'#234'ncia de Alvar'#225' sem Substitui'#231 +
      #227'o de Ve'#237'culo;'#13#10'O = Outros;'#13#10'C = Transfer'#234'ncia de Alvar'#225' com Sub' +
      'stitui'#231#227'o de Ve'#237'culo;'#13#10'R = Reintegra'#231#227'o de Ve'#237'culos;'#13#10'B = Baixa ' +
      'de Ve'#237'culo;'#13#10'P = Transfer'#234'ncia de Propriedade de Ve'#237'culo.'
  end
  object FlowLine1: TFlowLine
    Left = 455
    Top = 17
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowSubRoutine2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression14: TFlowExpression
    Left = 1520
    Top = 768
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
    Description = 'Ocultar componente Cession'#225'rio(CPF)'
    Text = 'Mostrar Componente(Cession'#225'rio (lkpCessionarioCPF),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpCessionarioCPF</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>Cession&#2' +
      '25;rio&#x20;(lkpCessionarioCPF)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</' +
      'GUID>'#13#10'<SPECIALCODE>lkpCessionarioCPF</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>fa' +
      'lse</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GU' +
      'ID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression34: TFlowExpression
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
    InputNames = 'FlowLine28'
    OutputNames = 'FlowLine30'
    Description = 'Mostrar Tipo de Autorizat'#225'rio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Tipo de Autorizat'#225'rio (lkpTipoPe' +
      'rmissao),true),Definir Obrigatoriedade de Componente(Tipo de Aut' +
      'orizat'#225'rio (lkpTipoPermissao),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPerm' +
      'issao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tr' +
      'ue</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#' +
      'x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSe' +
      'tRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPermissa' +
      'o</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&' +
      '#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>7</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat&' +
      '#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}<' +
      '/GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>tr' +
      'ue</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression35: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine21'
    Description = 'Ocultar Tipo de Autorizat'#225'rio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Tipo de Autorizat'#225'rio (lkpTipoPe' +
      'rmissao),false),Definir Obrigatoriedade de Componente(Tipo de Au' +
      'torizat'#225'rio (lkpTipoPermissao),false),Alterar Valor do Component' +
      'e(Cadastro de Requerimento de Servi'#231'os,Tipo de Autorizat'#225'rio (lk' +
      'pTipoPermissao),))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPerm' +
      'issao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fa' +
      'lse</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&' +
      '#x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormS' +
      'etRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"' +
      '  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPermiss' +
      'ao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x2' +
      '0;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponen' +
      'tValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE' +
      '"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'lkpTipoPermissao</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&' +
      '#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<' +
      'NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>7</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat' +
      '&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>f' +
      'alse</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10 +
      '<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#22' +
      '5;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento' +
      '&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTip' +
      'oPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>' +
      'lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine17: TFlowLine
    Left = 75
    Top = 468
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowExpression35'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine28: TFlowLine
    Left = 265
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
    InputNames = 'FlowExpression18'
    OutputNames = 'FlowExpression34'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression36: TFlowExpression
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
    InputNames = 'FlowLine24'
    OutputNames = 'FlowLine33'
    Description = 'Mostrar Tipo de Autorizat'#225'rio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Tipo de Autorizat'#225'rio (lkpTipoPe' +
      'rmissao),true),Definir Obrigatoriedade de Componente(Tipo de Aut' +
      'orizat'#225'rio (lkpTipoPermissao),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPerm' +
      'issao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tr' +
      'ue</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#' +
      'x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSe' +
      'tRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPermissa' +
      'o</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&' +
      '#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>7</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat&' +
      '#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}<' +
      '/GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>tr' +
      'ue</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine24: TFlowLine
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
    InputNames = 'FlowExpression28'
    OutputNames = 'FlowExpression36'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression37: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine39'
    Description = 'Mostrar Tipo de Autorizat'#225'rio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Tipo de Autorizat'#225'rio (lkpTipoPe' +
      'rmissao),true),Definir Obrigatoriedade de Componente(Tipo de Aut' +
      'orizat'#225'rio (lkpTipoPermissao),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPerm' +
      'issao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >tr' +
      'ue</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&#' +
      'x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormSe' +
      'tRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE" ' +
      ' GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPermissa' +
      'o</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</' +
      'CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&' +
      '#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>7</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat&' +
      '#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}<' +
      '/GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjConst' +
      '>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>tr' +
      'ue</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine11: TFlowLine
    Left = 645
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowExpression37'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 835
    Top = 243
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
    InputNames = 'FlowExpression30'
    OutputNames = 'FlowExpression29'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression33: TFlowExpression
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine41'
    Description = 'Ocultar Tipo de Autorizat'#225'rio'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Tipo de Autorizat'#225'rio (lkpTipoPe' +
      'rmissao),false),Definir Obrigatoriedade de Componente(Tipo de Au' +
      'torizat'#225'rio (lkpTipoPermissao),false),Alterar Valor do Component' +
      'e(Cadastro de Requerimento de Servi'#231'os,Tipo de Autorizat'#225'rio (lk' +
      'pTipoPermissao),))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPerm' +
      'issao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fa' +
      'lse</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Definir&' +
      '#x20;Obrigatoriedade&#x20;de&#x20;Componente" REALNAME="ebfFormS' +
      'etRequired">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"' +
      '  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">lkpTipoPermiss' +
      'ao</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Alterar&#x2' +
      '0;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormChangeComponen' +
      'tValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Formul&#225;rio" NULL="FALSE' +
      '"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}</CONSTANT>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0AE860FB164B}">' +
      'lkpTipoPermissao</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&' +
      '#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-4' +
      '00D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTAN' +
      'T</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<' +
      'NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetRequired</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>7</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat' +
      '&#225;rio&#x20;(lkpTipoPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}' +
      '</GUID>'#13#10'<SPECIALCODE>lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>f' +
      'alse</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10 +
      '<TEXT>ebfFormChangeComponentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#22' +
      '5;rio</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>Cadastro&#x20;de&#x20;Requerimento' +
      '&#x20;de&#x20;Servi&#231;os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID' +
      '>'#13#10'<SPECIALCODE>{773D90A1-6466-400D-A8B7-0AE860FB164B}</SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10'<VALOR>Tipo&#x20;de&#x20;Autorizat&#225;rio&#x20;(lkpTip' +
      'oPermissao)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>' +
      'lkpTipoPermissao</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>1' +
      '2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine15: TFlowLine
    Left = 835
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
    InputNames = 'FlowExpression31'
    OutputNames = 'FlowExpression33'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression12: TFlowExpression
    Left = 210
    Top = 9
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
    OutputNames = 'FlowLine53'
    Description = 'ALTERAR TIPO NO CADASTRO'
    Text = 
      'Alterar Valor do Componente(Cadastro de Requerimento de Servi'#231'os' +
      ',GRE_TIPO_SERVICO (TMAKEREDIT),JSON - Obter Valor(@RetonoJSON,ti' +
      'poServico))'
    Expression = 
      '<FUNCTION NAME="Alterar&#x20;Valor&#x20;do&#x20;Componente" REAL' +
      'NAME="ebfFormChangeComponentValue">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="F' +
      'ormul&#225;rio" NULL="FALSE"  GUID = "{773D90A1-6466-400D-A8B7-0' +
      'AE860FB164B}">{773D90A1-6466-400D-A8B7-0AE860FB164B}</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{773D90A1-646' +
      '6-400D-A8B7-0AE860FB164B}">TMAKEREDIT</CONSTANT>'#13#10'<FUNCTION NAME' +
      '="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="RetonoJSON"/>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >tipoServico</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormChangeCompo' +
      'nentValue</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Formul&#225;rio</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<V' +
      'ALOR>Cadastro&#x20;de&#x20;Requerimento&#x20;de&#x20;Servi&#231;' +
      'os</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{773D' +
      '90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<SPECIALCODE>{773D90A1' +
      '-6466-400D-A8B7-0AE860FB164B}</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>GRE_TIPO_SE' +
      'RVICO&#x20;(TMAKEREDIT)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{773D90A1-6466-400D-A8B7-0AE860FB164B}</GUID>'#13#10'<' +
      'SPECIALCODE>TMAKEREDIT</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJs' +
      'on</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
      'RetonoJSON</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10'<VALOR>tipoServico</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 265
    Top = 18
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
    InputNames = 'FlowSubRoutine2'
    OutputNames = 'FlowExpression12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine53: TFlowLine
    Left = 75
    Top = 18
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
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowSubRoutine1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression15: TFlowExpression
    Left = 20
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
    InputNames = 'FlowLine21'
    OutputNames = 'FlowLine54'
    Description = 'Altera tamanho N Requerimento'
    Text = 
      'CSS - Definir Propriedade(HTML - Obter Elemento pelo ID(edtNumRe' +
      'querimento),width,CSS - Obter Propriedade(HTML - Obter Elemento ' +
      'pelo ID(edtObs),width))'
    Expression = 
      '<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNA' +
      'ME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >edtNumRequerimento</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssG' +
      'etStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20' +
      ';Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10 +
      '<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >edtObs</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineSt' +
      'yle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtml' +
      'GetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>edtNumRequerimento</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>edtObs</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<' +
      'ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine21: TFlowLine
    Left = 75
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
    InputNames = 'FlowExpression35'
    OutputNames = 'FlowExpression15'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine54: TFlowLine
    Left = 75
    Top = 618
    Width = 40
    Height = 189
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
    InputNames = 'FlowExpression15'
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression32: TFlowExpression
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
    InputNames = 'FlowLine41'
    OutputNames = 'FlowLine55'
    Description = 'Altera tamanho N Requerimento'
    Text = 
      'CSS - Definir Propriedade(HTML - Obter Elemento pelo ID(edtNumRe' +
      'querimento),width,CSS - Obter Propriedade(HTML - Obter Elemento ' +
      'pelo ID(edtObs),width))'
    Expression = 
      '<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNA' +
      'ME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >edtNumRequerimento</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssG' +
      'etStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20' +
      ';Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10 +
      '<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >edtObs</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineSt' +
      'yle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtml' +
      'GetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>edtNumRequerimento</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>edtObs</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<' +
      'ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine41: TFlowLine
    Left = 835
    Top = 468
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
    InputNames = 'FlowExpression33'
    OutputNames = 'FlowExpression32'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine55: TFlowLine
    Left = 835
    Top = 543
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
    InputNames = 'FlowExpression32'
    OutputNames = 'FlowEnd3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression38: TFlowExpression
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
    InputNames = 'FlowLine30'
    OutputNames = 'FlowLine56'
    Description = 'Altera tamanho N Requerimento'
    Text = 
      'CSS - Definir Propriedade(HTML - Obter Elemento pelo ID(edtNumRe' +
      'querimento),width,CSS - Obter Propriedade(HTML - Obter Elemento ' +
      'pelo ID(edtTaxa),width))'
    Expression = 
      '<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNA' +
      'ME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >edtNumRequerimento</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssG' +
      'etStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20' +
      ';Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10 +
      '<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >edtTaxa</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineSt' +
      'yle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtml' +
      'GetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>edtNumRequerimento</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>edtTaxa</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
      '<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine30: TFlowLine
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
    InputNames = 'FlowExpression34'
    OutputNames = 'FlowExpression38'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine56: TFlowLine
    Left = 265
    Top = 693
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
    InputNames = 'FlowExpression38'
    OutputNames = 'FlowEnd4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression39: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine33'
    OutputNames = 'FlowLine57'
    Description = 'Altera tamanho N Requerimento'
    Text = 
      'CSS - Definir Propriedade(HTML - Obter Elemento pelo ID(edtNumRe' +
      'querimento),width,CSS - Obter Propriedade(HTML - Obter Elemento ' +
      'pelo ID(edtTaxa),width))'
    Expression = 
      '<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNA' +
      'ME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >edtNumRequerimento</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssG' +
      'etStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20' +
      ';Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10 +
      '<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >edtTaxa</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineSt' +
      'yle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtml' +
      'GetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>edtNumRequerimento</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>edtTaxa</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
      '<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine33: TFlowLine
    Left = 455
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
    InputNames = 'FlowExpression36'
    OutputNames = 'FlowExpression39'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine57: TFlowLine
    Left = 455
    Top = 693
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
    InputNames = 'FlowExpression39'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression40: TFlowExpression
    Left = 590
    Top = 758
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
    InputNames = 'FlowLine39'
    OutputNames = 'FlowLine58'
    Description = 'Altera tamanho N Requerimento'
    Text = 
      'CSS - Definir Propriedade(HTML - Obter Elemento pelo ID(edtNumRe' +
      'querimento),width,CSS - Obter Propriedade(HTML - Obter Elemento ' +
      'pelo ID(edtTaxa),width))'
    Expression = 
      '<FUNCTION NAME="CSS&#x20;-&#x20;Definir&#x20;Propriedade" REALNA' +
      'ME="ebfHtmlCssDefineStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20' +
      ';-&#x20;Obter&#x20;Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtml' +
      'GetElementById">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '  >edtNumRequerimento</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >width</CONSTANT>'#13#10'<FUNCTION NAM' +
      'E="CSS&#x20;-&#x20;Obter&#x20;Propriedade" REALNAME="ebfHtmlCssG' +
      'etStyle">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="HTML&#x20;-&#x20;Obter&#x20' +
      ';Elemento&#x20;pelo&#x20;ID" REALNAME="ebfHtmlGetElementById">'#13#10 +
      '<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >edtTaxa</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >width</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtmlCssDefineSt' +
      'yle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfHtml' +
      'GetElementById</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<VALOR>edtNumRequerimento</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfHtmlCssGetStyle</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNC' +
      'TION</NOME>'#13#10'<TEXT>ebfHtmlGetElementById</TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>edtTaxa</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
      '<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>width</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine39: TFlowLine
    Left = 645
    Top = 693
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
    InputNames = 'FlowExpression37'
    OutputNames = 'FlowExpression40'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine58: TFlowLine
    Left = 645
    Top = 767
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
    InputNames = 'FlowExpression40'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

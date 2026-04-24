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
    InputParams = 
      'COD,Inteiro,,;STEC,Letras,50,;BRT,Letras,50,;STCO,Letras,50,;pLi' +
      'staSiglas,Inteiro,,'
    Variables = 'tabela,Tabela,,'
    WorkFormCod = -1
    WorkFormGUID = '{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}'
  end
  object FlowEnd2: TFlowEnd
    Left = 266
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine22;FlowLine4'
    Description = 'Fim'
  end
  object FlowExpression12: TFlowExpression
    Left = 400
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
    Description = 'Fechar Consulta'
    Text = 'Fechar Consulta(@tabela)'
    Expression = 
      '<FUNCTION NAME="Fechar&#x20;Consulta" REALNAME="ebfSQLClose">'#13#10'<' +
      'PARAMS>'#13#10'<VARIABLE NAME="tabela"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLClose</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVaria' +
      'ble>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine13;FlowLine14'
    Description = 'Sigla = STEC ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>pListaSigl' +
      'as</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TO' +
      'bjVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VA' +
      'LOR>4</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="pListaSiglas"/>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >4' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 111
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
  object FlowExpression5: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine2'
    Description = 'Ocultar Componente'
    Text = 'Mostrar Componente(alvar'#225' (TMAKERLOOKUP3),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}">TMAKERLOOKUP3</CONST' +
      'ANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>alvar&#225' +
      ';&#x20;(TMAKERLOOKUP3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}</GUID>'#13#10'<S' +
      'PECIALCODE>TMAKERLOOKUP3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
  end
  object FlowExpression6: TFlowExpression
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine3'
    Description = 'Mostrar Componente'
    Text = 'Mostrar Componente(alvar'#225' (TMAKERLOOKUP3),true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}">TMAKERLOOKUP3</CONST' +
      'ANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>alvar&#225' +
      ';&#x20;(TMAKERLOOKUP3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}</GUID>'#13#10'<S' +
      'PECIALCODE>TMAKERLOOKUP3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
  end
  object FlowLine13: TFlowLine
    Left = 340
    Top = 168
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
    OutputNames = 'FlowExpression5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 265
    Top = 198
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression6'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowDecision4: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine17;FlowLine18'
    Description = 'Sigla = STCO ? '
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprOr</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Function>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>pLis' +
      'taSiglas</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION' +
      '>'#13#10'<VALOR>3</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</' +
      'NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VA' +
      'RIABLE</NOME>'#13#10'<TEXT>pListaSiglas</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>6</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Ou" REALNAME="oprOr">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME=' +
      '"Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="pListaSig' +
      'las"/>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >3</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Igual" REALNAME="isEqual">' +
      #13#10'<PARAMS>'#13#10'<VARIABLE NAME="pListaSiglas"/>'#13#10'<CONSTANT TYPE="Int' +
      'eiro" NULL="FALSE"  >6</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression7: TFlowExpression
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
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine20'
    Description = 'Ocultar Componente'
    Text = 'Mostrar Componente(C'#243'd Autorizat'#225'rio (TMAKEREDIT3),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}">TMAKEREDIT3</CONSTAN' +
      'T>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>C&#243;d&#' +
      'x20;Autorizat&#225;rio&#x20;(TMAKEREDIT3)</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{B4BDE803-8AB8-4F09-A51E-3854A' +
      'D3B17FF}</GUID>'#13#10'<SPECIALCODE>TMAKEREDIT3</SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALO' +
      'R>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine17: TFlowLine
    Left = 530
    Top = 318
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression7'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression13: TFlowExpression
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
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine5'
    Description = 'Mostrar Componente'
    Text = 'Mostrar Componente(C'#243'd Autorizat'#225'rio (TMAKEREDIT3),true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}">TMAKEREDIT3</CONSTAN' +
      'T>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>C&#243;d&#' +
      'x20;Autorizat&#225;rio&#x20;(TMAKEREDIT3)</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{B4BDE803-8AB8-4F09-A51E-3854A' +
      'D3B17FF}</GUID>'#13#10'<SPECIALCODE>TMAKEREDIT3</SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALO' +
      'R>true</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine18: TFlowLine
    Left = 455
    Top = 348
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression13'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowConnector1: TFlowConnector
    Left = 650
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
    InputNames = 'FlowLine20;FlowLine6'
    OutputNames = 'FlowLine21'
  end
  object FlowLine20: TFlowLine
    Left = 645
    Top = 346
    Width = 40
    Height = 146
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
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector2: TFlowConnector
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
    InputNames = 'FlowLine21'
    OutputNames = 'FlowLine22'
  end
  object FlowLine21: TFlowLine
    Left = 645
    Top = 482
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
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine22: TFlowLine
    Left = 284
    Top = 543
    Width = 386
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
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine2: TFlowLine
    Left = 455
    Top = 196
    Width = 40
    Height = 132
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowDecision4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression14: TFlowExpression
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
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine4'
    Description = 'Ocultar Componente'
    Text = 'Mostrar Componente(C'#243'd Autorizat'#225'rio (TMAKEREDIT3),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}">TMAKEREDIT3</CONSTAN' +
      'T>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>C&#243;d&#' +
      'x20;Autorizat&#225;rio&#x20;(TMAKEREDIT3)</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{B4BDE803-8AB8-4F09-A51E-3854A' +
      'D3B17FF}</GUID>'#13#10'<SPECIALCODE>TMAKEREDIT3</SPECIALCODE>'#13#10'</TObjC' +
      'onst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALO' +
      'R>false</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine3: TFlowLine
    Left = 265
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression14'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 265
    Top = 318
    Width = 40
    Height = 264
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression14'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression1: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = 'Ocultar Componente'
    Text = 'Mostrar Componente(alvar'#225' (TMAKERLOOKUP3),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}">TMAKERLOOKUP3</CONST' +
      'ANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>alvar&#225' +
      ';&#x20;(TMAKERLOOKUP3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{B4BDE803-8AB8-4F09-A51E-3854AD3B17FF}</GUID>'#13#10'<S' +
      'PECIALCODE>TMAKERLOOKUP3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 455
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 530
    Top = 468
    Width = 140
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
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
end

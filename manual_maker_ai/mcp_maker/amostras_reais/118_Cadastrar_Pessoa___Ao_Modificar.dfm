object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 836
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
    InputParams = 'TipoEntidade,Letras,50,'
    WorkFormCod = -1
    WorkFormGUID = '{3A21ED85-EF49-4216-8A0D-63E780825C1B}'
  end
  object FlowDecision1: TFlowDecision
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine2;FlowLine5'
    Description = 'PJ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>TipoEntida' +
      'de</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'</TOb' +
      'jVariable>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.23</MKR_VERSION>'#13#10'<VALO' +
      'R>PJ</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></G' +
      'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="TipoEntidade"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >PJ' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowEnd2: TFlowEnd
    Left = 836
    Top = 468
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
    InputNames = 'FlowLine8;FlowLine13'
    Description = 'Fim'
  end
  object FlowExpression3: TFlowExpression
    Left = 1160
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine3'
    Description = 'Oculta PF'
    Text = 'Mostrar Componente( (MakerDetailPanel1),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">MakerDetailPanel1</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(Mak' +
      'erDetailPanel1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>MakerDetailPanel1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowExpression5: TFlowExpression
    Left = 1160
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
    OutputNames = 'FlowLine4'
    Description = 'Mostra PJ'
    Text = 'Mostrar Componente( (TMAKERDETAILPANEL),true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">TMAKERDETAILPANEL</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(TMA' +
      'KERDETAILPANEL)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>TMAKERDETAILPANEL</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowExpression8: TFlowExpression
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
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine6'
    Description = 'Mostra PF'
    Text = 'Mostrar Componente( (MakerDetailPanel1),true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">MakerDetailPanel1</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(Mak' +
      'erDetailPanel1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>MakerDetailPanel1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 835
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
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression1: TFlowExpression
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
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine9'
    Description = 'Ocultar Representantes'
    Text = 'Mostrar Aba(Representantes,false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Aba" REALNAME="ebfFormShowTab">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Representantes</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormShowTab</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Representantes</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression2: TFlowExpression
    Left = 1160
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
    OutputNames = 'FlowLine10'
    Description = 'Mostrar Representantes'
    Text = 'Mostrar Aba(Representantes,true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Aba" REALNAME="ebfFormShowTab">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Representantes</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormShowTab</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Representantes</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression4: TFlowExpression
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine11'
    Description = 'Mostrar Anexos / Observa'#231#245'es'
    Text = 'Mostrar Aba(Anexos / Observa'#231#245'es,true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Aba" REALNAME="ebfFormShowTab">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Anexos&#x20;/&#x2' +
      '0;Observa&#231;&#245;es</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico"' +
      ' NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormShowTab</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Anexos&#x20;/&#x2' +
      '0;Observa&#231;&#245;es</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>t' +
      'rue</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GU' +
      'ID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine9: TFlowLine
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression6: TFlowExpression
    Left = 1160
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
    OutputNames = 'FlowLine12'
    Description = 'Mostrar Anexos / Observa'#231#245'es'
    Text = 'Mostrar Aba(Anexos / Observa'#231#245'es,true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Aba" REALNAME="ebfFormShowTab">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Anexos&#x20;/&#x2' +
      '0;Observa&#231;&#245;es</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico"' +
      ' NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormShowTab</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Anexos&#x20;/&#x2' +
      '0;Observa&#231;&#245;es</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>t' +
      'rue</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GU' +
      'ID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine10: TFlowLine
    Left = 1215
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression7: TFlowExpression
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
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine13'
    Description = 'Ocultar Dados Complementares'
    Text = 'Mostrar Aba(Dados Complementares,false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Aba" REALNAME="ebfFormShowTab">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Dados&#x20;Comple' +
      'mentares</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  ' +
      '>false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormShowTab</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Dados&#x20;Comple' +
      'mentares</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>' +
      #13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'ROOT>'#13#10
  end
  object FlowLine12: TFlowLine
    Left = 1025
    Top = 468
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression10: TFlowExpression
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine8'
    Description = 'Mostrar Dados Complementares'
    Text = 'Mostrar Aba(Dados Complementares,true)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Aba" REALNAME="ebfFormShowTab">'#13#10'<P' +
      'ARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Dados&#x20;Comple' +
      'mentares</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  ' +
      '>true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormShowTab</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>Dados&#x20;Comple' +
      'mentares</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>' +
      #13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</R' +
      'OOT>'#13#10
  end
  object FlowLine11: TFlowLine
    Left = 455
    Top = 468
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression11: TFlowExpression
    Left = 970
    Top = 84
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
    OutputNames = 'FlowLine15'
    Description = 'Desabilitar  PF'
    Text = 'Habilitar Componente( (MakerDetailPanel1),false)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">MakerDetailPanel1<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(Mak' +
      'erDetailPanel1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>MakerDetailPanel1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowLine2: TFlowLine
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression11'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression13: TFlowExpression
    Left = 590
    Top = 84
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
    OutputNames = 'FlowLine14'
    Description = 'Desabilitar PJ'
    Text = 'Habilitar Componente( (TMAKERDETAILPANEL),false)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">TMAKERDETAILPANEL<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(TMA' +
      'KERDETAILPANEL)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>TMAKERDETAILPANEL</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowExpression12: TFlowExpression
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine16'
    Description = 'Ocultar PJ'
    Text = 'Mostrar Componente( (TMAKERDETAILPANEL),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">TMAKERDETAILPANEL</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(TMA' +
      'KERDETAILPANEL)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>TMAKERDETAILPANEL</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
      'OT>'#13#10
  end
  object FlowLine16: TFlowLine
    Left = 455
    Top = 196
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
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine7'
    Description = 'Habilitar PF'
    Text = 'Habilitar Componente( (MakerDetailPanel1),true)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">MakerDetailPanel1<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(Mak' +
      'erDetailPanel1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>MakerDetailPanel1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowLine6: TFlowLine
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine5: TFlowLine
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
    OutputNames = 'FlowExpression13'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 645
    Top = 467
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine13: TFlowLine
    Left = 835
    Top = 467
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
    Left = 1215
    Top = 196
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression14: TFlowExpression
    Left = 1160
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine18'
    Description = 'Habilitar PJ'
    Text = 'Habilitar Componente( (TMAKERDETAILPANEL),true)'
    Expression = 
      '<FUNCTION NAME="Habilitar&#x20;Componente" REALNAME="ebfFormSetE' +
      'nabled">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{3A21ED85-EF49-4216-8A0D-63E780825C1B}">TMAKERDETAILPANEL<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetEnabled<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;(TMA' +
      'KERDETAILPANEL)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{3A21ED85-EF49-4216-8A0D-63E780825C1B}</GUID>'#13#10'<SPECIALC' +
      'ODE>TMAKERDETAILPANEL</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROO' +
      'T>'#13#10
  end
  object FlowLine4: TFlowLine
    Left = 1215
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowExpression14'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine18: TFlowLine
    Left = 1215
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
    InputNames = 'FlowExpression14'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 455
    Top = 93
    Width = 230
    Height = 115
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowExpression12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine2: TFlowSubRoutine
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
    ShowHint = True
    ChangeDescription = False
    Description = 'Limpar Campos - Pessoa juridica'
    Id = 190
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
    ObjectName = 'Limpar Campos - Pessoa juridica'
    RealName = 'CALLRULE'
  end
  object FlowLine15: TFlowLine
    Left = 1025
    Top = 93
    Width = 230
    Height = 115
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 1160
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
    ChangeDescription = False
    Description = 'Limpar Campos - Pessoa fisica'
    Id = 188
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
    ObjectName = 'Limpar Campos - Pessoa fisica'
    RealName = 'CALLRULE'
  end
end

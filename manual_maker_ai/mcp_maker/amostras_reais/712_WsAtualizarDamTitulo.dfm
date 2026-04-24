object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 646
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
    OutputNames = 'FlowLine1'
    Description = 'Inicio'
    InputParams = 
      'ID,Inteiro,,;TOKEN,Letras,50,;PES_COD_SOLICITANTE,Inteiro,,;FONT' +
      'E,Letras,50,'
    Variables = 
      'Tabela,Tabela,,;tabela config,Tabela,,;Retorno Ws,Letras,50,;Jso' +
      'n Retorno,Variante,,;retorno,Letras,50,;json,Variante,,;Json DAM' +
      ',Letras,50,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 1026
    Top = 1068
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
    InputNames = 'FlowLine22'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
      'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno&#x20;Ws</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVari' +
      'able>'#13#10'</ROOT>'#13#10
    Expression = '<VARIABLE NAME="Retorno&#x20;Ws"/>'
    Text = '@Retorno Ws'
    OutPutParam = 'Letras,50  '
  end
  object FlowExpression6: TFlowExpression
    Left = 970
    Top = 909
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
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine17'
    Description = 'retorno sucesso'
    Text = 
      'Concatena'#231#227'o({"status":"OK",'#10'"mensagem":"Sucesso",'#10'"result":,JSO' +
      'N - Obter Valor(@Json Retorno,result),, "link_pdf":",URL - Codif' +
      'icar(JSON - Obter Valor(@json,result),UTF-8),", "url_pdf":",URL ' +
      '- Codificar(JSON - Obter Valor(@json,file),UTF-8),","DAM_COD_BAR' +
      'RA":",Campo(Abrir Consulta(SQL CONSULTA,),DAM_COD_BARRA),", "fil' +
      'e_jpg":",URL - Codificar(JSON - Obter Valor(@json,file_jpg),UTF-' +
      '8),"})'
    ReturnVar = 'Retorno Ws'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;status&qu' +
      'ot;:&quot;OK&quot;,'#13#10'&quot;mensagem&quot;:&quot;Sucesso&quot;,'#13#10 +
      '&quot;result&quot;:</CONSTANT>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20' +
      ';Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10 +
      '<VARIABLE NAME="Json&#x20;Retorno"/>'#13#10'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE"  >result</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  >,&#x20;&quot;link_pdf&quot;:&quot' +
      ';</CONSTANT>'#13#10'<FUNCTION NAME="URL&#x20;-&#x20;Codificar" REALNAM' +
      'E="ebfURLEncoder">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;O' +
      'bter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<V' +
      'ARIABLE NAME="json"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >re' +
      'sult</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE"  >UTF-8</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE"  >&quot;,&#x20;&quot;url_pdf&quot' +
      ';:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="URL&#x20;-&#x20;Codificar" ' +
      'REALNAME="ebfURLEncoder">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="JSON&#x20;-' +
      '&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARA' +
      'MS>'#13#10'<VARIABLE NAME="json"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALS' +
      'E"  >file</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Le' +
      'tras" NULL="FALSE"  >UTF-8</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,&quot;DAM_COD_BARRA' +
      '&quot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQ' +
      'LField">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Abrir&#x20;Consulta" REALNAM' +
      'E="ebfSQLExecuteQuery">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Cons' +
      'ulta" NULL="FALSE"  ><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;VS_G' +
      'ER_TITULO.TTL_COD,'#13#10'&#x20;&#x20;VS_GER_TITULO.DAM_COD_BARRA'#13#10'Fro' +
      'm'#13#10'&#x20;&#x20;VS_GER_TITULO'#13#10'Where'#13#10'&#x20;&#x20;VS_GER_TITULO.T' +
      'TL_COD&#x20;=&#x20;:t'#13#10#13#10'/*WHERE_ADD*/'#13#10'Order&#x20;By'#13#10'&#x20;&#x' +
      '20;VS_GER_TITULO.TTL_COD'#13#10#13#10'/*ORDER_ADD*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13 +
      #10'<DEFINE NAME="t">'#13#10'<VARIABLE NAME="ID"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13 +
      #10'</PSQL>'#13#10'</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Campo" NULL="F' +
      'ALSE" INDEX = "1" >DAM_COD_BARRA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,&#x20;&quot;f' +
      'ile_jpg&quot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="URL&#x20;-&#x20' +
      ';Codificar" REALNAME="ebfURLEncoder">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME=' +
      '"JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJ' +
      'son">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="json"/>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE"  >file_jpg</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE"  >UTF-8</CONSTANT>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;}</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>{&quot;status&qu' +
      'ot;:&quot;OK&quot;,'#13#10'&quot;mensagem&quot;:&quot;Sucesso&quot;,'#13#10 +
      '&quot;result&quot;:</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetV' +
      'alueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>Json&#x20;Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Var' +
      'iante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.17</MKR_VERSION>'#13#10'<VALOR>result</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>,&#x20;&quot;link_pdf&quot;:&' +
      'quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>' +
      #13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfURLEncoder</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Function>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueO' +
      'bjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCO' +
      'MPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION' +
      '>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13 +
      #10'<TEXT>json</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERS' +
      'ION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>12</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VER' +
      'SION>'#13#10'<VALOR>result</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>13</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'<VALOR>UTF-8</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</F' +
      'IELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCo' +
      'nst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.1' +
      '7</MKR_VERSION>'#13#10'<VALOR>&quot;,&#x20;&quot;url_pdf&quot;:&quot;<' +
      '/VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13 +
      #10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>' +
      '9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfURLEncoder</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJ' +
      'son</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
      'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>14</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT' +
      '>json</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10 +
      '</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10 +
      '<VALOR>file</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION' +
      '>'#13#10'<VALOR>UTF-8</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VER' +
      'SION>'#13#10'<VALOR>&quot;,&quot;DAM_COD_BARRA&quot;:&quot;</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<N' +
      'OME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6<' +
      '/ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR><PSQL>'#13 +
      #10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD,'#13#10'&#x20;&#' +
      'x20;VS_GER_TITULO.DAM_COD_BARRA'#13#10'From'#13#10'&#x20;&#x20;VS_GER_TITULO' +
      #13#10'Where'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;:t'#13#10#13#10'/*W' +
      'HERE_ADD*/'#13#10'Order&#x20;By'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD'#13#10#13#10 +
      '/*ORDER_ADD*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="t">'#13#10'<VARIABL' +
      'E NAME="ID"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmN' +
      'vZGluZz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8U1FMPg0KU2VsZWN0DQomI3g' +
      'yMDsmI3gyMDtWU19HRVJfVElUVUxPLlRUTF9DT0QsDQomI3gyMDsmI3gyMDtWU19' +
      'HRVJfVElUVUxPLkRBTV9DT0RfQkFSUkENCkZyb20NCiYjeDIwOyYjeDIwO1ZTX0d' +
      'FUl9USVRVTE8NCldoZXJlDQomI3gyMDsmI3gyMDtWU19HRVJfVElUVUxPLlRUTF9' +
      'DT0QmI3gyMDs9JiN4MjA7OnQNCi8qV0hFUkVfQUREKi8NCk9yZGVyJiN4MjA7Qnk' +
      'NCiYjeDIwOyYjeDIwO1ZTX0dFUl9USVRVTE8uVFRMX0NPRA0KLypPUkRFUl9BREQ' +
      'qLw0KPC9TUUw+DQoNCjxQQVJBTVM+DQo8REVGSU5FIE5BTUU9InQiPg0KPFZBTFV' +
      'FPg0KQElEDQo8L1ZBTFVFPg0KPERJQUdSQU1YTUw+DQpQRDk0Yld3Z2RtVnljMmx' +
      '2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2drOFZFOWlhbFpoY21saFlteGxQZzB' +
      'LQ1FrOFNVUStNVHd2U1VRK0RRb0pDVHhPVDAxRlBsWkJVa2xCUWt4RlBDOU9UMDF' +
      'GUGcwS0NRazhWRVZZVkQ1SlJEd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd' +
      '2VTFGTVBnMEtDUWs4VkVsUVR6NUpiblJsYVhKdlBDOVVTVkJQUGcwS0NRazhTVTV' +
      'EVDAxUVFWUkpWa1ZNUGxSU1ZVVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna0pQRTF' +
      'MVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5DZ2s' +
      '4TDFSUFltcFdZWEpwWVdKc1pUNE5Dand2VWs5UFZENE5DZz09DQo8L0RJQUdSQU1' +
      'YTUw+DQo8RVhQUkVTU0lPTj4NClBGWkJVa2xCUWt4RklFNUJUVVU5SWtsRUlpOCs' +
      'NCjwvRVhQUkVTU0lPTj4NCjwvREVGSU5FPg0KPC9QQVJBTVM+DQo8L1JPT1Q+DQo' +
      '=</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>DAM_COD_BARRA</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&quot;,' +
      '&#x20;&quot;file_jpg&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10 +
      '</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13 +
      #10'<TEXT>ebfURLEncoder</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</' +
      'ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>json</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<' +
      'ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>file_jpg</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>UTF-8</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&quot;}</VALO' +
      'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
      'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression5: TFlowExpression
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
    InputNames = 'FlowLine40'
    OutputNames = 'FlowLine2'
    Description = 'Tabela Titulos'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'Tabela'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuer' +
      'y">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ' +
      '><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD,'#13#10 +
      '&#x20;&#x20;VS_GER_TITULO.TTL_N_PARCELA,'#13#10'&#x20;&#x20;VS_GER_TIT' +
      'ULO.TTL_VALOR_BASE,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_DATA_VENCIMEN' +
      'TO,'#13#10'&#x20;&#x20;VS_GER_TITULO.GRE_COD,'#13#10'&#x20;&#x20;VS_GER_TITU' +
      'LO.PES_COD,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_TAG,'#13#10'&#x20;&#x20;VS_' +
      'GER_TITULO.TTL_VALOR_TITULO,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_SITU' +
      'ACAO,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_SITUACAO_LEGENDA,'#13#10'&#x20;&#' +
      'x20;Convert(VARCHAR(16),GetDate()&#x20;+&#x20;1,23)&#x20;As&#x20' +
      ';NOVO_VENCIMENTO,'#13#10'&#x20;&#x20;VS_GER_TITULO.DAM_COD'#13#10'From'#13#10'&#x2' +
      '0;&#x20;VS_GER_TITULO'#13#10'Where'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD&' +
      '#x20;=&#x20;:t'#13#10#13#10'/*WHERE_ADD*/'#13#10'Order&#x20;By'#13#10'&#x20;&#x20;VS_G' +
      'ER_TITULO.TTL_COD'#13#10#13#10'/*ORDER_ADD*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFIN' +
      'E NAME="t">'#13#10'<VARIABLE NAME="ID"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL' +
      '>'#13#10'</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VA' +
      'LOR><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD' +
      ','#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_N_PARCELA,'#13#10'&#x20;&#x20;VS_GER_' +
      'TITULO.TTL_VALOR_BASE,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_DATA_VENCI' +
      'MENTO,'#13#10'&#x20;&#x20;VS_GER_TITULO.GRE_COD,'#13#10'&#x20;&#x20;VS_GER_T' +
      'ITULO.PES_COD,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_TAG,'#13#10'&#x20;&#x20;' +
      'VS_GER_TITULO.TTL_VALOR_TITULO,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_S' +
      'ITUACAO,'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_SITUACAO_LEGENDA,'#13#10'&#x20' +
      ';&#x20;Convert(VARCHAR(16),GetDate()&#x20;+&#x20;1,23)&#x20;As&#' +
      'x20;NOVO_VENCIMENTO,'#13#10'&#x20;&#x20;VS_GER_TITULO.DAM_COD'#13#10'From'#13#10'&' +
      '#x20;&#x20;VS_GER_TITULO'#13#10'Where'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_C' +
      'OD&#x20;=&#x20;:t'#13#10#13#10'/*WHERE_ADD*/'#13#10'Order&#x20;By'#13#10'&#x20;&#x20;V' +
      'S_GER_TITULO.TTL_COD'#13#10#13#10'/*ORDER_ADD*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DE' +
      'FINE NAME="t">'#13#10'<VARIABLE NAME="ID"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</P' +
      'SQL>'#13#10'</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWw' +
      'gdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo' +
      '8U1FMPg0KU2VsZWN0DQomI3gyMDsmI3gyMDtWU19HRVJfVElUVUxPLlRUTF9DT0Q' +
      'sDQomI3gyMDsmI3gyMDtWU19HRVJfVElUVUxPLlRUTF9OX1BBUkNFTEEsDQomI3g' +
      'yMDsmI3gyMDtWU19HRVJfVElUVUxPLlRUTF9WQUxPUl9CQVNFLA0KJiN4MjA7JiN' +
      '4MjA7VlNfR0VSX1RJVFVMTy5UVExfREFUQV9WRU5DSU1FTlRPLA0KJiN4MjA7JiN' +
      '4MjA7VlNfR0VSX1RJVFVMTy5HUkVfQ09ELA0KJiN4MjA7JiN4MjA7VlNfR0VSX1R' +
      'JVFVMTy5QRVNfQ09ELA0KJiN4MjA7JiN4MjA7VlNfR0VSX1RJVFVMTy5UVExfVEF' +
      'HLA0KJiN4MjA7JiN4MjA7VlNfR0VSX1RJVFVMTy5UVExfVkFMT1JfVElUVUxPLA0' +
      'KJiN4MjA7JiN4MjA7VlNfR0VSX1RJVFVMTy5UVExfU0lUVUFDQU8sDQomI3gyMDs' +
      'mI3gyMDtWU19HRVJfVElUVUxPLlRUTF9TSVRVQUNBT19MRUdFTkRBLA0KJiN4MjA' +
      '7JiN4MjA7Q29udmVydChWQVJDSEFSKDE2KSxHZXREYXRlKCkmI3gyMDsrJiN4MjA' +
      '7MSwyMykmI3gyMDtBcyYjeDIwO05PVk9fVkVOQ0lNRU5UTywNCiYjeDIwOyYjeDI' +
      'wO1ZTX0dFUl9USVRVTE8uREFNX0NPRA0KRnJvbQ0KJiN4MjA7JiN4MjA7VlNfR0V' +
      'SX1RJVFVMTw0KV2hlcmUNCiYjeDIwOyYjeDIwO1ZTX0dFUl9USVRVTE8uVFRMX0N' +
      'PRCYjeDIwOz0mI3gyMDs6dA0KLypXSEVSRV9BREQqLw0KT3JkZXImI3gyMDtCeQ0' +
      'KJiN4MjA7JiN4MjA7VlNfR0VSX1RJVFVMTy5UVExfQ09EDQovKk9SREVSX0FERCo' +
      'vDQo8L1NRTD4NCg0KPFBBUkFNUz4NCjxERUZJTkUgTkFNRT0idCI+DQo8VkFMVUU' +
      '+DQpASUQNCjwvVkFMVUU+DQo8RElBR1JBTVhNTD4NClBEOTRiV3dnZG1WeWMybHZ' +
      'iajBpTVM0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFsWmhjbWxoWW14bFBnMEt' +
      'DUWs4U1VRK01Ud3ZTVVErRFFvSkNUeE9UMDFGUGxaQlVrbEJRa3hGUEM5T1QwMUZ' +
      'QZzBLQ1FrOFZFVllWRDVKUkR3dlZFVllWRDROQ2drSlBGTlJURDVHUVV4VFJUd3Z' +
      'VMUZNUGcwS0NRazhWRWxRVHo1SmJuUmxhWEp2UEM5VVNWQlBQZzBLQ1FrOFNVNUR' +
      'UMDFRUVZSSlZrVk1QbFJTVlVVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2drSlBFMUx' +
      'VbDlXUlZKVFNVOU9QakV1TWk0d0xqYzFQQzlOUzFKZlZrVlNVMGxQVGo0TkNnazh' +
      'MMVJQWW1wV1lYSnBZV0pzWlQ0TkNqd3ZVazlQVkQ0TkNnPT0NCjwvRElBR1JBTVh' +
      'NTD4NCjxFWFBSRVNTSU9OPg0KUEZaQlVrbEJRa3hGSUU1QlRVVTlJa2xFSWk4Kw0' +
      'KPC9FWFBSRVNTSU9OPg0KPC9ERUZJTkU+DQo8L1BBUkFNUz4NCjwvUk9PVD4NCg=' +
      '=</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Const>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>' +
      #13#10
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 970
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
    ChangeDescription = False
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine11'
    Description = 'GerarDAM'
    Id = 616
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'Comando'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Json DAM</TEXT>'#13#10#9#9'<SQL>FALSE</SQ' +
          'L>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
          #10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT' +
          '>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'Comando'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="Json DAM"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'Comando'
        ParamType = ptInput
        Value = '@json DAM'
      end>
    Return = 'Retorno Ws'
    ObjectName = 'GerarDAM'
    RealName = 'CALLRULE'
  end
  object FlowDecision2: TFlowDecision
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3;FlowLine4'
    Description = 'Existem Registros?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLEOF</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVar' +
      'iable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Tab' +
      'ela</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">'#13#10#9#9'<PA' +
      'RAMS>'#13#10#9#9#9'<VARIABLE NAME="Tabela"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
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
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine5'
    Description = 'Json Retorno'
    Text = 'JSON - Criar objeto(@Retorno Ws)'
    ReturnVar = 'Json Retorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Retorno Ws"/>'#13#10#9#9'</PARAMS>' +
      #13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9'<TEXT>Retorno Ws</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letr' +
      'as</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</' +
      'TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression22: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine38'
    OutputNames = 'FlowLine10'
    Description = 'Json DAM'
    Text = 
      'Concatena'#231#227'o({'#10'"DAM_IDPS":",Campo(@tabela config,CFG_DAM_IDPS),"' +
      ', "DAM_ID_VAL_REF":",Campo(@tabela config,CFG_DAM_ID_VAL_REF),",' +
      ' "DAM_VALOR":",Subsequ'#234'ncia Invertida(Concatena'#231#227'o(0000000000000' +
      '00000,Trocar Todas as Subseq'#252#234'ncias(Trocar Todas as Subseq'#252#234'ncia' +
      's(Para Letras(Formatar N'#250'mero(Arredondar Casas Decimais(Campo(@T' +
      'abela,TTL_VALOR_TITULO),2,false),#,##0.00)),.,),,,)),11),",'#10'"DAM' +
      '_ID_PREF":",Campo(@tabela config,CFG_DAM_ID_PREF),",'#10'"DAM_VENCIM' +
      'ENTO":",Concatena'#231#227'o(Ano(Campo(@Tabela,NOVO_VENCIMENTO)),Complet' +
      'ar '#224' esquerda(M'#234's(Campo(@Tabela,NOVO_VENCIMENTO)),2,0),Completar' +
      ' '#224' esquerda(Dia(Campo(@Tabela,NOVO_VENCIMENTO)),2,0)),",'#10'"DAM_CO' +
      'D_RECEITA":",Campo(@tabela config,CFG_DAM_COD_RECEITA),",'#10'"DAM_T' +
      'IPO_LANCAMENTO":",Campo(@tabela config,CFG_DAM_TIPO_LANCAMENTO),' +
      '",'#10'"DAM_ED":",Subsequ'#234'ncia Invertida(Ano(Campo(@Tabela,NOVO_VENC' +
      'IMENTO)),2),",'#10'"DAM_NOSSO_NUMERO":",Subsequ'#234'ncia Invertida(Conca' +
      'tena'#231#227'o(000000000000000000,Campo(@Tabela,TTL_COD)),11),",'#10'"TTL_C' +
      'OD":,Campo(@Tabela,TTL_COD),})'
    ReturnVar = 'Json DAM'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{'#13#10'&quot;DAM_IDP' +
      'S&quot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfS' +
      'QLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;config"/>'#13#10'<CON' +
      'STANT TYPE="Campo" NULL="FALSE" INDEX = "7" >CFG_DAM_IDPS</CONST' +
      'ANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALS' +
      'E"  >&quot;,&#x20;&quot;DAM_ID_VAL_REF&quot;:&quot;</CONSTANT>'#13#10 +
      '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIA' +
      'BLE NAME="tabela&#x20;config"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FA' +
      'LSE" INDEX = "8" >CFG_DAM_ID_VAL_REF</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,&#x20;&qu' +
      'ot;DAM_VALOR&quot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Subsequ&#2' +
      '34;ncia&#x20;Invertida" REALNAME="ebfSubstringInverse">'#13#10'<PARAMS' +
      '>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">' +
      #13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >0000000000000' +
      '00000</CONSTANT>'#13#10'<FUNCTION NAME="Trocar&#x20;Todas&#x20;as&#x20' +
      ';Subseq&#252;&#234;ncias" REALNAME="ebfReplaceAll">'#13#10'<PARAMS>'#13#10'<' +
      'FUNCTION NAME="Trocar&#x20;Todas&#x20;as&#x20;Subseq&#252;&#234;' +
      'ncias" REALNAME="ebfReplaceAll">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Para' +
      '&#x20;Letras" REALNAME="toString">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Fo' +
      'rmatar&#x20;N&#250;mero" REALNAME="ebfFormatNumber">'#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="Arredondar&#x20;Casas&#x20;Decimais" REALNAME="e' +
      'bfArredondaDecimal">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Campo" REALNAME=' +
      '"ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT T' +
      'YPE="Campo" NULL="FALSE" INDEX = "7" >TTL_VALOR_TITULO</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"' +
      '  >2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fal' +
      'se</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE"  >#,##0.00</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >.</CON' +
      'STANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >,</CO' +
      'NSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ></CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Int' +
      'eiro" NULL="FALSE"  >11</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >&quot;,'#13#10'&quot;DAM_ID_PREF&qu' +
      'ot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLFi' +
      'eld">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;config"/>'#13#10'<CONSTAN' +
      'T TYPE="Campo" NULL="FALSE" INDEX = "4" >CFG_DAM_ID_PREF</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >&quot;,'#13#10'&quot;DAM_VENCIMENTO&quot;:&quot;</CONSTANT>'#13#10'<FUNC' +
      'TION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<PARAM' +
      'S>'#13#10'<FUNCTION NAME="Ano" REALNAME="ebfDateYear">'#13#10'<PARAMS>'#13#10'<FUN' +
      'CTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "10' +
      '" >NOVO_VENCIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>' +
      #13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Completar&#x20;&#224;&#x20;esquer' +
      'da" REALNAME="ebfConcatLeft">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="M&#234;' +
      's" REALNAME="ebfDateMonth">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Campo" RE' +
      'ALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CON' +
      'STANT TYPE="Campo" NULL="FALSE" INDEX = "10" >NOVO_VENCIMENTO</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONST' +
      'ANT TYPE="Inteiro" NULL="FALSE"  >2</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'Letras" NULL="FALSE"  >0</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FU' +
      'NCTION NAME="Completar&#x20;&#224;&#x20;esquerda" REALNAME="ebfC' +
      'oncatLeft">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Dia" REALNAME="ebfDateDay' +
      '">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<P' +
      'ARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="' +
      'FALSE" INDEX = "10" >NOVO_VENCIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
      'NCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="' +
      'FALSE"  >2</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >0<' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CON' +
      'STANT TYPE="Letras" NULL="FALSE"  >&quot;,'#13#10'&quot;DAM_COD_RECEIT' +
      'A&quot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfS' +
      'QLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;config"/>'#13#10'<CON' +
      'STANT TYPE="Campo" NULL="FALSE" INDEX = "5" >CFG_DAM_COD_RECEITA' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE"  >&quot;,'#13#10'&quot;DAM_TIPO_LANCAMENTO&quot;:&quot;</CON' +
      'STANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>' +
      #13#10'<VARIABLE NAME="tabela&#x20;config"/>'#13#10'<CONSTANT TYPE="Campo" ' +
      'NULL="FALSE" INDEX = "6" >CFG_DAM_TIPO_LANCAMENTO</CONSTANT>'#13#10'</' +
      'PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&qu' +
      'ot;,'#13#10'&quot;DAM_ED&quot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Subs' +
      'equ&#234;ncia&#x20;Invertida" REALNAME="ebfSubstringInverse">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Ano" REALNAME="ebfDateYear">'#13#10'<PARAMS>'#13 +
      #10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARI' +
      'ABLE NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX ' +
      '= "10" >NOVO_VENCIMENTO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >2</C' +
      'ONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >&quot;,'#13#10'&quot;DAM_NOSSO_NUMERO&quot;:&quot;</CONSTANT>' +
      #13#10'<FUNCTION NAME="Subsequ&#234;ncia&#x20;Invertida" REALNAME="eb' +
      'fSubstringInverse">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Concatena&#231;&#' +
      '227;o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" ' +
      'NULL="FALSE"  >000000000000000000</CONSTANT>'#13#10'<FUNCTION NAME="Ca' +
      'mpo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/' +
      '>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "0" >TTL_COD</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTAN' +
      'T TYPE="Inteiro" NULL="FALSE"  >11</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNC' +
      'TION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,'#13#10'&quot;TTL' +
      '_COD&quot;:</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLF' +
      'ield">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Cam' +
      'po" NULL="FALSE" INDEX = "0" >TTL_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
      'UNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >}</CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>{'#13#10'&quot;DAM_IDP' +
      'S&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObj' +
      'Function>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>T' +
      'RUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabe' +
      'la&#x20;config</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<VALOR>CFG_DAM_IDPS</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>7</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'<VALOR>&quot;,&#x20;&quot;DAM_ID_VAL_REF&quot;:&' +
      'quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>' +
      #13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjV' +
      'ariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x20;c' +
      'onfig</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</' +
      'TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<' +
      'TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VA' +
      'LOR>CFG_DAM_ID_VAL_REF</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>8</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CON' +
      'STANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<VALOR>&quot;,&#x20;&quot;DAM_VALOR&quot;:&quot;</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6<' +
      '/ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstringInverse</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFu' +
      'nction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>000000000000' +
      '000000</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfReplaceAll</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfReplaceA' +
      'll</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>to' +
      'String</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEX' +
      'T>ebfFormatNumber</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</' +
      'NOME>'#13#10'<TEXT>ebfArredondaDecimal</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Fracionado</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID' +
      '>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<' +
      'ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>TTL_VALOR_TITULO</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>7</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFuncti' +
      'on>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>6</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10 +
      '<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>#,##0.00</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<VALOR>.</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>,</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>11</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quot;D' +
      'AM_ID_PREF&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebf' +
      'SQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOM' +
      'PATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<' +
      'TEXT>tabela&#x20;config</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<VALOR>CFG_DAM_ID_PREF</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>4</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quot;DAM_VENCIMENTO' +
      '&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfDateY' +
      'ear</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>' +
      'ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<IN' +
      'COMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>' +
      #13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<VALOR>NOVO_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>10' +
      '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
      'jConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfCon' +
      'catLeft</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfDateMonth</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</N' +
      'OME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante' +
      '</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VAR' +
      'IABLE</NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabel' +
      'a</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0' +
      '.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10'<VALOR>NOVO_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>10</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VA' +
      'LOR>2</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></' +
      'GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>0</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcatLeft</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Function>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfDateDay</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQ' +
      'LField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TE' +
      'XT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<VALOR>NOVO_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>10</FIE' +
      'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
      't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>2</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>' +
      'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'<VALOR>0</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quo' +
      't;DAM_COD_RECEITA&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
      #10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_V' +
      'ERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</N' +
      'OME>'#13#10'<TEXT>tabela&#x20;config</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>T' +
      'abela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>C' +
      'ampo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR>CFG_DAM_COD_RECEITA</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>5</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quot;DAM' +
      '_TIPO_LANCAMENTO&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TE' +
      'XT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VE' +
      'RSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NO' +
      'ME>'#13#10'<TEXT>tabela&#x20;config</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Ta' +
      'bela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10 +
      '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Ca' +
      'mpo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>CFG_DAM_TIPO_LANCAMENTO</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>6</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObj' +
      'Const>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quot;' +
      'DAM_ED&quot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10 +
      '<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubs' +
      'tringInverse</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>' +
      #13#10'<TEXT>ebfDateYear</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Vari' +
      'ante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13#10'<NOME' +
      '>VARIABLE</NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>T' +
      'abela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1' +
      '.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>C' +
      'ampo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
      '2.0.75</MKR_VERSION>'#13#10'<VALOR>NOVO_VENCIMENTO</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>10</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10 +
      '</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<VALOR>2</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>' +
      #13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10'<VALOR>&quot;,'#13#10'&quot;DAM_NOSSO_NUMERO&quot;:&quot;</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NO' +
      'ME>FUNCTION</NOME>'#13#10'<TEXT>ebfSubstringInverse</TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10 +
      '<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>' +
      #13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>000000000000000000</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6<' +
      '/ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>' +
      #13#10'<ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObj' +
      'Const>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>TTL_COD</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>0</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTA' +
      'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR' +
      '_VERSION>'#13#10'<VALOR>11</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONS' +
      'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quot;TTL_COD&quot;:</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>F' +
      'UNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>6</ID>'#13 +
      #10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>TTL_COD</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>0</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<' +
      'ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>}</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowConnector2: TFlowConnector
    Left = 1410
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
    InputNames = 'FlowLine25'
    OutputNames = 'FlowLine26'
  end
  object FlowLine2: TFlowLine
    Left = 645
    Top = 618
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression18: TFlowExpression
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
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine32'
    Description = 'retorno erro'
    Text = 
      '{"status":"ERRO",'#10'"mensagem":"Dado n'#227'o encontrado",'#10'"result":"T'#237 +
      'tulo n'#227'o encontrado"}'
    ReturnVar = 'Retorno Ws'
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"ERRO",'#13#10'"mensag' +
      'em":"Dado n'#227'o encontrado",'#13#10'"result":"T'#237'tulo n'#227'o encontrado"}</C' +
      'ONSTANT>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>6</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"ERRO",'#13#10'"mensag' +
      'em":"Dado n'#227'o encontrado",'#13#10'"result":"T'#237'tulo n'#227'o encontrado"}</V' +
      'ALOR>'#13#10#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10#9#9'<NULO>FALSE</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID>' +
      '</GUID>'#13#10#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
  end
  object FlowLine3: TFlowLine
    Left = 455
    Top = 693
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression18'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression8: TFlowExpression
    Left = 780
    Top = 909
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine9'
    Description = 'tabela config'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'tabela config'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuer' +
      'y">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ' +
      '><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.P' +
      'GL_COD&#x20;As&#x20;CFG_COD,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS' +
      '.PGL_NOME_FANTASIA&#x20;As&#x20;CFG_NOME_ENTIDADE,'#13#10'&#x20;&#x20;' +
      'SMB_PARAMETROS_GLOBAIS.PGL_FIN_TAXA_PROCESSO&#x20;As&#x20;CFG_FI' +
      'N_TAXA_PROCESSO,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_FIN_N_D' +
      'IAS_TP&#x20;As&#x20;CFG_FIN_N_DIAS_TP,'#13#10'&#x20;&#x20;SMB_PARAMETR' +
      'OS_GLOBAIS.PGL_DAM_ID_PREF&#x20;As&#x20;CFG_DAM_ID_PREF,'#13#10'&#x20;' +
      '&#x20;SMB_PARAMETROS_GLOBAIS.PGL_DAM_COD_RECEITA&#x20;As&#x20;CF' +
      'G_DAM_COD_RECEITA,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_DAM_T' +
      'IPO_LANCAMENTO&#x20;As&#x20;CFG_DAM_TIPO_LANCAMENTO,'#13#10'&#x20;&#x2' +
      '0;SMB_PARAMETROS_GLOBAIS.PGL_DAM_IDPS&#x20;As&#x20;CFG_DAM_IDPS,' +
      #13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_DAM_ID_VAL_REF&#x20;As&' +
      '#x20;CFG_DAM_ID_VAL_REF'#13#10'From'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAI' +
      'S'#13#10#13#10#13#10'/*WHERE_NEW*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'</PAR' +
      'AMS>'#13#10'</PSQL>'#13#10'</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE" ' +
      ' ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VA' +
      'LOR><PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAI' +
      'S.PGL_COD&#x20;As&#x20;CFG_COD,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOB' +
      'AIS.PGL_NOME_FANTASIA&#x20;As&#x20;CFG_NOME_ENTIDADE,'#13#10'&#x20;&#x' +
      '20;SMB_PARAMETROS_GLOBAIS.PGL_FIN_TAXA_PROCESSO&#x20;As&#x20;CFG' +
      '_FIN_TAXA_PROCESSO,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_FIN_' +
      'N_DIAS_TP&#x20;As&#x20;CFG_FIN_N_DIAS_TP,'#13#10'&#x20;&#x20;SMB_PARAM' +
      'ETROS_GLOBAIS.PGL_DAM_ID_PREF&#x20;As&#x20;CFG_DAM_ID_PREF,'#13#10'&#x' +
      '20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_DAM_COD_RECEITA&#x20;As&#x20' +
      ';CFG_DAM_COD_RECEITA,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_DA' +
      'M_TIPO_LANCAMENTO&#x20;As&#x20;CFG_DAM_TIPO_LANCAMENTO,'#13#10'&#x20;&' +
      '#x20;SMB_PARAMETROS_GLOBAIS.PGL_DAM_IDPS&#x20;As&#x20;CFG_DAM_ID' +
      'PS,'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLOBAIS.PGL_DAM_ID_VAL_REF&#x20;' +
      'As&#x20;CFG_DAM_ID_VAL_REF'#13#10'From'#13#10'&#x20;&#x20;SMB_PARAMETROS_GLO' +
      'BAIS'#13#10#13#10#13#10'/*WHERE_NEW*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'</' +
      'PARAMS>'#13#10'</PSQL>'#13#10'</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMSI/Pg0' +
      'KPFJPT1Q+DQo8U1FMPg0KU2VsZWN0DQomI3gyMDsmI3gyMDtTTUJfUEFSQU1FVFJ' +
      'PU19HTE9CQUlTLlBHTF9DT0QmI3gyMDtBcyYjeDIwO0NGR19DT0QsDQomI3gyMDs' +
      'mI3gyMDtTTUJfUEFSQU1FVFJPU19HTE9CQUlTLlBHTF9OT01FX0ZBTlRBU0lBJiN' +
      '4MjA7QXMmI3gyMDtDRkdfTk9NRV9FTlRJREFERSwNCiYjeDIwOyYjeDIwO1NNQl9' +
      'QQVJBTUVUUk9TX0dMT0JBSVMuUEdMX0ZJTl9UQVhBX1BST0NFU1NPJiN4MjA7QXM' +
      'mI3gyMDtDRkdfRklOX1RBWEFfUFJPQ0VTU08sDQomI3gyMDsmI3gyMDtTTUJfUEF' +
      'SQU1FVFJPU19HTE9CQUlTLlBHTF9GSU5fTl9ESUFTX1RQJiN4MjA7QXMmI3gyMDt' +
      'DRkdfRklOX05fRElBU19UUCwNCiYjeDIwOyYjeDIwO1NNQl9QQVJBTUVUUk9TX0d' +
      'MT0JBSVMuUEdMX0RBTV9JRF9QUkVGJiN4MjA7QXMmI3gyMDtDRkdfREFNX0lEX1B' +
      'SRUYsDQomI3gyMDsmI3gyMDtTTUJfUEFSQU1FVFJPU19HTE9CQUlTLlBHTF9EQU1' +
      'fQ09EX1JFQ0VJVEEmI3gyMDtBcyYjeDIwO0NGR19EQU1fQ09EX1JFQ0VJVEEsDQo' +
      'mI3gyMDsmI3gyMDtTTUJfUEFSQU1FVFJPU19HTE9CQUlTLlBHTF9EQU1fVElQT19' +
      'MQU5DQU1FTlRPJiN4MjA7QXMmI3gyMDtDRkdfREFNX1RJUE9fTEFOQ0FNRU5UTyw' +
      'NCiYjeDIwOyYjeDIwO1NNQl9QQVJBTUVUUk9TX0dMT0JBSVMuUEdMX0RBTV9JRFB' +
      'TJiN4MjA7QXMmI3gyMDtDRkdfREFNX0lEUFMsDQomI3gyMDsmI3gyMDtTTUJfUEF' +
      'SQU1FVFJPU19HTE9CQUlTLlBHTF9EQU1fSURfVkFMX1JFRiYjeDIwO0FzJiN4MjA' +
      '7Q0ZHX0RBTV9JRF9WQUxfUkVGDQpGcm9tDQomI3gyMDsmI3gyMDtTTUJfUEFSQU1' +
      'FVFJPU19HTE9CQUlTDQovKldIRVJFX05FVyovDQovKk9SREVSX05FVyovDQo8L1N' +
      'RTD4NCg0KPFBBUkFNUz4NCjwvUEFSQU1TPg0KPC9ST09UPg0K</DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10 +
      '<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision1: TFlowDecision
    Left = 590
    Top = 908
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
    OutputNames = 'FlowLine7;FlowLine8'
    Description = 'TTL_SITUACAO = A'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfSQ' +
      'LField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>3<' +
      '/ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Tabela</TEXT>'#13#10#9#9 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10 +
      #9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<' +
      'VALOR>TTL_SITUACAO</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
      #9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9 +
      '<FIELDINDEX>8</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjF' +
      'unction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NO' +
      'ME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>A</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</N' +
      'ULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObj' +
      'Function>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<' +
      'VARIABLE NAME="Tabela"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Campo" NULL="FALS' +
      'E" INDEX="8">TTL_SITUACAO</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTI' +
      'ON>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">A</CONSTANT>'#13#10#9#9'</P' +
      'ARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowExpression1: TFlowExpression
    Left = 400
    Top = 909
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
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine28'
    Description = 'retorno erro'
    Text = 
      'Concatena'#231#227'o({"status":"ERRO",'#10'"mensagem":"T'#237'tulo n'#227'o pode reali' +
      'zar esse procedimento. Situa'#231#227'o do t'#237'tulo: ,Campo(@Tabela,TTL_SI' +
      'TUACAO_LEGENDA),",'#10'"result":",Campo(@Tabela,TTL_SITUACAO_LEGENDA' +
      '),"})'
    ReturnVar = 'Retorno Ws'
    Expression = 
      #9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"ERRO",'#13#10'"me' +
      'nsagem":"T'#237'tulo n'#227'o pode realizar esse procedimento. Situa'#231#227'o do' +
      ' t'#237'tulo: </CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQL' +
      'Field">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="Tabela"/>'#13#10#9#9#9#9#9'<CON' +
      'STANT TYPE="Campo" NULL="FALSE" INDEX="9">TTL_SITUACAO_LEGENDA</' +
      'CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE">",'#13#10'"result":"</CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="' +
      'Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAM' +
      'E="Tabela"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX="9"' +
      '>TTL_SITUACAO_LEGENDA</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13 +
      #10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">"}</CONSTANT>'#13#10#9#9'</PARA' +
      'MS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCon' +
      'st>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10#9#9#9#9'<VALOR>{"status":"ERRO",'#13#10'"mensagem":"T'#237'tulo n'#227'o pode rea' +
      'lizar esse procedimento. Situa'#231#227'o do t'#237'tulo: </VALOR>'#13#10#9#9#9#9'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO' +
      '>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID' +
      '>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFun' +
      'ction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebf' +
      'SQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>4' +
      '</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Tabela</TEXT>'#13#10#9 +
      #9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13 +
      #10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FA' +
      'LSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      '<VALOR>TTL_SITUACAO_LEGENDA</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DM' +
      'LTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO' +
      '>'#13#10#9#9#9#9#9#9'<FIELDINDEX>9</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>CON' +
      'STANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>",'#13#10'"result":"</VALO' +
      'R>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9 +
      #9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>' +
      #13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10 +
      #9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Va' +
      'riante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_V' +
      'ERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>' +
      #13#10#9#9#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Tab' +
      'ela</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9 +
      #9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10#9#9#9#9#9#9'<VALOR>TTL_SITUACAO_LEGENDA</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NUL' +
      'O>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>9</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></' +
      'GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>5</ID>'#13#10 +
      #9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>"}</VAL' +
      'OR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9 +
      #9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst' +
      '>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine7: TFlowLine
    Left = 455
    Top = 918
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression1'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 645
    Top = 918
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowExpression8'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowDecision4: TFlowDecision
    Left = 970
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine13;FlowLine14'
    Description = 'status = OK'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Json Re' +
      'torno</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10 +
      #9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MK' +
      'R_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>status</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</' +
      'NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9 +
      #9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAM' +
      'S>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOM' +
      'E>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>OK</VALOR>'#13#10#9#9#9 +
      #9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9 +
      #9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID>' +
      '</GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</P' +
      'ARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="Json Retorno"/>'#13#10#9#9#9#9#9'<CON' +
      'STANT TYPE="Letras" NULL="FALSE">status</CONSTANT>'#13#10#9#9#9#9'</PARAMS' +
      '>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">OK</C' +
      'ONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowExpression3: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine25'
    Description = 'retorno erro'
    Text = 
      'Concatena'#231#227'o({"status":"ERRO",'#13#10'"mensagem":"Falha ao Gerar o Nov' +
      'o DAM. Tente novamente mais tarde",'#13#10'"result":",@Retorno Ws,"})'
    ReturnVar = 'Retorno Ws'
    Expression = 
      #9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"ERRO",'#13#10'"me' +
      'nsagem":"Falha ao Gerar o Novo DAM. Tente novamente mais tarde",' +
      #13#10'"result":"</CONSTANT>'#13#10#9#9#9'<VARIABLE NAME="Retorno Ws"/>'#13#10#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">"}</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9 +
      '</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCon' +
      'st>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10#9#9#9#9'<VALOR>{"status":"ERRO",'#13#10'"mensagem":"Falha ao Gerar o No' +
      'vo DAM. Tente novamente mais tarde",'#13#10'"result":"</VALOR>'#13#10#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<N' +
      'ULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></G' +
      'UID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
      'Retorno Ws</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0' +
      '.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>6' +
      '</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FA' +
      'LSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>' +
      '"}</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TO' +
      'bjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine13: TFlowLine
    Left = 1025
    Top = 468
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression3'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression4: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine15'
    Description = 'cancelar DAM Antigo'
    Text = 
      'Executar Comandos SQL(Concatena'#231#227'o(update GER_DAM set GER_DAM.DA' +
      'M_SITUACAO = '#39'C'#39', PES_COD_CANCEL = ,@PES_COD_SOLICITANTE, , DAM_' +
      'DATA_CANCEL = GETDATE(), DAM_CBM = '#39'N'#39' where GER_DAM.DAM_COD = ,' +
      'Campo(@Tabela,DAM_COD), and GER_DAM.DAM_SITUACAO = '#39'A'#39';),)'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Comandos&#x20;SQL" REALNAME="ebfSQ' +
      'LExecuteBatch">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;' +
      'o" REALNAME="ebfConcat">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="FALSE"  >update&#x20;GER_DAM&#x20;set&#x20;GER_DAM.DAM_SITUACA' +
      'O&#x20;=&#x20;'#39'C'#39',&#x20;PES_COD_CANCEL&#x20;=&#x20;</CONSTANT>'#13#10 +
      '<VARIABLE NAME="PES_COD_SOLICITANTE"/>'#13#10'<CONSTANT TYPE="Letras" ' +
      'NULL="FALSE"  >&#x20;,&#x20;DAM_DATA_CANCEL&#x20;=&#x20;GETDATE(' +
      '),&#x20;DAM_CBM&#x20;=&#x20;'#39'N'#39'&#x20;where&#x20;GER_DAM.DAM_COD&' +
      '#x20;=&#x20;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQL' +
      'Field">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Ca' +
      'mpo" NULL="FALSE" INDEX = "11" >DAM_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;and&#x2' +
      '0;GER_DAM.DAM_SITUACAO&#x20;=&#x20;'#39'A'#39';</CONSTANT>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<' +
      '/PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteBatch' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>eb' +
      'fConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10 +
      '<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>' +
      'update&#x20;GER_DAM&#x20;set&#x20;GER_DAM.DAM_SITUACAO&#x20;=&#x' +
      '20;'#39'C'#39',&#x20;PES_COD_CANCEL&#x20;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE<' +
      '/NOME>'#13#10'<TEXT>PES_COD_SOLICITANTE</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>8</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;,&#x20;DAM_DATA_CANCEL&#' +
      'x20;=&#x20;GETDATE(),&#x20;DAM_CBM&#x20;=&#x20;'#39'N'#39'&#x20;where&#x' +
      '20;GER_DAM.DAM_COD&#x20;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
      'TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>' +
      #13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE<' +
      '/NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</M' +
      'KR_VERSION>'#13#10'<VALOR>DAM_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>11<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.17</MKR_VERSION>'#13#10'<VALOR>&#x20;and&#x20;GER_DAM.DAM_SITUACAO&#' +
      'x20;=&#x20;'#39'A'#39';</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VER' +
      'SION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARA' +
      'MS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine14: TFlowLine
    Left = 1025
    Top = 468
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression4'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression7: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine6'
    Description = 'Vincular novo DAM ao titulo'
    Text = 'Executar Atualiza'#231#227'o(SQL ATUALIZA'#199#195'O,)'
    Expression = 
      '<FUNCTION NAME="Executar&#x20;Atualiza&#231;&#227;o" REALNAME="e' +
      'bfSQLExecuteUpdate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Atualiz' +
      'a&#231;&#227;o" NULL="FALSE"  ><SQL TYPE="UPDATE">'#13#10'<TABLE>GER_T' +
      'ITULO</TABLE>'#13#10'<SQLFIELD NAME="DAM_COD">'#13#10'<FUNCTION NAME="Para I' +
      'nteiro" REALNAME="toLong">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="JSON - ' +
      'Obter Valor" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9'<VARIABLE NAME="Json Retorno"/>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NU' +
      'LL="FALSE">result</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'</SQLFIELD>'#13#10'<RESTRICTIONS>'#13#10'<COMPARE TYPE="' +
      'soEqual">'#13#10'<SQLFIELD NAME="TTL_COD"/>'#13#10'<VARIABLE NAME="ID"/>'#13#10'</' +
      'COMPARE>'#13#10'</RESTRICTIONS>'#13#10'</SQL>'#13#10'</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteUpdat' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Atualiza&#231;&#227;o</TIPO' +
      '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MK' +
      'R_VERSION>'#13#10'<VALOR><SQL TYPE="UPDATE">'#13#10'<TABLE>GER_TITULO</TABLE' +
      '>'#13#10'<SQLFIELD NAME="DAM_COD">'#13#10'<FUNCTION NAME="Para Inteiro" REAL' +
      'NAME="toLong">'#13#10#9'<PARAMS>'#13#10#9#9'<FUNCTION NAME="JSON - Obter Valor"' +
      ' REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9'<PARAMS>'#13#10#9#9#9#9'<VARIABLE N' +
      'AME="Json Retorno"/>'#13#10#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">r' +
      'esult</CONSTANT>'#13#10#9#9#9'</PARAMS>'#13#10#9#9'</FUNCTION>'#13#10#9'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'</SQLFIELD>'#13#10'<RESTRICTIONS>'#13#10'<COMPARE TYPE="soEqual">'#13#10'<' +
      'SQLFIELD NAME="TTL_COD"/>'#13#10'<VARIABLE NAME="ID"/>'#13#10'</COMPARE>'#13#10'</' +
      'RESTRICTIONS>'#13#10'</SQL>'#13#10'</VALOR>'#13#10'<DMLTYPE>dtUpdate</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMS' +
      'I/Pg0KPFJPT1Q+DQo8VERNTFRhYmxlPjxOQU1FPkdFUl9USVRVTE88L05BTUU+PF' +
      'JFQUxOQU1FPkdFUl9USVRVTE88L1JFQUxOQU1FPjxESUFHUkFNWE1MPjwvRElBR1' +
      'JBTVhNTD48L1RETUxUYWJsZT4NCjxURE1MRmllbGQ+PE5BTUU+Q/NkaWdvIChEQU' +
      '1fQ09EKTwvTkFNRT48UkVBTE5BTUU+REFNX0NPRDwvUkVBTE5BTUU+PERJQUdSQU' +
      '1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWlCbGJtTnZaR2x1WnowaVNWTl' +
      'BMVGc0TlRrdE1TSS9QZzBLUEZKUFQxUStEUW84VkU5aWFrWjFibU4wYVc5dVBnME' +
      'tQRWxFUGpFOEwwbEVQZzBLUEU1UFRVVStSbFZPUTFSSlQwNDhMMDVQVFVVK0RRbz' +
      'hWRVZZVkQ1MGIweHZibWM4TDFSRldGUStEUW84VTFGTVBrWkJURk5GUEM5VFVVdy' +
      'tEUW84VkVsUVR6NUpiblJsYVhKdlBDOVVTVkJQUGcwS1BFbE9RMDlOVUVGVVNWWk' +
      'ZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS1BFMUxVbDlXUlZKVFNVOU' +
      '9QalV1TUM0d0xqRTNQQzlOUzFKZlZrVlNVMGxQVGo0TkNqeFFRVkpCVFZNK0RRbz' +
      'hWRTlpYWtaMWJtTjBhVzl1UGcwS1BFbEVQakU4TDBsRVBnMEtQRTVQVFVVK1JsVk' +
      '9RMVJKVDA0OEwwNVBUVVUrRFFvOFZFVllWRDVsWW1aSFpYUldZV3gxWlU5aWFtVm' +
      'pkRXB6YjI0OEwxUkZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbF' +
      'FUejVXWVhKcFlXNTBaVHd2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk' +
      '1VMFU4TDBsT1EwOU5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0MUxqQX' +
      'VNQzR4Tnp3dlRVdFNYMVpGVWxOSlQwNCtEUW84VUVGU1FVMVRQZzBLUEZSUFltcF' +
      'dZWEpwWVdKc1pUNE5DanhKUkQ0eFBDOUpSRDROQ2p4T1QwMUZQbFpCVWtsQlFreE' +
      'ZQQzlPVDAxRlBnMEtQRlJGV0ZRK1NuTnZiaVlqZURJd08xSmxkRzl5Ym04OEwxUk' +
      'ZXRlErRFFvOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvOFZFbFFUejVXWVhKcFlXNT' +
      'BaVHd2VkVsUVR6NE5DanhKVGtOUFRWQkJWRWxXUlV3K1JrRk1VMFU4TDBsT1EwOU' +
      '5VRUZVU1ZaRlRENE5DanhOUzFKZlZrVlNVMGxQVGo0MUxqQXVNQzR4Tnp3dlRVdF' +
      'NYMVpGVWxOSlQwNCtEUW84TDFSUFltcFdZWEpwWVdKc1pUNE5DanhVVDJKcVEyOX' +
      'VjM1ErRFFvOFNVUStNVHd2U1VRK0RRbzhUazlOUlQ1RFQwNVRWRUZPVkR3dlRrOU' +
      '5SVDROQ2p4VVJWaFVQand2VkVWWVZENE5DanhUVVV3K1JrRk1VMFU4TDFOUlRENE' +
      '5DanhVU1ZCUFBreGxkSEpoY3p3dlZFbFFUejROQ2p4SlRrTlBUVkJCVkVsV1JVdy' +
      'tSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2p4TlMxSmZWa1ZTVTBsUFRqND' +
      'FMakF1TUM0eE56d3ZUVXRTWDFaRlVsTkpUMDQrRFFvOFZrRk1UMUkrY21WemRXeD' +
      'BQQzlXUVV4UFVqNE5DanhFVFV4VVdWQkZQbVIwVTJWc1pXTjBQQzlFVFV4VVdWQk' +
      'ZQZzBLUEVSSlFVZFNRVTFZVFV3K1BDOUVTVUZIVWtGTldFMU1QZzBLUEU1VlRFOC' +
      'tSa0ZNVTBVOEwwNVZURTgrRFFvOFJrbEZURVJKVGtSRldENHRNVHd2UmtsRlRFUk' +
      'pUa1JGV0Q0TkNqeEhWVWxFUGp3dlIxVkpSRDROQ2p4VFVFVkRTVUZNUTA5RVJUND' +
      'hMMU5RUlVOSlFVeERUMFJGUGcwS1BDOVVUMkpxUTI5dWMzUStEUW84TDFCQlVrRk' +
      '5VejROQ2p3dlZFOWlha1oxYm1OMGFXOXVQZzBLUEM5UVFWSkJUVk0rRFFvOEwxUl' +
      'BZbXBHZFc1amRHbHZiajROQ2p3dlVrOVBWRDROQ2c9PTwvRElBR1JBTVhNTD48Vk' +
      'FMVUU+UGFyYSBJbnRlaXJvKEpTT04gLSBPYnRlciBWYWxvcihASnNvbiBSZXRvcm' +
      '5vLHJlc3VsdCkpPC9WQUxVRT4NCgk8RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT' +
      '0iUGFyYSBJbnRlaXJvIiBSRUFMTkFNRT0idG9Mb25nIj4NCgkJCTxQQVJBTVM+DQ' +
      'oJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04gLSBPYnRlciBWYWxvciIgUkVBTE5BTU' +
      'U9ImViZkdldFZhbHVlT2JqZWN0SnNvbiI+DQoJCQkJCTxQQVJBTVM+DQoJCQkJCQ' +
      'k8VkFSSUFCTEUgTkFNRT0iSnNvbiBSZXRvcm5vIi8+DQoJCQkJCQk8Q09OU1RBTl' +
      'QgVFlQRT0iTGV0cmFzIiBOVUxMPSJGQUxTRSI+cmVzdWx0PC9DT05TVEFOVD4NCg' +
      'kJCQkJPC9QQVJBTVM+DQoJCQkJPC9GVU5DVElPTj4NCgkJCTwvUEFSQU1TPg0KCQ' +
      'k8L0ZVTkNUSU9OPjwvRVhQUkVTU0lPTj4NCjwvVERNTEZpZWxkPg0KPFRETUxDb2' +
      '1wb3NpdGlvbj48TkFNRT5D82RpZ28gKFRUTF9DT0QpPC9OQU1FPjxSRUFMTkFNRT' +
      '5UVExfQ09EPC9SRUFMTkFNRT48RElBR1JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2Ym' +
      'owaU1TNHdJaUJsYm1OdlpHbHVaejBpU1ZOUExUZzROVGt0TVNJL1BnMEtQRkpQVD' +
      'FRK0RRbzhWRTlpYWxaaGNtbGhZbXhsUGcwS1BFbEVQakU4TDBsRVBnMEtQRTVQVF' +
      'VVK1ZrRlNTVUZDVEVVOEwwNVBUVVUrRFFvOFZFVllWRDVKUkR3dlZFVllWRDROQ2' +
      'p4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2p4VVNWQlBQa2x1ZEdWcGNtODhMMVJKVU' +
      'U4K0RRbzhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUl' +
      'V3K0RRbzhUVXRTWDFaRlVsTkpUMDQrTlM0d0xqQXVNVGM4TDAxTFVsOVdSVkpUU1' +
      'U5T1BnMEtQQzlVVDJKcVZtRnlhV0ZpYkdVK0RRbzhMMUpQVDFRK0RRbz08L0RJQU' +
      'dSQU1YTUw+PEVESVRBQkxFPlRSVUU8L0VESVRBQkxFPg0KCTxWQUxVRT5ASUQ8L1' +
      'ZBTFVFPg0KCTxFWFBSRVNTSU9OPjxWQVJJQUJMRSBOQU1FPSJJRCIvPjwvRVhQUk' +
      'VTU0lPTj4NCgk8TE9HSUNBTFNUUj5BTkQ8L0xPR0lDQUxTVFI+DQoJPE9QRVJBVE' +
      '9SU1RSPnNvRXF1YWw8L09QRVJBVE9SU1RSPg0KPC9URE1MQ29tcG9zaXRpb24+DQ' +
      'o8L1JPT1Q+DQo=</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunct' +
      'ion>'#13#10'</ROOT>'#13#10
  end
  object FlowLine15: TFlowLine
    Left = 1025
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine3: TFlowSubRoutine
    Left = 970
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine12'
    Description = 'WsAbrirRelatorio'
    Id = 619
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>DAM-02.jrxml</VALOR>'#13 +
          #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
          'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
          'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>{&quot;ttl_tag&q' +
          'uot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
          'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
          'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFun' +
          'ction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TE' +
          'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
          '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
          '<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Tabela<' +
          '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
          'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVa' +
          'riable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
          '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>TT' +
          'L_TAG</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
          'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>6</FIELDINDEX>'#13#10'<GUID></G' +
          'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
          'bjFunction>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
          'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
          '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VAL' +
          'OR>&quot;,&#x20;&quot;dam_cod&quot;:&#x20;&quot;</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>F' +
          'UNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10 +
          '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<' +
          'ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Retorno</TEXT>' +
          #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariab' +
          'le>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
          'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>resul' +
          't</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
          '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
          '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
          'unction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
          '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
          'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>' +
          '&quot;}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
          'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
          '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
          '/TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'codigousuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>PES_COD_SOLICITANT' +
          'E</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>' +
          'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TOb' +
          'jVariable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'formato'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>PDF</VALOR>'#13#10#9#9'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NU' +
          'LO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'abrir'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>false</VALOR>'#13#10#9#9'<DMLTYPE>' +
          'dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</' +
          'NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIA' +
          'LCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'fonte'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>FONTE</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13 +
          #10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
          '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'chamado a partir de agendamento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM-02.jrxml</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;ttl_tag&q' +
          'uot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLF' +
          'ield">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Cam' +
          'po" NULL="FALSE" INDEX = "6" >TTL_TAG</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
          'UNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,&#x20;&q' +
          'uot;dam_cod&quot;:&#x20;&quot;</CONSTANT>'#13#10'<FUNCTION NAME="JSON&' +
          '#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13 +
          #10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Retorno"/>'#13#10'<CONSTANT TYPE=' +
          '"Letras" NULL="FALSE"  >result</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;}</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'codigousuario'
        ParamType = ptInput
        Value = '<VARIABLE NAME="PES_COD_SOLICITANTE"/>'
      end
      item
        DataType = ftString
        Name = 'formato'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">PDF</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'abrir'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="L'#243'gico" NULL="FALSE">false</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'fonte'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="FONTE"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'chamado a partir de agendamento'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 'DAM-02.jrxml'
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o({"ttl_tag":",Campo(@Tabela,TTL_TAG),", "dam_cod": "' +
          ',JSON - Obter Valor(@Json Retorno,result),"})'
      end
      item
        DataType = ftString
        Name = 'codigousuario'
        ParamType = ptInput
        Value = '@PES_COD_SOLICITANTE'
      end
      item
        DataType = ftString
        Name = 'formato'
        ParamType = ptInput
        Value = 'PDF'
      end
      item
        DataType = ftString
        Name = 'abrir'
        ParamType = ptInput
        Value = 'false'
      end
      item
        DataType = ftString
        Name = 'fonte'
        ParamType = ptInput
        Value = '@FONTE'
      end
      item
        DataType = ftString
        Name = 'chamado a partir de agendamento'
        ParamType = ptInput
        Value = 'Nulo'
      end>
    Return = 'retorno'
    ObjectName = 'WsAbrirRelatorio'
    RealName = 'CALLRULE'
  end
  object FlowDecision5: TFlowDecision
    Left = 970
    Top = 833
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
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine20;FlowLine21'
    Description = 'status = OK'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>json</T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<I' +
      'D>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10#9#9#9#9#9#9'<VALOR>status</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9 +
      #9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'<' +
      '/TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTA' +
      'NT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>OK</VALOR>'#13#10#9#9#9#9'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>F' +
      'ALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13 +
      #10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10 +
      #9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="json"/>'#13#10#9#9#9#9#9'<CONSTANT TY' +
      'PE="Letras" NULL="FALSE">status</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</' +
      'FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">OK</CONSTANT>' +
      #13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowExpression16: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine19'
    Description = 'Criar json'
    Text = 'JSON - Criar objeto(@retorno)'
    ReturnVar = 'json'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;objeto" REALNAME="eb' +
      'fCreateObjectJSON">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="retorno"/>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9'<TEXT>retorno</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine19: TFlowLine
    Left = 1025
    Top = 768
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
    InputNames = 'FlowExpression16'
    OutputNames = 'FlowDecision5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine20: TFlowLine
    Left = 1025
    Top = 843
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression6'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression9: TFlowExpression
    Left = 1160
    Top = 834
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
    InputNames = 'FlowLine21'
    OutputNames = 'FlowLine23'
    Description = 'retorno sucesso'
    Text = 
      'Concatena'#231#227'o({"status":"OK",'#10'"mensagem":"DAM gerado com sucesso,' +
      ' mas ocorreu um erro na gera'#231#227'o do PDF para impress'#227'o. Acesse o ' +
      'recurso de reimprimir. ID DAM: ,JSON - Obter Valor(@Json Retorno' +
      ',result),",'#10'"result":,JSON - Obter Valor(@Json Retorno,result),,' +
      '"DAM_COD_BARRA":",Campo(Abrir Consulta(SQL CONSULTA,),DAM_COD_BA' +
      'RRA),"})'
    ReturnVar = 'Retorno Ws'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;status&qu' +
      'ot;:&quot;OK&quot;,'#13#10'&quot;mensagem&quot;:&quot;DAM&#x20;gerado&' +
      '#x20;com&#x20;sucesso,&#x20;mas&#x20;ocorreu&#x20;um&#x20;erro&#' +
      'x20;na&#x20;gera&#231;&#227;o&#x20;do&#x20;PDF&#x20;para&#x20;im' +
      'press&#227;o.&#x20;Acesse&#x20;o&#x20;recurso&#x20;de&#x20;reimp' +
      'rimir.&#x20;ID&#x20;DAM:&#x20;</CONSTANT>'#13#10'<FUNCTION NAME="JSON&' +
      '#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13 +
      #10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Retorno"/>'#13#10'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE"  >result</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,'#13#10'&quot;result&' +
      'quot;:</CONSTANT>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;V' +
      'alor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAM' +
      'E="Json&#x20;Retorno"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >' +
      'result</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE"  >,&quot;DAM_COD_BARRA&quot;:&quot;</CONSTANT>'#13#10 +
      '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<FUNCT' +
      'ION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="SQL&#x20;Consulta" NULL="FALSE"  ><PSQL' +
      '>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD,'#13#10'&#x20;' +
      '&#x20;VS_GER_TITULO.DAM_COD_BARRA'#13#10'From'#13#10'&#x20;&#x20;VS_GER_TITU' +
      'LO'#13#10'Where'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;:t'#13#10#13#10'/' +
      '*WHERE_ADD*/'#13#10'Order&#x20;By'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD'#13#10 +
      #13#10'/*ORDER_ADD*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="t">'#13#10'<VARIA' +
      'BLE NAME="ID"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</CONSTANT>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUN' +
      'CTION>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "1" >DAM_COD' +
      '_BARRA</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE"  >&quot;}</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>{&quot;status&qu' +
      'ot;:&quot;OK&quot;,'#13#10'&quot;mensagem&quot;:&quot;DAM&#x20;gerado&' +
      '#x20;com&#x20;sucesso,&#x20;mas&#x20;ocorreu&#x20;um&#x20;erro&#' +
      'x20;na&#x20;gera&#231;&#227;o&#x20;do&#x20;PDF&#x20;para&#x20;im' +
      'press&#227;o.&#x20;Acesse&#x20;o&#x20;recurso&#x20;de&#x20;reimp' +
      'rimir.&#x20;ID&#x20;DAM:&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
      'ObjConst>'#13#10'<TObjFunction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Varian' +
      'te</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>V' +
      'ARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10 +
      '<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>result</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&quot;,'#13#10'&quot;res' +
      'ult&quot;:</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjec' +
      'tJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<' +
      'PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEX' +
      'T>Json&#x20;Retorno</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</' +
      'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CO' +
      'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
      'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</' +
      'MKR_VERSION>'#13#10'<VALOR>result</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
      #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
      'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.17</MKR_VERSION>'#13#10'<VALOR>,&quot;DAM_COD_BARRA&quot;:&quot;</VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>5</I' +
      'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10 +
      '<ID>5</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLExecuteQuery</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>SQL&#x20;Consulta</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR><' +
      'PSQL>'#13#10'<COMMAND>'#13#10'Select'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD,'#13#10'&#' +
      'x20;&#x20;VS_GER_TITULO.DAM_COD_BARRA'#13#10'From'#13#10'&#x20;&#x20;VS_GER_' +
      'TITULO'#13#10'Where'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_COD&#x20;=&#x20;:t'#13 +
      #10#13#10'/*WHERE_ADD*/'#13#10'Order&#x20;By'#13#10'&#x20;&#x20;VS_GER_TITULO.TTL_C' +
      'OD'#13#10#13#10'/*ORDER_ADD*/'#13#10'</COMMAND>'#13#10'<PARAMS>'#13#10'<DEFINE NAME="t">'#13#10'<V' +
      'ARIABLE NAME="ID"/>'#13#10'</DEFINE>'#13#10'</PARAMS>'#13#10'</PSQL>'#13#10'</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wI' +
      'iBlbmNvZGluZz0iSVNPLTg4NTktMSI/Pg0KPFJPT1Q+DQo8U1FMPg0KU2VsZWN0D' +
      'QomI3gyMDsmI3gyMDtWU19HRVJfVElUVUxPLlRUTF9DT0QsDQomI3gyMDsmI3gyM' +
      'DtWU19HRVJfVElUVUxPLkRBTV9DT0RfQkFSUkENCkZyb20NCiYjeDIwOyYjeDIwO' +
      '1ZTX0dFUl9USVRVTE8NCldoZXJlDQomI3gyMDsmI3gyMDtWU19HRVJfVElUVUxPL' +
      'lRUTF9DT0QmI3gyMDs9JiN4MjA7OnQNCi8qV0hFUkVfQUREKi8NCk9yZGVyJiN4M' +
      'jA7QnkNCiYjeDIwOyYjeDIwO1ZTX0dFUl9USVRVTE8uVFRMX0NPRA0KLypPUkRFU' +
      'l9BREQqLw0KPC9TUUw+DQoNCjxQQVJBTVM+DQo8REVGSU5FIE5BTUU9InQiPg0KP' +
      'FZBTFVFPg0KQElEDQo8L1ZBTFVFPg0KPERJQUdSQU1YTUw+DQpQRDk0Yld3Z2RtV' +
      'nljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2drOFZFOWlhbFpoY21saFlte' +
      'GxQZzBLQ1FrOFNVUStNVHd2U1VRK0RRb0pDVHhPVDAxRlBsWkJVa2xCUWt4RlBDO' +
      'U9UMDFGUGcwS0NRazhWRVZZVkQ1SlJEd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVe' +
      'FRSVHd2VTFGTVBnMEtDUWs4VkVsUVR6NUpiblJsYVhKdlBDOVVTVkJQUGcwS0NRa' +
      'zhTVTVEVDAxUVFWUkpWa1ZNUGxSU1ZVVThMMGxPUTA5TlVFRlVTVlpGVEQ0TkNna' +
      '0pQRTFMVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqN' +
      'E5DZ2s4TDFSUFltcFdZWEpwWVdKc1pUNE5Dand2VWs5UFZENE5DZz09DQo8L0RJQ' +
      'UdSQU1YTUw+DQo8RVhQUkVTU0lPTj4NClBGWkJVa2xCUWt4RklFNUJUVVU5SWtsR' +
      'UlpOCsNCjwvRVhQUkVTU0lPTj4NCjwvREVGSU5FPg0KPC9QQVJBTVM+DQo8L1JPT' +
      '1Q+DQo=</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
      #10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>T' +
      'RUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      'TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>DAM_COD_BARR' +
      'A</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>1</FIELDINDEX>'#13#10'<GUID></GUID>' +
      #13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFu' +
      'nction>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>&' +
      'quot;}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</' +
      'TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine21: TFlowLine
    Left = 1025
    Top = 843
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression9'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector1: TFlowConnector
    Left = 1030
    Top = 997
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
    InputNames = 'FlowLine17;FlowLine24;FlowLine30'
    OutputNames = 'FlowLine22'
  end
  object FlowLine17: TFlowLine
    Left = 1025
    Top = 918
    Width = 40
    Height = 114
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine22: TFlowLine
    Left = 1025
    Top = 992
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
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector3: TFlowConnector
    Left = 1220
    Top = 997
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
    InputNames = 'FlowLine23;FlowLine27'
    OutputNames = 'FlowLine24'
  end
  object FlowLine23: TFlowLine
    Left = 1215
    Top = 843
    Width = 40
    Height = 189
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
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine24: TFlowLine
    Left = 1025
    Top = 992
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
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine25: TFlowLine
    Left = 1215
    Top = 467
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector4: TFlowConnector
    Left = 1410
    Top = 997
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
    InputNames = 'FlowLine26'
    OutputNames = 'FlowLine27'
  end
  object FlowLine26: TFlowLine
    Left = 1405
    Top = 467
    Width = 40
    Height = 565
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
  object FlowLine27: TFlowLine
    Left = 1215
    Top = 992
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
    InputNames = 'FlowConnector4'
    OutputNames = 'FlowConnector3'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector5: TFlowConnector
    Left = 270
    Top = 922
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
    InputNames = 'FlowLine28;FlowLine34'
    OutputNames = 'FlowLine29'
  end
  object FlowLine28: TFlowLine
    Left = 265
    Top = 917
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowConnector5'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector6: TFlowConnector
    Left = 270
    Top = 997
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
    OutputNames = 'FlowLine30'
  end
  object FlowLine29: TFlowLine
    Left = 265
    Top = 917
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
    InputNames = 'FlowConnector5'
    OutputNames = 'FlowConnector6'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine30: TFlowLine
    Left = 265
    Top = 992
    Width = 800
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
    InputNames = 'FlowConnector6'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector7: TFlowConnector
    Left = 270
    Top = 847
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
    InputNames = 'FlowLine33'
    OutputNames = 'FlowLine34'
  end
  object FlowConnector8: TFlowConnector
    Left = 270
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
    InputNames = 'FlowLine32;FlowLine42'
    OutputNames = 'FlowLine33'
  end
  object FlowLine32: TFlowLine
    Left = 265
    Top = 692
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
    InputNames = 'FlowExpression18'
    OutputNames = 'FlowConnector8'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine33: TFlowLine
    Left = 265
    Top = 692
    Width = 40
    Height = 190
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
    InputNames = 'FlowConnector8'
    OutputNames = 'FlowConnector7'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine34: TFlowLine
    Left = 265
    Top = 842
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
    InputNames = 'FlowConnector7'
    OutputNames = 'FlowConnector5'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression12: TFlowExpression
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
    InputNames = 'FlowLine39'
    OutputNames = 'FlowLine35'
    Description = 'Define Acesso Cross Origin'
    Text = 
      'Resposta Web: Atribuir Valor ao Cabe'#231'alho(Access-Control-Allow-O' +
      'rigin,*)'
    Expression = 
      '<FUNCTION NAME="Resposta&#x20;Web:&#x20;Atribuir&#x20;Valor&#x20' +
      ';ao&#x20;Cabe&#231;alho" REALNAME="ebfSetHeader">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >Access-Control-Allow-Origin<' +
      '/CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >*</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetHeader</TEXT>'#13#10#9#9'<SQL>FALSE' +
      '</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>Access-Control-Allow-Origin</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE<' +
      '/NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9 +
      #9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10#9#9#9#9 +
      '<VALOR>*</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine35'
    OutputNames = 'FlowLine36'
    Description = 'Define Acesso Cross Origin'
    Text = 
      'Resposta Web: Atribuir Valor ao Cabe'#231'alho(Access-Control-Allow-M' +
      'ethods,GET, POST, OPTIONS)'
    Expression = 
      '<FUNCTION NAME="Resposta&#x20;Web:&#x20;Atribuir&#x20;Valor&#x20' +
      ';ao&#x20;Cabe&#231;alho" REALNAME="ebfSetHeader">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >Access-Control-Allow-Methods' +
      '</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >GET,&#x20;PO' +
      'ST,&#x20;OPTIONS</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSetHeader</TEXT>'#13#10#9#9'<SQL>FALSE' +
      '</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR>Access-Control-Allow-Methods</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE' +
      '</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9 +
      #9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9 +
      #9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.66</MKR_VERSION>'#13#10#9#9#9 +
      #9'<VALOR>GET, POST, OPTIONS</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13 +
      #10'</ROOT>'#13#10
  end
  object FlowLine35: TFlowLine
    Left = 645
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
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision9: TFlowDecision
    Left = 590
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
    InputNames = 'FlowLine36'
    OutputNames = 'FlowLine40;FlowLine41'
    Description = 'algum parametro nulo ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprOr</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunctio' +
      'n>'#13#10#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>isNullO' +
      'rEmpty</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>8</I' +
      'D>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ID</TEXT>'#13#10#9#9#9#9#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TO' +
      'bjFunction>'#13#10#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEX' +
      'T>isNullOrEmpty</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9 +
      #9'<ID>10</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>TOKEN</TE' +
      'XT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</M' +
      'KR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunct' +
      'ion>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NO' +
      'ME>'#13#10#9#9#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<' +
      'TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVar' +
      'iable>'#13#10#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<T' +
      'EXT>PES_COD_SOLICITANTE</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<T' +
      'IPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      #9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9 +
      #9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>10<' +
      '/ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>isNullOrEmpty</TEXT>'#13 +
      #10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9'<NO' +
      'ME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>FONTE</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TOb' +
      'jVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</T' +
      'ObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Ou" REALNAME="oprOr">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME=' +
      '"&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13 +
      #10'<PARAMS>'#13#10'<VARIABLE NAME="ID"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCT' +
      'ION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullO' +
      'rEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="TOKEN"/>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'#13#10'<FUNCTION NAME="&#201;&#x20;Nulo&#x20;ou&#x20;Vazio" REALN' +
      'AME="isNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="PES_COD_SOLICITA' +
      'NTE"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="&#201;&#x20;Nulo' +
      '&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIA' +
      'BLE NAME="FONTE"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'
    Loop = False
  end
  object FlowLine40: TFlowLine
    Left = 645
    Top = 543
    Width = 64
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
    InputNames = 'FlowDecision9'
    OutputNames = 'FlowExpression5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector9: TFlowConnector
    Left = 270
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
    InputNames = 'FlowLine43'
    OutputNames = 'FlowLine42'
  end
  object FlowLine42: TFlowLine
    Left = 265
    Top = 542
    Width = 40
    Height = 190
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
    InputNames = 'FlowConnector9'
    OutputNames = 'FlowConnector8'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression11: TFlowExpression
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
    InputNames = 'FlowLine41'
    OutputNames = 'FlowLine43'
    Description = 'erro de parametro nulo'
    Text = '{"status":"ERRO","mensagem":"Par'#226'metro inv'#225'lido","result":""}'
    ReturnVar = 'Retorno Ws'
    Expression = 
      '<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;status&quot;:&quot' +
      ';ERRO&quot;,'#13#10'&quot;mensagem&quot;:&quot;Par&#226;metro&#x20;inv' +
      '&#225;lido&quot;,'#13#10'&quot;result&quot;:&quot;&quot;}</CONSTANT>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>2</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"ERRO",'#13#10'"mensag' +
      'em":"Par'#226'metro inv'#225'lido",'#13#10'"result":""}</VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO' +
      '>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
  end
  object FlowLine41: TFlowLine
    Left = 455
    Top = 543
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
    InputNames = 'FlowDecision9'
    OutputNames = 'FlowExpression11'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine43: TFlowLine
    Left = 265
    Top = 542
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowConnector9'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector10: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine37'
  end
  object FlowLine9: TFlowLine
    Left = 835
    Top = 692
    Width = 40
    Height = 266
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
    OutputNames = 'FlowConnector10'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector11: TFlowConnector
    Left = 840
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
    InputNames = 'FlowLine37'
    OutputNames = 'FlowLine38'
  end
  object FlowLine36: TFlowLine
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowDecision9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine38: TFlowLine
    Left = 835
    Top = 242
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
    InputNames = 'FlowConnector11'
    OutputNames = 'FlowExpression22'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine10: TFlowLine
    Left = 1025
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
    InputNames = 'FlowExpression22'
    OutputNames = 'FlowSubRoutine1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression13: TFlowExpression
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
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine39'
    Description = 'Atributo cabe'#231'alho'
    Text = 
      'Resposta Web: Atribuir Valor ao Cabe'#231'alho(Content-Type,applicati' +
      'on/json)'
    Expression = 
      '<FUNCTION NAME="Resposta&#x20;Web:&#x20;Atribuir&#x20;Valor&#x20' +
      ';ao&#x20;Cabe&#231;alho" REALNAME="ebfSetHeader">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >Content-Type</CONSTANT>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >application/json</CONSTANT>'#13 +
      #10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetHeader</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCons' +
      't>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>Content-Type</VALOR' +
      '>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO' +
      '>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPEC' +
      'IALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Let' +
      'ras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10'<VALOR>application/json</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine39: TFlowLine
    Left = 645
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowExpression12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine1: TFlowLine
    Left = 645
    Top = 242
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
    OutputNames = 'FlowExpression13'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine37: TFlowLine
    Left = 835
    Top = 242
    Width = 40
    Height = 490
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
    InputNames = 'FlowConnector10'
    OutputNames = 'FlowConnector11'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine11: TFlowLine
    Left = 1025
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowExpression19'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
    Left = 590
    Top = 833
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
    Description = 'TOKEN = TOKEN ?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>TOKEN</TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariab' +
      'le>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>op' +
      'rIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjFunction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT' +
      '>isEqual</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>5</ID>'#13#10'<NOME>VARIABLE</NOME' +
      '>'#13#10'<TEXT>FONTE</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT<' +
      '/NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<VALOR>R</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
      'RAMS>'#13#10'</TObjFunction>'#13#10'<TObjRule>'#13#10'<ID>7</ID>'#13#10'<NOME>CALLRULE</' +
      'NOME>'#13#10'<TEXT>FUNCAO&#x20;-&#x20;Token&#x20;Pessoa</TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Variable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Tabela</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'</TObjVariabl' +
      'e>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10'<VALOR>PES_COD' +
      '</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>5</FIELDINDEX>'#13#10'<GUID></GUID>'#13 +
      #10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFun' +
      'ction>'#13#10'</PARAMS>'#13#10'<RULEID>270</RULEID>'#13#10'</TObjRule>'#13#10'<TObjRule>' +
      #13#10'<ID>8</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>FUNCAO&#x20;-&#x20;To' +
      'ken&#x20;Mobile</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75</MKR_VER' +
      'SION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>8</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</' +
      'TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIA' +
      'BLE</NOME>'#13#10'<TEXT>Tabela</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela<' +
      '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</' +
      'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10'<VALOR>PES_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
      '5</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
      'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<RULEID>288</RU' +
      'LEID>'#13#10'</TObjRule>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="TOKEN"/>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13 +
      #10'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE' +
      ' NAME="FONTE"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >R</CONST' +
      'ANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CALLRULE ID="270" NAME="FUNCAO&#x' +
      '20;-&#x20;Token&#x20;Pessoa" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNCT' +
      'ION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NA' +
      'ME="Tabela"/>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "5" >' +
      'PES_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRUL' +
      'E>'#13#10'<CALLRULE ID="288" NAME="FUNCAO&#x20;-&#x20;Token&#x20;Mobil' +
      'e" PARAMSCOUNT="1"> '#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Campo" REALNAME=' +
      '"ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT T' +
      'YPE="Campo" NULL="FALSE" INDEX = "5" >PES_COD</CONSTANT>'#13#10'</PARA' +
      'MS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowExpression2: TFlowExpression
    Left = 400
    Top = 834
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
    Description = 'retorno erro'
    Text = 
      '{"status":"ERRO","mensagem":"Dado n'#227'o encontrado","result":"Toke' +
      'n Inv'#225'lido"}'
    ReturnVar = 'Retorno Ws'
    Expression = 
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">{"status":"ERRO",'#13#10'"mensag' +
      'em":"Dado n'#227'o encontrado",'#13#10'"result":"Token Inv'#225'lido"}</CONSTANT' +
      '>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>6</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>{"status":"ERRO",'#13#10'"mensag' +
      'em":"Dado n'#227'o encontrado",'#13#10'"result":"Token Inv'#225'lido"}</VALOR>'#13#10 +
      #9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<N' +
      'ULO>FALSE</NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>' +
      #13#10#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
  end
  object FlowLine4: TFlowLine
    Left = 645
    Top = 693
    Width = 60
    Height = 265
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
    OutputNames = 'FlowDecision1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine5: TFlowLine
    Left = 1025
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
    InputNames = 'FlowExpression19'
    OutputNames = 'FlowDecision4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 1025
    Top = 646
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowSubRoutine3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine12: TFlowLine
    Left = 1025
    Top = 723
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
    InputNames = 'FlowSubRoutine3'
    OutputNames = 'FlowExpression16'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine2: TFlowSubRoutine
    Left = 1160
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
    Description = 'WsAbrirRelatorio'
    Id = 619
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjRule>'#13 +
          #10'<ID>1</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>WsCriptografia</TEXT>'#13 +
          #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
          'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
          'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
          'ALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
          'EL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>DAM-02</VALOR>'#13 +
          #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
          'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
          'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NO' +
          'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
          's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
          '.17</MKR_VERSION>'#13#10'<VALOR>C</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
          #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
          '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
          'Const>'#13#10'</PARAMS>'#13#10'<RULEID>146</RULEID>'#13#10'</TObjRule>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>{&quot;ttl_tag&q' +
          'uot;:&quot;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
          'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
          'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFun' +
          'ction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TE' +
          'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE' +
          '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
          '<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Tabela<' +
          '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
          'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVa' +
          'riable>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
          '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Campo</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>TT' +
          'L_TAG</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
          'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>6</FIELDINDEX>'#13#10'<GUID></G' +
          'UID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TO' +
          'bjFunction>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
          'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
          '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VAL' +
          'OR>&quot;,&#x20;&quot;dam_cod&quot;:&#x20;&quot;</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>F' +
          'UNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10 +
          '<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<' +
          'ID>6</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Json&#x20;Retorno</TEXT>' +
          #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'</TObjVariab' +
          'le>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
          'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>resul' +
          't</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML' +
          '>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID' +
          '>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
          'unction>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT>' +
          '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FA' +
          'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.17</MKR_VERSION>'#13#10'<VALOR>' +
          '&quot;}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
          'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
          '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<' +
          '/TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'codigousuario'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>PES_COD_SOLICITANT' +
          'E</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>' +
          'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TOb' +
          'jVariable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'formato'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>PDF</VALOR>'#13#10#9#9'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NU' +
          'LO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'abrir'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>false</VALOR>'#13#10#9#9'<DMLTYPE>' +
          'dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</' +
          'NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIA' +
          'LCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'fonte'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>FONTE</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13 +
          #10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
          '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'chamado a partir de agendamento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
          '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
          'ALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 
          '<CALLRULE ID="146" NAME="WsCriptografia" PARAMSCOUNT="2"> '#13#10'<PAR' +
          'AMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >DAM-02</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >C</CONSTANT>'#13#10'</PARAMS>'#13#10 +
          '</CALLRULE>'#13#10
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >{&quot;ttl_tag&q' +
          'uot;:&quot;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLF' +
          'ield">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="Tabela"/>'#13#10'<CONSTANT TYPE="Cam' +
          'po" NULL="FALSE" INDEX = "6" >TTL_TAG</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
          'UNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;,&#x20;&q' +
          'uot;dam_cod&quot;:&#x20;&quot;</CONSTANT>'#13#10'<FUNCTION NAME="JSON&' +
          '#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13 +
          #10'<PARAMS>'#13#10'<VARIABLE NAME="Json&#x20;Retorno"/>'#13#10'<CONSTANT TYPE=' +
          '"Letras" NULL="FALSE"  >result</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
          '>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&quot;}</CONSTANT>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'codigousuario'
        ParamType = ptInput
        Value = '<VARIABLE NAME="PES_COD_SOLICITANTE"/>'
      end
      item
        DataType = ftString
        Name = 'formato'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">PDF</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'abrir'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="L'#243'gico" NULL="FALSE">false</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'fonte'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="FONTE"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'chamado a partir de agendamento'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 'WsCriptografia(DAM-02,C)'
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o({"ttl_tag":",Campo(@Tabela,TTL_TAG),", "dam_cod": "' +
          ',JSON - Obter Valor(@Json Retorno,result),"})'
      end
      item
        DataType = ftString
        Name = 'codigousuario'
        ParamType = ptInput
        Value = '@PES_COD_SOLICITANTE'
      end
      item
        DataType = ftString
        Name = 'formato'
        ParamType = ptInput
        Value = 'PDF'
      end
      item
        DataType = ftString
        Name = 'abrir'
        ParamType = ptInput
        Value = 'false'
      end
      item
        DataType = ftString
        Name = 'fonte'
        ParamType = ptInput
        Value = '@FONTE'
      end
      item
        DataType = ftString
        Name = 'chamado a partir de agendamento'
        ParamType = ptInput
        Value = 'Nulo'
      end>
    Return = 'retorno'
    ObjectName = 'WsAbrirRelatorio'
    RealName = 'CALLRULE'
  end
end

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
    InputParams = 'UrlApi,Letras,50,'
    Variables = 
      'JsonOSM,Variante,,;mapaTipo,Variante,,;Contador,Inteiro,,1;Taman' +
      'ho da Lista,Inteiro,,;ListaChaves,Variante,,;Endereco,Variante,,' +
      ';ContadorTipos,Inteiro,,1;Tamanho da Lista Tipos,Inteiro,,;Lista' +
      'Tipos,Variante,,;valorTipo,Letras,50,;address,Variante,,;jsonTex' +
      'to,Letras,50,'
    WorkFormCod = -1
  end
  object FlowExpression1: TFlowExpression
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
    InputNames = 'FlowLine9'
    OutputNames = 'FlowLine8'
    Description = 'Monta mapa com os tipos'
    Text = 
      'Criar Objeto Mapa com Par'#226'metros(Criar lista a partir dos Elemen' +
      'tos(logradouro,Quebrar Texto(road;street;footway;path;pedestrian' +
      ';cycleway;motorway;residential;living_street;service;track;bridl' +
      'eway;busway;lane;place,;)),Criar lista a partir dos Elementos(nu' +
      'mero,Quebrar Texto(house_number;house_name;unit;block;flats,;)),' +
      'Criar lista a partir dos Elementos(bairro,Quebrar Texto(suburb;n' +
      'eighbourhood;quarter;city_district;hamlet;locality;borough;resid' +
      'ential;village,;)),Criar lista a partir dos Elementos(cidade,Que' +
      'brar Texto(city;town;village;municipality;county;state_district;' +
      'region,;)),Criar lista a partir dos Elementos(estado,Quebrar Tex' +
      'to(state;state_district;ISO3166-2-lvl4,;)),Criar lista a partir ' +
      'dos Elementos(pais,Quebrar Texto(country;country_code;ISO3166-1,' +
      ';)),Criar lista a partir dos Elementos(cep,Quebrar Texto(postcod' +
      'e;postal_code,;)))'
    ReturnVar = 'mapaTipo'
    Expression = 
      #9'<FUNCTION NAME="Criar Objeto Mapa com Par'#226'metros" REALNAME="ebf' +
      'MapCreateFromList">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Criar lista ' +
      'a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9'<PA' +
      'RAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">logradouro</CON' +
      'STANT>'#13#10#9#9#9#9#9'<FUNCTION NAME="Quebrar Texto" REALNAME="ebfSplit">' +
      #13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">ro' +
      'ad;street;footway;path;pedestrian;cycleway;motorway;residential;' +
      'living_street;service;track;bridleway;busway;lane;place</CONSTAN' +
      'T>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">;</CONSTANT>'#13#10#9#9 +
      #9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10 +
      #9#9#9'<FUNCTION NAME="Criar lista a partir dos Elementos" REALNAME=' +
      '"ebfListParamsCreate">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE">numero</CONSTANT>'#13#10#9#9#9#9#9'<FUNCTION NAME="Quebrar ' +
      'Texto" REALNAME="ebfSplit">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TY' +
      'PE="Letras" NULL="FALSE">house_number;house_name;unit;block;flat' +
      's</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">;</CON' +
      'STANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</F' +
      'UNCTION>'#13#10#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elementos"' +
      ' REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE">bairro</CONSTANT>'#13#10#9#9#9#9#9'<FUNCTION NAME' +
      '="Quebrar Texto" REALNAME="ebfSplit">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">suburb;neighbourhood;quarter;' +
      'city_district;hamlet;locality;borough;residential;village</CONST' +
      'ANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">;</CONSTANT>'#13#10 +
      #9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>' +
      #13#10#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elementos" REALNAM' +
      'E="ebfListParamsCreate">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE">cidade</CONSTANT>'#13#10#9#9#9#9#9'<FUNCTION NAME="Quebra' +
      'r Texto" REALNAME="ebfSplit">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE">city;town;village;municipality;county' +
      ';state_district;region</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras' +
      '" NULL="FALSE">;</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10 +
      #9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<FUNCTION NAME="Criar lista a ' +
      'partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9'<PARA' +
      'MS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">estado</CONSTANT>' +
      #13#10#9#9#9#9#9'<FUNCTION NAME="Quebrar Texto" REALNAME="ebfSplit">'#13#10#9#9#9#9 +
      #9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">state;st' +
      'ate_district;ISO3166-2-lvl4</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="L' +
      'etras" NULL="FALSE">;</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTI' +
      'ON>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<FUNCTION NAME="Criar lis' +
      'ta a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">pais</CONSTA' +
      'NT>'#13#10#9#9#9#9#9'<FUNCTION NAME="Quebrar Texto" REALNAME="ebfSplit">'#13#10#9 +
      #9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">count' +
      'ry;country_code;ISO3166-1</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE">;</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION' +
      '>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<FUNCTION NAME="Criar lista' +
      ' a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cep</CONSTANT>' +
      #13#10#9#9#9#9#9'<FUNCTION NAME="Quebrar Texto" REALNAME="ebfSplit">'#13#10#9#9#9#9 +
      #9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">postcode' +
      ';postal_code</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE">;</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARA' +
      'MS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfMapCreateFromList</TEXT>'#13#10#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10 +
      #9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>logradouro</VALOR>'#13#10#9#9#9#9#9#9'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<' +
      'NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUI' +
      'D></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13 +
      #10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NO' +
      'ME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSplit</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9 +
      #9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME' +
      '>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIP' +
      'O>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>road;st' +
      'reet;footway;path;pedestrian;cycleway;motorway;residential;livin' +
      'g_street;service;track;bridleway;busway;lane;place</VALOR>'#13#10#9#9#9#9 +
      #9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9 +
      #9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10#9#9#9#9#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>' +
      #13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9 +
      #9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</' +
      'PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>' +
      #13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10 +
      #9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>numero</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO' +
      '>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></' +
      'GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9 +
      #9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13 +
      #10#9#9#9#9#9#9'<TEXT>ebfSplit</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIP' +
      'O>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<' +
      'TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10 +
      #9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>L' +
      'etras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9 +
      #9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>house_numb' +
      'er;house_name;unit;block;flats</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FA' +
      'LSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID><' +
      '/GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>' +
      #13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTAN' +
      'T</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9 +
      #9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>' +
      ';</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TOb' +
      'jFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjFunction>' +
      #13#10#9#9#9#9'<ID>12</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfListP' +
      'aramsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>' +
      '13</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10#9#9#9#9#9#9'<VALOR>bairro</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
      '>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9 +
      #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjFunction>'#13 +
      #10#9#9#9#9#9#9'<ID>14</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebf' +
      'Split</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9 +
      #9#9#9#9'<ID>15</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></' +
      'TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9 +
      #9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>suburb;neighbourhood;quart' +
      'er;city_district;hamlet;locality;borough;residential;village</VA' +
      'LOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1' +
      '</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>' +
      '16</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
      #9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>F' +
      'ALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID>' +
      '</GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst' +
      '>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TO' +
      'bjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>17</ID>'#13#10#9#9#9#9'<NOME>FUNCT' +
      'ION</NOME>'#13#10#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE' +
      '</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>' +
      #13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>18</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOM' +
      'E>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Let' +
      'ras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>cidade</VALOR>'#13#10#9#9 +
      #9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9 +
      #9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TO' +
      'bjConst>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>19</ID>'#13#10#9#9#9#9#9#9'<NOME>FU' +
      'NCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSplit</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PAR' +
      'AMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>20</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CON' +
      'STANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9 +
      #9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VA' +
      'LOR>city;town;village;municipality;county;state_district;region<' +
      '/VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<' +
      'ID>21</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>' +
      #13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NUL' +
      'O>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GU' +
      'ID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjCo' +
      'nst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'<' +
      '/TObjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>22</ID>'#13#10#9#9#9#9'<NOME>FU' +
      'NCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FA' +
      'LSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARA' +
      'MS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>23</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</' +
      'NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>' +
      'Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>estado</VALOR>'#13 +
      #10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'<' +
      '/TObjConst>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>24</ID>'#13#10#9#9#9#9#9#9'<NOME' +
      '>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSplit</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<' +
      'PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>25</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>' +
      'CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>' +
      #13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9 +
      '<VALOR>state;state_district;ISO3166-2-lvl4</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
      #9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9 +
      #9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9 +
      '</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>26</ID>'#13#10#9#9#9#9#9#9#9#9'<' +
      'NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9 +
      #9#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
      #9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9 +
      #9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>' +
      #13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<T' +
      'ObjFunction>'#13#10#9#9#9#9'<ID>27</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<T' +
      'EXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>' +
      'Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9#9#9'<ID>28</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></' +
      'TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>pais</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE<' +
      '/NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10 +
      #9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObj' +
      'Function>'#13#10#9#9#9#9#9#9'<ID>29</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9 +
      #9'<TEXT>ebfSplit</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Vari' +
      'ante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9#9#9#9#9'<ID>30</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9 +
      #9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>country;country_' +
      'code;ISO3166-1</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9 +
      #9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9 +
      #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9#9#9#9#9'<ID>31</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9 +
      #9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9 +
      #9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10 +
      #9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9 +
      '</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>33</ID' +
      '>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfListParamsCreate</TEX' +
      'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>34</ID>'#13#10#9#9#9#9#9#9'<' +
      'NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>' +
      'cep</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1<' +
      '/FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALC' +
      'ODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>35</ID>'#13 +
      #10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSplit</TEXT>'#13#10#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>36</ID>'#13#10#9#9 +
      #9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10#9#9#9#9#9#9#9#9'<VALOR>postcode;postal_code</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9 +
      #9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9 +
      #9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</T' +
      'ObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>37</ID>'#13#10#9#9#9#9#9#9#9#9'<NOM' +
      'E>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      #9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9 +
      #9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARA' +
      'MS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision2: TFlowDecision
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
    InputNames = 'FlowLine3;FlowLine7'
    OutputNames = 'FlowLine4;FlowLine16'
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine7'
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3'
    Description = 'Tamanho da lista'
    Text = 'Tamanho da Lista(@ListaChaves)'
    ReturnVar = 'Tamanho da Lista'
    Expression = 
      #9'<FUNCTION NAME="Tamanho da Lista" REALNAME="ebfListLength">'#13#10#9#9 +
      '<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="ListaChaves"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUN' +
      'CTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfListLength</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>ListaChaves</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</T' +
      'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3' +
      '.9.0.1</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFu' +
      'nction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression3: TFlowExpression
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine2'
    Description = 'Criar Objeto Lista'
    Text = 'Quebrar Texto(logradouro;numero;bairro;cidade;estado;cep;pais,;)'
    ReturnVar = 'ListaChaves'
    Expression = 
      #9'<FUNCTION NAME="Quebrar Texto" REALNAME="ebfSplit">'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">logradouro;numero;bair' +
      'ro;cidade;estado;cep;pais</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras"' +
      ' NULL="FALSE">;</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSplit</TEXT>'#13#10#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10#9#9#9#9'<VALOR>logradouro;numero;bairro;cidade;estado;cep;pais</' +
      'VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjCo' +
      'nst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13 +
      #10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>' +
      #13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunc' +
      'tion>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 340
    Top = 543
    Width = 80
    Height = 115
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
    Left = 530
    Top = 543
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
    InputNames = 'FlowExpression2'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 720
    Top = 543
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
  object FlowLine8: TFlowLine
    Left = 265
    Top = 571
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
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression5: TFlowExpression
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
    OutputNames = 'FlowLine9'
    Description = 'Cria json de endereco'
    Text = 
      'JSON - Criar JSON a Partir dos Elementos(Criar lista a partir do' +
      's Elementos(Criar lista a partir dos Elementos(logradouro,),Cria' +
      'r lista a partir dos Elementos(numero,),Criar lista a partir dos' +
      ' Elementos(bairro,),Criar lista a partir dos Elementos(cidade,),' +
      'Criar lista a partir dos Elementos(estado,),Criar lista a partir' +
      ' dos Elementos(cep,),Criar lista a partir dos Elementos(pais,),C' +
      'riar lista a partir dos Elementos(complemento,JSON - Obter Valor' +
      '(@JsonOSM,name)),Criar lista a partir dos Elementos(latitude,JSO' +
      'N - Obter Valor(@JsonOSM,lat)),Criar lista a partir dos Elemento' +
      's(longitude,JSON - Obter Valor(@JsonOSM,lon)),true))'
    ReturnVar = 'Endereco'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar JSON a Partir dos Elementos" REALN' +
      'AME="ebfJSONParamsCreate">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Criar' +
      ' lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elem' +
      'entos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">logradouro</CONSTANT>'#13#10#9#9#9#9#9 +
      #9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9#9#9'</PARAM' +
      'S>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a partir ' +
      'dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10 +
      #9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">numero</CONSTANT>'#13#10#9 +
      #9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9#9#9'</P' +
      'ARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a par' +
      'tir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PARAM' +
      'S>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">bairro</CONSTANT' +
      '>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a' +
      ' partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cidade</CONS' +
      'TANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9 +
      #9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lis' +
      'ta a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9 +
      #9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">estado</' +
      'CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT' +
      '>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar' +
      ' lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10 +
      #9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">cep<' +
      '/CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTAN' +
      'T>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Cria' +
      'r lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13 +
      #10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">pai' +
      's</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONST' +
      'ANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Cr' +
      'iar lista a partir dos Elementos" REALNAME="ebfListParamsCreate"' +
      '>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">c' +
      'omplemento</CONSTANT>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor' +
      '" REALNAME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9 +
      '<VARIABLE NAME="JsonOSM"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NUL' +
      'L="FALSE">name</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>' +
      #13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar ' +
      'lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9 +
      #9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">latit' +
      'ude</CONSTANT>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALN' +
      'AME="ebfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIAB' +
      'LE NAME="JsonOSM"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALS' +
      'E">lat</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9 +
      '</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Criar lista a ' +
      'partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9#9#9'<PA' +
      'RAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">longitude</CO' +
      'NSTANT>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="eb' +
      'fGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME' +
      '="JsonOSM"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">lon<' +
      '/CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</PARAM' +
      'S>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTAN' +
      'T TYPE="L'#243'gico" NULL="FALSE">true</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FU' +
      'NCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfJSONParamsCreate</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9 +
      #9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<' +
      'TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      #9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjF' +
      'unction>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<' +
      'TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<' +
      'TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9 +
      #9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>' +
      #13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO' +
      '>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9 +
      #9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>logradou' +
      'ro</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9 +
      #9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NU' +
      'LO>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GU' +
      'ID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjCo' +
      'nst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>' +
      #13#10#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebf' +
      'ListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Var' +
      'iante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjC' +
      'onst>'#13#10#9#9#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9 +
      #9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>numero</VALOR>'#13#10 +
      #9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>8</ID>' +
      #13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VE' +
      'RSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NUL' +
      'O>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10 +
      #9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9 +
      '</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>' +
      '9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfListParamsCr' +
      'eate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>' +
      #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
      #9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TE' +
      'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>bairro</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
      #9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9 +
      #9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9 +
      '</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<N' +
      'OME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9 +
      #9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9 +
      #9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9 +
      #9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13 +
      #10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID' +
      '>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_V' +
      'ERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>cidade</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FA' +
      'LSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID><' +
      '/GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>' +
      #13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT' +
      '</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9 +
      #9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR><' +
      '/VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFu' +
      'nction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNC' +
      'TION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>' +
      'FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9 +
      #9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<' +
      'NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9 +
      #9#9#9#9#9'<VALOR>estado</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
      #9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9 +
      #9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TO' +
      'bjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9 +
      #9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letr' +
      'as</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9 +
      #9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9 +
      #9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13 +
      #10#9#9#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS' +
      '>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTAN' +
      'T</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9 +
      #9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>' +
      'cep</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
      #9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TE' +
      'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<N' +
      'ULO>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<G' +
      'UID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjC' +
      'onst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction' +
      '>'#13#10#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>eb' +
      'fListParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Va' +
      'riante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9 +
      #9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>pais</VALOR>'#13#10#9 +
      #9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13 +
      #10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NULO' +
      '>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9 +
      #9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'<' +
      '/PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>9' +
      '</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfListParamsCre' +
      'ate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13 +
      #10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9 +
      #9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>complemento</VALOR>'#13#10#9#9#9#9#9#9#9#9 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      #9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9 +
      #9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9 +
      #9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfGetValueObjectJson<' +
      '/TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13 +
      #10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TObjVariab' +
      'le>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'<TEXT>JsonOSM</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9'<' +
      '/TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>name</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9 +
      #9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9 +
      #9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9 +
      #9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10 +
      #9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9 +
      #9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfListPa' +
      'ramsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante<' +
      '/TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13 +
      #10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEX' +
      'T></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>' +
      #13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>latitude</VALOR>'#13#10#9#9#9#9 +
      #9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13 +
      #10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfGetValueObjectJ' +
      'son</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TObjVa' +
      'riable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9#9#9#9#9#9#9'<TEXT>JsonOSM</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      #9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10 +
      #9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>lat</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction' +
      '>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9 +
      #9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfLis' +
      'tParamsCreate</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Varian' +
      'te</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjCons' +
      't>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<' +
      'TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TI' +
      'PO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>longitude</VALOR>'#13#10 +
      #9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>9</' +
      'ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfGetValueObj' +
      'ectJson</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Variante' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TO' +
      'bjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOM' +
      'E>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>JsonOSM</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10 +
      #9#9#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9 +
      #9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</I' +
      'D>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9 +
      #9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>lon</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      #9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunc' +
      'tion>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONST' +
      'ANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L' +
      #243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>true</VALOR>'#13#10#9#9#9#9'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NUL' +
      'O>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUI' +
      'D>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine9: TFlowLine
    Left = 265
    Top = 496
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision3: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine11;FlowLine15'
    OutputNames = 'FlowLine12;FlowLine5'
    Description = 'Possui elemento ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isMinorOrEqual</TEXT>'#13#10#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TO' +
      'bjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEX' +
      'T>ContadorTipos</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro<' +
      '/TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION' +
      '>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjVariable>'#13#10 +
      #9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Tamanho da ' +
      'Lista Tipos</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIP' +
      'O>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0' +
      '.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFun' +
      'ction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Menor ou Igual" REALNAME="isMinorOrEqual">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="ContadorTipos"/>'#13#10#9#9#9'<VARIABLE NAME=' +
      '"Tamanho da Lista Tipos"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = True
  end
  object FlowExpression7: TFlowExpression
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine15'
    Description = 'Incrementa o contador'
    Text = 'Soma(@ContadorTipos,1)'
    ReturnVar = 'ContadorTipos'
    Expression = 
      #9'<FUNCTION NAME="Soma" REALNAME="oprAdd">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIA' +
      'BLE NAME="ContadorTipos"/>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FA' +
      'LSE">1</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprAdd</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
      #13#10#9#9'<TIPO>N'#250'mero</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>Contador' +
      'Tipos</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.0.1</' +
      'MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>' +
      #13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>1</VA' +
      'LOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9 +
      #9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjCons' +
      't>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression8: TFlowExpression
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
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine11'
    Description = 'Tamanho da lista'
    Text = 'Tamanho da Lista(@ListaTipos)'
    ReturnVar = 'Tamanho da Lista Tipos'
    Expression = 
      #9'<FUNCTION NAME="Tamanho da Lista" REALNAME="ebfListLength">'#13#10#9#9 +
      '<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="ListaTipos"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNC' +
      'TION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfListLength</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>3.9.0.1</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>ListaTipos</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
      'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>3.' +
      '9.0.1</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFun' +
      'ction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression9: TFlowExpression
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine10'
    Description = 'Criar Objeto Lista'
    Text = 
      'Obter Elemento do Mapa(@mapaTipo,Obter Objeto da Lista(@ListaCha' +
      'ves,@Contador))'
    ReturnVar = 'ListaTipos'
    Expression = 
      #9'<FUNCTION NAME="Obter Elemento do Mapa" REALNAME="ebfMapGetObje' +
      'ct">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="mapaTipo"/>'#13#10#9#9#9'<FUNCTION N' +
      'AME="Obter Objeto da Lista" REALNAME="ebfGetElementFromList">'#13#10#9 +
      #9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="ListaChaves"/>'#13#10#9#9#9#9#9'<VARIABLE' +
      ' NAME="Contador"/>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10 +
      #9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfMapGetObject</TEXT>'#13#10#9#9'<SQL>FA' +
      'LSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
      '<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<' +
      'TEXT>mapaTipo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjFunction>'#13#10#9 +
      #9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGetElemen' +
      'tFromList</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID' +
      '>5</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ListaChaves</T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9 +
      #9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Contador</' +
      'TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33' +
      '</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFu' +
      'nction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine10: TFlowLine
    Left = 720
    Top = 468
    Width = 80
    Height = 40
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine11: TFlowLine
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine15: TFlowLine
    Left = 1100
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine4: TFlowLine
    Left = 645
    Top = 496
    Width = 60
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression9'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression6: TFlowExpression
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
    InputNames = 'FlowLine29;FlowLine26'
    OutputNames = 'FlowLine19'
    Description = 'Atualiza JSON de endereco'
    Text = 
      'JSON - Atualizar Valor(@Endereco,Obter Objeto da Lista(@ListaCha' +
      'ves,@Contador),@valorTipo)'
    ReturnVar = 'Endereco'
    Expression = 
      #9'<FUNCTION NAME="JSON - Atualizar Valor" REALNAME="ebfUpdateValu' +
      'eObjectJson">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Endereco"/>'#13#10#9#9#9'<F' +
      'UNCTION NAME="Obter Objeto da Lista" REALNAME="ebfGetElementFrom' +
      'List">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="ListaChaves"/>'#13#10#9#9#9#9#9 +
      '<VARIABLE NAME="Contador"/>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<' +
      'VARIABLE NAME="valorTipo"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfUpdateValueObjectJson</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PAR' +
      'AMS>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOM' +
      'E>'#13#10#9#9#9#9'<TEXT>Endereco</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>V' +
      'ariante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjFun' +
      'ction>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebf' +
      'GetElementFromList</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Varia' +
      'nte</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9 +
      #9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ListaC' +
      'haves</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Co' +
      'ntador</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO' +
      '>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</TObjFunction>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9'<NOME>VA' +
      'RIABLE</NOME>'#13#10#9#9#9#9'<TEXT>valorTipo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9 +
      #9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowEnd2: TFlowEnd
    Left = 646
    Top = 704
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
    InputNames = 'FlowLine31'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Endereco</TEXT>'#13#10#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</RO' +
      'OT>'#13#10
    Expression = #9'<VARIABLE NAME="Endereco"/>'#13#10
    Text = '@Endereco'
    OutPutParam = 'Variante,    '
  end
  object FlowExpression10: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine23'
    OutputNames = 'FlowLine17'
    Description = 'Obter valor do tipo'
    Text = 
      'JSON - Obter Valor(@jsonTextoddress,Obter Objeto da Lista(@Lista' +
      'Tipos,@ContadorTipos))'
    ReturnVar = 'valorTipo'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="address"/>'#13#10#9#9#9'<FUNCTION ' +
      'NAME="Obter Objeto da Lista" REALNAME="ebfGetElementFromList">'#13#10 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="ListaTipos"/>'#13#10#9#9#9#9#9'<VARIABLE' +
      ' NAME="ContadorTipos"/>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARA' +
      'MS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10 +
      #9#9#9#9'<TEXT>address</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Varian' +
      'te</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjFunction' +
      '>'#13#10#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGetEl' +
      'ementFromList</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9 +
      '<ID>9</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ListaTipos<' +
      '/TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9 +
      #9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Contado' +
      'rTipos</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO' +
      '>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision1: TFlowDecision
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
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine13;FlowLine18'
    Description = 'Valor '#233' nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isNullOrEmpty</TEXT>'#13#10#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TOb' +
      'jVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT' +
      '>valorTipo</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunct' +
      'ion>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty">'#13#10#9#9'<' +
      'PARAMS>'#13#10#9#9#9'<VARIABLE NAME="valorTipo"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTI' +
      'ON>'#13#10
    Loop = True
  end
  object FlowConnector2: TFlowConnector
    Left = 1220
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
    InputNames = 'FlowLine13;FlowLine20'
    OutputNames = 'FlowLine14'
  end
  object FlowLine13: TFlowLine
    Left = 1100
    Top = 243
    Width = 140
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
    OutputNames = 'FlowConnector2'
    Description = 'SIM'
    Region = 0
    Style = psDash
    Decision = True
  end
  object FlowLine14: TFlowLine
    Left = 1215
    Top = 257
    Width = 40
    Height = 222
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
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression11: TFlowExpression
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine21'
    Description = 'Obter itiner'#225'rio pelo OSM'
    Text = 'REST - Consumir Webservice - 2.0(@UrlApi,GET,,,,,UTF-8,,,)'
    ReturnVar = 'JsonOSM'
    Expression = 
      #9'<FUNCTION NAME="REST - Consumir Webservice - 2.0" REALNAME="ebf' +
      'RestFulCallService">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="UrlApi"/>'#13#10 +
      #9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">GET</CONSTANT>'#13#10#9#9#9'<CONS' +
      'TANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="L' +
      'etras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL=' +
      '"TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CON' +
      'STANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">UTF-8</CONSTANT>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTA' +
      'NT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfRestFulCallService</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9'<TEXT>UrlApi</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9 +
      '<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<V' +
      'ALOR>GET</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTA' +
      'NT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRU' +
      'E</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9 +
      #9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10 +
      #9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9 +
      #9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>CONSTA' +
      'NT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRU' +
      'E</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9 +
      #9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10 +
      #9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9 +
      #9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9'<NOME>CONSTA' +
      'NT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>UTF-8</VALOR>'#13#10#9#9#9#9'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NUL' +
      'O>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUI' +
      'D>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjCo' +
      'nst>'#13#10#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEX' +
      'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9'<NOME' +
      '>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<' +
      'TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<N' +
      'ULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GU' +
      'ID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjC' +
      'onst>'#13#10#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERS' +
      'ION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine1: TFlowLine
    Left = 265
    Top = 111
    Width = 40
    Height = 68
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
    OutputNames = 'FlowExpression11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression12: TFlowExpression
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
    InputNames = 'FlowLine24'
    OutputNames = 'FlowLine22'
    Description = 'Obter resultado'
    Text = 'JSON - Criar Objeto(JSON - Obter Valor(@JsonOSM,result))'
    ReturnVar = 'JsonOSM'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar Objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNA' +
      'ME="ebfGetValueObjectJson">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="' +
      'JsonOSM"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">result</CO' +
      'NSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
      '>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9 +
      #9#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
      #9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9 +
      '<TEXT>JsonOSM</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Varian' +
      'te</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>result</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO' +
      '>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></' +
      'GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
  end
  object FlowExpression13: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine23'
    Description = 'Obter address'
    Text = 'JSON - Criar Objeto(JSON - Obter Valor(@JsonOSM,address))'
    ReturnVar = 'address'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar Objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNA' +
      'ME="ebfGetValueObjectJson">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="' +
      'JsonOSM"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">address</C' +
      'ONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTIO' +
      'N>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9 +
      #9#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
      #9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9 +
      '<TEXT>JsonOSM</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Varian' +
      'te</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>address</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NUL' +
      'O>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID><' +
      '/GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9 +
      #9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10 +
      '</ROOT>'#13#10
  end
  object FlowLine12: TFlowLine
    Left = 1025
    Top = 421
    Width = 60
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowExpression13'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine23: TFlowLine
    Left = 1025
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
    InputNames = 'FlowExpression13'
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression14: TFlowExpression
    Left = 1160
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
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine20'
    Description = 'Contador=Tamnho da Lista'
    Text = '@Tamanho da Lista Tipos'
    ReturnVar = 'ContadorTipos'
    Expression = #9'<VARIABLE NAME="Tamanho da Lista Tipos"/>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Tamanho da Lista Tipos</TEXT>'#13#10#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9'</TObjVa' +
      'riable>'#13#10'</ROOT>'#13#10
  end
  object FlowLine19: TFlowLine
    Left = 1100
    Top = 93
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
    OutputNames = 'FlowExpression14'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine20: TFlowLine
    Left = 1215
    Top = 121
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
    InputNames = 'FlowExpression14'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression15: TFlowExpression
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine6'
    Description = 'ContadorTipos= 1'
    Text = '1'
    ReturnVar = 'ContadorTipos'
    Expression = #9'<CONSTANT TYPE="Inteiro" NULL="FALSE">1</CONSTANT>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>1</ID>'#13#10#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
      '>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<VALOR>1</VALOR>'#13#10#9#9'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NUL' +
      'O>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
  end
  object FlowLine5: TFlowLine
    Left = 1025
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowExpression15'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 910
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
    InputNames = 'FlowExpression15'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision4: TFlowDecision
    Left = 210
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
    InputNames = 'FlowLine21'
    OutputNames = 'FlowLine24;FlowLine25'
    Description = 'code=200?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tValueObjectJson</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>JsonOSM' +
      '</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
      #9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
      #9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VER' +
      'SION>'#13#10#9#9#9#9#9#9'<VALOR>code</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
      #9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>CONST' +
      'ANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>I' +
      'nteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>200</VALOR>'#13#10#9#9#9#9'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NUL' +
      'O>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUI' +
      'D>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJson"' +
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="JsonOSM"/>'#13#10#9#9#9#9#9'<CONSTANT' +
      ' TYPE="Letras" NULL="FALSE">code</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'<' +
      '/FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">200</CONSTA' +
      'NT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine21: TFlowLine
    Left = 265
    Top = 196
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowDecision4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine24: TFlowLine
    Left = 265
    Top = 273
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
    OutputNames = 'FlowExpression12'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowEnd1: TFlowEnd
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
    InputNames = 'FlowLine33'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
      'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Endereco</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>' +
      #13#10'</ROOT>'#13#10
    Expression = '<VARIABLE NAME="Endereco"/>'
    Text = '@Endereco'
    OutPutParam = 'Variante,    '
  end
  object FlowExpression16: TFlowExpression
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
    InputNames = 'FlowLine27'
    OutputNames = 'FlowLine28'
    Description = 'converte bahia para BA'
    Text = 'Se(Igual(@valorTipo,Bahia),BA,@valorTipo)'
    ReturnVar = 'valorTipo'
    Expression = 
      #9'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION' +
      ' NAME="Igual" REALNAME="isEqual">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE ' +
      'NAME="valorTipo"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">Ba' +
      'hia</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE' +
      '="Letras" NULL="FALSE">BA</CONSTANT>'#13#10#9#9#9'<VARIABLE NAME="valorTi' +
      'po"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprIf</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13 +
      #10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFuncti' +
      'on>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>isEqua' +
      'l</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9 +
      #9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>valorTipo</TEXT>'#13#10#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9 +
      #9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VAL' +
      'OR>Bahia</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13 +
      #10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9 +
      '<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10#9#9#9#9'<VALOR>BA</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9 +
      #9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>5' +
      '</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>valorTipo</TEXT>'#13#10#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9 +
      #9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision5: TFlowDecision
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
    ChangeDescription = True
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine26;FlowLine27'
    Description = 'uf?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfGe' +
      'tElementFromList</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variant' +
      'e</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9 +
      #9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ListaCh' +
      'aves</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>' +
      #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjVariable>' +
      #13#10#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Con' +
      'tador</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>' +
      #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'<' +
      '/TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTA' +
      'NT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Le' +
      'tras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>estado</VALOR>'#13#10#9#9#9#9'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NU' +
      'LO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GU' +
      'ID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAM' +
      'S>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="Obter Objeto da Lista" REALNAME="ebfGetElementFromLi' +
      'st">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="ListaChaves"/>'#13#10#9#9#9#9#9'<V' +
      'ARIABLE NAME="Contador"/>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE">estado</CONSTANT>'#13#10#9#9'</PARAMS>' +
      #13#10#9'</FUNCTION>'#13#10
    Loop = True
  end
  object FlowConnector1: TFlowConnector
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
    InputNames = 'FlowLine28'
    OutputNames = 'FlowLine29'
  end
  object FlowLine28: TFlowLine
    Left = 835
    Top = 107
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
    InputNames = 'FlowExpression16'
    OutputNames = 'FlowConnector1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine29: TFlowLine
    Left = 850
    Top = 93
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
    InputNames = 'FlowConnector1'
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine17: TFlowLine
    Left = 1025
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine18: TFlowLine
    Left = 1025
    Top = 198
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
    InputNames = 'FlowDecision1'
    OutputNames = 'FlowDecision5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine26: TFlowLine
    Left = 1025
    Top = 121
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
    OutputNames = 'FlowExpression6'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine27: TFlowLine
    Left = 910
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowExpression16'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression17: TFlowExpression
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
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine31'
    Text = 'Executar Atualiza'#231#227'o(SQL ATUALIZA'#199#195'O,)'
    Expression = 
      #9'<FUNCTION NAME="Executar Atualiza'#231#227'o" REALNAME="ebfSQLExecuteUp' +
      'date">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="SQL Atualiza'#231#227'o" NULL="FA' +
      'LSE"><SQL TYPE="INSERT">'#13#10#9#9#9#9#9'<TABLE>SMB_LOG_API</TABLE>'#13#10#9#9#9#9#9 +
      '<SQLFIELD NAME="LAP_API">'#13#10#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">OSM</CONSTANT>'#13#10#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="LAP' +
      '_MENSAGEM">'#13#10#9#9#9#9#9#9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfCo' +
      'ncat">'#13#10#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">JSON FORMATADO OSM: </CONSTANT>'#13#10#9#9#9#9#9#9#9#9'<FUNCTION NAME="J' +
      'SON - Obter Texto" REALNAME="ebfGetJSONText">'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>' +
      #13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Endereco"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYP' +
      'E="Inteiro" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9 +
      #9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'</SQLFIE' +
      'LD>'#13#10#9#9#9#9#9'<SQLFIELD NAME="LAP_DATA_HORA_REGISTRO">'#13#10#9#9#9#9#9#9'<FUNCT' +
      'ION NAME="Hoje" REALNAME="ebfDateToday">'#13#10#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9 +
      #9#9'</SQLFIELD>'#13#10#9#9#9#9'</SQL>'#13#10#9#9#9'</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Le' +
      'tras" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteUpdate</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<' +
      'TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>SQL Atualiza'#231#227'o</T' +
      'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALOR><SQL TYPE="INSERT">'#13#10#9#9#9#9#9#9'<TA' +
      'BLE>SMB_LOG_API</TABLE>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="LAP_API">'#13#10#9#9#9#9#9#9 +
      #9'<CONSTANT TYPE="Letras" NULL="FALSE">OSM</CONSTANT>'#13#10#9#9#9#9#9#9'</SQ' +
      'LFIELD>'#13#10#9#9#9#9#9#9'<SQLFIELD NAME="LAP_MENSAGEM">'#13#10#9#9#9#9#9#9#9'<FUNCTION ' +
      'NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">JSON FORMATADO OSM: <' +
      '/CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Texto" REALNAM' +
      'E="ebfGetJSONText">'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NA' +
      'ME="Endereco"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="TRUE"' +
      '></CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13#10#9#9#9#9#9#9'<SQLFIE' +
      'LD NAME="LAP_DATA_HORA_REGISTRO">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Hoje" ' +
      'REALNAME="ebfDateToday">'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</SQLFIELD>'#13 +
      #10#9#9#9#9#9'</SQL>'#13#10#9#9#9#9'</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtInsert</DMLTYPE>'#13#10#9#9#9 +
      #9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8Uk9PVD4NCgk8VERNTFR' +
      'hYmxlPjxOQU1FPlNNQl9MT0dfQVBJPC9OQU1FPjxSRUFMTkFNRT5TTUJfTE9HX0F' +
      'QSTwvUkVBTE5BTUU+PERJQUdSQU1YTUw+PC9ESUFHUkFNWE1MPjwvVERNTFRhYmx' +
      'lPg0KCTxURE1MRmllbGQ+PE5BTUU+TEFQX0FQSTwvTkFNRT48UkVBTE5BTUU+TEF' +
      'QX0FQSTwvUkVBTE5BTUU+PERJQUdSQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGl' +
      'NUzR3SWo4K0RRbzhVazlQVkQ0TkNnazhWRTlpYWtOdmJuTjBQZzBLQ1FrOFNVUSt' +
      'NRHd2U1VRK0RRb0pDVHhPVDAxRlBrTlBUbE5VUVU1VVBDOU9UMDFGUGcwS0NRazh' +
      'WRVZZVkQ0OEwxUkZXRlErRFFvSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0p' +
      'QRlJKVUU4K1RHVjBjbUZ6UEM5VVNWQlBQZzBLQ1FrOFNVNURUMDFRUVZSSlZrVk1' +
      'Qa1pCVEZORlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvSkNUeE5TMUpmVmtWU1UwbFB' +
      'UajQxTGpBdU1DNHpNend2VFV0U1gxWkZVbE5KVDA0K0RRb0pDVHhXUVV4UFVqNVB' +
      'VMDA4TDFaQlRFOVNQZzBLQ1FrOFJFMU1WRmxRUlQ1a2RGTmxiR1ZqZER3dlJFMU1' +
      'WRmxRUlQ0TkNna0pQRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEt' +
      'DUWs4VGxWTVR6NUdRVXhUUlR3dlRsVk1UejROQ2drSlBFWkpSVXhFU1U1RVJWZyt' +
      'MVEU4TDBaSlJVeEVTVTVFUlZnK0RRb0pDVHhIVlVsRVBqd3ZSMVZKUkQ0TkNna0p' +
      'QRk5RUlVOSlFVeERUMFJGUGp3dlUxQkZRMGxCVEVOUFJFVStEUW9KUEM5VVQySnF' +
      'RMjl1YzNRK0RRbzhMMUpQVDFRK0RRbz08L0RJQUdSQU1YTUw+PFZBTFVFPk9TTTw' +
      'vVkFMVUU+DQoJCTxFWFBSRVNTSU9OPjxDT05TVEFOVCBUWVBFPSJMZXRyYXMiIE5' +
      'VTEw9IkZBTFNFIj5PU008L0NPTlNUQU5UPjwvRVhQUkVTU0lPTj4NCgk8L1RETUx' +
      'GaWVsZD4NCgk8VERNTEZpZWxkPjxOQU1FPkxBUF9NRU5TQUdFTTwvTkFNRT48UkV' +
      'BTE5BTUU+TEFQX01FTlNBR0VNPC9SRUFMTkFNRT48RElBR1JBTVhNTD5QRDk0Yld' +
      '3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2drOFZFOWlha1oxYm1' +
      'OMGFXOXVQZzBLQ1FrOFNVUStNVHd2U1VRK0RRb0pDVHhPVDAxRlBrWlZUa05VU1U' +
      '5T1BDOU9UMDFGUGcwS0NRazhWRVZZVkQ1bFltWkRiMjVqWVhROEwxUkZXRlErRFF' +
      'vSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pQRlJKVUU4K1RHVjBjbUZ6UEM' +
      '5VVNWQlBQZzBLQ1FrOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZ' +
      'CQlZFbFdSVXcrRFFvSkNUeE5TMUpmVmtWU1UwbFBUajQxTGpBdU1DNHpNend2VFV' +
      '0U1gxWkZVbE5KVDA0K0RRb0pDVHhRUVZKQlRWTStEUW9KQ1FrOFZFOWlha052Ym5' +
      'OMFBnMEtDUWtKQ1R4SlJENHlQQzlKUkQ0TkNna0pDUWs4VGs5TlJUNURUMDVUVkV' +
      'GT1ZEd3ZUazlOUlQ0TkNna0pDUWs4VkVWWVZENDhMMVJGV0ZRK0RRb0pDUWtKUEZ' +
      'OUlRENUdRVXhUUlR3dlUxRk1QZzBLQ1FrSkNUeFVTVkJQUGt4bGRISmhjend2VkV' +
      'sUVR6NE5DZ2tKQ1FrOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVFZ' +
      'CQlZFbFdSVXcrRFFvSkNRa0pQRTFMVWw5V1JWSlRTVTlPUGpVdU1DNHdMak16UEM' +
      '5TlMxSmZWa1ZTVTBsUFRqNE5DZ2tKQ1FrOFZrRk1UMUkrU2xOUFRpQkdUMUpOUVZ' +
      'SQlJFOGdUMU5OT2lBOEwxWkJURTlTUGcwS0NRa0pDVHhFVFV4VVdWQkZQbVIwVTJ' +
      'Wc1pXTjBQQzlFVFV4VVdWQkZQZzBLQ1FrSkNUeEVTVUZIVWtGTldFMU1Qand2UkV' +
      'sQlIxSkJUVmhOVEQ0TkNna0pDUWs4VGxWTVR6NUdRVXhUUlR3dlRsVk1UejROQ2d' +
      'rSkNRazhSa2xGVEVSSlRrUkZXRDR0TVR3dlJrbEZURVJKVGtSRldENE5DZ2tKQ1F' +
      'rOFIxVkpSRDQ4TDBkVlNVUStEUW9KQ1FrSlBGTlFSVU5KUVV4RFQwUkZQand2VTF' +
      'CRlEwbEJURU5QUkVVK0RRb0pDUWs4TDFSUFltcERiMjV6ZEQ0TkNna0pDVHhVVDJ' +
      'KcVJuVnVZM1JwYjI0K0RRb0pDUWtKUEVsRVBqTThMMGxFUGcwS0NRa0pDVHhPVDA' +
      'xRlBrWlZUa05VU1U5T1BDOU9UMDFGUGcwS0NRa0pDVHhVUlZoVVBtVmlaa2RsZEV' +
      'wVFQwNVVaWGgwUEM5VVJWaFVQZzBLQ1FrSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ' +
      '0TkNna0pDUWs4VkVsUVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFvSkNRa0pQRWxPUTA' +
      '5TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWtKQ1R' +
      '4TlMxSmZWa1ZTVTBsUFRqNDFMakF1TUM0ek16d3ZUVXRTWDFaRlVsTkpUMDQrRFF' +
      'vSkNRa0pQRkJCVWtGTlV6NE5DZ2tKQ1FrSlBGUlBZbXBXWVhKcFlXSnNaVDROQ2d' +
      'rSkNRa0pDVHhKUkQ0MFBDOUpSRDROQ2drSkNRa0pDVHhPVDAxRlBsWkJVa2xCUWt' +
      '4RlBDOU9UMDFGUGcwS0NRa0pDUWtKUEZSRldGUStSVzVrWlhKbFkyODhMMVJGV0Z' +
      'RK0RRb0pDUWtKQ1FrOFUxRk1Qa1pCVEZORlBDOVRVVXcrRFFvSkNRa0pDUWs4VkV' +
      'sUVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNna0pDUWtKQ1R4SlRrTlBUVkJCVkV' +
      'sV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2drSkNRa0pDVHhOUzF' +
      'KZlZrVlNVMGxQVGo0MUxqQXVNQzR6TXp3dlRVdFNYMVpGVWxOSlQwNCtEUW9KQ1F' +
      'rSkNUd3ZWRTlpYWxaaGNtbGhZbXhsUGcwS0NRa0pDUWs4VkU5aWFrTnZibk4wUGc' +
      'wS0NRa0pDUWtKUEVsRVBqVThMMGxFUGcwS0NRa0pDUWtKUEU1UFRVVStRMDlPVTF' +
      'SQlRsUThMMDVQVFVVK0RRb0pDUWtKQ1FrOFZFVllWRDQ4TDFSRldGUStEUW9KQ1F' +
      'rSkNRazhVMUZNUGtaQlRGTkZQQzlUVVV3K0RRb0pDUWtKQ1FrOFZFbFFUejVKYm5' +
      'SbGFYSnZQQzlVU1ZCUFBnMEtDUWtKQ1FrSlBFbE9RMDlOVUVGVVNWWkZURDVHUVV' +
      '4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS0NRa0pDUWtKUEUxTFVsOVdSVkpUU1U' +
      '5T1BqVXVNQzR3TGpNelBDOU5TMUpmVmtWU1UwbFBUajROQ2drSkNRa0pDVHhXUVV' +
      '4UFVqNDhMMVpCVEU5U1BnMEtDUWtKQ1FrSlBFUk5URlJaVUVVK1pIUlRaV3hsWTN' +
      'ROEwwUk5URlJaVUVVK0RRb0pDUWtKQ1FrOFJFbEJSMUpCVFZoTlRENDhMMFJKUVV' +
      'kU1FVMVlUVXcrRFFvSkNRa0pDUWs4VGxWTVR6NVVVbFZGUEM5T1ZVeFBQZzBLQ1F' +
      'rSkNRa0pQRVpKUlV4RVNVNUVSVmcrTFRFOEwwWkpSVXhFU1U1RVJWZytEUW9KQ1F' +
      'rSkNRazhSMVZKUkQ0OEwwZFZTVVErRFFvSkNRa0pDUWs4VTFCRlEwbEJURU5QUkV' +
      'VK1BDOVRVRVZEU1VGTVEwOUVSVDROQ2drSkNRa0pQQzlVVDJKcVEyOXVjM1ErRFF' +
      'vSkNRa0pQQzlRUVZKQlRWTStEUW9KQ1FrOEwxUlBZbXBHZFc1amRHbHZiajROQ2d' +
      'rSlBDOVFRVkpCVFZNK0RRb0pQQzlVVDJKcVJuVnVZM1JwYjI0K0RRbzhMMUpQVDF' +
      'RK0RRbz08L0RJQUdSQU1YTUw+PFZBTFVFPkNvbmNhdGVuYefjbyhKU09OIEZPUk1' +
      'BVEFETyBPU006ICxKU09OIC0gT2J0ZXIgVGV4dG8oQEVuZGVyZWNvLCkpPC9WQUx' +
      'VRT4NCgkJPEVYUFJFU1NJT04+PEZVTkNUSU9OIE5BTUU9IkNvbmNhdGVuYefjbyI' +
      'gUkVBTE5BTUU9ImViZkNvbmNhdCI+DQoJCQkJPFBBUkFNUz4NCgkJCQkJPENPTlN' +
      'UQU5UIFRZUEU9IkxldHJhcyIgTlVMTD0iRkFMU0UiPkpTT04gRk9STUFUQURPIE9' +
      'TTTogPC9DT05TVEFOVD4NCgkJCQkJPEZVTkNUSU9OIE5BTUU9IkpTT04gLSBPYnR' +
      'lciBUZXh0byIgUkVBTE5BTUU9ImViZkdldEpTT05UZXh0Ij4NCgkJCQkJCTxQQVJ' +
      'BTVM+DQoJCQkJCQkJPFZBUklBQkxFIE5BTUU9IkVuZGVyZWNvIi8+DQoJCQkJCQk' +
      'JPENPTlNUQU5UIFRZUEU9IkludGVpcm8iIE5VTEw9IlRSVUUiPjwvQ09OU1RBTlQ' +
      '+DQoJCQkJCQk8L1BBUkFNUz4NCgkJCQkJPC9GVU5DVElPTj4NCgkJCQk8L1BBUkF' +
      'NUz4NCgkJCTwvRlVOQ1RJT04+PC9FWFBSRVNTSU9OPg0KCTwvVERNTEZpZWxkPg0' +
      'KCTxURE1MRmllbGQ+PE5BTUU+TEFQX0RBVEFfSE9SQV9SRUdJU1RSTzwvTkFNRT4' +
      '8UkVBTE5BTUU+TEFQX0RBVEFfSE9SQV9SRUdJU1RSTzwvUkVBTE5BTUU+PERJQUd' +
      'SQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWo4K0RRbzhVazlQVkQ0TkN' +
      'nazhWRTlpYWtaMWJtTjBhVzl1UGcwS0NRazhTVVErTVR3dlNVUStEUW9KQ1R4T1Q' +
      'wMUZQa1pWVGtOVVNVOU9QQzlPVDAxRlBnMEtDUWs4VkVWWVZENWxZbVpFWVhSbFZ' +
      'HOWtZWGs4TDFSRldGUStEUW9KQ1R4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2drSlB' +
      'GUkpVRTgrUkdGMFlUd3ZWRWxRVHo0TkNna0pQRWxPUTA5TlVFRlVTVlpGVEQ1R1F' +
      'VeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWs4VFV0U1gxWkZVbE5KVDA0K05' +
      'TNHdMakF1TXpNOEwwMUxVbDlXUlZKVFNVOU9QZzBLQ1R3dlZFOWlha1oxYm1OMGF' +
      'XOXVQZzBLUEM5U1QwOVVQZzBLPC9ESUFHUkFNWE1MPjxWQUxVRT5Ib2plKCk8L1Z' +
      'BTFVFPg0KCQk8RVhQUkVTU0lPTj48RlVOQ1RJT04gTkFNRT0iSG9qZSIgUkVBTE5' +
      'BTUU9ImViZkRhdGVUb2RheSI+DQoJCQk8L0ZVTkNUSU9OPjwvRVhQUkVTU0lPTj4' +
      'NCgk8L1RETUxGaWVsZD4NCjwvUk9PVD4NCg==</DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FA' +
      'LSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10 +
      #9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>' +
      #13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10 +
      #9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine16: TFlowLine
    Left = 645
    Top = 573
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
    OutputNames = 'FlowExpression17'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine31: TFlowLine
    Left = 645
    Top = 646
    Width = 40
    Height = 78
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
    OutputNames = 'FlowEnd2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression18: TFlowExpression
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
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine30'
    Description = 'Obter texto do json'
    Text = 'JSON - Obter Texto(@JsonOSM,)'
    ReturnVar = 'jsonTexto'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Texto" REALNAME="ebfGetJSONText">'#13 +
      #10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="JsonOSM"/>'#13#10#9#9#9'<CONSTANT TYPE="I' +
      'nteiro" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetJSONText</TEXT>'#13#10#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TO' +
      'bjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEX' +
      'T>JsonOSM</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>' +
      '3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10#9#9#9#9'<VALO' +
      'R></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TOb' +
      'jConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine22: TFlowLine
    Left = 340
    Top = 318
    Width = 80
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression12'
    OutputNames = 'FlowExpression18'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression19: TFlowExpression
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
    InputNames = 'FlowLine30'
    OutputNames = 'FlowLine32'
    Description = 'Cria json de endereco'
    Text = 
      'JSON - Criar Objeto(Extrair Endere'#231'o de JSON da API do OSM(@json' +
      'Texto))'
    ReturnVar = 'Endereco'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;Objeto" REALNAME="eb' +
      'fCreateObjectJSON">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Extrair&#x20;Ende' +
      're&#231;o&#x20;de&#x20;JSON&#x20;da&#x20;API&#x20;do&#x20;OSM" R' +
      'EALNAME="EbfExtrairEnderecoOSM">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="json' +
      'Texto"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfCreateObjectJSO' +
      'N</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>E' +
      'bfExtrairEnderecoOSM</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</T' +
      'IPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</' +
      'MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIAB' +
      'LE</NOME>'#13#10'<TEXT>jsonTexto</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine30: TFlowLine
    Left = 530
    Top = 318
    Width = 80
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression18'
    OutputNames = 'FlowExpression19'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd3: TFlowEnd
    Left = 836
    Top = 318
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
    InputNames = 'FlowLine32'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
      'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Endereco</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>' +
      #13#10'</ROOT>'#13#10
    Expression = '<VARIABLE NAME="Endereco"/>'
    Text = '@Endereco'
    OutPutParam = 'Variante,    '
  end
  object FlowLine32: TFlowLine
    Left = 645
    Top = 317
    Width = 230
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
    OutputNames = 'FlowEnd3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression20: TFlowExpression
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
    InputNames = 'FlowLine25'
    OutputNames = 'FlowLine33'
    Description = 'Cria json de endereco'
    Text = 
      'JSON - Criar JSON a Partir dos Elementos(Criar lista a partir do' +
      's Elementos(Criar lista a partir dos Elementos(logradouro,),Cria' +
      'r lista a partir dos Elementos(numero,),Criar lista a partir dos' +
      ' Elementos(bairro,),Criar lista a partir dos Elementos(cidade,),' +
      'Criar lista a partir dos Elementos(estado,),Criar lista a partir' +
      ' dos Elementos(cep,),Criar lista a partir dos Elementos(pais,),C' +
      'riar lista a partir dos Elementos(complemento,JSON - Obter Valor' +
      '(@JsonOSM,name)),Criar lista a partir dos Elementos(latitude,JSO' +
      'N - Obter Valor(@JsonOSM,lat)),Criar lista a partir dos Elemento' +
      's(longitude,JSON - Obter Valor(@JsonOSM,lon)),true))'
    ReturnVar = 'Endereco'
    Expression = 
      '<FUNCTION NAME="JSON&#x20;-&#x20;Criar&#x20;JSON&#x20;a&#x20;Par' +
      'tir&#x20;dos&#x20;Elementos" REALNAME="ebfJSONParamsCreate">'#13#10'<P' +
      'ARAMS>'#13#10'<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20' +
      ';dos&#x20;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10 +
      '<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x2' +
      '0;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTAN' +
      'T TYPE="Letras" NULL="FALSE"  >logradouro</CONSTANT>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x' +
      '20;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >numero</CONSTANT>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<F' +
      'UNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;' +
      'Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE"  >bairro</CONSTANT>'#13#10'<CONSTANT TYPE="' +
      'Letras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNC' +
      'TION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Ele' +
      'mentos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >cidade</CONSTANT>'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTIO' +
      'N NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Elemen' +
      'tos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="' +
      'Letras" NULL="FALSE"  >estado</CONSTANT>'#13#10'<CONSTANT TYPE="Letras' +
      '" NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION N' +
      'AME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Elementos' +
      '" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Let' +
      'ras" NULL="FALSE"  >cep</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL' +
      '="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="C' +
      'riar&#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Elementos" REAL' +
      'NAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE"  >pais</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="TRU' +
      'E"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Criar&' +
      '#x20;lista&#x20;a&#x20;partir&#x20;dos&#x20;Elementos" REALNAME=' +
      '"ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >complemento</CONSTANT>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x2' +
      '0;Obter&#x20;Valor" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13 +
      #10'<VARIABLE NAME="JsonOSM"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '"  >name</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'<FUNCTION NAME="Criar&#x20;lista&#x20;a&#x20;partir&#x20;do' +
      's&#x20;Elementos" REALNAME="ebfListParamsCreate">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Letras" NULL="FALSE"  >latitude</CONSTANT>'#13#10'<FUNCTI' +
      'ON NAME="JSON&#x20;-&#x20;Obter&#x20;Valor" REALNAME="ebfGetValu' +
      'eObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="JsonOSM"/>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >lat</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Criar&#x20;lista&#x2' +
      '0;a&#x20;partir&#x20;dos&#x20;Elementos" REALNAME="ebfListParams' +
      'Create">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >longi' +
      'tude</CONSTANT>'#13#10'<FUNCTION NAME="JSON&#x20;-&#x20;Obter&#x20;Val' +
      'or" REALNAME="ebfGetValueObjectJson">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME=' +
      '"JsonOSM"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >lon</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'<' +
      '/FUNCTION>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfJSONParamsCreat' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>e' +
      'bfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIP' +
      'O>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</M' +
      'KR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>5</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>6</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      'etras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>logradouro</VALOR>'#13#10'<DMLTYPE>dtSel' +
      'ect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NO' +
      'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>' +
      #13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>8</ID>'#13#10'<NOME>FUNCTION</N' +
      'OME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letra' +
      's</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0' +
      '.33</MKR_VERSION>'#13#10'<VALOR>numero</VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'<' +
      '/TObjConst>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TE' +
      'XT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VAL' +
      'OR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
      'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
      'Function>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<T' +
      'EXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante' +
      '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.' +
      '33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONST' +
      'ANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>' +
      #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR' +
      '_VERSION>'#13#10'<VALOR>bairro</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
      'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
      'st>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VAL' +
      'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
      'LO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
      'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
      '>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfL' +
      'istParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13 +
      #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_' +
      'VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'<VALOR>cidade</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObj' +
      'Function>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfListParam' +
      'sCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>' +
      #13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEX' +
      'T></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALO' +
      'R>estado</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>' +
      #13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfListParamsCreate<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>cep</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.33</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX' +
      '>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</' +
      'TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</I' +
      'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>pais</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>C' +
      'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
      'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33<' +
      '/MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
      #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>' +
      'FUNCTION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>' +
      '9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>complemento</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>F' +
      'UNCTION</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10 +
      '<ID>9</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>JsonOSM</TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>name</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      '/PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUN' +
      'CTION</NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>' +
      #13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>latitude</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTIO' +
      'N</NOME>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9<' +
      '/ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>JsonOSM</TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst' +
      '>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>lat</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</' +
      'NOME>'#13#10'<TEXT>ebfListParamsCreate</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
      'ON>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<N' +
      'OME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letr' +
      'as</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.' +
      '0.33</MKR_VERSION>'#13#10'<VALOR>longitude</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>9</ID>'#13#10'<NOME>FUNCTION</NOM' +
      'E>'#13#10'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>9</ID>'#13#10 +
      '<NOME>VARIABLE</NOME>'#13#10'<TEXT>JsonOSM</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID' +
      '>9</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>lon</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</T' +
      'ObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>3</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine25: TFlowLine
    Left = 340
    Top = 243
    Width = 80
    Height = 41
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowExpression20'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine33: TFlowLine
    Left = 530
    Top = 243
    Width = 136
    Height = 40
    Color = 9079434
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ChangeDescription = False
    InputNames = 'FlowExpression20'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

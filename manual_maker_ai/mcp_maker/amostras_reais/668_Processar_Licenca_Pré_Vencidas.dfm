object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 76
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
      'PES_COD_RESPONSAVEL,Inteiro,,;FONTE,Letras,50,;MOSTRAR_BARRA,Let' +
      'ras,50,'
    Variables = 
      'tabela licenca,Tabela,,;n registros,Inteiro,,0;Mensagem,Letras,5' +
      '0,;X,Inteiro,,1;Retorno,Letras,50,;Retorno Gera Rel,Letras,50,;J' +
      'son Retorno Gera Real,Variante,,;Json retorno,Variante,,;TTL_COD' +
      ',Inteiro,,;tab cliente,Tabela,,;vTabPrecoAtual,Tabela,,;vValorLi' +
      'c,Fracionado,,;vTeste,Letras,50,;vTabLicAtt,Tabela,,'
    WorkFormCod = -1
  end
  object FlowExpression1: TFlowExpression
    Left = 400
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
    InputNames = 'FlowLine41'
    OutputNames = 'FlowLine2'
    Description = 'Titulos LDF'
    Text = 
      'Abrir Consulta Din'#226'mica(SELECT'#13#10'COUNT(*) OVER () AS n,'#13#10'VS_CGI_L' +
      'ICENCA.LIC_COD,'#13#10'VS_CGI_LICENCA.PES_COD_PERMISSIONARIO,'#13#10'VS_CGI_' +
      'LICENCA.LIC_NUMERO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE,'#13#10'VS_CGI_LICENC' +
      'A.LIC_DATA_BASE_VENCIMENTO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE_CARENCI' +
      'A,'#13#10'CONVERT(VARCHAR(16),GETDATE(),103) as HOJE,'#13#10'CONVERT(VARCHAR' +
      '(16),GETDATE(),103)+'#39' '#39'+CONVERT(VARCHAR(16),GETDATE(),108) AS HO' +
      'RA,'#13#10'VS_CGI_LICENCA.PES_EMAIL_PERM,'#13#10'VS_CGI_LICENCA.PES_EMAIL_ST' +
      'ATUS_PERM,'#13#10'CGI_CONFIG.CFG_EMAIL_ATIVO,'#13#10'VS_CGI_LICENCA.PES_NOME' +
      '_PERM,'#13#10'CGI_CONFIG.CFG_FIN_PAR,'#13#10'VS_CGI_LICENCA.LIC_VENCIDA,'#13#10'VS' +
      '_CGI_LICENCA.NOVO_VALOR_TITULO,'#13#10'VS_CGI_LICENCA.LIC_SITUACAO,'#13#10'V' +
      'S_LICENCA_STATUS_FIN.LIC_INADIMPLENTE,'#13#10'VS_CGI_PESSOA.PES_EMAIL_' +
      'STATUS,'#13#10'VS_CGI_LICENCA.LIC_LEGADO,'#13#10'VS_CGI_LICENCA.FPG_COD,'#13#10'CG' +
      'I_FORMA_PAG.FPG_ENTRADA,'#13#10'CGI_FORMA_PAG.FPG_N_PARCELAS,'#13#10'CGI_FOR' +
      'MA_PAG.FPG_INTERVALO,'#13#10'CGI_FORMA_PAG.PFG_RETARDAR'#13#10'FROM VS_CGI_L' +
      'ICENCA '#13#10'Inner Join VS_LICENCA_STATUS_FIN On VS_CGI_LICENCA.LIC_' +
      'COD = VS_LICENCA_STATUS_FIN.LIC_COD'#13#10'inner join VS_CGI_PESSOA on' +
      ' VS_CGI_LICENCA.PES_COD_PERMISSIONARIO = VS_CGI_PESSOA.PES_COD'#13#10 +
      'inner join CGI_FORMA_PAG on VS_CGI_LICENCA.FPG_COD = CGI_FORMA_P' +
      'AG.FPG_COD'#13#10', CGI_CONFIG'#13#10'WHERE'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADI' +
      'MPLENTE like '#39'N%'#39#13#10'and CAST(VS_CGI_LICENCA.LIC_VALIDADE as date)' +
      ' between CAST(GETDATE() as date) and CAST(dateadd(day, CGI_CONFI' +
      'G.CFG_FIN_PAR, GETDATE()) as date)'#13#10'and VS_CGI_LICENCA.LIC_VENCI' +
      'DA like '#39'N%'#39#13#10'and VS_CGI_LICENCA.LIC_SITUACAO = '#39'LDF'#39#13#10'and '#13#10'(se' +
      'lect count(VS_CGI_TITULO.TTL_COD) from VS_CGI_TITULO where VS_CG' +
      'I_TITULO.LIC_COD = VS_CGI_LICENCA.LIC_COD '#13#10'and VS_CGI_TITULO.TT' +
      'L_SITUACAO = '#39'A'#39#13#10') = 0'#13#10'order by'#13#10'VS_CGI_LICENCA.lic_cod,,,)'
    ReturnVar = 'tabela licenca'
    Expression = 
      '<FUNCTION NAME="Abrir&#x20;Consulta&#x20;Din&#226;mica" REALNAME' +
      '="ebfSQLDynamicQuery">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >SELECT'#13#10'COUNT(*)&#x20;OVER&#x20;()&#x20;AS&#x20;n,'#13#10'VS_' +
      'CGI_LICENCA.LIC_COD,'#13#10'VS_CGI_LICENCA.PES_COD_PERMISSIONARIO,'#13#10'VS' +
      '_CGI_LICENCA.LIC_NUMERO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE,'#13#10'VS_CGI_L' +
      'ICENCA.LIC_DATA_BASE_VENCIMENTO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE_CA' +
      'RENCIA,'#13#10'CONVERT(VARCHAR(16),GETDATE(),103)&#x20;as&#x20;HOJE,'#13#10 +
      'CONVERT(VARCHAR(16),GETDATE(),103)+'#39'&#x20;'#39'+CONVERT(VARCHAR(16),' +
      'GETDATE(),108)&#x20;AS&#x20;HORA,'#13#10'VS_CGI_LICENCA.PES_EMAIL_PERM' +
      ','#13#10'VS_CGI_LICENCA.PES_EMAIL_STATUS_PERM,'#13#10'CGI_CONFIG.CFG_EMAIL_A' +
      'TIVO,'#13#10'VS_CGI_LICENCA.PES_NOME_PERM,'#13#10'CGI_CONFIG.CFG_FIN_PAR,'#13#10'V' +
      'S_CGI_LICENCA.LIC_VENCIDA,'#13#10'VS_CGI_LICENCA.NOVO_VALOR_TITULO,'#13#10'V' +
      'S_CGI_LICENCA.LIC_SITUACAO,'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADIMPLE' +
      'NTE,'#13#10'VS_CGI_PESSOA.PES_EMAIL_STATUS,'#13#10'VS_CGI_LICENCA.LIC_LEGADO' +
      ','#13#10'VS_CGI_LICENCA.FPG_COD,'#13#10'CGI_FORMA_PAG.FPG_ENTRADA,'#13#10'CGI_FORM' +
      'A_PAG.FPG_N_PARCELAS,'#13#10'CGI_FORMA_PAG.FPG_INTERVALO,'#13#10'CGI_FORMA_P' +
      'AG.PFG_RETARDAR'#13#10'FROM&#x20;VS_CGI_LICENCA&#x20;'#13#10'Inner&#x20;Join' +
      '&#x20;VS_LICENCA_STATUS_FIN&#x20;On&#x20;VS_CGI_LICENCA.LIC_COD&' +
      '#x20;=&#x20;VS_LICENCA_STATUS_FIN.LIC_COD'#13#10'inner&#x20;join&#x20;' +
      'VS_CGI_PESSOA&#x20;on&#x20;VS_CGI_LICENCA.PES_COD_PERMISSIONARIO' +
      '&#x20;=&#x20;VS_CGI_PESSOA.PES_COD'#13#10'inner&#x20;join&#x20;CGI_FOR' +
      'MA_PAG&#x20;on&#x20;VS_CGI_LICENCA.FPG_COD&#x20;=&#x20;CGI_FORMA' +
      '_PAG.FPG_COD'#13#10',&#x20;CGI_CONFIG'#13#10'WHERE'#13#10'VS_LICENCA_STATUS_FIN.LI' +
      'C_INADIMPLENTE&#x20;like&#x20;'#39'N%'#39#13#10'and&#x20;CAST(VS_CGI_LICENCA' +
      '.LIC_VALIDADE&#x20;as&#x20;date)&#x20;between&#x20;CAST(GETDATE(' +
      ')&#x20;as&#x20;date)&#x20;and&#x20;CAST(dateadd(day,&#x20;CGI_CO' +
      'NFIG.CFG_FIN_PAR,&#x20;GETDATE())&#x20;as&#x20;date)'#13#10'and&#x20;V' +
      'S_CGI_LICENCA.LIC_VENCIDA&#x20;like&#x20;'#39'N%'#39#13#10'and&#x20;VS_CGI_L' +
      'ICENCA.LIC_SITUACAO&#x20;=&#x20;'#39'LDF'#39#13#10'and&#x20;'#13#10'(select&#x20;c' +
      'ount(VS_CGI_TITULO.TTL_COD)&#x20;from&#x20;VS_CGI_TITULO&#x20;wh' +
      'ere&#x20;VS_CGI_TITULO.LIC_COD&#x20;=&#x20;VS_CGI_LICENCA.LIC_CO' +
      'D&#x20;'#13#10'and&#x20;VS_CGI_TITULO.TTL_SITUACAO&#x20;=&#x20;'#39'A'#39#13#10')&' +
      '#x20;=&#x20;0'#13#10'order&#x20;by'#13#10'VS_CGI_LICENCA.lic_cod</CONSTANT>'#13 +
      #10'<CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TY' +
      'PE="Inteiro" NULL="TRUE"  ></CONSTANT>'#13#10'<CONSTANT TYPE="Letras" ' +
      'NULL="TRUE"  ></CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLDynamicQuery' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>SELECT'#13 +
      #10'COUNT(*)&#x20;OVER&#x20;()&#x20;AS&#x20;n,'#13#10'VS_CGI_LICENCA.LIC_' +
      'COD,'#13#10'VS_CGI_LICENCA.PES_COD_PERMISSIONARIO,'#13#10'VS_CGI_LICENCA.LIC' +
      '_NUMERO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE,'#13#10'VS_CGI_LICENCA.LIC_DATA_' +
      'BASE_VENCIMENTO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE_CARENCIA,'#13#10'CONVERT' +
      '(VARCHAR(16),GETDATE(),103)&#x20;as&#x20;HOJE,'#13#10'CONVERT(VARCHAR(' +
      '16),GETDATE(),103)+'#39'&#x20;'#39'+CONVERT(VARCHAR(16),GETDATE(),108)&#' +
      'x20;AS&#x20;HORA,'#13#10'VS_CGI_LICENCA.PES_EMAIL_PERM,'#13#10'VS_CGI_LICENC' +
      'A.PES_EMAIL_STATUS_PERM,'#13#10'CGI_CONFIG.CFG_EMAIL_ATIVO,'#13#10'VS_CGI_LI' +
      'CENCA.PES_NOME_PERM,'#13#10'CGI_CONFIG.CFG_FIN_PAR,'#13#10'VS_CGI_LICENCA.LI' +
      'C_VENCIDA,'#13#10'VS_CGI_LICENCA.NOVO_VALOR_TITULO,'#13#10'VS_CGI_LICENCA.LI' +
      'C_SITUACAO,'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADIMPLENTE,'#13#10'VS_CGI_PES' +
      'SOA.PES_EMAIL_STATUS,'#13#10'VS_CGI_LICENCA.LIC_LEGADO,'#13#10'VS_CGI_LICENC' +
      'A.FPG_COD,'#13#10'CGI_FORMA_PAG.FPG_ENTRADA,'#13#10'CGI_FORMA_PAG.FPG_N_PARC' +
      'ELAS,'#13#10'CGI_FORMA_PAG.FPG_INTERVALO,'#13#10'CGI_FORMA_PAG.PFG_RETARDAR'#13 +
      #10'FROM&#x20;VS_CGI_LICENCA&#x20;'#13#10'Inner&#x20;Join&#x20;VS_LICENCA' +
      '_STATUS_FIN&#x20;On&#x20;VS_CGI_LICENCA.LIC_COD&#x20;=&#x20;VS_L' +
      'ICENCA_STATUS_FIN.LIC_COD'#13#10'inner&#x20;join&#x20;VS_CGI_PESSOA&#x' +
      '20;on&#x20;VS_CGI_LICENCA.PES_COD_PERMISSIONARIO&#x20;=&#x20;VS_' +
      'CGI_PESSOA.PES_COD'#13#10'inner&#x20;join&#x20;CGI_FORMA_PAG&#x20;on&#' +
      'x20;VS_CGI_LICENCA.FPG_COD&#x20;=&#x20;CGI_FORMA_PAG.FPG_COD'#13#10',&' +
      '#x20;CGI_CONFIG'#13#10'WHERE'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADIMPLENTE&#' +
      'x20;like&#x20;'#39'N%'#39#13#10'and&#x20;CAST(VS_CGI_LICENCA.LIC_VALIDADE&#x' +
      '20;as&#x20;date)&#x20;between&#x20;CAST(GETDATE()&#x20;as&#x20;d' +
      'ate)&#x20;and&#x20;CAST(dateadd(day,&#x20;CGI_CONFIG.CFG_FIN_PAR' +
      ',&#x20;GETDATE())&#x20;as&#x20;date)'#13#10'and&#x20;VS_CGI_LICENCA.LI' +
      'C_VENCIDA&#x20;like&#x20;'#39'N%'#39#13#10'and&#x20;VS_CGI_LICENCA.LIC_SITUA' +
      'CAO&#x20;=&#x20;'#39'LDF'#39#13#10'and&#x20;'#13#10'(select&#x20;count(VS_CGI_TITU' +
      'LO.TTL_COD)&#x20;from&#x20;VS_CGI_TITULO&#x20;where&#x20;VS_CGI_' +
      'TITULO.LIC_COD&#x20;=&#x20;VS_CGI_LICENCA.LIC_COD&#x20;'#13#10'and&#x2' +
      '0;VS_CGI_TITULO.TTL_SITUACAO&#x20;=&#x20;'#39'A'#39#13#10')&#x20;=&#x20;0'#13#10'o' +
      'rder&#x20;by'#13#10'VS_CGI_LICENCA.lic_cod</VALOR>'#13#10'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELD' +
      'INDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13 +
      #10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10 +
      '<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID><' +
      '/GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</N' +
      'OME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSI' +
      'ON>'#13#10'<VALOR></VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>TRUE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS' +
      '>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision2: TFlowDecision
    Left = 400
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
    InputNames = 'FlowLine3;FlowLine5'
    OutputNames = 'FlowLine12;FlowLine4'
    Description = 'Existem registros?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLEOF</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVar' +
      'iable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>tab' +
      'ela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunc' +
      'tion>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Existem Registros" REALNAME="ebfSQLEOF">'#13#10#9#9'<PA' +
      'RAMS>'#13#10#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUN' +
      'CTION>'#13#10
    Loop = True
  end
  object FlowExpression3: TFlowExpression
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine7'
    Description = 'barra de progresso'
    Text = 
      'Fa'#231'a com Barra de Progresso(Existem Registros(@tabela licenca),P' +
      'rocessando SPE,@n registros)'
    Expression = 
      #9'<FUNCTION NAME="Fa'#231'a com Barra de Progresso" REALNAME="ebfWithP' +
      'rogressBar">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Existem Registros" ' +
      'REALNAME="ebfSQLEOF">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="tabela' +
      ' licenca"/>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="L' +
      'etras" NULL="FALSE">Processando SPE</CONSTANT>'#13#10#9#9#9'<VARIABLE NAM' +
      'E="n registros"/>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfWithProgressBar</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9 +
      '<TEXT>ebfSQLEOF</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</' +
      'TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9 +
      #9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>tabela lic' +
      'enca</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10 +
      #9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</T' +
      'ObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT' +
      '</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letr' +
      'as</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERS' +
      'ION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>Processando SPE</VALOR>'#13#10 +
      #9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      #9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GU' +
      'ID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9 +
      #9'<TObjVariable>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9 +
      '<TEXT>n registros</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteir' +
      'o</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>1.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</T' +
      'ObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision3: TFlowDecision
    Left = 400
    Top = 383
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
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine8;FlowLine9'
    Description = 'MOSTRAR_BARRA = S'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVaria' +
      'ble>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>MOSTR' +
      'AR_BARRA</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</' +
      'ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>S<' +
      '/VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjC' +
      'onst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VAR' +
      'IABLE NAME="MOSTRAR_BARRA"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">S</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine8: TFlowLine
    Left = 455
    Top = 393
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowExpression3'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression4: TFlowExpression
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
    InputNames = 'FlowLine31;FlowLine11'
    OutputNames = 'FlowLine5'
    Description = 'Pr'#243'ximo'
    Text = 'Tabela - Pr'#243'ximo Registro(@tabela licenca)'
    Expression = 
      #9'<FUNCTION NAME="Tabela - Pr'#243'ximo Registro" REALNAME="ebfSQLNext' +
      '">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLNext</TEXT>'#13#10#9#9'<SQL>FALSE</' +
      'SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVariable' +
      '>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>tabela l' +
      'icenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75<' +
      '/MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>' +
      #13#10'</ROOT>'#13#10
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
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine14;FlowLine13'
    Description = 'MOSTRAR_BARRA = S'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVaria' +
      'ble>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>MOSTR' +
      'AR_BARRA</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.7' +
      '5</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</' +
      'ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALS' +
      'E</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>S<' +
      '/VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjC' +
      'onst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VAR' +
      'IABLE NAME="MOSTRAR_BARRA"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="F' +
      'ALSE">S</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowLine12: TFlowLine
    Left = 265
    Top = 243
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
    OutputNames = 'FlowDecision4'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowActivity1: TFlowActivity
    Left = 210
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
    InputNames = 'FlowLine14'
    OutputNames = 'FlowLine15'
    Description = 'Retira Barra Progresso'
    Id = 3
    ObjectName = 'Retira Barra Progresso'
    RealName = 'ActCloseProgressBar'
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
  end
  object FlowLine14: TFlowLine
    Left = 265
    Top = 243
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
    OutputNames = 'FlowActivity1'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression5: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine34'
    OutputNames = 'FlowLine19'
    Description = 'Agendar Email'
    Text = 
      'Agendar Execu'#231#227'o de Fluxo Sem Pai(WsEnviarEmail,Criar lista a pa' +
      'rtir dos Elementos(Campo(@vTabLicAtt,PES_EMAIL_PERM),Concatena'#231#227 +
      'o(Licen'#231'a Vencida - ,Campo(@vTabLicAtt,LIC_NUMERO)),@Mensagem,Tr' +
      'ocar Todas as Subseq'#252#234'ncias(JSON - Obter Valor(@Json Retorno Ger' +
      'a Real,result),\\,\),,Campo(@tab cliente,token)),Multiplica'#231#227'o(@' +
      'X,10000))'
    Expression = 
      #9'<FUNCTION NAME="Agendar Execu'#231#227'o de Fluxo Sem Pai" REALNAME="eb' +
      'fRuleSchedulerNoParent">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Fluxo" ' +
      'NULL="FALSE">WsEnviarEmail</CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="Criar ' +
      'lista a partir dos Elementos" REALNAME="ebfListParamsCreate">'#13#10#9 +
      #9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">' +
      #13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="vTabLicAtt"/>'#13#10#9#9#9#9#9#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="FALSE">PES_EMAIL_PERM</CONSTANT>'#13#10#9 +
      #9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Concatena' +
      #231#227'o" REALNAME="ebfConcat">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE">Licen'#231'a Vencida - </CONSTANT>'#13#10#9#9#9#9#9#9#9'<F' +
      'UNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10 +
      #9#9#9#9#9#9#9#9#9'<VARIABLE NAME="vTabLicAtt"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE">LIC_NUMERO</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10 +
      #9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<VAR' +
      'IABLE NAME="Mensagem"/>'#13#10#9#9#9#9#9'<FUNCTION NAME="Trocar Todas as Su' +
      'bseq'#252#234'ncias" REALNAME="ebfReplaceAll">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<' +
      'FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObjectJs' +
      'on">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Json Retorno Ge' +
      'ra Real"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">result' +
      '</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'<CONS' +
      'TANT TYPE="Letras" NULL="FALSE">\\</CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE">\</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'<' +
      '/FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE"></CONSTANT' +
      '>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9'<P' +
      'ARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="tab cliente"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT ' +
      'TYPE="Campo" NULL="FALSE" INDEX="0">token</CONSTANT>'#13#10#9#9#9#9#9#9'</PA' +
      'RAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<FUNC' +
      'TION NAME="Multiplica'#231#227'o" REALNAME="oprMultiply">'#13#10#9#9#9#9'<PARAMS>'#13 +
      #10#9#9#9#9#9'<VARIABLE NAME="X"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="' +
      'FALSE">10000</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARA' +
      'MS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfRuleSchedulerNoParent</TEXT>'#13#10 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO></TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Fluxo</TIPO>'#13#10#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR' +
      '_VERSION>'#13#10#9#9#9#9'<VALOR>WsEnviarEmail</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NU' +
      'LO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9 +
      #9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfListParams' +
      'Create</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.9' +
      '7</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>4<' +
      '/ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT' +
      '>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<I' +
      'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</M' +
      'KR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>' +
      '7</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>vTabLicAtt<' +
      '/TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9 +
      #9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjCons' +
      't>'#13#10#9#9#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<' +
      'TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TI' +
      'PO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VER' +
      'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>PES_EMAIL_PERM</VALO' +
      'R>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFuncti' +
      'on>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION' +
      '</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9 +
      #9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9 +
      #9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</N' +
      'OME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<' +
      'TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>Lice' +
      'n'#231'a Vencida - </VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9 +
      #9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9 +
      #9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjFu' +
      'nction>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9 +
      #9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>' +
      #13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13 +
      #10#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>' +
      'VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>vTabLicAtt</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MK' +
      'R_VERSION>'#13#10#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<T' +
      'EXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<' +
      'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>LIC_NUMERO<' +
      '/VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SP' +
      'ECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAM' +
      'S>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction' +
      '>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>12</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE<' +
      '/NOME>'#13#10#9#9#9#9#9#9'<TEXT>Mensagem</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
      #9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable' +
      '>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>13</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION<' +
      '/NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfReplaceAll</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>' +
      #13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>' +
      #13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>14</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNC' +
      'TION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOM' +
      'PATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_' +
      'VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<' +
      'ID>15</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>Jso' +
      'n Retorno Gera Real</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9'<' +
      '/TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>16</ID>'#13#10#9#9#9 +
      #9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INC' +
      'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97<' +
      '/MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>result</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction' +
      '>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>17</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTA' +
      'NT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      #9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR' +
      '>\\</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
      #9#9#9'<ID>18</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9 +
      #9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.' +
      '2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>\</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9 +
      '<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9 +
      #9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TO' +
      'bjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjConst' +
      '>'#13#10#9#9#9#9#9#9'<ID>19</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT><' +
      '/TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97' +
      '</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NU' +
      'LO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9 +
      #9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjFun' +
      'ction>'#13#10#9#9#9#9#9#9'<ID>20</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<T' +
      'EXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Vari' +
      'ante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MK' +
      'R_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVa' +
      'riable>'#13#10#9#9#9#9#9#9#9#9'<ID>21</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9 +
      #9#9#9#9#9'<TEXT>tab cliente</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9 +
      #9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVari' +
      'able>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>22</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CO' +
      'NSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10 +
      #9#9#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VA' +
      'LOR>token</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<' +
      'FIELDINDEX>0</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      #9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjFu' +
      'nction>'#13#10#9#9#9#9'<ID>23</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>o' +
      'prMultiply</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>N'#250'mero</TIPO>' +
      #13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0' +
      '.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>' +
      '24</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>X</TEXT>'#13#10#9#9#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>25</ID>'#13#10 +
      #9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9 +
      #9'<VALOR>10000</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunct' +
      'ion>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression6: TFlowExpression
    Left = 780
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
    InputNames = 'FlowLine45'
    OutputNames = 'FlowLine16'
    Description = 'Mensagem'
    Text = 
      'Concatena'#231#227'o(<p><span style="color: #808080;">Ol&aacute; ,Campo(' +
      '@vTabLicAtt,PES_NOME_PERM),<p><span style="color: #808080;">,</s' +
      'pan></p>'#10'<p>&nbsp;</p>'#10'<p><span style="color: #808080;">Bem vind' +
      'o(a) a Secretaria Municipal de Ordem P&uacute;blica - SEMOP.</sp' +
      'an></p>'#10'<p><span style="color: #808080;">Informamos o vencimento' +
      ' da validade de sua licen&ccedil;a de n&uacute;mero: <span style' +
      '="color: #000000;">,Campo(@vTabLicAtt,LIC_NUMERO), </span></span' +
      '></p>'#10'<p><span style="color: #808080;">Data Vencimento: <span st' +
      'yle="color: #000000;">,Campo(@vTabLicAtt,LIC_VALIDADE),</span></' +
      'span></p>'#10'<p><span style="color: #808080;">Para mais informa&cce' +
      'dil;&otilde;es entre em contato com a SEMOP ou acesse nosso apli' +
      'cativo. Procure na sua loja de app&acute;s o aplicativo SEMOP.</' +
      'span></p>)'
    ReturnVar = 'Mensagem'
    Expression = 
      #9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">&lt;p&gt;&lt;span styl' +
      'e="color: #808080;"&gt;Ol&amp;aacute; </CONSTANT>'#13#10#9#9#9'<FUNCTION ' +
      'NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIAB' +
      'LE NAME="vTabLicAtt"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '">PES_NOME_PERM</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<C' +
      'ONSTANT TYPE="Letras" NULL="FALSE">&lt;p&gt;&lt;span style="colo' +
      'r: #808080;"&gt;,&lt;/span&gt;&lt;/p&gt;'#13#10'&lt;p&gt;&amp;nbsp;&lt' +
      ';/p&gt;'#13#10'&lt;p&gt;&lt;span style="color: #808080;"&gt;Bem vindo(' +
      'a) a Secretaria Municipal de Ordem P&amp;uacute;blica - SEMOP.&l' +
      't;/span&gt;&lt;/p&gt;'#13#10'&lt;p&gt;&lt;span style="color: #808080;"' +
      '&gt;Informamos o vencimento da validade de sua licen&amp;ccedil;' +
      'a de n&amp;uacute;mero: &lt;span style="color: #000000;"&gt;</CO' +
      'NSTANT>'#13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vTabLicAtt"/>'#13#10#9#9#9#9#9'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE">LIC_NUMERO</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9 +
      #9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE"> &lt;/span' +
      '&gt;&lt;/span&gt;&lt;/p&gt;'#13#10'&lt;p&gt;&lt;span style="color: #80' +
      '8080;"&gt;Data Vencimento: &lt;span style="color: #000000;"&gt;<' +
      '/CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9 +
      #9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vTabLicAtt"/>'#13#10#9#9#9#9#9'<CONSTANT ' +
      'TYPE="Letras" NULL="FALSE">LIC_VALIDADE</CONSTANT>'#13#10#9#9#9#9'</PARAMS' +
      '>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">&lt;/' +
      'span&gt;&lt;/span&gt;&lt;/p&gt;'#13#10'&lt;p&gt;&lt;span style="color:' +
      ' #808080;"&gt;Para mais informa&amp;ccedil;&amp;otilde;es entre ' +
      'em contato com a SEMOP ou acesse nosso aplicativo. Procure na su' +
      'a loja de app&amp;acute;s o aplicativo SEMOP.&lt;/span&gt;&lt;/p' +
      '&gt;</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCon' +
      'st>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION' +
      '>'#13#10#9#9#9#9'<VALOR>&lt;p&gt;&lt;span style="color: #808080;"&gt;Ol&am' +
      'p;aacute; </VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>F' +
      'UNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATI' +
      'VEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13 +
      #10#9#9#9#9#9#9'<TEXT>vTabLicAtt</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<T' +
      'IPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
      #9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9 +
      #9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9 +
      #9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</' +
      'TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSI' +
      'ON>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>PES_NOME_PERM</VALOR>'#13#10#9 +
      #9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      #9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</T' +
      'ObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9 +
      #9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9 +
      '<VALOR>&lt;p&gt;&lt;span style="color: #808080;"&gt;,&lt;/span&g' +
      't;&lt;/p&gt;'#13#10'&lt;p&gt;&amp;nbsp;&lt;/p&gt;'#13#10'&lt;p&gt;&lt;span s' +
      'tyle="color: #808080;"&gt;Bem vindo(a) a Secretaria Municipal de' +
      ' Ordem P&amp;uacute;blica - SEMOP.&lt;/span&gt;&lt;/p&gt;'#13#10'&lt;p' +
      '&gt;&lt;span style="color: #808080;"&gt;Informamos o vencimento ' +
      'da validade de sua licen&amp;ccedil;a de n&amp;uacute;mero: &lt;' +
      'span style="color: #000000;"&gt;</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect<' +
      '/DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>' +
      #13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<' +
      'ID>8</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfSQLField</TEX' +
      'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMP' +
      'ATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9 +
      #9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vTabLicAtt</TEXT>'#13#10#9#9#9#9#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9 +
      #9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9 +
      '<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPA' +
      'TIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>' +
      'LIC_NUMERO</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction' +
      '>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9 +
      #9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13 +
      #10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.' +
      '97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR> &lt;/span&gt;&lt;/span&gt;&lt;/p&g' +
      't;'#13#10'&lt;p&gt;&lt;span style="color: #808080;"&gt;Data Vencimento' +
      ': &lt;span style="color: #000000;"&gt;</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE<' +
      '/NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13 +
      #10#9#9#9#9'<ID>12</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfSQLFie' +
      'ld</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MK' +
      'R_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>12</ID>' +
      #13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vTabLicAtt</TEXT>'#13#10#9#9 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERS' +
      'ION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>14</ID>'#13 +
      #10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FA' +
      'LSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</' +
      'INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      '<VALOR>LIC_VALIDADE</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10 +
      #9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9 +
      #9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TOb' +
      'jFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>15</ID>'#13#10#9#9#9#9'<NOME>CONSTANT<' +
      '/NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letra' +
      's</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
      'ON>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>&lt;/span&gt;&lt;/span&gt;' +
      '&lt;/p&gt;'#13#10'&lt;p&gt;&lt;span style="color: #808080;"&gt;Para ma' +
      'is informa&amp;ccedil;&amp;otilde;es entre em contato com a SEMO' +
      'P ou acesse nosso aplicativo. Procure na sua loja de app&amp;acu' +
      'te;s o aplicativo SEMOP.&lt;/span&gt;&lt;/p&gt;</VALOR>'#13#10#9#9#9#9'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NU' +
      'LO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GU' +
      'ID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAM' +
      'S>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision5: TFlowDecision
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine28'
    OutputNames = 'FlowLine29;FlowLine32'
    Description = 'Enviar email ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprAnd</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
      #13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFuncti' +
      'on>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>isEqua' +
      'l</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>3</ID>'#13#10#9 +
      #9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>4</ID>'#13 +
      #10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>tabela licenca</TE' +
      'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13 +
      #10#9#9#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEX' +
      'T></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>' +
      #13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>CFG_EMAIL_ATIVO</VALOR>' +
      #13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FI' +
      'ELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction' +
      '>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOM' +
      'E>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Let' +
      'ras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR' +
      '_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>S</VALOR>'#13#10#9#9#9#9#9#9'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9 +
      #9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9 +
      '<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjCon' +
      'st>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<' +
      'ID>6</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>isEqual</TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME' +
      '>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FAL' +
      'SE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9 +
      #9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9#9#9'<' +
      'NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>tabela licenca</TEXT>'#13#10#9#9#9#9#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR' +
      '_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<' +
      'ID>6</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13 +
      #10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75' +
      '</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>PES_EMAIL_STATUS_PERM</VALOR>'#13#10#9#9 +
      #9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
      '>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9 +
      #9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10 +
      #9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VER' +
      'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>ATIVO</VALOR>'#13#10#9#9#9#9#9#9'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9 +
      #9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9 +
      '<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjCon' +
      'st>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunc' +
      'tion>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="E" REALNAME="oprAnd">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION' +
      ' NAME="Igual" REALNAME="isEqual">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION ' +
      'NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VA' +
      'RIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE">CFG_EMAIL_ATIVO</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</' +
      'FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">S</CONSTANT' +
      '>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<FUNCTION NAME="Igual" REAL' +
      'NAME="isEqual">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALN' +
      'AME="ebfSQLField">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="tabel' +
      'a licenca"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">PES_EM' +
      'AIL_STATUS_PERM</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9 +
      #9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">ATIVO</CONSTANT>'#13#10#9#9#9#9'<' +
      '/PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowExpression8: TFlowExpression
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
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine6'
    Description = 'inc(X)'
    Text = 'Soma(@X,1)'
    ReturnVar = 'X'
    Expression = 
      #9'<FUNCTION NAME="Soma" REALNAME="oprAdd">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIA' +
      'BLE NAME="X"/>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">1</CONS' +
      'TANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprAdd</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
      #13#10#9#9'<TIPO>N'#250'mero</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9 +
      '<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVariabl' +
      'e>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>X</TEXT' +
      '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPAT' +
      'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
      'N>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOM' +
      'E>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9 +
      #9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9 +
      #9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID>' +
      '</GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</P' +
      'ARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine19: TFlowLine
    Left = 720
    Top = 93
    Width = 80
    Height = 105
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
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowConnector1: TFlowConnector
    Left = 80
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
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine22'
  end
  object FlowLine13: TFlowLine
    Left = 75
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
    InputNames = 'FlowDecision4'
    OutputNames = 'FlowConnector1'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
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
    InputNames = 'FlowLine15'
    OutputNames = 'FlowLine21'
  end
  object FlowLine15: TFlowLine
    Left = 265
    Top = 318
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
    InputNames = 'FlowActivity1'
    OutputNames = 'FlowConnector2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression9: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine21;FlowLine22'
    OutputNames = 'FlowLine23'
    Description = 'Retorno'
    Text = 
      'Concatena'#231#227'o(N'#186' Registros: ,@n registros,. Email enviados: ,Subt' +
      'ra'#231#227'o(@X,1))'
    ReturnVar = 'Retorno'
    Expression = 
      #9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">N'#186' Registros: </CONSTA' +
      'NT>'#13#10#9#9#9'<VARIABLE NAME="n registros"/>'#13#10#9#9#9'<CONSTANT TYPE="Letra' +
      's" NULL="FALSE">. Email enviados: </CONSTANT>'#13#10#9#9#9'<FUNCTION NAME' +
      '="Subtra'#231#227'o" REALNAME="oprSubtract">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIAB' +
      'LE NAME="X"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">1</CON' +
      'STANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>' +
      #13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCon' +
      'st>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
      '>'#13#10#9#9#9#9'<VALOR>N'#186' Registros: </VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9 +
      #9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>3' +
      '</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>n registros</TEXT>'#13#10 +
      #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13 +
      #10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>C' +
      'ONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TI' +
      'PO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<M' +
      'KR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>. Email enviados: ' +
      '</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObj' +
      'Const>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</N' +
      'OME>'#13#10#9#9#9#9'<TEXT>oprSubtract</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>N'#250'mero</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
      'MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVari' +
      'able>'#13#10#9#9#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEX' +
      'T>X</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10 +
      #9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2' +
      '.0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9 +
      #9#9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13 +
      #10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9#9#9'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_' +
      'VERSION>'#13#10#9#9#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
      #9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine21: TFlowLine
    Left = 75
    Top = 392
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
    InputNames = 'FlowConnector2'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine22: TFlowLine
    Left = 75
    Top = 242
    Width = 40
    Height = 191
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
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowEnd1: TFlowEnd
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
    InputNames = 'FlowLine48'
    Description = 'Fim'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
      '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Retorno</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>' +
      #13#10
    Expression = #9'<VARIABLE NAME="Retorno"/>'#13#10
    Text = '@Retorno'
    OutPutParam = 'Letras,50  '
  end
  object FlowSubRoutine4: TFlowSubRoutine
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine53'
    OutputNames = 'FlowLine10'
    Description = 'WsNovoTitulo'
    Id = 198
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>PES_COD_PERMISSIONARIO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<' +
          'FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10 +
          '</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>0</F' +
          'IELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10 +
          #9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VE' +
          'RSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR></VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NULO>' +
          #13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE' +
          '></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>LR</VALOR>'#13#10#9#9'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NUL' +
          'O>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.85</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_N_PARCELAS</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
          '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDIND' +
          'EX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIA' +
          'LCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13 +
          #10
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.85</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_INTERVALO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDE' +
          'X>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIAL' +
          'CODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfDateIncDay</TEX' +
          'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Data</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
          'jFunction>'#13#10'<ID>12</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLFiel' +
          'd</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
          '>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARA' +
          'MS>'#13#10'<TObjVariable>'#13#10'<ID>12</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>t' +
          'abela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>' +
          #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR' +
          '_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>12</ID>'#13#10'<NOME>CONS' +
          'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO' +
          '>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR' +
          '_VERSION>'#13#10'<VALOR>LIC_VALIDADE</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
          'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
          '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
          'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>10</I' +
          'D>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprIf</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
          #10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_' +
          'VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction>'#13#10'<ID>10' +
          '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isEqual</TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjFunction' +
          '>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13 +
          #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
          'bjVariable>'#13#10'<ID>10</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x' +
          '20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOM' +
          'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION' +
          '>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CONSTANT</NO' +
          'ME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCO' +
          'MPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION' +
          '>'#13#10'<VALOR>FPG_ENTRADA</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>10</ID>'#13#10'<NOME>CO' +
          'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
          'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</' +
          'MKR_VERSION>'#13#10'<VALOR>S</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
          'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
          'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
          '>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOM' +
          'E>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
          'TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
          'ERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11<' +
          '/ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x20;licenca</TEXT>'#13#10'<' +
          'SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
          'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10 +
          '<TObjConst>'#13#10'<ID>11</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOM' +
          'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>PFG_RETARD' +
          'AR</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObj' +
          'Function>'#13#10'<TObjFunction>'#13#10'<ID>10</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<' +
          'TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>' +
          #13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR' +
          '_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>11</ID>'#13#10'<NOME>VARIABLE' +
          '</NOME>'#13#10'<TEXT>tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
          'PO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
          'ON>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>11<' +
          '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
          'IPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSI' +
          'ON>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>FPG_INTERVALO</VALOR>'#13#10'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
          'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
          'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS' +
          '>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Function>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'ebfSQLExecuteQuery</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabel' +
          'a</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
          'ON>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
          #9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
          #9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13#10#9#9#9#9#9#9'<I' +
          'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</M' +
          'KR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  V' +
          'S_CGI_LICENCA.NOVO_VALOR_TITULO'#13#10'From'#13#10'  VS_CGI_LICENCA with(nol' +
          'ock)'#13#10'Where'#13#10'  VS_CGI_LICENCA.LIC_COD = :id'#13#10'/*WHERE_ADD*/'#13#10'/*OR' +
          'DER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<DEFINE NAME="' +
          'id">'#13#10#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10 +
          #9#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"' +
          '/>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">LIC_COD</CO' +
          'NSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9'<' +
          '/DEFINE>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9#9#9'</VALOR>'#13#10#9#9#9 +
          #9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2' +
          'lvbj0iMS4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIFZTX0NHSV9MSU' +
          'NFTkNBLk5PVk9fVkFMT1JfVElUVUxPDQpGcm9tDQogIFZTX0NHSV9MSUNFTkNBIH' +
          'dpdGgobm9sb2NrKQ0KV2hlcmUNCiAgVlNfQ0dJX0xJQ0VOQ0EuTElDX0NPRCA9ID' +
          'ppZA0KPC9TUUw+DQoJPFBBUkFNUz4NCgkJPERFRklORSBOQU1FPSJpZCI+DQoJCQ' +
          'k8VkFMVUU+Q2FtcG8oQHRhYmVsYSBsaWNlbmNhLExJQ19DT0QpPC9WQUxVRT4NCg' +
          'kJCTxESUFHUkFNWE1MPlBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84VW' +
          's5UFZENE5DZ2s4VkU5aWFrWjFibU4wYVc5dVBnMEtDUWs4U1VRK01Ud3ZTVVErRF' +
          'FvSkNUeE9UMDFGUGtaVlRrTlVTVTlPUEM5T1QwMUZQZzBLQ1FrOFZFVllWRDVsWW' +
          '1aVFVVeEdhV1ZzWkR3dlZFVllWRDROQ2drSlBGTlJURDVHUVV4VFJUd3ZVMUZNUG' +
          'cwS0NRazhWRWxRVHo1V1lYSnBZVzUwWlR3dlZFbFFUejROQ2drSlBFbE9RMDlOVU' +
          'VGVVNWWkZURDVHUVV4VFJUd3ZTVTVEVDAxUVFWUkpWa1ZNUGcwS0NRazhUVXRTWD' +
          'FaRlVsTkpUMDQrTVM0eUxqQXVOelU4TDAxTFVsOVdSVkpUU1U5T1BnMEtDUWs4VU' +
          'VGU1FVMVRQZzBLQ1FrSlBGUlBZbXBXWVhKcFlXSnNaVDROQ2drSkNRazhTVVErTW' +
          'p3dlNVUStEUW9KQ1FrSlBFNVBUVVUrVmtGU1NVRkNURVU4TDA1UFRVVStEUW9KQ1' +
          'FrSlBGUkZXRlErZEdGaVpXeGhJR3hwWTJWdVkyRThMMVJGV0ZRK0RRb0pDUWtKUE' +
          'ZOUlRENUdRVXhUUlR3dlUxRk1QZzBLQ1FrSkNUeFVTVkJQUGxSaFltVnNZVHd2Vk' +
          'VsUVR6NE5DZ2tKQ1FrOFNVNURUMDFRUVZSSlZrVk1Qa1pCVEZORlBDOUpUa05QVF' +
          'ZCQlZFbFdSVXcrRFFvSkNRa0pQRTFMVWw5V1JWSlRTVTlPUGpFdU1pNHdMamMxUE' +
          'M5TlMxSmZWa1ZTVTBsUFRqNE5DZ2tKQ1R3dlZFOWlhbFpoY21saFlteGxQZzBLQ1' +
          'FrSlBGUlBZbXBEYjI1emRENE5DZ2tKQ1FrOFNVUStNend2U1VRK0RRb0pDUWtKUE' +
          'U1UFRVVStRMDlPVTFSQlRsUThMMDVQVFVVK0RRb0pDUWtKUEZSRldGUStQQzlVUl' +
          'ZoVVBnMEtDUWtKQ1R4VFVVdytSa0ZNVTBVOEwxTlJURDROQ2drSkNRazhWRWxRVH' +
          'o1TVpYUnlZWE04TDFSSlVFOCtEUW9KQ1FrSlBFbE9RMDlOVUVGVVNWWkZURDVVVW' +
          'xWRlBDOUpUa05QVFZCQlZFbFdSVXcrRFFvSkNRa0pQRTFMVWw5V1JWSlRTVTlPUG' +
          'pFdU1pNHdMamMxUEM5TlMxSmZWa1ZTVTBsUFRqNE5DZ2tKQ1FrOFZrRk1UMUkrVE' +
          'VsRFgwTlBSRHd2VmtGTVQxSStEUW9KQ1FrSlBFUk5URlJaVUVVK1pIUlRaV3hsWT' +
          'NROEwwUk5URlJaVUVVK0RRb0pDUWtKUEVSSlFVZFNRVTFZVFV3K1BDOUVTVUZIVW' +
          'tGTldFMU1QZzBLQ1FrSkNUeE9WVXhQUGtaQlRGTkZQQzlPVlV4UFBnMEtDUWtKQ1' +
          'R4R1NVVk1SRWxPUkVWWVBpMHhQQzlHU1VWTVJFbE9SRVZZUGcwS0NRa0pDVHhIVl' +
          'VsRVBqd3ZSMVZKUkQ0TkNna0pDUWs4VTFCRlEwbEJURU5QUkVVK1BDOVRVRVZEU1' +
          'VGTVEwOUVSVDROQ2drSkNUd3ZWRTlpYWtOdmJuTjBQZzBLQ1FrOEwxQkJVa0ZOVX' +
          'o0TkNnazhMMVJQWW1wR2RXNWpkR2x2Ymo0TkNqd3ZVazlQVkQ0TkNnPT08L0RJQU' +
          'dSQU1YTUw+DQoJCQk8RVhQUkVTU0lPTj4NClBFWlZUa05VU1U5T0lFNUJUVVU5SW' +
          'tOaGJYQnZJaUJTUlVGTVRrRk5SVDBpWldKbVUxRk1SbWxsYkdRaVBnMEtQRkJCVW' +
          'tGTlV6NE5DanhXUVZKSlFVSk1SU0JPUVUxRlBTSjBZV0psYkdFbUkzZ3lNRHRzYV' +
          'dObGJtTmhJaTgrRFFvOFEwOU9VMVJCVGxRZ1ZGbFFSVDBpVEdWMGNtRnpJaUJPVl' +
          'V4TVBTSkdRVXhUUlNJZ0lENU1TVU5mUTA5RVBDOURUMDVUVkVGT1ZENE5Dand2VU' +
          'VGU1FVMVRQZzBLUEM5R1ZVNURWRWxQVGo0PQ0KPC9FWFBSRVNTSU9OPg0KCQk8L0' +
          'RFRklORT4NCgk8L1BBUkFNUz4NCjwvUk9PVD4NCg==</DIAGRAMXML>'#13#10#9#9#9#9#9#9'<' +
          'NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUI' +
          'D></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13 +
          #10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>' +
          #13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letra' +
          's</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_V' +
          'ERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9'<DML' +
          'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9 +
          '<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUI' +
          'D></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13 +
          #10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</I' +
          'D>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE' +
          '</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>NOVO' +
          '_VALOR_TITULO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>0' +
          '</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE' +
          '>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>PES_COD_RESPONSAVEL</TEXT>'#13#10#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9'</TObjVaria' +
          'ble>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>R</VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO' +
          '>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">PES_COD_PERMISSIONARIO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FU' +
          'NCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NUL' +
          'L="FALSE" INDEX="0">LIC_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
          '>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">LR</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">FPG_N_PARCELAS</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13 +
          #10
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">FPG_INTERVALO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Incrementa&#x20;Dia" REALNAME="ebfDateIncDay">'#13#10 +
          '<PARAMS>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAM' +
          'S>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letr' +
          'as" NULL="FALSE"  >LIC_VALIDADE</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
          'N>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION N' +
          'AME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Campo' +
          '" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20' +
          ';licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >FPG_ENTRADA<' +
          '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL' +
          '="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME=' +
          '"Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabel' +
          'a&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >PFG_RE' +
          'TARDAR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Campo' +
          '" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20' +
          ';licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >FPG_INTERVAL' +
          'O</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13#10 +
          #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><P' +
          'SQL>'#13#10#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  VS_CGI_LICENCA.NOVO_VALOR_TITU' +
          'LO'#13#10'From'#13#10'  VS_CGI_LICENCA with(nolock)'#13#10'Where'#13#10'  VS_CGI_LICENCA' +
          '.LIC_COD = :id'#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9 +
          #9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9'<DEFINE NAME="id">'#13#10#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="' +
          'Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<' +
          'VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Let' +
          'ras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9 +
          #9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</PS' +
          'QL>'#13#10#9#9#9#9#9'</CONSTANT>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE">' +
          '</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="C' +
          'ampo" NULL="FALSE" INDEX="0">NOVO_VALOR_TITULO</CONSTANT>'#13#10#9#9'</P' +
          'ARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="PES_COD_RESPONSAVEL"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">R</CONSTANT>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,PES_COD_PERMISSIONARIO)'
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = 'LR'
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_N_PARCELAS)'
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_INTERVALO)'
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          'Incrementa Dia(Campo(@tabela licenca,LIC_VALIDADE),Se(Igual(Camp' +
          'o(@tabela licenca,FPG_ENTRADA),S),Campo(@tabela licenca,PFG_RETA' +
          'RDAR),Campo(@tabela licenca,FPG_INTERVALO)))'
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 'Campo(Abrir Consulta(SQL CONSULTA,),NOVO_VALOR_TITULO)'
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = '@PES_COD_RESPONSAVEL'
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = 'R'
      end>
    Return = 'Retorno'
    ObjectName = 'WsNovoTitulo'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine2: TFlowSubRoutine
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
    InputNames = 'FlowLine32'
    OutputNames = 'FlowLine25'
    Description = 'WsAbrirRelatorio'
    Id = 187
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjRule>'#13#10#9#9'<ID>1</ID>'#13#10#9#9'<NOM' +
          'E>CALLRULE</NOME>'#13#10#9#9'<TEXT>WsCriptografia</TEXT>'#13#10#9#9'<SQL>FALSE</' +
          'SQL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
          '>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCo' +
          'nst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEX' +
          'T>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPAT' +
          'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
          'N>'#13#10#9#9#9#9'<VALOR>SL-DADOS-BASICOS-01</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelec' +
          't</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NUL' +
          'O>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<I' +
          'D>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL' +
          '>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>C</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML><' +
          '/DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDI' +
          'NDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</' +
          'TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9#9'<RULEID>146</RULEID>'#13#10#9'</TObjRule>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
          'QL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
          #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCon' +
          'st>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
          '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
          'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
          '>'#13#10#9#9#9#9'<VALOR>{"lic_cod":</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<' +
          'FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</I' +
          'D>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>toLong</TEXT>'#13#10#9#9#9#9'<SQL' +
          '>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE<' +
          '/INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PA' +
          'RAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTI' +
          'ON</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL' +
          '>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOM' +
          'PATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARA' +
          'MS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VA' +
          'RIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>tabela licenca</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL' +
          '>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL' +
          '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSIO' +
          'N>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>2</I' +
          'D>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9 +
          #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMP' +
          'ATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_V' +
          'ERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>LIC_COD</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSele' +
          'ct</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>F' +
          'ALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID>' +
          '</GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst' +
          '>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TO' +
          'bjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT<' +
          '/NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letra' +
          's</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
          'ON>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>}</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dt' +
          'Select</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE' +
          '</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9 +
          #9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</T' +
          'ObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'codsolicitante'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>PES_COD_RESPONSAVEL</TEXT>'#13#10#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVaria' +
          'ble>'#13#10'</ROOT>'#13#10
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
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 
          #9'<CALLRULE ID="146" NAME="WsCriptografia" PARAMSCOUNT="2">'#13#10#9#9'<P' +
          'ARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">SL-DADOS-BASICOS' +
          '-01</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">C</CONST' +
          'ANT>'#13#10#9#9'</PARAMS>'#13#10#9'</CALLRULE>'#13#10
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9'<PARAMS>' +
          #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">{"lic_cod":</CONSTANT>' +
          #13#10#9#9#9'<FUNCTION NAME="Para Inteiro" REALNAME="toLong">'#13#10#9#9#9#9'<PARA' +
          'MS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9 +
          '<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9'<CONS' +
          'TANT TYPE="Letras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9'</PARA' +
          'MS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTA' +
          'NT TYPE="Letras" NULL="FALSE">}</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNC' +
          'TION>'#13#10
      end
      item
        DataType = ftString
        Name = 'codsolicitante'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="PES_COD_RESPONSAVEL"/>'#13#10
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
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'nomerelatorio'
        ParamType = ptInput
        Value = 'WsCriptografia(SL-DADOS-BASICOS-01,C)'
      end
      item
        DataType = ftString
        Name = 'jsonfiltro'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o({"lic_cod":,Para Inteiro(Campo(@tabela licenca,LIC_' +
          'COD)),})'
      end
      item
        DataType = ftString
        Name = 'codsolicitante'
        ParamType = ptInput
        Value = '@PES_COD_RESPONSAVEL'
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
      end>
    Return = 'Retorno Gera Rel'
    ObjectName = 'WsAbrirRelatorio'
    RealName = 'CALLRULE'
  end
  object FlowExpression10: TFlowExpression
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
    InputNames = 'FlowLine25'
    OutputNames = 'FlowLine33'
    Description = 'Criar json retorno'
    Text = 'JSON - Criar objeto(@Retorno Gera Rel)'
    ReturnVar = 'Json Retorno Gera Real'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Retorno Gera Rel"/>'#13#10#9#9'</P' +
      'ARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9'<TEXT>Retorno Gera Rel</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIP' +
      'O>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine25: TFlowLine
    Left = 1025
    Top = 93
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
    InputNames = 'FlowSubRoutine2'
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowDecision6: TFlowDecision
    Left = 780
    Top = 1058
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
    InputNames = 'FlowLine27'
    OutputNames = 'FlowLine18;FlowLine17'
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
      #9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>Json re' +
      'torno</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>' +
      '1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10 +
      #9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEX' +
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
      '>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="Json retorno"/>'#13#10#9#9#9#9#9'<CON' +
      'STANT TYPE="Letras" NULL="FALSE">status</CONSTANT>'#13#10#9#9#9#9'</PARAMS' +
      '>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">OK</C' +
      'ONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 970
    Top = 383
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
    InputNames = 'FlowLine40'
    OutputNames = 'FlowLine28'
    Description = 'RegistrarMovLicenca'
    Id = 265
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'LIC_COD'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
          'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
          #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'PES_COD'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>PES_COD_RESPONSAVEL</TEXT>'#13#10#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVaria' +
          'ble>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'LIC_SITUACAO'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_SITUACAO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX' +
          '>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALC' +
          'ODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'FONTE'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>R</VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO' +
          '>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'LMV_COMENTARIO'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfConcat</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
          'QL>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
          #13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjCon' +
          'st>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
          '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
          'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION' +
          '>'#13#10#9#9#9#9'<VALOR>Auto Renova'#231#227'o da Licen'#231'a - </VALOR>'#13#10#9#9#9#9'<DMLTYPE' +
          '>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FA' +
          'LSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10 +
          #9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>' +
          #13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10 +
          #9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL' +
          '>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10 +
          #9#9#9#9'<VALOR> - </VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DI' +
          'AGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>' +
          '-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCO' +
          'DE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjRule>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>C' +
          'ALLRULE</NOME>'#13#10#9#9#9#9'<TEXT>FUNCAO - Data hora do Banco de Dados</' +
          'TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOM' +
          'PATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VER' +
          'SION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9#9#9'<' +
          'NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL' +
          '>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>' +
          'datahoratexto</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9 +
          '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIEL' +
          'DINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'<RULEID>64' +
          '</RULEID>'#13#10#9#9#9'</TObjRule>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT' +
          '>'#13#10
      end
      item
        DataType = ftString
        Name = 'LMV_LOG'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>Retorno</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
          '>'#13#10#9#9'<TIPO>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          #9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>' +
          #13#10
      end
      item
        DataType = ftString
        Name = 'TTL_COD'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>TTL_COD</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
          '>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
          #10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT' +
          '>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'LIC_COD'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'PES_COD'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="PES_COD_RESPONSAVEL"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'LIC_SITUACAO'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">LIC_SITUACAO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'FONTE'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">R</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'LMV_COMENTARIO'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="ebfConcat">'#13#10#9#9'<PARAMS>' +
          #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">Auto Renova'#231#227'o da Lice' +
          'n'#231'a - </CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE"> - </' +
          'CONSTANT>'#13#10#9#9#9'<CALLRULE ID="64" NAME="FUNCAO - Data hora do Banc' +
          'o de Dados" PARAMSCOUNT="1">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE=' +
          '"Letras" NULL="FALSE">datahoratexto</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9 +
          #9#9'</CALLRULE>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'LMV_LOG'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="Retorno"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'TTL_COD'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="TTL_COD"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'LIC_COD'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'PES_COD'
        ParamType = ptInput
        Value = '@PES_COD_RESPONSAVEL'
      end
      item
        DataType = ftString
        Name = 'LIC_SITUACAO'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_SITUACAO)'
      end
      item
        DataType = ftString
        Name = 'FONTE'
        ParamType = ptInput
        Value = 'R'
      end
      item
        DataType = ftString
        Name = 'LMV_COMENTARIO'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Auto Renova'#231#227'o da Licen'#231'a - , - ,FUNCAO - Data hora' +
          ' do Banco de Dados(datahoratexto))'
      end
      item
        DataType = ftString
        Name = 'LMV_LOG'
        ParamType = ptInput
        Value = '@Retorno'
      end
      item
        DataType = ftString
        Name = 'TTL_COD'
        ParamType = ptInput
        Value = '@TTL_COD'
      end>
    Return = 'Retorno'
    ObjectName = 'RegistrarMovLicenca'
    RealName = 'CALLRULE'
  end
  object FlowExpression11: TFlowExpression
    Left = 590
    Top = 1059
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
    InputNames = 'FlowLine51;FlowLine52'
    OutputNames = 'FlowLine27'
    Description = 'Json retorno - WsNovoTitulo'
    Text = 'JSON - Criar objeto(@Retorno)'
    ReturnVar = 'Json retorno'
    Expression = 
      #9'<FUNCTION NAME="JSON - Criar objeto" REALNAME="ebfCreateObjectJ' +
      'SON">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<VARIABLE NAME="Retorno"/>'#13#10#9#9'</PARAMS>'#13#10#9 +
      '</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjVariable>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9'<TEXT>Retorno</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9'</PARAMS>'#13#10#9'</TOb' +
      'jFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowConnector3: TFlowConnector
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
    InputNames = 'FlowLine29;FlowLine17'
    OutputNames = 'FlowLine31'
  end
  object FlowLine31: TFlowLine
    Left = 645
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
    InputNames = 'FlowConnector3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowExpression12: TFlowExpression
    Left = 970
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
    ChangeDescription = True
    InputNames = 'FlowLine30'
    OutputNames = 'FlowLine26'
    Description = 'TTL_COD'
    Text = 
      'JSON - Obter Valor(JSON - Criar objeto(Obter Objeto da Lista(JSO' +
      'N - Obter Valor(@Json retorno,result),1)),TTL_COD)'
    ReturnVar = 'TTL_COD'
    Expression = 
      #9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="ebfGetValueObject' +
      'Json">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="JSON - Criar objeto" REAL' +
      'NAME="ebfCreateObjectJSON">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="' +
      'Obter Objeto da Lista" REALNAME="ebfGetElementFromList">'#13#10#9#9#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="JSON - Obter Valor" REALNAME="e' +
      'bfGetValueObjectJson">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAM' +
      'E="Json retorno"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE' +
      '">result</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9 +
      #9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALSE">1</CONSTANT>'#13#10#9#9#9#9#9#9'</P' +
      'ARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CON' +
      'STANT TYPE="Letras" NULL="FALSE">TTL_COD</CONSTANT>'#13#10#9#9'</PARAMS>' +
      #13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</' +
      'INCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>' +
      #13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10 +
      #9#9#9#9'<TEXT>ebfCreateObjectJSON</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      '<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9 +
      #9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObj' +
      'Function>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9 +
      '<TEXT>ebfGetElementFromList</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9 +
      #9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>' +
      #13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</' +
      'NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfGetValueObjectJson</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>' +
      'FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9<' +
      '/ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>Json reto' +
      'rno</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Variante' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9 +
      #9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10 +
      #9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>CON' +
      'STANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9 +
      #9#9#9#9#9#9#9#9#9'<VALOR>result</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DML' +
      'TYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9#9#9'<NULO>FALS' +
      'E</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9'<GUID' +
      '></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9'</TObj' +
      'Const>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9'<TObjC' +
      'onst>'#13#10#9#9#9#9#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9 +
      #9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Inteiro' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MK' +
      'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9#9 +
      #9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
      #10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10 +
      #9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>TTL_COD' +
      '</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObj' +
      'Const>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine28: TFlowLine
    Left = 1025
    Top = 243
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowDecision5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine29: TFlowLine
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
    InputNames = 'FlowDecision5'
    OutputNames = 'FlowConnector3'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine32: TFlowLine
    Left = 1025
    Top = 168
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
    OutputNames = 'FlowSubRoutine2'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression26: TFlowExpression
    Left = 590
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
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine34'
    Description = 'tabela pessoa - token'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'tab cliente'
    Expression = 
      #9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13 +
      #10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><PSQL' +
      '>'#13#10#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  Lower(Convert(VARCHAR(32),hashbytes' +
      '('#39'MD5'#39','#13#10'  Concat(Upper(VS_CGI_PESSOA.PES_COD), VS_CGI_PESSOA.PE' +
      'S_NOME,'#13#10'  VS_CGI_PESSOA.PES_EMAIL, VS_CGI_PESSOA.PES_DOCUMENTO)' +
      '),2)) As token'#13#10'From'#13#10'  VS_CGI_PESSOA'#13#10'Where'#13#10'  VS_CGI_PESSOA.PE' +
      'S_COD = :cod'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9 +
      #9'<PARAMS>'#13#10#9#9#9#9#9#9'<DEFINE NAME="cod">'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="PES' +
      '_COD_RESPONSAVEL"/>'#13#10#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</PSQL' +
      '>'#13#10#9#9#9'</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONS' +
      'TANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteQuery</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13 +
      #10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.' +
      '75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  ' +
      'Lower(Convert(VARCHAR(32),hashbytes('#39'MD5'#39','#13#10'  Concat(Upper(VS_CG' +
      'I_PESSOA.PES_COD), VS_CGI_PESSOA.PES_NOME,'#13#10'  VS_CGI_PESSOA.PES_' +
      'EMAIL, VS_CGI_PESSOA.PES_DOCUMENTO)),2)) As token'#13#10'From'#13#10'  VS_CG' +
      'I_PESSOA'#13#10'Where'#13#10'  VS_CGI_PESSOA.PES_COD = :cod'#13#10#13#10#13#10'/*WHERE_ADD' +
      '*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<DEFINE NA' +
      'ME="cod">'#13#10#9#9#9#9#9#9#9#9'<VARIABLE NAME="PES_COD_RESPONSAVEL"/>'#13#10#9#9#9#9#9 +
      #9#9'</DEFINE>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9'</VALOR>'#13#10#9#9#9#9'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iM' +
      'S4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIExvd2VyKENvbnZlcnQoV' +
      'kFSQ0hBUigzMiksaGFzaGJ5dGVzKCdNRDUnLA0KICBDb25jYXQoVXBwZXIoVlNfQ' +
      '0dJX1BFU1NPQS5QRVNfQ09EKSwgVlNfQ0dJX1BFU1NPQS5QRVNfTk9NRSwNCiAgV' +
      'lNfQ0dJX1BFU1NPQS5QRVNfRU1BSUwsIFZTX0NHSV9QRVNTT0EuUEVTX0RPQ1VNR' +
      'U5UTykpLDIpKSBBcyB0b2tlbg0KRnJvbQ0KICBWU19DR0lfUEVTU09BDQpXaGVyZ' +
      'Q0KICBWU19DR0lfUEVTU09BLlBFU19DT0QgPSA6Y29kDQovKldIRVJFX0FERCovD' +
      'QovKk9SREVSX05FVyovDQo8L1NRTD4NCgk8UEFSQU1TPg0KCQk8REVGSU5FIE5BT' +
      'UU9ImNvZCI+DQoJCQk8VkFMVUU+QFBFU19DT0RfUkVTUE9OU0FWRUw8L1ZBTFVFP' +
      'g0KCQkJPERJQUdSQU1YTUw+UEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWo4K0RRb' +
      'zhVazlQVkQ0TkNnazhWRTlpYWxaaGNtbGhZbXhsUGcwS0NRazhTVVErTVR3dlNVU' +
      'StEUW9KQ1R4T1QwMUZQbFpCVWtsQlFreEZQQzlPVDAxRlBnMEtDUWs4VkVWWVZEN' +
      'VFSVk5mUTA5RVgxSkZVMUJQVGxOQlZrVk1QQzlVUlZoVVBnMEtDUWs4VTFGTVBrW' +
      'kJURk5GUEM5VFVVdytEUW9KQ1R4VVNWQlBQa2x1ZEdWcGNtODhMMVJKVUU4K0RRb' +
      '0pDVHhKVGtOUFRWQkJWRWxXUlV3K1ZGSlZSVHd2U1U1RFQwMVFRVlJKVmtWTVBnM' +
      'EtDUWs4VFV0U1gxWkZVbE5KVDA0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZKVFNVO' +
      'U9QZzBLQ1R3dlZFOWlhbFpoY21saFlteGxQZzBLUEM5U1QwOVVQZzBLPC9ESUFHU' +
      'kFNWE1MPg0KCQkJPEVYUFJFU1NJT04+DQpQRlpCVWtsQlFreEZJRTVCVFVVOUlsQ' +
      'kZVMTlEVDBSZlVrVlRVRTlPVTBGV1JVd2lMejQ9DQo8L0VYUFJFU1NJT04+DQoJC' +
      'TwvREVGSU5FPg0KCTwvUEFSQU1TPg0KPC9ST09UPg0K</DIAGRAMXML>'#13#10#9#9#9#9'<N' +
      'ULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></G' +
      'UID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObj' +
      'Const>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></T' +
      'EXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERS' +
      'ION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
      '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDE' +
      'X>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIAL' +
      'CODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine16: TFlowLine
    Left = 720
    Top = 18
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression26'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine34: TFlowLine
    Left = 645
    Top = 46
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
    InputNames = 'FlowExpression26'
    OutputNames = 'FlowExpression5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine3: TFlowSubRoutine
    Left = 1160
    Top = 608
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
    Description = 'WsNovoTitulo'
    Id = 198
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'Tabela Licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>PES_COD_PERMISSIONARIO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<' +
          'FIELDINDEX>1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'Tabela Licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>0</F' +
          'IELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10 +
          #9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VE' +
          'RSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR></VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NULO>' +
          #13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE' +
          '></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>LC</VALOR>'#13#10#9#9'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NUL' +
          'O>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'Tabela Licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_N_PARCELAS</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
          '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDIND' +
          'EX>62</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIA' +
          'LCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13 +
          #10
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'Tabela Licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_INTERVALO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDE' +
          'X>63</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIAL' +
          'CODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfDateIncDay</TEXT>'#13#10#9#9'<SQL>FALS' +
          'E</SQL>'#13#10#9#9'<TIPO>Data</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjF' +
          'unction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>t' +
          'oDate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Data</TIPO>'#13#10#9#9#9#9'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MK' +
          'R_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>4</ID>'#13 +
          #10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>LIC_DATA_BASE_VENCIMEN' +
          'TO</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Data</TIPO>'#13#10#9#9#9#9 +
          #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.7' +
          '5</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<' +
          'ID>6</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9 +
          #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATI' +
          'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
          'ON>'#13#10#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
          #9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9'<' +
          'FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALC' +
          'ODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjF' +
          'unction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9'<NOME>FUNCTION<' +
          '/NOME>'#13#10#9#9#9#9'<TEXT>oprIf</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>' +
          'Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR' +
          '_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunctio' +
          'n>'#13#10#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>i' +
          'sEqual</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>L'#243'gico</TIPO>' +
          #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9 +
          #9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>' +
          'ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Vari' +
          'ante</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9 +
          #9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9 +
          #9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>12</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE' +
          '</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>Tabela Licenca</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>F' +
          'ALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIV' +
          'EL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VE' +
          'RSION>'#13#10#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9 +
          #9#9'<ID>13</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>' +
          '</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Campo</TIPO' +
          '>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_' +
          'VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>FPG_ENTRADA</VA' +
          'LOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMX' +
          'ML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELD' +
          'INDEX>64</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13 +
          #10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>10</ID>' +
          #13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9 +
          '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPAT' +
          'IVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VE' +
          'RSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>S</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DML' +
          'TYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</N' +
          'ULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>' +
          #13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9 +
          #9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<I' +
          'D>11</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField<' +
          '/TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9 +
          #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.' +
          '75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9 +
          #9'<ID>12</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>Tabel' +
          'a Licenca</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela' +
          '</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MK' +
          'R_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9 +
          #9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>13</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>' +
          #13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO' +
          '>Campo</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9 +
          #9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>PFG_RETAR' +
          'DAR</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGR' +
          'AMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDI' +
          'NDEX>65</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</T' +
          'ObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>14</ID>'#13#10#9#9#9#9#9#9'<NOM' +
          'E>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FA' +
          'LSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALS' +
          'E</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9 +
          #9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>14</ID>'#13#10#9#9#9#9#9#9#9 +
          #9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>Tabela Licenca</TEXT>'#13#10#9#9#9 +
          #9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INC' +
          'OMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</M' +
          'KR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9 +
          #9'<ID>14</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEX' +
          'T>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9 +
          #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0' +
          '.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>FPG_INTERVALO</VALOR>'#13#10#9#9#9#9#9#9#9 +
          #9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13 +
          #10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>63</FIELDINDEX>' +
          #13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9 +
          #9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</' +
          'PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</RO' +
          'OT>'#13#10
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>4</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'Tabela Licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.85</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>6</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>NOVO_VALOR_TITULO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
          #9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELD' +
          'INDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPE' +
          'CIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROO' +
          'T>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfGetUserCode</TEXT>'#13#10#9#9'<SQL>FAL' +
          'SE</SQL>'#13#10#9#9'<TIPO>N'#250'mero</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATI' +
          'VEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9'</TObjFunction>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>R</VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO' +
          '>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NUL' +
          'L="FALSE" INDEX="1">PES_COD_PERMISSIONARIO</CONSTANT>'#13#10#9#9'</PARAM' +
          'S>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NUL' +
          'L="FALSE" INDEX="0">LIC_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
          '>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">LC</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NUL' +
          'L="FALSE" INDEX="62">FPG_N_PARCELAS</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</' +
          'FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NUL' +
          'L="FALSE" INDEX="63">FPG_INTERVALO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</F' +
          'UNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Incrementa Dia" REALNAME="ebfDateIncDay">'#13#10#9#9'<P' +
          'ARAMS>'#13#10#9#9#9'<FUNCTION NAME="Para Data" REALNAME="toDate">'#13#10#9#9#9#9'<P' +
          'ARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="LIC_DATA_BASE_VENCIMENTO"/>'#13#10#9#9#9#9#9'<' +
          'CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9 +
          #9#9'</FUNCTION>'#13#10#9#9#9'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10#9#9#9#9'<PA' +
          'RAMS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9#9#9#9#9'<P' +
          'ARAMS>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9 +
          #9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9 +
          #9#9#9#9#9#9'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX="64">FPG_ENTRADA' +
          '</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'<CONS' +
          'TANT TYPE="Letras" NULL="FALSE">S</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
          #9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLFie' +
          'ld">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="Tabela Licenca"/>'#13#10 +
          #9#9#9#9#9#9#9'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX="65">PFG_RETARD' +
          'AR</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION' +
          ' NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<V' +
          'ARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Campo" N' +
          'ULL="FALSE" INDEX="63">FPG_INTERVALO</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>' +
          #13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10 +
          #9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="Tabela Licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">NOVO_VALOR_TITULO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTIO' +
          'N>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="ID do Usu'#225'rio" REALNAME="ebfGetUserCode">'#13#10#9'</F' +
          'UNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">R</CONSTANT>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 'Campo(@Tabela Licenca,PES_COD_PERMISSIONARIO)'
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 'Campo(@Tabela Licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = 'LC'
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 'Campo(@Tabela Licenca,FPG_N_PARCELAS)'
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 'Campo(@Tabela Licenca,FPG_INTERVALO)'
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          'Incrementa Dia(Para Data(@LIC_DATA_BASE_VENCIMENTO,),Se(Igual(Ca' +
          'mpo(@Tabela Licenca,FPG_ENTRADA),S),Campo(@Tabela Licenca,PFG_RE' +
          'TARDAR),Campo(@Tabela Licenca,FPG_INTERVALO)))'
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 'Campo(@Tabela Licenca,NOVO_VALOR_TITULO)'
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = 'ID do Usu'#225'rio()'
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = 'R'
      end>
    Return = 'Retorno'
    ObjectName = 'WsNovoTitulo'
    RealName = 'CALLRULE'
  end
  object FlowDecision7: TFlowDecision
    Left = 400
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
    InputNames = 'FlowLine38'
    OutputNames = 'FlowLine36;FlowLine35'
    Description = 'Licen'#231'a '#233' legado?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>5</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFunct' +
      'ion>'#13#10#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfSQ' +
      'LField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.8' +
      '5</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>7<' +
      '/ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>tabela licenca</T' +
      'EXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.85</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>' +
      '8</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL' +
      '>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13 +
      #10#9#9#9#9#9#9'<VALOR>LIC_LEGADO</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTY' +
      'PE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10 +
      #9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<S' +
      'PECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9'<NOME>CONST' +
      'ANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>L' +
      'etras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_V' +
      'ERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>S</VALOR>'#13#10#9#9#9#9'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>F' +
      'ALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13 +
      #10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10 +
      #9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      #9'<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUN' +
      'CTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<' +
      'VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" N' +
      'ULL="FALSE">LIC_LEGADO</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">S</CONSTANT>'#13#10#9#9'</PARA' +
      'MS>'#13#10#9'</FUNCTION>'#13#10
    Loop = False
  end
  object FlowSubRoutine5: TFlowSubRoutine
    Left = 400
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = False
    InputNames = 'FlowLine50'
    OutputNames = 'FlowLine37'
    Description = 'WsNovoTitulo'
    Id = 198
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>PES_COD_PERMISSIONARIO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<' +
          'FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10 +
          '</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.75</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>0</F' +
          'IELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10 +
          #9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VE' +
          'RSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR></VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>TRUE</NULO>' +
          #13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCODE' +
          '></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>LR</VALOR>'#13#10#9#9'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NUL' +
          'O>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.85</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_N_PARCELAS</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
          '<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDIND' +
          'EX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIA' +
          'LCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13 +
          #10
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.85</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_INTERVALO</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDE' +
          'X>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIAL' +
          'CODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfDateIncDay</TEXT>'#13#10#9#9'<SQL>FALS' +
          'E</SQL>'#13#10#9#9'<TIPO>Data</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjF' +
          'unction>'#13#10#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'ebfSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
          'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2' +
          '.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<I' +
          'D>11</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>tabela licen' +
          'ca</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9 +
          #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0' +
          '.97</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
          #9'<ID>11</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10 +
          #9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMP' +
          'ATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VER' +
          'SION>'#13#10#9#9#9#9#9#9'<VALOR>LIC_VALIDADE</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelec' +
          't</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE<' +
          '/NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10 +
          #9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARA' +
          'MS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>10</ID>'#13#10#9#9#9 +
          #9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>oprIf</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</' +
          'SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPA' +
          'TIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9 +
          #9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOM' +
          'E>'#13#10#9#9#9#9#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<T' +
          'IPO>L'#243'gico</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9 +
          #9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<' +
          'TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME' +
          '>'#13#10#9#9#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9 +
          #9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOM' +
          'PATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<' +
          'PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9 +
          #9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>tabela licenca</TEXT>'#13 +
          #10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9 +
          #9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION' +
          '>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9'<TOb' +
          'jConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13 +
          #10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9 +
          '<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>' +
          #13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALO' +
          'R>FPG_ENTRADA</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9 +
          #9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13 +
          #10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13 +
          #10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9 +
          #9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9 +
          #9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>' +
          '</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10 +
          #9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION' +
          '>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>S</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLT' +
          'YPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9 +
          #9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9 +
          #9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'<' +
          '/TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFu' +
          'nction>'#13#10#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<' +
          'TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Var' +
          'iante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<M' +
          'KR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjV' +
          'ariable>'#13#10#9#9#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9 +
          #9#9#9#9#9#9'<TEXT>tabela licenca</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
          #9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
          'VEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObj' +
          'Variable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9#9#9'<NOM' +
          'E>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQ' +
          'L>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INC' +
          'OMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9 +
          #9'<VALOR>PFG_RETARDAR</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE' +
          '>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>' +
          #13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9 +
          #9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</' +
          'PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>10' +
          '</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEX' +
          'T>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<' +
          'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</' +
          'MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID' +
          '>11</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>tabela li' +
          'cenca</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TI' +
          'PO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TO' +
          'bjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9 +
          #9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Let' +
          'ras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>FPG_INTERVALO' +
          '</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMX' +
          'ML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDE' +
          'X>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObj' +
          'Function>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TO' +
          'bjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vValorLic</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
          'QL>'#13#10#9#9'<TIPO>Fracionado</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
          'VEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'<' +
          '/ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>PES_COD_RESPONSAVEL</TEXT>'#13#10#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9'</TObjVaria' +
          'ble>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>Letras</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<VALOR>R</VALOR>'#13#10#9#9'<DMLTYPE>dtSe' +
          'lect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</NULO' +
          '>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">PES_COD_PERMISSIONARIO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FU' +
          'NCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Campo" NUL' +
          'L="FALSE" INDEX="0">LIC_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION' +
          '>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Inteiro" NULL="TRUE"></CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">LR</CONSTANT>'#13#10
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">FPG_N_PARCELAS</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13 +
          #10
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">FPG_INTERVALO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Incrementa&#x20;Dia" REALNAME="ebfDateIncDay">'#13#10 +
          '<PARAMS>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAM' +
          'S>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letr' +
          'as" NULL="FALSE"  >LIC_VALIDADE</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
          'N>'#13#10'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10'<PARAMS>'#13#10'<FUNCTION N' +
          'AME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME="Campo' +
          '" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20' +
          ';licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >FPG_ENTRADA<' +
          '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL' +
          '="FALSE"  >S</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME=' +
          '"Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabel' +
          'a&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >PFG_RE' +
          'TARDAR</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Campo' +
          '" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20' +
          ';licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >FPG_INTERVAL' +
          'O</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</' +
          'PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vValorLic"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="PES_COD_RESPONSAVEL"/>'#13#10
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = #9'<CONSTANT TYPE="Letras" NULL="FALSE">R</CONSTANT>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'CodTitular'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,PES_COD_PERMISSIONARIO)'
      end
      item
        DataType = ftString
        Name = 'CodLicenca'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'CodEvento'
        ParamType = ptInput
        Value = 'Nulo'
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
        Value = 'LR'
      end
      item
        DataType = ftString
        Name = 'NParcelas'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_N_PARCELAS)'
      end
      item
        DataType = ftString
        Name = 'IntervaloDias'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_INTERVALO)'
      end
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptInput
        Value = 
          'Incrementa Dia(Campo(@tabela licenca,LIC_VALIDADE),Se(Igual(Camp' +
          'o(@tabela licenca,FPG_ENTRADA),S),Campo(@tabela licenca,PFG_RETA' +
          'RDAR),Campo(@tabela licenca,FPG_INTERVALO)))'
      end
      item
        DataType = ftString
        Name = 'ValorTotal'
        ParamType = ptInput
        Value = '@vValorLic'
      end
      item
        DataType = ftString
        Name = 'CodSolicitante'
        ParamType = ptInput
        Value = '@PES_COD_RESPONSAVEL'
      end
      item
        DataType = ftString
        Name = 'FonteRegistro'
        ParamType = ptInput
        Value = 'R'
      end>
    Return = 'Retorno'
    ObjectName = 'WsNovoTitulo'
    RealName = 'CALLRULE'
  end
  object FlowConnector4: TFlowConnector
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
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine24'
  end
  object FlowLine7: TFlowLine
    Left = 645
    Top = 393
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowConnector4'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowConnector5: TFlowConnector
    Left = 460
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
    InputNames = 'FlowLine9;FlowLine24'
    OutputNames = 'FlowLine38'
  end
  object FlowLine9: TFlowLine
    Left = 455
    Top = 393
    Width = 64
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
    InputNames = 'FlowDecision3'
    OutputNames = 'FlowConnector5'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine24: TFlowLine
    Left = 455
    Top = 467
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
    OutputNames = 'FlowConnector5'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowRemark2: TFlowRemark
    Left = 210
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
    ChangeDescription = True
    InputNames = 'FlowLine44'
    OutputNames = 'FlowLine41'
    Description = 'Alterada a restri'#231#227'o no dia 24/06/2022 - Iury Roque'
  end
  object FlowLine41: TFlowLine
    Left = 265
    Top = 18
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
    InputNames = 'FlowRemark2'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine38: TFlowLine
    Left = 455
    Top = 467
    Width = 40
    Height = 116
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
    OutputNames = 'FlowDecision7'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowSubRoutine6: TFlowSubRoutine
    Left = 590
    Top = 758
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
    InputNames = 'FlowLine39'
    OutputNames = 'FlowLine43'
    Description = 'Licen'#231'a - Atualizar legenda da licen'#231'a'
    Id = 521
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'licCod'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.97</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
          'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
          #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'fpgCod'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.97</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
          'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
          #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'valorEqp'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Function>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'ebfSQLExecuteQuery</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabel' +
          'a</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSI' +
          'ON>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
          #9'<ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9 +
          #9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13#10#9#9#9#9#9#9'<I' +
          'NCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</M' +
          'KR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  V' +
          'S_CGI_LICENCA.NOVO_VALOR_TITULO'#13#10'From'#13#10'  VS_CGI_LICENCA'#13#10'Where'#13#10 +
          '  VS_CGI_LICENCA.LIC_COD = :LIC_COD'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_' +
          'NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<DEFINE NAME="LIC_' +
          'COD">'#13#10#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13 +
          #10#9#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca' +
          '"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">LIC_COD</C' +
          'ONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9 +
          '</DEFINE>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9#9#9'</VALOR>'#13#10#9#9 +
          #9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc' +
          '2lvbj0iMS4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIFZTX0NHSV9MS' +
          'UNFTkNBLk5PVk9fVkFMT1JfVElUVUxPDQpGcm9tDQogIFZTX0NHSV9MSUNFTkNBD' +
          'QpXaGVyZQ0KICBWU19DR0lfTElDRU5DQS5MSUNfQ09EID0gOkxJQ19DT0QNCi8qV' +
          '0hFUkVfQUREKi8NCi8qT1JERVJfTkVXKi8NCjwvU1FMPg0KCTxQQVJBTVM+DQoJC' +
          'TxERUZJTkUgTkFNRT0iTElDX0NPRCI+DQoJCQk8VkFMVUU+Q2FtcG8oQHRhYmVsY' +
          'SBsaWNlbmNhLExJQ19DT0QpPC9WQUxVRT4NCgkJCTxESUFHUkFNWE1MPlBEOTRiV' +
          '3dnZG1WeWMybHZiajBpTVM0d0lqOCtEUW84VWs5UFZENE5DZ2s4VkU5aWFrWjFib' +
          'U4wYVc5dVBnMEtDUWs4U1VRK01qd3ZTVVErRFFvSkNUeE9UMDFGUGtaVlRrTlVTV' +
          'TlPUEM5T1QwMUZQZzBLQ1FrOFZFVllWRDVsWW1aVFVVeEdhV1ZzWkR3dlZFVllWR' +
          'DROQ2drSlBGTlJURDVHUVV4VFJUd3ZVMUZNUGcwS0NRazhWRWxRVHo1V1lYSnBZV' +
          'zUwWlR3dlZFbFFUejROQ2drSlBFbE9RMDlOVUVGVVNWWkZURDVVVWxWRlBDOUpUa' +
          '05QVFZCQlZFbFdSVXcrRFFvSkNUeE5TMUpmVmtWU1UwbFBUajR4TGpJdU1DNDVOe' +
          'nd2VFV0U1gxWkZVbE5KVDA0K0RRb0pDVHhRUVZKQlRWTStEUW9KQ1FrOFZFOWlhb' +
          'FpoY21saFlteGxQZzBLQ1FrSkNUeEpSRDR5UEM5SlJENE5DZ2tKQ1FrOFRrOU5SV' +
          'DVXUVZKSlFVSk1SVHd2VGs5TlJUNE5DZ2tKQ1FrOFZFVllWRDUwWVdKbGJHRWdiR' +
          '2xqWlc1allUd3ZWRVZZVkQ0TkNna0pDUWs4VTFGTVBrWkJURk5GUEM5VFVVdytEU' +
          'W9KQ1FrSlBGUkpVRTgrVkdGaVpXeGhQQzlVU1ZCUFBnMEtDUWtKQ1R4SlRrTlBUV' +
          'kJCVkVsV1JVdytSa0ZNVTBVOEwwbE9RMDlOVUVGVVNWWkZURDROQ2drSkNRazhUV' +
          'XRTWDFaRlVsTkpUMDQrTVM0eUxqQXVPVGM4TDAxTFVsOVdSVkpUU1U5T1BnMEtDU' +
          'WtKUEM5VVQySnFWbUZ5YVdGaWJHVStEUW9KQ1FrOFZFOWlha052Ym5OMFBnMEtDU' +
          'WtKQ1R4SlJENHlQQzlKUkQ0TkNna0pDUWs4VGs5TlJUNURUMDVUVkVGT1ZEd3ZUa' +
          'zlOUlQ0TkNna0pDUWs4VkVWWVZENDhMMVJGV0ZRK0RRb0pDUWtKUEZOUlRENUdRV' +
          'XhUUlR3dlUxRk1QZzBLQ1FrSkNUeFVTVkJQUGt4bGRISmhjend2VkVsUVR6NE5DZ' +
          '2tKQ1FrOFNVNURUMDFRUVZSSlZrVk1QbFJTVlVVOEwwbE9RMDlOVUVGVVNWWkZUR' +
          'DROQ2drSkNRazhUVXRTWDFaRlVsTkpUMDQrTVM0eUxqQXVPVGM4TDAxTFVsOVdSV' +
          'kpUU1U5T1BnMEtDUWtKQ1R4V1FVeFBVajVNU1VOZlEwOUVQQzlXUVV4UFVqNE5DZ' +
          '2tKQ1FrOFJFMU1WRmxRUlQ1a2RGTmxiR1ZqZER3dlJFMU1WRmxRUlQ0TkNna0pDU' +
          'Ws4UkVsQlIxSkJUVmhOVEQ0OEwwUkpRVWRTUVUxWVRVdytEUW9KQ1FrSlBFNVZUR' +
          'TgrUmtGTVUwVThMMDVWVEU4K0RRb0pDUWtKUEVaSlJVeEVTVTVFUlZnK0xURThMM' +
          'FpKUlV4RVNVNUVSVmcrRFFvSkNRa0pQRWRWU1VRK1BDOUhWVWxFUGcwS0NRa0pDV' +
          'HhUVUVWRFNVRk1RMDlFUlQ0OEwxTlFSVU5KUVV4RFQwUkZQZzBLQ1FrSlBDOVVUM' +
          'kpxUTI5dWMzUStEUW9KQ1R3dlVFRlNRVTFUUGcwS0NUd3ZWRTlpYWtaMWJtTjBhV' +
          'zl1UGcwS1BDOVNUMDlVUGcwSzwvRElBR1JBTVhNTD4NCgkJCTxFWFBSRVNTSU9OP' +
          'g0KUEVaVlRrTlVTVTlPSUU1QlRVVTlJa05oYlhCdklpQlNSVUZNVGtGTlJUMGlaV' +
          '0ptVTFGTVJtbGxiR1FpUGcwS1BGQkJVa0ZOVXo0TkNqeFdRVkpKUVVKTVJTQk9RV' +
          'TFGUFNKMFlXSmxiR0VtSTNneU1EdHNhV05sYm1OaElpOCtEUW84UTA5T1UxUkJUb' +
          'FFnVkZsUVJUMGlUR1YwY21GeklpQk9WVXhNUFNKR1FVeFRSU0lnSUQ1TVNVTmZRM' +
          'DlFUEM5RFQwNVRWRUZPVkQ0TkNqd3ZVRUZTUVUxVFBnMEtQQzlHVlU1RFZFbFBUa' +
          'jQ9DQo8L0VYUFJFU1NJT04+DQoJCTwvREVGSU5FPg0KCTwvUEFSQU1TPg0KPC9ST' +
          '09UPg0K</DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDE' +
          'X>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPE' +
          'CIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>4</ID>' +
          #13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>F' +
          'ALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE' +
          '</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9 +
          #9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDE' +
          'X>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPE' +
          'CIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13 +
          #10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9 +
          '<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9 +
          #9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</' +
          'MKR_VERSION>'#13#10#9#9#9#9'<VALOR>NOVO_VALOR_TITULO</VALOR>'#13#10#9#9#9#9'<DMLTYPE' +
          '>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FA' +
          'LSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10 +
          #9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9 +
          '</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'licCod'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'fpgCod'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">FPG_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'valorEqp'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13#10 +
          #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><P' +
          'SQL>'#13#10#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  VS_CGI_LICENCA.NOVO_VALOR_TITU' +
          'LO'#13#10'From'#13#10'  VS_CGI_LICENCA'#13#10'Where'#13#10'  VS_CGI_LICENCA.LIC_COD = :L' +
          'IC_COD'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9'<PA' +
          'RAMS>'#13#10#9#9#9#9#9#9#9#9'<DEFINE NAME="LIC_COD">'#13#10#9#9#9#9#9#9#9#9#9'<FUNCTION NAME=' +
          '"Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Le' +
          'tras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9 +
          #9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9'</P' +
          'SQL>'#13#10#9#9#9#9#9'</CONSTANT>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"' +
          '></CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="' +
          'Letras" NULL="FALSE">NOVO_VALOR_TITULO</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10 +
          #9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'licCod'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'fpgCod'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_COD)'
      end
      item
        DataType = ftString
        Name = 'valorEqp'
        ParamType = ptInput
        Value = 'Campo(Abrir Consulta(SQL CONSULTA,),NOVO_VALOR_TITULO)'
      end>
    Return = 'vTeste'
    ObjectName = 'Licen'#231'a - Atualizar legenda da licen'#231'a'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine7: TFlowSubRoutine
    Left = 400
    Top = 758
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
    InputNames = 'FlowLine47'
    OutputNames = 'FlowLine46'
    Description = 'Licen'#231'a - Atualizar legenda da licen'#231'a'
    Id = 521
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'licCod'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.97</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>LIC_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
          'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
          #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'fpgCod'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9'<SQL>FALSE<' +
          '/SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Variable>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'tabela licenca</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Tabela</T' +
          'IPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.97</MKR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<' +
          'ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQ' +
          'L>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</' +
          'INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VAL' +
          'OR>FPG_COD</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</' +
          'FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13 +
          #10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'valorEqp'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>vValorLic</TEXT>'#13#10#9#9'<SQL>FALSE</S' +
          'QL>'#13#10#9#9'<TIPO>Fracionado</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
          'VEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'<' +
          '/ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'licCod'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'fpgCod'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9'<PARAMS>'#13#10#9#9#9 +
          '<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NU' +
          'LL="FALSE">FPG_COD</CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'valorEqp'
        ParamType = ptInput
        Value = #9'<VARIABLE NAME="vValorLic"/>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'licCod'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'fpgCod'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_COD)'
      end
      item
        DataType = ftString
        Name = 'valorEqp'
        ParamType = ptInput
        Value = '@vValorLic'
      end>
    Return = 'vTeste'
    ObjectName = 'Licen'#231'a - Atualizar legenda da licen'#231'a'
    RealName = 'CALLRULE'
  end
  object FlowExpression19: TFlowExpression
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
    InputNames = 'FlowLine49'
    OutputNames = 'FlowLine47'
    Description = 'Gravando o valor do eqpto atualizado'
    Text = 
      'Executar Comandos SQL(UPDATE CGI_LICENCA  Set LIC_VALOR = ?'#10'wher' +
      'e CGI_LICENCA.LIC_COD = ?,,Criar lista a partir dos Elementos(@v' +
      'ValorLic,Campo(@tabela licenca,LIC_COD)))'
    Expression = 
      #9'<FUNCTION NAME="Executar Comandos SQL" REALNAME="ebfSQLExecuteB' +
      'atch">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">UPDA' +
      'TE CGI_LICENCA  Set LIC_VALOR = ?'#13#10'where CGI_LICENCA.LIC_COD = ?' +
      '</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13 +
      #10#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elementos" REALNAME' +
      '="ebfListParamsCreate">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vVal' +
      'orLic"/>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9 +
      #9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9 +
      '<CONSTANT TYPE="Letras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9'<' +
      '/PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</P' +
      'ARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>10</ID>'#13#10#9 +
      #9'<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteBatch</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9 +
      #9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97' +
      '</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>UPDATE CGI_LICENCA  Set LIC_VALOR = ?' +
      #13#10'where CGI_LICENCA.LIC_COD = ?</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13 +
      #10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>1' +
      '2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR' +
      '></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObj' +
      'Const>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>23</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</' +
      'NOME>'#13#10#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>24</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>' +
      #13#10#9#9#9#9#9#9'<TEXT>vValorLic</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<T' +
      'IPO>Fracionado</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>' +
      #13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>30</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</' +
      'NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9 +
      #9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13 +
      #10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>31</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIA' +
      'BLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>tabela licenca</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FA' +
      'LSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
      #10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>32</ID>' +
      #13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VER' +
      'SION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>LIC_COD</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FAL' +
      'SE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></' +
      'GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13 +
      #10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObj' +
      'Function>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine47: TFlowLine
    Left = 455
    Top = 721
    Width = 40
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
    InputNames = 'FlowExpression19'
    OutputNames = 'FlowSubRoutine7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression20: TFlowExpression
    Left = 210
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
    ParentShowHint = False
    ShowHint = False
    ChangeDescription = True
    Description = 'Titulos LDF'
    Text = 
      'Abrir Consulta Din'#226'mica(SELECT'#13#10'VS_CGI_LICENCA.LIC_COD,'#13#10'VS_CGI_' +
      'LICENCA.PES_COD_PERMISSIONARIO,'#13#10'VS_CGI_LICENCA.LIC_NUMERO,'#13#10'VS_' +
      'CGI_LICENCA.LIC_VALIDADE,'#13#10'VS_CGI_LICENCA.LIC_DATA_BASE_VENCIMEN' +
      'TO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE_CARENCIA,'#13#10'CONVERT(VARCHAR(16),' +
      'GETDATE(),103) as HOJE,'#13#10'CONVERT(VARCHAR(16),GETDATE(),103)+'#39' '#39'+' +
      'CONVERT(VARCHAR(16),GETDATE(),108) AS HORA,'#13#10'VS_CGI_LICENCA.PES_' +
      'EMAIL_PERM,'#13#10'VS_CGI_LICENCA.PES_EMAIL_STATUS_PERM,'#13#10'CGI_CONFIG.C' +
      'FG_EMAIL_ATIVO,'#13#10'VS_CGI_LICENCA.PES_NOME_PERM,'#13#10'CGI_CONFIG.CFG_F' +
      'IN_PAR,'#13#10'VS_CGI_LICENCA.LIC_VENCIDA,'#13#10'VS_CGI_LICENCA.NOVO_VALOR_' +
      'TITULO,'#13#10'VS_CGI_LICENCA.LIC_SITUACAO,'#13#10'VS_LICENCA_STATUS_FIN.LIC' +
      '_INADIMPLENTE,'#13#10'VS_CGI_PESSOA.PES_EMAIL_STATUS,'#13#10'VS_CGI_LICENCA.' +
      'LIC_LEGADO,'#13#10'VS_CGI_LICENCA.FPG_COD,'#13#10'CGI_FORMA_PAG.FPG_ENTRADA,' +
      #13#10'CGI_FORMA_PAG.FPG_N_PARCELAS,'#13#10'CGI_FORMA_PAG.FPG_INTERVALO,'#13#10'C' +
      'GI_FORMA_PAG.PFG_RETARDAR'#13#10#13#10'FROM VS_CGI_LICENCA Inner Join VS_L' +
      'ICENCA_STATUS_FIN On VS_CGI_LICENCA.LIC_COD = VS_LICENCA_STATUS_' +
      'FIN.LIC_COD'#13#10'inner join VS_CGI_PESSOA on VS_CGI_LICENCA.PES_COD_' +
      'PERMISSIONARIO = VS_CGI_PESSOA.PES_COD'#13#10'inner join CGI_FORMA_PAG' +
      ' on VS_CGI_LICENCA.FPG_COD = CGI_FORMA_PAG.FPG_COD'#13#10', CGI_CONFIG' +
      #13#10'WHERE'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADIMPLENTE like '#39'N%'#39#13#10'and C' +
      'AST(VS_CGI_LICENCA.LIC_VALIDADE as date) between CAST(GETDATE() ' +
      'as date) and CAST(dateadd(day, CGI_CONFIG.CFG_FIN_PAR, GETDATE()' +
      ') as date)'#13#10'and VS_CGI_LICENCA.LIC_VENCIDA like '#39'N%'#39#13#10'and VS_CGI' +
      '_LICENCA.LIC_SITUACAO = '#39'LDF'#39#13#10'and'#13#10'(select count(VS_CGI_TITULO.' +
      'TTL_COD) from VS_CGI_TITULO where VS_CGI_TITULO.LIC_COD = VS_CGI' +
      '_LICENCA.LIC_COD'#13#10'and VS_CGI_TITULO.TTL_TIPO = '#39'LR'#39' and VS_CGI_T' +
      'ITULO.TTL_SITUACAO <> '#39'C'#39#13#10') = 0,,,)'
    ReturnVar = 'tabela licenca'
    Expression = 
      #9'<FUNCTION NAME="Abrir Consulta Din'#226'mica" REALNAME="ebfSQLDynami' +
      'cQuery">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">SE' +
      'LECT'#13#10'VS_CGI_LICENCA.LIC_COD,'#13#10'VS_CGI_LICENCA.PES_COD_PERMISSION' +
      'ARIO,'#13#10'VS_CGI_LICENCA.LIC_NUMERO,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE,'#13 +
      #10'VS_CGI_LICENCA.LIC_DATA_BASE_VENCIMENTO,'#13#10'VS_CGI_LICENCA.LIC_VA' +
      'LIDADE_CARENCIA,'#13#10'CONVERT(VARCHAR(16),GETDATE(),103) as HOJE,'#13#10'C' +
      'ONVERT(VARCHAR(16),GETDATE(),103)+'#39' '#39'+CONVERT(VARCHAR(16),GETDAT' +
      'E(),108) AS HORA,'#13#10'VS_CGI_LICENCA.PES_EMAIL_PERM,'#13#10'VS_CGI_LICENC' +
      'A.PES_EMAIL_STATUS_PERM,'#13#10'CGI_CONFIG.CFG_EMAIL_ATIVO,'#13#10'VS_CGI_LI' +
      'CENCA.PES_NOME_PERM,'#13#10'CGI_CONFIG.CFG_FIN_PAR,'#13#10'VS_CGI_LICENCA.LI' +
      'C_VENCIDA,'#13#10'VS_CGI_LICENCA.NOVO_VALOR_TITULO,'#13#10'VS_CGI_LICENCA.LI' +
      'C_SITUACAO,'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADIMPLENTE,'#13#10'VS_CGI_PES' +
      'SOA.PES_EMAIL_STATUS,'#13#10'VS_CGI_LICENCA.LIC_LEGADO,'#13#10'VS_CGI_LICENC' +
      'A.FPG_COD,'#13#10'CGI_FORMA_PAG.FPG_ENTRADA,'#13#10'CGI_FORMA_PAG.FPG_N_PARC' +
      'ELAS,'#13#10'CGI_FORMA_PAG.FPG_INTERVALO,'#13#10'CGI_FORMA_PAG.PFG_RETARDAR'#13 +
      #10#13#10'FROM VS_CGI_LICENCA Inner Join VS_LICENCA_STATUS_FIN On VS_CG' +
      'I_LICENCA.LIC_COD = VS_LICENCA_STATUS_FIN.LIC_COD'#13#10'inner join VS' +
      '_CGI_PESSOA on VS_CGI_LICENCA.PES_COD_PERMISSIONARIO = VS_CGI_PE' +
      'SSOA.PES_COD'#13#10'inner join CGI_FORMA_PAG on VS_CGI_LICENCA.FPG_COD' +
      ' = CGI_FORMA_PAG.FPG_COD'#13#10', CGI_CONFIG'#13#10'WHERE'#13#10'VS_LICENCA_STATUS' +
      '_FIN.LIC_INADIMPLENTE like '#39'N%'#39#13#10'and CAST(VS_CGI_LICENCA.LIC_VAL' +
      'IDADE as date) between CAST(GETDATE() as date) and CAST(dateadd(' +
      'day, CGI_CONFIG.CFG_FIN_PAR, GETDATE()) as date)'#13#10'and VS_CGI_LIC' +
      'ENCA.LIC_VENCIDA like '#39'N%'#39#13#10'and VS_CGI_LICENCA.LIC_SITUACAO = '#39'L' +
      'DF'#39#13#10'and'#13#10'(select count(VS_CGI_TITULO.TTL_COD) from VS_CGI_TITUL' +
      'O where VS_CGI_TITULO.LIC_COD = VS_CGI_LICENCA.LIC_COD'#13#10'and VS_C' +
      'GI_TITULO.TTL_TIPO = '#39'LR'#39' and VS_CGI_TITULO.TTL_SITUACAO &lt;&gt' +
      '; '#39'C'#39#13#10') = 0</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE">' +
      '</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Inteiro" NULL="TRUE"></CONSTANT>' +
      #13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLDynamicQuery</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<' +
      'INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MK' +
      'R_VERSION>'#13#10#9#9#9#9'<VALOR>SELECT'#13#10'VS_CGI_LICENCA.LIC_COD,'#13#10'VS_CGI_L' +
      'ICENCA.PES_COD_PERMISSIONARIO,'#13#10'VS_CGI_LICENCA.LIC_NUMERO,'#13#10'VS_C' +
      'GI_LICENCA.LIC_VALIDADE,'#13#10'VS_CGI_LICENCA.LIC_DATA_BASE_VENCIMENT' +
      'O,'#13#10'VS_CGI_LICENCA.LIC_VALIDADE_CARENCIA,'#13#10'CONVERT(VARCHAR(16),G' +
      'ETDATE(),103) as HOJE,'#13#10'CONVERT(VARCHAR(16),GETDATE(),103)+'#39' '#39'+C' +
      'ONVERT(VARCHAR(16),GETDATE(),108) AS HORA,'#13#10'VS_CGI_LICENCA.PES_E' +
      'MAIL_PERM,'#13#10'VS_CGI_LICENCA.PES_EMAIL_STATUS_PERM,'#13#10'CGI_CONFIG.CF' +
      'G_EMAIL_ATIVO,'#13#10'VS_CGI_LICENCA.PES_NOME_PERM,'#13#10'CGI_CONFIG.CFG_FI' +
      'N_PAR,'#13#10'VS_CGI_LICENCA.LIC_VENCIDA,'#13#10'VS_CGI_LICENCA.NOVO_VALOR_T' +
      'ITULO,'#13#10'VS_CGI_LICENCA.LIC_SITUACAO,'#13#10'VS_LICENCA_STATUS_FIN.LIC_' +
      'INADIMPLENTE,'#13#10'VS_CGI_PESSOA.PES_EMAIL_STATUS,'#13#10'VS_CGI_LICENCA.L' +
      'IC_LEGADO,'#13#10'VS_CGI_LICENCA.FPG_COD,'#13#10'CGI_FORMA_PAG.FPG_ENTRADA,'#13 +
      #10'CGI_FORMA_PAG.FPG_N_PARCELAS,'#13#10'CGI_FORMA_PAG.FPG_INTERVALO,'#13#10'CG' +
      'I_FORMA_PAG.PFG_RETARDAR'#13#10#13#10'FROM VS_CGI_LICENCA Inner Join VS_LI' +
      'CENCA_STATUS_FIN On VS_CGI_LICENCA.LIC_COD = VS_LICENCA_STATUS_F' +
      'IN.LIC_COD'#13#10'inner join VS_CGI_PESSOA on VS_CGI_LICENCA.PES_COD_P' +
      'ERMISSIONARIO = VS_CGI_PESSOA.PES_COD'#13#10'inner join CGI_FORMA_PAG ' +
      'on VS_CGI_LICENCA.FPG_COD = CGI_FORMA_PAG.FPG_COD'#13#10', CGI_CONFIG'#13 +
      #10'WHERE'#13#10'VS_LICENCA_STATUS_FIN.LIC_INADIMPLENTE like '#39'N%'#39#13#10'and CA' +
      'ST(VS_CGI_LICENCA.LIC_VALIDADE as date) between CAST(GETDATE() a' +
      's date) and CAST(dateadd(day, CGI_CONFIG.CFG_FIN_PAR, GETDATE())' +
      ' as date)'#13#10'and VS_CGI_LICENCA.LIC_VENCIDA like '#39'N%'#39#13#10'and VS_CGI_' +
      'LICENCA.LIC_SITUACAO = '#39'LDF'#39#13#10'and'#13#10'(select count(VS_CGI_TITULO.T' +
      'TL_COD) from VS_CGI_TITULO where VS_CGI_TITULO.LIC_COD = VS_CGI_' +
      'LICENCA.LIC_COD'#13#10'and VS_CGI_TITULO.TTL_TIPO = '#39'LR'#39' and VS_CGI_TI' +
      'TULO.TTL_SITUACAO &lt;&gt; '#39'C'#39#13#10') = 0</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</' +
      'NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9 +
      #9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<' +
      'SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<' +
      'VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'<' +
      '/TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT<' +
      '/NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Intei' +
      'ro</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERS' +
      'ION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE<' +
      '/NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9 +
      '<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9 +
      #9#9'<ID>5</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      '<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.85</MKR_VERSION>'#13#10#9#9#9#9 +
      '<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9 +
      '</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression22: TFlowExpression
    Left = 970
    Top = 1059
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
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine30'
    Description = 'GRAVAR NOVA VALIDADE'
    Text = 
      'Executar Comandos SQL(Concatena'#231#227'o(UPDATE CGI_LICENCA  Set LIC_D' +
      'ATA_RENOVACAO = getdate(), '#13#10'LIC_VALIDADE = DATEADD(day, (select' +
      ' CGI_FORMA_PAG.FPG_INT_RENOVACAO from CGI_FORMA_PAG where CGI_FO' +
      'RMA_PAG.FPG_COD = CGI_LICENCA.FPG_COD), LIC_VALIDADE)'#13#10'where CGI' +
      '_LICENCA.LIC_COD = ,Campo(@tabela licenca,LIC_COD),;),,)'
    ReturnVar = 'Retorno'
    Expression = 
      #9'<FUNCTION NAME="Executar Comandos SQL" REALNAME="ebfSQLExecuteB' +
      'atch">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<FUNCTION NAME="Concatena'#231#227'o" REALNAME="e' +
      'bfConcat">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FAL' +
      'SE">UPDATE CGI_LICENCA  Set LIC_DATA_RENOVACAO = getdate(), '#13#10'LI' +
      'C_VALIDADE = DATEADD(day, (select CGI_FORMA_PAG.FPG_INT_RENOVACA' +
      'O from CGI_FORMA_PAG where CGI_FORMA_PAG.FPG_COD = CGI_LICENCA.F' +
      'PG_COD), LIC_VALIDADE)'#13#10'where CGI_LICENCA.LIC_COD = </CONSTANT>'#13 +
      #10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9'<PAR' +
      'AMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT' +
      ' TYPE="Letras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13 +
      #10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">;</' +
      'CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9#9'<CONSTANT TYPE="Let' +
      'ras" NULL="TRUE"></CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="T' +
      'RUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteBatch</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INC' +
      'OMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9 +
      #9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9 +
      #9'<TEXT>ebfConcat</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras<' +
      '/TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<' +
      'ID>3</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9 +
      #9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9#9#9'<VALOR>UPDATE CGI_LICENCA  Set LIC_DATA_RENOVACAO = g' +
      'etdate(), '#13#10'LIC_VALIDADE = DATEADD(day, (select CGI_FORMA_PAG.FP' +
      'G_INT_RENOVACAO from CGI_FORMA_PAG where CGI_FORMA_PAG.FPG_COD =' +
      ' CGI_LICENCA.FPG_COD), LIC_VALIDADE)'#13#10'where CGI_LICENCA.LIC_COD ' +
      '= </VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>8</ID>'#13#10#9 +
      #9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPAT' +
      'IVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSI' +
      'ON>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10 +
      #9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>tabela licenca</TEX' +
      'T>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.' +
      '0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10 +
      #9#9#9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEX' +
      'T></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>' +
      #13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSIO' +
      'N>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>LIC_COD</VALOR>'#13#10#9#9#9#9#9#9 +
      #9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>' +
      #13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9 +
      '<TObjConst>'#13#10#9#9#9#9#9#9'<ID>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9 +
      #9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIP' +
      'O>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION' +
      '>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>;</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO' +
      '>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></' +
      'GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10 +
      #9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQ' +
      'L>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR' +
      '>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML' +
      '>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<' +
      'GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10 +
      #9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>4</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<' +
      'TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.75</' +
      'MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYP' +
      'E>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<F' +
      'IELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'<' +
      '/ROOT>'#13#10
  end
  object FlowLine18: TFlowLine
    Left = 835
    Top = 1068
    Width = 230
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowExpression22'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine30: TFlowLine
    Left = 1025
    Top = 843
    Width = 40
    Height = 265
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
    InputNames = 'FlowExpression22'
    OutputNames = 'FlowExpression12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression7: TFlowExpression
    Left = 970
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
    InputNames = 'FlowLine33'
    OutputNames = 'FlowLine45'
    Description = 'Consulta VS_LICENCA Atualizada'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'vTabLicAtt'
    Expression = 
      #9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13 +
      #10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><PSQL' +
      '>'#13#10#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  VS_CGI_LICENCA.LIC_NUMERO,'#13#10'  VS_CG' +
      'I_LICENCA.PES_NOME_PERM,'#13#10'  VS_CGI_LICENCA.LIC_VALIDADE,'#13#10'  VS_C' +
      'GI_LICENCA.LIC_COD,'#13#10'  VS_CGI_LICENCA.PES_COD_PERMISSIONARIO,'#13#10' ' +
      ' VS_CGI_LICENCA.COD_END_PERM,'#13#10'  VS_CGI_LICENCA.END_PERM,'#13#10'  VS_' +
      'CGI_LICENCA.FOT_COD_PERM,'#13#10'  VS_CGI_LICENCA.PES_TIPO_PERM,'#13#10'  VS' +
      '_CGI_LICENCA.PES_DOC_PERM,'#13#10'  VS_CGI_LICENCA.PES_CELULAR1_PERM,'#13 +
      #10'  VS_CGI_LICENCA.PES_EMAIL_PERM,'#13#10'  VS_CGI_LICENCA.PES_EMAIL_ST' +
      'ATUS_PERM,'#13#10'  VS_CGI_LICENCA.LIC_FONTE_REG,'#13#10'  VS_CGI_LICENCA.LI' +
      'C_LIC_FONTE_REG_LEGENDA,'#13#10'  VS_CGI_LICENCA.LIC_SITUACAO,'#13#10'  VS_C' +
      'GI_LICENCA.SIL_DESCRICAO,'#13#10'  VS_CGI_LICENCA.SIL_INSTRUCOES,'#13#10'  V' +
      'S_CGI_LICENCA.PES_COD_REG,'#13#10'  VS_CGI_LICENCA.PES_QUEM_REGISTROU,' +
      #13#10'  VS_CGI_LICENCA.LIC_DATA_REG,'#13#10'  VS_CGI_LICENCA.TPL_COD,'#13#10'  V' +
      'S_CGI_LICENCA.TLP_SIGLA,'#13#10'  VS_CGI_LICENCA.TLP_NOME,'#13#10'  VS_CGI_L' +
      'ICENCA.LIC_SEQ,'#13#10'  VS_CGI_LICENCA.LIC_ANO,'#13#10'  VS_CGI_LICENCA.LIC' +
      '_VENCIDA,'#13#10'  VS_CGI_LICENCA.LIC_VALIDADE_CARENCIA,'#13#10'  VS_CGI_LIC' +
      'ENCA.LIC_RENOVACAO,'#13#10'  VS_CGI_LICENCA.LIC_TIPO_SOLICITACAO,'#13#10'  V' +
      'S_CGI_LICENCA.EQP_COD,'#13#10'  VS_CGI_LICENCA.EQP_DESCRICAO,'#13#10'  VS_CG' +
      'I_LICENCA.END_COD,'#13#10'  VS_CGI_LICENCA.END_ENDERECO_COMPLETO,'#13#10'  V' +
      'S_CGI_LICENCA.END_LATITUDE,'#13#10'  VS_CGI_LICENCA.END_LONGITUDE,'#13#10'  ' +
      'VS_CGI_LICENCA.END_MAPS,'#13#10'  VS_CGI_LICENCA.LIC_OBS,'#13#10'  VS_CGI_LI' +
      'CENCA.LIC_DATA_ALT,'#13#10'  VS_CGI_LICENCA.PES_COD_ALT,'#13#10'  VS_CGI_LIC' +
      'ENCA.PES_QUEM_ALTEROU,'#13#10'  VS_CGI_LICENCA.LIC_TIPO_REGISTRO,'#13#10'  V' +
      'S_CGI_LICENCA.LIC_QT_ENDERECOS,'#13#10'  VS_CGI_LICENCA.ATV_COD,'#13#10'  VS' +
      '_CGI_LICENCA.ATV_DESCRICAO,'#13#10'  VS_CGI_LICENCA.Defici'#234'nte,'#13#10'  VS_' +
      'CGI_LICENCA.PES_DEFICIENTE_LEGENDA,'#13#10'  VS_CGI_LICENCA.PES_TIPO_D' +
      'EFICIENCIA,'#13#10'  VS_CGI_LICENCA.PES_TIPO_DEFICIENCIA_LEGENDA,'#13#10'  V' +
      'S_CGI_LICENCA.PES_LM_CID,'#13#10'  VS_CGI_LICENCA.PES_LM_MEDICO_CPF,'#13#10 +
      '  VS_CGI_LICENCA.PES_LM_MEDICO_NOME,'#13#10'  VS_CGI_LICENCA.PES_LM_CN' +
      'PJ_UEL,'#13#10'  VS_CGI_LICENCA.PES_LM_RAZAO_UEL,'#13#10'  VS_CGI_LICENCA.LI' +
      'C_DECLARACAO_DFP,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_DFP_LEG,'#13#10'  V' +
      'S_CGI_LICENCA.LIC_DECLARACAO_RFCP,'#13#10'  VS_CGI_LICENCA.LIC_DECLARA' +
      'CAO_RFCP_LEG,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_AC,'#13#10'  VS_CGI_LIC' +
      'ENCA.LIC_DECLARACAO_AC_LEG,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_TER' +
      'MO_RESP,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_TERMO_RESP_LEG,'#13#10'  VS_' +
      'CGI_LICENCA.ITP_COD,'#13#10'  VS_CGI_LICENCA.ITP_VALOR,'#13#10'  VS_CGI_LICE' +
      'NCA.TBP_NOME_TABELA,'#13#10'  VS_CGI_LICENCA.TBP_DATA_BASE,'#13#10'  VS_CGI_' +
      'LICENCA.LIC_VALOR,'#13#10'  VS_CGI_LICENCA.FPG_COD,'#13#10'  VS_CGI_LICENCA.' +
      'FPG_NOME_FP,'#13#10'  VS_CGI_LICENCA.LIC_LEGENDA_FP,'#13#10'  VS_CGI_LICENCA' +
      '.TBP_COD,'#13#10'  VS_CGI_LICENCA.LIC_DATA_BASE_VENCIMENTO,'#13#10'  VS_CGI_' +
      'LICENCA.LIC_DATA_RENOVACAO,'#13#10'  VS_CGI_LICENCA.FOT_COD_QRCOD,'#13#10'  ' +
      'VS_CGI_LICENCA.LIC_LEGADO,'#13#10'  VS_CGI_LICENCA.LIC_COD_SUBST,'#13#10'  V' +
      'S_CGI_LICENCA.LIC_TAG,'#13#10'  VS_CGI_LICENCA.PES_DEFICIENTE,'#13#10'  VS_C' +
      'GI_LICENCA.LIC_COD_SUBST_LEGENDA,'#13#10'  VS_CGI_LICENCA.EQP_PRECIFIC' +
      'ACAO,'#13#10'  VS_CGI_LICENCA.EQP_PRECIFICACAO_LEGENDA,'#13#10'  VS_CGI_LICE' +
      'NCA.LIC_QT,'#13#10'  VS_CGI_LICENCA.TLP_FC,'#13#10'  VS_CGI_LICENCA.TLP_TAXA' +
      '_PUB,'#13#10'  VS_CGI_LICENCA.TLP_TAXA_TLP,'#13#10'  VS_CGI_LICENCA.NOVO_VAL' +
      'OR_TITULO,'#13#10'  VS_CGI_LICENCA.PES_LM_MEDICO_CRM_UF'#13#10'From'#13#10'  VS_CG' +
      'I_LICENCA'#13#10'Where'#13#10'  VS_CGI_LICENCA.LIC_COD = :LIC_COD'#13#10#13#10#13#10'/*WHE' +
      'RE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9'<DEFIN' +
      'E NAME="LIC_COD">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQ' +
      'LField">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tabela lice' +
      'nca"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">LIC_COD</C' +
      'ONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</DEFINE>' +
      #13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</PSQL>'#13#10#9#9#9'</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE' +
      '="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteQuery</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13 +
      #10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.' +
      '97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  ' +
      'VS_CGI_LICENCA.LIC_NUMERO,'#13#10'  VS_CGI_LICENCA.PES_NOME_PERM,'#13#10'  V' +
      'S_CGI_LICENCA.LIC_VALIDADE,'#13#10'  VS_CGI_LICENCA.LIC_COD,'#13#10'  VS_CGI' +
      '_LICENCA.PES_COD_PERMISSIONARIO,'#13#10'  VS_CGI_LICENCA.COD_END_PERM,' +
      #13#10'  VS_CGI_LICENCA.END_PERM,'#13#10'  VS_CGI_LICENCA.FOT_COD_PERM,'#13#10'  ' +
      'VS_CGI_LICENCA.PES_TIPO_PERM,'#13#10'  VS_CGI_LICENCA.PES_DOC_PERM,'#13#10' ' +
      ' VS_CGI_LICENCA.PES_CELULAR1_PERM,'#13#10'  VS_CGI_LICENCA.PES_EMAIL_P' +
      'ERM,'#13#10'  VS_CGI_LICENCA.PES_EMAIL_STATUS_PERM,'#13#10'  VS_CGI_LICENCA.' +
      'LIC_FONTE_REG,'#13#10'  VS_CGI_LICENCA.LIC_LIC_FONTE_REG_LEGENDA,'#13#10'  V' +
      'S_CGI_LICENCA.LIC_SITUACAO,'#13#10'  VS_CGI_LICENCA.SIL_DESCRICAO,'#13#10'  ' +
      'VS_CGI_LICENCA.SIL_INSTRUCOES,'#13#10'  VS_CGI_LICENCA.PES_COD_REG,'#13#10' ' +
      ' VS_CGI_LICENCA.PES_QUEM_REGISTROU,'#13#10'  VS_CGI_LICENCA.LIC_DATA_R' +
      'EG,'#13#10'  VS_CGI_LICENCA.TPL_COD,'#13#10'  VS_CGI_LICENCA.TLP_SIGLA,'#13#10'  V' +
      'S_CGI_LICENCA.TLP_NOME,'#13#10'  VS_CGI_LICENCA.LIC_SEQ,'#13#10'  VS_CGI_LIC' +
      'ENCA.LIC_ANO,'#13#10'  VS_CGI_LICENCA.LIC_VENCIDA,'#13#10'  VS_CGI_LICENCA.L' +
      'IC_VALIDADE_CARENCIA,'#13#10'  VS_CGI_LICENCA.LIC_RENOVACAO,'#13#10'  VS_CGI' +
      '_LICENCA.LIC_TIPO_SOLICITACAO,'#13#10'  VS_CGI_LICENCA.EQP_COD,'#13#10'  VS_' +
      'CGI_LICENCA.EQP_DESCRICAO,'#13#10'  VS_CGI_LICENCA.END_COD,'#13#10'  VS_CGI_' +
      'LICENCA.END_ENDERECO_COMPLETO,'#13#10'  VS_CGI_LICENCA.END_LATITUDE,'#13#10 +
      '  VS_CGI_LICENCA.END_LONGITUDE,'#13#10'  VS_CGI_LICENCA.END_MAPS,'#13#10'  V' +
      'S_CGI_LICENCA.LIC_OBS,'#13#10'  VS_CGI_LICENCA.LIC_DATA_ALT,'#13#10'  VS_CGI' +
      '_LICENCA.PES_COD_ALT,'#13#10'  VS_CGI_LICENCA.PES_QUEM_ALTEROU,'#13#10'  VS_' +
      'CGI_LICENCA.LIC_TIPO_REGISTRO,'#13#10'  VS_CGI_LICENCA.LIC_QT_ENDERECO' +
      'S,'#13#10'  VS_CGI_LICENCA.ATV_COD,'#13#10'  VS_CGI_LICENCA.ATV_DESCRICAO,'#13#10 +
      '  VS_CGI_LICENCA.Defici'#234'nte,'#13#10'  VS_CGI_LICENCA.PES_DEFICIENTE_LE' +
      'GENDA,'#13#10'  VS_CGI_LICENCA.PES_TIPO_DEFICIENCIA,'#13#10'  VS_CGI_LICENCA' +
      '.PES_TIPO_DEFICIENCIA_LEGENDA,'#13#10'  VS_CGI_LICENCA.PES_LM_CID,'#13#10'  ' +
      'VS_CGI_LICENCA.PES_LM_MEDICO_CPF,'#13#10'  VS_CGI_LICENCA.PES_LM_MEDIC' +
      'O_NOME,'#13#10'  VS_CGI_LICENCA.PES_LM_CNPJ_UEL,'#13#10'  VS_CGI_LICENCA.PES' +
      '_LM_RAZAO_UEL,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_DFP,'#13#10'  VS_CGI_L' +
      'ICENCA.LIC_DECLARACAO_DFP_LEG,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_' +
      'RFCP,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_RFCP_LEG,'#13#10'  VS_CGI_LICEN' +
      'CA.LIC_DECLARACAO_AC,'#13#10'  VS_CGI_LICENCA.LIC_DECLARACAO_AC_LEG,'#13#10 +
      '  VS_CGI_LICENCA.LIC_DECLARACAO_TERMO_RESP,'#13#10'  VS_CGI_LICENCA.LI' +
      'C_DECLARACAO_TERMO_RESP_LEG,'#13#10'  VS_CGI_LICENCA.ITP_COD,'#13#10'  VS_CG' +
      'I_LICENCA.ITP_VALOR,'#13#10'  VS_CGI_LICENCA.TBP_NOME_TABELA,'#13#10'  VS_CG' +
      'I_LICENCA.TBP_DATA_BASE,'#13#10'  VS_CGI_LICENCA.LIC_VALOR,'#13#10'  VS_CGI_' +
      'LICENCA.FPG_COD,'#13#10'  VS_CGI_LICENCA.FPG_NOME_FP,'#13#10'  VS_CGI_LICENC' +
      'A.LIC_LEGENDA_FP,'#13#10'  VS_CGI_LICENCA.TBP_COD,'#13#10'  VS_CGI_LICENCA.L' +
      'IC_DATA_BASE_VENCIMENTO,'#13#10'  VS_CGI_LICENCA.LIC_DATA_RENOVACAO,'#13#10 +
      '  VS_CGI_LICENCA.FOT_COD_QRCOD,'#13#10'  VS_CGI_LICENCA.LIC_LEGADO,'#13#10' ' +
      ' VS_CGI_LICENCA.LIC_COD_SUBST,'#13#10'  VS_CGI_LICENCA.LIC_TAG,'#13#10'  VS_' +
      'CGI_LICENCA.PES_DEFICIENTE,'#13#10'  VS_CGI_LICENCA.LIC_COD_SUBST_LEGE' +
      'NDA,'#13#10'  VS_CGI_LICENCA.EQP_PRECIFICACAO,'#13#10'  VS_CGI_LICENCA.EQP_P' +
      'RECIFICACAO_LEGENDA,'#13#10'  VS_CGI_LICENCA.LIC_QT,'#13#10'  VS_CGI_LICENCA' +
      '.TLP_FC,'#13#10'  VS_CGI_LICENCA.TLP_TAXA_PUB,'#13#10'  VS_CGI_LICENCA.TLP_T' +
      'AXA_TLP,'#13#10'  VS_CGI_LICENCA.NOVO_VALOR_TITULO,'#13#10'  VS_CGI_LICENCA.' +
      'PES_LM_MEDICO_CRM_UF'#13#10'From'#13#10'  VS_CGI_LICENCA'#13#10'Where'#13#10'  VS_CGI_LI' +
      'CENCA.LIC_COD = :LIC_COD'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</CO' +
      'MMAND>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<DEFINE NAME="LIC_COD">'#13#10#9#9#9#9#9#9#9#9 +
      '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS' +
      '>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9#9#9#9'<CONST' +
      'ANT TYPE="Letras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9'</PA' +
      'RAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9 +
      #9#9#9#9'</PSQL>'#13#10#9#9#9#9'</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9 +
      '<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0K' +
      'U2VsZWN0DQogIFZTX0NHSV9MSUNFTkNBLkxJQ19OVU1FUk8sDQogIFZTX0NHSV9M' +
      'SUNFTkNBLlBFU19OT01FX1BFUk0sDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19WQUxJ' +
      'REFERSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuTElDX0NPRCwNCiAgVlNfQ0dJX0xJQ0VO' +
      'Q0EuUEVTX0NPRF9QRVJNSVNTSU9OQVJJTywNCiAgVlNfQ0dJX0xJQ0VOQ0EuQ09E' +
      'X0VORF9QRVJNLA0KICBWU19DR0lfTElDRU5DQS5FTkRfUEVSTSwNCiAgVlNfQ0dJ' +
      'X0xJQ0VOQ0EuRk9UX0NPRF9QRVJNLA0KICBWU19DR0lfTElDRU5DQS5QRVNfVElQ' +
      'T19QRVJNLA0KICBWU19DR0lfTElDRU5DQS5QRVNfRE9DX1BFUk0sDQogIFZTX0NH' +
      'SV9MSUNFTkNBLlBFU19DRUxVTEFSMV9QRVJNLA0KICBWU19DR0lfTElDRU5DQS5Q' +
      'RVNfRU1BSUxfUEVSTSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuUEVTX0VNQUlMX1NUQVRV' +
      'U19QRVJNLA0KICBWU19DR0lfTElDRU5DQS5MSUNfRk9OVEVfUkVHLA0KICBWU19D' +
      'R0lfTElDRU5DQS5MSUNfTElDX0ZPTlRFX1JFR19MRUdFTkRBLA0KICBWU19DR0lf' +
      'TElDRU5DQS5MSUNfU0lUVUFDQU8sDQogIFZTX0NHSV9MSUNFTkNBLlNJTF9ERVND' +
      'UklDQU8sDQogIFZTX0NHSV9MSUNFTkNBLlNJTF9JTlNUUlVDT0VTLA0KICBWU19D' +
      'R0lfTElDRU5DQS5QRVNfQ09EX1JFRywNCiAgVlNfQ0dJX0xJQ0VOQ0EuUEVTX1FV' +
      'RU1fUkVHSVNUUk9VLA0KICBWU19DR0lfTElDRU5DQS5MSUNfREFUQV9SRUcsDQog' +
      'IFZTX0NHSV9MSUNFTkNBLlRQTF9DT0QsDQogIFZTX0NHSV9MSUNFTkNBLlRMUF9T' +
      'SUdMQSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuVExQX05PTUUsDQogIFZTX0NHSV9MSUNF' +
      'TkNBLkxJQ19TRVEsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19BTk8sDQogIFZTX0NH' +
      'SV9MSUNFTkNBLkxJQ19WRU5DSURBLA0KICBWU19DR0lfTElDRU5DQS5MSUNfVkFM' +
      'SURBREVfQ0FSRU5DSUEsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19SRU5PVkFDQU8s' +
      'DQogIFZTX0NHSV9MSUNFTkNBLkxJQ19USVBPX1NPTElDSVRBQ0FPLA0KICBWU19D' +
      'R0lfTElDRU5DQS5FUVBfQ09ELA0KICBWU19DR0lfTElDRU5DQS5FUVBfREVTQ1JJ' +
      'Q0FPLA0KICBWU19DR0lfTElDRU5DQS5FTkRfQ09ELA0KICBWU19DR0lfTElDRU5D' +
      'QS5FTkRfRU5ERVJFQ09fQ09NUExFVE8sDQogIFZTX0NHSV9MSUNFTkNBLkVORF9M' +
      'QVRJVFVERSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuRU5EX0xPTkdJVFVERSwNCiAgVlNf' +
      'Q0dJX0xJQ0VOQ0EuRU5EX01BUFMsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19PQlMs' +
      'DQogIFZTX0NHSV9MSUNFTkNBLkxJQ19EQVRBX0FMVCwNCiAgVlNfQ0dJX0xJQ0VO' +
      'Q0EuUEVTX0NPRF9BTFQsDQogIFZTX0NHSV9MSUNFTkNBLlBFU19RVUVNX0FMVEVS' +
      'T1UsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19USVBPX1JFR0lTVFJPLA0KICBWU19D' +
      'R0lfTElDRU5DQS5MSUNfUVRfRU5ERVJFQ09TLA0KICBWU19DR0lfTElDRU5DQS5B' +
      'VFZfQ09ELA0KICBWU19DR0lfTElDRU5DQS5BVFZfREVTQ1JJQ0FPLA0KICBWU19D' +
      'R0lfTElDRU5DQS5EZWZpY2nqbnRlLA0KICBWU19DR0lfTElDRU5DQS5QRVNfREVG' +
      'SUNJRU5URV9MRUdFTkRBLA0KICBWU19DR0lfTElDRU5DQS5QRVNfVElQT19ERUZJ' +
      'Q0lFTkNJQSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuUEVTX1RJUE9fREVGSUNJRU5DSUFf' +
      'TEVHRU5EQSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuUEVTX0xNX0NJRCwNCiAgVlNfQ0dJ' +
      'X0xJQ0VOQ0EuUEVTX0xNX01FRElDT19DUEYsDQogIFZTX0NHSV9MSUNFTkNBLlBF' +
      'U19MTV9NRURJQ09fTk9NRSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuUEVTX0xNX0NOUEpf' +
      'VUVMLA0KICBWU19DR0lfTElDRU5DQS5QRVNfTE1fUkFaQU9fVUVMLA0KICBWU19D' +
      'R0lfTElDRU5DQS5MSUNfREVDTEFSQUNBT19ERlAsDQogIFZTX0NHSV9MSUNFTkNB' +
      'LkxJQ19ERUNMQVJBQ0FPX0RGUF9MRUcsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19E' +
      'RUNMQVJBQ0FPX1JGQ1AsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19ERUNMQVJBQ0FP' +
      'X1JGQ1BfTEVHLA0KICBWU19DR0lfTElDRU5DQS5MSUNfREVDTEFSQUNBT19BQywN' +
      'CiAgVlNfQ0dJX0xJQ0VOQ0EuTElDX0RFQ0xBUkFDQU9fQUNfTEVHLA0KICBWU19D' +
      'R0lfTElDRU5DQS5MSUNfREVDTEFSQUNBT19URVJNT19SRVNQLA0KICBWU19DR0lf' +
      'TElDRU5DQS5MSUNfREVDTEFSQUNBT19URVJNT19SRVNQX0xFRywNCiAgVlNfQ0dJ' +
      'X0xJQ0VOQ0EuSVRQX0NPRCwNCiAgVlNfQ0dJX0xJQ0VOQ0EuSVRQX1ZBTE9SLA0K' +
      'ICBWU19DR0lfTElDRU5DQS5UQlBfTk9NRV9UQUJFTEEsDQogIFZTX0NHSV9MSUNF' +
      'TkNBLlRCUF9EQVRBX0JBU0UsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19WQUxPUiwN' +
      'CiAgVlNfQ0dJX0xJQ0VOQ0EuRlBHX0NPRCwNCiAgVlNfQ0dJX0xJQ0VOQ0EuRlBH' +
      'X05PTUVfRlAsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19MRUdFTkRBX0ZQLA0KICBW' +
      'U19DR0lfTElDRU5DQS5UQlBfQ09ELA0KICBWU19DR0lfTElDRU5DQS5MSUNfREFU' +
      'QV9CQVNFX1ZFTkNJTUVOVE8sDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19EQVRBX1JF' +
      'Tk9WQUNBTywNCiAgVlNfQ0dJX0xJQ0VOQ0EuRk9UX0NPRF9RUkNPRCwNCiAgVlNf' +
      'Q0dJX0xJQ0VOQ0EuTElDX0xFR0FETywNCiAgVlNfQ0dJX0xJQ0VOQ0EuTElDX0NP' +
      'RF9TVUJTVCwNCiAgVlNfQ0dJX0xJQ0VOQ0EuTElDX1RBRywNCiAgVlNfQ0dJX0xJ' +
      'Q0VOQ0EuUEVTX0RFRklDSUVOVEUsDQogIFZTX0NHSV9MSUNFTkNBLkxJQ19DT0Rf' +
      'U1VCU1RfTEVHRU5EQSwNCiAgVlNfQ0dJX0xJQ0VOQ0EuRVFQX1BSRUNJRklDQUNB' +
      'TywNCiAgVlNfQ0dJX0xJQ0VOQ0EuRVFQX1BSRUNJRklDQUNBT19MRUdFTkRBLA0K' +
      'ICBWU19DR0lfTElDRU5DQS5MSUNfUVQsDQogIFZTX0NHSV9MSUNFTkNBLlRMUF9G' +
      'QywNCiAgVlNfQ0dJX0xJQ0VOQ0EuVExQX1RBWEFfUFVCLA0KICBWU19DR0lfTElD' +
      'RU5DQS5UTFBfVEFYQV9UTFAsDQogIFZTX0NHSV9MSUNFTkNBLk5PVk9fVkFMT1Jf' +
      'VElUVUxPLA0KICBWU19DR0lfTElDRU5DQS5QRVNfTE1fTUVESUNPX0NSTV9VRg0K' +
      'RnJvbQ0KICBWU19DR0lfTElDRU5DQQ0KV2hlcmUNCiAgVlNfQ0dJX0xJQ0VOQ0Eu' +
      'TElDX0NPRCA9IDpMSUNfQ09EDQovKldIRVJFX0FERCovDQovKk9SREVSX05FVyov' +
      'DQo8L1NRTD4NCgk8UEFSQU1TPg0KCQk8REVGSU5FIE5BTUU9IkxJQ19DT0QiPg0K' +
      'CQkJPFZBTFVFPkNhbXBvKEB0YWJlbGEgbGljZW5jYSxMSUNfQ09EKTwvVkFMVUU+' +
      'DQoJCQk8RElBR1JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFv' +
      'OFVrOVBWRDROQ2drOFZFOWlha1oxYm1OMGFXOXVQZzBLQ1FrOFNVUStNVHd2U1VR' +
      'K0RRb0pDVHhPVDAxRlBrWlZUa05VU1U5T1BDOU9UMDFGUGcwS0NRazhWRVZZVkQ1' +
      'bFltWlRVVXhHYVdWc1pEd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd2VTFG' +
      'TVBnMEtDUWs4VkVsUVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNna0pQRWxPUTA5' +
      'TlVFRlVTVlpGVEQ1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWs4VFV0' +
      'U1gxWkZVbE5KVDA0K01TNHlMakF1T1RjOEwwMUxVbDlXUlZKVFNVOU9QZzBLQ1Fr' +
      'OFVFRlNRVTFUUGcwS0NRa0pQRlJQWW1wV1lYSnBZV0pzWlQ0TkNna0pDUWs4U1VR' +
      'K01qd3ZTVVErRFFvSkNRa0pQRTVQVFVVK1ZrRlNTVUZDVEVVOEwwNVBUVVUrRFFv' +
      'SkNRa0pQRlJGV0ZRK2RHRmlaV3hoSUd4cFkyVnVZMkU4TDFSRldGUStEUW9KQ1Fr' +
      'SlBGTlJURDVHUVV4VFJUd3ZVMUZNUGcwS0NRa0pDVHhVU1ZCUFBsUmhZbVZzWVR3' +
      'dlZFbFFUejROQ2drSkNRazhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtO' +
      'UFRWQkJWRWxXUlV3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpr' +
      'M1BDOU5TMUpmVmtWU1UwbFBUajROQ2drSkNUd3ZWRTlpYWxaaGNtbGhZbXhsUGcw' +
      'S0NRa0pQRlJQWW1wRGIyNXpkRDROQ2drSkNRazhTVVErTXp3dlNVUStEUW9KQ1Fr' +
      'SlBFNVBUVVUrUTA5T1UxUkJUbFE4TDA1UFRVVStEUW9KQ1FrSlBGUkZXRlErUEM5' +
      'VVJWaFVQZzBLQ1FrSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pDUWs4VkVs' +
      'UVR6NU1aWFJ5WVhNOEwxUkpVRTgrRFFvSkNRa0pQRWxPUTA5TlVFRlVTVlpGVEQ1' +
      'VVVsVkZQQzlKVGtOUFRWQkJWRWxXUlV3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1U5' +
      'T1BqRXVNaTR3TGprM1BDOU5TMUpmVmtWU1UwbFBUajROQ2drSkNRazhWa0ZNVDFJ' +
      'K1RFbERYME5QUkR3dlZrRk1UMUkrRFFvSkNRa0pQRVJOVEZSWlVFVStaSFJUWld4' +
      'bFkzUThMMFJOVEZSWlVFVStEUW9KQ1FrSlBFUkpRVWRTUVUxWVRVdytQQzlFU1VG' +
      'SFVrRk5XRTFNUGcwS0NRa0pDVHhPVlV4UFBrWkJURk5GUEM5T1ZVeFBQZzBLQ1Fr' +
      'SkNUeEdTVVZNUkVsT1JFVllQaTB4UEM5R1NVVk1SRWxPUkVWWVBnMEtDUWtKQ1R4' +
      'SFZVbEVQand2UjFWSlJENE5DZ2tKQ1FrOFUxQkZRMGxCVEVOUFJFVStQQzlUVUVW' +
      'RFNVRk1RMDlFUlQ0TkNna0pDVHd2VkU5aWFrTnZibk4wUGcwS0NRazhMMUJCVWtG' +
      'TlV6NE5DZ2s4TDFSUFltcEdkVzVqZEdsdmJqNE5Dand2VWs5UFZENE5DZz09PC9E' +
      'SUFHUkFNWE1MPg0KCQkJPEVYUFJFU1NJT04+DQpQRVpWVGtOVVNVOU9JRTVCVFVV' +
      'OUlrTmhiWEJ2SWlCU1JVRk1Ua0ZOUlQwaVpXSm1VMUZNUm1sbGJHUWlQZzBLUEZC' +
      'QlVrRk5VejROQ2p4V1FWSkpRVUpNUlNCT1FVMUZQU0owWVdKbGJHRW1JM2d5TUR0' +
      'c2FXTmxibU5oSWk4K0RRbzhRMDlPVTFSQlRsUWdWRmxRUlQwaVRHVjBjbUZ6SWlC' +
      'T1ZVeE1QU0pHUVV4VFJTSWdJRDVNU1VOZlEwOUVQQzlEVDA1VFZFRk9WRDROQ2p3' +
      'dlVFRlNRVTFUUGcwS1BDOUdWVTVEVkVsUFRqND0NCjwvRVhQUkVTU0lPTj4NCgkJ' +
      'PC9ERUZJTkU+DQoJPC9QQVJBTVM+DQo8L1JPT1Q+DQo=</DIAGRAMXML>'#13#10#9#9#9#9'<' +
      'NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></' +
      'GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TOb' +
      'jConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></' +
      'TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VER' +
      'SION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9 +
      #9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDIND' +
      'EX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13 +
      #10
  end
  object FlowLine33: TFlowLine
    Left = 1025
    Top = 18
    Width = 40
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine45: TFlowLine
    Left = 835
    Top = 18
    Width = 230
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowExpression6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine17: TFlowLine
    Left = 835
    Top = 242
    Width = 64
    Height = 866
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
    InputNames = 'FlowDecision6'
    OutputNames = 'FlowConnector3'
    Description = 'N'#195'O'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowLine27: TFlowLine
    Left = 720
    Top = 1068
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
    InputNames = 'FlowExpression11'
    OutputNames = 'FlowDecision6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine8: TFlowSubRoutine
    Left = 400
    Top = 608
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
    InputNames = 'FlowLine36'
    OutputNames = 'FlowLine49'
    Description = 'Legado - Calcular licen'#231'a mais percentual'
    Id = 520
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pValor'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>toDouble</TEXT>'#13#10#9#9'<SQL>FALSE</SQ' +
          'L>'#13#10#9#9'<TIPO>Fracionado</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Function>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'ebfSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
          'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.' +
          '2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLExecut' +
          'eQuery</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>' +
          #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
          #9#9#9'<ID>1</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TE' +
          'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>SQL Consulta</TIPO>' +
          #13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSI' +
          'ON>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<COM' +
          'MAND>'#13#10'Select'#13#10'  VS_CGI_LICENCA.NOVO_VALOR_TITULO,'#13#10'  VS_CGI_LIC' +
          'ENCA.LIC_VALOR'#13#10'From'#13#10'  VS_CGI_LICENCA'#13#10'Where'#13#10'  VS_CGI_LICENCA.' +
          'LIC_COD = :id'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9 +
          #9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<DEFINE NAME="id">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<FUN' +
          'CTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9'<PARAMS' +
          '>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9 +
          #9#9'<CONSTANT TYPE="Letras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9 +
          #9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</DEFINE>' +
          #13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</PSQL></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYP' +
          'E>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS' +
          '4wIj8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIFZTX0NHSV9MSUNFTkNBLk' +
          '5PVk9fVkFMT1JfVElUVUxPLA0KICBWU19DR0lfTElDRU5DQS5MSUNfVkFMT1INCk' +
          'Zyb20NCiAgVlNfQ0dJX0xJQ0VOQ0ENCldoZXJlDQogIFZTX0NHSV9MSUNFTkNBLk' +
          'xJQ19DT0QgPSA6aWQNCi8qV0hFUkVfQUREKi8NCi8qT1JERVJfTkVXKi8NCjwvU1' +
          'FMPg0KCTxQQVJBTVM+DQoJCTxERUZJTkUgTkFNRT0iaWQiPg0KCQkJPFZBTFVFPk' +
          'NhbXBvKEB0YWJlbGEgbGljZW5jYSxMSUNfQ09EKTwvVkFMVUU+DQoJCQk8RElBR1' +
          'JBTVhNTD5QRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFvOFVrOVBWRDROQ2' +
          'drOFZFOWlha1oxYm1OMGFXOXVQZzBLQ1FrOFNVUStNVHd2U1VRK0RRb0pDVHhPVD' +
          'AxRlBrWlZUa05VU1U5T1BDOU9UMDFGUGcwS0NRazhWRVZZVkQ1bFltWlRVVXhHYV' +
          'dWc1pEd3ZWRVZZVkQ0TkNna0pQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEtDUWs4Vk' +
          'VsUVR6NVdZWEpwWVc1MFpUd3ZWRWxRVHo0TkNna0pQRWxPUTA5TlVFRlVTVlpGVE' +
          'Q1R1FVeFRSVHd2U1U1RFQwMVFRVlJKVmtWTVBnMEtDUWs4VFV0U1gxWkZVbE5KVD' +
          'A0K01TNHlMakF1TnpVOEwwMUxVbDlXUlZKVFNVOU9QZzBLQ1FrOFVFRlNRVTFUUG' +
          'cwS0NRa0pQRlJQWW1wV1lYSnBZV0pzWlQ0TkNna0pDUWs4U1VRK01qd3ZTVVErRF' +
          'FvSkNRa0pQRTVQVFVVK1ZrRlNTVUZDVEVVOEwwNVBUVVUrRFFvSkNRa0pQRlJGV0' +
          'ZRK2RHRmlaV3hoSUd4cFkyVnVZMkU4TDFSRldGUStEUW9KQ1FrSlBGTlJURDVHUV' +
          'V4VFJUd3ZVMUZNUGcwS0NRa0pDVHhVU1ZCUFBsUmhZbVZzWVR3dlZFbFFUejROQ2' +
          'drSkNRazhTVTVEVDAxUVFWUkpWa1ZNUGtaQlRGTkZQQzlKVGtOUFRWQkJWRWxXUl' +
          'V3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1U5T1BqRXVNaTR3TGpjMVBDOU5TMUpmVm' +
          'tWU1UwbFBUajROQ2drSkNUd3ZWRTlpYWxaaGNtbGhZbXhsUGcwS0NRa0pQRlJQWW' +
          '1wRGIyNXpkRDROQ2drSkNRazhTVVErTXp3dlNVUStEUW9KQ1FrSlBFNVBUVVUrUT' +
          'A5T1UxUkJUbFE4TDA1UFRVVStEUW9KQ1FrSlBGUkZXRlErUEM5VVJWaFVQZzBLQ1' +
          'FrSkNUeFRVVXcrUmtGTVUwVThMMU5SVEQ0TkNna0pDUWs4VkVsUVR6NU1aWFJ5WV' +
          'hNOEwxUkpVRTgrRFFvSkNRa0pQRWxPUTA5TlVFRlVTVlpGVEQ1VVVsVkZQQzlKVG' +
          'tOUFRWQkJWRWxXUlV3K0RRb0pDUWtKUEUxTFVsOVdSVkpUU1U5T1BqRXVNaTR3TG' +
          'pjMVBDOU5TMUpmVmtWU1UwbFBUajROQ2drSkNRazhWa0ZNVDFJK1RFbERYME5QUk' +
          'R3dlZrRk1UMUkrRFFvSkNRa0pQRVJOVEZSWlVFVStaSFJUWld4bFkzUThMMFJOVE' +
          'ZSWlVFVStEUW9KQ1FrSlBFUkpRVWRTUVUxWVRVdytQQzlFU1VGSFVrRk5XRTFNUG' +
          'cwS0NRa0pDVHhPVlV4UFBrWkJURk5GUEM5T1ZVeFBQZzBLQ1FrSkNUeEdTVVZNUk' +
          'VsT1JFVllQaTB4UEM5R1NVVk1SRWxPUkVWWVBnMEtDUWtKQ1R4SFZVbEVQand2Uj' +
          'FWSlJENE5DZ2tKQ1FrOFUxQkZRMGxCVEVOUFJFVStQQzlUVUVWRFNVRk1RMDlFUl' +
          'Q0TkNna0pDVHd2VkU5aWFrTnZibk4wUGcwS0NRazhMMUJCVWtGTlV6NE5DZ2s4TD' +
          'FSUFltcEdkVzVqZEdsdmJqNE5Dand2VWs5UFZENE5DZz09PC9ESUFHUkFNWE1MPg' +
          '0KCQkJPEVYUFJFU1NJT04+DQpQRVpWVGtOVVNVOU9JRTVCVFVVOUlrTmhiWEJ2SW' +
          'lCU1JVRk1Ua0ZOUlQwaVpXSm1VMUZNUm1sbGJHUWlQZzBLUEZCQlVrRk5VejROQ2' +
          'p4V1FWSkpRVUpNUlNCT1FVMUZQU0owWVdKbGJHRW1JM2d5TUR0c2FXTmxibU5oSW' +
          'k4K0RRbzhRMDlPVTFSQlRsUWdWRmxRUlQwaVRHVjBjbUZ6SWlCT1ZVeE1QU0pHUV' +
          'V4VFJTSWdJRDVNU1VOZlEwOUVQQzlEVDA1VFZFRk9WRDROQ2p3dlVFRlNRVTFUUG' +
          'cwS1BDOUdWVTVEVkVsUFRqND0NCjwvRVhQUkVTU0lPTj4NCgkJPC9ERUZJTkU+DQ' +
          'oJPC9QQVJBTVM+DQo8L1JPT1Q+DQo=</DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE' +
          '</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GU' +
          'ID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9 +
          #9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</N' +
          'OME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<' +
          'TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          #9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VA' +
          'LOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML><' +
          '/DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1<' +
          '/FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPEC' +
          'IALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunct' +
          'ion>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</' +
          'NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>' +
          'Campo</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<M' +
          'KR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>LIC_VALOR</VALOR' +
          '>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRA' +
          'MXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>1</FIELDINDEX' +
          '>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9 +
          '</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'<' +
          '/TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pPorcentagem'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
          '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>toDouble</TEXT>'#13#10#9#9'<SQL>FALSE</SQ' +
          'L>'#13#10#9#9'<TIPO>Fracionado</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIV' +
          'EL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObj' +
          'Function>'#13#10#9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>' +
          'ebfSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TI' +
          'PO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.' +
          '2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<' +
          'ID>1</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLExecut' +
          'eQuery</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>' +
          #13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1' +
          '.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9 +
          #9#9#9'<ID>1</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TE' +
          'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>SQL Consulta</TIPO>' +
          #13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSI' +
          'ON>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<COM' +
          'MAND>'#13#10'Select'#13#10'  CGI_CONFIG.CFG_PERC_LEG'#13#10'From'#13#10'  CGI_CONFIG'#13#10#13#10 +
          #13#10'/*WHERE_NEW*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10 +
          #9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</PSQL></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>' +
          'dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4w' +
          'Ij8+DQo8Uk9PVD4NCgk8U1FMPg0KU2VsZWN0DQogIENHSV9DT05GSUcuQ0ZHX1BF' +
          'UkNfTEVHDQpGcm9tDQogIENHSV9DT05GSUcNCi8qV0hFUkVfTkVXKi8NCi8qT1JE' +
          'RVJfTkVXKi8NCjwvU1FMPg0KCTxQQVJBTVM+DQoJPC9QQVJBTVM+DQo8L1JPT1Q+' +
          'DQo=</DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDIND' +
          'EX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE>' +
          '</SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9 +
          #9'<ID>1</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT' +
          '>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9 +
          #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0' +
          '.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtS' +
          'elect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NUL' +
          'O>TRUE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUI' +
          'D></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjCon' +
          'st>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9 +
          #9#9#9#9'<ID>1</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>' +
          #13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9#9#9'<INCOM' +
          'PATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_V' +
          'ERSION>'#13#10#9#9#9#9#9#9'<VALOR>CFG_PERC_LEG</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSel' +
          'ect</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALS' +
          'E</NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>0</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13 +
          #10#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PAR' +
          'AMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>' +
          #13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pValor'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Para Fracionado" REALNAME="toDouble">'#13#10#9#9'<PARAM' +
          'S>'#13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARA' +
          'MS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecut' +
          'eQuery">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="SQL Consulta" N' +
          'ULL="FALSE"><PSQL>'#13#10#9#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  VS_CGI_LICENCA' +
          '.NOVO_VALOR_TITULO,'#13#10'  VS_CGI_LICENCA.LIC_VALOR'#13#10'From'#13#10'  VS_CGI_' +
          'LICENCA'#13#10'Where'#13#10'  VS_CGI_LICENCA.LIC_COD = :id'#13#10#13#10#13#10'/*WHERE_ADD*' +
          '/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<DEFI' +
          'NE NAME="id">'#13#10#9#9#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQ' +
          'LField">'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tab' +
          'ela licenca"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE' +
          '">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</FUNCTI' +
          'ON>'#13#10#9#9#9#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</PSQL></C' +
          'ONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>' +
          #13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Campo"' +
          ' NULL="FALSE" INDEX="1">LIC_VALOR</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
          '</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end
      item
        DataType = ftString
        Name = 'pPorcentagem'
        ParamType = ptInput
        Value = 
          #9'<FUNCTION NAME="Para Fracionado" REALNAME="toDouble">'#13#10#9#9'<PARAM' +
          'S>'#13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PARA' +
          'MS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecut' +
          'eQuery">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="SQL Consulta" N' +
          'ULL="FALSE"><PSQL>'#13#10#9#9#9#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  CGI_CONFIG.CFG' +
          '_PERC_LEG'#13#10'From'#13#10'  CGI_CONFIG'#13#10#13#10#13#10'/*WHERE_NEW*/'#13#10'/*ORDER_NEW*/'#13 +
          #10'</COMMAND>'#13#10#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</PS' +
          'QL></CONSTANT>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"></CON' +
          'STANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="' +
          'Campo" NULL="FALSE" INDEX="0">CFG_PERC_LEG</CONSTANT>'#13#10#9#9#9#9'</PAR' +
          'AMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pValor'
        ParamType = ptInput
        Value = 'Para Fracionado(Campo(Abrir Consulta(SQL CONSULTA,),LIC_VALOR))'
      end
      item
        DataType = ftString
        Name = 'pPorcentagem'
        ParamType = ptInput
        Value = 
          'Para Fracionado(Campo(Abrir Consulta(SQL CONSULTA,),CFG_PERC_LEG' +
          '))'
      end>
    Return = 'vValorLic'
    ObjectName = 'Legado - Calcular licen'#231'a mais percentual'
    RealName = 'CALLRULE'
  end
  object FlowLine49: TFlowLine
    Left = 455
    Top = 618
    Width = 40
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
    InputNames = 'FlowSubRoutine8'
    OutputNames = 'FlowExpression19'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine36: TFlowLine
    Left = 455
    Top = 543
    Width = 60
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowSubRoutine8'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression2: TFlowExpression
    Left = 400
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine3'
    Description = 'n registros'
    Text = 'Campo(@tabela licenca,n)'
    ReturnVar = 'n registros'
    Expression = 
      '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIA' +
      'BLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
      'FALSE"  >n</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x2' +
      '0;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>' +
      #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>7</ID>'#13#10'<NOME>CONSTANT</NOME' +
      '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
      'ATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
      #10'<VALOR>n</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
      'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
      'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine2: TFlowLine
    Left = 455
    Top = 18
    Width = 40
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowExpression2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine3: TFlowLine
    Left = 455
    Top = 93
    Width = 40
    Height = 190
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
  object FlowLine5: TFlowLine
    Left = 455
    Top = 243
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine9: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine20'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;Inicia' +
          '&#x20;Registro&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
          'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
          'NDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13 +
          #10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQL' +
          'Field</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPAT' +
          'IVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<' +
          'PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEX' +
          'T>tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TI' +
          'PO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</' +
          'MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CO' +
          'NSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TI' +
          'PO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</M' +
          'KR_VERSION>'#13#10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>' +
          #13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1<' +
          '/FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObj' +
          'Const>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
          '</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;Inicia&#x20;Registr' +
          'o&#x20;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField' +
          '">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT ' +
          'TYPE="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</FU' +
          'NCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - , I' +
          'nicia Registro ,Campo(@tabela licenca,LIC_COD))'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine4: TFlowLine
    Left = 455
    Top = 243
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowSubRoutine9'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowLine20: TFlowLine
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
    InputNames = 'FlowSubRoutine9'
    OutputNames = 'FlowDecision3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine10: TFlowSubRoutine
    Left = 590
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
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine11'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;Finali' +
          'za&#x20;Registro&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
          'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
          'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
          '>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfS' +
          'QLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMP' +
          'ATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
          #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>7</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<T' +
          'EXT>tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</' +
          'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97' +
          '</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>' +
          'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
          'TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97<' +
          '/MKR_VERSION>'#13#10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
          '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
          'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;Finaliza&#x20;Regis' +
          'tro&#x20;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLFie' +
          'ld">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTAN' +
          'T TYPE="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</' +
          'FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - , F' +
          'inaliza Registro ,Campo(@tabela licenca,LIC_COD))'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine6: TFlowLine
    Left = 720
    Top = 169
    Width = 80
    Height = 48
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
    OutputNames = 'FlowSubRoutine10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine11: TFlowLine
    Left = 645
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
    InputNames = 'FlowSubRoutine10'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine11: TFlowSubRoutine
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
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine44'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Inicio</VALO' +
          'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
          'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
          '>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Inicio</CONSTANT>'#13#10'</PARA' +
          'MS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - ,In' +
          'icio)'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine1: TFlowLine
    Left = 75
    Top = 18
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
    InputNames = 'FlowStart1'
    OutputNames = 'FlowSubRoutine11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine44: TFlowLine
    Left = 75
    Top = 18
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
    InputNames = 'FlowSubRoutine11'
    OutputNames = 'FlowRemark2'
    Region = 0
    Style = psDash
    Decision = False
  end
  object FlowSubRoutine12: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine23'
    OutputNames = 'FlowLine48'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fim</VALOR>'#13 +
          #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
          'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
          'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
          '</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Fim</CONSTANT>'#13#10'</PARAMS>' +
          #13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - ,Fi' +
          'm)'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine23: TFlowLine
    Left = 75
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
    OutputNames = 'FlowSubRoutine12'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine48: TFlowLine
    Left = 75
    Top = 468
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
    InputNames = 'FlowSubRoutine12'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine13: TFlowSubRoutine
    Left = 400
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
    ChangeDescription = False
    InputNames = 'FlowLine46'
    OutputNames = 'FlowLine50'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;Antes&' +
          '#x20;Novo&#x20;Titulo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQ' +
          'LField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
          'TIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10 +
          '<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TE' +
          'XT>tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</T' +
          'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97<' +
          '/MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>C' +
          'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
          'IPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</' +
          'MKR_VERSION>'#13#10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE' +
          '>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1' +
          '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
          'jConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
          #10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;Antes&#x20;Novo&#x2' +
          '0;Titulo</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLFiel' +
          'd">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT' +
          ' TYPE="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
          'UNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - , A' +
          'ntes Novo Titulo,Campo(@tabela licenca,LIC_COD))'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine46: TFlowLine
    Left = 455
    Top = 798
    Width = 40
    Height = 55
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
    InputNames = 'FlowSubRoutine7'
    OutputNames = 'FlowSubRoutine13'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine50: TFlowLine
    Left = 455
    Top = 873
    Width = 40
    Height = 55
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
    InputNames = 'FlowSubRoutine13'
    OutputNames = 'FlowSubRoutine5'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine17: TFlowSubRoutine
    Left = 400
    Top = 1058
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
    InputNames = 'FlowLine37'
    OutputNames = 'FlowLine51'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Depois&#x20;' +
          'Novo&#x20;Titulo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
          'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
          '>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TO' +
          'bjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLFiel' +
          'd</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL' +
          '>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARA' +
          'MS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>ta' +
          'bela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13 +
          #10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_' +
          'VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>CONSTA' +
          'NT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13 +
          #10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_V' +
          'ERSION>'#13#10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</RO' +
          'OT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >Depois&#x20;Novo&#x20;Tit' +
          'ulo</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10 +
          '<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE' +
          '="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
          'ON>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - ,De' +
          'pois Novo Titulo,Campo(@tabela licenca,LIC_COD))'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine37: TFlowLine
    Left = 455
    Top = 948
    Width = 40
    Height = 130
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
    InputNames = 'FlowSubRoutine5'
    OutputNames = 'FlowSubRoutine17'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine51: TFlowLine
    Left = 530
    Top = 1068
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
    InputNames = 'FlowSubRoutine17'
    OutputNames = 'FlowExpression11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine14: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine43'
    OutputNames = 'FlowLine53'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;Antes&' +
          '#x20;Novo&#x20;Titulo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
          'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
          'INDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>' +
          #13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQ' +
          'LField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPA' +
          'TIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10 +
          '<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TE' +
          'XT>tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</T' +
          'IPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97<' +
          '/MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>C' +
          'ONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</T' +
          'IPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</' +
          'MKR_VERSION>'#13#10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE' +
          '>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1' +
          '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
          'jConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
          #10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;Antes&#x20;Novo&#x2' +
          '0;Titulo</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLFiel' +
          'd">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT' +
          ' TYPE="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</F' +
          'UNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - , A' +
          'ntes Novo Titulo,Campo(@tabela licenca,LIC_COD))'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine15: TFlowSubRoutine
    Left = 590
    Top = 983
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
    InputNames = 'FlowLine10'
    OutputNames = 'FlowLine52'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Processar&#x20;Licenca&#x20' +
          ';Pr&#233;&#x20;Vencidas</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
          'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
          'LDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCons' +
          't>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
          '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
          'Tipo&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
          'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
          'X>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>5</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;Depois' +
          '&#x20;Novo&#x20;Titulo</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
          'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
          'DINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst' +
          '>'#13#10'<TObjFunction>'#13#10'<ID>7</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfS' +
          'QLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMP' +
          'ATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
          #10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>8</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<T' +
          'EXT>tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</' +
          'TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97' +
          '</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>9</ID>'#13#10'<NOME>' +
          'CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</' +
          'TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97<' +
          '/MKR_VERSION>'#13#10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYP' +
          'E>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-' +
          '1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TO' +
          'bjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>' +
          #13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug_arquivo</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Processar&' +
          '#x20;Licenca&#x20;Pr&#233;&#x20;Vencidas</CONSTANT>'#13#10'<CONSTANT T' +
          'YPE="Letras" NULL="FALSE"  >&#x20;Tipo&#x20;-&#x20;</CONSTANT>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;Depois&#x20;Novo&#x' +
          '20;Titulo</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLFie' +
          'ld">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTAN' +
          'T TYPE="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</' +
          'FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug_arquivo</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Processar Licenca Pr'#233' Vencidas, Tipo - , D' +
          'epois Novo Titulo,Campo(@tabela licenca,LIC_COD))'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'debug_arquivo'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine10: TFlowLine
    Left = 645
    Top = 948
    Width = 40
    Height = 55
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
    InputNames = 'FlowSubRoutine4'
    OutputNames = 'FlowSubRoutine15'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine52: TFlowLine
    Left = 645
    Top = 1023
    Width = 40
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
    InputNames = 'FlowSubRoutine15'
    OutputNames = 'FlowExpression11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine43: TFlowLine
    Left = 645
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
    InputNames = 'FlowSubRoutine6'
    OutputNames = 'FlowSubRoutine14'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine53: TFlowLine
    Left = 645
    Top = 873
    Width = 40
    Height = 55
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
    InputNames = 'FlowSubRoutine14'
    OutputNames = 'FlowSubRoutine4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression13: TFlowExpression
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
    Description = 'Obtem o valor do equipamento e itp_cod na nova tabela de pre'#231'o'
    Text = 'Abrir Consulta(SQL CONSULTA,)'
    ReturnVar = 'vTabPrecoAtual'
    Expression = 
      #9'<FUNCTION NAME="Abrir Consulta" REALNAME="ebfSQLExecuteQuery">'#13 +
      #10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="SQL Consulta" NULL="FALSE"><PSQL' +
      '>'#13#10#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  ITP.ITP_VALOR,'#13#10'  ITP.ITP_COD,'#13#10'  L' +
      'IC.LIC_QT'#13#10'From'#13#10'  CGI_ITENS_TAB_PRECO ITP'#13#10'  Inner Join'#13#10'  CGI_' +
      'LICENCA LIC On ITP.EQP_COD = LIC.EQP_COD'#13#10'Where ('#13#10'  (ITP.TBP_CO' +
      'D = (Select Top 1 CGI_TABELA_PRECO.TBP_COD From CGI_TABELA_PRECO' +
      #13#10'  Where CGI_TABELA_PRECO.TBP_SITUACAO = '#39'F'#39' Order By'#13#10'    CGI_' +
      'TABELA_PRECO.TBP_DATA_BASE Desc)) And'#13#10'  (LIC.LIC_COD = :LIC_COD' +
      '))'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDER_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9'<PARAMS>'#13 +
      #10#9#9#9#9#9#9'<DEFINE NAME="LIC_COD">'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" RE' +
      'ALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<VARIABLE NAME' +
      '="tabela licenca"/>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALS' +
      'E">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9 +
      #9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9'</PSQL>'#13#10#9#9#9'</CONSTANT>'#13#10#9#9#9'<' +
      'CONSTANT TYPE="Letras" NULL="TRUE"></CONSTANT>'#13#10#9#9'</PARAMS>'#13#10#9'</' +
      'FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteQuery</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9 +
      #9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TE' +
      'XT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>SQL Consulta</TIPO>'#13 +
      #10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.' +
      '97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR><PSQL>'#13#10#9#9#9#9#9#9'<COMMAND>'#13#10'Select'#13#10'  ' +
      'ITP.ITP_VALOR,'#13#10'  ITP.ITP_COD,'#13#10'  LIC.LIC_QT'#13#10'From'#13#10'  CGI_ITENS_' +
      'TAB_PRECO ITP'#13#10'  Inner Join'#13#10'  CGI_LICENCA LIC On ITP.EQP_COD = ' +
      'LIC.EQP_COD'#13#10'Where ('#13#10'  (ITP.TBP_COD = (Select Top 1 CGI_TABELA_' +
      'PRECO.TBP_COD From CGI_TABELA_PRECO'#13#10'  Where CGI_TABELA_PRECO.TB' +
      'P_SITUACAO = '#39'F'#39' Order By'#13#10'    CGI_TABELA_PRECO.TBP_DATA_BASE De' +
      'sc)) And'#13#10'  (LIC.LIC_COD = :LIC_COD))'#13#10#13#10#13#10'/*WHERE_ADD*/'#13#10'/*ORDE' +
      'R_NEW*/'#13#10'</COMMAND>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<DEFINE NAME="LIC_CO' +
      'D">'#13#10#9#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9 +
      #9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="tabela licenca"/>'#13#10#9#9#9 +
      #9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">LIC_COD</CONSTANT>'#13#10 +
      #9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'</DEFINE>'#13#10#9#9#9#9#9 +
      #9'</PARAMS>'#13#10#9#9#9#9#9'</PSQL>'#13#10#9#9#9#9'</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML>PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8Uk9PVD4' +
      'NCgk8U1FMPg0KU2VsZWN0DQogIElUUC5JVFBfVkFMT1IsDQogIElUUC5JVFBfQ09' +
      'ELA0KICBMSUMuTElDX1FUDQpGcm9tDQogIENHSV9JVEVOU19UQUJfUFJFQ08gSVR' +
      'QDQogIElubmVyIEpvaW4NCiAgQ0dJX0xJQ0VOQ0EgTElDIE9uIElUUC5FUVBfQ09' +
      'EID0gTElDLkVRUF9DT0QNCldoZXJlICgNCiAgKElUUC5UQlBfQ09EID0gKFNlbGV' +
      'jdCBUb3AgMSBDR0lfVEFCRUxBX1BSRUNPLlRCUF9DT0QgRnJvbSBDR0lfVEFCRUx' +
      'BX1BSRUNPDQogIFdoZXJlIENHSV9UQUJFTEFfUFJFQ08uVEJQX1NJVFVBQ0FPID0' +
      'gJ0YnIE9yZGVyIEJ5DQogICAgQ0dJX1RBQkVMQV9QUkVDTy5UQlBfREFUQV9CQVN' +
      'FIERlc2MpKSBBbmQNCiAgKExJQy5MSUNfQ09EID0gOkxJQ19DT0QpKQ0KLypXSEV' +
      'SRV9BREQqLw0KLypPUkRFUl9ORVcqLw0KPC9TUUw+DQoJPFBBUkFNUz4NCgkJPER' +
      'FRklORSBOQU1FPSJMSUNfQ09EIj4NCgkJCTxWQUxVRT5DYW1wbyhAdGFiZWxhIGx' +
      'pY2VuY2EsTElDX0NPRCk8L1ZBTFVFPg0KCQkJPERJQUdSQU1YTUw+UEQ5NGJXd2d' +
      'kbVZ5YzJsdmJqMGlNUzR3SWo4K0RRbzhVazlQVkQ0TkNnazhWRTlpYWtaMWJtTjB' +
      'hVzl1UGcwS0NRazhTVVErTWp3dlNVUStEUW9KQ1R4T1QwMUZQa1pWVGtOVVNVOU9' +
      'QQzlPVDAxRlBnMEtDUWs4VkVWWVZENWxZbVpUVVV4R2FXVnNaRHd2VkVWWVZENE5' +
      'DZ2tKUEZOUlRENUdRVXhUUlR3dlUxRk1QZzBLQ1FrOFZFbFFUejVXWVhKcFlXNTB' +
      'aVHd2VkVsUVR6NE5DZ2tKUEVsT1EwOU5VRUZVU1ZaRlRENUdRVXhUUlR3dlNVNUR' +
      'UMDFRUVZSSlZrVk1QZzBLQ1FrOFRVdFNYMVpGVWxOSlQwNCtNUzR5TGpBdU9UYzh' +
      'MMDFMVWw5V1JWSlRTVTlPUGcwS0NRazhVRUZTUVUxVFBnMEtDUWtKUEZSUFltcFd' +
      'ZWEpwWVdKc1pUNE5DZ2tKQ1FrOFNVUStNend2U1VRK0RRb0pDUWtKUEU1UFRVVSt' +
      'Wa0ZTU1VGQ1RFVThMMDVQVFVVK0RRb0pDUWtKUEZSRldGUStkR0ZpWld4aElHeHB' +
      'ZMlZ1WTJFOEwxUkZXRlErRFFvSkNRa0pQRk5SVEQ1R1FVeFRSVHd2VTFGTVBnMEt' +
      'DUWtKQ1R4VVNWQlBQbFJoWW1Wc1lUd3ZWRWxRVHo0TkNna0pDUWs4U1U1RFQwMVF' +
      'RVlJKVmtWTVBrWkJURk5GUEM5SlRrTlBUVkJCVkVsV1JVdytEUW9KQ1FrSlBFMUx' +
      'VbDlXUlZKVFNVOU9QakV1TWk0d0xqazNQQzlOUzFKZlZrVlNVMGxQVGo0TkNna0p' +
      'DVHd2VkU5aWFsWmhjbWxoWW14bFBnMEtDUWtKUEZSUFltcERiMjV6ZEQ0TkNna0p' +
      'DUWs4U1VRK05Ed3ZTVVErRFFvSkNRa0pQRTVQVFVVK1EwOU9VMVJCVGxROEwwNVB' +
      'UVVUrRFFvSkNRa0pQRlJGV0ZRK1BDOVVSVmhVUGcwS0NRa0pDVHhUVVV3K1JrRk1' +
      'VMFU4TDFOUlRENE5DZ2tKQ1FrOFZFbFFUejVNWlhSeVlYTThMMVJKVUU4K0RRb0p' +
      'DUWtKUEVsT1EwOU5VRUZVU1ZaRlRENVVVbFZGUEM5SlRrTlBUVkJCVkVsV1JVdyt' +
      'EUW9KQ1FrSlBFMUxVbDlXUlZKVFNVOU9QakV1TWk0d0xqazNQQzlOUzFKZlZrVlN' +
      'VMGxQVGo0TkNna0pDUWs4VmtGTVQxSStURWxEWDBOUFJEd3ZWa0ZNVDFJK0RRb0p' +
      'DUWtKUEVSTlRGUlpVRVUrWkhSVFpXeGxZM1E4TDBSTlRGUlpVRVUrRFFvSkNRa0p' +
      'QRVJKUVVkU1FVMVlUVXcrUEM5RVNVRkhVa0ZOV0UxTVBnMEtDUWtKQ1R4T1ZVeFB' +
      'Qa1pCVEZORlBDOU9WVXhQUGcwS0NRa0pDVHhHU1VWTVJFbE9SRVZZUGkweFBDOUd' +
      'TVVZNUkVsT1JFVllQZzBLQ1FrSkNUeEhWVWxFUGp3dlIxVkpSRDROQ2drSkNRazh' +
      'VMUJGUTBsQlRFTlBSRVUrUEM5VFVFVkRTVUZNUTA5RVJUNE5DZ2tKQ1R3dlZFOWl' +
      'ha052Ym5OMFBnMEtDUWs4TDFCQlVrRk5VejROQ2drOEwxUlBZbXBHZFc1amRHbHZ' +
      'iajROQ2p3dlVrOVBWRDROQ2c9PTwvRElBR1JBTVhNTD4NCgkJCTxFWFBSRVNTSU9' +
      'OPg0KUEVaVlRrTlVTVTlPSUU1QlRVVTlJa05oYlhCdklpQlNSVUZNVGtGTlJUMGl' +
      'aV0ptVTFGTVJtbGxiR1FpUGcwS1BGQkJVa0ZOVXo0TkNqeFdRVkpKUVVKTVJTQk9' +
      'RVTFGUFNKMFlXSmxiR0VtSTNneU1EdHNhV05sYm1OaElpOCtEUW84UTA5T1UxUkJ' +
      'UbFFnVkZsUVJUMGlUR1YwY21GeklpQk9WVXhNUFNKR1FVeFRSU0lnSUQ1TVNVTmZ' +
      'RMDlFUEM5RFQwNVRWRUZPVkQ0TkNqd3ZVRUZTUVUxVFBnMEtQQzlHVlU1RFZFbFB' +
      'UajQ9DQo8L0VYUFJFU1NJT04+DQoJCTwvREVGSU5FPg0KCTwvUEFSQU1TPg0KPC9' +
      'ST09UPg0K</DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>' +
      '-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCO' +
      'DE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>' +
      'CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<T' +
      'IPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<' +
      'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NU' +
      'LO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUI' +
      'D>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9'</PARAMS' +
      '>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression14: TFlowExpression
    Left = 780
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
    Description = 'Gravando o valor do eqpto conforme tabela de pre'#231'os'
    Text = 
      'Executar Comandos SQL(UPDATE CGI_LICENCA  Set LIC_VALOR = ?, ITP' +
      '_COD = ?'#10'where CGI_LICENCA.LIC_COD = ?,,Criar lista a partir dos' +
      ' Elementos(@vValorLic,Campo(@vTabPrecoAtual,ITP_COD),Campo(@tabe' +
      'la licenca,LIC_COD)))'
    Expression = 
      #9'<FUNCTION NAME="Executar Comandos SQL" REALNAME="ebfSQLExecuteB' +
      'atch">'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">UPDA' +
      'TE CGI_LICENCA  Set LIC_VALOR = ?, ITP_COD = ?'#13#10'where CGI_LICENC' +
      'A.LIC_COD = ?</CONSTANT>'#13#10#9#9#9'<CONSTANT TYPE="Letras" NULL="TRUE"' +
      '></CONSTANT>'#13#10#9#9#9'<FUNCTION NAME="Criar lista a partir dos Elemen' +
      'tos" REALNAME="ebfListParamsCreate">'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<VARIAB' +
      'LE NAME="vValorLic"/>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebf' +
      'SQLField">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="vTabPrecoAtua' +
      'l"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">ITP_COD</CONST' +
      'ANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<FUNCTION NAME="Ca' +
      'mpo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE N' +
      'AME="tabela licenca"/>'#13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FAL' +
      'SE">LIC_COD</CONSTANT>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'<' +
      '/PARAMS>'#13#10#9#9#9'</FUNCTION>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>10</ID>'#13#10#9 +
      #9'<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLExecuteBatch</TEXT>'#13#10#9#9'<SQ' +
      'L>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13 +
      #10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>11</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9 +
      #9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9 +
      #9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97' +
      '</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>UPDATE CGI_LICENCA  Set LIC_VALOR = ?' +
      ', ITP_COD = ?'#13#10'where CGI_LICENCA.LIC_COD = ?</VALOR>'#13#10#9#9#9#9'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>' +
      'FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>' +
      #13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjCons' +
      't>'#13#10#9#9#9#9'<ID>12</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATI' +
      'VEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION' +
      '>'#13#10#9#9#9#9'<VALOR></VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>TRUE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10#9#9#9'</TObjConst>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>23</ID>'#13#10#9#9#9#9'<NO' +
      'ME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>ebfListParamsCreate</TEXT>'#13#10#9#9#9#9'<S' +
      'QL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>24</ID>'#13#10#9#9#9#9#9#9'<NOME>VA' +
      'RIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vValorLic</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9#9#9#9#9'<TIPO>Fracionado</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9'</' +
      'TObjVariable>'#13#10#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9'<ID>27</ID>'#13#10#9#9#9#9#9#9'<NO' +
      'ME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>F' +
      'ALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9 +
      #9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9'<ID>28</ID>'#13#10#9#9#9#9#9#9 +
      #9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>vTabPrecoAtual</TEXT>'#13#10#9#9 +
      #9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<IN' +
      'COMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</' +
      'MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9 +
      #9#9'<ID>29</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TE' +
      'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9 +
      #9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.' +
      '0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<VALOR>ITP_COD</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9 +
      #9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9 +
      #9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9 +
      '</TObjConst>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjF' +
      'unction>'#13#10#9#9#9#9#9#9'<ID>30</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9 +
      '<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Va' +
      'riante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<' +
      'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9#9#9#9#9'<ID>31</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9#9#9#9#9'<TEXT>tabela licenca</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TOb' +
      'jVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>32</ID>'#13#10#9#9#9#9#9#9#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      #9#9'<VALOR>LIC_COD</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9 +
      #9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9 +
      #9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9 +
      #9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARA' +
      'MS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9 +
      '</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression15: TFlowExpression
    Left = 780
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
    Description = 'Obtem novo valor da licen'#231'a padr'#227'o'
    Text = 
      'Multiplica'#231#227'o(Campo(@vTabPrecoAtual,ITP_VALOR),Se(Ou('#201' Nulo ou V' +
      'azio(Campo(@vTabPrecoAtual,LIC_QT)),Igual(Campo(@vTabPrecoAtual,' +
      'LIC_QT),0)),1,Campo(@vTabPrecoAtual,LIC_QT)))'
    ReturnVar = 'vValorLic'
    Expression = 
      #9'<FUNCTION NAME="Multiplica'#231#227'o" REALNAME="oprMultiply">'#13#10#9#9'<PARA' +
      'MS>'#13#10#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9'<PAR' +
      'AMS>'#13#10#9#9#9#9#9'<VARIABLE NAME="vTabPrecoAtual"/>'#13#10#9#9#9#9#9'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE">ITP_VALOR</CONSTANT>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9 +
      '</FUNCTION>'#13#10#9#9#9'<FUNCTION NAME="Se" REALNAME="oprIf">'#13#10#9#9#9#9'<PARA' +
      'MS>'#13#10#9#9#9#9#9'<FUNCTION NAME="Ou" REALNAME="oprOr">'#13#10#9#9#9#9#9#9'<PARAMS>'#13 +
      #10#9#9#9#9#9#9#9'<FUNCTION NAME="'#201' Nulo ou Vazio" REALNAME="isNullOrEmpty' +
      '">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="' +
      'ebfSQLField">'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<VARIABLE NAME="vT' +
      'abPrecoAtual"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE"' +
      '>LIC_QT</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9 +
      #9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9'<FUNCTION NAME="Igu' +
      'al" REALNAME="isEqual">'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<FUNCTION NA' +
      'ME="Campo" REALNAME="ebfSQLField">'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9#9'<VARIABLE NAME="vTabPrecoAtual"/>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE=' +
      '"Letras" NULL="FALSE">LIC_QT</CONSTANT>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9 +
      #9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9#9#9#9'<CONSTANT TYPE="Inteiro" NULL="FALS' +
      'E">0</CONSTANT>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9#9'</' +
      'PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FA' +
      'LSE">1</CONSTANT>'#13#10#9#9#9#9#9'<FUNCTION NAME="Campo" REALNAME="ebfSQLF' +
      'ield">'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<VARIABLE NAME="vTabPrecoAtual"/>' +
      #13#10#9#9#9#9#9#9#9'<CONSTANT TYPE="Letras" NULL="FALSE">LIC_QT</CONSTANT>'#13 +
      #10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</FUNCTION>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</FUNCTION' +
      '>'#13#10#9#9'</PARAMS>'#13#10#9'</FUNCTION>'#13#10
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>oprMultiply</TEXT>'#13#10#9#9'<SQL>FALSE<' +
      '/SQL>'#13#10#9#9'<TIPO>N'#250'mero</TIPO>'#13#10#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL' +
      '>'#13#10#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjFu' +
      'nction>'#13#10#9#9#9#9'<ID>3</ID>'#13#10#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9'<TEXT>eb' +
      'fSQLField</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO' +
      '>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>1.2.0' +
      '.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9'<ID>' +
      '4</ID>'#13#10#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9'<TEXT>vTabPrecoAtual<' +
      '/TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9 +
      #9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97' +
      '</MKR_VERSION>'#13#10#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9'<I' +
      'D>5</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9 +
      #9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIV' +
      'EL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION' +
      '>'#13#10#9#9#9#9#9#9'<VALOR>ITP_VALOR</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLT' +
      'YPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13 +
      #10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9 +
      #9'</TObjFunction>'#13#10#9#9#9'<TObjFunction>'#13#10#9#9#9#9'<ID>6</ID>'#13#10#9#9#9#9'<NOME>F' +
      'UNCTION</NOME>'#13#10#9#9#9#9'<TEXT>oprIf</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10 +
      #9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9'<TOb' +
      'jFunction>'#13#10#9#9#9#9#9#9'<ID>7</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9 +
      #9'<TEXT>oprOr</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>L'#243'gico<' +
      '/TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VER' +
      'SION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObjFunctio' +
      'n>'#13#10#9#9#9#9#9#9#9#9'<ID>8</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<' +
      'TEXT>isNullOrEmpty</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TI' +
      'PO>L'#243'gico</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9 +
      #9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9 +
      #9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>9</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>FUNC' +
      'TION</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>' +
      'FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPA' +
      'TIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR' +
      '_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9 +
      #9#9#9#9#9#9'<ID>10</ID>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9 +
      #9#9'<TEXT>vTabPrecoAtual</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9 +
      #9#9#9#9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9 +
      #9#9#9#9#9#9#9#9#9#9'</TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<' +
      'ID>11</ID>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TEXT' +
      '></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<VALOR>LIC_' +
      'QT</VALOR>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9#9 +
      #9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9 +
      #9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10 +
      #9#9#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</TObjConst>' +
      #13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9#9'</PARAM' +
      'S>'#13#10#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9'<TObjFunction>'#13#10#9#9#9#9#9#9#9#9'<ID>1' +
      '2</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT>isEqual</TE' +
      'XT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9#9#9 +
      #9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2' +
      '.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9'<TObjFunction>'#13#10 +
      #9#9#9#9#9#9#9#9#9#9'<ID>13</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9'<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9 +
      '<PARAMS>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<TObjVariable>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<ID>14</ID>'#13#10#9#9 +
      #9#9#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TEXT>vTabPrecoAtua' +
      'l</TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TIPO>Tabela' +
      '</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9 +
      #9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</TObjVaria' +
      'ble>'#13#10#9#9#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<ID>15</ID>'#13#10#9#9#9#9#9#9#9#9#9 +
      #9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9#9#9#9 +
      #9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9 +
      '<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.' +
      '0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<VALOR>LIC_QT</VALOR>'#13#10#9#9#9#9#9#9#9#9#9 +
      #9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-' +
      '1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9#9#9'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'</PARAMS>' +
      #13#10#9#9#9#9#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9#9#9'<ID>' +
      '16</ID>'#13#10#9#9#9#9#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9#9#9'<TEXT></TEXT' +
      '>'#13#10#9#9#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9#9#9#9#9'<TIPO>Inteiro</TIPO>'#13#10#9 +
      #9#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9#9#9#9#9'<MKR_VERS' +
      'ION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9#9#9#9'<VALOR>0</VALOR>'#13#10#9#9#9#9#9#9#9#9 +
      #9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXM' +
      'L>'#13#10#9#9#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9#9#9#9#9#9#9'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10#9#9#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9#9#9#9'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10#9#9#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9#9#9'</TObj' +
      'Function>'#13#10#9#9#9#9#9#9'</PARAMS>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9#9'<TObjCons' +
      't>'#13#10#9#9#9#9#9#9'<ID>17</ID>'#13#10#9#9#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9'<TEXT>' +
      '</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9 +
      #9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<MKR_VERSION>1.2.0.9' +
      '7</MKR_VERSION>'#13#10#9#9#9#9#9#9'<VALOR>1</VALOR>'#13#10#9#9#9#9#9#9'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10#9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9'<NULO>FALSE</' +
      'NULO>'#13#10#9#9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9'<GUID></GUID>'#13#10#9 +
      #9#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9'<TObjF' +
      'unction>'#13#10#9#9#9#9#9#9'<ID>18</ID>'#13#10#9#9#9#9#9#9'<NOME>FUNCTION</NOME>'#13#10#9#9#9#9#9#9 +
      '<TEXT>ebfSQLField</TEXT>'#13#10#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9#9#9'<TIPO>Va' +
      'riante</TIPO>'#13#10#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9#9#9'<' +
      'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9'<PARAMS>'#13#10#9#9#9#9#9#9#9'<TObj' +
      'Variable>'#13#10#9#9#9#9#9#9#9#9'<ID>19</ID>'#13#10#9#9#9#9#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9 +
      #9#9#9#9#9#9#9'<TEXT>vTabPrecoAtual</TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9 +
      #9#9#9#9#9#9'<TIPO>Tabela</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9#9'</TOb' +
      'jVariable>'#13#10#9#9#9#9#9#9#9'<TObjConst>'#13#10#9#9#9#9#9#9#9#9'<ID>20</ID>'#13#10#9#9#9#9#9#9#9#9'<NO' +
      'ME>CONSTANT</NOME>'#13#10#9#9#9#9#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9#9#9#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9#9#9#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9#9#9#9#9'<INCOMPATIVEL>TRUE</IN' +
      'COMPATIVEL>'#13#10#9#9#9#9#9#9#9#9'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10#9#9#9#9#9#9 +
      #9#9'<VALOR>LIC_QT</VALOR>'#13#10#9#9#9#9#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9 +
      #9#9#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9 +
      #9#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9#9#9#9#9#9#9'<GUID></GUID>'#13#10#9#9#9#9#9#9#9 +
      #9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9#9#9#9#9'</TObjConst>'#13#10#9#9#9#9#9#9'</PARAM' +
      'S>'#13#10#9#9#9#9#9'</TObjFunction>'#13#10#9#9#9#9'</PARAMS>'#13#10#9#9#9'</TObjFunction>'#13#10#9#9'<' +
      '/PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowSubRoutine16: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine35'
    OutputNames = 'FlowLine39'
    Description = 'Licenca - Atualizar valor da licenca'
    Id = 544
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pLicCod'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>' +
          #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
          'bjVariable>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x2' +
          '0;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMP' +
          'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>' +
          #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME' +
          '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
          'ATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
          #10'<VALOR>LIC_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
          'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
          #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
          'RAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pFpgCod'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>' +
          #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</I' +
          'NCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
          'bjVariable>'#13#10'<ID>1</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x2' +
          '0;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMP' +
          'ATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>' +
          #13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>1</ID>'#13#10'<NOME>CONSTANT</NOME' +
          '>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMP' +
          'ATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13 +
          #10'<VALOR>FPG_COD</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
          'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
          #13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PA' +
          'RAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pLicCod'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIA' +
          'BLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
          'FALSE"  >LIC_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pFpgCod'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIA' +
          'BLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letras" NULL="' +
          'FALSE"  >FPG_COD</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pLicCod'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,LIC_COD)'
      end
      item
        DataType = ftString
        Name = 'pFpgCod'
        ParamType = ptInput
        Value = 'Campo(@tabela licenca,FPG_COD)'
      end>
    ObjectName = 'Licenca - Atualizar valor da licenca'
    RealName = 'CALLRULE'
  end
  object FlowLine35: TFlowLine
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
    InputNames = 'FlowDecision7'
    OutputNames = 'FlowSubRoutine16'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine39: TFlowLine
    Left = 645
    Top = 543
    Width = 40
    Height = 265
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
    InputNames = 'FlowSubRoutine16'
    OutputNames = 'FlowSubRoutine6'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine18: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine26'
    OutputNames = 'FlowLine40'
    Description = 'Geral - Arquivo Debug'
    Id = 526
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
          'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
          'LSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Fluxo&#x20;-&#x2' +
          '0;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXM' +
          'L>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUI' +
          'D>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
          '3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
          '<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>Movimentarlicenca</VALOR>'#13#10 +
          '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
          'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOM' +
          'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras' +
          '</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.' +
          '97</MKR_VERSION>'#13#10'<VALOR>&#x20;LIC_COD&#x20;=&#x20;</VALOR>'#13#10'<DM' +
          'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
          '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>6</ID>'#13#10'<NOM' +
          'E>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLField</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
          'TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VE' +
          'RSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>7</I' +
          'D>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>tabela&#x20;licenca</TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
          'TIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<T' +
          'ObjConst>'#13#10'<ID>8</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
          'L>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>TRUE</INCOMPAT' +
          'IVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>LIC_COD</VALO' +
          'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
          'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction' +
          '>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
          #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
          'COMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;-' +
          '-&#x20;PES_COD_RESPONSAVEL&#x20;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSele' +
          'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
          'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALC' +
          'ODE>'#13#10'</TObjConst>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</' +
          'NOME>'#13#10'<TEXT>PES_COD_RESPONSAVEL</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
          '>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
          'N>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>4</I' +
          'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
          'O>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
          'N>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;--&#x20;LIC_SITUA&#199;&#' +
          '195;O&#x20;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
          'MXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIND' +
          'EX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<' +
          'TObjFunction>'#13#10'<ID>4</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSQLFi' +
          'eld</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIV' +
          'EL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PA' +
          'RAMS>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>' +
          'tabela&#x20;licenca</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Tabela</TIPO' +
          '>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MK' +
          'R_VERSION>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONS' +
          'TANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO' +
          '>'#13#10'<INCOMPATIVEL>TRUE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR' +
          '_VERSION>'#13#10'<VALOR>LIC_SITUACAO</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTY' +
          'PE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>' +
          '-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</T' +
          'ObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10 +
          '<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Le' +
          'tras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.' +
          '2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;--&#x20;FONTE&#x20;=&#x20;R&#' +
          'x20;--&#x20;FUN&#199;&#195;O&#x20;DATA&#x20;HORA</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunction>'#13#10'<ID>4</ID>'#13#10'<NOME>F' +
          'UNCTION</NOME>'#13#10'<TEXT>ebfConcat</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
          'Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
          '1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME' +
          '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras<' +
          '/TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.9' +
          '7</MKR_VERSION>'#13#10'<VALOR>Auto&#x20;Renova&#231;&#227;o&#x20;da&#x' +
          '20;Licen&#231;a&#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE' +
          '>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1' +
          '</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TOb' +
          'jConst>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT><' +
          '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
          'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&' +
          '#x20;-&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
          '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
          'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjRu' +
          'le>'#13#10'<ID>4</ID>'#13#10'<NOME>CALLRULE</NOME>'#13#10'<TEXT>FUNCAO&#x20;-&#x20' +
          ';Data&#x20;hora&#x20;do&#x20;Banco&#x20;de&#x20;Dados</TEXT>'#13#10'<S' +
          'QL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
          'ATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCon' +
          'st>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
          'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
          #13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>datahoratexto</VAL' +
          'OR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NU' +
          'LO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SP' +
          'ECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'<RULEID>64</R' +
          'ULEID>'#13#10'</TObjRule>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjConst>'#13#10'<I' +
          'D>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>' +
          #13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
          'VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;--&#x20;RETORNO&#x2' +
          '0;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DI' +
          'AGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUI' +
          'D></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjVaria' +
          'ble>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>Retorno</TEXT>'#13#10'<' +
          'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
          'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'</TObjVariable>'#13#10 +
          '<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
          'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
          'PATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>&#x20;--&#' +
          'x20;TTL_COD&#x20;=&#x20;</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<' +
          'DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FI' +
          'ELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjCon' +
          'st>'#13#10'<TObjVariable>'#13#10'<ID>4</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>TT' +
          'L_COD</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATI' +
          'VEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<' +
          '/TObjVariable>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>log_mov_licenca</VALO' +
          'R>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NUL' +
          'O>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPE' +
          'CIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>1.2.0.97</MKR_VERSION>'#13#10'<VALOR>debug</VALOR>'#13#10'<DMLTY' +
          'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
          'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
          '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
          'PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Fluxo&#x20;-&#x2' +
          '0;</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Movimentar' +
          'licenca</CONSTANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20' +
          ';LIC_COD&#x20;=&#x20;</CONSTANT>'#13#10'<FUNCTION NAME="Campo" REALNAM' +
          'E="ebfSQLField">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="tabela&#x20;licenca"' +
          '/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >LIC_COD</CONSTANT>'#13#10'<' +
          '/PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&#' +
          'x20;--&#x20;PES_COD_RESPONSAVEL&#x20;=&#x20;</CONSTANT>'#13#10'<VARIAB' +
          'LE NAME="PES_COD_RESPONSAVEL"/>'#13#10'<CONSTANT TYPE="Letras" NULL="F' +
          'ALSE"  >&#x20;--&#x20;LIC_SITUA&#199;&#195;O&#x20;=&#x20;</CONST' +
          'ANT>'#13#10'<FUNCTION NAME="Campo" REALNAME="ebfSQLField">'#13#10'<PARAMS>'#13#10 +
          '<VARIABLE NAME="tabela&#x20;licenca"/>'#13#10'<CONSTANT TYPE="Letras" ' +
          'NULL="FALSE"  >LIC_SITUACAO</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10 +
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;--&#x20;FONTE&#x20;' +
          '=&#x20;R&#x20;--&#x20;FUN&#199;&#195;O&#x20;DATA&#x20;HORA</CONS' +
          'TANT>'#13#10'<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConc' +
          'at">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >Auto&#x20' +
          ';Renova&#231;&#227;o&#x20;da&#x20;Licen&#231;a&#x20;-&#x20;</CON' +
          'STANT>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >&#x20;-&#x20;</CO' +
          'NSTANT>'#13#10'<CALLRULE ID="64" NAME="FUNCAO&#x20;-&#x20;Data&#x20;ho' +
          'ra&#x20;do&#x20;Banco&#x20;de&#x20;Dados" PARAMSCOUNT="1"> '#13#10'<PA' +
          'RAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >datahoratexto</CON' +
          'STANT>'#13#10'</PARAMS>'#13#10'</CALLRULE>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<CONSTAN' +
          'T TYPE="Letras" NULL="FALSE"  >&#x20;--&#x20;RETORNO&#x20;=&#x20' +
          ';</CONSTANT>'#13#10'<VARIABLE NAME="Retorno"/>'#13#10'<CONSTANT TYPE="Letras' +
          '" NULL="FALSE"  >&#x20;--&#x20;TTL_COD&#x20;=&#x20;</CONSTANT>'#13#10 +
          '<VARIABLE NAME="TTL_COD"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >log_mov_licenca</CONSTANT' +
          '>'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >debug</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pConteudo'
        ParamType = ptInput
        Value = 
          'Concatena'#231#227'o(Fluxo - ,Movimentarlicenca, LIC_COD = ,Campo(@tabel' +
          'a licenca,LIC_COD), -- PES_COD_RESPONSAVEL = ,@PES_COD_RESPONSAV' +
          'EL, -- LIC_SITUA'#199#195'O = ,Campo(@tabela licenca,LIC_SITUACAO), -- F' +
          'ONTE = R -- FUN'#199#195'O DATA HORA,Concatena'#231#227'o(Auto Renova'#231#227'o da Lice' +
          'n'#231'a - , - ,FUNCAO - Data hora do Banco de Dados(datahoratexto)),' +
          ' -- RETORNO = ,@Retorno, -- TTL_COD = ,@TTL_COD)'
      end
      item
        DataType = ftString
        Name = 'pNomePasta'
        ParamType = ptInput
        Value = 'log_mov_licenca'
      end
      item
        DataType = ftString
        Name = 'pNomeArquivo'
        ParamType = ptInput
        Value = 'debug'
      end>
    ObjectName = 'Geral - Arquivo Debug'
    RealName = 'CALLRULE'
  end
  object FlowLine26: TFlowLine
    Left = 1025
    Top = 468
    Width = 40
    Height = 415
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
    OutputNames = 'FlowSubRoutine18'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine40: TFlowLine
    Left = 1025
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
    InputNames = 'FlowSubRoutine18'
    OutputNames = 'FlowSubRoutine1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
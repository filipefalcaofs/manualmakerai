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
      'LNH_ID,Inteiro,,;LNH_CODIGO,Letras,50,;pStatus,Variante,,;TipoFr' +
      'ota,Letras,50,;pTipoLinha,Inteiro,,;pCheckBox,Letras,1,'
    Variables = 'retorno,Variante,,'
    WorkFormCod = -1
    WorkFormGUID = '{70291062-0AA0-48AD-AB9F-FD3FE310D821}'
  end
  object FlowSubRoutine1: TFlowSubRoutine
    Left = 20
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
    ChangeDescription = False
    InputNames = 'FlowLine6'
    OutputNames = 'FlowLine2'
    Description = 'Geral - Visualizar ou editar formul'#225'rio'
    Id = 46
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
    ObjectName = 'Geral - Visualizar ou editar formul'#225'rio'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine2: TFlowSubRoutine
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
    InputNames = 'FlowLine2'
    OutputNames = 'FlowLine4'
    Description = 'CLT - Ao Entrar - Verificar Dias Ativos e Inativos'
    Id = 1281
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pLNH_ID'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>LNH_ID</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
          #13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>' +
          #13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pLNH_ID'
        ParamType = ptInput
        Value = '<VARIABLE NAME="LNH_ID"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pLNH_ID'
        ParamType = ptInput
        Value = '@LNH_ID'
      end>
    ObjectName = 'CLT - Ao Entrar - Verificar Dias Ativos e Inativos'
    RealName = 'CALLRULE'
  end
  object FlowLine2: TFlowLine
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
    InputNames = 'FlowSubRoutine1'
    OutputNames = 'FlowSubRoutine2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression1: TFlowExpression
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
    InputNames = 'FlowLine5'
    OutputNames = 'FlowLine3'
    Description = 'obteem campo status'
    Text = 'Obter Campo(LNH_STATUS)'
    Expression = 
      '<FUNCTION NAME="Obter&#x20;Campo" REALNAME="ebfSQLGetFormField">' +
      #13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Campo" NULL="FALSE" INDEX = "16" GUI' +
      'D = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">LNH_STATUS</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>1</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>ebfSQLGetFormField</TEXT>'#13#10#9#9'<SQL' +
      '>FALSE</SQL>'#13#10#9#9'<TIPO>Variante</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10 +
      #9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<' +
      'TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Campo</TIPO>'#13#10#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</M' +
      'KR_VERSION>'#13#10#9#9#9#9'<VALOR>LNH_STATUS</VALOR>'#13#10#9#9#9#9'<DMLTYPE>dtSelec' +
      't</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9#9#9'<NULO>FALSE</NUL' +
      'O>'#13#10#9#9#9#9'<FIELDINDEX>16</FIELDINDEX>'#13#10#9#9#9#9'<GUID>{70291062-0AA0-48' +
      'AD-AB9F-FD3FE310D821}</GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9 +
      #9#9'</TObjConst>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowSubRoutine6: TFlowSubRoutine
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
    InputNames = 'FlowLine8'
    OutputNames = 'FlowLine10'
    Description = 'Geral - Habilitar componentes'
    Id = 747
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>TMAKERBUTTON2,TMAKERL' +
          'OOKUP1,TMAKEREDIT2,txtNomeLinhaFilha,edtDataAtivacao,TMAKEREDIT,' +
          'edtInicioTesteVersao,edtFimTesteVersao,edtDtAtivacaoVersao,TMAKE' +
          'REDIT14,edtOficioCriacao,edtOficioDesativacao,MakerLookup2,Maker' +
          'Edit1,MakerLookup1,EDTGRL_ID,EDTCJ_ID,EDTAJ_ID,TMAKERCHECKBOX,ed' +
          'tResp,TMAKERLOOKUP,edtInicioProgramacao,edtFimProgramacao,txtV,L' +
          'ckInicioTerminal,LckFinalTerminal,TMAKERLOOKUP10,EDTCLA_ID,TMAKE' +
          'RLOOKUP2,TMAKERLOOKUP3,TMAKERLOOKUP7,TMAKERCOMBOBOX3,TMAKEREDIT5' +
          ',TMAKERLOOKUP9,EDTFRO_ID,TMAKERLOOKUP8,TMAKEREDIT18,TMAKERLOOKUP' +
          '4,TMAKERGRID5,TMAKERGRID7,TMAKERCOMBOBOX,TMAKEREDIT3,TMAKEREDIT1' +
          '1,TMAKEREDIT12,TMAKEREDIT10,TMAKEREDIT23,MOTIVO_SITUACAO_ABA3,DT' +
          '_SITUACAO_ABA3,TMAKERGRID4,TMAKERGRID7,TMAKERBUTTON</VALOR>'#13#10'<DM' +
          'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
          '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
          'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<VALOR>true</VALOR>'#13#10#9#9'<DMLTYPE>d' +
          'tSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</N' +
          'ULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIAL' +
          'CODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >TMAKERBUTTON2,TMAKERLOOKU' +
          'P1,TMAKEREDIT2,txtNomeLinhaFilha,edtDataAtivacao,TMAKEREDIT,edtI' +
          'nicioTesteVersao,edtFimTesteVersao,edtDtAtivacaoVersao,TMAKEREDI' +
          'T14,edtOficioCriacao,edtOficioDesativacao,MakerLookup2,MakerEdit' +
          '1,MakerLookup1,EDTGRL_ID,EDTCJ_ID,EDTAJ_ID,TMAKERCHECKBOX,edtRes' +
          'p,TMAKERLOOKUP,edtInicioProgramacao,edtFimProgramacao,txtV,LckIn' +
          'icioTerminal,LckFinalTerminal,TMAKERLOOKUP10,EDTCLA_ID,TMAKERLOO' +
          'KUP2,TMAKERLOOKUP3,TMAKERLOOKUP7,TMAKERCOMBOBOX3,TMAKEREDIT5,TMA' +
          'KERLOOKUP9,EDTFRO_ID,TMAKERLOOKUP8,TMAKEREDIT18,TMAKERLOOKUP4,TM' +
          'AKERGRID5,TMAKERGRID7,TMAKERCOMBOBOX,TMAKEREDIT3,TMAKEREDIT11,TM' +
          'AKEREDIT12,TMAKEREDIT10,TMAKEREDIT23,MOTIVO_SITUACAO_ABA3,DT_SIT' +
          'UACAO_ABA3,TMAKERGRID4,TMAKERGRID7,TMAKERBUTTON</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          'TMAKERBUTTON2,TMAKERLOOKUP1,TMAKEREDIT2,txtNomeLinhaFilha,edtDat' +
          'aAtivacao,TMAKEREDIT,edtInicioTesteVersao,edtFimTesteVersao,edtD' +
          'tAtivacaoVersao,TMAKEREDIT14,edtOficioCriacao,edtOficioDesativac' +
          'ao,MakerLookup2,MakerEdit1,MakerLookup1,EDTGRL_ID,EDTCJ_ID,EDTAJ' +
          '_ID,TMAKERCHECKBOX,edtResp,TMAKERLOOKUP,edtInicioProgramacao,edt' +
          'FimProgramacao,txtV,LckInicioTerminal,LckFinalTerminal,TMAKERLOO' +
          'KUP10,EDTCLA_ID,TMAKERLOOKUP2,TMAKERLOOKUP3,TMAKERLOOKUP7,TMAKER' +
          'COMBOBOX3,TMAKEREDIT5,TMAKERLOOKUP9,EDTFRO_ID,TMAKERLOOKUP8,TMAK' +
          'EREDIT18,TMAKERLOOKUP4,TMAKERGRID5,TMAKERGRID7,TMAKERCOMBOBOX,TM' +
          'AKEREDIT3,TMAKEREDIT11,TMAKEREDIT12,TMAKEREDIT10,TMAKEREDIT23,MO' +
          'TIVO_SITUACAO_ABA3,DT_SITUACAO_ABA3,TMAKERGRID4,TMAKERGRID7,TMAK' +
          'ERBUTTON'
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = 'true'
      end>
    ObjectName = 'Geral - Habilitar/Deabiltar componente'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine5: TFlowSubRoutine
    Left = 400
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
    InputNames = 'FlowLine7'
    OutputNames = 'FlowLine9'
    Description = 'Desabilitar componentes'
    Id = 747
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<VALOR>TMAKERLOOKUP1,TMAKERE' +
          'DIT2,txtNomeLinhaFilha,TMAKERCOMBOBOX1,edtDataAtivacao,TMAKEREDI' +
          'T,edtInicioTesteVersao,edtFimTesteVersao,edtDtAtivacaoVersao,TMA' +
          'KEREDIT14,edtOficioCriacao,edtOficioDesativacao,MakerLookup2,Mak' +
          'erEdit1,MakerLookup1,EDTGRL_ID,EDTCJ_ID,EDTAJ_ID,TMAKERCHECKBOX,' +
          'edtResp,TMAKERLOOKUP,edtInicioProgramacao,edtFimProgramacao,txtV' +
          ',LckInicioTerminal,LckFinalTerminal,TMAKERLOOKUP10,EDTCLA_ID,TMA' +
          'KERLOOKUP2,TMAKERLOOKUP3,TMAKERLOOKUP7,TMAKERCOMBOBOX3,TMAKEREDI' +
          'T5,TMAKERLOOKUP9,EDTFRO_ID,TMAKERLOOKUP8,TMAKEREDIT18,TMAKERLOOK' +
          'UP4,TMAKERGRID5,TMAKEREDIT3,TMAKEREDIT11,TMAKEREDIT12,TMAKEREDIT' +
          '10,TMAKEREDIT23,MOTIVO_SITUACAO_ABA3,DT_SITUACAO_ABA3,TMAKERGRID' +
          '4,TMAKERBUTTON,btnAtualizarPontosLinha,TMAKERBUTTON2</VALOR>'#13#10'<D' +
          'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
          'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjConst>'#13#10#9#9'<ID>0</ID>'#13#10#9#9'<NO' +
          'ME>CONSTANT</NOME>'#13#10#9#9'<TEXT></TEXT>'#13#10#9#9'<SQL>FALSE</SQL>'#13#10#9#9'<TIPO' +
          '>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9'<MKR_VER' +
          'SION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<VALOR>false</VALOR>'#13#10#9#9'<DMLTYPE>' +
          'dtSelect</DMLTYPE>'#13#10#9#9'<DIAGRAMXML></DIAGRAMXML>'#13#10#9#9'<NULO>FALSE</' +
          'NULO>'#13#10#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9'<GUID></GUID>'#13#10#9#9'<SPECIA' +
          'LCODE></SPECIALCODE>'#13#10#9'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          '<CONSTANT TYPE="Letras" NULL="FALSE"  >TMAKERLOOKUP1,TMAKEREDIT2' +
          ',txtNomeLinhaFilha,TMAKERCOMBOBOX1,edtDataAtivacao,TMAKEREDIT,ed' +
          'tInicioTesteVersao,edtFimTesteVersao,edtDtAtivacaoVersao,TMAKERE' +
          'DIT14,edtOficioCriacao,edtOficioDesativacao,MakerLookup2,MakerEd' +
          'it1,MakerLookup1,EDTGRL_ID,EDTCJ_ID,EDTAJ_ID,TMAKERCHECKBOX,edtR' +
          'esp,TMAKERLOOKUP,edtInicioProgramacao,edtFimProgramacao,txtV,Lck' +
          'InicioTerminal,LckFinalTerminal,TMAKERLOOKUP10,EDTCLA_ID,TMAKERL' +
          'OOKUP2,TMAKERLOOKUP3,TMAKERLOOKUP7,TMAKERCOMBOBOX3,TMAKEREDIT5,T' +
          'MAKERLOOKUP9,EDTFRO_ID,TMAKERLOOKUP8,TMAKEREDIT18,TMAKERLOOKUP4,' +
          'TMAKERGRID5,TMAKEREDIT3,TMAKEREDIT11,TMAKEREDIT12,TMAKEREDIT10,T' +
          'MAKEREDIT23,MOTIVO_SITUACAO_ABA3,DT_SITUACAO_ABA3,TMAKERGRID4,TM' +
          'AKERBUTTON,btnAtualizarPontosLinha,TMAKERBUTTON2</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          'TMAKERLOOKUP1,TMAKEREDIT2,txtNomeLinhaFilha,TMAKERCOMBOBOX1,edtD' +
          'ataAtivacao,TMAKEREDIT,edtInicioTesteVersao,edtFimTesteVersao,ed' +
          'tDtAtivacaoVersao,TMAKEREDIT14,edtOficioCriacao,edtOficioDesativ' +
          'acao,MakerLookup2,MakerEdit1,MakerLookup1,EDTGRL_ID,EDTCJ_ID,EDT' +
          'AJ_ID,TMAKERCHECKBOX,edtResp,TMAKERLOOKUP,edtInicioProgramacao,e' +
          'dtFimProgramacao,txtV,LckInicioTerminal,LckFinalTerminal,TMAKERL' +
          'OOKUP10,EDTCLA_ID,TMAKERLOOKUP2,TMAKERLOOKUP3,TMAKERLOOKUP7,TMAK' +
          'ERCOMBOBOX3,TMAKEREDIT5,TMAKERLOOKUP9,EDTFRO_ID,TMAKERLOOKUP8,TM' +
          'AKEREDIT18,TMAKERLOOKUP4,TMAKERGRID5,TMAKEREDIT3,TMAKEREDIT11,TM' +
          'AKEREDIT12,TMAKEREDIT10,TMAKEREDIT23,MOTIVO_SITUACAO_ABA3,DT_SIT' +
          'UACAO_ABA3,TMAKERGRID4,TMAKERBUTTON,btnAtualizarPontosLinha,TMAK' +
          'ERBUTTON2'
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = 'false'
      end>
    ObjectName = 'Geral - Habilitar/Deabiltar componente'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine4: TFlowSubRoutine
    Left = 20
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
    OutputNames = 'FlowLine5'
    Description = 'CDL - Mensagem de Alerta'
    Id = 1286
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pLNH_CODIGO'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
          'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>toString</TEXT>'#13#10'<' +
          'SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
          'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVa' +
          'riable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>LNH_CODIGO</TE' +
          'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
          '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10'</TObjVaria' +
          'ble>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pLNH_CODIGO'
        ParamType = ptInput
        Value = 
          '<FUNCTION NAME="Para&#x20;Letras" REALNAME="toString">'#13#10'<PARAMS>' +
          #13#10'<VARIABLE NAME="LNH_CODIGO"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pLNH_CODIGO'
        ParamType = ptInput
        Value = 'Para Letras(@LNH_CODIGO)'
      end>
    ObjectName = 'CDL - Mensagem de Alerta'
    RealName = 'CALLRULE'
  end
  object FlowDecision1: TFlowDecision
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
    InputNames = 'FlowLine13'
    OutputNames = 'FlowLine7;FlowLine8'
    Description = 'Status = E ?'
    DiagramXml = 
      '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjFunction>'#13#10#9#9'<ID>2</ID>'#13#10#9#9 +
      '<NOME>FUNCTION</NOME>'#13#10#9#9'<TEXT>isEqual</TEXT>'#13#10#9#9'<SQL>FALSE</SQL' +
      '>'#13#10#9#9'<TIPO>L'#243'gico</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9'<PARAMS>'#13#10#9#9#9'<TObjVaria' +
      'ble>'#13#10#9#9#9#9'<ID>2</ID>'#13#10#9#9#9#9'<NOME>VARIABLE</NOME>'#13#10#9#9#9#9'<TEXT>pStat' +
      'us</TEXT>'#13#10#9#9#9#9'<SQL>FALSE</SQL>'#13#10#9#9#9#9'<TIPO>Variante</TIPO>'#13#10#9#9#9#9 +
      '<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</M' +
      'KR_VERSION>'#13#10#9#9#9'</TObjVariable>'#13#10#9#9#9'<TObjConst>'#13#10#9#9#9#9'<ID>2</ID>'#13 +
      #10#9#9#9#9'<NOME>CONSTANT</NOME>'#13#10#9#9#9#9'<TEXT></TEXT>'#13#10#9#9#9#9'<SQL>FALSE</S' +
      'QL>'#13#10#9#9#9#9'<TIPO>Letras</TIPO>'#13#10#9#9#9#9'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10#9#9#9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9#9#9#9'<VALOR>E</VAL' +
      'OR>'#13#10#9#9#9#9'<DMLTYPE>dtSelect</DMLTYPE>'#13#10#9#9#9#9'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10#9#9#9#9'<NULO>FALSE</NULO>'#13#10#9#9#9#9'<FIELDINDEX>-1</FIELDINDEX>'#13#10#9#9 +
      #9#9'<GUID></GUID>'#13#10#9#9#9#9'<SPECIALCODE></SPECIALCODE>'#13#10#9#9#9'</TObjConst' +
      '>'#13#10#9#9'</PARAMS>'#13#10#9'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Igual" REALNAME="isEqual">'#13#10'<PARAMS>'#13#10'<VARIABLE ' +
      'NAME="pStatus"/>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  >E</CONS' +
      'TANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    Loop = False
  end
  object FlowLine5: TFlowLine
    Left = 150
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
    InputNames = 'FlowSubRoutine4'
    OutputNames = 'FlowExpression1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine7: TFlowLine
    Left = 455
    Top = 468
    Width = 64
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
    OutputNames = 'FlowSubRoutine5'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine8: TFlowLine
    Left = 455
    Top = 543
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
    OutputNames = 'FlowSubRoutine6'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowSubRoutine10: TFlowSubRoutine
    Left = 20
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
    InputNames = 'FlowLine4'
    OutputNames = 'FlowLine12'
    Description = 'Cadastro de Linha - Atualizar Parametros'
    Id = 1452
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'LNH_CODIGO'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>LNH_CODIGO</TEXT>'#13 +
          #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
          'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>' +
          #13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'LNH_CODIGO'
        ParamType = ptInput
        Value = '<VARIABLE NAME="LNH_CODIGO"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'LNH_CODIGO'
        ParamType = ptInput
        Value = '@LNH_CODIGO'
      end>
    ObjectName = 'Cadastro de Linha - Atualizar Parametros'
    RealName = 'CALLRULE'
  end
  object FlowLine4: TFlowLine
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
    InputNames = 'FlowSubRoutine2'
    OutputNames = 'FlowSubRoutine10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine7: TFlowSubRoutine
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
    ChangeDescription = False
    InputNames = 'FlowLine26'
    OutputNames = 'FlowLine13'
    Description = 'Cadastro de linha Mostrar componente - frota'
    Id = 358
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pTipoFrota'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>TipoFrota</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13 +
          #10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pTipoFrota'
        ParamType = ptInput
        Value = '<VARIABLE NAME="TipoFrota"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pTipoFrota'
        ParamType = ptInput
        Value = '@TipoFrota'
      end>
    ObjectName = 'Cadastro de linha Mostrar componente - frota'
    RealName = 'CALLRULE'
  end
  object FlowLine13: TFlowLine
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
    InputNames = 'FlowSubRoutine7'
    OutputNames = 'FlowDecision1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine3: TFlowSubRoutine
    Left = 210
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
    ChangeDescription = False
    InputNames = 'FlowLine3'
    OutputNames = 'FlowLine6'
    Description = 'CDL - Mapa - Ao Carregar'
    Id = 401
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'LNH_ID'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0"?>'#13#10'<ROOT>'#13#10#9'<TObjVariable>'#13#10#9#9'<ID>0</ID>'#13#10#9#9 +
          '<NOME>VARIABLE</NOME>'#13#10#9#9'<TEXT>LNH_ID</TEXT>'#13#10#9#9'<SQL>FALSE</SQL>' +
          #13#10#9#9'<TIPO>Inteiro</TIPO>'#13#10#9#9'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
          #9#9'<MKR_VERSION>5.0.0.29</MKR_VERSION>'#13#10#9'</TObjVariable>'#13#10'</ROOT>' +
          #13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'LNH_ID'
        ParamType = ptInput
        Value = '<VARIABLE NAME="LNH_ID"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'LNH_ID'
        ParamType = ptInput
        Value = '@LNH_ID'
      end>
    ObjectName = 'CDL - Mapa - Ao Carregar'
    RealName = 'CALLRULE'
  end
  object FlowLine3: TFlowLine
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
    InputNames = 'FlowExpression1'
    OutputNames = 'FlowSubRoutine3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine6: TFlowLine
    Left = 75
    Top = 393
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
    InputNames = 'FlowSubRoutine3'
    OutputNames = 'FlowSubRoutine1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowEnd1: TFlowEnd
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
    InputNames = 'FlowLine23'
    Description = 'Fim'
  end
  object FlowExpression3: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine1'
    OutputNames = 'FlowLine11'
    Description = 'Tornar componente acess'#237'vel(Mapa)'
    Text = 'Tornar Componente Acess'#237'vel( (MapaPontoLinha))'
    Expression = 
      '<FUNCTION NAME="Tornar&#x20;Componente&#x20;Acess&#237;vel" REAL' +
      'NAME="ComponenteEditavel">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">' +
      'MapaPontoLinha</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ComponenteEditavel' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(Ma' +
      'paPontoLinha)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCOD' +
      'E>MapaPontoLinha</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowDecision2: TFlowDecision
    Left = 590
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
    InputNames = 'FlowLine9;FlowLine10'
    OutputNames = 'FlowLine16;FlowLine17'
    Description = 'E diferento do tipo Evento(4) / nulo ou vazio?'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>oprOr</TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Function>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>isDiferent</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjVariable>'#13#10'<ID>2</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>p' +
      'TipoLinha</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCOM' +
      'PATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION' +
      '>'#13#10'</TObjVariable>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOM' +
      'E>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Inteiro</TIPO>'#13#10'<INCO' +
      'MPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSIO' +
      'N>'#13#10'<VALOR>4</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAM' +
      'S>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION<' +
      '/NOME>'#13#10'<TEXT>isNullOrEmpty</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#2' +
      '43;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION' +
      '>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjVariable>'#13#10'<ID>3</ID>'#13#10'<' +
      'NOME>VARIABLE</NOME>'#13#10'<TEXT>pTipoLinha</TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>Inteiro</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13#10'</PARAMS>'#13#10'</TO' +
      'bjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
    Expression = 
      '<FUNCTION NAME="Ou" REALNAME="oprOr">'#13#10'<PARAMS>'#13#10'<FUNCTION NAME=' +
      '"Diferente" REALNAME="isDiferent">'#13#10'<PARAMS>'#13#10'<VARIABLE NAME="pT' +
      'ipoLinha"/>'#13#10'<CONSTANT TYPE="Inteiro" NULL="FALSE"  >4</CONSTANT' +
      '>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="&#201;&#x20;Nulo&#x20' +
      ';ou&#x20;Vazio" REALNAME="isNullOrEmpty">'#13#10'<PARAMS>'#13#10'<VARIABLE N' +
      'AME="pTipoLinha"/>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTIO' +
      'N>'
    Loop = False
  end
  object FlowLine9: TFlowLine
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
    InputNames = 'FlowSubRoutine5'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine10: TFlowLine
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
    InputNames = 'FlowSubRoutine6'
    OutputNames = 'FlowDecision2'
    Region = 0
    Style = psSolid
    Decision = False
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine16'
    OutputNames = 'FlowLine19'
    Description = 'Mostrar os cabe'#231'alhos <> Evento'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente( (containerABA3),true),Mostrar C' +
      'omponente( (containerABA4),true),Mostrar Componente( (containerA' +
      'BA8),true),Mostrar Componente( (containerABA5),true),Mostrar Com' +
      'ponente( (containerABA6),true),Mostrar Componente( (containerABA' +
      '7),true),Mostrar Componente( (containerABA9),true),Mostrar Compo' +
      'nente( (TMAKERCONTAINER),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">containerAB' +
      'A3</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true<' +
      '/CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20' +
      ';Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT ' +
      'TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F' +
      '-FD3FE310D821}">containerABA4</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243' +
      ';gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<' +
      'FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisi' +
      'ble">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID ' +
      '= "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">containerABA8</CONSTA' +
      'NT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Component' +
      'e" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Comp' +
      'onente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D' +
      '821}">containerABA5</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NUL' +
      'L="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION N' +
      'AME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PA' +
      'RAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{702910' +
      '62-0AA0-48AD-AB9F-FD3FE310D821}">containerABA6</CONSTANT>'#13#10'<CONS' +
      'TANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS' +
      '>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAM' +
      'E="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NU' +
      'LL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">cont' +
      'ainerABA7</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE" ' +
      ' >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostr' +
      'ar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CO' +
      'NSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48' +
      'AD-AB9F-FD3FE310D821}">containerABA9</CONSTANT>'#13#10'<CONSTANT TYPE=' +
      '"L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCT' +
      'ION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfForm' +
      'SetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"' +
      '  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">TMAKERCONTAINE' +
      'R</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</' +
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
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(containerABA3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIAL' +
      'CODE>containerABA3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisib' +
      'le</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(' +
      'containerABA4)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCO' +
      'DE>containerABA4</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunct' +
      'ion>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(co' +
      'ntainerABA8)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE' +
      '>containerABA8</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(cont' +
      'ainerABA5)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>c' +
      'ontainerABA5</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(contai' +
      'nerABA6)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIA' +
      'GRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID' +
      '>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>con' +
      'tainerABA6</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13 +
      #10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L' +
      '&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERS' +
      'ION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSele' +
      'ct</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FI' +
      'ELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALC' +
      'ODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10 +
      '<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCons' +
      't>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(containe' +
      'rABA7)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGR' +
      'AMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{' +
      '70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>conta' +
      'inerABA7</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#' +
      '243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<I' +
      'D>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>' +
      #13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(containerA' +
      'BA9)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70' +
      '291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>contain' +
      'erABA9</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NO' +
      'ME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#24' +
      '3;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>' +
      '5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10 +
      '<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(TMAKERCONTAI' +
      'NER)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70' +
      '291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>TMAKERC' +
      'ONTAINER</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<' +
      'NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#' +
      '243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSIO' +
      'N>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLTYPE>dtSelect' +
      '</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIEL' +
      'DINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCOD' +
      'E>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjF' +
      'unction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine16: TFlowLine
    Left = 645
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression5'
    Description = 'SIM'
    Region = 0
    Style = psSolid
    Decision = True
  end
  object FlowExpression6: TFlowExpression
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
    InputNames = 'FlowLine17'
    OutputNames = 'FlowLine18'
    Description = 'Ocultar os cabe'#231'alhos <> Evento'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente( (containerABA3),false),Mostrar ' +
      'Componente( (containerABA4),false),Mostrar Componente( (containe' +
      'rABA8),false),Mostrar Componente( (containerABA5),false),Mostrar' +
      ' Componente( (containerABA6),false),Mostrar Componente( (contain' +
      'erABA7),false),Mostrar Componente( (containerABA9),false),Mostra' +
      'r Componente( (TMAKERCONTAINER),false))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">containerAB' +
      'A3</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x2' +
      '0;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT' +
      ' TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9' +
      'F-FD3FE310D821}">containerABA4</CONSTANT>'#13#10'<CONSTANT TYPE="L&#24' +
      '3;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVi' +
      'sible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUI' +
      'D = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">containerABA8</CONS' +
      'TANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Compon' +
      'ente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="C' +
      'omponente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE3' +
      '10D821}">containerABA5</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" ' +
      'NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTI' +
      'ON NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70' +
      '291062-0AA0-48AD-AB9F-FD3FE310D821}">containerABA6</CONSTANT>'#13#10'<' +
      'CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" RE' +
      'ALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Component' +
      'e" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}"' +
      '>containerABA7</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FA' +
      'LSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME=' +
      '"Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS' +
      '>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0' +
      'AA0-48AD-AB9F-FD3FE310D821}">containerABA9</CONSTANT>'#13#10'<CONSTANT' +
      ' TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10 +
      '</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="' +
      'ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL=' +
      '"FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">TMAKERC' +
      'ONTAINER</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  ' +
      '>false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'
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
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(containerABA3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIAL' +
      'CODE>containerABA3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFu' +
      'nction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisi' +
      'ble</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10 +
      '<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</I' +
      'NCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;' +
      '(containerABA4)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXM' +
      'L></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>' +
      #13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALC' +
      'ODE>containerABA4</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10 +
      '<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<M' +
      'KR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYP' +
      'E>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NU' +
      'LO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></' +
      'SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFun' +
      'ction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisib' +
      'le</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<' +
      'TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(' +
      'containerABA8)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML' +
      '></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13 +
      #10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCO' +
      'DE>containerABA8</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2' +
      '</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<' +
      'TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MK' +
      'R_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE' +
      '>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NUL' +
      'O>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></S' +
      'PECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunc' +
      'tion>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisibl' +
      'e</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<T' +
      'ObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQ' +
      'L>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(c' +
      'ontainerABA5)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML>' +
      '</DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10 +
      '<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCOD' +
      'E>containerABA5</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2<' +
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
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(co' +
      'ntainerABA6)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML><' +
      '/DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<' +
      'GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE' +
      '>containerABA6</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(con' +
      'tainerABA7)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>' +
      'containerABA7</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObj' +
      'Const>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>F' +
      'ALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMP' +
      'ATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(cont' +
      'ainerABA9)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>c' +
      'ontainerABA9</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID' +
      '>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO' +
      '>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VE' +
      'RSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtS' +
      'elect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10 +
      '<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECI' +
      'ALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction' +
      '>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjC' +
      'onst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FA' +
      'LSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPA' +
      'TIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(TMAKE' +
      'RCONTAINER)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>' +
      'TMAKERCONTAINER</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2<' +
      '/ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<T' +
      'IPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR' +
      '_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>' +
      'dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO' +
      '>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SP' +
      'ECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13 +
      #10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine17: TFlowLine
    Left = 645
    Top = 393
    Width = 64
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
    InputNames = 'FlowDecision2'
    OutputNames = 'FlowExpression6'
    Description = 'N'#195'O'
    Region = 0
    Style = psSolid
    Decision = False
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine18'
    OutputNames = 'FlowLine20'
    Description = 'Mostrar os cabe'#231'alhos = Evento'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente( (container2ABA2),true),Mostrar ' +
      'Componente( (container3ABA3),true),Mostrar Componente( (containe' +
      'r4ABA4),true),Mostrar Componente( (container5ABA5),true),Mostrar' +
      ' Componente( (container6ABA6),true),Mostrar Componente( (contain' +
      'er7ABA7),true),Mostrar Componente( (container8ABA8),true),Mostra' +
      'r Componente( (TMAKERCONTAINER2),true))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">container2A' +
      'BA2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x2' +
      '0;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT' +
      ' TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9' +
      'F-FD3FE310D821}">container3ABA3</CONSTANT>'#13#10'<CONSTANT TYPE="L&#2' +
      '43;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13 +
      #10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVi' +
      'sible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUI' +
      'D = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">container4ABA4</CON' +
      'STANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTA' +
      'NT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Compon' +
      'ente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="C' +
      'omponente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE3' +
      '10D821}">container5ABA5</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico"' +
      ' NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTI' +
      'ON NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13 +
      #10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70' +
      '291062-0AA0-48AD-AB9F-FD3FE310D821}">container6ABA6</CONSTANT>'#13#10 +
      '<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</P' +
      'ARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" RE' +
      'ALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Component' +
      'e" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}"' +
      '>container7ABA7</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="F' +
      'ALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME=' +
      '"Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS' +
      '>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0' +
      'AA0-48AD-AB9F-FD3FE310D821}">container8ABA8</CONSTANT>'#13#10'<CONSTAN' +
      'T TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'#13#10'</PARAMS>'#13#10 +
      '</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="' +
      'ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL=' +
      '"FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">TMAKERC' +
      'ONTAINER2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE" ' +
      ' >true</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'
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
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container2ABA2)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container2ABA2</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container3ABA3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container3ABA3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container4ABA4)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container4ABA4</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container5ABA5)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container5ABA5</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container6ABA6)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container6ABA6</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container7ABA7)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container7ABA7</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container8ABA8)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container8ABA8</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<DMLT' +
      'YPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</' +
      'NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE>' +
      '</SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjF' +
      'unction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVis' +
      'ible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13 +
      #10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10 +
      '<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(TMAKERCONTAINER2)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPEC' +
      'IALCODE>TMAKERCONTAINER2</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</' +
      'PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
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
    InputNames = 'FlowExpression6'
    OutputNames = 'FlowExpression7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression8: TFlowExpression
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
    ShowHint = False
    ChangeDescription = True
    InputNames = 'FlowLine19'
    OutputNames = 'FlowLine21'
    Description = 'Ocultar os cabe'#231'alhos = Evento'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente( (container2ABA2),false),Mostrar' +
      ' Componente( (container3ABA3),false),Mostrar Componente( (contai' +
      'ner4ABA4),false),Mostrar Componente( (container5ABA5),false),Mos' +
      'trar Componente( (container6ABA6),false),Mostrar Componente( (co' +
      'ntainer7ABA7),false),Mostrar Componente( (container8ABA8),false)' +
      ',Mostrar Componente( (TMAKERCONTAINER2),false))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">container2A' +
      'BA2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fals' +
      'e</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x' +
      '20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTAN' +
      'T TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB' +
      '9F-FD3FE310D821}">container3ABA3</CONSTANT>'#13#10'<CONSTANT TYPE="L&#' +
      '243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION' +
      '>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSet' +
      'Visible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  G' +
      'UID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">container4ABA4</C' +
      'ONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CON' +
      'STANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Com' +
      'ponente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE' +
      '="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3' +
      'FE310D821}">container5ABA5</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gi' +
      'co" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FU' +
      'NCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisibl' +
      'e">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = ' +
      '"{70291062-0AA0-48AD-AB9F-FD3FE310D821}">container6ABA6</CONSTAN' +
      'T>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>' +
      #13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Component' +
      'e" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Comp' +
      'onente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D' +
      '821}">container7ABA7</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NU' +
      'LL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION' +
      ' NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<' +
      'PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID = "{7029' +
      '1062-0AA0-48AD-AB9F-FD3FE310D821}">container8ABA8</CONSTANT>'#13#10'<C' +
      'ONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REA' +
      'LNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente' +
      '" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">' +
      'TMAKERCONTAINER2</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="' +
      'FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PARAMS>'#13#10'</' +
      'FUNCTION>'
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
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20' +
      ';(container2ABA2)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAM' +
      'XML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDE' +
      'X>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIA' +
      'LCODE>container2ABA2</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<' +
      'ID>3</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DML' +
      'TYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE<' +
      '/NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE' +
      '></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObj' +
      'Function>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVi' +
      'sible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>' +
      #13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13 +
      #10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE<' +
      '/INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x2' +
      '0;(container3ABA3)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRA' +
      'MXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIND' +
      'EX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECI' +
      'ALCODE>container3ABA3</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10 +
      '<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DM' +
      'LTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE' +
      '</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCOD' +
      'E></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TOb' +
      'jFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetV' +
      'isible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x' +
      '20;(container4ABA4)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGR' +
      'AMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDIN' +
      'DEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPEC' +
      'IALCODE>container4ABA4</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13 +
      #10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</S' +
      'QL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<D' +
      'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
      'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
      'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TO' +
      'bjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSet' +
      'Visible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAM' +
      'S>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT' +
      '>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALS' +
      'E</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#' +
      'x20;(container5ABA5)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAG' +
      'RAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDI' +
      'NDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPE' +
      'CIALCODE>container5ABA5</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>' +
      #13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
      'SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<' +
      'DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FAL' +
      'SE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALC' +
      'ODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<T' +
      'ObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSe' +
      'tVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FAL' +
      'SE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&' +
      '#x20;(container6ABA6)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIA' +
      'GRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELD' +
      'INDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SP' +
      'ECIALCODE>container6ABA6</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst' +
      '>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE<' +
      '/SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIV' +
      'EL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10 +
      '<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FA' +
      'LSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIAL' +
      'CODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<' +
      'TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormS' +
      'etVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL' +
      '>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PAR' +
      'AMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>' +
      '&#x20;(container7ABA7)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DI' +
      'AGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIEL' +
      'DINDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<S' +
      'PECIALCODE>container7ABA7</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCons' +
      't>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE' +
      '</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATI' +
      'VEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13 +
      #10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>F' +
      'ALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIA' +
      'LCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10 +
      '<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfForm' +
      'SetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>F' +
      'ALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR' +
      '>&#x20;(container8ABA8)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<D' +
      'IAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIE' +
      'LDINDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<' +
      'SPECIALCODE>container8ABA8</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>' +
      #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
      'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
      'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13 +
      #10'<TObjFunction>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFor' +
      'mSetVisible</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIV' +
      'EL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<P' +
      'ARAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></' +
      'TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALO' +
      'R>&#x20;(TMAKERCONTAINER2)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13 +
      #10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</' +
      'FIELDINDEX>'#13#10'<GUID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>' +
      #13#10'<SPECIALCODE>TMAKERCONTAINER2</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TO' +
      'bjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL' +
      '>FALSE</SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INC' +
      'OMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</V' +
      'ALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<' +
      'NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<' +
      'SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunct' +
      'ion>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine19: TFlowLine
    Left = 835
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
    InputNames = 'FlowExpression5'
    OutputNames = 'FlowExpression8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine8: TFlowSubRoutine
    Left = 780
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
    ChangeDescription = False
    InputNames = 'FlowLine25;FlowLine24'
    OutputNames = 'FlowLine22'
    Description = 'Cadastro de linha - Verifica modo navega'#231#227'o'
    Id = 1836
    InputDiagramXML = <>
    InputExpression = <>
    InputText = <>
    ObjectName = 'Cadastro de linha - Verifica modo navega'#231#227'o'
    RealName = 'CALLRULE'
  end
  object FlowSubRoutine9: TFlowSubRoutine
    Left = 780
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
    InputNames = 'FlowLine22'
    OutputNames = 'FlowLine23'
    Description = 'CDL - exibir componente ao clicar'
    Id = 1233
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'pCheckBox'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjVariab' +
          'le>'#13#10'<ID>0</ID>'#13#10'<NOME>VARIABLE</NOME>'#13#10'<TEXT>pCheckBox</TEXT>'#13#10 +
          '<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCO' +
          'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'</TObjVariable>'#13 +
          #10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'pCheckBox'
        ParamType = ptInput
        Value = '<VARIABLE NAME="pCheckBox"/>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'pCheckBox'
        ParamType = ptInput
        Value = '@pCheckBox'
      end>
    ObjectName = 'CDL - exibir componente ao clicar'
    RealName = 'CALLRULE'
  end
  object FlowLine22: TFlowLine
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
    InputNames = 'FlowSubRoutine8'
    OutputNames = 'FlowSubRoutine9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine23: TFlowLine
    Left = 835
    Top = 92
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
    InputNames = 'FlowSubRoutine9'
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression10: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine20'
    OutputNames = 'FlowLine25'
    Description = 'Tirar a visibilidade do container de data ano'
    Text = 'Mostrar Componente( (ContainerData),false)'
    Expression = 
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">ContainerData</CONST' +
      'ANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTAN' +
      'T>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>&#x20;(Con' +
      'tainerData)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>' +
      'ContainerData</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine25: TFlowLine
    Left = 645
    Top = 243
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
    InputNames = 'FlowExpression10'
    OutputNames = 'FlowSubRoutine8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine20: TFlowLine
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
    InputNames = 'FlowExpression7'
    OutputNames = 'FlowExpression10'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression9: TFlowExpression
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
    ChangeDescription = True
    InputNames = 'FlowLine21'
    OutputNames = 'FlowLine24'
    Description = 'Ocultar componentes data hora'
    Text = 
      'Concatena'#231#227'o(Mostrar Componente(Data de Ativa'#231#227'o da Linha (edtDa' +
      'taAtivacao1),false),Mostrar Componente(Data da Desativa'#231#227'o da Li' +
      'nha (TMAKEREDIT7),false),Mostrar Componente(Data da Ativa'#231#227'o da ' +
      'Vers'#227'o (edtDtAtivacaoVersao1),false),Mostrar Componente(Data da ' +
      'Desativa'#231#227'o da vers'#227'o (TMAKEREDIT27),false),Mostrar Componente(F' +
      'im dos Testes de Vers'#227'o (edtFimTesteVersao1),false),Mostrar Comp' +
      'onente(In'#237'cio dos Testes de Vers'#227'o (edtInicioTesteVersao1),false' +
      '))'
    Expression = 
      '<FUNCTION NAME="Concatena&#231;&#227;o" REALNAME="ebfConcat">'#13#10'<' +
      'PARAMS>'#13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfF' +
      'ormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FAL' +
      'SE"  GUID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">edtDataAtiv' +
      'acao1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >fa' +
      'lse</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&' +
      '#x20;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONST' +
      'ANT TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-' +
      'AB9F-FD3FE310D821}">TMAKEREDIT7</CONSTANT>'#13#10'<CONSTANT TYPE="L&#2' +
      '43;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>' +
      #13#10'<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetV' +
      'isible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GU' +
      'ID = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">edtDtAtivacaoVersa' +
      'o1</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false' +
      '</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x2' +
      '0;Componente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT' +
      ' TYPE="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9' +
      'F-FD3FE310D821}">TMAKEREDIT27</CONSTANT>'#13#10'<CONSTANT TYPE="L&#243' +
      ';gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10 +
      '<FUNCTION NAME="Mostrar&#x20;Componente" REALNAME="ebfFormSetVis' +
      'ible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Componente" NULL="FALSE"  GUID' +
      ' = "{70291062-0AA0-48AD-AB9F-FD3FE310D821}">edtFimTesteVersao1</' +
      'CONSTANT>'#13#10'<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CO' +
      'NSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'<FUNCTION NAME="Mostrar&#x20;Co' +
      'mponente" REALNAME="ebfFormSetVisible">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Componente" NULL="FALSE"  GUID = "{70291062-0AA0-48AD-AB9F-FD' +
      '3FE310D821}">edtInicioTesteVersao1</CONSTANT>'#13#10'<CONSTANT TYPE="L' +
      '&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTI' +
      'ON>'#13#10'</PARAMS>'#13#10'</FUNCTION>'
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
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&' +
      '#x20;de&#x20;Ativa&#231;&#227;o&#x20;da&#x20;Linha&#x20;(edtData' +
      'Ativacao1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>e' +
      'dtDataAtivacao1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>3<' +
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
      'MPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20' +
      ';da&#x20;Desativa&#231;&#227;o&#x20;da&#x20;Linha&#x20;(TMAKERED' +
      'IT7)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAM' +
      'XML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70' +
      '291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>TMAKERE' +
      'DIT7</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME' +
      '>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243;' +
      'gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.' +
      '0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</D' +
      'MLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDIN' +
      'DEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13 +
      #10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>2' +
      '</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<S' +
      'QL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL' +
      '>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10'<' +
      'ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL' +
      '>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10 +
      '<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;da&#x20;At' +
      'iva&#231;&#227;o&#x20;da&#x20;Vers&#227;o&#x20;(edtDtAtivacaoVer' +
      'sao1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRA' +
      'MXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{7' +
      '0291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>edtDtA' +
      'tivacaoVersao1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</' +
      'ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TI' +
      'PO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_' +
      'VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>d' +
      'tSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>' +
      #13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPE' +
      'CIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible<' +
      '/TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TOb' +
      'jConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>' +
      'FALSE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Data&#x20;' +
      'da&#x20;Desativa&#231;&#227;o&#x20;da&#x20;vers&#227;o&#x20;(TMA' +
      'KEREDIT27)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></D' +
      'IAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GU' +
      'ID>{70291062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>T' +
      'MAKEREDIT27</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>' +
      #13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>' +
      'L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VER' +
      'SION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSe' +
      'lect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<' +
      'FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIA' +
      'LCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>' +
      #13#10'<ID>2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TE' +
      'XT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOM' +
      'PATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjCo' +
      'nst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FAL' +
      'SE</SQL>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPAT' +
      'IVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>Fim&#x20;dos&' +
      '#x20;Testes&#x20;de&#x20;Vers&#227;o&#x20;(edtFimTesteVersao1)</' +
      'VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10 +
      '<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{70291062' +
      '-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>edtFimTesteVe' +
      'rsao1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOM' +
      'E>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>L&#243' +
      ';gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5' +
      '.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dtSelect</' +
      'DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDI' +
      'NDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>' +
      #13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'<TObjFunction>'#13#10'<ID>' +
      '2</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfFormSetVisible</TEXT>'#13#10'<' +
      'SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
      'L>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS>'#13#10'<TObjConst>'#13#10 +
      '<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQ' +
      'L>'#13#10'<TIPO>Componente</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13 +
      #10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>In&#237;cio&#x20;do' +
      's&#x20;Testes&#x20;de&#x20;Vers&#227;o&#x20;(edtInicioTesteVersa' +
      'o1)</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>{702' +
      '91062-0AA0-48AD-AB9F-FD3FE310D821}</GUID>'#13#10'<SPECIALCODE>edtInici' +
      'oTesteVersao1</SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID>2</I' +
      'D>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIP' +
      'O>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<MKR_V' +
      'ERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTYPE>dt' +
      'Select</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13 +
      #10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPEC' +
      'IALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'<' +
      '/TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowLine21: TFlowLine
    Left = 1025
    Top = 243
    Width = 40
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
    InputNames = 'FlowExpression8'
    OutputNames = 'FlowExpression9'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine24: TFlowLine
    Left = 835
    Top = 243
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
    InputNames = 'FlowExpression9'
    OutputNames = 'FlowSubRoutine8'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowSubRoutine11: TFlowSubRoutine
    Left = 20
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
    ChangeDescription = True
    InputNames = 'FlowLine12'
    OutputNames = 'FlowLine26'
    Description = 'Geral - Habilitar/Deabiltar componente'
    Id = 747
    InputDiagramXML = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
          'MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'<VALOR>TMAKERBUTTON1</VALOR>' +
          #13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>' +
          'FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECI' +
          'ALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = 
          '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjConst>' +
          #13#10'<ID>0</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</' +
          'SQL>'#13#10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVE' +
          'L>'#13#10'<MKR_VERSION>5.0.0.32</MKR_VERSION>'#13#10'<VALOR>true</VALOR>'#13#10'<D' +
          'MLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALS' +
          'E</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCO' +
          'DE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</ROOT>'#13#10
      end>
    InputExpression = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="Letras" NULL="FALSE"  >TMAKERBUTTON1</CONSTANT>'
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = '<CONSTANT TYPE="L&#243;gico" NULL="FALSE"  >true</CONSTANT>'
      end>
    InputText = <
      item
        DataType = ftString
        Name = 'ListaComponente'
        ParamType = ptInput
        Value = 'TMAKERBUTTON1'
      end
      item
        DataType = ftString
        Name = 'Logico'
        ParamType = ptInput
        Value = 'true'
      end>
    ObjectName = 'Geral - Habilitar/Deabiltar componente'
    RealName = 'CALLRULE'
  end
  object FlowLine12: TFlowLine
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
    InputNames = 'FlowSubRoutine10'
    OutputNames = 'FlowSubRoutine11'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine26: TFlowLine
    Left = 75
    Top = 618
    Width = 420
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
    InputNames = 'FlowSubRoutine11'
    OutputNames = 'FlowSubRoutine7'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine1: TFlowLine
    Left = 75
    Top = 92
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
    OutputNames = 'FlowExpression3'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowExpression2: TFlowExpression
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
    ShowHint = True
    ChangeDescription = True
    Description = 'Crie json do checkboxStatus itiner'#225'rio'
    Text = 
      'Definir Vari'#225'vel de Formul'#225'rio(checkboxStatus,JSON - Criar Objet' +
      'o({'#10'  "Sentido 1 - IDA": true,'#10'  "Sentido 2 - VOLTA": false,'#10'  "' +
      'Operacional - IDA": false,'#10'  "Operacional - VOLTA": false,'#10'  "Op' +
      'eracional - OUTROS": false,'#10'  "Ociosa - IDA": false,'#10'  "Ociosa -' +
      ' VOLTA": false,'#10'  "Expressa - IDA": false,'#10'  "Expressa - VOLTA":' +
      ' false'#10'}))'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;Vari&#225;vel&#x20;de&#x20;Formul&#' +
      '225;rio" REALNAME="ebfSetClientFormVariable">'#13#10'<PARAMS>'#13#10'<CONSTA' +
      'NT TYPE="Letras" NULL="FALSE"  >checkboxStatus</CONSTANT>'#13#10'<FUNC' +
      'TION NAME="JSON&#x20;-&#x20;Criar&#x20;Objeto" REALNAME="ebfCrea' +
      'teObjectJSON">'#13#10'<PARAMS>'#13#10'<CONSTANT TYPE="Letras" NULL="FALSE"  ' +
      '>{'#13#10'&#x20;&#x20;&quot;Sentido&#x20;1&#x20;-&#x20;IDA&quot;:&#x20' +
      ';true,'#13#10'&#x20;&#x20;&quot;Sentido&#x20;2&#x20;-&#x20;VOLTA&quot;' +
      ':&#x20;false,'#13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;IDA&quo' +
      't;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;VOLTA' +
      '&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;O' +
      'UTROS&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Ociosa&#x20;-&#x20;I' +
      'DA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Ociosa&#x20;-&#x20;VOLT' +
      'A&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Expressa&#x20;-&#x20;IDA' +
      '&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Expressa&#x20;-&#x20;VOLT' +
      'A&quot;:&#x20;false'#13#10'}</CONSTANT>'#13#10'</PARAMS>'#13#10'</FUNCTION>'#13#10'</PAR' +
      'AMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetClientFormVa' +
      'riable</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO></TIPO>'#13#10'<INCOMPATIVEL>FA' +
      'LSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARAMS' +
      '>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>' +
      #13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</IN' +
      'COMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>checkbo' +
      'xStatus</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAG' +
      'RAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID>' +
      '</GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjFunctio' +
      'n>'#13#10'<ID>3</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfCreateObjectJSON' +
      '</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Variante</TIPO>'#13#10'<INCOMPATIVEL>' +
      'FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PARA' +
      'MS>'#13#10'<TObjConst>'#13#10'<ID>4</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEX' +
      'T>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</' +
      'INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>{'#13#10'&#' +
      'x20;&#x20;&quot;Sentido&#x20;1&#x20;-&#x20;IDA&quot;:&#x20;true,' +
      #13#10'&#x20;&#x20;&quot;Sentido&#x20;2&#x20;-&#x20;VOLTA&quot;:&#x20' +
      ';false,'#13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;IDA&quot;:&#x' +
      '20;false,'#13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;VOLTA&quot;' +
      ':&#x20;false,'#13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;OUTROS&' +
      'quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Ociosa&#x20;-&#x20;IDA&quo' +
      't;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Ociosa&#x20;-&#x20;VOLTA&quot' +
      ';:&#x20;false,'#13#10'&#x20;&#x20;&quot;Expressa&#x20;-&#x20;IDA&quot;' +
      ':&#x20;false,'#13#10'&#x20;&#x20;&quot;Expressa&#x20;-&#x20;VOLTA&quot' +
      ';:&#x20;false'#13#10'}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMX' +
      'ML></DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX' +
      '>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'</P' +
      'ARAMS>'#13#10'</TObjFunction>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>'#13#10
  end
  object FlowExpression4: TFlowExpression
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
    ParentShowHint = False
    ShowHint = True
    ChangeDescription = True
    InputNames = 'FlowLine11'
    OutputNames = 'FlowLine14'
    Description = 'Crie json do checkboxStatus itiner'#225'rio'
    Text = 
      'Definir Vari'#225'vel da Sess'#227'o(checkboxStatus,{'#13#10'  "Sentido 1 - IDA"' +
      ': true,'#13#10'  "Sentido 2 - VOLTA": false,'#13#10'  "Operacional - IDA": f' +
      'alse,'#13#10'  "Operacional - VOLTA": false,'#13#10'  "Operacional - OUTROS"' +
      ': false,'#13#10'  "Ociosa - IDA": false,'#13#10'  "Ociosa - VOLTA": false,'#13#10 +
      '  "Expressa - IDA": false,'#13#10'  "Expressa - VOLTA": false'#13#10'},false' +
      ')'
    Expression = 
      '<FUNCTION NAME="Definir&#x20;Vari&#225;vel&#x20;da&#x20;Sess&#22' +
      '7;o" REALNAME="ebfSetSessionAttribute">'#13#10'<PARAMS>'#13#10'<CONSTANT TYP' +
      'E="Letras" NULL="FALSE"  >checkboxStatus</CONSTANT>'#13#10'<CONSTANT T' +
      'YPE="Letras" NULL="FALSE"  >{'#13#10'&#x20;&#x20;&quot;Sentido&#x20;1&' +
      '#x20;-&#x20;IDA&quot;:&#x20;true,'#13#10'&#x20;&#x20;&quot;Sentido&#x2' +
      '0;2&#x20;-&#x20;VOLTA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Oper' +
      'acional&#x20;-&#x20;IDA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quot;Op' +
      'eracional&#x20;-&#x20;VOLTA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quo' +
      't;Operacional&#x20;-&#x20;OUTROS&quot;:&#x20;false,'#13#10'&#x20;&#x20' +
      ';&quot;Ociosa&#x20;-&#x20;IDA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&q' +
      'uot;Ociosa&#x20;-&#x20;VOLTA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&qu' +
      'ot;Expressa&#x20;-&#x20;IDA&quot;:&#x20;false,'#13#10'&#x20;&#x20;&quo' +
      't;Expressa&#x20;-&#x20;VOLTA&quot;:&#x20;false'#13#10'}</CONSTANT>'#13#10'<C' +
      'ONSTANT TYPE="L&#243;gico" NULL="FALSE"  >false</CONSTANT>'#13#10'</PA' +
      'RAMS>'#13#10'</FUNCTION>'
    DiagramXml = 
      '<?xml version="1.0" encoding="ISO-8859-1"?>'#13#10'<ROOT>'#13#10'<TObjFuncti' +
      'on>'#13#10'<ID>1</ID>'#13#10'<NOME>FUNCTION</NOME>'#13#10'<TEXT>ebfSetSessionAttri' +
      'bute</TEXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVE' +
      'L>FALSE</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<PA' +
      'RAMS>'#13#10'<TObjConst>'#13#10'<ID>2</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></T' +
      'EXT>'#13#10'<SQL>FALSE</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE' +
      '</INCOMPATIVEL>'#13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>che' +
      'ckboxStatus</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></' +
      'DIAGRAMXML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<G' +
      'UID></GUID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjCon' +
      'st>'#13#10'<ID>6</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALS' +
      'E</SQL>'#13#10'<TIPO>Letras</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>' +
      #13#10'<MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>{'#13#10'&#x20;&#x20;&qu' +
      'ot;Sentido&#x20;1&#x20;-&#x20;IDA&quot;:&#x20;true,'#13#10'&#x20;&#x20' +
      ';&quot;Sentido&#x20;2&#x20;-&#x20;VOLTA&quot;:&#x20;false,'#13#10'&#x2' +
      '0;&#x20;&quot;Operacional&#x20;-&#x20;IDA&quot;:&#x20;false,'#13#10'&#' +
      'x20;&#x20;&quot;Operacional&#x20;-&#x20;VOLTA&quot;:&#x20;false,' +
      #13#10'&#x20;&#x20;&quot;Operacional&#x20;-&#x20;OUTROS&quot;:&#x20;f' +
      'alse,'#13#10'&#x20;&#x20;&quot;Ociosa&#x20;-&#x20;IDA&quot;:&#x20;fals' +
      'e,'#13#10'&#x20;&#x20;&quot;Ociosa&#x20;-&#x20;VOLTA&quot;:&#x20;false' +
      ','#13#10'&#x20;&#x20;&quot;Expressa&#x20;-&#x20;IDA&quot;:&#x20;false,' +
      #13#10'&#x20;&#x20;&quot;Expressa&#x20;-&#x20;VOLTA&quot;:&#x20;false' +
      #13#10'}</VALOR>'#13#10'<DMLTYPE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMX' +
      'ML>'#13#10'<NULO>FALSE</NULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GU' +
      'ID>'#13#10'<SPECIALCODE></SPECIALCODE>'#13#10'</TObjConst>'#13#10'<TObjConst>'#13#10'<ID' +
      '>7</ID>'#13#10'<NOME>CONSTANT</NOME>'#13#10'<TEXT></TEXT>'#13#10'<SQL>FALSE</SQL>'#13 +
      #10'<TIPO>L&#243;gico</TIPO>'#13#10'<INCOMPATIVEL>FALSE</INCOMPATIVEL>'#13#10'<' +
      'MKR_VERSION>5.0.0.33</MKR_VERSION>'#13#10'<VALOR>false</VALOR>'#13#10'<DMLTY' +
      'PE>dtSelect</DMLTYPE>'#13#10'<DIAGRAMXML></DIAGRAMXML>'#13#10'<NULO>FALSE</N' +
      'ULO>'#13#10'<FIELDINDEX>-1</FIELDINDEX>'#13#10'<GUID></GUID>'#13#10'<SPECIALCODE><' +
      '/SPECIALCODE>'#13#10'</TObjConst>'#13#10'</PARAMS>'#13#10'</TObjFunction>'#13#10'</ROOT>' +
      #13#10
  end
  object FlowLine11: TFlowLine
    Left = 75
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
    InputNames = 'FlowExpression3'
    OutputNames = 'FlowExpression4'
    Region = 0
    Style = psSolid
    Decision = False
  end
  object FlowLine14: TFlowLine
    Left = 75
    Top = 243
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
    InputNames = 'FlowExpression4'
    OutputNames = 'FlowSubRoutine4'
    Region = 0
    Style = psSolid
    Decision = False
  end
end

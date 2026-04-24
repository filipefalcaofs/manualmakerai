# Contexto da Sessao - SGFC Sprint 1

## Estado atual

### FRZs individuais (todos validados, importar separadamente)
- Regras servidor: Edital_SubRotinas_SRV, GrupoDespesa_SubRotinas_SRV, TipoDocumento_SubRotinas_SRV, ItemDespesa_Regras, UnidadeMedida_Regras, GestaoPortal_Regras
- Regras cliente: Edital_Eventos_CLI, Edital_Componentes_CLI, GrupoDespesa_Eventos_CLI, TipoDocumento_Eventos_CLI, Componentes_AoModificar_CLI
- Formularios: CadastroTipoDocumento, CadastroGrupoDespesa, CadastroItemDespesa, CadastroUnidadeMedida, CadastroEdital, GestaoUsuariosPortal

### FRZ unificado NAO funciona
O Maker nao aceita componentes de formulario quando regras estao no mesmo FRZ. Importar individualmente.

### Tabelas (SQL)
- SGFC_tabelas_DDL.sql - 60 CREATE TABLE/INDEX (executar com Alt+X no DBeaver)
- SGFC_tabelas_DML.sql - 2 INSERT (areas culturais)

### Compilador Rust (frz-compiler) corrigido nesta sessao
1. FlowLines dangling: build_steps agora reusa current_prev para reconexao
2. FlowLines NAO vazias: cria FlowLine para branch NAO vazio
3. field_index em StepParam::Constante para ebfSQLGetFormField (tipo Campo)
4. FunctionSpec para funcoes customizadas
5. Defaults auto para campos NOT NULL (integer=0, boolean=false)
6. generated=true sem DEFAULT (evita AUTO_INCREMENT DEFAULT 0)
7. Binario atualizado em AMBOS: target/release/ E mcp_maker/bin/

### MCP corrigido nesta sessao
1. guia_fluxograma() - nova tool com desenvolvimento orientado a fluxograma
2. gerar_funcao() - nova tool para funcoes customizadas
3. Eventos corrigidos: removido Antes de Gravar/Depois de Gravar, adicionado Antes de Alterar/Depois de Alterar
4. COMPONENT_EVENTS - matriz componente x evento em logic_engine.py
5. ebfSQLGetFormField documentado como correto para eventos de formulario
6. ECharts documentado como biblioteca nativa de graficos

### Concluido nesta sessao
1. Cadastro de Edital (form 2000) - reconstruido com 7 abas conforme HU 001 (113 componentes, 1100x800)
   - Navegacao padrao DESABILITADA (navegacao=false, aba_localizar=false)
   - Wizard com botoes customizados por aba:
     - Tab 01: Salvar Rascunho + Proximo
     - Tab 02-06: Anterior + Salvar Rascunho + Proximo
     - Tab 07: Anterior + Salvar Rascunho + Concluir Edital
   - 01-Dados Gerais: card Identificacao (18 campos + 2 checkboxes + 1 combo status + 1 memo rico) + card Publicacao DO (2 campos)
   - 02-Elegibilidade: card Tipologia (memo) + card Criterios (memo rico)
   - 03-Categorias: grid editavel EDITAL_CATEGORIA (mestre-detalhe)
   - 04-Formulario: grid EDITAL_DOCUMENTO (mestre-detalhe) + lookup FORMULARIO de inscricao
   - 05-Avaliacao: grid editavel EDITAL_CRITERIO_AVALIACAO (mestre-detalhe)
   - 06-Regras Fomento: card Direto (3 edits + 3 checks + memo territorializacao) + card Indireto (3 combos + 4 edits)
   - 07-Orcamento: card Config (2 checks) + grid EDITAL_GRUPO_DESPESA (mestre-detalhe)
   - Design: cards Bootstrap com headers icone Font Awesome, CSS premium, responsivo
   - 40 colunas no SQL_UPDATE, 6 colunas na grade de pesquisa
   - Botoes referenciam regras: Navegar Proxima Aba, Navegar Aba Anterior, Salvar Edital Rascunho, Concluir Edital

### Pendencias para proxima sessao
1. Todas as regras cliente usam ebfFormChangeComponentValue - precisam migrar para ebfSQLGetFormField
2. TextoRico = "True" corrigido para "1" apenas no CadastroEdital.frz
3. Regras de visibilidade condicional: aba 06 (Direto vs Indireto baseado em cmbTipoFomento) e aba 07 (condicional ao chkHabilitarOrcamento)
4. Vincular eventos do form aos FRZs de regras existentes (Edital_SubRotinas_SRV, Edital_Eventos_CLI, Edital_Componentes_CLI)
5. Criar regras referenciadas pelos botoes wizard:
   - Navegar Proxima Aba (cliente, JS para trocar aba)
   - Navegar Aba Anterior (cliente, JS para trocar aba)
   - Salvar Edital Rascunho (servidor, INSERT/UPDATE com STATUS=RASCUNHO)
   - Concluir Edital (servidor, valida campos obrigatorios + UPDATE STATUS)

### HU de referencia
- frz_extracted/docs/fomento/1_CADASTROS/HU 001 - FOMENTO - CADASTRO DE EDITAL_.docx
- 7 abas: Dados Gerais, Elegibilidade, Categorias, Formulario/Documentos, Criterios Avaliacao, Regras Fomento, Orcamento

### GUIDs dos formularios (para ebfSQLGetFormField)
- Form 1000 (TipoDocumento): {00000000-0000-4000-98A4-8A83364747C0}
- Form 1050 (GrupoDespesa): {00000000-0000-4000-98A4-8A8335CE6A58}
- Form 1060 (ItemDespesa): {00000000-0000-4000-98A4-8A83360A42A8}
- Form 1070 (UnidadeMedida): {00000000-0000-4000-98A4-8A8335267640}
- Form 2000 (Edital): {00000000-0000-4000-98A4-8A8335839A00}
- Form 3000 (GestaoPortal): {00000000-0000-4000-98A4-8A83368A1938}

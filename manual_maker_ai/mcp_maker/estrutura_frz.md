# Estrutura Completa de um Arquivo FRZ

Baseado na analise de ExemplosFRZ.frz (18MB, 104 tabelas, 29 regras, 12 formularios, 1186 funcoes, 4 templates).

---

## Hierarquia XML

```xml
<?xml version="1.0" encoding="iso-8859-1" ?>
<fmaker version="2.3" maker_version="6.1.0.14" xml:space="preserve">
  <global>
    <tables>                        <!-- DICIONARIO DE DADOS: definicao de tabelas -->
      <table TAB_NOME="nome_tabela">
        <property name="TAB_DESCRICAO">Descricao</property>
        <field CMP_NOME="nome_campo">
          <property name="CMP_DESCRICAO">Descricao</property>
          <property name="CMP_VALORPADRAO"></property>
          <property name="TPD_CODIGO">DATA-HORA</property>
        </field>
        <!-- ... mais fields ... -->
      </table>
    </tables>
    <tempo SESSION="DATADICTIONARY">00:00</tempo>

    <rules>                         <!-- REGRAS GLOBAIS (fluxogramas) -->
      <rule REG_NOME="Nome&#x0020;da&#x0020;Regra" REG_COD="1">
        <property name="REG_COD">1</property>
        <property name="REG_NOME">Nome&#x0020;da&#x0020;Regra</property>
        <property name="REG_DESCRICAO">Descricao</property>
        <property name="REG_PARAMS">param1,Letras,,;param2,Inteiro,,;</property>
        <property name="REG_VARIAVEIS">var1,Variante,,;var2,Tabela,,;</property>
        <property name="REG_PARAMS_OUT">Variante,</property>
        <property name="REG_DATA">01/01/2026</property>
        <property name="REG_HORA">12:00:00</property>
        <property name="REG_COMPILADA">S</property>
        <property name="REG_DESTINO">2</property>         <!-- 1=Cliente, 2=Servidor -->
        <property name="REG_HASH">md5hash</property>
        <property name="REG_INTERFACE" binary-encoded="True"><![CDATA[base64_DFM]]></property>
        <property name="REG_SCRIPT" binary-encoded="True"><![CDATA[base64_ScriptXML]]></property>
        <property name="CAT_PATH"><![CDATA[\Categoria\Sub]]></property>
      </rule>
    </rules>

    <templates>                     <!-- TEMPLATES DE REGRA (prefixo __TPT_) -->
      <template REG_NOME="__TPT_{GUID}" REG_COD="69">
        <!-- mesma estrutura de <rule> -->
      </template>
    </templates>

    <functions>                     <!-- CATALOGO DE FUNCOES NATIVAS (1186+) -->
      <function FUN_NOME_REAL="ebfSQLExecuteQuery" FUN_COD="1">
        <property name="FUN_COD">1</property>
        <property name="FUN_NOME">Abrir Consulta</property>
        <property name="FUN_DESCRICAO">Executa query SQL</property>
        <property name="FUN_NOME_REAL">ebfSQLExecuteQuery</property>
        <property name="FUN_PARAMS">2'SQL Consulta;2'Variante</property>
        <property name="FUN_RETORNO">Tabela</property>
        <property name="FUN_TIPO">1</property>
        <property name="FUN_COMPATIBILIDADE">0,1,2</property>
        <property name="FUN_RESUMO">Abrir Consulta(SQL Consulta, Variante): Tabela</property>
        <property name="FUN_CONTEUDO_SERVIDOR">Java code</property>
        <property name="FUN_CONTEUDO_CLIENTE">JS code</property>
        <property name="FUN_VERSAO">5.0</property>
        <property name="CAT_PATH">\SQL</property>
      </function>
    </functions>

    <ENTITY_SCHEMA>                 <!-- SCHEMA TIPADO (tipos ricos com KEY, MASK, DEFAULT) -->
      <ENTITY NAME="FR_FORMULARIO" FRIENDLY_NAME="FR_FORMULARIO" FORM="fr_formulario">
        <ATTRIBUTE NAME="FRM_CODIGO" FRIENDLY_NAME="C&#x00F3;digo" TYPE="integer" LENGTH="32">
          <KEY/>
        </ATTRIBUTE>
        <ATTRIBUTE NAME="FRM_DESCRICAO" TYPE="string" LENGTH="100"/>
        <ATTRIBUTE NAME="FRM_GUID" TYPE="string" LENGTH="38"/>
      </ENTITY>
    </ENTITY_SCHEMA>

    <datapackets>                   <!-- DADOS REAIS DAS TABELAS -->
      <DATA ID="{GUID}">
        <METADATA>
          <ENTITY NAME="FR_FORMULARIO" FRIENDLY_NAME="FR_FORMULARIO" FORM="fr_formulario">
            <ATTRIBUTE NAME="FRM_CODIGO" TYPE="integer" LENGTH="32"/>
          </ENTITY>
        </METADATA>
        <DATASET>
          <ROW FRM_CODIGO="20" FRM_DESCRICAO="Template Principal" FRM_GUID="{...}"/>
        </DATASET>
      </DATA>
    </datapackets>

    <REFERENCE_RELATIONSHIP>        <!-- FOREIGN KEYS -->
      <REFERENCE_RELATIONSHIP NAME="FK_COMPONENTE_FORMULARIO">
        <REFERENCED_ENTITY NAME="FR_FORMULARIO"/>
        <REFERENCING_ENTITY NAME="FR_COMPONENTE"/>
        <REFERENCE_KEYS>
          <REFERENCED_ATTRIBUTE NAME="FRM_CODIGO"/>
          <REFERENCING_ATTRIBUTE NAME="FRM_CODIGO"/>
        </REFERENCE_KEYS>
      </REFERENCE_RELATIONSHIP>
    </REFERENCE_RELATIONSHIP>
  </global>

  <system SIS_CODIGO="LG3">        <!-- SISTEMA COM FORMULARIOS -->
    <property name="SIS_DESCRICAO">Nome do Sistema</property>
    <property name="SIS_SQLDATALIMITE">...</property>

    <form FRM_CODIGO="54" FRM_GUID="{GUID}">
      <property name="IMG_INCLUIR">1</property>
      <property name="IMG_ALTERAR">2</property>
      <property name="IMG_EXCLUIR">8</property>
      <!-- ... demais botoes toolbar (IMG_GRAVAR, IMG_CANCELAR, etc.) ... -->
      <property name="FRM_DESCRICAO">Titulo</property>
      <property name="FRM_POSICAOX">330</property>
      <property name="FRM_POSICAOY">146</property>
      <property name="FRM_TAMANHO">1100</property>
      <property name="FRM_ALTURA">700</property>
      <property name="FRM_TIPO_CRIACAO">0</property>
      <property name="FNT_CAMPOCHAVE">campo_pk</property>
      <property name="FNT_TABELA">NOME_TABELA</property>
      <property name="FNT_SQLSELECT">SELECT ...</property>
      <property name="FNT_SQLINSERT"></property>
      <property name="FNT_SQLUPDATE">campo1&#x000D;&#x000A;campo2</property>
      <property name="FNT_SQLDELETE"></property>
      <property name="FNT_CAMPOINCREMENTO"></property>
      <property name="FNT_CAMPOGRADE">campo1&#x003B;campo2</property>
      <property name="FNT_CAMPOPESQUISA">campo1&#x003B;campo2</property>
      <property name="FNT_SQLDEFAULT"></property>
      <property name="FNT_SQLMASCARA"></property>
      <property name="REL_CODIGO"></property>

      <category CAT_CODIGO="1"/>    <!-- CATEGORIA DO FORMULARIO -->

      <component COM_CODIGO="100" COM_TIPO="F" name="">   <!-- FORM SETTINGS -->
        <property name="Navegacao">TRUE</property>
        <property name="Abas">TRUE</property>
        <property name="Responsivo">TRUE</property>
        <property name="ClasseCss"></property>
        <property name="EditarAoDuploClicar">TRUE</property>
        <property name="AbaLocalizar">TRUE</property>
        <event name="Ao Entrar">
          <action name="12">
            <property name="ACC_CONDICAO"></property>
            <param name="Entrada"><![CDATA[]]></param>
            <param name="Nome"><![CDATA[Nome da Regra]]></param>
          </action>
        </event>
      </component>

      <component COM_CODIGO="101" COM_TIPO="E" name="MakerEdit1">
        <property name="Aba">01-Cadastro</property>
        <property name="Altura">35</property>
        <property name="Campo">COLUNA_BANCO</property>
        <property name="Container">containerPai</property>
        <property name="Descricao">Label do Campo</property>
        <property name="Habilitado">True</property>
        <property name="Nome">MakerEdit1</property>
        <property name="NomeClasseCss">form-group col-md-6</property>
        <property name="Obrigatorio">TRUE</property>
        <property name="Placeholder">Digite...</property>
        <property name="PosicaoX">16</property>
        <property name="PosicaoY">0</property>
        <property name="Tamanho">321</property>
        <property name="Visivel">True</property>
        <event name="Ao Sair">
          <action name="12">
            <property name="ACC_CONDICAO"></property>
            <param name="Entrada"><![CDATA[pValor=MakerEdit1]]></param>
            <param name="Nome"><![CDATA[Validar Campo]]></param>
          </action>
        </event>
      </component>
    </form>

    <tempo SESSION="FORMS">00:01</tempo>
  </system>

  <tempo SESSION="ALL">00:01</tempo>
  <datageracao>01/04/2026 12:00</datageracao>
</fmaker>
```

---

## Tipos de Componente (COM_TIPO)

| Tipo | Componente | Uso |
|------|-----------|-----|
| F | FormSettings | Configuracoes do formulario (1 por form) |
| E | MakerEdit | Campo texto (mais usado: 21x no FRZ exemplo) |
| P | MakerPanel | Container/Painel (17x) |
| L | MakerLabel/Lookup | Label ou Lookup (13x) |
| B | MakerButton | Botao (8x) |
| W | MakerContainer | Container web/Card (7x) |
| A | AdvancedLabel/Chart | Label avancado ou grafico (6x) |
| S | MakerShape/Separator | Forma geometrica ou separador (6x) |
| I | MakerImage | Imagem (6x) |
| M | MakerMemo | Campo texto multilinha (4x) |
| G | MakerGrid | Grade de dados (3x) |
| H | MakerHtml/CheckBox | Campo HTML ou CheckBox (3x) |
| K | MakerCheckBox | CheckBox (3x) |
| C | MakerCombo | ComboBox (2x) |
| R | MakerRadio | RadioGroup (1x) |

---

## Tipos de Formulario

### Template (sem tabela, visual/funcional)
- Navegacao=FALSE, Abas=FALSE, Responsivo=TRUE
- Sem tabela, sem SQL, sem grade de pesquisa
- Regras vinculadas a Ao Entrar para montar UI
- Exemplos: Dashboard, Kanban, Login, Formulario Principal

### CRUD (com tabela, navegacao)
- Navegacao=TRUE, Abas=TRUE, Responsivo=TRUE
- AbaLocalizar=TRUE, EditarAoDuploClicar=TRUE
- Tabela + CampoChave + SQLSelect + SQLUpdate definidos
- CampoGrade e CampoPesquisa com campos separados por ;
- Exemplos: Usuarios, Grupos, Sistemas

---

## REG_DESTINO

| Valor | Camada | Executa | Funcoes tipicas |
|-------|--------|---------|-----------------|
| 1 | Cliente | JavaScript | ebfFormChangeComponentValue, ebfHtml*, ebfExecuteJS, ebfLocalStorage* |
| 2 | Servidor | Java | ebfSQLExecuteQuery, ebfAuthUser, ebfFile*, ebfSendMail |

---

## Formato de Parametros/Variaveis

```
REG_PARAMS: nome1,Letras,,;nome2,Inteiro,,;nome3,Variante,,;
REG_VARIAVEIS: var1,Variante,,;var2,Tabela,,;var3,Letras,100,;
REG_PARAMS_OUT: Variante,
```

### Tipos de dados disponiveis
- Letras (string)
- Inteiro (integer)
- Variante (variant/any)
- Tabela (query result set)
- Logico (boolean)
- Data (date)
- Data-Hora (datetime)
- Flutuante (float)
- SQL Consulta (SQL query)

---

## Eventos de Componente

| Evento | Uso tipico |
|--------|-----------|
| Ao Entrar | Inicializacao do formulario |
| Antes de Gravar | Validacao antes de salvar |
| Antes de Inserir | Pre-processamento de inclusao |
| Ao Sair | Validacao ao sair do campo |
| Ao Clicar | Acao de botao |
| Ao Modificar | Reagir a mudanca de valor |
| Ao Navegar | Ao navegar entre registros |
| Ao Pressionar Tecla | Atalhos de teclado |
| Ao Soltar | Drag-and-drop |

---

## CSS Bootstrap mais usadas

| Classe | Uso |
|--------|-----|
| form-group | Base de todo campo |
| form-group col-md-N | Campo responsivo (N=3,4,6,12) |
| form-group card | Card container |
| form-group card-header | Header de card |
| d-flex flex-row | Layout horizontal |
| align-items-center | Centralizar verticalmente |
| shadow | Sombra em cards |
| btn-dark, btn-primary | Botoes |
| text-muted | Texto secundario |
| p-0 m-0 | Reset padding/margin |

---

## Secoes opcionais do FRZ

As secoes `<templates>`, `<functions>`, `<ENTITY_SCHEMA>`, `<datapackets>`, e `<REFERENCE_RELATIONSHIP>` sao opcionais. Um FRZ minimo precisa apenas de `<rules>` e/ou `<system>` com `<form>`.

O gerador FRZ do MCP produz as secoes essenciais: `<tables>`, `<rules>`, e `<system>` com `<form>`. As demais secoes sao importadas automaticamente pelo Maker quando o sistema e configurado.

//! Modelos de dados da especificacao FRZ.
//!
//! Deserializa o JSON de entrada usando serde com enums algebraicos.
//! Qualquer campo invalido ou tipo errado e rejeitado em tempo de parse,
//! nao em runtime no meio da geracao.

use serde::Deserialize;

/// Spec completa de um FRZ (entrada do compilador).
#[derive(Debug, Deserialize)]
pub struct FrzSpec {
    #[serde(default)]
    pub formulario: Option<FormSpec>,

    #[serde(default)]
    pub formularios: Option<Vec<FormSpec>>,

    #[serde(default)]
    pub regras: Vec<RuleSpec>,

    #[serde(default)]
    pub funcoes: Vec<FunctionSpec>,

    #[serde(default)]
    pub tabelas: Vec<TableSpec>,

    #[serde(default)]
    pub entidades: Vec<EntitySpec>,

    #[serde(default)]
    pub dados: Vec<DataPacketSpec>,
}

impl FrzSpec {
    pub fn all_forms(&self) -> Vec<&FormSpec> {
        if let Some(ref forms) = self.formularios {
            forms.iter().collect()
        } else if let Some(ref form) = self.formulario {
            vec![form]
        } else {
            vec![]
        }
    }
}

// ---------------------------------------------------------------------------
// Regra (fluxograma)
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
pub struct RuleSpec {
    pub nome: String,

    #[serde(default = "default_destino")]
    pub destino: u8,

    #[serde(default = "default_codigo")]
    pub codigo: i32,

    #[serde(default)]
    pub descricao: String,

    #[serde(default)]
    pub retorno_tipo: String,

    #[serde(default = "default_categoria")]
    pub categoria: String,

    #[serde(default)]
    pub parametros: Vec<RuleParam>,

    #[serde(default)]
    pub variaveis: Vec<RuleVar>,

    #[serde(default)]
    pub passos: Vec<Step>,
}

#[derive(Debug, Deserialize)]
pub struct RuleParam {
    pub nome: String,
    pub tipo: String,
    #[serde(default)]
    pub tamanho: String,
}

#[derive(Debug, Deserialize)]
pub struct RuleVar {
    pub nome: String,
    pub tipo: String,
    #[serde(default)]
    pub tamanho: String,
}

// ---------------------------------------------------------------------------
// Passos do fluxograma — enum algebraico com tagged union
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
#[serde(tag = "tipo", rename_all = "lowercase")]
pub enum Step {
    #[serde(alias = "expressao")]
    Expressao {
        nome: String,
        #[serde(default)]
        descricao: String,
        funcao: String,
        #[serde(default)]
        nome_amigavel: String,
        #[serde(default)]
        params: Vec<StepParam>,
        #[serde(default)]
        retorno: String,
        #[serde(default = "default_variante")]
        tipo_retorno: String,
    },

    #[serde(alias = "decisao")]
    Decisao {
        nome: String,
        #[serde(default)]
        descricao: String,
        funcao: String,
        #[serde(default)]
        nome_amigavel: String,
        #[serde(default)]
        params: Vec<StepParam>,
        #[serde(default)]
        sim: Vec<Step>,
        #[serde(default)]
        nao: Vec<Step>,
    },

    #[serde(alias = "subrotina")]
    Subrotina {
        #[serde(default)]
        nome: String,
        rule_name: String,
        rule_id: i32,
        #[serde(default)]
        params: Vec<SubRoutineParam>,
        #[serde(default)]
        return_var: String,
        #[serde(default)]
        description: String,
    },

    #[serde(alias = "atividade")]
    Atividade {
        #[serde(default)]
        nome: String,
        #[serde(default = "default_activity_id")]
        activity_id: i32,
        #[serde(default)]
        object_name: String,
        #[serde(default)]
        real_name: String,
        #[serde(default)]
        params: Vec<SubRoutineParam>,
        #[serde(default)]
        description: String,
    },
}

/// Parametro de um passo — tagged union discriminado por "tipo".
#[derive(Debug, Deserialize)]
#[serde(tag = "tipo", rename_all = "lowercase")]
pub enum StepParam {
    #[serde(alias = "variavel")]
    Variavel {
        nome: String,
        #[serde(default = "default_variante")]
        tipo_dado: String,
    },

    #[serde(alias = "constante")]
    Constante {
        valor: Option<String>,
        #[serde(default = "default_letras")]
        tipo_dado: String,
        #[serde(default)]
        guid: String,
        #[serde(default = "default_field_index")]
        field_index: i32,
    },

    Sql {
        sql: String,
        #[serde(default)]
        binds: Vec<SqlBind>,
    },

    #[serde(alias = "funcao")]
    Funcao {
        funcao: String,
        #[serde(default)]
        nome_amigavel: String,
        #[serde(default)]
        params: Vec<StepParam>,
        #[serde(default = "default_variante")]
        tipo_retorno: String,
    },
}

#[derive(Debug, Deserialize)]
pub struct SqlBind {
    pub nome: String,
    pub variavel: String,
}

#[derive(Debug, Deserialize)]
pub struct SubRoutineParam {
    pub target_param_name: String,
    pub value: StepParam,
}

// ---------------------------------------------------------------------------
// Formulario
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
pub struct FormSpec {
    #[serde(default = "default_form_desc")]
    pub descricao: String,

    #[serde(default)]
    pub tabela: String,

    #[serde(default)]
    pub campo_chave: String,

    #[serde(default)]
    pub sql_select: String,

    #[serde(default = "default_tamanho")]
    pub tamanho: u32,

    #[serde(default = "default_altura")]
    pub altura: u32,

    #[serde(default)]
    pub campos: Vec<FormField>,

    #[serde(default)]
    pub sql_update: String,

    #[serde(default)]
    pub campos_grade: String,

    #[serde(default)]
    pub campos_pesquisa: String,

    #[serde(default)]
    pub css: String,

    #[serde(default = "default_form_codigo")]
    pub codigo: i32,

    #[serde(default)]
    pub guid: String,

    #[serde(default = "default_sistema")]
    pub sistema: String,

    #[serde(default)]
    pub eventos: Option<serde_json::Value>,

    #[serde(default = "default_true")]
    pub navegacao: bool,

    #[serde(default = "default_true")]
    pub abas: bool,

    #[serde(default = "default_true")]
    pub responsivo: bool,

    #[serde(default = "default_true")]
    pub aba_localizar: bool,

    #[serde(default = "default_true")]
    pub editar_duplo_clique: bool,

    #[serde(default = "default_true")]
    pub barra_rolagem: bool,

    #[serde(default)]
    pub categoria: i32,
}

#[derive(Debug, Deserialize)]
pub struct FormField {
    pub nome: String,
    pub tipo: String,

    #[serde(default)]
    pub campo: String,

    #[serde(default)]
    pub descricao: String,

    #[serde(default = "default_aba")]
    pub aba: String,

    #[serde(default)]
    pub container: String,

    #[serde(default = "default_posicao_x")]
    pub posicao_x: i32,

    #[serde(default)]
    pub posicao_y: i32,

    #[serde(default = "default_field_tamanho")]
    pub tamanho: i32,

    #[serde(default = "default_field_altura")]
    pub altura: i32,

    #[serde(default)]
    pub properties: Option<serde_json::Map<String, serde_json::Value>>,

    #[serde(default)]
    pub eventos: Option<serde_json::Value>,
}

// ---------------------------------------------------------------------------
// Funcao customizada
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
pub struct FunctionSpec {
    pub nome_real: String,

    #[serde(default)]
    pub nome: String,

    #[serde(default = "default_func_codigo")]
    pub codigo: i32,

    #[serde(default)]
    pub descricao: String,

    #[serde(default)]
    pub params: String,

    #[serde(default = "default_variante")]
    pub retorno: String,

    /// 1=cliente, 2=servidor, "1,2"=ambos
    #[serde(default = "default_compat")]
    pub compatibilidade: String,

    #[serde(default)]
    pub conteudo_cliente: String,

    #[serde(default)]
    pub conteudo_servidor: String,

    #[serde(default)]
    pub conteudo_banco: String,

    #[serde(default = "default_func_tipo")]
    pub tipo: i32,

    #[serde(default = "default_func_cat")]
    pub categoria: String,

    #[serde(default)]
    pub versao: String,
}

impl FunctionSpec {
    pub fn resumo(&self) -> String {
        let nome = if self.nome.is_empty() { &self.nome_real } else { &self.nome };
        if self.params.is_empty() {
            format!("{} (): {}", nome, self.retorno)
        } else {
            format!("{} ({}): {}", nome, self.params, self.retorno)
        }
    }
}

// ---------------------------------------------------------------------------
// Tabela (dicionario de dados)
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
pub struct TableSpec {
    pub nome: String,
    #[serde(default)]
    pub descricao: String,
    #[serde(default)]
    pub campos: Vec<TableField>,
}

#[derive(Debug, Deserialize)]
pub struct TableField {
    pub nome: String,
    #[serde(default)]
    pub descricao: String,
    #[serde(default)]
    pub tipo: String,
    #[serde(default)]
    pub valor_padrao: String,
}

// ---------------------------------------------------------------------------
// ENTITY_SCHEMA — Definicao de tabelas (DDL)
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
pub struct EntitySpec {
    pub nome: String,
    #[serde(default)]
    pub friendly_name: String,
    #[serde(default)]
    pub form: String,
    #[serde(default)]
    pub atributos: Vec<EntityAttribute>,
    #[serde(default)]
    pub chaves: Vec<EntityKey>,
}

impl EntitySpec {
    pub fn friendly(&self) -> &str {
        if self.friendly_name.is_empty() { &self.nome } else { &self.friendly_name }
    }
    pub fn form_name(&self) -> String {
        if self.form.is_empty() { self.nome.to_lowercase() } else { self.form.clone() }
    }
}

#[derive(Debug, Deserialize)]
pub struct EntityAttribute {
    pub nome: String,
    #[serde(default = "default_string_type")]
    pub tipo: String,
    #[serde(default)]
    pub tamanho: i32,
    #[serde(default = "default_true")]
    pub nullable: bool,
    #[serde(default)]
    pub generated: bool,
    #[serde(default)]
    pub default: String,
    #[serde(default)]
    pub mascara: String,
    #[serde(default)]
    pub friendly_name: String,
}

impl EntityAttribute {
    pub fn friendly(&self) -> &str {
        if self.friendly_name.is_empty() { &self.nome } else { &self.friendly_name }
    }
}

#[derive(Debug, Deserialize)]
pub struct EntityKey {
    #[serde(default)]
    pub nome: String,
    #[serde(default)]
    pub colunas: Vec<String>,
    #[serde(default = "default_true")]
    pub primary: bool,
    #[serde(default)]
    pub unique: bool,
}

// ---------------------------------------------------------------------------
// Datapackets — Dados iniciais (seed/DML)
// ---------------------------------------------------------------------------

#[derive(Debug, Deserialize)]
pub struct DataPacketSpec {
    pub entity_name: String,
    #[serde(default)]
    pub linhas: Vec<serde_json::Map<String, serde_json::Value>>,
    #[serde(default)]
    pub guid: String,
    #[serde(default)]
    pub friendly_name: String,
    #[serde(default)]
    pub form: String,
    #[serde(default)]
    pub atributos: Option<Vec<EntityAttribute>>,
}

// ---------------------------------------------------------------------------
// Defaults (serde precisa de funcoes nomeadas)
// ---------------------------------------------------------------------------

fn default_string_type() -> String { "string".into() }

fn default_destino() -> u8 { 2 }
fn default_codigo() -> i32 { 50 }
fn default_categoria() -> String { r"\Uso Geral".into() }
fn default_variante() -> String { "Variante".into() }
fn default_letras() -> String { "Letras".into() }
fn default_field_index() -> i32 { -1 }
fn default_func_codigo() -> i32 { 9000 }
fn default_func_tipo() -> i32 { 39 }
fn default_func_cat() -> String { r"\Uso Geral".into() }
fn default_compat() -> String { "1,2".into() }
fn default_activity_id() -> i32 { 7 }
fn default_form_desc() -> String { "Formulario".into() }
fn default_tamanho() -> u32 { 1100 }
fn default_altura() -> u32 { 700 }
fn default_form_codigo() -> i32 { 9000 }
fn default_sistema() -> String { "SISTEMA".into() }
fn default_true() -> bool { true }
fn default_aba() -> String { "01-Cadastro".into() }
fn default_posicao_x() -> i32 { 16 }
fn default_field_tamanho() -> i32 { 321 }
fn default_field_altura() -> i32 { 35 }

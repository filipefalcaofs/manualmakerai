//! Gerador de Script XML para fluxogramas Maker.
//!
//! O Script XML e a representacao executavel da regra,
//! enquanto o DFM e a representacao visual.

use crate::encoder::xml_escape_content;
use crate::spec::{RuleSpec, Step, StepParam};

/// Gera o Script XML completo de uma regra.
pub fn build_script(spec: &RuleSpec) -> String {
    let name_esc = spec.nome.replace(' ', "&#x20;");

    let params_xml: String = spec.parametros.iter()
        .map(|p| format!("<PARAM TYPE=\"{}\" SIZE=\"{}\">{}</PARAM>", p.tipo, p.tamanho, p.nome))
        .collect::<Vec<_>>()
        .join("\n");

    let vars_xml: String = spec.variaveis.iter()
        .map(|v| format!("<VAR TYPE=\"{}\" SIZE=\"{}\">{}</VAR>", v.tipo, v.tamanho, v.nome))
        .collect::<Vec<_>>()
        .join("\n");

    let ret_type = if spec.retorno_tipo.is_empty() { "" } else { &spec.retorno_tipo };
    let declare_return = format!("<DECLARERETURN TYPE=\"{ret_type}\" SIZE=\"\"/>");

    let actions = build_steps_script(&spec.passos);

    format!(
        "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n\
         <RULE ID=\"{cod}\" NAME=\"{name_esc}\" \
         COMPONENTNAME=\"FlowStart1\" DESCRIPTION=\"Inicio\" DEBUG=\"FALSE\">\n\
         <HEADER>\n<AUTHOR>master</AUTHOR>\n\
         <DATE></DATE>\n<RANKING>10,0</RANKING>\n</HEADER>\n\
         {params_xml}\n{vars_xml}\n{declare_return}\n\
         <ACTION>\n{actions}\n\
         <RULERETURN COMPONENTNAME=\"fimDoFluxo\" DESCRIPTION=\"Fim\">\n\
         </RULERETURN>\n\
         </ACTION>\n</RULE>\n",
        cod = spec.codigo,
    )
}

fn build_steps_script(steps: &[Step]) -> String {
    steps.iter().map(|step| match step {
        Step::Expressao { nome, descricao, funcao, nome_amigavel, params, retorno, .. } => {
            let ret_attr = if retorno.is_empty() {
                String::new()
            } else {
                format!(" RETURN=\"{retorno}\"")
            };
            let desc_esc = descricao.replace(' ', "&#x20;");
            let func_xml = script_function_xml(funcao, nome_amigavel, params);
            format!(
                "<EXPRESSION{ret_attr} COMPONENTNAME=\"{nome}\" \
                 DESCRIPTION=\"{desc_esc}\">\n{func_xml}\n</EXPRESSION>"
            )
        }

        Step::Decisao { nome, descricao, funcao, nome_amigavel, params, sim, nao } => {
            let desc_esc = descricao.replace(' ', "&#x20;");
            let cond_xml = script_function_xml(funcao, nome_amigavel, params);
            let sim_actions = if sim.is_empty() { String::new() } else { build_steps_script(sim) };
            let nao_actions = if nao.is_empty() { String::new() } else { build_steps_script(nao) };
            format!(
                "<DECISION COMPONENTNAME=\"{nome}\" DESCRIPTION=\"{desc_esc}\">\n\
                 <CONDITION>\n{cond_xml}\n</CONDITION>\n\
                 <IFTRUE>\n<ACTION>\n{sim_actions}\n</ACTION>\n</IFTRUE>\n\
                 <IFFALSE>\n<ACTION>\n{nao_actions}\n</ACTION>\n</IFFALSE>\n\
                 </DECISION>"
            )
        }

        Step::Subrotina { nome, rule_name, rule_id, params, return_var, description } => {
            let name_esc = rule_name.replace(' ', "&#x20;");
            let d = if description.is_empty() { rule_name } else { description };
            let desc_esc = d.replace(' ', "&#x20;");
            let ret = return_var.as_str();
            let params_xml: String = params.iter()
                .map(|sp| script_param_xml(&sp.value))
                .collect::<Vec<_>>()
                .join("\n");
            format!(
                "<CALLRULE ID=\"{rule_id}\" NAME=\"{name_esc}\" \
                 RETURN=\"{ret}\" PARAMSCOUNT=\"{pc}\" \
                 COMPONENTNAME=\"{nome}\" DESCRIPTION=\"{desc_esc}\">\n\
                 <PARAMS>\n{params_xml}\n</PARAMS>\n</CALLRULE>",
                pc = params.len(),
            )
        }

        Step::Atividade { nome, activity_id, object_name, real_name, params, description } => {
            let name_esc = object_name.replace(' ', "&#x20;");
            let d = if description.is_empty() { object_name } else { description };
            let desc_esc = d.replace(' ', "&#x20;");
            let params_xml: String = params.iter()
                .map(|sp| script_param_xml(&sp.value))
                .collect::<Vec<_>>()
                .join("\n");
            format!(
                "<ACTIVITY ID=\"{activity_id}\" NAME=\"{name_esc}\" \
                 REALNAME=\"{real_name}\" COMPONENTNAME=\"{nome}\" \
                 DESCRIPTION=\"{desc_esc}\">\n\
                 <PARAMS>\n{params_xml}\n</PARAMS>\n</ACTIVITY>"
            )
        }
    }).collect::<Vec<_>>().join("\n")
}

fn script_function_xml(funcao: &str, nome_amigavel: &str, params: &[StepParam]) -> String {
    let params_xml: String = params.iter()
        .map(|p| script_param_xml(p))
        .collect::<Vec<_>>()
        .join("\n");

    if params.is_empty() {
        format!("<FUNCTION NAME=\"{nome_amigavel}\" REALNAME=\"{funcao}\">\n</FUNCTION>")
    } else {
        format!(
            "<FUNCTION NAME=\"{nome_amigavel}\" REALNAME=\"{funcao}\">\n\
             <PARAMS>\n{params_xml}\n</PARAMS>\n</FUNCTION>"
        )
    }
}

fn script_param_xml(p: &StepParam) -> String {
    match p {
        StepParam::Variavel { nome, .. } => {
            format!("<VARIABLE NAME=\"{nome}\"/>")
        }
        StepParam::Constante { valor, tipo_dado, guid, .. } => {
            let is_null = valor.is_none();
            let null_str = if is_null { "TRUE" } else { "FALSE" };
            let val = valor.as_deref().map(|v| xml_escape_content(v)).unwrap_or_default();
            let guid_attr = if guid.is_empty() { String::new() } else { format!(" GUID = \"{guid}\"") };
            format!("<CONSTANT TYPE=\"{tipo_dado}\" NULL=\"{null_str}\" {guid_attr} >{val}</CONSTANT>")
        }
        StepParam::Sql { sql, binds } => {
            let binds_xml: String = binds.iter().map(|b| {
                format!(
                    "\n<DEFINE NAME=\"{}\">\n<VARIABLE NAME=\"{}\"/>\n</DEFINE>",
                    b.nome, b.variavel,
                )
            }).collect();
            format!(
                "<CONSTANT TYPE=\"SQL Consulta\" NULL=\"FALSE\"><PSQL>\n\
                 <COMMAND>\n{sql}\n\n\n/*WHERE_ADD*/\n/*ORDER_NEW*/\n</COMMAND>\n\
                 <PARAMS>{binds_xml}\n</PARAMS>\n</PSQL>\n</CONSTANT>"
            )
        }
        StepParam::Funcao { funcao, nome_amigavel, params, .. } => {
            let inner: String = params.iter()
                .map(|sp| script_param_xml(sp))
                .collect::<Vec<_>>()
                .join("\n");
            format!(
                "<FUNCTION NAME=\"{nome_amigavel}\" REALNAME=\"{funcao}\">\n\
                 <PARAMS>\n{inner}\n</PARAMS>\n</FUNCTION>"
            )
        }
    }
}

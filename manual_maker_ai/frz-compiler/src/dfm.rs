//! Gerador de DFM (Delphi Form Module) para fluxogramas Maker.
//!
//! Posiciona componentes visuais (TFlowStart, TFlowExpression, etc.)
//! usando o modelo matematico de layout centralizado.

use crate::encoder::{delphi_inline, to_delphi_prop, xml_escape_content, xml_space};
use crate::spec::{RuleSpec, Step, StepParam, SubRoutineParam};

const MKR_VERSION: &str = "5.0.0.33";

/// Constantes de layout (pixels).
pub struct Layout;

impl Layout {
    pub const CENTER: i32 = 665;
    pub const START_W: i32 = 38;
    pub const START_H: i32 = 38;
    pub const START_TOP: i32 = 18;
    pub const FIRST_GAP: i32 = 27;
    pub const STEP_SPACING: i32 = 75;
    pub const EXPR_W: i32 = 150;
    pub const EXPR_H: i32 = 59;
    pub const DEC_W: i32 = 150;
    pub const DEC_H: i32 = 60;
    pub const SUB_W: i32 = 150;
    pub const SUB_H: i32 = 60;
    pub const ACT_H: i32 = 60;
    pub const CONN_W: i32 = 30;
    pub const CONN_H: i32 = 30;
    pub const END_W: i32 = 39;
    pub const LINE_W: i32 = 40;
    pub const SIM_OFFSET: i32 = 190;
}

const FONT_BLOCK: &str = "\
    Font.Charset = DEFAULT_CHARSET
    Font.Color = {COLOR}
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [{STYLE}]
    ParentFont = False";

const CONSTRAINTS_FULL: &str = "\
    Constraints.MaxHeight = 600
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9";

const CONSTRAINTS_LINE: &str = "\
    Constraints.MinHeight = 9
    Constraints.MinWidth = 9";

fn font_block(color: &str, style: &str) -> String {
    FONT_BLOCK.replace("{COLOR}", color).replace("{STYLE}", style)
}

/// Estado mutavel do builder DFM.
pub struct DfmBuilder {
    line_counter: u32,
    connector_counter: u32,
    parts: Vec<String>,
}

impl DfmBuilder {
    pub fn new() -> Self {
        Self {
            line_counter: 0,
            connector_counter: 0,
            parts: Vec::with_capacity(256),
        }
    }

    fn next_line(&mut self) -> String {
        self.line_counter += 1;
        format!("FlowLine{}", self.line_counter)
    }

    fn next_connector(&mut self) -> String {
        self.connector_counter += 1;
        format!("FlowConnector{}", self.connector_counter)
    }

    /// Gera DFM completo de uma regra.
    pub fn build(&mut self, spec: &RuleSpec) -> String {
        let first_line = self.next_line();
        let first_comp_top = Layout::START_TOP + Layout::START_H + Layout::FIRST_GAP;
        let start_bottom = Layout::START_TOP + Layout::START_H;
        let start_left = Layout::CENTER - Layout::START_W / 2;
        let comp_left = Layout::CENTER - Layout::EXPR_W / 2;

        let first_comp_name = if let Some(step) = spec.passos.first() {
            step_name(step)
        } else {
            "fimDoFluxo".into()
        };

        let params_str = spec.parametros.iter()
            .map(|p| format!("{},{},{},", p.nome, p.tipo, p.tamanho))
            .collect::<Vec<_>>().join(";");

        let vars_str = spec.variaveis.iter()
            .map(|v| format!("{},{},{},", v.nome, v.tipo, v.tamanho))
            .collect::<Vec<_>>().join(";");

        // FlowStart
        self.parts.push(flow_start(
            "FlowStart1", start_left, Layout::START_TOP,
            &first_line, &vars_str, &params_str,
        ));

        // Linha Start → primeiro componente
        self.parts.push(seq_line(
            &first_line, start_bottom, first_comp_top,
            "FlowStart1", &first_comp_name,
            Layout::CENTER, "psSolid",
        ));

        // Passos
        let (last_line, last_bottom, last_comp, last_cx, _terminal) =
            self.build_steps(&spec.passos, comp_left, first_comp_top, &first_line, Layout::CENTER);

        // FlowEnd — reusar last_line (o OutputNames do ultimo passo) em vez de alocar novo
        let end_top = last_bottom + Layout::FIRST_GAP + 20;
        let end_style = if last_comp.starts_with("FlowConnector") { "psDash" } else { "psSolid" };

        self.parts.push(seq_line(
            &last_line, last_bottom, end_top,
            &last_comp, "fimDoFluxo",
            last_cx, end_style,
        ));

        let end_left = last_cx - Layout::END_W / 2;
        let return_var = if !spec.retorno_tipo.is_empty() {
            spec.variaveis.first().map(|v| v.nome.as_str()).unwrap_or("")
        } else {
            ""
        };

        self.parts.push(flow_end(
            "fimDoFluxo", end_left, end_top,
            &last_line, return_var, &spec.retorno_tipo,
        ));

        let body = self.parts.join("\n");
        format!("object FlowSubModel1: TFlowSubModel\n{body}\nend\n")
    }

    /// Constroi DFM dos passos recursivamente.
    ///
    /// Retorna (ultimo_line, bottom, nome_comp, center_x, terminal).
    fn build_steps(
        &mut self,
        steps: &[Step],
        comp_left: i32,
        mut top: i32,
        prev_line: &str,
        center_x: i32,
    ) -> (String, i32, String, i32, bool) {
        let mut last_comp = String::new();
        let mut last_bottom = top;
        let mut last_cx = center_x;
        let mut terminal = false;
        let mut current_prev = prev_line.to_string();

        for (i, step) in steps.iter().enumerate() {
            let next_name = steps.get(i + 1).map(|s| step_name(s));

            match step {
                Step::Expressao { nome, descricao, funcao, nome_amigavel, params, retorno, tipo_retorno } => {
                    let out_line = self.next_line();
                    let expr_xml = build_expression_xml(funcao, nome_amigavel, params);
                    let diag_xml = build_diagram_xml(funcao, tipo_retorno, params);
                    let text = build_text_prop(nome_amigavel, params);

                    self.parts.push(flow_expression(
                        nome, comp_left, top,
                        &current_prev, &out_line,
                        descricao, &text, &expr_xml, &diag_xml, retorno,
                    ));

                    let comp_bottom = top + Layout::EXPR_H;

                    if let Some(ref nn) = next_name {
                        let next_top = top + Layout::STEP_SPACING;
                        self.parts.push(seq_line(
                            &out_line, comp_bottom, next_top,
                            nome, nn, center_x, "psSolid",
                        ));
                    }

                    current_prev = out_line;
                    last_comp = nome.clone();
                    last_bottom = comp_bottom;
                    last_cx = center_x;
                    terminal = false;
                    top += Layout::STEP_SPACING;
                }

                Step::Atividade { nome, activity_id, object_name, real_name, params, description } => {
                    let out_line = self.next_line();
                    let desc = if description.is_empty() { object_name } else { description };
                    self.parts.push(flow_activity(
                        nome, comp_left, top,
                        &current_prev, &out_line, desc,
                        *activity_id, object_name, real_name, params,
                    ));

                    let comp_bottom = top + Layout::ACT_H;

                    if let Some(ref nn) = next_name {
                        let next_top = top + Layout::STEP_SPACING;
                        self.parts.push(seq_line(
                            &out_line, comp_bottom, next_top,
                            nome, nn, center_x, "psSolid",
                        ));
                    }

                    current_prev = out_line;
                    last_comp = nome.clone();
                    last_bottom = comp_bottom;
                    last_cx = center_x;
                    terminal = next_name.is_none();
                    top += Layout::STEP_SPACING;
                }

                Step::Subrotina { nome, rule_name, rule_id, params, return_var, description } => {
                    let out_line = self.next_line();
                    let desc = if description.is_empty() { rule_name } else { description };

                    self.parts.push(flow_subroutine(
                        nome, comp_left, top,
                        &current_prev, &out_line,
                        desc,
                        *rule_id, rule_name, params, return_var,
                    ));

                    let comp_bottom = top + Layout::SUB_H;

                    if let Some(ref nn) = next_name {
                        let next_top = top + Layout::STEP_SPACING;
                        self.parts.push(seq_line(
                            &out_line, comp_bottom, next_top,
                            nome, nn, center_x, "psSolid",
                        ));
                    }

                    current_prev = out_line;
                    last_comp = nome.clone();
                    last_bottom = comp_bottom;
                    last_cx = center_x;
                    terminal = false;
                    top += Layout::STEP_SPACING;
                }

                Step::Decisao { nome, descricao, funcao, nome_amigavel, params, sim, nao } => {
                    let nao_line = self.next_line();
                    let sim_line = self.next_line();

                    let expr_xml = build_expression_xml(funcao, nome_amigavel, params);
                    let diag_xml = build_diagram_xml(funcao, "Lógico", params);

                    let output_names = format!("{};{}", nao_line, sim_line);
                    self.parts.push(flow_decision(
                        nome, comp_left, top,
                        &current_prev, &output_names,
                        descricao, &expr_xml, &diag_xml,
                    ));

                    let dec_bottom = top + Layout::DEC_H;
                    let sim_cx = center_x - Layout::SIM_OFFSET;
                    let sim_comp_left = sim_cx - Layout::EXPR_W / 2;

                    // Branch SIM
                    let sim_last_line;
                    let sim_last_bottom;
                    let sim_last_comp;

                    if !sim.is_empty() {
                        let sim_target_name = step_name(&sim[0]);
                        let sim_line_left = sim_comp_left + Layout::EXPR_W - 20;
                        let sim_line_w = (comp_left + 20 - sim_line_left).max(40);
                        self.parts.push(flow_line(
                            &sim_line, sim_line_left, top + 10,
                            sim_line_w, 41,
                            nome, &sim_target_name,
                            "SIM", true, "psSolid",
                        ));

                        let result = self.build_steps(sim, sim_comp_left, top, &sim_line, sim_cx);
                        sim_last_line = result.0;
                        sim_last_bottom = result.1;
                        sim_last_comp = result.2;
                    } else {
                        sim_last_line = sim_line.clone();
                        sim_last_bottom = dec_bottom;
                        sim_last_comp = nome.clone();
                    }

                    // Branch NAO
                    let nao_top = top + Layout::STEP_SPACING;
                    let nao_last_line;
                    let nao_last_bottom;
                    let nao_last_comp;
                    let nao_last_top;

                    if !nao.is_empty() {
                        let nao_target_name = step_name(&nao[0]);
                        let nao_line_left = Layout::CENTER - Layout::LINE_W / 2;
                        let nao_line_top = dec_bottom - 20;
                        let nao_line_h = (nao_top + 20 - nao_line_top).max(20);
                        self.parts.push(flow_line(
                            &nao_line, nao_line_left, nao_line_top,
                            Layout::DEC_W / 2 - 11, nao_line_h,
                            nome, &nao_target_name,
                            "NÃO", false, "psSolid",
                        ));

                        let result = self.build_steps(nao, comp_left, nao_top, &nao_line, center_x);
                        nao_last_line = result.0;
                        nao_last_bottom = result.1;
                        nao_last_comp = result.2;
                        nao_last_top = nao_top + (nao.len() as i32 - 1) * Layout::STEP_SPACING;
                    } else {
                        nao_last_line = nao_line.clone();
                        nao_last_bottom = dec_bottom;
                        nao_last_comp = nome.clone();
                        nao_last_top = top;
                    }

                    // Connector
                    let connector_name = self.next_connector();
                    let conn_top = sim_last_bottom.max(nao_last_top + 14) + 30;
                    let conn_left = sim_cx - Layout::CONN_W / 2;
                    let connector_out = self.next_line();

                    let mut conn_inputs = Vec::new();

                    // Reconexao NAO → Connector (reusar nao_last_line do build_steps)
                    if !nao.is_empty() {
                        let nao_reconn_left = conn_left + 10;
                        let nao_reconn_w = (comp_left + 20 - nao_reconn_left).max(40);
                        self.parts.push(flow_line(
                            &nao_last_line, nao_reconn_left, nao_last_top + 10,
                            nao_reconn_w, 40,
                            &nao_last_comp, &connector_name,
                            "", false, "psSolid",
                        ));
                        conn_inputs.push(nao_last_line);
                    } else {
                        let nao_line_left = Layout::CENTER - Layout::LINE_W / 2;
                        let nao_line_top = dec_bottom - 20;
                        let nao_line_h = (conn_top + 20 - nao_line_top).max(20);
                        self.parts.push(flow_line(
                            &nao_line, nao_line_left, nao_line_top,
                            Layout::LINE_W, nao_line_h,
                            nome, &connector_name,
                            "NÃO", false, "psSolid",
                        ));
                        conn_inputs.push(nao_line.clone());
                    }

                    // Reconexao SIM → Connector (reusar sim_last_line do build_steps)
                    if !sim.is_empty() {
                        let sim_reconn_top = sim_last_bottom - 20;
                        let sim_reconn_h = (conn_top + 20 - sim_reconn_top).max(20);
                        self.parts.push(flow_line(
                            &sim_last_line, sim_cx - Layout::LINE_W / 2,
                            sim_reconn_top, Layout::LINE_W, sim_reconn_h,
                            &sim_last_comp, &connector_name,
                            "", false, "psDash",
                        ));
                        conn_inputs.push(sim_last_line);
                    } else {
                        let sim_line_top = top + 10;
                        let sim_line_h = (conn_top + 20 - sim_line_top).max(20);
                        self.parts.push(flow_line(
                            &sim_line, sim_comp_left + Layout::EXPR_W - 20, sim_line_top,
                            80, sim_line_h,
                            nome, &connector_name,
                            "SIM", true, "psDash",
                        ));
                        conn_inputs.push(sim_line.clone());
                    }

                    self.parts.push(flow_connector(
                        &connector_name, conn_left, conn_top,
                        &conn_inputs.join(";"), &connector_out,
                    ));

                    let conn_bottom = conn_top + Layout::CONN_H;

                    if let Some(ref nn) = next_name {
                        let conn_next_top = conn_bottom + Layout::STEP_SPACING - Layout::CONN_H;
                        self.parts.push(seq_line(
                            &connector_out, conn_bottom, conn_next_top,
                            &connector_name, nn, sim_cx, "psDash",
                        ));
                    }

                    current_prev = connector_out;
                    last_comp = connector_name;
                    last_bottom = conn_bottom;
                    last_cx = sim_cx;
                    terminal = false;
                    top = conn_bottom + Layout::STEP_SPACING - Layout::CONN_H;
                }
            }
        }

        (current_prev, last_bottom, last_comp, last_cx, terminal)
    }
}

// ---------------------------------------------------------------------------
// Helpers para gerar blocos DFM individuais
// ---------------------------------------------------------------------------

fn step_name(step: &Step) -> String {
    match step {
        Step::Expressao { nome, .. } => nome.clone(),
        Step::Decisao { nome, .. } => nome.clone(),
        Step::Subrotina { nome, .. } => nome.clone(),
        Step::Atividade { nome, .. } => nome.clone(),
    }
}

fn flow_start(name: &str, left: i32, top: i32, output_names: &str, vars: &str, params: &str) -> String {
    let mut s = format!(
        "  object {name}: TFlowStart\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 38\n    Height = 38\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = False\n\
         \x20   OutputNames = '{output_names}'\n\
         \x20   Description = 'Inicio'\n",
        font = font_block("clWhite", "fsBold"),
    );
    if !params.is_empty() {
        s.push_str(&format!("    InputParams = {}\n", to_delphi_prop(params)));
    }
    if !vars.is_empty() {
        s.push_str(&format!("    Variables =\n      {}\n", to_delphi_prop(vars)));
    }
    s.push_str("    WorkFormCod = -1\n  end");
    s
}

fn flow_end(name: &str, left: i32, top: i32, input_names: &str, return_var: &str, return_type: &str) -> String {
    let mut s = format!(
        "  object {name}: TFlowEnd\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 39\n    Height = 39\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = False\n\
         \x20   InputNames = '{input_names}'\n\
         \x20   Description = 'Fim'\n",
        font = font_block("clWhite", "fsBold"),
    );
    if !return_var.is_empty() {
        // DiagramXml e Expression para retorno omitidos por brevidade no skeleton
        s.push_str(&format!("    Expression = '<VARIABLE NAME=\"{return_var}\"/>'\n"));
        s.push_str(&format!("    Text = '@{return_var}'\n"));
        let rt = if return_type.is_empty() { "Variante" } else { return_type };
        s.push_str(&format!("    OutPutParam = '{rt},'\n"));
    }
    s.push_str("  end");
    s
}

fn flow_expression(
    name: &str, left: i32, top: i32,
    input: &str, output: &str,
    description: &str, text: &str,
    expression: &str, diagram_xml: &str,
    return_var: &str,
) -> String {
    let desc = to_delphi_prop(description);
    let text_p = to_delphi_prop(text);
    let expr_inline = delphi_inline(expression);
    let diag_inline = delphi_inline(diagram_xml);
    let ret = if return_var.is_empty() {
        String::new()
    } else {
        format!("    ReturnVar = '{return_var}'\n")
    };

    format!(
        "  object {name}: TFlowExpression\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 150\n    Height = 59\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = True\n\
         \x20   InputNames = '{input}'\n\
         \x20   OutputNames = '{output}'\n\
         \x20   Description = {desc}\n\
         \x20   Text = {text_p}\n\
         {ret}\
         \x20   Expression =\n      {expr_inline}\n\
         \x20   DiagramXml =\n      {diag_inline}\n\
         \x20 end",
        font = font_block("clBlack", ""),
    )
}

fn flow_decision(
    name: &str, left: i32, top: i32,
    input: &str, output: &str,
    description: &str, expression: &str, diagram_xml: &str,
) -> String {
    let desc = to_delphi_prop(description);
    let expr_inline = delphi_inline(expression);
    let diag_inline = delphi_inline(diagram_xml);

    format!(
        "  object {name}: TFlowDecision\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 150\n    Height = 60\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = True\n\
         \x20   InputNames = '{input}'\n\
         \x20   OutputNames = '{output}'\n\
         \x20   Description = {desc}\n\
         \x20   DiagramXml =\n      {diag_inline}\n\
         \x20   Expression =\n      {expr_inline}\n\
         \x20   Loop = False\n\
         \x20 end",
        font = font_block("clBlack", ""),
    )
}

fn flow_connector(name: &str, left: i32, top: i32, inputs: &str, outputs: &str) -> String {
    format!(
        "  object {name}: TFlowConnector\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 30\n    Height = 30\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = False\n\
         \x20   InputNames = '{inputs}'\n\
         \x20   OutputNames = '{outputs}'\n\
         \x20 end",
        font = font_block("clBlack", ""),
    )
}

fn flow_subroutine(
    name: &str, left: i32, top: i32,
    input: &str, output: &str,
    description: &str, rule_id: i32, rule_name: &str,
    _params: &[SubRoutineParam], return_var: &str,
) -> String {
    let desc = to_delphi_prop(description);
    let obj = to_delphi_prop(rule_name);
    let ret = if return_var.is_empty() {
        String::new()
    } else {
        format!("    Return = '{return_var}'\n")
    };

    format!(
        "  object {name}: TFlowSubRoutine\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 150\n    Height = 60\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = False\n\
         \x20   InputNames = '{input}'\n\
         \x20   OutputNames = '{output}'\n\
         \x20   Description = {desc}\n\
         \x20   Id = {rule_id}\n\
         \x20   InputDiagramXML = <>\n\
         \x20   InputExpression = <>\n\
         \x20   InputText = <>\n\
         {ret}\
         \x20   ObjectName = {obj}\n\
         \x20   RealName = 'CALLRULE'\n\
         \x20 end",
        font = font_block("clBlack", ""),
    )
}

fn flow_activity(
    name: &str, left: i32, top: i32,
    input: &str, output: &str, description: &str,
    activity_id: i32, object_name: &str, real_name: &str,
    _params: &[SubRoutineParam],
) -> String {
    let desc = to_delphi_prop(description);
    let obj = to_delphi_prop(object_name);

    format!(
        "  object {name}: TFlowActivity\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = 150\n    Height = 60\n\
         {CONSTRAINTS_FULL}\n\
         {font}\n\
         \x20   ChangeDescription = False\n\
         \x20   InputNames = '{input}'\n\
         \x20   OutputNames = '{output}'\n\
         \x20   Description = {desc}\n\
         \x20   Id = {activity_id}\n\
         \x20   ObjectName = {obj}\n\
         \x20   RealName = '{real_name}'\n\
         \x20   InputDiagramXML = <>\n\
         \x20   InputExpression = <>\n\
         \x20   InputText = <>\n\
         \x20 end",
        font = font_block("clBlack", ""),
    )
}

fn seq_line(
    name: &str, source_bottom: i32, target_top: i32,
    from_comp: &str, to_comp: &str,
    center_x: i32, style: &str,
) -> String {
    let line_left = center_x - Layout::LINE_W / 2;
    let line_top = source_bottom - 20;
    let line_h = (target_top + 20 - line_top).max(20);
    flow_line(name, line_left, line_top, Layout::LINE_W, line_h,
              from_comp, to_comp, "", false, style)
}

fn flow_line(
    name: &str, left: i32, top: i32, width: i32, height: i32,
    input: &str, output: &str,
    description: &str, decision: bool, style: &str,
) -> String {
    let desc_line = if description.is_empty() {
        String::new()
    } else {
        format!("    Description = {}\n", to_delphi_prop(description))
    };

    format!(
        "  object {name}: TFlowLine\n\
         \x20   Left = {left}\n    Top = {top}\n\
         \x20   Width = {width}\n    Height = {height}\n\
         \x20   Color = 9079434\n\
         {CONSTRAINTS_LINE}\n\
         {font}\n\
         \x20   ChangeDescription = False\n\
         \x20   InputNames = '{input}'\n\
         \x20   OutputNames = '{output}'\n\
         {desc_line}\
         \x20   Region = 0\n\
         \x20   Style = {style}\n\
         \x20   Decision = {decision}\n\
         \x20 end",
        decision = if decision { "True" } else { "False" },
        font = font_block("clBlack", ""),
    )
}

// ---------------------------------------------------------------------------
// Expression XML e DiagramXml builders
// ---------------------------------------------------------------------------

pub fn build_expression_xml(funcao: &str, nome_amigavel: &str, params: &[StepParam]) -> String {
    let name_esc = xml_space(nome_amigavel);
    let params_xml: String = params.iter()
        .map(|p| param_expression_xml(p))
        .collect::<Vec<_>>()
        .join("\n");

    if params.is_empty() {
        format!("<FUNCTION NAME=\"{name_esc}\" REALNAME=\"{funcao}\">\n</FUNCTION>")
    } else {
        format!(
            "<FUNCTION NAME=\"{name_esc}\" REALNAME=\"{funcao}\">\n\
             <PARAMS>\n{params_xml}\n</PARAMS>\n</FUNCTION>"
        )
    }
}

pub fn build_diagram_xml(funcao: &str, tipo_retorno: &str, params: &[StepParam]) -> String {
    let params_inner: String = params.iter().enumerate()
        .map(|(i, p)| param_diagram_xml(p, i as u32 + 1))
        .collect::<Vec<_>>()
        .join("\n");

    let params_block = if params.is_empty() {
        String::new()
    } else {
        format!("\n<PARAMS>\n{params_inner}\n</PARAMS>")
    };

    format!(
        "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<ROOT>\n\
         <TObjFunction>\n<ID>0</ID>\n<NOME>FUNCTION</NOME>\n\
         <TEXT>{funcao}</TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{tipo_retorno}</TIPO>\n\
         <INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{MKR_VERSION}</MKR_VERSION>\
         {params_block}\n</TObjFunction>\n</ROOT>\n"
    )
}

fn build_text_prop(nome_amigavel: &str, params: &[StepParam]) -> String {
    let args: Vec<String> = params.iter().map(|p| match p {
        StepParam::Variavel { nome, .. } => format!("@{nome}"),
        StepParam::Constante { valor, .. } => valor.as_deref().unwrap_or("NULL").into(),
        StepParam::Sql { .. } => "SQL CONSULTA".into(),
        StepParam::Funcao { nome_amigavel, .. } => format!("{nome_amigavel}(...)"),
    }).collect();
    format!("{}({})", nome_amigavel, args.join(", "))
}

fn param_expression_xml(p: &StepParam) -> String {
    match p {
        StepParam::Variavel { nome, .. } => {
            format!("<VARIABLE NAME=\"{nome}\"/>")
        }
        StepParam::Constante { valor, tipo_dado, guid, field_index } => {
            let is_null = valor.is_none();
            let null_str = if is_null { "TRUE" } else { "FALSE" };
            let val = valor.as_deref().map(|v| xml_escape_content(v)).unwrap_or_default();
            let idx_attr = if *field_index >= 0 { format!(" INDEX = \"{field_index}\"") } else { String::new() };
            let guid_attr = if guid.is_empty() { String::new() } else { format!(" GUID = \"{guid}\"") };
            format!("<CONSTANT TYPE=\"{tipo_dado}\" NULL=\"{null_str}\"{idx_attr}{guid_attr} >{val}</CONSTANT>")
        }
        StepParam::Sql { sql, binds } => {
            let sql_esc = sql.replace(' ', "&#x20;");
            let binds_xml: String = binds.iter().map(|b| {
                format!("\n<DEFINE NAME=\"{}\">\n<VARIABLE NAME=\"{}\"/>\n</DEFINE>", b.nome, b.variavel)
            }).collect();
            format!(
                "<CONSTANT TYPE=\"SQL&#x20;Consulta\" NULL=\"FALSE\"  ><PSQL>\n\
                 <COMMAND>\n{sql_esc}\n\n\n/*WHERE_ADD*/\n/*ORDER_NEW*/\n</COMMAND>\n\
                 <PARAMS>{binds_xml}\n</PARAMS>\n</PSQL>\n</CONSTANT>"
            )
        }
        StepParam::Funcao { funcao, nome_amigavel, params, .. } => {
            let inner: String = params.iter()
                .map(|sp| param_expression_xml(sp))
                .collect::<Vec<_>>()
                .join("\n");
            let name_esc = xml_space(nome_amigavel);
            format!(
                "<FUNCTION NAME=\"{name_esc}\" REALNAME=\"{funcao}\">\n\
                 <PARAMS>\n{inner}\n</PARAMS>\n</FUNCTION>"
            )
        }
    }
}

fn param_diagram_xml(p: &StepParam, id: u32) -> String {
    match p {
        StepParam::Variavel { nome, tipo_dado } => {
            format!(
                "<TObjVariable>\n<ID>{id}</ID>\n<NOME>VARIABLE</NOME>\n\
                 <TEXT>{nome}</TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{tipo_dado}</TIPO>\n\
                 <INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{MKR_VERSION}</MKR_VERSION>\n\
                 </TObjVariable>"
            )
        }
        StepParam::Constante { valor, tipo_dado, guid, field_index } => {
            let is_null = valor.is_none();
            let null_str = if is_null { "TRUE" } else { "FALSE" };
            let val = valor.as_deref().map(|v| xml_escape_content(v)).unwrap_or_default();
            let guid_val = if guid.is_empty() { "" } else { guid.as_str() };
            format!(
                "<TObjConst>\n<ID>{id}</ID>\n<NOME>CONSTANT</NOME>\n\
                 <TEXT></TEXT>\n<SQL>FALSE</SQL>\n<TIPO>{tipo_dado}</TIPO>\n\
                 <INCOMPATIVEL>FALSE</INCOMPATIVEL>\n<MKR_VERSION>{MKR_VERSION}</MKR_VERSION>\n\
                 <VALOR>{val}</VALOR>\n<DMLTYPE>dtSelect</DMLTYPE>\n\
                 <DIAGRAMXML></DIAGRAMXML>\n<NULO>{null_str}</NULO>\n\
                 <FIELDINDEX>{field_index}</FIELDINDEX>\n<GUID>{guid_val}</GUID>\n\
                 <SPECIALCODE></SPECIALCODE>\n</TObjConst>"
            )
        }
        _ => String::new(), // SQL e Funcao delegados por brevidade
    }
}

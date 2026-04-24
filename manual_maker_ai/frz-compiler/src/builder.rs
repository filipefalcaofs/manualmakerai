//! Orquestrador: monta o XML final do FRZ a partir da spec.

use crate::dfm::DfmBuilder;
use crate::encoder::{encode_dfm_b64, encode_script_b64, write_frz, xml_escape_attr, xml_escape_content};
use crate::script::build_script;
use crate::spec::{DataPacketSpec, EntityAttribute, EntitySpec, FormField, FormSpec, FrzSpec, FunctionSpec, RuleSpec, TableSpec};

/// Constroi e grava um FRZ completo.
pub fn compile_frz(spec: &FrzSpec, output_path: &str) -> Result<FrzReport, String> {
    let xml = build_xml(spec)?;
    let xml_crlf = xml.replace("\r\n", "\n").replace('\n', "\r\n");
    let xml_bytes = encode_iso_8859_1(&xml_crlf);

    write_frz(&xml_bytes, output_path)
        .map_err(|e| format!("Erro ao gravar FRZ: {e}"))?;

    let mut report = FrzReport {
        path: output_path.into(),
        xml_size: xml_bytes.len(),
        rules: Vec::new(),
        functions: Vec::new(),
        forms: Vec::new(),
        tables: Vec::new(),
        entities: Vec::new(),
        datapackets: Vec::new(),
    };

    for func in &spec.funcoes {
        let compat = if func.compatibilidade == "1" { "Cliente" }
            else if func.compatibilidade == "2" { "Servidor" }
            else { "Dual" };
        report.functions.push(format!(
            "{} [{}] (cod={}, {})",
            func.nome_real, compat, func.codigo, func.resumo(),
        ));
    }

    for rule in &spec.regras {
        let dest = if rule.destino == 2 { "Servidor" } else { "Cliente" };
        report.rules.push(format!(
            "{} [{}] (cod={}, {} params, {} passos)",
            rule.nome, dest, rule.codigo, rule.parametros.len(), rule.passos.len(),
        ));
    }

    for form in spec.all_forms() {
        let tipo = if form.navegacao { "CRUD" } else { "Template" };
        report.forms.push(format!(
            "{} [{}] ({} campos, {}x{})",
            form.descricao, tipo, form.campos.len(), form.tamanho, form.altura,
        ));
    }

    for table in &spec.tabelas {
        report.tables.push(format!("{} ({} campos)", table.nome, table.campos.len()));
    }

    for ent in &spec.entidades {
        let pk_cols: Vec<&str> = ent.chaves.iter()
            .filter(|k| k.primary)
            .flat_map(|k| k.colunas.iter().map(|c| c.as_str()))
            .collect();
        report.entities.push(format!(
            "{} ({} colunas, PK: {})",
            ent.nome, ent.atributos.len(),
            if pk_cols.is_empty() { "nenhuma".to_string() } else { pk_cols.join(", ") },
        ));
    }

    for dp in &spec.dados {
        report.datapackets.push(format!(
            "{} ({} linhas)", dp.entity_name, dp.linhas.len(),
        ));
    }

    Ok(report)
}

pub struct FrzReport {
    pub path: String,
    pub xml_size: usize,
    pub rules: Vec<String>,
    pub functions: Vec<String>,
    pub forms: Vec<String>,
    pub tables: Vec<String>,
    pub entities: Vec<String>,
    pub datapackets: Vec<String>,
}

fn build_xml(spec: &FrzSpec) -> Result<String, String> {
    let mut xml = String::with_capacity(1024 * 64);

    xml.push_str("<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>\n");
    xml.push_str("<fmaker version=\"2.3\" maker_version=\"6.1.0.14\"  xml:space=\"preserve\">\n");
    xml.push_str("    <global>\n");

    // ENTITY_SCHEMA
    if !spec.entidades.is_empty() {
        xml.push_str(&build_entity_schema_xml(&spec.entidades));
    }

    // Tables (Data Dictionary legado)
    if !spec.tabelas.is_empty() {
        xml.push_str(&build_tables_xml(&spec.tabelas));
        xml.push_str("    <tempo SESSION=\"DATADICTIONARY\">00:00</tempo>\n");
    }

    // Datapackets
    if !spec.dados.is_empty() {
        xml.push_str(&build_datapackets_xml(&spec.dados, &spec.entidades));
    }

    // Functions (funcoes customizadas)
    if !spec.funcoes.is_empty() {
        xml.push_str(&build_functions_xml(&spec.funcoes));
    }

    // Rules
    xml.push_str("        <rules>\n");
    for rule in &spec.regras {
        xml.push_str(&build_rule_xml(rule)?);
    }
    xml.push_str("\n        </rules>\n");

    xml.push_str("    </global>\n");

    // Systems (forms)
    xml.push_str(&build_systems_xml(spec));

    xml.push_str("\n<tempo SESSION=\"ALL\">00:01</tempo>\n");
    xml.push_str(&format!("<datageracao>{}</datageracao>\n", now_formatted()));
    xml.push_str("</fmaker>\n");

    Ok(xml)
}

fn build_rule_xml(rule: &RuleSpec) -> Result<String, String> {
    let mut dfm_builder = DfmBuilder::new();
    let dfm = dfm_builder.build(rule);
    let script = build_script(rule);

    let dfm_b64 = encode_dfm_b64(&dfm);
    let script_b64 = encode_script_b64(&script);

    let nome_esc = xml_escape_attr(&rule.nome);
    let desc_esc = xml_escape_attr(if rule.descricao.is_empty() { &rule.nome } else { &rule.descricao });

    let params_str = rule.parametros.iter()
        .map(|p| format!("{},{},{},", p.nome, p.tipo, p.tamanho))
        .collect::<Vec<_>>().join(";");

    let vars_str = rule.variaveis.iter()
        .map(|v| format!("{},{},{},", v.nome, v.tipo, v.tamanho))
        .collect::<Vec<_>>().join(";");

    Ok(format!(
        "            <rule REG_NOME=\"{nome_esc}\" REG_COD=\"{cod}\">\n\
         \x20               <property name=\"REG_COD\">{cod}</property>\n\
         \x20               <property name=\"REG_NOME\">{nome_esc}</property>\n\
         \x20               <property name=\"REG_DESCRICAO\">{desc_esc}</property>\n\
         \x20               <property name=\"REG_PARAMS\">{params_esc}</property>\n\
         \x20               <property name=\"REG_VARIAVEIS\">{vars_esc}</property>\n\
         \x20               <property name=\"REG_PARAMS_OUT\"></property>\n\
         \x20               <property name=\"REG_DATA\"></property>\n\
         \x20               <property name=\"REG_HORA\"></property>\n\
         \x20               <property name=\"REG_COMPILADA\"></property>\n\
         \x20               <property name=\"REG_DESTINO\">{destino}</property>\n\
         \x20               <property name=\"REG_HASH\"></property>\n\
         \x20               <property name=\"REG_INTERFACE\" binary-encoded=\"True\"><![CDATA[{dfm_b64}]]></property>\n\
         \x20               <property name=\"REG_SCRIPT\" binary-encoded=\"True\"><![CDATA[{script_b64}]]></property>\n\
         \x20               <property name=\"CAT_PATH\"><![CDATA[{cat}]]></property>\n\
         \x20           </rule>",
        cod = rule.codigo,
        params_esc = xml_escape_attr(&params_str),
        vars_esc = xml_escape_attr(&vars_str),
        destino = rule.destino,
        cat = rule.categoria,
    ))
}

fn build_functions_xml(funcs: &[FunctionSpec]) -> String {
    let mut xml = String::from("        <functions>\n");
    for func in funcs {
        let nome = if func.nome.is_empty() { &func.nome_real } else { &func.nome };
        let nome_esc = xml_escape_attr(nome);
        let desc_esc = xml_escape_attr(&func.descricao);
        let params_esc = xml_escape_attr(&func.params);
        let retorno_esc = xml_escape_attr(&func.retorno);
        let resumo_esc = xml_escape_attr(&func.resumo());
        let srv_esc = xml_escape_attr(&func.conteudo_servidor);
        let cli_esc = xml_escape_attr(&func.conteudo_cliente);
        let banco_esc = xml_escape_attr(&func.conteudo_banco);
        let compat_esc = xml_escape_attr(&func.compatibilidade);
        let versao_esc = xml_escape_attr(&func.versao);

        xml.push_str(&format!(
            "            <function FUN_NOME_REAL=\"{real}\" FUN_COD=\"{cod}\">\n\
             \x20               <property name=\"FUN_COD\">{cod}</property>\n\
             \x20               <property name=\"FUN_NOME\">{nome_esc}</property>\n\
             \x20               <property name=\"FUN_DESCRICAO\">{desc_esc}</property>\n\
             \x20               <property name=\"FUN_NOME_REAL\">{real}</property>\n\
             \x20               <property name=\"FUN_PARAMS\">{params_esc}</property>\n\
             \x20               <property name=\"FUN_RETORNO\">{retorno_esc}</property>\n\
             \x20               <property name=\"FUN_TIPO\">{tipo}</property>\n\
             \x20               <property name=\"FUN_COMPATIBILIDADE\">{compat_esc}</property>\n\
             \x20               <property name=\"FUN_RESUMO\">{resumo_esc}</property>\n\
             \x20               <property name=\"FUN_CONTEUDO_SERVIDOR\">{srv_esc}</property>\n\
             \x20               <property name=\"FUN_CONTEUDO_CLIENTE\">{cli_esc}</property>\n\
             \x20               <property name=\"FUN_CONTEUDO_BANCO\">{banco_esc}</property>\n\
             \x20               <property name=\"FUN_VERSAO\">{versao_esc}</property>\n\
             \x20               <property name=\"CAT_PATH\"><![CDATA[{cat}]]></property>\n\
             \x20           </function>\n",
            real = func.nome_real,
            cod = func.codigo,
            tipo = func.tipo,
            cat = func.categoria,
        ));
    }
    xml.push_str("        </functions>\n");
    xml
}

fn build_tables_xml(tables: &[TableSpec]) -> String {
    let mut xml = String::from("        <tables>\n");
    for tbl in tables {
        let desc = xml_escape_attr(&tbl.descricao);
        xml.push_str(&format!("            <table TAB_NOME=\"{}\">\n", tbl.nome));
        xml.push_str(&format!("                <property name=\"TAB_DESCRICAO\">{desc}</property>\n"));
        for fld in &tbl.campos {
            let fd = xml_escape_attr(&fld.descricao);
            xml.push_str(&format!("                <field CMP_NOME=\"{}\">\n", fld.nome));
            xml.push_str(&format!("                    <property name=\"CMP_DESCRICAO\">{fd}</property>\n"));
            xml.push_str(&format!("                    <property name=\"CMP_VALORPADRAO\">{}</property>\n", fld.valor_padrao));
            xml.push_str(&format!("                    <property name=\"TPD_CODIGO\">{}</property>\n", fld.tipo));
            xml.push_str("                </field>\n");
        }
        xml.push_str("            </table>\n");
    }
    xml.push_str("        </tables>\n");
    xml
}

fn build_entity_schema_xml(entities: &[EntitySpec]) -> String {
    let mut xml = String::from("        <ENTITY_SCHEMA>\n");
    for ent in entities {
        xml.push_str(&format!(
            "\t<ENTITY NAME=\"{}\" FRIENDLY_NAME=\"{}\" FORM=\"{}\">\n",
            ent.nome, ent.friendly(), ent.form_name(),
        ));
        for attr in &ent.atributos {
            let gen = if attr.generated { "true" } else { "false" };
            let null = if attr.nullable { "true" } else { "false" };
            let needs_length = attr.tipo != "boolean" && attr.tipo != "date";
            let length_attr = if needs_length {
                format!(" LENGTH=\"{}\"", attr.tamanho)
            } else {
                String::new()
            };
            xml.push_str(&format!(
                "\t\t<ATTRIBUTE GENERATED=\"{gen}\" NAME=\"{}\" FRIENDLY_NAME=\"{}\" \
                 NULLABLE=\"{null}\" TYPE=\"{}\"{}>\n",
                attr.nome, attr.friendly(), attr.tipo, length_attr,
            ));
            let default_val = if attr.generated {
                String::new()
            } else if !attr.default.is_empty() {
                attr.default.clone()
            } else if !attr.nullable {
                match attr.tipo.as_str() {
                    "integer" => "0".into(),
                    "float" => "0".into(),
                    "boolean" => "false".into(),
                    _ => String::new(),
                }
            } else {
                String::new()
            };
            xml.push_str(&format!("\t\t\t<DEFAULT>{default_val}</DEFAULT>\n"));
            xml.push_str(&format!("\t\t\t<MASK NAME=\"{}\"></MASK>\n", attr.mascara));
            xml.push_str("\t\t</ATTRIBUTE>\n");
        }
        for key in &ent.chaves {
            let unique = if key.unique { "true" } else { "false" };
            let primary = if key.primary { "true" } else { "false" };
            xml.push_str(&format!(
                "\t\t<KEY NAME=\"{}\" UNIQUE=\"{unique}\" PRIMARY=\"{primary}\">\n",
                key.nome,
            ));
            for col in &key.colunas {
                xml.push_str(&format!("\t\t\t<ATTRIBUTE_NAME NAME=\"{col}\"/>\n"));
            }
            xml.push_str("\t\t</KEY>\n");
        }
        xml.push_str("\t</ENTITY>\n");
    }
    xml.push_str("        </ENTITY_SCHEMA>\n");
    xml
}

fn build_datapackets_xml(datapackets: &[DataPacketSpec], entities: &[EntitySpec]) -> String {
    let mut xml = String::from("        <datapackets>\n");
    for dp in datapackets {
        let guid = if dp.guid.is_empty() {
            format!("{{{}}}", uuid::Uuid::new_v4().to_string().to_uppercase())
        } else {
            dp.guid.clone()
        };
        let friendly = if dp.friendly_name.is_empty() {
            dp.entity_name.to_lowercase()
        } else {
            dp.friendly_name.clone()
        };
        let form = if dp.form.is_empty() {
            dp.entity_name.to_lowercase()
        } else {
            dp.form.clone()
        };

        let attrs: Vec<&EntityAttribute> = if let Some(ref a) = dp.atributos {
            a.iter().collect()
        } else {
            entities.iter()
                .find(|e| e.nome == dp.entity_name)
                .map(|e| e.atributos.iter().collect())
                .unwrap_or_default()
        };

        // METADATA
        let mut meta = format!(
            "<METADATA><ENTITY NAME=\"{}\" FRIENDLY_NAME=\"{}\" FORM=\"{}\">",
            dp.entity_name, friendly, form,
        );
        for a in &attrs {
            let needs_length = a.tipo != "boolean" && a.tipo != "date";
            let length_attr = if needs_length {
                format!(" LENGTH=\"{}\"", a.tamanho)
            } else {
                String::new()
            };
            meta.push_str(&format!(
                "<ATTRIBUTE NAME=\"{}\" FRIENDLY_NAME=\"{}\" TYPE=\"{}\"{}/>\n",
                a.nome, a.friendly().to_lowercase(), a.tipo, length_attr,
            ));
        }
        meta.push_str("</ENTITY></METADATA>");

        xml.push_str(&format!("        <DATA ID=\"{guid}\">{meta}\n"));

        if !dp.linhas.is_empty() {
            xml.push_str("<DATASET>\n");
            for row in &dp.linhas {
                xml.push_str("<ROW>");
                for a in &attrs {
                    if let Some(val) = row.get(&a.nome) {
                        match val {
                            serde_json::Value::Null => {
                                xml.push_str(&format!(
                                    "<FIELD NAME=\"{}\" ISNULL=\"true\"/>", a.nome,
                                ));
                            }
                            serde_json::Value::String(s) => {
                                xml.push_str(&format!(
                                    "<FIELD NAME=\"{}\" ISNULL=\"false\">{}</FIELD>",
                                    a.nome, s,
                                ));
                            }
                            other => {
                                xml.push_str(&format!(
                                    "<FIELD NAME=\"{}\" ISNULL=\"false\">{}</FIELD>",
                                    a.nome, other,
                                ));
                            }
                        }
                    } else {
                        xml.push_str(&format!(
                            "<FIELD NAME=\"{}\" ISNULL=\"true\"/>", a.nome,
                        ));
                    }
                }
                xml.push_str("</ROW>\n");
            }
            xml.push_str("</DATASET>\n");
        }

        xml.push_str("</DATA>\n\n");
    }
    xml.push_str("        </datapackets>\n");
    xml
}

fn build_systems_xml(spec: &FrzSpec) -> String {
    let forms = spec.all_forms();
    if forms.is_empty() {
        return "    <system SIS_CODIGO=\"SISTEMA\">\n\
                \x20       <tempo SESSION=\"FORMS\">00:01</tempo>\n\
                \x20   </system>".into();
    }

    let mut by_system: std::collections::HashMap<&str, Vec<&FormSpec>> = std::collections::HashMap::new();
    for form in &forms {
        by_system.entry(&form.sistema).or_default().push(form);
    }

    let mut xml = String::new();
    for (sistema, form_specs) in &by_system {
        xml.push_str(&format!("    <system SIS_CODIGO=\"{sistema}\">\n"));
        for form in form_specs {
            xml.push_str(&build_form_xml(form));
        }
        xml.push_str("        <tempo SESSION=\"FORMS\">00:01</tempo>\n");
        xml.push_str("    </system>");
    }
    xml
}

fn build_form_xml(form: &FormSpec) -> String {
    let guid = if form.guid.is_empty() {
        format!("{{{}}}", uuid::Uuid::new_v4().to_string().to_uppercase())
    } else {
        form.guid.clone()
    };

    let desc_esc = xml_escape_attr(&form.descricao);
    let sql_esc = xml_escape_content(&form.sql_select);

    let crlf = "&#x000D;&#x000A;";
    let sc = "&#x003B;";
    let update = form.sql_update.replace('\n', crlf);
    let grade = form.campos_grade.replace(';', sc);
    let pesq = form.campos_pesquisa.replace(';', sc);

    let mut xml = format!(
        "        <form FRM_CODIGO=\"{cod}\" FRM_GUID=\"{guid}\">\n\
         \x20           <property name=\"IMG_INCLUIR\">1</property>\n\
         \x20           <property name=\"IMG_ALTERAR\">2</property>\n\
         \x20           <property name=\"IMG_EXCLUIR\">8</property>\n\
         \x20           <property name=\"IMG_GRAVAR\">12</property>\n\
         \x20           <property name=\"IMG_CANCELAR\">13</property>\n\
         \x20           <property name=\"IMG_ATUALIZAR\">7</property>\n\
         \x20           <property name=\"IMG_GRAVAR_MAIS\">15</property>\n\
         \x20           <property name=\"IMG_LOG\">16</property>\n\
         \x20           <property name=\"IMG_VALORES_PADRAO\">17</property>\n\
         \x20           <property name=\"IMG_UTILITARIO\">1</property>\n\
         \x20           <property name=\"IMG_SAIR\">11</property>\n\
         \x20           <property name=\"IMG_IMPRIMIR\">10</property>\n\
         \x20           <property name=\"IMG_AJUDA\">14</property>\n\
         \x20           <property name=\"IMG_PROXIMO\">5</property>\n\
         \x20           <property name=\"IMG_ULTIMO\">6</property>\n\
         \x20           <property name=\"IMG_PRIMEIRO\">3</property>\n\
         \x20           <property name=\"IMG_ANTERIOR\">4</property>\n\
         \x20           <property name=\"FRM_DESCRICAO\">{desc_esc}</property>\n\
         \x20           <property name=\"FRM_POSICAOX\">330</property>\n\
         \x20           <property name=\"FRM_POSICAOY\">146</property>\n\
         \x20           <property name=\"FRM_TAMANHO\">{tam}</property>\n\
         \x20           <property name=\"FRM_ALTURA\">{alt}</property>\n\
         \x20           <property name=\"FRM_TIPO_CRIACAO\">0</property>\n\
         \x20           <property name=\"FNT_CAMPOCHAVE\">{chave}</property>\n\
         \x20           <property name=\"FNT_TABELA\">{tabela}</property>\n\
         \x20           <property name=\"FNT_SQLSELECT\">{sql_esc}</property>\n\
         \x20           <property name=\"FNT_SQLINSERT\"></property>\n\
         \x20           <property name=\"FNT_SQLUPDATE\">{update}</property>\n\
         \x20           <property name=\"FNT_SQLDELETE\"></property>\n\
         \x20           <property name=\"FNT_CAMPOINCREMENTO\"></property>\n\
         \x20           <property name=\"FNT_CAMPOGRADE\">{grade}</property>\n\
         \x20           <property name=\"FNT_CAMPOPESQUISA\">{pesq}</property>\n\
         \x20           <property name=\"FNT_SQLDEFAULT\">{sqldef}</property>\n\
         \x20           <property name=\"FNT_SQLMASCARA\"></property>\n\
         \x20           <property name=\"REL_CODIGO\"></property>\n",
        cod = form.codigo,
        tam = form.tamanho,
        alt = form.altura,
        chave = form.campo_chave,
        tabela = form.tabela,
        sqldef = "",
    );

    if form.categoria > 0 {
        xml.push_str(&format!("            <category CAT_CODIGO=\"{}\"/>\n", form.categoria));
    }

    // Form settings component (COM_TIPO F)
    let nav = if form.navegacao { "TRUE" } else { "FALSE" };
    let abas = if form.abas { "TRUE" } else { "FALSE" };
    let resp = if form.responsivo { "TRUE" } else { "FALSE" };
    let editar = if form.editar_duplo_clique { "TRUE" } else { "FALSE" };
    let aba_loc = if form.aba_localizar { "TRUE" } else { "FALSE" };

    xml.push_str(&format!(
        "            <component COM_CODIGO=\"100\" COM_TIPO=\"F\" name=\"\">\n\
         \x20               <property name=\"Navegacao\">{nav}</property>\n\
         \x20               <property name=\"Abas\">{abas}</property>\n\
         \x20               <property name=\"Responsivo\">{resp}</property>\n\
         \x20               <property name=\"ClasseCss\">{css}</property>\n\
         \x20               <property name=\"EditarAoDuploClicar\">{editar}</property>\n\
         \x20               <property name=\"AbaLocalizar\">{aba_loc}</property>\n\
         \x20           </component>\n",
        css = form.css,
    ));

    // Field components
    for (idx, field) in form.campos.iter().enumerate() {
        let comp_id = 101 + idx;
        xml.push_str(&build_component_xml(field, comp_id));
    }

    xml.push_str("        </form>\n");
    xml
}

fn build_component_xml(f: &FormField, comp_id: usize) -> String {
    let desc = if f.descricao.is_empty() { &f.nome } else { &f.descricao };
    let mut props = vec![
        ("Aba", f.aba.clone()),
        ("Altura", f.altura.to_string()),
        ("Campo", f.campo.clone()),
        ("Container", f.container.clone()),
        ("Descricao", xml_escape_content(desc)),
        ("Habilitado", "True".into()),
        ("Nome", f.nome.clone()),
        ("PosicaoX", f.posicao_x.to_string()),
        ("PosicaoY", f.posicao_y.to_string()),
        ("Tamanho", f.tamanho.to_string()),
        ("Visivel", "True".into()),
    ];

    if let Some(ref extra) = f.properties {
        for (k, v) in extra {
            let val = match v {
                serde_json::Value::String(s) => s.clone(),
                other => other.to_string(),
            };
            if k == "SQL" {
                props.push((k, xml_escape_content(&val)));
            } else {
                props.push((k, val));
            }
        }
    }

    let props_xml: String = props.iter()
        .map(|(k, v)| format!("                <property name=\"{k}\">{v}</property>"))
        .collect::<Vec<_>>()
        .join("\n");

    format!(
        "            <component COM_CODIGO=\"{comp_id}\" COM_TIPO=\"{tipo}\" name=\"{nome}\">\n\
         {props_xml}\n\
         \x20           </component>\n",
        tipo = f.tipo,
        nome = f.nome,
    )
}

fn encode_iso_8859_1(text: &str) -> Vec<u8> {
    text.chars().map(|c| {
        let cp = c as u32;
        if cp <= 255 { cp as u8 } else { b'?' }
    }).collect()
}

fn now_formatted() -> String {
    // Formato dd/mm/yyyy HH:MM sem dependencia de chrono
    let secs = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap_or_default()
        .as_secs();

    let days = secs / 86400;
    let time_of_day = secs % 86400;
    let hours = time_of_day / 3600;
    let minutes = (time_of_day % 3600) / 60;

    // Epoch civil date (simplified)
    let mut y = 1970i64;
    let mut remaining = days as i64;
    loop {
        let days_in_year = if y % 4 == 0 && (y % 100 != 0 || y % 400 == 0) { 366 } else { 365 };
        if remaining < days_in_year { break; }
        remaining -= days_in_year;
        y += 1;
    }
    let leap = y % 4 == 0 && (y % 100 != 0 || y % 400 == 0);
    let month_days = [31, if leap { 29 } else { 28 }, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    let mut m = 0;
    for &md in &month_days {
        if remaining < md { break; }
        remaining -= md;
        m += 1;
    }

    format!("{:02}/{:02}/{:04} {:02}:{:02}", remaining + 1, m + 1, y, hours, minutes)
}

// Placeholder para uuid — em producao usar o crate uuid
mod uuid {
    pub struct Uuid;
    impl Uuid {
        pub fn new_v4() -> Self { Uuid }
        pub fn to_string(&self) -> String {
            use std::time::{SystemTime, UNIX_EPOCH};
            let t = SystemTime::now().duration_since(UNIX_EPOCH).unwrap_or_default().as_nanos();
            format!("{:08x}-{:04x}-4{:03x}-{:04x}-{:012x}",
                (t >> 96) as u32, (t >> 80) as u16 & 0xFFFF,
                (t >> 64) as u16 & 0x0FFF, (t >> 48) as u16 | 0x8000,
                t as u64 & 0xFFFF_FFFF_FFFF)
        }
    }
}

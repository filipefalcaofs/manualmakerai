"""Gera FRZ completo: Cadastro de Pessoa com regras de validacao, duplicidade CPF e busca CEP."""
import sys, os, uuid, gzip
sys.path.insert(0, os.path.dirname(__file__))

from mcp_maker.builder import (
    FrzBuilder, RuleSpec, RuleParam, RuleVar,
    StepExpression, StepDecision, StepSubRoutine, StepActivity,
    SubRoutineParam, ParamVariable, ParamConstant, ParamSQL, ParamFunction,
    FormSpec, FormField, EventBinding,
)

FORM_GUID = "{" + str(uuid.uuid4()).upper() + "}"

# ---------------------------------------------------------------------------
# Codigos das regras (REG_COD) - devem coincidir com o CALLRULE ID
# ---------------------------------------------------------------------------
ID_VALIDAR_OBRIGATORIO = 50
ID_VERIFICAR_DUPLICIDADE_CPF = 51
ID_BUSCAR_CEP = 52
ID_PREENCHER_ENDERECO = 53
ID_ANTES_GRAVAR = 54

# ---------------------------------------------------------------------------
# Regra 1: GER - Validar Campo Obrigatorio (reutilizavel)
# ---------------------------------------------------------------------------
regra_validar_obrigatorio = RuleSpec(
    nome="GER - Validar Campo Obrigatorio",
    destino=1,  # cliente
    codigo=ID_VALIDAR_OBRIGATORIO,
    parametros=[
        RuleParam("pValor", "Variante", ""),
        RuleParam("pMensagem", "Letras", "200"),
    ],
    variaveis=[],
    passos=[
        StepDecision(
            nome="FlowDecision1",
            descricao="Campo vazio?",
            funcao="isNullOrEmpty",
            nome_amigavel="É Nulo ou Vazio",
            params=[ParamVariable("pValor")],
            sim=[
                StepActivity(
                    nome="FlowActivity1",
                    activity_id=7,
                    object_name="Mensagem de Erro",
                    real_name="ActNewErrorMessage",
                    description="Mensagem de Erro",
                    params=[
                        SubRoutineParam("Título", ParamConstant("Validação")),
                        SubRoutineParam("Mensagem", ParamVariable("pMensagem")),
                        SubRoutineParam("Tempo", ParamConstant(None)),
                        SubRoutineParam("Posição", ParamConstant(None)),
                    ],
                ),
            ],
            nao=[
                StepExpression(
                    nome="FlowExpression1",
                    descricao="Campo valido",
                    funcao="toString",
                    nome_amigavel="Para Letras",
                    params=[ParamConstant("ok", tipo_dado="Variante")],
                    retorno="",
                    tipo_retorno="Letras",
                ),
            ],
        ),
    ],
)

# ---------------------------------------------------------------------------
# Regra 2: PES - Verificar Duplicidade CPF (servidor)
# ---------------------------------------------------------------------------
regra_verificar_cpf = RuleSpec(
    nome="PES - Verificar Duplicidade CPF",
    destino=0,  # servidor
    codigo=ID_VERIFICAR_DUPLICIDADE_CPF,
    parametros=[
        RuleParam("pCPF", "Letras", "14"),
        RuleParam("pPES_ID", "Inteiro", ""),
    ],
    variaveis=[
        RuleVar("vTab", "Tabela", ""),
        RuleVar("vQtd", "Inteiro", ""),
    ],
    passos=[
        StepExpression(
            nome="FlowExpression1",
            descricao="Consultar CPF duplicado",
            funcao="ebfSQLExecuteQuery",
            nome_amigavel="Abrir Consulta",
            params=[
                ParamSQL(
                    sql="SELECT COUNT(*) AS QTD FROM PESSOA WHERE PES_CPF = :CPF AND PES_ID <> :ID",
                    binds=[
                        {"nome": "CPF", "variavel": "pCPF"},
                        {"nome": "ID", "variavel": "pPES_ID"},
                    ],
                ),
                ParamConstant(None, tipo_dado="Variante"),
            ],
            retorno="vTab",
            tipo_retorno="Tabela",
        ),
        StepExpression(
            nome="FlowExpression2",
            descricao="Obter contagem",
            funcao="ebfSQLField",
            nome_amigavel="Campo",
            params=[
                ParamVariable("vTab", tipo_dado="Tabela"),
                ParamConstant("QTD", tipo_dado="Campo"),
            ],
            retorno="vQtd",
            tipo_retorno="Variante",
        ),
        StepExpression(
            nome="FlowExpression3",
            descricao="Fechar consulta",
            funcao="ebfSQLClose",
            nome_amigavel="Fechar Consulta",
            params=[ParamVariable("vTab", tipo_dado="Tabela")],
            retorno="",
            tipo_retorno="",
        ),
        StepDecision(
            nome="FlowDecision1",
            descricao="CPF duplicado?",
            funcao="isGreater",
            nome_amigavel="Maior",
            params=[
                ParamVariable("vQtd"),
                ParamConstant("0", tipo_dado="Inteiro"),
            ],
            sim=[
                StepActivity(
                    nome="FlowActivity1",
                    activity_id=7,
                    object_name="Mensagem de Erro",
                    real_name="ActNewErrorMessage",
                    description="Mensagem de Erro",
                    params=[
                        SubRoutineParam("Título", ParamConstant("Duplicidade")),
                        SubRoutineParam("Mensagem", ParamConstant(
                            "Já existe um cadastro com este CPF. Verifique os dados e tente novamente."
                        )),
                        SubRoutineParam("Tempo", ParamConstant(None)),
                        SubRoutineParam("Posição", ParamConstant(None)),
                    ],
                ),
            ],
            nao=[
                StepExpression(
                    nome="FlowExpression4",
                    descricao="CPF unico",
                    funcao="toString",
                    nome_amigavel="Para Letras",
                    params=[ParamConstant("ok", tipo_dado="Variante")],
                    retorno="",
                    tipo_retorno="Letras",
                ),
            ],
        ),
    ],
)

# ---------------------------------------------------------------------------
# Regra 3: PES - Buscar CEP ViaCEP (servidor)
# ---------------------------------------------------------------------------
regra_buscar_cep = RuleSpec(
    nome="PES - Buscar CEP ViaCEP",
    destino=0,  # servidor
    codigo=ID_BUSCAR_CEP,
    parametros=[
        RuleParam("pCEP", "Letras", "9"),
    ],
    variaveis=[
        RuleVar("vURL", "Letras", "200"),
        RuleVar("vRetorno", "Variante", ""),
    ],
    retorno_tipo="Variante",
    passos=[
        StepExpression(
            nome="FlowExpression1",
            descricao="Montar URL do ViaCEP",
            funcao="ebfConcat",
            nome_amigavel="Concatenação",
            params=[
                ParamConstant("https://viacep.com.br/ws/"),
                ParamVariable("pCEP"),
                ParamConstant("/json/"),
            ],
            retorno="vURL",
            tipo_retorno="Letras",
        ),
        StepExpression(
            nome="FlowExpression2",
            descricao="Chamar API ViaCEP",
            funcao="ebfRestCallNew",
            nome_amigavel="REST - Consumir WebService",
            params=[
                ParamConstant("GET"),
                ParamVariable("vURL"),
                ParamConstant(None),
                ParamConstant(None),
                ParamConstant(None),
                ParamFunction(
                    funcao="ebfMapCreateFromList",
                    nome_amigavel="Criar Objeto Mapa com Parâmetros",
                    params=[
                        ParamFunction(
                            funcao="ebfListParamsCreate",
                            nome_amigavel="Criar lista a partir dos Elementos",
                            params=[
                                ParamConstant("Content-Type"),
                                ParamConstant("application/json"),
                            ],
                            tipo_retorno="Variante",
                        ),
                    ],
                    tipo_retorno="Variante",
                ),
                ParamConstant(None),
                ParamConstant("UTF-8"),
                ParamConstant(None),
                ParamConstant(None),
            ],
            retorno="vRetorno",
            tipo_retorno="Variante",
        ),
        StepExpression(
            nome="FlowExpression3",
            descricao="Criar objeto JSON",
            funcao="ebfCreateObjectJSON",
            nome_amigavel="JSON - Criar Objeto",
            params=[ParamVariable("vRetorno")],
            retorno="vRetorno",
            tipo_retorno="Variante",
        ),
    ],
)

# ---------------------------------------------------------------------------
# Regra 4: PES - Preencher Endereco CEP (cliente, Ao Sair do campo CEP)
# ---------------------------------------------------------------------------
regra_preencher_endereco = RuleSpec(
    nome="PES - Preencher Endereco CEP",
    destino=1,  # cliente
    codigo=ID_PREENCHER_ENDERECO,
    parametros=[
        RuleParam("pCEP", "Letras", "9"),
    ],
    variaveis=[
        RuleVar("vJSON", "Variante", ""),
        RuleVar("vLogradouro", "Letras", "200"),
        RuleVar("vBairro", "Letras", "100"),
        RuleVar("vCidade", "Letras", "100"),
        RuleVar("vUF", "Letras", "2"),
        RuleVar("vErro", "Variante", ""),
    ],
    passos=[
        StepDecision(
            nome="FlowDecision1",
            descricao="CEP preenchido?",
            funcao="isNullOrEmpty",
            nome_amigavel="É Nulo ou Vazio",
            params=[ParamVariable("pCEP")],
            sim=[
                # CEP vazio: limpar campos
                StepExpression(
                    nome="FlowExpression_limpar1",
                    descricao="Limpar logradouro",
                    funcao="ebfFormChangeComponentValue",
                    nome_amigavel="Alterar Valor do Componente",
                    params=[
                        ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                        ParamConstant("edtLogradouro", tipo_dado="Componente", guid=FORM_GUID),
                        ParamConstant("", tipo_dado="Variante"),
                    ],
                    retorno="",
                    tipo_retorno="",
                ),
                StepExpression(
                    nome="FlowExpression_limpar2",
                    descricao="Limpar bairro",
                    funcao="ebfFormChangeComponentValue",
                    nome_amigavel="Alterar Valor do Componente",
                    params=[
                        ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                        ParamConstant("edtBairro", tipo_dado="Componente", guid=FORM_GUID),
                        ParamConstant("", tipo_dado="Variante"),
                    ],
                    retorno="",
                    tipo_retorno="",
                ),
                StepExpression(
                    nome="FlowExpression_limpar3",
                    descricao="Limpar cidade",
                    funcao="ebfFormChangeComponentValue",
                    nome_amigavel="Alterar Valor do Componente",
                    params=[
                        ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                        ParamConstant("edtCidade", tipo_dado="Componente", guid=FORM_GUID),
                        ParamConstant("", tipo_dado="Variante"),
                    ],
                    retorno="",
                    tipo_retorno="",
                ),
                StepExpression(
                    nome="FlowExpression_limpar4",
                    descricao="Limpar UF",
                    funcao="ebfFormChangeComponentValue",
                    nome_amigavel="Alterar Valor do Componente",
                    params=[
                        ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                        ParamConstant("cmbUF", tipo_dado="Componente", guid=FORM_GUID),
                        ParamConstant("", tipo_dado="Variante"),
                    ],
                    retorno="",
                    tipo_retorno="",
                ),
            ],
            nao=[
                # CEP preenchido: chamar SubRoutine servidor
                StepSubRoutine(
                    nome="FlowSubRoutine1",
                    rule_name="PES - Buscar CEP ViaCEP",
                    rule_id=ID_BUSCAR_CEP,
                    params=[
                        SubRoutineParam("CEP", ParamVariable("pCEP")),
                    ],
                    return_var="vJSON",
                    description="Buscar CEP no ViaCEP",
                ),
                # Verificar se retorno tem erro
                StepExpression(
                    nome="FlowExpression_erro",
                    descricao="Verificar erro no retorno",
                    funcao="ebfJSONExistsKey",
                    nome_amigavel="JSON - Existe a chave?",
                    params=[
                        ParamVariable("vJSON"),
                        ParamConstant("erro"),
                    ],
                    retorno="vErro",
                    tipo_retorno="Lógico",
                ),
                StepDecision(
                    nome="FlowDecision2",
                    descricao="CEP invalido?",
                    funcao="isEqual",
                    nome_amigavel="Igual",
                    params=[
                        ParamVariable("vErro"),
                        ParamConstant("TRUE", tipo_dado="Lógico"),
                    ],
                    sim=[
                        StepActivity(
                            nome="FlowActivity1",
                            activity_id=7,
                            object_name="Mensagem de Erro",
                            real_name="ActNewErrorMessage",
                            description="Mensagem de Erro",
                            params=[
                                SubRoutineParam("Título", ParamConstant("CEP")),
                                SubRoutineParam("Mensagem", ParamConstant(
                                    "CEP não encontrado. Verifique se digitou corretamente."
                                )),
                                SubRoutineParam("Tempo", ParamConstant(None)),
                                SubRoutineParam("Posição", ParamConstant(None)),
                            ],
                        ),
                    ],
                    nao=[
                        # Extrair e preencher campos
                        StepExpression(
                            nome="FlowExpression2",
                            descricao="Extrair logradouro",
                            funcao="ebfGetValueObjectJson",
                            nome_amigavel="JSON - Obter Valor",
                            params=[ParamVariable("vJSON"), ParamConstant("logradouro")],
                            retorno="vLogradouro",
                            tipo_retorno="Variante",
                        ),
                        StepExpression(
                            nome="FlowExpression3",
                            descricao="Preencher logradouro",
                            funcao="ebfFormChangeComponentValue",
                            nome_amigavel="Alterar Valor do Componente",
                            params=[
                                ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                                ParamConstant("edtLogradouro", tipo_dado="Componente", guid=FORM_GUID),
                                ParamVariable("vLogradouro"),
                            ],
                            retorno="", tipo_retorno="",
                        ),
                        StepExpression(
                            nome="FlowExpression4",
                            descricao="Extrair bairro",
                            funcao="ebfGetValueObjectJson",
                            nome_amigavel="JSON - Obter Valor",
                            params=[ParamVariable("vJSON"), ParamConstant("bairro")],
                            retorno="vBairro",
                            tipo_retorno="Variante",
                        ),
                        StepExpression(
                            nome="FlowExpression5",
                            descricao="Preencher bairro",
                            funcao="ebfFormChangeComponentValue",
                            nome_amigavel="Alterar Valor do Componente",
                            params=[
                                ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                                ParamConstant("edtBairro", tipo_dado="Componente", guid=FORM_GUID),
                                ParamVariable("vBairro"),
                            ],
                            retorno="", tipo_retorno="",
                        ),
                        StepExpression(
                            nome="FlowExpression6",
                            descricao="Extrair cidade",
                            funcao="ebfGetValueObjectJson",
                            nome_amigavel="JSON - Obter Valor",
                            params=[ParamVariable("vJSON"), ParamConstant("localidade")],
                            retorno="vCidade",
                            tipo_retorno="Variante",
                        ),
                        StepExpression(
                            nome="FlowExpression7",
                            descricao="Preencher cidade",
                            funcao="ebfFormChangeComponentValue",
                            nome_amigavel="Alterar Valor do Componente",
                            params=[
                                ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                                ParamConstant("edtCidade", tipo_dado="Componente", guid=FORM_GUID),
                                ParamVariable("vCidade"),
                            ],
                            retorno="", tipo_retorno="",
                        ),
                        StepExpression(
                            nome="FlowExpression8",
                            descricao="Extrair UF",
                            funcao="ebfGetValueObjectJson",
                            nome_amigavel="JSON - Obter Valor",
                            params=[ParamVariable("vJSON"), ParamConstant("uf")],
                            retorno="vUF",
                            tipo_retorno="Variante",
                        ),
                        StepExpression(
                            nome="FlowExpression9",
                            descricao="Preencher UF",
                            funcao="ebfFormChangeComponentValue",
                            nome_amigavel="Alterar Valor do Componente",
                            params=[
                                ParamConstant("Cadastro de Pessoa", tipo_dado="Formulário"),
                                ParamConstant("cmbUF", tipo_dado="Componente", guid=FORM_GUID),
                                ParamVariable("vUF"),
                            ],
                            retorno="", tipo_retorno="",
                        ),
                    ],
                ),
            ],
        ),
    ],
)

# ---------------------------------------------------------------------------
# Regra 5: PES - Antes de Gravar (cliente, valida e verifica duplicidade)
# ---------------------------------------------------------------------------
regra_antes_gravar = RuleSpec(
    nome="PES - Antes de Gravar",
    destino=1,  # cliente
    codigo=ID_ANTES_GRAVAR,
    parametros=[
        RuleParam("pNome", "Letras", "200"),
        RuleParam("pCPF", "Letras", "14"),
        RuleParam("pPES_ID", "Inteiro", ""),
    ],
    variaveis=[],
    passos=[
        StepSubRoutine(
            nome="FlowSubRoutine1",
            rule_name="GER - Validar Campo Obrigatorio",
            rule_id=ID_VALIDAR_OBRIGATORIO,
            params=[
                SubRoutineParam("pValor", ParamVariable("pNome")),
                SubRoutineParam("pMensagem", ParamConstant("O campo Nome é obrigatório.")),
            ],
            description="Validar Nome",
        ),
        StepSubRoutine(
            nome="FlowSubRoutine2",
            rule_name="GER - Validar Campo Obrigatorio",
            rule_id=ID_VALIDAR_OBRIGATORIO,
            params=[
                SubRoutineParam("pValor", ParamVariable("pCPF")),
                SubRoutineParam("pMensagem", ParamConstant("O campo CPF é obrigatório.")),
            ],
            description="Validar CPF",
        ),
        StepSubRoutine(
            nome="FlowSubRoutine3",
            rule_name="PES - Verificar Duplicidade CPF",
            rule_id=ID_VERIFICAR_DUPLICIDADE_CPF,
            params=[
                SubRoutineParam("pCPF", ParamVariable("pCPF")),
                SubRoutineParam("pPES_ID", ParamVariable("pPES_ID")),
            ],
            description="Verificar duplicidade",
        ),
    ],
)

# ---------------------------------------------------------------------------
# Formulario principal: Cadastro de Pessoa
# ---------------------------------------------------------------------------

def _comp(nome, descricao, tipo, **props):
    """Atalho para FormField com properties opcionais. Campo=DB_FIELD vai para FormField.campo."""
    campo_db = props.pop("Campo", "")
    return FormField(nome=nome, descricao=descricao, tipo=tipo, campo=campo_db, properties=props)

# COM_TIPO: F=Form, E=Edit, C=Combo, K=Lookup, L=Label, P=Container,
#           G=Grid, B=Button, M=Memo, H=CheckBox, R=RadioGroup, I=Image, A=Attachment

form_pessoa = FormSpec(
    descricao="Cadastro de Pessoa",
    tabela="",
    campo_chave="",
    sql_select="",
    tamanho=1100,
    altura=700,
    sistema="1",
    guid=FORM_GUID,
    campos_pesquisa="",
    campos=[
        # -- Container: Dados Pessoais --
        _comp("ctnDadosPessoais", "Dados Pessoais", "P",
              NomeClasseCss="card shadow-sm mb-3",
              EstiloCss="padding: 15px;"),

        _comp("edtNome", "Nome Completo", "E",
              NomeClasseCss="form-group",
              Placeholder="Informe o nome completo",
              Obrigatorio="S"),

        _comp("edtCPF", "CPF", "E",
              NomeClasseCss="form-group col-md-4",
              Placeholder="000.000.000-00",
              Obrigatorio="S",
              Mascara="999.999.999-99"),

        _comp("edtRG", "RG", "E",
              NomeClasseCss="form-group col-md-4",
              Placeholder="Número do RG"),

        _comp("edtDataNasc", "Data de Nascimento", "E",
              NomeClasseCss="form-group col-md-4",
              Placeholder="dd/mm/aaaa",
              Mascara="99/99/9999"),

        # -- Container: Contato --
        _comp("ctnContato", "Contato", "P",
              NomeClasseCss="card shadow-sm mb-3",
              EstiloCss="padding: 15px;"),

        _comp("edtEmail", "E-mail", "E",
              NomeClasseCss="form-group col-md-6",
              Placeholder="email@exemplo.com"),

        _comp("edtTelefone", "Telefone", "E",
              NomeClasseCss="form-group col-md-3",
              Placeholder="(00) 0000-0000",
              Mascara="(99) 9999-9999"),

        _comp("edtCelular", "Celular", "E",
              NomeClasseCss="form-group col-md-3",
              Placeholder="(00) 00000-0000",
              Mascara="(99) 99999-9999"),

        # -- Container: Informacoes Adicionais --
        _comp("ctnInfo", "Informações Adicionais", "P",
              NomeClasseCss="card shadow-sm mb-3",
              EstiloCss="padding: 15px;"),

        _comp("cmbSexo", "Sexo", "C",
              NomeClasseCss="form-group col-md-4",
              SQL="SELECT 'M' AS VALOR, 'Masculino' AS DESCRICAO UNION ALL SELECT 'F', 'Feminino'"),

        _comp("cmbEstadoCivil", "Estado Civil", "C",
              NomeClasseCss="form-group col-md-4",
              SQL="SELECT 'SOLTEIRO' AS VALOR, 'Solteiro(a)' AS DESCRICAO UNION ALL SELECT 'CASADO', 'Casado(a)' UNION ALL SELECT 'DIVORCIADO', 'Divorciado(a)' UNION ALL SELECT 'VIUVO', 'Viúvo(a)'"),

        _comp("cmbStatus", "Status", "C",
              NomeClasseCss="form-group col-md-4",
              SQL="SELECT 'A' AS VALOR, 'Ativo' AS DESCRICAO UNION ALL SELECT 'I', 'Inativo'"),

        # -- Container: Endereco --
        _comp("ctnEndereco", "Endereço", "P",
              NomeClasseCss="card shadow-sm mb-3",
              EstiloCss="padding: 15px;"),

        FormField(
            nome="edtCEP", descricao="CEP", tipo="E",
            properties={
                "NomeClasseCss": "form-group col-md-3",
                "Placeholder": "00000-000",
                "Mascara": "99999-999",
            },
            eventos={
                "Ao Sair": [
                    EventBinding(
                        rule_name="PES - Preencher Endereco CEP",
                        entrada="pCEP={edtCEP}",
                    ),
                ],
            },
        ),

        _comp("edtLogradouro", "Logradouro", "E",
              NomeClasseCss="form-group col-md-7",
              Placeholder="Rua, Avenida, etc."),

        _comp("edtNumero", "Número", "E",
              NomeClasseCss="form-group col-md-2",
              Placeholder="Nº"),

        _comp("edtComplemento", "Complemento", "E",
              NomeClasseCss="form-group col-md-4",
              Placeholder="Apto, Bloco, etc."),

        _comp("edtBairro", "Bairro", "E",
              NomeClasseCss="form-group col-md-4",
              Placeholder="Bairro"),

        _comp("edtCidade", "Cidade", "E",
              NomeClasseCss="form-group col-md-4",
              Placeholder="Cidade"),

        _comp("cmbUF", "UF", "C",
              NomeClasseCss="form-group col-md-2",
              SQL="SELECT 'AC' AS VALOR, 'AC' AS DESCRICAO UNION ALL SELECT 'AL','AL' UNION ALL SELECT 'AM','AM' UNION ALL SELECT 'AP','AP' UNION ALL SELECT 'BA','BA' UNION ALL SELECT 'CE','CE' UNION ALL SELECT 'DF','DF' UNION ALL SELECT 'ES','ES' UNION ALL SELECT 'GO','GO' UNION ALL SELECT 'MA','MA' UNION ALL SELECT 'MG','MG' UNION ALL SELECT 'MS','MS' UNION ALL SELECT 'MT','MT' UNION ALL SELECT 'PA','PA' UNION ALL SELECT 'PB','PB' UNION ALL SELECT 'PE','PE' UNION ALL SELECT 'PI','PI' UNION ALL SELECT 'PR','PR' UNION ALL SELECT 'RJ','RJ' UNION ALL SELECT 'RN','RN' UNION ALL SELECT 'RO','RO' UNION ALL SELECT 'RR','RR' UNION ALL SELECT 'RS','RS' UNION ALL SELECT 'SC','SC' UNION ALL SELECT 'SE','SE' UNION ALL SELECT 'SP','SP' UNION ALL SELECT 'TO','TO'"),
    ],
    eventos_form={
        "Antes de Gravar": [
            EventBinding(
                rule_name="PES - Antes de Gravar",
                entrada="pNome={edtNome};pCPF={edtCPF};pPES_ID={PES_ID}",
            ),
        ],
        "Antes de Inserir": [
            EventBinding(
                rule_name="PES - Antes de Gravar",
                entrada="pNome={edtNome};pCPF={edtCPF};pPES_ID={PES_ID}",
            ),
        ],
    },
)

# ---------------------------------------------------------------------------
# Montar e gerar FRZ
# ---------------------------------------------------------------------------
regras = [
    regra_validar_obrigatorio,
    regra_verificar_cpf,
    regra_buscar_cep,
    regra_preencher_endereco,
    regra_antes_gravar,
]

builder = FrzBuilder(
    rules=regras,
    forms=[form_pessoa],
    tables=[],
)

xml_content = builder.build_xml()

output_path = os.path.join(os.path.dirname(__file__), "CadastroPessoa.frz")
xml_crlf = xml_content.replace("\r\n", "\n").replace("\n", "\r\n")
xml_bytes = xml_crlf.encode("iso-8859-1", errors="replace")

import struct, time as _time

with open(output_path, "wb") as f:
    gz = gzip.GzipFile(fileobj=f, mode="wb", filename="VERSAO", mtime=int(_time.time()))
    gz.write(xml_bytes)
    gz.close()

# Corrigir header gzip: XFL=0, OS=0 (Windows/FAT) para compatibilidade Maker
with open(output_path, "r+b") as f:
    f.seek(8)
    f.write(b'\x00\x00')  # XFL=0, OS=0

print(f"FRZ gerado: {output_path}")
print(f"  Tamanho: {os.path.getsize(output_path):,} bytes")
print(f"  Regras: {len(regras)}")
print(f"  Formularios: 1")
print(f"  Tabelas: 1")
print(f"  Campos do formulario: {len(form_pessoa.campos)}")
print(f"  GUID do formulario: {FORM_GUID}")

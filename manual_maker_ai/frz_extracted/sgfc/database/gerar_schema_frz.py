"""
Gera FRZ no formato ENTITY_SCHEMA + datapackets para importar no Maker.
Cria todas as tabelas e dados iniciais do SGFC.
"""

import gzip
import uuid
import datetime

SISTEMA = "PW8"
SISTEMA_DESC = "SGFC - GESTAO DE FOMENTOS CULTURAIS"


def guid():
    return str(uuid.uuid4()).upper()


TIPO_MAP = {
    "integer": "integer",
    "string": "string",
    "boolean": "boolean",
    "date": "date",
    "decimal": "string",
    "float": "string",
    "datetime": "date",
    "text": "string",
}


def attr(name, typ, length=0, nullable=True, generated=False, default=""):
    gen = "true" if generated else "false"
    null = "true" if nullable else "false"
    maker_typ = TIPO_MAP.get(typ, "string")
    needs_length = maker_typ in ("integer", "string")
    length_attr = f' LENGTH="{length}"' if needs_length else ""
    default_tag = f"<DEFAULT>{default}</DEFAULT>" if default else "<DEFAULT></DEFAULT>"
    return (
        f'\t\t<ATTRIBUTE GENERATED="{gen}" NAME="{name}" '
        f'FRIENDLY_NAME="{name}" NULLABLE="{null}" TYPE="{maker_typ}"{length_attr}>\n'
        f"\t\t\t{default_tag}\n"
        f'\t\t\t<MASK NAME=""></MASK>\n'
        f"\t\t</ATTRIBUTE>\n"
    )


def key(name, *columns, primary=True):
    cols = "".join(f'\t\t\t<ATTRIBUTE_NAME NAME="{c}"/>\n' for c in columns)
    return (
        f'\t\t<KEY NAME="{name}" UNIQUE="false" PRIMARY="{"true" if primary else "false"}">\n'
        f"{cols}"
        f"\t\t</KEY>\n"
    )


def entity(name, attributes, keys):
    form_name = name.lower()
    return (
        f'\t<ENTITY NAME="{name}" FRIENDLY_NAME="{name}" FORM="{form_name}">\n'
        f"{''.join(attributes)}"
        f"{''.join(keys)}"
        f"\t</ENTITY>\n"
    )


def data_metadata(name, fields):
    data_id = guid()
    attrs = "".join(
        f'<ATTRIBUTE NAME="{f[0]}" FRIENDLY_NAME="{f[0].lower()}" TYPE="{f[1]}"'
        + (f' LENGTH="{f[2]}"' if len(f) > 2 and f[2] else "")
        + "/>"
        for f in fields
    )
    return data_id, f'<DATA ID="{data_id}"><METADATA><ENTITY NAME="{name}" FRIENDLY_NAME="{name.lower()}" FORM="{name.lower()}">{attrs}</ENTITY></METADATA>'


def data_row(fields, values):
    row_fields = ""
    for f, v in zip(fields, values):
        fname = f[0]
        if v is None:
            row_fields += f'<FIELD NAME="{fname}" ISNULL="true"/>'
        else:
            row_fields += f'<FIELD NAME="{fname}" ISNULL="false">{v}</FIELD>'
    return f"<ROW>{row_fields}</ROW>"


# --- DEFINICAO DAS TABELAS ---

tables = []
data_sections = []

# GER_PESSOA
tables.append(entity("GER_PESSOA", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("TIPO_PESSOA", "string", 2, nullable=False),
    attr("DT_CADASTRO", "datetime", nullable=False),
    attr("ATIVO", "boolean", nullable=False, default="true"),
], [key("GER_PESSOA_PKEY", "ID")]))

# GER_PESSOA_FISICA
tables.append(entity("GER_PESSOA_FISICA", [
    attr("ID_PESSOA", "integer", 32, nullable=False),
    attr("CPF", "string", 11, nullable=False),
    attr("NOME", "string", 200, nullable=False),
    attr("DT_NASCIMENTO", "date"),
    attr("TEL_CELULAR", "string", 15),
], [key("GER_PESSOA_FISICA_PKEY", "ID_PESSOA")]))

# GER_PESSOA_JURIDICA
tables.append(entity("GER_PESSOA_JURIDICA", [
    attr("ID_PESSOA", "integer", 32, nullable=False),
    attr("CNPJ", "string", 14, nullable=False),
    attr("RAZAO_SOCIAL", "string", 300, nullable=False),
    attr("NOME_FANTASIA", "string", 200),
    attr("INSCRICAO_ESTADUAL", "string", 20),
    attr("INSCRICAO_MUNICIPAL", "string", 20),
    attr("TELEFONE", "string", 15),
    attr("NATUREZA_JURIDICA", "string", 30),
    attr("PORTE", "string", 20),
    attr("ANO_FUNDACAO", "integer", 32),
    attr("MUNICIPIO_SEDE", "string", 100),
    attr("QTD_MEMBROS", "string", 10),
], [key("GER_PESSOA_JURIDICA_PKEY", "ID_PESSOA")]))

# ENDERECO
tables.append(entity("ENDERECO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PESSOA", "integer", 32, nullable=False),
    attr("CEP", "string", 8),
    attr("LOGRADOURO", "string", 300, nullable=False),
    attr("NUMERO", "string", 10),
    attr("SEM_NUMERO", "boolean", default="false"),
    attr("COMPLEMENTO", "string", 100),
    attr("BAIRRO", "string", 100, nullable=False),
    attr("CIDADE", "string", 100, nullable=False),
    attr("UF", "string", 2, nullable=False),
    attr("TIPO_ENDERECO", "string", 15),
    attr("LATITUDE", "decimal", 10),
    attr("LONGITUDE", "decimal", 11),
], [key("ENDERECO_PKEY", "ID")]))

# PORTAL_USERS
tables.append(entity("PORTAL_USERS", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PESSOA", "integer", 32, nullable=False),
    attr("CPF_CNPJ", "string", 14, nullable=False),
    attr("NOME", "string", 200, nullable=False),
    attr("EMAIL", "string", 200, nullable=False),
    attr("SENHA", "string", 255, nullable=False),
    attr("TEL_CELULAR", "string", 15),
    attr("DT_NASCIMENTO", "date"),
    attr("ATIVO", "string", 1, nullable=False, default="P"),
    attr("DT_CADASTRO", "datetime", nullable=False),
    attr("DT_ATIVACAO", "datetime"),
    attr("TOKEN_ATIVACAO", "string", 100),
    attr("DT_TOKEN_ATIVACAO", "datetime"),
    attr("TOKEN_RESET", "string", 100),
    attr("DT_TOKEN_RESET", "datetime"),
    attr("DT_ACEITE_TERMO", "datetime"),
    attr("TENTATIVAS_FALHAS", "integer", 32, default="0"),
    attr("DT_BLOQUEIO", "datetime"),
    attr("OBSERVACAO_ADMIN", "string", 0),
], [key("PORTAL_USERS_PKEY", "ID")]))

# PORTAL_USERS_LOG
tables.append(entity("PORTAL_USERS_LOG", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PORTAL_USER", "integer", 32, nullable=False),
    attr("DT_ACAO", "datetime", nullable=False),
    attr("USUARIO_RESPONSAVEL", "string", 100, nullable=False),
    attr("TIPO_ACAO", "string", 50, nullable=False),
    attr("DESCRICAO", "string", 0),
    attr("IP_ORIGEM", "string", 45),
    attr("USER_AGENT", "string", 500),
], [key("PORTAL_USERS_LOG_PKEY", "ID")]))

# AREA_CULTURAL
tables.append(entity("AREA_CULTURAL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("CODIGO", "string", 30, nullable=False),
    attr("NOME", "string", 100, nullable=False),
    attr("ID_AREA_PAI", "integer", 32),
    attr("ATIVO", "boolean", nullable=False, default="true"),
], [key("AREA_CULTURAL_PKEY", "ID")]))

# AGENTE_CULTURAL_PERFIL
tables.append(entity("AGENTE_CULTURAL_PERFIL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PESSOA", "integer", 32, nullable=False),
    attr("TIPO_PERFIL", "string", 2, nullable=False),
    attr("BIOGRAFIA", "string", 0, nullable=False),
    attr("TEMPO_ATUACAO", "string", 15, nullable=False),
    attr("ATUACAO_PROJETOS_SOCIAIS", "boolean", default="false"),
    attr("NOME_ARTISTICO", "string", 100),
    attr("PRONOME_TRATAMENTO", "string", 25),
    attr("GENERO", "string", 50),
    attr("RACA_ETNIA", "string", 50),
    attr("PCD", "string", 50),
    attr("MUNICIPIO_ATUACAO", "string", 100, nullable=False),
    attr("FOTO_PERFIL", "string", 500),
    attr("HISTORICO_ORGANIZACAO", "string", 0),
    attr("PUBLICO_ALVO", "string", 0),
    attr("PUBLICIZACAO_AUTORIZADA", "boolean", default="false"),
    attr("DATA_CONSENTIMENTO", "datetime"),
    attr("ACEITE_VERACIDADE", "boolean", nullable=False, default="false"),
    attr("DATA_ACEITE_VERACIDADE", "datetime"),
    attr("STATUS_PERFIL", "string", 10, nullable=False, default="ATIVO"),
    attr("DT_CRIACAO", "datetime", nullable=False),
    attr("DT_ATUALIZACAO", "datetime", nullable=False),
    attr("CONSENTIMENTO_MAPA_CULTURA", "boolean", default="false"),
    attr("DATA_CONSENTIMENTO_MAPA", "datetime"),
], [key("AGENTE_CULTURAL_PERFIL_PKEY", "ID")]))

# AGENTE_AREA_CULTURAL
tables.append(entity("AGENTE_AREA_CULTURAL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_AGENTE", "integer", 32, nullable=False),
    attr("ID_AREA", "integer", 32, nullable=False),
], [key("AGENTE_AREA_CULTURAL_PKEY", "ID")]))

# HABILIDADE
tables.append(entity("HABILIDADE", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("NOME", "string", 100, nullable=False),
    attr("TIPO", "string", 15),
], [key("HABILIDADE_PKEY", "ID")]))

# AGENTE_HABILIDADE
tables.append(entity("AGENTE_HABILIDADE", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_AGENTE", "integer", 32, nullable=False),
    attr("ID_HABILIDADE", "integer", 32, nullable=False),
    attr("NIVEL", "string", 15),
    attr("DESCRICAO", "string", 300),
], [key("AGENTE_HABILIDADE_PKEY", "ID")]))

# PORTFOLIO
tables.append(entity("PORTFOLIO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_AGENTE", "integer", 32, nullable=False),
    attr("TITULO", "string", 150, nullable=False),
    attr("TIPO", "string", 20, nullable=False),
    attr("ANO", "integer", 32, nullable=False),
    attr("DESCRICAO", "string", 0),
    attr("LINK", "string", 500),
], [key("PORTFOLIO_PKEY", "ID")]))

# PRESENCA_DIGITAL
tables.append(entity("PRESENCA_DIGITAL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_AGENTE", "integer", 32, nullable=False),
    attr("SITE_BLOG", "string", 500),
    attr("INSTAGRAM", "string", 100),
    attr("FACEBOOK", "string", 500),
    attr("YOUTUBE", "string", 500),
    attr("SPOTIFY_SOUNDCLOUD", "string", 500),
    attr("VIMEO", "string", 500),
    attr("OUTRO_LINK", "string", 500),
], [key("PRESENCA_DIGITAL_PKEY", "ID")]))

# FORMACAO
tables.append(entity("FORMACAO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_AGENTE", "integer", 32, nullable=False),
    attr("CATEGORIA", "string", 25, nullable=False),
    attr("TITULO", "string", 200, nullable=False),
    attr("INSTITUICAO", "string", 200, nullable=False),
    attr("CARGA_HORARIA", "integer", 32),
    attr("ANO_CONCLUSAO", "integer", 32),
    attr("STATUS_FORMACAO", "string", 15, nullable=False, default="CONCLUIDO"),
    attr("DESCRICAO_SABER", "string", 0),
    attr("COMPROVANTE_PATH", "string", 500),
], [key("FORMACAO_PKEY", "ID")]))

# REPRESENTANTE_LEGAL
tables.append(entity("REPRESENTANTE_LEGAL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PESSOA_JURIDICA", "integer", 32, nullable=False),
    attr("ID_USUARIO", "integer", 32),
    attr("NOME", "string", 200, nullable=False),
    attr("CARGO", "string", 100, nullable=False),
    attr("RG", "string", 20),
    attr("CPF", "string", 11, nullable=False),
    attr("TELEFONE", "string", 15),
    attr("EMAIL", "string", 200),
    attr("EH_SOCIO", "boolean", nullable=False, default="false"),
    attr("ORIGEM_PERFIL", "string", 20, nullable=False),
    attr("DT_VINCULO", "datetime", nullable=False),
    attr("DT_DESVINCULACAO", "datetime"),
    attr("ATIVO", "boolean", nullable=False, default="true"),
    attr("STATUS_VALIDACAO", "string", 10, nullable=False, default="PENDENTE"),
], [key("REPRESENTANTE_LEGAL_PKEY", "ID")]))

# RESPONSAVEL_CADASTRO
tables.append(entity("RESPONSAVEL_CADASTRO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PESSOA_JURIDICA", "integer", 32, nullable=False),
    attr("ID_USUARIO", "integer", 32, nullable=False),
    attr("CARGO", "string", 100, nullable=False),
    attr("STATUS_VALIDACAO", "string", 10, nullable=False, default="PENDENTE"),
    attr("DT_SOLICITACAO", "datetime", nullable=False),
    attr("DT_VALIDACAO", "datetime"),
    attr("ORIGEM_PERFIL", "string", 20, nullable=False),
    attr("ATIVO", "boolean", nullable=False, default="true"),
], [key("RESPONSAVEL_CADASTRO_PKEY", "ID")]))

# DOCUMENTO_TIPO
tables.append(entity("DOCUMENTO_TIPO", [
    attr("DOC_TIPO_ID", "integer", 32, nullable=False, generated=True),
    attr("DOC_TIPO_NOME", "string", 200, nullable=False),
    attr("DOC_TIPO_CODIGO", "string", 50, nullable=False),
    attr("DOC_TIPO_DESCRICAO", "string", 0),
    attr("DOC_TIPO_CATEGORIA", "string", 10, nullable=False),
    attr("DOC_TIPO_TEMPORALIDADE", "boolean", nullable=False, default="false"),
    attr("DOC_TIPO_PRAZO_VALIDADE", "integer", 32),
    attr("DOC_TIPO_UNIDADE_PRAZO", "string", 5),
    attr("DOC_TIPO_ALERTA_VENCIMENTO", "integer", 32, default="30"),
    attr("DOC_TIPO_FORMATOS", "string", 50, nullable=False, default="PDF"),
    attr("DOC_TIPO_TAMANHO_MAX_MB", "integer", 32, nullable=False, default="10"),
    attr("DOC_TIPO_MULTIPLOS_ARQUIVOS", "boolean", nullable=False, default="false"),
    attr("DOC_TIPO_CONDICIONAL", "string", 500),
    attr("DOC_TIPO_DT_INICIO_VIGENCIA", "date", nullable=False),
    attr("DOC_TIPO_DT_FIM_VIGENCIA", "date"),
    attr("DOC_TIPO_ORDEM", "integer", 32, default="0"),
    attr("DOC_TIPO_STATUS", "string", 2, nullable=False, default="A"),
], [key("DOCUMENTO_TIPO_PKEY", "DOC_TIPO_ID")]))

# DOCUMENTO_TIPO_PERFIL
tables.append(entity("DOCUMENTO_TIPO_PERFIL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_DOCUMENTO_TIPO", "integer", 32, nullable=False),
    attr("PERFIL", "string", 20, nullable=False),
    attr("OBRIGATORIO", "boolean", nullable=False, default="false"),
], [key("DOCUMENTO_TIPO_PERFIL_PKEY", "ID")]))

# DOCUMENTO
tables.append(entity("DOCUMENTO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("DOC_TIPO_ID", "integer", 32, nullable=False),
    attr("ID_PESSOA", "integer", 32),
    attr("ID_INSCRICAO", "integer", 32),
    attr("ID_RESPONSAVEL_CADASTRO", "integer", 32),
    attr("NOME_ARQUIVO", "string", 300, nullable=False),
    attr("PATH_ARQUIVO", "string", 500, nullable=False),
    attr("TIPO_ARQUIVO", "string", 10, nullable=False),
    attr("TAMANHO_BYTES", "integer", 32, nullable=False),
    attr("TIPO_ASSINATURA", "string", 15),
    attr("STATUS_VALIDACAO", "string", 10, nullable=False, default="PENDENTE"),
    attr("DT_UPLOAD", "datetime", nullable=False),
    attr("DT_VALIDACAO", "datetime"),
    attr("DT_EMISSAO", "date"),
    attr("DT_VENCIMENTO", "date"),
], [key("DOCUMENTO_PKEY", "ID")]))

# GRUPO_DESPESA
tables.append(entity("GRUPO_DESPESA", [
    attr("ID_GRUPO_DESPESA", "integer", 32, nullable=False, generated=True),
    attr("NOME", "string", 200, nullable=False),
    attr("CODIGO_INTERNO", "string", 50, nullable=False),
    attr("DESCRICAO", "string", 0),
    attr("PERCENTUAL_MINIMO", "decimal", 5),
    attr("PERCENTUAL_MAXIMO", "decimal", 5),
    attr("INCIDE_IRRF", "boolean", nullable=False, default="false"),
    attr("ALIQUOTA_IRRF", "decimal", 5),
    attr("ORDEM_EXIBICAO", "integer", 32, default="0"),
    attr("STATUS", "string", 10, nullable=False, default="ATIVO"),
], [key("GRUPO_DESPESA_PKEY", "ID_GRUPO_DESPESA")]))

# UNIDADE_MEDIDA
tables.append(entity("UNIDADE_MEDIDA", [
    attr("ID_UNIDADE_MEDIDA", "integer", 32, nullable=False, generated=True),
    attr("NOME", "string", 100, nullable=False),
    attr("SIGLA", "string", 20, nullable=False),
    attr("DESCRICAO", "string", 0),
    attr("STATUS", "string", 10, nullable=False, default="ATIVO"),
], [key("UNIDADE_MEDIDA_PKEY", "ID_UNIDADE_MEDIDA")]))

# ITEM_DESPESA
tables.append(entity("ITEM_DESPESA", [
    attr("ID_ITEM_DESPESA", "integer", 32, nullable=False, generated=True),
    attr("ID_GRUPO_DESPESA", "integer", 32, nullable=False),
    attr("NOME", "string", 200, nullable=False),
    attr("CODIGO_INTERNO", "string", 50, nullable=False),
    attr("ELEGIVEL_IRRF", "boolean", nullable=False, default="true"),
    attr("PERMITE_VALOR_LIVRE", "boolean", nullable=False, default="true"),
    attr("VALOR_UNITARIO_MAXIMO", "decimal", 15),
    attr("STATUS", "string", 10, nullable=False, default="ATIVO"),
    attr("ID_USUARIO_SUGESTAO", "integer", 32),
    attr("DT_SUGESTAO", "datetime"),
], [key("ITEM_DESPESA_PKEY", "ID_ITEM_DESPESA")]))

# ITEM_UNIDADE
tables.append(entity("ITEM_UNIDADE", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_ITEM_DESPESA", "integer", 32, nullable=False),
    attr("ID_UNIDADE_MEDIDA", "integer", 32, nullable=False),
], [key("ITEM_UNIDADE_PKEY", "ID")]))

# EDITAL
tables.append(entity("EDITAL", [
    attr("ID_EDITAL", "integer", 32, nullable=False, generated=True),
    attr("TITULO", "string", 300, nullable=False),
    attr("NUMERO", "string", 50, nullable=False),
    attr("ANO_REFERENCIA", "integer", 32, nullable=False),
    attr("DT_ABERTURA", "date", nullable=False),
    attr("DT_ENCERRAMENTO", "date", nullable=False),
    attr("TIPO_FOMENTO", "string", 10, nullable=False),
    attr("VALOR_TOTAL", "decimal", 15, nullable=False),
    attr("PRAZO_INSCRICAO_INICIO", "datetime", nullable=False),
    attr("PRAZO_INSCRICAO_FIM", "datetime", nullable=False),
    attr("TEXTO_INFORMATIVO", "string", 0),
    attr("LIMITE_PROJETOS_POR_PRODUTOR", "integer", 32, nullable=False, default="1"),
    attr("DT_LIBERACAO_PARECER", "date"),
    attr("PERIODO_RECURSOS", "integer", 32),
    attr("PERIODO_CONTRARRAZOES", "integer", 32),
    attr("PERIODO_PRORROGACAO_PROJETO", "integer", 32),
    attr("PRORROGAVEL", "boolean", nullable=False, default="false"),
    attr("ENCERRAMENTO_AUTOMATICO", "string", 1, nullable=False, default="S"),
    attr("STATUS", "string", 15, nullable=False, default="RASCUNHO"),
    attr("QTD_MAX_PROJETOS", "integer", 32),
    attr("VALOR_MAX_PROJETO", "decimal", 15),
    attr("PRAZO_EXECUCAO", "integer", 32),
    attr("COMISSAO_AVALIADORA", "boolean", default="false"),
    attr("FASE_RECURSOS", "boolean", default="false"),
    attr("PRESTACAO_CONTAS", "boolean", default="false"),
    attr("TERRITORIALIZACAO", "string", 0),
    attr("SUBTIPO_INDIRETO", "string", 15),
    attr("LIMITE_RENUNCIA_FISCAL", "decimal", 15),
    attr("VALOR_MAX_CONTRIBUINTE", "decimal", 15),
    attr("VALOR_GRUPO_ECONOMICO", "decimal", 15),
    attr("ANO_EXERCICIO_ISS", "integer", 32),
    attr("TIPO_EDITAL_ISS", "string", 30),
    attr("PCT_MAX_ISS_CONTRIBUINTE", "decimal", 5, default="20"),
    attr("HABILITAR_ORCAMENTO", "boolean", nullable=False, default="false"),
    attr("CALCULAR_IMPOSTO_RETIDO", "boolean", nullable=False, default="false"),
    attr("PERMITIR_SUGESTAO_ITENS", "boolean", nullable=False, default="false"),
    attr("ID_FORMULARIO_INSCRICAO", "integer", 32),
    attr("DT_PUBLICACAO_DO", "date"),
    attr("NUMERO_DO", "string", 50),
    attr("TIPOLOGIA_AGENTE", "string", 500),
    attr("CRITERIOS_ELEGIBILIDADE", "string", 0),
    attr("DT_CRIACAO", "datetime", nullable=False),
    attr("DT_ATUALIZACAO", "datetime", nullable=False),
], [key("EDITAL_PKEY", "ID_EDITAL")]))

# EDITAL_CATEGORIA
tables.append(entity("EDITAL_CATEGORIA", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_EDITAL", "integer", 32, nullable=False),
    attr("NOME_CATEGORIA", "string", 200, nullable=False),
    attr("MODALIDADE", "string", 200),
    attr("META_PROJETOS", "integer", 32),
    attr("VALOR_POR_CATEGORIA", "decimal", 15),
], [key("EDITAL_CATEGORIA_PKEY", "ID")]))

# EDITAL_CRITERIO_AVALIACAO
tables.append(entity("EDITAL_CRITERIO_AVALIACAO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_EDITAL", "integer", 32, nullable=False),
    attr("CRITERIO", "string", 300, nullable=False),
    attr("PESO", "integer", 32, nullable=False),
    attr("PERFIL_AVALIADOR", "string", 200),
    attr("DESCRICAO", "string", 0),
], [key("EDITAL_CRITERIO_AVALIACAO_PKEY", "ID")]))

# EDITAL_DOCUMENTO
tables.append(entity("EDITAL_DOCUMENTO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_EDITAL", "integer", 32, nullable=False),
    attr("DOC_TIPO_ID", "integer", 32, nullable=False),
    attr("OBRIGATORIO", "boolean", nullable=False, default="true"),
    attr("ID_CATEGORIA", "integer", 32),
], [key("EDITAL_DOCUMENTO_PKEY", "ID")]))

# EDITAL_GRUPO_DESPESA
tables.append(entity("EDITAL_GRUPO_DESPESA", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_EDITAL", "integer", 32, nullable=False),
    attr("ID_GRUPO_DESPESA", "integer", 32, nullable=False),
    attr("PERCENTUAL_MIN", "decimal", 5),
    attr("PERCENTUAL_MAX", "decimal", 5),
], [key("EDITAL_GRUPO_DESPESA_PKEY", "ID")]))

# EDITAL_IMPOSTO_CONFIG
tables.append(entity("EDITAL_IMPOSTO_CONFIG", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_EDITAL", "integer", 32, nullable=False),
    attr("INSTRUMENTO_JURIDICO", "string", 200, nullable=False),
    attr("ALIQUOTA", "decimal", 5, nullable=False),
], [key("EDITAL_IMPOSTO_CONFIG_PKEY", "ID")]))

# EDITAL_IMPOSTO_GRUPO
tables.append(entity("EDITAL_IMPOSTO_GRUPO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_EDITAL_IMPOSTO", "integer", 32, nullable=False),
    attr("ID_GRUPO_DESPESA", "integer", 32, nullable=False),
], [key("EDITAL_IMPOSTO_GRUPO_PKEY", "ID")]))

# FORMULARIO
tables.append(entity("FORMULARIO", [
    attr("ID_FORMULARIO", "integer", 32, nullable=False, generated=True),
    attr("NOME", "string", 150, nullable=False),
    attr("DESCRICAO", "string", 500),
    attr("STATUS", "string", 10, nullable=False, default="RASCUNHO"),
    attr("PERMITE_EDITAR_APOS_PUBLICACAO", "boolean", nullable=False, default="false"),
    attr("TIPO_ACESSO", "string", 10, nullable=False, default="LOGADO"),
    attr("ID_USUARIO_CRIADOR", "integer", 32),
    attr("VERSAO_ATUAL", "integer", 32, nullable=False, default="1"),
    attr("DT_CRIACAO", "datetime", nullable=False),
    attr("DT_ATUALIZACAO", "datetime", nullable=False),
    attr("DT_PUBLICACAO", "datetime"),
    attr("LINK_PUBLICO", "string", 500),
], [key("FORMULARIO_PKEY", "ID_FORMULARIO")]))

# PAGINA
tables.append(entity("PAGINA", [
    attr("ID_PAGINA", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("TITULO", "string", 200),
    attr("DESCRICAO", "string", 0),
    attr("ORDEM", "integer", 32, nullable=False, default="1"),
    attr("DT_CRIACAO", "datetime", nullable=False),
], [key("PAGINA_PKEY", "ID_PAGINA")]))

# CAMPO
tables.append(entity("CAMPO", [
    attr("ID_CAMPO", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("ID_PAGINA", "integer", 32, nullable=False),
    attr("NOME", "string", 100, nullable=False),
    attr("LABEL", "string", 300, nullable=False),
    attr("TIPO_CAMPO", "string", 20, nullable=False),
    attr("ORDEM", "integer", 32, nullable=False, default="1"),
    attr("OBRIGATORIO", "boolean", nullable=False, default="false"),
    attr("OBRIGATORIO_CONDICIONAL", "boolean", nullable=False, default="false"),
    attr("AUTO_PREENCHIVEL", "boolean", nullable=False, default="false"),
    attr("CAMPO_CADASTRO", "string", 200),
    attr("PLACEHOLDER", "string", 200),
    attr("TEXTO_AJUDA", "string", 500),
    attr("VALIDACOES", "string", 0),
    attr("DT_CRIACAO", "datetime", nullable=False),
], [key("CAMPO_PKEY", "ID_CAMPO")]))

# CAMPO_OPCAO
tables.append(entity("CAMPO_OPCAO", [
    attr("ID_OPCAO", "integer", 32, nullable=False, generated=True),
    attr("ID_CAMPO", "integer", 32, nullable=False),
    attr("DESCRICAO", "string", 300, nullable=False),
    attr("VALOR", "string", 200, nullable=False),
    attr("ORDEM", "integer", 32, nullable=False, default="1"),
], [key("CAMPO_OPCAO_PKEY", "ID_OPCAO")]))

# REGRA_VISIBILIDADE
tables.append(entity("REGRA_VISIBILIDADE", [
    attr("ID_REGRA", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("ID_CAMPO_ALVO", "integer", 32, nullable=False),
    attr("ID_CAMPO_CONDICIONAL", "integer", 32, nullable=False),
    attr("OPERADOR", "string", 50, nullable=False),
    attr("VALOR_CONDICIONAL", "string", 500, nullable=False),
    attr("ACAO", "string", 10, nullable=False, default="EXIBIR"),
    attr("ATIVO", "boolean", nullable=False, default="true"),
    attr("DT_CRIACAO", "datetime", nullable=False),
], [key("REGRA_VISIBILIDADE_PKEY", "ID_REGRA")]))

# NAVEGACAO_CONDICIONAL
tables.append(entity("NAVEGACAO_CONDICIONAL", [
    attr("ID_NAV", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("PAGINA_ORIGEM", "integer", 32, nullable=False),
    attr("PAGINA_DESTINO", "integer", 32, nullable=False),
    attr("PAGINA_PADRAO", "integer", 32),
    attr("ID_CAMPO_CONDICIONAL", "integer", 32, nullable=False),
    attr("OPERADOR", "string", 50, nullable=False),
    attr("VALOR", "string", 500, nullable=False),
    attr("PRIORIDADE", "integer", 32, nullable=False, default="1"),
    attr("DESCRICAO", "string", 300),
    attr("ATIVO", "boolean", nullable=False, default="true"),
    attr("DT_CRIACAO", "datetime", nullable=False),
], [key("NAVEGACAO_CONDICIONAL_PKEY", "ID_NAV")]))

# VINCULACAO_CADASTRO
tables.append(entity("VINCULACAO_CADASTRO", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("ID_CAMPO", "integer", 32, nullable=False),
    attr("ID_ATRIBUTO_CADASTRO", "string", 200, nullable=False),
    attr("EDITAVEL", "boolean", nullable=False, default="true"),
    attr("ATIVO", "boolean", nullable=False, default="true"),
], [key("VINCULACAO_CADASTRO_PKEY", "ID")]))

# LOG_AUDITORIA
tables.append(entity("LOG_AUDITORIA", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("NUM_VERSAO", "integer", 32, nullable=False),
    attr("DT_HORA", "datetime", nullable=False),
    attr("ID_USUARIO", "integer", 32),
    attr("NOME_USUARIO", "string", 200),
    attr("TIPO_ALTERACAO", "string", 100, nullable=False),
    attr("CAMPOS_ALTERADOS", "string", 0),
    attr("VALOR_ANTERIOR", "string", 0),
    attr("VALOR_ATUAL", "string", 0),
    attr("DESCRICAO_ALTERACAO", "string", 0),
], [key("LOG_AUDITORIA_PKEY", "ID")]))

# INSCRICAO
tables.append(entity("INSCRICAO", [
    attr("ID_INSCRICAO", "integer", 32, nullable=False, generated=True),
    attr("ID_FORMULARIO", "integer", 32, nullable=False),
    attr("ID_EDITAL", "integer", 32),
    attr("ID_USUARIO", "integer", 32, nullable=False),
    attr("ID_PERFIL_CULTURAL", "integer", 32, nullable=False),
    attr("VERSAO_FORMULARIO", "integer", 32, nullable=False, default="1"),
    attr("SNAPSHOT_PERFIL", "string", 0),
    attr("STATUS", "string", 30, nullable=False, default="RASCUNHO"),
    attr("TIPO_PERFIL_USADO", "string", 2, nullable=False),
    attr("VALOR_SOLICITADO", "decimal", 15),
    attr("DT_CRIACAO", "datetime", nullable=False),
    attr("DT_SUBMISSAO", "datetime"),
    attr("DT_ATUALIZACAO", "datetime", nullable=False),
], [key("INSCRICAO_PKEY", "ID_INSCRICAO")]))

# INSCRICAO_STATUS_LOG
tables.append(entity("INSCRICAO_STATUS_LOG", [
    attr("ID_LOG", "integer", 32, nullable=False, generated=True),
    attr("ID_INSCRICAO", "integer", 32, nullable=False),
    attr("STATUS_ANTERIOR", "string", 30, nullable=False),
    attr("STATUS_NOVO", "string", 30, nullable=False),
    attr("ID_USUARIO_RESPONSAVEL", "integer", 32, nullable=False),
    attr("DT_HORA", "datetime", nullable=False),
    attr("OBSERVACAO", "string", 0),
    attr("MOTIVOS_INABILITACAO", "string", 0),
    attr("DOCUMENTOS_FALTANTES", "string", 0),
], [key("INSCRICAO_STATUS_LOG_PKEY", "ID_LOG")]))

# INSCRICAO_ORCAMENTO_VERSAO
tables.append(entity("INSCRICAO_ORCAMENTO_VERSAO", [
    attr("ID_VERSAO", "integer", 32, nullable=False, generated=True),
    attr("ID_INSCRICAO", "integer", 32, nullable=False),
    attr("NUMERO_VERSAO", "integer", 32, nullable=False, default="1"),
    attr("STATUS", "string", 25, nullable=False, default="VIGENTE"),
    attr("TOTAL_GERAL", "decimal", 15, nullable=False, default="0"),
    attr("TOTAL_IRRF", "decimal", 15, default="0"),
    attr("MOTIVO_READEQUACAO", "string", 0),
    attr("ID_USUARIO_RESPONSAVEL", "integer", 32, nullable=False),
    attr("DT_CRIACAO", "datetime", nullable=False),
    attr("DT_DELIBERACAO", "datetime"),
], [key("INSCRICAO_ORCAMENTO_VERSAO_PKEY", "ID_VERSAO")]))

# INSCRICAO_ORCAMENTO_ITEM
tables.append(entity("INSCRICAO_ORCAMENTO_ITEM", [
    attr("ID_ITEM", "integer", 32, nullable=False, generated=True),
    attr("ID_VERSAO", "integer", 32, nullable=False),
    attr("ID_GRUPO_DESPESA", "integer", 32, nullable=False),
    attr("ID_ITEM_DESPESA", "integer", 32, nullable=False),
    attr("ID_UNIDADE_MEDIDA", "integer", 32),
    attr("QUANTIDADE", "integer", 32, nullable=False, default="1"),
    attr("QTD_UNIDADE", "decimal", 10, nullable=False, default="1"),
    attr("VALOR_UNITARIO", "decimal", 15, nullable=False),
    attr("TOTAL_LINHA", "decimal", 15, nullable=False),
    attr("IRRF_LINHA", "decimal", 15, default="0"),
    attr("ITEM_SUGERIDO", "boolean", nullable=False, default="false"),
    attr("STATUS_SUGESTAO", "string", 10),
], [key("INSCRICAO_ORCAMENTO_ITEM_PKEY", "ID_ITEM")]))

# RESPOSTA
tables.append(entity("RESPOSTA", [
    attr("ID_RESPOSTA", "integer", 32, nullable=False, generated=True),
    attr("ID_INSCRICAO", "integer", 32, nullable=False),
    attr("ID_CAMPO", "integer", 32, nullable=False),
    attr("VALOR", "string", 0),
], [key("RESPOSTA_PKEY", "ID_RESPOSTA")]))

# LOG_ALTERACAO_PERFIL
tables.append(entity("LOG_ALTERACAO_PERFIL", [
    attr("ID", "integer", 32, nullable=False, generated=True),
    attr("ID_PERFIL", "integer", 32, nullable=False),
    attr("ID_USUARIO", "integer", 32, nullable=False),
    attr("TIPO_OPERACAO", "string", 15, nullable=False),
    attr("DT_HORA", "datetime", nullable=False),
    attr("CAMPO_ALTERADO", "string", 200),
    attr("VALOR_ANTERIOR", "string", 0),
    attr("VALOR_NOVO", "string", 0),
    attr("SECAO_AFETADA", "string", 200),
    attr("VISIBILIDADE_ANTERIOR", "string", 20),
    attr("VISIBILIDADE_NOVA", "string", 20),
], [key("LOG_ALTERACAO_PERFIL_PKEY", "ID")]))


# --- DATAPACKETS (dados iniciais) ---

# Areas culturais
area_fields = [("ID", "integer"), ("CODIGO", "string", "30"), ("NOME", "string", "100"), ("ID_AREA_PAI", "integer"), ("ATIVO", "boolean")]
_, area_data_header = data_metadata("AREA_CULTURAL", area_fields)

areas_principais = [
    (1, "ARTES_CENICAS", "Artes Cenicas", None, "-1"),
    (2, "ARTES_VISUAIS", "Artes Visuais", None, "-1"),
    (3, "MUSICA", "Musica", None, "-1"),
    (4, "LITERATURA", "Livro e Literatura", None, "-1"),
    (5, "PATRIMONIO", "Memoria e Patrimonio", None, "-1"),
    (6, "CULTURA_POPULAR", "Cultura Popular", None, "-1"),
    (7, "TEATRO", "Teatro", 1, "-1"),
    (8, "DANCA", "Danca", 1, "-1"),
    (9, "CIRCO", "Circo", 1, "-1"),
    (10, "PERFORMANCE", "Performance", 1, "-1"),
    (11, "PINTURA", "Pintura", 2, "-1"),
    (12, "ESCULTURA", "Escultura", 2, "-1"),
    (13, "FOTOGRAFIA", "Fotografia", 2, "-1"),
    (14, "GRAFITE", "Grafite", 2, "-1"),
    (15, "CINEMA", "Cinema", 2, "-1"),
    (16, "VIDEO", "Video", 2, "-1"),
    (17, "MPB", "MPB", 3, "-1"),
    (18, "SAMBA", "Samba", 3, "-1"),
    (19, "FUNK", "Funk", 3, "-1"),
    (20, "ERUDITA", "Erudita", 3, "-1"),
    (21, "POESIA", "Poesia", 4, "-1"),
    (22, "CONTO", "Conto", 4, "-1"),
    (23, "ROMANCE", "Romance", 4, "-1"),
    (24, "PATRIMONIO_IMATERIAL", "Patrimonio Imaterial", 5, "-1"),
    (25, "DOCUMENTACAO", "Documentacao", 5, "-1"),
    (26, "RESTAURACAO", "Restauracao", 5, "-1"),
    (27, "FOLCLORE", "Folclore", 6, "-1"),
    (28, "ARTESANATO", "Artesanato", 6, "-1"),
    (29, "FESTAS_POPULARES", "Festas Populares", 6, "-1"),
    (30, "CAPOEIRA", "Capoeira", 6, "-1"),
]

area_rows = ""
for a in areas_principais:
    area_rows += data_row(area_fields, a)

area_data = area_data_header + f"<DATASET>{area_rows}</DATASET></DATA>"

# Unidades de medida iniciais
unid_fields = [("ID_UNIDADE_MEDIDA", "integer"), ("NOME", "string", "100"), ("SIGLA", "string", "20"), ("DESCRICAO", "string"), ("STATUS", "string", "10")]
_, unid_data_header = data_metadata("UNIDADE_MEDIDA", unid_fields)

unidades = [
    (1, "Diaria", "DI", "Valor por dia de trabalho", "ATIVO"),
    (2, "Hora", "HR", "Valor por hora de trabalho", "ATIVO"),
    (3, "Cache", "CA", "Valor por apresentacao artistica", "ATIVO"),
    (4, "Unidade", "UN", "Valor por unidade de item", "ATIVO"),
    (5, "Servico", "SV", "Valor por servico prestado", "ATIVO"),
    (6, "Verba", "VB", "Valor global por rubrica", "ATIVO"),
    (7, "Metro Quadrado", "M2", "Valor por metro quadrado", "ATIVO"),
    (8, "Mes", "MS", "Valor por mes de trabalho", "ATIVO"),
]

unid_rows = ""
for u in unidades:
    unid_rows += data_row(unid_fields, u)

unid_data = unid_data_header + f"<DATASET>{unid_rows}</DATASET></DATA>"

# Tabelas vazias (so metadata, sem dataset)
empty_data_sections = []
for tbl_name in [
    "GER_PESSOA", "GER_PESSOA_FISICA", "GER_PESSOA_JURIDICA", "ENDERECO",
    "PORTAL_USERS", "PORTAL_USERS_LOG",
    "AGENTE_CULTURAL_PERFIL", "AGENTE_AREA_CULTURAL",
    "HABILIDADE", "AGENTE_HABILIDADE", "PORTFOLIO", "PRESENCA_DIGITAL", "FORMACAO",
    "REPRESENTANTE_LEGAL", "RESPONSAVEL_CADASTRO",
    "DOCUMENTO_TIPO", "DOCUMENTO_TIPO_PERFIL", "DOCUMENTO",
    "GRUPO_DESPESA", "ITEM_DESPESA", "ITEM_UNIDADE",
    "EDITAL", "EDITAL_CATEGORIA", "EDITAL_CRITERIO_AVALIACAO",
    "EDITAL_DOCUMENTO", "EDITAL_GRUPO_DESPESA",
    "EDITAL_IMPOSTO_CONFIG", "EDITAL_IMPOSTO_GRUPO",
    "FORMULARIO", "PAGINA", "CAMPO", "CAMPO_OPCAO",
    "REGRA_VISIBILIDADE", "NAVEGACAO_CONDICIONAL", "VINCULACAO_CADASTRO",
    "LOG_AUDITORIA",
    "INSCRICAO", "INSCRICAO_STATUS_LOG",
    "INSCRICAO_ORCAMENTO_VERSAO", "INSCRICAO_ORCAMENTO_ITEM", "RESPOSTA",
    "LOG_ALTERACAO_PERFIL",
]:
    _, header = data_metadata(tbl_name, [("ID", "integer")])
    empty_data_sections.append(header + "</DATA>")


# --- MONTAR FRZ ---
now = datetime.datetime.now().strftime("%d/%m/%Y %H:%M")

xml = f"""<?xml version="1.0" encoding="iso-8859-1" ?>
<fmaker version="2.3" maker_version="6.1.0.14"  xml:space="preserve">
    <global>
        <ENTITY_SCHEMA>
{"".join(tables)}
</ENTITY_SCHEMA>
        <datapackets>
        {area_data}

        {unid_data}

        {"".join(empty_data_sections)}

        </datapackets>
    </global>
    <system SIS_CODIGO="{SISTEMA}">
        <property name="SIS_DESCRICAO">{SISTEMA_DESC.replace(' ', '&#x0020;')}</property>
        <property name="SIS_SQLDATALIMITE"></property>
        <property name="SIS_SQLDADOSENTIDADE"></property>
        <property name="IMG_CODIGO"></property>
        <property name="IMG_CODIGO_ICONE"></property>
    </system>
<tempo SESSION="ALL">00:00</tempo>
<datageracao>{now}</datageracao>
</fmaker>
"""

output_path = "/Users/filipefalcao/Downloads/MakerAI/manual_maker_ai/frz_extracted/sgfc/database/SGFC_Schema_Completo.frz"

# Gravar FRZ com FNAME=VERSAO e CRLF (formato que o Maker exige)
import zlib
import struct
import time as time_mod

xml_crlf = xml.replace('\r\n', '\n').replace('\n', '\r\n')
xml_bytes = xml_crlf.encode('iso-8859-1')

fname = b'VERSAO'
mtime = int(time_mod.time())
header = b'\x1f\x8b\x08\x08' + struct.pack('<I', mtime) + b'\x00\x00' + fname + b'\x00'
compressor = zlib.compressobj(9, zlib.DEFLATED, -zlib.MAX_WBITS)
compressed = compressor.compress(xml_bytes) + compressor.flush()
crc = zlib.crc32(xml_bytes) & 0xffffffff
isize = len(xml_bytes) & 0xffffffff

with open(output_path, 'wb') as f:
    f.write(header + compressed + struct.pack('<II', crc, isize))

print(f"FRZ gerado: {output_path}")
print(f"Tabelas: {len(tables)}")
print(f"Areas culturais: {len(areas_principais)} registros")
print(f"Unidades de medida: {len(unidades)} registros")

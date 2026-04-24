#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gera o arquivo FRZ de Cadastro de Pessoa para importar no Maker.
Versao completa com todas as validacoes possiveis.
"""

import base64
import struct
import time
import uuid
import os
import zlib
from datetime import datetime

FORM_GUID = "{" + str(uuid.uuid4()).upper() + "}"
MAKER_VERSION = "6.1.0.14"
SIS_CODIGO = "U9C"
FRM_CODIGO = "9001"
FONT = "MS&#x0020;Sans&#x0020;Serif&#x002C;8&#x002C;0000&#x002C;clWindowText"
ABA = "01-Cadastro"
COR = "-16777211"


def encode_dfm_b64(text):
    crlf = text.replace("\r\n", "\n").replace("\n", "\r\n")
    return base64.b64encode(crlf.encode("iso-8859-1")).decode("ascii")


def encode_script_b64(text):
    crlf = text.replace("\r\n", "\n").replace("\n", "\r\n")
    return base64.b64encode(crlf.encode("iso-8859-1")).decode("ascii")


def xml_escape(text):
    out = []
    for ch in text:
        code = ord(ch)
        if ch in ("<", ">", "&", '"', "'") or code > 127:
            out.append(f"&#x{code:04X};")
        elif ch == " ":
            out.append("&#x0020;")
        elif ch == ",":
            out.append("&#x002C;")
        elif ch == ";":
            out.append("&#x003B;")
        elif ch == "=":
            out.append("&#x003D;")
        elif ch == ".":
            out.append("&#x002E;")
        elif ch == "/":
            out.append("&#x002F;")
        elif ch == "\r":
            out.append("&#x000D;")
        elif ch == "\n":
            out.append("&#x000A;")
        else:
            out.append(ch)
    return "".join(out) if out else ""


def _props_xml(props, indent=16):
    pad = " " * indent
    lines = []
    for k, v in props.items():
        lines.append(f'{pad}<property name="{k}">{v}</property>')
    return "\n".join(lines)


class IdGen:
    def __init__(self, start=2000001):
        self._id = start

    def next(self):
        val = self._id
        self._id += 1
        return val


def _container(ids, name, aba, container, x, y, w, h, ordem, css_class="", visivel="True"):
    cod = ids.next()
    props = {
        "Aba": aba, "Alinhar": "0", "Altura": str(h), "Codigo": str(cod),
        "Container": container, "Cor": COR, "Dica": "", "EstiloCss": "",
        "LarguraMaxima": "0", "Nome": name, "NomeClasseCss": xml_escape(css_class) if css_class else "",
        "Ordem": str(ordem), "PosicaoX": str(x), "PosicaoY": str(y),
        "Tamanho": str(w), "Visivel": visivel,
    }
    return f'            <component COM_CODIGO="{cod}" COM_TIPO="P" name="{name}">\n{_props_xml(props)}\n            </component>\n'


def _label(ids, name, aba, container, x, y, w, h, ordem, descricao_html, css_class=""):
    cod = ids.next()
    props = {
        "Aba": aba, "Altura": str(h), "Campo": "", "Codigo": str(cod),
        "Container": container, "Cor": COR, "Descricao": xml_escape(descricao_html),
        "Dica": "", "EstiloCss": "", "Fonte": FONT, "Habilitado": "True",
        "HorzAlignment": "0", "Nome": name,
        "NomeClasseCss": xml_escape(css_class) if css_class else "",
        "Ordem": str(ordem), "PosicaoX": str(x), "PosicaoY": str(y),
        "QuebraAutomaticaDeLinha": "True", "Tamanho": str(w),
        "Tipo": "", "ValorInicial": "", "VertAlignment": "0", "Visivel": "True",
    }
    return f'            <component COM_CODIGO="{cod}" COM_TIPO="L" name="{name}">\n{_props_xml(props)}\n            </component>\n'


def _edit(ids, name, aba, container, campo, descricao, x, y, w, ordem, tab,
          tipo="", readonly=False, placeholder=""):
    cod = ids.next()
    props = {
        "Modelo": "1", "Tabela": "", "NomeClasseCss": "", "Container": container,
        "Codigo": str(cod), "Nome": name, "Ordem": str(ordem),
        "PosicaoX": str(x), "PosicaoY": str(y), "Aba": aba,
        "Altura": "33", "Cor": COR, "Descricao": xml_escape(descricao),
        "Dica": "", "Fonte": FONT, "FonteDescricao": "",
        "Habilitado": "False" if readonly else "True", "Visivel": "True",
        "Tabulacao": str(tab), "Tabular": "True",
        "Campo": campo, "ApenasLeitura": "True" if readonly else "False",
        "Atributos": "", "Conteudo": "0", "Senha": "False", "TamanhoMaximo": "0",
        "Tipo": tipo, "AutoCompletar": "True", "LabelPosition": "0",
        "Tamanho": str(w), "Placeholder": xml_escape(placeholder) if placeholder else "",
        "ValorInicial": "", "EstiloCss": "",
    }
    return f'            <component COM_CODIGO="{cod}" COM_TIPO="E" name="{name}">\n{_props_xml(props)}\n            </component>\n'


def _combo(ids, name, aba, container, campo, descricao, x, y, w, ordem, tab,
           lista, valores):
    cod = ids.next()
    props = {
        "Tabela": "", "NomeClasseCss": "", "Container": container,
        "Codigo": str(cod), "Aba": aba, "Tipo": "", "Atributos": "", "Campo": campo,
        "Descricao": xml_escape(descricao), "Tamanho": str(w),
        "PosicaoX": str(x), "PosicaoY": str(y), "Altura": "33",
        "Nome": name, "Tabulacao": str(tab), "Tabular": "True",
        "ApenasLeitura": "False",
        "Lista": xml_escape(lista), "Valores": xml_escape(valores) if valores else "",
        "Fonte": FONT, "FonteDescricao": "", "Cor": COR,
        "Visivel": "True", "Habilitado": "True", "LabelPosition": "0",
        "LarguraExibicao": "0", "Ordem": str(ordem), "Dica": "",
        "Placeholder": "", "EstiloCss": "", "ValorInicial": "",
    }
    return f'            <component COM_CODIGO="{cod}" COM_TIPO="C" name="{name}">\n{_props_xml(props)}\n            </component>\n'


def _memo(ids, name, aba, container, campo, descricao, x, y, w, h, ordem, tab):
    cod = ids.next()
    props = {
        "Aba": aba, "Altura": str(h), "ApenasLeitura": "False", "Atributos": "",
        "Campo": campo, "Codigo": str(cod), "Container": container, "Cor": COR,
        "Descricao": xml_escape(descricao), "Dica": "", "EstiloCss": "",
        "Fonte": FONT, "FonteDescricao": "", "Habilitado": "True",
        "LabelPosition": "0", "Nome": name, "NomeClasseCss": "",
        "Ordem": str(ordem), "Placeholder": "", "PosicaoX": str(x),
        "PosicaoY": str(y), "QuebraAutomaticaDeLinha": "True",
        "Tabulacao": str(tab), "Tabular": "True", "Tamanho": str(w),
        "TamanhoMaximo": "0", "TextoRico": "False", "Tipo": "",
        "ValorInicial": "", "Visivel": "True",
    }
    return f'            <component COM_CODIGO="{cod}" COM_TIPO="M" name="{name}">\n{_props_xml(props)}\n            </component>\n'


def _card(ids, card_name, header_name, label_name, aba, container_pai,
          x, y, w, h, ordem, icon_class, titulo):
    xml = _container(ids, card_name, aba, container_pai, x, y, w, h, ordem, "form-group card")
    xml += _container(ids, header_name, aba, card_name, 0, 0, w, 40, 0, "form-group card-header")
    html = f'<div class="text-primary card-heading-premium"><i class="{icon_class}"></i> <span>{titulo}</span></div>'
    xml += _label(ids, label_name, aba, header_name, 10, 5, w - 20, 30, 0, html)
    return xml

# --- Part 2: Validation script XML builder ---

def build_validation_script():
    """Gera o XML compilado (REG_SCRIPT) da regra de validacao completa."""
    return """\
<?xml version="1.0" encoding="ISO-8859-1"?>
<RULE ID="200" NAME="Cadastro&#x20;Pessoa&#x20;-&#x20;Ao&#x20;Gravar" COMPONENTNAME="FlowStart1" DESCRIPTION="Inicio" DEBUG="FALSE">
<HEADER>
<AUTHOR>master</AUTHOR>
<DATE>31/03/2026 10:00:00</DATE>
<RANKING>10,0</RANKING>
</HEADER>
<VAR TYPE="Letras" SIZE="">formGUID</VAR>
<VAR TYPE="Variante" SIZE="">valorNome</VAR>
<VAR TYPE="Variante" SIZE="">valorCPF</VAR>
<VAR TYPE="Variante" SIZE="">valorCNPJ</VAR>
<VAR TYPE="Variante" SIZE="">valorEmail</VAR>
<VAR TYPE="Variante" SIZE="">valorTelefone</VAR>
<VAR TYPE="Variante" SIZE="">valorCelular</VAR>
<VAR TYPE="Variante" SIZE="">valorTipoPessoa</VAR>
<VAR TYPE="Variante" SIZE="">valorCEP</VAR>
<VAR TYPE="Variante" SIZE="">valorEndereco</VAR>
<VAR TYPE="Variante" SIZE="">valorCidade</VAR>
<VAR TYPE="Variante" SIZE="">valorUF</VAR>
<VAR TYPE="Variante" SIZE="">valorDataNasc</VAR>
<VAR TYPE="Variante" SIZE="">valorID</VAR>
<VAR TYPE="L\xf3gico" SIZE="">cpfValido</VAR>
<VAR TYPE="L\xf3gico" SIZE="">cnpjValido</VAR>
<VAR TYPE="L\xf3gico" SIZE="">emailValido</VAR>
<VAR TYPE="L\xf3gico" SIZE="">campoVazio</VAR>
<VAR TYPE="L\xf3gico" SIZE="">campoVazio2</VAR>
<VAR TYPE="L\xf3gico" SIZE="">ehPF</VAR>
<VAR TYPE="L\xf3gico" SIZE="">ehPJ</VAR>
<VAR TYPE="Tabela" SIZE="">consultaDup</VAR>
<VAR TYPE="Variante" SIZE="">qtdDup</VAR>
<VAR TYPE="L\xf3gico" SIZE="">existeDup</VAR>
<VAR TYPE="Variante" SIZE="">dataAtual</VAR>
<VAR TYPE="L\xf3gico" SIZE="">dataFutura</VAR>
<DECLARERETURN TYPE="" SIZE=""/>
<ACTION>

<!-- 1. Obter GUID do formulario -->
<EXPRESSION RETURN="formGUID" COMPONENTNAME="fExp_GetGUID" DESCRIPTION="Obt\xe9m&#x20;GUID&#x20;do&#x20;formul\xe1rio.">
<FUNCTION NAME="Obter&#x20;GUID&#x20;do&#x20;Formul\xe1rio&#x20;Atual" REALNAME="ebfGetGUIDActualForm">
</FUNCTION>
</EXPRESSION>

<!-- Obter valores dos campos -->
<EXPRESSION RETURN="valorNome" COMPONENTNAME="fExp_GetNome" DESCRIPTION="Obter&#x20;valor&#x20;Nome.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_NOME</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorTipoPessoa" COMPONENTNAME="fExp_GetTipo" DESCRIPTION="Obter&#x20;valor&#x20;Tipo&#x20;Pessoa.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_TIPO_PESSOA</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorCPF" COMPONENTNAME="fExp_GetCPF" DESCRIPTION="Obter&#x20;valor&#x20;CPF.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_CPF</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorCNPJ" COMPONENTNAME="fExp_GetCNPJ" DESCRIPTION="Obter&#x20;valor&#x20;CNPJ.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_CNPJ</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorEmail" COMPONENTNAME="fExp_GetEmail" DESCRIPTION="Obter&#x20;valor&#x20;Email.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_EMAIL</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorTelefone" COMPONENTNAME="fExp_GetTel" DESCRIPTION="Obter&#x20;valor&#x20;Telefone.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_TELEFONE</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorCelular" COMPONENTNAME="fExp_GetCel" DESCRIPTION="Obter&#x20;valor&#x20;Celular.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_CELULAR</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorCEP" COMPONENTNAME="fExp_GetCEP" DESCRIPTION="Obter&#x20;valor&#x20;CEP.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_CEP</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorEndereco" COMPONENTNAME="fExp_GetEnd" DESCRIPTION="Obter&#x20;valor&#x20;Endereco.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_ENDERECO</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorCidade" COMPONENTNAME="fExp_GetCid" DESCRIPTION="Obter&#x20;valor&#x20;Cidade.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_CIDADE</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorUF" COMPONENTNAME="fExp_GetUF" DESCRIPTION="Obter&#x20;valor&#x20;UF.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_UF</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorDataNasc" COMPONENTNAME="fExp_GetDtNasc" DESCRIPTION="Obter&#x20;valor&#x20;Data&#x20;Nascimento.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_DATA_NASCIMENTO</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<EXPRESSION RETURN="valorID" COMPONENTNAME="fExp_GetID" DESCRIPTION="Obter&#x20;valor&#x20;ID.">
<FUNCTION NAME="Obter&#x20;Valor&#x20;do&#x20;Componente" REALNAME="ebfFormGetComponentValue">
<PARAMS><VARIABLE NAME="formGUID"/><CONSTANT TYPE="Componente" NULL="FALSE"  >CAD_ID</CONSTANT></PARAMS>
</FUNCTION>
</EXPRESSION>

<!-- ============ VALIDACAO 1: Nome obrigatorio ============ -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkNome" DESCRIPTION="Verifica&#x20;se&#x20;Nome&#x20;vazio.">
<FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">
<PARAMS><VARIABLE NAME="valorNome"/></PARAMS>
</FUNCTION>
</EXPRESSION>
<DECISION COMPONENTNAME="fDecNome" DESCRIPTION="Nome&#x20;vazio?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertNome" DESCRIPTION="Alerta&#x20;Nome."><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;Nome&#x20;\xe9&#x20;obrigat\xf3rio.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopNome" DESCRIPTION="Stop."><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndNome" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<!-- ============ VALIDACAO 2: Tipo Pessoa obrigatorio ============ -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkTipo" DESCRIPTION="Verifica&#x20;Tipo&#x20;Pessoa.">
<FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty">
<PARAMS><VARIABLE NAME="valorTipoPessoa"/></PARAMS>
</FUNCTION>
</EXPRESSION>
<DECISION COMPONENTNAME="fDecTipo" DESCRIPTION="Tipo&#x20;vazio?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertTipo"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;Tipo&#x20;de&#x20;Pessoa&#x20;\xe9&#x20;obrigat\xf3rio.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopTipo"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndTipo" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<!-- ============ VALIDACAO 3: CPF/CNPJ condicional ============ -->
<EXPRESSION RETURN="ehPF" COMPONENTNAME="fChkPF" DESCRIPTION="Verifica&#x20;se&#x20;PF.">
<FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="valorTipoPessoa"/><CONSTANT TYPE="Letras" NULL="FALSE"  >PF</CONSTANT></PARAMS></FUNCTION>
</EXPRESSION>
<DECISION COMPONENTNAME="fDecPF" DESCRIPTION="Eh&#x20;PF?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="ehPF"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<!-- CPF obrigatorio -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkCPFVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorCPF"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCPFVazio" DESCRIPTION="CPF&#x20;vazio?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCPFVazio"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;CPF&#x20;\xe9&#x20;obrigat\xf3rio&#x20;para&#x20;Pessoa&#x20;F\xedsica.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCPFVazio"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCPFVazio" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>
<!-- CPF valido -->
<EXPRESSION RETURN="cpfValido" COMPONENTNAME="fValCPF"><FUNCTION NAME="Validar&#x20;CPF" REALNAME="ebfIsCpf"><PARAMS><VARIABLE NAME="valorCPF"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCPFInv" DESCRIPTION="CPF&#x20;invalido?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="cpfValido"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >false</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCPFInv"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;CPF&#x20;informado&#x20;\xe9&#x20;inv\xe1lido.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCPFInv"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCPFInv" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>
<!-- CPF duplicado -->
<EXPRESSION RETURN="consultaDup" COMPONENTNAME="fQryCPFDup"><FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >SELECT&#x20;COUNT(*)&#x20;AS&#x20;QTD&#x20;FROM&#x20;cad_pessoa&#x20;WHERE&#x20;CAD_CPF&#x20;=&#x20;:valorCPF&#x20;AND&#x20;CAD_ID&#x20;&lt;&gt;&#x20;COALESCE(:valorID,0)</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="qtdDup" COMPONENTNAME="fGetQtdCPF"><FUNCTION NAME="Campo" REALNAME="ebfSQLField"><PARAMS><VARIABLE NAME="consultaDup"/><CONSTANT TYPE="Campo" NULL="FALSE"  >QTD</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="existeDup" COMPONENTNAME="fChkCPFDup"><FUNCTION NAME="Maior" REALNAME="isGreater"><PARAMS><VARIABLE NAME="qtdDup"/><CONSTANT TYPE="N\xfamero" NULL="FALSE"  >0</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCPFDup" DESCRIPTION="CPF&#x20;duplicado?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="existeDup"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCPFDup"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >J\xe1&#x20;existe&#x20;uma&#x20;pessoa&#x20;cadastrada&#x20;com&#x20;este&#x20;CPF.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCPFDup"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCPFDup" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION><RULERETURN COMPONENTNAME="fEndCPFOk" DESCRIPTION="Fim"></RULERETURN></ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFTRUE>
<IFFALSE><ACTION>
<!-- PJ: CNPJ obrigatorio -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkCNPJVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorCNPJ"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCNPJVazio" DESCRIPTION="CNPJ&#x20;vazio?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCNPJVazio"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;CNPJ&#x20;\xe9&#x20;obrigat\xf3rio&#x20;para&#x20;Pessoa&#x20;Jur\xeddica.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCNPJVazio"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCNPJVazio" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>
<EXPRESSION RETURN="cnpjValido" COMPONENTNAME="fValCNPJ"><FUNCTION NAME="Validar&#x20;CNPJ" REALNAME="ebfIsCnpj"><PARAMS><VARIABLE NAME="valorCNPJ"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCNPJInv" DESCRIPTION="CNPJ&#x20;invalido?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="cnpjValido"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >false</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCNPJInv"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;CNPJ&#x20;informado&#x20;\xe9&#x20;inv\xe1lido.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCNPJInv"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCNPJInv" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>
<!-- CNPJ duplicado -->
<EXPRESSION RETURN="consultaDup" COMPONENTNAME="fQryCNPJDup"><FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >SELECT&#x20;COUNT(*)&#x20;AS&#x20;QTD&#x20;FROM&#x20;cad_pessoa&#x20;WHERE&#x20;CAD_CNPJ&#x20;=&#x20;:valorCNPJ&#x20;AND&#x20;CAD_ID&#x20;&lt;&gt;&#x20;COALESCE(:valorID,0)</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="qtdDup" COMPONENTNAME="fGetQtdCNPJ"><FUNCTION NAME="Campo" REALNAME="ebfSQLField"><PARAMS><VARIABLE NAME="consultaDup"/><CONSTANT TYPE="Campo" NULL="FALSE"  >QTD</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="existeDup" COMPONENTNAME="fChkCNPJDup"><FUNCTION NAME="Maior" REALNAME="isGreater"><PARAMS><VARIABLE NAME="qtdDup"/><CONSTANT TYPE="N\xfamero" NULL="FALSE"  >0</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCNPJDup" DESCRIPTION="CNPJ&#x20;duplicado?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="existeDup"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCNPJDup"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >J\xe1&#x20;existe&#x20;uma&#x20;pessoa&#x20;cadastrada&#x20;com&#x20;este&#x20;CNPJ.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCNPJDup"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCNPJDup" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION><RULERETURN COMPONENTNAME="fEndCNPJOk" DESCRIPTION="Fim"></RULERETURN></ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>

<!-- ============ VALIDACAO 4: Email (quando preenchido) ============ -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkEmailVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorEmail"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecEmailVazio" DESCRIPTION="Email&#x20;preenchido?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >false</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION RETURN="emailValido" COMPONENTNAME="fValEmail"><FUNCTION NAME="Validar&#x20;E-mail" REALNAME="ebfIsEmail"><PARAMS><VARIABLE NAME="valorEmail"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecEmailInv" DESCRIPTION="Email&#x20;invalido?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="emailValido"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >false</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertEmailInv"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;E-mail&#x20;informado&#x20;\xe9&#x20;inv\xe1lido.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopEmailInv"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndEmailInv" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>
<!-- Email duplicado -->
<EXPRESSION RETURN="consultaDup" COMPONENTNAME="fQryEmailDup"><FUNCTION NAME="Abrir&#x20;Consulta" REALNAME="ebfSQLExecuteQuery"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >SELECT&#x20;COUNT(*)&#x20;AS&#x20;QTD&#x20;FROM&#x20;cad_pessoa&#x20;WHERE&#x20;CAD_EMAIL&#x20;=&#x20;:valorEmail&#x20;AND&#x20;CAD_ID&#x20;&lt;&gt;&#x20;COALESCE(:valorID,0)</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="qtdDup" COMPONENTNAME="fGetQtdEmail"><FUNCTION NAME="Campo" REALNAME="ebfSQLField"><PARAMS><VARIABLE NAME="consultaDup"/><CONSTANT TYPE="Campo" NULL="FALSE"  >QTD</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="existeDup" COMPONENTNAME="fChkEmailDup"><FUNCTION NAME="Maior" REALNAME="isGreater"><PARAMS><VARIABLE NAME="qtdDup"/><CONSTANT TYPE="N\xfamero" NULL="FALSE"  >0</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecEmailDup" DESCRIPTION="Email&#x20;duplicado?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="existeDup"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertEmailDup"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >J\xe1&#x20;existe&#x20;uma&#x20;pessoa&#x20;cadastrada&#x20;com&#x20;este&#x20;E-mail.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopEmailDup"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndEmailDup" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION><RULERETURN COMPONENTNAME="fEndEmailOk" DESCRIPTION="Fim"></RULERETURN></ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<!-- ============ VALIDACAO 5: Telefone OU Celular ============ -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkTelVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorTelefone"/></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION RETURN="campoVazio2" COMPONENTNAME="fChkCelVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorCelular"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecContato" DESCRIPTION="Ambos&#x20;vazios?">
<CONDITION><FUNCTION NAME="E" REALNAME="andOperator"><PARAMS><VARIABLE NAME="campoVazio"/><VARIABLE NAME="campoVazio2"/></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertContato"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >Informe&#x20;ao&#x20;menos&#x20;um&#x20;telefone&#x20;ou&#x20;celular.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopContato"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndContato" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<!-- ============ VALIDACAO 6: Endereco obrigatorio ============ -->
<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkCEPVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorCEP"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCEP" DESCRIPTION="CEP&#x20;vazio?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCEP"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;CEP&#x20;\xe9&#x20;obrigat\xf3rio.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCEP"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCEP" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkEndVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorEndereco"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecEnd" DESCRIPTION="Endereco&#x20;vazio?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertEnd"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;Endere\xe7o&#x20;\xe9&#x20;obrigat\xf3rio.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopEnd"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndEnd" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkCidVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorCidade"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecCid" DESCRIPTION="Cidade&#x20;vazia?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertCid"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;Cidade&#x20;\xe9&#x20;obrigat\xf3rio.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopCid"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndCid" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<EXPRESSION RETURN="campoVazio" COMPONENTNAME="fChkUFVazio"><FUNCTION NAME="\xc9&#x20;Nulo&#x20;ou&#x20;Vazio" REALNAME="isNullOrEmpty"><PARAMS><VARIABLE NAME="valorUF"/></PARAMS></FUNCTION></EXPRESSION>
<DECISION COMPONENTNAME="fDecUF" DESCRIPTION="UF&#x20;vazia?">
<CONDITION><FUNCTION NAME="Igual" REALNAME="isEqual"><PARAMS><VARIABLE NAME="campoVazio"/><CONSTANT TYPE="L\xf3gico" NULL="FALSE"  >true</CONSTANT></PARAMS></FUNCTION></CONDITION>
<IFTRUE><ACTION>
<EXPRESSION COMPONENTNAME="fAlertUF"><FUNCTION NAME="Alertar&#x20;Aguardando&#x20;Ok" REALNAME="ebfAlertMessage"><PARAMS><CONSTANT TYPE="Letras" NULL="FALSE"  >O&#x20;campo&#x20;UF&#x20;\xe9&#x20;obrigat\xf3rio.</CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<EXPRESSION COMPONENTNAME="fStopUF"><FUNCTION NAME="Interromper&#x20;Fluxo" REALNAME="ebfStopRuleExecution"><PARAMS><CONSTANT TYPE="Letras" NULL="TRUE"  ></CONSTANT></PARAMS></FUNCTION></EXPRESSION>
<RULERETURN COMPONENTNAME="fEndUF" DESCRIPTION="Fim"></RULERETURN>
</ACTION></IFTRUE>
<IFFALSE><ACTION>

<!-- ============ FIM - Tudo OK ============ -->
<RULERETURN COMPONENTNAME="fEndOK" DESCRIPTION="Fim"></RULERETURN>

</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>

</ACTION></IFFALSE>
</DECISION>

</ACTION></IFFALSE>
</DECISION>
</ACTION></IFFALSE>
</DECISION>
</ACTION>
</RULE>
"""

# --- Part 3: DFM interface builder (simplified - visual fluxo) ---

def build_validation_interface():
    """Gera o DFM (Delphi Form) simplificado da regra de validacao."""
    # Using a minimal DFM with just Start and End nodes since the
    # Maker runtime primarily uses REG_SCRIPT for execution.
    dfm = r"""object FlowSubModel1: TFlowSubModel
  object FlowStart1: TFlowStart
    Left = 400
    Top = 30
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
    Variables = 'formGUID,Letras,,;valorNome,Variante,,;valorCPF,Variante,,;valorCNPJ,Variante,,;valorEmail,Variante,,;valorTelefone,Variante,,;valorCelular,Variante,,;valorTipoPessoa,Variante,,;valorCEP,Variante,,;valorEndereco,Variante,,;valorCidade,Variante,,;valorUF,Variante,,;valorDataNasc,Variante,,;valorID,Variante,,;cpfValido,L'#243'gico,,;cnpjValido,L'#243'gico,,;emailValido,L'#243'gico,,;campoVazio,L'#243'gico,,;campoVazio2,L'#243'gico,,;ehPF,L'#243'gico,,;ehPJ,L'#243'gico,,;consultaDup,Tabela,,;qtdDup,Variante,,;existeDup,L'#243'gico,,;dataAtual,Variante,,;dataFutura,L'#243'gico,,'
    WorkFormCod = -1
  end
  object FlowEnd1: TFlowEnd
    Left = 400
    Top = 120
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
    InputNames = 'FlowLine1'
    Description = 'Fim'
  end
  object FlowLine1: TFlowLine
    Left = 399
    Top = 48
    Width = 40
    Height = 92
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
    OutputNames = 'FlowEnd1'
    Region = 0
    Style = psSolid
    Decision = False
  end
end
"""
    return dfm


CSS_GLOBAL = """\
.card-heading-premium {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--bs-primary);
}
.card-heading-premium i {
    font-size: 1rem;
}
.header-title-premium {
    padding: 8px 0;
}
.header-title-premium h3 {
    margin: 0;
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--bs-emphasis-color);
}
.header-title-premium h3 i {
    color: var(--bs-primary);
    margin-right: 8px;
}
.header-title-premium small {
    display: block;
    margin-top: 4px;
    font-size: 0.85rem;
    color: var(--bs-muted-color);
    font-weight: 400;
}
"""

# --- Part 4: Form XML builder and main ---

def build_form_xml():
    """Monta o XML completo do FRZ com layout profissional e validacoes."""
    interface_dfm = build_validation_interface()
    interface_b64 = encode_dfm_b64(interface_dfm)
    script_xml = build_validation_script()
    script_b64 = encode_script_b64(script_xml)

    campos = [
        "CAD_ID", "CAD_TIPO_PESSOA", "CAD_NOME", "CAD_NOME_FANTASIA",
        "CAD_CPF", "CAD_CNPJ", "CAD_RG", "CAD_INSCRICAO_ESTADUAL",
        "CAD_DATA_NASCIMENTO", "CAD_SEXO", "CAD_ESTADO_CIVIL",
        "CAD_EMAIL", "CAD_TELEFONE", "CAD_CELULAR",
        "CAD_CEP", "CAD_ENDERECO", "CAD_NUMERO", "CAD_COMPLEMENTO",
        "CAD_BAIRRO", "CAD_CIDADE", "CAD_UF",
        "CAD_SITUACAO", "CAD_OBSERVACAO",
    ]
    update_fields = "\r\n".join(campos[1:])
    sql_select = "Select " + ", ".join(f"cad.{c}" for c in campos) + " From cad_pessoa cad"
    css_escaped = xml_escape(CSS_GLOBAL)

    # Variables string for rule
    var_list = [
        "formGUID,Letras,,", "valorNome,Variante,,", "valorCPF,Variante,,",
        "valorCNPJ,Variante,,", "valorEmail,Variante,,", "valorTelefone,Variante,,",
        "valorCelular,Variante,,", "valorTipoPessoa,Variante,,", "valorCEP,Variante,,",
        "valorEndereco,Variante,,", "valorCidade,Variante,,", "valorUF,Variante,,",
        "valorDataNasc,Variante,,", "valorID,Variante,,",
        "cpfValido,L\u00f3gico,,", "cnpjValido,L\u00f3gico,,", "emailValido,L\u00f3gico,,",
        "campoVazio,L\u00f3gico,,", "campoVazio2,L\u00f3gico,,",
        "ehPF,L\u00f3gico,,", "ehPJ,L\u00f3gico,,",
        "consultaDup,Tabela,,", "qtdDup,Variante,,", "existeDup,L\u00f3gico,,",
        "dataAtual,Variante,,", "dataFutura,L\u00f3gico,,",
    ]
    var_str = xml_escape(";".join(var_list))

    reg_desc = xml_escape("Validação completa: campos obrigatórios, formato CPF/CNPJ/E-mail, duplicidade via SQL, contato obrigatório e endereço.")
    reg_nome = xml_escape("Cadastro Pessoa - Ao Gravar")

    xml = f"""\
<?xml version="1.0" encoding="iso-8859-1" ?>
<fmaker version="2.3" maker_version="{MAKER_VERSION}"  xml:space="preserve">
    <global>
        <rules>
            <rule REG_NOME="{reg_nome}" REG_COD="200">
                <property name="REG_COD">200</property>
                <property name="REG_NOME">{reg_nome}</property>
                <property name="REG_DESCRICAO">{reg_desc}</property>
                <property name="REG_PARAMS"></property>
                <property name="REG_VARIAVEIS">{var_str}</property>
                <property name="REG_PARAMS_OUT"></property>
                <property name="REG_DATA"></property>
                <property name="REG_HORA"></property>
                <property name="REG_COMPILADA"></property>
                <property name="REG_DESTINO">1</property>
                <property name="REG_HASH"></property>
                <property name="REG_INTERFACE" binary-encoded="True"><![CDATA[{interface_b64}]]></property>
                <property name="REG_SCRIPT" binary-encoded="True"><![CDATA[{script_b64}]]></property>
                <property name="CAT_PATH"><![CDATA[\\\\Uso%20Geral]]></property>
            </rule>
        </rules>
    </global>
    <system SIS_CODIGO="{SIS_CODIGO}">
        <form FRM_CODIGO="{FRM_CODIGO}" FRM_GUID="{FORM_GUID}">
            <property name="IMG_INCLUIR">1</property>
            <property name="IMG_ALTERAR">2</property>
            <property name="IMG_EXCLUIR">8</property>
            <property name="IMG_GRAVAR">12</property>
            <property name="IMG_CANCELAR">13</property>
            <property name="IMG_ATUALIZAR">7</property>
            <property name="IMG_GRAVAR_MAIS">15</property>
            <property name="IMG_LOG">16</property>
            <property name="IMG_VALORES_PADRAO">17</property>
            <property name="IMG_UTILITARIO">1</property>
            <property name="IMG_SAIR">11</property>
            <property name="IMG_IMPRIMIR">10</property>
            <property name="IMG_AJUDA">14</property>
            <property name="IMG_PROXIMO">5</property>
            <property name="IMG_ULTIMO">6</property>
            <property name="IMG_PRIMEIRO">3</property>
            <property name="IMG_ANTERIOR">4</property>
            <property name="FRM_DESCRICAO">{xml_escape("Cadastro de Pessoa")}</property>
            <property name="FRM_POSICAOX">200</property>
            <property name="FRM_POSICAOY">50</property>
            <property name="FRM_TAMANHO">1100</property>
            <property name="FRM_ALTURA">1050</property>
            <property name="FRM_TIPO_CRIACAO">0</property>
            <property name="FNT_CAMPOCHAVE">CAD_ID</property>
            <property name="FNT_TABELA">cad_pessoa</property>
            <property name="FNT_SQLSELECT"><![CDATA[{sql_select}]]></property>
            <property name="FNT_SQLINSERT"></property>
            <property name="FNT_SQLUPDATE"><![CDATA[{update_fields}]]></property>
            <property name="FNT_SQLDELETE"></property>
            <property name="FNT_CAMPOINCREMENTO"></property>
            <property name="FNT_CAMPOGRADE">CAD_NOME&#x003B;CAD_CPF&#x003B;CAD_CNPJ&#x003B;CAD_EMAIL&#x003B;CAD_SITUACAO</property>
            <property name="FNT_CAMPOPESQUISA">CAD_NOME&#x003B;CAD_CPF&#x003B;CAD_CNPJ</property>
            <property name="FNT_SQLDEFAULT">CAD_ID&#x003D;SQL(&#x0022;SELECT&#x0020;COALESCE(MAX(CAD_ID)&#x002C;0)&#x002B;1&#x0020;FROM&#x0020;cad_pessoa&#x0022;)</property>
            <property name="FNT_SQLMASCARA"></property>
            <property name="REL_CODIGO"></property>
"""

    ids = IdGen()
    now_str = datetime.now().strftime("%d/%m/%Y %H:%M:%S")

    # --- Form config component ---
    f_cod = ids.next()
    xml += f"""            <component COM_CODIGO="{f_cod}" COM_TIPO="F" name="">
                <property name="IASuggestionEvents"></property>
                <property name="Ajuda"></property>
                <property name="CampoVersao"></property>
                <property name="Navegacao">TRUE</property>
                <property name="EditarAoDuploClicar">TRUE</property>
                <property name="Abas">TRUE</property>
                <property name="EntrarComoPesquisa">FALSE</property>
                <property name="ModoLegado">FALSE</property>
                <property name="AbaLocalizar">TRUE</property>
                <property name="Cor">clWindow</property>
                <property name="ClasseCss">{css_escaped}</property>
                <property name="FonteDeDados"></property>
                <property name="Imagem"></property>
                <property name="ExibicaoImagemFundo"></property>
                <property name="Centralizado">False</property>
                <property name="CentralizadoVertical">False</property>
                <property name="BotaoMaximizar">False</property>
                <property name="BotaoMinimizar">True</property>
                <property name="BotaoFechar">True</property>
                <property name="BarraDeRolagem">True</property>
                <property name="Apresentacao">0</property>
                <property name="Modal">False</property>
                <property name="Popup">FALSE</property>
                <property name="PreLoad">FALSE</property>
                <property name="Responsivo">TRUE</property>
                <property name="FormularioLocalizar">0</property>
                <property name="BarraNavegacaoFixa">FALSE</property>
                <property name="AIGenerated">TRUE</property>
                <property name="AIPrompt"></property>
                <property name="MensagemErroChavePrimaria"></property>
                <property name="MensagemErroChaveEstrangeira"></property>
                <property name="AbaLocalizarPermitirRelatorioListagem">TRUE</property>
                <property name="AbaLocalizarPermitirRelatorioHtml">TRUE</property>
                <property name="AbaLocalizarPermitirRelatorioXml">TRUE</property>
                <property name="AbaLocalizarPermitirRelatorioTxt">TRUE</property>
                <property name="AbaLocalizarPermitirRelatorioPdf">TRUE</property>
                <property name="AbaLocalizarPermitirRelatorioJson">TRUE</property>
                <property name="AbaLocalizarPermitirRelatorioXlsx">TRUE</property>
                <property name="AbaLocalizarPermitirOrdenarGrade">TRUE</property>
                <property name="AbaLocalizarPermitirRemoverOrdenacaoGrade">TRUE</property>
                <property name="AbaLocalizarPermitirImportarDados">TRUE</property>
                <property name="AbaLocalizarPermitirFiltroAvancado">TRUE</property>
                <property name="UltimaModificacao">{xml_escape(now_str)}</property>
                <property name="UltimoUsuario">master</property>
                <event name="Antes de Gravar">
                    <action name="12">
                        <property name="ACC_CONDICAO"></property>
                        <param name="Entrada"><![CDATA[]]></param>
                        <param name="Nome"><![CDATA[Cadastro Pessoa - Ao Gravar]]></param>
                    </action>
                </event>
            </component>
"""

    # --- Page Header ---
    titulo_html = '<div class="header-title-premium"><h3><i class="fas fa-user-plus"></i> <span>Cadastro de Pessoa</span></h3><small>Gerenciamento completo de dados pessoais e empresariais</small></div>'
    xml += _label(ids, "MakerLabel1", ABA, "", 16, 10, 1060, 60, 0,
                  titulo_html, "form-group fw-bold text-dark mb-3")

    # ======================= CARD 1: Identificacao (y=80, h=280) =======================
    xml += _card(ids, "MakerContainer1", "MakerContainer2", "MakerLabel2",
                 ABA, "", 16, 80, 1060, 280, 1, "fas fa-id-card", "Identifica\u00e7\u00e3o")

    ord_c = 2
    xml += _combo(ids, "cmbTipoPessoa", ABA, "MakerContainer1", "CAD_TIPO_PESSOA",
                  "Tipo de Pessoa *", 16, 50, 200, ord_c, 0,
                  "Pessoa F\u00edsica\r\nPessoa Jur\u00eddica", "PF\r\nPJ"); ord_c += 1
    xml += _combo(ids, "cmbSituacao", ABA, "MakerContainer1", "CAD_SITUACAO",
                  "Situa\u00e7\u00e3o", 230, 50, 150, ord_c, 1,
                  "Ativo\r\nInativo", "A\r\nI"); ord_c += 1
    xml += _edit(ids, "edtID", ABA, "MakerContainer1", "CAD_ID", "ID",
                 700, 50, 100, ord_c, 0, readonly=True); ord_c += 1
    xml += _edit(ids, "edtNome", ABA, "MakerContainer1", "CAD_NOME", "Nome / Raz\u00e3o Social *",
                 16, 100, 700, ord_c, 2); ord_c += 1
    xml += _edit(ids, "edtNomeFantasia", ABA, "MakerContainer1", "CAD_NOME_FANTASIA",
                 "Nome Fantasia", 730, 100, 300, ord_c, 3); ord_c += 1
    xml += _edit(ids, "edtCPF", ABA, "MakerContainer1", "CAD_CPF", "CPF *",
                 16, 150, 200, ord_c, 4, tipo="CPF"); ord_c += 1
    xml += _edit(ids, "edtCNPJ", ABA, "MakerContainer1", "CAD_CNPJ", "CNPJ *",
                 230, 150, 220, ord_c, 5, tipo="CNPJ"); ord_c += 1
    xml += _edit(ids, "edtRG", ABA, "MakerContainer1", "CAD_RG", "RG",
                 470, 150, 180, ord_c, 6); ord_c += 1
    xml += _edit(ids, "edtIE", ABA, "MakerContainer1", "CAD_INSCRICAO_ESTADUAL",
                 "Inscri\u00e7\u00e3o Estadual", 670, 150, 180, ord_c, 7); ord_c += 1
    xml += _edit(ids, "edtDataNasc", ABA, "MakerContainer1", "CAD_DATA_NASCIMENTO",
                 "Data Nascimento / Funda\u00e7\u00e3o", 16, 200, 200, ord_c, 8,
                 tipo="DATA&#x0020;(ANO&#x0020;4)"); ord_c += 1
    xml += _combo(ids, "cmbSexo", ABA, "MakerContainer1", "CAD_SEXO", "Sexo",
                  230, 200, 150, ord_c, 9,
                  "Masculino\r\nFeminino\r\nOutro", "M\r\nF\r\nO"); ord_c += 1
    xml += _combo(ids, "cmbEstadoCivil", ABA, "MakerContainer1", "CAD_ESTADO_CIVIL",
                  "Estado Civil", 400, 200, 200, ord_c, 10,
                  "Solteiro(a)\r\nCasado(a)\r\nDivorciado(a)\r\nVi\u00favo(a)\r\nUni\u00e3o Est\u00e1vel\r\nOutro",
                  "Solteiro\r\nCasado\r\nDivorciado\r\nViuvo\r\nUniao Estavel\r\nOutro"); ord_c += 1

    # ======================= CARD 2: Contato (y=370, h=140) =======================
    xml += _card(ids, "MakerContainer3", "MakerContainer4", "MakerLabel3",
                 ABA, "", 16, 370, 1060, 140, ord_c, "fas fa-envelope", "Contato")
    ord_c += 1
    xml += _edit(ids, "edtEmail", ABA, "MakerContainer3", "CAD_EMAIL", "E-mail",
                 16, 50, 400, ord_c, 11); ord_c += 1
    xml += _edit(ids, "edtTelefone", ABA, "MakerContainer3", "CAD_TELEFONE", "Telefone *",
                 430, 50, 200, ord_c, 12); ord_c += 1
    xml += _edit(ids, "edtCelular", ABA, "MakerContainer3", "CAD_CELULAR", "Celular *",
                 650, 50, 200, ord_c, 13); ord_c += 1

    # ======================= CARD 3: Endereco (y=520, h=230) =======================
    xml += _card(ids, "MakerContainer5", "MakerContainer6", "MakerLabel4",
                 ABA, "", 16, 520, 1060, 230, ord_c, "fas fa-map-marker-alt", "Endere\u00e7o")
    ord_c += 1
    xml += _edit(ids, "edtCEP", ABA, "MakerContainer5", "CAD_CEP", "CEP *",
                 16, 50, 150, ord_c, 14); ord_c += 1
    xml += _edit(ids, "edtEndereco", ABA, "MakerContainer5", "CAD_ENDERECO",
                 "Endere\u00e7o *", 180, 50, 500, ord_c, 15); ord_c += 1
    xml += _edit(ids, "edtNumero", ABA, "MakerContainer5", "CAD_NUMERO",
                 "N\u00famero", 700, 50, 100, ord_c, 16); ord_c += 1
    xml += _edit(ids, "edtComplemento", ABA, "MakerContainer5", "CAD_COMPLEMENTO",
                 "Complemento", 16, 100, 250, ord_c, 17); ord_c += 1
    xml += _edit(ids, "edtBairro", ABA, "MakerContainer5", "CAD_BAIRRO", "Bairro",
                 280, 100, 250, ord_c, 18); ord_c += 1
    xml += _edit(ids, "edtCidade", ABA, "MakerContainer5", "CAD_CIDADE", "Cidade *",
                 550, 100, 300, ord_c, 19); ord_c += 1
    ufs = "AC\r\nAL\r\nAP\r\nAM\r\nBA\r\nCE\r\nDF\r\nES\r\nGO\r\nMA\r\nMT\r\nMS\r\nMG\r\nPA\r\nPB\r\nPR\r\nPE\r\nPI\r\nRJ\r\nRN\r\nRS\r\nRO\r\nRR\r\nSC\r\nSP\r\nSE\r\nTO"
    xml += _combo(ids, "cmbUF", ABA, "MakerContainer5", "CAD_UF", "UF *",
                  870, 100, 100, ord_c, 20, ufs, ufs); ord_c += 1

    # ======================= CARD 4: Observacoes (y=760, h=170) =======================
    xml += _card(ids, "MakerContainer7", "MakerContainer8", "MakerLabel5",
                 ABA, "", 16, 760, 1060, 170, ord_c, "fas fa-sticky-note", "Observa\u00e7\u00f5es")
    ord_c += 1
    xml += _memo(ids, "memoObs", ABA, "MakerContainer7", "CAD_OBSERVACAO",
                 "Observa\u00e7\u00f5es", 16, 50, 1020, 100, ord_c, 21)

    # --- Fechamento ---
    now = datetime.now().strftime("%d/%m/%Y %H:%M")
    xml += f"""        </form>
        <tempo SESSION="FORMS">00:01</tempo>
    </system>
<tempo SESSION="ALL">00:01</tempo>
<datageracao>{now}</datageracao>
</fmaker>
"""
    return xml


def write_frz(xml_bytes, output_path):
    """Grava o FRZ como gzip com FNAME='VERSAO'."""
    mtime = int(time.time())
    header = b"\x1f\x8b"       # magic
    header += b"\x08"           # method (deflate)
    header += b"\x08"           # flags (FNAME)
    header += struct.pack("<I", mtime)
    header += b"\x00"           # extra flags
    header += b"\x00"           # OS
    header += b"VERSAO\x00"    # original filename

    compressor = zlib.compressobj(9, zlib.DEFLATED, -15)
    compressed = compressor.compress(xml_bytes)
    compressed += compressor.flush()

    crc = zlib.crc32(xml_bytes) & 0xFFFFFFFF
    size = len(xml_bytes) & 0xFFFFFFFF

    with open(output_path, "wb") as f:
        f.write(header)
        f.write(compressed)
        f.write(struct.pack("<I", crc))
        f.write(struct.pack("<I", size))


def main():
    xml_content = build_form_xml()
    xml_crlf = xml_content.replace("\r\n", "\n").replace("\n", "\r\n")
    xml_bytes = xml_crlf.encode("iso-8859-1")

    output_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "CadastroPessoa.frz"
    )

    write_frz(xml_bytes, output_path)
    print(f"FRZ gerado: {output_path}")
    print(f"Tamanho: {os.path.getsize(output_path)} bytes")


if __name__ == "__main__":
    main()

"""Gera FRZ: Calculo de Folha de Pagamento CLT.

Regras:
  1. FOL - Calcular INSS        (servidor, tabela progressiva 2024)
  2. FOL - Calcular IRRF        (servidor, tabela progressiva 2024)
  3. FOL - Calcular Folha CLT   (servidor, orquestrador completo)

Todas as operacoes usam funcoes nativas do Maker (oprAdd, oprSubtract,
oprMultiply, oprDivide, isMinorOrEqual). Nenhuma consulta SQL.
"""
import sys, os, gzip, time as _time

sys.path.insert(0, os.path.dirname(__file__))

from mcp_maker.builder import (
    FrzBuilder, RuleSpec, RuleParam, RuleVar,
    StepExpression, StepDecision, StepSubRoutine,
    SubRoutineParam, ParamVariable, ParamConstant, ParamFunction,
)

# -----------------------------------------------------------------------
# REG_CODs unicos
# -----------------------------------------------------------------------
ID_CALCULAR_INSS = 60
ID_CALCULAR_IRRF = 61
ID_CALCULAR_FOLHA = 62

# -----------------------------------------------------------------------
# Helpers para reduzir verbosidade
# -----------------------------------------------------------------------
N = "Número"
F = "Fracionado"
V = "Variante"

def _const(valor, tipo=F):
    return ParamConstant(str(valor), tipo_dado=tipo)

def _var(nome, tipo=V):
    return ParamVariable(nome, tipo_dado=tipo)

def _add(a, b):
    return ParamFunction(funcao="oprAdd", nome_amigavel="Soma",
                         params=[a, b], tipo_retorno=N)

def _sub(a, b):
    return ParamFunction(funcao="oprSubtract", nome_amigavel="Subtração",
                         params=[a, b], tipo_retorno=N)

def _mul(a, b):
    return ParamFunction(funcao="oprMultiply", nome_amigavel="Multiplicação",
                         params=[a, b], tipo_retorno=N)

def _div(a, b):
    return ParamFunction(funcao="oprDivide", nome_amigavel="Divisão",
                         params=[a, b], tipo_retorno=F)

def _round2(expr):
    return ParamFunction(funcao="ebfArredondaDecimal",
                         nome_amigavel="Arredondar Casas Decimais",
                         params=[expr, _const("2", "Inteiro"),
                                 ParamConstant("FALSE", tipo_dado="Lógico")],
                         tipo_retorno=F)

def _expr(nome, descricao, funcao, nome_amigavel, params, retorno="", tipo_retorno=""):
    return StepExpression(
        nome=nome, descricao=descricao, funcao=funcao,
        nome_amigavel=nome_amigavel, params=params,
        retorno=retorno, tipo_retorno=tipo_retorno,
    )


# =======================================================================
# REGRA 1: FOL - Calcular INSS (servidor)
# Tabela progressiva 2024:
#   Faixa 1: ate  1.412,00  -> 7,5%   (acum max:  105,90)
#   Faixa 2: ate  2.666,68  -> 9,0%   (acum max:  218,82)
#   Faixa 3: ate  4.000,03  -> 12,0%  (acum max:  378,82)
#   Faixa 4: ate  7.786,02  -> 14,0%  (acum max:  908,86 = teto)
# =======================================================================

def _inss_faixa_expr(nome, desc, acumulado, limite_inferior, aliquota, retorno="vINSS"):
    """Gera Expression: vINSS = acumulado + (pSalarioBruto - limiteInf) * aliquota, arredondado."""
    if acumulado == 0:
        inner = _mul(_var("pSalarioBruto"), _const(aliquota))
    else:
        inner = _add(
            _const(acumulado),
            _mul(_sub(_var("pSalarioBruto"), _const(limite_inferior)), _const(aliquota)),
        )
    return _expr(nome, desc, "ebfArredondaDecimal", "Arredondar Casas Decimais",
                 [inner, _const("2", "Inteiro"), ParamConstant("FALSE", tipo_dado="Lógico")],
                 retorno=retorno, tipo_retorno=F)


regra_inss = RuleSpec(
    nome="FOL - Calcular INSS",
    destino=2,
    codigo=ID_CALCULAR_INSS,
    categoria=r"\Uso\Folha",
    retorno_tipo=F,
    parametros=[RuleParam("pSalarioBruto", F, "")],
    variaveis=[RuleVar("vINSS", F, "")],
    passos=[
        StepDecision(
            nome="FlowDecision1",
            descricao="Salario <= 1.412,00?",
            funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
            params=[_var("pSalarioBruto"), _const("1412")],
            sim=[
                _inss_faixa_expr("FlowExprFx1", "INSS Faixa 1 (7,5%)",
                                 0, 0, "0.075"),
            ],
            nao=[
                StepDecision(
                    nome="FlowDecision2",
                    descricao="Salario <= 2.666,68?",
                    funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
                    params=[_var("pSalarioBruto"), _const("2666.68")],
                    sim=[
                        _inss_faixa_expr("FlowExprFx2", "INSS Faixa 2 (9%)",
                                         "105.90", "1412", "0.09"),
                    ],
                    nao=[
                        StepDecision(
                            nome="FlowDecision3",
                            descricao="Salario <= 4.000,03?",
                            funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
                            params=[_var("pSalarioBruto"), _const("4000.03")],
                            sim=[
                                _inss_faixa_expr("FlowExprFx3", "INSS Faixa 3 (12%)",
                                                 "218.82", "2666.68", "0.12"),
                            ],
                            nao=[
                                StepDecision(
                                    nome="FlowDecision4",
                                    descricao="Salario <= 7.786,02?",
                                    funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
                                    params=[_var("pSalarioBruto"), _const("7786.02")],
                                    sim=[
                                        _inss_faixa_expr("FlowExprFx4", "INSS Faixa 4 (14%)",
                                                         "378.82", "4000.03", "0.14"),
                                    ],
                                    nao=[
                                        _expr("FlowExprTeto", "INSS Teto",
                                              "toString", "Para Letras",
                                              [_const("908.86", V)],
                                              retorno="vINSS", tipo_retorno=F),
                                    ],
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)


# =======================================================================
# REGRA 2: FOL - Calcular IRRF (servidor)
# Base = salario bruto - INSS - (dependentes * 189.59)
# Tabela progressiva 2024:
#   Faixa 1: ate  2.259,20  -> 0%     (isento)
#   Faixa 2: ate  2.826,65  -> 7,5%   deduz  169,44
#   Faixa 3: ate  3.751,05  -> 15,0%  deduz  381,44
#   Faixa 4: ate  4.664,68  -> 22,5%  deduz  662,77
#   Faixa 5: acima           -> 27,5%  deduz  896,00
# =======================================================================

def _irrf_faixa_expr(nome, desc, aliquota, deducao, retorno="vIRRF"):
    """Gera Expression: vIRRF = arredondar(vBase * aliquota - deducao, 2)."""
    inner = _sub(
        _mul(_var("vBase"), _const(aliquota)),
        _const(deducao),
    )
    return _expr(nome, desc, "ebfArredondaDecimal", "Arredondar Casas Decimais",
                 [inner, _const("2", "Inteiro"), ParamConstant("FALSE", tipo_dado="Lógico")],
                 retorno=retorno, tipo_retorno=F)


regra_irrf = RuleSpec(
    nome="FOL - Calcular IRRF",
    destino=2,
    codigo=ID_CALCULAR_IRRF,
    categoria=r"\Uso\Folha",
    retorno_tipo=F,
    parametros=[
        RuleParam("pSalarioBruto", F, ""),
        RuleParam("pINSS", F, ""),
        RuleParam("pDependentes", "Inteiro", ""),
    ],
    variaveis=[
        RuleVar("vBase", F, ""),
        RuleVar("vDeducaoDep", F, ""),
        RuleVar("vIRRF", F, ""),
    ],
    passos=[
        # vDeducaoDep = pDependentes * 189.59
        _expr("FlowExpr1", "Deducao por dependentes",
              "oprMultiply", "Multiplicação",
              [_var("pDependentes"), _const("189.59")],
              retorno="vDeducaoDep", tipo_retorno=F),

        # vBase = pSalarioBruto - pINSS - vDeducaoDep
        _expr("FlowExpr2", "Base de calculo IRRF",
              "oprSubtract", "Subtração",
              [_sub(_var("pSalarioBruto"), _var("pINSS")), _var("vDeducaoDep")],
              retorno="vBase", tipo_retorno=F),

        # Decisoes progressivas
        StepDecision(
            nome="FlowDecision1",
            descricao="Base <= 2.259,20? (isento)",
            funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
            params=[_var("vBase"), _const("2259.20")],
            sim=[
                _expr("FlowExprIsento", "IRRF Isento",
                      "toString", "Para Letras",
                      [_const("0", V)],
                      retorno="vIRRF", tipo_retorno=F),
            ],
            nao=[
                StepDecision(
                    nome="FlowDecision2",
                    descricao="Base <= 2.826,65? (7,5%)",
                    funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
                    params=[_var("vBase"), _const("2826.65")],
                    sim=[
                        _irrf_faixa_expr("FlowExprFx2", "IRRF 7,5%", "0.075", "169.44"),
                    ],
                    nao=[
                        StepDecision(
                            nome="FlowDecision3",
                            descricao="Base <= 3.751,05? (15%)",
                            funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
                            params=[_var("vBase"), _const("3751.05")],
                            sim=[
                                _irrf_faixa_expr("FlowExprFx3", "IRRF 15%", "0.15", "381.44"),
                            ],
                            nao=[
                                StepDecision(
                                    nome="FlowDecision4",
                                    descricao="Base <= 4.664,68? (22,5%)",
                                    funcao="isMinorOrEqual", nome_amigavel="Menor ou Igual",
                                    params=[_var("vBase"), _const("4664.68")],
                                    sim=[
                                        _irrf_faixa_expr("FlowExprFx4", "IRRF 22,5%", "0.225", "662.77"),
                                    ],
                                    nao=[
                                        _irrf_faixa_expr("FlowExprFx5", "IRRF 27,5%", "0.275", "896.00"),
                                    ],
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)


# =======================================================================
# REGRA 3: FOL - Calcular Folha CLT (servidor, orquestrador)
#
# Fluxo:
#   1. Calcular salario bruto (base + extras + adicionais + comissoes)
#   2. Chamar FOL - Calcular INSS
#   3. Chamar FOL - Calcular IRRF
#   4. Calcular vale-transporte (6% do base se optante)
#   5. Calcular desconto faltas (base / diasUteis * diasFaltas)
#   6. Calcular total descontos
#   7. Calcular salario liquido
#   8. Calcular FGTS (8% do bruto)
# =======================================================================

regra_folha = RuleSpec(
    nome="FOL - Calcular Folha CLT",
    destino=2,
    codigo=ID_CALCULAR_FOLHA,
    categoria=r"\Uso\Folha",
    parametros=[
        RuleParam("pSalarioBase", F, ""),
        RuleParam("pHorasExtras", F, ""),
        RuleParam("pValorHoraExtra", F, ""),
        RuleParam("pAdicNoturno", F, ""),
        RuleParam("pInsalubridade", F, ""),
        RuleParam("pPericulosidade", F, ""),
        RuleParam("pComissoes", F, ""),
        RuleParam("pDiasFaltas", F, ""),
        RuleParam("pDiasUteis", F, ""),
        RuleParam("pDependentes", "Inteiro", ""),
        RuleParam("pOptanteVT", "Lógico", ""),
    ],
    variaveis=[
        RuleVar("vBruto", F, ""),
        RuleVar("vINSS", F, ""),
        RuleVar("vIRRF", F, ""),
        RuleVar("vValeTransporte", F, ""),
        RuleVar("vDescontoFaltas", F, ""),
        RuleVar("vTotalDescontos", F, ""),
        RuleVar("vSalarioLiquido", F, ""),
        RuleVar("vFGTS", F, ""),
        RuleVar("vHorasExtrasValor", F, ""),
    ],
    passos=[
        # 1. vHorasExtrasValor = pHorasExtras * pValorHoraExtra
        _expr("FlowExpr1", "Valor horas extras",
              "oprMultiply", "Multiplicação",
              [_var("pHorasExtras"), _var("pValorHoraExtra")],
              retorno="vHorasExtrasValor", tipo_retorno=F),

        # 2. vBruto = pSalarioBase + vHorasExtrasValor + pAdicNoturno
        #           + pInsalubridade + pPericulosidade + pComissoes
        _expr("FlowExpr2", "Salario bruto",
              "oprAdd", "Soma",
              [
                  _add(
                      _add(
                          _add(_var("pSalarioBase"), _var("vHorasExtrasValor")),
                          _var("pAdicNoturno"),
                      ),
                      _add(
                          _add(_var("pInsalubridade"), _var("pPericulosidade")),
                          _var("pComissoes"),
                      ),
                  ),
                  _const("0"),
              ],
              retorno="vBruto", tipo_retorno=F),

        # 3. Chamar FOL - Calcular INSS
        StepSubRoutine(
            nome="FlowSubRoutine1",
            rule_name="FOL - Calcular INSS",
            rule_id=ID_CALCULAR_INSS,
            params=[SubRoutineParam("pSalarioBruto", _var("vBruto"))],
            return_var="vINSS",
            description="Calcular INSS",
        ),

        # 4. Chamar FOL - Calcular IRRF
        StepSubRoutine(
            nome="FlowSubRoutine2",
            rule_name="FOL - Calcular IRRF",
            rule_id=ID_CALCULAR_IRRF,
            params=[
                SubRoutineParam("pSalarioBruto", _var("vBruto")),
                SubRoutineParam("pINSS", _var("vINSS")),
                SubRoutineParam("pDependentes", _var("pDependentes")),
            ],
            return_var="vIRRF",
            description="Calcular IRRF",
        ),

        # 5. Vale-transporte: 6% do salario base se optante
        StepDecision(
            nome="FlowDecision1",
            descricao="Optante VT?",
            funcao="isEqual", nome_amigavel="Igual",
            params=[_var("pOptanteVT"), ParamConstant("TRUE", tipo_dado="Lógico")],
            sim=[
                _expr("FlowExprVT", "VT = 6% do base",
                      "oprMultiply", "Multiplicação",
                      [_var("pSalarioBase"), _const("0.06")],
                      retorno="vValeTransporte", tipo_retorno=F),
            ],
            nao=[
                _expr("FlowExprVT0", "Sem VT",
                      "toString", "Para Letras",
                      [_const("0", V)],
                      retorno="vValeTransporte", tipo_retorno=F),
            ],
        ),

        # 6. Desconto faltas = (pSalarioBase / pDiasUteis) * pDiasFaltas
        _expr("FlowExpr3", "Desconto por faltas",
              "ebfArredondaDecimal", "Arredondar Casas Decimais",
              [
                  _mul(_div(_var("pSalarioBase"), _var("pDiasUteis")), _var("pDiasFaltas")),
                  _const("2", "Inteiro"),
                  ParamConstant("FALSE", tipo_dado="Lógico"),
              ],
              retorno="vDescontoFaltas", tipo_retorno=F),

        # 7. Total descontos = INSS + IRRF + VT + Faltas
        _expr("FlowExpr4", "Total de descontos",
              "oprAdd", "Soma",
              [
                  _add(_var("vINSS"), _var("vIRRF")),
                  _add(_var("vValeTransporte"), _var("vDescontoFaltas")),
              ],
              retorno="vTotalDescontos", tipo_retorno=F),

        # 8. Salario liquido = bruto - descontos
        _expr("FlowExpr5", "Salario liquido",
              "oprSubtract", "Subtração",
              [_var("vBruto"), _var("vTotalDescontos")],
              retorno="vSalarioLiquido", tipo_retorno=F),

        # 9. FGTS = 8% do bruto (encargo empregador)
        _expr("FlowExpr6", "FGTS (8% do bruto)",
              "oprMultiply", "Multiplicação",
              [_var("vBruto"), _const("0.08")],
              retorno="vFGTS", tipo_retorno=F),
    ],
)


# -----------------------------------------------------------------------
# Montar e gerar FRZ
# -----------------------------------------------------------------------
regras = [regra_inss, regra_irrf, regra_folha]

builder = FrzBuilder(rules=regras, forms=[], tables=[])
xml_content = builder.build_xml()

output_path = os.path.join(os.path.dirname(__file__), "CalculoFolhaCLT.frz")
xml_crlf = xml_content.replace("\r\n", "\n").replace("\n", "\r\n")
xml_bytes = xml_crlf.encode("iso-8859-1", errors="replace")

with open(output_path, "wb") as f:
    gz = gzip.GzipFile(fileobj=f, mode="wb", filename="VERSAO", mtime=int(_time.time()))
    gz.write(xml_bytes)
    gz.close()

with open(output_path, "r+b") as f:
    f.seek(8)
    f.write(b'\x00\x00')

print(f"FRZ gerado: {output_path}")
print(f"  Tamanho: {os.path.getsize(output_path):,} bytes")
print(f"  Regras: {len(regras)}")
for r in regras:
    print(f"    - {r.nome} (REG_COD={r.codigo}, {'servidor' if r.destino==0 else 'cliente'})")
    print(f"      Params: {', '.join(p.nome for p in r.parametros)}")
    print(f"      Vars:   {', '.join(v.nome for v in r.variaveis)}")

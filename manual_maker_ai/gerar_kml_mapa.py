"""Gera FRZ: Ler KML e renderizar pontos no Google Maps.

Regras:
  1. KML - Ler Arquivo       (servidor) - le arquivo, converte XML para JSON
  2. KML - Renderizar no Mapa (cliente) - chama regra 1, executa JS no mapa
"""
import sys, os, gzip, time as _time

sys.path.insert(0, os.path.dirname(__file__))

from mcp_maker.builder import (
    FrzBuilder, RuleSpec, RuleParam, RuleVar,
    StepExpression, StepDecision, StepSubRoutine,
    SubRoutineParam, ParamVariable, ParamConstant, ParamFunction,
)

# -----------------------------------------------------------------------
# REG_CODs
# -----------------------------------------------------------------------
ID_LER_KML = 70
ID_RENDERIZAR_MAPA = 71

# -----------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------
V = "Variante"
L = "Letras"

def _var(nome, tipo=V):
    return ParamVariable(nome, tipo_dado=tipo)

def _const(valor, tipo=L):
    return ParamConstant(str(valor), tipo_dado=tipo)

def _expr(nome, descricao, funcao, nome_amigavel, params, retorno="", tipo_retorno=""):
    return StepExpression(
        nome=nome, descricao=descricao, funcao=funcao,
        nome_amigavel=nome_amigavel, params=params,
        retorno=retorno, tipo_retorno=tipo_retorno,
    )


# =======================================================================
# REGRA 1: KML - Ler Arquivo (servidor)
#
# Fluxo:
#   1. Abrir arquivo para leitura
#   2. Ler todo o conteudo
#   3. Fechar arquivo
#   4. Converter XML (KML) para JSON
#   5. Retornar JSON
# =======================================================================

regra_ler_kml = RuleSpec(
    nome="KML - Ler Arquivo",
    destino=2,
    codigo=ID_LER_KML,
    categoria=r"\Uso\KML",
    retorno_tipo=L,
    parametros=[
        RuleParam("pCaminhoArquivo", L, "500"),
    ],
    variaveis=[
        RuleVar("vArquivo", V, ""),
        RuleVar("vConteudo", L, ""),
        RuleVar("vJSON", L, ""),
    ],
    passos=[
        _expr("FlowExpr1", "Abrir arquivo KML",
              "ebfFileOpenToRead", "Abrir arquivo para leitura",
              [_var("pCaminhoArquivo", L)],
              retorno="vArquivo", tipo_retorno=V),

        _expr("FlowExpr2", "Ler conteudo do arquivo",
              "ebfFileReadAll", "Ler todo arquivo",
              [_var("vArquivo"), ParamConstant("FALSE", tipo_dado="Lógico")],
              retorno="vConteudo", tipo_retorno=L),

        _expr("FlowExpr3", "Fechar arquivo",
              "ebfFileClose", "Fechar arquivo",
              [_var("vArquivo")],
              retorno="", tipo_retorno=""),

        _expr("FlowExpr4", "Converter KML para JSON",
              "ebfXMLToJSON", "XML para JSON",
              [_var("vConteudo", L), ParamConstant("TRUE", tipo_dado="Lógico")],
              retorno="vJSON", tipo_retorno=L),
    ],
)


# =======================================================================
# REGRA 2: KML - Renderizar no Mapa (cliente)
#
# Fluxo:
#   1. Chamar KML - Ler Arquivo (SubRoutine servidor)
#   2. Verificar se JSON retornou vazio
#   3. Montar template JavaScript com placeholder
#   4. Substituir placeholder pelo JSON real
#   5. Executar JavaScript no navegador
#
# O JavaScript:
#   - Parseia o JSON do KML
#   - Navega ate Document > Placemark
#   - Para cada Placemark com Point, extrai lat/lng
#   - Cria marcadores no Google Maps
#   - Ajusta zoom para exibir todos os pontos
# =======================================================================

JS_TEMPLATE = (
    "(function(){"
    "var d=JSON.parse(__KML_JSON__);"
    "var root=d.kml||d;"
    "var doc=root.Document||root;"
    "var pms=doc.Placemark||[];"
    "if(!Array.isArray(pms))pms=[pms];"
    "var mapEl=document.querySelector('[id*=__COMP_ID__] .gm-style')"
    "||document.getElementById('__COMP_ID__');"
    "if(!mapEl){alert('Componente de mapa nao encontrado');return;}"
    "var map=mapEl.__gm_map||new google.maps.Map(mapEl,{zoom:4,"
    "center:{lat:-15.78,lng:-47.92}});"
    "var bounds=new google.maps.LatLngBounds();"
    "var count=0;"
    "pms.forEach(function(pm){"
    "var coords=null;"
    "if(pm.Point&&pm.Point.coordinates)coords=pm.Point.coordinates;"
    "else if(pm.LineString&&pm.LineString.coordinates)coords=pm.LineString.coordinates;"
    "if(!coords)return;"
    "var lines=coords.trim().split(/\\\\s+/);"
    "lines.forEach(function(line){"
    "var p=line.split(',');"
    "if(p.length>=2){"
    "var pos={lat:parseFloat(p[1]),lng:parseFloat(p[0])};"
    "new google.maps.Marker({position:pos,map:map,title:pm.name||''});"
    "bounds.extend(pos);count++;"
    "}});"
    "});"
    "if(count>1)map.fitBounds(bounds);"
    "else if(count===1)map.setZoom(15);"
    "})()"
)

regra_renderizar = RuleSpec(
    nome="KML - Renderizar no Mapa",
    destino=1,
    codigo=ID_RENDERIZAR_MAPA,
    categoria=r"\Uso\KML",
    parametros=[
        RuleParam("pCaminhoArquivo", L, "500"),
        RuleParam("pComponenteMapa", L, "100"),
    ],
    variaveis=[
        RuleVar("vJSON", L, ""),
        RuleVar("vJSTemplate", L, ""),
        RuleVar("vJS", L, ""),
        RuleVar("vResultado", V, ""),
    ],
    passos=[
        # 1. Chamar regra servidor para ler KML
        StepSubRoutine(
            nome="FlowSubRoutine1",
            rule_name="KML - Ler Arquivo",
            rule_id=ID_LER_KML,
            params=[
                SubRoutineParam("pCaminhoArquivo", _var("pCaminhoArquivo", L)),
            ],
            return_var="vJSON",
            description="Ler arquivo KML",
        ),

        # 2. Verificar se retornou dados
        StepDecision(
            nome="FlowDecision1",
            descricao="JSON vazio?",
            funcao="isNullOrEmpty", nome_amigavel="É Nulo ou Vazio",
            params=[_var("vJSON", L)],
            sim=[
                _expr("FlowExprErro", "Erro: arquivo vazio",
                      "toString", "Para Letras",
                      [_const("Arquivo KML vazio ou invalido", V)],
                      retorno="vResultado", tipo_retorno=V),
            ],
            nao=[
                # 3. Montar template JS
                _expr("FlowExpr1", "Template JavaScript",
                      "toString", "Para Letras",
                      [_const(JS_TEMPLATE, V)],
                      retorno="vJSTemplate", tipo_retorno=L),

                # 4. Substituir __KML_JSON__ pelo JSON real
                _expr("FlowExpr2", "Inserir dados JSON no script",
                      "ebfReplaceAll", "Trocar Todas as Subsequências",
                      [_var("vJSTemplate", L), _const("__KML_JSON__"), _var("vJSON", L)],
                      retorno="vJS", tipo_retorno=L),

                # 5. Substituir __COMP_ID__ pelo componente do mapa
                _expr("FlowExpr3", "Inserir ID do componente mapa",
                      "ebfReplaceAll", "Trocar Todas as Subsequências",
                      [_var("vJS", L), _const("__COMP_ID__"), _var("pComponenteMapa", L)],
                      retorno="vJS", tipo_retorno=L),

                # 6. Executar JavaScript
                _expr("FlowExpr4", "Renderizar pontos no mapa",
                      "ebfExecuteJS", "Executar JavaScript",
                      [_var("vJS", L)],
                      retorno="vResultado", tipo_retorno=V),
            ],
        ),
    ],
)


# -----------------------------------------------------------------------
# Montar e gerar FRZ
# -----------------------------------------------------------------------
regras = [regra_ler_kml, regra_renderizar]

builder = FrzBuilder(rules=regras, forms=[], tables=[])
xml_content = builder.build_xml()

output_path = os.path.join(os.path.dirname(__file__), "KMLGoogleMaps.frz")
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
    dest = "servidor" if r.destino == 2 else "cliente"
    print(f"    - {r.nome} (REG_COD={r.codigo}, {dest})")
    print(f"      Params: {', '.join(p.nome for p in r.parametros)}")

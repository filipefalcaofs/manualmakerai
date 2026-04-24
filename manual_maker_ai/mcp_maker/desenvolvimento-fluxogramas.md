# Desenvolvimento Orientado a Fluxograma — Maker/WebRun

Guia para traduzir logica de backend (codigo) em fluxogramas Maker usando funcoes nativas.
No Maker, voce NAO escreve codigo — voce COMPOE funcoes em um fluxograma visual.

---

## Principio Fundamental

Cada operacao que voce faria em codigo (ler campo, consultar banco, validar, retornar erro)
vira um NO no fluxograma, conectado ao proximo por uma LINHA.

```
CODIGO                              FLUXOGRAMA
─────                               ──────────
const valor = getField("NOME")  →   Obter Campo(NOME) → vNome
if (!valor) throw Error(...)    →   isNullOrEmpty(vNome) → [SIM] → ActNewErrorMessage
db.query("SELECT ...")          →   Abrir Consulta(SQL) → qry
const count = row.QTD           →   Campo(qry, QTD) → vQtd
db.close()                      →   Fechar Consulta(qry)
if (count > 0) { ... }          →   Maior que?(vQtd, 0) → [SIM/NAO]
return { status: "ok" }         →   JSON - Criar Objeto(status, ok) → jsonRetorno
```

---

## 1. Leitura de Campos do Formulario

### REGRA: Usar ebfSQLGetFormField (Obter Campo), NUNCA ebfFormChangeComponentValue

| Funcao | Uso correto |
|---|---|
| `ebfSQLGetFormField` (Obter Campo) | Ler valor do CAMPO de dados do formulario. Usar em regras de evento (Antes de Inserir/Alterar/Gravar/Deletar). Tipo param: Campo. Requer GUID do form e FIELDINDEX. |
| `ebfFormChangeComponentValue` (Alterar Valor do Componente) | Manipular componente VISUAL (setar valor, ler valor de UI). Usar em regras Ao Modificar, scripts de tela, dashboards. Tipo param: Letras. |

### Quando usar cada uma

```
EVENTO DE FORMULARIO (Antes de Inserir/Alterar/Gravar/Deletar):
  → ebfSQLGetFormField — le do dataset do formulario
  → Parametro tipo "Campo" com GUID e FIELDINDEX

EVENTO DE COMPONENTE (Ao Modificar, Ao Clicar):
  → ebfFormChangeComponentValue — le/escreve no componente UI
  → Parametro tipo "Letras" com nome do componente (edtNome, cmbStatus)

REGRA SERVIDOR (destino=2):
  → ebfSQLExecuteQuery + ebfSQLField — le do banco de dados
  → Nao tem acesso a componentes UI nem campos de formulario
```

### Spec JSON para ebfSQLGetFormField

```json
{
  "tipo": "expressao",
  "nome": "lerNome",
  "descricao": "Ler campo NOME do formulario",
  "funcao": "ebfSQLGetFormField",
  "nome_amigavel": "Obter Campo",
  "params": [{
    "tipo": "constante",
    "valor": "NOME",
    "tipo_dado": "Campo",
    "guid": "{GUID-DO-FORMULARIO}",
    "field_index": 1
  }],
  "retorno": "vNome",
  "tipo_retorno": "Variante"
}
```

O `field_index` e a posicao 0-based do campo no SQL SELECT do formulario.
O `guid` e o FRM_GUID do formulario.

---

## 2. Validacao de Campos Obrigatorios

### Codigo equivalente:
```javascript
if (!body.nome) return reply.code(400).send({ error: "Nome obrigatorio" });
if (!body.email) return reply.code(400).send({ error: "Email obrigatorio" });
```

### Fluxograma (regra cliente, destino=1, evento Antes de Inserir E Antes de Alterar):
```
Inicio
  ↓
Obter Campo(NOME) → vNome
  ↓
isNullOrEmpty(vNome)?
  [SIM] → ActNewErrorMessage("Campo Nome e obrigatorio")
           ↓
         Interromper Fluxo()
  [NAO] → Obter Campo(EMAIL) → vEmail
           ↓
         isNullOrEmpty(vEmail)?
           [SIM] → ActNewErrorMessage("Campo Email e obrigatorio")
                    ↓
                  Interromper Fluxo()
           [NAO] → (continua para gravar)
  ↓
Fim
```

### Evento correto: Antes de Inserir + Antes de Alterar (NAO existe Antes de Gravar)

O Maker NAO tem evento "Antes de Gravar". A validacao de campos obrigatorios
deve ser vinculada a DOIS eventos: Antes de Inserir e Antes de Alterar.
Uma mesma regra pode ser referenciada por ambos os eventos.

Sempre adicionar ebfStopRuleExecution apos ActNewErrorMessage para cancelar a operacao.

---

## 3. Verificacao de Duplicidade (Padrao Completo)

### Codigo equivalente:
```javascript
const existente = await db.user.findFirst({ where: { email: body.email } });
if (existente) return reply.code(409).send({ error: "Email ja cadastrado" });
```

### No Maker, isso requer DUAS regras:

**Regra 1 — Servidor (destino=2): Verificar no banco**
```
Inicio (pEmail: Letras)
  ↓
Abrir Consulta("SELECT COUNT(*) AS QTD FROM USUARIO WHERE EMAIL = :pEmail") → qryCheck
  ↓
Campo(qryCheck, QTD) → vQtd
  ↓
Fechar Consulta(qryCheck)
  ↓
Maior que?(vQtd, 0)
  [SIM] → JSON - Criar Objeto(status, erro, msg, Email ja cadastrado) → jsonRetorno
  [NAO] → JSON - Criar Objeto(status, ok) → jsonRetorno
  ↓
Fim (retorna jsonRetorno)
```

**Regra 2 — Cliente (destino=1): Chamar servidor e tratar resultado**
```
Inicio
  ↓
Obter Campo(EMAIL) → vEmail          ← ebfSQLGetFormField, NAO ebfFormChangeComponentValue
  ↓
[Sub-rotina] Verificar Email [SRV](pEmail=vEmail) → vResultado
  ↓
JSON - Obter Valor(vResultado, status) → vStatus
  ↓
Igual?(vStatus, erro)
  [SIM] → ActNewErrorMessage("Email ja cadastrado")
           ↓
         Interromper Fluxo()           ← ebfStopRuleExecution
  [NAO] → (continua)
  ↓
Fim
```

### Por que duas regras?

O cliente (JavaScript no navegador) NAO tem acesso ao banco de dados.
Qualquer consulta SQL precisa ser executada no SERVIDOR (Java/Tomcat).
A comunicacao entre cliente e servidor e feita via JSON:
- Cliente chama sub-rotina servidor (CALLRULE/ebfFlowExecute)
- Servidor executa SQL, monta JSON de resposta
- Cliente recebe JSON e toma decisao

---

## 4. Integridade Referencial (Antes de Deletar)

### Codigo equivalente:
```javascript
const vinculados = await db.inscricao.count({ where: { editalId: id } });
if (vinculados > 0) {
  return reply.code(409).send({ error: "Existem inscricoes vinculadas" });
}
await db.edital.delete({ where: { id } });
```

### Fluxograma (mesmo padrao de duplicidade):

**Servidor:** consulta COUNT(*) na tabela filha WHERE FK = :pId, retorna JSON
**Cliente:** Obter Campo(ID) → chama SRV → verifica status → mostra erro ou permite exclusao

---

## 5. Contrato JSON Cliente ↔ Servidor

Toda comunicacao entre regras cliente e servidor usa JSON com contrato padrao:

```json
// Sucesso
{ "status": "ok" }

// Erro
{ "status": "erro", "msg": "Descricao do erro" }

// Dados
{ "status": "ok", "dados": { ... } }
```

### Montagem no servidor (ebfCreateObjectJSON):
```
JSON - Criar Objeto(status, erro, msg, Email duplicado) → jsonRetorno
```
Params vao em pares: chave1, valor1, chave2, valor2, ...

### Leitura no cliente (ebfGetValueObjectJson):
```
JSON - Obter Valor(jsonRetorno, status) → vStatus
JSON - Obter Valor(jsonRetorno, msg) → vMsg
```

---

## 6. Manipulacao de Componentes UI (Ao Modificar)

### Codigo equivalente:
```javascript
document.getElementById("edtAliquota").style.display = 
  document.getElementById("chkIncideIRRF").checked ? "block" : "none";
```

### Fluxograma (regra cliente, evento Ao Modificar do componente):
```
Inicio
  ↓
Alterar Valor do Componente(chkIncideIRRF, null) → vIncide    ← AQUI sim usa ebfFormChangeComponentValue
  ↓
Igual?(vIncide, S)
  [SIM] → Visibilidade do Componente(edtAliquota, true)
  [NAO] → Visibilidade do Componente(edtAliquota, false)
           Alterar Valor do Componente(edtAliquota, )           ← limpa o campo
  ↓
Fim
```

AQUI e o caso correto para ebfFormChangeComponentValue: manipulacao de UI em resposta
a eventos de componente. NAO em eventos de formulario (Antes de Gravar, etc).

---

## 7. Matriz Componente x Evento

Cada componente Maker e um elemento DOM. O wfr.js mapeia eventos DOM para o fluxograma.
NAO existe "Antes de Gravar" nem "Depois de Gravar" — usar Antes de Inserir + Antes de Alterar.

### Eventos de formulario (componente F) — ciclo CRUD do WebRun engine

| Evento | Quando | Uso |
|---|---|---|
| Ao Entrar | Formulario abriu (onload) | Carregar combos, mascaras, visibilidade inicial |
| Antes de Inserir | Antes do INSERT | Validar obrigatorios, duplicidade, gerar sequencial |
| Antes de Alterar | Antes do UPDATE | Validar obrigatorios, duplicidade (excluindo atual) |
| Antes de Deletar | Antes do DELETE | Verificar integridade referencial |
| Depois de Inserir | Apos INSERT | Criar registros filhos, notificacoes |
| Depois de Alterar | Apos UPDATE | Totalizadores, sincronizacao |
| Depois de Deletar | Apos DELETE | Limpar orfaos |
| Ao Navegar | Mudou de registro | Atualizar campos dependentes |

### Eventos de componente — DOM mapeado pelo wfr.js

| COM_TIPO | Componente | Eventos disponiveis |
|---|---|---|
| E | HTMLEdit | Ao Modificar, Ao Clicar, Ao Sair, Ao Duplo Clicar, Ao Pressionar Tecla |
| C | HTMLComboBox | Ao Modificar, Ao Sair |
| K | HTMLLookup | Ao Modificar, Ao Sair |
| B | HTMLButton | Ao Clicar |
| G | HTMLGrid | Ao Clicar, Ao Duplo Clicar, Ao Modificar |
| M | HTMLMemo | Ao Modificar, Ao Clicar, Ao Sair, Ao Pressionar Tecla |
| H | HTMLCheckbox | Ao Modificar, Ao Clicar |
| R | HTMLRadioGroup | Ao Modificar, Ao Clicar |
| L | HTMLLabel | Ao Clicar, Ao Duplo Clicar |
| P | Container | Ao Clicar |
| I | Image | Ao Clicar, Ao Duplo Clicar |
| A | Attachment | Ao Modificar |
| W | Container Web | (sem eventos) |
| S | Shape/Separador | (sem eventos) |

### Mapeamento DOM

| Evento Maker | Evento DOM | Quando dispara |
|---|---|---|
| Ao Modificar | onchange | Valor mudou e campo perdeu foco |
| Ao Clicar | onclick | Clique no elemento |
| Ao Duplo Clicar | ondblclick | Duplo clique |
| Ao Sair | onblur | Campo perdeu foco |
| Ao Pressionar Tecla | onkeydown | Tecla pressionada |

---

## 8. Funcoes por Contexto

### Em regras de EVENTO DE FORMULARIO (Antes de Inserir/Alterar/Deletar):

| Operacao | Funcao | Nome amigavel |
|---|---|---|
| Ler campo do registro | `ebfSQLGetFormField` | Obter Campo |
| Chamar regra servidor | Sub-rotina (CALLRULE) | — |
| Ler resposta JSON | `ebfGetValueObjectJson` | JSON - Obter Valor |
| Comparar valores | `isEqual` | Igual? |
| Verificar vazio | `isNullOrEmpty` | Nulo ou vazio? |
| Mostrar erro | ActNewErrorMessage (Activity id=7) | — |
| Mostrar sucesso | ActNewSuccessMessage (Activity id=8) | — |
| Interromper | `ebfStopRuleExecution` | Interromper Fluxo |

### Em regras de COMPONENTE (Ao Modificar, Ao Clicar):

| Operacao | Funcao | Nome amigavel |
|---|---|---|
| Ler/setar valor UI | `ebfFormChangeComponentValue` | Alterar Valor do Componente |
| Visibilidade | `ebfFormSetVisible` | Visibilidade do Componente |
| Habilitacao | `ebfFormSetEnabled` | Habilitacao do Componente |
| Obrigatoriedade | `ebfFormSetRequired` | Obrigatoriedade do Componente |
| Modo navegacao? | `ebfFormIsInBrowserMode` | Modo Navegacao? |

### Em regras de SERVIDOR (destino=2):

| Operacao | Funcao | Nome amigavel |
|---|---|---|
| Consulta SELECT | `ebfSQLExecuteQuery` | Abrir Consulta |
| Ler campo resultado | `ebfSQLField` | Campo |
| Proximo registro | `ebfSQLNext` | Proxima Linha |
| Fim dos registros? | `ebfSQLEOF` | Fim da Consulta? |
| Fechar consulta | `ebfSQLClose` | Fechar Consulta |
| INSERT/UPDATE/DELETE | `ebfSQLExecuteUpdate` | Executar SQL |
| Criar JSON resposta | `ebfCreateObjectJSON` | JSON - Criar Objeto |
| Query para JSON | `ebfResultSetToJSON` | Query para JSON |

---

## 9. Parametro tipo "Campo" (ebfSQLGetFormField)

Quando usar ebfSQLGetFormField, o parametro NAO e uma string simples.
E um parametro tipo "Campo" que carrega metadados do formulario:

```json
{
  "tipo": "constante",
  "valor": "NOME_DO_CAMPO_SQL",
  "tipo_dado": "Campo",
  "guid": "{FRM_GUID_DO_FORMULARIO}",
  "field_index": 0
}
```

- `valor`: nome EXATO do campo no SQL SELECT do formulario (ex: "NOME", "ID_EDITAL", "STATUS")
- `tipo_dado`: sempre "Campo" (nao "Letras")
- `guid`: o FRM_GUID do formulario onde a regra esta vinculada
- `field_index`: posicao 0-based do campo no SQL SELECT do formulario

### Como descobrir o field_index

O SQL SELECT do formulario define a ordem dos campos:
```sql
Select
  tabela.ID_EDITAL,        -- index 0
  tabela.TITULO,           -- index 1
  tabela.NUMERO,           -- index 2
  tabela.ANO_REFERENCIA,   -- index 3
  tabela.TIPO_FOMENTO      -- index 4
From tabela
```

O campo `NUMERO` tem field_index = 2.

---

## 10. Criacao de Funcoes Novas

### Cliente (destino=1) — PODE criar do zero

Funcoes cliente executam JavaScript no navegador (wfr.js). O FRZ carrega o codigo JS
diretamente. Pode criar funcoes 100% novas sem depender de nada externo.

Exemplos: validacao de CPF customizada, mascara de campo, calculo em tempo real,
manipulacao de DOM, integracao com APIs externas via fetch/XMLHttpRequest.

### Servidor (destino=2) — SO com classes existentes

Funcoes servidor executam Java no Tomcat/WebRun. Dependem de classes compiladas
que ja existem no servidor. NAO e possivel criar uma classe Java nova via FRZ.

Pode criar funcoes servidor que COMPOSEM classes existentes:
- Classes WebRun: WFRSystem, WFRForm, WFRComponent, DBConnection, DBPool,
  RulesCompiler, WFRResultSet, PagedResultSet, WFRJasperReport, AutoDeploy
- 205 JARs em WEB-INF/lib/: JDBC, JasperReports, iText, POI, AWS SDK,
  Firebase, JWT, Bouncy Castle, RabbitMQ, Jackson, CXF, Axis2

Se a regra de negocio servidor precisa de uma classe que NAO existe no WebRun
nem nos JARs, nao pode ser implementada via fluxograma. Precisa de deploy
de JAR customizado no servidor.

### Gerando via MCP

```json
// gerar_funcao spec_json:
[{
  "nome_real": "ebfValidarCPF",
  "nome": "Validar CPF",
  "codigo": 9001,
  "descricao": "Valida CPF brasileiro. Param: CPF (Letras). Retorno: valido (Logico).",
  "params": "Letras",
  "retorno": "Logico",
  "compatibilidade": "1",
  "conteudo_cliente": "function ebfValidarCPF(cpf) { ... }",
  "tipo": 39,
  "categoria": "\\Validacao"
}]
```

O FRZ gerado contem a tag `<functions>` dentro de `<global>`.
Pode ser combinado com regras e formularios no mesmo FRZ usando `gerar_tela_completa`.

---

## 11. Dashboards e Graficos (ECharts)

O Maker usa **ECharts** (Apache ECharts) como biblioteca nativa de graficos.
NAO usar Chart.js, D3, Highcharts ou qualquer outra — so ECharts.

### Estrutura de um Dashboard

Dashboard e um formulario Template: `navegacao=false`, `abas=false`, sem tabela.

```
Form (F) navegacao=false, abas=false
  ├── Label (L) — titulo do dashboard
  ├── Container (P) — card para grafico 1
  │     └── Label (L) — <div id="chart1" style="height:400px"></div>
  ├── Container (P) — card para grafico 2
  │     └── Label (L) — <div id="chart2" style="height:300px"></div>
  └── Evento Ao Entrar → regra que carrega dados + inicializa ECharts
```

### Fluxo da regra Ao Entrar

```
Inicio
  ↓
[Sub-rotina SRV] Buscar Dados Dashboard → vDados (JSON)
  ↓
ebfExecuteJS(codigo_js_echarts)     ← inicializa graficos com dados
  ↓
Fim
```

### Inicializacao ECharts (JavaScript via ebfExecuteJS)

```javascript
var chart = echarts.init(document.getElementById('chartDiv'));
chart.setOption({
  title: { text: 'Titulo' },
  tooltip: { trigger: 'axis' },
  xAxis: { type: 'category', data: categorias },
  yAxis: { type: 'value' },
  series: [{ type: 'bar', data: valores, color: '#0d6efd' }]
});
window.addEventListener('resize', function() { chart.resize(); });
```

### Tipos de grafico ECharts suportados

| Tipo | `series.type` | Uso |
|---|---|---|
| Barras | `bar` | Comparacao de categorias |
| Linhas | `line` | Tendencia temporal |
| Pizza/Donut | `pie` | Proporcao |
| Radar | `radar` | Multiplas dimensoes |
| Gauge | `gauge` | Indicador unico (KPI) |
| Scatter | `scatter` | Correlacao |
| Treemap | `treemap` | Hierarquia |
| Mapa | `map` | Georreferenciamento |

### Responsividade

Sempre incluir `chart.resize()` no `window.resize` para dashboards responsivos.
Usar `NomeClasseCss: col-md-6` nos containers para layout em grid Bootstrap.

---

## 12. Erros Comuns

| Erro | Causa | Correcao |
|---|---|---|
| Usar ebfFormChangeComponentValue em Antes de Inserir/Alterar | Confundiu componente UI com campo de dados | Usar ebfSQLGetFormField com tipo "Campo" |
| TextoRico = "True" no Memo | Maker espera numerico | Usar TextoRico = "1" (ou "0") |
| Propriedades booleanas com True/False | Maker espera TRUE/FALSE (maiusculo) ou 1/0 | Habilitado/Visivel = "True", TextoRico/Paginacao = "1" |
| Tipo do parametro "Letras" em vez de "Campo" | Nao especificou tipo_dado correto | tipo_dado = "Campo" com guid e field_index |
| Consulta SQL no cliente | Cliente nao tem acesso ao banco | Criar regra servidor + chamar via sub-rotina |
| ActNewErrorMessage sem Interromper Fluxo | Em Antes de Inserir/Alterar, o erro nao cancela automaticamente | Adicionar ebfStopRuleExecution apos o erro |
| field_index = -1 | Nao especificou o indice do campo | Contar posicao 0-based no SQL SELECT |
| GUID vazio | Nao especificou o GUID do formulario | Usar FRM_GUID do formulario |

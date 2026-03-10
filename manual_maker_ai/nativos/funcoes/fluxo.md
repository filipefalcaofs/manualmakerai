# Funções Nativas - Fluxo

Total: **14** funções

[← Voltar para Funções Nativas](README.md)

---

## Agendar Execução de Fluxo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetRuleExecutionTime` |
| **Código** | 241 |
| **Assinatura** | `Agendar Execução de Fluxo (Fluxo;Variante;Número)` |
| **Parâmetros** | Fluxo;Variante;Número |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Agenda a execução de um fluxo para ser executado após um determinado tempo. 
O tempo deve ser definido em milisegundos.

Parâmetro(s):
1. Fluxo a ser executado.
2. Lista de parâmetros da regra. (Variante)
3. Tempo para a regra ser executada, em milissegundos. (Número)

Retorno:
Identificador do agendamento. (Inteiro)

Observações:
1. CAMADA CLIENTE - o fluxo a ser executado deve ser da mesma camada.
CAMADA SERVIDOR - o fluxo a ser executado deve ser da mesma camada.
Para agendar fluxos de camadas diferentes, use o subfluxo para agendar.
2. Fluxo servidor não interage com a tela, funções como "Habilitar Controle" ou mensagens não serão exibidos.
3. O primeiro parâmetro pode ser do tipo Letras tendo como valor o nome do fluxo.

ATENÇÃO: PARA AGENDAR UM FLUXO SEM VÍNCULO COM QUEM O INICIOU, UTILIZE A FUNÇÃO "AGENDAR
EXECUÇÃO DE FLUXO SEM PAI", COM ISSO, O GARBAGE COLLECTOR DO JAVA CONSEGUIRÁ LIMPAR MAIS OS OBJETOS TENDO UMA MAIOR LIBERAÇÃO DE MEMÓRIA.

### Código Servidor (Java)

```java
protected final Variant ebfSetRuleExecutionTime(final Variant ruleName, final Variant params, final Variant delay) throws Exception {
    class RuleExecutionThread extends Thread {
      private WFRRule rule;
      private RuleExecutionThread(WFRRule rule) {
        this.rule = rule;
      }
      /**
       * @see java.lang.Thread#run()
       */
      @SuppressWarnings("unchecked")
      @Override
      public void run() {
        try {
          Thread.sleep(delay.getLong());
          if (params.isNull()) {
            callRule(rule, ruleName.getTrimString(), isDevelopmentMode());
          } else {
            List<Object> list = List.class.cast(params.getObject());
            List<Variant> convertedList = new ArrayList<Variant>(list.size());
            for (Object object : list) {
              convertedList.add(VariantPool.get(object));
            }
            callRule(rule, ruleName.getTrimString(), isDevelopmentMode(), convertedList);
          }
        } catch (Exception ex) {
          logger.error(WFRSystem.DEFAULT_USER, rule.getSystem().getCode(), ex);
        }
      }
    }
    if (delay.getLong() < 0) {
      throw new WFRRuleException(Functions.formatMessage("O tempo definido para a execução da regra [{0}] deve ser maior que zero.", delay), this.ruleName);
    }
    RuleExecutionThread executionThread = new RuleExecutionThread(this);
    executionThread.start();
    return VariantPool.get(executionThread.getId());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSetRuleExecutionTime(ruleName, ruleParams, delay) {
  var system = ($mainform() && $mainform().d && $mainform().d.WFRForm ? $mainform().d.WFRForm.sys.value : $mainform().sysCode);
  var formID = ($mainform() && $mainform().d && $mainform().d.WFRForm ? $mainform().d.WFRForm.formID.value : "");
  
  var params = new Array();
  params.push(system);
  params.push(formID);
  params.push(ruleName);  
  
  if (!isNullable(ruleParams)) {
    params.push(ruleParams);        
  } else {
    params.push("");
  }
  
  return timeout(executeJSRuleNoField, delay, params);
}
```

---

## Agendar Execução de Fluxo Sem Pai

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRuleSchedulerNoParent` |
| **Código** | 414 |
| **Assinatura** | `Agendar Execução de Fluxo Sem Pai (Fluxo;Variante;Número)` |
| **Parâmetros** | Fluxo;Variante;Número |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Agenda a execução de um fluxo para ser executado após um determinado tempo. 
O tempo deve ser definido em milisegundos.

Parâmetro(s):
1. Digite o nome da regra. (Fluxo)
2. Lista de parâmetros da regra. (Variante)
3. Tempo para a regra ser executada, em milissegundos. (Número)

Retorno:
Não possui.

Observações:
1. Fluxo cliente somente agenda para a camada CLIENTE, e servidor somente para a camada SERVIDOR, para agendar fluxos de outra camada utilize um subfluxo para agendar;
2. Essa função não agenda fluxos de interação com a tela, funções como "Abrir Formulário" ou mensagens não serão exibidos.

### Código Servidor (Java)

```java
protected final Variant ebfRuleSchedulerNoParent(final Variant ruleName, final Variant params, final Variant delay) throws Exception {
	    class RuleExecutionThread extends Thread {
	      private WFRRule rule;
	      private RuleExecutionThread(WFRRule rule) {
	        this.rule = rule;
	      }
	      /**
	       * @see java.lang.Thread#run()
	       */
	      @SuppressWarnings("unchecked")
	      @Override
	      public void run() {
	        try {
	          Thread.sleep(delay.getLong());
	          
	          WFRRule rule = manager.getRuleClass(ruleName.getTrimString(), client, connection, fields, developmentMode);
	          rule.setRequest(request);
	          rule.setResponse(response);
              rule.setResources(resources);

	          if (params.isNull()) {
	        	  rule.start();
	          } else {
	            List<Object> list = List.class.cast(params.getObject());
	            Variant[] convertedList = new Variant[list.size()];
	            int i = -1;
	            for (Object object : list) {
	              i++;
	              convertedList[i] = VariantPool.get(object);
	            }
	            
	            rule.start(convertedList);  
	              
	          }
	        } catch (Exception ex) {
	          logger.error(WFRSystem.DEFAULT_USER, rule.getSystem().getCode(), ex);
	        }
	      }
	    }
	    if (delay.getLong() < 0) {
	      throw new WFRRuleException(Functions.formatMessage("O tempo definido para a execução da regra [{0}] deve ser maior que zero.", delay), this.ruleName);
	    }
	    RuleExecutionThread executionThread = new RuleExecutionThread(this);
	    executionThread.start();
	    return VariantPool.get(executionThread.getId());
	  }
```

### Código Cliente (JavaScript)

```javascript
function ebfRuleSchedulerNoParent(ruleName, ruleParams, delay){
  var system = ($mainform().d.WFRForm ? $mainform().d.WFRForm.sys.value : $mainform().sysCode);
  var formID = ($mainform().d.WFRForm ? $mainform().d.WFRForm.formID.value : "");
  
  var params = new Array();
  params.push(system);
  params.push(formID);
  params.push(ruleName);
  if (!isNullable(ruleParams)) {
    params.push(ruleParams);
  }else {
     params.push("");
   }
  
  timeout(executeJSRuleNoField, delay, params);
}
```

---

## Capturar Exceções

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCatch` |
| **Código** | 317 |
| **Assinatura** | `Capturar Exceções (Fluxo;Variante)` |
| **Parâmetros** | Fluxo;Variante |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A partir do ponto em que se define a função "Monitorar Exceções", os erros serão monitorados e poderão ser capturados nesta função. Esta função depende do uso anterior da função "Monitorar Exceções".

Parâmetro(s):
1. Fluxo que deve ser executado em caso de ocorrência de exceções.
    Este fluxo automaticamente receberá por parâmetro de entrada as seguintes informações, em ordem: 
      1. Mensagem da exceção.
      2. Causa da exceção.
      3.  Exceção (Objeto).  -> Apenas Servidor
      3.1. Servidor (java.lang.Exception).
2. Parâmetro adicional para o fluxo. (Variante) (Ver observação 1)

Retorno:
Não possui.

Observações:
1. No 2º Parâmetro pode ser Lista, Mapa, Letras, Inteiro, dentre outros.
2. Pelo fato de o controle do erro ser do desenvolvedor, o fluxo não será interrompido. Este continuará com sua normal execução.
3. O procedimento correto para se utilizar uma cláusula condicional entre um try-catch é inserir esse trecho em um subfluxo.
4. Exemplo de uso da função no link: suporte.softwell.com.br/maker/manual2_7/pt/ - pesquise pelo nome da função.

---

## Dormir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sleep` |
| **Código** | 507 |
| **Assinatura** | `Dormir (Número)` |
| **Parâmetros** | Número |
| **Tipo** | 15 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Causa um atraso na execução de um fluxo. Conhecida também como sleep.

Parâmetro: 
1. Tempo em segundos. (Número)

Retorno:
Não possui.

### Código Servidor (Java)

```java
/**
   * @param variantTimeSec Tempo em segundos
   */
  protected final Variant sleep(Variant variantTimeSec) throws WFRRuleException {
    try {
      long timeSec = Double.valueOf(variantTimeSec.getDouble() * 1000).longValue();
      Thread.sleep(timeSec);
    } catch (InterruptedException ex) {
      logger.error(WFRSystem.DEFAULT_USER, WFRSystem.DEFAULT_SYSTEM, ex);
    }
    return Variant.VARIANT_NULL;
  }
```

### Código Cliente (JavaScript)

```javascript
/* Função em implementação, não utilize.*/
/*
function sleep() {
  document.flag = true;
  if (existArgs(arguments)) {
     window.setTimeout("document.flag = false;", arguments[0] * 1000);
     while(document.flag);
  }
  return true;
}
*/
```

---

## Executar Fluxo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFlowExecute` |
| **Código** | 674 |
| **Assinatura** | `Executar Fluxo (Letras;Variante): Variante` |
| **Parâmetros** | Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 15 |
| **Compatibilidade** | * |

### Descrição

Executa o fluxo determinado pelo 1° parâmetro. Pode-se passar uma lista de parâmetros para o fluxo através do 2° parâmetro.

Parâmetro(s):
1. Nome do fluxo que se deseja executar. Deve-se passar o nome exato ao cadastrado. (Letras)
2. Lista de parâmetros que o fluxo necessita. (Variante)

Retorno: 
Caso seja um fluxo Servidor executando um Cliente, o retorno será nulo visto que, por não haver sincronia nesse tipo de execução, não é possível obter o retorno do fluxo Cliente. (Variante)

Observação:
Utilize a Função "Criar Lista a partidos do Elementos" para atender o 2° parâmetro. E caso não haja, deixar Nulo.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
  protected final Variant ebfFlowExecute(Variant ruleNameVar, Variant paramsVar) throws Exception {
    String originalRuleName = ruleNameVar.getString();
    String ruleName = RulesFunctions.reduceVariable(originalRuleName.trim());
    if (ruleName.length() == 0) {
      throw new WFRRuleException("Não foi definida uma regra para execução.", this.ruleName);
    }
    List<Variant> params;
    Object paramsObj = paramsVar.getObject();
    if (paramsObj == null) {
      params = Collections.emptyList();
    } else if (!(paramsObj instanceof List)) {
      throw new WFRRuleException("Lista de parâmetros inválida para execução da regra: " + originalRuleName, this.ruleName);
    } else {
      List tempList = (List) paramsObj;
      if (tempList.size() > 0) {
        params = new ArrayList<Variant>(tempList.size());
        for (Object param : tempList) {
          params.add(VariantPool.get(param));
        }
      } else {
        params = Collections.emptyList();
      }
    }
    if (manager.getSys().getJSManager().isJSRule(originalRuleName)) {
      client.callJSRule(ruleName, fields, params);
      return Variant.VARIANT_NULL;
    }
    return callRule(this, originalRuleName, isDevelopmentMode(), params);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFlowExecute(ruleName, params) {
  var reducedName = (ruleName);  
  var sysCode = ($mainform().document.WFRForm ? $mainform().document.WFRForm.sys.value : $mainform().sysCode);
  var formCode = ($mainform().document.WFRForm ? $mainform().document.WFRForm.formID.value : null);
  var isJava = false;
  var ruleFunction;
  try {
    ruleFunction = window.eval(reducedName);
  } catch (ex) {
    try {    
      reducedName = reduceVariable(ruleName);
      ruleFunction = window.eval(reducedName);    
    } catch(ex) {
      isJava = true;
    }
  }
  var value = null;
  if (isJava) {
    if (params && params instanceof Array && params.length > 0) {
      value = executeSyncJavaRule(sysCode, formCode, ruleName, params);
    } else {
      value = executeSyncJavaRule(sysCode, formCode, ruleName);
    }
  } else {
    var ruleInstance = new ruleFunction(null, sysCode, formCode);
    if (ruleInstance && ruleInstance.run) { // é JS
      value = executeJSRule(sysCode, formCode, reducedName, params, true);
    }
  } 
  return value;
}
```

---

## Interromper Fluxo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStopRuleExecution` |
| **Código** | 112 |
| **Assinatura** | `Interromper Fluxo (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Interrompe a execução do fluxo. Caso seja passado alguma mensagem por parâmetro, esta é exibida.
Se houver algum processamento após a utilização dessa função, este não será executado.

Parâmetro: 
1. Mensagem a ser exibida. (Letras, Opcional)

Retorno:
Não possui.

Exemplo:
Assumindo como parâmetro "Operação Cancelada" (Letras), quando a função for executada exibirá a mensagem "Operação Cancelada" e o fluxo será interrompido. 
Nenhum processamento depois dele será executado.

### Código Servidor (Java)

```java
protected final Variant ebfStopRuleExecution(Variant str) throws Exception {
    throw new WFRRuleStopException(ExceptionMessage.ERROR_RULE_EXECUTION_FAILED, str.toString());
}
```

### Código Cliente (JavaScript)

```javascript
function ebfStopRuleExecution(msg) {
  document.hasRuleErrors = true;
  throw new StopRuleExecution(msg);
}
```

---

## Interromper Fluxo Agendado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfClearTimeOut` |
| **Código** | 713 |
| **Assinatura** | `Interromper Fluxo Agendado (Inteiro)` |
| **Parâmetros** | Inteiro |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função interrompe a execução de um fluxo agendado de acordo o ID passado por parâmetro.

Parâmetro:
1. ID do fluxo agendado. (Inteiro) (Ver observação 2)

Retorno:
Não possui.

Observações:
1. Essa função interrompe apenas fluxos que foram agendados na camada cliente.
2. O 1º Parâmetro pode ser obtido através da função "Agendar Execução do Fluxo".

### Código Cliente (JavaScript)

```javascript
function ebfClearTimeOut(ID){
 if(typeof ID === 'number'){
   window.clearTimeout(ID); 
 }
}
```

---

## Lançar Exceções

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfThrowException` |
| **Código** | 319 |
| **Assinatura** | `Lançar Exceções (Letras, Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Lança uma exceção.

Parâmetro(s):
1. Mensagem da exceção. (Letras)
2. Causa da exceção. (Letras, Opcional)

Retorno:
Não possui.

Observação:
Caso essa função seja usada dentro das funções "Monitorar Exceções" e "Capturar Exceções", então as 
informações chegarão no fluxo definido em "Capturar Exceções".

### Código Servidor (Java)

```java
protected final Variant ebfThrowException(Variant message, Variant cause) throws Exception {
    if (cause.isNull()) {
      throw new Exception(message.toString());
    }

    Exception causeEx = new Exception(cause.toString());
    throw new Exception(message.toString(), causeEx);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfThrowException(message, cause) {
  var ex = new Object();
  ex.message = message;
  ex.cause = cause;
  throw ex;
}
```

---

## Monitorar Exceções

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTry` |
| **Código** | 318 |
| **Assinatura** | `Monitorar Exceções()` |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A partir do ponto em que se define essa função, os erros serão monitorados e poderão ser capturados na função "Capturar Exceções". 
Uma função depende da outra, portanto ao usar "Monitorar" é obrigado o uso da "Capturar". Esta função é conhecida como o metodo "try".

Parâmetro:
Não possui.

Retorno:
Não possui.

Observações:
1. Pelo fato de o controle do erro ser do desenvolvedor, o fluxo não será interrompido. Este continuará com sua normal execução.
2. O procedimento correto para se utilizar uma cláusula condicional entre um try-catch é inserir esse trecho em um subfluxo.

---

## Obter Nome do Fluxo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetRuleName` |
| **Código** | 158 |
| **Assinatura** | `Obter Nome do Fluxo () : Letras` |
| **Retorno** | Letras |
| **Tipo** | 15 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o nome do fluxo em que a função se encontra.

Parâmetro:
Não possui.

Retorno: 
Nome do fluxo. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfGetRuleName() throws Exception {
    return VariantPool.get(this.getRuleName());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetRuleName() {
  return this.getRuleName();
}
```

---

## Obter Nomes de Parâmetros

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetInputNames` |
| **Código** | 162 |
| **Assinatura** | `Obter Nomes de Parâmetros` |
| **Retorno** | Variante |
| **Tipo** | 15 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém uma lista com o nome dos parâmetros do fluxo atual.

Parâmetro:
Não possui.

Retorno: 
Lista com os nomes dos parâmetros que o fluxo recebe. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfGetInputNames() throws Exception {
    String[] inputs = this.getInputNames();
    Variant[] inputsVar = new Variant[inputs.length];
    for (int i = 0; i < inputs.length; i++) {
      inputsVar[i] = VariantPool.get(inputs[i]);
    }
    return ebfListParamsCreate(inputsVar);
  }
```

---

## Obter Pilha do Erro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExceptionGetStackTrace` |
| **Código** | 408 |
| **Assinatura** | `Obter Pilha do Erro (Variante):Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 15 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém a pilha de erro do objeto Exception ou nulo caso o objeto passado não seja uma exceção (instância de Throwable).

Parâmetro:
1. Objeto Exception "Throwable". (Variante)

Retorno:
Pilha do Erro. (Letras)

Observação:
O objeto Exception "Throwable" pode ser obtido através do fluxo a ser passado por parâmetro pela função: "Capturar 
Exceções".

Exemplo:
O valor enviado no 3º Parâmetro do fluxo indicado da função "Capturar Exceção".

### Código Servidor (Java)

```java
protected final Variant ebfExceptionGetStackTrace(Variant exception) throws Exception {
  if (exception.getObject() instanceof Throwable) {
    return VariantPool.get(Functions.getStackTrace(Throwable.class.cast(exception.getObject()), Resources.getThreadResources()));  
  } else {  
    return Variant.VARIANT_NULL;
  }
}
```

---

## Obter Valores de Parâmetros

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetInputValues` |
| **Código** | 161 |
| **Assinatura** | `Obter Valores de Parâmetros` |
| **Retorno** | Variante |
| **Tipo** | 15 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém os valores que foram passados por parâmetro para o fluxo em que essa função se encontra e retorna em uma lista.

Parâmetro:
Não possui.

Retorno:
Lista que contém os valores. (Variante)

### Código Servidor (Java)

```java
protected final Variant ebfGetInputValues() throws Exception {
    Variant[] inputs = this.getCurrentInputs();
    return ebfListParamsCreate(inputs);
  }
```

---

## Tempo máximo de execução do fluxo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRuleSetTimeout` |
| **Código** | 110 |
| **Assinatura** | `Tempo máximo de execução da regra( segundos )` |
| **Parâmetros** | Inteiro |
| **Tipo** | 15 |
| **Compatibilidade** | Banco de Dados |

### Descrição

O valor passado por parâmetro será o tempo máximo que o fluxo poderá ser executado, caso o fluxo atinja o tempo máximo o mesmo será encerrado.

Parâmetro:
1. Tempo em segundos. (Inteiro)

Retorno:
Não possui.

Observação:
1. O Tempo normal de uma regra, antes de ser interrompida pelo sistema, é de 90 segundos.
2. Havendo subfluxos, a função tem que ficar no fluxo principal.

Exemplo: 
Assumindo como parâmetro 100 (Inteiro), o tempo máximo de execução da regra deixaria de ser 90 segundos(padrão) para ser 100 segundos.

### Código Servidor (Java)

```java
protected final Variant ebfRuleSetTimeout(Variant delay) throws Exception {
    setTimeout(delay.getLong());
    return Variant.VARIANT_NULL;
  }
```

---

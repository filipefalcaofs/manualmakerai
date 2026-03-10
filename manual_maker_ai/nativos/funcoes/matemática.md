# Funções Nativas - Matemática

Total: **33** funções

[← Voltar para Funções Nativas](README.md)

---

## Arco Cosseno

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathArcCosine` |
| **Código** | 211 |
| **Assinatura** | `Arco Cosseno (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função trigonométrica arco cosseno ou co-seno retorna o cosseno inverso de um número. O ângulo cosseno em radianos é passado
no primeiro parâmetro, retornando assim o arco cosseno do ângulo passado.
 
Parâmetro: 
1. Ângulo em radianos (deve estar entre -1 e 1). (Número)

Retorno: 
Arco cosseno do ângulo determinado. (Número)

Observações:
1. O ângulo retornado é fornecido em radianos no intervalo de 0 (zero) a pi. 
2. Para garantir a integridade das operações matemáticas, utilize uma das função em conversão: "Para Graus" ou "Para Radiano"
conforme o tipo de dados passado por parâmetro.
3. Se você quiser converter o resultado de radianos em graus, multiplique-o por 180/PI ou use a função "Para Graus".

Exemplo:
Assumindo como o 1° parâmetro sendo: -0,5 o retorno será aproximadamente 2,094395.

### Código Servidor (Java)

```java
protected final Variant ebfMathArcCosine(Variant theta) throws Exception {
    double result = Math.acos(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Arco Cosseno.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathArcCosine(theta) {
  var result = Math.acos(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Arco Cosseno.";
  }
  return result;
}
```

---

## Arco Seno

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathArcSine` |
| **Código** | 212 |
| **Assinatura** | `Arco Seno (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função trigonométrica arco seno obtém o arco seno ou o seno inverso de um número. O ângulo seno é passado no primeiro parâmetro,
retornando assim o ângulo em radianos no intervalo de -pi/2 a pi/2.

Parâmetro:
1. Seno do ângulo desejado e deve estar entre -1 e 1. (Número)

Retorno: 
Arco seno do ângulo determinado. (Número)

Observações:
1. Para garantir a integridade das operações matemáticas, utilize uma das funções em conversão: "Para Graus" ou "Para Radiano"
conforme o tipo de dados passado por parâmetro.
2. Se você quiser converter o resultado de radianos em graus, multiplique-o por 180/PI ou use a função Para Graus.

Exemplo:
Assumindo o 1° Parâmetro como: -0,5 o retorno será aproximadamente -0,5235987.

### Código Servidor (Java)

```java
protected final Variant ebfMathArcSine(Variant theta) throws Exception {
    double result = Math.asin(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Arco Seno.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathArcSine(theta) {
  var result = Math.asin(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Arco Seno.";
  }
  return result;
}
```

---

## Arco Tangente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathArcTangent` |
| **Código** | 213 |
| **Assinatura** | `Arco Tangente (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

A função trigonométrica arco tangente obtém o arco tangente ou a tangente inversa de um número. O ângulo tangente é
passado no primeiro parâmetro, retornando assim o ângulo em radianos no intervalo de -pi/2 a pi/2.

Parâmetro:
1. Tangente do ângulo desejado. (Número)

Retorno:
Arco tangente do ângulo determinado. (Número)

Observações:
1. Para garantir a integridade das operações matemáticas, utilize conversão: "Para Graus" ou "Para Radiano"
conforme o tipo de dados passado por parâmetro.
2. Se você quiser converter o resultado de radianos em graus, multiplique-o por 180/PI ou use a função Para Graus.

Exemplo:
Assumindo o 1° Parâmetro como: 1 o retorno será aproximadamente 0,78539816.

### Código Servidor (Java)

```java
protected final Variant ebfMathArcTangent(Variant theta) throws Exception {
    double result = Math.atan(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Arco Tangente.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathArcTangent(theta) {
  var result = Math.atan(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Arco Tangente.";
  }
  return result;
}
```

---

## Arranjo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathArrangement` |
| **Código** | 221 |
| **Assinatura** | `Arranjo (Inteiro;Inteiro): Inteiro` |
| **Parâmetros** | Inteiro;Inteiro |
| **Retorno** | Inteiro |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Um Arranjo simples ou arranjo sem repetição obtém o cálculo do arranjo de um valor. 
Um arranjo ou permutação sem repetição é o cálculo de quantas maneiras diferentes é possível colocar n elementos de um 
conjunto com d elementos escolhidos em seqüência, sem repetição. A fórmula do cálculo de um arranjo é a seguinte: n! / (n-d)!.

Parâmetro(s):
1. Corresponde ao número de elementos do conjunto (n na fórmula acima). (Inteiro)
2. Corresponde a quantidade de elementos do conjunto (d na fórmula acima). (Inteiro)

Retorno:
Cálculo do arranjo do valor determinado. (Inteiro)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos: 
1. Assumindo como o 1° parâmetro sendo: 5 e o 2° parâmetro sendo: 3 o retorno será 60 (Inteiro).
2. Assumindo como o 1° parâmetro sendo: 20 e o 2° parâmetro sendo: 3 o retorno será 6840 (Inteiro).

### Código Servidor (Java)

```java
protected final Variant ebfMathArrangement(Variant elementsVar, Variant choicesVar) throws Exception {
    long occurrences = elementsVar.getLong() - choicesVar.getLong();
    return VariantPool.get(ebfMathFactorial(elementsVar).getLong() / ebfMathFactorial(VariantPool.get(occurrences)).getLong());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathArrangement(elements, choices) {
  elements = toLong(elements);
  choices = toLong(choices);
  var occurrences = elements - choices;
  return ebfMathFactorial(elements) / ebfMathFactorial(occurrences);
}
```

---

## Arredondar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprRound` |
| **Código** | 8 |
| **Assinatura** | `Arredondar(Número) : Inteiro` |
| **Parâmetros** | Número |
| **Retorno** | Inteiro |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o valor inteiro de um número arredondando para cima ou para baixo, a depender da parte fracionada do número.
Se a parte fracionada do número for maior ou igual a 0,5 o número será arredondado para cima, caso contrário para baixo.

Parâmetro: 
1. Valor a ser arredondado. (Número)

Retorno:
Retorna o valor arredondado. (Inteiro)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos: 
1. Assumindo como o 1° parâmetro sendo: 9,5 o retorno será 10 (Inteiro).
2. Assumindo como o 1° parâmetro sendo: 9,4 o retorno será 9 (Inteiro).

### Código Servidor (Java)

```java
protected final Variant oprRound(Variant variant) throws Exception {
    return VariantPool.get(Math.round(variant.getDouble()));
  }
```

### Código Cliente (JavaScript)

```javascript
function oprRound() {
  var value = 0;
  if (existArgs(arguments)) {
    value = Math.round(parseNumeric(arguments[0]));
  }
  return value;
}
```

---

## Arredondar Casas Decimais

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfArredondaDecimal` |
| **Código** | 120 |
| **Assinatura** | `Arredondar Casas Decimais (Número;Inteiro;Lógico): Fracionado` |
| **Parâmetros** | Número;Inteiro;Lógico |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função é utilizada para fazer o arredondamento de valores por casas decimais.
O número será arredondado para cima ou para baixo a depender do valor das casas decimais.
Caso o valor das casas decimais seja menor ou igual a 0,5 o número será arredondado para baixo, caso contrário, para cima.
Informando o terceiro parâmetro como verdadeiro, o arredondamento seguirá as normas da ABNT NBR 5891, cujo as regras podem ser encontradas no site oficial.

Parâmetro(s): 
1. Número a ser arredondado.
2. Quantidade de casas decimais, para a qual o número será arredondado. (Inteiro)
3. Seguir padrão ABTN? (Lógico, Opcional)

Retorno:
Retorna o número fracionado passado por parâmetro com as casas decimais arredondadas. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Este exemplo não se aplica para as normas ABNT:
    1.1 Assumindo como o 1° parâmetro sendo: 9,5782 e o 2° parâmetro sendo: 2 (Inteiro) o retorno será 9.58.
    1.2. Assumindo como o 1° parâmetro sendo: 9,5566 e o 2° parâmetro sendo: 2 (Inteiro) o retorno será 9.56.
2. Através das normas ABNT:
    2.1. Assumindo como o 1° parâmetro sendo: 4,550, o 2° parâmetro sendo: 1 (Inteiro) e o 3º parâmetro sendo: Verdadeiro (Lógico) o retorno será 4.6.
    2.2 Assumindo como o 1° parâmetro sendo: 4,850, o 2° parâmetro sendo: 1 (Inteiro) e o 3º parâmetro sendo: Verdadeiro (Lógico) o retorno será 4.8.

### Código Servidor (Java)

```java
protected static final Variant ebfArredondaDecimal(Variant valueVar, Variant decimalQtt, Variant ABNT) throws Exception {
    if(ABNT.getBoolean()){
      return new Variant(new java.math.BigDecimal(valueVar.getString().replace(",", ".")).setScale(Integer.parseInt(decimalQtt.getString()), java.math.RoundingMode.HALF_EVEN).doubleValue());
    }else{
      return ebfArredondaDecimal(valueVar, decimalQtt);
    }    
  }
     
  protected static final Variant ebfArredondaDecimal(Variant valueVar, Variant decimalQtt) throws Exception {
    double factor = Math.pow(10, decimalQtt.getDouble());
    double value = valueVar.getDouble();
    // Multiplica pelo fator
    value *= factor;
    // Arredonda o valor
    value = Math.round(value);
    // Divide pelo fator
    value /= factor;
    return VariantPool.get(value);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfArredondaDecimal(value, decimalQtt, abnt) { 
  if(abnt){
    var floatValue = parseFloat(value.toString().replaceAll(",","."));
    if(parseInt(value) === floatValue){   
      return floatValue; 
    } else{
        return round_abnt(floatValue, decimalQtt);
    }
  }else{
    value = parseNumeric(value); 
    var factor = Math.pow(10, parseNumeric(decimalQtt));
    // Multiplica pelo fator
    value *= factor;
    // Arredonda o valor
    value = Math.round(value);
    // Divide pelo fator
    value /= factor;
  }  
  return value;
}

function round_abnt(nValor, nDecimais) {

  var nRetorno = nValor;
  var spl = nValor.toString().split(".");
  var cDecimais = spl[1];
  var a = 1 / Math.pow(10, spl[1].length);
  var nSubsequente = nDecimais;

  if (nDecimais < 1) {
    return parseInt(nRetorno);
  }

  if (cDecimais.length <= nDecimais) {
    return parseFloat(nRetorno);
  }

  if (parseInt(cDecimais.substr(nSubsequente, 1)) > 5 || parseInt(cDecimais.substr(nSubsequente, 1)) < 5) {
    nRetorno = nRetorno.toFixed(nDecimais);
  } else if (parseInt(cDecimais.substr(nSubsequente, 1)) == 5) {

    if ((cDecimais.substr(nDecimais - 1, 1) % 2) != 0) {
      nRetorno += a;
      nRetorno = nRetorno.toFixed(nDecimais);
    } else

    if (parseInt(cDecimais.substr(parseInt(nSubsequente) + 1, 1)) > 0) {
      nRetorno = nRetorno.toFixed(nDecimais);
    } else {
      nRetorno = truncateValue(nValor, nDecimais);
    }
  }
  return parseFloat(nRetorno);
}

function truncateValue(nValor, nDecimais) {

  var nRetorno = nValor;
  spl = nValor.toString().split(".");
  var cDecimais = spl[1];

  if (nDecimais < 1) {
    return parseInt(nRetorno);
  }

  if (cDecimais.length <= nDecimais) {
    return nRetorno;
  }

  nRetorno = parseInt(nValor.toString()) + '.' + cDecimais.substr(0, nDecimais);
  nRetorno = parseFloat(nRetorno);

  return nRetorno;
}
```

---

## Arredondar para Baixo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathFloor` |
| **Código** | 216 |
| **Assinatura** | `Arredondar para Baixo (Número) : Inteiro` |
| **Parâmetros** | Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Arredonda um valor fracionado para baixo.

Parâmetro:
1. Número a ser arredondado. 

Retorno:
Valor arredondado para baixo. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo como o 1° parâmetro sendo: 9,5 o retorno será 9,0.
2. Assumindo como o 1° parâmetro sendo: 5,7 o retorno será 5,0.

### Código Servidor (Java)

```java
protected final Variant ebfMathFloor(Variant theta) throws Exception {
    double result = Math.floor(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido arredondando o valor para baixo.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathFloor(theta) {
  var result = Math.floor(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido arredondando o valor para baixo.";
  }
  return result;
}
```

---

## Arredondar para Cima

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathCeil` |
| **Código** | 217 |
| **Assinatura** | `Arredondar para Cima (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Arredonda um valor fracionado para cima.

Parâmetro:
1. Número a ser arredondado.

Retorno:
Valor arredondado para cima. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo como o 1° parâmetro sendo: 9,5 o retorno será 10.
2. Assumindo como o 1° parâmetro sendo: 5,4 o retorno será 6.

### Código Servidor (Java)

```java
protected final Variant ebfMathCeil(Variant theta) throws Exception {
    double result = Math.ceil(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido arredondando o valor para cima.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathCeil(theta) {
  var result = Math.ceil(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido arredondando o valor para cima.";
  }
  return result;
}
```

---

## Combinação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathCombination` |
| **Código** | 223 |
| **Assinatura** | `Combinação (Inteiro;Inteiro): Inteiro` |
| **Parâmetros** | Inteiro;Inteiro |
| **Retorno** | Inteiro |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Uma combinação simples ou combinação sem repetição indica quantas variedades de subconjuntos diferentes com s elementos existem em um conjunto com n elementos. 
Só é usada quando não há repetição de membros dentro do conjunto. A fórmula de cálculo de uma combinação é a seguinte: n! / s! * (n - s)!.

Parâmetro(s): 
1. Quantidade de elementos do conjunto (corresponde ao n da fórmula acima). (Inteiro)
2. Quantidade de elementos nos subconjuntos (corresponde ao s da fórmula acima). (Inteiro)

Retorno: 
Cálculo da combinação. (Inteiro)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo como o 1° parâmetro sendo: 3 e o 2° parâmetro sendo: 2, o retorno será 3.
2. Assumindo como o 1° parâmetro sendo: 4 e o 2° parâmetro sendo: 2, o retorno seria 6.

### Código Servidor (Java)

```java
protected final Variant ebfMathCombination(Variant elementsVar, Variant choicesVar) throws Exception {
    return VariantPool.get((long) (ebfMathArrangement(elementsVar, choicesVar).getLong() / ebfMathFactorial(choicesVar).getLong()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathCombination(elements, choices) {
  return ebfMathArrangement(elements, choices) / ebfMathFactorial(choices);
}
```

---

## Constante de Néper

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathNeper` |
| **Código** | 210 |
| **Assinatura** | `Constante de Néper (): Fracionado` |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Constante de Néper ou Exponencial Neperiano. O número de Néper é a base dos logaritmos naturais.

Parâmetro:
Não possui.

Retorno:
Retorna a constante de Néper é aproximadamente (2,718 281 828 459 045 235 360 287). (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

### Código Servidor (Java)

```java
protected final Variant ebfMathNeper() throws Exception {
    return VariantPool.get(Math.E);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathNeper() {
  return Math.E;
}
```

---

## Cosseno

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathCosine` |
| **Código** | 215 |
| **Assinatura** | `Cosseno (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o cosseno de um ângulo. Se o ângulo estiver em graus, multiplique-o por PI/180 ou use a função Para Radianos para convertê-lo em radianos.

Parâmetro:
1. Ângulo em radianos cujo cosseno você deseja obter.

Retorno:
Cosseno do ângulo determinado. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo como o 1° Parâmetro sendo: 1,047 o retorno será 0,500171.
2. Assumindo como o 1° Parâmetro sendo: 60*PI/180 o retorno será 0,5.

### Código Servidor (Java)

```java
protected final Variant ebfMathCosine(Variant theta) throws Exception {
    double result = Math.cos(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Cosseno.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathCosine(theta) {
  var result = Math.cos(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Cosseno.";
  }
  return result;
}
```

---

## Divisão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprDivide` |
| **Código** | 553 |
| **Assinatura** | `Divisão (Número;Número) : Fracionado` |
| **Parâmetros** | Número;Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Essa função é utilizada para realizar a divisão.

Parâmetro(s): 
1. Valor do dividendo. (Número)
2. Valor do divisor. (Número)

Retorno:
Resultado da divisão dos números passados por parâmetros. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos: 
1. Assumindo como o 1° Parâmetro sendo: 10 (Inteiro) e o 2° Parâmetro sendo: 5 (Inteiro), o retorno será : 2.
2. Assumindo como o 1° Parâmetro sendo: 10,5 e o 2° Parâmetro sendo: 2,5 o retorno será: 4.2.

### Código Servidor (Java)

```java
protected final Variant oprDivide(Variant variant1, Variant variant2) throws Exception {
    if (variant2.getDouble().doubleValue() == 0) {
      throw new WFRRuleException("Divisão por 0 (zero) não é permitido!", this.ruleName);
    }
    return VariantPool.get(variant1.getDouble() / variant2.getDouble());
  }
```

### Código Cliente (JavaScript)

```javascript
function oprDivide() {
  var value = 0;
  if (existArgs(arguments)) {
    value = parseNumeric(arguments[0]);
    for (var i = 1; i < arguments.length; i++) {
      var temp = arguments[i];
      value /= parseNumeric(temp);
    }
  }
  return value;
}
```

---

## Fatorial

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathFactorial` |
| **Código** | 222 |
| **Assinatura** | `Fatorial (Inteiro) : Inteiro` |
| **Parâmetros** | Inteiro |
| **Retorno** | Inteiro |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

O fatorial de um número natural n é o produto de todos os inteiros positivos menores ou iguais a n. 
Isso é escrito como n! e lido como "fatorial de n ".

Parâmetro:
1. Valor (n). (Inteiro)

Retorno: 
Fatorial do valor determinado. (Inteiro)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo como o 1° Parâmetro sendo: 5 o retorno será: 120.
2. Assumindo como o 1° Parâmetro sendo: 4 o retorno será: 24.

### Código Servidor (Java)

```java
protected final Variant ebfMathFactorial(Variant valueVar) throws Exception {
    long result = 1;
    long value = valueVar.getLong();
    if (value < 0) {
      throw new WFRRuleException("Argumento inválido no cálculo em análise combinatória.", this.ruleName);
    }
    if (value > 1) { 
      while (value > 1) {
        result *= value;
        value--;
      }
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathFactorial(value) {
  var result = 1;
  value = toLong(value);
  if (value < 0) {
    throw "Argumento inválido no cálculo em análise combinatória.";
  }
  if (value > 1) {
    while (value > 1) {
      result *= value;
      value--;
    }
  }
  return result;
}
```

---

## Logaritmo Neperiano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathELogarithm` |
| **Código** | 220 |
| **Assinatura** | `Logaritmo Neperiano (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Retorna o Logaritmo natural de um número. Os Logaritmos naturais se baseiam na constante e (2,71828182845904).

Parâmetro:
1. Número real positivo para o qual você deseja obter o logaritmo natural.

Retorno: 
Logaritmo na base E do valor determinado. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo o 1° Parâmetro como: 86, o resultado será: 4,454347.

### Código Servidor (Java)

```java
protected final Variant ebfMathELogarithm(Variant theta) throws Exception {
    double result = Math.log(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Logaritmo Neperiano.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathELogarithm(theta) {
  var result = Math.log(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Logaritmo Neperiano.";
  }
  return result;
}
```

---

## Logaritmo na Base 10

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMath10Logarithm` |
| **Código** | 228 |
| **Assinatura** | `Logaritmo na Base 10 (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Calcula o logaritmo na base 10 de um valor.

Parâmetro:
1. Valor para cálculo (Logaritmando). (Número)

Retorno: 
Logaritmo na base 10 do valor determinado. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo como o 1° Parâmetro sendo: 86 o retorno será 1,934498451.

### Código Servidor (Java)

```java
protected final Variant ebfMath10Logarithm(Variant theta) throws Exception {
    double result = Math.log10(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Logaritmo na Base 10.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMath10Logarithm(theta) {
  var result = Math.log(toDouble(theta)) / Math.log(10);
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Logaritmo na Base 10.";
  }
  return result;
}
```

---

## Multiplicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprMultiply` |
| **Código** | 552 |
| **Assinatura** | `Multiplicação (Número...) : Número` |
| **Parâmetros** | N'Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Retorna a multiplicação dos números passados por parâmetro.

Parâmetro(s): 
1. N' Valor a ser multiplicado.

Retorno:
Resultado da multiplicação dos parâmetros passados. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo: 
Assumindo os valores dos parâmetros 5 (Inteiro) e 4 (Inteiro), o retorno será 20 (Inteiro).

### Código Servidor (Java)

```java
protected final Variant oprMultiply(Variant... variants) throws Exception {
    Variant result;
    WFRRuleType type = variants[0].getType();
    switch (type) {
      case DOUBLE: {
        result = oprMultiplyDouble(variants);
        break;
      }
      default: {
        result = oprMultiplyLong(variants);
        break;
      }
    }
    return result;
  }
```

### Código Cliente (JavaScript)

```javascript
function oprMultiply() {
  var value = 1.0;
  if (existArgs(arguments)) {
    for (var i = 0; i < arguments.length; i++) {
      var temp = arguments[i];
      value *= parseNumeric(temp);
    }
  }
  return value;
}
```

---

## Máximo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprMaximum` |
| **Código** | 604 |
| **Assinatura** | `Máximo(Número...) : Fracionado` |
| **Parâmetros** | N'Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função é utilizada para obter o maior dos valores passados por parâmetro.

Parâmetro(s):
1. N' Valor a ser comparado. (Número)

Retorno:
Obtém o maior valor dentre os passados por parâmetro, pode ter (n) parâmetros a serem avaliados. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo que os parâmetros sejam: 100 (Inteiro), 66 (Inteiro), 13 (Inteiro) e 99 (Inteiro) o retorno será: 100.0 (Fracionado).

### Código Servidor (Java)

```java
protected final Variant oprMaximum(Variant... variants) throws Exception {
    double maximum = Double.MIN_VALUE;
    for (Variant variant : variants) {
      if (variant.getType() != WFRRuleType.NULL && variant.getDouble().compareTo(maximum) == 1) {
        maximum = variant.getDouble().doubleValue();
      }
    }
    return VariantPool.get(maximum);
  }
```

### Código Cliente (JavaScript)

```javascript
function oprMaximum() {
  var maximum = null;
  if (existArgs(arguments)) {
    maximum = parseNumeric(arguments[0]);
    for (var i = 0; i < arguments.length; i++) {
      var temp = parseNumeric(arguments[i]);
      if (temp > maximum) {
        maximum = temp;
      }
    }
  }
  return maximum;
}
```

---

## Média

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprAverage` |
| **Código** | 593 |
| **Assinatura** | `Média(Número...)  : Fracionado` |
| **Parâmetros** | N'Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Calcula a média aritmética dos valores passados por parâmetro.

Parâmetro(s): 
1. N' Valor a ser somado.

Retorno:
Retorna a divisão da soma dos números passados por parâmetro pela quantidade de parâmetros. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Informando os parâmetros como: 10 (Inteiro) e 2 (Inteiro), o resultado é 6,0 (Fracionado).
2. Informando os parâmetros como: 7 (Inteiro), 7 (Inteiro) e 7 (Inteiro) o resultado é 7,0 (Fracionado).

### Código Servidor (Java)

```java
protected final Variant oprAverage(Variant... variants) throws Exception {
    double divisor = 0D;
    int dividendo = variants.length;
    for (Variant variant : variants) {
      divisor += variant.getDouble();
    }
    return VariantPool.get(divisor / dividendo);
  }
```

### Código Cliente (JavaScript)

```javascript
function oprAverage() {
  var average = 0.0;
  if (existArgs(arguments)) {
    var divisor = 0.0;
    var dividendo = arguments.length;
    for (var i = 0; i < arguments.length; i++) {
      var temp = arguments[i];
      if (temp) {
        divisor += parseNumeric(temp);
      }
    }
    average = divisor / dividendo;
  }
  return average;
}
```

---

## Mínimo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprMinimum` |
| **Código** | 603 |
| **Assinatura** | `Mínimo(Número...)  : Fracionado` |
| **Parâmetros** | N'Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função é utilizada para obter o menor dos valores passados por parâmetro.

Parâmetro(s):
1. N' Valor a ser comparado.

Retorno:
Obtém o menor valor dentre os passados por parâmetro, pode ter (n) parâmetros a serem avaliados. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo os parâmetros sendo: 100 (Inteiro), 66 (Inteiro) e 99 (Inteiro) o retorno será: 66.0 (Fracionado).

### Código Servidor (Java)

```java
protected final Variant oprMinimum(Variant... variants) throws Exception {
    double minimum = Double.MAX_VALUE;
    for (Variant variant : variants) {
      if (variant.getType() != WFRRuleType.NULL && variant.getDouble().compareTo(minimum) == -1) {
        minimum = variant.getDouble().doubleValue();
      }
    }
    return VariantPool.get(minimum);
  }
```

### Código Cliente (JavaScript)

```javascript
function oprMinimum() {
  var minimum = null;
  if (existArgs(arguments)) {
    minimum = parseNumeric(arguments[0]);
    for (var i = 0; i < arguments.length; i++) {
      var temp = parseNumeric(arguments[i]);      
      if (temp < minimum) {      	
        minimum = temp;
      }
    }
  }
  return minimum;
}
```

---

## Módulo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprModulus` |
| **Código** | 498 |
| **Assinatura** | `Módulo (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Calcula o valor absoluto de um número, ou seja, retorna sempre o valor positivo.

Parâmetro: 
1. Valor para retornar um valor absoluto.

Retorno:
Módulo do número passado por parâmetro. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo como 1° Parâmetro sendo: -10 (Inteiro), o retorno será 10 (Inteiro).

### Código Servidor (Java)

```java
protected final Variant oprModulus(Variant variant) throws Exception {
    Variant result;
    WFRRuleType type = variant.getType();
    switch (type) {
      case DOUBLE: {
        result = VariantPool.get(Math.abs(variant.getDouble()));
        break;
      }
      default: {
        result = VariantPool.get(Math.abs(variant.getLong()));
        break;
      }
    }
    return result;
  }
```

### Código Cliente (JavaScript)

```javascript
function oprModulus() {
  var value = 0;
  if (existArgs(arguments)) {
    value = Math.abs(parseNumeric(arguments[0]));
  }
  return value;
}
```

---

## PI

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathPI` |
| **Código** | 209 |
| **Assinatura** | `PI () : Fracionado` |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o valor de PI.

Parâmetro:
Não possui.

Retorno:
Retorna o valor de PI (3,1415926535897...). (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

### Código Servidor (Java)

```java
protected final Variant ebfMathPI() throws Exception {
    return VariantPool.get(Math.PI);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathPI() {
  return Math.PI;
}
```

---

## Potência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprPow` |
| **Código** | 589 |
| **Assinatura** | `Potência(Número;Número) : Fracionado` |
| **Parâmetros** | Número;Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Eleva o coeficiente passado no Parâmetro 1, ao expoente passado no Parâmetro 2.

Parâmetro(s): 
1. Valor a ser elevado à potência (base). (Número)
2. Valor para ser informado como expoente. (Número)

Retorno:
Retorna o valor calculado. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo: 
Assumindo os parâmetros sendo: 4 (Inteiro) e 2 (Inteiro), o retorno será: 16.0 (Fracionado).

### Código Servidor (Java)

```java
protected final Variant oprPow(Variant value, Variant exponent) throws Exception {
    return VariantPool.get(Math.pow(value.getDouble(), exponent.getDouble()));
  }
```

### Código Cliente (JavaScript)

```javascript
function oprPow() {
  var value = 0;
  if (existArgs(arguments)) {
    value = Math.pow(parseNumeric(arguments[0]), parseNumeric(arguments[1]));
  }
  return value;
}
```

---

## Produtório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFlowMultiply` |
| **Código** | 227 |
| **Assinatura** | `Produtório (Letras;Número;Número;Número) : Número` |
| **Parâmetros** | Letras;Número;Número;Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Efetua o produtório dentro de um intervalo definido.
Para cada valor definido no intervalo (a partir do incremento), a regra definida será executada e retornará um valor.
Todos esses valores serão multiplicados num total, o qual será o retorno da função.

Parâmetro(s): 
1. Nome da regra. (Fluxo)
2. Valor inicial, padrão 1. (Número)
3. Valor final. (Número)
4. Incremento, padrão 1. (Número)

Retorno: 
Produtório, no intervalo definido, da execução das funções. (Número)

Observações:
1. Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.
2. Utilize a função "Potência" para elevar um número ao quadrado.

Exemplo:
Assumindo como 1° Parâmetro sendo o fluxo: "XYZ" onde este fluxo recebe um parâmetro e eleva o mesmo ao quadrado,
o 2° Parâmetro sendo o valor: 1, o 3° Parâmetro sendo o valor: 2, e o 4° Parâmetro sendo o valor: 1, o retorno da função será 4 (1² * 2²).

### Código Servidor (Java)

```java
protected final Variant ebfFlowMultiply(Variant ruleName, Variant indexIni, Variant indexEnd, Variant increment) throws Exception {
    double multiply = 1;
    double ini = indexIni.isNull() ? 1 : indexIni.getDouble();
    double end = indexEnd.getDouble();
    double inc = 1;
    if (increment.getDouble() != 0) {
      inc = increment.getDouble();
    }
    while (ini != end) {
      multiply *= callRule(this, ruleName.getTrimString(), false, VariantPool.get(ini)).getDouble();
      ini += inc;
    }
    // Execução para quando o valor inicial é igual ao final. Este caso não entra no laço acima.
    multiply *= callRule(this, ruleName.getTrimString(), false, VariantPool.get(ini)).getDouble();
    return VariantPool.get(multiply);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFlowMultiply(ruleName, indexIni, indexEnd, increment) {
  ruleName = trim(ruleName);
  var reducedName = reduceVariable(ruleName);
  var sysCode = ($mainform().d.WFRForm ? $mainform().d.WFRForm.sys.value : $mainform().sysCode);
  var formCode = ($mainform().d.WFRForm ? $mainform().d.WFRForm.formID.value : null);
  var isJava = false;
  var ruleFunction;
  try {
    ruleFunction = window.eval(reducedName);
  } catch (ex) {
    isJava = true;
  }
  var multiply = 1.0;
  var ini = isNullable(indexIni) ? 1.0 : parseNumeric(indexIni);
  var end = parseNumeric(indexEnd);
  var inc = 1;
  if (parseNumeric(increment) != 0.0) {
    inc = parseNumeric(increment);
  }
  while (ini != end) {
    if (isJava) {
      multiply *= parseNumeric(executeSyncJavaRule(sysCode, formCode, ruleName, [ini]));
    } else {
      var ruleInstance = new ruleFunction(this, sysCode, formCode);
      if (ruleInstance && ruleInstance.run) {
        multiply *= parseNumeric(ruleInstance.run(ini));
      }
    }
    ini += inc;
  }
  // Execução para quando o valor inicial é igual ao final. Este caso não entra no laço acima.
  if (isJava) {
    multiply *= parseNumeric(executeSyncJavaRule(sysCode, formCode, ruleName, [ini]));
  } else {
    var ruleInstance = new ruleFunction(this, sysCode, formCode);
    if (ruleInstance && ruleInstance.run) {
      multiply *= parseNumeric(ruleInstance.run(ini));
    }
  }
  return multiply;
}
```

---

## Raiz Cúbica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathCubeRoot` |
| **Código** | 214 |
| **Assinatura** | `Raiz Cúbica (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém a raiz cúbica de um valor.

Parâmetro:
1. Valor a ser avaliado. (Número)

Retorno:
Raiz cúbica do valor determinado. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo como o 1° Parâmetro sendo: 8, o retorno será 2.
2. Assumindo como o 1° Parâmetro sendo: 27, o retorno será 3.

### Código Servidor (Java)

```java
protected final Variant ebfMathCubeRoot(Variant value) throws Exception {
    double result = Math.cbrt(value.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo da Raiz Cúbica.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathCubeRoot(value) {
  value = toDouble(value); 
  var result = Math.pow(value, 1/3);
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo da Raiz Cúbica.";
  }  
  var ceilValue = Math.ceil(result);
  if (Math.pow(ceilValue, 3) == value) {  
    return ceilValue;
  }  
  var floorValue = Math.floor(result);  
  if (Math.pow(floorValue, 3) == value) {  
    return floorValue;
  }
  return result;
}
```

---

## Raiz Quadrada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprSqrt` |
| **Código** | 590 |
| **Assinatura** | `Raiz Quadrada(Número) : Fracionado` |
| **Parâmetros** | Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Calcula a raiz quadrada de um número.

Parâmetro: 
1. Valor para ser tirado a raiz quadrada.

Retorno:
Raiz quadrada do número passado. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos: 
1. Assumindo como parâmetro como 16 (Inteiro), o retorno será: 4.0 (Fracionado), pois  4² = 16.
2. Assumindo como parâmetro como 81 (Inteiro), o retorno será: 9.0 (Fracionado), pois  9² = 81.

### Código Servidor (Java)

```java
protected final Variant oprSqrt(Variant value) throws Exception {
    return VariantPool.get(Math.sqrt(value.getDouble()));
  }
```

### Código Cliente (JavaScript)

```javascript
function oprSqrt() {
  var value = 0;
  if (existArgs(arguments)) {
    value = Math.sqrt(parseNumeric(arguments[0]));
  }
  return value;
}
```

---

## Resto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfOprMod` |
| **Código** | 726 |
| **Assinatura** | `Resto (Número;Número): Fracionado` |
| **Parâmetros** | Número;Número |
| **Retorno** | Fracionado |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Calcula o resto da divisão de dois números.

Parâmetro(s): 
1. Dividendo. (Número)
2. Divisor. (Número)

Retorno:
Retorna o resto da divisão do número do 1° Parâmetro com o número do 2° Parâmetro. (Fracionado)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo: 
Assumindo os parâmetros como: 7,5 e 2,5 o retorno seria: 0.

### Código Servidor (Java)

```java
protected final Variant ebfOprMod(Variant variant1, Variant variant2) throws Exception {
    if (variant2.getDouble().doubleValue() == 0) {
      throw new WFRRuleException("Divisão por 0 (zero) não é permitido!", this.ruleName);
    }
    return VariantPool.get(variant1.getDouble() % variant2.getDouble());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfOprMod() {
  var value = 0;
  if (existArgs(arguments)) {
    value = parseNumeric(arguments[0]);
    for (var i = 1; i < arguments.length; i++) {
      var temp = parseNumeric(arguments[i]);
      value %= temp;
    }
  }
  return value;
}
```

---

## Seno

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathSine` |
| **Código** | 218 |
| **Assinatura** | `Seno (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o seno de um ângulo.
Se o parâmetro estiver em graus, multiplique-o por PI/180 ou use a função "Para Radianos" para convertê-lo em radianos.

Parâmetro:
1. Ângulo em radianos para o qual você deseja obter o seno. (Número)

Retorno: 
Seno do ângulo determinado. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo como o 1° Parâmetro sendo PI (3.14159265359) , o retorno será aproximadamente 0.0206...

### Código Servidor (Java)

```java
protected final Variant ebfMathSine(Variant theta) throws Exception {
    double result = Math.sin(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo do Seno.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathSine(theta) {
  var result = Math.sin(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo do Seno.";
  }
  return result;
}
```

---

## Soma

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprAdd` |
| **Código** | 973 |
| **Assinatura** | `Soma (N'Número): Número` |
| **Parâmetros** | N'Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Retorna a soma dos números passados por parâmetros.

Parâmetro(s): 
1. N' Valores a ser somado. (Número)

Retorno:
Resultado da Soma dos parâmetros passados. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo os parâmetros sendo: 2 (Inteiro) e 2 (Inteiro), o retorno será: 4 (Inteiro).
2. Assumindo os parâmetros sendo: 4 (Inteiro) e 6 (Inteiro), o retorno será: 10 (Inteiro).

### Código Servidor (Java)

```java
protected final Variant oprAdd(Variant... variants) throws Exception {
    Variant result;
    WFRRuleType type = variants[0].getType();
    switch (type) {
      case STRING: {
        result = oprAddDouble(variants);
        break;
      }
      case DATE: {
        result = ebfDateSumDay(variants);
        break;
      }
      case DOUBLE: {
        result = oprAddDouble(variants);
        break;
      }
      default: {
        result = oprAddLong(variants);
        break;
      }
    }
    return result;
  }
```

### Código Cliente (JavaScript)

```javascript
function oprAdd() {
  var value = 0;
  if (existArgs(arguments)) {
    value = arguments[0];
    if (value instanceof Date) {
      for (var i = 1; i < arguments.length; i++) {
        var temp = toDate(arguments[i]);
        value.incDay(temp.getDate());
      }
    } else if (value instanceof Times) {
      for (var i = 1; i < arguments.length; i++) {
        var temp = parseTime(arguments[i]);
        value.incHour(temp.getHour());
      }
    } else {
      value = parseNumeric(value);
      for (var i = 1; i < arguments.length; i++) {
        var temp = parseNumeric(arguments[i]);
        value += temp;
      }
    }
  }
  return value;
}
```

---

## Somar Bytes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSomaArrayBytes` |
| **Código** | 117 |
| **Assinatura** | `Somar Bytes (Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | Navegação |
| **Compatibilidade** | Banco de Dados |

### Descrição

Soma de um vetor de Bytes.

Parâmetro: 
1. Vetor de bytes.

Retorno:
Retorna o resultado da soma do vetor de bytes. (Variante)

### Código Servidor (Java)

```java
protected static final Variant ebfSomaArrayBytes(Variant array) throws Exception { 
    long soma=0;          
    byte[] bytes = ((byte[]) array.getObject());
    for (int v=0;v<bytes.length;v++) {
      soma = (soma<<8)+((bytes[v] &(0x000000ffL)));
    }
    return VariantPool.get(soma);
}
```

---

## Somatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFlowSum` |
| **Código** | 226 |
| **Assinatura** | `Somatório (Letras;Número;Número;Número) : Número` |
| **Parâmetros** | Letras;Número;Número;Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Efetua o somatório dentro de um intervalo definido.
Para cada valor definido no intervalo (a partir do incremento), a regra definida será executada e retornará um valor.
Todos esses valores serão somados num total, o qual será o retorno da função.

Parâmetro(s):
1. Nome da regra. (Letras)
2. Valor Inicial, padrão 0. (Número)
3. Valor Final. (Número)
4. Incremento, padrão 1. (Número)

Retorno: 
Somatório, no intervalo definido, da execução das funções.

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
1. Assumindo o 1º Parâmetro como um fluxo "XYZ" que recebe um parâmetro e eleva o mesmo ao quadrado,
o 2º Parâmetro como 1, o 3º Parâmetro como 2, e o 4º Parâmetro como 1, o retorno da função seria 5 (1² + 2²).

### Código Servidor (Java)

```java
protected final Variant ebfFlowSum(Variant ruleName, Variant indexIni, Variant indexEnd, Variant increment) throws Exception {
    double sum = 0;
    double ini = indexIni.getDouble();
    double end = indexEnd.getDouble();
    double inc = 1;
    if (increment.getDouble() != 0) {
      inc = increment.getDouble();
    }
    while (ini != end) {
      sum += callRule(getParent(), ruleName.getTrimString(), false, VariantPool.get(ini)).getDouble();
      ini += inc;
    }
    // Execução para quando o valor inicial é igual ao final. Este caso não entra no laço acima.
    sum += callRule(getParent(), ruleName.getTrimString(), false, VariantPool.get(ini)).getDouble();
    return VariantPool.get(sum);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFlowSum(ruleName, indexIni, indexEnd, increment) {
  ruleName = trim(ruleName);
  var reducedName = reduceVariable(ruleName);  
  var sysCode = ($mainform().d.WFRForm ? $mainform().d.WFRForm.sys.value : $mainform().sysCode);
  var formCode = ($mainform().d.WFRForm ? $mainform().d.WFRForm.formID.value : null);
  var isJava = false;
  var ruleFunction;
  try {
    ruleFunction = window.eval(reducedName);
  } catch (ex) {
    isJava = true;
  }
  var sum = 0.0;
  var ini = parseNumeric(indexIni);
  var end = parseNumeric(indexEnd);
  var inc = 1;
  if (parseNumeric(increment) != 0.0) {
    inc = parseNumeric(increment);
  }
  while (ini != end) {
    if (isJava) {
      sum += parseNumeric(executeSyncJavaRule(sysCode, formCode, ruleName, [ini]));
    } else {
      var ruleInstance = new ruleFunction(this, sysCode, formCode);
      if (ruleInstance && ruleInstance.run) {
        sum += parseNumeric(ruleInstance.run(ini));
      }
    }
    ini += inc;
  }
  // Execução para quando o valor inicial é igual ao final. Este caso não entra no laço acima.
  if (isJava) {
    sum += parseNumeric(executeSyncJavaRule(sysCode, formCode, ruleName, [ini]));
  } else {
    var ruleInstance = new ruleFunction(this, sysCode, formCode);
    if (ruleInstance && ruleInstance.run) {
      sum += parseNumeric(ruleInstance.run(ini));
    }
  }
  return sum;
}
```

---

## Subtração

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprSubtract` |
| **Código** | 974 |
| **Assinatura** | `Subtração (N'Número): Número` |
| **Parâmetros** | N'Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | * |

### Descrição

Subtração de valores informados nos parâmetros.

Parâmetro(s): 
1. N' Valor para a subtração. (Número)

Retorno:
Retorna a subtração de dois ou mais números. (Número)

Observações:
1. O tipo de retorno resultante depende do tipo do primeiro parâmetro.
2. Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplos:
1. Assumindo os parâmetros sendo: 10 (Inteiro) e 5 (Inteiro), o retorno será: 5 (Inteiro).
2. Assumindo os parâmetros sendo: 20 (Inteiro) e 2 (Inteiro), o retorno seria: 18 (Inteiro).

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
  protected final Variant oprSubtract(Variant... variants) throws Exception {
    Variant result;
    WFRRuleType type = variants[0].getType();
    switch (type) {
      case DATE: {
        result = ebfDateSubtractDay(variants);
        break;
      }
      case DOUBLE: {
        result = oprSubtractDouble(variants);
        break;
      }
      default: {
        result = oprSubtractLong(variants);
        break;
      }
    }
    return result;
  }
```

### Código Cliente (JavaScript)

```javascript
function oprSubtract() {
  var value = 0;
  if (existArgs(arguments)) {
    value = arguments[0];
    if (value instanceof Date) {
      for (var i = 1; i < arguments.length; i++) {
        var temp = toDate(arguments[i]);
        value.subtractDay(temp.getDate());
      }
    } else if (value instanceof Times) {
      for (var i = 1; i < arguments.length; i++) {
        var temp = parseTime(arguments[i]);
        value.subtractHour(temp.getHour());
      }
    } else {
      value = parseNumeric(value);
      for (var i = 1; i < arguments.length; i++) {
        var temp = parseNumeric(arguments[i]);
        value -= temp;
      }
    }
  }
  return value;
}
```

---

## Tangente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMathTangent` |
| **Código** | 219 |
| **Assinatura** | `Tangente (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém a tangente de um ângulo.
Se o parâmetro estiver em graus, multiplique-o por PI/180 ou use a função Para Radianos para convertê-lo em radianos.

Parâmetro: 
1. Ângulo em radianos para o qual se deseja a tangente. (Número)

Retorno: 
Tangente do ângulo determinado. (Número)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo:
Assumindo o Parâmetro 1 como 0,785, o retorno seria 0,99920 aproximadamente.

### Código Servidor (Java)

```java
protected final Variant ebfMathTangent(Variant theta) throws Exception {
    double result = Math.tan(theta.getDouble());
    if (Double.NaN == result) {
      throw new WFRRuleException("Argumento inválido para o cálculo da Tangente.", this.ruleName);
    }
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfMathTangent(theta) {
  var result = Math.tan(toDouble(theta));
  if (isNaN(result)) {
    throw "Argumento inválido para o cálculo da Tangente.";
  }
  return result;
}
```

---

## Truncar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprTrunc` |
| **Código** | 586 |
| **Assinatura** | `Truncar(Fracionado) : Inteiro` |
| **Parâmetros** | Fracionado |
| **Retorno** | Inteiro |
| **Tipo** | Navegação |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Arredonda para baixo um número fracionado.

Parâmetro:
1. Valor fracionado.

Retorno:
Número arredondado para baixo. (Inteiro)

Observação:
Para garantir a integridade das operações matemáticas, utilize conversão para o tipo de dado nos parâmetros.

Exemplo: 
Assumindo o parâmetro: 9,6 (Fracionado), o retorno seria: 9 (Inteiro)

### Código Servidor (Java)

```java
protected final Variant oprTrunc(Variant variant) throws Exception {
    return VariantPool.get(variant.getDouble().longValue());
  }
```

### Código Cliente (JavaScript)

```javascript
function oprTrunc() {
  var value = 0;
  if (existArgs(arguments)) {
    value = parseNumeric(arguments[0]).trunc();
  }
  return value;
}
```

---

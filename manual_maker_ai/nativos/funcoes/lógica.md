# Funções Nativas - Lógica

Total: **14** funções

[← Voltar para Funções Nativas](README.md)

---

## Comparar Ordem Alfanumérica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isGreaterIgCase` |
| **Código** | 346 |
| **Assinatura** | `Comparar Ordem Alfanumérica (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função recebe dois valores e verifica se o primeiro valor é maior que o segundo (em ordem alfanumérica).

Parâmetro(s):
1. Nome ou expressão a ser verificada. (Letras)
2. Nome ou expressão a ser verificada. (Letras)

Retorno:
Retorna Verdadeiro se o 1º Parâmetro é maior que o 2º Parâmetro em ordem alfanumérica e Falso se for Menor ou Igual. (Lógico)

Observações:
1. Caso os valores sejam iguais, é retornado falso.
2. Essa função ignora letras maiúsculas e minúsculas.

Exemplo:
Utilizando os valores "Softwell" no 1° parâmetro  e "Maker" no 2 parâmetro , o retorno será "True", uma vez que "S" é maior que "M" na ordem
alfanumérica.

### Código Servidor (Java)

```java
protected final Variant isGreaterIgCase(Variant v1, Variant v2) throws Exception {
    String s1 = v1.getString();
    String s2 = v2.getString();
    return VariantPool.get(s1.compareToIgnoreCase(s2) > 0);
}
```

---

## Diferente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isDiferent` |
| **Código** | 966 |
| **Assinatura** | `Diferente (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função verifica se o 1º parâmetro é diferente do 2º parâmetro.

Parâmetro(s): 
1. Primeiro valor. (Variante)
2. Segundo valor. (Variante)

Retorno: 
Retorna verdadeiro se o 1º parâmetro for diferente do 2º parâmetro, caso contrário retorna falso. (Lógico)

Observações: 
1. Essa função diferencia letras maiúsculas e minúsculas.
2. Devido a tipagem dinâmica das variáveis na camada cliente a função em questão considera que os parâmetros criados como numéricos
necessita que seus valores sejam convertidos para inteiro ou fracionado, através do uso das funções "Para Inteiro" e "Para Fracionado".

Exemplos: 
1. Assumindo os parâmetros como 10 (inteiro) e 2 (Inteiro), o retorno será verdadeiro.
2. Assumindo os parâmetros como A (letra) e A (letra), o retorno falso.

### Código Servidor (Java)

```java
protected final Variant isDiferent(Variant v1, Variant v2) throws Exception {
    return VariantPool.get(v1.compareTo(v2) != 0);
  }
```

### Código Cliente (JavaScript)

```javascript
function isDiferent() {
  var value = false;
  if (existArgs(arguments)) {
    var param1 = arguments[0];
    var param2 = arguments[1];
    if (param1 instanceof Date) {
      var data1 = param1;
      var data2 = toDate(param2);
      if (data1 != null && data2 != null) {
        value = (data1.compareTo(data2) != 0);
      }
    } else if (param1 instanceof Times) {
      var hora1 = param1;
      var hora2 = parseTime(param2);
      if (hora1 != null && hora2 != null) {
        value = (hora1.compareTo(hora2) != 0);
      }
    } else {
      value = (param1 != param2);
    }
  }
  return value;
}
```

---

## E

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprAnd` |
| **Código** | 554 |
| **Assinatura** | `E (Lógico...) : Lógico` |
| **Parâmetros** | N'Lógico |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se algum valor passado é Falso, para retornar falso ou se são verdadeiros para retornar verdadeiro.

Parâmetro(s):
1. N' Valores ou funções que retornem valores lógicos. (Lógico)

Retorno: 
Retorna verdadeiro se todos os valores forem verdadeiros, caso um valor seja falso o retorno será falso. (Lógico)

Observação:
Podem ser n parâmetros, utilize o mais (+) para acrescentar os parâmetros desejados.

Exemplos: 
1. Assumindo que tenhamos dois parâmetros: o 1º recebe a Função "Maior" contendo os parâmetros: 3 e 5 (3>5) e o 2º recebe a 
Função "Menor" contendo os parâmetros: 7 e 10 (7<10), o retorno será falso,pois 3 é menor que 5.
2. Assumindo que tenhamos dois parâmetros: o 1º recebe a Função "Igual" contendo os parâmetros: A e A (A=A) e o 2º recebe a 
Função "Diferente" contendo os parâmetros: 56 e 65 (56<>65), o retorno será verdadeiro, pois as duas condições são 
verdadeiras.

### Código Servidor (Java)

```java
protected final Variant oprAnd(Variant... variants) throws Exception {
    Boolean value = true;
    for (Variant variant : variants) {
      value = value && variant.getBoolean();
    }
    return VariantPool.get(value);
  }
```

### Código Cliente (JavaScript)

```javascript
function oprAnd() {
  var value = true;
  if (existArgs(arguments)) {
    for (var i = 0; i < arguments.length; i++) {
      var temp = arguments[i];
      value = value && temp;
    }
  }
  return value;
}
```

---

## Entre

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprBetween` |
| **Código** | 967 |
| **Assinatura** | `Entre (Variante;Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função verifica se o valor passado no 1º parâmetro está contido no intervalo que é delimitado pelo 2º e 3º parâmetros. A depender do resultado, retorna verdadeiro ou falso.

Parâmetro(s):
1. Valor a ser verificado. (Variante)
2. Menor valor do intervalo. (Variante)
3. Maior valor do intervalo. (Variante)

Retorno: 
Retorna verdadeiro se o valor verificado estiver no intervalo, caso contrário o retorno será falso. (Lógico)

Exemplos: 
1. Assumindo que o valor do 1º parâmetro seja 50, o do 2º parâmetro 10 e o valor do 3º parâmetro 100 o retorno será verdadeiro, pois 50 está entre 10 e 100.
2. Assumindo que o valor do 1º parâmetro seja 5, o do 2º parâmetro 35 e o valor do 3º parâmetro 70 o retorno será falso, pois 5 não está entre 35 e 70.

### Código Servidor (Java)

```java
protected final Variant oprBetween(Variant value, Variant v1, Variant v2) throws Exception {
    return VariantPool.get(value.compareTo(v1) >= 0 && value.compareTo(v2) <= 0);
  }
```

### Código Cliente (JavaScript)

```javascript
function oprBetween() {
  var between = false;
  if (existArgs(arguments)) {
    var value = arguments[0];
    var v1 = arguments[1];
    var v2 = arguments[2];
    if (!isNullable(value) && !isNullable(v1) && !isNullable(v2)) {
      if ((value instanceof Date) && (v1 instanceof Date) && (v2 instanceof Date)) {
        between = value.compareTo(v1) >= 0 && value.compareTo(v2) <= 0;
      } else if ((value instanceof Times) && (v1 instanceof Times) && (v2 instanceof Times)) {
        between = value.compareTo(v1) >= 0 && value.compareTo(v2) <= 0;
      } else if ((typeof value == "number") && (typeof v1 == "number") && (typeof v2 == "number")) {
        between = value >= v1 && value <= v2;
      } else {
        between = value.toString() >= v1.toString() && value.toString() <= v2.toString();
      }
    }
  }
  return between;
}
```

---

## Igual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isEqual` |
| **Código** | 968 |
| **Assinatura** | `Igual (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se os valores passados por parâmetro são iguais, ou seja, possuem o mesmo valor.

Parâmetro(s):
1. Valor a ser verificado. (Variante)
2. Valor a ser verificado. (Variante)

Retorno: 
O Retorno será verdadeiro se o valor do 1º parâmetro for igual ao valor do 2º parâmetro, caso contrário o retorno será falso. (Lógico)

Observações: 
1. Essa função diferencia letras maiúsculas e minúsculas.
2. Devido a tipagem dinâmica das variáveis na camada cliente. Para que a função considere que os parâmetros são
 numéricos, será necessário converter os valores para número (inteiro ou fracionario) ao passar os parâmetros para a
 função (mesmo se as variáveis utilizadas já forem numéricas).

Exemplos: 
1. Assumindo o valor do 1º parâmetro sendo "ab" e o 2º parâmetro sendo "AB" o valor de retorno será falso, pois a função diferencia letras maiúsculas e minúsculas.
2. Assumindo o valor do 1º parâmetro sendo "80" e o 2º parâmetro sendo "80" o valor de retorno será verdadeiro, pois 80 é igual a 80.

### Código Servidor (Java)

```java
protected final Variant isEqual(Variant v1, Variant v2) throws Exception {
      return VariantPool.get(v1.compareTo(v2) == 0);
  }
```

### Código Cliente (JavaScript)

```javascript
function isEqual() {
  var value = false;
  if (existArgs(arguments)) {
    var param1 = arguments[0];
    var param2 = arguments[1];
    if (param1 instanceof Date) {
      var data1 = param1;
      var data2 = toDate(param2);
      if (data1 != null && data2 != null) {
        value = (data1.compareTo(data2) == 0);
      }
    } else if (param1 instanceof Times) {
      var hora1 = param1;
      var hora2 = parseTime(param2);
      if (hora1 != null && hora2 != null) {
        value = (hora1.compareTo(hora2) == 0);
      }
    } else {
      value = (param1 == param2);
    }
  }
  return value;
}
```

---

## Maior

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isGreater` |
| **Código** | 969 |
| **Assinatura** | `Maior (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se o valor do 1º parâmetro é maior que o do 2º parâmetro. A depender do resultado retorna verdadeiro ou falso.
Se os valores dos parâmetros forem iguais o retorno será falso, pois o mesmo valor não é maior que ele mesmo.

Parâmetro(s):
1. Valor a ser verificado. (Variante)
2. Valor a ser verificado. (Variante)

Retorno: 
Retorna verdadeiro se o valor do 1º parâmetro for maior que o valor do 2º parâmetro, caso contrário o retorno será falso. (Lógico)

Observação:
Devido a tipagem dinâmica das variáveis na camada cliente. Para que a função considere que os parâmetros são
numéricos, será necessário converter os valores para número (inteiro ou fracionário) ao passar os parâmetros para a
função (mesmo se as variáveis utilizadas já forem numéricas).

Exemplos: 
1. Assumindo o valor do 1º parâmetro sendo 20 e o 2º parâmetro sendo 30 o valor de retorno será falso, pois 20 não é maior que 30.
2. Assumindo o valor do 1º parâmetro sendo 80 e o 2º parâmetro sendo 80 o valor de retorno será falso, pois 80 não é maior que 80.

### Código Servidor (Java)

```java
protected final Variant isGreater(Variant v1, Variant v2) throws Exception {
    return VariantPool.get(v1.compareTo(v2) == 1);
  }
```

### Código Cliente (JavaScript)

```javascript
function isGreater(value1, value2) {
  var value = false;
  if (value1 != null && typeof value1 != "undefined" && value2 != null && typeof value2 != "undefined") {
    var param1 = value1;
    var param2 = value2;
    if (param1 instanceof Date) {
      var data1 = param1;
      var data2 = toDate(param2);
      if (data1 != null && data2 != null) {
        value = (data1.compareTo(data2) == 1);
      }
    } else if (param1 instanceof Times) {
      var hora1 = param1;
      var hora2 = parseTime(param2);
      if (hora1 != null && hora2 != null) {
        value = (hora1.compareTo(hora2) == 1);
      }
    } else {
      value = param1 > param2;
    }
  }
  return value;
}
```

---

## Maior ou Igual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isGreaterOrEqual` |
| **Código** | 970 |
| **Assinatura** | `Maior ou Igual (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se o valor do 1º parâmetro é maior ou igual a do 2º parâmetro. A depender do resultado retorna verdadeiro ou falso.

Parâmetro(s):
1. Valor a ser verificado. (Variante)
2. Valor a ser verificado. (Variante)

Retorno: 
Retorna verdadeiro se o valor do 1º parâmetro for maior ou igual que o valor do 2º parâmetro, caso contrário o retorno será falso. (Lógico)

Observação:
Devido a tipagem dinâmica das variáveis na camada cliente. Para que a função considere que os parâmetros são
numéricos, será necessário converter os valores para número (inteiro ou fracionário) ao passar os parâmetros para a
função (mesmo se as variáveis utilizadas já forem numéricas).

Exemplos: 
1. Assumindo o valor do 1º parâmetro sendo 36 e o 2º parâmetro sendo 52 o valor de retorno será falso, pois 36 não é maior nem igual a 52.
2. Assumindo o valor do 1º parâmetro sendo 55 e o 2º parâmetro sendo 55 o valor de retorno será verdadeiro, pois a condição é maior ou igual e 55 é igual a 55.

### Código Servidor (Java)

```java
protected final Variant isGreaterOrEqual(Variant v1, Variant v2) throws Exception {
    return VariantPool.get(v1.compareTo(v2) >= 0);
  }
```

### Código Cliente (JavaScript)

```javascript
function isGreaterOrEqual(value1, value2) {
  var value = false;
  if (value1 != null && typeof value1 != "undefined" && value2 != null && typeof value2 != "undefined") {
    var param1 = value1;
    var param2 = value2;
    if (param1 instanceof Date) {
      var data1 = param1;
      var data2 = toDate(param2);
      if (data1 != null && data2 != null) {
        value = (data1.compareTo(data2) == 0 || data1.compareTo(data2) == 1);
      }
    } else if (param1 instanceof Times) {
      var hora1 = param1;
      var hora2 = parseTime(param2);
      if (hora1 != null && hora2 != null) {
        value = (hora1.compareTo(hora2) == 0 || hora1.compareTo(hora2) == 1);
      }
    } else {
      value = param1 >= param2;
    }
  }
  return value;
}
```

---

## Menor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isMinor` |
| **Código** | 971 |
| **Assinatura** | `Menor (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se o valor do 1º parâmetro é menor que o valor do 2º parâmetro. A depender do resultado retorna verdadeiro ou falso.
Se os valores dos parâmetros forem iguais o retorno será falso, pois o mesmo valor não é menor que ele mesmo.

Parâmetro(s):
1. Valor a ser verificado. (Variante)
2. Valor a ser verificado. (Variante)

Retorno: 
Retorna verdadeiro se o valor do 1º parâmetro for menor que o valor do 2º parâmetro, caso contrário o retorno será falso. (Lógico)

Observação:
Devido a tipagem dinâmica das variáveis na camada cliente. Para que a função considere que os parâmetros são
numéricos, será necessário converter os valores para número (inteiro ou fracionário) ao passar os parâmetros para a
função (mesmo se as variáveis utilizadas já forem numéricas).

Exemplos: 
1. Assumindo o valor do 1º parâmetro sendo 26 e o 2º parâmetro sendo 12 o valor de retorno será falso, pois 26 não é menor que 12.
2. Assumindo o valor do 1º parâmetro sendo 5 e o 2º parâmetro sendo 87 o valor de retorno será verdadeiro, pois 5 é menor que 87.

### Código Servidor (Java)

```java
protected final Variant isMinor(Variant v1, Variant v2) throws Exception {
    return VariantPool.get(v1.compareTo(v2) == -1);
  }
```

### Código Cliente (JavaScript)

```javascript
function isMinor(value1, value2) {
  var value = false;
  if (value1 != null && typeof value1 != "undefined" && value2 != null && typeof value2 != "undefined") {
    var param1 = value1;
    var param2 = value2;
    if (param1 instanceof Date) {
      var data1 = param1;
      var data2 = toDate(param2);
      if (data1 != null && data2 != null) {
        value = (data1.compareTo(data2) == -1);
      }
    } else if (param1 instanceof Times) {
      var hora1 = param1;
      var hora2 = parseTime(param2);
      if (hora1 != null && hora2 != null) {
        value = (hora1.compareTo(hora2) == -1);
      }
    } else {
      value = param1 < param2;
    }
  }
  return value;
}
```

---

## Menor ou Igual

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isMinorOrEqual` |
| **Código** | 972 |
| **Assinatura** | `Menor ou Igual (Variante;Variante): Lógico` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se o valor do 1º parâmetro é menor ou igual ao valor do 2º parâmetro. A depender do resultado retorna verdadeiro ou falso.

Parâmetro(s): 
1. Valor a ser verificado. (Variante)
2. Valor a ser verificado. (Variante)

Retorno: 
Retorna verdadeiro se o valor do 1º parâmetro for menor ou igual ao valor do 2º parâmetro, caso contrário o retorno será falso. (Lógico)

Observação:
Devido a tipagem dinâmica das variáveis na camada cliente. Para que a função considere que os parâmetros são
numéricos, será necessário converter os valores para número (inteiro ou fracionário) ao passar os parâmetros para a
função (mesmo se as variáveis utilizadas já forem numéricas).

Exemplos: 
1. Assumindo o valor do 1º parâmetro sendo 65 e o 2º parâmetro sendo 15 o valor de retorno será falso, pois 65 não é menor nem igual que 15.
2. Assumindo o valor do 1º parâmetro sendo 505 e o 2º parâmetro sendo 632 o valor de retorno será verdadeiro, pois 505 é menor que 632.
3. Assumindo o valor do 1º parâmetro sendo 39 e o 2º parâmetro sendo 39 o valor de retorno será verdadeiro, pois a condição é menor ou igual e 39 é igual a 39.

### Código Servidor (Java)

```java
protected final Variant isMinorOrEqual(Variant v1, Variant v2) throws Exception {
    return VariantPool.get(v1.compareTo(v2) <= 0);
  }
```

### Código Cliente (JavaScript)

```javascript
function isMinorOrEqual(value1, value2) {
  var value = false;
  if (value1 != null && typeof value1 != "undefined" && value2 != null && typeof value2 != "undefined") {
    var param1 = value1;
    var param2 = value2;
    if (param1 instanceof Date) {
      var data1 = param1;
      var data2 = toDate(param2);
      if (data1 != null && data2 != null) {
        value = (data1.compareTo(data2) == 0 || data1.compareTo(data2) == -1);
      }
    } else if (param1 instanceof Times) {
      var hora1 = param1;
      var hora2 = parseTime(param2);
      if (hora1 != null && hora2 != null) {
        value = (hora1.compareTo(hora2) == 0 || hora1.compareTo(hora2) == -1);
      }
    } else {
      value = param1 <= param2;
    }
  }
  return value;
}
```

---

## Não

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprNot` |
| **Código** | 556 |
| **Assinatura** | `Não (Lógico...) : Lógico` |
| **Parâmetros** | Lógico |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função inverte o valor lógico. Se o valor do parâmetro for verdadeiro o retorno dele terá o valor lógico falso. Caso 
contrário será verdadeiro.

Parâmetro: 
1. Valor Lógico.

Retorno: 
Retorna o valor invertido. (Lógico)

Exemplos: 
1. Assumindo que o 1º parâmetro é uma variável do tipo lógica de valor verdadeiro, o retorno será falso. 
2. Assumindo que o 1º parâmetro é a função igual contendo os valores 5 e 5 (5=5) o retorno será falso, pois (5=5 é verdadeiro)
a negação dessa operação é falso.

### Código Servidor (Java)

```java
protected final Variant oprNot(Variant variant) throws Exception {
    return VariantPool.get(!variant.getBoolean().booleanValue());
  }
```

### Código Cliente (JavaScript)

```javascript
function oprNot() {
  var value = null;
  if (existArgs(arguments)) {
    var temp = arguments[0];
    if (temp != null) {
      if (typeof temp == "number") {
        value = -temp;
      } else if (typeof temp == "boolean") {
        value = !temp;
      } else {
        interactionError("Tipo de parâmetro desconhecido para a operação NOT.");
        value = temp;
      }
    }
  }
  return value;
}
```

---

## Ou

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprOr` |
| **Código** | 555 |
| **Assinatura** | `Ou (Lógico...) : Lógico` |
| **Parâmetros** | N'Lógico |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica se algum valor passado por parâmetro é verdadeiro, para retornar verdadeiro ou se todos os parâmetros são valores falsos, para retornar falso.

Parâmetro(s):
1. N' Valores ou funções que retornem valores lógicos. (Lógico)

Retorno: 
Retorna verdadeiro se apenas um parâmetro for verdadeiro e retorna falso se todos os parâmetros forem falsos. (Lógico)

Exemplos: 
1. Assumindo que tenhamos dois parâmetros: o 1º recebe a função maior contendo os parâmetros: 3 e 5 (3>5) e o 2º recebe a função menor contendo os parâmetros: 7 e 10 (7<10), o retorno será verdadeiro,pois um parâmetro é verdadeiro.
2. Assumindo que tenhamos dois parâmetros: o 1º recebe a função igual contendo os parâmetros: A e F (A=F) e o 2º recebe a função diferente contendo os parâmetros: 64 e 64 (64<>64), o retorno será falso, pois as duas condições são falsas.

### Código Servidor (Java)

```java
protected final Variant oprOr(Variant... variants) throws Exception {
    Boolean value = false;
    for (Variant variant : variants) {
      value = variant.getBoolean() || value;
    }
    return VariantPool.get(value);
  }
```

### Código Cliente (JavaScript)

```javascript
function oprOr() {
  var value = false;
  if (existArgs(arguments)) {
    for (var i = 0; i < arguments.length; i++) {
      var temp = arguments[i];
      value = temp || value;
    }
  }
  return value;
}
```

---

## Se

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `oprIf` |
| **Código** | 512 |
| **Assinatura** | `Se` |
| **Parâmetros** | Lógico;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 26 |
| **Compatibilidade** | * |

### Descrição

Essa função verifica o valor lógico do 1º parâmetro, se o mesmo for verdadeiro o retorno será o valor que estiver no 2º 
parâmetro, caso contrário o valor do 3º parâmetro.

Parâmetro(s):
1. Função que tenha um retorno lógico. (Lógico)
2. Valor a ser retornado caso o primeiro parâmetro seja verdadeiro. (Variante)
3. Valor a ser retornado caso o primeiro parâmetro seja falso. (Variante)

Retorno: 
Retorna o valor do 2º parâmetro ou do 3º parâmetro a depender do retorno lógico do 1º parâmetro. (Variante)

Exemplos: 
1. Assumindo que o valor do 1º parâmetro seja a função igual contendo os valores 7 e 7 (7=7), o 2º parâmetro o valor 7 e o 3º
parâmetro o valor 5, o retorno será 7, pois a condição do 1º parâmetro é verdadeira.
2. Assumindo que o valor do 1º parâmetro seja a função diferente contendo os valores 19 e 19 (19<>19), o 2º parâmetro o 
valor 35 e o 3º parâmetro a função soma contendo 5 e 15 (5+15) , o retorno será o resultado da soma no caso 20, pois a 
condição do 1º parâmetro é falsa.

### Código Servidor (Java)

```java
protected final Variant oprIf(Variant decision, Variant v1, Variant v2) throws Exception {
    return decision.getBoolean() ? v1 : v2;
  }
```

### Código Cliente (JavaScript)

```javascript
function oprIf() {
  var value = null;
  if (existArgs(arguments)) {
    value = arguments[0] ? arguments[1] : arguments[2];
  }
  return value;
}
```

---

## É Nulo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isNull` |
| **Código** | 523 |
| **Assinatura** | `É Nulo(Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função verifica se o parâmetro for nulo. 

Parâmetro: 
1. Recebe um valor ou uma função para ser avaliada. (Variante)

Retorno: 
Retorna verdadeiro se o valor for nulo, caso contrário o retorno será falso. (Lógico)

Observações:
1. Valores iguais a 0 (zero) são considerados como nulo. 
2. Essa função não é válida para verificar se um Objeto Lista ou Mapa é nulo ou vazio, para tal, utilizar a função Tamanho da Lista ou Tamanho do Mapa verificando se o retorno da mesma é maior que 0 (zero).

Exemplos: 
1. Assumindo que tenhamos feito uma consulta no banco de dados (ex: FPG_ACUMULO) e a partir da consulta obtemos o valor do campo (FOL_COD). Atribuindo essas duas funções a função É Nulo, caso a consulta não retorne valor de FOL_COD o retorno será verdadeiro, pois o campo está com o valor nulo.
2. Assumindo que tenhamos obtido o valor de um componente do formulário, se não tiver valor no componente o retorno será verdadeiro, caso o componente tenha algum valor atribuído a ele o retorno será falso.

### Código Servidor (Java)

```java
protected final Variant isNull(Variant value) throws Exception {
    return VariantPool.get(value.getType() == NULL);
  }
```

### Código Cliente (JavaScript)

```javascript
function isNull(value) {
 if (value == null) {
   return true;          
 }
 if (isTypeOf(value, 'ActiveXObject')) {
   return (value == null || typeof value == 'undefined');  
 }
 return (typeof value == 'undefined' || value == '' || value.toString() == 'NaN');
}
```

---

## É Nulo ou Vazio

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `isNullOrEmpty` |
| **Código** | 524 |
| **Assinatura** | `É Nulo ou Vazio (Variante): Lógico` |
| **Parâmetros** | Variante |
| **Retorno** | Lógico |
| **Tipo** | 26 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função verifica se o parâmetro é nulo ou vazio. A depender do resultado, retorna verdadeiro ou falso.

Parâmetro: 
1. Recebe um valor ou uma função para ser avaliada. (Variante)

Retorno: 
Retorna verdadeiro se o valor for nulo ou vazio, caso contrário o retorno será falso. (Lógico)

Observação:
Essa função não é válida para verificar se um Objeto Lista ou Mapa é nulo ou vazio, para tal, utilizar a função "Tamanho da Lista" ou "Tamanho do Mapa" verificando se o retorno da mesma é maior que 0 (zero).

Exemplos: 
1. Assumindo que tenhamos feito uma consulta no banco de dados (ex: FPG_ACUMULO) e a partir da consulta obtemos o valor do campo (FOL_COD). Atribuindo essas duas funções a função É Nulo, caso a consulta não retorne valor de FOL_COD o retorno será verdadeiro, pois o campo está com o valor nulo.
2. Assumindo que tenhamos obtido o valor de um componente do formulário, se não tiver valor no componente o retorno será verdadeiro, caso o componente tenha algum valor atribuído a ele o retorno será falso.
3. Verificando se um campo no formulário está em branco, a função retornará verdadeiro caso o campo esteja vazio caso contrário retornará falso.

### Código Servidor (Java)

```java
protected final Variant isNullOrEmpty(Variant var) throws Exception {
    return VariantPool.get(var.isNull() || var.toString().trim().length() == 0);
  }
```

### Código Cliente (JavaScript)

```javascript
function isNullOrEmpty(variavel) {
  return (variavel == null || typeof variavel == 'undefined' || trim(variavel+'') == '' || variavel.toString() == 'NaN');
}
```

---

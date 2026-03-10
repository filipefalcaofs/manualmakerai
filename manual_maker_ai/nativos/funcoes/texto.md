# Funções Nativas - Texto

Total: **35** funções

[← Voltar para Funções Nativas](README.md)

---

## Append

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAppend` |
| **Código** | 367 |
| **Assinatura** | `Concatenação (Letras...) : Letras` |
| **Parâmetros** | N'Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Junta vários itens de texto em apenas um item.

Parâmetro(s):
1. Valor que terá outros valores adicionados. (Letras)
2. Valor que será concatenado junto ao texto do primeiro parâmetro. (Letras)

Retorno: 
Retorna o valor concatenado. (Letras)

Observação:
1. Serão N' Valor n a ser adicionado.
2. Esta função tem um melhor desempenho em relação a função "Concatenação".

### Código Servidor (Java)

```java
protected final Variant ebfAppend(Variant org, Variant... variants) throws Exception {
  return org.append(variants);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfAppend() {
  var value = "";

  if (existArgs(arguments)) {
    for (var i = 0; i < arguments.length; i++) {
      if(arguments[i] == null) arguments[i] = '';
      var temp = arguments[i].toString();
      value += temp;
    }
  }

  return value;
}
```

---

## Completar à Direita

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConcatRight` |
| **Código** | 948 |
| **Assinatura** | `Completar à Direita (Letras;Inteiro;Letras): Letras` |
| **Parâmetros** | Letras;Inteiro;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Completa o conteúdo do terceiro parâmetro à direita do primeiro parâmetro.

Parâmetro(s): 
1. Texto. (Letras)
2. Quantidade de caracteres que o retorno deve ter. (Inteiro)
3. Conteúdo que será concatenado à esquerda do primeiro parâmetro (1 caractere). (Letras)

Retorno:
Retorna o primeiro parâmetro concatenado à direita com o conteúdo do terceiro parâmetro até a quantidade de caracteres for atingida. (Letras)

Observação:
O terceiro parâmetro deve ter apenas 1 caractere.

Exemplo:
Assumindo como parâmetros: "Maker", "10", "r", o retorno será "Makerrrrrr".

### Código Servidor (Java)

```java
protected final Variant ebfConcatRight(Variant value, Variant size, Variant character) throws Exception {
    String caractere;
    StringBuilder emptyCaracteres = new StringBuilder();        
      int tamanho = size.getLong().intValue();
      int loopQtd = tamanho - value.getString().length();
      if (loopQtd<0) {
        emptyCaracteres.append(value.getString().substring(0, tamanho));
        return VariantPool.get(emptyCaracteres.toString());
      }
      if (character.getString().length()<=1) {        
        emptyCaracteres.append(value.getString());
        if (character.getType() == WFRRuleType.NULL) {          
          caractere=" ";
        }else {          
          caractere = character.getString();
        }
        while (loopQtd-->0) {
          emptyCaracteres.append(caractere);
        }             
      }else {
        throw new WFRRuleException("Completar à direita não permite mais de um caractere a ser concatenado.");
      }     
    return VariantPool.get(emptyCaracteres.toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfConcatRight (value, size, pad) {
  if (value && value !== null && value.length > 0) 
    return value.padEnd(size, pad);  
}
```

---

## Completar à Esquerda

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConcatLeft` |
| **Código** | 947 |
| **Assinatura** | `Completar à Esquerda (Letras;Inteiro;Letras): Letras` |
| **Parâmetros** | Letras;Inteiro;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Completa o conteúdo do terceiro parâmetro à esquerda do primeiro parâmetro.

Parâmetro(s): 
1. Texto. (Letras)
2. Quantidade de caracteres que o retorno deve ter. (Inteiro)
3. Conteúdo que será concatenado à esquerda do primeiro parâmetro (1 caractere). (Letras)

Retorno: 
Retorna o primeiro parâmetro concatenado à esquerda com o conteúdo do terceiro parâmetro até a quantidade de caracteres for atingida. (Letras)

Observação:
O 3º Parâmetro deve ter apenas 1 caractere (Somente servidor).

Exemplo:
Assumindo como parâmetros: "Maker", "10", "r", o retorno será "rrrrrMaker".

### Código Servidor (Java)

```java
protected final Variant ebfConcatLeft(Variant value, Variant size, Variant character) throws Exception {
    String caractere;
    StringBuilder emptyCaracteres = new StringBuilder();        
      int tamanho = size.getLong().intValue();
      int loopQtd = tamanho - value.getString().length();
      if (loopQtd<0) {
        emptyCaracteres.append(value.getString().substring(0, tamanho));
        return VariantPool.get(emptyCaracteres.toString());
      }
      if (character.getString().length()<=1) {          
        if (character.getType()==WFRRuleType.NULL) {
          caractere="0";
        }else {
          caractere = character.getString();
        }
        while (loopQtd-->0) {
          emptyCaracteres.append(caractere);
        } 
        emptyCaracteres.append(value.getString());
      }else {
        throw new WFRRuleException("Concatena a Esquerda não permite mais de um caractere.");
      }     
    return VariantPool.get(emptyCaracteres.toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfConcatLeft (value, size, pad) {
  if (value && value != null && value.length > 0)   
    return value.padStart(size, pad); 
}
```

---

## Concatenação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConcat` |
| **Código** | 557 |
| **Assinatura** | `Concatenação (Letras...) : Letras` |
| **Parâmetros** | N'Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Junta vários itens de texto em apenas um item.

Parâmetro: 
1. N' Valor a ser concatenado. (Letras)

Retorno: 
Retorna os valores concatenados. (Letras)

Exemplos: 
1. Assumindo os parâmetros como 'Maker' (Letras) e 'Flow' (Letras), o retorno seria 'Maker Flow'.
2. Assumindo os parâmetros como 'Maker' (Letras) e 3 (Inteiro), o retorno seria 'Maker3'.

### Código Servidor (Java)

```java
protected final Variant ebfConcat(Variant... variants) throws Exception {
    int total = 0;
    for (Variant variant : variants) 
      total += variant.getStringSize();
    StringBuilder result = new StringBuilder(total+1);
    for (Variant variant : variants) {
      variant.appendTo(result);
    }
    return VariantPool.get(result.toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfConcat() {
  var value = "";
  if (existArgs(arguments)) {
    for (var i = 0; i < arguments.length; i++) {
      if(arguments[i] == null) arguments[i] = '';
      var temp = arguments[i].toString();
      value += temp;
    }
  }
  return value;
}
```

---

## Converter Texto para Delphi

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `stringToDelphiString` |
| **Código** | 81 |
| **Assinatura** | `Converter Texto para Delphi` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Transforma o texto normal em um texto para Delphi com a indentação passada no segundo parâmetro.
(Coloca os caracteres especiais para serem executados em Delphi, como por exemplo caracteres de quebra de linha e
etc.).

Parâmetro(s): 
1. Texto que será transformado para Delphi. (Letras)
2. Parâmetro: Indentação. (Letras)

Retorno: 
Texto em Delphi. (Letras)

Exemplo: 
A quebra de linha em Delphi é representada por "#13#10". Assim, passando como parâmetros "Maker(Quebra de Linha)
All " (Letras) e "   " (3 espaços em branco), o resultado será (   '"Maker'#13#10'All "').

### Código Servidor (Java)

```java
protected final Variant stringToDelphiString(Variant value, Variant ident) throws Exception {
    String v = value.toString();
    final int SIZE = 67;
    int to = SIZE;
    List<String> strings = new ArrayList<String>();
    int i = 0; 
    String s;
    do {
      s = v.substring(i, Math.min(to, v.length()));
      if (s.length()!=0) strings.add(s);
      i += SIZE;
      to += SIZE;
    } while (i <= v.length());
    String r = "";
    for (int j = 0; j < strings.size(); j++) {
      r += (ident.toString() + convertToDelphiString(strings.get(j)));
      if (j != strings.size() - 1)
        r += "+\r\n";
    }
    if (r == "")
      return VariantPool.get("''");
    else
      return VariantPool.get(r); 
  }
  private String convertToDelphiString(String v) throws Exception {
    String r = "";
    boolean opened = false;
    for (int i = 0; i < v.length(); i++) {
      int code = v.charAt(i);
      if (code == 13)
        continue;
      boolean especial = !((code >= 32 && code <= 126 && code != 39)) ;
      if (especial) {
        if (opened) {
          r += "'";
          opened = false;
        }
        if (code == 10)
          r += "#13#10";
        else 
          r += "#" + code;
      } else {
        if (!opened) {
          r += "'";
          opened = true;
        } 
        if (code == 39)
          r += "''"; 
        else
          r += v.charAt(i);
        if (i == v.length() - 1 && opened)
          r += "'";
      }
    }
    return r;
  }
```

### Código Cliente (JavaScript)

```javascript
function stringToDelphiString(v, ident) { 
  if((typeof v == "undefined") || (v == null)) return '';
  v = "" + v; 
  var SIZE = 67;
  var strings = new Array();
  var i = 0; 
  var s;
  do {
    s = v.substr(i, SIZE);
    if (s!='') strings.push(s);
    i += SIZE;
  } while (s != '');
  var r = '';
  for (var i=0;i<strings.length;i++) {
    r += ((ident?ident:'') + convertToDelphiString(strings[i]));
    if (i != strings.length-1)
      r += '+\r\n';
  }
  if (r == '')
    return '\'\'';
  else
    return r; 
}
function convertToDelphiString(v) { 
  var r = '';
  var opened = false;
  for (var i=0;i<v.length;i++) {
    var code = v.charCodeAt(i);
    if (code == 13)
      continue;
    var especial = !((code >= 32 && code <= 126 && code != 39)) ;
    if (especial) {
      if (opened) {
        r += '\'';
        opened = false;
      }
      if (code == 10)
        r += '#13#10';
      else 
        r += '#'+code;
    } else {
      if (!opened) {
        r += '\'';
        opened = true;
      } 
      if (code == 39)
        r += '\'\''; 
      else
        r += v.charAt(i);
      if (i == v.length-1 && opened)
        r += '\'';
    }
  }
  return r;
}
```

---

## Criptografia Simétrica - Criptografar Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNewMessageSymmetricEncrypt` |
| **Código** | 759 |
| **Assinatura** | `Criptografia Simétrica - Criptografar Mensagem (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Criptografa a mensagem utilizando uma chave com uma criptografia simétrica.

Parâmetro(s):
1. Mensagem a ser criptografada. (Letras)
2. Chave. (Letras)

Retorno:
Mensagem Criptografada. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfNewMessageSymmetricEncrypt(Variant messageVar, Variant keyVar) throws Exception {
	  String message = messageVar.getString();
	  String key = keyVar.getString();

	  // Caso a mensagem esteja vazia, retorna Nulo.
	  if (message.length() == 0) {
	    return Variant.VARIANT_NULL;
	  }
	  // Caso a chave esteja vazia, retorna a mensagem em base 64.
	  if (key.length() == 0) {
	    return VariantPool.get(Functions.encodeStringToBase64(message));
	  }	
	
	  message = Functions.encodeStringToBase64(message);

	  char[] charMessage = new char[message.length()];
	  // Criptografa a mensagem.
	  for (int index = 0; index < message.length(); index++) {
	    charMessage[index] = (char) (message.charAt(index) ^ key.charAt((index * 3 + 17) % key.length()));
	  }
	  String newMessage = new String(charMessage, 0, charMessage.length);
	  // Coloca a mensagem criptografada em base 64.
	  String encodedMessage = Functions.encodeStringToBase64(newMessage);
	  // Retorna a mensagem criptografada.
	  return VariantPool.get(encodedMessage);
}
```

---

## Criptografia Simétrica - Descriptografar Mensagem

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNewMessageSymmetricDecrypt` |
| **Código** | 760 |
| **Assinatura** | `Criptografia Simétrica - Descriptografar Mensagem (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Descriptografa a mensagem utilizando uma chave com uma criptografia simétrica.

Parâmetro(s):
1. Mensagem Criptografada. (Letras)
2. Chave. (Letras)

Retorno:
Mensagem Descriptografada. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfNewMessageSymmetricDecrypt(Variant messageVar, Variant keyVar) throws Exception {
   String encodedMessage = (messageVar.getString());
   String key = keyVar.getString();
   // Caso a mensagem seja vazia, retorna Nulo.
   if (encodedMessage.length() == 0) {
     return Variant.VARIANT_NULL;
   }
  // Retira a mensagem criptografada em base 64.
  String newMessage = new String(Functions.getFromBase64(encodedMessage));
  // Caso a chave seja vazia, retorna a mensagem criptografada.
  if (key.length() == 0) {
    return VariantPool.get(newMessage);
  }
  char[] charMessage = new char[newMessage.length()];
  // Decriptografa a mensagem.
  for (int index = 0; index < newMessage.length(); index++) {
    charMessage[index] = (char) (newMessage.charAt(index) ^ key.charAt((index * 3 + 17) % key.length()));
  }
  String message = new String(charMessage, 0, charMessage.length);
  message = new String(Functions.getFromBase64(message));   
	  
  // Retorna a mensagem decriptografada.
  return VariantPool.get(message);
}
```

---

## Existe Subsequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSearchSubstring` |
| **Código** | 571 |
| **Assinatura** | `Existe Subsequência` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Esta função procura dentro do 1° parâmetro a subsequência passada no 2º parâmetro.

Parâmetro(s):
1. Texto onde será feita a pesquisa. (Letras)
2. Valor a ser localizado. (Letras)

Retorno: 
Retorna "true" se encontrar a subsequência ou "false" caso não encontre. (Lógico)

Exemplos: 
1. Assumindo os parâmetros como 'Maker' (Letras), e 'Ma' (Letras) , o retorno será "true".
2. Assumindo os parâmetros como 'Maker' (Letras), e 'Ja' (Letras) , o retorno será "false".

### Código Servidor (Java)

```java
protected final Variant ebfSearchSubstring(Variant value, Variant valueToFind) throws Exception {
    String valor = value.getString();
    String valorToFind = valueToFind.getString();
    int indice = -1;
    if (!valorToFind.equals("")) {
      indice = valor.indexOf(valorToFind);
    }
    return VariantPool.get(indice != -1);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSearchSubstring() {
  var indice = 0;
  if (existArgs(arguments)) {
    var value = arguments[0].toString();
    var valueToFind = arguments[1].toString();
    indice = value.indexOf(valueToFind);
  }
  return indice != -1;
}
```

---

## Formatar Número

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormatNumber` |
| **Código** | 385 |
| **Assinatura** | `Formatar Número(Número, Letras)` |
| **Parâmetros** | Número;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Formata um número de acordo com uma máscara.

Parâmetro(s):
1. Número. (Inteiro)
2. Máscara. (Letras)

Retorno:
Número formatado. (Letras)

Observações:
1. Deve ser seguido os padrões da classe. Para mais informações sobre as máscaras acesse:
http://java.sun.com/j2se/1.4.2/docs/api/java/text/DecimalFormat.html
2. Caso o número passado seja uma dízima, é recomendado o arredondamento do mesmo para a quantidade de casas decimais da máscara utilizada.
  Exemplo: 17,60 x 100 = 1760.0000000000002

### Código Servidor (Java)

```java
protected final Variant ebfFormatNumber(Variant number, Variant pattern) throws Exception {
    java.text.DecimalFormat nf = (java.text.DecimalFormat) java.text.NumberFormat.getInstance();
    nf.applyPattern(pattern.toString());

    return new Variant(nf.format(number.getDouble()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormatNumber(value, mask) {
    var money,
        zeroMatcher,
        number,
        beginCents,
        output,
        i,
        opts,
        decimalPrecision,
        signal;        

    decimalPrecision = mask.split('.') [mask.split('.').length - 1].length;        
    value += "";    
    if (value[0] === '-'){
      signal = '-';      
      value.slice(1, value.length);
    } else {
      signal = '';
    }
    if(value.indexOf('.') > 0){        
      if(value.split('.')[1].length >= 1){
        newdPrecision = decimalPrecision - value.split('.')[1].length;
        for(i=0; i<newdPrecision; i++){
          value += '0';
        }
      }                                            
    } else if(value.indexOf(',') > 0){    
        if(value.split(',')[1].length === 1){
          value += '0';
      }        
    } else {
      for(i = 0; i < decimalPrecision; i++){
        value += '0';
      }
     }
    opts = {
      'precision': decimalPrecision
    }        
    opts = mergeMoneyOptions(opts);
    if (opts.zeroCents) {
      opts.lastOutput = opts.lastOutput || "";
      zeroMatcher = ("("+ opts.separator +"[0]{0,"+ opts.precision +"})"),
          zeroRegExp = new RegExp(zeroMatcher, "g"),
          digitsLength = value.toString().replace(/[\D]/g, "").length || 0,
          lastDigitLength = opts.lastOutput.toString().replace(/[\D]/g, "").length || 0;
      value = value.toString().replace(zeroRegExp, "");
      if (digitsLength < lastDigitLength) {
        value = value.slice(0, value.length - 1);
      }
    }
    number = value.toString().replace(/[\D]/g, ""),
        clearDelimiter = new RegExp("^(0|\\"+ opts.delimiter +")"),
        clearSeparator = new RegExp("(\\"+ opts.separator +")$"),
        money = number.substr(0, number.length - opts.moneyPrecision),
        masked = money.substr(0, money.length % 3),
        cents = new Array(opts.precision + 1).join("0")
    ;
    money = money.substr(money.length % 3, money.length);
    for (i = 0, len = money.length; i < len; i++) {
      if (i % 3 === 0) {
        masked += opts.delimiter;
      }
      masked += money[i];
    }
    masked = masked.replace(clearDelimiter, "");
    masked = masked.length ? masked : "0";
    if (!opts.zeroCents) {
          beginCents = number.length - opts.precision,
          centsValue = number.substr(beginCents, opts.precision),
          centsLength = centsValue.length,
          centsSliced = (opts.precision > centsLength) ? opts.precision : centsLength
      ;
      cents = (cents + centsValue).slice(-centsSliced);      
    }
    output = signal + opts.unit + masked + opts.separator + cents + opts.suffixUnit;      

    return output.replace(clearSeparator, "");
  };

mergeMoneyOptions = function(opts) {
  opts = opts || {};
  opts = {
    precision: opts.hasOwnProperty("precision") ? opts.precision : 2,
    separator: opts.separator || ",",
    delimiter: opts.delimiter || ".",
    unit: opts.unit && (opts.unit.replace(/[\s]/g,'') + " ") || "",
    suffixUnit: opts.suffixUnit && (" " + opts.suffixUnit.replace(/[\s]/g,'')) || "",
    zeroCents: opts.zeroCents,
    lastOutput: opts.lastOutput
  };
  opts.moneyPrecision = opts.zeroCents ? 0 : opts.precision;
  return opts;
}
```

---

## Inicia com?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStartsWith` |
| **Código** | 688 |
| **Assinatura** | `Inicia com? (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Verifica se o conteúdo do primeiro parâmetro inicia com o conteúdo do 2° parâmetro.

Parâmetro(s):
1. Texto onde será feita a pesquisa. (Letras)
2. Valor inicial do texto. (Letras)

Retorno:  
"Verdadeiro" se o texto do 1º parâmetro iniciar com o valor informado no 2º parâmetro, caso contrário, retornará "Falso". (Lógico)

Observação:
Ao informar o 2º parâmetro como "" (vazio), o retorno será "Verdadeiro".

Exemplos: 
1. Assumindo os parâmetros como "Maker Flow" (Letras) e "Ma" (Letras), o retorno será "Verdadeiro".
2. Assumindo os parâmetros como "Maker Flow" (Letras) e "Flow" (Letras), o retorno será "Falso".

### Código Servidor (Java)

```java
protected final Variant ebfStartsWith(Variant value, Variant valueToCheck) throws Exception {
    return new Variant(value.getString().startsWith(valueToCheck.getString()));        
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfStartsWith (value, startValue){
  if(!isNullable(value))  
    return toString(value).startsWith(startValue);    
  return false;
}
```

---

## Inserir Texto na Posição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfInsertStringAt` |
| **Código** | 720 |
| **Assinatura** | `Inserir Texto na Posição (Letras;Inteiro;Letras): Letras` |
| **Parâmetros** | Letras;Inteiro;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Esta função insere um determinado texto na posição especificada.

Parâmetro(s):
1. Texto. (Letras)
2. Posição. (Inteiro)
3. Novo conteúdo. (Letras)

Retorno:
Texto com conteúdo na posição indicada. (Letras)

Exemplo:
Assumindo como parâmetros: Maker Softwell", 7, "All", o retorno da função será "Maker All Softwell".

### Código Servidor (Java)

```java
protected final Variant ebfInsertStringAt(Variant text, Variant position, Variant textToInsert) throws Exception{
  Variant newText = VariantPool.get(new StringBuilder(text.getString()).insert(position.getLong().intValue(), textToInsert.getString()).toString());
  return new VariantPool().get(newText);
}
```

---

## Inverter Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStringReverse` |
| **Código** | 115 |
| **Assinatura** | `Inverter Texto (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Inverte o texto passado por parâmetro.  

Parâmetro:
1. Texto a ser invertido. (Letras)

Retorno: 
Texto invertido. (Letras)

Exemplo:
Assumindo como parâmetro a palavra "Maker" (Letras), o retorno seria "rekaM" (Letras).

### Código Servidor (Java)

```java
protected final Variant ebfStringReverse(Variant value) throws Exception {
    StringBuilder temp = new StringBuilder(value.getString());
    temp.reverse();
    return VariantPool.get(temp.toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfStringReverse(value) {
  var output = "";
  for (i = 0; i <= value.length; i++) {
    output = value.charAt (i) + output;
  }
  return output;
}
```

---

## Juntar Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfListImplode` |
| **Código** | 26 |
| **Assinatura** | `Juntar Texto(Variante, Letras)` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Transforma uma lista (conjunto de valores) em um texto separando cada elemento com um delimitador (separador)
especificado no 2º parâmetro.

Parâmetro(s):
1. Objeto Lista. (Variante)
2. Separador entre os elementos da lista. (Letras)

Retorno: 
Retorna os elementos da lista passada (1° parâmetro) separados pelo conteúdo do 2º parâmetro (Letras).

Exemplos: 
1. Assumindo os parâmetros como uma lista com 2 elementos ("Maker" e "Flow" ) e "|"(Letras), o retorno seria "Maker|Flow" (Letras).
2. Assumindo os parâmetros como uma lista com 3 elementos ("ABC" ,"DEF" e "GHI") e nulo (Letras) no segundo parâmetro,
o retorno seria "ABCDEFGHI" (Letras).

### Código Servidor (Java)

```java
protected final Variant ebfListImplode(Variant str, Variant delimiter) throws Exception {    
    return VariantPool.get(wfr.util.Functions.listToString((List) str.toObject(), delimiter.toString()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfListImplode(list, separator) {
  if (!(list instanceof Array)) {
    throw "Functions ebfListImplode expects an Array.";
  }
  var first = true;
  var value = "";
  for (var i = 0; i < list.length; i++) {
    var listValue = list[i];
    if (first) {
      first = false;
    } else if (separator != null && (typeof separator != "undefined")) {
      value += separator;
    }
    if (listValue != null && (typeof listValue != "undefined")) {
      value += listValue;
    }
  }
  return value;
}
```

---

## Letra

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCharacter` |
| **Código** | 36 |
| **Assinatura** | `Letra(Inteiro)` |
| **Parâmetros** | Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Passado um número, a função obtém e retorna o símbolo, em ASCII, do número passado.

Parâmetro:
1. Número que se deseja obter o valor da tabela ASCII. (Inteiro)

Retorno: 
Retorna o símbolo correspondente na tabela ASCII do número passado como parâmetro. (Letras)

Exemplos: 
1. Assumindo os parâmetros como 35 (Inteiro), o retorno seria "#".
2. Assumindo os parâmetros como 360 (Inteiro), o retorno seria "?".
3. Assumindo os parâmetros como 166 (Inteiro), o retorno seria "|".

### Código Servidor (Java)

```java
protected final Variant ebfCharacter(Variant ascii) throws Exception {
    int asciiCode = ascii.getLong().intValue();
    char value = (char) asciiCode;
    return VariantPool.get(value);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfCharacter(asciiCode) {
  var res = String.fromCharCode(asciiCode);
  return res; 
}
```

---

## Letra na Posição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCharAt` |
| **Código** | 569 |
| **Assinatura** | `Letra na Posição` |
| **Parâmetros** | Letras;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Esta função localiza, dentro do primeiro parâmetro, o conteúdo que está na posição passada no 2º parâmetro e o retorna.

Parâmetro(s):
1. Texto onde será feita a pesquisa. (Letras)
2. Posição da letra. (Inteiro)

Retorno: 
Retorna qual a letra que está na posição que foi passado por parâmetro. (Letras)

Exemplos: 
1. Assumindo os parâmetros como "Maker Flow" (Letras) e 4 (Inteiro) , o retorno seria "e".
2. Assumindo os parâmetros como "Hoje é Segunda-Feira" (Letras) e "8" (Inteiro) , o retorno seria "S" .

### Código Servidor (Java)

```java
protected final Variant ebfCharAt(Variant value, Variant pos) throws WFRRuleException {
    String valor = value.getString();
    int length = valor.length();
    int indice = pos.getLong().intValue() - 1;
    if (indice < 0) {
      indice = 0;
    } else if (indice >= length) {
      indice = length - 1;
    }
    String retorno = "";
    try {
      retorno = String.valueOf(valor.charAt(indice));
    } catch (IndexOutOfBoundsException ex) {
    }
    return VariantPool.get(retorno);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfCharAt() {
  var retorno = "";
  if (existArgs(arguments)) {
    var value = arguments[0].toString();
    var length = value.length;
    var indice = parseInt(arguments[1]) - 1;
    if (indice < 0) {
      indice = 0;
    } else if (indice >= length) {
      indice = length - 1;
    }
    try {
      retorno = value.charAt(indice);
    } catch (ex) {
    }
  }
  return retorno;
}
```

---

## MD5 do Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTextMD5` |
| **Código** | 100 |
| **Assinatura** | `MD5 do Texto(Letras) : Letras;` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna o Md5/Digest de um texto passado como parâmetro. O digest é  constituído de 32 caracteres de 0-9,A-F, cada
par de caracteres é a representação hexadecimal dos 16 números inteiro que formam o MD5 Digest.

Parâmetro: 
1. Texto a ser transformado. (Letras)

Retorno: 
MD5 Digest do texto passado como parâmetro. (Letras)

Observação:
Para saber mais sobre o assunto pesquise em um site de busca sobre "MD5" ou "The MD5 Message-Digest Algorithm".

### Código Servidor (Java)

```java
protected final Variant ebfTextMD5(Variant str) throws Exception {
    return VariantPool.get(wfr.util.Functions.MD5AsString(str.getString()));
  }
```

---

## Maiúsculo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfToUpperCase` |
| **Código** | 577 |
| **Assinatura** | `Maiúsculo` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Transforma o texto passado como parâmetro para maiúsculo.

Parâmetro:
1. Texto a ser transformado. (Letras)

Retorno: 
Texto em maiúsculo. (Letras)

Exemplos: 
1. Assumindo o parâmetro como "maker flow" (Letras),  o retorno seria "MAKER FLOW".
2. Assumindo o parâmetro como "Maker Flow" (Letras),  o retorno seria "MAKER FLOW".

### Código Servidor (Java)

```java
protected final Variant ebfToUpperCase(Variant value) throws Exception {
    String valor = value.getString();
    return VariantPool.get(valor.toUpperCase());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfToUpperCase() {
  var value = "";
  if (existArgs(arguments)) {
    value = arguments[0].toUpperCase();
  }
  return value;
}
```

---

## Mascarar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMaskFormatter` |
| **Código** | 515 |
| **Assinatura** | `Mascarar (Variante;Letras) : Letras` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função mascara o conteúdo passado no primeiro parâmetro de acordo com a máscara passada no segundo parâmetro.

Parâmetro(s):
1. Conteúdo a ser mascarado. (Variante)
2. Máscara. (Letras)

Retorno:
Conteúdo mascarado. (Letras)

Observações:
1. O tipo de dado passado no primeiro parâmetro é levado em consideração. Se o conteúdo passado no primeiro
parâmetro for um valor, o mesmo tem que ser passado como fracionado.
2. A função funciona apenas como uma máscara para o valor da tela e não influencia no resultado que irá para o banco.

### Código Servidor (Java)

```java
protected final Variant ebfMaskFormatter(Variant valueVar, Variant mask) throws Exception {
  return Functions.maskFormatter(valueVar, mask);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfMaskFormatter(value, mask) {

  var pos = mask.indexOf(";");
  if(pos != -1)
    mask = mask.substring(0, pos);
  
  switch (mask) {
    case "###,#":
    value = value.replace(/\D/g, "");
    value = value.replace(/(\d)(\d{1})$/, "$1,$2");
    break;
    case "###.##":
    value = value.replace(/\D/g, "");
    value = value.replace(/(\d)(\d{2})$/, "$1.$2");
    break;
    case "$":
    value = value.replace(/\D/g, "");
    value = value.replace(/(\d)(\d{20})$/, "$1.$2");
    value = value.replace(/(\d)(\d{17})$/, "$1.$2");
    value = value.replace(/(\d)(\d{14})$/, "$1.$2");
    value = value.replace(/(\d)(\d{11})$/, "$1.$2");
    value = value.replace(/(\d)(\d{8})$/, "$1.$2");
    value = value.replace(/(\d)(\d{5})$/, "$1.$2");
    value = value.replace(/(\d)(\d{2})$/, "$1,$2");
    break;
    case "99\\.999\\-999":
    value = value.replace(/\D/g, "");
    if (value.length > 8)
      value = value.substring(0, 8);
    value = value.replace(/^(\d{2})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d{3})$/, "$1-$2");
    break;
    case "99\\.999\\-\\0\\0\\0":
    value = value.replace(/\D/g, "");
    if (value.length > 8)
      value = value.substring(0, 8);
  	if (value.length < 8){
    	var length = 8 - value.length;
    	for (var i = 0; i < length; i++)
    	  value = value + '0';
    }
    value = value.replace(/^(\d{5})(\d)/, "$1-$2")
    break;
    case "99\\.999\\.999\\/9999\\-99":
    value = value.replace(/\D/g, "");
    if (value.length > 14)
      value = value.substring(0, 14);
    value = value.replace(/^(\d{2})(\d)/, "$1.$2");
    value = value.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3");
    value = value.replace(/\.(\d{3})(\d)/, ".$1/$2");
    value = value.replace(/(\d{4})(\d)/, "$1-$2");
    break;
    case "999\\.999\\.999\\-99":
    value = value.replace(/\D/g, "");
    if (value.length > 11)
      value = value.substring(0, 11);
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
    break;
    case "99-99999":
    value = value.replace(/\D/g, "");
    if (value.length > 7)
      value = value.substring(0, 7);
    value = value.replace(/(\d{2})(\d)/, "$1-$2");
    break;
    case "99.99.999":
    value = value.replace(/\D/g, "");
    if (value.length > 7)
      value = value.substring(0, 7);
    value = value.replace(/(\d)(\d{5})$/, "$1.$2");
    value = value.replace(/(\d)(\d{3})$/, "$1.$2");
    break;
    case "99.99.99.999.999":
    value = value.replace(/\D/g, "");
    if (value.length > 12)
      value = value.substring(0, 12);
	  value = value.replace(/(\d)(\d{10})$/, "$1.$2");
 	  value = value.replace(/(\d)(\d{8})$/, "$1.$2");
    value = value.replace(/(\d)(\d{6})$/, "$1.$2");
    value = value.replace(/(\d)(\d{3})$/, "$1.$2");
    break;
    case "999\\.99999\\.99\\-9":
    value = value.replace(/\D/g, "");
    if (value.length > 11)
      value = value.substring(0, 11);
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/^(\d{3})\.(\d{5})(\d)/, "$1.$2.$3");
    value = value.replace(/^(\d{3})\.(\d{5})\.(\d{2})(\d)$/, "$1.$2.$3-$4")
    break;
    case "99999/9999":
    value = value.replace(/\D/g, "");
    if (value.length > 9)
      value = value.substring(0, 9);
    value = value.replace(/(\d)(\d{4})$/, "$1/$2");
    break;
    case "9.9.99.99.99.99":
    value = value.replace(/\D/g, "");
    if (value.length > 10)
      value = value.substring(0, 10);
    value = value.replace(/(\d)(\d{9})$/, "$1.$2");
    value = value.replace(/(\d)(\d{8})$/, "$1.$2");
    value = value.replace(/(\d)(\d{6})$/, "$1.$2");
    value = value.replace(/(\d)(\d{4})$/, "$1.$2");
    value = value.replace(/(\d)(\d{2})$/, "$1.$2");
    break;
    case "9.9.99.99.99.99.99":
    value = value.replace(/\D/g, "");
    if (value.length > 12)
      value = value.substring(0, 12);
    value = value.replace(/(\d)(\d{11})$/, "$1.$2");
    value = value.replace(/(\d)(\d{10})$/, "$1.$2");
    value = value.replace(/(\d)(\d{8})$/, "$1.$2");
    value = value.replace(/(\d)(\d{6})$/, "$1.$2");
    value = value.replace(/(\d)(\d{4})$/, "$1.$2");
    value = value.replace(/(\d)(\d{2})$/, "$1.$2");
    break;
    case "(99) 9999-9999":
    value = value.replace(/\D/g, "");
    if (value.length > 10)
      value = value.substring(0, 10);
    value = value.replace(/^(\d{2})(\d)/g, "($1) $2");
    value = value.replace(/(\d)(\d{4})$/, "$1-$2");
    break;
    case "99":
    value = value.replace(/\D/g, "");
    if (value.length > 2)
      value = value.substring(0, 2);
    break;
    case "SP":
    value = value.replace(/\D/g, "");
    if (value.length > 11)
      value = value.substring(0, 11);
    value = value.replace(/^(\d{2})(\d)/g, "($1) $2");
    value = value.replace(/(\d)(\d{4})$/, "$1-$2");
    break;

    default:
    return ebfMaskFormatter_(value, mask);
  }

  return value;
}

function ebfMaskFormatter_(_v, _d){
  var v = _v, m = convertToJsMask(_d);
  var r = "xU#*l", rt = [], nv = "", t, x, a = [], j=0, index=0; rx = {"x": "A-Za-z", "U": "A-ZÀ-Úa-zà-ú", "#": "0-9", "*": "A-Za-z0-9", "l": "A-ZÀ-Úa-zà-ú" };
  var ry = {"x": "A-Za-zÀ-ú", "*": "A-Za-zÀ-ú0-9", "c": " .,;:%()'{}|?&<>!{}*^_"};
  var b=[];
  for( var i=0; i < m.length; i++ ){

    x = m.charAt(i);

    t = (r.indexOf(x) > -1);

    if( x == "!" ) x = m.charAt(i++);

    if( (t) || (t && (rt.length < v.length)) ) rt[rt.length] = "[" + rx[x] + "]";

    a[a.length] = { "chr": x, "mask": t };
  }

   if( (v.length > 0) ){
    for( i=0; i < a.length; i++ ){
      if( a[i].mask ){
        while( v.length > 0 && !(new RegExp(rt[j])).test(v.charAt(j)) ) v = (v.length == 1) ? "" : v.substring(1);
        if( v.length > 0 ){
          nv += v.charAt(j);
        }
        j++;
        if( a[i].chr == "U") nv = nv.setCharAtUpper(nv.length-1, nv);    
        if( a[i].chr == "l") nv = nv.setCharAtLower(nv.length-1, nv);
      } else nv += a[i].chr;
      if( (j > v.length) ) break;
            
    }
  }

  return nv;
}
```

---

## Minúsculo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfToLowerCase` |
| **Código** | 576 |
| **Assinatura** | `Minúsculo` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Transforma o texto passado como parâmetro para minúsculo.

Parâmetro: 
1. Texto a ser transformado. (Letras)

Retorno: 
Texto em minúsculo. (Letras)

Exemplos: 
1. Assumindo o parâmetro como "MAKER FLOW" (Letras),  o retorno seria "maker flow".
2. Assumindo o parâmetro como "Maker Flow" (Letras),  o retorno seria "maker flow".

### Código Servidor (Java)

```java
protected final Variant ebfToLowerCase(Variant value) throws Exception {
    String valor = value.getString();
    return VariantPool.get(valor.toLowerCase());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfToLowerCase() {
  var value = "";
  if (existArgs(arguments)) {
    value = arguments[0].toLowerCase();
  }
  return value;
}
```

---

## Quebra de Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNewLine` |
| **Código** | 510 |
| **Assinatura** | `Quebra de Linha (Inteiro) : Letras` |
| **Parâmetros** | Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Usado para quebrar a linha (pular linha) em um texto, onde o parâmetro recebido será a quantidade de linhas à serem
puladas.

Parâmetro: 
1. Quantidade de quebra de linhas. (Inteiro)

Retorno: 
Retorna um texto com a quantidade de quebra de linha passada como parâmetro. (Letras)

Exemplo: 
Em um processamento com uma concatenação onde o 1º parâmetro é "Maker" (Texto) o segundo é uma Quebra de 1 Linha 
(Função "Quebra de linha" passando 1(Inteiro) como parâmetro) e o terceiro é "Flow" (texto), o retorno seria:
"Maker
// Quebra de Linha
Flow".

### Código Servidor (Java)

```java
protected final Variant ebfNewLine(Variant var) throws WFRRuleException {
    String linhas = "";
    long qtd = var.getLong();
    while (qtd-- > 0) {
      linhas += "\n";
    }
    return VariantPool.get(linhas);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfNewLine() {
  var value = "";
  if (existArgs(arguments)) {
    var qtd = arguments[0];
    while (qtd-- > 0) {
      value += "\n";
    }
  }
  return value;
}
```

---

## Quebra de Linha com Retorno

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfNewLineWithEscape` |
| **Código** | 609 |
| **Assinatura** | `Quebra de Linha com Retorno (Inteiro): Letras` |
| **Parâmetros** | Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Usado para quebrar a linha (pular linha) com retorno (\r\n) em um texto, onde o parâmetro recebido será a 
quantidade de linhas à serem puladas.

Parâmetro: 
1. Quantidade de quebra de linhas. (texto)

Retorno: 
Retorna um texto com a quantidade de quebra de linha passada como parâmetro. (Letras)

Exemplo: 
Em um processamento com uma concatenação onde o 1º parâmetro é "Maker" (Texto) o segundo é uma 
Quebra de 1 Linha 
(Função "Quebra de linha" passando 1(Inteiro) como parâmetro) e o terceiro é "Flow" (texto), o retorno seria:
"Maker
// Quebra de Linha
Flow".

### Código Servidor (Java)

```java
protected final Variant ebfNewLineWithEscape(Variant var) throws WFRRuleException {
  String linhas = "";
  long qtd = var.getLong();
  while (qtd-- > 0) {
    linhas += "\r\n";
  }
  return VariantPool.get(linhas);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfNewLineWithEscape() {
  var value = "";
  if (existArgs(arguments)) {
    var qtd = arguments[0];
    while (qtd-- > 0) {
      value += "\r\n";
    }
  }
  return value;
}
```

---

## Quebrar Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSplit` |
| **Código** | 49 |
| **Assinatura** | `Quebrar Texto` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Separa o texto em um determinado caractere passado no 2° parâmetro e retorna cada parte deste texto em uma posição
de uma lista.

Parâmetro(s): 
1. Texto que será quebrado. (Letras)
2. Caractere. (Letras)

Retorno: 
Lista com o texto separado. (Variante)

Observação:
A função "Quebrar Texto", sempre vai considerar o último caracter, ou seja, caso você passe o seguinte texto:
         "teste1,teste2,teste3,"
 o retorno vai ser:
        [teste1, teste2, teste3, ]

Exemplo: 
Assumindo os parâmetros como "M,A,K,E,R,F,L,O,W" (Letras), e "," (Letras),  o retorno será uma lista com 09 elementos
contendo "M"|"A"|"K"|"E"|"R"|"F"|"L"|"O"|"W" respectivamente.

### Código Servidor (Java)

```java
protected final Variant ebfSplit(Variant varText, Variant varCaracterSplit) throws Exception {
  String caracterSplit = varCaracterSplit.toString();
  String text = varText.toString();
  String[] arrText = text.split(java.util.regex.Pattern.quote(caracterSplit), -1);
  List<String> s = new ArrayList<String>(Arrays.asList(arrText));
  return VariantPool.get(s);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfSplit(text, caracterSplit) {
  return text.split(caracterSplit);
}
```

---

## Remover Acentos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveAccents` |
| **Código** | 383 |
| **Assinatura** | `Remover Acentos (Letras)` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Remove acentos do texto passado por parâmetro.

Parâmetro: 
1. Texto. (Letras)

Retorno:
Texto sem acentos. (Letras)

Exemplo:
Caso o texto do primeiro parâmetro for "àèìòùáéíóúâêîôûãõçñäëïöüÀÈÌÒÙÁÉÍÓÚÂÊÎÔÛÃÕÇÑÄËÏÖÜ" o retorno será 
"aeiouaeiouaeiouaocnaeiouAEIOUAEIOUAEIOUAOCNAEIOU".

### Código Servidor (Java)

```java
protected final Variant ebfRemoveAccents(Variant text) throws Exception {
  if (text.isNull()) {
  
     return Variant.VARIANT_NULL;
     
  }
     return VariantPool.get(Functions.translateAcentos(text.getString()));
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRemoveAccents(text) {
  if (text == null || typeof text == "undefined") {
    return null;
  }
  return translateAcentos(text);
}
```

---

## Remover Espaços

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTrim` |
| **Código** | 575 |
| **Assinatura** | `Remover Espaços` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Remove os espaços existentes antes e depois do texto passado por parâmetro e retorna.

Parâmetro: 
1. Texto a ser utilizado. (Letras)

Retorno:  
Retorna o texto passado como parâmetro, porém sem espaços no início e no final. (Letras)

Exemplo:
Assumindo como parâmetro "           Maker Flow          " (Letras), o retorno seria "Maker Flow".

### Código Servidor (Java)

```java
protected final Variant ebfTrim(Variant value) throws Exception {
    String valor = value.getString();
    return VariantPool.get(valor.trim());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfTrim() {
  var value = "";
  if (existArgs(arguments)) {
    value = trim(arguments[0]);
  }
  return value;
}
```

---

## Remover Quebra de Linha do Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveLineBreak` |
| **Código** | 752 |
| **Assinatura** | `Remover Quebra de Linha do Texto (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Remove as quebras de linhas existentes no texto informado via parâmetro.

Parâmetro: 
1. Texto que terá a quebra de linha removida. (Letras)

Retorno:  
Texto sem quebra de linha. (Letras)

Exemplo:
Assumindo como parâmetro "Maker 
Flow " (Letras), o retorno seria "Maker Flow".

### Código Servidor (Java)

```java
protected final Variant ebfRemoveLineBreak(Variant value) throws Exception {
  String valor = value.getString().replace("\r", "").replace("\t", "").replace("\n", "");
  return VariantPool.get(valor);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfRemoveLineBreak() {
  var value = "";
  if (existArgs(arguments)) {
    value = arguments[0].replace(/(\r\n|\n|\r)/gm,"");
  }
  return value;
}
```

---

## Remover Subsequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfRemoveSubstring` |
| **Código** | 34 |
| **Assinatura** | `Remover Subsequência` |
| **Parâmetros** | Letras;Inteiro;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | Banco de Dados |

### Descrição

A função remove os caracteres das posições indicadas entre o segundo e terceiro parâmetro do texto passado no primeiro parâmetro.

Parâmetro(s): 
1. Texto. (Letras)
2. Posição inicial do caractere a ser removido. (Inteiro)
3. Quantidade de caracteres a serem removidos. (Inteiro)

Retorno: 
Retorna o texto passado modificado. (Letras)

Exemplos:
1. Assumindo como parâmetros "Maker Flow" (Letras), 1 (Inteiro) e 3 (Inteiro), o retorno será "er Flow".
2. Assumindo como parâmetros "Maker Flow" (Letras), 4 (Inteiro) e 7 (Inteiro), o retorno será "Mak".

### Código Servidor (Java)

```java
protected final Variant ebfRemoveSubstring(Variant value, Variant pos1, Variant pos2) throws Exception {    
    int ini = pos1.getLong().intValue() - 1;
    int fim = ini + pos2.getLong().intValue();
    StringBuilder valor = new StringBuilder(value.getString());
    int length = valor.length();
    ini = Math.max(0, ini);
    fim = Math.min(length, fim);
    if (ini > length || ini >= fim) {
      return VariantPool.get("");
    }
    valor.delete(ini, fim);
    return VariantPool.get(valor.toString());
  }
```

---

## Subsequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSubstring` |
| **Código** | 513 |
| **Assinatura** | `Subsequência` |
| **Parâmetros** | Letras;Inteiro;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

A função recebe um texto (1º parâmetro) e retorna uma subsequência deste texto. A subsequência inicia na posição
indicada no 2º parâmetro, com o tamanho indicado no 3º parâmetro.

Parâmetro(s): 
1. Texto. (Letras)
2. Posição inicial da subsequência que se deseja obter. (Inteiro)
3. Quantidade de caracteres da subsequência. (Inteiro)

Retorno: 
Retorna a subsequência contida no texto (Letras) passado no 1º parâmetro, que inicia na posição informada no
2º parâmetro e contém o número de caracteres informado no 3º parâmetro.

Exemplo:
Assumindo como parâmetros "Fluxo de ações" (Letras), 2 (Inteiro) e 10 (Inteiro). O retorno será "luxo de aç".

### Código Servidor (Java)

```java
protected final Variant ebfSubstring(Variant value, Variant pos1, Variant pos2) throws Exception {
    String valor = value.getString();
    int length = valor.length();
    int ini = pos1.getLong().intValue() - 1;
    int fim = ini + pos2.getLong().intValue();
    ini = ini < 0 ? 0 : ini;
    fim = fim > length ? length : fim;
    if (ini > length || ini >= fim) {
      return VariantPool.get("");
    }
    String retorno = "";
    try {
      retorno = valor.substring(ini, fim);
    } catch (IndexOutOfBoundsException ex) {
    }
    return VariantPool.get(retorno);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSubstring() {
  var retorno = "";
  if (existArgs(arguments)) {
    var value = arguments[0].toString();
    var length = value.length;
    var ini = parseInt(arguments[1]) - 1;
    var fim = ini + parseInt(arguments[2]);
    ini = ini < 0 ? 0 : ini;
    fim = fim > length ? length : fim;
    if (!(ini > length || ini >= fim)) {
      try {
        retorno = value.substring(ini, fim);
      } catch (ex) {
      }
    }
  }
  return retorno;
}
```

---

## Subsequência Invertida

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSubstringInverse` |
| **Código** | 87 |
| **Assinatura** | `Subsequência Invertida` |
| **Parâmetros** | Letras;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

A função recebe um texto (primeiro parâmetro) e retorna apenas a quantidade de caracteres passada no segundo
parâmetro a partir do final, ou seja, contados de trás pra frente.

Parâmetro(s): 
1. Texto. (Letras)
2. Quantidade de caracteres que não serão removidos do texto. (Inteiro)

Retorno: 
Retorna o texto com apenas a quantidade de caracteres passado no segundo parâmetro do texto, contados de
trás para frente.  (Letras)

Exemplo:
Assumindo como parâmetros:
 1°: Maker Flow (Letras)
 2°: 3 (Inteiro)
o retorno será: low (Letras)

### Código Servidor (Java)

```java
protected Variant ebfSubstringInverse(Variant value, Variant size) throws Exception {
    String valor = value.getString();
    StringBuilder temp = new StringBuilder(valor);
    temp.reverse();
    valor = temp.toString();
    valor = ebfSubstring(VariantPool.get(valor), VariantPool.get(1), size).getString();
    temp = new StringBuilder(valor);
    temp.reverse();
    valor = temp.toString();
    return VariantPool.get(valor);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfSubstringInverse(value, size) {
  var valor = ebfStringReverse(value);
  valor = ebfSubstring(valor, 1, size);
  valor = ebfStringReverse(valor);
  return valor;
}
```

---

## Tamanho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLength` |
| **Código** | 568 |
| **Assinatura** | `Tamanho` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

A função recebe um texto e retorna o tamanho do mesmo.

Parâmetro: 
1. Texto no qual se deseja obter o tamanho. (Letras)

Retorno: 
Retorna a quantidade de caracteres presente no texto passado como parâmetro. (Inteiro)

Exemplos:
1. Assumindo como parâmetro "Maker Flow" (Letras), o retorno será 10.
2. Assumindo como parâmetro "Hoje é Segunda-Feira" (Letras), o retorno será 20.

### Código Servidor (Java)

```java
protected final Variant ebfLength(Variant v) throws Exception {
    return VariantPool.get(Integer.valueOf(v.getString().length()).longValue());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfLength() {
  var value = 0;
  if (existArgs(arguments)) {
    value = arguments[0].toString().length;
  }
  return value;
}
```

---

## Termina com?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEndsWith` |
| **Código** | 689 |
| **Assinatura** | `Termina com? (Letras;Letras): Lógico` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Verifica se o conteúdo do primeiro parâmetro termina com o conteúdo do 2° parâmetro.

Parâmetro(s): 
1. Texto onde será feita a pesquisa. (Letras)
2. Valor final do texto. (Letras)

Retorno:  
"Verdadeiro" se o texto do 1º parâmetro iniciar com o valor informado no 2º parâmetro, caso contrário, retornará "Falso". (Lógico)

Observação:
Ao informar o 2º parâmetro como "" (vazio), o retorno será "Verdadeiro".

Exemplos: 
1. Assumindo os parâmetros como "Maker Flow" (Letras) e "ow" (Letras) , o retorno seria Verdadeiro.
2. Assumindo os parâmetros como "Maker Flow" (Letras) e "wo" (Letras) , o retorno seria Falso.

### Código Servidor (Java)

```java
protected final Variant ebfEndsWith(Variant value, Variant valueToCheck) throws Exception {
    return new Variant(value.getString().endsWith(valueToCheck.getString()));        
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfEndsWith (value, valueEndsWith){
  if(!isNullable(value))  
    return toString(value).endsWith(valueEndsWith);    
  return false;
}
```

---

## Trocar Subsequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReplace` |
| **Código** | 573 |
| **Assinatura** | `Trocar Subsequência (Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

A função localiza o 2º parâmetro dentro do texto e o substitui pelo conteúdo passado no 3º parâmetro.

Parâmetro(s): 
1. Texto. (Letras)
2. Valor à encontrar. (Letras)
3. Novo Valor. (Letras)

Retorno: 
Retorna o texto modificado. (Letras)

Observação:
A função só substitui a primeira ocorrência encontrada. Para substituir todas as subsequências encontradas utilize a função
Troca Todas as Subsequências.

Exemplo: 
Assumindo os parâmetros como "Maker Flow" (Letras),"a"(Letras), e "%" (Letras), o retorno será "M%ker Flow".

### Código Servidor (Java)

```java
protected final Variant ebfReplace(Variant value, Variant valueToFind, Variant valueToReplace) throws Exception {
    String valor = value.getString();
    String valorToFind = valueToFind.getString();
    String valorToReplace = valueToReplace.getString();
    return VariantPool.get(replaceFirst(valor, valorToFind, valorToReplace));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfReplace() {
  var value = "";
  if (existArgs(arguments)) {
    value = arguments[0].toString();
    var valueToFind = arguments[1].toString();
    var valueToReplace = arguments[2].toString();
    value = value.replace(valueToFind, valueToReplace);
  }
  return value;
}
```

---

## Trocar Todas as Subseqüências

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfReplaceAll` |
| **Código** | 574 |
| **Assinatura** | `Trocar Todas as Subseqüências (Letras;Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Esta função localiza todas as subsequências iguais ao 2º parâmetro dentro do texto e os substituem pelo conteúdo passado no
3º parâmetro.

Parâmetro(s): 
1. Texto. (Letras)
2. Valor à encontrar. (Letras)
3. Valor desejado. (Letras)

Retorno: 
Retorna o texto modificado. (Letras)

Observações:
1. A substituição é feita em todas as subsequências encontradas.
2. Caso deseje trocar a subsequência por um valor nulo, no terceiro parâmetro deve-se desmarcar o check "Nulo".

Exemplo: 
Assumindo os parâmetros como "Banana" (Letras),"na"(Letras), e "&" (Letras), o retorno será "Ba&&".

### Código Servidor (Java)

```java
protected final Variant ebfReplaceAll(Variant value, Variant valueToFind, Variant valueToReplace) throws Exception {
    String valor = value.getString();
    String valorToFind = valueToFind.getString();
    String valorToReplace = valueToReplace.getString();
    return VariantPool.get(replaceAll(valor, valorToFind, valorToReplace));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfReplaceAll(OldString,FindString,ReplaceString) {
   if(!OldString) OldString = "";
   var SearchIndex = 0;
   var NewString = "";
   OldString = OldString.toString(); 
   FindString = FindString.toString();
   ReplaceString = ReplaceString.toString();
   while (OldString.indexOf(FindString,SearchIndex) != -1) {
   NewString += OldString.substring(SearchIndex,OldString.indexOf(FindString,SearchIndex));
   NewString += ReplaceString;
   SearchIndex = (OldString.indexOf(FindString,SearchIndex) + FindString.length);
   }
   NewString += OldString.substring(SearchIndex,OldString.length);
   return NewString;
}
```

---

## Validar Texto Utilizando Expressão Regular

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfValidateTextER` |
| **Código** | 377 |
| **Assinatura** | `ValidarTextoER(Texto, Expressão regular);` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 9 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função faz uma validação numa string utilizando expressão regular.

Parâmetro(s): 
1. Texto que será validado pela expressão regular. (Letras)
2. Expressão regular para validar o texto. (Letras)

Retorno:
"True" caso o texto informado seja válido segundo a expressão regular informada. "False" caso o texto informado não seja válido. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfValidateTextER(Variant text, Variant regEx) throws Exception {

    java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regEx.toString()); 
    
    if (pattern == null) {
      return VariantPool.get(false);
    }
    
    java.util.regex.Matcher matcher = pattern.matcher(text.toString()); 
    
    return VariantPool.get(matcher.matches());  
   
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfValidateTextER (text, regEx) {
  
  if (regEx == null || typeof regEx == "undefined" || regEx == "") {
    return false;
  }
  
  var regExp = new RegExp(regEx);
  return regExp.test(text);
  
}
```

---

## Índice Subsequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIndexOf` |
| **Código** | 570 |
| **Assinatura** | `Índice Subsequência` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Inteiro |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

Esta função localiza o conteúdo do 2° parâmetro dentro do conteúdo do primeiro parâmetro.

Parâmetro(s): 
1. Texto onde será feita a pesquisa. (Letras)
2. Valor a ser localizado. (Letras)

Retorno:  
Retorna a posição do valor localizado. Caso não encontre retorna 0. (Inteiro)

Exemplos: 
1. Assumindo os parâmetros como "Maker Flow" (Letras) e "e" (Letras) , o retorno seria 4.
2. Assumindo os parâmetros como "Maker Flow" (Letras) e "U" (Letras) , o retorno seria 0.

### Código Servidor (Java)

```java
protected final Variant ebfIndexOf(Variant value, Variant valueToFind) throws Exception {
    String valor = value.getString();
    String valorToFind = valueToFind.getString();
    int indice = -1;
    if (!valorToFind.equals("")) {
      indice = valor.indexOf(valorToFind);
    }
    indice = indice == -1 ? 0 : ++indice;
    return VariantPool.get(Long.valueOf(String.valueOf(indice)));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfIndexOf() {
  var indice = 0;
  if (existArgs(arguments)) {
    var value = arguments[0].toString();
    var valueToFind = arguments[1].toString();
    indice = value.indexOf(valueToFind);
    indice = indice == -1 ? 0 : ++indice;
  }
  return indice;
}
```

---

## Último Índice da Subsequência

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLastIndexOf` |
| **Código** | 572 |
| **Assinatura** | `Último Índice da Subsequência` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Inteiro |
| **Tipo** | 9 |
| **Compatibilidade** | * |

### Descrição

A função localiza a última subsequência (passada no 2º parâmetro) dentro do texto e retorna a posição inicial da mesma.

Parâmetro(s): 
1. Texto. (Letras)
2. Subsequência ao qual deseja obter o índice. (Letras)

Retorno: 
Retorna a última posição do valor passado como parâmetro. (Inteiro)

Exemplos:
1. Assumindo como parâmetros  "Maker Maker" (Letras) e "r" (Letras), o retorno será "11" (Inteiro).
2. Assumindo como parâmetros "Maker Flow"(Letras) e "r" (Letras), o retorno será "5" (Inteiro).

### Código Servidor (Java)

```java
protected final Variant ebfLastIndexOf(Variant value, Variant valueToFind) throws Exception {
    String valor = value.getString();
    String valorToFind = valueToFind.getString();
    int indice = -1;
    if (!valorToFind.equals("")) {
      indice = valor.lastIndexOf(valorToFind);
    }
    indice = indice == -1 ? 0 : ++indice;
    return VariantPool.get(Long.valueOf(String.valueOf(indice)));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfLastIndexOf() {
  var indice = 0;
  if (existArgs(arguments)) {
    var value = arguments[0].toString();
    var valueToFind = arguments[1].toString();
    indice = value.lastIndexOf(valueToFind);
    indice = indice == -1 ? 0 : ++indice;
  }
  return indice;
}
```

---

# Funções Nativas - Conversão

Total: **33** funções

[← Voltar para Funções Nativas](README.md)

---

## Alterar Charset

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfValueChangeCharset` |
| **Código** | 422 |
| **Assinatura** | `(Letras;Letras;Letras) : Letras` |
| **Parâmetros** | Letras;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Altera o charset do texto passado por parâmetro.

Parâmetro(s):
1. Texto a ser alterado. (Letras)
2. Charset de origem. (Letras)
3. Charset de destino. (Letras)

Retorno:
Texto com o charset convertido, conforme opção escolhida no 3° parâmetro. (Letras)

Observação:
Tipos de charset: iso-8859-1, utf-8, utf-16, utf-32 e.t.c

Exemplo: 
Assumindo no 1º Parâmetro o texto: "Computadores só trabalham com números binários", " ISO-8859-1 " no 2º Parâmetro
e " utf-8 " no 3º Parâmetro, o retorno será: "Computadores s? trabalham com n?meros bin?rios".

### Código Servidor (Java)

```java
protected final Variant ebfValueChangeCharset(Variant value, Variant fromCharset, Variant toCharset) throws Exception {
    return VariantPool.get(Functions.changeStringCharset(value.getString(), fromCharset.getString(), toCharset.getString())); 
  }
```

---

## Array para Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConvertArrayToList` |
| **Código** | 119 |
| **Assinatura** | `Array para Lista (Variante):Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Transforma um conjunto de elementos que não podem ser manipulados pelas funções da categoria lista em um conjunto de elementos que podem ser manipulados por essas funções.

Parâmetro:
1. Array (Vetor). (Variante)

Retorno:
Objeto lista com os elementos contidos no array. (Variante)

Exemplo: 
Ao obter uma imagem de um banco de dados e utilizar a função "Para Byte", da categoria conversão, ela vem como um array (Vetor) de bytes que não podem ser acessados utilizando as funções da categoria lista, logo é necessária essa conversão para que esse elementos possam ser manipulados.

### Código Servidor (Java)

```java
protected final Variant ebfConvertArrayToList (Variant arrayVariant) throws Exception{
    Object array = arrayVariant.getObject();  
    if (array instanceof byte[]) {
      byte[] bytes = (byte[]) array;      
      List lista = new ArrayList(bytes.length);
      for (int cont=0; cont<bytes.length;cont++) {
        lista.add(bytes[cont]);
      }    
      return VariantPool.get(lista);
    }
    List lista = new ArrayList(java.lang.reflect.Array.getLength(array));
    for (int cont=0; cont<java.lang.reflect.Array.getLength(array);cont++) {
      lista.add(java.lang.reflect.Array.get(array, cont));
    }
    return VariantPool.get(lista);
  }
```

---

## Base 64 para Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBase64ToString` |
| **Código** | 67 |
| **Assinatura** | `Base 64 para Texto (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Converte um Texto codificado na Base64 para Texto Normal. A Base 64 é usada para codificar dados.

Parâmetro:
1. Texto em Base 64. (Letras)

Retorno:
O Texto normal em Letras. (Letras)

Observação:
As especificações completas deste tipo de Base64 são dadas pelas RFC 1421 e RFC 2045. ( RFC é uma sigla de Request for Comments, ele é um documento que descreve os padrões de cada protocolo da Internet previamente a serem considerados como um padrão).

Exemplo: 
Assumindo como parâmetro o texto codificado em Base64 " TWFrZXI " =, o retorno será  " MAKER ".

### Código Servidor (Java)

```java
protected final Variant ebfBase64ToString(Variant base64Var) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    String base64 = base64Var.getString();
    if (base64.length() > 0) {
      value = VariantPool.get(Base64Decoder.decode(base64));
    }
    return value;
  }
```

---

## Binário para Base 64

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBytesToBase64` |
| **Código** | 463 |
| **Assinatura** | `Binário para Base 64 (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Converte um conteúdo binário para base 64.

Parâmetro:
1. Conteúdo binário. (Variante)

Retorno:
Conteúdo convertido para base 64. (Letras)

Observação:
A Base 64 é usada para codificar dados. As especificações completas deste tipo de Base64 são dadas pelas RFC 1421 e RFC 2045. (RFC é uma sigla de Request for Comments. Ele é um documento que descreve os padrões de cada protocolo da internet previamente a serem considerados como um padrão).

Exemplo: 
Assumindo como parâmetro o resultado da consulta à tabela "fr_imagem" que trás um campo do tipo imagem, o retorno será o conteúdo binário do campo foto convertido para Base64.

### Código Servidor (Java)

```java
protected final Variant ebfBytesToBase64(Variant bytes) throws Exception {
    Variant base64 = Variant.VARIANT_NULL;
    java.io.File file = Functions.generateTempFile("WFR_", null);
    try {
      if (bytes.getObject() instanceof byte[]) {
        byte[] byteCampo = (byte[]) bytes.getObject();
        Functions.saveBytesToFile(byteCampo, file);
        base64 = VariantPool.get(Functions.getBase64File(file.getAbsolutePath()));
      }
    } finally {
      file.delete();
    }
    return base64;
  }
```

---

## Bytes para Letras

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBytesToString` |
| **Código** | 459 |
| **Assinatura** | `Bytes para Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Converte um valor em Bytes para letras.

Parâmetro:
1. Valor em bytes. (Variante)

Retorno:
Valor convertido. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfBytesToString(Variant varBytes) throws Exception {
       byte[] b = (byte[]) varBytes.getObject();
      return VariantPool.get(new String(b));
  }
```

---

## Converter campo tipo Texto para tipo Arquivo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConverterInputTextInFile` |
| **Código** | 282 |
| **Assinatura** | `Converter Componente do tipo Texto para tipo Arquivo(Componente, Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 7 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função converte um Componente Caixa de Texto para um componente Caixa de Texto do tipo Arquivo.
Através dela você poderá selecionar um arquivo do sistema.

Parâmetro(s): 
1. Componente Caixa de Texto.
2. Quantidade de caracteres (aproximados) que aparecerão. (Inteiro) (Ver observação 1)

Retorno:
Não possui.

Observações:
1. No 2º Parâmetro o Firefox 3 necessita dessa propriedade para alterar a largura.
2. O componente não pode estar relacionado a um campo do banco de dados.
3. Por questões de segurança, a exibição do caminho correto do arquivo ficará a critério do navegador utilizado.
4. Necessário o uso da função no evento "Ao Entrar" do formulário.

Exemplo: 
Assumindo que um Componente do tipo Texto no formulário. O uso desta converterá o Componente em um do tipo arquivo.

### Código Cliente (JavaScript)

```javascript
function ebfConverterInputTextInFile(field, size) {
  var componente = $c(field);                 
  if (componente) {
    try {
      componente.input.type = 'file';
      if (size) {
        componente.input.setAttribute("size", size);
      }
    } catch (Exception) {
      var inputNovo = document.createElement('input');
      inputNovo.type = 'file';
      inputNovo.className = componente.input.className;
      if (size) {
        inputNovo.setAttribute("size", size);
      } else {
        inputNovo.style.width = componente.input.style.width + "px";
        inputNovo.style.height = componente.input.style.height + "px";
      }
      inputNovo.name = componente.input.name;
      inputNovo.id = componente.input.id;
      componente.context.removeChild(componente.input);   
      componente.context.appendChild(inputNovo);
      componente.input = inputNovo;
    }
  }
}
```

---

## Cor para RGB

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDelphiColorToRGB` |
| **Código** | 18 |
| **Assinatura** | `Cor para RGB(Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte a cor para o formato RGB.

Parâmetro:
1. Cor. (Letras)

Retorno:
Cor em RGB. (Letras)

Observação:
O formato RGB é uma forma utilizada para se reproduzir diversas cores através das cores básicas iniciais:
vermelho (Red), verde (Green) e azul (Blue). Em computação utiliza-se muito esse padrão para se definir uma cor a ser mostrada na tela, se representa a cor RGB em números tendo cada cor, vermelho (R), verde (G) e azul (B) 256 combinações possíveis de 0 a 255 sendo 0 a ausência de dessa cor e 255 a sua plenitude. 
Sendo Representado da seguinte forma:
      - Branco como é o conjunto de todas as cores sendo representado como 255 255 255.
      - Preto como sendo a ausência de cores sendo representado com  0 0 0.
      - Vermelho, representado como 255 0 0.
      - Verde,  representado como 0 255 0.
      - Azul representado como  0 0 255.

Exemplos:
1. Assumindo como parâmetro "clGreen", o retorno será #008000.
2. Assumindo como parâmetro "clPurple", o retorno será #800080.
3. Assumindo como parâmetro "clWhite", o retorno será  #FFFFFF.

### Código Servidor (Java)

```java
protected final Variant ebfDelphiColorToRGB(Variant value) throws Exception {
    return VariantPool.get(WFRAppearance.getColor(value.toString())); 
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDelphiColorToRGB(value) 
{
    if (value == "clNone") return "";
    if (value == "clAqua") return "#33FFFF";
    if (value == "clBlack") return "#000000";
    if (value == "clBlue") return "#0000FF";
    if (value == "clCream") return "#FFFBF0";
    if (value == "clFuchsia") return "#FF00FF";
    if (value == "clGray") return "#808080";
    if (value == "clGreen") return "#008000";
    if (value == "clLime") return "#00FF00";
    if (value == "clMaroon") return "#800000";
    if (value == "clMedGray") return "#A0A0A4";
    if (value == "clMoneyGreen") return "#C0DCC0";
    if (value == "clNavy") return "#000080";
    if (value == "clOlive") return "#808000";
    if (value == "clPurple") return "#800080";
    if (value == "clRed") return "#FF0000";
    if (value == "clSilver") return "#C0C0C0";
    if (value == "clSkyBlue") return "#A6CAF0";
    if (value == "clTeal") return "#008080";
    if (value == "clWhite") return "#FFFFFF";
    if (value == "clYellow") return "#FFFF00";
    value = parseInt(value);
    if (value < 0) 
    { 
      value += 33554426;
    }
    var r = "#";
    r += ebfIntToHex(0x00FF & value, 2);      //R
    r += ebfIntToHex(0x00FF & value >>  8, 2); //G
    r += ebfIntToHex(0x00FF & value >> 16, 2);//B
    return r;
}
```

---

## De base 64 para binário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBase64ToBinary` |
| **Código** | 50 |
| **Assinatura** | `De base 64 para binário (Letras) : Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Converte um Texto codificado na Base64 para Binário. A Base 64 é usada para codificar dados.

Parâmetro:
1. Texto codificado em Base 64. (Letras)

Retorno:
O Texto em formato binário. (Variante)

Exemplo: 
Assumindo como parâmetro o texto codificado em Base64 "TWFrZXI", o retorno será o binário correspondente a essa expressão.

### Código Servidor (Java)

```java
protected final Variant ebfBase64ToBinary(Variant base64) throws Exception {
    Variant binary = Variant.VARIANT_NULL;
    byte[] temp = Functions.getFromBase64(base64.getString());
    if (temp != null) {
      binary = new Variant(temp);
    }
    return binary;
  }
```

---

## De binário para base 64

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBinaryToBase64` |
| **Código** | 32 |
| **Assinatura** | `De binário para base 64 (Tabela;Campo) : Letras` |
| **Parâmetros** | Tabela;Campo |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Converte um conteúdo binário para base 64.

Parâmetro(s):
1. Tabela retornada da consulta ao banco.
2. Campo da tabela.

Retorno:
Conteúdo convertido para base 64. (Letras)

Observação:
A Base 64 é usada para codificar dados. As especificações completas deste tipo de Base64 são dadas pelas RFC 1421 e RFC 2045. (RFC - Request for Comments é um documento que descreve os padrões de cada protocolo da internet previamente a serem considerados como um padrão).

Exemplo: 
Assumindo como parâmetros a tabela "Consulta Pessoa" que armazena o resultado de uma consulta SQL na tabela de pessoas e o campo "Foto" que possui a foto da pessoa, o retorno será o conteúdo binário do campo foto convertido para Base64.

### Código Servidor (Java)

```java
protected final Variant ebfBinaryToBase64(Variant tabela, Variant nomeCampo) throws Exception {
    Variant base64 = Variant.VARIANT_NULL;
    File file = Functions.generateTempFile("WFR_",null);
    try {
      ResultSet rs = tabela.getResultSet();
      byte[] byteCampo = rs.getBytes(nomeCampo.getString());
      Functions.saveBytesToFile(byteCampo, file);
      base64 = VariantPool.get(Functions.getBase64File(file.getAbsolutePath()));
    } finally {
      file.delete();
    }
    return base64;
  }
```

---

## Hexadecimal para Inteiro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHexToInt` |
| **Código** | 107 |
| **Assinatura** | `Hexadecimal para Inteiro (Letras) : Inteiro` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Converte um Número de Hexadecimal para Inteiro.

Parâmetro:
1. Valor em Hexadecimal. (Letras)

Retorno:
Valor do primeiro parâmetro convertido para inteiro. (Inteiro)

Observação:
Hexadecimal é um sistema numérico com 16 dígitos, onde os dígitos de 0 a 9 são representados por números de 0 a 9, e os dígitos de 10 a 15 são representados por letras, que vão de A a F.

Exemplos: 
1. Assumindo como parâmetro o valor F em hexadecimal, o retorno será o valor inteiro 15.
2. Assumindo como parâmetro o valor 7DD e, hexadecimal, o retorno será o valor inteiro 2013.

### Código Servidor (Java)

```java
protected final Variant ebfHexToInt(Variant value){
  return VariantPool.get(Integer.valueOf(value.getString(), 16).intValue());
}
```

---

## Inteiro para Extenso

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIntToString` |
| **Código** | 304 |
| **Assinatura** | `Inteiro para Extenso (Inteiro) : Letras` |
| **Parâmetros** | Inteiro |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Escreve por extenso um número passado por parâmetro.

Parâmetro:
1. Número. (Inteiro)
 
Retorno:
Um texto do número escrito por extenso. (letras)

Observação:
O valor máximo a ser escrito por extenso é de "999.999.999.999".

Exemplo:
Assumindo como parâmetro 123 retorno será "cento e vinte e três".

### Código Servidor (Java)

```java
protected final Variant ebfIntToString(Variant valueVar) throws Exception {
    double valor = valueVar.getDouble();
    double aux = 0;
    int posicao = 0;
    String texto = "";
    List listaNome = new ArrayList();
    List listaMilhar = new ArrayList();
    listaNome.add("");
    listaNome.add("um");  
    listaNome.add("dois");  
    listaNome.add("três");  
    listaNome.add("quatro");  
    listaNome.add("cinco");  
    listaNome.add("seis");  
    listaNome.add("sete");  
    listaNome.add("oito");  
    listaNome.add("nove");
    listaNome.add("dez");
    listaNome.add("onze");
    listaNome.add("doze");
    listaNome.add("treze");
    listaNome.add("quatorze");
    listaNome.add("quinze");
    listaNome.add("dezesseis");
    listaNome.add("dezessete");
    listaNome.add("dezoito");
    listaNome.add("dezenove");
    listaNome.add("vinte");
    listaNome.add("trinta");
    listaNome.add("quarenta");
    listaNome.add("cinquenta");
    listaNome.add("sessenta");
    listaNome.add("setenta");
    listaNome.add("oitenta");
    listaNome.add("noventa");
    listaNome.add("cento");
    listaNome.add("duzentos");
    listaNome.add("trezentos");
    listaNome.add("quatrocentos");
    listaNome.add("quinhentos");
    listaNome.add("seiscentos");
    listaNome.add("setecentos");
    listaNome.add("oitocentos");
    listaNome.add("novecentos");
    listaMilhar.add("");
    listaMilhar.add("mil");
    listaMilhar.add("milh");
    listaMilhar.add("bilh");
    
    double valorDividido;
    int casas = 1000000000;
    int y = 3;
    double valorFixo = 0;
    for (int i = 0; i < listaMilhar.size(); i++){
       valorDividido = valor/casas;
       if((int)valorDividido != 0 && (int)valorDividido < 1000){
           aux = valorDividido/100;
           valorFixo = (int)valorDividido;                
           posicao = 27 + (int)aux;
           if(valorFixo == 100){
               texto += "cem";
               if(y == 0){
                   return VariantPool.get(texto);
               }
            }else if(posicao != 27) {
                texto += listaNome.get(posicao);
                texto += " e ";
            }
            valorDividido = valorDividido - (int)aux * 100;           
            aux = valorDividido/10; 
            if((int)aux == 1) {
                 aux =  valorDividido;
                 posicao = (int)aux;
                 if(posicao != 9) {
                    texto += listaNome.get(posicao);
                 }
            }else if((int)aux >= 2){     
            
                 valorDividido = valorDividido - (int)aux * 10;
                 posicao = 18 + (int)aux;
                 texto += listaNome.get(posicao);
                 if((int)valorDividido != 0){
                    texto += " e ";  
                    aux =  valorDividido;
                    texto += listaNome.get((int)aux);
                 }
            }else if((int)valorDividido != 0){
                aux =  valorDividido;
                texto += listaNome.get((int)aux);
            }else if((int)aux == 0 && texto != "" && posicao > 28){    
                texto = texto.substring(0, texto.length() - 3);
            }
            valor = valor - valorFixo*casas;
            
       }  
         if((y == 3 || y == 2) && (int)aux == 1 && (int)valorDividido < 1000){
            texto += " " + listaMilhar.get(y) + "ão ";
         }else if((y == 3 || y == 2) && valorFixo > 1 && (int)valorDividido < 1000){
            texto += " " + listaMilhar.get(y) + "ões ";
         }else if(y == 1 && posicao > 0){
            texto += " " + listaMilhar.get(y)+ " ";
         }
            
         if(casas > 1 && valor != 0 && (valorFixo > 0 || y == 1) && (int)valorDividido < 1000 && posicao > 0){
            texto += "e ";
         }
         casas = casas/1000;
         y--;
         posicao = 0;
     }
     return VariantPool.get(texto);
    
  }
```

---

## JSON para Variante

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfConvertJSONToVariant` |
| **Código** | 473 |
| **Assinatura** | `JSON para Variante (Letras): Variante` |
| **Parâmetros** | Letras |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Converte JSON (valores serializados) para Variante. Esse Variante pode ser um Mapa ou uma Lista.
O valor passado por parâmetro deve iniciar com JSONInstance ou ArrayInstance.

Parâmetro:
1. Valor a ser convertido. (Letras)

Retorno:
Objeto convertido a partir do JSON. (Variante)

Exemplo:
Assumindo como 1º parâmetro o valor JSONInstance({"a":1}), o retorno seria um variável do tipo variante com os 
dados informados.

### Código Servidor (Java)

```java
protected final Variant ebfConvertJSONToVariant(Variant value) throws Exception {
    return new Variant(WFRRuleType.OBJECT, value.getString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfConvertJSONToVariant(obj, c) {  
  if(!c){
    if(obj.substring(0,12) === 'JSONInstance'){
      obj = JSON.parse(obj.substring(13, obj.length - 1));
    }else if(obj.substring(0,13) === 'ArrayInstance'){  
      return eval(obj.substring(14, obj.length - 1));
    }else{  
      return obj;
    }
  }
  const mp = new Map;
  var objectConstructor = {}.constructor;
  Object.keys(obj).forEach(function (k) {
    mp.set(k, obj[k].constructor === objectConstructor ? ebfConvertJSONToVariant(obj[k], true) : obj[k]);
  });  
  return mp;
}
```

---

## Objeto para Mapa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfObjectToMap` |
| **Código** | 240 |
| **Assinatura** | `Objeto para Mapa(Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Converte as propriedades do objeto passado para um Mapa.

Parâmetro:
1. Objeto a ser convertido. (Variante)

Retorno:
Retorna um Mapa contendo as propriedades do objeto. (Variante)

Observação:
Os nomes das propriedades são convertidas para letras maiúsculas.

### Código Servidor (Java)

```java
@SuppressWarnings("unchecked")
  protected static final Variant ebfObjectToMap(Variant source) throws Exception 
  {
    Object o = source.getObject();
    java.lang.reflect.Method[] methods = o.getClass().getMethods();
    java.util.HashMap<String, Object> properties = new java.util.HashMap<String, Object>();
    for (java.lang.reflect.Method method : methods) {
      if (method.getName().startsWith("get") && method.getParameterTypes().length == 0) {        
        String key = method.getName().substring(3).toUpperCase();
        Object value = method.invoke(o);
        properties.put(key, value);
      }
    }
    return new Variant(properties);
  }
```

---

## Para Bytes

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toBytes` |
| **Código** | 94 |
| **Assinatura** | `Para Bytes(Variante) : Variante;` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um valor passado por parâmetro para Bytes.

Parâmetro:
1. Conteúdo que será convertido para bytes. (Variante)

Retorno:
Array de Bytes equivalente ao conteúdo passado por parâmetro. (Variante)

Observação:
Para manipular os bytes de retorno dessa função é necessária a utilização da função "Array para Lista" da categoria "Conversão". 
Após convertido pra lista o conteúdo poderá ser manipulado pelas funções da categoria "Lista".

Exemplo: 
Assumindo o parâmetro "Maker", será retornado um array de bytes equivalente à palavra "Maker".

### Código Servidor (Java)

```java
protected final Variant toBytes(Variant variant) throws Exception {
    return VariantPool.get(variant.getString().getBytes());
  }
```

### Código Cliente (JavaScript)

```javascript
function toBytes(obj) {
  return obj ? obj.toString() : "";
}
```

---

## Para Código ASCII

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfChrToAscii` |
| **Código** | 99 |
| **Assinatura** | `Para Código ASCII(Letra):Inteiro;` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte o caractere passado por parâmetro para código ASCII.

Parâmetro:
1. Caractere do qual se deseja obter o código ASCII. (Letras)

Retorno:
Código ASCII do caractere passado por parâmetro. (Inteiro)

Observação:
A Tabela ASCII (American Standard Code for Information Interchange) é usada pela maior parte das industrias de computadores para a troca de informações. Cada caractere é representado por um código de 8 bits (1 byte).

Exemplo: 
Assumindo o parâmetro como "d" o retorno será 100.

### Código Servidor (Java)

```java
protected final Variant ebfChrToAscii(Variant value) throws Exception {
  Variant ascii = Variant.VARIANT_NULL;
  if (value.getType() != WFRRuleType.NULL && value.getString().length() > 0) {
    ascii = VariantPool.get(Long.valueOf(value.getString().charAt(0)));
  }
  return ascii;
}
```

### Código Cliente (JavaScript)

```javascript
function ebfChrToAscii(achar){
  if (isNullable(achar)) {
    return null;
  } else {
    return (achar.charCodeAt(0));
  }
}
```

---

## Para Data

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toDate` |
| **Código** | 592 |
| **Assinatura** | `Para Data(Letras, Letras) : Data` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Data |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte para data o valor passado no primeiro parâmetro. O segundo parâmetro é opcional, e por ele pode-se informar o formato da data que será retornada (válido apenas para fluxo servidor).

Parâmetro(s):
1. Valor a ser convertido. (Letras)
2. Formato do parâmetro a ser convertido. (Letras, Opcional) (Ver observação 1)

Retorno: 
Valor convertido para data. (Data)

Observações:
1. O 2º Parâmetro é válido apenas para fluxo servidor.
2. O formato da Data referente ao segundo parâmetro deve ser escrito no seguinte formato:
         dd    - Para dia do mês da data do primeiro parâmetro.
         MM  - Para Mês do Ano da data do primeiro parâmetro.
        yyyy  - Para o Ano da data do primeiro parâmetro.
3. O formato da data não remove as horas.

Exemplo: 
Assumindo como parâmetros a data 10/10/2007 09:12:40 e o formato dd/MM/yyyy, o retorno será 10/10/2007 00:00:00.

### Código Servidor (Java)

```java
protected final Variant toDate(Variant... variants) throws Exception {
    Variant date = Variant.VARIANT_NULL;
    if (variants.length > 0) {
      Variant value = variants[0];
      //if (value.getType() == WFRRuleType.NULL) { throw new WFRRuleException("Parâmetro de conversão para data não informado ou nulo!", this.ruleName); }
      if (value.getType() != WFRRuleType.NULL) {
        if (variants.length == 1) {
          date = VariantPool.get(value.getDate());
        } else {
          Variant mask = variants[1];
          if (mask.getType() == WFRRuleType.NULL || mask.getString().equals("")) {
            date = VariantPool.get(value.getDate());
          } else {
            SimpleDateFormat dateFormat = new SimpleDateFormat(mask.getString());
            date = VariantPool.get(dateFormat.parse(value.getString()));
          }
        }
      }
    } else {
      throw new WFRRuleException(RulesMessages.ERROR_INCORRECT_DATE_PARAM, this.ruleName);
    }
    return date;
  }
```

### Código Cliente (JavaScript)

```javascript
function toDate(value) {
  var toDate = null;
  if (value instanceof Date) {
    toDate = value;
  } else {
    if (value != null && (typeof value != "undefined")) {
      var dtExpReg = /^\s*(\d+)[\/\.-](\d+)[\/\.-](\d+)(\s(\d+):(\d+):(\d+))?\s*$/;
      var dataArr = dtExpReg.exec(value);
      if (dataArr != null) {
        var dia = retirarZerosIniciais(dataArr[1]);
        var mes = retirarZerosIniciais(dataArr[2]);
        var ano = retirarZerosIniciais(dataArr[3]);
        var hora = retirarZerosIniciais(dataArr[5]);
        var minuto = retirarZerosIniciais(dataArr[6]);
        var segundo = retirarZerosIniciais(dataArr[7]);
        if (hora != null && (typeof hora != "undefined")) {
          toDate = new Date(ano, mes-1, dia, hora, minuto, segundo);
        } else {
          toDate = new Date(ano, mes-1, dia, 0, 0, 0);
        }
      }
    }
  }
  return toDate;
}
```

---

## Para Fracionado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toDouble` |
| **Código** | 506 |
| **Assinatura** | `Para Fracionado (Variante) : Fracionado` |
| **Parâmetros** | Variante |
| **Retorno** | Fracionado |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte para fracionado o valor passado por parâmetro.

Parâmetro:
1. Valor a ser convertido. (Variante)

Retorno: 
Valor convertido para Fracionado. (Fracionado)

Observação:
O valor apresentado será conforme o idioma do sistema.

### Código Servidor (Java)

```java
protected final Variant toDouble(Variant variant) throws Exception {
    return VariantPool.get(variant.getDouble());
  }
```

### Código Cliente (JavaScript)

```javascript
function toDouble(value) {
  return parseNumeric(value);
}
```

---

## Para Graus

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toDegrees` |
| **Código** | 225 |
| **Assinatura** | `Para Graus (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um valor em "Radianos" para Grau.

Parâmetro:
1. Valor em Radianos a ser convertido. (Número)

Retorno: 
"Radianos" convertido para "Graus". (Número)

### Código Servidor (Java)

```java
protected final Variant toDegrees(Variant radians) throws Exception {
    double degrees = (Math.PI * radians.getDouble()) / 180;
    return VariantPool.get(degrees);
  }
```

### Código Cliente (JavaScript)

```javascript
function toDegrees(radians) {
  return (Math.PI * toDouble(radians)) / 180;
}
```

---

## Para Hexadecimal

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfIntToHex` |
| **Código** | 17 |
| **Assinatura** | `Para Hexadecimal(Inteiro;Inteiro): Letras` |
| **Parâmetros** | Inteiro;Inteiro |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um número decimal para hexadecimal com zeros a esquerda caso o número a ser convertido seja menor que a
quantidade de caracteres a ser retornada. 

Parâmetro(s):
1. Valor a ser convertido. (Inteiro)
2. Quantidade de Caracteres a ser retornada. (Inteiro)

Retorno:
Valor convertido para Hexadecimal. (Letras)

Observação:
Hexadecimal é um sistema numérico com 16 dígitos, onde os dígitos de 0 a 9 são representados por números de 0 a 9, 
e os dígitos de 10 a 15 são representados por letras, que vão de A a F.

Exemplo:
Assumindo os números decimais (9, 10, 11 e 15) no 1º Parâmetro, e 5 no 2º Parâmetro, 
 o retorno será respectivamente (00009, 0000a, 0000b, 0000f).

### Código Servidor (Java)

```java
protected final Variant ebfIntToHex(Variant number, Variant minSize) throws Exception {
        String s = Integer.toHexString(number.getLong().intValue());
        while(s.length() < minSize.getLong())
             s = "0" +s;
        return VariantPool.get(s);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfIntToHex(value, minsize) {
  if (!minsize) minsize = 2;
   var i = 0;
   var j = -1;
   var inp = value;
   value = inp;
   var a = parseInt(inp);
   var b = a.toString(16);
   var c = parseInt("0x" + b);
   if (b != 'NaN') 
   { 
     while (b.length < minsize) b =  '0' + b;
     return b; 
   }
}
```

### Código Banco de Dados

```sql
--
```

---

## Para Inteiro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toLong` |
| **Código** | 504 |
| **Assinatura** | `Para Inteiro (Variante) : Inteiro` |
| **Parâmetros** | Variante |
| **Retorno** | Inteiro |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um valor passado por parâmetro para Inteiro.

Parâmetro:
1. Valor a ser convertido. (Variante)

Retorno: 
Valor convertido para Inteiro. (Inteiro)

Exemplo:
Assumindo como parâmetros "12,54",  o retorno será 12.

### Código Servidor (Java)

```java
protected final Variant toLong(Variant variant) throws Exception {
    return VariantPool.get(variant.getLong());
  }
```

### Código Cliente (JavaScript)

```javascript
function toLong() {
  var value = 0;
  if (existArgs(arguments)) {
    value = parseInt(toDouble(arguments[0]));
  }
  return value;
}
```

---

## Para Letras

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toString` |
| **Código** | 505 |
| **Assinatura** | `Para Letras (Variante) : Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um valor passado por parâmetro para letras. 

Parâmetro:
1. Valor a ser convertido. (Variante)

Retorno: 
Valor convertido para Letras. (Letras)

Exemplo:
Assumindo como parâmetro o fracionado 7.4, o retorno será o valor 7.4 convertido para letras.

### Código Servidor (Java)

```java
protected final Variant toString(Variant variant) throws Exception {
    return VariantPool.get(variant.getString());
  }
```

### Código Cliente (JavaScript)

```javascript
function toString(obj) {
  return isNullable(obj) ? "" : obj.toString();
}
```

---

## Para Letras (JS)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfToJSString` |
| **Código** | 41 |
| **Assinatura** | `Para Letras JS (Variante)` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte para o formato Texto removendo os caracteres especiais de JavaScript. 

Parâmetro:
1. Texto JavaScript para ser convertido para o formato de texto normal. (Variante)

Retorno:
Texto convertido para o formato de texto normal. (Letras)

Exemplo: 
Assumindo como parâmetro o conteúdo: ""(aspas), o retorno será "\"(barra), pois ""(aspas) é um caractere especial JavaScript.

### Código Servidor (Java)

```java
protected final Variant ebfToJSString(Variant variant) throws Exception {
    return VariantPool.get(wfr.util.Functions.stringToJs(variant.getString()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfToJSString(str) {
  var sb = ""; 
  if (str != null) {
    str = str.toString();
    for (var i = 0; i < str.length; i++) {
      c = str.charAt(i);
      if (c == '\\') {
        sb += "\\\\";
      } else if (c == '\'') {
        sb += "\\'";
      } else if (c == '"') {
        sb += "\\\"";
      } else if (c == '\n') {
        sb += "\\n";
      } else if (c == '\r') {
      } else {
        sb += c;
      }
    }
    return sb;
  } else {
    return "";
  }
}
```

---

## Para Lógico

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toBoolean` |
| **Código** | 150 |
| **Assinatura** | `Para Lógico (Letras) : Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte para valor Lógico o texto passado por parâmetro. 

Parâmetro:
1. Texto que será convertido para Lógico. (Letras)

Retorno:
Valor Lógico correspondente ao texto enviado. (Lógico)

Exemplos: 
1. Assumindo como parâmetro o conteúdo " 1", o retorno será o valor Lógico Verdadeiro.
2. Assumindo como parâmetro o conteúdo " 0 ", o retorno será o valor Lógico Falso.

### Código Servidor (Java)

```java
protected final Variant toBoolean(Variant variant) throws Exception {
    return VariantPool.get(Functions.stringToBoolean(variant.getString()));
  }
```

### Código Cliente (JavaScript)

```javascript
function toBoolean(value) {
  return parseBoolean(value);
}
```

---

## Para Radianos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `toRadians` |
| **Código** | 224 |
| **Assinatura** | `Para Radianos (Número) : Número` |
| **Parâmetros** | Número |
| **Retorno** | Número |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um valor em "graus" para radiano.

Parâmetro:
1. Grau a ser convertido. (Número)

Retorno:
Grau convertido para radianos. (Número)

### Código Servidor (Java)

```java
protected final Variant toRadians(Variant degrees) throws Exception {
    double radians = (180 * degrees.getDouble()) / Math.PI;
    return VariantPool.get(radians);
  }
```

### Código Cliente (JavaScript)

```javascript
function toRadians(degrees) {
  return (180 * toDouble(degrees)) / Math.PI;
}
```

---

## Tabela para JSON

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetToJSON` |
| **Código** | 852 |
| **Assinatura** | `Tabela para JSON (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Converte uma tabela em um JSON Array.

Parâmetro:
1. Tabela a ser convertida.

Retorno: 
JSON Array. (variante)

Observações:
1. A tabela passa por parâmetro deve conter registros. Pode ser utilizada a função "Existem Registros" para verificar se existem ou não registros.
2. Caso exista uma coluna imagem essa será convertida para Base64.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetToJSON(Variant table) throws Exception {
  ResultSet rs = table.getResultSet();
  java.sql.ResultSetMetaData rsmd = null;  
  rsmd = rs.getMetaData();
  int cols = rsmd.getColumnCount();
  jakarta.json.JsonArrayBuilder jab = jakarta.json.Json.createArrayBuilder();
  do {   
    jakarta.json.JsonObjectBuilder job = jakarta.json.Json.createObjectBuilder();
    for (int i = 0; i < cols; i++) {
      String columnName = rsmd.getColumnLabel(i+1).equals("") ? rsmd.getColumnName(i+1) : rsmd.getColumnLabel(i+1); 
      String columnClassName = rsmd.getColumnClassName(i + 1);
      if (!columnClassName.equals("java.lang.Object")) {
        Object object = rs.getObject(i + 1);
        if (object != null) {
          if (object.toString().indexOf("[B") > -1) {
            byte[] data = rs.getBytes(i + 1);
            job.add(columnName, ebfBytesToBase64(new Variant(data)).getString());
          } else {
            if(columnClassName.equals("java.lang.Integer")){
              job.add(columnName, Long.valueOf(object.toString()));
            }else if(columnClassName.equals("java.lang.Double")){
              job.add(columnName, Double.valueOf(object.toString()));
            }else if(columnClassName.equals("java.lang.Boolean")){
              job.add(columnName, Boolean.valueOf(object.toString()));
            }else{
              job.add(columnName, object.toString());
            }
            
          }
        } else {
          job.add(columnName, jakarta.json.JsonValue.NULL);
        }
      } else {
        java.sql.Blob blob = rs.getBlob(i + 1);
        java.io.InputStream blobstream = blob.getBinaryStream();
        java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[16384];
        while ((nRead = blobstream.read(data, 0, data.length)) != -1) {
          buffer.write(data, 0, nRead);
        }
        buffer.flush();
        job.add(columnName, ebfBytesToBase64(new Variant(buffer.toByteArray())).getString());
      }
    }

    jab.add(job.build());
  } while (rs.next());

  return VariantPool.get(jab.build());
}
```

---

## Tabela para Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfResultSetToList` |
| **Código** | 264 |
| **Assinatura** | `Tabela para Lista (Tabela;Lógico): Variante` |
| **Parâmetros** | Tabela;Lógico |
| **Retorno** | Variante |
| **Tipo** | 7 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Converte uma tabela em uma Lista.

Parâmetro(s):
1. Tabela a ser convertida.
2. Converter Binário para Base64? (Lógico)

Retorno: 
Lista. (variante)

Observação:
A tabela passa por parâmetro deve conter registros. Pode ser utilizada a função "Existem Registros" para verificar se existem ou não registros.

### Código Servidor (Java)

```java
protected final Variant ebfResultSetToList(Variant table) throws Exception {
   return ebfResultSetToList(table, new Variant(false));
  }
  
  protected final Variant ebfResultSetToList(Variant table, Variant convertBase64) throws Exception {
   ResultSet rs = table.getResultSet();
   java.sql.ResultSetMetaData rsmd = null;
   List row = new ArrayList();
   rsmd = rs.getMetaData();
   int cols = rsmd.getColumnCount();
   do {
    List fields = new ArrayList();
    for (int i = 0; i < cols; i++) {
     String columnClassName = rsmd.getColumnClassName(i + 1);
     if (!columnClassName.equals("java.lang.Object")) {
      Object object = rs.getObject(i + 1);
      if (object != null) {
       if (object.toString().indexOf("[B") != -1 && convertBase64.getBoolean() == true) {
        byte[] data = rs.getBytes(i + 1);
        fields.add(ebfBytesToBase64(new Variant(data)));
       } else {
        fields.add(object);
       }
      } else {
       fields.add(object);
      }

     } else {
      java.sql.Blob blob = rs.getBlob(i + 1);
      java.io.InputStream blobstream = blob.getBinaryStream();
      if (convertBase64.getBoolean() == true) {
       java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
       int nRead;
       byte[] data = new byte[16384];
       while ((nRead = blobstream.read(data, 0, data.length)) != -1) {
        buffer.write(data, 0, nRead);
       }
       buffer.flush();
       fields.add(ebfBytesToBase64(new Variant(buffer.toByteArray())));
      } else {
       fields.add(blobstream);
      }
     }
    }
    row.add(fields);
   } while (rs.next());
   return VariantPool.get(row);
  }
```

### Código Banco de Dados

```sql
Q1hCeWIzUmxZM1JsWkNCV1lYSnBZVzUwSUdWaVpsSmxjM1ZzZEZObGRGUnZUR2x6ZENoV1lYSnBZVzUwSUhSaFlteGxLU0IwYUhKdmQzTWdSWGhqWlhCMGFXOXVJQ0FnZXlBZ0lDQWdJQ0FnRFFvSkNWSmxjM1ZzZEZObGRDQnljeUE5SUhSaFlteGxMbWRsZEZKbGMzVnNkRk5sZENncE93MEtDUWxxWVhaaExuTnhiQzVTWlhOMWJIU
lRaWFJOWlhSaFJHRjBZU0J5YzIxa0lEMGdiblZzYkRzZ0lDQWdJQ0FnSUEwS0NRbE1hWE4wSUhKdmR5QTlJCkc1bGR5QkJjbkpoZVV4cGMzUW9LVHNnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdEUW9KQ1hKemJXUWdQU0J5Y3k1blpYUk5aWFJoUkdGMFlTZ3BPeUFnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBTkN
na0phVzUwSUdOdmJITWdQU0J5YzIxa0xtZGxkRU52YkhWdGJrTnZkVzUwS0NrN0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnRFFvSkNYZG9hV3hsS0hKekxtNWxlSFFvS1NsN0lDQWdJQ0FnSUNBZ0lDQWdJQ0EKZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnRFFvSkNRbE1hWE4wSUdac
FpXeGtjeUE5SUc1bGR5QkJjbkpoZVV4cGMzUW9LVHNnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdEUW9KQ1FsbWIzSW9hVzUwSUdrZ1BTQXdPeUJwSUR3Z1kyOXNjenNnYVNzcktYc2dJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQTBLQ1FrSkNWTjBjbWx1WnlCamIyeDFiVzVEYkdGemMwNWhiV1VnUFNCeWMyMWtMbWRsZEVOdmJIVnRia05
zWQpYTnpUbUZ0WlNocElDc2dNU2s3SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FOQ2drSkNRbHBaaWdnSVdOdmJIVnRia05zWVhOelRtRnRaUzVsY1hWaGJITW9JbXBoZG1FdWJHRnVaeTVQWW1wbFkzUWlLU0FwSUNCN0lDQWdJQ0FnSUNBZ0lDQWdJQ
0FnSUNBZ0lDQWdJQ0FnRFFvSkNRa0pDVTlpYW1WamRDQnZZbXBsWTNRZ1BTQnljeTVuWlhSUFltcGxZM1FvYVNBCnJJREVwT3lBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQWtKQ1FrZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWd
JQ0FnSUNBZ0lBMEtDUWtKQ1FsbWFXVnNaSE11WVdSa0tHOWlhbVZqZENrN0RRb0pDUWtKQ1gwZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lBMEtDUWtKQ1dWc2MyVWdJSHNnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0kKQ0FOQ2drSkNRa0phbUYyWVM1emNXd3VRbXh2WWlCaWJHOWlJRDBnY25NdVoyVjBRbXh2WWlocElDc
2dNU2s3SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQU5DZ2tKQ1FrSmFtRjJZUzVwYnk1SmJuQjFkRk4wY21WaGJTQmliRzlpYzNSeVpXRnRJRDBnWW1
4dllpNQpuWlhSQ2FXNWhjbmxUZEhKbFlXMG9LVHNnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdEUW9KQ1FrSkNXWnBaV3hrY3k1aFpHUW9ZbXh2WW5OMGNtVmhiU2s3SUNBTkNna0pDUWw5SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnS
UNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBTkNna0pDWDBnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJCkNBZ0lDQWdJQTBLQ1FrZ0lDQWdjbTkzTG1Ga1pDaG1hV1ZzWkhNcE95QWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQU5DZ2tKZlNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0F
nSUNBTkNna2dJQ0FnY21WMGRYSnVJRlpoY21saGJuUlFiMjlzTG1kbGRDaHliM2NwT3lBZ0lDQU5DZ2w5SUE9PQ==
```

---

## Texto Binário Para Texto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBinaryToAscii` |
| **Código** | 91 |
| **Assinatura** | `Texto Binário Para Texto (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Converte um texto passado por parâmetro no formato binário (0 e 1) para texto normal (letras).

Parâmetro:
1. Texto Binário. (Letras)

Retorno:
Valor convertido. (Letras)

Exemplo:
Assumindo como parâmetro o texto binário "010000010100110001001100", o retorno será ALL.

### Código Servidor (Java)

```java
protected final Variant ebfBinaryToAscii(Variant binaryVar) throws Exception {
    StringBuilder ascii = new StringBuilder();
    String binary = binaryVar.getString();
    if (binary.length() > 0) {
      if ((binary.length()) % 8 != 0) {
        throw new WFRRuleException("Valor passado não é binário, portanto não pode ser convertido.", this.ruleName);
      }
      for (int i = 0; i < binary.length(); i+=8) {
         String temp = binary.substring(i, i+8);
         int decimal = 0;
         for (int j = 0; j < 8; j++) {
           decimal += ( (temp.charAt(7 - j) == '1') ? (1 << j) : 0 );
         }
         ascii.append((char) decimal);
      }
    }
    return VariantPool.get(ascii.toString());
  }
```

---

## Texto Delphi Para Texto Java

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDelphiStringToJavaString` |
| **Código** | 43 |
| **Assinatura** | `Texto Delphi Para Texto Java` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Retorna o valor do texto no formato Java, a partir de um texto no formato Delphi mudando os caracteres especiais que são usados nas linguagens.

Parâmetro:
1. Texto Delphi. (Letras)

Retorno:
Texto JAVA. (Letras)

Exemplo: 
Assumindo como parâmetro o texto 'softwell solutions' (entre aspas simples), o retorno será " softwell solutions " sem 
aspas, visto que java não usa aspas simples e sim aspas duplas.

### Código Servidor (Java)

```java
protected final Variant ebfDelphiStringToJavaString(Variant valueVar) throws Exception {
    return VariantPool.get(Functions.delphiStringToJavaString(valueVar.getString()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDelphiStringToJavaString(delphiString) {
  return delphiStringToJavaString(delphiString);
}
```

---

## Texto Para Texto Binário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAsciiToBinary` |
| **Código** | 90 |
| **Assinatura** | `Texto Para Texto Binário (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um Texto Normal para um Texto Binário.

Parâmetro:
1. Texto Normal. (Letras) 

Retorno:
Texto Binário. (Letras)

Exemplo:
Assumindo como parâmetro o texto "ALL", o retorno será o texto binário "010000010100110001001100".

### Código Servidor (Java)

```java
protected final Variant ebfAsciiToBinary(Variant asciiVar) throws Exception {
    StringBuilder binary = new StringBuilder();
    String ascii = asciiVar.getString();
    if (ascii.length() > 0) {
      for (int i = 0; i < ascii.length(); i++) {
        int value = ascii.charAt(i);
        for (int j = 7; j >= 0; j--) {
          binary.append((value >> j) & 1);
        }
      }
    }
    return VariantPool.get(binary.toString());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfAsciiToBinary(astring) {
  var binary = "";
  if (astring.length > 0) {
    for (var i = 0; i < astring.length; i++) {
      var value = astring.charCodeAt(i);
      for (var j = 7; j >= 0; j--) {
        binary += ((value >> j) & 1);
      }
    }
  }
  return binary;
}
```

---

## Texto para HTML

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStringToHTMLString` |
| **Código** | 62 |
| **Assinatura** | `Texto para HTML (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um texto para o formato HTML.

Parâmetro:
1. Texto que será convertido. (Letras)

Retorno:
Texto no formato HTML. (Letras)

Observação:
HTML é uma linguagem de marcação utilizada para produzir páginas na Web

Exemplo:
Assumindo como parâmetro a variável "Softwell", o retorno será o conteúdo da variável "Softwell" convertido para o formato HTML.

### Código Servidor (Java)

```java
protected final Variant ebfStringToHTMLString(Variant valueVar) throws Exception {
    return VariantPool.get(Functions.stringToHTMLString(valueVar.getString()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfStringToHTMLString(value) {
  return stringToHTMLString(value);
}
```

---

## Texto para JavaScript

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStringToJs` |
| **Código** | 61 |
| **Assinatura** | `Texto para JS (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | * |

### Descrição

Converte um texto passado por parâmetro para o formato JavaScript. 

Parâmetro:
1. Texto Normal que será convertido. (Letras) 

Retorno:
Texto passado por parâmetro convertido para o Padrão JavaScript. (Letras)

Exemplo:
Assumindo como parâmetro o conteúdo "", o retorno será "\r", pois "" é um caractere especial JavaScript.

### Código Servidor (Java)

```java
protected final Variant ebfStringToJs(Variant valueVar) throws Exception {
    return VariantPool.get(Functions.stringToJs(valueVar.getString()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfStringToJs(value) {
  return stringToJs(value);
}
```

---

## Texto para XML

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStringToXMLString` |
| **Código** | 934 |
| **Assinatura** | `Texto para XML (Letras): Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Converte um texto para o formato XML.

Parâmetro:
1. Texto que será convertido. (Letras)

Retorno:
Texto no formato XML. (Letras)

### Código Servidor (Java)

```java
protected final Variant ebfStringToXMLString(Variant valueVar) throws Exception {
  return VariantPool.get(Functions.stringToXMLString(valueVar.getString()));
}
```

### Código Cliente (JavaScript)

```javascript
function ebfStringToXMLString(value) {
  return stringToXMLString(value);
}
```

---

## Texto para base 64

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfStringToBase64` |
| **Código** | 63 |
| **Assinatura** | `Texto para base 64 (Letras) : Letras` |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 7 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Converte um Texto Normal para um Texto codificado na Base64. A Base 64 é usada para codificar dados.

Parâmetro:
1. Texto Normal. (Letras) 

Retorno: 
Texto em Base 64. (Letras)

Observação:
As especificações completas deste tipo de Base64 são dadas pelas RFC 1421 e RFC 2045.  
RFC é uma sigla de Request for Comments, ele é um documento que descreve os padrões de cada protocolo da internet previamente a serem considerados como um padrão.

Exemplo: 
Assumindo como parâmetro o texto "Maker", o retorno será o texto codificado em Base 64 "TWFrZXI=".

### Código Servidor (Java)

```java
protected final Variant ebfStringToBase64(Variant valueVar) throws Exception {
    Variant base64 = Variant.VARIANT_NULL;
    String value = valueVar.getString();
    if (value.length() > 0) {
      base64 = VariantPool.get(Base64Encoder.encode(value));
    }
    return base64;
  }
```

---

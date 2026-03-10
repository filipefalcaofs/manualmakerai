# Funções Nativas - Data e Hora

Total: **25** funções

[← Voltar para Funções Nativas](README.md)

---

## Ano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateYear` |
| **Código** | 545 |
| **Assinatura** | `Ano (Data) : Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função obtém o ano a partir de uma data passada por parâmetro.

Parâmetro: 
1. Data de onde será obtido o ano.

Retorno: 
Retorna o ano da data passada por parâmetro. (Inteiro)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 05/08/2008. O retorno será 2008.
2. Assumindo que o 1º parâmetro seja 29/12/2004. O retorno será 2004.
3. Assumindo que o 1º parâmetro seja o retorno da função "hoje", o retorno será o ano atual.

### Código Servidor (Java)

```java
protected final Variant ebfDateYear(Variant date) throws Exception {
    return getFromDate(date, Calendar.YEAR);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateYear() {
  var value = 0;
  if (existArgs(arguments)) {
    var data = toDate(arguments[0]);
    if (data) {
      value = data.getFullYear();
    }
  }
  return value;
}
```

---

## Criar Data

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateDate` |
| **Código** | 231 |
| **Assinatura** | `Criar Data (Inteiro, Inteiro, Inteiro, Inteiro, Inteiro, Inteiro) : Data` |
| **Parâmetros** | Inteiro;Inteiro;Inteiro;Inteiro;Inteiro;Inteiro |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Cria uma data a partir da passagem do ano, mês, dia, hora, minuto e segundo.

Parâmetro(s):
1. Ano. (Inteiro)
2. Mês. (Inteiro)
3. Dia. (Inteiro)
4. Hora (De 0 a 23). (Inteiro)
5. Minuto (De 0 a 59). (Inteiro)
6. Segundo (De 0 a 59). (Inteiro)

Retorno:
Retorna a data criada. (Data)

Exemplo:
Assumindo como parâmetros os valores (2007,5,11,11,5,20) o Retorno "11/05/2007 11:05:20".

### Código Servidor (Java)

```java
protected final Variant ebfCreateDate(Variant yearVar, Variant monthVar, Variant dayVar, Variant hourVar, Variant minuteVar, Variant secondVar) throws Exception {
    int year = yearVar.getLong().intValue();
    int month = monthVar.getLong().intValue() - 1;
    int day = dayVar.getLong().intValue();
    int hour = hourVar.getLong().intValue();
    int minute = minuteVar.getLong().intValue();
    int second = secondVar.getLong().intValue();
    // Obtém uma data usando as variáveis passadas como parâmetro
    Calendar date = Calendar.getInstance();
    date.set(year, month, day, hour, minute, second);
    // Retorna a data
    return VariantPool.get(date.getTime());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfCreateDate(year,month,day,hour,minute,second){
  // Cria uma nova data
  var date = new Date();
  // Altera os valores da data
  date.setYear(year);
  date.setMonth(month - 1);
  date.setDate(day);
  date.setHours(hour);
  date.setMinutes(minute);
  date.setSeconds(second);
  // Retorna a data
  return date;
}
```

---

## Data

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateDate` |
| **Código** | 601 |
| **Assinatura** | `Ano(Data) : Data` |
| **Parâmetros** | Data |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retira as horas da data, retornando apenas a Data com as horas zeradas.

Parâmetro: 
1. Data com Hora.

Retorno: 
Retorna a data com as horas zeradas. (Data)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 23/09/2008 23: 30: 00. O retorno será 23/09/2008 00:00:00.
2. Assumindo que o 1º parâmetro seja 10/12/1998 11: 52: 25. O retorno será 10/12/1998 00:00:00.

### Código Servidor (Java)

```java
protected final Variant ebfDateDate(Variant date) throws Exception {
    Variant value = Variant.VARIANT_NULL;
    Date data = date.getDate();
    if (data != null) {
      Calendar dataCalendar = Calendar.getInstance();
      dataCalendar.setTime(data);
      dataCalendar.set(Calendar.HOUR_OF_DAY, 0);
      dataCalendar.set(Calendar.MINUTE, 0);
      dataCalendar.set(Calendar.SECOND, 0);
      dataCalendar.set(Calendar.MILLISECOND, 0);
      value = VariantPool.get(dataCalendar.getTime());
    }
    return value;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateDate() {
  var data = null;
  if (existArgs(arguments)) {
    var temp = toDate(arguments[0]);
    temp.setHours(0);
    temp.setMinutes(0);
    temp.setSeconds(0);
    temp.setMilliseconds(0);
    data = temp;
  }
  return data;
}
```

---

## Dia

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateDay` |
| **Código** | 543 |
| **Assinatura** | `Dia (Data) : Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função obtém o dia da data passada por parâmetro.

Parâmetro:
1. Data de onde será obtido o dia.

Retorno: 
Retorna o dia a partir de uma data. (Inteiro)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 23/09/2008. O retorno será 23.
2. Assumindo que o 1º parâmetro seja 10/12/1998. O retorno será 10.
3. Assumindo que o 1º parâmetro seja o retorno da função "hoje", o retorno será o dia atual

### Código Servidor (Java)

```java
protected final Variant ebfDateDay(Variant date) throws Exception {
    return getFromDate(date, Calendar.DAY_OF_MONTH);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateDay() {
  var value = 0;
  if (existArgs(arguments)) {
    var data = toDate(arguments[0]);
    if (data) {
      value = data.getDate();
    }
  }
  return value;
}
```

---

## Dia da Semana

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `getDayOfWeek` |
| **Código** | 127 |
| **Assinatura** | `Dia da Semana(Data):Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna o dia da semana a partir da data passada por parâmetro.

Parâmetro:
1. Data que você deseja saber o dia da semana.

Retorno: 
Retorna um número inteiro que representa o dia da semana. (Inteiro)

Observação:
A função retorna um número inteiro representando o dia da semana (1 = Domingo; 2 = Segunda-Feira; 3 = Terça-Feira; 4 = Quarta-Feira; 5 = Quinta-Feira; 6 = Sexta-Feira; 7 = Sábado).

Exemplos: 
1. Assumindo que o 1º parâmetro seja 23/09/2007. O retorno será 1, pois o dia a data cai no domingo.
2. Assumindo que o 1º parâmetro seja 04/10/2007. O retorno será 5, pois a data cai na quinta-feira.

### Código Servidor (Java)

```java
protected final Variant getDayOfWeek(Variant data) throws Exception{
  Calendar date1Cal = Calendar.getInstance();         
  date1Cal.setTime(data.getDate());    
  return VariantPool.get(date1Cal.get(Calendar.DAY_OF_WEEK));
}
```

### Código Cliente (JavaScript)

```javascript
function getDayOfWeek(paramDate) {   
  var date = toDate(paramDate);
  return date.getDay() + 1;  
}
```

---

## Diferença de Anos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateYearDifference` |
| **Código** | 1160 |
| **Assinatura** | `Diferença de Anos (Data;Data): Inteiro` |
| **Parâmetros** | Data;Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função calcula a diferença de anos entre as datas passadas por parâmetros.

Parâmetro(s):
1. Primeira Data.
2. Segunda Data.

Retorno: 
Retorna a diferença de anos. (Inteiro)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 23/12/2009 e o 2º parâmetro 02/02/2007. O retorno será 2, pois (2009 - 2007 = 2).
2. Assumindo que o 1º parâmetro seja 18/05/2004 e o 2º parâmetro 28/01/2007. O retorno será -3, pois (2004 - 2007 = -3).

### Código Servidor (Java)

```java
protected static Variant ebfDateYearDifference(Variant date1, Variant date2) throws Exception {
  Calendar date1Cal = Calendar.getInstance();
  Calendar date2Cal = Calendar.getInstance();
  date1Cal.setTime(date1.getDate());
  date2Cal.setTime(date2.getDate());
  int diff = 0;
  diff = date1Cal.get(Calendar.YEAR) - date2Cal.get(Calendar.YEAR);
  if(date2Cal.before(date1Cal)) { //verifica se a data 2 é antes da data 1
    if(date2Cal.get(Calendar.MONTH)>date1Cal.get(Calendar.MONTH)) {
      diff--;
    } else if(date2Cal.get(Calendar.MONTH)==date1Cal.get(Calendar.MONTH)) {
      if(date2Cal.get(Calendar.DAY_OF_MONTH)>date1Cal.get(Calendar.DAY_OF_MONTH)){
        diff--;
      }
    }
  }else {
    if (date2Cal.get(Calendar.MONTH) < date1Cal.get(Calendar.MONTH)) {
      diff++;
    } else if(date2Cal.get(Calendar.MONTH)==date1Cal.get(Calendar.MONTH)) {
      if(date2Cal.get(Calendar.DAY_OF_MONTH)<date1Cal.get(Calendar.DAY_OF_MONTH)) {
        diff++;
      }
    }
  }

  return VariantPool.get(Long.valueOf(diff));
}
```

### Código Cliente (JavaScript)

```javascript
function ebfDateYearDifference() {
  var diff = 0;
  if (existArgs(arguments)) {
    var data1 = toDate(arguments[0]);
    var data2 = toDate(arguments[1]);
    if (data1 != null && data2 != null) {
      diff = data1.getFullYear() - data2.getFullYear();    
      if (data2.compareTo(data1) == -1) {
        if (data2.getMonth() > data1.getMonth()){
          diff--;
        } else if(data2.getMonth() == data1.getMonth){
          if(data2.getDate() > data1.getDate()){
            diff--;
          }	
        }
      } else {
        if(data2.getMonth() < data1.getMonth()){
          diff++;
        } else if(data2.getMonth() == data1.getMonth()){
          if (data2.getDate() < data1.getDate()) {
      	    diff++;
      	  }
        }
      }
    }
  }
  return diff;
}
```

---

## Diferença de Dias

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateDayDifference` |
| **Código** | 588 |
| **Assinatura** | `Diferença de Dias(Data;Data) : Fracionado` |
| **Parâmetros** | Data;Data |
| **Retorno** | Fracionado |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função calcula a diferença de dias (levando em consideração as horas) entre as datas passadas por parâmetros.

Parâmetro(s): 
1. Primeira Data.
2. Segunda Data.

Retorno: 
Retorna a diferença de dias da data do 1º parâmetro com a data do 2º parâmetro. (Fracionado)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 09/02/2005 00:00:00 e o 2º parâmetro 11/03/2005 00:00:00. O retorno será -30.
2. Assumindo que o 1º parâmetro seja 11/03/2004 00:00:00 e o 2º parâmetro 09/02/2004  00:00:00. O retorno será 30.

### Código Servidor (Java)

```java
protected final Variant ebfDateDayDifference(Variant date1, Variant date2) throws Exception {
    long difDate = date1.getDate().getTime() - date2.getDate().getTime();
    /**
     * 86400000 ms = 1 dia em ms
     */
    double qtdDias = difDate / 86400000d;
    return VariantPool.get(qtdDias);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateDayDifference() {
  var result = 0;
  if (existArgs(arguments)) {
    var data1 = toDate(arguments[0]);
    var data2 = toDate(arguments[1]);
    if (data1 != null && data2 != null) {
      var diff = data1.getTime() - data2.getTime();
      /**
       * 86400000 ms = 1 dia em ms
       */
      result = diff / 86400000;
    }
  }
  return result;
}
```

---

## Diferença de Meses

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateMonthDifference` |
| **Código** | 1159 |
| **Assinatura** | `Diferença de Meses (Data;Data): Inteiro` |
| **Parâmetros** | Data;Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função calcula a diferença de meses entre as datas passadas por parâmetros.

Parâmetro(s):
1. Primeira Data.
2. Segunda Data.

Retorno: 
Retorna a diferença de meses. (Inteiro)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 09/02/2005 e o 2º parâmetro 11/03/2005. O retorno será -1.
2. Assumindo que o 1º parâmetro seja 11/03/2004 e o 2º parâmetro 09/02/2004. O retorno será 1.

### Código Servidor (Java)

```java
protected final Variant ebfDateMonthDifference(Variant date1, Variant date2) throws Exception {
  Calendar date1Cal = Calendar.getInstance();
  Calendar date2Cal = Calendar.getInstance();
  date1Cal.setTime(date1.getDate());
  date2Cal.setTime(date2.getDate());
  int yearDiff=0;
  int monthDiff=0;
  yearDiff = date1Cal.get(Calendar.YEAR) - date2Cal.get(Calendar.YEAR); //calcula a diferença da parte do ano
  monthDiff = (yearDiff*12) + date1Cal.get(Calendar.MONTH) - date2Cal.get(Calendar.MONTH);
  if (date2Cal.before(date1Cal)) {
    if (date1Cal.get(Calendar.DAY_OF_MONTH) < date2Cal.get(Calendar.DAY_OF_MONTH)) {
      monthDiff--;
    }
  } else {
    if (date1Cal.get(Calendar.DAY_OF_MONTH) > date2Cal.get(Calendar.DAY_OF_MONTH)) {
      monthDiff++;
    }
  }

  return VariantPool.get(Long.valueOf(monthDiff));
}
```

### Código Cliente (JavaScript)

```javascript
function ebfDateMonthDifference() {
  var monthDiff = 0;
  if (existArgs(arguments)) {
    var data1 = toDate(arguments[0]);
    var data2 = toDate(arguments[1]);
    if (data1 != null && data2 != null) {
      var yearDiff = data1.getFullYear() - data2.getFullYear();
      monthDiff = (yearDiff * 12) + data1.getMonth() - data2.getMonth();        
      if (data2.compareTo(data1) == -1) {
        if (data1.getDate() < data2.getDate()) {
      	  monthDiff--;      	
        }
      } else {
        if (data1.getDate() > data2.getDate()) {
          monthDiff++;
        }
      }
    }
  }
  return monthDiff;
}
```

---

## Formatar Data

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfToLocaleDateString` |
| **Código** | 884 |
| **Assinatura** | `Formatar Data (Data;Letras;Letras): Letras` |
| **Parâmetros** | Data;Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função formata uma data de acordo os valores passado por parâmetro.

Parâmetro(s):
1. Data.
2. Idioma. (Letras, Opcional)
3. Formato (Texto JSON). (Letras)

Retorno:
Data formatada. (Letras)

Observações:
1. Caso o segundo parâmetro não seja informado o mesmo assumirá o idioma do Webrun.
2. Os parâmetros suportados para formatação são: weekday, year, month, day, hour, minute e second.
3. Os valores possíveis para formatação são:
  - weekday: "narrow", "short", "long".
  - year: "numeric" e "2-digit".
  - month: "numeric", "2-digit", "narrow", "short" e "long".
  - day: "numeric" e "2-digit".
  - hour: "numeric" e "2-digit".
  - minute: "numeric" e "2-digit".
  - second: "numeric" e "2-digit".

Exemplos:
1. Assumindo como primeiro parâmetro a data 31/08/2016 00:00:00, segundo parâmetro pt-BR e terceiro parâmetro o texto JSON {"weekday":"long"},
o retorno será quarta-feira.
2. Assumindo como primeiro parâmetro a data 31/08/2016 00:00:00, segundo parâmetro pt-BR e terceiro parâmetro o texto JSON{"weekday":"long", "day":"numeric", "month":"long", "year":"numeric"},
o retorno será quarta-feira, 31 de agosto de 2016.
Mais informações:
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString

### Código Cliente (JavaScript)

```javascript
function ebfToLocaleDateString(date, locale ,format){
 locale = locale===undefined || locale===null ? resources_locale : locale;   
 //Força a remoção do underline por traço caso o idioma seja o padrão do Webrun.
 locale = ebfReplace(locale, "_", "-");
 if(date instanceof Date){
   try{
    var options = JSON.parse(format);
   }catch(e){
     handleException(new Error("Texto JSON não está em um formato válido"));
   } 
   return date.toLocaleDateString(locale, options);
 }
}
```

---

## Formatação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFormatDateTime` |
| **Código** | 108 |
| **Assinatura** | `Formatação (Data,Letras) : Letras` |
| **Parâmetros** | Data;Letras |
| **Retorno** | Letras |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função modifica a formatação da data passada no primeiro parâmetro para a formatação passada no segundo parâmetro. 

Parâmetro(s):
1. Data que deseja formatar.
2. Formatação da data. (Letras) (Ver observação 1) 

Retorno: 
Retorna a data com a nova formatação. (Letras)

Observação:
Tipos de formatos aceitos:
yyyy - ano
MM - mês
w - semana do ano (soma das semanas (Somente camada servidor)).
W - semana do mês (soma das semanas (Somente camada servidor)).
D - dia do ano (soma dos dias)
dd - dia do mês (Somente camada servidor).
F - dia da semana (soma dos dias (Somente camada servidor)).
a - am/pm
H - hora (0 a 23h)
k - hora (1 a 24h)
K - hora (0 a 11h am/pm)
h - hora (1 a 12 am/pm)
mm - minutos da hora
ss - segundos hora
SSS - milisegundos da hora (Somente camada servidor).

Exemplos: 
1. Assumindo que o 1º parâmetro seja 01/04/2007 20: 32: 16, o 2º Parâmetro sendo dd/MM/yyyy K a, o retorno será 01/04/2007 8 PM.
2. Assumindo que o 1º parâmetro seja 01/04/2007 20: 32:16, o 2º Parâmetro sendo dd/MM k:mm, o retorno será 01/04/2007 20:32.

### Código Servidor (Java)

```java
protected final Variant ebfFormatDateTime(Variant date, Variant formatVar) throws Exception{
    String format = "dd/MM/yyyy";
    if (!formatVar.isNull() && formatVar.getString().trim().length() > 0){
      format = formatVar.getString();
    }
    
    if (date.isNull()){
      return Variant.VARIANT_NULL;
    }
    
    SimpleDateFormat dateFormat = new SimpleDateFormat(format);
    return VariantPool.get(dateFormat.format(date.getDate()));
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfFormatDateTime(date, format) {
  if (isNullable(date) || !(date instanceof Date)) {
    return null;
  }
  
  if (isNullable(format)) {
    format = "dd/MM/yyyy"; 
  }
  
  return date.format(format);
}
```

---

## Hoje

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateToday` |
| **Código** | 548 |
| **Assinatura** | `Hoje () : Data` |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função obtém a data atual e retorna.

Parâmetro:
Não possui.

Retorno: 
Retorna a data atual com as horas. (Data)

Observações:
1. Ao utilizar a função em um fluxo na camada Servidor, a hora retornada será a definida no relógio do servidor de aplicações (Webrun).
2. Ao utilizar a função em um fluxo na camada Cliente, a hora retornada será a definida no relógio do cliente (não confiável).
3. Ao utilizar a função em um fluxo na camada Banco de Dados, a hora retornada será a definida no relógio do servidor de banco de dados.

### Código Servidor (Java)

```java
protected final Variant ebfDateToday() throws Exception {
    return VariantPool.get(new Date());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateToday() {
  return new Date();
}
```

---

## Hora

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateHour` |
| **Código** | 602 |
| **Assinatura** | `Hora(Data) : Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém as horas a partir da data.

Parâmetro: 
1. Data que deseja extrair as horas.

Retorno: 
Retorna a hora extraída da data. (Inteiro)

Observação: 
Se no primeiro parâmetro for passada uma data sem as horas, a função retornará o valor 0 (zero).

Exemplos: 
Assumindo que o 1º parâmetro seja 22/08/2008 18: 30: 02. O retorno será 18.

### Código Servidor (Java)

```java
protected final Variant ebfDateHour(Variant date) throws Exception {
    return getFromDate(date, Calendar.HOUR_OF_DAY);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateHour() {
  var hora = -1;
  if (existArgs(arguments)) {
    var data = toDate(arguments[0]);
    if (data) {
      hora = data.getHours();
    }
  }
  return hora;
}
```

---

## Incrementa Ano

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateIncYear` |
| **Código** | 547 |
| **Assinatura** | `Incrementa Ano (Data;Inteiro) : Data` |
| **Parâmetros** | Data;Inteiro |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função incrementa o ano de uma data passada por parâmetro.

Parâmetro(s): 
1. Data que deseja incrementar o ano.
2. Valor a ser incrementado no ano. (Inteiro)

Retorno: 
Retorna a data com o ano incrementado. (Data)

Exemplo: 
Assumindo que o 1º parâmetro seja 22/08/2008 e o 2º parâmetro seja 2 . O retorno será 22/08/2010.

### Código Servidor (Java)

```java
protected final Variant ebfDateIncYear(Variant date, Variant inc) throws Exception {
    Calendar d = Calendar.getInstance();
    d.setTime(date.getDate());
    d.add(GregorianCalendar.YEAR, inc.getLong().intValue());
    return VariantPool.get(d.getTime());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateIncYear() {
  var data = null;
  if (existArgs(arguments)) {
    data = toDate(arguments[0]);
    var value = arguments[1];
    if (data) {
      data.incYear(value ? value : 0);
    }
  }
  return data;
}
```

---

## Incrementa Dia

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateIncDay` |
| **Código** | 544 |
| **Assinatura** | `Incrementa Dia (Data;Inteiro) : Data` |
| **Parâmetros** | Data;Inteiro |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função incrementa o dia de uma data passada por parâmetro.

Parâmetro(s):
1. Data que deseja incrementar o dia.
2. Valor a ser incrementado no dia. (Inteiro)

Retorno: 
Retorna a data com o dia incrementado. (Data)

Exemplo: 
Assumindo que o 1º parâmetro seja 22/09/2008 e o 2º parâmetro seja 2 . O retorno será 24/09/2008.

### Código Servidor (Java)

```java
protected final Variant ebfDateIncDay(Variant date, Variant inc) throws Exception {
    Calendar d = Calendar.getInstance();
    d.setTime(date.getDate());
    d.add(GregorianCalendar.DAY_OF_MONTH, inc.getLong().intValue());
    return VariantPool.get(d.getTime());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateIncDay() {
  var data = null;
  if (existArgs(arguments)) {
    data = toDate(arguments[0]);
    var value = arguments[1];
    if (data) {
      data.incDay(value ? value : 0);
    }
  }
  return data;
}
```

---

## Incrementa Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateIncMonth` |
| **Código** | 546 |
| **Assinatura** | `Incrementa Mês (Data;Inteiro) : Data` |
| **Parâmetros** | Data;Inteiro |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função incrementa o mês de uma data passada por parâmetro.

Parâmetro(s): 
1. Data que deseja incrementar o mês.
2. Valor a ser incrementado no mês. (Inteiro)

Retorno: 
Retorna a data com o mês incrementado. (Data)

Exemplo: 
Assumindo que o 1º parâmetro seja 05/08/2005 e o 2º parâmetro seja 2 . O retorno será 05/10/2005.

### Código Servidor (Java)

```java
protected final Variant ebfDateIncMonth(Variant date, Variant inc) throws Exception {
    Calendar d = Calendar.getInstance();
    d.setTime(date.getDate());
    d.add(GregorianCalendar.MONTH, inc.getLong().intValue());
    return VariantPool.get(d.getTime());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateIncMonth() {
  var data = null;
  if (existArgs(arguments)) {
    data = toDate(arguments[0]);
    var value = arguments[1];
    if (data) {     
      var oldData = (new Date(data.getFullYear(), data.getMonth(), data.getDate(), data.getHours(), data.getMinutes(), data.getSeconds(), data.getMilliseconds()));
      data.incMonth(value ? value : 0);         
      if (oldData.getDate() != data.getDate()) {
         data = (new Date(data.getFullYear(), data.getMonth(), 0, data.getHours(), data.getMinutes(), data.getSeconds(), data.getMilliseconds()));         
      }
    }
  }
  return data;
}
```

---

## Incrementar Hora/Minuto/Segundo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateSumHour` |
| **Código** | 353 |
| **Assinatura** | `Incrementar Hora/Minuto/Segundo (Variante;Inteiro;Letras)` |
| **Parâmetros** | Variante;Inteiro;Letras |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Incrementa a hora, minuto ou segundo de uma data com hora.

Parâmetro(s):
1. Data com a hora que será incrementada.
2. Quantidade a ser incrementada. (Inteiro)
3. Qual parte da hora deve ser incrementada. (Letras) (Ver observação 1)

Retorno: 
Data com a hora incrementada. (Data)

Observações:
1. No 3º Parâmetro use H para hora, M para minuto e S para segundo.
2. Utilizando a função na Camada Cliente se for passada no 1º parâmetro somente a data o retorno da função será a data e
a hora com o valor incrementado na parte da hora informada.

Exemplo:
Assumindo no 1º parâmetro 10/12/2013, 2º parâmetro 30, 3º parâmetro M
retorno da função será 10/12/2013 00:30:00.

### Código Servidor (Java)

```java
protected final Variant ebfDateSumHour(Variant hourVar, Variant valueVar, Variant typeVar) throws Exception {
    java.util.Date hour = hourVar.getDate();
    if (hour == null) {
      return Variant.VARIANT_NULL;
    }
    
    int value = valueVar.getLong().intValue();
    
    char typeChar = (char) -1;
    String type = typeVar.getString();
    if (type.length() > 0) {
      typeChar = type.charAt(0);
    }
    
    java.util.Calendar hourCalendar = java.util.Calendar.getInstance();
    hourCalendar.setTime(hour);
    
    switch (typeChar) {
      case 'H': {
        hourCalendar.add(java.util.Calendar.HOUR, value);   
        break;
      }
      
      case 'M': {
        hourCalendar.add(java.util.Calendar.MINUTE, value);   
        break;
      }
      
      case 'S': {
        hourCalendar.add(java.util.Calendar.SECOND, value);   
        break;
      }
    }
    
    return VariantPool.get(hourCalendar.getTime());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateSumHour(date, value, type) {
	  if(date.getHours) {
	    var time = new Time();
	    date = time.fromDate(date);
	  }
	  
	  switch (type) {
	    case 'H': {
	      date.incHour(value);
	      break;
	    }
	    
	    case 'M': {
	      date.incMinute(value);
	      break;
	    }
	    
	    case 'S': {
	      date.incSecond(value);
	      break;
	    }
	  }
	  
	  return date.getDate();
}
```

---

## Milisegundos desde 1970

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetTimeSince70` |
| **Código** | 59 |
| **Assinatura** | `Data e Hora - Milisegundos desde 1970` |
| **Retorno** | Variante |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função calcula a quantidade de milissegundos do ano de 1970 até o dia atual.

Parâmetro:
Não possui.

Retorno: 
Retorna a quantidade de milissegundos. (Variante)

### Código Servidor (Java)

```java
public Variant ebfGetTimeSince70() {
    Date now = new Date();
    long nowLong = now.getTime();
    return VariantPool.get(nowLong);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGetTimeSince70() {
  var date = new Date();
  return date.getTime();
}
```

---

## Minuto

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateMinute` |
| **Código** | 599 |
| **Assinatura** | `Minuto(Data) : Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém os minutos de uma data passada por parâmetro.

Parâmetro:
1. Data que será extraído os minutos.

Retorno: 
Retorna os minutos da data passada por parâmetro. (Inteiro)

Observação: 
Se no 1º parâmetro for passada uma data sem os minutos, a função retornará o valor 0 (zero).

Exemplo: 
Assumindo que o 1º parâmetro seja 02/11/2010 12: 53: 26. O retorno será 53.

### Código Servidor (Java)

```java
protected final Variant ebfDateMinute(Variant date) throws Exception {
    return getFromDate(date, Calendar.MINUTE);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateMinute() {
  var minute = -1;
  if (existArgs(arguments)) {
    var data = toDate(arguments[0]);
    if (data != null) {
      minute = data.getMinutes();
    }
  }
  return minute;
}
```

---

## Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateMonth` |
| **Código** | 566 |
| **Assinatura** | `Mês (Data) : Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | * |

### Descrição

Essa função obtém o mês de uma data passada por parâmetro.

Parâmetro:
1. Data que deseja extrair o mês.

Retorno: 
Retorna o mês da data. (Inteiro)

Exemplos: 
1. Assumindo que o 1º parâmetro seja 22/09/2008. O retorno será 9.
2. Assumindo que o 1º parâmetro seja o retorno da função "hoje", o retorno será o mês atual

### Código Servidor (Java)

```java
protected final Variant ebfDateMonth(Variant date) throws Exception {
    return getFromDate(date, Calendar.MONTH);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateMonth() {
  var value = 0;
  if (existArgs(arguments)) {
    var data = toDate(arguments[0]);
    if (data) {
      value = data.getMonth() + 1;
    }
  }
  return value;
}
```

---

## Nanosegundos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetNanoTime` |
| **Código** | 65 |
| **Assinatura** | `Nanosegundos()` |
| **Retorno** | Variante |
| **Tipo** | 12 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém os nanosegundos da hora atual.

Parâmetro:
Não possui.

Retorno: 
Retorna a hora atual em nanosegundos. (Variante)

### Código Servidor (Java)

```java
public Variant ebfGetNanoTime() {
    return VariantPool.get(System.nanoTime());
  }
```

---

## Obter Hora Completa

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTimeOfDateTime` |
| **Código** | 232 |
| **Assinatura** | `Obter hora(Data):Data` |
| **Parâmetros** | Data |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Recebe como parâmetro uma data/hora e a retorna com a data modificada para  01/01/1900.

Parâmetro:
1. Data/Hora.

Retorno:
Data/Hora.

Exemplo:
Obter hora ("05/10/2007 11:20:30") o Retorno: "01/01/1900 11:20:30".

### Código Servidor (Java)

```java
public final Variant ebfTimeOfDateTime(Variant dateTimeVar) throws Exception {
    // Cria a variável do tipo Calendar
    Calendar dateTime = Calendar.getInstance();
    dateTime.setTime(dateTimeVar.getDate());
    // Transforma a data para 01/01/1900
    dateTime.set(Calendar.YEAR, 1900);
    dateTime.set(Calendar.MONTH, Calendar.JANUARY);
    dateTime.set(Calendar.DAY_OF_MONTH, 1);
    // Retorna a data modificada
    return VariantPool.get(dateTime.getTime());
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfTimeOfDateTime(date) {
  if (date != null && date instanceof Date) {
    date.setYear(1900);
    date.setMonth(0);
    date.setDate(1);
  }
  return date;
}
```

---

## Obter milissegundos da data desde 1970

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetTimeFromDataSince70` |
| **Código** | 316 |
| **Assinatura** | `Obter milissegundos da data desde 1970 (Data): Variante` |
| **Parâmetros** | Data |
| **Retorno** | Variante |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Recebe uma data por parâmetro e obtém os milissegundos da data desde 1970.

Parâmetro:
1. Data. (Opcional)

Retorno:
Milisegundos. (Variante)

Observação:
Caso não seja informada a data, a função retornará os milissegundos da data atual.

### Código Servidor (Java)

```java
protected Variant ebfGetTimeFromDataSince70(Variant date) throws Exception{
  Date now = null;
  if(date.isNull() || date.toString().trim().length() == 0){
    now = new Date();
  }else{  
    now = date.getDate();
  }
  
  //caso seja alguma data inválida, o retorno do getDate() é nulo.
  if (now == null){
    now = new Date();
  }
  
  long nowLong = now.getTime();
  return VariantPool.get(nowLong);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGetTimeFromDataSince70(dateVar){
  var date;
  if (dateVar == null || dateVar == '')
    return null;
  if (dateVar instanceof Date){
    date = dateVar;
  }else{
    date = new Date(dateVar);
  }  

  return date.getTime();
}
```

---

## Primeiro Dia do Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfFirstDay` |
| **Código** | 164 |
| **Assinatura** | `Primeiro Dia do Mês (Inteiro;Inteiro;Letras): Data` |
| **Parâmetros** | Inteiro;Inteiro;Letras |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função a partir do mês e ano passado por parâmetro retorna a data com o primeiro dia do mês.

Parâmetro(s):
1. Mês. (Inteiro)
2. Ano. (Inteiro)
3. Formatação. (Letras, Opcional)

Retorno: 
Retorna a data com o primeiro dia do mês. (Data)

Observações:
1. O mês deve receber valores entre 1 e 12.
2. Se o 3º parâmetro não for definido, a data retornada terá o formato brasileiro.

Exemplo: 
Assumindo o 1º parâmetro sendo 02 e o 2º parâmetro sendo 2007, o retorno será 01/02/2007 00:00:00.

### Código Servidor (Java)

```java
protected final Variant ebfFirstDay(Variant month, Variant year) throws Exception {
  return VariantPool.get(ebfFirstDay(month, year, new Variant(""))); 
}  

protected final Variant ebfFirstDay(Variant month, Variant year, Variant dateFormat) throws Exception {    
   java.util.Calendar calendar = java.util.Calendar.getInstance();	  
   calendar.set(java.util.Calendar.YEAR, year.getLong().intValue());
   calendar.set(java.util.Calendar.MONTH, month.getLong().intValue() - 1);
   calendar.set(java.util.Calendar.DAY_OF_MONTH, 1);	
   if(!dateFormat.toString().equals("")){
      return VariantPool.get(new java.text.SimpleDateFormat(dateFormat.toString()).format(calendar.getTime()) + " 00:00:00"); 	  
   }else{
      return VariantPool.get(new java.text.SimpleDateFormat("dd/MM/yyyy").format(calendar.getTime()) + " 00:00:00"); 
   }
}
```

### Código Cliente (JavaScript)

```javascript
function ebfFirstDay(month, year, formatting){
   var date = new Date(year, parseInt(month) -1, 1); 
   if(formatting === 'undefined' || formatting == null || formatting ===""){   
      return toDate(date.getDate() + '/' + month + '/' + year);
   }else{         
      return date.format(formatting)+ " 00:00:00";   
   }
}
```

---

## Segundo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDateSecond` |
| **Código** | 600 |
| **Assinatura** | `Segundo(Data) : Inteiro` |
| **Parâmetros** | Data |
| **Retorno** | Inteiro |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém os segundos de uma data passada por parâmetro.

Parâmetro: 
1. Data que será extraído os segundos.

Retorno: 
Retorna os segundos da data passada por parâmetro. (Inteiro)

Observação: 
Se no primeiro parâmetro for passada uma data sem os segundos, a função retornará o valor 0 (zero).

Exemplo: 
Assumindo que o 1º parâmetro seja 02/11/2010 11: 58: 26. O retorno será 26.

### Código Servidor (Java)

```java
protected final Variant ebfDateSecond(Variant date) throws Exception {
    return getFromDate(date, Calendar.SECOND);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfDateSecond() {
  var second = -1;
  if (existArgs(arguments)) {
    var data = toDate(arguments[0]);
    if (data != null) {
      second = data.getSeconds();
    }
  }
  return second;
}
```

---

## Último Dia do Mês

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLastDay` |
| **Código** | 163 |
| **Assinatura** | `Último Dia do Mês (Inteiro;Inteiro;Letras): Data` |
| **Parâmetros** | Inteiro;Inteiro;Letras |
| **Retorno** | Data |
| **Tipo** | 12 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função retorna a data com o último dia do mês a partir do mês e ano passado por parâmetro.

Parâmetro(s):
1. Mês. (Inteiro)
2. Ano. (Inteiro)
3. Formatação. (Letras, Opcional)

Retorno: 
Retorna a data com o último dia do mês. (Data)

Observações:
1. O mês deve receber valores entre 1 e 12.
2. Se o 3º parâmetro não for definido a data retornada terá o formato brasileiro.

Exemplo: 
Assumindo o 1º parâmetro sendo 02 e o 2º parâmetro sendo 2007, o retorno será 28/02/2007 23:59:59.

### Código Servidor (Java)

```java
protected final Variant ebfLastDay(Variant month, Variant year) throws Exception {    
   return VariantPool.get(ebfLastDay(month,year,new Variant("")));    
}

protected final Variant ebfLastDay(Variant month, Variant year, Variant dateFormat) throws Exception {
   java.util.Calendar calendar = java.util.Calendar.getInstance();
   calendar.set(java.util.Calendar.YEAR, year.getLong().intValue());
   calendar.set(java.util.Calendar.MONTH, month.getLong().intValue() - 1);
   calendar.set(java.util.Calendar.DAY_OF_MONTH, 1);
   int maxMonthDay = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
   calendar.set(java.util.Calendar.DAY_OF_MONTH, maxMonthDay);
   if(!dateFormat.toString().equals("")){
      return VariantPool.get(new java.text.SimpleDateFormat(dateFormat.toString()).format(calendar.getTime()) + " 23:59:59"); 	  
   }else{
      return VariantPool.get(new java.text.SimpleDateFormat("dd/MM/yyyy").format(calendar.getTime()) + " 23:59:59"); 
   }
}
```

### Código Cliente (JavaScript)

```javascript
function ebfLastDay(month, year, formatting){
   var date = new Date(year, month, 0);
   formatting = (formatting === 'undefined' || formatting == null || formatting === "") ? 'dd/MM/yyyy' : formatting;   
   return date.format(formatting)+ " 23:59:59";   
}
```

---

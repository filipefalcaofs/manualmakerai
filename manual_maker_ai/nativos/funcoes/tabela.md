# Funções Nativas - Tabela

Total: **16** funções

[← Voltar para Funções Nativas](README.md)

---

## Tabela - Alterar Estilo do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTableChangeStyleCSS` |
| **Código** | 530 |
| **Assinatura** | `Tabela - Alterar Estilo do Elemento (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função altera a folha de estilo do elemento.

Parâmetro(s):
1. Elemento da tabela. (Letras)
2. Estilo. (Letras)

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTableChangeStyleCSS(componente,estilo) {
     var componente = document.getElementById(componente);
     if(componente != null) {      
       if (componente) {         
/*       var style = componente.style.cssText;           
       style += estilo;
        componente.setAttribute("style",style); */
        componente.setAttribute("style",estilo);       
       }
     }
}
```

---

## Tabela - Alterar cor da Linha ou Célula

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTableHTMLAlterLineColor` |
| **Código** | 520 |
| **Parâmetros** | Letras;Cor |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe como parâmetro a linha ou coluna de uma tabela HTML e altera a cor da mesma.

Parâmetro(s):
1. Linha ou Coluna de uma tabela HTML. (Letras)
2. Cor que a linha ou coluna irá assumir. 

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTableHTMLAlterLineColor(component, colorLine) {
  var line = document.getElementById(component);

  line.style.backgroundColor=colorLine;
}
```

---

## Tabela - Criar Tabela a partir de uma Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableCreateWithArray` |
| **Código** | 285 |
| **Assinatura** | `Tabela - Criar Tabela a partir de uma Lista (Formulário;Componente;Inteiro;Inteiro;Inteiro;Variante;Letras;Cor;Cor;Cor;Inteiro;Inteiro;Variante;Lógico)` |
| **Parâmetros** | Formulário;Componente;Inteiro;Inteiro;Inteiro;Variante;Letras;Cor;Cor;Cor;Inteiro;Inteiro;Variante;Lógico |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Cria uma tabela a partir de uma lista de listas.

Parâmetro(s):
1. Formulário.
2. Moldura. (Componente)
3. Largura da tabela. (Inteiro, Opcional)
4. Altura da tabela. (Inteiro, Opcional)
5. Tamanho da borda da tabela. (Inteiro, Opcional)
6. Lista de listas de elementos. (Variante) 
7. Alinhamento. (Letras, Opcional)
8. Cor de fundo da tabela. (Cor, Opcional)
9. Cor da borda da tabela. (Cor, Opcional)
10. Cor de fundo da célula. (Cor, Opcional)
11. Espaçamento entre as células. (Inteiro, Opcional)
12. Espaçamento entre o texto e as bordas da célula. (Inteiro, Opcional)
13. Estilo das células. (Variante, Opcional) 
14. Barra de Rolagem? (Lógico, Opcional)

Retorno:
Não possui.

Observações:
1. Valores aceitos no 7° parâmetro: 
       + left (Esquerda)
       + center (Centro)
       + right (Direita)
2. O 13° parâmetro pode receber, por exemplo: "background-color: #000000".

### Código Servidor (Java)

```java
protected final Variant ebfHTMLTableCreateWithArray(Variant form,Variant componentName,Variant width,Variant height,Variant border,Variant rowList,Variant align,Variant bgColor,Variant borderColor,Variant cellBgColor,Variant cellSpace,Variant cellPad,Variant cellStyle, Variant scroll) throws Exception {
    return callClientFunction("ebfHTMLTableCreateWithArray", form, componentName, width, height, border, rowList, align, bgColor, borderColor, cellBgColor, cellSpace, cellPad, cellStyle, scroll);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableCreateWithArray(form, componentName, width, height, border, rowList, align, bgColor, borderColor, cellBgColor, cellSpace, cellPad, style, scroll){
  //Obtém a moldura
  var component = $c(componentName);

  // Verifica se existe a moldura
  if  (component){
    var div = getDiv(id, 0, 0, component.getWidth(), component.getHeight(), 1000010, true);

    // Obtém o id da tabela
    var id = 'table' + parseInt((Math.random() * 9999999));
    //Criar Elementos tbody e table
    var tbody = document.createElement("tbody");
    var table = document.createElement("table");      

    //Obtém o tamanho da borda
    var tableBorder;
    if  (!(border) ||  (border < 0)){
      tableBorder = 0;
    } else {
      tableBorder = border;
    }
    //Obtém a largura da tabela
    var tableWidth;
    if (!(width) || (width <= 0)){
      tableWidth = component.getWidth();
    } else {
      tableWidth = width;
    }
    //Obtém a altura da tabela
    var tableHeight;
    if (!(height) || (height <= 0)){
      tableHeight = component.getHeight();
    } else {
      tableHeight = height;
    }
    //Obtém o espaçamento entre as células
    var tableCellSpace;
    if (!(cellSpace) ||  (cellSpace < 0)){
      tableCellSpace = 0;
    } else {
      tableCellSpace = cellSpace;
    }      
    //Obtém o espaçamento para as bordas
    var tableCellPad;
    if (!(cellPad) ||  (cellPad < 0)){
      tableCellPad= 0;
    } else {
      tableCellPad= cellPad;
    }           

    //Altera os atributos da tabela
    table.setAttribute("id",id);
    table.setAttribute("name",id);
    table.setAttribute("width",tableWidth + "px");
    table.setAttribute("height",tableHeight + "px");

    table.setAttribute("border",tableBorder + "px");
    table.setAttribute("cellpadding",tableCellSpace);
    table.setAttribute("cellspacing",tableCellPad);
    if (borderColor)
      table.setAttribute("borderColor",borderColor);
    if (bgColor)
      table.setAttribute("bgColor",bgColor);                      


    var idCell, idRow, tr, td, cellList, cellText;
      
    for (indexRow = 0; indexRow < rowList.length; indexRow++){
      // Obtém o id da linha
      idRow = 'tr' + parseInt((Math.random() * 9999999));
      //Criar Elemento tr
      tr = document.createElement("tr");      

      //Altera os atributos da linha
      tr.setAttribute("id",idRow);

      cellList = rowList[indexRow];

      for ( indexCell = 0; indexCell < cellList.length; indexCell++){
        // Obtém o id da célula
        idCell = 'td' + parseInt((Math.random() * 9999999));
        //Criar Elemento td
        td = document.createElement("td");
        //Altera os atributos da célula
        td.setAttribute("id",idCell);
        if ((align == 'left') || (align == 'center') || (align == 'right'))
          td.setAttribute("align",align);
        if (cellBgColor)
          td.setAttribute("bgColor",cellBgColor );

        /*if (cellStyle)
          td.className = cellStyle;
                                       */                                       
      this._setStyle = function( object, styleText ) { 
       if( object.style.setAttribute ) { 
         object.style.setAttribute("cssText", styleText ); 
      } else { 
        object.setAttribute("style", styleText ); 
      } 
     }

    if (style) {    
      if (style.indexOf(":") == -1) {
        td.className = style;    
      } else {      
        this._setStyle(td, style); 
      }  
    }
        //Cria um elemento texto;
        //cellText = document.createTextNode(cellList[indexCell]);
        
        //Adiciona o texto na célula
        //td.appendChild(cellText);
        
        td.innerHTML = cellList[indexCell];

        //Adiciona a célula na linha
        tr.appendChild(td);
      }

      //Adiciona a linha na tabela
      tbody.appendChild(tr);
    }       

    table.appendChild(tbody);
    div.appendChild(table);
    if (scroll)
      div.style.overflow = "scroll";
    component.div.innerHTML = "";
    component.div.appendChild(div);
  }
}
```

---

## Tabela - Criar Tabela em uma Moldura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableCreate` |
| **Código** | 287 |
| **Assinatura** | `Tabela - Criar Tabela em uma Moldura (Formulário;Componente;Inteiro;Inteiro;Cor;Inteiro;Cor;Inteiro;Inteiro;Variante;Lógico): Letras` |
| **Parâmetros** | Formulário;Componente;Inteiro;Inteiro;Cor;Inteiro;Cor;Inteiro;Inteiro;Variante;Lógico |
| **Retorno** | Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Cria uma tabela em uma moldura.

Parâmetro(s):
1. Formulário.
2. Moldura. (Componente)
3. Largura da tabela. (Inteiro, Opcional)
4. Altura da tabela. (Inteiro, Opcional)
5. Cor do plano de fundo. (Cor, Opcional)
6. Largura da borda. (Inteiro, Opcional)
7. Cor da borda. (Cor, Opcional)
8. Espaçamento entre as células. (Inteiro, Opcional)
9. Espaçamento entre o texto e as bordas da célula. (Inteiro, Opcional)
10. Folha de estilo. (Variante, Opcional)
11. Barra de Rolagem? (Lógico, Opcional)

Retorno:
GUID da tabela. (Letras)

Observação:
O 10° parâmetro pode receber, por exemplo: "background-color: #000000".

### Código Servidor (Java)

```java
protected final Variant ebfHTMLTableCreate(Variant form, Variant componentName, Variant width, Variant height, Variant bgColor, Variant border, Variant borderColor, Variant cellSpace, Variant cellPad, Variant style, Variant scroll) throws Exception {
    return callClientFunction("ebfHTMLTableCreate",form, componentName, width, height, bgColor, border, borderColor, cellSpace, cellPad, style, scroll);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableCreate(form, componentName, width, height, bgColor, border, borderColor, cellSpace, cellPad, style, scroll){

  //Obtém a moldura
  var component = $c(componentName);

  // Verifica se existe a moldura
  if  (component){
  
    var div = getDiv(id, 0, 0, component.getWidth(), component.getHeight(), 1000010, true);

    // Obtém o id da tabela
    var id = 'table' + parseInt((Math.random() * 9999999));

    //Criar Elementos tbody e table
    var tbody = document.createElement("tbody");
    var table = document.createElement("table");

    //Obtém o tamanho da borda
    var tableBorder;
    if  (!(border) ||  (border < 0)){
      tableBorder = 0;
    } else {
      tableBorder = border;
    }

    //Obtém a largura da tabela
    var tableWidth;
    if (!(width) || (width <= 0)){
      tableWidth = component.getWidth();
    } else {
      tableWidth = width;
    }

    //Obtém a altura da tabela
    var tableHeight;
    if (!(height) || (height <= 0)){
      tableHeight = component.getHeight();
    } else {
      tableHeight = height;
    }


    //Obtém o espaçamento entre as células
    var tableCellSpace;
    if (!(cellSpace) ||  (cellSpace < 0)){
      tableCellSpace = 0;
    } else {
      tableCellSpace = cellSpace;
    }
 
    //Obtém o espaçamento para as bordas
    var tableCellPad;
    if (!(cellPad) ||  (cellPad < 0)){
      tableCellPad= 0;
    } else {
      tableCellPad= cellPad;
    }

    //Altera os atributos da tabela
    table.setAttribute("id",id);
    table.setAttribute("name",id);
    table.setAttribute("width",tableWidth + "px");
    table.setAttribute("height",tableHeight + "px");
    
    table.setAttribute("border",tableBorder + "px");
    table.setAttribute("cellpadding",tableCellSpace);
    table.setAttribute("cellspacing",tableCellPad);
    if (borderColor)
      table.setAttribute("borderColor",borderColor);
  
    if (bgColor)
      table.setAttribute("bgColor",bgColor);
                 
    this._setStyle = function( object, styleText ) { 
      if( object.style.setAttribute ) { 
        object.style.setAttribute("cssText", styleText ); 
      } else { 
        object.setAttribute("style", styleText ); 
      } 
    }

    if (style) {    
      if (style.indexOf(":") == -1) {
        table.className = style;    
      } else {      
        this._setStyle(table, style); 
      }  
    }
  
    table.appendChild(tbody);
    div.appendChild(table);
    if (scroll)
      div.style.overflow = "scroll";
    component.div.innerHTML = "";
    component.div.appendChild(div);

    document.ebfHTMLTable = id; 
    return id;
  }
}
```

---

## Tabela - Exibir Linha ou Célula

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTableColumnVisible` |
| **Código** | 514 |
| **Parâmetros** | Letras;Lógico |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro a linha ou a célula de uma tabela HTML e exibe ou oculta de acordo com o valor passado no segundo parâmetro.

Parâmetro(s):
1. Linha ou Célula da tabela HTML. (Letras)
2. Verdadeiro (para exibir), Falso (para ocultar). (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTableColumnVisible(idColumn, Visible){
  var cell = document.getElementById(idColumn);  
  if (Visible) {
    cell.style.display = "block";  
  }
  else {  
    cell.style.display = "none";    
  }  
}
```

---

## Tabela - Exibir ou Ocultar Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTableRowVisible` |
| **Código** | 519 |
| **Parâmetros** | Letras;Inteiro |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro o ID da linha de uma tabela HTML e exibe ou oculta a mesma de acordo com o valor passado no segundo parâmetro.

Parâmetro(s):
1. ID da linha da tabela HTML. (Letras)
2. Parâmetro para exibir ou ocultar a linha (1 - para exibir e 0 - para ocultar). (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTableRowVisible(idColumn, Visible){
  var cell = document.getElementById(idColumn);  
  if (Visible==1) {
    cell.style.display = "";  
  }
  else {  
    cell.style.display = "none";    
  }  
}
```

---

## Tabela - Inserir Célula em uma Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableCreateCell` |
| **Código** | 289 |
| **Assinatura** | `Tabela - Inserir Célula em uma Linha (Letras;Letras;Inteiro;Letras;Cor;Cor;Inteiro;Inteiro;Letras;Variante): Letras` |
| **Parâmetros** | Letras;Letras;Inteiro;Letras;Cor;Cor;Inteiro;Inteiro;Letras;Variante |
| **Retorno** | Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Insere uma célula em uma linha.

Parâmetro(s):
1. Formulário.
2. Linha. (Letras)
3. Largura da célula. (Inteiro, Opcional)
4. Alinhamento. (Letras, Opcional)
5. Cor do fundo. (Cor, Opcional)
6. Cor da borda. (Cor, Opcional)
7. Quantidade de linhas ocupadas. (Inteiro, Opcional)
8. Quantidade de colunas ocupadas. (Inteiro, Opcional)
9. Conteúdo. (Letras, Opcional)
10. Folha de estilo. (Variante, Opcional)

Retorno:
GUID da célula. (Letras)

Observações:
1. O 2° parâmetro é obtido com a função "Tabela - Inserir linha em uma tabela".
2. Para a utilização da função no servidor é necessário passar o parâmetro "Linha" em branco e ter utilizado  a função "Tabela - Inserir linha em uma tabela"  antes. A célula irá ser inserida na útima linha criada na tela.
3. Valores aceitos no 5° parâmetros:
       + left (Esquerda)
       + center (Centro)
       + right (Direita)
4. O 10° parâmetro pode receber, por exemplo: "background-color: #000000".

### Código Servidor (Java)

```java
protected final Variant ebfHTMLTableCreateCell(Variant form, Variant row, Variant width, Variant align, Variant bgColor, Variant borderColor, Variant rowspan, Variant colspan, Variant text, Variant style) throws Exception {
    return callClientFunction("ebfHTMLTableCreateCell", form, row, width, align, bgColor, borderColor, rowspan, colspan, text, style);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableCreateCell(form, row, width, align, bgColor, borderColor, rowspan, colspan, text, style){
                                  
  if (!row){
    if (document.ebfHTMLTableRow){
      row = document.ebfHTMLTableRow;
    }else{
      return;
    }  
  }

  //Obtém a linha
  var component = $w(row);

  // Verifica se existe a tabela
  if  (component){
    // Obtém o id da célula
    var id = 'td' + parseInt((Math.random() * 9999999));
  
    //Criar Elemento td
    var td = document.createElement("td");

    //Obtém a largura da célula
    var cellWidth;
    if ((width) && (width <= 0)){
       cellWidth= 1;
    } else {
       cellWidth= width;
    }

    //Altera os atributos da célula
    td.setAttribute("id",id);
    td.setAttribute("width",cellWidth); 

    if ((align == 'left') || (align == 'center') || (align == 'right'))
      td.setAttribute("align",align);
 
    if ((colspan) && (colspan > 1))
      td.setAttribute("colSpan",colspan);

    if ((rowspan) && (rowspan> 1))
      td.setAttribute("rowSpan",rowspan);

    if (borderColor)
      td.setAttribute("borderColor",borderColor);
 
    if (bgColor)
      td.setAttribute("bgColor",bgColor);

   /* if (style)
      td.className = style;
     */     
      this._setStyle = function( object, styleText ) { 
      if( object.style.setAttribute ) { 
        object.style.setAttribute("cssText", styleText ); 
      } else { 
        object.setAttribute("style", styleText ); 
      } 
    }

    if (style) {    
      if (style.indexOf(":") == -1) {
        td.className = style;    
      } else {      
        this._setStyle(td, style); 
      }  
    }
    //Cria um elemento texto;
    //var elementText = document.createTextNode(text);

    //Adiciona o texto na célula
    //td.appendChild(elementText);
    td.innerHTML = text;
  
    //Adiciona a célula na linha
    component.appendChild(td);
  
    return id;       
  }
}
```

---

## Tabela - Inserir Linha em uma Tabela

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableCreateRow` |
| **Código** | 288 |
| **Assinatura** | `Tabela - Inserir Linha em uma Tabela (Formulário;Letras;Cor;Cor;Variante): Letras` |
| **Parâmetros** | Formulário;Letras;Cor;Cor;Variante |
| **Retorno** | Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Insere uma linha em uma tabela.

Parâmetro(s):
1. Formulário.
2. Tabela. (Letras)
3. Cor de fundo. (Cor, Opcional)
4. Cor da borda. (Cor, Opcional)
5. Folha de estilo. (Variante, Opcional)

Retorno:
GUID da linha criada. (Letras)

Observações:
1. O parâmetro dois é o retorno da função "Tabela - Criar tabela em uma moldura"
2. Para a utilização da função no servidor é necessário passar o parâmetro "Tabela" em branco e ter utilizado a função "Tabela - Inserir linha em uma tabela"  antes. A linha irá ser inserida na útima tabela criada na tela.
3. O 5° parâmetro pode receber, por exemplo: "background-color: #000000".

### Código Servidor (Java)

```java
protected final Variant ebfHTMLTableCreateRow(Variant form, Variant table, Variant bgColor, Variant borderColor, Variant style) throws Exception {
    return callClientFunction("ebfHTMLTableCreateRow",form, table, bgColor, borderColor, style);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableCreateRow(form, table, bgColor, borderColor, style){

  //Obtém a tabela
  if (!table)
    if (document.ebfHTMLTable){
      table = document.ebfHTMLTable;
    }else{
      return;
    }
  var component = $w(table);               
 
  // Verifica se existe a tabela
  if  (component){ 
    var tbody = component.firstChild;
                     
    // Obtém o id da linha
    var id = 'tr' + parseInt((Math.random() * 9999999));
  
    //Criar Elemento tr
    var tr = document.createElement("tr");

    //Altera os atributos da linha
    tr.setAttribute("id",id);
 
    if (borderColor)
      tr.setAttribute("borderColor",borderColor);
 
    if (bgColor)
      tr.setAttribute("bgColor",bgColor);

    /*if (style)
      tr.className = style;*/         
     
    this._setStyle = function( object, styleText ) { 
      if( object.style.setAttribute ) { 
        object.style.setAttribute("cssText", styleText ); 
      } else { 
        object.setAttribute("style", styleText ); 
      } 
    }

    if (style) {    
      if (style.indexOf(":") == -1) {
        tr.className = style;    
      } else {      
        this._setStyle(tr, style); 
      }  
    }

    //Adiciona a linha na tabela
    tbody.appendChild(tr);
    document.ebfHTMLTableRow = id;
    return id;
  }
}
```

---

## Tabela - Obter Altura

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableGetHeight` |
| **Código** | 531 |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro o nome da tabela HTML e retorna a altura da mesma.

Parâmetro:
1. Nome da tabela. (Letras)

Retorno:
Altura da tabela. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableGetHeight(component) {
  var c = document.getElementById(component);
  return c.scrollHeight;
}
```

---

## Tabela - Obter Tamanho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableGetWidth` |
| **Código** | 535 |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função recebe como parâmetro o nome da tabela HTML e retorna o tamanho da mesma.

Parâmetro:
1. Nome da tabela. (Letras)

Retorno:
Tamanho da tabela HTML. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableGetWidth (table) {
  var t = document.getElementById(table);
  return t.scrollWidth;  
}
```

---

## Tabela - Obter Valor da Célula

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableCellGetValuex` |
| **Código** | 518 |
| **Parâmetros** | Letras |
| **Retorno** | Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o valor da célula passada como parâmetro.

Parâmetro:
1. Célula. (Letras)

Retorno:
Valor da célula. (Letras)

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableCellGetValuex (cell) {
	var c = document.getElementById(cell);
        return 	c.innerHTML;
}
```

---

## Tabela HTML - Alterar Folha de Estilo do Elemento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfTableChangeCSS` |
| **Código** | 396 |
| **Assinatura** | `Tabela HTML - Alterar Folha de Estilo do Elemento (Letras;Letras)` |
| **Parâmetros** | Letras;Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função altera a folha de estilo do elemento.

Parâmetro(s):
1. Elemento da tabela. (Letras)
2. Nome da nova folha de estilo. (Letras)

Retorno: 
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfTableChangeCSS(componente,estilo) {
     var componente = $w(componente);
     if(componente != null) {
       componente.className = estilo;
     }
}
```

---

## Tabela HTML - Alterar Valor da Celula

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableCellChangeValue` |
| **Código** | 492 |
| **Assinatura** | `Tabela HTML - Alterar Valor da Celula (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Alterar valor de uma célula da tabela.

Parâmetro(s):
1. GUID da Célula. (Letras)
2. Valor. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableCellChangeValue (cell,value) {
	var c = document.getElementById(cell);
	c.innerHTML = value;
}
```

---

## Tabela HTML - Alterar Valor da Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHTMLTableLineChangeValue` |
| **Código** | 493 |
| **Assinatura** | `Tabela HTML - Alterar Valor da Linha (Letras;Letras): Letras` |
| **Parâmetros** | Letras;Letras |
| **Retorno** | Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Alterar valor de uma linha da tabela.

Parâmetro(s):
1. GUID da Linha. (Letras)
2. Valor. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfHTMLTableLineChangeValue (line,value) {
	var l = document.getElementById(line);
	l.innerHTML = value;
}
```

---

## Tabela HTML - Associar Evento a Linha ou Célula

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfObjectEventAssociate` |
| **Código** | 395 |
| **Assinatura** | `Tabela HTML - Associar Evento a Linha ou Célula (Componente;Letras;Fluxo;Variante)` |
| **Parâmetros** | Componente;Letras;Fluxo;Variante |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função associa um evento no padrão W3C (DOM Events Specification) a uma linha ou célula de uma tabela criada
previamente com as funções da categoria Tabela.

Parâmetro(s):
1. GUID da linha ou GUID da célula. (Componente)
2. Descrição do evento. (Letras)
3. Fluxo que será executado quando o evento ocorrer. (Fluxo)
4. Lista com os parâmetros a serem passados para o fluxo. (Variante)

Retorno: 
Não possui.

Observações:
1. Caso o componente passado no primeiro parâmetro seja nulo, o evento é associado ao formulário.
2. O fluxo que será associado ao componente deve obrigatoriamente ser do tipo cliente.

Exemplo: 
Caso um fluxo de nome "Observador de eventos" precise ser chamado sempre que o usuário passar o mouse sobre um
 componente Texto chamado "MakerLabel1", a função ficaria:
   1º PARÂMETRO: Guid (Retorno das funções: Tabela - Inserir linha em uma tabela e Tabela - Inserir célula em uma tabela);
   2º PARÂMETRO: onmouseover (Letras);
   3º PARÂMETRO: Observador de eventos (Letras);
   4º PARÂMETRO: nulo;

### Código Cliente (JavaScript)

```javascript
var DOMEvent = new Array();

function ebfObjectEventAssociate(componente,evento,rule, ruleParams) {
          
     // Testa se o parâmetro do fluxo a ser executado é nulo
     if (typeof(ruleParams) == 'undefined' || ruleParams == null) {
            ruleParams = '';
     }
     
     var component = $w(componente);
     
     // Remove o 'on' do evento
     var startsWithOn = /^on(.+)/;
     var found = evento.match(startsWithOn);
     if (found != null && found != -1)
       evento = RegExp.$1;
       
     // Formata o nome do fluxo e define algumas variáveis
     var _ruleName = rule;
     var _params = ruleParams;
     var _sys = sysCode;
     var _formID = idForm;
     
     var func = function() {
       executeJSRuleNoField(_sys, _formID, _ruleName, _params);
     }
     
     DOMEvent[evento] = func;
     
     // Associa ao objeto
     addEvent(component,evento,func,true);
}
```

---

## Tabela HTML para Excel

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfHtmlTableToXls` |
| **Código** | 717 |
| **Assinatura** | `Tabela HTML para Excel (Variante;Variante;Letras;Letras)` |
| **Parâmetros** | Variante;Variante;Letras;Letras |
| **Tipo** | 24 |
| **Compatibilidade** | Cliente |

### Descrição

Transforma uma ou várias tabelas HTML para XLS.

Parâmetro(s): 
1. Lista de IDs das tabelas HTML. (Variante)
2. Lista de nomes das abas da tabela. (Variante)
3. Nome do arquivo. (Letras)
4. Nome da aplicação. (Letras)

Observações:
1. O 3º parâmetro deve conter o nome do arquivo seguido da extensão desejada.
2. O 4º parâmetro é o aplicativo que irá abrir o arquivo. Exemplo: Excel.
3. Ao abrir o arquivo pelo Excel, o aplicativo pode exibir uma mensagem de alerta informando que o 
conteúdo do arquivo é diferente da extensão (xls). Este comportamento é normal e se trata de uma 
melhoria do Excel para avisar ao usuário sobre possíveis conteúdos incompatíveis. Consultar link:
https://support.microsoft.com/en-us/kb/948615

### Código Cliente (JavaScript)

```javascript
function ebfHtmlTableToXls(tables, wsnames, wbname, appname){
  var uri = 'data:application/vnd.ms-excel;base64,'
  , tmplWorkbookXML = '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">'
    + '<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office"><Author>Axel Richter</Author><Created>{created}</Created></DocumentProperties>'
    + '<Styles>'
    + '<Style ss:ID="Currency"><NumberFormat ss:Format="Currency"></NumberFormat></Style>'
    + '<Style ss:ID="Date"><NumberFormat ss:Format="Medium Date"></NumberFormat></Style>'
    + '</Styles>'
    + '{worksheets}</Workbook>'
  , tmplWorksheetXML = '<Worksheet ss:Name="{nameWS}"><Table>{rows}</Table></Worksheet>'
  , tmplCellXML = '<Cell{attributeStyleID}{attributeFormula}><Data ss:Type="{nameType}">{data}</Data></Cell>'
  , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
  , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  var ctx = "";
  var workbookXML = "";
  var worksheetsXML = "";
  var rowsXML = "";

  for (var i = 0; i < tables.length; i++) {
    if (!tables[i].nodeType) tables[i] = document.getElementById(tables[i]);
    for (var j = 0; j < tables[i].rows.length; j++) {
      rowsXML += '<Row>'
      for (var k = 0; k < tables[i].rows[j].cells.length; k++) {
        var dataType = tables[i].rows[j].cells[k].getAttribute("data-type");
        var dataStyle = tables[i].rows[j].cells[k].getAttribute("data-style");
        var dataValue = tables[i].rows[j].cells[k].getAttribute("data-value");
        dataValue = (dataValue)?dataValue:tables[i].rows[j].cells[k].innerHTML;
        var dataFormula = tables[i].rows[j].cells[k].getAttribute("data-formula");
        dataFormula = (dataFormula)?dataFormula:(appname=='Calc' && dataType=='DateTime')?dataValue:null;
        ctx = {  attributeStyleID: (dataStyle=='Currency' || dataStyle=='Date')?'ss:StyleID="'+dataStyle+'"':''
               , nameType: (dataType=='Number' || dataType=='DateTime' || dataType=='Boolean' || dataType=='Error')?dataType:'String'
               , data: (dataFormula)?'':dataValue
               , attributeFormula: (dataFormula)?' ss:Formula="'+dataFormula+'"':''
              };
        rowsXML += format(tmplCellXML, ctx);
      }
      rowsXML += '</Row>'
    }
    ctx = {rows: rowsXML, nameWS: wsnames[i] || 'Sheet' + i};
    worksheetsXML += format(tmplWorksheetXML, ctx);
    rowsXML = "";
  }

  ctx = {created: (new Date()).getTime(), worksheets: worksheetsXML};
  workbookXML = format(tmplWorkbookXML, ctx);
  var link = document.createElement("a");
  link.download = wbname;
  link.href = uri + base64(workbookXML);
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
};
```

---

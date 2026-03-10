# Funções Nativas - Grade

Total: **77** funções

[← Voltar para Funções Nativas](README.md)

---

## Grade - Abrir Configurações do Agrupamento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridOpenGroupConfig` |
| **Código** | 834 |
| **Assinatura** | `Grade - Abrir Configurações do Agrupamento (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Abre o menu de configurações do agrupamento.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Não possui.

Observação:
É necessário habilitar "Agrupamento Múltiplo" nas opções de Agrupamento.

### Código Cliente (JavaScript)

```javascript
function ebfGridOpenGroupConfig (grid) {
  var gridObj = $c(grid);
  if (!gridObj)
    throw "Componente "+grid+" não encontrado";    

    gridObj.openGroupConfig();
}
```

---

## Grade - Adicionar Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridAddColumn` |
| **Código** | 143 |
| **Assinatura** | `Grade - Adicionar Coluna(Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Adiciona uma coluna na grade, informando o nome da grade e o nome da coluna que será adicionada.

Parâmetro:
1. Nome da Grade. (Componente)
2. Nome da Coluna a ser adicionada. (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridAddColumn(grid, column) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  //grid.addColumn(column);  
  grid.timeout(grid.addColumn, 0, [column]);
}
```

---

## Grade - Agrupar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGroup` |
| **Código** | 835 |
| **Assinatura** | `Grade - Agrupar (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Agrupa a grade a partir de uma coluna, informando o nome da grade e o nome da coluna que será agrupada.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna a ser agrupada. (Letras)

Retorno:
Não possui.

Observações:
1. Ao passa uma coluna para ser agrupada e a mesma já constar no agrupamento, a operação vai ser ignorada.
2. Ao utilizar essa função, a mesma vai levar em consideração a propriedade "Múltiplos Grupos".

### Código Cliente (JavaScript)

```javascript
function ebfGridGroup(gridName, column) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.group(column);
}
```

---

## Grade - Alterar Alinhamento de uma Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetAlignColumn` |
| **Código** | 961 |
| **Assinatura** | `Grade - Alterar Alinhamento de uma Coluna (Componente;Letras;Letras)` |
| **Parâmetros** | Componente;Letras;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função alterar o alinhamento de um coluna.

Parâmetro(s):
1. Nome do Componente. (Letras)
2. Nome da Coluna. (Letras)
3. Alinhamento. (Letras)

Retorno:
Não possui.

Observações:
1. No terceiro parâmetro aceita os seguintes valores para alinhamento do conteúdo:
D (Direita)
E (Esquerda)
C (Centro)
2. Essa função não tem aplicabilidade quando o componente está em modo de inclusão ou edição.

### Código Cliente (JavaScript)

```javascript
function ebfGridSetAlignColumn(comp, nameColumn, align) {
  let component = $c(comp);
  if (component) {
    if (!component.inserting && !component.editing) {    
      const aligns = { "C": "center", "D": "right", "E": "left" };
      if (align && aligns[align]) {
        let idx = component.iscCanvas.getFieldNum(component.getRealNameColumn(nameColumn));
        if (idx >= 0) {          
          component.iscCanvas.setFieldProperties(idx, { 'align': aligns[align] });
          component.iscCanvas.markForRedraw();
        } else {
          handleException(getLocaleMessage('INFO.GRID_COLUMN_NOT_FOUND', nameColumn, comp));
          return;
        }
      } else {
        console.error("O valor informado para alinhamento não suportado");
        return;
      }
    } else {
      console.error("O componente " + comp + " não pode está em modo de inclusão/edição");
      return;
    }
  } else {
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', comp));
    return;
  }
}
```

---

## Grade - Alterar Altura das Linhas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetCellHeight` |
| **Código** | 962 |
| **Assinatura** | `Grade - Alterar Altura das Linhas (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função altera a altura das linhas do componente grade de acordo o valor especificado por parâmetro.

Parâmetro(s):
1. Componente Grade.
2. Altura. (Inteiro) (Ver observação 2)

Retorno:
Não possui.

Observações:
1. Essa função altera altura do cabeçalho, filtro e células.
2. O componente possui limites para a definição de altura das células, sendo assim, o valor mínimo permitido para a altura da linha é 24 e o valor máximo permitido 35.

### Código Cliente (JavaScript)

```javascript
function ebfGridSetCellHeight (comp, height) {
  const component = $c(comp);
  if (!component) {
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', comp));
    return false;
  }
  if (height) {    
    height = parseInt(height); 
    if (isNaN(height)) {
      console.error("O valor informado no segundo parâmetro não é um inteiro válido");
      return;
    }
    const max_height = 35; //Altura padrão do componente.
    const min_height = 24; //Altura mínima para o componente.
    if (height > max_height) height = max_height;
    else if (height < min_height) height = min_height;  
    component.iscCanvas.setHeaderHeight(height);
    component.iscCanvas.setCellHeight(height);
    if (component.enableSimpleFilter) component.iscCanvas.filterEditor.setHeight(height);
  }
}
```

---

## Grade - Alterar Cor na Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetColor` |
| **Código** | 333 |
| **Assinatura** | `Grade - Alterar Cor na Linha (Formulário;Componente;Inteiro;Cor;Variante)` |
| **Parâmetros** | Formulário;Componente;Inteiro;Cor;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera a cor de uma linha da grade ou apenas algumas colunas da grade.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Componente Grade que se deseja mudar a cor. 
3. Linha que deve ser alterada (N -1). (Inteiro)
4. Cor desejada. (Cor)
5. Lista contendo as colunas que devem ser pintadas. (primeira coluna é 0 (N-1)). (Variante)

Retorno:
Não possui.

Observação:
Caso o parâmetro 5 seja definido como Nulo, então toda a linha será pintada.

### Código Servidor (Java)

```java
protected final Variant ebfGridSetColor(Variant form, Variant component, Variant line, Variant color, Variant columns) throws Exception {
    return callClientFunction("ebfGridSetColor", form, component, line, color, columns);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGridSetColor(form, gridName, line, color, columns) {
  var gridObj = $c(gridName, form);
  if (!gridObj) {
    handleException(new Error("Grid \"" + gridName + "\" not found."));
    return;
  }  
  line = parseInt(line);
  var jCond = {};
  jCond.color = color;
  jCond.row = line;  
  if (columns != null && columns.length > 0) {
    jCond.colsPaint = columns;
  }

  gridObj.conditionExpressionFlow.push(jCond);
  gridObj.iscCanvas.markForRedraw();
}
```

---

## Grade - Alterar Modo do Filtro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetFilterMode` |
| **Código** | 890 |
| **Assinatura** | `Grade - Alterar Modo do Filtro (Formulário;Componente;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função modifica o modo de filtro do componente grade.

Parâmetro(s):
1. Formulário. 
2. Componente Grade.
3. Modo (inClient/inServer). (Letras)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridSetFilterMode (form, comp, mode) {
  let grid = $c(comp);
  if (grid) {
    if(grid.enableSimpleFilter && mode && mode.length > 0){
      mode = mode.toUpperCase();
      mode = mode === 'INCLIENT' ? 0 : mode === 'INSERVER' ? 1 : 0;
      grid.filterMode = mode;
    }
  } else {
    handleException(new Error('Componente ' + comp + ' não encontrado'));
    return false;
  }
}
```

---

## Grade - Alterar Posição da Barra de Rolagem -Vert.

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridChangeScrollTopValue` |
| **Código** | 260 |
| **Assinatura** | `Grade - Alterar Posição da Barra de Rolagem -Vert. (Formulário;Componente;Inteiro)` |
| **Parâmetros** | Formulário;Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Altera a posição da barra de rolagem Vertical em relação ao topo da grade.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)
3. Novo valor da distância da barra vertical. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridChangeScrollTopValue(form, com, value){
  if(com){
    var grid = $c(com);
    if(grid.scrollTop){
      grid.scrollTop(value);
    } 
  }
}
```

---

## Grade - Alterar Posição da Barra de Rolagem-Horiz.

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridChangeScrollLeftValue` |
| **Código** | 258 |
| **Assinatura** | `Grade - Alterar Posição da Barra de Rolagem-Horiz. (Formulário;Componente;Inteiro)` |
| **Parâmetros** | Formulário;Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Altera a posição da barra de rolagem Horizontal em relação à extremidade esquerda da grade.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)
3. Posição da Barra de Rolagem. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridChangeScrollLeftValue(form, com, value){
  if(com){
    var grid = $c(com);
    if(grid.scrollLeft){
      grid.scrollLeft(value);
    } 
  }
}
```

---

## Grade - Alterar Valor de um Componente CheckBox

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetCheckValue` |
| **Código** | 351 |
| **Assinatura** | `Grade - Alterar Valor de um Componente CheckBox (Componente;Inteiro;Letras;Inteiro)` |
| **Parâmetros** | Componente;Inteiro;Letras;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera o valor do CheckBox na grade.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Número da Linha. (Inteiro)
3. Nome da Coluna que existe componente CheckBox. (Letras)
4. Valor inteiro (0 - Desmarcar, 1 - Marcar,  2 - Nulo). (Inteiro)

Retorno:
Não possui.

Observação:
Não possui interação com o banco de dados, ou seja, só modifica o valor na grade, porém o conteúdo no banco continua
sendo o mesmo.

### Código Servidor (Java)

```java
protected final Variant ebfGridSetCheckValue(Variant grid, Variant row, Variant column, Variant value) throws Exception {
    return callClientFunction("ebfGridSetCheckValue", grid, row, column, value);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGridSetCheckValue (grid, row, column, value) {  
  if (value == 0 || value == 1 || value == 2) {
    var cgrid = $c(grid);
    var idx = cgrid.iscCanvas.showRowNumbers ? (cgrid.findColumn(column)-1) : cgrid.findColumn(column);
    var com = cgrid.components[idx];
    var compCheck = "componentCheck"+com;
    if (cgrid.isGrouped()) row = cgrid.getRowDBCursor();
    cgrid.data[row][cgrid.getRealNameColumn(column)] = cgrid.gridCheckBox(value, cgrid[compCheck]['valueCheck'], cgrid[compCheck]['valueUnCheck'], com, row, null, null);
    cgrid.refreshData();    
  }
}
```

---

## Grade - Alterar largura das colunas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridModifyColumnsWidth` |
| **Código** | 354 |
| **Assinatura** | `Grade - Alterar largura das colunas (Formulário;Componente;Variante;Variante)` |
| **Parâmetros** | Formulário;Componente;Variante;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Altera a largura de uma ou mais colunas de uma grade.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)
3. Lista com os nomes das colunas vão ser modificadas. (Variante)
4. Lista contendo os valores da largura das colunas. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridModifyColumnsWidth(formName, gridName, columnList, widthList) {
  var grid = $c(gridName);
  if(!grid){
    handleException(new Error("Componente "+gridName+" não encontrado"));
    return;
  }
  grid.setSizeColumns(columnList, widthList);
}
```

---

## Grade - Atribuir Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetValue` |
| **Código** | 136 |
| **Assinatura** | `Grade - Atribuir Valor(Componente;Inteiro;Letras;Letras)` |
| **Parâmetros** | Componente;Inteiro;Letras;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Atribui um valor para a coluna especificada no 3º parâmetro.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Número da Linha (De 0 à N-1). (Inteiro)
3. Nome da Coluna. (Letras)
4. Valor a ser atribuído. (Letras)

Retorno:
Não possui.

Observação:
É necessário que o componente Grade informado esteja em modo normal.

### Código Cliente (JavaScript)

```javascript
function ebfGridSetValue(grid, row, column, value) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.setCellDataByColumn(row, column, value);
}
```

---

## Grade - Atribuir Valor Sem Refresh

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetValueNoRefresh` |
| **Código** | 331 |
| **Assinatura** | `Grade - Atribuir Valor Sem Refresh(Componente;Inteiro;Letras;Letras)` |
| **Parâmetros** | Componente;Inteiro;Letras;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Atribui um valor para a coluna especificada no 3º parâmetro. O valor atribuído não será exibido até que a função
"Grade - Dar Refresh" seja utilizada na grade que teve o valor da coluna atribuído.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Número da Linha (De 0 à N-1). (Inteiro)
3. Nome da Coluna. (Letras)
4. Valor a ser atribuído. (Letras)

Retorno:
Não possui.

Observação:
É necessário que o componente Grade informado esteja em modo normal.

### Código Cliente (JavaScript)

```javascript
function ebfGridSetValueNoRefresh(grid, row, column, value) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 

  grid.data[row][grid.iscCanvas.getAllFields()[grid.findColumn(column)].name] = value;
}
```

---

## Grade - Checkbox Marcar Todos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetAllCheckValue` |
| **Código** | 394 |
| **Assinatura** | `Grade - Checkbox Marcar Todos (Componente;Letras;Inteiro)` |
| **Parâmetros** | Componente;Letras;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Altera o valor de todos os  CheckBoxes de uma coluna da grade.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna que se encontra o componente CheckBox. (Letras)
3. Valor inteiro (0 - Desmarcar, 1- Marcar, 2 - Neutro). (Inteiro)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfGridSetAllCheckValue(Variant grid, Variant column, Variant value) throws Exception {
  return callClientFunction("ebfGridSetAllCheckValue", grid, column, value);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGridSetAllCheckValue(grid, column, value) {  
  var totalRows = ebfGridRowCount(grid);
  if (totalRows > 0) {    
    var cgrid = $c(grid);    
    var idx = cgrid.iscCanvas.showRowNumbers ? (cgrid.findColumn(column)-1) : cgrid.findColumn(column)
    var com = cgrid.components[idx];
    var compCheck = "componentCheck"+com;     
    var counter = 0;
    while (counter < totalRows){
      cgrid.data[counter][cgrid.getRealNameColumn(column)] = cgrid.gridCheckBox(value, cgrid[compCheck]['valueCheck'], cgrid[compCheck]['valueUnCheck'], com, counter+1, null, null);     
      counter++
    }    
    cgrid.refreshData();
  }
}
```

---

## Grade - Congelar Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridFreezeColumn` |
| **Código** | 997 |
| **Assinatura** | `Grade - Congelar Coluna (Formulário;Componente;Letras;Lógico)` |
| **Parâmetros** | Formulário;Componente;Letras;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função tem como objetivo congelar uma coluna da grade de acordo com os valores passados por parâmetros.

Parâmetro(s): 
1. Formulário.
2. Nome da Grade. (Componente)
3. Nome da Coluna. (Letras)
4. Congelar? (Lógico)

Retorno:
Não possui.

Observação:
Quando informado o valor lógico falso no quarto parâmetro, a coluna será descongelada.

### Código Cliente (JavaScript)

```javascript
function ebfGridFreezeColumn(pForm, nameGrid, nameColumn, freeze) {  
  var grade = $c(nameGrid);
  if (!grade) {
    handleException(new Error(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", nameGrid)));
    return;
  }
  if (grade.findColumn(nameColumn) == -1) {
    handleException(new Error(getLocaleMessage("INFO.GRID_COLUMN_NOT_FOUND", nameGrid, nameColumn)));
	return;
  }
  let realNameColumn = grade.getRealNameColumn(nameColumn);  
  if (parseBoolean(freeze)) grade.freezeColumn(nameColumn);
  else if (grade.iscCanvas.fieldIsFrozen(realNameColumn)) grade.unfreezeColumn(nameColumn);
}
```

---

## Grade - Criar Dependência entre Grades

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridCreateDependence` |
| **Código** | 249 |
| **Assinatura** | `Grade - Criar Dependência entre Grades(Componente, Componente, Letras)` |
| **Parâmetros** | Componente;Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Cria relação de dependência entre duas grades.

Parâmetro(s):
1. Grade Pai. (Componente)
2. Grade Filha. (Componente)
3. Filtro de ligação. (Letras) 

Retorno:
Não possui.

Observação:
No terceiro parâmetro o formato do filtro é: 
<Tabela da Grid Filha>.<Campo 1 da Grid Filha>=<Campo da Grid Master>
[;<Tabela da Grid Filha>.<Campo 2 da Grid Filha>=<Campo da Grid Master>[;<Tabela da Grid Filha>.
<Campo N da Grid Filha>=<Campo da Grid Master>]].

Exemplo:
1) TB_FILHA.CAMPO_FILHA=CAMPO_MASTER
2) TB_CIDADE.COD_PAIS=COD_PAIS
3) TB_CIDADE.COD_PAIS=COD_PAIS;TB_CIDADE.COD_CIDADE=COD_CIDADE

### Código Cliente (JavaScript)

```javascript
function ebfGridCreateDependence(grid1, grid2, filter) {
  $c(grid1).gridSelectRowMaster = true;
  $c(grid1).addDependentGrid(grid2, filter);
}
```

---

## Grade - Dar Refresh

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridRefreshInClient` |
| **Código** | 827 |
| **Assinatura** | `Grade - Dar Refresh (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Atualiza o componente grade com os dados que já estão carregado em uma tabela (ResultSet) no servidor.

Parâmetro:
1. Nome da Grade. (Letras)

Retorno:
Não possui.

Observação:
Esta função não atualiza a grade com os dados correntes do banco de dados e sim de uma tabela já carregada por uma consulta (cache) na primeira carga da grade. Para atualizar com dados corrente do banco, utilize a função "Atualizar Componente" ou "Grade - Recarregar Dados".

### Código Cliente (JavaScript)

```javascript
function ebfGridRefreshInClient (grid) {
  var comp = $c(grid);
  if(!comp){
    handleException(new Error("Componente " + grid + " não encontrado."));
    return false;
  }
  comp.actRefresh = true;
  comp.refreshData();
}
```

---

## Grade - Desabilitar Componente Grade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDisableGrid` |
| **Código** | 478 |
| **Assinatura** | `Grade - Desabilitar Componente Grade (Componente;Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Desabilita o componente grade passado por parâmetro.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Desabilitar? (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfDisableGrid() {
  if (existArgs(arguments)) {     
    var componentGrid = $c(arguments[0]);    
    var disable = parseBoolean(arguments[1]);
    if (!componentGrid)
      return handleException(new Error('Componente '+ arguments[0] + ' não encontrado.'));      
    componentGrid.iscCanvas.setDisabled(disable);      
    componentGrid.setEnabled(!disable);      
    
  }
  return null;
}
```

---

## Grade - Desagrupar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridUngroup` |
| **Código** | 836 |
| **Assinatura** | `Grade - Desagrupar (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Desagrupa a grade a partir de uma coluna, informando o nome da grade e o nome da coluna que será desagrupada.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna. (Letras, Opcional)

Retorno:
Não possui.

Observação:
Caso o nome da coluna não seja passada, todos os agrupamentos serão removidos.

### Código Cliente (JavaScript)

```javascript
function ebfGridUngroup(gridName, column) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.ungroup(column);
}
```

---

## Grade - Em que Modo está?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfWhatIsGridModeStatus` |
| **Código** | 278 |
| **Assinatura** | `Grade - Em que Modo está? (Componente): Letras` |
| **Parâmetros** | Componente |
| **Retorno** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Verifica o estado da grade passada por parâmetro, retornando 'I' caso esteja em modo de inserção, 'A' caso esteja em 
modo de edição, ou 'N' se não for nenhum dos dois casos.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno: 
Retorna a letra (' I ', ' A ' ou ' N ') correspondente ao modo da grade. (Letras)

Exemplo: 
Assumindo que o nome da grade é: "Grade Estados do Brasil" e a mesma encontra-se em modo de inserção.
Ao chamar o fluxo o retorno será ' I '.

### Código Cliente (JavaScript)

```javascript
function ebfWhatIsGridModeStatus(grid) {
  var grid = $c(grid);
  if (!grid) throw "Componente " + grid + " não encontrado";
  if (grid.editing) return 'A';
  else if (grid.inserting) return 'I';
  else return 'N';
}
```

---

## Grade - Encontrar Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridFindColumn` |
| **Código** | 141 |
| **Assinatura** | `Grade - Encontrar Coluna(Componente;Letras):Inteiro` |
| **Parâmetros** | Componente;Letras |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função encontra a posição da coluna na grade.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna. (Letras)

Retorno: 
Retorna a posição da coluna. Se a coluna for a primeira da Grade retorna o valor 0, se for a segunda retorna 1 
e assim sucessivamente. (Inteiro)

Observações: 
1. A numeração das colunas começam de 0 à N.
2. Caso a coluna não seja encontrada, será retornado o valor -1.

Exemplo: 
Assumindo que o nome da grade é "Lista de Produtos" e o nome da coluna sendo "Informática". Passando esses 
parâmetros, será  verificado em que posição a coluna "Informática"  está na grade "Lista de Produtos".

### Código Cliente (JavaScript)

```javascript
function ebfGridFindColumn(grid, column) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";
  try {   
    return grid.findColumn(column);
  } catch(e) {
    return -1;
  }  
}
```

---

## Grade - Entrar em Modo de Edição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEditableEdit` |
| **Código** | 943 |
| **Assinatura** | `Grade - Entrar em Modo de Edição (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Entra em modo de edição com a grade.

Parâmetro:
1. Nome da Grade. (Letras)

Retorno:
Não possui.

Observações:
1. Só funciona se a grade não estiver em modo de inserção.
2. A grade precisa estar com uma linha selecionada, caso contrario, entrará em modo de edição com a primeira linha.

### Código Cliente (JavaScript)

```javascript
function ebfGridEditableEdit(gridName) {
  var grid = $c(gridName);
  if (!grid) throw "Componente " + gridName + " não encontrado";
  if (grid.editable) {
    if (!(grid.editing || grid.inserting)) {
      if (!grid.nav) grid.nav = { };
      if (!grid.nav.btEdit) grid.nav.btEdit = { };
      grid.timeout(grid.edit, 0);
    }
  } else {
    if (grid.callForm) {
      if (!grid.enabled || grid.readOnly || !grid.parentHasData) return;
      var gridrn = grid.currentRow;
      if (gridrn > grid.data.length - 1) gridrn = -2;
      var left = (screen.width - grid.formWidth) / 2;
      var top = (screen.height - grid.formHeight) / 2;
      var gt = 1 + parseInt(gridrn) + parseInt(grid.gridini);
      if (gt > 0) MM_openBrWindow('form.jsp?sys=' + grid.sys + '&action=openform&formID=' + grid.formCode + '&align=1&mode=2&goto=' + gt + '&filter=&onClose=opener.d.c_' + grid.code + '.refreshPage()', grid.formCode, 'toolbar=no,location=no,status=yes,menubar=no,scrollbars=no,resizable=no,width=' + grid.formWidth + ',height=' + grid.formHeight + ',left=' + left + ',top=' + top);
    }
  }
}
```

---

## Grade - Entrar em Modo de Inserção

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEditableInclude` |
| **Código** | 944 |
| **Assinatura** | `Grade - Entrar em Modo de Inserção (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Entra em modo de inserção com a grade.

Parâmetro:
1. Nome da Grade. (Letras)

Retorno:
Não possui.

Observação:
A grade não pode estar em modo de edição.

### Código Cliente (JavaScript)

```javascript
function ebfGridEditableInclude(gridName) {
  var grid = $c(gridName);
  if (!grid) throw "Componente " + gridName + " não encontrado";
  if (grid.editable) {
    if (!grid.nav) grid.nav = { };
    if (!grid.nav.btInclude) grid.nav.btInclude = { };
    grid.timeout(grid.include, 0);
  } else {
    if (grid.callForm) {
      if (!grid.enabled || grid.readOnly || !grid.parentHasData) return;
      var gridrn = grid.currentRow;
      if (gridrn > grid.data.length - 1) gridrn = -2;
      var left = (screen.width - grid.formWidth) / 2;
      var top = (screen.height - grid.formHeight) / 2;
      var gt = 1 + parseInt(gridrn) + parseInt(grid.gridini);
      MM_openBrWindow('form.jsp?sys=' + grid.sys + '&action=openform&formID=' + grid.formCode + '&align=1&mode=1&goto=' + gt + '&filter=&onClose=opener.d.c_' + grid.code + '.refreshPage()', grid.formCode, 'toolbar=no,location=no,status=yes,menubar=no,scrollbars=no,resizable=no,width=' + grid.formWidth + ',height=' + grid.formHeight + ',left=' + left + ',top=' + top);
    }
  }
}
```

---

## Grade - Está Agrupada?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridIsGrouped` |
| **Código** | 837 |
| **Assinatura** | `Grade - Está Agrupada? (Componente): Lógico` |
| **Parâmetros** | Componente |
| **Retorno** | Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Retorna se existe agrupamento na grade ou não.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Valor referente à existência do agrupamento. (Lógico)

### Código Cliente (JavaScript)

```javascript
function ebfGridIsGrouped(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";    
  return grid.isGrouped();
}
```

---

## Grade - Excluir Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEditableDeleteRow` |
| **Código** | 263 |
| **Assinatura** | `Grade - Excluir Registro (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Exclui o registro selecionado da grade editável passada como parâmetro.

Parâmetro:
1. Nome da Grade. (Letras)

Retorno:
Não possui

Observação:
O registro a ser excluído, precisa estar previamente selecionado.

### Código Cliente (JavaScript)

```javascript
function ebfGridEditableDeleteRow(grid) {
	  var grid = $c(grid);
	  if (!grid)
	    throw "Componente "+grid+" não encontrado"; 
	  if (!(grid.editing || grid.inserting)){
		if (!grid.editable){  
	      if (!grid.nav) grid.nav = {};  
		  if (!grid.nav.btDelete) grid.nav.btDelete = {};  
	    }		  
		var edt = grid.editable;
		grid.editable = true;
		try {
	      grid.deleteRow();
		} finally {
	      grid.editable = edt;
		}
	  }               
	}
```

---

## Grade - Executar Fluxo ao Paginar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGrigExecuteFlowOnPage` |
| **Código** | 449 |
| **Assinatura** | `Grade - Executar Fluxo ao Navegar (Formulário;Componente;Fluxo;Variante)` |
| **Parâmetros** | Formulário;Componente;Fluxo;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Executa um fluxo ao utilizar a navegação do componente Grade.

Parâmetro(s):
1.  Formulário onde se encontra a grade.
2. Nome da Grade. (Componente) 
3. Fluxo que será associado à grade. (Fluxo)
4. Lista de parâmetros do fluxo (parâmetro 3). (Variante)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfGrigExecuteFlowOnPage(Variant form, Variant componentName, Variant ruleName, Variant ruleParams) throws Exception {
  return callClientFunction("ebfGrigExecuteFlowOnPage", form, componentName, ruleName, ruleParams);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGrigExecuteFlowOnPage(form, componentName, ruleName, ruleParams) {
  var component = $c(componentName, form);
  if ((component instanceof HTMLGrid) && (component.paging)) {
    var localRuleName = ruleName;
    var localRuleParams = ruleParams;
    component.paging.onnavigate = function() {
      ebfFlowExecute(localRuleName, localRuleParams);
    };
  }
}
```

---

## Grade - Expandir Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridOpenGroup` |
| **Código** | 838 |
| **Assinatura** | `Grade - Expandir Grupo (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Expande um grupo passado como parâmetro.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome do Grupo ou Objeto do Grupo. (Letras) (Ver Observação 1)

Retorno:
Não possui.

Observações:
1. Pode ser passado tanto o nome referente ao grupo, quanto o próprio Objeto do grupo, obtido através de regras de negócio.
2. Expande apenas grupos presentes da raiz, ou seja, subgrupos não são expandidos. 

Exemplo:
Imagine uma árvore seguindo o princípio de pai (grupo) e filho (subgrupo) da seguinte forma:
{
  "grupo1": {
    "subgrupo1": "valor1"
  },
  "grupo2": {
    "subgrupo2": "valor2"
  }
}
Apenas os grupos "grupo1" e "grupo2" podem ser expandidos (abertos).

### Código Cliente (JavaScript)

```javascript
function ebfGridOpenGroup(gridName, group) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.openGroup(group);
}
```

---

## Grade - Expandir Todos os Grupos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridOpenAllGroups` |
| **Código** | 839 |
| **Assinatura** | `Grade - Expandir Todos os Grupos (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Expande todos os grupos e subgrupos existentes na Grade.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridOpenAllGroups(gridName) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.openAllGroups();
}
```

---

## Grade - Exportar Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridExportData` |
| **Código** | 998 |
| **Assinatura** | `Grade - Exportar Dados (Formulário;Componente;Letras)` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função exporta dados uma grade de acordo com o formato passado no último parâmetro.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Componente Grade. 
3. Formato de Exportação. (Letras)

Retorno: 
Não possui.

Observação:
Só será possível a exportação dos seguintes formatos:
    "XLS" - Excel
    "HTML" - Html
    "JSON" - Json
    "LST" - Listagem
    "PDF" - PDF
    "TXT" - Texto
    "XML" - XML

Exemplo: 
Assumindo o terceiro parâmetro "PDF", será exportado os resultados da grade em formato PDF.

### Código Cliente (JavaScript)

```javascript
function ebfGridExportData(pForm, nameGrid, format) {  
  var grade = $c(nameGrid);
  if(!grade){
    handleException(new Error(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND",nameGrid)));
    return;
  }
  if (format) format = format.toUpperCase();
  grade.exportData(format);
}
```

---

## Grade - Fechar Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridCloseGroup` |
| **Código** | 840 |
| **Assinatura** | `Grade - Fechar Grupo (Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Fecha um grupo passado por parâmetro.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome do Grupo ou Objeto do Grupo. (Letras)

Retorno:
Não possui.

Observações:
1. Pode ser passado tanto o nome referente ao grupo, quanto o próprio Objeto do grupo, obtido através de regras de 
negócio.
2. Fecha apenas grupos presentes da raiz, ou seja, subgrupos não são fechados. 

Exemplo:
Imagine uma árvore seguindo o princípio de pai (grupo) e filho (subgrupo) da seguinte forma:
{
  "grupo1": {
    "subgrupo1": "valor1"
  },
  "grupo2": {
    "subgrupo2": "valor2"
  }
}
Apenas os grupos "grupo1" e "grupo2" podem ser fechados.

### Código Cliente (JavaScript)

```javascript
function ebfGridCloseGroup(gridName, group) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.closeGroup(group);
}
```

---

## Grade - Fechar Todos os Grupos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridCloseAllGroups` |
| **Código** | 841 |
| **Assinatura** | `Grade - Fechar Todos os Grupos (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Fecha todos os grupos e subgrupos existentes na Grade.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridCloseAllGroups(gridName) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.closeAllGroups();
}
```

---

## Grade - Filtrar Grade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridFilter` |
| **Código** | 251 |
| **Assinatura** | `Grade - Filtrar Grade(Componente, Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Filtra um componente grade de acordo com a condição passada.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Filtro de ligação. (Letras) (Ver observação 1)

Retorno:
Não possui.

Observações:
1. O segundo parâmetro deve estar no formato: <Tabela da Grid>.<Campo 1 da Grid>=<Valor>[;<Tabela da Grid>.<Campo 2 da Grid >=<valor>
[;<Tabela da Grid>.<Campo N da Grid>=<valor>]].
2. O único operador que pode ser utilizado como filtro é o operador "=" (igual).
3. Para utilizar tipos específicos de dados como data, o valor deve ser concatenado com algumas constantes.
Os tipos possíveis são: long, double, boolean, date, timestamp.

Exemplos: 
1. TB_FILHA.CAMPO_FILHA=Teste
2. TB_CIDADE.COD_PAIS=55
3. TB_CIDADE.COD_PAIS=55;TB_CIDADE.COD_CIDADE=856
4. TABELA.CAMPO = 05/12/2009@date

### Código Cliente (JavaScript)

```javascript
function ebfGridFilter(grid, filter) {
  const comp = $c(grid);
  if(!comp) {
    handleException(new Error("Componente " + grid + " não encontrado"));
    return;
  }
  if (comp.isFiltered)
    comp.iscCanvas.clearCriteria();
  comp.filter(filter);  
  comp.actRefresh = true;
}
```

---

## Grade - Gravar Registro

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEditablePost` |
| **Código** | 262 |
| **Assinatura** | `Grade - Gravar Registro (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Grava o registro que estiver sendo inserido ou alterado.

Parâmetro:
1. Nome da Grade. (Letras)

Retorno:
Não possui.

Observação:
A grade precisa ser editável e estar no modo de inserção ou edição no momento em que a função for chamada.

### Código Cliente (JavaScript)

```javascript
function ebfGridEditablePost(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.post();
}
```

---

## Grade - Habilitar Agrupamento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEnableOrDisableGroup` |
| **Código** | 847 |
| **Assinatura** | `Grade - Habilitar Agrupamento (Componente;Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Habilita ou desabilita o recurso de agrupamento na Grade.

Parâmetro(s):
1. Componente Grade.
2. Habilitar? (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridEnableOrDisableGroup(grid, enable) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";     

  return grid.enableOrDisableGroup(enable); 
}
```

---

## Grade - Habilitar Exportação dos Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfEnableGridExportData` |
| **Código** | 829 |
| **Assinatura** | `Grade - Habilitar Exportação dos Dados (Formulário;Componente;Lógico)` |
| **Parâmetros** | Formulário;Componente;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função habilita ou desabilita a exportação dos dados de um componente Grade de acordo o valor lógico informado no terceiro parâmetro.

Parâmetros:
1. Formulário que contém a grade.
2. Componente Grade. 
3. Habilitar? (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfEnableGridExportData (form, comp, enable){
  var grid = $c(comp);  
  if(!grid){
    handleException(new Error('O componente ' + comp + ' não encontrado.'));     
    return false;
  }
  if(enable){  
    grid.contextMenu = isc.Menu.create({
      ID: grid.id + "mainMenu",
      width: 150,
      data:
        [
          { title: getLocaleMessage("LABEL.GRID_EXPORT_DATA") },
          { isSeparator: true },
          {
            icon: iconPathExport + "excel.png",
            title: "EXCEL",
            click: "gridExportData('" + grid.id + "', 'XLS')"
          },
          {
            icon: iconPathExport + "html.png",
            title: "HTML",
            click: "gridExportData('" + grid.id + "', 'HTML')"
          },
          {
            icon: iconPathExport + "json.png",
            title: "JSON",
            click: "gridExportData('" + grid.id + "', 'JSON')"
          },
          {
            icon: iconPathExport + "list.png",
            title: "LISTAGEM",
            click: "gridExportData('" + grid.id + "', 'LST')"
          },
          {
            icon: iconPathExport + "pdf.png",
            title: "PDF",
            click: "gridExportData('" + grid.id + "', 'PDF')"
          },
          {
            icon: iconPathExport + "txt.png",
            title: "TEXTO",
            click: "gridExportData('" + grid.id + "', 'TXT')"
          },
          {
            icon: iconPathExport + "xml.png",
            title: "XML",
            click: "gridExportData('" + grid.id + "', 'XML')"
          }
        ]
    });
    grid.iscCanvas.contextMenu = grid.contextMenu;        
  }else{  
    grid.iscCanvas.contextMenu = null;       
  }  
  grid.iscCanvas.markForRedraw(); 
};
```

---

## Grade - Habilitar Filtro Avançado

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridAdvancedFilter` |
| **Código** | 858 |
| **Assinatura** | `Grade - Habilitar Filtro Avançado (Formulário;Componente;Variante)` |
| **Parâmetros** | Formulário;Componente;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função habilita o filtro avançado para o componente grade que não seja editável.

Parâmetros:
1. Formulário que contém a grade. (Formulário)
2. Nome da Grade. (Componente)
  
Retorno:
Não possui.
  
Exemplo:
Assumindo como parâmetros:
    Formulário = "Cidades"
    Nome do Componente = "MakerGrid1".

### Código Cliente (JavaScript)

```javascript
function ebfGridAdvancedFilter (form, comp) {
  const grid = $c(comp);  
  if(!grid){
    handleException(new Error("Componente " + comp + " não encontrado"));
    return;
  } else {
    if (!grid.enableSimpleFilter)   
      grid.enableSimpleFilter = true;    
    gridAdvancedFilter(comp); 
  } 
};
```

---

## Grade - Inserir Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridInsertRow` |
| **Código** | 137 |
| **Assinatura** | `Grade - Inserir Linha(Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função acrescenta uma linha na grade.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridInsertRow(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.includeNewRow();
}
```

---

## Grade - Inserir Linha Sem Refresh

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridInsertRowWithoutRefresh` |
| **Código** | 945 |
| **Assinatura** | `Grade - Inserir Linha Sem Refresh (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função acrescenta uma linha na grade e não dá refresh na grid, o que aumenta o desempenho.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Não possui.

Observação:
A linha inserida apenas poderá ser visualizada se for utilizada a função "Grade - Dar Refresh" posteriormente.

### Código Cliente (JavaScript)

```javascript
function ebfGridInsertRowWithoutRefresh(gridName) {
  var grid = $c(gridName);
  if (!grid) throw "Componente " + gridName + " não encontrado";

  grid.includeNewRow(true);
}
```

---

## Grade - Ir Para Página

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGoToPagingPosition` |
| **Código** | 489 |
| **Assinatura** | `Grade - Ir Para Página (Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função navega até a posição da página informada.

Parâmetro(s):
1. Componente Grade. (Componente)
2. Nova Posição da Página. (Inteiro)

Retorno:
Não Possui.

Observação:
Necessário definir a paginação nas propriedades do componente.

### Código Cliente (JavaScript)

```javascript
function ebfGridGoToPagingPosition(grid, newPagePosition) {
  const componentGrid = $c(grid);
  if (!componentGrid) {
    handleException(new Error(getLocaleMessage("ERROR.COMPONENT_FIELD_NOT_FOUND", grid)));
    return;
  }

  let position = parseInt(newPagePosition, 10);
  if (isNaN(position) || position <= 1) {
    componentGrid.paging.btFirst.children[0].click();
  } else {
    const lastRowPage = Math.ceil(componentGrid.totalRows / componentGrid.pagingSize);
    if (position > lastRowPage) {
      position = lastRowPage;
    }

    const goto = ((position -1) * componentGrid.pagingSize)
    componentGrid.paging.setGoto(goto);
    componentGrid.paging.btNext.children[0].click();
  }
}
```

---

## Grade - Modificar Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridChangeResultSet` |
| **Código** | 388 |
| **Assinatura** | `Grade - Modificar Consulta (Formulário;Componente;Tabela;Lógico;Lógico): Lógico` |
| **Parâmetros** | Formulário;Componente;Tabela;Lógico;Lógico |
| **Retorno** | Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Modifica a consulta de uma grade associada a um formulário.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Componente Grade.
3. Tabela navegável. (Tabela) (Ver observação 2)
4. Atualizar grade? (Lógico)
5. Manter SQL? (Lógico)

Retorno:
Retorna Verdadeiro caso a consulta tenha sido modificada, senão retorna Falso. (Lógico)

Observações:
1. Ao modificar a consulta do formulário, a nova consulta deixa de ser gerenciada pelo fluxo, ou seja, ele não se 
encarregará de fechá-la, pois isso deverá ser uma tarefa do gerenciador do formulário 
(que a fechará quando o formulário for fechado).
2. A tabela pode ser obtida através da função "Abrir Consulta Navegável".
3. A função "Modificar Consulta de um formulário ou Grade" contém uma limitação que não pode ser chamada a partir de um
subformulário. Como não há como fazer tal correção sem impactos, surgiu a necessidade de criação desta função.
4. A nova consulta deverá conter a mesma quantidade de campos e mesma tabela da consulta anterior.
5. O quinto parâmetro quando definido persistirá a o SQL aplicado no terceiro parâmetro, assim quando o usuário realizar um filtro ou exportar o mesmo será realizado na consulta atual do componente.

Exemplo:
Suponhamos que temos uma grade chamada de "Grade de Cidades" com os campos "Código", "Nome" e 
"PIB" (Produto interno bruto) e que retorna (Select) todas as cidades do Brasil, utilizamos a função 
"Grade - Modificar Consulta" para as cidades que possuem o PIB maior que 100.000 - bastando portanto modificar a consulta,
inserindo a clausula where e a condição maior que 100.000.

### Código Servidor (Java)

```java
protected final Variant ebfGridChangeResultSet(Variant formVar, Variant gridVar, Variant resultSetVar, Variant update) throws Exception {
  return ebfGridChangeResultSet(formVar, gridVar, resultSetVar, update, Variant.VARIANT_FALSE);
}

protected final Variant ebfGridChangeResultSet(Variant formVar, Variant gridVar, Variant resultSetVar, Variant update, Variant keepSQL)
    throws Exception {
  java.sql.ResultSet resultSet = resultSetVar.getResultSet();

  // Find grid component
  WFRForm form = client.getSystem().getForm(formVar.getString(), client.getData().connection());
  List<WFRComponent> components = form.getAllComponents();

  WFRComponent grid = null;
  for (WFRComponent component : components) {
    if (component.getType() == wfr.sys.HTMLInterface.HTMLElement.GRID
        && component.getName().equals(gridVar.getString())) {
      grid = component;
      break;
    }
  }

  // Returns false if grid wasn't found
  if (grid == null) {
    return Variant.VARIANT_FALSE;
  }

  // Change grid query
  String idForm = grid.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM);
  WFRForm formGrid = client.getSystem().getForm(idForm, client.getData().connection());
  String dataSource = formGrid.getProperty(wfr.sys.HTMLInterface.ComponentProperty.FONTEDEDADOS);
  client.getData().setFormResultSet(idForm, resultSet);
  if (keepSQL.getBoolean())
    client.getData().setResultSetSQLInCached(idForm, client.getData().getFormResultSet(idForm));

  wfr.database.DBConnection conn = null;
  try {
    conn = client.getData().connection().getDBConnection(dataSource);
  } catch (Exception e) {
    conn = client.getData().connection();
  }

  if (resultSet instanceof WFRResultSet && (conn != null && conn.isPooled())) {
    WFRResultSet.class.cast(resultSet).setOpenCursorOnNewPage(true);
  }

  this.openedResultSetList.remove(resultSet);

  wfr.sys.HTMLInterface.HTMLGrid elemGrid = (wfr.sys.HTMLInterface.HTMLGrid) wfr.sys.HTMLInterface.HTMLElementFactory.getInstance(
      getData().getHtmlInterface(), client.getData(), grid, client.getSystem(), resultSet, response.getWriter());
  if (elemGrid.isEnableNumberOfRecords()) {
    elemGrid.setTotalRows(elemGrid.getNavigation().getTotalRows(idForm, request, dataSource));
    client.executeJavascript("$c('" + grid.getName() + "').setTotalRows(" + elemGrid.getTotalRows() + ");");
  }

  client.executeJavascript("$c('" + grid.getName() + "').clearDataSelected($c('" + grid.getName() + "').getSelectedRow());");

  // Update grid component
  if (update.getBoolean()) {
    client.executeJavascript("$c('" + grid.getName() + "').paging.navigationAction(null, null, 'first');\n $c('"
        + grid.getName() + "').noRefresh=true;");
  }

  return Variant.VARIANT_TRUE;
}
```

---

## Grade - Modificar Paginação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetPagination` |
| **Código** | 874 |
| **Assinatura** | `Grade - Modificar Paginação (Formulário;Componente;Inteiro)` |
| **Parâmetros** | Formulário;Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função modifica a quantidade de registros que devem ser exibidos por página.

Parâmetro(s):
1. Formulário.
2. Nome da Grade. (Componente)
3. Número por página. (Inteiro)

Retorno:
Não possui.

Observações:
1. Ao utilizar essa função a mesma persistirá na sessão do usuário.
2. É necessário atualizar o componente para que a modificação entre em vigor.

---

## Grade - Mostrar Barra de Edição

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetVisibleMainButtons` |
| **Código** | 407 |
| **Assinatura** | `Grade - Mostrar Barra de Edição (Componente;Lógico;Lógico)` |
| **Parâmetros** | Componente;Lógico;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função exibe ou esconde a barra de edição de um componente grade passado por parâmetro.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Valor lógico. (Lógico)
3. Bloquear Edição ao Duplo Clicar? (Lógico, Opcional)

Retorno:
Não possui.

Observações:
1. A barra de edição é a interface de inserção, atualização, edição e exclusão.
2. Ao informar o valor verdadeiro para o terceiro parâmetro o componente irá bloquear a edição do mesmo no duplo clique da linha.

### Código Cliente (JavaScript)

```javascript
function ebfGridSetVisibleMainButtons(componentGrid, visible, lockEditable) {
  var component = $c(componentGrid);
  if (component) {
    if(component.editable){
      if(component.editing || component.inserting){
        component.nav.normal();
      }
      component.nav.showNav(visible);
    }
    component.lockEditable = Boolean(lockEditable);
  } else {
    handleException("ERRRO.COMPONENT_FIELD_NOT_FOUND", componentGrid);
    return false;
  }
}
```

---

## Grade - Mostrar Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridShowColumn` |
| **Código** | 283 |
| **Assinatura** | `Grade - Mostrar Coluna(Formulário;Componente;Letras;Lógico)` |
| **Parâmetros** | Formulário;Componente;Letras;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função mostra a coluna de uma grade se a condição passada no quarto parâmetro for verdadeira, ou oculta 
caso a condição seja falsa.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Componente Grade. 
3. Nome da coluna. (Letras)
4. Condição para mostrar a coluna. (Lógico)

Retorno: 
Não Possui.

Observação:
É possível obter os valores da coluna mesmo após ter sido ocultada.

### Código Cliente (JavaScript)

```javascript
function ebfGridShowColumn(pForm, nameGrid, nameColumn, show) {  
  var grade = $c(nameGrid);
  if(!grade){
    handleException(new Error("Componente "+nameGrid+" não encontrado"));
    return;
  }
  grade.setShowColumn(nameColumn, show);
}
```

---

## Grade - Mudar Nome de Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSetColumn` |
| **Código** | 142 |
| **Assinatura** | `Grade - Mudar Nome de Coluna (Componente;Letras;Letras)` |
| **Parâmetros** | Componente;Letras;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função modifica o nome de uma coluna da Grade. Informando a Grade, o nome da coluna que deseja alterar e o 
novo nome dela.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna. (Letras)
3. Nome que deseja atribuir à coluna. (Letras)

Retorno:
Não possui.

Exemplo: 
Assumindo que o nome da grade sendo "Cursos de Computação", e o nome da coluna sendo "Descrição da Matéria",
e o nome que se deseja atribuir a coluna sendo "Descrição do Curso". Passando essas informações o nome da coluna
que anteriormente era "Descrição da Matéria" será alterado para "Descrição do Curso".

### Código Cliente (JavaScript)

```javascript
function ebfGridSetColumn(grid, column, newColumn) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.setColumn(column, newColumn);
}
```

---

## Grade - Máximo Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridMaxColumn` |
| **Código** | 334 |
| **Assinatura** | `Grade - Máximo Valor (Formulário;Componente;Letras): Número` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o máximo valor de uma coluna. 

Parâmetro(s):
1. Formulário que contém a grade. (Formulário)
2. Nome da Grade. (Componente)
3. Nome do Campo. (Letras)

Retorno:
Valor máximo referente ao campo informado. (Número)

Observações:
1. Quando usada na camada cliente, retornará o máximo valor encontrado apenas dos dados visualizados na grade. 
1.2 Quando estiver usando a "paginação" será retornado o valor da pagina em questão/atual.
2. Na camada servidor a verificação dos valores é feita em todos os registros da grid (podendo estes estarem paginados ou não). 
2.1 O retorno será do tipo 'Fracionado'. Independente se o campo for do tipo inteiro ou numérico.
3. Modo de Inserção/Alteração:
3.1 Caso a função venha a ser usada com o formulário estando no modo de inserção ou alteração, 
deverá ser usado um fluxo na camada cliente para que se obtenha o resultado desejado.

Exemplo: 
Assumindo que o nome do Formulário seja: "Formulário Grade de Estados" o nome do componente grade sendo
"MakerGradeEstados" e na grade temos os campo: "Código", "Nome do Estado", "PIB". Assumindo que o 3] parâmetro
seja o campo PIB (Produto Interno Bruto), será retornado o maior PIB encontrado.

### Código Servidor (Java)

```java
protected final Variant ebfGridMaxColumn(Variant formGuid, Variant gridName, Variant columnName) throws Exception {

    WFRForm form = client.getSystem().getFormByGuid(formGuid.toString());
    WFRComponent com = form.getComponentByName(gridName.toString());
    String gridFormGuid = com.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM);
    WFRForm formGrid = client.getSystem().getForm(gridFormGuid, client.getData().connection());

    String field = "";
    for (WFRComponent c : formGrid.getAllComponents()) {

      if (c.getDescription().equals(columnName.toString())) {
        field = c.getField();
        break;
      }
    }

    double maximo = 0;
    double valor = 0;
    ResultSet rs = client.getData().getFormResultSet(formGrid.getCodeStr());
    int rowNum = rs.getRow();
    try {
      rs.beforeFirst();
      while (rs.next()) {          
        valor = new Variant(rs.getObject(field)).getDouble();
        if(valor > maximo)
          maximo = valor;
      }
    } finally {
      if (rs != null) {
        rs.absolute(rowNum);
      }
    }

    return new Variant(maximo);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGridMaxColumn(form, grid, column) {
  var valor = 0;
  var maximo = 0;
  var gridName = grid;
  var grid = $c(grid);
  if (!grid){ 
    handleException(new Error("Componente " + gridName + " não encontrado"));
    return;
  }
  var qtdLinhas = grid.getRowCount();
  var ref = grid.iscCanvas;
  for (var i =0; i<qtdLinhas ;i++){ 
    var data = ref.getRecord(i);
    var rNc = grid.getRealNameColumn(column);
    if(rNc === -1){
      handleException(new Error(getLocaleMessage("INFO.GRID_COLUMN_NOT_FOUND", column, grid.description ==="" ? gridName : grid.description)));
      return;
    }    
    valor = parseNumeric(data[rNc]);
    if(valor > maximo)
      maximo = valor;      
  }
  return maximo;   
}
```

---

## Grade - Média de Valores de uma Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridAVGColumn` |
| **Código** | 328 |
| **Assinatura** | `Grade - Média de Valores de uma Coluna (Formulário;Componente;Letras): Número` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Calcula a média de valores contidos em uma coluna. 

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)
3. Nome do Campo. (Letras)

Retorno:
Média entre os valores referente ao campo informado. (Número)

Observações:
1. Quando usada na camada cliente, retornará a Média entre os valores encontrados na grade. 
1.1. Quando estiver usando a "paginação" será retornado a média da coluna e da página em questão/atual.
2. Na camada servidor a verificação dos valores é feita em todos os registros da grid (podendo estes estarem paginados ou não). 
3. Modo de Inserção/Alteração:
3.1. Caso a função venha a ser usada com o formulário estando no modo de inserção ou alteração, 
deverá ser usado um fluxo na camada cliente para que se obtenha o resultado desejado.

Exemplo: 
Assumindo que o nome do Formulário seja: "Formulário Grade de Estados" o nome do componente grade sendo
"MakerGradeEstados" e na grade temos os campo: 'Código', 'Nome do Estado', 'PIB'. Assumindo que o 3º parâmetro
seja o campo PIB (Produto Interno Bruto), será retornado a média dos valores de uma coluna.

### Código Servidor (Java)

```java
protected final Variant ebfGridAVGColumn(Variant formGuid, Variant gridName, Variant columnName) throws Exception {

    WFRForm form = client.getSystem().getFormByGuid(formGuid.toString());
    WFRComponent com = form.getComponentByName(gridName.toString());
    String gridFormGuid = com.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM);
    WFRForm formGrid = client.getSystem().getForm(gridFormGuid, client.getData().connection());

    String field = "";
    for (WFRComponent c : formGrid.getAllComponents()) {

      if (c.getDescription().equals(columnName.toString())) {
        field = c.getField();
        break;
      }
    }

    double sum = 0;
    double avg = 0;
    ResultSet rs = client.getData().getFormResultSet(formGrid.getCodeStr());
    int rowNum = rs.getRow();
    try {
      rs.beforeFirst();
      while (rs.next()) {
        sum += new Variant(rs.getObject(field)).getDouble();
        avg++;
      }
      avg = sum / avg;
    } finally {
      if (rs != null) {
        rs.absolute(rowNum);
      }
    }

    return new Variant(avg);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGridAVGColumn(form, grid, column) {
  var sum = 0;
  var total = 0;
  var avg = 0;
  var gridName = grid;  
  var grid = $c(grid);  
  if (!grid) {
    handleException(new Error("Componente " + gridName + " não encontrado"));
    return;
  }    
  var qtdLinhas = grid.getRowCount();
  var ref = grid.iscCanvas;
  for (var i =0; i<=qtdLinhas ;i++){    
    if(i<qtdLinhas){ 
      var data = grid.isFiltered ? ref.getOriginalData().localData[i] : ref.getDataSource().cacheData[i];
      var rNc = grid.getRealNameColumn(column);
      if(rNc === -1){
        handleException(new Error(getLocaleMessage("INFO.GRID_COLUMN_NOT_FOUND", column, grid.description ==="" ? gridName : grid.description)));
        return;
      } 
      sum = parseNumeric(data[rNc]);
      total = total + sum;  
    }  
    else
      avg = total / i;  
  }
  return avg;
}
```

---

## Grade - Mínimo Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridMinColumn` |
| **Código** | 335 |
| **Assinatura** | `Grade - Mínimo Valor (Formulário;Componente;Letras): Número` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Obtém o menor valor de uma determinada coluna.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)
3. Nome do Campo. (Letras)

Retorno:
Valor mínimo referente ao campo informado. (Número)

Observações:
1. Quando usada na camada cliente, retorna-rá o mínimo valor encontrado na grade. 
1.1. Quando estiver usando a "paginação" será retornado o mínimo valor da coluna e da página em questão/atual.
2. Na camada servidor a verificação dos valores é feita em todos os registros da grid (podendo estes estarem paginados ou não). 
2.1. O retorno sempre será um valor fracionado.
3. Modo de Inserção/Alteração:
3.1. Caso a função venha a ser usada com o formulário estando no modo de inserção ou alteração, 
deverá ser usado um fluxo na camada cliente para que se obtenha o resultado desejado.

Exemplo: 
Assumindo que o nome do Formulário seja: "Formulário Grade de Estados" o nome do componente grade sendo
"MakerGradeEstados" e na grade temos os campo: 'Código', 'Nome do Estado', 'PIB'. Assumindo que o 3 parâmetro
seja o campo PIB(Produto Interno Bruto), será retornado o mínimo valor da coluna desejada.

### Código Servidor (Java)

```java
protected final Variant ebfGridMinColumn(Variant formGuid, Variant gridName, Variant columnName) throws Exception {

    WFRForm form = client.getSystem().getFormByGuid(formGuid.toString());
    WFRComponent com = form.getComponentByName(gridName.toString());
    String gridFormGuid = com.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM);
    WFRForm formGrid = client.getSystem().getForm(gridFormGuid, client.getData().connection());

    String field = "";
    for (WFRComponent c : formGrid.getAllComponents()) {

      if (c.getDescription().equals(columnName.toString())) {
        field = c.getField();
        break;
      }
    }
    char inicio= '0';
    double minimo = 0;
    double valor = 0;
    ResultSet rs = client.getData().getFormResultSet(formGrid.getCodeStr());
    int rowNum = rs.getRow();
    try {
      rs.beforeFirst();
      while (rs.next()) {
           
        valor = new Variant(rs.getObject(field)).getDouble();
        if(inicio == '0')
           minimo  = valor;
        if(valor < minimo)
          minimo = valor;
        inicio = '1';  
      }
    } finally {
      if (rs != null) {
        rs.absolute(rowNum);
      }
    }

    return new Variant(minimo);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGridMinColumn(form, grid, column) {
  var valor = 0;
  var minimo = 0;
  var gridName = grid;
  var grid = $c(grid);
  if (!grid) {
    handleException(new Error("Componente " + gridName + " não encontrado"));
    return;
  } 
  var qtdLinhas = grid.getRowCount();
  var ref = grid.iscCanvas;
  for (var i =0; i<qtdLinhas ;i++){
    var data = ref.getRecord(i);
    var rNc = grid.getRealNameColumn(column);
    if(rNc === -1){
      handleException(new Error(getLocaleMessage("INFO.GRID_COLUMN_NOT_FOUND", column, grid.description ==="" ? gridName : grid.description)));
      return;
    }     
    valor = parseNumeric(data[rNc]);
    if(i == 0)
      minimo = valor;
    else if(valor < minimo)
      minimo = valor;      
  }
  return minimo;   
}
```

---

## Grade - Obter Código da Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridColumnCode` |
| **Código** | 146 |
| **Assinatura** | `Grade - Obter Código da Coluna(Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna o código da coluna. Informando a Grade e o nome da coluna que deseja saber o código.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna. (Letras)

Retorno: 
Retorna o código da coluna. (Inteiro) 

Exemplo: 
Assumindo que o nome da grade sendo: "Cadastro de Produtos" e o Nome da Coluna sendo: "Descrição do Produto".
O retorno será o Código da coluna  "Descrição do Produto".

### Código Cliente (JavaScript)

```javascript
function ebfGridColumnCode(grid, column) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.getColumnCode(column);
}
```

---

## Grade - Obter Estado da Grade

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetStatus` |
| **Código** | 329 |
| **Assinatura** | `Grade - Obter Estado da Grade(Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna estado da grade.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)

Retorno:
"edição"    - se a grade estiver em modo de edição.
"inserção" - se a grade estiver em modo de inserção.
"normal"    - se estiver em modo normal.(Letras)

### Código Cliente (JavaScript)

```javascript
function ebfGridGetStatus(form, com){

  var grid = $c(com);
  if(!grid){
    throw "O componente passado é nulo!"
  }
  if(!(grid instanceof HTMLGrid)){
    throw "O componente passado por parâmetro não é uma grade!"
  }
  
  if(grid.inserting){
    return "inserção";
  }

  if(grid.editing){
    return "edição";
  }
  
  return "normal";
}
```

---

## Grade - Obter Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetSpecificGroup` |
| **Código** | 842 |
| **Assinatura** | `Grade - Obter Grupo (Componente;Letras): Variante` |
| **Parâmetros** | Componente;Letras |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o grupo referente ao nome passado por parâmetro.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome do Grupo. (Letras)

Retorno:
Retorna o objeto do grupo. (Variante)

Observações:
1. O retorno dessa função não suporta a conversão para letras.
2. Obtém apenas grupos contidos na raiz, ou seja, subgrupos não são obtidos. 

Exemplo:
1. Imagine uma árvore seguindo o princípio de pai(grupo) e filho(subgrupo) da seguinte forma:
{
  "grupo1": {
    "subgrupo1": "valor1"
  },
  "grupo2": {
    "subgrupo2": "valor2"
  }
}
Apenas os grupos "grupo1" e "grupo2" poder ser obtidos.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetSpecificGroup(gridName, group) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.getSpecificGroup(group);
}
```

---

## Grade - Obter Informações do Cabeçalho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetHeaderInfo` |
| **Código** | 846 |
| **Assinatura** | `Grade - Obter Informações do Cabeçalho (Formulário;Componente): Variante` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função obtém informações do cabeçalho do componente grade informado por parâmetro.
 
Parâmetro(s):
1. Formulário.
2. Nome da Grade. (Componente)
 
Retorno:
Objeto JSON com as informações do cabeçalho. (Variante)
 
Observações:
1. O objeto JSON retornado estará no formato JSONArray.
2. Caso a propriedade "Habilitar Coluna Numérica" esteja defina como "true" essa também será retornada na posição 0 (zero).

### Código Cliente (JavaScript)

```javascript
function ebfGridGetHeaderInfo (form, comp) {
  let grid = $c(comp);
  if(!grid) {
    handleExceptiton(new Error("O componente " + comp + "não encontrado."));
    return;
  }
  return grid.iscCanvas.getFields();
}
```

---

## Grade - Obter Linha Selecionada

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetSelectedRow` |
| **Código** | 144 |
| **Assinatura** | `Grade - Obter Linha Selecionada (Componente): Inteiro` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna o número da linha selecionada na grade. 

Parâmetro:
1. Nome da Grade. (Componente)

Retorno: 
Retorna o número da linha selecionada. (Inteiro) 

Observações:
1. A numeração das colunas começam de 0 à N.
2. Caso nenhuma linha esteja selecionada, será retornado o valor -1.
3. Caso a paginação esteja ativa, será retornado o número da linha da paginação ativa.

Exemplo: 
Assumindo que o nome da grade é  "Sistemas". Passando esse parâmetro, ao selecionar alguma linha da Grade 
"Sistemas", o retorno será o número da linha selecionada.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetSelectedRow(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.getSelectedRow();
}
```

---

## Grade - Obter Linhas Selecionadas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetSelectedRecords` |
| **Código** | 960 |
| **Assinatura** | `Grade - Obter Linhas Selecionadas (Componente;Lógico): Variante` |
| **Parâmetros** | Componente;Lógico |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna as informações das linhas selecionadas ou apenas o index das linhas.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Somente Índices? (Lógico) 

Retorno:
Lista de JSON com informações ou lista de índices. (Variante)

Observações:
1. Para que essa função tenha o funcionamento correto o componente deve permitir a seleção de múltiplas linhas, que pode ser habilitado por meio da função "Grade - Permitir Múltipla Seleção de Linhas".
2. Quando informado o valor como verdadeiro para o segundo parâmetro a função retornará uma lista com os índices das linhas selecionadas, quando falso retornará uma lista de JSON com informações das linhas.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetSelectedRecords (comp, onlyIndex) {
  let component = $c(comp);
  if (component) {
    if (component.iscCanvas.selectionType === 'multiple') {
      if (!onlyIndex) return component.getSelectedRecords();
      else return component.getSelectedRows(); 
    } 
    else return new Array();
  } else {
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', comp));
    return;
  }
}
```

---

## Grade - Obter Nome Real da Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetRealNameColumn` |
| **Código** | 831 |
| **Assinatura** | `Grade - Obter Nome Real da Coluna (Componente;Letras): Variante` |
| **Parâmetros** | Componente;Letras |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém o nome real de uma coluna.

Parâmetro(s):
1. Componente Grade. (Componente)
2. Nome da coluna. (Letras)

Retorno:
Retorna o nome real da coluna passada como parâmetro. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfGridGetRealNameColumn(gridName, column) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.getRealNameColumn(column);
}
```

---

## Grade - Obter Nome dos Grupos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetNameGroups` |
| **Código** | 843 |
| **Assinatura** | `Grade - Obter Nome dos Grupos (Componente): Variante` |
| **Parâmetros** | Componente |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém os grupos que estão visíveis na grade.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Retorna uma lista contendo o nome de todos os grupos visíveis na grade. (Variante)

Observação:
Obtém apenas os nomes dos grupos da raiz, ou seja, subgrupos não são obtidos. 

Exemplo: 
Imagine uma árvore seguindo o princípio de pai(grupo) e filho(subgrupo) da seguinte forma:
{
  "grupo1": {
    "subgrupo1": "valor1"
  },
  "grupo2": {
    "subgrupo2": "valor2"
  }
}
Apenas os valores "grupo1" e "grupo2" vão ser retornados.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetNameGroups(gridName) {
  var grid = $c(gridName);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.getNameGroups();
}
```

---

## Grade - Obter Offset de Paginação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetOffset` |
| **Código** | 332 |
| **Assinatura** | `Grade - Obter Offset de Paginação (Letras): Inteiro` |
| **Parâmetros** | Letras |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna qual é o primeiro elemento real da grade, já que a mesma pode ter paginada e não estar mais na
página inicial.

Parâmetro:
1. Componente Grade. (Letras)

Retorno:
Retorna o primeiro elemento real da grade. (inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfGridGetOffset(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.gridini;
}
```

---

## Grade - Obter Posição Atual da Paginação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetPagingPosition` |
| **Código** | 488 |
| **Assinatura** | `Grade - Obter Paginação (Letras): Inteiro` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função retorna a página atual da grade informada por parâmetro.

Parâmetro:
1. Componente Grade.

Retorno:
A posição atual da paginação do componente 'Grade' informado. (Inteiro)

### Código Cliente (JavaScript)

```javascript
function ebfGridGetPagingPosition(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";
  return (Math.ceil(toDouble(grid.gridini / grid.pagingSize))) + 1;    
}
```

---

## Grade - Obter Posição da Barra de Rolagem - Horiz.

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetScrollLeftValue` |
| **Código** | 257 |
| **Assinatura** | `Grade - Obter Posição da Barra de Rolagem - Horiz.(Formulário;Componente)` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna a distância em pixels da barra de rolagem no sentido horizontal.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Componente Grade. (Ver observação 1)

Retorno:
Retorna a posição em pixel referente a barra de rolagem no sentido horizontal. (Número)

Observação:
No 2º Parâmetro deve ter a grade cuja distância da barra de rolagem do topo se deseja obter.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetScrollLeftValue(form, com){
  if (com)  
    return $c(com).getHorizontalScrollPosition();    
  return null;
}
```

---

## Grade - Obter Posição da Barra de Rolagem - Vert.

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetScrollTopValue` |
| **Código** | 259 |
| **Assinatura** | `Grade - Obter Posição da Barra de Rolagem - Vert. (Formulário;Componente): Número` |
| **Parâmetros** | Formulário;Componente |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Função que retorna a distância em pixels da barra de rolagem no sentido vertical.

Parâmetro(s):
1. Formulário que contém a grade.
2. Nome da Grade. (Componente)

Retorno:
Retorna a posição em pixel referente a barra de rolagem no sentido vertical. (Número)

### Código Cliente (JavaScript)

```javascript
function ebfGridGetScrollTopValue(form, com){
  if (com)  
    return $c(com).getVerticalScrollPosition();    
  return null;
}
```

---

## Grade - Obter Registros do Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetRecordsInGroup` |
| **Código** | 844 |
| **Assinatura** | `Grade - Obter Registros do Grupo (Componente;Variante): Variante` |
| **Parâmetros** | Componente;Variante |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna todos os registros contidos em um grupo.

Parâmetro(s):
1. Componente Grade. 
2. Nome do Grupo ou Objeto do Grupo. (Variante) (Ver Observação 1)

Retorno:
Retorna uma lista de objetos JSON referente aos registros contidos no grupo. (Variante)

Observação: 
Pode ser passado tanto o nome referente ao grupo, quanto o próprio Objeto do grupo, obtido através das regras de negócio.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetRecordsInGroup(grid, group) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";     

  return grid.getRecordsInGroup(group); 
}
```

---

## Grade - Obter Total de Linhas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridRowCount` |
| **Código** | 145 |
| **Assinatura** | `Grade - Obter Total de Linhas(Componente)` |
| **Parâmetros** | Componente |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna o total de linha que existe na grade. Informando apenas a Grade.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno: 
Retorna o total de linha da Grade.(Inteiro) 

Observações:
1. Caso a propriedade paginação esteja ativada é retornado o total de linhas da paginação em questão
2. Para retornar o total geral de linhas, desative a propriedade paginação.

Exemplo: 
Assumindo que o nome da grade sendo "Usuários". Passando esse parâmetro, ao chamar a função, o retorno será o total de
linhas da Grade "Usuários".

### Código Cliente (JavaScript)

```javascript
function ebfGridRowCount(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  return grid.getRowCount();
}
```

---

## Grade - Obter Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetValue` |
| **Código** | 135 |
| **Assinatura** | `Grade - Obter Valor(Componente;Inteiro;Letras):Letras` |
| **Parâmetros** | Componente;Inteiro;Letras |
| **Retorno** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna o valor que está na Grade, a partir da informação da linha (a primeira linha da Grade é a linha "0" (zero)) e a coluna que deseja obter o valor.

Parâmetro(s):
1. Componente Grade.
2. Número da Linha (N-1). (Inteiro)
3. Nome da Coluna. (Letras)

Retorno:
Retorna o valor obtido em uma determinada linha do componente. (Letras)

Observação: 
O primeiro parâmetro desta função também pode ser modificado para a "Constante" do tipo "Letras",
sendo informado manualmente o nome do componente "Grade".

Exemplo: 
Assumindo que o componente grade sendo "Grade de Cidades", o número da linha sendo 0(zero) 
e o nome da coluna sendo"PIB"(Produto Interno Bruto). O retorno será o valor que está na linha 0 da coluna "PIB" 
na "Grade de Cidades".

### Código Cliente (JavaScript)

```javascript
function ebfGridGetValue(grid, row, column) {
  var gridName = grid;
  var grid = $c(grid);
  if (!grid){
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', gridName));
    return;
  }
  try {
    var ref = grid.iscCanvas;
    var rNc = grid.getRealNameColumn(column);
    var rec = null;
    if (grid.isGrouped())
      rec = ref.groupTree.getAllItems()[row];
    else {
      if (grid.isFiltered)
        rec = ref.getOriginalData().localData[row];
      else
        rec = ref.getDataSource().cacheData[row];
    }
    if ((rec[rNc] === ' ')||(rec[rNc] === null))
      return "";
    return rec[rNc];
  } catch (e) {
    handleException(getLocaleMessage('ERROR.GRID_NO_ROW_SELECTED'));
    return;
  }
}
```

---

## Grade - Obter Valor Que Mais se Repete (Moda)

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfModaGridColumn` |
| **Código** | 327 |
| **Assinatura** | `Grade - Obter Valor Que Mais se Repete (Moda) (Formulário;Componente;Letras): Número` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Moda é um termo estatístico usado para para obter o valor que mais se repete ou que possui a maior freqüência 
dentro de uma coluna.

Parâmetro(s):
1. Formulário.
2. Componente Grade. (Componente)
3. Nome do Campo. (Letras)

Retorno:
Valor que mais se repete entre os valores referente ao campo informado. (Inteiro)

Observações:
1. Caso a propriedade paginação esteja ativado, só será retornado os valores referente a página em questão.
2. Caso não exista moda (nenhum valor que se repete) será retornado um campo em branco, ou seja nenhum valor.

Exemplo: 
Calculando a idade da moda de uma classe de alunos a pesquisa revelou as seguintes idades:
18, 18, 19, 20, 21, 21, 22, 23, 23, 23, 24, 25, 26. 
A função retornará a idade que mais aparece na pesquisa. Neste caso a idade foi de 23 ano de idade.

### Código Servidor (Java)

```java
protected final Variant ebfModaGridColumn(Variant formGuid, Variant gridName, Variant columnName) throws Exception {
    WFRForm form = client.getSystem().getForm(formGuid.toString(), client.getData().connection());
    WFRComponent guidComponent = form.getComponentByName(gridName.toString());

    String gridFormGuid = guidComponent.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM);
    WFRForm formGrid = client.getSystem().getForm(gridFormGuid, client.getData().connection());

    List<Number> values = new ArrayList<Number>();
    List<Long> counter = new ArrayList<Long>();
    Variant mode = Variant.VARIANT_NULL;

    // Obtém a nome do campo da coluna do ResultSet
    String field = "";
    for (WFRComponent com : formGrid.getAllComponents()) {
      if (com.getDescription().equals(columnName.toString())) {
        field = com.getField();
        break;
      }
    }
    ResultSet rs = client.getData().getFormResultSet(formGrid.getCodeStr());
    int currentRow = rs.getRow();
    try {
      // Percorre os elementos da grid e adiciona no Map seus valores sem repetição.
      // No momento que um valor já existe, incrementa-se apenas a quantidade de repetição.
      rs.beforeFirst();
      while (rs.next()) {
        Object valueObj = rs.getObject(field);
        if (valueObj != null) {
          Number value;
          if (valueObj instanceof Number) {
            value = Number.class.cast(valueObj);
          } else {
            value = Double.valueOf(valueObj.toString());
          }

          long amount = 1;
          int mapIndex = values.indexOf(value);
          if (mapIndex > -1) {
            amount = counter.get(mapIndex);
            amount++;
            counter.set(mapIndex, amount);
          } else {
            values.add(value);
            counter.add(amount);
          }
        }
      }

      // Percorre o Map em busca da moda, ou seja, o elemento que tenha maior repetição.
      // Caso haja mais de um com a mesma repetição, o primeiro será retornado.
      long repetition = 1;
      for (int i = 0; i < counter.size(); i++) {
        long quantity = counter.get(i);
        if (quantity > repetition) {
          repetition = quantity;
          mode = VariantPool.get(values.get(i));
        }
      }

      // Se a repetição for 1, então não houve moda.
      if (repetition == 1) {
        mode = Variant.VARIANT_NULL;
      }
    } finally {
      if (rs != null) {
        rs.absolute(currentRow);
      }
    }

    return mode;
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfModaGridColumn(form, gridName, columnName) {  
  var values = new Map();
  var mode = null;  
  var grid = $c(gridName, form);
  if(!grid){
    handleException(new Error("Componente "+gridName+" não encontrado"));
    return;
  }
  var lines = grid.getRowCount()
  var rNc = grid.getRealNameColumn(columnName);
  var ref = grid.iscCanvas;
  // Percorre os elementos da grid e adiciona no Map seus valores sem repetição.
  // No momento que um valor já existe, incrementa-se apenas a quantidade de repetição.
  for (var i = 0; i < lines; i++) {
    var data = grid.isFiltered ? ref.getOriginalData().localData[i] : ref.getDataSource().cacheData[i];
    var value = parseNumeric(data[rNc]);
    if (!isNullable(value)) {
      var amount = 1;
      var currentAmount = values.get(value);
      if (currentAmount != null) {
        amount = currentAmount + 1;
      }
      values.add(value, amount);
    }
  }

  // Percorre o Map em busca da moda, ou seja, o elemento que tenha maior repetição.
  // Caso haja mais de um com a mesma repetição, o primeiro serÃ¡ retornado.
  var repetition = 1;
  for (var i = 0; i < values.size; i++) {
    var quantity = values.getValues()[i];
    if (quantity > repetition) {
      repetition = quantity;
      mode = values.getKeys()[i];
    }
  }
  
  // Se a repetição for 1, então não houve moda.
  if (repetition == 1) {
    mode = null;
  }
  
  return mode;
}
```

---

## Grade - Obter Valor de um CheckBox

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetCheckValue` |
| **Código** | 345 |
| **Assinatura** | `Grade - Obter Valor de um CheckBox (Componente;Inteiro;Letras): Inteiro` |
| **Parâmetros** | Componente;Inteiro;Letras |
| **Retorno** | Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função retorna um valor inteiro que identifica o estado do componente CheckBox na Grade, a partir da informação 
da linha e a coluna que deseja obter o valor.

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Número da Linha. (Inteiro)
3. Nome da Coluna que se encontra o componente CheckBox. (Letras)

Retorno: 
Número referente ao valor do check. (Inteiro)

Observação: 
Os possíveis retornos são:
- Desmarcado = 0;
- Marcado = 1;
- Neutro = 2.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetCheckValue(grid, row, column) {
  var check = ebfGridGetValue(grid, row, column);
  if (check !== null){
    if(check === false) {
       return 0;
    }
    if(check === undefined || check === "") {
      return 2;
    }
    if(check === true) {
      return 1;
    }  
  }
}
```

---

## Grade - Permitir Múltipla Seleção de Linhas

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEnableMultiSelection` |
| **Código** | 959 |
| **Assinatura** | `Grade - Permitir Múltipla Seleção de Linhas (Componente;Lógico)` |
| **Parâmetros** | Componente;Lógico |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função habilita a opção do usuário realizar a múltipla seleção de linhas no componente.

Parâmetro(s):
1. Nome da Grade. (Letras)
2. Permitir? (Lógico)

Retorno:
Não possui.

Observações:
1. Para realizar a múltipla seleção de linhas é necessário pressionar a tecla CTRL.
2. Para obter o conteúdo das linhas, utilizar a função "Grade - Obter Linhas Selecionadas".

### Código Cliente (JavaScript)

```javascript
function ebfGridEnableMultiSelection (comp, enable) {
  let component = $c(comp);  
  if (component) {
    enable = enable ? 'multiple' : 'single';
    component.iscCanvas.setSelectionType(enable);
  } else {
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', comp));
    return;
  }
}
```

---

## Grade - Preencher com Consulta

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridFill` |
| **Código** | 284 |
| **Assinatura** | `Grade - Preencher com Consulta(Formulário;Componente;Tabela;Variante)` |
| **Parâmetros** | Formulário;Componente;Tabela;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Função que preenche a grade com os registros de uma consulta.

Parâmetro(s):
1. Formulário que contém a grade.
2. Componente Grade.
3. Tabela com a consulta realizada. (Tabela)
4. Lista de descrições dos campos que irão aparecer nas colunas. Os campos deverão estar na ordem das colunas. (Variante)

Retorno:
Não possui.

Observações:
1. Não é possível ordenar a grade com a funcionalidade Shift + Duplo-Clique na coluna após o uso desta função.
2. Após preencher uma Grade Editável com esta função, não será possível inserir, alterar ou excluir dados na mesma.
3. É recomendável o uso da função "Abrir Consulta Navegável" antes, para retornar a tabela para o terceiro parâmetro.
4. É recomendável o uso da função "Criar Lista a partir dos elementos" para retornar a lista de campos no quarto parâmetro.

### Código Servidor (Java)

```java
@SuppressWarnings({ "rawtypes", "unchecked" })
protected Variant ebfGridFill(Variant form, Variant grid, Variant vRSet, Variant desc) throws Exception {
  ResultSet rSet = vRSet.getResultSet();
  List<String> listNameColumns= new ArrayList<String>();
  java.sql.ResultSetMetaData rsmd = rSet.getMetaData();
  int numberOfColumns = rsmd.getColumnCount();

  StringBuilder script = new StringBuilder();
  StringBuilder scriptb = new StringBuilder();
  StringBuilder scriptc = new StringBuilder();

  String typeColumn = "";
  List descr = (List) desc.getObject();
  ArrayList<String> types = new ArrayList<String> ();
  org.json.JSONArray jsonArrayColumns = new org.json.JSONArray();

  for (int i = 1; i <= numberOfColumns; i++) {
    listNameColumns.add(rsmd.getColumnName(i));

    int columnType = rsmd.getColumnType(i);
    int columnPrecision = rsmd.getPrecision(i);
    int index = 0;
    typeColumn = getType(columnType, columnPrecision, index);
    types.add(typeColumn);
    String descc = descr.get(i-1).toString();

    org.json.JSONObject jsonDataColumns = new org.json.JSONObject();
    jsonDataColumns.put("name", rsmd.getColumnName(i));
    jsonDataColumns.put("title", descc);
    jsonDataColumns.put("width", "150");
    jsonDataColumns.put("type", typeColumn);
    if(typeColumn.equals("double") || typeColumn.equals("numeric")) {
      jsonDataColumns.put("format", "###,###,##0.00");
    }
    jsonDataColumns.put("canSort", false);

    jsonArrayColumns.put(jsonDataColumns);
  }

  Variant columns = VariantPool.get(listNameColumns);
  Variant description = desc;
  List<Object> list;

  if (!description.isNull() && description.getObject() instanceof List) {
    if(((List) description.getObject()).size() != ((List) columns.getObject()).size()) {
      throw new WFRRuleException("A quantidade de itens na lista de descrições é incompatível com a quantidade de colunas da consulta.\nQuantidade elementos na lista de descrições: "+((List) description.getObject()).size()+".\nQuantidade de colunas da consulta: "+((List) columns.getObject()).size()+".", this.ruleName);
    }

    list = (List) description.getObject();
  } else {
    list = (List) columns.getObject();
    description = columns;
  }

  script.append("$c('").append(grid.getString()).append("').iscCanvas.setShowFilterEditor(false);\n");
  script.append("$c('").append(grid.getString()).append("').setAllColumns("+ jsonArrayColumns.toString() +");\n");
  script.append("$c('").append(grid.getString()).append("').noRefresh=true;\n");


  org.json.JSONArray jsonArrayData = new org.json.JSONArray();
  int count = 0;
  while (hasData(rSet)) {
    org.json.JSONObject jsonData = new org.json.JSONObject();

    for (int i = 0; i < list.size(); i++) {
      Variant vField = VariantPool.get(((List) columns.getObject()).get(i));
      jsonData.put(vField.getString(), rSet.getObject(vField.getString()));
    }

    jsonData.put("row", count);
    jsonArrayData.put(jsonData);
    count++;
    rSet.next();
  }

  script.append("$c('").append(grid.getString()).append("').setAllRecords("+ jsonArrayData.toString() +");");
  scriptc.append(Functions.stringToJs(script.toString()));
  scriptb.append("!('mainform' in window)\n"); 
  scriptb.append("? parent.ebfExecuteJSFromWindow(parent.mainform,'"+ scriptc.toString()+ "')\n"); 
  scriptb.append(": ebfExecuteJS('" + scriptc.toString()+ "');");
  client.command(scriptb.toString());
  return Variant.VARIANT_NULL;
}

protected final String getType(int type, int dSize, int iSize) {
  if(wfr.util.Functions.isSQLBoolean(type))
    return "boolean";
  else if(wfr.util.Functions.isSQLDate(type))
    return "date";
  else if(wfr.util.Functions.isSQLInteger(type, dSize, iSize))
    return "integer";
  else if(wfr.util.Functions.isSQLDouble(type, dSize, iSize))
    return "double";
  else if(wfr.util.Functions.isSQLNumeric(type, dSize, dSize))
    return "numeric";
  return "text";
}
```

---

## Grade - Preencher com JSON

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridFillFromJson` |
| **Código** | 963 |
| **Assinatura** | `Grade - Preencher com JSON (Formulário;Componente;Variante;Variante)` |
| **Parâmetros** | Formulário;Componente;Variante;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função preenche uma grade a partir de um objeto JSON.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Componente Grade. 
3. Lista de JSON do cabeçalho. (Variante) (Ver observação 4)
4. Lista de JSON contendo os valores a serem adicionados na grade. (Variante)

Retorno:
Não possui.

Observações:
1. No parâmetro 4, cada linha da grade corresponde a um JSON dentro da lista.
2. Após preencher a grade com esta função, não é permitido entrar em modo de inserção/edição ou gravar/excluir os registros.
3. Não é possível ordenar a grade com a funcionalidade Shift + Duplo-Clique na coluna após o uso desta função.
4. Chaves do JSON cabeçalho:
   name: identificador da coluna. Obrigatório.
   title: descrição da coluna. Obrigatório.
   width: largura da coluna. Valor padrão: divisão por igual do espaço disponível.
   type: tipo da coluna. Valor padrão: text.
   align: alinhamento da coluna. Valor padrão: left
   visible: define se a coluna pode ser ocultada. Valor padrão: false
5. Os valores possíveis para alinhamento(align) das colunas são: center, left e right. 

Exemplos:
JSON cabeçalho:                                JSON conteudo
[                                                  [
  {                                                      {    
    "name": "codigo",                            "codigo": "1",   
    "title": "Codigo",                               "valor": "150" 
    "width": 150,                                  },
    "type": "text",                                 {
    "align": "center",                              "codigo": "2",
    "visible": true                                   "valor": "300"  
                                                          }
  },                                                ]
  {
    "name": "valor",
    "title": "Valor",
    "width": 150,
    "type": "text",
    "align": "center",
   "visible":true    
  }
]

### Código Servidor (Java)

```java
protected final Variant ebfGridFillFromJson (Variant form, Variant comp, Variant jsonHeader, Variant jsonBody) throws Exception {
  return callClientFunction("ebfGridFillFromJson", form, comp, jsonHeader, jsonBody);
}
```

### Código Cliente (JavaScript)

```javascript
function ebfGridFillFromJson (form, grid, header, values) {
  let cGrid = $c(String(grid));
  if(cGrid){  
    cGrid.setAllColumns(parseArray(header));
    cGrid.setAllRecords(parseArray(values));
    cGrid.iscCanvas.setShowFilterEditor(false);
    cGrid.setGridPageIni(0);
    cGrid.setGridPageEnd(values.length);
    cGrid.order = function(){};   
    cGrid.columns = header;         
    cGrid.iscCanvas.markForRedraw()
    cGrid.noRefresh = true; 
  } else {
    handleException(getLocaleMessage('ERROR.COMPONENT_FIELD_NOT_FOUND', grid));
    return;
  }
}

function parseArray (object) {
  if (!(object instanceof Array)) {
    try {
      let newArray = new Array();
      const size = object.length;
      for(var i=0; i < size; i++) {
        newArray[i] = object[i];
      }    
      return newArray;
    } catch (e) {
      return object;
    }   
  }  
  return object;
}
```

---

## Grade - Preencher da Lista

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridFillFromList` |
| **Código** | 349 |
| **Assinatura** | `Grade - Preencher da Lista (Formulário;Componente;Variante;Variante)` |
| **Parâmetros** | Formulário;Componente;Variante;Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Preenche uma grade a partir de uma lista.

Parâmetro(s):
1. Formulário que contém a grade.
2. Componente Grade. 
3. Lista com a descrições da coluna. (Variante) (Ver observação 4)
4. Lista de Lista contendo os valores a serem adicionados na grade. (Variante)

Retorno:
Não possui.

Observações:
1. No parâmetro 4, cada linha da grade corresponde a uma lista dentro da lista desse parâmetro.
2. Após preencher a grade com esta função, não é permitido entrar em modo de inserção/edição ou
gravar/excluir os registros.
3. Não é possível ordenar a grade com a funcionalidade Shift + Duplo-Clique na coluna após o uso desta função.
4. O terceiro parâmetro pode ser informado uma lista com as descrição das colunas ou uma lista de lista com as seguintes informações:
  - Descrição
  - Tamanho
  - Alinhamento
No terceiro parâmetro da lista aceita os seguintes valores para alinhamento do conteúdo: D (Direita), E (Esquerda) e C (Centro).
A lista informada deve conter três parâmetros.
5. É recomendável o uso da função "Criar Lista a partir dos elementos" para obter a lista e satisfazer o terceiro e quarto
parâmetros.

### Código Servidor (Java)

```java
protected Variant ebfGridFillFromList(Variant form, Variant grid, Variant descriptionVar, Variant valuesVar) throws Exception {
    List<Object> columnsNameList;
    
    String jOpen = "{";
    String jClose = "}";
    String width = "150";
    String align = null;
    String d = ":";
    String s = ",";
    String arrO = "[";
    String arrC = "]";
    StringBuilder cols = new StringBuilder();
    StringBuilder dataCol = new StringBuilder();
    StringBuilder script = new StringBuilder();    
    StringBuilder scriptb = new StringBuilder();
    StringBuilder scriptc = new StringBuilder();
    List<String> type = new ArrayList<String>();
    int sizeList = 0;
    boolean firstValue = true;
    
    //Obtém os tipos dos dados para setar cada coluna.
    List<List<Object>> lV = List.class.cast(valuesVar.getObject());
    int length = lV.size();
    if(length > 0){
      List<Object> lD = lV.get(0);
      for(Object data : lD){
        if(data instanceof Number){
          if(data.getClass().getSimpleName().equalsIgnoreCase("integer"))
            type.add("'integer'");
          else
            type.add("'numeric'");
            continue;
        } else if(data.getClass().getSimpleName().equalsIgnoreCase("boolean")){
            type.add("'boolean'");
            continue;
        }else if(data.getClass().getSimpleName().equalsIgnoreCase("date")){
          type.add("'date'");
          continue;
        }else{
          type.add("'text'");
          continue;
        }
      }
    }

    // Caso sejam definidas por parâmetros, as colunas serão substituídas por essas 
    if (descriptionVar.getObject() instanceof List) {
      columnsNameList = List.class.cast(descriptionVar.getObject());
    } else {
      columnsNameList = new ArrayList<Object>();
    }
      
    script.append("var grid = $c('").append(grid.toString()).append("', '").append(form.toString()).append("');\n");  
    script.append("grid.noRefresh=true;\n"); 

    script.append("grid.order = function(){};\n");
    
    boolean firstColumn = true;
    StringBuilder columnsName = new StringBuilder();
    int count = 0;
    ArrayList<Integer> arrCodes = new ArrayList<Integer>(columnsNameList.size());
    columnsName.append("[").append(jOpen);
    for (Object columnNameObj : columnsNameList) {       
      int code = (int) Math.round((Math.random() * 10) * (Math.random() * 100) * (Math.random() * 1000) * 1000);
      arrCodes.add(code);
      if (firstColumn) {
        firstColumn = false;
      } else {
        columnsName.append(", ");
        columnsName.append(jOpen);
      }

      String columnName = "";
      if (columnNameObj != null) {
        if (columnNameObj instanceof ArrayList) {
          columnName = Functions.stringToJs(((ArrayList)columnNameObj).get(0).toString());
          width = ((ArrayList)columnNameObj).get(1).toString();
          align = ((ArrayList)columnNameObj).get(2).toString();
          switch (align.toUpperCase()) {
            case "E" :
              align = "left";
              break;
            case "D" :
              align = "right";
              break;
            default :
              align = "center";
          }
        } else {
          columnName = Functions.stringToJs(columnNameObj.toString());
        }        
      }
      
      align = align == null ? "" : align;
      
      columnsName.append("name").append(d).append("'"+code+"'").append(s)
        .append("title").append(d).append("'"+columnName+"'").append(s)
        .append("width").append(d).append(width).append(s)
        .append("type").append(d).append(type.get(count)).append(s)
        .append("align").append(d).append("'" + align + "'").append(s)
        .append("canSort").append(d).append("false").append(jClose); 
      count++;
    }
    columnsName.append("]");

    script.append("grid.setAllColumns(").append(columnsName).append(");\n");

    dataCol.append("[\n").append(jOpen);

    if (valuesVar.getObject() instanceof List) {
      List<List<Object>> valuesList = List.class.cast(valuesVar.getObject());
      sizeList = valuesList.size();
      for (List<Object> valueList : valuesList) {
        if (firstValue) {
          firstValue = false;
        } else {
          dataCol.append(", ");
          dataCol.append(jOpen);
        }
        
        boolean firstRow = true;
        
        if (valueList != null) {
          count = 0;
          for (Object valueObj : valueList) {
            if (firstRow) {
              firstRow = false;
            } else {
              dataCol.append(", ");
            }

            String value = "";
            if (valueObj != null) {
              value = Functions.stringToJs(valueObj.toString());
            }
            //String col = Functions.stringToJs(.toString());
            dataCol.append("'"+arrCodes.get(count)+"'").append(d).append("'"+value+"'");
            count++;
          }
        }
        
        dataCol.append(jClose).append("\n");
      }
    }
    dataCol.append("]\n");
    
    script.append("grid.iscCanvas.setShowFilterEditor(false);\n"); 
    script.append("grid.setAllRecords("+dataCol+");");
    script.append("grid.setGridPageIni(0);\n");
    script.append("grid.setGridPageEnd(").append(sizeList).append(");\n");    
    scriptc.append(ebfToJSString(new Variant(script.toString())).getString()); 
    scriptb.append("!('mainform' in window) ? parent.ebfExecuteJSFromWindow(parent.mainform,'"+ scriptc.toString()+ "') : ebfExecuteJS('" + scriptc.toString()+ "')");      
    client.command(scriptb.toString());
    return Variant.VARIANT_NULL;
  }
```

---

## Grade - Recarregar Dados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridRefresh` |
| **Código** | 330 |
| **Assinatura** | `Grade - Recarregar Dados (Componente)` |
| **Parâmetros** | Componente |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Recarrega o componente grade com os dados atualizados em uma tabela (ResultSet) no servidor.

Parâmetro:
1. Nome da Grade. (Componente)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridRefresh(grid) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";    
  grid.actPaged = true;
  grid.paging.navigationAction(null, null, 'first');
}
```

---

## Grade - Remover Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridRemoveColumn` |
| **Código** | 140 |
| **Assinatura** | `Grade - Remover Coluna(Componente;Letras)` |
| **Parâmetros** | Componente;Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função remove uma coluna da Grade. 

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Nome da Coluna. (Letras)

Retorno:
Não possui.

Observação: 
Caso esta função seja utilizada em um formulário que possua barra de navegação, será necessário utiliza-la no evento
"Ao Navegar" do formulário, pois ao navegar a coluna que foi removida, será exibida novamente.

Exemplo: 
Assumindo que o nome da grade sendo "Estado" e o nome da coluna sendo "UF". Ao chamar esta função a coluna "UF" 
será removida da grade "Estado".

### Código Cliente (JavaScript)

```javascript
function ebfGridRemoveColumn(grid, column) {
  var gridName = grid;
  var grid = $c(grid);
  if (!grid){
    handleException(new Error("Componente "+gridName+" não encontrado"));
    return;
  }
  grid.removeColumn(column);  
}
```

---

## Grade - Remover Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridRemoveRow` |
| **Código** | 139 |
| **Assinatura** | `Grade - Remover Linha(Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função remove uma Linha da Grade. 

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Número da Linha (De 0 à N). (Inteiro)

Retorno:
Não possui.

Observação:
Quando utilizada em uma grade com cor condicional, a remoção da linha não implicará na redefinição da 
condição (propriedade cor condicional) da(s) linha(s) posterior(es) à linha excluída.

Exemplo: 
Assumindo que o nome da grade sendo: "Grade de Veículos" e o número da linha sendo 2. Ao usar esta função
a linha 2 será removida, assim como todo valor encontrado na mesma.

### Código Cliente (JavaScript)

```javascript
function ebfGridRemoveRow(grid, row) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado"; 
  grid.removeDataRow(row);
}
```

---

## Grade - Selecionar Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSelectRow` |
| **Código** | 138 |
| **Assinatura** | `Grade - Selecionar Linha(Componente;Inteiro)` |
| **Parâmetros** | Componente;Inteiro |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Essa função seleciona uma Linha da Grade. 

Parâmetro(s):
1. Nome da Grade. (Componente)
2. Número da Linha (De 0 à N). (Inteiro)

Retorno:
Não possui.

Exemplo: 
Assumindo que o nome da grade sendo: "Grade de Veículos" e o número da linha sendo 2. Ao usar esta função
a linha 2 será selecionada, assim como todo valor encontrado na mesma.

### Código Cliente (JavaScript)

```javascript
function ebfGridSelectRow(grid, row) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";  
  var lastRow = grid.getSelectedRow();  
  if(lastRow >= 0)  
    grid.clearSelectedRows(lastRow);      
  grid.timeout(grid.selectRow, 0, [parseInt(row)]);  
  grid.timeout(grid.selectionChanged, 0, []);
  grid.timeout(grid.moveScrollToRow, 0, [parseInt(row)]);  
  if (row < 0)
    grid.currentRow = -1;
}
```

---

## Grade - Somatório de uma Coluna

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridSumColumn` |
| **Código** | 336 |
| **Assinatura** | `Grade - Somatório de uma Coluna (Formulário;Componente;Letras): Número` |
| **Parâmetros** | Formulário;Componente;Letras |
| **Retorno** | Número |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função obtém o somatório dos os valores de um determinado campo de uma coluna na grade.

Parâmetro(s):
1. Formulário que contém a grade. 
2. Nome da Grade. (Componente)
3. Nome da Coluna. (Letras)

Retorno:
Somatório referente ao campo informado. (Número)

Observações:
1. Quando usada na camada cliente, retornará a soma dos valores de uma determinada coluna na grade. 
1.2. Quando estiver usando a "paginação" será retornado a soma dos valores da coluna e da página em questão/atual.
2. Na camada servidor o somatório dos valores da coluna é feita em todos os registros da grid (podendo estes estarem paginados ou não).
3. Essa função não pode ser utilizada em um fluxo servidor se for chamada a partir do evento "Ao modificar da Grade".

Exemplos:
1. Assumindo que o nome do Formulário seja: "Formulário Grade de Estados" o nome do componente grade sendo
"MakerGradeEstados" e na grade temos os campo: 'Código', 'Nome do Estado', 'PIB'. Assumindo que o 3 parâmetro
seja o campo PIB(Produto Interno Bruto), será retornado a soma de todos os PIBs da coluna desejada.
2. Assumindo que temos um campo IDADE e que os mesmos existes os seguintes valores ( 18,25,14,32,30,29 ).
O valor retornado será: (148), pois 18+25+14+32+30+29 = 148.

### Código Servidor (Java)

```java
protected final Variant ebfGridSumColumn(Variant formGuid, Variant gridName, Variant columnName) throws Exception {

    WFRForm form = client.getSystem().getFormByGuid(formGuid.toString());
    WFRComponent com = form.getComponentByName(gridName.toString());
    String gridFormGuid = com.getProperty(wfr.sys.HTMLInterface.ComponentProperty.CODIGO_FORM);
    WFRForm formGrid = client.getSystem().getForm(gridFormGuid, client.getData().connection());

    String field = "";
    for (WFRComponent c : formGrid.getAllComponents()) {

      if (c.getDescription().equals(columnName.toString())) {
        field = c.getField();
        break;
      }
    }

    double sum = 0;
    ResultSet rs = client.getData().getFormResultSet(formGrid.getCodeStr());
    int rowNum = rs.getRow();
    try {
      rs.beforeFirst();
      while (rs.next()) {
        sum += new Variant(rs.getObject(field)).getDouble();
      }
    } finally {
      if (rs != null) {
        rs.absolute(rowNum);
      }
    }

    return new Variant(sum);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfGridSumColumn(form, grid, column) {
  var sum = 0;
  var total = 0;
  var gridName = grid;
  var grid = $c(grid);
  if (!grid){
    handleException(new Error("Componente "+gridName+" não encontrado"));
    return;
  }  
  var qtdLinhas = grid.getRowCount();   
  var ref = grid.iscCanvas;
  for (var i =0; i<qtdLinhas ;i++){
    var data = grid.isFiltered ? ref.getOriginalData().localData[i] : ref.getDataSource().cacheData[i];
    var rNc = grid.getRealNameColumn(column);
    if(rNc === -1){
      handleException(new Error(getLocaleMessage("INFO.GRID_COLUMN_NOT_FOUND", column, grid.description ==="" ? gridName : grid.description)));
      return;
    }      
    sum = parseNumeric(data[rNc]);
    total = total + sum;      
  }
  return total;   
}
```

---

## Grade - Sumário - Exibir/Ocultar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridShowGridSummaryRow` |
| **Código** | 833 |
| **Assinatura** | `Grade - Sumário - Exibir/Ocultar (Componente;Lógico): Letras` |
| **Parâmetros** | Componente;Lógico |
| **Retorno** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Exibe ou oculta o sumário da grade.

Parâmetro(s):
1. Componente Grade. 
2. Exibir? (Lógico)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfGridShowGridSummaryRow(grid, show) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";     

  return grid.showGridSummaryRow(show); 
}
```

---

## Grade - Sumário - Obter Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetValueInSummary` |
| **Código** | 832 |
| **Assinatura** | `Grade - Sumário - Obter Valor (Componente;Letras): Letras` |
| **Parâmetros** | Componente;Letras |
| **Retorno** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém um valor específico no sumário da Grade, a partir da informação do nome da coluna.

Parâmetro(s):
1. Componente Grade. 
2. Nome da Coluna. (Letras)

Retorno:
Retorna o valor obtido do sumário da grade. (Letras)

Observação: 
É necessário habilitar Exibir Sumário Geral nas opções de Agrupamento.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetValueInSummary(grid, column) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";     

  return grid.getValueInSummary(column); 
}
```

---

## Grade - Sumário - Obter Valor no Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridGetValueInSummaryGroup` |
| **Código** | 845 |
| **Assinatura** | `Grade - Sumário - Obter Valor no Grupo (Componente;Letras;Letras): Variante` |
| **Parâmetros** | Componente;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Obtém um valor específico no sumário de um grupo, a partir das informações fornecidas à função.

Parâmetro(s):
1. Componente Grade. 
2. Nome do Grupo ou Objeto do Grupo. (Letras) 
3. Nome da Coluna na qual se deseja obter a sumarização. (Letras)

Retorno:
Retorna o valor obtido do sumário de um grupo. (Variante)

Observações: 
1. No 2° parâmetro pode ser passado tanto o nome referente ao grupo, quanto o próprio Objeto do grupo, obtido através de regras de negócio.
2. Ao passar um Objeto, a sumarização vai respeitar os dados contidos nesse Objeto.

### Código Cliente (JavaScript)

```javascript
function ebfGridGetValueInSummaryGroup(grid, group, column) {
  var grid = $c(grid);
  if (!grid)
    throw "Componente "+grid+" não encontrado";     

  return grid.getValueInSummaryGroup(group, column); 
}
```

---

## Grade - Voltar ao Modo de Navegação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGridEditableCancel` |
| **Código** | 261 |
| **Assinatura** | `Grade - Voltar ao Modo de Navegação (Letras)` |
| **Parâmetros** | Letras |
| **Tipo** | 17 |
| **Compatibilidade** | Cliente |

### Descrição

Volta ao modo de navegação da grade editável se ela estiver em modo de inserção ou em modo de edição.

Parâmetro:
1. Nome da Grade. (Letras)

Retorno:
Não possui.

Observação:
A grade precisa estar em um modo diferente de navegação.

### Código Cliente (JavaScript)

```javascript
function ebfGridEditableCancel(componentName) {
  var component = $c(componentName);
  if (component instanceof HTMLGrid) { 
    component.timeout(component.cancel, 0);  
  }
}
```

---

# Componentes JavaScript do Webrun

## Visão Geral

O Webrun utiliza **63 componentes JavaScript** que implementam a interface visual dos formulários criados no Maker AI. Todos os componentes seguem um padrão de herança baseado em prototypes JavaScript.

### Padrão de Implementação

```javascript
// Construtor
function HTMLEdit(sys, formID, code, posX, posY, width, height, description, value) {
  this.create(sys, formID, code, posX, posY, width, height, description, value);
  // ... inicialização específica
}

// Herança
HTMLEdit.inherits(HTMLLabeledComponent);

// Métodos via prototype
HTMLEdit.prototype.getValue = function() { ... };
HTMLEdit.prototype.setValue = function(value) { ... };
```

### Parâmetros Base (HTMLElementBase)

Todos os componentes visuais herdam de `HTMLElementBase` e recebem:

| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| `sys` | String | Código do sistema |
| `formID` | String | Código do formulário |
| `code` | String | Código do componente |
| `posX` | Number | Posição X (pixels) |
| `posY` | Number | Posição Y (pixels) |
| `width` | Number | Largura (pixels) |
| `height` | Number | Altura (pixels) |
| `description` | String | Descrição/label do componente |
| `value` | String | Valor inicial |

### Propriedades Base

| Propriedade | Padrão | Descrição |
|-------------|--------|-----------|
| `enabled` | `true` | Componente habilitado |
| `visible` | `true` | Componente visível |
| `readonly` | `false` | Apenas leitura |
| `required` | `false` | Campo obrigatório |
| `tabable` | `true` | Participa da tabulação |
| `zindex` | `1` | Ordem Z de empilhamento |
| `tagName` | `'input'` | Tag HTML gerada |

---

## Hierarquia de Herança

```
HTMLObject
└── HTMLElementBase
    ├── HTMLLabeledComponent
    │   ├── HTMLEdit
    │   │   └── HTMLMemo
    │   ├── HTMLLookup
    │   │   └── HTMLComboBox
    │   │       └── HTMLMultiSelect
    │   ├── HTMLAccordion
    │   └── HTMLSlider
    ├── HTMLGroupBox
    │   ├── HTMLRadioGroup
    │   ├── HTMLDetailPanel
    │   └── HTMLChat
    ├── HTMLGrid
    ├── HTMLButton
    │   └── HTMLNavigationButton
    ├── HTMLCheckbox
    ├── HTMLImage
    ├── HTMLDualList
    ├── HTMLChart
    └── (demais componentes)
```

---

## Mapa de Dependências

Cada componente pode depender de outros para funcionar. O arquivo `component-dependences.xml` define essas relações:

| Componente | Depende de |
|-----------|-----------|
| `HTMLAccordion` | `HTMLLabeledComponent` |
| `HTMLActionButton` | *(nenhuma)* |
| `HTMLButton` | *(nenhuma)* |
| `HTMLCalendar` | *(nenhuma)* |
| `HTMLChart` | `ImageObject`, `HTMLSerie` |
| `HTMLChat` | `HTMLGroupBox` |
| `HTMLCheckbox` | `HTMLHidden` |
| `HTMLComboBox` | `HTMLLookup` |
| `HTMLContainer` | *(nenhuma)* |
| `HTMLDetailPanel` | `HTMLGroupBox` |
| `HTMLDualList` | `ImageObject` |
| `HTMLEdit` | `HTMLLabeledComponent`, `HTMLLabel`, `ImageObject` |
| `HTMLGrid` | `HTMLNavigationGrid`, `HTMLPaging`, `ImageObject` |
| `HTMLGroupBox` | `HTMLLabel`, `HTMLContainer` |
| `HTMLHidden` | *(nenhuma)* |
| `HTMLImage` | `ImageObject` |
| `HTMLImageButton` | *(nenhuma)* |
| `HTMLImageGallery` | *(nenhuma)* |
| `HTMLIntegration` | *(nenhuma)* |
| `HTMLLabel` | *(nenhuma)* |
| `HTMLLabeledComponent` | *(nenhuma)* |
| `HTMLLookup` | `HTMLEdit`, `HTMLHidden`, `HTMLButton`, `ImageObject` |
| `HTMLMakerFlowComponent` | `HTMLButton`, `HTMLCheckbox`, `HTMLComboBox`, `HTMLContainer`, `HTMLEdit`, `HTMLGroupBox`, `HTMLImage`, `HTMLLabel`, `HTMLLookup` |
| `HTMLMemo` | `HTMLEdit` |
| `HTMLMultiSelect` | `HTMLComboBox` |
| `HTMLNavigationButton` | *(nenhuma)* |
| `HTMLNavigationButtonSameImage` | *(nenhuma)* |
| `HTMLNavigationGrid` | *(nenhuma)* |
| `HTMLPaging` | `HTMLButton` |
| `HTMLPlayer` | *(nenhuma)* |
| `HTMLProgressBar` | *(nenhuma)* |
| `HTMLQuery` | *(nenhuma)* |
| `HTMLRadioGroup` | `HTMLGroupBox`, `HTMLHidden` |
| `HTMLRssFeed` | *(nenhuma)* |
| `HTMLSerie` | *(nenhuma)* |
| `HTMLShape` | *(nenhuma)* |
| `HTMLShapeBase` | *(nenhuma)* |
| `HTMLSlider` | `HTMLLabeledComponent` |
| `HTMLSliderPanel` | *(nenhuma)* |
| `HTMLTimer` | *(nenhuma)* |
| `HTMLTreeViewLevel` | *(nenhuma)* |
| `HTMLTreeview` | *(nenhuma)* |
| `ImageObject` | *(nenhuma)* |

---

## Componentes por Categoria

### Base

*Classes base de todos os componentes*

#### `HTMLObject`

- **Linhas**: 1191

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `isEvent` | `function() { return true` |
| `getFunction` | `function() { return this.func` |
| `getOwner` | `function() { return this.owner` |
| `getParams` | `function() { return this.params` |
| `isObject` | `true` |
| `getSystem` | `function() { return this.sys` |
| `getForm` | `function() { return this.formID` |
| `getCode` | `function() { return this.code` |

**Métodos principais** (24 total):

| Método | Parâmetros |
|--------|------------|
| `method` | `name, func` |
| `trim` | `` |
| `isEvent` | `` |
| `callAction` | `` |
| `call` | `` |
| `apply` | `o, p` |
| `toString` | `` |
| `attachEvent` | `obj, type, fn, owner, params` |
| `removeEvent` | `obj, type` |
| `toString` | `` |
| `checkPost` | `` |
| `timeout` | `handler, delay, fparams` |
| `flush` | `` |
| `free` | `` |
| `loadScripts` | `` |

**Getters**: `getFunction`, `getOwner`, `getParams`, `getMaker`, `getSystem`, `getForm`, `getCode`, `getAction`, `getActionFunction`

---

#### `HTMLElementBase`

- **Herda de**: `HTMLObject`
- **Linhas**: 1745

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabKeys` | `[9, 10, 13]` |
| `tabable` | `true` |
| `zindex` | `1` |
| `tagName` | `'input'` |
| `canSelectOnFocus` | `true` |
| `canCheckRegularExpression` | `false` |
| `beforeSubmit` | `function() { }` |
| `afterSubmit` | `function() { }` |
| `updateLabel` | `function() { }` |
| `hasEmptyValue` | `function() { return (this.getValue() == '')` |
| `getHint` | `function() { return this.hint` |
| `getSystem` | `function() { return this.sys` |
| `getForm` | `function() { return this.formID` |
| `getCode` | `function() { return this.code` |
| `getX` | `function() { return this.posX` |
| ... | *(29 mais)* |

**Métodos principais** (125 total):

| Método | Parâmetros |
|--------|------------|
| `create` | `sys, formID, code, posX, posY, width, height, description, value` |
| `beforeSubmit` | `` |
| `afterSubmit` | `` |
| `isTrueVisible` | `` |
| `focus` | `` |
| `blur` | `` |
| `updateLabel` | `` |
| `hasEmptyValue` | `` |
| `isRequired` | `` |
| `canRemainNotDBAwareValue` | `` |
| `ensureVisibility` | `` |
| `toString` | `` |
| `decorateRequired` | `text, required` |
| `design` | `doc, tabControl` |
| `toPermissionMode` | `` |
| `permissionClick` | `doc` |
| `designComponent` | `doc` |
| `reDesign` | `` |
| `freeComponent` | `` |
| `free` | `dontRemoveFromDoc, dontCallEvents` |
| ... | *(47 mais)* |

**Getters**: `getBaseDiv`, `getTabName`, `getFocus`, `getHint`, `getSystem`, `getForm`, `getCode`, `getX`, `getY`, `getWidth` *e mais 18*

**Setters**: `setX`, `setY`, `setWidth`, `setHeight`, `setStyleCss`, `setValue`, `setDescription`, `setColor`, `setBGColor`, `setEnabled` *e mais 20*

---

#### `HTMLElementController`

- **Herda de**: `HTMLObject`
- **Linhas**: 531

**Métodos principais** (42 total):

| Método | Parâmetros |
|--------|------------|
| `checkRequireds` | `` |
| `doInvisibleComponents` | `` |
| `checkPost` | `` |
| `addForm` | `formCode, GUID` |
| `addFormInfo` | `name, code, GUID, loadTime` |
| `addNotTabable` | `o` |
| `addTabable` | `o` |
| `verifyComponent` | `obj` |
| `showLoadTime` | `` |
| `remove` | `o` |
| `focusFirst` | `` |
| `focusTabFirst` | `` |
| `focusXY` | `mx, my, offset` |
| `next` | `o, invert` |
| `sortOrderTab` | `` |
| `sortFn` | `a,b` |
| `removeNavigator` | `` |
| `flush` | `` |
| `hasSelectedComponent` | `` |
| `onComponentSelectionChangeAction` | `lastSelectedComponent, currentSelectedComponent` |
| ... | *(4 mais)* |

**Getters**: `getElements`, `getElementsByField`, `getElementById`, `getElementByCode`, `getElementsByTab`, `getElementByTab`, `getElementsByDiv`, `getElementsByForm`, `getAllElements`, `getTabableElements` *e mais 5*

**Setters**: `setSelectedComponent`, `setComponentSelectionChangeAction`, `setRightClickAction`

---

#### `HTMLLabeledComponent`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 130

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `labelDivHeight` | `15` |

**Métodos principais** (7 total):

| Método | Parâmetros |
|--------|------------|
| `createLabelDiv` | `` |
| `design` | `doc, tabControl` |
| `flush` | `` |
| `updateLabel` | `` |

**Setters**: `setDescription`, `setColor`, `setBGColor`

---

### Entrada de Dados

*Componentes para entrada e edição de dados*

#### `HTMLEdit`

- **Herda de**: `HTMLLabeledComponent`
- **Dependências**: `HTMLLabeledComponent`, `HTMLLabel`, `ImageObject`
- **Linhas**: 582

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tagName` | `'edit'` |
| `now` | `new Date()` |
| `actualMonth` | `HTMLEdit.prototype.now.getMonth()` |
| `actualYear` | `fourdigits(HTMLEdit.prototype.now.getYear())` |
| `canCheckRegularExpression` | `true` |

**Métodos principais** (27 total):

| Método | Parâmetros |
|--------|------------|
| `designInput` | `doc, name, value` |
| `designReport` | `` |
| `designComponent` | `doc` |
| `initDateTimePicker` | `` |
| `keydownAction` | `e` |
| `openDate` | `e` |
| `closeDate` | `` |
| `beforeSubmit` | `` |
| `afterSubmit` | `` |
| `dateTimePickerPositioning` | `` |
| `isDateType` | `` |

**Getters**: `getValue`, `getDateFormat`

**Setters**: `setHeight`, `setType`, `setMonth`, `setYear`, `setFont`, `setSize`, `setWeight`, `setItalic`, `setTextDecoration`, `setValidatedData` *e mais 4*

---

#### `HTMLMemo`

- **Herda de**: `HTMLEdit`
- **Dependências**: `HTMLEdit`
- **Linhas**: 432

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |
| `tagName` | `"edit"` |
| `tabKeys` | `[9]` |

**Métodos principais** (20 total):

| Método | Parâmetros |
|--------|------------|
| `designReport` | `` |
| `hasEmptyValue` | `` |
| `designInput` | `doc, name, value` |
| `handleSelectionChange` | `` |
| `insertHtmlAtCaret` | `html` |
| `keyupAction` | `e` |
| `defineTextByLength` | `e, unlimited` |
| `validateDataType` | `focus` |
| `focus` | `` |
| `isRichText` | `` |
| `richTextLoad` | `` |

**Getters**: `getSelection`, `getValue`, `getRichTextValue`

**Setters**: `setHeight`, `setReadOnly`, `setEnabled`, `setValue`, `setRichTextValue`, `setBGColor`

---

#### `HTMLComboBox`

- **Herda de**: `HTMLLookup`
- **Dependências**: `HTMLLookup`
- **Linhas**: 374

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tagName` | `'input'` |
| `lookupInit` | `function() {}` |
| `length` | `function() { return this.keys ? this.keys.length : this.values ? this.values.length : 0` |
| `itemAddedAction` | `function(key, value) { }` |
| `itemRemovedAction` | `function(key, value) { }` |

**Métodos principais** (21 total):

| Método | Parâmetros |
|--------|------------|
| `lookupInit` | `` |
| `checkKey` | `` |
| `add` | `key, value` |
| `removeByIndex` | `idx` |
| `removeByKey` | `key` |
| `clean` | `` |
| `length` | `` |
| `inputChanged` | `e, sel` |
| `designComponent` | `doc` |
| `showLookupResults` | `url, type, query` |
| `designPlaceholder` | `` |
| `designOption` | `key, value` |
| `itemAddedAction` | `key, value` |
| `itemRemovedAction` | `key, value` |

**Getters**: `getShowValue`, `getValue`, `getXMLData`

**Setters**: `setBGColor`, `setColor`, `setReadOnly`, `setValue`

---

#### `HTMLLookup`

- **Herda de**: `HTMLEdit`
- **Dependências**: `HTMLEdit`, `HTMLHidden`, `HTMLButton`, `ImageObject`
- **Linhas**: 1508

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |
| `tagName` | `'lookup'` |
| `canSelectOnFocus` | `false` |
| `defaultArrowWidth` | `17` |
| `defaultComponentHeight` | `21` |

**Métodos principais** (45 total):

| Método | Parâmetros |
|--------|------------|
| `validateDataType` | `` |
| `lookupInit` | `` |
| `designEditInput` | `doc, name, value` |
| `designInput` | `doc` |
| `designComponentReport` | `` |
| `designComponent` | `doc` |
| `doOnBlur` | `evt` |
| `doOnBlurTO` | `evt` |
| `checkKey` | `evt` |
| `openDetails` | `` |
| `showLookupResultsAction` | `obj, url` |
| `showLookupResults` | `url, type, query` |
| `showDataLookupResults` | `xmldoc` |
| `openForm` | `` |
| `openFormKeyboard` | `` |
| `changeLookupType` | `o, id` |
| `closeCurrentLookup` | `evt` |
| `lookupChangeSelectValue` | `e, sel` |
| `lookupChangeValue` | `v, t, add` |
| `lookupAddValue` | `text` |
| ... | *(11 mais)* |

**Getters**: `getValue`, `getShowValue`, `getDivDetails`, `getSearchLabel`, `getXMLDataOK`, `getXMLDataError`

**Setters**: `setVisible`, `setValue`, `setShowValue`, `setReadOnly`, `setEnabled`, `setColor`, `setBGColor`, `setHint`

---

#### `HTMLCheckbox`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `HTMLHidden`
- **Linhas**: 183

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (16 total):

| Método | Parâmetros |
|--------|------------|
| `updateLayout` | `` |
| `designComponent` | `doc` |
| `keyPressedAction` | `evt` |
| `clickAction` | `e, o` |
| `flush` | `` |

**Getters**: `getGridShowValue`, `getValue`, `getChecked`, `getValueByStatus`

**Setters**: `setEnabled`, `setHint`, `setReadOnly`, `setColor`, `setBGColor`, `setValue`, `setGridValue`

---

#### `HTMLRadioGroup`

- **Herda de**: `HTMLGroupBox`
- **Dependências**: `HTMLGroupBox`, `HTMLHidden`
- **Linhas**: 425

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |
| `ignore` | `true` |
| `tabable` | `true` |
| `setWidth` | `function(width) { }` |
| `setHeight` | `function(height) { }` |
| `isChecked` | `function() { return this.checked` |
| `getValue` | `function() { return this.value` |
| `getShowValue` | `function() { return this.description` |
| `setVisible` | `function(v) { this.visible = v` |
| `designDragComponent` | `function() { }` |
| `setDraggable` | `function(draggable) { }` |
| `setResizable` | `function(resizable) { }` |

**Métodos principais** (45 total):

| Método | Parâmetros |
|--------|------------|
| `focus` | `` |
| `blur` | `` |
| `designOptions` | `root, tabControl` |
| `designComponent` | `doc, tabControl` |
| `reDesign` | `tabControl` |
| `freeComponent` | `` |
| `add` | `value, label` |
| `removeByIndex` | `idx` |
| `removeByKey` | `key` |
| `focusNext` | `current` |
| `focusPrevious` | `current` |
| `updateImage` | `` |
| `designComponent` | `doc` |
| `keyPressedAction` | `e` |
| `isChecked` | `` |
| `click` | `e` |
| `designDragComponent` | `` |
| `flush` | `` |
| `toPermissionMode` | `` |

**Getters**: `getValue`, `getShowValue`, `getFocus`, `getValue`, `getShowValue`

**Setters**: `setFont`, `setWeight`, `setItalic`, `setTextDecoration`, `setSize`, `setEnabled`, `setVisible`, `setReadOnly`, `setColor`, `setColumns` *e mais 11*

---

#### `HTMLColorPicker`

- **Herda de**: `HTMLGroupBox`
- **Linhas**: 518

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `alphaMax` | `"ff"` |

**Métodos principais** (10 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `rgbToHex` | `rgb` |
| `hexToRgb` | `hex` |
| `rgbToHsl` | `r, g, b` |
| `convertFieldToValue` | `value, isFloat` |
| `updateColorInputs` | `color, updateValue` |
| `updateColorPicker` | `color, updateValue` |
| `toPermissionMode` | `` |

**Getters**: `getValue`

**Setters**: `setValue`

---

#### `HTMLSlider`

- **Herda de**: `HTMLLabeledComponent`
- **Dependências**: `HTMLLabeledComponent`
- **Linhas**: 139

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (6 total):

| Método | Parâmetros |
|--------|------------|
| `designInput` | `doc, name, value` |
| `designComponent` | `doc` |
| `updateSpan` | `` |
| `inputAction` | `e, o` |
| `changeAction` | `e, o` |

**Getters**: `getValue`

---

#### `HTMLMultiSelect`

- **Herda de**: `HTMLComboBox`
- **Dependências**: `HTMLComboBox`
- **Linhas**: 601

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (21 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `designDropdownItem` | `i, key, value` |
| `click` | `` |
| `keydownAction` | `e` |
| `focusNextOption` | `` |
| `focusPreviousOption` | `` |
| `focusFirstOption` | `` |
| `focusLastOption` | `` |
| `toggleFocusedOption` | `` |
| `toggleAllOptions` | `` |
| `openDropdown` | `` |
| `closeDropdown` | `` |
| `mouseDownAction` | `e, o` |
| `changeAction` | `e, o, dontCheckDependences` |
| `itemAddedAction` | `key, value` |
| `itemRemovedAction` | `key, value` |
| `updateLayout` | `` |
| `selectOption` | `key` |
| `unselectOption` | `key` |

**Setters**: `setValue`, `setHint`

---

#### `HTMLDualList`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `ImageObject`
- **Linhas**: 1085

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |
| `tagName` | `'duallist'` |
| `zIndex` | `301` |

**Métodos principais** (44 total):

| Método | Parâmetros |
|--------|------------|
| `fieldsLEFT` | `` |
| `fieldsRIGHT` | `` |
| `moveAllOptions` | `event, side, param` |
| `moveOption` | `event, side, param` |
| `invertSide` | `side` |
| `includeOption` | `select, value, text, param` |
| `addItem` | `select, value, text` |
| `contains` | `array, value` |
| `inputOption` | `value, side` |
| `deleteOption` | `select, index` |
| `designComponent` | `doc` |
| `createSelect` | `side` |
| `searchOption` | `side, query` |
| `selectKeyPressAction` | `evt, side` |
| `selectAll` | `select` |
| `doubleClickAction` | `target, side` |
| `validateSelect` | `select` |
| `createOption` | `value, text, side, query` |
| `focus` | `` |
| `clearInput` | `` |
| ... | *(13 mais)* |

**Getters**: `getInputValue`, `getOptionsArrays`, `getPermissionDescription`

**Setters**: `setDecorationObject`, `setDecorationLabelPrincipal`, `setDecorationLabelSelecionados`, `setDecorationDescriptionLEFT`, `setDecorationDescriptionRIGHT`, `setOptions`, `setReadOnly`, `setEnabled`

---

### Exibição

*Componentes de exibição de informações*

#### `HTMLLabel`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 162

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |

**Métodos principais** (10 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `doOnClick` | `e` |
| `focus` | `` |
| `blur` | `` |
| `flush` | `` |

**Getters**: `getPermissionDescription`

**Setters**: `setDescription`, `setValue`, `setHint`, `setColor`

---

#### `HTMLImage`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `ImageObject`
- **Linhas**: 1168

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `isBinary` | `true` |

**Métodos principais** (40 total):

| Método | Parâmetros |
|--------|------------|
| `hasEmptyValue` | `` |
| `designComponent` | `` |
| `reduceDimensions` | `dimensions, maxWidth, maxHeight` |
| `updateMagnifier` | `e` |
| `moveMagnifier` | `e` |
| `zoomClickAction` | `e` |
| `uploadClickAction` | `e` |
| `captureClickAction` | `e` |
| `updateLayout` | `` |
| `refresh` | `hasImage, fileMD5` |
| `touchEndAction` | `e, o` |
| `showMagnifier` | `` |
| `hideMagnifier` | `` |
| `toggleMagnifier` | `` |
| `clickAction` | `e, o` |
| `mouseEnterAction` | `e` |
| `mouseLeaveAction` | `e` |
| `canUpload` | `` |
| `isFooterVisible` | `` |
| `flush` | `` |

**Getters**: `getGridShowValue`, `getDimensionsForMagnifier`, `getCriptografado`, `getViewMode`, `getPositionMode`

**Setters**: `setEnabled`, `setVisible`, `setReadOnly`, `setHint`, `setValue`, `setDescription`, `setWidth`, `setHeight`, `setType`, `setFooterVisible` *e mais 5*

---

#### `HTMLImageGallery`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 726

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (30 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `refresh` | `` |
| `onFormLoadAction` | `` |
| `showPreloader` | `` |
| `hidePreloader` | `` |
| `updateList` | `` |
| `designItem` | `index, id` |
| `postUpdateList` | `` |
| `unselectImage` | `` |
| `selectImage` | `imageDiv, contextMenu` |
| `openDropdownMenu` | `x, y` |
| `closeDropdownMenu` | `` |
| `click` | `` |
| `clickAction` | `e, o` |
| `viewAction` | `e, o` |
| `downloadAction` | `e, o` |
| `deleteAction` | `e, o` |
| `refreshAction` | `e, o` |
| `contextMenuAction` | `e, o` |
| `uploadAction` | `e, o` |
| ... | *(1 mais)* |

**Getters**: `getCriptografado`, `getSelectedImage`, `getSelectedImageId`, `getSelectedImageUrl`, `getRequestURL`

**Setters**: `setEnabled`, `setReadOnly`, `setCriptografado`, `setVisible`

---

#### `HTMLProgressBar`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 129

**Métodos principais** (7 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `doc` |
| `close` | `` |

**Getters**: `getPercent`, `getDescription`, `getForm`

**Setters**: `setPercent`, `setDescription`

---

#### `HTMLPlayer`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 292

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (15 total):

| Método | Parâmetros |
|--------|------------|
| `play` | `` |
| `pause` | `` |
| `isPlaying` | `` |
| `addMediaToPlaylist` | `url, description` |
| `clearPlaylist` | `` |
| `designComponent` | `doc` |
| `mediaStarted` | `e` |
| `mediaEnded` | `e` |
| `mediaPaused` | `e` |
| `mediaError` | `e` |

**Getters**: `getPlayingMediaURL`, `getPlayingMediaDescription`, `getPlaylist`

**Setters**: `setEnabled`, `setSource`

---

#### `HTMLRssFeed`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 608

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (14 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `onFormLoadAction` | `` |
| `afterInit` | `` |
| `updateData` | `` |
| `showPreloader` | `` |
| `hidePreloader` | `` |
| `stopAnimation` | `` |
| `startAnimation` | `` |
| `animationTick` | `` |
| `truncateWithEllipses` | `text, max` |
| `designItem` | `element` |

**Getters**: `getRequestURL`, `getTextValue`

**Setters**: `setUrl`

---

#### `HTMLShape`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 1286

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `BALLOON_RADIX` | `30` |
| `COMMENT_RADIX` | `20` |
| `ARROW_RADIX` | `8` |
| `CIRCLE_TYPE` | `1` |
| `RECT_TYPE` | `2` |
| `DIAMOND_TYPE` | `3` |
| `BALLOON_TYPE` | `4` |
| `COMMENT_TYPE` | `5` |
| `SUBRULE_TYPE` | `6` |
| `ENDCIRCLE_TYPE` | `7` |
| `ARROW_FROM` | `-1` |
| `ARROW_TO` | `1` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |

**Métodos principais** (54 total):

| Método | Parâmetros |
|--------|------------|
| `loadScripts` | `` |
| `isCircle` | `` |
| `isRect` | `` |
| `isDiamond` | `` |
| `isBalloon` | `` |
| `isComment` | `` |
| `isSubRule` | `` |
| `isEndCircle` | `` |
| `designComponent` | `doc` |
| `drawRect` | `id` |
| `drawSubRule` | `` |
| `drawCircle` | `` |
| `drawEndCircle` | `` |
| `drawDiamond` | `` |
| `drawComment` | `` |
| `drawBalloon` | `` |
| `drawLine` | `id, x1, y1, x2, y2` |
| `drawArrowLine` | `id, fromShape, toShape, text` |
| `freeArrowLineAction` | `e, shape` |
| `onMouseOverArrowLine` | `e, shape` |
| ... | *(13 mais)* |

**Getters**: `getDescription`, `getDefault`, `getCodeType`, `getIntersectionPoint`, `getArrowPoints`, `getSurface`, `getShape`, `getId`

**Setters**: `setDescription`, `setFont`, `setSize`, `setWeight`, `setItalic`, `setUnderline`, `setStrikeout`, `setTextDecoration`, `setColor`, `setTextColor` *e mais 3*

---

#### `HTMLShapeBase`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 1087

**Métodos principais** (16 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `` |
| `beginPath` | `` |
| `toStroke` | `` |
| `toFill` | `` |
| `drawLineBase` | `x1,y1,color,lineWidth` |
| `toMove` | `x,y` |
| `drawLine` | `x1,y1,x2,y2,color,lineWidth` |
| `drawRect` | `x,y,width,height,fill,color,line,colorLine,lineWidth` |
| `drawCircle` | `x,y,radio,fill,color,line,colorLine,lineWidth` |
| `drawArc` | `x,y,radio, startAngleDegrees, endAngleDegrees, fill,color,line,colorLine,lineWidth, anticlockwise` |
| `drawQuadraticCurveBase` | `x1,y1,x2,y2,color,colorLine,lineWidth` |
| `drawQuadraticCurve` | `x1,y1,x2,y2,x3,y3,fill,color,line,colorLine,lineWidth` |
| `drawBezierCurveBase` | `x1,y1,x2,y2,x3,y3,color,colorLine,lineWidth` |
| `drawBezierCurve` | `x1,y1,x2,y2,x3,y3,fill,color,line,colorLine,lineWidth` |
| `drawRhombus` | `x1,y1,d1,d2,fill,color,line,colorLine,lineWidth` |
| `drawEllipse` | `x1,y1,a,b,fill,color,line,colorLine,lineWidth` |

---

### Contêineres

*Componentes que agrupam outros componentes*

#### `HTMLPanel`

- **Herda de**: `HTMLGroupBox`
- **Linhas**: 11

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

---

#### `HTMLGroupBox`

- **Herda de**: `HTMLContainer`
- **Dependências**: `HTMLLabel`, `HTMLContainer`
- **Linhas**: 282

**Métodos principais** (21 total):

| Método | Parâmetros |
|--------|------------|
| `designGroupBox` | `doc` |
| `updateLayout` | `` |
| `designComponent` | `doc` |
| `afterInit` | `` |
| `flush` | `` |
| `clearContent` | `` |
| `changeContent` | `html` |
| `openFilteredFormInFrame` | `formId, formFilter, scrollbars, border` |
| `openUrlInFrame` | `url, scrollbars, border` |
| `closeFrame` | `` |
| `handleFormOpen` | `formId, formDescription` |
| `handleFormClose` | `formId, formDescription` |
| `handleURLOpen` | `url` |
| `handleURLClose` | `url` |

**Setters**: `setStyle`, `setNoDescription`, `setX`, `setY`, `setWidth`, `setHeight`, `setVisible`

---

#### `HTMLTab`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 864

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `showTab` | `function() { }` |
| `onMouseOver` | `function(e, elem) { }` |
| `onMouseOut` | `function(e, elem) { }` |

**Métodos principais** (52 total):

| Método | Parâmetros |
|--------|------------|
| `toString` | `` |
| `view` | `` |
| `edit` | `` |
| `add` | `description, onclick, onexit, imgSrc` |
| `addSearchTab` | `description, onclick, onexit, imgSrc` |
| `addTab` | `description, onclick, onexit, imgSrc, searchTab` |
| `showTab` | `` |
| `openTabByIndex` | `index` |
| `openPreviousTab` | `` |
| `openNextTab` | `` |
| `openFirstTab` | `` |
| `openLastTab` | `` |
| `design` | `doc` |
| `flush` | `` |
| `openSearchTab` | `` |
| `openTab` | `name` |
| `design` | `doc, select` |
| `isSearchTab` | `` |
| `clickDivAction` | `e` |
| `cantSelect` | `e` |
| ... | *(19 mais)* |

**Getters**: `getTabByName`, `getTabByDiv`, `getDiv`, `getSelectedTabIndex`, `getSelectedTab`, `getTabInterval`, `getDistanceFromTop`, `getVisible`, `getDistanceFromTop`

**Setters**: `setSearchTabVisible`, `setBackgroundImage`, `setVisible`, `setVisible`

---

#### `HTMLTabComponent`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 723

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |

**Métodos principais** (21 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `addTab` | `id, title, onUndock, onUpdate` |
| `finalizeFormTab` | `formId` |
| `updateFormTab` | `formId, filter` |
| `activateTab` | `id` |
| `activateFormTab` | `formId` |
| `removeTab` | `id` |
| `removeFormTab` | `formId` |
| `removeTabByTitle` | `title` |
| `sendRequest` | `type, formId, params` |
| `openUndockedForm` | `formId, filter` |
| `adjustFormCode` | `formId` |
| `isDevelopmentMode` | `` |
| `closeTabWithMiddleMouseButton` | `event` |
| `toPermissionMode` | `` |

**Getters**: `getTabById`, `getTabByFormId`, `getTabByTitle`, `getRequestURL`, `getFormsInfos`

**Setters**: `setEnabled`

---

#### `HTMLContainer`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 75

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `zindex` | `0` |
| `tabable` | `false` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |
| `toPermissionMode` | `function() { }` |

**Métodos principais** (10 total):

| Método | Parâmetros |
|--------|------------|
| `focus` | `` |
| `blur` | `` |
| `toPermissionMode` | `` |
| `designComponent` | `doc` |
| `afterInit` | `` |
| `canFocus` | `` |
| `addShownListener` | `callback` |
| `removeShownListener` | `callback` |

**Setters**: `setEnabled`, `setVisible`

---

#### `HTMLAccordion`

- **Herda de**: `HTMLLabeledComponent`
- **Dependências**: `HTMLLabeledComponent`
- **Linhas**: 515

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (16 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `onFormLoadAction` | `` |
| `refresh` | `` |
| `showPreloader` | `` |
| `hidePreloader` | `` |
| `checkServerResponse` | `response` |
| `updateSections` | `` |
| `designSections` | `serverData` |
| `designSection` | `i, type, title, content` |
| `separateTitleParts` | `title` |
| `click` | `` |
| `expandAction` | `accordionItem` |
| `collapseAction` | `accordionItem` |
| `sendRequest` | `params, cbSuccess, cbError` |
| `openFormInSection` | `nameSection, formId` |
| `buildFormUrl` | `formId` |

---

#### `HTMLDetailPanel`

- **Herda de**: `HTMLGroupBox`
- **Dependências**: `HTMLGroupBox`
- **Linhas**: 126

**Métodos principais** (8 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `add` | `comp` |
| `freeComponent` | `` |

**Setters**: `setX`, `setY`, `setVisible`, `setEnabled`, `setReadOnly`

---

#### `HTMLSliderPanel`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 215

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (3 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `parseData` | `data` |
| `updateProperties` | `` |

---

#### `HTMLPage`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 67

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `ignore` | `true` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |

**Métodos principais** (4 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `load` | `e` |
| `focus` | `` |
| `blur` | `` |

---

### Grids e Tabelas

*Componentes de grade de dados*

#### `HTMLGrid`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `HTMLNavigationGrid`, `HTMLPaging`, `ImageObject`
- **Linhas**: 4602

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `zindex` | `99999` |
| `resetRowColor` | `function () { }` |
| `setNumericFormat` | `function () { }` |
| `afterInsert` | `function () { }` |
| `completeNotPost` | `function () { }` |

**Métodos principais** (199 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `` |
| `createFooterRegisters` | `` |
| `paintFlow` | `flowCondition, record, row, column` |
| `paintExpression` | `expressions, record, row, column` |
| `paintRow` | `column, columnsPaint, color` |
| `exportData` | `type` |
| `groupOperation` | `records, summaryField, operation` |
| `clearSelectedRows` | `rowNum` |
| `showNormalElements` | `` |
| `checkShowBar` | `` |
| `cancel` | `` |
| `edit` | `` |
| `cancelEdit` | `` |
| `completeEdit` | `` |
| `cancelInclude` | `` |
| `completeCancelInclude` | `` |
| `include` | `` |
| `addColumn` | `column` |
| `findColumn` | `column, rendered` |
| `findInSummary` | `name, data` |
| ... | *(115 mais)* |

**Getters**: `getPrimaryColor`, `getRecord`, `getValueData`, `getCellData`, `getSelectedRow`, `getRowDBCursor`, `getSelectedRows`, `getSelectedRecord`, `getSelectedRecords`, `getRowCount` *e mais 25*

**Setters**: `setColumn`, `setColumns`, `setColumnSize`, `setData`, `setShowColumn`, `setSizeColumns`, `setAllColumns`, `setAllRecords`, `setCellDataByColumn`, `setCellDataByColumnNoRefresh` *e mais 19*

---

#### `HTMLNavigationGrid`

- **Herda de**: `HTMLNavigation`
- **Linhas**: 286

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `ensureVisibility` | `function() { }` |

**Métodos principais** (23 total):

| Método | Parâmetros |
|--------|------------|
| `createButton` | `param, description, hint, onclick, icon` |
| `updateLayout` | `` |
| `showNav` | `show` |
| `createElement` | `p` |
| `actInclude` | `` |
| `actEdit` | `` |
| `actDelete` | `` |
| `actRefresh` | `` |
| `actFields` | `` |
| `actEditSave` | `` |
| `actEditCancel` | `` |
| `actIncludeSave` | `` |
| `actIncludeCancel` | `` |
| `ensureVisibility` | `` |
| `toggleButtons` | `b` |
| `enableButtons` | `enable` |
| `checkButtons` | `` |

**Setters**: `setReadOnly`, `setEnabled`, `setVisible`, `setMainImages`, `setEditImages`, `setVisibleSeparator`

---

#### `HTMLPaging`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `HTMLButton`
- **Linhas**: 172

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `setReadOnly` | `function(v) { }` |
| `createSameImageButton` | `function(param, hint, img, additionalClassName) { }` |
| `flush` | `function() { }` |

**Métodos principais** (14 total):

| Método | Parâmetros |
|--------|------------|
| `navigationAction` | `e, obj, param, sync` |
| `createButton` | `param, hint, icon, isPage` |
| `createSameImageButton` | `param, hint, img, additionalClassName` |
| `design` | `grid` |
| `enableButtons` | `f, p, n, l` |
| `toString` | `` |
| `flush` | `` |

**Setters**: `setGoto`, `setReadOnly`, `setEnabled`, `setDisabled`, `setEnabled`, `setNumPages`, `setVisible`

---

#### `HTMLQuery`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 654

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (16 total):

| Método | Parâmetros |
|--------|------------|
| `formatColumn` | `value, row` |
| `designComponent` | `doc` |
| `showPreloader` | `` |
| `hidePreloader` | `` |
| `checkServerResponse` | `response` |
| `updateData` | `` |
| `updateLayout` | `` |
| `searchAction` | `` |
| `filterForm` | `form, filters` |
| `nextPageAction` | `` |
| `previousPageAction` | `` |
| `firstPageAction` | `` |
| `refreshAction` | `` |
| `sendRequest` | `type, params, cbSuccess, cbError` |

**Getters**: `getRequestURL`

**Setters**: `setEnabled`

---

### Navegação

*Componentes de navegação e botões*

#### `HTMLButton`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 380

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabKeys` | `[9]` |
| `tabable` | `true` |
| `zindex` | `100000` |
| `isBinary` | `true` |

**Métodos principais** (25 total):

| Método | Parâmetros |
|--------|------------|
| `updateEvent` | `evt` |
| `design` | `doc, tabControl` |
| `designComponent` | `doc` |
| `focus` | `` |
| `blur` | `` |
| `click` | `` |
| `finalizeAction` | `filename` |
| `refresh` | `arg, filename` |
| `createUploadAction` | `` |
| `openUpload` | `` |
| `clickAction` | `e, o` |
| `keydownAction` | `e` |

**Getters**: `getGridShowValue`

**Setters**: `setDescription`, `setColor`, `setBGColor`, `setFont`, `setSize`, `setWidth`, `setHeight`, `setOnClick`, `setReadOnly`, `setEnabled` *e mais 2*

---

#### `HTMLImageButton`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 137

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |
| `zindex` | `11` |
| `tabKeys` | `[9]` |
| `tagName` | `'a'` |

**Métodos principais** (11 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `onmouseover` | `e` |
| `onmouseout` | `` |
| `canFocus` | `` |
| `focus` | `` |
| `click` | `e` |
| `onclickActionWrapper` | `e` |

**Setters**: `setImage`, `setOnClick`, `setEnabled`, `setReadOnly`

---

#### `HTMLActionButton`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 269

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (14 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `click` | `` |
| `mouseDownAction` | `e, o` |
| `mouseUpAction` | `e, o` |
| `clickAction` | `e, o` |
| `mouseEnterAction` | `e, o` |
| `mouseLeaveAction` | `e, o` |
| `updateImage` | `` |
| `toPermissionMode` | `` |

**Setters**: `setEnabled`, `setVisible`, `setHeight`, `setImages`, `setHint`

---

#### `HTMLNavigationButton`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 131

**Métodos principais** (6 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `doc, tabControl` |
| `designComponent` | `doc` |
| `clickAction` | `e, o` |
| `click` | `e` |

**Setters**: `setVisible`, `setEnabled`

---

#### `HTMLNavigationButtonSingleImage`

- **Herda de**: `HTMLImageButton`
- **Linhas**: 120

**Métodos principais** (6 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `doc, tabControl` |
| `designComponent` | `doc` |
| `onmouseover` | `e` |
| `onmouseout` | `` |

**Setters**: `setVisible`, `setEnabled`

---

#### `HTMLNavigation`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 247

**Métodos principais** (23 total):

| Método | Parâmetros |
|--------|------------|
| `create` | `sys, formID, posX, posY, width, height` |
| `createButton` | `img, description, hint, onclick, space, div, width, tab, visible, id` |
| `addMainButton` | `img, hint, onclick, width, tab, id` |
| `addEditButton` | `img, description, hint, onclick, tab, width, id` |
| `addIncludeButton` | `img, description, hint, onclick, tab, width, id` |
| `addDesignButton` | `img, description, hint, onclick, tab, width, id` |
| `btVisible` | `arr, v` |
| `edit` | `` |
| `insert` | `` |
| `normal` | `` |
| `formDesign` | `` |
| `query` | `` |
| `freeComponent` | `` |
| `design` | `doc` |
| `toString` | `` |
| `flush` | `` |

**Getters**: `getMode`, `getDiv`

**Setters**: `setReadOnly`, `setEnabled`, `setVisible`, `setTabController`, `setAlertController`

---

#### `HTMLNavigationForm`

- **Herda de**: `HTMLNavigation`
- **Linhas**: 817

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `iconsSize` | `28` |

**Métodos principais** (45 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `doc, tabControl` |
| `freeButtons` | `` |
| `execAjaxEval` | `param` |
| `execAjaxEvalSync` | `param` |
| `actInclude` | `` |
| `actIncludeSync` | `` |
| `actEdit` | `` |
| `actEditSync` | `` |
| `actFirst` | `` |
| `actFirstSync` | `` |
| `actPrevious` | `` |
| `actPreviousSync` | `` |
| `actNext` | `` |
| `actNextSync` | `` |
| `actLast` | `` |
| `actLastSync` | `` |
| `actGoto` | `row` |
| `actGotoSync` | `row` |
| `actDelete` | `` |
| `actRefresh` | `` |
| ... | *(20 mais)* |

**Getters**: `getMaker`

**Setters**: `setMainImages`, `setEditImages`, `setIncludeImages`, `setEnabled`

---

#### `HTMLNavigationQuery`

- **Herda de**: `HTMLObject`
- **Linhas**: 1540

**Métodos principais** (50 total):

| Método | Parâmetros |
|--------|------------|
| `isAdvancedQuery` | `` |
| `design` | `doc` |
| `designDivider` | `` |
| `designItem` | `id, action, enabled, icon, title` |
| `designItemDropdown` | `id, action, enabled, icon, title` |
| `designDropdownTitle` | `dropdown, title` |
| `designDropdownDivider` | `dropdown` |
| `designDropdownItem` | `dropdown, id, title, action` |
| `assignGridField` | `dropdown, index, field, fieldName, fieldVisible, fieldSize, fieldRealName` |
| `finishDropdownDesign` | `dropdown, defaultItem` |
| `saveCustomizations` | `reload` |
| `navigateToRegistry` | `gridini, gridrn` |
| `navigationAction` | `action, param` |
| `updateGrid` | `` |
| `addGridRow` | `values` |
| `clearGrid` | `` |
| `clearFilters` | `` |
| `search` | `` |
| `updateLayout` | `` |
| `updateFieldsLayout` | `` |
| ... | *(21 mais)* |

**Getters**: `getGridFirstRow`, `getGridTotalRows`

**Setters**: `setPaginationState`, `setDocument`, `setGridFirstRow`, `setGridTotalRows`, `setOrderState`, `setAdvancedQuery`, `setGridSizes`

---

### Visualização

*Componentes de gráfico, calendário e árvore*

#### `HTMLChart`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `ImageObject`, `HTMLSerie`
- **Linhas**: 721

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `zindex` | `2` |

**Métodos principais** (12 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `` |
| `doOnClick` | `` |
| `processSeries` | `` |
| `processOption` | `` |
| `refreshChart` | `` |

**Getters**: `getPermissionDescription`, `getXAxis`, `getYAxis`, `getOptionByType`

**Setters**: `setUrl`, `setHint`, `setVisible`

---

#### `HTMLSerie`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 33

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `zindex` | `0` |

**Métodos principais** (2 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `toPermissionMode` | `` |

---

#### `HTMLCalendar`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 2099

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `logedOnGoogle` | `false` |
| `tabable` | `true` |
| `utcDateFormat` | `"YYYY-MM-DD"` |
| `utcTimeFormat` | `"HH:mm:ss"` |
| `requestDateTimeFormat` | `"yyyy-MM-dd HH:mm:ss"` |

**Métodos principais** (53 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `onFormLoadAction` | `` |
| `afterInit` | `` |
| `updateLayout` | `` |
| `updateData` | `` |
| `hasEditForm` | `` |
| `canDelete` | `` |
| `isEditViable` | `` |
| `canAdd` | `` |
| `canEdit` | `` |
| `canEditViaModal` | `` |
| `canEditDragging` | `` |
| `canEditResizing` | `` |
| `hasActionInEvents` | `` |
| `clearEvents` | `` |
| `click` | `` |
| `clickAction` | `e` |
| `selectDateAction` | `e` |
| `contextMenuAction` | `e` |
| `openDropdownMenu` | `type, x, y` |
| ... | *(27 mais)* |

**Getters**: `getYear`, `getMonth`, `getStorageName`

**Setters**: `setEnabled`, `setVisible`, `setReadOnly`

---

#### `HTMLTreeview`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 513

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `zindex` | `100000` |
| `imageHeight` | `24` |
| `show` | `function() { }` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |

**Métodos principais** (49 total):

| Método | Parâmetros |
|--------|------------|
| `clean` | `` |
| `filter` | `value` |
| `attachEvent` | `obj, type, fn, owner, params` |
| `designComponent` | `doc` |
| `hideTree` | `` |
| `showTree` | `` |
| `show` | `` |
| `elementAdded` | `node` |
| `elementRemoved` | `node` |
| `focus` | `` |
| `blur` | `` |
| `addChild` | `parentElement, caption, link, target, isOpen` |
| `associateRuleToElement` | `element, ruleName, ruleParams` |
| `addChildByElement` | `parentElement, element` |
| `createElement` | `caption, link, target` |
| `removeElement` | `element` |
| `useRadioControl` | `bool` |
| `useCheckBox` | `bool` |
| `useAutoCollapse` | `bool` |
| `removeAllChilds` | `` |
| ... | *(4 mais)* |

**Getters**: `getRoot`, `getTree`, `getElementDBInfo`, `getElementByName`, `getChildIndexById`, `getHoveredElement`, `getActiveElement`, `getElement`, `getDataContainer`, `getMaxCode` *e mais 1*

**Setters**: `setColor`, `setIcon`, `setIconsHeight`, `setFontStyle`, `setElementDBInfo`, `setElementDBCodeInfo`, `setActiveElement`, `setOnClickEvt`, `setOnDblClickEvt`, `setOnBeforeOpenEvt` *e mais 4*

---

#### `HTMLTreeviewNode`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 552

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `designComponent` | `function(doc) { }` |

**Métodos principais** (25 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `doc, tabControl` |
| `designComponent` | `doc` |
| `attachEvent` | `obj, type, fn, owner, params` |
| `addChild` | `caption, link, target, isOpen` |
| `removeIcon` | `` |
| `findChildById` | `id` |
| `findChildByCaption` | `caption` |
| `removeAllChilds` | `` |
| `deleteSelf` | `` |
| `open` | `` |
| `close` | `` |
| `expandAll` | `` |
| `collapseAll` | `` |
| `toggleExpand` | `event` |
| `clickAction` | `e, o` |
| `dblClickAction` | `e, o` |
| `contextMenuAction` | `e` |
| `elementAdded` | `node` |
| `elementRemoved` | `node` |

**Getters**: `getRoot`, `getChildIndexById`, `getElementDBInfo`

**Setters**: `setIcon`, `setElementDBInfo`, `setOpenState`

---

#### `HTMLTreeViewLevel`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 19

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `zindex` | `99999` |
| `designComponent` | `function(doc) { }` |

**Métodos principais** (1 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |

---

#### `HTMLCard`

- **Herda de**: `HTMLGroupBox`
- **Linhas**: 692

**Métodos principais** (49 total):

| Método | Parâmetros |
|--------|------------|
| `afterInit` | `` |
| `designComponent` | `` |
| `refresh` | `` |
| `checkFillOutCard` | `` |
| `checkContent` | `` |
| `somePropertyField` | `` |
| `addEventOnCard` | `event, flow, params` |
| `fillOutCard` | `title, bodyTitle, bodyText, footerText, image` |
| `createElementWithClass` | `elem, className` |
| `createHeader` | `elem` |
| `createBody` | `elem` |
| `createBodyTitle` | `elem` |
| `createBodyText` | `elem` |
| `createFooter` | `elem` |
| `hasImage` | `` |
| `createImage` | `` |
| `drawCard` | `card` |
| `designCardWithImage` | `` |
| `hasContent` | `content` |
| `addData` | `title, bodyTitle, bodyText, footerText, image` |
| ... | *(15 mais)* |

**Getters**: `getContentRequest`, `getStatusResponse`, `getFormData`, `getEndpoint`

**Setters**: `setFont`, `setSize`, `setWeight`, `setItalic`, `setTextDecoration`, `setImageSource`, `setNoContent`, `setTextAlignment`, `setBackground`, `setHint`

---

### Interação

*Componentes de interação e comunicação*

#### `HTMLChat`

- **Herda de**: `HTMLGroupBox`
- **Dependências**: `HTMLGroupBox`
- **Linhas**: 7956

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |
| `utcDateFormat` | `"YYYY-MM-DD"` |
| `utcTimeFormat` | `"HH:mm:ss"` |
| `imageMimeType` | `"image/png"` |
| `imageFileExtension` | `".png"` |
| `audioMimeType` | `"audio/webm"` |
| `audioFileExtension` | `".webm"` |
| `protocol` | `getAbsolutContextPath().startsWith("https://") ? "wss://" : "ws://"` |
| `dragItemActionInterval` | `250` |
| `BLUR_RADIUS` | `5` |

**Métodos principais** (106 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `createImageUser` | `containerUserName, imageSource` |
| `createIconDefaultUser` | `containerUserName` |
| `createNameUser` | `containerUserName` |
| `afterInit` | `` |
| `onFormLoadAction` | `` |
| `updateData` | `silent, forceUpdateImage` |
| `designAuthError` | `` |
| `designUnknownError` | `` |
| `clearCachedContainers` | `` |
| `designContainerItem` | `doc,
  container,
  index,
  query,
  action,
  forceUpdateImage` |
| `showPreloader` | `` |
| `hidePreloader` | `` |
| `showChatMessage` | `title, message, icon` |
| `hideChatMessage` | `` |
| `openConversation` | `index` |
| `connect` | `endpoint` |
| `onConnected` | `e` |
| `onDisconnected` | `e` |
| `onMessageReceived` | `e` |
| ... | *(63 mais)* |

**Getters**: `getRequestURL`, `getFileUploadURL`, `getUserById`, `getGroupById`, `getInstanceId`, `getUserMedia`, `getUniqueId`, `getState`, `getSectionByDate`, `getMessageById` *e mais 5*

**Setters**: `setEnabled`, `setVisible`, `setReadOnly`, `setActive`, `setState`, `setLastMessageContent`, `setMessageStatus`, `setTotalUnreadMessages`

---

#### `HTMLMessage`

- **Linhas**: 1089

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `getParentNotifyDiv` | `function(alignment) { return this.context` |

**Métodos principais** (19 total):

| Método | Parâmetros |
|--------|------------|
| `showWarningMessage` | `title, message, timer, alignment` |
| `showSuccessMessage` | `title, message, timer, alignment` |
| `showInfoMessage` | `title, message, timer, alignment, extended` |
| `showErrorMessage` | `title, message, timer, details, alignment, extended` |
| `showPromptMessage` | `title, message, placeholder, funcOk, paramsOk, funcCancel, paramsCancel` |
| `showInteractionConfirmMessage` | `title, message, funcOk, paramsOk, funcCancel, paramsCancel, alignment, labelOk, labelCancel` |
| `clickOk` | `div, params, type` |
| `clickCancel` | `div, params, type` |
| `showMessage` | `` |
| `closeAllNotifies` | `` |
| `closeMessage` | `div` |
| `showWithSweetAlert` | `type` |
| `embeddedSweetalert` | `type, mod` |
| `toastMessage` | `title, message, type, position, timer` |
| `parseAlignment` | `align` |
| `checkBody` | `` |
| `checkNullOrEmpty` | `value` |

**Getters**: `getParentNotifyDiv`

**Setters**: `setAlignment`

---

#### `HTMLAlert`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 363

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `setColor` | `function(color) { this.color = color` |
| `setBGColor` | `function(color) { this.bgColor = color` |
| `setVisible` | `function(v) { this.visible = v` |
| `setFont` | `function(f) { }` |

**Métodos principais** (17 total):

| Método | Parâmetros |
|--------|------------|
| `showFilter` | `v` |
| `showInclude` | `v` |
| `showEdit` | `v` |
| `showProcessing` | `v` |
| `showError` | `v` |
| `lock` | `` |
| `unLock` | `` |
| `recall` | `` |
| `design` | `doc` |
| `createAlert` | `src, oc, place, zindex, description, closeable` |
| `flush` | `` |

**Setters**: `setStatus`, `setColor`, `setBGColor`, `setVisible`, `setFont`, `setToastVisible`

---

#### `HTMLUploadComponent`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 573

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `zindex` | `0` |
| `tabable` | `false` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |
| `toPermissionMode` | `function () { }` |

**Métodos principais** (13 total):

| Método | Parâmetros |
|--------|------------|
| `focus` | `` |
| `blur` | `` |
| `toPermissionMode` | `` |
| `unhighlight` | `` |
| `clearComponent` | `` |
| `showUploadPanel` | `` |
| `designComponent` | `doc` |
| `formatBytes` | `bytes` |
| `onDropFiles` | `files` |
| `showUploadFilesList` | `files` |
| `uploadFiles` | `files` |
| `toPermissionMode` | `` |

**Setters**: `setEnabled`

---

#### `HTMLWait`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 32

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |
| `show` | `function() { this.div.style.display = "block"` |
| `hide` | `function() { this.div.style.display = "none"` |
| `setIcon` | `function(url) { }` |

**Métodos principais** (4 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `show` | `` |
| `hide` | `` |

**Setters**: `setIcon`

---

#### `HTMLTimer`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 409

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `true` |

**Métodos principais** (16 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `start` | `` |
| `isStopped` | `` |
| `isPaused` | `` |
| `isStarted` | `` |
| `pause` | `` |
| `stop` | `` |
| `reset` | `` |
| `updateLayout` | `` |

**Getters**: `getTimerNumeric`, `getTimerMoment`, `getTimerString`

**Setters**: `setEnabled`, `setWeight`, `setStartTime`, `setValue`

---

### Especiais

*Componentes especiais e de integração*

#### `HTMLHidden`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 38

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `isRequired` | `function() { return this.required` |
| `getCode` | `function() { return this.code` |
| `setDecoration` | `function() { }` |
| `setX` | `function(posX) { }` |
| `setY` | `function(posY) { }` |
| `focus` | `function() { return false` |
| `blur` | `function() { return false` |
| `setVisible` | `function() { return false` |
| `setReadOnly` | `function() { return false` |
| `setEnabled` | `function() { return false` |
| `toString` | `function() { return "[object HTMLHidden]"` |
| `toPermissionMode` | `function() { }` |

**Métodos principais** (14 total):

| Método | Parâmetros |
|--------|------------|
| `isRequired` | `` |
| `design` | `doc` |
| `focus` | `` |
| `blur` | `` |
| `toString` | `` |
| `toPermissionMode` | `` |

**Getters**: `getCode`

**Setters**: `setValue`, `setDecoration`, `setX`, `setY`, `setVisible`, `setReadOnly`, `setEnabled`

---

#### `HTMLIntegration`

- **Herda de**: `HTMLElementBase`
- **Linhas**: 265

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabable` | `false` |

**Métodos principais** (7 total):

| Método | Parâmetros |
|--------|------------|
| `designComponent` | `doc` |
| `afterInit` | `` |
| `designLibrary` | `lib` |
| `inner` | `html, css, js` |
| `assignEvents` | `events` |
| `afterLoad` | `` |

**Getters**: `getElementById`

---

#### `HTMLMakerController`

- **Linhas**: 510

**Métodos principais** (47 total):

| Método | Parâmetros |
|--------|------------|
| `toString` | `` |
| `create` | `sys, formID` |
| `editMode` | `` |
| `cancelChanges` | `` |
| `saveToDatabase` | `` |
| `loadFromDatabase` | `` |
| `showInspector` | `component` |
| `applyUpdates` | `` |
| `hasComponent` | `comName` |
| `addPropToType` | `comType, propName, propDesc, isEvent, defValue` |
| `newHTMLEdit` | `code` |
| `newHTMLButton` | `code` |
| `newHTMLRadioGroup` | `code` |
| `newHTMLLabel` | `code` |
| `newHTMLCheckbox` | `code` |
| `newHTMLLookup` | `code` |
| `newHTMLImage` | `code` |
| `newHTMLComboBox` | `code` |
| `newHTMLMemo` | `code` |
| `newHTMLGroupBox` | `code` |
| ... | *(7 mais)* |

**Getters**: `getProp`, `getPropCount`, `getEvent`, `getEventsFromType`, `getPropsFromType`, `getDefaultValue`, `getFullPropList`, `getNextComponentCode`, `getMaker`, `getComponentType` *e mais 6*

**Setters**: `setProp`, `setEvent`, `setProp`, `setEvent`

---

#### `HTMLMakerFlowComponent`

- **Herda de**: `HTMLElementBase`
- **Dependências**: `HTMLButton`, `HTMLCheckbox`, `HTMLComboBox`, `HTMLContainer`, `HTMLEdit`, `HTMLGroupBox`, `HTMLImage`, `HTMLLabel`, `HTMLLookup`
- **Linhas**: 147

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `tabKeys` | `[9]` |
| `tabable` | `true` |
| `zindex` | `100000` |
| `isBinary` | `true` |

**Métodos principais** (14 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `ruleName, componentParameters` |
| `inner` | `ruleName, componentParameters, action` |
| `init` | `` |
| `free` | `` |

**Getters**: `getVisible`, `getHeight`, `getWidth`, `getX`, `getY`

**Setters**: `setVisible`, `setEnabled`, `setX`, `setY`, `setValue`

---

#### `HTMLPermissionForm`

- **Herda de**: `HTMLObject`
- **Linhas**: 131

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `zindex` | `1000002` |

**Métodos principais** (3 total):

| Método | Parâmetros |
|--------|------------|
| `design` | `` |
| `toString` | `` |
| `sorted` | `` |

---

#### `HTMLObject`

- **Linhas**: 1191

**Propriedades:**

| Propriedade | Valor Padrão |
|-------------|-------------|
| `isEvent` | `function() { return true` |
| `getFunction` | `function() { return this.func` |
| `getOwner` | `function() { return this.owner` |
| `getParams` | `function() { return this.params` |
| `isObject` | `true` |
| `getSystem` | `function() { return this.sys` |
| `getForm` | `function() { return this.formID` |
| `getCode` | `function() { return this.code` |

**Métodos principais** (24 total):

| Método | Parâmetros |
|--------|------------|
| `method` | `name, func` |
| `trim` | `` |
| `isEvent` | `` |
| `callAction` | `` |
| `call` | `` |
| `apply` | `o, p` |
| `toString` | `` |
| `attachEvent` | `obj, type, fn, owner, params` |
| `removeEvent` | `obj, type` |
| `toString` | `` |
| `checkPost` | `` |
| `timeout` | `handler, delay, fparams` |
| `flush` | `` |
| `free` | `` |
| `loadScripts` | `` |

**Getters**: `getFunction`, `getOwner`, `getParams`, `getMaker`, `getSystem`, `getForm`, `getCode`, `getAction`, `getActionFunction`

---

#### `ImageObject`

- **Herda de**: `HTMLObject`
- **Linhas**: 29

**Métodos principais** (2 total):

| Método | Parâmetros |
|--------|------------|
| `toString` | `` |

**Getters**: `getImage`

---


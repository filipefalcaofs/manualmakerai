# Engine JavaScript do Webrun

## Arquivos JavaScript Principais

### wfr.js — Engine Principal

O `wfr.js` é o coração do cliente Webrun com **6.660 linhas** de código. Ele é responsável por:

- Gerenciamento de sessão no cliente
- Comunicação AJAX com o servidor (WFRCore)
- Manipulação do DOM para formulários dinâmicos
- Sistema de herança de componentes (`.inherits()`)
- Controle de navegação entre formulários
- Gerenciamento de ações (inserir, editar, excluir, pesquisar)
- Cache de componentes carregados
- Tratamento de eventos (teclado, mouse, foco)
- Suporte a responsive/mobile

#### Constantes Globais

| Constante | Valor | Descrição |
|-----------|-------|-----------|
| `VERSION` | `"5.0.0.46"` | Versão do Webrun |
| `ENCODING` | `"ISO-8859-1"` | Encoding padrão |

### rulesFunctions.js — Funções de Regras Client-Side

O `rulesFunctions.js` contém **1.121 linhas** com extensões dos prototypes nativos do JavaScript para suportar as funções de regras compiladas para o cliente.

#### Extensões de Number

| Método | Descrição |
|--------|-----------|
| `Number.prototype.trunc()` | Trunca número decimal |
| `Number.prototype.formatMoney(places, symbol, thousand, decimal)` | Formata como moeda |
| `Number.prototype.round(decimals)` | Arredonda com casas decimais |

#### Extensões de Date

| Método | Descrição |
|--------|-----------|
| `Date.prototype.incDay(days)` | Incrementa dias |
| `Date.prototype.incMonth(months)` | Incrementa meses |
| `Date.prototype.incYear(years)` | Incrementa anos |
| `Date.prototype.subtractDay(days)` | Subtrai dias |
| `Date.prototype.subtractMonth(months)` | Subtrai meses |
| `Date.prototype.subtractYear(years)` | Subtrai anos |
| `Date.prototype.daysBetween(date)` | Dias entre duas datas |
| `Date.prototype.monthsBetween(date)` | Meses entre duas datas |
| `Date.prototype.yearsBetween(date)` | Anos entre duas datas |
| `Date.prototype.format(pattern)` | Formata data com padrão |

> Estas funções são os equivalentes client-side das funções nativas do Maker documentadas na seção de Nativos.

### wfr_masks.js — Máscaras de Entrada

O `wfr_masks.js` contém **1.049 linhas** com implementação de máscaras de formatação para campos de entrada:

- Máscaras de CPF, CNPJ, CEP, telefone
- Máscaras de data e hora
- Máscaras numéricas (moeda, percentual)
- Máscaras customizáveis com caracteres especiais
- Validação em tempo real de entrada

### FlowFunctions.class.js — Funções de Fluxo

Definição de metadados para funções de fluxo de trabalho client-side.

```javascript
function FlowFunctions() {
  this.code;         // Código da função
  this.name;         // Nome da função
  this.description;  // Descrição
  this.realName;     // Nome real (interno)
  this.params;       // Array de parâmetros
  this.returnValue;  // Valor de retorno
  this.type;         // Tipo da função
}
```

### sw.js — Service Worker

Service Worker para funcionalidade offline (PWA):
- Cache de recursos estáticos
- Página offline quando sem conexão

### i18n_template.js — Template de Internacionalização

Template JavaScript para carregar mensagens internacionalizadas no cliente.

### bcp.min.js — Browser Compatibility Polyfills

Polyfills minificados para compatibilidade cross-browser.

---

## Bibliotecas de Terceiros (JavaScript)

| Biblioteca | Versão | Uso |
|-----------|--------|-----|
| jQuery | *(minificada)* | Manipulação DOM e AJAX |
| Bootstrap | *(bundle min)* | Framework CSS responsivo |
| Moment.js | *(minificada)* | Manipulação de datas |
| Bootstrap Datetimepicker | *(minificada)* | Seletor de data/hora |
| FontAwesome | *(all min)* | Ícones vetoriais |
| QRCode.js | *(minificada)* | Geração de QR Codes |
| FSLightbox | *(minificada)* | Lightbox para imagens |
| CodeMirror | *(completo)* | Editor de código (regras) |
| Trumbowyg | *(minificada)* | Editor WYSIWYG (HTML) |
| Bootstrap Table | *(completo)* | Grid avançada com extensões |
| SmartClient (Isomorphic) | *(completo)* | Grid isomórfica avançada |
| ColResizable | *(minificada)* | Colunas redimensionáveis |
| ExifReader | *(minificada)* | Leitura de EXIF de imagens |
| RandomColor | *(não minificada)* | Geração de cores aleatórias |

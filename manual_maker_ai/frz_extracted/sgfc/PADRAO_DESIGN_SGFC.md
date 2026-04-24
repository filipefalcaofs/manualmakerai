# SGFC — Padrao de Design Premium

Referencia obrigatoria para todas as telas do SGFC no Maker.

---

## 1. CSS Global (ClasseCss do componente F)

Todas as telas DEVEM ter este CSS no componente F:

```css
.card-heading-premium {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--bs-primary);
}
.card-heading-premium i { font-size: 1rem; }
.header-title-premium { padding: 8px 0; margin-bottom: 12px; }
.header-title-premium h3 {
    margin: 0; font-size: 1.4rem; font-weight: 700;
    color: var(--bs-emphasis-color);
}
.header-title-premium h3 i {
    color: var(--bs-primary); margin-right: 8px;
}
.header-title-premium small {
    display: block; margin-top: 4px;
    font-size: 0.85rem; color: var(--bs-secondary-color); font-weight: 400;
}
.badge-status {
    padding: 4px 10px; border-radius: 4px;
    font-size: 0.8rem; font-weight: 600;
}
.badge-ativo { background-color: #198754; color: white; }
.badge-inativo { background-color: #dc3545; color: white; }
.badge-rascunho { background-color: #6c757d; color: white; }
.badge-publicado { background-color: #198754; color: white; }
.badge-encerrado { background-color: #dc3545; color: white; }
.badge-pendente { background-color: #ffc107; color: black; }
[data-bs-theme="dark"] .header-title-premium h3 { color: var(--bs-body-color); }
[data-bs-theme="dark"] .card-heading-premium { color: var(--bs-primary); }
```

---

## 2. Constantes do Sistema de Layout

O Maker renderiza um LABEL (~20px) ACIMA de cada campo input.
FIELD_ROW_HEIGHT deve incluir: label(20) + input(33) + gap(17) = 70.

```
FORM_WIDTH         = 1100    largura do formulario
FORM_MARGIN        = 16      margem esquerda do conteudo
CARD_WIDTH         = 1060    FORM_WIDTH - (2 * FORM_MARGIN) - 8
CARD_PADDING       = 16      padding interno do card
CARD_INNER_WIDTH   = 1028    CARD_WIDTH - (2 * CARD_PADDING)
HEADER_HEIGHT      = 40      altura do card-header
HEADER_LABEL_X     = 10      X do label dentro do header
HEADER_LABEL_Y     = 5       Y do label dentro do header
HEADER_LABEL_H     = 30      altura do label do header
LABEL_HEIGHT       = 20      altura do label renderizado acima do campo
FIELD_HEIGHT       = 33      altura padrao de um campo (input)
FIELD_GAP_V        = 37      gap vertical: label(20) + espacamento(17)
FIELD_ROW_HEIGHT   = 70      LABEL_HEIGHT + FIELD_HEIGHT + 17
FIELD_GAP_H        = 14      gap horizontal entre campos
FIELD_FIRST_Y      = 80      primeira linha = HEADER_HEIGHT + 15 + LABEL_HEIGHT + 5
MEMO_HEIGHT        = 80      altura padrao de memo
GRID_HEIGHT        = 250     altura padrao de grade
BUTTON_HEIGHT      = 40      altura padrao de botao
TITLE_Y            = 10      Y do titulo da pagina
TITLE_HEIGHT       = 60      altura do titulo
FIRST_CARD_Y       = 85      Y do primeiro card = TITLE_Y + TITLE_HEIGHT + 15
CARD_GAP           = 15      gap entre cards
```

---

## 3. Hierarquia de Componentes

```
Formulario (F) — ClasseCss com CSS global
  Aba "01-NomeAba"
    lblTitulo (L)                    Container=vazio, X=16, Y=10, W=1060, H=60
    containerCard1 (P)               Container=vazio, X=16, Y=80, W=1060, H=calculada
      containerCard1Header (P)       Container=containerCard1, X=0, Y=0, W=1060, H=40
        lblCard1Titulo (L)           Container=containerCard1Header, X=10, Y=5, W=400, H=30
      campo1 (E/C/K)                 Container=containerCard1, X=formula, Y=formula, W=formula, H=33
      campo2 (E/C/K)                 Container=containerCard1, X=formula, Y=formula, W=formula, H=33
    containerCard2 (P)               Container=vazio, X=16, Y=card1.Y+card1.H+10, W=1060, H=calculada
      ...
```

---

## 4. Formulas de Posicionamento

### Formula 1: Posicao Y dos cards na aba

```
card[0].Y = FIRST_CARD_Y                              = 80
card[n].Y = card[n-1].Y + card[n-1].H + CARD_GAP
```

### Formula 2: Altura de um card

```
card.H = HEADER_HEIGHT + 10 + soma_alturas_linhas + 10

Onde soma_alturas_linhas:
  - Linha de campos normais: FIELD_ROW_HEIGHT (50)
  - Linha com memo: MEMO_HEIGHT + FIELD_GAP_V (97)
  - Linha com grade: GRID_HEIGHT + FIELD_GAP_V (267)
  - Linha com botoes: BUTTON_HEIGHT + FIELD_GAP_V (57)
```

### Formula 3: Posicao Y dos campos dentro do card

```
campo.Y = FIELD_FIRST_Y + (indice_linha * FIELD_ROW_HEIGHT)

  linha 0  ->  Y = 80
  linha 1  ->  Y = 150
  linha 2  ->  Y = 220
  linha N  ->  Y = 80 + (N * 70)

Excecao: se a linha anterior tem memo, somar LABEL_HEIGHT + MEMO_HEIGHT + 17 (117) em vez de 70.
Excecao: se a linha anterior tem grade, somar LABEL_HEIGHT + GRID_HEIGHT + 17 (287) em vez de 70.
```

### Formula 4: Posicao X e largura dos campos (grid 12 colunas)

```
col_unit = CARD_INNER_WIDTH / 12 = 1028 / 12 = 85.67

campo.W = floor(col_unit * col_md) - FIELD_GAP_H  (ajuste no ultimo campo da linha)
campo.X = CARD_PADDING + soma_larguras_anteriores + (indice_na_linha * FIELD_GAP_H)
```

---

## 5. Tabelas Pre-calculadas de Posicao X e Largura

Todas as combinacoes de col-md usadas no SGFC, pre-calculadas para CARD_INNER_WIDTH = 1028:

### col-md-12 (campo unico na linha)

| Campo | col-md | X   | W    |
|-------|--------|-----|------|
| 1     | 12     | 16  | 1028 |

### col-md-8 + col-md-4

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 8      | 16  | 682 |
| 2     | 4      | 712 | 332 |

### col-md-6 + col-md-6

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 6      | 16  | 507 |
| 2     | 6      | 537 | 507 |

### col-md-6 + col-md-3 + col-md-3

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 6      | 16  | 507 |
| 2     | 3      | 537 | 246 |
| 3     | 3      | 797 | 247 |

### col-md-4 + col-md-4 + col-md-4

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 4      | 16  | 333 |
| 2     | 4      | 363 | 333 |
| 3     | 4      | 710 | 334 |

### col-md-3 + col-md-3 + col-md-3 + col-md-3

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 3      | 16  | 246 |
| 2     | 3      | 276 | 246 |
| 3     | 3      | 536 | 246 |
| 4     | 3      | 796 | 248 |

### col-md-3 + col-md-3 + col-md-6

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 3      | 16  | 246 |
| 2     | 3      | 276 | 246 |
| 3     | 6      | 536 | 508 |

### col-md-4 + col-md-8

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 4      | 16  | 333 |
| 2     | 8      | 363 | 681 |

### col-md-2 + col-md-4 + col-md-3 + col-md-3

| Campo | col-md | X   | W   |
|-------|--------|-----|-----|
| 1     | 2      | 16  | 157 |
| 2     | 4      | 187 | 333 |
| 3     | 3      | 534 | 246 |
| 4     | 3      | 794 | 250 |

### Botoes em sequencia

| Botao | X   | W   |
|-------|-----|-----|
| 1     | 16  | 180 |
| 2     | 210 | 180 |
| 3     | 404 | 180 |
| 4     | 598 | 180 |
| 5     | 792 | 220 |

---

## 6. Titulo da Pagina

```
lblTitulo:
  Container = vazio (raiz da aba)
  X = 16, Y = 10, W = 1060, H = 60
  NomeClasseCss = "form-group fw-bold text-dark mb-3"
  Descricao = HTML:
    <div class="header-title-premium">
      <h3><i class="fa-solid fa-ICONE"></i> <span>Titulo</span></h3>
      <small>Subtitulo descritivo</small>
    </div>
```

---

## 7. Card Header

```
containerCardHeader:
  Container = containerCard
  X = 0, Y = 0, W = 1060, H = 40
  NomeClasseCss = "form-group card-header"

lblCardTitulo:
  Container = containerCardHeader
  X = 10, Y = 5, W = 400, H = 30
  Descricao = HTML:
    <div class="card-heading-premium">
      <i class="fa-solid fa-ICONE"></i> <span>Nome da Secao</span>
    </div>
```

---

## 8. Icones por Modulo SGFC

| Tela                    | Icone titulo  |
|-------------------------|---------------|
| Tipo de Documento       | fa-file-alt   |
| Grupo de Despesa        | fa-layer-group|
| Item/Rubrica            | fa-list-ul    |
| Unidade de Medida       | fa-ruler      |
| Edital                  | fa-scroll     |
| Gestao Usuarios Portal  | fa-users-cog  |

## 9. Icones por Secao (Card)

| Secao                     | Icone            |
|---------------------------|------------------|
| Identificacao             | fa-id-card       |
| Temporalidade / Validade  | fa-clock         |
| Configuracao de Arquivo   | fa-paperclip     |
| Vigencia                  | fa-calendar-check|
| Configuracao Fiscal / IRRF| fa-calculator    |
| Limites Percentuais       | fa-percentage    |
| Exibicao / Ordem          | fa-sort-numeric-down |
| Elegibilidade             | fa-user-check    |
| Categorias                | fa-tags          |
| Formulario                | fa-wpforms       |
| Avaliacao                 | fa-star          |
| Datas e Prazos            | fa-calendar-alt  |
| Configuracoes             | fa-sliders-h     |
| Regras Especificas        | fa-cogs          |
| Orcamento                 | fa-coins         |
| Acoes                     | fa-bolt          |
| Historico                 | fa-history       |
| Perfis                    | fa-id-badge      |
| Status e Observacoes      | fa-toggle-on     |
| Dados Complementares      | fa-info-circle   |

---

## 10. Campos — Colunas Bootstrap

| Tipo de dado     | col-md        |
|------------------|---------------|
| Codigo/ID        | col-md-2      |
| CPF              | col-md-3      |
| CNPJ             | col-md-3      |
| Nome/Titulo      | col-md-6 a 8  |
| E-mail           | col-md-4      |
| Telefone         | col-md-3      |
| Data             | col-md-3      |
| Valor monetario  | col-md-3      |
| Percentual       | col-md-2 a 3  |
| Checkbox         | col-md-3      |
| Combo/Status     | col-md-3      |
| Memo/Descricao   | col-md-12     |
| Ordem/Sequencia  | col-md-2 a 3  |

---

## 11. Botoes

| Acao             | Classe             | Icone            |
|------------------|---------------------|------------------|
| Salvar/Confirmar | btn btn-success     | fa-check         |
| Cancelar         | btn btn-secondary   | fa-times         |
| Excluir          | btn btn-danger      | fa-trash         |
| Editar           | btn btn-primary     | fa-edit          |
| Visualizar       | btn btn-info        | fa-eye           |
| Ativar           | btn btn-success     | fa-check         |
| Inativar         | btn btn-danger      | fa-ban           |
| Bloquear         | btn btn-warning     | fa-lock          |
| Resetar          | btn btn-secondary   | fa-key           |
| Reenviar         | btn btn-info        | fa-envelope      |
| Publicar         | btn btn-primary     | fa-globe         |
| Prorrogar        | btn btn-warning     | fa-calendar-plus |

---

## 12. Grade

- Paginacao: 20
- GradeHabilitarColunaNumerica: True
- EnableGridExport: True
- CanFreezeColumns: True
- PermiteOrdenacao: True
- PlaceHolder: mensagem descritiva

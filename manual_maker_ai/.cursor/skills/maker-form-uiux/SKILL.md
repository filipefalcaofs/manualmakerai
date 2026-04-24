---
name: maker-form-uiux
description: >-
  Cria e modifica formularios Maker (WebRun) com visual premium usando Bootstrap 5,
  cards com shadow, headers com icones Font Awesome, e espaçamento padronizado.
  Use quando o usuario pedir para criar formulario, tela, cadastro, ou aplicar
  visual/UI/UX em formularios Maker existentes.
---

# Maker — Formularios com UI/UX Premium

O Maker renderiza HTML com Bootstrap 5. Todo formulario deve seguir o layout de cards
com headers, espaçamento consistente, e classes CSS nativas.

---

## Layout System

### Hierarquia obrigatoria

```
Formulario (F) → Responsivo=TRUE, ClasseCss=CSS_PREMIUM
  └── Aba "01-NomeAba"
      ├── Label titulo (L)           → HTML premium, Container=""
      ├── Card 1 (P)                 → form-group card shadow-sm
      │   ├── Card-header (P)        → form-group card-header
      │   │   └── Label header (L)   → HTML com icone FA
      │   ├── Campo 1 (E/C/K/etc.)
      │   └── Campo 2
      ├── Card 2 (P)
      │   ├── Card-header (P)
      │   │   └── Label header (L)
      │   └── Campos...
      └── Card N
```

### Constantes de espaçamento

| Constante | Valor | Descrição |
|---|---|---|
| CARD_WIDTH | 1060px | Largura do card (form 1100 - 2×20 margem) |
| CARD_LEFT | 16px | Margem esquerda do card na aba |
| CARD_GAP | 10px | Gap vertical entre cards |
| HEADER_H | 40px | Altura do card-header |
| FIELD_Y | 80px | Y dos campos dentro do card (40px abaixo do header) |
| FIELD_GAP_H | 20px | Gap horizontal entre campos |
| FIELD_H | 33px | Altura padrão de edit/combo/lookup/button |
| ROW_STEP | 55px | Distância entre linhas (FIELD_H + label + gap) |
| CARD_PADDING_BOTTOM | 25px | Padding inferior dentro do card |
| TITLE_Y | 10px | Y do título do formulário |
| TITLE_H | 60px | Altura do label título |

### Cálculo de alturas

```
Card com 1 linha de campos:
  H = FIELD_Y + FIELD_H + label(22) + CARD_PADDING_BOTTOM = 175px

Card com 2 linhas:
  H = FIELD_Y + (2 × ROW_STEP) + CARD_PADDING_BOTTOM = 190px

Card com memo/grid:
  H = FIELD_Y + label(22) + memo_height + CARD_PADDING_BOTTOM

Form total:
  H = Y_ultimo_card + H_ultimo_card + 20px (margem inferior)
```

---

## Titulo da pagina

Label HTML (COM_TIPO=L) no topo, fora de qualquer card (Container vazio).

```
PosicaoX=16, PosicaoY=10, Tamanho=1060, Altura=60
NomeClasseCss: form-group fw-bold text-dark mb-3
```

HTML no Descricao (usar CDATA):

```html
<div class="header-title-premium">
  <h3><i class="fa-solid fa-ICONE"></i> <span>Nome do Formulário</span></h3>
  <small>Descrição breve do propósito</small>
</div>
```

### Ícones por tipo de formulário

| Tipo | Ícone |
|---|---|
| Cadastro pessoa | `fa-user-plus` |
| Cadastro genérico | `fa-plus-circle` |
| Documentos | `fa-file-alt` |
| Financeiro | `fa-dollar-sign` |
| Configurações | `fa-cog` |
| Relatórios | `fa-chart-bar` |
| Estoque | `fa-boxes` |
| Vendas | `fa-shopping-cart` |
| Agenda | `fa-calendar-alt` |
| Legislação | `fa-gavel` |

---

## Card — Montagem padrão

Cada card requer 3 componentes: **body + header + label**.

### 1. Card body (P)

```
NomeClasseCss: form-group card shadow-sm
Container: (vazio — raiz da aba)
PosicaoX: 16
PosicaoY: calculado (titulo_end + CARD_GAP, ou card_anterior_end + CARD_GAP)
Tamanho: 1060
Altura: calculada
```

Variações de card:

| Classe CSS | Quando |
|---|---|
| `form-group card shadow-sm` | Padrão (sempre usar) |
| `form-group card shadow-sm bg-primary-subtle` | Destaque (info principal) |
| `form-group card shadow` | Sombra forte (seção importante) |
| `form-group border shadow` | Com borda (seção secundária) |

### 2. Card header (P)

```
NomeClasseCss: form-group card-header
Container: NomeDoCardBody
PosicaoX: 0
PosicaoY: 0
Tamanho: (mesma largura do card body)
Altura: 40
```

### 3. Label do header (L)

```
Container: NomeDoCardHeader
PosicaoX: 10
PosicaoY: 5
Tamanho: (largura do header - 20)
Altura: 30
```

HTML no Descricao (usar CDATA):

```html
<div class="card-heading-premium">
  <i class="fas fa-ICONE"></i> <span>Título da Seção</span>
</div>
```

### Ícones por seção

| Seção | Ícone |
|---|---|
| Dados Pessoais | `fa-id-card` |
| Contato | `fa-envelope` |
| Endereço | `fa-map-marker-alt` |
| Observações | `fa-sticky-note` |
| Financeiro | `fa-money-bill` |
| Documentos | `fa-folder-open` |
| Histórico | `fa-history` |
| Configurações | `fa-sliders-h` |
| Permissões | `fa-shield-alt` |
| Anexos | `fa-paperclip` |
| Identificação | `fa-file-alt` |
| Vigência | `fa-calendar-alt` |

---

## Campos — Posicionamento

Todos os campos DENTRO de um card usam posição RELATIVA ao card (Container = nome do card body).

### Primeira linha de campos

```
PosicaoY = 80  (FIELD_Y — 40px abaixo do header)
```

### Linhas adicionais

```
Linha 2: PosicaoY = 80 + 55 = 135
Linha 3: PosicaoY = 135 + 55 = 190
```

### Distribuição horizontal (gap de 20px)

Calcular X e W de cada campo da esquerda para a direita:

```
Campo 1: X = 16,            W = largura_campo_1
Campo 2: X = 16 + W1 + 20,  W = largura_campo_2
Campo 3: X = X2 + W2 + 20,  W = largura_campo_3
```

### Largura por tipo de dado

| Dado | Largura |
|---|---|
| ID / Código (readonly) | 80–100 px |
| CPF | 180–200 px |
| CNPJ | 200–220 px |
| Nome / Razão Social | 300–700 px |
| Email | 350–500 px |
| Telefone | 180–200 px |
| CEP | 130–150 px |
| Endereço | 400–600 px |
| Número (endereço) | 80–100 px |
| Complemento | 200–300 px |
| Bairro / Cidade | 200–350 px |
| UF | 80–120 px |
| Data | 180–200 px |
| Valor monetário | 150–200 px |
| Memo / Observação | card_width - 40 px |

---

## CSS Premium (ClasseCss do FormSettings)

Adicionar ao componente F (COM_TIPO="F") na property `ClasseCss`:

```css
.card-heading-premium{display:flex;align-items:center;gap:8px;font-size:.95rem;font-weight:600;color:var(--bs-primary)}.card-heading-premium i{font-size:1rem}.header-title-premium{padding:8px 0}.header-title-premium h3{margin:0;font-size:1.4rem;font-weight:700;color:var(--bs-emphasis-color)}.header-title-premium h3 i{color:var(--bs-primary);margin-right:8px}.header-title-premium small{display:block;margin-top:4px;font-size:.85rem;color:var(--bs-secondary-color);font-weight:400}
```

IMPORTANTE: usar `var(--bs-primary)` e `var(--bs-emphasis-color)` para respeitar dark mode.

---

## Botões

| Ação | NomeClasseCss | Ícone |
|---|---|---|
| Ação principal | `btn-primary` | `fa-check` |
| Salvar | `btn-success` | `fa-save` |
| Cancelar / Voltar | `btn-secondary` | `fa-times` |
| Excluir | `btn-danger` | `fa-trash` |
| Atenção | `btn-warning` | `fa-exclamation-triangle` |
| Info | `btn-info` | `fa-info-circle` |
| Ação leve | `btn-outline-primary` | (varia) |
| Download | `btn-secondary` | `fa-download` |
| Anexar | `btn-primary` | `fa-paperclip` |

Botões com ícone — Descricao usa CDATA:

```xml
<property name="Descricao"><![CDATA[<i class="fas fa-save"></i> Salvar]]></property>
```

---

## FormSettings (F) — Configuração padrão

| Property | Valor |
|---|---|
| Responsivo | TRUE |
| Navegacao | TRUE |
| Abas | TRUE |
| BarraDeRolagem | True |
| EntrarComoPesquisa | FALSE |
| ModoLegado | FALSE |
| AbaLocalizar | TRUE |
| AIGenerated | TRUE |
| ClasseCss | CSS_PREMIUM acima |

---

## Componentes — Propriedades essenciais

### Edit (E)

- `Placeholder`: sempre preencher com texto guia
- `Tipo`: usar máscara nativa quando possível (CPF, CNPJ, `DATA (ANO 4)`, CEP, MOEDA)
- `ApenasLeitura` + `Habilitado=False`: para campos auto (ID, código)
- `LabelPosition`: 0 (acima)

### Lookup (K)

- `BuscaIncremental`: True
- `TipoFiltroInicial`: 2 (contém)
- `Paginacao`: 20

### Grid (G)

- `Paginacao`: 20
- `PlaceHolder`: "Nenhum registro encontrado"
- `GradeHabilitarColunaNumerica`: True
- `EnableGridExport`: True

### Combo (C)

- `Lista`: itens separados por `\r\n` (encode: `&#x000D;&#x000A;`)
- `Valores`: valores internos correspondentes

---

## Exemplo de layout completo

```
Form (1100 × 720px)

Título              Y=10   H=60   (ends 70)
                                   10px gap
Card Identificação  Y=80   H=175  (ends 255)
  ├ Header          Y=0    H=40
  └ Campos          Y=80   (Código W=100, Nome W=400, Data W=200)
                                   10px gap
Card Endereço       Y=265  H=190  (ends 455)
  ├ Header          Y=0    H=40
  ├ Linha 1         Y=80   (CEP W=150, Endereço W=500, Número W=100)
  └ Linha 2         Y=135  (Bairro W=300, Cidade W=300, UF W=100)
                                   10px gap
Card Observações    Y=465  H=230  (ends 695)
  ├ Header          Y=0    H=40
  └ Memo            Y=80   W=1020 H=120

FRM_ALTURA = 720
```

---

## Checklist de qualidade

Antes de finalizar o formulário:

- [ ] Título premium com HTML (ícone + título + subtítulo)
- [ ] Cada seção lógica dentro de um card `shadow-sm`
- [ ] Cada card com header + ícone Font Awesome
- [ ] CSS premium no ClasseCss do FormSettings
- [ ] Campos a Y=80 dentro dos cards (40px abaixo do header)
- [ ] Gap horizontal de 20px entre campos na mesma linha
- [ ] Gap de 10px entre cards
- [ ] Placeholders em todos os campos editáveis
- [ ] Máscaras nativas (CPF, CNPJ, DATA, CEP)
- [ ] Botões com ícone + classe Bootstrap
- [ ] Campos readonly para IDs e auto-incremento
- [ ] Larguras proporcionais ao tipo de dado
- [ ] Responsivo = TRUE
- [ ] Altura do formulário calculada corretamente

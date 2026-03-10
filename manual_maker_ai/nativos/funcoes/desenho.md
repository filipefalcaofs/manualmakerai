# Funções Nativas - Desenho

Total: **7** funções

[← Voltar para Funções Nativas](README.md)

---

## Área de Desenho - Criar Objeto Área de Desenho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasCreate` |
| **Código** | 615 |
| **Assinatura** | `Área de Desenho - Criar Objeto Área de Desenho (Componente): Variante` |
| **Parâmetros** | Componente |
| **Retorno** | Variante |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Cria uma referência para o "Objeto Área de Desenho" e a retorna.
Este objeto é necessário para que seja utilizada as demais funções da categoria Desenho.

Parâmetro:
1. Componente Moldura que será utilizada para a criação dos desenhos.

Retorno:
Retorna a referência do objeto. (Variante)

### Código Cliente (JavaScript)

```javascript
function ebfCanvasCreate(bevel) {
  var bevelComp = $c(bevel);
  if (bevelComp) {
    var canvas = document.createElement("canvas");
    canvas.setAttribute("width", bevelComp.div.offsetWidth + "px");
    canvas.setAttribute("height", bevelComp.div.offsetHeight + "px");
    bevelComp.div.appendChild(canvas);
    return canvas;
  }
}
```

---

## Área de Desenho - Desenhar Círculo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasDrawCircle` |
| **Código** | 618 |
| **Assinatura** | `Área de Desenho - Desenhar Círculo (Variante;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Cor;Inteiro)` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Cor;Inteiro |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Desenha um círculo na área de desenho passada por parâmetro.

Parâmetro(s): 
1. Área de Desenho. (Variante)
2. Coordenada da Posição X. (Inteiro)
3. Coordenada da Posição Y. (Inteiro)
4. Raio. (Inteiro)
5. Valor lógico que informa se o círculo será preenchido.
6. Cor de Preenchimento.
7. Valor lógico que informa se o círculo será delineado.
8. Cor da Borda.
9. Espessura da Borda. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCanvasDrawCircle(canvas, x, y, radio, fill, fillColor, line, lineColor, lineWidth) {
  if (canvas) {  
    var ctx = canvas.getContext("2d");
    ctx.beginPath();
    ctx.arc(x, y, radio, 0, 2*Math.PI);	
    if (fill) {
      ctx.fillStyle = fillColor;
      ctx.fill();
    }
    if (line) {
      ctx.strokeStyle = lineColor;
      ctx.lineWidth = lineWidth;
      ctx.stroke();
    }
  }
}
```

---

## Área de Desenho - Desenhar Elipse

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasDrawEllipse` |
| **Código** | 620 |
| **Assinatura** | `Área de Desenho - Desenhar Elipse (Variante;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Cor;Inteiro)` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Cor;Inteiro |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Desenha uma elipse na área de desenho passada por parâmetro.

Parâmetro(s):
1. Área de Desenho. (Variante)
2. Coordenada X inicial. (Inteiro)
3. Coordenada Y inicial. (Inteiro)
4. Valor de A. (Inteiro)
5. Valor de B. (Inteiro)
6. Valor lógico que informa se a elipse será preenchida.
7. Cor de preenchimento.
8. Valor lógico que informa se a elipse será delineada.
9. Cor da Borda.
10. Espessura da borda. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCanvasDrawEllipse(canvas, x, y, w, h, fill, fillColor, line, lineColor, lineWidth) {
  if (canvas) {
    var ctx = canvas.getContext("2d");
    var kappa = .5522848,
    ox = (w / 2) * kappa, // control point offset horizontal
    oy = (h / 2) * kappa, // control point offset vertical
    xe = x + w,           // x-end
    ye = y + h,           // y-end
    xm = x + w / 2,       // x-middle
    ym = y + h / 2;       // y-middle

    ctx.beginPath();
    ctx.moveTo(x, ym);
    ctx.bezierCurveTo(x, ym - oy, xm - ox, y, xm, y);
    ctx.bezierCurveTo(xm + ox, y, xe, ym - oy, xe, ym);
    ctx.bezierCurveTo(xe, ym + oy, xm + ox, ye, xm, ye);
    ctx.bezierCurveTo(xm - ox, ye, x, ym + oy, x, ym);
    ctx.closePath();

    if (fill) {
      ctx.fillStyle = fillColor;
      ctx.fill();
    }

    if (line) {
      ctx.lineWidth = lineWidth;
      ctx.lineColor = lineColor;
      ctx.stroke();
    }
  }
}
```

---

## Área de Desenho - Desenhar Linha

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasDrawLine` |
| **Código** | 616 |
| **Assinatura** | `Área de Desenho - Desenhar Linha (Variante;Inteiro;Inteiro;Inteiro;Inteiro;Cor;Inteiro)` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Inteiro;Inteiro;Cor;Inteiro |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Desenha uma linha na área de desenho passada por parâmetro.

Parâmetro(s): 
1. Objeto Área de Desenho. (Variante)
2. Coordenada X inicial. (Inteiro)
3. Coordenada Y inicial. (Inteiro)
4. Coordenada X final. (Inteiro)
5. Coordenada Y final. (Inteiro)
6. Cor da linha.
7. Espessura da linha. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCanvasDrawLine(canvas, x1, y1, x2, y2, color, lineWidth){
  if (canvas) {  
    var ctx = canvas.getContext('2d');    
    ctx.moveTo(x1, y1);    
    ctx.lineTo(x2, y2);
    ctx.strokeStyle = color;    
    ctx.lineWidth = lineWidth;
    ctx.stroke();
  }
}
```

---

## Área de Desenho - Desenhar Losango

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasDrawRhombus` |
| **Código** | 619 |
| **Assinatura** | `Área de Desenho - Desenhar Losango (Variante;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Inteiro)` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Inteiro |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Desenha um losango na área de desenho passada por parâmetro.

Parâmetro(s): 
1. Área de Desenho. (Variante)
2. Coordenada X inicial. (Inteiro)
3. Coordenada Y inicial. (Inteiro)
4. Dimensão da diagonal 1. (Inteiro)
5. Dimensão da diagonal 2. (Inteiro)
6. Valor lógico que informa se o losango será preenchido.
7. Cor de preenchimento.
8. Valor lógico que informa se o losango será delineado.
9. Cor da Borda.
10. Espessura da borda. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCanvasDrawRhombus(canvas, x1, y1, d1, d2, fill, fillColor, line, lineColor, lineWidth) {
  if (canvas) {
    var ctx = canvas.getContext("2d");

    ctx.lineTo(x1 + parseInt(d1 / 2), y1);
    ctx.lineTo(x1 + d1, y1 + parseInt(d2 / 2));
    ctx.lineTo(x1 + parseInt(d1 / 2), y1 + d2);
    ctx.lineTo(x1 , y1 + parseInt(d2 / 2));
    ctx.lineTo(x1 + parseInt(d1 / 2), y1);

    if (line) {
      ctx.lineWidth = lineWidth;
      ctx.lineColor = lineColor;
      ctx.stroke();
    }
    if (fill) {
      ctx.fillStyle = fillColor;
      ctx.fill();
    }
  }
}
```

---

## Área de Desenho - Desenhar Retângulo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasDrawRect` |
| **Código** | 617 |
| **Assinatura** | `Área de Desenho - Desenhar Retângulo (Variante;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Cor;Inteiro)` |
| **Parâmetros** | Variante;Inteiro;Inteiro;Inteiro;Inteiro;Lógico;Cor;Lógico;Cor;Inteiro |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Desenha um retângulo na área de desenho passada por parâmetro.

Parâmetro(s): 
1. Área de Desenho. (Variante)
2. Coordenada X inicial. (Inteiro)
3. Coordenada Y inicial. (Inteiro)
4. Largura. (Inteiro)
5. Altura. (Inteiro)
6. Valor lógico que informa se o retângulo será preenchido.
7. Cor de preenchimento.
8. Valor lógico que informa se o retângulo será delineado
9. Cor da borda.
10. Espessura da borda. (Inteiro)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCanvasDrawRect(canvas, x, y, width, height, fill, fillColor, line, lineColor, lineWidth) {
  if(canvas) {
    var ctx = canvas.getContext("2d");
    if (fill) {
      ctx.fillStyle = fillColor;
    }
    if (line) {
      ctx.lineWidth = lineWidth;
      ctx.lineColor = lineColor;
    }
    ctx.fillRect(x, y, width, height);
  }
}
```

---

## Área de Desenho - Remover Objeto Área de Desenho

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCanvasRemove` |
| **Código** | 810 |
| **Assinatura** | `Área de Desenho - Remover Objeto Área de Desenho (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 33 |
| **Compatibilidade** | Cliente |

### Descrição

Remove uma referência para área de desenho.

Parâmetro:
1. Referência do Objeto. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfCanvasRemove(canvas) {
  if (canvas){   
   var context = canvas.getContext("2d");    
   context.clearRect(0,0, canvas.width, canvas.height);
  }
}
```

---

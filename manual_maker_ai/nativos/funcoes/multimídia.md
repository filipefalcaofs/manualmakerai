# Funções Nativas - Multimídia

Total: **2** funções

[← Voltar para Funções Nativas](README.md)

---

## Multimídia - Carregar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMediaLoad` |
| **Código** | 699 |
| **Assinatura** | `Multimídia - Carregar (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 38 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe um elemento de áudio ou vídeo e carrega o seu conteúdo.

Parâmetro:
1. Referência do elemento HTML. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfMediaLoad(media){
  if (media instanceof HTMLDivElement) {
    media = media.getElementsByTagName("video")[0] || media.getElementsByTagName("audio")[0];
  } 
  if (media instanceof HTMLVideoElement || media instanceof HTMLAudioElement) {
    media.load();
  }
}
```

---

## Multimídia - Reproduzir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfMediaPlay` |
| **Código** | 696 |
| **Assinatura** | `Multimídia - Reproduzir (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 38 |
| **Compatibilidade** | Cliente |

### Descrição

Esta função recebe um elemento de áudio ou vídeo e reproduz o seu conteúdo.

Parâmetro:
1. Referência do elemento HTML. (Variante)

Retorno:
Não possui.

### Código Cliente (JavaScript)

```javascript
function ebfMediaPlay(media){
  if (media instanceof HTMLDivElement) {
    media = media.getElementsByTagName("video")[0] || media.getElementsByTagName("audio")[0];
  } 
  if (media instanceof HTMLVideoElement || media instanceof HTMLAudioElement) {
    media.play();
  }
}
```

---

# Funções Nativas - Ponteiro

Total: **3** funções

[← Voltar para Funções Nativas](README.md)

---

## Ponteiro - Criar Instância

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateRuleParamaterPointer` |
| **Código** | 431 |
| **Assinatura** | `Ponteiro - Criar Instância (Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 29 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Cria a instância de um ponteiro.

Parâmetro: 
1. Valor inicial do ponteiro. (Variante)

Retorno: 
Retorna a instância do ponteiro criado. (Variante)

### Código Servidor (Java)

```java
public class RuleParameterPointer {
    private Variant value = Variant.VARIANT_NULL;

    public RuleParameterPointer(Variant value) {
      setValue(value);
    }

    public Variant setValue(Variant value) {
      return this.value = value;
    }

    public Variant getValue() {
      return this.value;
    }

    @Override
    public String toString() {
      return value.getString();
    }
  }

  public Variant ebfCreateRuleParamaterPointer(Variant value) throws Exception {
    RuleParameterPointer reference = new RuleParameterPointer(value);
    return new Variant(reference);
  }
```

---

## Ponteiro - Definir Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetRuleParamaterPointer` |
| **Código** | 429 |
| **Assinatura** | `Ponteiro - Definir Valor (Variante, Variante) : Variante` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 29 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Define o novo valor do ponteiro.

Parâmetro(s): 
1. Instância do ponteiro. (Variante)
2. Valor a ser atribuído. (Variante)

Retorno: 
Valor definido. (Variante)

Observação:
O 1º Parâmetro é o retorno da função "Ponteiro - Criar Instância".

### Código Servidor (Java)

```java
public Variant ebfSetRuleParamaterPointer(Variant reference, Variant value) throws Exception {
    if (reference.getObject() instanceof RuleParameterPointer) {
      return RuleParameterPointer.class.cast(reference.getObject()).setValue(value);
    }
    return Variant.VARIANT_NULL;
  }
```

---

## Ponteiro - Obter Valor

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetRuleParamaterPointer` |
| **Código** | 430 |
| **Assinatura** | `Ponteiro - Definir Valor (Variante) : Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | 29 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém o valor do ponteiro.

Parâmetro: 
1. Instância do ponteiro. (Variante)

Retorno: 
Valor do ponteiro. (Variante)

Observação:
O 1º Parâmetro deve ser o retorno da função "Ponteiro - Criar Instância".

### Código Servidor (Java)

```java
public Variant ebfGetRuleParamaterPointer(Variant reference) throws Exception {
    if (reference.getObject() instanceof RuleParameterPointer) {
      return RuleParameterPointer.class.cast(reference.getObject()).getValue();
    }
    return Variant.VARIANT_NULL;
  }
```

---

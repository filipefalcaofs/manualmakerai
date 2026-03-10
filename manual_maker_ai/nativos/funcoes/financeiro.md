# Funções Nativas - Financeiro

Total: **1** funções

[← Voltar para Funções Nativas](README.md)

---

## Pagamento

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfPayment` |
| **Código** | 587 |
| **Assinatura** | `Pagamento(Fracionado, Inteiro, Fracionado) : Fracionado` |
| **Parâmetros** | Número;Inteiro;Número |
| **Retorno** | Fracionado |
| **Tipo** | 32 |
| **Compatibilidade** | Cliente, Banco de Dados |

### Descrição

Essa função calcula um pagamento, o qual retorna o valor das parcelas adicionando o juros.

Parâmetro(s):
1. Valor. (Número)
2. Quantidade de Meses. (Inteiro)
3. Porcentagem dos Juros. (Número)

Retorno: 
Retorna o valor das parcelas adicionando o juros. (Fracionado.

Observação: 
A porcentagem tem que ser passada com as casas decimais, Ex: 1% é 0,01, 10% 0,1 etc.

Exemplo: 
Assumindo o 1º parâmetro sendo 1000 (fracionado), o 2º parâmetro sendo 5 e o 3º parâmetro sendo 0,2. O retorno será 334,38.

### Código Servidor (Java)

```java
protected final Variant ebfPayment(Variant value, Variant period, Variant tax) throws Exception {
    Double result = (value.getDouble() * tax.getDouble()) / (1 - Math.pow( (1 / (1 + tax.getDouble())), period.getDouble()));
    return VariantPool.get(result);
  }
```

### Código Cliente (JavaScript)

```javascript
function ebfPayment() {
  var result = 0.0;
  if (existArgs(arguments)) {
    result = (parseNumeric(arguments[0]) * parseNumeric(arguments[2])) / (1 - Math.pow( (1 / (1 + parseNumeric(arguments[2]))), toLong(parseNumeric(arguments[1]))));
  }
  return result;
}
```

---

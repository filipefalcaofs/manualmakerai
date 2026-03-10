# Funções Nativas - SQL

Total: **10** funções

[← Voltar para Funções Nativas](README.md)

---

## SQL - Concatenar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlConcat` |
| **Código** | 503 |
| **Assinatura** | `SQL - Concatenar (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função junta vários itens de texto em apenas um item.

Parâmetro(s):
1. Valor a ser concatenado. (Variante)
2. N valores. (Variante)

Retorno: 
Retorna os valores concatenados. (Letras)

Observação: 
Utilizar com a função "Executar Atualização".

---

## SQL - Divisão

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlDivide` |
| **Código** | 500 |
| **Assinatura** | `SQL - Divisão (Variante;Variante): Variante` |
| **Parâmetros** | Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função é utilizada para fazer a divisão.

Parâmetro(s):
1. Valor do dividendo. (Variante)
2. Valor do divisor. (Variante)

Retorno:
Resultado da divisão dos números passados por parâmetros. (Variante)

Observação:
Utilizar com a função "Executar Atualização".

---

## SQL - E

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlAnd` |
| **Código** | 502 |
| **Assinatura** | `SQL - E (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função verifica se algum valor passado é falso, para retorna falso ou se são verdadeiros para retornar verdadeiro.

Parâmetro(s):
1. Valor lógico. (Variante)
2. N valores. (Variante)

Retorno: 
Retorna verdadeiro se todos os valores forem verdadeiros, caso um valor seja falso o retorno será falso. (Variante)

Observação: 
Utilizar com a função "Executar Atualização".

---

## SQL - Multiplicação

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlMultiply` |
| **Código** | 501 |
| **Assinatura** | `SQL - Multiplicação (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função realiza a multiplicação dos números passados por parâmetro.

Parâmetro(s):
1. Valor a ser multiplicado. (Variante)
2. N valores. (Variante)

Retorno:
Resultado da multiplicação dos parâmetros passados. (Variante)

Observação:
Utilizar com a função "Executar Atualização".

---

## SQL - Média

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlAvg` |
| **Código** | 4 |
| **Assinatura** | `SQL - Média (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função calcula a média aritmética do campo passado como parâmetro.

Parâmetro: 
1. Campo para média. (Variante)

Retorno:
Retorna a divisão da soma dos números passados por parâmetro pela quantidade de parâmetros. (Variante)

Observação:
Utilizar com a função "Executar Atualização".

---

## SQL - Não

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlNot` |
| **Código** | 3 |
| **Assinatura** | `SQL - Não (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função inverte o valor lógico. Se o valor do parâmetro for verdadeiro o retorno dele terá o valor lógico falso. Caso 

Parâmetro:
1. Valor lógico. (Variante)

Retorno: 
Retorna o valor lógico invertido. (Variante)

Observação:
Utilizar com a função "Executar Atualização".

---

## SQL - Ou

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlOr` |
| **Código** | 2 |
| **Assinatura** | `SQL - Ou (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função verifica se algum valor passado por parâmetro é verdadeiro, para retornar verdadeiro ou se todos os parâmetros são valores falsos, para retornar falso.

Parâmetro(s):
1. Valor. (Variante)
2. N' valor. (Variante)

Retorno:
Valor lógico. (Lógico)

Observação:
Utilizar com a função "Executar Atualização".

---

## SQL - Soma

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlAdd` |
| **Código** | 1 |
| **Assinatura** | `SQL - Soma (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função soma um ou mais valores.

Parâmetro(s):
1. Valor. (Variante)
2. N' valor. (Variante)

Retorno:
Soma dos valores (Variante).

Observação:
Utilizar apenas com a função "Executar Atualização".

---

## SQL - Somatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlSum` |
| **Código** | 5 |
| **Assinatura** | `SQL - Somatório (Variante): Variante` |
| **Parâmetros** | Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função efetua o somatório (SUM) do Campo informado.

Parâmetro:
1. Campo a ser somado. (Variante)

Retorno:
Resultado da soma. (Variante)

Observação:
Utilizar com a função "Executar Atualização".

---

## SQL - Subtração

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `sqlSubtract` |
| **Código** | 499 |
| **Assinatura** | `SQL - Subtração (N'Variante): Variante` |
| **Parâmetros** | N'Variante |
| **Retorno** | Variante |
| **Tipo** | SQL |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Essa função realiza a subtração de valores informados nos parâmetros.

Parâmetro(s):
1. Informar o valor para a subtração. (Variante)
2. N' valores. (Variante)

Retorno:
Retorna a subtração de dois ou mais números. (Variante)

Observação:
Utilizar com a função "Executar Atualização".

---

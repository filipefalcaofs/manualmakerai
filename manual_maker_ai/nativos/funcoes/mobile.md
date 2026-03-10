# Funções Nativas - Mobile

Total: **5** funções

[← Voltar para Funções Nativas](README.md)

---

## Bluetooth - Ativar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBluetoothActivate` |
| **Código** | 893 |
| **Assinatura** | `Bluetooth - Ativar (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | 44 |
| **Compatibilidade** | Mobile |

### Descrição

Ativa o Bluetooth do dispositivo. Informe 'true' para que o Bluetooth seja ativado sem a confirmação do usuário, 'false'
para que seja exibida uma mensagem ao usuário para confirmação da ação.

Parâmetro:
1. Forçar? (Lógico)

Retorno:
Não possui.

---

## Bluetooth - Desativar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBluetoothDeactivate` |
| **Código** | 894 |
| **Assinatura** | `Bluetooth - Desativar (Lógico)` |
| **Parâmetros** | Lógico |
| **Tipo** | 44 |
| **Compatibilidade** | Mobile |

### Descrição

Desativa o bluetooth do dispositivo. Informe 'true' para que o bluetooth seja desativado sem a confirmação do usuário, 'false'
para que seja exibida uma mensagem ao usuário para confirmação da ação.

Parâmetro:
1. Forçar? (Lógico)

Retorno:
Não possui.

---

## Bluetooth - Dispositivos Pareados

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBluetoothGetPairedList` |
| **Código** | 895 |
| **Assinatura** | `Bluetooth - Dispositivos Pareados (): Variante` |
| **Retorno** | Variante |
| **Tipo** | 44 |
| **Compatibilidade** | Mobile |

### Descrição

Retorna um JSON contendo o endereço e nome do(s) dispositivo(s) pareado(s).

Parâmetro:
Não possui.

Retorno:
Objeto um JSON contendo o endereço e nome do(s) dispositivo(s) pareado(s). (Variante)

---

## Bluetooth - Está ativo?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBluetoothIsActive` |
| **Código** | 896 |
| **Assinatura** | `Bluetooth - Está ativo? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 44 |
| **Compatibilidade** | Mobile |

### Descrição

Verifica se o bluetooth está ativo.

Parâmetro:
Não possui.

Retorno:
Retorna 'true' caso o bluetooth esteja ativo e 'false' caso não esteja. (Lógico)

---

## Bluetooth - Existe?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfBluetoothExists` |
| **Código** | 897 |
| **Assinatura** | `Bluetooth - Existe? (): Lógico` |
| **Retorno** | Lógico |
| **Tipo** | 44 |
| **Compatibilidade** | Mobile |

### Descrição

Verifica se o dispositivo possui bluetooth.

Parâmetro:
Não possui.

Retorno:
Retorna 'true' caso o dispositivo possua bluetooth e 'false' caso não possua. (Lógico)

---

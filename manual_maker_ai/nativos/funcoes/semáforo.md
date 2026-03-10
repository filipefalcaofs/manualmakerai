# Funções Nativas - Semáforo

Total: **3** funções

[← Voltar para Funções Nativas](README.md)

---

## Semáforo - Adquirir

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSemaphoreAcquire` |
| **Código** | 243 |
| **Assinatura** | `Semáforo - Adquirir (Letras;Inteiro;Lógico) : Letras` |
| **Parâmetros** | Letras;Inteiro;Lógico |
| **Retorno** | Letras |
| **Tipo** | 21 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Adquire um semáforo a partir de um identificador. Essa função bloqueia uma ocorrência por tempo indeterminado
e recebe um valor lógico que define se apenas o proprietário do semáforo pode liberá-lo.

Parâmetro(s):
1. Identificador único para representação do semáforo. (Letras)
2. Tempo de espera para adquirir o semáforo (em milissegundos). (Inteiro)
3. Define se apenas o proprietário do semáforo pode liberá-lo. (Lógico)

Retorno: 
Retorna identificador dono do semáforo. (Letras)

Observação:
1. A função tentará adquirir o semáforo até o tempo máximo especificado no 2º parâmetro. Caso não consiga, retornará
uma exceção.
2. Caso o "Pool de Conexões" esteja ativo no sistema, não deverá ser habilitado o terceiro parâmetro desta função.

### Código Servidor (Java)

```java
private static java.util.concurrent.ConcurrentHashMap<String, SemaphoreManager> semaphores = new java.util.concurrent.ConcurrentHashMap<String, SemaphoreManager>();
  private class SemaphoreManager {
    private String guid;
    private java.util.concurrent.Semaphore semaphore;
    private boolean owner;
    /**
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
      return semaphore.equals(((SemaphoreManager) obj).semaphore);
    }
  }
  protected final Variant ebfSemaphoreAcquire(Variant identifier, Variant time, Variant owner) throws Exception {
    SemaphoreManager manager = semaphores.get(identifier.toString());
    if (manager == null) {
      java.util.concurrent.Semaphore semaphore = new java.util.concurrent.Semaphore(1, true);
      manager = new SemaphoreManager();
      manager.semaphore = semaphore;
      semaphores.put(identifier.toString(), manager);
    }
    if (manager.semaphore.tryAcquire(time.getLong(), java.util.concurrent.TimeUnit.MILLISECONDS)) {
      // Caso apenas o proprietário possa adquirir, então o seu guid é atribuído, pois este passa a ser o proprietário
      manager.owner = owner.getBoolean();
      if (manager.owner) {
        manager.guid = client.getData().connection().getConnectionGUID();
      }
      return VariantPool.get(manager.guid);    
    } else {    
      throw new Exception("Tempo limite para obter o semáforo alcançado.");
    }
  }
```

---

## Semáforo - Está Livre?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSemaphoreIsInUse` |
| **Código** | 387 |
| **Assinatura** | `Semáforo - Quantidade de Aquisições (Letras) : Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 21 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Retorna se um semáforo está livre a partir de um identificador. Um semáforo está livre, se um processo chamou a função 
"Semáforo - Adquirir" e ainda não usou a função "Semáforo - Liberar".

Parâmetro:
1. Identificador único para representação do semáforo. (Letras)

Retorno:
"Verdadeiro" se o semáforo estiver livre, "Falso" se não estiver livre. (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfSemaphoreIsInUse(Variant identifier) throws Exception {
    SemaphoreManager manager = semaphores.get(identifier.toString());
    
    if (manager == null) {
      return Variant.VARIANT_TRUE;
    } else {
      return VariantPool.get(manager.semaphore.availablePermits() > 0);
    }
    
  }
```

---

## Semáforo - Liberar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSemaphoreRelease` |
| **Código** | 244 |
| **Assinatura** | `Semáforo - Liberar (Letras) : Lógico` |
| **Parâmetros** | Letras |
| **Retorno** | Lógico |
| **Tipo** | 21 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Essa função libera a ocorrência que foi bloqueada pelo semáforo a partir de um identificador.

Parâmetro:
1. Identificador do semáforo (o mesmo utilizado para a aquisição do semáforo). (Letras)

Retorno:
A função retorna "Verdadeiro" se foi possível liberar o semáforo. Caso contrário, "Falso". (Lógico)

### Código Servidor (Java)

```java
protected final Variant ebfSemaphoreRelease(Variant identifier) throws Exception {
    SemaphoreManager manager = semaphores.get(identifier.toString());
    if (manager != null) {
      if ((manager.semaphore.availablePermits() == 0) && (!manager.owner) || (manager.owner && client.getData().connection().getConnectionGUID().equals(manager.guid))) {
        manager.semaphore.release(1);        
        semaphores.remove(identifier.toString());
        return Variant.VARIANT_TRUE;
      }
    }
    return Variant.VARIANT_FALSE;
  }
```

---

# Funções Nativas - Acesso Nativo

Total: **6** funções

[← Voltar para Funções Nativas](README.md)

---

## Chamar Método de Biblioteca Dinâmica

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCallNativeFunction` |
| **Código** | 245 |
| **Assinatura** | `Chamar Método de Biblioteca Dinâmica (Letras;Letras;Variante;Variante): Variante` |
| **Parâmetros** | Letras;Letras;Variante;Variante |
| **Retorno** | Variante |
| **Tipo** | 22 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Chama um método de uma biblioteca dinâmica.

Parâmetro(s):
1. Nome da Biblioteca. (Letras)
2. Função. (Letras)
3. Parâmetros para a função. (Variante)
4. Tipo do retorno. (Variante)

Retorno:
Retorna o resultado da chamada. (Variante)

Observações:
1. Os parâmetros são passados como uma lista, sendo que cada elemento da lista é uma lista, representando cada parâmetro da função da biblioteca.
2. A lista interna é composta de 2 elementos, o valor e o tipo (String) do parâmetro.
3. Só podem ser utilizados tipos primitivos.
4. Tipos suportados para o valor de retorno e os parâmetros:
char
short
wchar
bool
int
long
long64 
float
double
char *
void *
BYTE
TCHAR
WORD
DWORD
LPCSTR
HANDLE
LPVOID

Exemplo:
1. Chamando a DLL de validação de inscrição estadual:
Parâmetro 1 (Letras): "C:\TEMP\DLL 3\DllInscE32.dll"
Parâmetro 2 (Letras): "ConsisteInscricaoEstadual"
Parâmetro 3 (Variante): Lista [["255188404", "char*"],["BA", "char*"]]
Parâmetro 4 (Letras): "int"
O exemplo retornará 1, o que indica uma inscrição estadual inválida.

### Código Servidor (Java)

```java
protected static final Variant ebfCallNativeFunction(Variant libraryName, Variant functionName, Variant args, Variant returnType) throws Exception {
    List<List<Object>> argsList = List.class.cast(args.getObject()); 
    Object[] argValues = new Object[argsList.size()];
    for (int i = 0; i < argsList.size(); i++) {
      List arg = argsList.get(i);
      argValues[i] = VariantPool.get(arg.get(0)).getJNAValue((String) arg.get(1));
    } 
    com.sun.jna.Native.setProtected(true);
    com.sun.jna.Function func = com.sun.jna.Function.getFunction(libraryName.toString(), functionName.toString());
    Object result = func.invoke(Variant.getJNAType(returnType.toString()), argValues);
    return VariantPool.get(result);
  }
```

---

## [DEPRECIADO] Criar objeto COM

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfCreateCOMObject` |
| **Código** | 1168 |
| **Assinatura** | `[DEPRECIADO] Criar objeto COM (Variante): Letras` |
| **Parâmetros** | Variante |
| **Retorno** | Letras |
| **Tipo** | 22 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: ESTA FUNÇÃO FOI DEPRECIADA. A INTERAÇÃO COM OBJETOS COM ATRAVÉS DE ACESSO NATIVO É UMA TECNOLOGIA LEGADA QUE ESTÁ SENDO DESCONTINUADA NA PLATAFORMA PARA MELHORAR A SEGURANÇA E A MANUTENIBILIDADE.

Cria um objeto COM.

Parâmetro:
1. CLSID do objeto COM. (Letras)

Retorno:
Retorna o objeto COM criado. (Variante)

Observações:
1. Será necessário a inclusão da DLL \"jcom.dll\" na pasta system32 do Windows.
2. Deve-se incluir as chaves no parâmetro.
    Ex: {6552876E-0C0F-4A1D-885B-4388E37E188D}

### Código Servidor (Java)

```java
protected final Variant ebfCreateCOMObject(Variant clsidObjetoCOM) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] Definir propriedade de um objeto COM

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfSetPropertyCOM` |
| **Código** | 1169 |
| **Assinatura** | `[DEPRECIADO] Definir propriedade de um objeto COM (Variante;Letras;Variante)` |
| **Parâmetros** | Variante;Letras;Variante |
| **Tipo** | 22 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: ESTA FUNÇÃO FOI DEPRECIADA. A INTERAÇÃO COM OBJETOS COM ATRAVÉS DE ACESSO NATIVO É UMA TECNOLOGIA LEGADA QUE ESTÁ SENDO DESCONTINUADA NA PLATAFORMA PARA MELHORAR A SEGURANÇA E A MANUTENIBILIDADE.

Definir uma propriedade de um objeto COM.

Parâmetro(s):
1. Objeto COM. (Variante)
2. Nome da propriedade do objeto COM. (Letras)
3. Lista com o(s) valor(es) da(s) propriedade(s). (Variante)

Retorno:
Não possui.

Observação:
Será necessário a inclusão da DLL "jcom.dll" na pasta system32 do Windows.

### Código Servidor (Java)

```java
protected final Variant ebfSetPropertyCOM(Variant objetoCOM, Variant nomePropriedadeObjetoCOM, Variant valorPropriedadeObjetoCOM) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] Destrói um objeto COM

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDestroyCOMObject` |
| **Código** | 1170 |
| **Assinatura** | `[DEPRECIADO] Destrói um objeto COM (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 22 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: ESTA FUNÇÃO FOI DEPRECIADA. A INTERAÇÃO COM OBJETOS COM ATRAVÉS DE ACESSO NATIVO É UMA TECNOLOGIA LEGADA QUE ESTÁ SENDO DESCONTINUADA NA PLATAFORMA PARA MELHORAR A SEGURANÇA E A MANUTENIBILIDADE.

Destrói um objeto COM

Parâmetro:
1. Objeto COM.

Retorno:
Não possui.

Observação:
Será necessário a inclusão da DLL "jcom.dll" na pasta system32 do Windows.

### Código Servidor (Java)

```java
protected final Variant ebfDestroyCOMObject(Variant objetoCOM) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] Executar Método de um objeto COM

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfExecuteMethodCOM` |
| **Código** | 1171 |
| **Assinatura** | `[DEPRECIADO] Executar Método de um objeto COM (Variante;Letras;Variante): Variante` |
| **Parâmetros** | Variante;Letras;Variante |
| **Retorno** | Variante |
| **Tipo** | 22 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: ESTA FUNÇÃO FOI DEPRECIADA. A INTERAÇÃO COM OBJETOS COM ATRAVÉS DE ACESSO NATIVO É UMA TECNOLOGIA LEGADA QUE ESTÁ SENDO DESCONTINUADA NA PLATAFORMA PARA MELHORAR A SEGURANÇA E A MANUTENIBILIDADE.

Executa um método de um objeto COM.

Parâmetro(s):
1. Objeto COM. (Variante)
2. Nome do método do objeto COM. (Letras)
3. Lista com os parâmetros do método. (Letras)

Retorno:
Retorna o resultado da execução do método, ou nulo se o método não tiver retorno. (Variante)

Observação:
Será necessário a inclusão da DLL "jcom.dll" na pasta system32 do Windows.

### Código Servidor (Java)

```java
protected final Variant ebfExecuteMethodCOM(Variant objetoCOM, Variant nomeMetodoObjetoCOM, Variant parametrosMetodoObjetoCOM) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

## [DEPRECIADO] Obter propriedade de um objeto COM

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfGetPropertyCOM` |
| **Código** | 1172 |
| **Assinatura** | `[DEPRECIADO] Obter propriedade de um objeto COM (Variante;Letras): Variante` |
| **Parâmetros** | Variante;Letras |
| **Retorno** | Variante |
| **Tipo** | 22 |
| **Compatibilidade** | Banco de Dados |

### Descrição

ATENÇÃO: ESTA FUNÇÃO FOI DEPRECIADA. A INTERAÇÃO COM OBJETOS COM ATRAVÉS DE ACESSO NATIVO É UMA TECNOLOGIA LEGADA QUE ESTÁ SENDO DESCONTINUADA NA PLATAFORMA PARA MELHORAR A SEGURANÇA E A MANUTENIBILIDADE.

Obtém o valor de uma propriedade de um objeto COM.

Parâmetro(s):
1. Objeto COM. (Variante)
2. Nome da propriedade do objeto COM. (Letras)

Retorno:
Valor da propriedade. (Variante)

Observação:\nSerá necessário a inclusão da DLL "jcom.dll" na pasta system32 do Windows.

### Código Servidor (Java)

```java
protected final Variant ebfGetPropertyCOM(Variant objetoCOM, Variant nomePropriedadeObjetoCOM) {
    System.out.println("ATENÇÃO: A função foi depreciada e não possui mais efeito.");
    return Variant.VARIANT_NULL;
  }
```

---

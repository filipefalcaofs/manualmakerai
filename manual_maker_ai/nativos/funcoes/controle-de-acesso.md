# Funções Nativas - Controle de Acesso

Total: **5** funções

[← Voltar para Funções Nativas](README.md)

---

## Adicionar Usuário ao Grupo

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfAddUserPermission` |
| **Código** | 168 |
| **Assinatura** | `Adicionar Usuário ao Grupo(Grupo, Login, Nome, Tipo, Dias, DataDoLogin)` |
| **Parâmetros** | Inteiro;Letras;Letras;Letras;Inteiro;Data |
| **Retorno** | Inteiro |
| **Tipo** | 19 |
| **Compatibilidade** | Servidor, Banco de Dados |

### Descrição

Define a permissão de grupo de usuários. 
Se o usuário informar o grupo no primeiro parâmetro a função retorna o código do grupo, se não for informado o grupo no primeiro parâmetro a função cria um grupo e retorna seu codigo.
 
Parâmetro(s):
1. Código do grupo. (Inteiro) (Ver observação 1)
2. Login do usuário. (Letras)
3. Nome do usuário. (Letras)
4. Tipo de expiração da senha. (Letras)
5. Quantidade de dias de expiração. (Inteiro)
6. Data que iniciou o login do usuário. (Data)

Retorno:
Controle de acesso do usuário adicionando ao grupo. (Inteiro)

Observações:
1. O 1º Parâmetro pode ser obtido através da tabela fr_grupo.
2. No 4º Parâmetro deve colocar:
"E" - se a senha expira em quantidades de dias determinada.
"T" - se a senha é forçada a ser alterada em quantidade de dias especifica.
" I "- se a senha nunca expira
A função cria o usuário para a sessão e não no banco de dados. 
Esta função deve ser utilizada no evento "Ao Entrar" do sistema.

### Código Servidor (Java)

```java
protected final Variant ebfAddUserPermission(Variant group, Variant login, Variant name, Variant type, Variant days, Variant loginDate) throws Exception {
    WFRAccess access = manager.getSys().getAccess();
    return VariantPool.get(access.addUser(group.getLong().intValue(), login.getTrimString(), name.getTrimString(), type.getTrimString().charAt(0),
        days.getLong().intValue(), new java.sql.Date(loginDate.getDate().getTime())));
  }
```

---

## Definir Permissões do Componente

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDefineComponentPermissionNew` |
| **Código** | 486 |
| **Assinatura** | `Definir Permissões do Componente (Inteiro;Inteiro;Inteiro;Lógico;Lógico;Lógico)` |
| **Parâmetros** | Inteiro;Inteiro;Inteiro;Lógico;Lógico;Lógico |
| **Tipo** | 19 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Define permissões de acesso ao componente para o grupo informado.

Parâmetro(s):
1. Código do grupo. (Inteiro) (Ver observação 1)
2. Código do formulário. (Inteiro) (Ver observação 2)
3. Código do componente (Propriedade Código). (Inteiro)
4. Estado do componente (Visível ou Invisível). (Lógico)
5. Apenas leitura? (Lógico)
6. Habilitar componente? (Lógico)

Retorno:
Não possui

Observações:
1. O 1º Parâmetro pode ser obtido através da tabela fr_grupo.
2. O 2º Parâmetro pode ser obtido através da tabela fr_formulário.
3. As permissões definidas serão aplicadas imediatamente, desta forma, não é necessário que o usuário efetue um novo login para que as permissões tenham efeito.

### Código Servidor (Java)

```java
protected final Variant ebfDefineComponentPermissionNew(Variant group, Variant form, Variant component, Variant visible, Variant readonly, Variant enabled) 
throws Exception {
    WFRAccess access = manager.getSys().getAccess();
    WFRAccessGroup accessGroup = access.getGroup(group.getString());
    WFRAccessPermission accessPermission = accessGroup.getComponentPermission(form.getString(), component.getString());
    if (accessPermission == null) {
    	accessPermission = WFRAccessPermission.getComponentInstance(access, form.getString(), component.getString());
    	accessGroup.setComponentPermission(form.getString(), component.getString(), accessPermission);
    }
    accessPermission.setVisible(visible.getBoolean());
    accessPermission.setReadOnly(readonly.getBoolean());
    accessPermission.setEnabled(enabled.getBoolean());
    return Variant.VARIANT_NULL;
  }
```

---

## Definir Permissões do Formulário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDefineFormPermissionNew` |
| **Código** | 485 |
| **Assinatura** | `Definir Permissão do Formulário (Inteiro;Inteiro;Lógico;Lógico;Lógico;Lógico)` |
| **Parâmetros** | Inteiro;Inteiro;Lógico;Lógico;Lógico;Lógico |
| **Tipo** | 19 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Define permissões de acesso do formulário para o grupo informado.

Parâmetro(s):
1. Código do grupo. (Inteiro) (Ver observação 1)
2. Código do formulário. (Inteiro) (Ver observação 2)
3. Estado do formulário (Visível ou Invisível). (Lógico)
4. Apenas leitura? (Lógico)
5. Tem permissão de inclusão? (Lógico)
6. Tem permissão de exclusão? (Lógico)

Retorno:
Não possui.

Observações:
1. O 1º Parâmetro pode ser obtido através da tabela fr_grupo.
2. O 2º Parâmetro pode ser obtido através da tabela fr_formulário.
3. O 3º parâmetro define se o grupo informado terá acesso ou não ao formulário.
4. As permissões definidas serão aplicadas imediatamente, desta forma, não é necessário que o usuário efetue um novo login para que as permissões tenham efeito.

### Código Servidor (Java)

```java
protected final Variant ebfDefineFormPermissionNew(Variant group, Variant form, Variant visible, Variant readonly, Variant include, Variant delete)
      throws Exception {
    wfr.com.WFRAccess access = manager.getSys().getAccess();        
    wfr.com.WFRAccessGroup accessGroup = access.getGroup(group.getString());
    wfr.com.WFRAccessPermission accessPermission = accessGroup.getFormPermission(form.getString());
    if (accessPermission == null) {
      accessPermission = wfr.com.WFRAccessPermission.getFormInstance(access, form.getString());
      accessGroup.setFormPermission(form.getString(), accessPermission);
    }    
    accessPermission.setVisible(visible.getBoolean());
    accessPermission.setReadOnly(readonly.getBoolean());
    accessPermission.setInclude(include.getBoolean());
    accessPermission.setDelete(delete.getBoolean());    
    return Variant.VARIANT_NULL;
  }
```

---

## Definir Permissões do Relatório

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfDefineReportPermissionNew` |
| **Código** | 487 |
| **Assinatura** | `Definir Permissões do Relatório (Inteiro;Inteiro;Lógico)` |
| **Parâmetros** | Inteiro;Inteiro;Lógico |
| **Tipo** | 19 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Define se o grupo informado poderá acessar ou não o relatório.

Parâmetro(s):
1. Código do Grupo. (Inteiro) (Ver observação 1)
2. Código do Relatório. (Inteiro) (Ver observação 2)
3. Pode Acessar? (Lógico)

Retorno:
Não possui.

Observações:
1. O 1º Parâmetro pode ser obtido através da tabela fr_grupo.
2. O 2º Parâmetro pode ser obtido através da tabela fr_relatório.
3. A permissão definida será aplicada imediatamente, desta forma, não é necessário que o usuário efetue um novo login para que a permissão tenha efeito.

### Código Servidor (Java)

```java
protected final Variant ebfDefineReportPermissionNew(Variant group, Variant report, Variant enabled) 
      throws Exception {
    WFRAccess access = manager.getSys().getAccess();
    WFRAccessGroup accessGroup = access.getGroup(group.getString());
    WFRAccessPermission accessPermission = accessGroup.getReportPermission(report.getString());
    if (accessPermission == null) {
    	accessPermission = WFRAccessPermission.getReportInstance(access, report.getString());
    	accessGroup.setReportPermission(report.getString(), accessPermission);
    }
    accessPermission.setEnabled(enabled.getBoolean());
    return Variant.VARIANT_NULL;
  }
```

---

## Projeto em que Modo Está?

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfUserAccessWhichMode` |
| **Código** | 428 |
| **Retorno** | Letras |
| **Tipo** | 19 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Verifica em que modo o projeto se encontra.

Parâmetro:
Não possui.

Retorno:
Retorna o estado do projeto. (Letras)
P -> Modo de Permissão (Gerente)
D -> Modo de Projeto (Desenvolvimento)
N -> Modo Normal

### Código Servidor (Java)

```java
protected final Variant ebfUserAccessWhichMode() throws Exception {
    return VariantPool.get(getData().getHtmlInterface().getAccess().getValue());
  }
```

---

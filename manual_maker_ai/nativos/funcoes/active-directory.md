# Funções Nativas - Active Directory

Total: **5** funções

[← Voltar para Funções Nativas](README.md)

---

## AD - Autenticar Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfADAuthentication` |
| **Código** | 286 |
| **Assinatura** | `AD - Autenticar Usuário (Letras;Letras;Letras;Letras;Letras) : Lógico` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Lógico |
| **Tipo** | 25 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Autentica um usuário no Active Directory.

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Domínio. (Letras)
4. Usuário. (Letras)
5. Senha. (Letras)

Retorno:
Retorna Verdadeiro se a autenticação foi efetuada com sucesso. Caso contrário, retorna Falso. (Lógico)

Exemplo:
Assumindo os parâmetros Servidor: "urano",  Porta: "389", Domínio: "softwell.local", Usuário: "maker" e  Senha: "1", o retorno será Verdadeiro caso a autenticação seja realizada com sucesso ou falso caso contrário.

### Código Servidor (Java)

```java
protected final Variant ebfADAuthentication(Variant server, Variant port, Variant domain, Variant user, Variant password) throws Exception {
    Hashtable<String, String> env = new Hashtable<String, String>();
    env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "simple");
    env.put(javax.naming.Context.SECURITY_PRINCIPAL, user.toString() + "@" + domain.toString());
    env.put(javax.naming.Context.SECURITY_CREDENTIALS, password.toString());
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(javax.naming.Context.PROVIDER_URL, "ldap://" + server.toString() + ":" + port.toString());
    
    try {
      javax.naming.directory.DirContext ctx = new javax.naming.directory.InitialDirContext(env);
      ctx.close();
    } catch (javax.naming.AuthenticationException e) {
      e.printStackTrace();
      return Variant.VARIANT_FALSE;
    }
    
    return Variant.VARIANT_TRUE;
  }
```

---

## AD - Obter Contas de Computador

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfADGetComputerHosts` |
| **Código** | 373 |
| **Assinatura** | `AD - Obter Contas de Computador (Letras;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 25 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém todas as contas de computador do Active Directory.

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Domínio. (Letras)
4. Usuário. (Letras)
5. Senha. (Letras)

Retorno:
Retorna uma lista contendo as contas de computador do Acitve Directory. (Variante)

Exemplo:
Assumindo os parâmetros Servidor: "urano",  Porta: "389", Domínio: "softwell.local", Usuário: "maker" e  Senha: "1".

### Código Servidor (Java)

```java
protected final Variant ebfADGetComputerHosts(Variant server, Variant port, Variant domainVar, Variant user, Variant password) throws Exception {
    String domain = domainVar.toString();
    
    Hashtable<String, String> env = new Hashtable<String, String>();
    env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "simple");
    env.put(javax.naming.Context.SECURITY_PRINCIPAL, user.toString() + "@" + domain);
    env.put(javax.naming.Context.SECURITY_CREDENTIALS, password.toString());
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(javax.naming.Context.PROVIDER_URL, "ldap://" + server.toString() + ":" + port.toString());

    javax.naming.directory.DirContext ctx = new javax.naming.directory.InitialDirContext(env);

    javax.naming.directory.SearchControls searchCtls = new javax.naming.directory.SearchControls();

    searchCtls.setSearchScope(javax.naming.directory.SearchControls.SUBTREE_SCOPE);

    List<String> values = new ArrayList<String>();

    String searchFilter = "(&(objectClass=user)(sAMAccountType=805306369))";
    
    String searchBase = null;
    
    boolean firstToken = true;
    StringTokenizer tokenizer = new StringTokenizer(domain, ".");
    while (tokenizer.hasMoreElements()) {
      if (firstToken) {
        searchBase = "";
        firstToken = false;
      } else {
        searchBase += ",";
      }
      String token = tokenizer.nextElement().toString();
      searchBase += ("DC=" + token);
    }

    String returnedAtts[] = { "sAMAccountName" };
    searchCtls.setReturningAttributes(returnedAtts);

    javax.naming.NamingEnumeration answer = ctx.search(searchBase, searchFilter, searchCtls);
    while (answer.hasMoreElements()) {
      javax.naming.directory.SearchResult sr = (javax.naming.directory.SearchResult) answer.next();

      javax.naming.directory.Attributes attrs = sr.getAttributes();
      if (attrs != null) {
        for (javax.naming.NamingEnumeration ae = attrs.getAll(); ae.hasMore();) {
          javax.naming.directory.Attribute attr = (javax.naming.directory.Attribute) ae.next();
          for (javax.naming.NamingEnumeration e = attr.getAll(); e.hasMore();) {
            values.add(e.next().toString());
          }
        }
      }
    }

    ctx.close();

    return VariantPool.get(values);
  }
```

---

## AD - Obter Grupos

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfADGetGroups` |
| **Código** | 347 |
| **Assinatura** | `AD - Obter Grupos (Letras;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 25 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém os grupos do Active Directory.

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Domínio. (Letras)
4. Usuário. (Letras)
5. Senha. (Letras)

Retorno: 
Retorna uma lista contendo os grupos do Acitve Directory. (Variante)

Exemplo:
Assumindo os parâmetros Servidor: "urano",  Porta: "389", Domínio: "softwell.local", Usuário: "maker" e  Senha: "1".

### Código Servidor (Java)

```java
protected final Variant ebfADGetGroups(Variant server, Variant port, Variant domainVar, Variant user, Variant password) throws Exception {
    String domain = domainVar.toString();
    
    Hashtable<String, String> env = new Hashtable<String, String>();
    env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "simple");
    env.put(javax.naming.Context.SECURITY_PRINCIPAL, user.toString() + "@" + domain);
    env.put(javax.naming.Context.SECURITY_CREDENTIALS, password.toString());
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(javax.naming.Context.PROVIDER_URL, "ldap://" + server.toString() + ":" + port.toString());

    javax.naming.directory.DirContext ctx = new javax.naming.directory.InitialDirContext(env);

    javax.naming.directory.SearchControls searchCtls = new javax.naming.directory.SearchControls();

    searchCtls.setSearchScope(javax.naming.directory.SearchControls.SUBTREE_SCOPE);

    List<String> values = new ArrayList<String>();

    String searchFilter = "(objectClass=group)";
    
    String searchBase = null;
    
    boolean firstToken = true;
    StringTokenizer tokenizer = new StringTokenizer(domain, ".");
    while (tokenizer.hasMoreElements()) {
      if (firstToken) {
        searchBase = "";
        firstToken = false;
      } else {
        searchBase += ",";
      }
      String token = tokenizer.nextElement().toString();
      searchBase += ("DC=" + token);
    }

    String returnedAtts[] = { "name" };
    searchCtls.setReturningAttributes(returnedAtts);

    javax.naming.NamingEnumeration answer = ctx.search(searchBase, searchFilter, searchCtls);
    while (answer.hasMoreElements()) {
      javax.naming.directory.SearchResult sr = (javax.naming.directory.SearchResult) answer.next();

      javax.naming.directory.Attributes attrs = sr.getAttributes();
      if (attrs != null) {
        for (javax.naming.NamingEnumeration ae = attrs.getAll(); ae.hasMore();) {
          javax.naming.directory.Attribute attr = (javax.naming.directory.Attribute) ae.next();
          for (javax.naming.NamingEnumeration e = attr.getAll(); e.hasMore();) {
            values.add(e.next().toString());
          }
        }
      }
    }

    ctx.close();

    return VariantPool.get(values);
  }
```

---

## AD - Obter Grupos do Usuário

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfADGetGroupsByUser` |
| **Código** | 348 |
| **Assinatura** | `AD - Obter Grupos do Usuário (Letras;Letras;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 25 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém os grupos do Active Directory de um determinado usuário.

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Domínio. (Letras)
4. Usuário. (Letras)
5. Senha. (Letras)
6. Usuário no qual deseja obter o grupo. (Letras)

Retorno: 
Retorna uma lista contendo os grupos do Acitve Directory do usuário passado pelo 6° parâmetro. (Variante)

Exemplo:
Assumindo os parâmetros Servidor: "urano",  Porta: "389", Domínio: "softwell.local", Usuário: "maker", 
Senha: "1" e Usuário do Grupo "João".

### Código Servidor (Java)

```java
protected final Variant ebfADGetGroupsByUser(Variant server, Variant port, Variant domainVar, Variant user, Variant password, Variant userToFindGroups) throws Exception {
    String domain = domainVar.toString();

    Hashtable<String, String> env = new Hashtable<String, String>();
    env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "simple");
    env.put(javax.naming.Context.SECURITY_PRINCIPAL, user.toString() + "@" + domain);
    env.put(javax.naming.Context.SECURITY_CREDENTIALS, password.toString());
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(javax.naming.Context.PROVIDER_URL, "ldap://" + server.toString() + ":" + port.toString());

    javax.naming.directory.DirContext ctx = new javax.naming.directory.InitialDirContext(env);

    javax.naming.directory.SearchControls searchCtls = new javax.naming.directory.SearchControls();

    searchCtls.setSearchScope(javax.naming.directory.SearchControls.SUBTREE_SCOPE);

    List<String> values = new ArrayList<String>();

    String searchFilter = ("(&(objectClass=user)(sAMAccountName=" + userToFindGroups + "))");

    String searchBase = null;

    boolean firstToken = true;
    StringTokenizer tokenizer = new StringTokenizer(domain, ".");
    while (tokenizer.hasMoreElements()) {
      if (firstToken) {
        searchBase = "";
        firstToken = false;
      } else {
        searchBase += ",";
      }
      String token = tokenizer.nextElement().toString();
      searchBase += ("DC=" + token);
    }

    String returnedAtts[] = { "memberOf" };
    searchCtls.setReturningAttributes(returnedAtts);

    javax.naming.NamingEnumeration answer = ctx.search(searchBase, searchFilter, searchCtls);
    while (answer.hasMoreElements()) {
      javax.naming.directory.SearchResult sr = (javax.naming.directory.SearchResult) answer.next();

      javax.naming.directory.Attributes attrs = sr.getAttributes();
      if (attrs != null) {
        for (javax.naming.NamingEnumeration ae = attrs.getAll(); ae.hasMore();) {
          javax.naming.directory.Attribute attr = (javax.naming.directory.Attribute) ae.next();
          for (javax.naming.NamingEnumeration e = attr.getAll(); e.hasMore();) {
            String group = e.next().toString();

            java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("CN=(.+?),");
            java.util.regex.Matcher matcher = pattern.matcher(group);

            if (matcher.find()) {
              values.add(matcher.group(1));
            }
          }
        }
      }
    }

    ctx.close();

    return VariantPool.get(values);
  }
```

---

## AD - Obter Logins dos Usuários

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfADGetUserLogins` |
| **Código** | 372 |
| **Assinatura** | `AD - Obter Logins dos Usuários (Letras;Letras;Letras;Letras;Letras): Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 25 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém os Logins dos usuários do Active Directory.

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Domínio. (Letras)
4. Usuário. (Letras)
5. Senha. (Letras)

Retorno: 
Retorna uma lista contendo os logins dos usuários do Acitve Directory. (Variante)

Exemplo:
Assumindo os parâmetros Servidor: "urano",  Porta: "389", Domínio: "softwell.local", Usuário: "maker" e
Senha: "1".

### Código Servidor (Java)

```java
protected final Variant ebfADGetUserLogins(Variant server, Variant port, Variant domainVar, Variant user, Variant password) throws Exception {
    String domain = domainVar.toString();
    
    Hashtable<String, String> env = new Hashtable<String, String>();
    env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "simple");
    env.put(javax.naming.Context.SECURITY_PRINCIPAL, user.toString() + "@" + domain);
    env.put(javax.naming.Context.SECURITY_CREDENTIALS, password.toString());
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(javax.naming.Context.PROVIDER_URL, "ldap://" + server.toString() + ":" + port.toString());

    javax.naming.directory.DirContext ctx = new javax.naming.directory.InitialDirContext(env);

    javax.naming.directory.SearchControls searchCtls = new javax.naming.directory.SearchControls();

    searchCtls.setSearchScope(javax.naming.directory.SearchControls.SUBTREE_SCOPE);

    List<String> values = new ArrayList<String>();

    String searchFilter = "(&(objectClass=user)(sAMAccountType=805306368))";
    
    String searchBase = null;
    
    boolean firstToken = true;
    StringTokenizer tokenizer = new StringTokenizer(domain, ".");
    while (tokenizer.hasMoreElements()) {
      if (firstToken) {
        searchBase = "";
        firstToken = false;
      } else {
        searchBase += ",";
      }
      String token = tokenizer.nextElement().toString();
      searchBase += ("DC=" + token);
    }

    String returnedAtts[] = { "sAMAccountName" };
    searchCtls.setReturningAttributes(returnedAtts);

    javax.naming.NamingEnumeration answer = ctx.search(searchBase, searchFilter, searchCtls);
    while (answer.hasMoreElements()) {
      javax.naming.directory.SearchResult sr = (javax.naming.directory.SearchResult) answer.next();

      javax.naming.directory.Attributes attrs = sr.getAttributes();
      if (attrs != null) {
        for (javax.naming.NamingEnumeration ae = attrs.getAll(); ae.hasMore();) {
          javax.naming.directory.Attribute attr = (javax.naming.directory.Attribute) ae.next();
          for (javax.naming.NamingEnumeration e = attr.getAll(); e.hasMore();) {
            values.add(e.next().toString());
          }
        }
      }
    }

    ctx.close();

    return VariantPool.get(values);
  }
```

---

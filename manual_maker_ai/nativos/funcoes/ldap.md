# Funções Nativas - LDAP

Total: **3** funções

[← Voltar para Funções Nativas](README.md)

---

## LDAP - Conectar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLDAPConnect` |
| **Código** | 374 |
| **Assinatura** | `LDAP - Conectar (Letras;Letras;Letras;Letras;Letras) : Variante` |
| **Parâmetros** | Letras;Letras;Letras;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 27 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Autentica um usuário via LDAP (Lightweight Directory Access Protocol).

Parâmetro(s):
1. Servidor. (Letras)
2. Porta. (Letras)
3. Domínio. (Letras)
4. Usuário. (Letras)
5. Senha. (Letras)

Retorno:
Retorna a conexão LDAP se a autenticação foi efetuada com sucesso. Caso contrário, retorna Nulo.
Caso o Servidor ou a Porta estejam incorretos, um erro será lançado. (Variante)

Exemplo:
Assumindo os parâmetros como:
   Servidor: authserv
   Porta: 389
   Domínio: softwell.local
   Usuário: maker
   Senha: 1

### Código Servidor (Java)

```java
protected final Variant ebfLDAPConnect(Variant server, Variant port, Variant domain, Variant user, Variant password) throws Exception {
    java.util.Hashtable<String, String> env = new java.util.Hashtable<String, String>();
    env.put(javax.naming.Context.SECURITY_AUTHENTICATION, "simple");
    env.put(javax.naming.Context.SECURITY_PRINCIPAL, user.toString() + "@" + domain.toString());
    env.put(javax.naming.Context.SECURITY_CREDENTIALS, password.toString());
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(javax.naming.Context.PROVIDER_URL, "ldap://" + server.toString() + ":" + port.toString());
    env.put("#domain#", domain.toString());

    javax.naming.directory.DirContext context;
    try {
      context = new javax.naming.directory.InitialDirContext(env);
    } catch (javax.naming.AuthenticationException e) {
      e.printStackTrace();
      return Variant.VARIANT_NULL;
    }

    return VariantPool.get(context);
  }
```

---

## LDAP - Desconectar

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLDAPDisconnect` |
| **Código** | 375 |
| **Assinatura** | `LDAP - Desconectar (Variante)` |
| **Parâmetros** | Variante |
| **Tipo** | 27 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Fecha a conexão LDAP.

Parâmetro:
1. Conexão LDAP. (Variante)

Retorno:
Não possui.

### Código Servidor (Java)

```java
protected final Variant ebfLDAPDisconnect(Variant contextVar) throws Exception {
    if (contextVar.isNull()) {
      return Variant.VARIANT_NULL;
    }
    
    if (!(contextVar.getObject() instanceof javax.naming.directory.DirContext)) {
      throw new Exception("Invalid parameter. Choose a LDAP connection.");
    }

    javax.naming.directory.DirContext context = javax.naming.directory.DirContext.class.cast(contextVar.getObject());
    context.close();

    return Variant.VARIANT_NULL;
  }
```

---

## LDAP - Obter Valores

| Propriedade | Valor |
|-------------|-------|
| **Nome Real** | `ebfLDAPGetValues` |
| **Código** | 376 |
| **Assinatura** | `LDAP - Obter Valores (Variante;Letras;Letras) : Variante` |
| **Parâmetros** | Variante;Letras;Letras |
| **Retorno** | Variante |
| **Tipo** | 27 |
| **Compatibilidade** | Banco de Dados |

### Descrição

Obtém valores via LDAP. Deve ser passado o filtro que será executado e o tipo do retorno.

Parâmetro(s):
1. Conexão LDAP. (Variante)
2. Filtro a ser executado. (Letras)
3. Tipo de retorno. (Letras)

Retorno:
Lista de valores a partir do filtro e retorno passados. (Variante)

Exemplo:
Assumindo os parâmetros como:
  Obter Grupos
  Filtro: (objectClass=group)
  Retorno: name

### Código Servidor (Java)

```java
protected final Variant ebfLDAPGetValues(Variant contextVar, Variant searchFilterVar, Variant returnAttributesVar) throws Exception {
    if (contextVar.isNull() || !(contextVar.getObject() instanceof javax.naming.directory.DirContext)) {
      throw new Exception("Invalid parameter. Choose a LDAP connection.");
    }

    javax.naming.directory.DirContext context = javax.naming.directory.DirContext.class.cast(contextVar.getObject());
    javax.naming.directory.SearchControls searchCtls = new javax.naming.directory.SearchControls();

    searchCtls.setSearchScope(javax.naming.directory.SearchControls.SUBTREE_SCOPE);

    List<String> values = new ArrayList<String>();

    String searchFilter = searchFilterVar.toString();

    String searchBase = null;
    String domain = context.getEnvironment().get("#domain#").toString();

    boolean firstToken = true;
    java.util.StringTokenizer tokenizer = new java.util.StringTokenizer(domain, ".");
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

    String returnedAtts[] = { returnAttributesVar.toString() };
    searchCtls.setReturningAttributes(returnedAtts);

    javax.naming.NamingEnumeration answer = context.search(searchBase, searchFilter, searchCtls);
    while (answer.hasMoreElements()) {
      javax.naming.directory.SearchResult sr = (javax.naming.directory.SearchResult) answer.next();

      javax.naming.directory.Attributes attrs = sr.getAttributes();
      if (attrs != null) {
        for (javax.naming.NamingEnumeration ae = attrs.getAll(); ae.hasMore();) {
          javax.naming.directory.Attribute attr = (javax.naming.directory.Attribute) ae.next();
          for (javax.naming.NamingEnumeration e = attr.getAll(); e.hasMore();) {
            String value = e.next().toString();

            /*java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("CN=(.+?),");
            java.util.regex.Matcher matcher = pattern.matcher(value);

            if (matcher.find()) {
              values.add(matcher.group(1));
            } */
            values.add(value);
          }
        }
      }
    }

    return VariantPool.get(values);
  }
```

---

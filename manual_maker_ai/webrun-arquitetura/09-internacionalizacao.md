# Internacionalização (i18n)

## Visão Geral

O Webrun suporta múltiplos idiomas através de arquivos de propriedades Java (`.properties`) no diretório `i18n/`.

## Idiomas Suportados

| Idioma | Locale | Arquivo | Chaves |
|--------|--------|---------|--------|

## Formato dos Arquivos

```properties
# Exemplo de messages_pt_BR.properties
logon.title=Autenticação
logon.user=Usuário
logon.password=Senha
logon.button=Entrar
error.access.denied=Acesso negado
```

## Arquivo de Traduções Estáticas

Além dos `.properties`, existe o arquivo `static_translations.xml` para traduções fixas de componentes.

## Uso nas JSPs

```jsp
<wfr:message key="logon.title"/>
```

## Uso no JavaScript

O arquivo `i18n_template.js` carrega as mensagens no cliente para uso em componentes JavaScript.

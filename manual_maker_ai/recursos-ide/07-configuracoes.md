# ⚙️ Configurações da IDE

## Funções de Pacote (`package.xml`)

Funções disponíveis no nível de pacote para manipulação de propriedades em tempo de execução:

### Geral - Obter Propriedade do Formulário

- **Categoria:** 

```
Obtém o valor de uma propriedade do formulário.

Parâmetros:
1. Propriedade do formulário (Propriedade)

Retorno:
Valor da propriedade informada.
```

**Parâmetros:**

1. `Propriedade` — Propriedade

**Retorno:** `` — Variante

### Geral - Obter Propriedade do Componente

- **Categoria:** 

```
Obtém o valor de uma propriedade do componente.

Parâmetros:
1. Propriedade do componente (Propriedade)

Retorno:
Valor da propriedade informada.
```

**Parâmetros:**

1. `Propriedade` — Propriedade

**Retorno:** `` — Variante

### Geral - Alterar Propriedade do Componente

- **Categoria:** 

```
Altera o valor de uma propriedade do componente.

Parâmetros:
1. Propriedade do componente (Propriedade)
2. Valor da propriedade (Variante)

Retorno:
Não possui.
```

**Parâmetros:**

1. `Propriedade` — Propriedade
2. `Valor` — Variante


---

## Compatibilidade de SGBDs (`dbinfo.ini`)

Informações de compatibilidade e requisitos por banco de dados:

### OpenODBC


### DB2

- Info1=São requisitos básicos para o uso com DB2:
- Info2=- Instalar o cliente DB2 e o driver ODBC
- Info3=- Criar um banco de dados e configurar
- Info4=  a conexão no centro de controle DB2
- Info5=
- Info6=Homologado apenas para a versão 9.5-9.7

### Interbase

- Info1=Homologado para as versões 2.5.1+

### MySQL

- Info1=Homologado para as versões 5.5+
- Info2=Homologado para o MariaDB 10+
- Info3=- Suportado apenas o Charset ISO-8859-1 (Latin1)

### Oracle

- Info1=Homologado para as versões 9i, 10g, 11g, 12c, 18c, 19c, 21c

### MSSQL

- Info1=Requisito básico para o funcionamento:
- Info2=- Habilitar o protocolo TCP/IP
- Info3=- Instalar o SQL Server Native Client de acordo com a versão do banco de dados
- Info4=Homologado para 2008R2+

### PostgreSQL

- Info1=Homologado para as versões 8.2, 8.3*, 8.4, 9.0 - 9.6, 10 - 14
- Info2=*Há notas para essa versão no manual


---

## Portal Maker Mobile (`runner-portal.xml`)

- **URL Base:** ``

- **Login URL:** ``
- **Logout URL:** ``

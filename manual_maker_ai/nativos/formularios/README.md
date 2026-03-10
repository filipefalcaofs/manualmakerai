# Formulários Nativos do Maker AI

Total: **11** formulários

[← Voltar para Nativos](../README.md)

---

## Sistema: SGFC - GESTÃO DE FOMENTOS CULTURAIS

### $_FORMULARIO_DO_SISTEMA

| Propriedade | Valor |
|-------------|-------|
| **Código** | 1 |
| **Tipo Criação** | 0 |

---

### Formulário Usuários X Sistemas

| Propriedade | Valor |
|-------------|-------|
| **Código** | 7150 |
| **Tabela** | FR_USUARIO_SISTEMA |
| **Campo Chave** | usr_codigo;sis_codigo |
| **Tipo Criação** | 0 |
| **Dimensões** | 600 x 456 |

**SQL Select:**

```sql
Select

  FR_USUARIO_SISTEMA.USR_CODIGO,

  FR_USUARIO_SISTEMA.SIS_CODIGO,

  FR_SISTEMA.SIS_DESCRICAO,

  FR_USUARIO.USR_NOME,

  FR_USUARIO_SISTEMA.SIS_CODIGO As "Sistema",

  FR_SISTEMA.SIS_DESCRICAO As "Descrição"

From

  FR_USUARIO_SISTEMA Inner Join

  FR_SISTEMA On FR_USUARIO_SISTEMA.SIS_CODIGO = FR_SISTEMA.SIS_CODIGO Inner Join

  FR_USUARIO On FR_USUARIO_SISTEMA.USR_CODIGO = FR_USUARIO.USR_CODIGO



Where

(  ((Select FR_USUARIO.USR_ADMINISTRADOR From FR_USUARIO Where (FR_USUARIO.USR_CODIGO = :MAKER_CODIGO_USUARIO)) = 'S') Or

  (FR_USUARIO_SISTEMA.SIS_CODIGO In (Select FR_USUARIO_SISTEMA.SIS_CODIGO From FR_USUARIO_SISTEMA Where (FR_USUARIO_SISTEMA.USR_CODIGO = :MAKER_CODIGO_USUARIO) And (FR_USUARIO_SISTEMA.USS_ADMINISTRADOR = 'S')))

)



/*WHERE_ADD*/

/*ORDER_NEW*/
```

---

### Grupos do Sistema

| Propriedade | Valor |
|-------------|-------|
| **Código** | 7149 |
| **Tabela** | FR_SISTEMA |
| **Campo Chave** | sis_codigo |
| **Tipo Criação** | 0 |
| **Dimensões** | 600 x 487 |

**SQL Select:**

```sql
Select

  FR_SISTEMA.SIS_CODIGO,

  FR_SISTEMA.SIS_DESCRICAO,

  FR_SISTEMA.SIS_CODIGO AS "Código do Sistema",

  FR_SISTEMA.SIS_DESCRICAO AS "Descrição"

From

  FR_SISTEMA

Where

(  ((Select FR_USUARIO.USR_ADMINISTRADOR From FR_USUARIO Where (FR_USUARIO.USR_CODIGO = :MAKER_CODIGO_USUARIO)) = 'S') Or

  (FR_SISTEMA.SIS_CODIGO In (Select FR_USUARIO_SISTEMA.SIS_CODIGO From FR_USUARIO_SISTEMA Where (FR_USUARIO_SISTEMA.USR_CODIGO = :MAKER_CODIGO_USUARIO) And (FR_USUARIO_SISTEMA.USS_ADMINISTRADOR = 'S')))

)

/*WHERE_ADD*/

Order By FR_SISTEMA.SIS_DESCRICAO

/*ORDER_ADD*/
```

---

### Sistema X Grupos

| Propriedade | Valor |
|-------------|-------|
| **Código** | 7148 |
| **Tabela** | FR_GRUPO |
| **Campo Chave** | grp_codigo;sis_codigo |
| **Tipo Criação** | 0 |
| **Dimensões** | 546 x 191 |

**SQL Select:**

```sql
Select

  FR_GRUPO.GRP_CODIGO,

  FR_GRUPO.SIS_CODIGO,

  FR_GRUPO.GRP_NOME

From

  FR_GRUPO

/*WHERE_NEW*/

/*ORDER_NEW*/
```

---

### Template - Dashboard

| Propriedade | Valor |
|-------------|-------|
| **Código** | 37 |
| **Tipo Criação** | 0 |
| **Dimensões** | 1031 x 632 |

---

### Template - Formulário Principal

| Propriedade | Valor |
|-------------|-------|
| **Código** | 20 |
| **Tipo Criação** | 0 |
| **Dimensões** | 1025 x 547 |

---

### Template - Formulário de Login

| Propriedade | Valor |
|-------------|-------|
| **Código** | 19 |
| **Tipo Criação** | 0 |
| **Dimensões** | 895 x 619 |

---

### Template - Kanban

| Propriedade | Valor |
|-------------|-------|
| **Código** | 54 |
| **Tipo Criação** | 0 |
| **Dimensões** | 1049 x 526 |

---

### Usuários

| Propriedade | Valor |
|-------------|-------|
| **Código** | 7146 |
| **Tabela** | FR_USUARIO |
| **Campo Chave** | usr_codigo |
| **Tipo Criação** | 0 |
| **Dimensões** | 700 x 694 |

**SQL Select:**

```sql
Select

  U.USR_CODIGO,

  U.USR_LOGIN,

  U.USR_SENHA,

  U.USR_ADMINISTRADOR,

  U.USR_TIPO_EXPIRACAO,

  U.USR_DIAS_EXPIRACAO,

  U.USR_IMAGEM_DIGITAL,

  U.USR_FOTO,

  U.USR_NOME,

  U.USR_EMAIL,

  U.USR_DIGITAL,

  U.USR_INICIO_EXPIRACAO,

  U.USR_LOGIN As Login,

  U.USR_NOME As Nome

From

  FR_USUARIO U

Where

  (((Select FU1.USR_ADMINISTRADOR From FR_USUARIO FU1 WHERE FU1.USR_LOGIN = :MAKER_LOGIN_USUARIO) = 'S') Or

  U.USR_CODIGO In (Select U2.USR_CODIGO From FR_USUARIO FU Inner Join FR_USUARIO_SISTEMA U1 On U1.USR_CODIGO = FU.USR_CODIGO Inner Join FR_USUARIO_SISTEMA U2 On U2.SIS_CODIGO = U1.SIS_CODIGO Where FU.USR_LOGIN = :MAKER_LOGIN_USUARIO AND U1.USS_ADMINISTRADOR = 'S') And

  U.USR_ADMINISTRADOR = 'N')

/*WHERE_ADD*/

/*ORDER_NEW*/
```

---

### Usuários X Sistemas

| Propriedade | Valor |
|-------------|-------|
| **Código** | 7147 |
| **Tabela** | FR_USUARIO_SISTEMA |
| **Campo Chave** | usr_codigo;sis_codigo |
| **Tipo Criação** | 0 |
| **Dimensões** | 325 x 273 |

**SQL Select:**

```sql
Select

  FR_USUARIO_SISTEMA.USR_CODIGO,

  FR_USUARIO_SISTEMA.SIS_CODIGO,

  FR_USUARIO_SISTEMA.USS_ACESSO_EXTERNO,

  FR_USUARIO_SISTEMA.USS_ADMINISTRADOR,

  FR_USUARIO_SISTEMA.USS_ACESSAR,

  FR_SISTEMA.SIS_DESCRICAO

From

  FR_USUARIO_SISTEMA Inner Join

  FR_USUARIO On FR_USUARIO_SISTEMA.USR_CODIGO = FR_USUARIO.USR_CODIGO Inner Join

  FR_SISTEMA On FR_SISTEMA.SIS_CODIGO = FR_USUARIO_SISTEMA.SIS_CODIGO

Where

  (((Select FR_USUARIO.USR_ADMINISTRADOR From FR_USUARIO Where (FR_USUARIO.USR_CODIGO = :MAKER_CODIGO_USUARIO)) = 'S') Or

  (FR_USUARIO_SISTEMA.SIS_CODIGO In (Select FR_USUARIO_SISTEMA.SIS_CODIGO From FR_USUARIO_SISTEMA Where (FR_USUARIO_SISTEMA.USR_CODIGO = :MAKER_CODIGO_USUARIO) And (FR_USUARIO_SISTEMA.USS_ADMINISTRADOR = 'S')))

)

/*WHERE_ADD*/

Order By

  FR_SISTEMA.SIS_DESCRICAO

/*ORDER_ADD*/
```

---

### Usuários X Sistemas X Grupos

| Propriedade | Valor |
|-------------|-------|
| **Código** | 7151 |
| **Tabela** | FR_USUARIO_GRUPO |
| **Campo Chave** | grp_codigo;sis_codigo;usr_codigo |
| **Tipo Criação** | 0 |
| **Dimensões** | 329 x 254 |

**SQL Select:**

```sql
Select

  FR_USUARIO_GRUPO.GRP_CODIGO,

  FR_USUARIO_GRUPO.SIS_CODIGO,

  FR_USUARIO_GRUPO.USR_CODIGO

From

  FR_USUARIO_GRUPO

/*WHERE_NEW*/

/*ORDER_NEW*/
```

---


*Documentação gerada automaticamente a partir de FormulariosNativosMakerAi.xml*

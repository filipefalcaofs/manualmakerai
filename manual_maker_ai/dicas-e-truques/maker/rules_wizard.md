# Plug-in - Assistente de Regras

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/maker/rules_wizard

# Plug-in - Assistente de Regras

### (Em breve!!!)

O **Assistente de Regras** é mais uma forma simplificada de desenvolver fluxogramas. Esse recurso permite criar, atualizar e gerenciar regras de negócio utilizando **linguagem natural**, descrevendo o que deseja e a inteligência artificial gera a regra automaticamente.

---

## O que você pode fazer?

| Funcionalidade | Descrição |
| --- | --- |
| **Criar regras** | Descreva sua necessidade em português e a IA gera o código automaticamente |
| **Atualizar regras** | Solicite modificações em regras existentes mantendo o contexto original |
| **Listar regras** | Visualize todas as regras criadas com informações detalhadas |
| **Excluir regras** | Remova regras que não são mais necessárias |
| **Histórico de versões** | Acompanhe todas as modificações feitas em cada regra |
| **Restaurar versões** | Volte para uma versão anterior de qualquer regra |
| **Executar regras** | Execute regras diretamente passando parâmetros |

---

## Criando sua primeira regra

### Passo a passo

1. Acesse o **Assistente de Regras** no seu sistema
2. Clique em **Nova Regra**
3. Descreva o que a regra deve fazer em linguagem natural
4. Aguarde a IA processar e gerar a regra
5. A regra é automaticamente salva e compilada

### Exemplo prático

**Sua descrição:**

```prism-code
Crie uma regra que valide CPF. A regra deve receber um CPF como parâmetro   
e retornar verdadeiro se for válido ou falso se for inválido.   
Considere a validação completa com dígitos verificadores.
```

**Resultado:** A IA irá gerar uma regra chamada `ValidarCPF` com toda a lógica de validação implementada automaticamente!

---

## Boas práticas ao descrever regras

Para obter os melhores resultados, siga estas dicas:

### Seja específico

```prism-code
Crie uma regra que calcule o desconto de 10% para clientes   
com mais de 5 compras no mês, recebendo o código do cliente   
como parâmetro e retornando o valor do desconto  
  
Faça um desconto
```

### Descreva os parâmetros

```prism-code
Receba como parâmetros: código do produto (inteiro),   
quantidade (inteiro) e data da venda (data)"  
  
Use os dados necessários
```

### Especifique o retorno

```prism-code
Retorne um valor decimal com o total calculado  
  
Retorne o resultado
```

### Mencione validações necessárias

```prism-code
Valide se o estoque é suficiente antes de aprovar a venda.   
Se não houver estoque, lance uma exceção com a mensagem   
'Estoque insuficiente'  
  
Verifique o estoque
```

---

## Atualizando regras existentes

O Assistente permite atualizar regras de forma **contextual** - ele conhece o código atual e modifica apenas o que você solicitar.

### Como funciona

1. Selecione a regra que deseja modificar
2. Descreva **apenas** a alteração desejada
3. A IA mantém todo o código existente e aplica sua modificação

### Exemplos de atualizações

| O que você quer | Como descrever |
| --- | --- |
| Adicionar validação | Adicione validação para não permitir valores negativos |
| Mudar cálculo | Altere o percentual de desconto de 10% para 15% |
| Adicionar parâmetro | Adicione um novo parâmetro chamado 'tipoCliente' do tipo texto |
| Mudar retorno | Altere o retorno para incluir também a data de processamento |
| Adicionar log | Adicione um log informando quando a regra for executada |

Dica

Quanto mais específica for sua instrução de modificação, melhor será o resultado. Evite descrições genéricas.

---

## Histórico de versões

Toda modificação em uma regra é automaticamente versionada. Isso permite:

- **Rastrear** todas as alterações feitas
- **Identificar** quem fez cada modificação
- **Ver** quando cada versão foi criada
- **Restaurar** versões anteriores se necessário

### Formato de versão

As versões seguem o padrão **semântico**: `MAJOR.MINOR.PATCH`

| Versão | Significado |
| --- | --- |
| `1.0.0` | Primeira versão (criação da regra) |
| `1.0.1` | Primeira correção/alteração |
| `1.0.2` | Segunda correção/alteração |
| `1.0.10` | Décima correção/alteração |

Informação

O sistema incrementa automaticamente o último número (PATCH) a cada modificação.

### Restaurando uma versão

1. Acesse o **histórico** da regra desejada
2. Localize a versão que deseja restaurar
3. Clique em **Restaurar**
4. A regra será atualizada com o código daquela versão

---

## Executando regras

Você pode executar regras diretamente passando os parâmetros necessários.  
Os parâmetros são passados na ordem definida na regra.

---

## Sistema de tentativa de correção automático

O Assistente possui um sistema inteligente que **corrige erros automaticamente**:

1. Se a regra gerada apresentar erro de compilação, o sistema tenta novamente
2. O erro é enviado para a IA junto com o contexto original
3. A IA corrige o problema e gera uma nova versão
4. São feitas até **3 tentativas** automáticas

Observação

Na maioria dos casos, a regra é gerada corretamente na primeira tentativa. O sistema de tentativa de correção automático é uma garantia adicional de qualidade.

---

## Excluindo regras

Ao excluir uma regra:

- O registro é removido do banco de dados
- Os arquivos físicos são deletados
- A exclusão é registrada no histórico para auditoria

Atenção

Antes de excluir uma regra, certifique-se de que ela não está sendo utilizada em nenhum fluxograma do sistema.

---

## Modelo de dados

O Assistente utiliza automaticamente o **modelo de dados** do seu sistema para gerar regras mais precisas. Isso significa que:

- A IA conhece suas tabelas e campos
- Ela entende os relacionamentos entre entidades
- As regras geradas são compatíveis com sua estrutura de dados

---

## Exemplos de uso

### Validações

```prism-code
Crie uma regra para validar email. Receba o email como texto   
e retorne verdadeiro se for um formato válido.
```

### Cálculos

```prism-code
Crie uma regra que calcule o IMC. Receba peso (decimal) e   
altura (decimal) em metros, retorne o IMC calculado como decimal.
```

### Consultas ao banco

```prism-code
Crie uma regra que retorne o total de vendas de um cliente.   
Receba o código do cliente como parâmetro e consulte a tabela   
VENDAS para somar o campo VALOR_TOTAL. Retorne o valor total como decimal.
```

### Integrações

```prism-code
Crie uma regra que envie um email de boas-vindas. Receba o email   
do destinatário, nome do cliente e código do pedido.   
Monte uma mensagem HTML personalizada e envie usando o servidor SMTP.
```

### Processamentos complexos

```prism-code
Crie uma regra para processar folha de pagamento. Receba o mês   
e ano como parâmetros. Para cada funcionário ativo, calcule:  
- Salário base  
- Horas extras (valor hora * 1.5)  
- Descontos de INSS e IR  
- Valor líquido  
Grave os resultados na tabela FOLHA_PAGAMENTO e retorne   
a quantidade de funcionários processados.
```

---

## Considerações importantes

### A IA pode acessar meus dados?

A IA recebe apenas a **estrutura** do seu banco de dados (nomes de tabelas e campos), nunca os dados reais.

### Posso editar a regra gerada manualmente?

Não, você pode usar o próprio assistente de regras para fazer alterações.

### O que acontece se a regra der erro?

O sistema tenta corrigir automaticamente até 3 vezes. Se ainda assim falhar, você receberá uma mensagem detalhada do erro para ajustar sua descrição.

### Posso usar a regra em fluxos?

Sim! Após criada e compilada, a regra fica disponível para uso em qualquer fluxo do sistema.

### Como saber quais parâmetros uma regra precisa?

Na listagem de regras, você pode visualizar os parâmetros definidos para cada regra, incluindo nome e tipo.

---

## Resumo

O Assistente de Regras com IA transforma a maneira como você cria lógicas de negócio:

- Utilizando linguagem natutal (descrever a regra em português).
- Correção automática de erros.
- Histórico completo de versões.
- Integração com o modelo de dados do sistema.

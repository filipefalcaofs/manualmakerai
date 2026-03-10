# Assistente de Regras: Mude a Regra, Não o Sistema

> Fonte: https://manual.softwell.com.br/docs/webrun/assistente_regras

# Assistente de Regras: Mude a Regra, Não o Sistema

## Conceito

O **Assistente de Regras** é um recurso inovador do Maker AI que desacopla a lógica de negócio da aplicação. Ele utiliza Inteligência Artificial para transformar instruções em linguagem natural (prompts) em regras executáveis e independentes.

Para a aplicação, a regra funciona como uma "caixa preta": ela recebe dados de entrada e devolve um resultado, sem que o fluxograma precise conhecer os detalhes da sua implementação.

Esta funcionalidade materializa a nossa filosofia central: **"Mude a regra, não o sistema"**.

## ⚠️ Observação

As regras criadas por este assistente são armazenadas na tabela `FR_PROCESSAMENTO`. **Importante:** projetos que utilizarem este recurso em desenvolvimento terão dependência desta tabela no ambiente de produção.

---

## 🎯 Objetivo

O principal objetivo do Assistente de Regras é centralizar e simplificar a gestão da lógica de negócio, garantindo que as regras possam ser alteradas com agilidade e segurança, sem a necessidade de modificar os fluxogramas da aplicação.

---

## Benefícios

| Benefício | Descrição |
| --- | --- |
| **Agilidade e Autonomia** | Altere regras de negócio em minutos usando linguagem natural. Permite que analistas de negócio e especialistas de domínio gerenciem a lógica sem depender de conhecimento técnico. |
| **Redução de Riscos e Custos** | Elimina a necessidade de alterar, testar e reimplantar os fluxogramas da aplicação para cada mudança de regra, diminuindo os custos de manutenção e o risco de introduzir bugs. |
| **Centralização e Clareza** | As regras de negócio ficam centralizadas em um local único, documentadas em linguagem natural, o que facilita o entendimento, a auditoria e a governança. |
| **Integração Simplificada** | A integração com fluxogramas é feita por meio de uma única função (`Executar Processamento`), mantendo a lógica da aplicação limpa e focada na orquestração dos processos. |

---

## 💼 Caso de Uso: Cálculo de Salário Líquido

### Contexto

Uma empresa precisa de um sistema que calcule o salário líquido de funcionários, considerando benefícios, descontos por faltas e bônus por horas extras.

### Desafio

A lógica de cálculo muda com frequência devido a novas leis trabalhistas ou políticas internas. Implementar isso diretamente no fluxograma tornaria a manutenção lenta, cara e arriscada.

### Solução com o Assistente de Regras

#### **Passo 1: Criação da Regra**

**Nome da Regra:** `Cálculo de Salário Líquido`

**Instrução (Prompt):**

```prism-code
Calcule o salário líquido seguindo estas etapas:  
1. Some o salário base com os benefícios para obter o salário bruto.  
2. Se o número de faltas injustificadas for maior que 3, aplique um desconto de 10% sobre o salário bruto. Caso contrário, o desconto é zero.  
3. Calcule o bônus de horas extras multiplicando as horas trabalhadas pelo valor da taxa horária e por um fator de 1.5.  
4. O salário líquido final é o resultado de: salário bruto - desconto por faltas + bônus de horas extras.
```

**Parâmetro de Entrada (JSON):**

```prism-code
{  
  "salario_base": 3000,  
  "beneficios": 500,  
  "faltas_injustificadas": 5,  
  "horas_extras": 10,  
  "taxa_horaria": 20  
}
```

**Retorno Esperado (JSON):**

```prism-code
{  
  "salario_bruto": 3500,  
  "desconto_faltas": 350,  
  "bonus_horas_extras": 300,  
  "salario_liquido": 3450,  
  "regras_aplicadas": ["desconto_faltas_10_porcento"]  
}
```

#### **Passo 2: Teste e Validação**

A plataforma permite testar a regra com diferentes cenários diretamente na interface, garantindo que a lógica funcione como esperado antes da integração.

- **Cenário 1 (Com Desconto):** Entrada com `5 faltas` → `desconto_faltas` de `350` é calculado.
- **Cenário 2 (Sem Desconto):** Entrada com `2 faltas` → `desconto_faltas` é `0`.

#### **Passo 3: Integração no Fluxograma**

1. No fluxograma, utilize a função **`Executar Processamento`**.
2. Selecione a regra **`Cálculo de Salário Líquido`**.
3. Forneça o JSON de entrada (vindo de um formulário ou banco de dados).
4. O retorno da função será o JSON com os resultados, pronto para ser usado.

### Impacto da Solução

O impacto prático é a simplificação radical da manutenção:

| Antes (Lógica no Fluxograma) | Depois (Com Assistente de Regras) |
| --- | --- |
| Mudanças exigem alteração no fluxograma. | Mudanças são feitas apenas no texto da instrução. |
| Processo lento e dependente de desenvolvedores. | Alteração instantânea e pode ser feita por analistas. |
| Alto risco de introduzir erros na aplicação. | O sistema principal permanece intocado, sem riscos. |

---

## 🔄 Fluxo de Trabalho

```prism-code
1️⃣ CRIAÇÃO  
    ↓  
    • Acesse o menu do usuário → "Assistente de Regras"  
    • Preencha: Nome, Instrução, Parâmetros de Entrada e Retorno  
    • Clique em "Gerar regra"  
  
2️⃣ TESTES  
    ↓  
    • Na aba "Testar regra", insira diferentes JSONs de entrada  
    • Valide se os resultados e as regras aplicadas estão corretos  
  
3️⃣ INTEGRAÇÃO  
    ↓  
    • No fluxograma, adicione a função `Executar Processamento`  
    • Selecione a regra criada e forneça o parâmetro de entrada  
    • Utilize o parâmetro de retorno no restante do processo.
```

---

## 🎯 Casos de Uso Adicionais

- **Análise de Crédito:** Validar a elegibilidade de um cliente com base em múltiplos critérios.
- **Cálculo de Frete:** Aplicar regras de precificação dinâmica com base em peso, distância e tipo de produto.
- **Validação de Comissões:** Calcular comissões de vendas com faixas de bônus e condições variáveis.
- **Tributação:** Aplicar alíquotas de impostos que variam conforme a região e o tipo de operação.

---

## 💡 Melhores Práticas

1. **Seja Específico:** Descreva cada passo da lógica de forma clara e sem ambiguidades.
2. **Estruture os Dados:** Forneça exemplos completos e bem definidos nos JSONs de entrada e saída.
3. **Teste Exaustivamente:** Valide a regra com múltiplos cenários, incluindo casos de exceção.
4. **Use Nomes Descritivos:** Facilita a identificação e a manutenção futura das regras.
5. **Documente as Mudanças:** Mantenha um histórico das alterações nas instruções para auditoria.

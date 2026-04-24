# Holerite - Folha CLT

**Regra:** Calcular Folha CLT (Servidor)
**Arquivo FRZ:** CalcularFolhaCLT.frz

---

## Parametros de Entrada

| Parametro | Tipo | Descricao |
|---|---|---|
| pSalarioBruto | Numero | Salario bruto mensal |
| pDependentes | Inteiro | Quantidade de dependentes IR |

## Retorno

Texto Markdown com holerite completo (tipo Letras).

---

## Logica de Calculo

### INSS 2024 (Progressivo)

| Faixa | Aliquota |
|---|---|
| Ate R$ 1.412,00 | 7,5% |
| R$ 1.412,01 a R$ 2.666,68 | 9% |
| R$ 2.666,69 a R$ 4.000,03 | 12% |
| R$ 4.000,04 a R$ 7.786,02 | 14% |
| Acima | Teto R$ 908,85 |

### IRRF 2024

Base IRRF = Bruto - INSS - (Dependentes x R$ 189,59)

| Faixa Base IRRF | Aliquota | Deducao |
|---|---|---|
| Ate R$ 2.259,20 | Isento | - |
| R$ 2.259,21 a R$ 2.826,65 | 7,5% | R$ 169,44 |
| R$ 2.826,66 a R$ 3.751,05 | 15% | R$ 381,44 |
| R$ 3.751,06 a R$ 4.664,68 | 22,5% | R$ 662,77 |
| Acima | 27,5% | R$ 896,00 |

### FGTS

8% sobre o salario bruto (nao desconta do salario).

---

## Estrutura do Fluxo

```
FlowStart (pSalarioBruto, pDependentes)
    |
calcularFolha  -> ebfSQLExecuteQuery (SQL com CTEs)
    |
obterHolerite  -> ebfSQLField (markdown_holerite)
    |
obterLiquido   -> ebfSQLField (liquido)
    |
fecharConsulta -> ebfSQLClose
    |
salarioPositivo? -> isGreater(valorLiquido, 0)
   |SIM              |NAO
adicionarRodape    adicionarAlerta
   |                  |
   +---> Conector <---+
            |
         FlowEnd (markdownResult)
```

---

## Exemplo de Saida (R$ 5.000,00 / 1 dep.)

| Descricao | Valor |
|---|---|
| INSS | R$ 518,82 |
| Base IRRF | R$ 4.291,59 |
| IRRF | R$ 303,83 |
| FGTS | R$ 400,00 |
| **Liquido** | **R$ 4.177,35** |

---

## Abordagem Tecnica

Todo calculo e feito via SQL com CTEs (Common Table Expressions):
- `base`: recebe parametros
- `c1`: calcula INSS progressivo e FGTS
- `c2`: calcula base IRRF (bruto - inss - deducao dependentes)
- `c3`: calcula IRRF progressivo
- SELECT final: monta o Markdown completo usando `||`, `chr(10)`, `TO_CHAR`

O fluxo Maker apenas executa a query, extrai os campos e retorna.

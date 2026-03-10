# Mudança de comportamento no componente gráfico

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/mudanca_de_comportamento_no_componente_grafico

# Mudança de comportamento no componente gráfico

A partir da versão 3 do Webrun, a alimentação do componente gráfico via fluxo foi modificada, várias mudanças foram realizadas para que a alimentação dos mesmos via Fluxo de Ação dê suporte aos tipos de gráficos disponíveis atualmente no componente.

Considerações gerais:

1. Os gráficos devem ser montados como uma Lista contendo outra(s) Lista(s) com o(s) dado(s).
2. O Mapa pode ser usado apenas para os gráficos que possuam até 2 campos de referência. Preferencialmente utilize Lista dentro de Lista (Caso 1).
3. Os campos definidos abaixo devem estar, necessariamente, na ordem mostrada na Lista de valores e obedecer ao tipo de dado esperado (Letras, Fracionado, Inteiro, Etc.).
4. Caso não deseje definir um valor para um campo (campos opcionais), marque-o como Nulo.

Tipo de Gráfico:  Pizza

- Campo 1: Etiqueta (Letras)
- Campo 2: Valor (Fracionado) (obrigatório)

![image1308.jpg](/assets/images/image1308-b2c981275cae827bc1dddc1ed61560e2.jpg)

Tipo de Gráfico:  Gantt

- Campo 1: Etiqueta (Letras) (obrigatório)
- Campo 2: Tarefa (Inteiro) (obrigatório)
- Campo 3: Data Início (Data) (obrigatório)
- Campo 4: Data Fim (Data) (obrigatório)
- Campo 5: Próxima Tarefa (Inteiro) (Opcional)

![image1309.jpg](/assets/images/image1309-53b41d63599e745adccf9ee721878508.jpg)

Demais tipos de gráficos

- Campo 1: Etiqueta (Letras) (Opcional)
- Campo 2: Valor X (Data|Fracionado)  (obrigatório)
- Campo 3: Valor Y (Data|Fracionado)  (obrigatório)

Observações:

1. Caso X seja do tipo Fracionado, Y deve ser também do tipo Fracionado.
2. Caso não exista X, pode existir apenas Y.

![image1310.jpg](/assets/images/image1310-f45e64d9b3cf3eb2faac6581e872aa38.jpg)

Tipo de Gráfico: Bolha (Implementação futura)

- Campo 1: Etiqueta (Letras) (Opcional)
- Campo 2: Valor X (Fracionado) (obrigatório)
- Campo 3: Valor Y (Fracionado) (obrigatório)
- Campo 4: Raio (Fracionado) (obrigatório)

Atenção: Após atualização para versão 3 do Webrun, os gráficos utilizados nas versões anteriores a esta deverão ser revisados, pois podem haver possíveis impactos devido a esta modificação.

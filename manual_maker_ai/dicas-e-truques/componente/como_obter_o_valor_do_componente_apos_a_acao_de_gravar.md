# Como obter o valor do componente após a ação de gravar

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/como_obter_o_valor_do_componente_apos_a_acao_de_gravar

# Como obter o valor do componente após a ação de gravar

Supondo que, no formulário, exista um fluxo que capture o valor de um componente, após utilizar o botão ![image882.jpg](data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAAAnCAIAAAAev/j5AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHxSURBVGhD7ZWxSgNBEIZTi8/jC9ha29mn0M7a0kr0ASIIIggStLMwTSqxEBELEZtAVIwkkWi0sIoDPxnH2fHuPO5yt9zCx7I7M7s3X3Yhtc/RoLIE+dyoTW6AipeEID9lceNoaatNPB/OZYJP8qRN/vVG++tiPhN8kifz8XhMo3JIjWfyePnd10kmeCa/ftxZ3rtVDglh1YTITxeCLf/SPU2BcotFfroQws1Pqbr82sFl6mfvUh5PE1teXWlqvJF/G/QgX9G/uoXVnRk8+9r+OZDBQjCefa43L50L9zduPj951xYRHrkAc7nERM7NGhmR2EG5YHn1elNDR9GBdCzONzsg/uqYQFxm3UqucVOMmcr35iPk0Ssibmec5RQmvMScUSmJLFM1tnyGRN88IronseS5qnRrZMTFzM5UnnCbVkG1TD6XERczGy9PfwHJqTfagLcreYL6ADLCc47ElqkalU1CjDz5PL5//Av+FXCCK18espfnjfD3SV6+WDi4Vhwx4TIcRaPH8vfDEXAjJlwW5IO8v/JX/T5wIyZcFuS9kpd/dSQgVbGUERPeSNoY/ZDfbbZWNk/InzoGsaouvBGT7eaZH/K9hw56lbSu7/6F2g7oZPmhkvAjT/1FM+w9xY4R8IfKw6+brxpBvqpUWH40+AbPIxXp1bC36AAAAABJRU5ErkJggg==), o conteúdo não é obtido.

Quando você utiliza ![image882.jpg](data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAAAnCAIAAAAev/j5AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHxSURBVGhD7ZWxSgNBEIZTi8/jC9ha29mn0M7a0kr0ASIIIggStLMwTSqxEBELEZtAVIwkkWi0sIoDPxnH2fHuPO5yt9zCx7I7M7s3X3Yhtc/RoLIE+dyoTW6AipeEID9lceNoaatNPB/OZYJP8qRN/vVG++tiPhN8kifz8XhMo3JIjWfyePnd10kmeCa/ftxZ3rtVDglh1YTITxeCLf/SPU2BcotFfroQws1Pqbr82sFl6mfvUh5PE1teXWlqvJF/G/QgX9G/uoXVnRk8+9r+OZDBQjCefa43L50L9zduPj951xYRHrkAc7nERM7NGhmR2EG5YHn1elNDR9GBdCzONzsg/uqYQFxm3UqucVOMmcr35iPk0Ssibmec5RQmvMScUSmJLFM1tnyGRN88IronseS5qnRrZMTFzM5UnnCbVkG1TD6XERczGy9PfwHJqTfagLcreYL6ADLCc47ElqkalU1CjDz5PL5//Av+FXCCK18espfnjfD3SV6+WDi4Vhwx4TIcRaPH8vfDEXAjJlwW5IO8v/JX/T5wIyZcFuS9kpd/dSQgVbGUERPeSNoY/ZDfbbZWNk/InzoGsaouvBGT7eaZH/K9hw56lbSu7/6F2g7oZPmhkvAjT/1FM+w9xY4R8IfKw6+brxpBvqpUWH40+AbPIxXp1bC36AAAAABJRU5ErkJggg==), o formulário entra em modo de inclusão. Isso quer dizer que os campos estarão nulos ou com seus valores padrão. Por isso, não conseguirá obter valores que foram definidos na sua última inserção.

Caso necessite de algum valor definido em componentes, utilize a **variável de sessão** e regra do tipo **servidor**.

Nos links abaixo, seguem exemplos com a **Variável de Sessão:**

- [Utilizando Variável de Sessão](/docs/dicas-e-truques/funcoes/utilizando_variavel_de_sessao);
- [Filtrando um relatório por variável de sessão](/docs/dicas-e-truques/relatório/filtrando_um_relatorio_por_variavel_de_sessao);
- [Filtrando um campo do tipo data por uma variável de sessão](/docs/dicas-e-truques/maker/Filtrando_um_campo_do_tipo_data_por_uma_variavel_de_sessao).

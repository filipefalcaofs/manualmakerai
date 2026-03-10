# Definições do Formulário

> Fonte: https://manual.softwell.com.br/docs/maker/propriedade_do_formulario?id=aba-valor-padr%C3%A3o-e-m%C3%A1scaras.md

# Definições do Formulário

Nesta seção, são definidas as características do formulário, envolvendo:

- As construções SQL’s (consultas dos dados para o formulário) que serão empregadas no banco vinculado ao sistema. Recomenda-se apenas a escolha daqueles campos que serão utilizados no formulário, pois a quantidade de campos selecionada influencia no tempo de processamento de construção do formulário no Webrun;
- Configurações aplicadas ao formulário;
- Campos-chave e de atualização;
- Valores padrão e aplicação de máscaras.

![image1039.jpg](/assets/images/image128-55d7bb2b387bfcc5ad08d076ffb1529b.png)

Com um formulário aberto, clique em![definições](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAAAXCAIAAAByNn1sAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEDSURBVFhH7ZhhDsMgCIXd0tt4EY+84432MWLqdGLQrgnfDwsUCbzYpukjxhicPp58dTpwsRS4WApcLAUulgIXS4GxWK8MDtVBTi2zUWGv3tw7CePvLOo+pVTaJe27DbARMo1VGGbiYygj2QKBaIWxknXvLBIOsH9EyhWGRGAAuAT7HRF2jFgkFvWNs0DIDGTDAJKTD1luVEXgWnHlyTpBs7FVoZHApT/FRaafNVWsE4v6FjhkB9c9kIhoZ8VEsahXaT1neIaejcjBaq7Xxlc7pL9cqbzvrwrWKDeqInCtuMf/LJrcduwx1r2zhpFTczn+p1TBDU7W/+BiKXCxFLhY3YTwBpOUxdkX2hY6AAAAAElFTkSuQmCC), botão na paleta Objetos.

Essa tela é composta pelos seguintes componentes:

- **Campo Nome do Formulário** - Determine o nome do formulário neste campo;
- **Campo Identificador** - Este é o código que identifica o formulário no banco de dados. Este código é utilizado em algumas rotinas de fluxos onde o Webrun o interpreta. Saiba mais sobre GUID....

## Botões da Barra de Ferramentas do Formulário

Ícones que formarão parte da Barra de Ferramentas do Formulário:

| Tecla de Atalho | Botão no Maker | Botão no Webrun | Descrição |
| --- | --- | --- | --- |
| (Ctrl + I) |  |  | Incluir Registros |
| (Ctrl + E) |  |  | Editar Registros |
| (Ctrl + Del) |  |  | Excluir Registros |
| (Ctrl + S) |  |  | Gravar Registros |
| (Ctrl + G) |  |  | Gravar Registros + |
| (ESC) |  |  | Cancelar Registros |
| (Ctrl + Home) |  |  | Primeiro Registro |
| (Page Up) |  |  | Registro Anterior |
| (Page Down) |  |  | Próximo Registro |
| (Ctrl + End) |  |  | Último Registro |
| (Alt + A) |  |  | Atualizar |
| (Ctrl + P) |  |  | Imprimir |
| (Não Possui) |  |  | Log |
| (Ctrl + Shift + C) |  |  | Valores Padrão |
| (F12) |  |  | Ajuda |
| (Alt + F4) |  |  | Sair |

Observação: Caso algum botão pertencente a barra de navegação do formulário seja desabilitado através da tela de Definições do Formulário, a funcionlidade é removida do formulário. Exemplo: Caso o botão de Incluir esteja desabilitado, não será possível entrar em modo de Inserção no formulário, mesmo através de funções que o façam.

## Aba Dados do Formulário

Nesta aba, encontram-se os seguintes elementos:

- **Botão ![assistente de consulta](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAAAZCAYAAADe+aeoAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAF/SURBVGhD7ZXBagQxDEP7x/P/py05PBDCSZZ1ZrpQCR62ZM+SgqE/13W9QviUHFBokQMKLXJAoUUOKLTIAYUWOaDQ4pYDGqryd+h8eyff+i74q/d93QGt6Pxu59tB9/u74X3Upzh+QPwB1JN0frPz7aD7/d3wPupTPHpAaJV5P7TzQ5qtdt0PkTmuKtd9RbXL6RF5lWmvXuuQzhHZSY4ekD9SfdVTq4y6y9yjKvds5qsMT/V8leGpVT5U5ausyqkVq9mnPHZAla8y9dpXM5fvqKfSu5jpTuUr6Z7u7nI81fPdTL1Xnat0doLjB+SqdlaZ9quZ9orneKr3M3wHT10x2/EcT/W88tqr9+p95U9w7IBmjyOnvptRd5l76irXvvJVhqd6vsrw1E9yeir90GpOX/kTPHZA9EM+H1I/m83mQ9XcvfeIzHFVue4rql2uvXvk8yF6rVWvIj/F0X9h4f+RAwotckChRQ4otMgBhRY5oNAiBxRa5IBCixxQaHC9fgFQxPmgLhRoLQAAAABJRU5ErkJggg==)** - Acessa a tela do [Assistente SQL](/docs/maker/iniciando_com_o_assistente_sql);
- **Botão ![associar ações à tabela](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAAAZCAYAAADe+aeoAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAF4SURBVGhD7ZXRagQxDAP7x/v/T3cEKhDCzq7j5EpbCQbHY3O9FkO/rut6GbOKD8i08AGZFj4g08IHZFr4gEwLH5Bpse2ARiJ/gk//rBG8dV7lJz6jul/hVx7Qp8DvhOh8ldlnzWbgyQ5T3a+w5YDwBVHNOk/+hk92mOp+heMHhDx1I3de34g69AznpGfHcGZz7UciNwI/25/NO7QPSL8I99EbNXMrHsCj3oE91J2e3xnRTuQAZqirHmS+wtEDivrIZT2qwl6jc0UDp3uRRx9FdzI00Vx7TrYT7Y7ovgZ+lS0HpIl2Zo7f3KMq8Kh3HqhHj6qoR4+akc3Va6+O39yj3nkAj6q+Q+uAsi8Aj1pxFY+azRX16FF3en5nTnt1/OYetepRdd7h6AHhPaLzkciN3Hl9c3SuaCKf7Vc8O0aT7fCbk7lon100H4Ffpf0v7C+x4w/63/ABfYNEM5PjAzItfECmhQ/ItPABmRY+INPCB2Ra+IBMg+v1BnWKHs/OurUHAAAAAElFTkSuQmCC)** - Recurso disponível para projetos sobre todos os bancos de dados homologados para o Maker, com exceção do \_\_MYSQL. Acessa a tela [Associação de Ações](/docs/maker/associacao_acoes);
- **Campo Tabela Principal** - Campo em que é selecionada a entidade que será foco das transações (inclusão, alteração, exclusão e seleção) feitas no formulário. As entidades listadas neste campo são originárias da configuração feita na tela Assistente SQL (botão Assistente de Consulta);
- **Consulta do Formulário** - Área que apresenta o SQL do formulário. Não é editável;
- **Campo Relatório** - Permite associar um relatório ao formulário, criando um botão de impressora no mesmo,no qual servirá para fazer a chamada do relatório.
- **Botão ![image103.gif](data:image/gif;base64,R0lGODdhFQATAPcAAABjAABzAACEAACMAACUAAiMAAiUABCcCCFzISGcISGlCCmtEDGlEDGlITGtGDmlGDmtGDm1EDm1GEKtGEK9GEq1IUq9GEq9IVK1SlLGIVLGKVrGMVrOKVrOMVrWMWO9WmPGQmPOMWPWMWPeOWvWOWveOWveQmvnOXPeQnPnQnuUtXvOWnvvQnvvSnv3SoT3SoT3UoylvZSlvaW1xqXWpa3OrcbO3t7e7+fn7+fv9+/v3u/v9+/3/////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAFQATAAAI5wB7CBxIsKBBgjNixFBxY+CNhAsPEiCAQ4cOFQplyNiRwwYAAAYJwJhYEccMHDs8ArAAsqBIGCYmyvz4wALLkDByjkwBA8VKmxRaEnwJwwUBnj6BShA68GULFkd7AljBgwcIpgJFtkiR4ugLEgB4RIDAA2sPAltPlCBggkWIsAsclA2ZQq0IAiNSbAirQMJcl3Y5EPAwQkPYqgrMEighgoMGAh1EXACA4UODAooba7hAQAOHCgAOGBgwwGwCAhkuWCBwIcMEAKMFAEBwkMZpBgQoXHgdYHaNgwNtE/j4EcFv4MiTK0ceEAA7)** - Este botão aciona a tela [Dicionário de Dados](/docs/maker/dicionario_de_dados).

Na área do Select do formulário, executando um clique com o botão direito do mouse, ativa-se um menu pop-up, com as seguintes opções:

- **Copiar** - Copia o Select do formulário para a Área de Transferência;
- **Testar** - Verifica a integridade do Select do formulário;
- **Apagar** - Apaga o Select do formulário.

## Aba Chaves e Atualização

Esta aba é composta por duas colunas:

- **Campos-Chave** - Coluna para definir os campos que são chave primária da fonte de dados do formulário. Selecione manualmente ou utilize o botão ![selecionar campos chaves](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARsAAAAWCAIAAAB/pq8cAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGySURBVHhe7dtBTgMxDAXQAXFqNuw4A8dgzTE4Bpcov2OPZcVJJlMyqE3+W7SJ47itJlZLVZ6+vn8ul+Xz420hoj971nsi6oEdRdQTO4qoJ3YUUU/sKKKe2FFEPU3XUa8bnefUV732zMcy6uv6B3N1FA7K+6bLoUEdHRGt5v3Ux2agM8z1mwl5j9KJY+9XsmppSRwaMyUuwcpeG5skB7K7ZOorWBxKe8Fv8ZJMTDFIkrM5ErFxkgNJkeFN9yuk7CVPxv42xmMkG8dYgn5VxF3CR3Z3JQOfvxvxS5DNxDibDJYTd5Uifmls033qw3UVuMYaWq+30PlGoyEOqKCjgpigtXLVItuue9p21dmrrjx5W9p9/lYNt5a8rl/J1HJitVHx2/MrXG+joZWGVhq6FQ6WFjpS6rZdFahjx/2QxmeiGSuL3PaID2q67/p0VFBKiPGzT8kZ9aVm/YgfelwpZc3jSZ2WRxzMi97PwV9aOwfZIMR4e2bkc0pinZZdprI3icjUxMzI55TEOhYplR0P/z9qEDi485zae8a/o4h6YkcNgm9Qd4IdRdQTO4qoJ3YUUT/L8gs+LKjaQ2Pq5AAAAABJRU5ErkJggg==)para que o Maker faça por você;

Observação: É recomendado informar um campo como chave para melhor funcionamento de inserção, alteração e deleção de dados no Webrun. Caso o desenvolvedor não informe o campo chave, o Webrun irá considerar todos os campo como chave.

- **Campos obrigatórios** - Obriga o cadastramento do campo no formulário. Existindo uma regra de banco de dados para a entrada de dados, o Maker tratará, reduzindo assim o tráfego com o banco.

## Aba Valor Padrão e Máscaras

Esta aba é composta por três colunas:

- **Campos** - Lista os campo da fonte de dados do formulário;
- **Valor Padrão** - Área utilizada para a definição do valor que será atribuído ao campo (por conseguinte, ao componente associado ao campo) no momento em que o usuário efetuar um clique sobre o botão Novo da barra de navegação do formulário no Webrun. Pode ser definido um valor fixo (quando esse valor for um valor numérico que seja constituído de casas decimais, que devem ser separadas por ponto, por exemplo 0.00) ou, considerada a linha (tupla) sobre a qual o usuário efetuar um clique com o botão direito do mouse para a definição do valor predefinido, escolher as opções:
- - **SQL** - Ao selecionar esta opção, será aberta a tela [Assistente SQL](/docs/maker/iniciando_com_o_assistente_sql), a partir da qual poderá ser construído um comando de seleção que terá como resultado apenas um registro (por conseguinte, apenas um campo);
  - **Funções** -  Ao selecionar esta opção, são listadas inúmeras [funções predefinidas](/docs/maker/usando_funcoes_predefinidas_em_consultas). É necessário apenas a escolha de uma delas;
  - **Sem valor padrão** - Ao selecionar esta opção, o valor padrão que havia sido atribuído ao campo na coluna Valor Padrão será apagado;
  - **Sem máscara** - Ao selecionar esta opção, a máscara que havia sido atribuída ao campo na coluna Máscaras será apagado;

Há ainda a possibilidade de ser definida uma expressão que será interpretada pelo Webrun como um gerador de valores autoincrementais (identificadores numéricos únicos em tabelas, geradores - generators - ou sequências numéricas - sequences), a qual será composta pelo caracter "@" (arroba) concatenado com o nome do objeto autoincremental do banco de dados (exemplo: @nomedasequencia), exceto nos projetos criados no banco de dados Microsoft SQL Server. Quando o projeto tiver sido criado no banco de dados:

- **Microsoft SQL Server** - Poderá ser utilizado o comando SQL("SELECT IDENT\_CURRENT('NOME\_DA\_TABELA') + 1"), o qual retorna o valor do campo da tabela que foi configurado como identidade (identity) para ela acrescido de uma unidade;
- **Postgresql / Oracle / MySQL** - Poderão ser utilizados objetos sequences (sequências);
- **Firebird** - Poderão ser utilizados objetos generators (geradores).
- [Máscara](/docs/maker/mascaras) - a máscara é uma expressão que definirá a aparência dos dados apresentados nos campos do formulário e é composta por dois campos, separados por ponto e vírgula. A primeira parte é a máscara propriamente dita e, na segunda parte, utiliza-se 0 ou 1 para determinar se os caracteres fixos devem ser ou não salvos com a máscara. Saiba como definir máscaras para os dados dos campos, pelo tópico Máscaras.

 Aba Extras

Aba utilizada para a definição de mensagens personalizadas de violação de chave primária ou chave estrangeira da tabela que está associada ao formulário, as quais se sobreporão às mensagens emitidas pelo banco de dados. São campos desta aba:

- **Mensagem para erro de chave primária** - Campo no qual deve ser informada a mensagem personalizada para a ocorrência de uma violação de acesso do tipo chave primária;
- **Mensagem para erro de chave estrangeira** - Campo no qual deve ser informada a mensagem personalizada para a ocorrência de uma violação de acesso do tipo chave estrangeira.

Observação: Caso a mensagem retornada ainda seja a original do banco de dados, será necessário efetuar algumas alterações no arquivo *databases.xml*:

1. Abra o arquivo *databases.xml* que se se encontra em *C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\config*.
2. No grupo do banco que queira configurar, adicione nos seguintes parâmetros ExceptionPrimaryKey (para chave primária) e ExceptionForeignKey (para chave estrangeira) um valor com uma parte da mensagem do banco que será retornada, por exemplo:

```prism-code
<item>  
    <item-name>ExceptionPrimaryKey</item-name>    
    <item-param>Violation of PRIMARY</item-param>    
    <item-param>duplicate key</item-param>    
    <item-param>UNIQUE KEY</item-param>    
    <item-param>PARTE DA MENSAGEM RETORNADA</item-param>  
</item>
```

3. Após feita as configurações, reinicie o Tomcat.

# Definindo critérios

> Fonte: https://manual.softwell.com.br/docs/maker/definindo_criterios

# Definindo critérios

Os critérios de pesquisa para a consulta são definidos na coluna Critério. Normalmente são usados sinais e expressões `(igual (\=)`, maior `(\>)`, menor `(<)`, maior ou igual `(\>=)`, menor ou igual `(<=)`, diferente `(<>)`, não é igual `(!=)`, não é maior `(!>)`, e não é menor `(!<)`, like (como), not like (não é como), between (entre), not between (não está entre), in (na lista), not in (não está na lista), is null (nulo) e not is null (não é nulo), acompanhados de números, texto ou subseleções (sub-select). Sobre a criação de subseleções, consulte o item [Adicionando uma subconsulta](/docs/maker/adicionando_uma_subconsulta), do tópico Assistente SQL.

Você pode especificar múltiplos critérios para uma expressão simplesmente usando as colunas Ou...(Or). Estes critérios serão concatenados usando o operador Ou...(Or).

A expressão In (na lista) não funciona quando o retorno é de um fluxo, mas, nas demais expressões, funciona normalmente.

Observações:

1. Ao pressionar a tecla [Tab] na última coluna "Ou", uma nova coluna "Ou" será criada. (Deve-se existir um critério antes de chamar a tabulação).
2. Para construção de filtros com Or, deve-se utilizar a coluna Ou.

![image1220.jpg](/assets/images/image296-1944e4ff0a33190184661a101e37c19c.png)

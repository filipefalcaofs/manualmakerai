# O que fazer quando apresenta campo NÃO DEFINIDO

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relat%C3%B3rio/o_que_fazer_quando_apresenta_campo_nao_definido

# O que fazer quando apresenta campo NÃO DEFINIDO

Situação atípica após a execução das seguintes atividades:

1. O usuário conclui a criação da fonte de dados (aba Dados).
2. Ativa a aba Desenho.
3. Clica sobre algum componente da barra de componentes e o cola na área de desenho.
4. Tenta vincular ao componente o campo que foi definido na fonte de dados), selecionando a fonte de dados e o campo dessa fonte de dados. Caso este último não esteja disponível para seleção, então o usuário deve voltar à aba Dados e forçar a conversão do campo para um tipo conhecido, pois o gerador de relatórios interpretou o campo como um campo de tipo não definido.

![image634.jpg](/assets/images/image634-e903ee6e04bfae11c872a8be376c0461.jpg)

Uma forma de resolução desta situação é a utilização de Expressões na aba Cálculos (contida na fonte de dados da aba Dados). Para tanto, o usuário deve seguir os seguintes passos:

1. Efetuar dois cliques sobre um campo qualquer que esteja disponível (coluna Apelido do Campo) contido na área superior da aba Campos Disponíveis.
2. Assim que o campo aparecer na área inferior da aba Cálculos, clicar sobre o nome dele - (coluna Apelido do Campo) para selecioná-lo.
3. Após selecioná-lo, clicar sobre a caixa de seleção da coluna titulada Função e escolher a opção Expressão.
4. Voltar a clicar na área reservada para o nome do campo (coluna Apelido do Campo) e definir um novo nome para o campo.
5. Clicar na caixa de texto da coluna Expressão e criar a estrutura de conversão, por exemplo:

cast(sum(tabela.campo) as integer)

Nesse exemplo, a função de banco de dados cast foi utilizada para forçar a conversão de um tipo para outro, no caso, para inteiro.

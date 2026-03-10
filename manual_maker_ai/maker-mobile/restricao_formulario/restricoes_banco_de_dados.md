# Restrições do banco de dados

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/restricao_formulario/restricoes_banco_de_dados

# Restrições do banco de dados

- Ao se comparar campos no Maker Mobile é essencial que **ambos os dados** sejam do mesmo tipo.
- O campo de tipo numérico não existe no **SQLite**, pelo fato do **Maker Mobile** utilizar este banco, este tipo de dado será tratado como Real. Para exibição deste tipo de dado, é necessária a utilização de máscaras existentes para valor fracionado ou monetário.
- O tamanho de um campo varchar sempre é definido como *varchar(x)*, ou seja, o valor que for introduzido será alocado para o campo. A limitação do tamanho máximo deve ser definido no componente, pela propriedade Tamanho Máximo.
- Devido a funcionalidade do sincronizador, não é possível criar chaves estrangeiras no banco. A criação das mesmas implica no não funcionamento do sincronizador.

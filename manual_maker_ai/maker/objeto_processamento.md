# Objeto Processamento

> Fonte: https://manual.softwell.com.br/docs/maker/objeto_processamento

# Objeto Processamento

![image109.jpg](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAASCAIAAAAluTLKAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAFJJREFUOE9jtLW1ZaAqYILS1AMobuzs7ISySAHl5eVQFhiwQGkYQJMmCDAdgW4iEBDvUqzWUz8cR02kDhiZJmJJ4aRmGzRA/Xw9FEozapvIwAAAMYMQaEn0cNkAAAAASUVORK5CYII=)

O objeto Processamento representa a execução de uma rotina preestabelecida (utilizando funções, variáveis ou valores constantes) em um fluxo de ações. Pode ser utilizado para executar uma expressão, por exemplo: obter um resultado de um cálculo. Execute um clique com o botão da direita do mouse e observe as opções:

- Editar - ative o [Montador de Expressões](/docs/maker/montador_de_expressoes) e deste utilize a tela [Propriedades](/docs/maker/tela_propriedades_do_montador_de_expressoes) para montar uma expressão (rotina) para o fluxo;
- Alterar Descrição - permite mudar o rótulo do objeto. Utilizado para documentar a rotina que o objeto executa;
- Remover - exclui o objeto da tela de trabalho do Editor de Fluxos de Ações.

Observações:

1. Caso a função incluída em um processamento seja dependente de outra que esteja em um processamento anterior, as mesmas deverão estar ligadas através do componente [Ligação](/docs/maker/objeto_ligacao).
2. É possível usar o Processamento para a chamada de fluxos. Estes fluxos podem ser de categorias diferentes, mas isso será possível quando iniciar por Cliente e o subfluxo for Servidor.

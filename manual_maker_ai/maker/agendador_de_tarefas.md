# Agendador de Tarefas

> Fonte: https://manual.softwell.com.br/docs/maker/agendador_de_tarefas

# Agendador de Tarefas

O Maker permite que fluxos sejam agendados e executados em períodos definidos pelo usuário. Acesse esse recurso por meio do menu Utilitários e deste clique na opção Agendador de Tarefas. A fim de que o Webrun esteja habilitado para executar os agendamentos feitos no Maker, é necessário criar um novo parâmetro chamado AgendadorTarefas (para maiores detalhes sobre o parâmetro, efetue um clique [aqui](/docs/webrun/tela_de_configuracoes/Parametros_de_configuracao/parametro_de_configuracao_sessao)) Cabe ainda lembrar que toda vez que um agendamento for cadastrado ou o serviço do Webrun for iniciado/reiniciado, é necessário, no Webrun, acessar o sistema no qual consta o agendamento, para que o Webrun interprete que todas as tarefas agendadas devem passar/voltar a serem executadas.

![image38.jpg](/assets/images/agendador_tarefas-6609e7bb8aa73bb584e02629401f4a91.png)

A tela é composta por duas abas: Tarefa e Frequência:

- Tarefa - local no qual é definido o fluxo de ação que será executado, além de configurações necessárias para o perfeito funcionamento da execução:
- - Código - campo não editável que recebe automaticamente um valor ao cadastrar uma ação;
  - Descrição - campo no qual é feito um comentário sobre a tarefa que será agendada;
  - Fluxo de Ações - selecione no campo o fluxo que será executado na tarefa;
  - Parâmetros - se o fluxo de ação informado no campo Fluxo de Ações tiver parâmetros de entrada, eles devem ser definidos um sobre o outro neste campo (a ordem de posicionamento dos parâmetros de entrada do fluxo de ações deve ser considerada);
  - Data Inicial / Data Final - campos em que se define o período de execução do fluxo de ação. Caso não seja definido nenhum valor no campo Data Final, o fluxo executará continuamente.
- Frequência - defina a periodicidade da execução tarefa:
- - Repetir a cada - ativa o campo com o mesmo nome para agendar a cada minuto ou a cada hora. Utilize os campos Dias da Semana e Meses do Ano para ser mais preciso. O padrão é que todas os itens disponíveis venham selecionados e o tempo de execução de 1 minuto;
  - Diariamente - para esta opção, fica subentendido que a ação será executa todos os dias, mas haverá a necessidade de informar a Hora da execução;
  - Semanalmente - agende o dia da semana para a execução da ação e implemente a hora inicial. O padrão é que todas os itens disponíveis venham selecionados;
  - Mensalmente - agende o mês para a execução da ação e implemente com o Dia do mês e a hora inicial;
  - Personalizado - esta opção disponibiliza uma grade com funcionalidades que manualmente podem ser definidas. Para tal, é necessário que o Webrun seja reiniciado e que seja feito pelo menos um acesso no sistema após o reinício. Vale ressaltar que o objetivo do Agendador de Tarefas é executar fluxos de ações que tenha como destino a camada Servidor e que contenham, por exemplo, funções de atualizações de tabelas, cópia de arquivos, dentre outros.

Observação: Para importar uma tarefa, é necessário que a regra exista.

## Agendamento com frequência personalizada

Caso o desenvolvedor queira  agendar uma tarefa para todo mês 2 e no primeiro dia da semana, deverá personalizar da seguinte forma:

- na coluna Tipo em DAY, mude o valor para 1 que corresponde ao primeiro dia da semana (domingo);
- na coluna Tipo em MONTH, mude o valor para 2, correspondente ao mês de fevereiro. Os tipos que não serão utilizados ficarão com valor -1

![agendador de tarefas](/assets/images/agendador_tarefas2-19fa90665eb852f374d90448a9219c7b.png)

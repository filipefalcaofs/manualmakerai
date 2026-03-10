# websocket

> Fonte: https://manual.softwell.com.br/docs/webrun/websocket

# websocket

## WebSocket

O Webrun disponibiliza através da **API de Funções**, diversas funções de *WebSocket* que podem ser utilizadas para alocação, gerenciamento e conexão com endpoints dentro do Webrun.

| Nome | Compatibilidade |
| --- | --- |
| WebSocket - Conectar | Cliente / Servidor |
| WebSocket - Enviar Mensagem para o Cliente | Servidor |
| WebSocket - Enviar Mensagem para o Servidor | Cliente / Servidor |
| WebSocket - Fechar Conexão | Cliente / Servidor |
| WebSocket - Liberar EndPoint | Servidor |
| WebSocket - Obter EndPoint | Servidor |
| WebSocket - Obter Números de Clientes do EndPoint | Servidor |
| WebSocket - Obter Status da Conexão | Cliente / Servidor |
| WebSocket - Servidor em Uso? | Servidor |

## Configurando o WebSocket

Por padrão, o Webrun já possui **5 endpoints** alocados com o prefixo **WS** mas essa quantidade pode ser alterada pela tela de **Parâmetros de Configuração**.

![](/assets/images/websocket_01-13282096bdf733f3fe886cd0937141f7.png)

No grupo **Websocket**, são especificados dois parâmetros, onde o primeiro é o **Prefixo dos Endpoints** e o segundo é a **Quantidade de Endpoints** que serão alocados. Por definição, os endpoins são alocados **somente durante a inicialização do Tomcat**. Após alterar esses valores é necessário reiniciar o mesmo para que as alterações sejam realizadas.

Os endpoints alocados seguem o padrão de nomenclatura `Prefixo + Número Aleatório`. Por exemplo, suponhamos que o prefixo seja **WS** e a quantidade de endpoints seja **5**, os endpoints gerados poderão ser: *WS1570714400*, *WS569616802*, *WS56123139*, *WS85457066* e *WS526223533* **(EXEMPLO)**.

Os números aleatórios gerados que precedem os prefixos **nunca** são os mesmos. A cada vez que o Tomcat é reiniciado os endpoints serão completamente diferentes do que eram anteriormente, e para obtê-los deve-se utilizar a função *WebSocket - Obter EndPoint*.

A quantidade máxima de endpoints é de **2.147.483.647** ou **2³¹ - 1** *(valor máximo de um inteiro de 32-bits)*. Deve-se estar atento aos recursos do servidor quando configurar esse parâmetro. Quanto mais endpoints, maior será o consumo de memória, processador e maior será o tempo de inicialização do Tomcat.

**Observação Importante 1:** Deve-se estar atento também à outros recursos utilizados pelo seu sistema quando utilizar a funcionalidade de *WebSocket* no Webrun. Por exemplo, o componente Chat aloca um endpoint **por sistema** que utilize o mesmo. O endpoint do componente Chat só é alocado somente quando algum componente Chat é carregado desde que o Tomcat foi inicializado.

**Observação Importante 2:** Em versões anteriores à **1.2.0.76** *(Bootstrap)*, o número de endpoints sempre era fixo e limitado à **5 endpoints**.

## Alocando Endpoints

Através da função **WebSocket - Obter EndPoint** é possível alocar um endpoint para conexão e definir fluxos que serão chamados nas seguintes situações:

- **1. Ao Conectar:** O fluxo associado à esse parâmetro será chamado sempre que uma nova conexão for realizada no endpoint alocado.
- **2. Ao Receber Mensagem:** O fluxo associado à esse parâmetro será chamado sempre que uma mensagem for recebida pelo endpoint.
- **3. Ao Sair:** O fluxo associado à esse parâmetro será chamado sempre que alguém desconectar do endpoint alocado.
- **4. Erro:** O fluxo associado à esse parâmetro será chamado sempre que ocorrer um erro no endpoint alocado.

O retorno dessa função será a URL completa com o protocolo `ws://` (em ambientes HTTP) ou `wss://` (em ambientes HTTPS), já montado para utilização no *WebSocket*.

Sempre que um endpoint for alocado e ainda que o endpoint não seja mais utilizado, o mesmo **permanece alocado** até que a função **WebSocket - Liberar EndPoint** seja chamada. O Webrun **não libera endpoints automaticamente**, o desenvolvedor que deve gerenciar a alocação e liberação dos endpoints.

É necessário estar atento à quantidade de endpoints alocados. Se todos os endpoints disponíveis estiverem alocados, a próxima chamada para a função **WebSocket - Obter EndPoint** irá retornar **nulo**. Sempre que um endpoint não for mais utilizado, deve-se liberar o mesmo ou o limite de endpoints será estourado.

## Conectando nos Endpoints

Para conectar nos endpoints alocados deve-se utilizar a função **WebSocket - Conectar**, especificando a URL do endpoint alocado que foi retornada pela função **WebSocket - Obter EndPoint** e especificando fluxos que serão chamados nas seguintes situações:

- **1. Ao Abrir Conexão:** O fluxo associado à esse parâmetro será chamado quando o *WebSocket* conectar no endpoint especificado.
- **2. Ao Receber Mensagem:** O fluxo associado à esse parâmetro será chamado sempre que uma mensagem for recebida.

  *Observação Importante: Quando um cliente conectado ao endpoint envia uma mensagem para o mesmo e um fluxo está associado à esse parâmetro, **todos os clientes** conectados no mesmo endpoint receberão a mensagem **incluindo** o cliente que enviou a mesma.*
- **3. Ao Ocorrer Erro:** O fluxo associado à esse parâmetro será chamado sempre que ocorrer um erro na conexão.
- **3. Ao Fechar Conexão:** O fluxo associado à esse parâmetro será chamado quando o *WebSocket* desconectar do endpoint especificado.

O retorno dessa função será a [instância do WebSocket](https://developer.mozilla.org/pt-BR/docs/Web/API/WebSocket) (quando chamada na camada cliente) ou a [sessão do cliente](https://docs.oracle.com/javaee/7/api/javax/websocket/Session.html) (quando chamada na camada servidor). Esse retorno é utilizado em funções como **WebSocket - Enviar Mensagem para o Servidor**, onde é necessário a referência dos mesmos.

Deve-se estar atento que quando a conexão for realizada na camada cliente, a mesma estará no contexto do formulário onde a função foi chamada. Isso significa que se o formulário for fechado, a conexão poderá ser encerrada e não é garantido que o fluxo associado no parâmetro de **Ao Fechar Conexão** da função **WebSocket - Conectar** seja chamado. Já quando chamada na camada servidor deve-se estar atento a encerrar a conexão utilizando a função **WebSocket - Fechar Conexão**.

## Particularidades do WebSocket no Webrun

- O gerenciamento de alocação e liberação de endpoints deve ser feito pelo desenvolvedor, visto que o Webrun **não libera nem aloca endpoints automaticamente**.
- A quantidade e prefixo dos endpoints é global para todo o Webrun. Isso significa que se possuírem dois ou mais sistemas em funcionamento no mesmo Webrun, todos irão compartilhar das mesmas configurações. Por exemplo, se o Webrun estiver configurado com **10 endpoints** e um único sistema está utilizando todos eles, o outro sistema não possuirá nenhum endpoint disponível para alocação até que eles sejam liberados.
- Mensagens enviadas aos endpoints são refletidas para **todo mundo** que está conectado no mesmo, incluindo o próprio cliente que enviou a mensagem.
- O componente Chat utiliza um endpoint **por sistema** que possua o mesmo. O endpoint para o componente Chat só será alocado somente quando algum componente Chat for carregado em tela desde a inicialização do Tomcat. Se todos os endpoints estiverem sido alocados e o componente Chat tentar alocar o seu endpoint, o mesmo irá dar erro e não irá funcionar.

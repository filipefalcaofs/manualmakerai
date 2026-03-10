# API de Mensagens

> Fonte: https://manual.softwell.com.br/docs/webrun/api_mensagens

# API de Mensagens

A API(*Application Programming Interface*) de Mensagens possui um layout simples, moderno e intuitivo.
Com funcionalidades assíncronas, permite uma melhor experiência para usuário final da aplicação. E para o desenvolvedor maior liberdade para a execução de rotinas de acordo a seleção do usuário.

Todas as mensagens do framework foram reestilizadas para compor esse novo modelo de exibição. Por padrão, utiliza-se o core do `SweetAlert2` como base para a criação das novas mensagens, porém o desenvolvedor pode utilizar o core nativo do framework realizando a configuração do parâmetro avançado [ApiDeMensagem](/docs/webrun/tela_de_configuracoes/Parametros_de_configuracao/parametro_de_configuracao_legado?id=par%C3%A2metros-de-configura%C3%A7%C3%A3o-legado).

Visando padronizar a exibição das mensagens do framework Webrun, o desenvolvedor tem a liberdade de configurar o posicionamento e o tempo de exibição por meio do parâmetro avançado [Mensagem:DefinirTempoPosicao](/docs/maker/propriedades_e_eventos_da_area_de_trabalho?id=propriedades).

> **Nota Informativa:**
>
> Para obter os novos recursos para sistemas legados é necessário realizar os procedimentos de atualização descritos abaixo:
>
> - Na IDE Maker 5, abrir o projeto que terá a API de Mensagens atualizada.
> - Abrir o `Executor de Script SQL` e executar o script abaixo:
>
> ```prism-code
> DELETE FROM FR_REGRAS_ATIVIDADES
> ```
>
> - Realize o download da nova API de mensagens [clicando aqui](https://s3.us-east-1.amazonaws.com/download.softwell.com.br/templates/newapimessages.frz).
> - Após a realização do download, importe o FRZ no projeto.

#### Novas funcionalidades:

> ##### Mensagem de alerta

Alerta o usuário sobre alguma ação realizada no sistema. Não requer nenhuma resposta da parte do usuário, a não ser o reconhecimento da mensagem.

Especificações:

- Título: conteúdo para título
- Mensagem: conteúdo da mensagem
- Tempo: definição da duração que a mensagem deve permanecer em tela. *Caso não seja especificado, a mensagem só será fechada após o usuário clicar no botão de confirmação*
- Posição: posição em que a mensagem deverá ser apresentada em tela

![Mensagem de alerta](/assets/images/api_message_warning-3447aba22c9ac76b6776b7aed515f16d.png)

> ##### Mensagem de sucesso

Comunicar o usuário sobre o sucesso na execução de alguma ação realizada no sistema. Não requer nenhuma resposta da parte do usuário, a não ser o reconhecimento da mensagem.

Especificações:

- Título: conteúdo para título
- Mensagem: conteúdo da mensagem
- Tempo: definição da duração que a mensagem deve permanecer em tela. *Caso não seja especificado, a mensagem só será fechada após o usuário clicar no botão de confirmação*
- Posição: posição em que a mensagem deverá ser apresentada em tela

![Mensagem de sucesso](/assets/images/api_message_success-00f0773a3a98e33d8477d66bc8ace695.png)

> ##### Mensagem de erro.

Interrompe alguma ação indevida realizada no sistema, assim como validações das regras de negócio. Não requer nenhuma resposta da parte do usuário, a não ser o reconhecimento da mensagem.

Especificações:

- Título: conteúdo para título
- Mensagem: conteúdo da mensagem
- Tempo: definição da duração que a mensagem deve permanecer em tela. *Caso não seja especificado, a mensagem só será fechada após o usuário clicar no botão de confirmação*
- Posição: posição em que a mensagem deverá ser apresentada em tela

![Mensagem de erro](/assets/images/api_message_error-8deb540f01c9e85ee9e4c9b4820877b9.png)

**Observação:** quando o parâmetro [DebugMode](/docs/webrun/tela_de_configuracoes/Parametros_de_configuracao/parametro_de_configuracao_sessao?id=DebugMode) está ativo a mensagem de erro apresentará em seu contexto a pilha de execução até o lançamento da exceção, caso exista, possibilitando ao desenvolvedor obter mais detalhes e uma melhor identificação da causa do erro apresentado.

> ##### Mensagem de interação de confirmação.

Solicita ao usuário alguma resposta sobre uma interação efetuada no sistema.

Especificações:

- Título: conteúdo para título
- Mensagem: conteúdo da mensagem
- Fluxo: regra a ser executada na confirmação do usuário. *A execução da regra é assícrona.*
- Parâmetros do fluxo de confirmação
- Fluxo: regra a ser executado no cancelamento do usuário. *A execução da regra é assícrona.*
- Parâmetros do fluxo de cancelamento

![Mensagem de interação de confirmação](/assets/images/api_message_interaction-019d00907bffa29d8ef088adad6ede82.png)

**Observações:**

- A regra associado no fluxo de confirmação deve reservar o primeiro parâmetro que receberá automaticamente o valor `true` como argumento.
- A regra associado no fluxo de cancelamento deve reservar o primeiro parâmetro que receberá automaticamente o valor `false` como argumento.
- A definição de fluxo de confirmação ou cancelamento é opcional.

> ##### Mensagem de alertar aguardando texto

Exibe uma caixa de diálogo com uma mensagem opcional solicitando ao usuário a entrada de algum texto.

Especificações:

- Título: conteúdo para título
- Mensagem: conteúdo da mensagem
- Texto quando nulo(*placeholder*).
- Fluxo: regra a ser executada na confirmação do usuário. *A execução da regra é assícrona.*
- Parâmetros do fluxo de confirmação
- Fluxo: regra a ser executado no cancelamento do usuário. *A execução da regra é assícrona.*
- Parâmetros do fluxo de cancelamento

![Mensagem de interação de confirmação](/assets/images/api_message_prompt-da1c4c808c91c8d61d2301cd91254b0b.png)

**Observação:** a regra associado no fluxo de confirmação e/ou cancelamento deve reservar o primeiro parâmetro que receberá automaticamente o texto de entrada.

#### Considerações importantes:

- O parâmetro `Título` é opcional.
- O parâmetro `Mensagem` é opcional
- O parâmetro `Tempo` espera o valor informado em segundos. Esse parâmetro é opcional e quando não informado é necessario a intervenção do usuário para que a mensagem feche.
- O parâmetro `Posição` é opcional(*quando não informado a mensagem será centralizada no formulário chamador*). Possíveis valores:
  - DT *(Direita topo)*
  - DB *(Direita baixo)*
  - ET *(Esquerda topo)*
  - EB *(Esquerda baixo)*

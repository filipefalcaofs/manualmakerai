# Histórico de alterações - Maker Mobile

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/alteracoesmobile

# Histórico de alterações - Maker Mobile

06 de Dezembro de 2024 (versão: 3.6.38)

- Android10297 Correção ao obter uma imagem da Câmera, a mesma estava sendo rotacionada ao ser tirada em aparelhos Samsung e Motorola

10 de Novembro de 2024 (versão: 3.6.37)

- iOS14590 Atualização do iOS para se adequar às novas políticas de privacidade e boas práticas da Apple. - Inclusão do Manifesto de Privacidade exigido pela Apple. - Atualização das bibliotecas para adicionar o manifesto de privacidade requerido pela Apple. - Atualização na geração dos ícones do APP. - Atualização na imagem de splash para as resoluções disponíveis.

22 de Outubro de 2024 (versão: 3.6.36)

- Android14507 Migração das dependências para o AndroidX.
- Android14508 Atualização das bibliotecas do Firebase.
- Todas as plataformas14251 Correção na função `Mapa - Criar Mapa em uma Moldura` para dar suporte ao `AdvancedMarker`(Marcador Avançado) do GoogleMaps.
- iOS14503 Corrigido o comportamento de Charset quebrado sempre na primeira requisição do APP a uma API externa.
- iOS14456 ModoDebug não estava sendo habilitado ao compilar com a opção marcada.
- iOS14426 Corrigido o `Erro -404` ao tentar registrar um dispositivo no Firebase.
- Todas as plataformas14231 Atualizado a criação de Marcadores do GoogleMaps para utilizar o `AdvancedMarker` da Google.
- iOS13810 Atualização dos projetos iOS para dar suporte ao XCode 14.1 ou superior.
- Android - Atualização do ForegroundService para dar suporte à versão 14 do Android. - Adicionado novas permissões exigidas pela Google. - Melhorias na rotina de registro de dispositivos no Firebase. - Implementação necessária nos serviços para utilização em segundo plano. - Melhorias na solicitação da permissão de notificação na barra de status. - Resolvido um problema que resultava em `crash` do APP ao ter o `ServicoGPS` habilitado.

20 de Agosto de 2024 (versão: 3.6.36)

- Android14323 Atualização para a versão do `Android 14+` e versão de API `SDK 34`.

25 de Janeiro de 2024 (versão: 3.6.35)

- Android14123 Implementação das mudanças do `Android 13+` e `SDK 33+` para permissões de acesso aos arquivos.
- Android14116 Implementação para recebimento de mensagens `PUSH` via `API Firebase Cloud Message V1` e `API LEGADA`*(esta será descontinuada em junho de 2024)*.
- iOS10102 Após usar a função `Escolher Arquivo` e clicar em cancelar, o APP crasha no `iOS` e o mesmo é encerrado.

10 de Maio de 2023 (versão: 3.6.34)

- Android13770 Compatibilização das permissões de acesso a mídia e câmera com a `API 33 (Android 13)`.
- Todas as plataformas13735 Ajuste na função de `Remover Arquivo ou Pasta Vazia` para retornar o resultado da operação.
- Android13733 Adicionado o arquivo `gradle.properties` para que seja possível definir parâmetros para o Gradle no momento da compilação.
- Todas as plataformas13689 Implementação da função 'Remover Arquivo ou Pasta Vazia' no `Android` e `iOS`.
- iOS13692 Ajustes para que as requisições feitas via integração não apresente erro de `CORS`.

06 de Fevereiro de 2023 (versão: 3.6.33)

- Android13507 Atualização do SDK para a API 33.
- Android13514 Compatibilização das permissões do Android para dar suporte ao `POST_NOTIFICATIONS` *(Notificações da Barra de Status)*

15 de Dezembro de 2022 (versão: 3.6.32)

- iOS9875 Compatibilização das funções de `Câmera` e `Leitor de QRCode/Código de Barras` com o `iOS 16+`.

13 de Dezembro de 2022 (versão: 3.6.31)

- Android9865 Compatibilização da API de notificações na barra de status com `Android 12+`.
- Android9870 Compatibilização da Função `Obter Imagem da Câmera ou Galeria` para dar suporte a imagens do `Google Fotos`.
- iOS9874 Compatibilização dos fontes para dar suporte à arquitetura do `MacOS` que possua os novos `Chips M1/M2 da Apple`.

26 de Outubro de 2022 (versão: 3.6.30)

- Android13310 Inclusão da possibilidade de gravar áudio com a extensão .MP3 .
- Android13280 Atualização na rotina de registro do dispositivo no Firebase, o mesmo estava sendo refeito de forma automática mesmo após remover o dispositivo.
- Maker Mobile13276 Implementação da função `Push - Remover Dispositivo`.
- Android13275 Atualização na rotina de armazenamento de arquivos que são provenientes de Download.
- Android12975 Atualização na rotina de armazenamento de arquivos de mídia no Android.
- Android12945 Correção na função `Escolher Arquivo` quando se escolhe arquivos do tipo diferente de imagem.
- Android12931 Implementação do armazenamento de arquivos para se adequar às exigencias do Android 11+ e SDK 30+.
- Maker Mobile9856 Compatibilização da função `Executar Fluxo no Formulário` com o MakerMobile.
- Android9859 Compatibilização das funcionalidades que utilizam localização/coordenadas para se adequar à versão 31+ do SDK.

10 de Novembro de 2021 (versão: 3.6.29)

- Android12911 Migração do `targetSdkVersion`, `compileSdkVersion` para a versão 31 para dar suporte à Play Store.
- Android9810 Não estava sendo possível selecionar arquivo dos diretórios *Download* e *Documents* via utilização da função 'Escolher Arquivo no Dispositivo'.

02 de Setembro de 2021 (versão: 3.6.28)

- Maker Mobile12847 [MOBILE] Inclusão da função 'WebSocket - Obter Status da Conexão' no fonte do Mobile.
- Android12844 Atualização no fonte para dar suporte ao novo formato de arquivo requerido pela *PlayStore* para publicar novos APPs na Loja. *Detalhe*: - Atualização do *minSDK Level* para 30. - Novo recurso disponível na tela de *Lista de Projetos*, que permite o download do arquivo *.AAB* utilizado para realizar a publicação na Loja.
- Android9800 Imagens não estavam sendo carregadas em um elemento img.

11 de Agosto de 2021 (versão: 3.6.27)

- Maker Mobile12847 Inclusão das funções de WebSocket da API padrão no fonte do Mobile. *Funções*: - WebSocket - Conectar - WebSocket - Enviar Mensagem para o Servidor - WebSocket - Fechar Conexão
- Maker Mobile9792 Componentes sem vínculo a banco estavam sendo considerados como obrigatórios no formulário.

16 de Junho de 2021 (versão: 3.6.26)

- Todas as plataformas12736 Valor do campo era limpo após tabular caso o componente não tivesse máscara e o evento *Ao Modificar* fosse executado.
- Android12737 Apps gerados não estavam sendo compatíveis com Sistema Operacional Android antigos *Lollipop*.
- Todas as plataformas9772 Função *Fim do Arquivo?* não estava retornando valor lógico.
- Todas as plataformas9771 Não estava sendo exibido o valor 0(zero) quando o mesmo é carregado do banco de dados.

26 de Março de 2021 (versão: 3.6.25)

- Todas as plataformas9742 Evento *Ao Sair* do componente *Caixa de Texto* não estava sendo executado.
- Todas as plataformas9732 Ao editar um registro na *grade*, o formulário não volta para a tela da grade, sendo necessário o acionamento do botão *Voltar*.

24 de Fevereiro de 2021 (versão: 3.6.24)

- iOS12659 Correção na função *Chamar Serviço Web para Dispositivos Móveis* um erro era apresentado ao executar a função.
- Todas as plataformas12378 Correção na função *REST - Consumir WebService*, função não respeitava o parâmetro charset definido na função.

02 de Janeiro de 2021 (versão: 3.6.23)

- Android12572 Atualização do *minSDK Level* para 29 para publicação na *PlayStore*.
- Android12572 Devido aos impactos causados, o change 12378 foi revertido. Mais detalhes podem ser verificados em  [API Level 30 - Android 11](https://support.google.com/googleplay/android-developer/answer/9956427?hl=pt).

11 de Dezembro de 2020 (versão: 3.6.22)

- Todas as plataformas9675 *Máscaras* não funcionavam corretamente para componentes sem vínculo a banco.
- iOS9666 Mensagens enviadas via *Push Notification* não eram entregues ao fluxo associado quando o app estava encerrado.
- iOS9653 Registro para recebimento de *Push Notification* retorna erro *-403* mesmo com parâmetros corretos.
- Android12378 Atualização do *minSDK Level* para 30 para publicação na *PlayStore*.
- iOS12371 Melhoria para que toda requisição *XHR (XMLHttpRequest)* seja feita através de código nativo, evitando assim erro de *CORS* no uso do *WKWebview*.

14 de Setembro de 2020 (versão: 3.6.20)

- Todas as plataformas9598 Correção nos *Skins*: bordas, textos e outros elementos apresentavam visualização comprometida.
- Todas as plataformas9614 Correção na associação do evento *Depois de Carregar* para o componente *Integração*.
- iOS12237 A função de Criar Shared Preferences forçará conversão automática para *String/Letras* conforme especificação da plataforma *iOS*.
- iOS9613 Função *Obter Informações do Dispositivo* retornava *null/vazio*.
- iOS9612 Função *GPS - Obter Coordenadas* retornava *null/vazio*.
- Todas as plataformas9587 Correção na borda do componente *Moldura* quando definido como *Cor Automática do Componente*.

07 de Agosto de 2020 (versão: 3.6.19)

- Todas as plataformas9580 A função *Mapa - Obter Objeto* a partir das coordenadas não retornava a referência corretamente.
- Todas as plataformas9579 Componente botão não aplica a cor da fonte corretamente quando a propriedade estava com valor padrão.

22 de Julho de 2020 (versão: 3.6.18)

- Todas as plataformas9573 Componentes não aplicam a cor da fonte corretamente quando a propriedade estava com valor padrão.
- Todas as plataformas12078 Melhoria na rotina de seleção de imagens. Suporte a seleção múltipla.
- Android9558 Imagens do projeto não eram renderizadas corretamente (ícone, splash, entre outros).

13 de Julho de 2020 (versão: 3.6.17)

- Todas as plataformas12066 Ajustes internos para otimização da rotina de compilação.
- Todas as plataformas12042 Melhoria na função *Obter documentos*. Suporte a seleção múltipla.
- Android9538 Evento *Ao Ativar Aplicação*, chamada através da API, não funcionava corretamente.

03 de Julho de 2020 (versão: 3.6.16)

- iOS12031 Correção na exclusão de um registro, uma mensagem de função incompatível era apresentada.
- Todas as plataformas12017 Compatibilização com a nova função *REST - Consumir Webservice*.
- Android9538 Fluxo associado ao evento *Ao Ativar Aplicação* não funciona no ambiente *Android*.
- Android9533 Funções de *Interação de Confirmação Personalizada* solicita permissão de acesso ao diretório do dispositivo.
- iOS9542 Incluir, alterar ou excluir registros com Imagem apresentava exceção.
- Todas as plataformas9540 Ações da função *Mostrar Componente* não estavam sendo aplicadas para a descrição do componente.
- Todas as plataformas11989 Implementação para seleção múltipla de imagens através da função obter imagem da câmera ou galeria.

19 de Junho de 2020 (versão: 3.6.15)

- Todas as plataformas11975 Arquivo de configuração de *Templates* apresentava as configurações do sistema e causava conflito com as propriedades do projeto exportado.

02 de Junho de 2020 (versão: 3.6.14)

- Android9511 Propriedade *CorBarraDeStatus* não está funcional.
- Android8933 A função *Iniciar Download* não efetua o download e diverge do funcionamento na plataforma iOS.
- Todas as plataformas11863 Implementação da função *Escolher Arquivo no Dispositivo*.

18 de Maio de 2020 (versão: 3.6.13)

- Todas as plataformas8880 Novas funções Mobile não apresentavam o ícone de compatibilidade.
- iOS11845 Compatibilização das funções *Alertar e Interação de Confirmação* com *WKWebView*.
- iOS11840 Atualização da *estrutura/fonte* conforme recomendação do *XCode*.
- iOS11839 [COCOAPODS] Atualização de dependências.
- iOS11838 Atualização para *WKWebview*.
- iOS11740 Função *Mobile - Abrir URL no Contexto* encerra o APP se a URL for inválida.
- Todas as plataformas9445 Função *Obter Nome do Pacote* não funcionava corretamente.
- iOS9420 Função *Formatar Data/Hora* apresentava erro no iOS.
- Android9403 Utilizar a função *Escolher Arquivo* e pressionar o botão de voltar encerra o app inesperadamente.
- iOS11521 Correção no Encoding do arquivo *MakerViewController*.
- Todas as plataformas11497 Função *Remover Evento do componente* não estava funcionando.
- Android11159 Implementação do *Log* para Android.
- iOS11034 Atualização da função *viewDidLoad* para acompanhar atualização do SO.
- Android10848 Implementação da função *Obter Diretório Padrão*.
- Android10843 Correção da classe *NetworkUtils.java* para função *Iniciar Download* funcionar corretamente.
- Todas as plataformas10571 Implementação na função *Mapa - Traçar Rota entre Pontos* para criar ou não os marcadores.
- Todas as plataformas4509 Propriedades e Eventos não estão informando corretamente compatibilidade.

01 de Outubro de 2019 (versão: 3.6.12)

- Android10537 Implementação do *Dynamic Link* do *Firebase*.
- Android10500 Permissão *android.permission.FOREGROUND\_SERVICE* acrescentada ao *manifest.xml* padrão.
- Android10440 Implementação da chamada da Função *Bluetooth - Enviar Comando*.
- Android10437 Implementação da chamada da Função *Bluetooth - Enviar Texto*.
- Todas as plataformas10428 Correção do *index/form* para resolver contextos de integração.
- Todas as plataformas10410 Atualização da detecção de faces para salvar faces recortadas e corrigir orientação da foto.

13 de Agosto de 2019 (versão: 3.6.11)

- Todas as plataformas10396 Correção nos scripts de importação do *Dataset*.
- Todas as plataformas10395 Compatibilização da função *Enviar Envelope SOAP 1.2*.
- Todas as plataformas10394 Atualização da detecção de faces para definir altura da câmera por porcentagem.

09 de Agosto de 2019 (versão: 3.6.10)

- Android10387 Inclusão da propriedade avançada *PermitirBackup* no *Android*.
- Todas as plataformas10384 Atualização da classe AuthUtils para a função *Maker Mobile - Logar com Twitter*.
- Todas as plataformas10378 Atualização da classe Authutils para a função *Maker Mobile - Logar com Google*.
- Todas as plataformas10370 Melhorias na função de detecção de rostos.
- Android10330 Função *Escolher Arquivo* apresenta erro no Oreo e superior.
- Todas as plataformas10277 *Interação de Confirmação personalizada* não executa o fluxo caso clique fora.
- iOS10212 Fluxo de erro não é executado na função *Ler Código de Barras*.
- Android10210 Atualização para o *Plugin do Gradle 4.1* do Android Studio.
- iOS10204 Correção no alerta do *Push* no iOS com a aplicação fechada.
- iOS10172 Migração para o *Swift 4.2*.
- Android10159 Inserção da Função de Detecção de Faces na imagem Android.

26 de Abril de 2019 (versão: 3.6.0)

- iOS10140 Correção da execução do fluxo de erro na função *Firebase - Ler Dados* (iOS).
- Todas as plataformas10136 Função *Firebase - Ler Dados* apresenta erro de fluxo não encontrado.
- Todas as plataformas10134 Correção da Função *Interação de Confirmação Personalizada*.
- Todas as plataformas10111 Função *Alterar Valor do Componente* apresenta erro de DECIMAL\_POINT em alguns cenários.

01 de Abril de 2019 (versão: 3.5.0)

- Todas as plataformas8786 Erro de compilação era apresentado caso o componente *Integração* possuísse evento cadastrado.
- Todas as plataformas11863 Inclusão do fluxo de erro e parâmetros de errro na Função *Firebase - Ler Dados Android e iOS*.
- Todas as plataformas10049 Melhoria na função *Associar Evento ao Receber Push*.

08 de Março de 2019 (versão: 3.4.0)

- Todas as plataformas8760 Correção no funcionamento padrão da imagem da câmera.
- Todas as plataformas8761 Redimensionamento do formulário ocorre de forma incorreta.
- Android10030 Adição da função trazer para frente.
- Android9805 Correção de crash no aplicativo quando recebido uma Notificação Push com a aplicação fechada/em segundo plano.
- Android9771 Atualização da Biblioteca Neptune para a versão *V2.04.00*.
- iOS9752 Alteração na máscara criada na tela ao utilizara função de ScanCode.
- iOS9751 Correção da mudança de orientação do dispositivo na função de ScanQrCode.

  [© 2020 Softwell Solutions](http://softwell.com.br/)  - Todos os direitos reservados.
  Softwell Solutions e seus produtos são marcas registradas.

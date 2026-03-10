# Histórico de Alterações do Maker 5

> Fonte: https://manual.softwell.com.br/docs/historico_de_alteracoes/alteracoes_maker5

# Histórico de Alterações do Maker 5

### Nota Informativa!

- Mantendo sempre nosso produto atualizado, informamos que a versão do **Webrun 5 v5.0.0.18** foi atualizada para a versão mais recente do **Bootstrap 5 v5.3.0.**
  Caso o desenvolvedor tenha realizado a customização do layout por meio do **Master Skin** é necessário abrir o mesmo
  e atualizar a skin para a obtenção dos novos recursos.
- Atualização do Chromium para a versão **113.0.5672.129.** A partir desta versão, [o Chromium deixará de funcionar no Windows 7 / 8 / 8.1 e Windows Server 2012](https://support.google.com/chrome/thread/185534985/sunsetting-support-for-windows-7-8-1-in-early-2023),
  oferecendo suporte apenas para [Windows 10 ou superior.](https://support.google.com/chrome/a/answer/7100626?hl=en#:~:text=Windows,or%20later%20that's%20SSE3%20capable)

Legenda:

- Modificação
- Externo
- Correção
- Segurança

### Release 10 de Fevereiro de 2025

- Maker 5.0.0.33
- API de Funções  12.2.35
- Webrun  5.0.0.46

### Beta 10 de Fevereiro de 2025

- Maker 5.0.0.33
- API de Funções  12.2.35
- Webrun  5.0.0.46

### Release 10 de Fevereiro de 2025 (API de Funções 12.2.35; Maker 5.0.0.33; Webrun 5.0.0.46)

- Webrun  10296 [GRADE] Ao salvar a customização da grade, em alguns casos, o arquivo `grid.xml` perdia a sua formatação, o que poderia impactar no carregamento do sistema.
- Webrun  10289 [MASCARAS] Ao utilizar a máscara `TELEFONE 9º DIGITO` e digitar um número de telefone fixo com 8 dígitos, o valor era formatado incorretamente.
- Webrun  10257 [ÁRVORE] Ao clicar para expandir o nó, o evento `Ao Clicar` do componente era disparado.
- Webrun  14588 [ÁRVORE] Ajustes para exibir a mudança no cursor ao passar o mouse sobre a descrição do nó.
- Webrun  14552 [CORE] Melhoria na passagem de objetos JSON da camada cliente para servidor, em alguns casos, o parse do objeto não era realizado corretamente.

30 de Outubro de 2024 (Webrun  5.0.0.43)

### 30 de Outubro de 2024 Webrun 5.0.0.43

- Webrun  10249 [LISTA] Ao selecionar itens da lista pressionando as setas de navegação, o valor escolhido não estava sendo modificado no componente.
- Webrun  10251 [CORE] Em alguns casos, quando o parâmetro `DebugCachedFiles` estava desativado, uma exceção ocorria na compressão dos arquivos impactando no carregamento do sistema.

### 01 de Outubro de 2024 Webrun 5.0.0.41

- Webrun  10247 [INTEGRAÇÃO] Ajuste na inclusão de bibliotecas `Javascript e CSS`.
- Webrun  10245 [GRADE] Quando renderizado no componente `CONTAINER` e a propriedade visível estava desabilitada, a responsividade da grade não funcionava corretamente.
- Webrun  10240 [RSS] Componente não estava renderizando o conteúdo quando a propriedade `CHARSET` não possuía valor.
- Webrun  10234 [OPÇÕES] Componente Opções não renderizava corretamente quando a propriedade `Colunas` tinha valor 5 definido.
- Webrun  10242 [GRADE] Campo de busca de uma coluna do tipo `Lista` se transformava em `Campo texto` após uma inclusão de registro.
- Webrun  10241 [SLIDER PANEL] Reprodução automática do carrossel não iniciava após renderização do componente.
- Webrun  10246 [CORE] Componentes `Opções e Checkbox` não mudavam o cursor para pointer ao passar o mouse sobre o elemento.
- Webrun  14362 [CORE] Suporte para que o Webrun leia as configurações de conexão com o banco de dados por variáveis de ambiente. Para mais detalhes [clique aqui.](/docs/webrun/webrun_variaveis_ambiente)
- Webrun  14363 [CORE] Ajuste no carregamento da biblioteca `SLF4J`.
- Webrun  14259 [CORE] Quando o sistema expirava e possuía `entidade e data limite`, o sistema não era redirecionado para o formulário serial.

### 03 de julho de 2024 (API 12.2.35; Webrun 5.0.0.35; Maker 5.0.0.33)

- Webrun  10232 [GRÁFICO GOOGLECHARTS] Responsividade não estava sendo aplicada na Posição X.
- Webrun  10226 [LISTAGEM] Componente apresentava erro ao clicar em "Modificar Consulta" através do Webrun.
- Webrun  10230 [ABA] Componente Lista Dinâmica apresentava erro ao atualizar componente Aba.
- Webrun  10229 [SLIDER] O componente realizava múltiplas requisições ao atualizar o formulário.
- Webrun  10231 [TEXTO] Componente não centralizava o texto quando havia quebra automática.
- Webrun  14248 [GRÁFICO] Propriedade `Exibir Animação` não estava surtindo efeito quando ativada/desativada.
- Webrun  14235 [INTEGRAÇÃO] Melhoria no componente.
- Webrun  10228 [CORE] Melhoria do debug no ambiente `UTF-8`do Webrun.
- Webrun  10235 [INTERROMPER FLUXO] Ao utilizar a função `Interromper Fluxo` sem parâmetros era apresentada uma exceção.
- Webrun  10224 [RELATÓRIO] Relatório era gerado em branco no formato PDF quando o filtro possuía caracteres especiais.
- Webrun  14241 [GRADE] Ao clicar para paginar o componente, a rolagem da página retornava para o topo.
- Webrun  14239 [WEBCAM] Implementação do botão de alternância de modo da câmera em dispositivos móveis no componente Imagem.
- Webrun  14244 [TEMPLATE JÚPITER] No Safari, o template apresentava design incorreto da logo e do botão do Menu.
- API de Funções  10225 [WEBSOCKET] Função `WebSocket - Conectar` apresentava erro ao não especificar o fluxo de mensagem.

### 25 de Abril de 2024 (API de FUNÇÕES 12.2.33; Maker 5.0.0.33; Webrun 5.0.0.34)

- Webrun  10220 [ABA] Componente não atualizava ao mudar o valor do filtro caso a aba estivesse aberta.
- Webrun  10219 [GRÁFICO] Componente apresentava comportamento incorreto ao criar um gráfico com os dados vindos do fluxo de ações.
- Webrun  10218 [IMAGEM] O recurso `Lente de Aumento` não estava renderizando a imagem corretamento de acordo a posição do cursor.
- Webrun  14212 [IMAGEM] Melhoria na criação do zoom quando as definições das propriedades `altura e largura do zoom` ultrapassarem o tamanho do formulário corrente.
- Webrun  14209 [CARD] Implementação para o carregamento de diversos Cards no evento *Ao Preencher*. Sendo assim, é necessário informar no retorno do fluxo associado ao evento uma lista de lista contendo os dados para renderização.
- Webrun  10214 [TEMPLATE SATURNO] Ao clicar em `Sair` no menu do usuário uma exceção era lançada.
- Webrun  10216 [ORACLE] Quando configurado *JNDI (DataSource)* dado do tipo *clob* não funcionava corretamente.
- Webrun  14207 [CORE] Remoção da verificação se o navegador é *Internet Explorer* devido a descontinuação do suporte ao navegador.
- Webrun  14215 [CORE] Inclusão do estilo para as animações do novo marcador do Google Maps.
- Webrun  14218 [CORE] Atualização para que a função `JSON - Filtrar Objeto` aceite as variáveis dos tipos *List* e *ArrayList*.
- API de Funções  14214 [MAPS] Atualização da função `Mapa - Criar Mapa em uma Moldura`.
- API de Funções  14216 [MAPS] Atualização da função `Mapa - Importar Biblioteca`.
- API de Funções  14213 [MAPS] Atualização da função `Mapa - Criar Marcador`.
- API de Funções  14217 [JSON] Atualização para que a função `JSON - Filtrar Objeto` aceite as variáveis dos tipos *List* e *ArrayList*.
- API de Funções  10215 [PDF - Juntar PDF] A função sempre redimensionava as páginas para as dimensões padrão A4 297x210.

### 25 de Março de 2024 (API 12.2.20; Maker 5.0.0.32; Webrun 5.0.0.32)

- Webrun  14197 [MENU] Componente não estava aplicando as permissões de acesso corretamente.
- Webrun  14193 [IMAGEM] Suporte a propriedade [Redimensionar Imagem](/docs/maker/componentes/imagem).
- Webrun  14200 [GOOGLE CHARTS] Suporte a responsividade.
- Maker 14199 [IMAGEM] Nova propriedade `Redimensionar Imagem`.
- Webrun  14194 [CORE] Melhoria no lançamento de exceção quando uma sessão expira e uma requisição é realizada ao servidor de aplicações.
- Webrun  14195 [POSTGRESQL] Atualização do `Driver` de conexão com o banco de dados devido as vulnerabilidades que podem ser consultadas nos CVES:

  - [CVE-2024-1597](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-1597)
  - [CVE-2022-41946](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-41946)
  - [CVE-2022-31197](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-31197)
- Maker 10213 [FORMULÁRIO] Ao criar um novo formulário utilizando o banco de dados `Oracle` a sequence não era criada para o campo auto incremento.

### 12 de Março de 2024 (API de FUNÇÕES 12.2.20; Maker 5.0.0.31; Webrun 5.0.0.31)

- Webrun  10208 [CARD] Ao ocorrer uma exceção, o usuário não era notificado na aplicação, o registro ficava somente no log do servidor de aplicações.
- Webrun  10202 [CHAT] No banco de dados Oracle a exceção `Falha na conexão com o servidor` ocorria ao tentar criar um novo grupo.
- Webrun  10188 [GRADE] A funcionalidade de seta para baixo não estava adicionando uma nova linha na Grade.
- Webrun  10209 [MENU] Ao tentar criar um novo atalho no formulário principal do sistema uma exceção ocorria.
- Webrun  10199 [MENU] Os parâmetros não estavam sendo passados automaticamente para o fluxo associado ao evento `Ao Clicar`.
- Webrun  10197 [MENU] A propriedade avançada `Grupos:PermissaoPadrao` não estava sendo aplicada no componente.
- Webrun  10210 [MENU] Correção na definição de permissão para um formulário. Em alguns casos estava sendo lançada uma exceção.
- Webrun  14185 [CORE] Atualização mínima da API de Funções v12.2.20.
- Webrun  10196 [CORE] Os componente não tinha a propriedade `Dica` atualizada por meio da função `Alterar Hint do Componente`.
- Webrun  10203 [TEMPLATE SATURNO] Ao alterar a cor de um ícone no componente Menu, a alteração não persistia.
- Webrun  10211 [MASTER SKIN] Correção na aplicação dar cor de fundo do componente `Lista Dinâmica`. O Master Skin estava aplicando cor de fundo no componente, impactando na visualização dos dados.
- Maker 14188 [TEMPLATES] Melhorias nos Templates.
- Maker 10200 [EDITOR DE FLUXO] Ao inserir um objeto no fluxo, o mesmo perdia a referência e era inserido no início do fluxo.
- Maker 10201 [CORES DA IDE] No tema claro as descrição dos objetos não apareciam por estarem da mesma cor do plano de fundo.
- Maker 10165 [EDIÇÃO DE FORMULÁRIO] Ao selecionar banco alvo na associação de ações do formulário, as versões estavam desatualizadas.
- Maker 10205 [CORE] Layout do Maker Mobile apresentava inconsistências na escala de 125%.
- Maker 10206 [CORE] Correção na barra clássica do Maker.
- Maker 10207 [MAKER CHROMIUM] Ao fechar a pré-visualização do formulário, alguns processos do `Chromium` continuavam abertos em segundo plano.
- API de Funções  14181 Inclusão da função `Obter Propriedade Avançada`, responsável por obter uma propriedade avançada do sistema ou do Webrun.
- API de Funções  14186 Inclusão da função `Atualizar Todos os Componentes`, responsável por atualizar todos os componentes do formulário corrente.

### Release 15 de Fevereiro de 2024 (API 12.2.19; Maker 5.0.0.29; Webrun 5.0.0.29)

- Webrun  14118 [MOLDURA] Adição dos eventos `Ao Abrir Formulário` e `Ao Fechar Formulário` ao componente Moldura.
- Webrun  14105 [IMAGEM] Adição da propriedade "Posição da Imagem" e melhoria da propriedade "Exibição" ao componente Imagem.
- Webrun  14138 [GRÁFICO] Correção de inconsistência dos campos tipo *Data* e *Data/Hora* no Eixo X.
- Webrun  14139 [GRÁFICO] Ajuste na montagem da legenda do componente quando o mesmo tem valores iguais no Eixo X.
- Webrun  10191 [GRADE] Quando a opção de filtro estava em modo `cache`, ao filtrar o valor no campo da grade, a chave primária retornada era incorreta.
- Webrun  10194 [CARD] Ao utilizar o evento `Ao Preencher` no componente Card, eram apresentados erros no console do navegador.
- Webrun  10195 [COLOR PICKER] Componente não estava retornando valor correto quando seu valor era modificado.
- Webrun  14096 [GRADE] Inserção do componente spinner ao carregar paginação da grade.
- Webrun  14097 [GRADE] Melhoria para atualização da paginação do componente Grade ao utilizar a função `Grade - Modificar Paginação.`
- Maker 14027 [REPORTSERVER] Atualização do servidor de relatórios para versão compatível com *Postgres 14*.
- Maker 14130 [CORE] Suporte ao evento [Ao Carregar](/docs/maker/propriedades_e_eventos_da_area_de_trabalho?id=eventos) na área de trabalho do sistema.
- Maker 14134 [INSPETOR DE OBJETOS] Adição de botão de documentação do componente no inspetor de Propriedades e Eventos e no Menu de Contexto.
- Maker 10189 [CORE] Correção da inconsistência que impedia de encerrar o Maker ao ciclar no botão "fechar".
- Maker 10190 [TEMPLATE SATURNO] A label que contém a descrição do formulário não era atualizada quando o mesmo era fechado.
- Webrun  14086 [TEMPLATE JUPITER] Alteração no Template Júpiter para suportar inserção de elementos no cabeçalho.
- Webrun  10157 [COMPONENTES] Correção em componentes que não habilitavam permissões do Modo Gerente.
- Webrun  10158 [TEMPLATE VÊNUS] Template Vênus não estava exibindo itens do menu no tema claro.
- Webrun  10171 [MASTER SKIN] Componente Opções não estava aplicando a propriedade `Tamanho da Fonte da Descrição` definida no Master Skin.
- API de Funções  14120 Melhoria na função `Abrir Formulário Filtrado na Moldura` para adequação aos novos eventos do componente moldura.
- API de Funções  14121 Melhoria na função `Abrir URL numa Moldura` para adequação aos novos eventos do componente moldura.
- API de Funções  14122 Melhoria na função `Fechar Formulário numa Moldura` para adequação aos novos eventos do componente moldura.
- API de Funções  14124 Melhoria na função `Moldura - Limpar` para adequação aos novos eventos do componente moldura.
- API de Funções  14125 Melhoria na função `Moldura - Alterar Conteúdo da Moldura` para adequação aos novos eventos do componente moldura.
- API de Funções  14143 Compatibilização da função `Formatar Bytes` para a camada cliente.
- API de Funções  14091 Melhoria de performance na função `Tabela HTML para Excel`.
- API de Funções  14090 Melhoria de performance na função `Iniciar Download`.
- API de Funções  14093 Melhoria de performance na função `Opções - Adicionar Item`.
- API de Funções  14087 Correção da função `Alterar Usuário do Sistema` ao ser executada através de ação no componente Menu.
- API de Funções  14094 Correção da chamada da função `Accordion - Novo` através de um botão.
- API de Funções  10172 Correção na função `JWT - Gerar Token`, não estava sendo possível utilizar a função em ambiente externo.
- API de Funções  10173 Melhoria da função `JWT - Validar Token`, não estava sendo possível validar um token gerado externamente.
- API de Funções  14114 Inclusão da função `Push - Enviar Mensagem - Firebase V1` utilizando a nova `API HTTP v1` do Firebase Cloud Messaging (FCM). A API HTTP legada do FCM será descontinuada em breve.

  - Segue link da documentação utilizando a versão `API HTTP v1`. [Clique aqui!](/docs/maker-mobile/como_fazer/push_notification_v1)

### 16 de Outubro de 2023 (API 12.2.16; Maker 5.0.0.23; Webrun 5.0.0.24)

- Webrun  14069 [GRADE] Melhoria no carregamento da quantidade de registros do componente.
- Webrun  14068 [GRADE] Melhoria na checagem de dependências entre grade mestre e detalhe após CRUD.
- Webrun  14064 [GRADE] [ORACLE] Colunas do tipo Lista Dinâmica apresentavam o campo ID após edição ou inserção quando este era do tipo number.
- Webrun  10170 [GRADE] Componente redimensionava o seu tamanho ao alternar entre o componente Aba e abas do formulário.
- Webrun  10169 [GRADE] Não era possível obter o valor de uma coluna não visível após edição por meio da função `Grade - Obter Valor`.
- Webrun  10168 [GRADE] Em alguns casos não era possível obter o valor de uma coluna checkbox ao congelar a coluna.
- Webrun  14075 [CORE] Melhoria nas requisições realizadas no servidor ao sair do formulário.
- Webrun  14073 [RELATÓRIO] Títulos com caracteres especiais impactavam no download do relatório no formato `XLS`.
- Webrun  14070 [GRADE] Correção na aplicação do parâmetro avançado `DesabilitarScript` ou `DesabilitarScriptGrade`.
- API de Funções  14072 Melhoria de performance na função `Modificar Consulta do Formulário ou Grade`.
- API de Funções  14071 Melhoria de performance na função `Grade - Modificar Consulta`.
- API de Funções  14078 Correção da função `Calendário - Novo` em uma chamada cliente/servidor via subfluxo.
- API de Funções  14077 Correção da função `Galeria de Imagens - Novo` em uma chamada cliente/servidor via subfluxo.
- API de Funções  14076 Correção da função `Accordion - Novo` em uma chamada cliente/servidor via subfluxo.
- API de Funções  14067 Correção da função `Executar Fluxo Servidor Assíncrono` no navegador **Safari**.

### 13 de Setembro de 2023 (API 12.2.15; Maker 5.0.0.23; Webrun 5.0.0.23)

- Webrun  14055 [ABA LOCALIZAR] A partir desta versão, colunas do tipo letras terão por padrão o filtro do tipo contendo.
- Webrun  14051 [GRADE] Melhoria de performance na atualização das dependências.
- Webrun  10148 [OPÇÕES] Correção na aplicação do modo apenas leitura, o componente estava acessível mesmo quando a propriedade estava ativa.
- Webrun  10146 [IMAGEM] Quando o componente estava nulo a obrigatoriedade não estava sendo validada.
- Maker 14050 [GRADE] A partir desta versão, por padrão, a propriedade `Habilitar Filtro` é desabilitada.
- Maker 10000 [GRÁFICO] Correção no carregamento das propriedades da série de gráfico do tipo `Barra horizontal`.
- Webrun  10156 [SATURNO] Correção na utilização da função `Definir - Permissão do Menu`, as definições não estavam sendo aplicadas para os itens.
- Webrun  10147 [CORE] Melhoria no fechamento da barra de progresso, em alguns casos, ao ocorrer uma exceção e o fluxo ser interrompido, não estava sendo possível fechar o diálogo de progresso.
- Maker 14061 [CORE] Inclusão da API de Funções versão *12.2.15*.
- Maker 14059 [BANCO DE DADOS] Atualização no driver Oracle para versão *8.0.2.0*.
- API de Funções  14049 Melhoria na função `REST - Consumir Webservices 2.0`para suportar diferentes conteúdos.
- API de Funções  14000 Inclusão da função `HTML- Obter Elementos`.
- API de Funções  13997 Inclusão da `HTML - Obter Elemento` para obter um elemento HTML através de um seletor css.

### 08 de Agosto de 2023 (Maker 5.0.0.21; Webrun 5.0.0.21)

- Webrun  13994 [ABA] Melhoria na identificação do carregamento do componente `GRADE`.
- Webrun  10131 [CAIXA DE TEXTO] Componente não carregava o ícone de calendário quando a propriedade conteúdo era *data e hora*.
- Webrun  10133 [GRADE] Grade detalhe quando estava com a propriedade **Modo Filtro** como *Atualizar Consulta* ignorava os parâmetros da grade *mestre*
- Webrun  10127 [TABELA] No tema dark, a seleção de paginação estava com a mesma cor de fundo do tema.
- Webrun  14015 [CORE] Atualização das libs `Apache Commons Text e Commons Lang` devido a falha de
  segurança. Para mais informações [CVE-2022-42889](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-42889).
- Webrun  14011 [CORE] Suporte a utilização do Google ReCaptcha v3. Para mais informações [clique aqui](/docs/webrun/tela_de_configuracoes/Parametros_de_configuracao/parametro_de_configuracao_recaptcha).
- Maker 14004 [CHROMIUM] Atualização para a versão `113.0.5672.129`.
- Webrun  10123 [MASTERSKIN] Ao carregar **CSS** de versões anteriores o botão de salvar continuava ativo.
- Webrun  14012 [MASTERSKIN] Ajuste no carregamento do *CSS* após salvar a customização.
- Maker 14004 [CORE] Melhoria no redimensionamento da tela de funções do fluxo de ações.
- Maker 13998 [CORE] Melhoria na criação do formulário ao utilizar o plug-in `Excel para Maker`.
- Maker 10129 [CONFIGURAÇÕES] Ajuste no carregamento da lista de cores da IDE ao pressionar `F5`. Em alguns casos, a lista tinha seu valor duplicado.

### 17 de Julho de 2023 (Webrun 5.0.0.19)

- Webrun  13992 [CORE] Ajuste no carregamento do `Sweetalert2` na interface do `MakerChromium`.

### 14 de Julho de 2023 (API 12.2.14; Webrun 5.0.0.18)

- Webrun  13981 [BOTÃO] Melhoria na renderização do componente em perspectiva mobile.
- Webrun  13980 [BOTÃO] Melhoria na aplicação de classes customizadas.
- Webrun  10116 [ACCORDION] Componente não estava sendo criado dinamicamente por meio da função `Accordion - Novo`, caso o parâmetro **Limitar Conteúdo** fosse true.
- Webrun  10118 [CARD] Ajuste na atualização do componente após fechamento do formulário responsável pela edição de eventos.
- Webrun  10104 [LISTA] Ajuste na aplicação da propriedade `Texto quando nulo`.
- Webrun  10113 [LISTA DINÂMICA] Componente permanecia com o mesmo layout(*desabilitado*) quando habilitado por meio da função `Habilitar Componente`.
- Webrun  13967 [CORE] Atualização do `Font Awesome` para a versão 6.4.0
- Webrun  13972 [CORE] Atualização do `Bootstrap` para a versão 5.3.0
- Webrun  13952 [CORE] Atualização do `Sweetalert` para a versão 11.7.12.
- Webrun  13977 [CORE] Adição de badge na `Tela de Configurações` do Webrun para indicar atualização do custom.css do Master Skin.
- Webrun  10109 [FLUXO] Ajuste na passagem de parâmetro cliente para o servidor quando a lista de parâmetro possuia apenas um elemento não primitivo.
- Webrun  10103 [CORE] Quando o usuário era autenticado no servidor e tinha data de expiração de senha, o formulário para alteração de senha não era carregado.
- Webrun  10103 [CORE] **Template Vênus** não estava aplicando a imagem definida na propriedade `Imagem` do formulário principal.
- API de Funções  13963 Atualização da função **ReCaptcha - Validar Resposta** para utilizar a versão 3 da `API da Google`.
- API de Funções  13962 Atualização da função **ReCaptcha - Criar Captcha** para utilizar a versão 3 da `API da Google`.
- API de Funções  13986 **Executar Fluxo Servidor Assíncrono**, parâmetro do fluxo a ser executado apresentava inconsistência caso possuísse caracteres especiais.
- API de Funções  10126 Função **Ler Linha do Arquivo Definindo Charset** retornava caracteres quebrados quando o charset do arquivo era UTF-8.
- API de Funções  10117 Função **HTML - Imprimir Elemento** ajuste na renderização, em alguns casos a impressão estava retornando uma imagem em branco.

### 03 de Julho de 2023 (API 12.2.12; Maker 5.0.0.17; Webrun 5.0.0.16)

- Webrun  13913 [CORE] Implementação para que uma consulta parametrizada tenha seus parâmetros persistidos quando a
  opção para **Manter SQL** estiver ativo na utilização da função `Grade - Modificar Consulta`.
- Webrun  13890 [CORE] Atualização do driver de conexão com o banco de dados **NoSQL MongoDB** versão *3.5.0*.
- Webrun  13715 [CORE] Implementação do **SDK da AWS**.
- Webrun  10060 [ABA LOCALIZAR] Correção na aplicação do parâmetro avançado **PermitirImportarDados**.
- Webrun  10061 [MASTER SKIN] *Tema Claro*, em alguns casos, o background para componentes desabilitados eram definidas na cor roxa e lista de seleção de sistema tinha o background definida na cor branca.
- Webrun  13929 [MASTER SKIN] Melhoria no download do arquivo quando a skin é definido para sistema. A partir desta versão o arquivo terá a nomenclatura *custom\_sigladosistema.css*.
- Webrun  13924 [UPLOAD] Melhoria no layout do formulário.
- Maker 13851 [CORE] Melhoria no layout do *Assistente de Criação de Novo Formulário e Seleção de Parâmetros*.
- Maker 13824 [CORE] Ajuste na aplicação da tecla de atalho *F3*.
- Maker 10054 [CORE] Ajuste na aplicação da propriedade *Skin* ao criar um novo projeto em modo clássico.
- Maker 10062 [CORE] Ajuste na abertura de sistemas legados. Em alguns casos o sistema voltava para a tela de abertura.
- Maker 10021 [ASSISTENTE DE BANCO DE DADOS] Melhoria na aplicação de cores.
- Maker 10063 [FORMULÁRIO] Ajuste na ação de salvar as alterações do formulário.
- Maker 13886 [CORE] Adicionado hint aos novos botões da barra de ferramentas.
- Maker 13941 [CORE] Inclusão da API de Funções versão *12.2.12*.
- Maker 10063 [CORE] Ajuste na abertura de projeto por meio do menu projetos.
- Maker 10079 [CORE] Volta do botão maximizar nos formulários.
- Webrun  10095 [CORE] Plug-in `Excel para Maker` não persistia os dados no banco quando existia valor nulo nas células.
- Maker 13835 [GRADE] Inclusão da propriedade [Cor Condicional no Conteúdo](/docs/maker/componentes/grade).
- Webrun  13827 [GRADE] Implementação da propriedade [Cor Condicional no Conteúdo](/docs/maker/componentes/grade). Tem como principal objetivo aplicar a cor condicional no conteúdo da linha da grade.
- Webrun  13945 [GRADE] Melhoria na ação de *voltar a grade para o estado padrão*.
- Webrun  10073 [AÇÃO] Componente não carregava quando o sistema estava em modo gerente.
- Webrun  10052 [GRADE] Ao aplicar um filtro *(Modo filtro: Atualizar consulta)* por meio de uma coluna do tipo data os dados não eram carregados quando o sistema estava no idioma diferente do brasileiro.
- Webrun  10094 [GRADE] Ao atualizar o componente a cor condicional não era aplicada para algumas colunas.
- Webrun  13732 [GRADE] Melhor identificação do estado da grade quando possui colunas congeladas.
- Webrun  10057 [LISTAGEM] O estilo CSS não era carregado corretamente quando o sistema estava com os parâmetros avançados *DebugCachedFiles e DebugMode* desativados.
- Maker 10068 [GRÁFICO] Não aplicava corretamente a descrição para série do tipo *Barra Horizontal*
- API de Funções  13694 Inclusão da função `AWS - Criar Conexão`
- API de Funções  13695 Inclusão da função `AWS - Obter Lista de Buckets`
- API de Funções  13696 Inclusão da função `AWS - Existe o Arquivo`
- API de Funções  13697 Inclusão da função `AWS - Upload`
- API de Funções  13698 Inclusão da função `AWS - Download`
- API de Funções  13700 Inclusão da função `AWS - Deletar`
- API de Funções  13702 Inclusão da função `AWS - Copiar Pasta`
- API de Funções  13703 Inclusão da função `AWS - Copiar Arquivo`
- API de Funções  13705 Inclusão da função `AWS - Criar Pasta`
- API de Funções  13706 Inclusão da função `AWS - Criar Bucket`
- API de Funções  13707 Inclusão da função `AWS - Deletar Bucket`
- API de Funções  13709 Inclusão da função `AWS - Lista Conteúdo de uma Pasta`
- API de Funções  13856 Inclusão da função `REST - Consumir Webservice - 2.0`
- API de Funções  10084 Correção na função `Executar Fluxo Servidor Assíncrono`. Caso a regra a ser executada possuísse caracteres especias ocasionava uma exceção
- API de Funções  10083 Correção na função `JSON - Filtrar Objeto` na camada cliente.
- API de Funções  13923 Melhoria na execução da função `Obter Parâmetro da Requisição` na camada cliente.

### 29 de Maio de 2023 (Webrun 5.0.0.14.1)

Core:

- Webrun  13881 [GRADE] Correção no carregamento do componente em sistema legado e que possui pool de conexão ativo. Em alguns casos uma exceção era apresentada em tela e o componente não era carregado.

### 15 de Maio de 2023 (API 12.2.9; Maker 5.0.0.14; Webrun 5.0.0.14)

Componentes:

- Webrun  13668 [ABA] Suporte ao fechamento de uma aba com o clique do botão central do mouse.
- Webrun  10011 [CALENDÁRIO] Componente não atualizava os dados ao navegar entre os meses.
- Webrun  10028 [UPLOAD] Componente não estava enviando os parâmetros automaticos no evento *Ao Anexar*.
- Webrun  10019 [COMPONENTES] Melhor identificação visual de componente *apenas leitura*.
- Webrun  13777 [GRADE] Melhoria de performance no carregamento da grade quando o sistema possui *pool de conexões*.
- Webrun  10031 [LISTAGEM] Correção no alinhamento de campos do tipo data no componente.

Core:

- Webrun [MASTERSKIN] Novas implementações:

  - Suporte a novos temas:
    - Serenidade Azul
    - Névoa Oceânica
    - Crepúsculo de Inverno
    - Jardim da Meia-noite
    - Chama Carmesim
  - Customização da skin por sistema para usuários com perfil administrativo
  - Importação do custom.css via interface
  - Definições de propriedades para personalização da descrição dos componentes
  - Definições de propriedades para personalização da barra de navegação
- Webrun  13683 [CORE] Implementação de prevenção a possível ataque *Cross Site Scripting* no carregamento da tela de erro 500.
- Webrun  10033 [ABA LOCALIZAR] Correção no gerenciamento dos campos da grade. Em alguns casos as alterações não eram aplicadas quando o checkbox era clicado.
- Webrun  13145 [CORE] Melhorias do tema *Dark*.
- Webrun  13145 [PLUG-IN] Suporte ao plug-in Excel para Maker.
- Webrun  13683 [PLUG-INS] Melhoria no lançamento de exceção quando o parâmetro *DebugMode* estiver ativo.
- Webrun  13669 [PLUG-IN BUSCA TEXTUAL] Melhoria de performance na execução da consulta ao realizar um pesquisa.
- Webrun  13667 [SKIN E TEMPLATE SATURNO] Melhoria no collapse do componente *Menu*.
- Webrun  10026 [CORE] Correção no levantamento da exceção ao utilizar a função *Excel - Preencher Arquivo*.
- Webrun  10023 [CORE] Correção na apresentação da barra de progresso ao utilizar a função *Faça com barra de progresso*.
- Webrun  10029 [CORE] Correção no upload de arquivos quando o parâmetro avançado *ImagemRedimensionarAoEnviar* está configurado.
- Webrun  9793 [CORE] Correção no carregamento automático de sistemas quando o parâmetro *ImportarTodosScriptsJS* está desabilitado.
- Webrun  10032 [CORE] Correção na aplicação da máscara *Telefone 9° Dígito*, a máscara não era aplicada para alguns DDD's.
- Maker 13687 [CORE] Inclusão da API de Funções versão *12.2.7*.
- Maker 13672 [CORE] Suporte ao plug-in Excel para Maker.
- Maker 13794 [CORE] Inclusão da API de Funções versão *12.2.8*.
- Maker 13813 [CORE] Inclusão da API de Funções versão *12.2.9*.
- Maker 13693 [VISUALIZADOR DE DEPENDÊNCIAS] Melhoria na atualização das dependências.
- Maker 13693 [SKIN E TEMPLATES] Melhoria nos templates. A lista de conexões será visível se existir *DataConnections*.
- Maker 13693 [SKIN E TEMPLATES] Adicionado o item *Master Skin*.

API de Funções:

- API de Funções  10015 Função *Compactação - Compactar para a extensão ZIP* estava inserindo uma pasta vazia no diretório compactado quando utilizado em ambiente *Linux*.
- API de Funções  13688 Inclusão da função *CSS - Adicionar Classe*.
- API de Funções  13699 Melhoria na função *PDF - Remover página* para receber uma lista de páginas a serem removidas.

### 16 de Março de 2023 (API 12.2.6;Maker 5.0.0.9; Webrun 5.0.0.9)

Core:

- Webrun  13632 [MASTER SKIN] Melhoria nas mensagens de interação com o usuário.
- Webrun  9969 [TEMPLATES] No template Vênus, os ítens do menu não estavam legíveis quando estava no Tema Claro e quando o mouse estava em cima do ítem.
- Webrun  9970 [TEMPLATES] No template Saturno, o último ítem do menu estava ficando cortado.
- Webrun  9995 [TEMPLATES] No template Saturno, quando o menu possuía muitos submenus estava criando margens muito grandes.
- Webrun  9971 [MASTER SKIN] A seta do componente Lista Dinâmica não estava visível no Tema Claro.
- Webrun  9968 [MASTER SKIN] O alerta de salvamento do Master Skin estava por trás dos elementos dos modais de visualização.
- Webrun  13618 [MASTER SKIN] O ícone de alternar o colapso da barra de navegação do formulário não estava legível no Tema Escuro em disposição mobile.
- Webrun  13595 [MASTER SKIN] Implementação de novas opções para personalização das cores da barra de navegação dos formulários.
- Maker 9973 [WEBRUN ADMIN] Ao clicar no botão Aplicar para salvar as alterações do serviço estava apresentando erro de AV.
- Maker 9984 [MAKER] Ao criar um projeto sem template estava dando erro de AV.
- Maker 9985 [MAKER] Esquema de cores da lista de "Novo Componente" do menu de contexto do formulário não estava correto.
- Maker 9986 [MAKER] Botão de abrir as configurações do Webrun não estava abrindo o Webrun Admin.
- Maker 9989 [MAKER] Ao criar um fluxo a partir de um evento de componente e clicar para fechá-lo enquanto a janela estava carregando era apresentado um erro de AV.
- Maker 9991 [MAKER] Ao criar um fluxo a partir de um evento de componente e clicar com botão direito do mouse enquanto a janela estava carregando era apresentado um erro de AV.
- Maker 9990 [MAKER] Aba Cálculo não estava aparecendo no editor de relatórios.
- Maker 13632 [MAKER] Inclusão da API de Funções versão 12.2.6.
- Webrun  13641 [CORE] Função Gerar QRCode não estava retornando o objeto criado.

Componentes:

- Maker 13619 [COLOR PICKER] Reformulação do componente Color Picker.
- Webrun  13605 [COLOR PICKER] Reformulação do componente Color Picker.
- Webrun  9975 [LISTAGEM] Componente não estava apresentando todas as informações em tela.
- Webrun  9983 [CARD] Componente não estava realizando o filtro por constantes de componente do Webrun e não estava atualizando através da função Atualizar Componente.
- Webrun  9979 [ABA] Componente não estava respeitando o parâmetro do título ao utilizar a função Aba - Adicionar Nova Aba.
- Webrun  9980 [ABA] Função Aba - Atualizar Aba não estava retornando o valor lógico corretamente.
- Maker 9996 [CARD] Componente Card não tem a fonte aplicada de acordo com o que foi definido na propriedade.
- Webrun  9999 [GRADE] Cor condicional não estava sendo aplicada ao mover uma coluna da Grade.
- Webrun  10008 [CARD] Função Card - Preencher Card não estava carregando a imagem passada pelo parâmetro.
- Webrun  13659 [ACCORDION] Função Accordion - Abrir Formulário na Seção não estava funcionando corretamente.

API de Funções:

- API de Funções  13608
  [API DE FUNÇÕES] Melhorias gerais na função JWT - Obter Payload para retornar sempre objeto JSON, melhor identificação do charset e melhoria de performance.
- API de Funções  13614
  [API DE FUNÇÕES] Inclusão da função Hotmail - Enviar Email - Oauth 2.0.
- API de Funções  13620
  [API DE FUNÇÕES] Melhoria na função Obter Informações do Sistema para compatibilização com o WebSphere.
- API de Funções  13638
  [API DE FUNÇÕES] Inclusão da função Abrir Conexão Definindo Porta. Essa função abre uma conexão com um banco de dados informado por parâmetro, na qual o usuário define a porta em que deseja abrir conexão uma vez a conexão aberta o usuário poder executar comandos ou seleções no banco de dados.
- API de Funções  13643 [API DE FUNÇÕES] Função Gerar QRCode não estava retornando o objeto criado.
- API de Funções  13650 [API DE FUNÇÕES] Inclusão da função PDF - Obter Metadados.
- API de Funções  13651 [API DE FUNÇÕES] Inclusão da função PDF - Deletar Metadados.
- API de Funções  13652 [API DE FUNÇÕES] Inclusão da função PDF - Inserir Metadados Customizados.
- API de Funções  13653 [API DE FUNÇÕES] Inclusão da função PDF - Atualizar Metadados do Arquivo.
- API de Funções  13656 [API DE FUNÇÕES] Inclusão da função PDF - Obter Número de Páginas.
- API de Funções 9981 [API DE FUNÇÕES] Função Accordion - Abrir Formulário na Seção não estava funcionando corretamente.
- API de Funções  10007 [API DE FUNÇÕES] Função Grade - Preencher com Consulta estava carregando os campos lógicos com letras.

### 24 de Fevereiro de 2023 (Maker 5.0.0.6)

Core:

- Maker 13607 [CORE] Ajuste no assistente de criação de projetos para sempre definir a sigla do sistema como maiúscula.
- Maker 13606 [CORE] Adição da biblioteca zlib1.dll no empacotador de projetos. Em alguns ambientes, estava causando erro ao restaurar um projeto devido a falta da biblioteca.

### 17 de Fevereiro de 2023 (Maker 5.0.0.5; Webrun 5.0.0.5)

Core:

- Maker 13543 [CORE] Ajuste na inicialização do Maker e na abertura de projetos. Em alguns momentos o Maker congelava ao abrir um projeto ou durante sua inicialização.
- Maker 13598 [ASSISTENTE DE MIGRAÇÃO] Melhoria na rotina de migração para melhor compatibilização com sistemas do Maker 2.7.
- Maker 13599 [ASSISTENTE DE MIGRAÇÃO] Melhoria na rotina de migração para lidar com menus legados. Agora o assistente de migração passa a verificar quando o menu do sistema está em FR\_MENU e habilita a propriedade Menu Legado automaticamente nos novos templates.
- Maker 13600 [TEMPLATES] Atualização do link de visualização do template Vênus.
- Webrun  13602 [CORE] Ajuste na estrutura XML do projeto durante a exportação para evitar erro ao publicar o sistema.
- Webrun  13596 [ABA LOCALIZAR] Ajuste na busca por Data e Data e Hora na consulta avançada da Aba Localizar.

### 15 de Fevereiro de 2023 (API 12.2.4; Maker 5.0.0.4; Webrun 5.0.0.4)

Componentes:

- Maker 13227 [CARD] Novo componente Card.
- Webrun  13144 [CARD] Suporte ao componente.
- Maker 13231 [UPLOAD] Novo componente Upload.
- Webrun  13222 [UPLOAD] Suporte ao componente.
- Webrun  13319 [CALENDÁRIO] Integração com o Google Calendar.
- Maker 13056 [CAIXA DE TEXTO] Inclusão da opção *Data e Hora* na propriedade *Conteúdo* do componente.
- Webrun  13241 [CALENDÁRIO] Atualização do *FullCalendar para a versão 6*.
- Maker 13046 [LISTAGEM] Suporte a propriedade *Modo de Visualização*.
- Webrun  13263 [LISTA DINÂMICA] Suporte a propriedade *Permitir Inclusão*.
- Webrun  13291 [ABA] Reformulação do componente Aba.

Core:

- Webrun  13221 [CORE] Atualização do framework **Bootstrap 5**.
- Maker 13140 [CORE] Suporte a PWA.
- Webrun  13207 [MASTERSKIN] Inclusão do Master Skin na tela administrativa do Webrun.
- Webrun  13465 [SKINS] Inclusão de novos templates:

  - Júpiter (Template Bootstrap);
  - Saturno;
  - Vênus.
- Webrun  13124 [BUSCA TEXTUAL] Reformulação do plug-in.
- Webrun  13229 [VISÃO HIERÁRQUICA] Reformulação do plug-in.
- Webrun  13246 [PLAYER DE FLUXOS] Reformulação do plug-in.
- Webrun  13338 [WFROFFICE] Implementação para manipulação dos arquivos WORD e EXCEL através do caminho do arquivo.
- Maker 13356 [ASSISTENTE DE MIGRAÇÃO] Implementação do assistente de migração.
- Maker 13564 [MAKER] Implementação da atualização automática de templates. Agora o Maker passará a verificar a versão do template do sistema e irá sugerir atualizações automáticas.
- Maker 13545 [MAKER] Implementação da opção de visualizar template.
- Webrun  13242 [FORMULÁRIOS] Implementação da definição das classes *.webrun-login-form* e *.webrun-main-form* para os formulários de login e principal no elemento `<html>` e implementação da tag ID no contendo o GUID do formulário.
- Webrun  13481 [WEBRUN] Definição do tema dark no Webrun.
- Maker 13563 [MAKER] Nova opção **Reimportar Template** no menu **Projeto**.
- Maker 13562 [ASSISTENTE DE CRIAÇÃO DE PROJETOS] Repaginação visual do Assistente de Criação de Projetos.
- Webrun  13484 [FONT AWESOME] Atualização do *Font Awesome* para a versão 6.2.1.
- Maker 13185 [BANCO DE DADOS] **PostgreSQL** suporte a versão 14.0.
- Maker 13185 [BANCO DE DADOS] **Oracle** suporte a versão 19c e 21c.
- Maker 13146 [BANCO DE DADOS] **Firebird** suporte a versão 4.0.
- Webrun  13340 [ITEXT] Implementação da biblioteca IText para manipulação de PDF.
- Webrun  13378 [CORE] Melhoria das classes *WFREOffice* e *Cached Style Cells* na função *Excel - Ler Dados do Arquivo*.
- Webrun  13312 [FLUXO WEB] Melhoria do retorno definido em um Fluxo Web.
- Webrun  13577 [WEBRUN] Melhoria na exibição da barra de progresso ao utilizar a função *Faça com Barra de Progresso*.
- Maker 13049 [CORE] Melhoria na identificação do diretório padrão do Webrun.
- Maker 13050 [CORE] Melhoria no layout do assistente de banco de dados.
- Maker 13269 [MAKER] Melhorias de performance no Maker.
- Maker 13268 [MAKER] Melhorias visuais na interface do Maker.
- Webrun  13261 [CORE] Melhor identificação na seleção do idioma.
- Maker 13273 [MAKER] Adequação do direcionamento do Scroll.
- Webrun  13326 [MASCARAS] Alteração das máscaras dos componentes para tipo SP.
- Webrun  9947 [ABA LOCALIZAR] Melhoria para possibilitar a busca por Data e Hora.

API de Funções:

- API de Funções  13370
  Inclusão da função *JSON - Filtrar Objeto*.
- API de Funções  13334
  Inclusão da função *JSON - Inserir no banco*.
- API de Funções  13331
  Inclusão da função *JSON - Obter dados da tela*.
- API de Funções  13282
  Inclusão da função *JSON - Remover Elemento*.
- API de Funções  13369
  Inclusão da função *JWT - Validar Token*.
- API de Funções  13368
  Inclusão da função *JWT - Gerar Token*.
- API de Funções  13588
  Inclusão da função *JWT - Obter Payload*.
- API de Funções  13363
  Inclusão da função *Maximizar Formulário Flutuante ou Pop Up*.
- API de Funções  13344
  Inclusão da função *HTML - Gerar QR Code*.
- API de Funções  13343
  Inclusão da função *PDF - Extrair texto*.
- API de Funções  13342
  Inclusão da função *PDF - Remover página*.
- API de Funções  13341
  Inclusão da função *PDF - Juntar PDF*.
- API de Funções  13337
  Inclusão da função *CSS - Importar uma lista de arquivos*.
- API de Funções  13330
  Inclusão da função *CSS - Adicionar Classe*.
- API de Funções  13329
  Inclusão da função *CSS - Remover Classe*.
- API de Funções  13335
  Inclusão da função *WFRE - Atualizar lista de sistemas.*
- API de Funções  13333
  Inclusão da função *Formulário - Tornar FullScreen*.
- API de Funções  13332
  Inclusão da função *XML - Obter XML do menu*.
- API de Funções  13297
  Inclusão da função *Aba - Novo Componente*.
- API de Funções  13296
  Inclusão da função *Aba - Fechar Aba*.
- API de Funções  13294
  Inclusão da função *Aba - Atualizar Aba*.
- API de Funções  13293
  Inclusão da função *Aba - Adicionar Nova Aba*.
- API de Funções  13289
  Inclusão da função *DOCX para PDF*.
- API de Funções  13245
  Inclusão da função *Bootstrap - É tela pequena?*
- API de Funções  13206
  Inclusão da função *Card - Anexar Evento ao Componente*.
- API de Funções  13593
  Inclusão da função *Card - Preencher Card*.
- API de Funções  13587
  Inclusão da função *Conexão está aberta?*
- API de Funções  13559
  Inclusão da função *Armazenamento Local - Obter Quantidade*.
- API de Funções  13558
  Inclusão da função *Armazenamento Local - Limpar*.
- API de Funções  13557
  Inclusão da função *Armazenamento Local - Remover Variável*.
- API de Funções  13556
  Inclusão da função *Armazenamento Local - Definir Variável*.
- API de Funções  13555
  Inclusão da função *Armazenamento Local - Ler Variável*.
- API de Funções  13499
  Inclusão da função *Oauth 2.0 - Requisitar Token*.
- API de Funções  13498
  Inclusão da função *Gmail - Enviar Email - Oauth 2.0*.
- API de Funções  13566 Implementação do `Modo Restrito` na alocação do endpoint do `Websocket` para maior segurança das mensagens trafegadas.
- API de Funções  13404 Melhoria na função *Utilitários - Obter informações do Sistema:*

  - Remoção da dependência Sigar.
- API de Funções  13403 Melhoria na função *Utilitários - Obter informações de Disco:*

  - Remoção da dependência Sigar.
- API de Funções  13394 Melhoria na função *Aba - Novo Componente:*

  - Criação de abas nos formulários passados por parâmetro.
- API de Funções  13361 Melhorias na função *Lista Dinâmica - Novo:*

  - Suporte a propriedade Estilo CSS.
  - Suporte a propriedade Classe CSS.
- API de Funções  13357 Melhorias na função *Texto Longo - Novo:*

  - Suporte a propriedade Classe CSS.
  - Correção da Função Server Side.
- API de Funções  13355 Melhorias na função *Slider Panel - Novo:*

  - Suporte a propriedade Estilo CSS.
  - Suporte a propriedade Classe CSS.
- API de Funções  13354 Melhorias na função *Slider - Novo:*

  - Suporte a propriedade Estilo CSS.
  - Suporte a propriedade Classe CSS.
- API de Funções  13353 Melhorias na função *Ação - Novo:*

  - Suporte a propriedade Estilo CSS.
  - Suporte a propriedade Classe CSS.
- API de Funções  13352 Melhoria na função *Imagem - Novo:*

  - Suporte a propriedade Classe CSS.
- API de Funções  13351 Melhoria na função *Check - Novo:*

  - Suporte a propriedade Classe CSS.
- API de Funções  13350 Melhoria na função *Lista - Novo:*

  - Suporte a propriedade Classe CSS.
- API de Funções  13349 Melhoria na função *Opções - Novo:*

  - Suporte a propriedade Classe CSS.
- API de Funções  13348 Melhoria na função *Caixa de texto - Novo:*

  - Suporte a propriedade Classe CSS.
- API de Funções  13347 Melhorias na função *Moldura - Novo:*

  - Suporte a propriedade Estilo CSS.
  - Suporte a propriedade Classe CSS.
- API de Funções  13345 Melhorias na função *Botão - Novo:*

  - Suporte a propriedade Estilo CSS.
  - Suporte a propriedade Classe CSS.
- API de Funções  13328 Melhorias na função *Tabela para JSON:*

  - Função alterada para suportar BigDecimal e Long.
- API de Funções  13327 Melhoria na função *Mascarar:*

  - Função alterada para utilizar máscara do tipo SP.
- API de Funções  13325 Melhoria na função *Mascarar:*

  - Função alterada para utilizar Functions.java.
- API de Funções  13283 Melhoria na função *Obter Extensão do Arquivo:*

  - Função alterada para não testar a existência do arquivo.
- API de Funções  13160 Melhoria na função *WebSocket:*

  - Ajuste na sintaxe do código da função.

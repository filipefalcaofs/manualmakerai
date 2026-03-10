# Serviço de Impressão

> Fonte: https://manual.softwell.com.br/docs/webrun/configuracao_impressao

# Serviço de Impressão

O Antigo `Serviço de Impressão` foi substituído pelo `Webrun Agent`.

**Como Utilizar o Serviço de Impressão para Impressão Direta**

1. Realize o Download do `Webrun Agent`. Você pode obter [**clicando aqui**](https://s3.us-east-1.amazonaws.com/download.softwell.com.br/maker5/webrun5/webrunagent/WebrunAgent.zip)
2. Execute o `Webrun Agent`.
3. O Agent ficará disponível na bandeja do Windows.

![Imagem](/assets/images/webrun_agent_bandeja-34ef87ab8f468029fe43a7cc3aedf16b.png)

**Configurações do Webrun Agent**

O `Webrun Agent` possui algumas configurações que podem ser acessadas através do menu de contexto da bandeja do Windows.

![Imagem](/assets/images/webrun_agent_menu_contexto-80015e3b2e84c9fb00da18ebb683add9.png)

1. **Configurar:** Abre a tela de configurações do `Webrun Agent`.

![Imagem](/assets/images/webrun_agent_configuracoes-54c41abd47cfd356f4141c5eedc83e71.png)

2. **Iniciar com o Windows:** Habilita o `Webrun Agent` para iniciar junto com o Windows.
3. **Fechar:** Encerra o `Webrun Agent` e o mesmo ficará indisponível para impressão.

**Configurações no Webrun para utilização do Webrun Agent**

1. Acesse o menu `Configurações > Parâmetros de Configuração` no painel de configurações do Webrun.
2. Crie um novo grupo de parâmetros com o nome `Impressao` e defina o atributo `Porta` com o valor `9001` que é a porta padrão do `Webrun Agent`.

![Imagem](/assets/images/webrun_agent_parametros-97d05065e6d2c65bda4549400656a44f.png)

**Observações:**

1. O `Webrun Agent` não necessita de instalação, basta executar o arquivo `WebrunAgent.exe` que o mesmo ficará disponível na bandeja do Windows.
2. A Porta padrão do `Webrun Agent` é a `9001`, caso seja necessário alterar a porta, a mesma deve ser alterada no grupo de parâmetros `Impressao` no Webrun.
3. O `Webrun Agent` deve estar em execução para que a impressão direta funcione.
4. Após a substituição do `Serviço de Impressão` para o `Webrun Agent`, a função de `Impressão Direta` continua funcionando normalmente e imprimindo por padrão na impressora padrão do Windows, mas agora é possível configurar a impressão direta para imprimir em uma impressora específica, basta passar o nome da impressora no parâmetro da função `Impressão Direta - Imprimir Texto ou Arquivo`. Para obter o nome das impressoras disponíveis no sistema operacional, utilize a função `Impressão Direta - Obter Lista de Impressoras`, disponível na API.
5. Caso não seja configurada nenhuma porta nas configurações do Webrun, o `Webrun Agent` utilizará a porta `9001` por padrão.
6. Caso o antigo `Serviço de Impressão` esteja instalado no computador, o mesmo deve ser desinstalado para que o `Webrun Agent` funcione corretamente caso esteja utilizando a porta `9001`.

# Progressive Web App - PWA

> Fonte: https://manual.softwell.com.br/docs/webrun/tela_de_configuracoes/pwa

# Progressive Web App - PWA

O Progressive Web App (PWA) é uma maneira de trazer a sensação de aplicativo nativo para um aplicativo da Web tradicional, dando capacidade de instalá-lo na tela inicial de um dispositivo móvel ou desktop, para acessar a câmera do dispositivo, receber notificações push e fazer a sincronização em segundo plano.

O PWA só será executado em sistemas publicados e que utilizem o **HTTPS** em seu endereço virtual.

A partir da versão **Maker 5**, o **Webrun 5** dará suporte ao **PWA** nativamente, para que qualquer sistema possa ser instalado como aplicativo em qualquer dispositivo móvel e em sistemaos operacionais como **Windows** e **MacOS**. Esse recurso poderá ser desabilitado através do parâmetros de configuração, saiba mais em **Observações**.

A solicitação para instalação é acionada na tela de login e ao clicar no botão adicionar aparecerá um banner de instalação. Veja como funciona abaixo:

![](/assets/images/PWA1-b2228ae6dd284554c5ba9e2123dc10b5.png)
![](/assets/images/PWA2-df253e852c6df2f397a38aeff0c28a52.png)

*Imagem 1 e 2 - Interface do sistema sendo configurado com PWA.*

Pronto o seu sistema já está instalado e foi adicionado um app na tela inicial do seu celular ou desktop.

Ao acessar o aplicativo, a página principal será a tela de login do sistema em que foi instalado o **PWA**.

## Atualize os Arquivos do PWA

O navegador utiliza o arquivo `manifest.json` para ler as propriedades de configuração do PWA. Por isso, quando o seu sistema é carregado pela primeira vez, o webrun cria automaticamente o `manifest.json` do seu sistema contendo as principais informações e ícones da aplicação.

Para personalizar ou atualizar alguma informação no PWA como por exemplo, o ícone, é necessário:

1. Apagar a pasta **system\_`<sigla do sistema>`** que fica dentro da estrutura de pastas *C:\Program Files (x86)\Softwell Solutions\Maker 5\Webrun 5\tomcat\webapps\webrun5\pwa* ;
2. Defina um [propriedades\_e\_eventos\_da\_area\_de\_trabalho](/docs/maker/propriedades_e_eventos_da_area_de_trabalho) ícone da aplicação no Projeto. A imagem deverá ter **dimensões iguais**, exemplo 512x512, para que a imagem padrão seja substituida.
3. Se desejar, é possivel mudar a tela em que seu sistema iniciará. Para modificar, é necessário ir em [Parâmetro de Configuração](/docs/webrun/tela_de_configuracoes/Parametros_de_configuracao/parametro_de_configuracao), clicar em PWA e definir um valor para o parâmetro **URL**, caso o grupo **PWA** não exista, basta criar, conforme o exemplo a seguir:

![](/assets/images/PWA4-bdedf1130f0ccea8badc4b0a056dc601.png)

*Imagem 3 - Interface das configurações do Webrun.*

4. [Reinicie o Webrun](/docs/webrun/atualizacoes_configuracoes_webrun).

Assim, o PWA estará configurado de forma personalizada.

![](/assets/images/PWA5-2b6aa3a86df6033958d72db411549e50.png)
![](/assets/images/PWA6-3f4476bd227ef0a28faa28aa9b14c56c.png)

*Imagem 4 e 5 - Interface do sistema sendo configurado com PWA.*
![](/assets/images/PWA8-1764a92ed086e2c5c2c1f32c06f7b89f.gif)

*Gif 1 - Interface do sistema carregado com PWA.*

## Para iOS

Atualmente, o iOS não tem suporte para o prompt de instalação de PWAs, mas tem suporte para instalar um aplicativo Web na tela inicial. Nos dispositivos da Apple, é necessário clicar no botão compartilhar na parte inferior e rolando até o botão Adicionar à Tela inicial.
Como no exemplo abaixo:

![](/assets/images/PWA9-65a2f19cd41f21c78c29e205c1df3d3c.png)

*Imagem 6 - Interface do IOS sendo configurado o PWA.*

Observações:

1. Para desabilitar, use a [propriedades\_e\_eventos\_da\_area\_de\_trabalho](/docs/maker/propriedades_e_eventos_da_area_de_trabalho) Propriedade Avançada PWA e defina o valor false para o parâmetro, dessa forma será desabilitado o recurso de **PWA** para todos os sistemas. Conforme no exemplo abaixo:

![](/assets/images/PWA7-c67f9e26fb09988d9fa9c5bc07ad4822.png)

*Imagem 7 - Interface das configurações do Webrun.*

2. Para desabilitar o **PWA** apenas para um sistema em específico, basta definir a propriedade **PWA** nas [propriedades\_e\_eventos\_da\_area\_de\_trabalho](/docs/maker/propriedades_e_eventos_da_area_de_trabalho) Propriedade Avançadas do projeto na área de trabalho.
3. Para que qualquer alteração em propriedades avançadas seja efetivada, é necessário [reiniciar o Webrun.](/docs/webrun/atualizacoes_configuracoes_webrun)
4. Ao definir a URL para indicar a tela inicial do seu sistema, é necessário testar com mesmo endereço virtual para acionar a solicitação de instalação.

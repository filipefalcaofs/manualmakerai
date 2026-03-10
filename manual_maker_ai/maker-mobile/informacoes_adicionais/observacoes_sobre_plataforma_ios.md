# Observações sobre a plataforma iOS

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/informacoes_adicionais/observacoes_sobre_plataforma_ios

# Observações sobre a plataforma iOS

Abaixo, consta uma lista com características únicas para a plataforma **iOS**:

- Para instalar o PhoneGap no **macOS**, é necessário a configuração manual do PhoneGap após o processo de instalação. Este processo consiste em acessar **Preferences->Source Trees** do XCode e adicionar a variável "PHONEGAPLIB" apontando para o local onde a aplicação está instalada, normalmente: **~/Documents/PhoneGapLib**.

  > O PhoneGap é aceito na App Store e uma lista de projetos que a utilizam pode ser consulta aqui: <http://phonegap.com/app/>

  Para as demais plataformas não se faz necessária a compilação manual, dispensando assim a instalação local do PhoneGap ou qualquer outra ferramenta de desenvolvimento.
- Ao compilar os fontes de um sistema no XCode no Mac, não é recomendado que o projeto esteja em um diretório com espaços, pois, no momento da compilação o XCode apontará alguns erros. Tais erros não afetam na compilação.
- Caso o teclado virtual sobrebonha um componente na tela, o teclado virtual aparecerá e deseparecerá constantemente. Isso ocorre devido a um comportamento do WebKit. Para solucionar o problema o usuário deverá atualizar seu Webkit para a versão 4.0 ou superior.
- Campos que utilizam máscara CPF não permite que o conteúdo apresentado ao lado esquerdo do hífen, seja apagado. Este comportamento não ocorre para o Webkit 4.X ou superior.

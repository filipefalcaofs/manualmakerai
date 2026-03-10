# Compilando os projetos gerados para iOS manualmente no Mac

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/como_fazer/como_compilar_projetos_gerados_para_ios_no_mac

# Compilando os projetos gerados para iOS manualmente no Mac

O **Maker Mobile** possui exportação para as plataformas **iOS** e **Android**.

Nos passos abaixo, será demonstrado a compilação manual de um projeto para a plataforma iOS, desde sua exportação a sua execução no Mac.

- Antes de tudo, os seguintes requisitos são essenciais para compilar um projeto iOS:

  - Possuir o **macOS Sierra** instalado ou superior;
  - Ter instalado o **Xcode 8.3.3**;
  - Ter instalado o **Homebrew** mais recente;
  - Ter instalado o **CocoaPods**;
  - E deverá estar inscrito no **iOS Dev Center**.
  > **Atenção:** É recomendado estar sempre com as versões mais recentes do **macOS** e do **Xcode** para evitar problemas durante a compilação.
- No **Maker**, [exporte sua aplicação](/docs/maker-mobile/exportando_projetos/como_exportar) para a plataforma **iOS**.

  > **Atenção:** É importante que o nome da pasta não possua caracteres especiais e não contenha espaços. Os passos abaixo deverão ser executados no **Mac**.
- Faça o download, descompacte o arquivo de projeto do Maker, e realize os passos abaixo.
- Para a execução em ambiente local, é necessário ter instalado em seu Mac o Homebrew e o CocoaPods:

  - Abra o terminal e utilize o seguinte comando para instalar o Homebrew:

    /usr/bin/ruby -e "$(curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/master/install>)"
  - Após a execução do comando acima, instale o CocoaPods, a partir do comando:

    sudo gem install cocoapods
  - Ao concluir a instalação do CocoaPods, abra o terminal na pasta raíz do seu projeto, e execute o comando:

    pod install
- Após a execução destes passos, abra o arquivo **MakerMobile.xcworkspace**. O Xcode automaticamente entrará em execução.

  ![](/assets/images/ios_1-fdba604596d5599817d2fb4d38895739.png) ![](/assets/images/ios_3-f0895bab44a3bb1824470f3ab5ff2f21.png)
- Selecione o dispositivo onde será executada a aplicação e em seguida clique no botão **Run**.  
  A aplicação será disparada automaticamente após a compilação.

  ![](/assets/images/ios_2-657de8dc67f976ca480bf620ad9c4533.png)

A documentação do Homebrew está disponível [aqui.](https://docs.brew.sh/)

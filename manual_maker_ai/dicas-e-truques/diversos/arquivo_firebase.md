# Adicionando arquivo de configurações do Firebase

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/arquivo_firebase

# Adicionando arquivo de configurações do Firebase

Para adicionar o arquivo de configurações do Firebase, é necessário configurar uma aplicação no console do Firebase. Para acessar o console utilize o link "[console.firebase.google.com](https://console.firebase.google.com/)".

- Clique no card para Adicionar projeto.

  ![](/assets/images/img1-cb2d257e35c643d3a0236d911c0f1cd1.png)
- Ao clicar no card, será exibido um pop-up para você definir as suas configurações, defina-as e clique em Criar projeto

  ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB0AAAAdCAYAAABWk2cPAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAACxSURBVEhL7ZRBDoAgDATFM/z/oTxAU5MmBAV3bQUPeq4OO10MMcZtGfysg3kH7oe+an2K3oC2N+fcTZ9Sgu24Jr07mJ7KFSofRcDuUAQ8Zac0VAqDKJTErXJRehXINPWq0jC0BElSC/ikF1Wn+nrzLnprVU8Tw3rh3w0waIIyTS7PAl8ZfUl3iADNOy0LgwB7lim9Whym4aZ7WusF+tIcoZJaQKYieYCnJP2hHqv7Vnt39eNDjXr9XxwAAAAASUVORK5CYII=)
- Ao terminar de ser criado o projeto, selecione a plataforma desejada para a criação do app. Neste momento será utilizado o Android.

  ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHoAAAAVCAYAAACJ+/prAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAFpSURBVGhD7VpRDoMwCNVlt/FkXsEDeDAvtoVkJAzpCip0Kkv8kCGPvgeli+uHYXh1+bk8A/04jin0xWVelqV7XHyNubwPAyn0TUohhU6hb8LATZaZHZ1C72dgmqZVEMm2H2kdIQrHI3ePmM062luIeZ49+DptTDehQUgg21vQ0zIfnPgzGO8LDosBjLQgsBvRxu/Bv+SDAFKh0cKjHS9h85wkzF82nntLngHbRWgqIJIrbaVULE483lO7xkciVMLhOUoFIhUDfQ6LgefKC/gfxojb1m2tYCAHr9KzGh8rLopVw6ZxvfLYkrv2GTehrWRA1dOLLwC7BH20C6z5bYlby7WG2eL7w4XmxCEplkOZxbcFaby7W+egwXeZ0RpgOrv56bw0zz0KoPTLQGvXzt/S3OYzX8PdFp98TalkLUoQZTomN3hNmUIXKOO7h7ZzTQoEOafQQUS3hsk/HrRWIBD/8FN3YO4JZWDgDRtw3PS4Yaq4AAAAAElFTkSuQmCC)
- Defina as configurações do seu aplicativo:

  ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHkAAAAUCAYAAACpkJLNAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAFTSURBVGhD7VkLCoMwDNWxy3oFD+C1HR1khJB0L7Zaa1OQ2S3N5718CpuXZdmnWI9G4PXo6CK4LwJB8gCJECQHyQMgMECI7kpe13WiB8EnyY6+WmPgIjk5u23b72ntfC/JkzBruVwkS0dbO98SuJ5sF5EsA821cln1fK+ds0YCl9V0ynPWPteFEH80P6wY6XsvBrUS6e1RlCqXOyorme+ptSP6rXNWp0DkuX0uj/j4T7+MrXRsafpqdkkXyYmwHEi5YClB+CclQClIHj2ILUQGSV5tvBGhniI4Youfqdau5aUMdezoOW1U8EuhZh+xhcigsd1FzkVyaYZrVXwXIGr7YWHVAgNXu87NZPkbCtqRc9q9ANFztgzXj9gijCxceUu33hGc597+hbpyliEAJpk7+nTKTEYBCbnrEeiukq+HqH+LrotX/+GOGUGQPADvQfIAJH8AfCL4TmJXkusAAAAASUVORK5CYII=)

  - Nome do pacote do Android: é o nome do pacote que você configurou na tela de Exportação de projetos.
  - Apelido do aplicativo(opcional): é o apelido, ou segundo nome para o seu app no Firebase.
  - Certificado de assinatura de depuração SHA-1(opcional): caso utilize autenticação via SMS, defina o certificado "**C2:6C:CB:78:64:69:66:DC:EB:17:C9:F0:DD:FA:94:A0:BE:E9:62:4F**".
  - Clique em Registrar App
- Faça o download do arquivo google-services.json

  ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAACBSURBVEhLY+Th4fnPQEPAREOzwUaPWkAwhBmxRfKuXbsIakRX4ObmxgDSB6KRAV4L0BXjshVmMDYLhn4k0zwOaB5EWH1AchKCaiA5FZFiEa5kSvMgImgByGUwTIqPYGoJWkCOoch6RoAFoKQHw+QEF82DiKoZDZsPae6DUQsIJiwAXKMvIc/YotkAAAAASUVORK5CYII=)

  Após o download, clique no texto "Pular para o console", na lateral esquerda. [Clique aqui para pular a configuração do app IOS](#upload)
- Para configurar para iOS, selecione a plataforma para a criação do app e defina suas configurações.

  ![](/assets/images/img6-5b5efa4106c09489158045c9162f56a7.png)

  - Código do pacote do iOS: é o nome do pacote que você configurou na tela de Exportação de projetos.
  - Apelido do aplicativo(opcional): é o apelido, ou segundo nome para o seu app no Firebase.
  - ID da App Store(opcional): Id do aplicativo na App Store.
  - Clique em Registrar App
- Faça o download do arquivo GoogleService-Info.plist

  ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEwAAAAWCAYAAABqgnq6AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAHSSURBVFhH7VmtU8MwFH9BrY457CRzk0NOIpnkzwA3/owhkeCwc5ucHLKOysniUhfytr4tl0uaj7UHvUvuItr3/et7v0tbtlh+io9NDsW+hLTsCFwPBzCfjYE9LN7F83wK08ko4dWAQF78wMvbCth69y1mCSyvZtl8FcCEXF7aSQmqqoKrhIMfAgiWRAw7jKcOc2CGWEm0Dh3GOE+AefbY5SOZZRnQ9gmKujEr1i4mlssmmsOwCNmdp91lURjnzxeOpdzRgOkF/IuiOkNV8lftuzXA9Fxd42qTm+6r3dskN9GDTT92IhTSJwz9H1OWDU/KnJ9frfC+6Zruu+TkVNdvskMbiqnr2fz5V4onCjxWcBzJejhDrGtdTJC2Ch6K8Zq2ybVLrgLgk5r6gFR9nzg+/kmns5FUwTQV45KHFGHTpU6jWG34jAZM76imZFy6NrnLrg0AQnzgLEoOK6NP+jYOo5GkZEzc0sR/oXY2btPzoDG3cVwTeMhhleSwiwALeTp91yXAokey7wCE5H98lzyuBFgIcshhZbmP5rDAWL1WR/4CLr9WrLc7Mb4Z9LqYrpM/vMnKuczlfw92/7QUj3cjmNyeT+1dJ9A7/5LD8CfR66qAXxkUBPumEApGAAAAAElFTkSuQmCC)

  Após o download, clique no texto "Pular para o console", na lateral esquerda.
- Para inserir os arquivos Firebase, clique em configurações adicionais.

  ![](/assets/images/img8-cc003cc00a9f353b1109e8330cb29e93.png)
- Insira o arquivo para a plataforma desejada

  ![](/assets/images/img9-53f2e7e766ed2c46ea4c443a18654bbb.png)

  Para iOS: GoogleService-Info.plist, para Android: google-services.json

  ### Upload
- Na tela que é aberta, localize o arquivo Firebase referente a plataforma e faça o upload.

  ![](/assets/images/img9.1-3d196bc7eda671b53c45a1a00d83d9a3.png)
- Agora, basta exportar para a plataforma desejada!

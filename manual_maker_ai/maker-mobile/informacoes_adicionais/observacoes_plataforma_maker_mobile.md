# Observações sobre a plataforma Maker Mobile

> Fonte: https://manual.softwell.com.br/docs/maker-mobile/informacoes_adicionais/observacoes_plataforma_maker_mobile

# Observações sobre a plataforma Maker Mobile

Abaixo, consta uma lista com características únicas para a plataforma **Maker Mobile**:

- Por padrão o **Maker** utiliza a fonte Ms sans Serif, embora o **Android** e o **iOS** não possuam essa fonte, o **Maker Mobile** as trata como Arial, sendo assim, variações no tamanho das descrições e demais locais onde haja o uso desta fonte poderão sofrer alteração de largura e altura.
- O componente botão permanece habilitado, independente de possuir ou não fluxos associados.
- No momento da criação de formulários que serão executados nos dispositivos, deverá ser observada a resolução para qual a aplicação será desenvolvida, pois apesar do **Maker Mobile** redimensionar o formulário para que o mesmo "encaixe" na tela, a depender do tamanho do mesmo e da resolução, alguns componentes podem ficar sobrepostos.
- O tamanho e o posicionamento dos componentes no **Maker Mobile** utilizam valor percentual, dessa forma não é possível determinar um tamanho fixo, pois o mesmo se ajusta de acordo com o tamanho da tela. Para configurar o redimensionamento selecione as opções Largura e altura ou Apenas Largura na tela de exportação.
- Ao se comparar campos no **Maker Mobile** é essencial que ambos os dados sejam do mesmo tipo.
- O tamanho de um campo varchar sempre é definido como *varchar(x)*, ou seja, o valor que for introduzido será alocado para o campo. A limitação do tamanho máximo deve ser definido no componente, pela propriedade Tamanho Máximo.
- Visando por um padrão de desenvolvimento de aplicações, o **Maker Mobile** utiliza como container o Webview da plataforma da aplicação, o mesmo provê boa parte das funcionalidades de acesso aos recursos nativos do dispositivo.

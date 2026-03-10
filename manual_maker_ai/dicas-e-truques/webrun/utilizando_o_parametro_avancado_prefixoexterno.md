# Utilizando o parâmetro de configuração PrefixoExterno

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/utilizando_o_parametro_avancado_prefixoexterno

# Utilizando o parâmetro de configuração PrefixoExterno

O parâmetro avançado PrefixoExterno é uma propriedade utilizada para definir quais IP’s não terão acesso ao Webrun. Abaixo será apresentado uma demonstração de utilização.

Primeiramente, será necessário definir qual sistema irá utilizar o parâmetro, neste exemplo será utilizado o sistema Treinamento\_maker\_bootstrap. Selecionado o sistema é hora de configurar o parâmetro, em seguida clique em configurações.

![image1905.jpg](/assets/images/image1905-54bf0b91b8988e7caeaf7dbea637c007.jpg)

Informe admin para o login, webrun para a senha e selecione Parâmetros de Configuração.

![image1909.jpg](/assets/images/image1909-1a68eb15439a0936690d0242a50bfa5a.jpg)

Clique sobre o grupo Sessão e adicione o parâmetro PrefixoExterno.

![image1906.jpg](/assets/images/image1906-ea1e90b0e6c8c121fa3886c85cea24ca.jpg)

Ao lado do parâmetro deve ser inserido o ip através de uma expressão regular, (Ex: 192\.168\.[0-9]3\.[0-9]3). Neste exemplo serão bloqueadas as tentativas de acesso ao sistema, IP’S que comecem com 192.168.

Informando todos os dados corretamente, clique sobre o botão Salvar e saia da tela de configuração.

Observe que usuários que possuem o ip iniciado por 192.168 ao tentarem logar no sistema, serão bloqueados.

Observações:

1. O usuário não deve ser administrador do sistema. (Administradores possuem acesso independente do parâmetro)

2. No cadastro do usuário o checkbox "Acesso externo" deve estar desmarcado. (Caso esteja marcado, o usuário terá acesso independente de qualquer parâmetro)

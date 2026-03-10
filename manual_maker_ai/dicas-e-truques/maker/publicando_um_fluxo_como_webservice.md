# Publicando um Fluxo como Webservice

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/maker/publicando_um_fluxo_como_webservice

# Publicando um Fluxo como Webservice

A partir da versão 3 do Maker e 3 do Webrun, foi implementada a "Publicação de Fluxo como WebService", ou seja, qualquer fluxo pode-se tornar um WSDL para ser consumido.

Clicando com o botão direito sobre um fluxo no inspetor de objetos, teremos disponível a opção "Publicar Fluxo como WebService".

![image1195.jpg](/assets/images/web14-a82ee2e6212901ad257c887491bb6caa.png)

Para que o o WebService possa ser consumido, deve-se definir a opção "Publicar Fluxo como WebService.

Feito isto, deve-se ir em Projeto/Salvar no menu do Maker, para que as alterações aplicadas ao fluxo sejam definidas.

Após o procedimento de "publicação do fluxo", deve-se reiniciar o servidor de aplicações e acessar o sistema, para que seja compilado e gerado o WSDL.

Acessando o endereço `http://ip:porta/contexto/webservices/` (Ex: `http://127.0.0.1:8037/webrun/webservices/`), temos uma lista de todos os serviços (Sistemas) e seus metodos disponíveis.

![image1193.jpg](/assets/images/web15-8a8aac24d4e8f801b872374d3fe2e03a.png)

Observe que em cada sistema, é listado abaixo dele os métodos disponíveis, caso exista.

O endereço do WSDL pode ser obtido clicando no botão "+" ao lado do sistema. Ex: `http://127.0.0.1:8037/webrun/webservices/P63Services.jws?wsdl`

O padrão de endereço do WSDL segue a forma:

`http://ip:porta/contexto/webservices/SiglaServices.jws?wsdl`

Onde Sigla = Sigla do sistema

Para fazer o consumo do WebService, deve-se utilizar a função "Chamar Servico WEB". Para mais informações sobre como utilizar a função, acesse [AQUI](/docs/dicas-e-truques/maker/exemplo_de_utilizacao_de_web_services_no_maker). A porta e nome do método pode-se obter acessando a url do WSDL (Para obter mais informações sobre o funcionamento acesse: <http://www.w3.org/TR/wsdl>). Por padrão, a porta sempre será: SiglaServices (Onde Sigla = A sigla do sistema). O nome do metodo será o nome do fluxo (Que não deve conter caracteres especiais nem espacamentos).

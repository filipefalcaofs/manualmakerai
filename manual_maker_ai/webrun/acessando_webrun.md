# Acessando Webrun

> Fonte: https://manual.softwell.com.br/docs/webrun/acessando_webrun

# Acessando Webrun

Para acessar o Webrun e suas opções de sistemas e configurações desenvolvidos no Maker, siga os passos:

1. Abra o navegador;
2. Na Barra de Endereço do navegador, digite `<nome da máquina ou IP>`:`<porta de acesso ao serviço>`
3. `<nome da máquina ou IP>` - nome da máquina ou o IP onde o serviço de aplicação Web está instalado;
4. `<porta de acesso ao serviço>` - a a porta padrão é 2020, mas, devem-se verificar as configurações definidas na tela [Atualizações e Configurações do Webrun](/docs/webrun/atualizacoes_configuracoes_webrun).

Exemplo: 127.0.0.1:2020/webrunstudio

![acesso_webrun1.jpg](/assets/images/acesso_webrun1-3bc3edc93837e328d3d82301276c9ff5.jpg)

Observação: O desenvolvedor pode configurar o site (pessoal ou corporativo) inserindo um link para acesso direto a um determinado sistema. Como exemplo: suponha que o sistema possui a sigla STC, o nome de usuário seja visitante e a senha 123, o link seria:  
http://`<ip ou nome do servidor>`/webrun/logon.do?sys=STC&user=visitante&password=123

Dessa forma, os usuários, clicando no link, terão acesso ao sistema sem necessidade de autenticação.

Na tela Sistemas, temos as opções:

- Escolha dentre os sistema disponíveis - este campo lista os projetos disponíveis na pasta systems. Para mais detalhes, acesse o tópico [Instalação do Maker](/docs/maker/instalacoes/instalacao_maker). Sobre a pasta de projetos, acesse o tópico [Acessando o Maker](/docs/maker/acessando_o_maker_3.0). Para atualizar a lista de projetos, obtenha mais informações no tópico [Atualizando a lista de sistemas do Webrun](/docs/webrun/atualizando_lista_sistemas_webrun).
- ![image237.jpg](data:image/jpeg;base64,/9j/4AAQSkZJRgABAAEAIQAaAAD//gAfTEVBRCBUZWNobm9sb2dpZXMgSW5jLiBWMS4wMQD/2wCEAAYEBAUEBAYFBQUHBgYHCRAKCQgICRMODgsQFxQYGBYUFhYZHCQfGRsiGxYWICsgIiYnKSkpGB4tMCwoMCQoKScBBgcHCQgJEgoKEicaFhonJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJ//EAaIAAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKCwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+foRAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/AABEIAAsAQwMBEQACEQEDEQH/2gAMAwEAAhEDEQA/ALer6je2v9takdWu5zaXbKunwzybtu8jccHIQf7PP0r4/DutjM2WClVdOMnL3r6aX91X0u+l9PU8eEObnqOV7P4U3f8A4b0/An0C8vn1Hw7ePrFwpvp1L6dJcOzIu7GTn+Ejs2Dz360RqVsPm7waqOcYSS5r6PbTe11s7XRUock6clPd/C3qv+B6lv4haF4luvG2qz2WovFbNcZRBdSLgYHYcdc1+xYPPcpw2DVCvC80nf3U979T6GhlOLruNaFuV+ZrqX3D5ZOv98/41+aKcr7s/Q5UqVnovuR0/ivwO/ibUYrtdf1PTglvHH5VpLtU/KDk+/P6CvlOLM/xGW4yFKktHG+77tdPQ+byXNIYOhKnKhCd3e8ld7LT0MX/AIVLL/0OOvf+BFfIf65Y7t+L/wAz3P8AWCl/0CU//AUcV+0ffap4X8PeELXTtXvoWRJYnmjnZHm2kAFiDyev51/VvhvClj8M6teCk3CD1V915n5tmdb2leVSK5btuy2Wuy8j0T4i3M9n8ErS+tppIbs29mTPGxWQk7MncOea+BzuTpzrcjtaT29T6rhKjTrZnThVipKz0autjK+Hd9d3fg3Tpri6mmlYPueRyzH943UmscDOUsPFt33/ADOniOhSpZpVhTiklbRKy+FFW78MaV/aU90Ld1n85n8xZnUg5PIweK82tgMNUnLmje7fc/OXRgp8y39WSaX4Z0qHV7W7S2bz1mDh2mdjuz1OTzVYbA4enUi4RtZ6bjhRhzqVtfmaHi7/AJGTUOSP3p713VoRc7s/R8trTjhYpPv+bMlM7hyevqayVOJ6DxFS2/4I1/H+kWl/rEEs4m3C0iUbJ3QYx6KQO9PG4PD15qVWCb/4LPLyPHV8Ph5QptWv2T6Lumc1/wAI3p3pc/8AgZL/APFVw/2Xg/8An2j3v7Wxfdf+Ax/yNX4h+FNH13w74ag1K0NxHa27CINM4K8+oOT0HWv0XhvF1sApRwz5VZLZPbbe5+a5g/a4icp7tvy6+R1XiWyg1HwJDpN1H5lkkUKiLJGAuMcjnsO9fNY6Ea0puet3f8T0snxNXC4qNSi7NX/LzKfhrSrPTtEtrW1h8uGPdtXcTjLE9SfU1GHpxhTUYrQ1zPF1sRi51Kju3bouyP/Z) - Escolha de Idioma - a opção de internacionalização do Webrun está disponível em Português, Inglês, Espanhol e Francês.

  - Internacionalização de campos monetários e datas. [Saiba mais](/docs/webrun/internacionalizando_valores_monetarios_e_datas).
- Botão **Configurações** - acesse uma série de opções para Configurações do Webrun. Identifique *admin* como usuário e *webrun* como senha;
- Botão **Acessar** - acessa um projeto selecionado no campo. Escolha dentre os sistemas disponíveis. Veja com mais detalhe o tópico [Efetuando logoff do usuário no sistema](/docs/webrun/efetuando_logoff_usuario_sistema).

Observações:

1. No idioma brasileiro ao realizarmos uma operação com números fracionados, é necessário a utilização da (","). Caso o usuário queira utilizar o ("."), o idioma do Webrun deve ser alterado para inglês. Como solução para que o usuário não coloque ("."), pode ser utilizado a propriedade Conteúdo do componente e selecionando Número, dessa forma os usuários não vão poder utilizar o ponto.
2. A Softwell Solutions não recomenda a utilização de navegadores legados como Internet Explorer inferior a versão 9 (Maker 3.6+) e Firefox versão 22. Por ser uma versão antiga o comportamento regular de alguns componentes do Webrun podem ser afetados.
3. O navegador Internet Explorer 9 não é suportado a partir da versão 3.6+ do Maker/Webrun por não fornecer suporte aos principais recursos de HTML5 e CSS3.
4. O Sistema que não possuir imagem principal definida, utilizará a imagem padrão do Webrun que fica em C:\Arquivos\_de\_programas\Softwell\_Solutions\Maker\_3\Webrun\_3\tomcat\webapps\webrun\Skins\Default\background.jpg.

# Como editar os serviços do Webrun manualmente

> Fonte: https://manual.softwell.com.br/docs/webrun/como_editar_servicos_webrun_manualmente

# Como editar os serviços do Webrun manualmente

Alterando a memória inicial e máxima do Apache Tomcat:

1. Clique em Iniciar (do Windows) e clique em Executar. Na janela que se abrirá, digite services.msc e pressione a tecla Enter.
2. Localize o serviço Webrun Studio Bootstrap, clique com o botão direito e selecione a opção Propriedades.
3. No campo Caminho do executável, copie o endereço:

![image325.jpg](/assets/images/image325-59b1b03a46e3e2ca2023e98b99f23522.jpg)

4. Retorne ao botão Iniciar (do Windows) e clique em Executar. Na janela, cole o caminho do executável.
5. Modifique o nome do executável para tomcat9w.exe e o parâmetro de RS (Run Service) para ES (Edit Service):

![image326.jpg](/assets/images/image326-e91a5da9315d6b59f5e2d9e0a4f68deb.jpg)

6. Na janela que se abrirá, vá para a aba Java, altere a memória inicial (Initial memory pool) e a memória máxima (Maximum memory pool) para a metade da quantidade memória da máquina (Ex.: 1024 cada um) e clique em Aplicar.

![image327.jpg](/assets/images/image327-c1f2f9193a0976fb5169505ee2605b23.jpg)

7. Na aba General, clique em Stop para parar o serviço, depois em Start para iniciá-lo novamente.

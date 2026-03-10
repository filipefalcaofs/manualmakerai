# Alterando a memória inicial e máxima do Apache Tomcat (Windows)

> Fonte: https://manual.softwell.com.br/docs/webrun/servidores_de_aplicacoes/Tomcat/alterando_memoria_inicial_maxima_apache_tomcat_windows

# Alterando a memória inicial e máxima do Apache Tomcat (Windows)

1. Ative a janela Executar, a partir do botão Iniciar, e execute o comando services.msc.
2. Localize o serviço Webrun Studio Bootstrap, clique com o botão direito do mouse, selecione Propriedades.
3. Copie o caminho do executável.
4. Retorne para janela Executar e cole o caminho do executável.
5. Modifique o nome do executável para tomcat7w.exe e o parâmetro de RS (Run Service) para ES (Edit Server).
6. Na janela que se abrirá, na aba Java, altere a memória inicial (Initial memory pool) e a memória máxima (Maximum memory pool) para a metade da quantidade memória da máquina ( Ex.: 1024 cada) e clique em Aplicar.
7. Volte para a aba General, clique em Stop para parar o serviço, depois em Start para iniciá-lo novamente.

**Para mais informações detalhadas acesse:** [Como editar os serviços do Webrun manualmente.](/docs/webrun/como_editar_servicos_webrun_manualmente)

Observação: Na instalação do Maker (DVD de Instalação), é detectada e avaliada a quantidade de memória: sempre definida a metade que a máquina permite. Caso a máquina tenha menos que 256 Mb de memória, o Webrun não funcionará corretamente.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

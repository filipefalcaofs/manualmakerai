# Como replicar as atualizações para outros computadores

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/como_replicar_atualizacoes_outros_computadores

# Como replicar as atualizações para outros computadores

Após atualizar o servidor, faça na(s) máquina(s) destino:

Sugestão: Antes da atualização, recomenda-se que seja feito um backup dos arquivos da pasta C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap .

1. Acesse a pasta Softwell Solutions e a subpasta Maker Studio Bootstrap, em seguida a pasta Webrun Studio Bootstrap e dentro desta opção, clique em WebRunAdmin e pare o serviço utilizando o botão ![image413.jpg](/assets/images/image4135-88916f3a547089bce270460cdec65a91.jpg).
2. Apague a pasta Work que está localizada em C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat (Diretório Padrão).
3. Apague as seguintes pastas e arquivos: webrunstudio e webrunstudioutf8 que estão localizadas em C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps (Diretório Padrão).
4. Acesse a pasta ...\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps do computador de origem e copie os arquivos webrunstudio.war e webrunstudioutf8.war.
5. Substitua os arquivos webrunstudio.war e webrunstudioutf8.war da máquina que será atualizada (estão localizados em C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps).
6. Retorne a tela Configuração da WebRunAdmin, e reative o serviço.

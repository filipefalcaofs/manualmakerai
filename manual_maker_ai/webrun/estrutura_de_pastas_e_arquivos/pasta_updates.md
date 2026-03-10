# Pasta UPDATES

> Fonte: https://manual.softwell.com.br/docs/webrun/estrutura_de_pastas_e_arquivos/pasta_updates

# Pasta UPDATES

Localizada em C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\updates, é o diretório onde encontramos a atualização automática do Webrun. Ele está composto pelos arquivos update.exe, update.URS, update.Lang, e pelo arquivo de atualização webrun.war.

Observe o que ocorre:

1. Acione a tela Configurações do Webrun (arquivo webrunadmin.exe, localizado na pasta C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap) e clique no botão (é executado o update.exe);
2. Devidamente configurado o proxy (caso necessário), o aplicativo verifica as atualizações no servidor da Softwell e inicia o download das atualizações necessárias incluindo o arquivo webrun.war;
3. Após o download, encerra o aplicativo Update Webrun;
4. O serviço do Servidor de Aplicações Web é parado;
5. São excluídos:
6. O arquivo webrun.war da pasta C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps;
7. As pastas C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps\webrun e C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\work;
8. O novo arquivo webrun.war é posto na pasta  C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps;
9. São recriadas as estruturas de pastas C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\webapps\webrun e C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\tomcat\work.
10. É reiniciado o serviço do Servidor de Aplicações Web;
11. Ao acessar o Webrun, é verificada se a pasta Maker.Commons existe em C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\systems para retornar as configurações personalizadas do usuário.

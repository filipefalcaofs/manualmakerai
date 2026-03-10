# Instalação do Webrun na distribuição Linux Ubuntu ou Fedora

> Fonte: https://manual.softwell.com.br/docs/webrun/webrun_no_linux/instalacao_webrun_distribuicao_linux_ubuntu_ou_fedora

# Instalação do Webrun na distribuição Linux Ubuntu ou Fedora

Premissas

1. Para a perfeita execução dos comandos, subentende-se que a máquina foi formatada com a distribuição do Linux Ubuntu ou Fedora e não possui nenhum serviço Web ativo ou instalado.
2. A senha root - Para algumas tarefas de configuração no Linux, será necessária a senha root. Caso não saiba, recrie.
3. Criar a estrutura de diretórios e arquivos:

   1. Abra Terminal: acesse o menu Applications - System Tools - Terminal (é importante observar se o prompt identifica o usuário-padrão, caso não, deve-se logar com a identificação do usuário padrão da instalação);
   2. Abra a pasta principal do usuário digitando o comando cd ~ e pressione a tecla ENTER;
   3. Crie a pasta softwell digitando o seguinte comando: mkdir softwell e pressione a tecla ENTER;
   4. Abra a pasta softwell digitando o seguinte comando: cd softwell/ e pressione a tecla ENTER;
   5. Crie a pasta maker digitando o seguinte comando: mkdir maker e pressione a tecla ENTER;
   6. Crie a pasta webrun digitando o seguinte comando: mkdir webrun e pressione a tecla ENTER;
   7. Abra a pasta webrun digitando o seguinte comando: cd webrun/ e pressione a tecla ENTER.

Observação: Os passos seguintes utilizarão alguns arquivos e pastas. Sugerimos que os copie para Desktop: jdk-7-linux-i586.bin, Apache-7.tar.gz (arquirvos que podem ser obtidos pela Internet), pastas config, reports e systems. Essas pastas podem ser obtidas do diretório `<driver>`:\DVD\_IMAGE\Setup\program files\Softwell Solutions\Maker 3\Webrun 3 do DVD de instalação do Maker 3:

![image324.jpg](/assets/images/image324-96bc7d6b9a088a015a78834aa40d8e54.jpg)

8. Copie o Instalador do Java para o diretório local (supondo que se encontra no Desktop da máquina atual), digite o comando: cp /home/softwell/Desktop/jdk-7-linux-i586.bin e pressionando a tecla ENTER;
9. Deve-se garantir a permissão para a instalação do arquivo criado. Digite o comando: chmod +x jdk-7-linux-i586.bin e pressione a tecla ENTER;
10. Execute a instalação do jdk-7-linux-i586.bin digitando o comando: ./jdk-7-linux-i586.bin e pressione a tecla ENTER;
11. Digite a letra Q para sair do texto Termos de Licença:
12. Aceite os termos digitando a palavra yes e pressione a tecla ENTER;
13. Pode-se apagar o instalador jdk-7-linux-i586.bin digitando o comando: rm jdk-7-linux-i586.bin e pressione a tecla ENTER;
14. Copie o Apache-TomCat-7.tar.gz para o diretório local (supondo que se encontra no Desktop da máquina atual). Digite o seguinte comando: cp /home/softwell/Desktop/ Apache-TomCat-7.tar.gz, e pressione a tecla ENTER;
15. Execute e desempacote o arquivo Apache-TomCat-7.tar.gz, digitando o seguinte comando: tar –xzf Apache-TomCat-7.tar.gz e pressione a tecla ENTER;
16. Acesse usuário root, digitando o comando su, e pressione a tecla ENTER;
17. Digite a senha root e pressione a tecla ENTER;
18. Como root, execute o seguinte comando: vi /etc/profile e pressione a tecla ENTER;
19. Acesse o modo de inserção utilizando a tecla INSERT;
20. No final do arquivo, adicione as seguintes linhas:

JAVA\_HOME=/home/`<nome usuário padrão>`/softwell/webrun/jdk7 `<ENTER>`

CATALINA\_HOME=home/`<nome usuário padrão>`/softwell/webrun/apache-tomcat-7 `<ENTER>`

TOMCAT\_HOME=home/`<nome usuário padrão>`/softwell/webrun/apache-tomcat-7 `<ENTER>`

PATH=$JAVA\_HOME/bin:$PATH `<ENTER>`

CLASSPATH=.:$JAVA\_HOME/lib:$CLASSPATH `<ENTER>`

`export` JAVA\_HOME `<ENTER>`

`export` PATH `<ENTER>`

`export` CATALINA\_HOME TOMCAT\_HOME CLASSPATH

21. Saia do modo de inserção com a tecla ESC;
22. Digite o comando para gravar e sair do modo de edição: :wq e pressione a tecla ENTER;
23. Acesse a pasta webrun, digitando o seguinte comando: cd /home/`<nome usuário padrão>`/softwell/webrun/ e pressione a tecla ENTER;
24. Copie o arquivo WEBRUN.WAR (supondo que se encontra no Desktop da máquina atual), digitando os comandos:

cd apache-tomcat-7/webapps/ `<ENTER>`

cp /home/softwell/Desktop /webrun.war `<ENTER>`;

25. Deve-se criar o arquivo WEBRUN.INI. Execute os comandos:

cd /usr/lib/ e pressione a tecla ENTER;

vi webrun.ini e pressione a tecla ENTER;

26. Entrar no modo de inserção com a tecla INSERT. Digite o conteúdo do arquivo:

[DIR] `<ENTER>`;

InstallDir=/home/`<nome do usuário padrão>`/softwell/webrun

27. Saia do modo de inserção com a tecla ESC;
28. Digite o comando :wq e pressione a tecla ENTER para gravar e sair;
29. Copie as pastas necessárias ao WEBRUN, que são: config, reports e systems, (supondo que se encontram no Desktop da máquina atual) e digite os comandos. Acesse a pasta WEBRUN digitando o seguinte comando:

cd /home/`<nome do usuário>`/softwell/webrun e pressione a tecla ENTER

cp -r /home/softwell/Desktop/config/ e pressione a tecla ENTER (este comando copiaria a pasta config para a pasta local WEBRUN)

cp -r /home/softwell/Desktop/reports/ e pressione a tecla ENTER (este comando copiaria a pasta reports para a pasta local WEBRUN)

cp -r /home/softwell/Desktop/systems/ e pressione a tecla ENTER (este comando copiaria a pasta systems para a pasta local WEBRUN)

4. Inicie o servidor WEB como root utilizando os seguintes comandos:

cd apache-tomcat-7/bin/ `<ENTER>`

/startup.sh `<ENTER>`

Observação: Para finalizar o serviço, execute o comando ./shutdown.sh e pressione a tecla ENTER.

Veja: [Versões Homologadas](/docs/FAQ/versoes_homologadas)

# Como configurar Conexão Remota no SQL Server 2005/2008/2008R2/2012

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/banco_de_dados/como_configurar_conexao_remota_sqlserver2005

# Como configurar Conexão Remota no SQL Server 2005/2008/2008R2/2012

1º Passo:

Para permitir que computadores acessem instâncias do SQL Server em outra máquina, a primeira coisa a ser feita é uma configuração na instância que receberá as conexões remotas, em nosso caso, o SQLEXPRESS no servidor APOLO\SQL 2005/2008/2008R2/2012 (como exemplo).

![image402.jpg](/assets/images/sql4-5abe0132c4eff06d623794fbdbc9e236.png)

Para fazer isso, conecte-se localmente na instância do servidor, clique com o botão direito na instância conectada e aponte o mouse para Propriedades.

![image403.jpg](/assets/images/sql5-b09803eb89ade9af240c8bfbce92b366.png)

Depois de acessar a tela Server Properties, da instância do SQL Server, escolha, no menu da esquerda, a opção Connections. Na parte direita da tela, referente a Conexões, procure a opção Permitir conexões remotas com esse servidor. server. Deixe essa opção marcada e clique em OK.

![image404.jpg](/assets/images/sql6-e44db6fc24a580270543367809cbe1a6.png)

2º Passo:

Configurando o TCP/IP, vamos utilizar agora outra ferramenta, SQL Server Configuration Manager. Nessa ferramenta, utilizaremos o recurso Configuração de Rede do SQL Server 2005/2008/2008R2/2012 (SQL Server 2005/2008/2008R2/2012 Network Configuration), que se encontra no menu da esquerda. Ao expandir esse item, encontramos os Protocolos para SQLEXPRESS (Protocols for SQLEXPRESS). Ao clicar nele, algumas opções se abrirão do lado direito da tela. Nas opções disponibilizadas, devemos deixar o protocolo TCP/IP com status de Habilidado (Enabled). Para fazer isso, clique com o botão direito do mouse. Após isso, ele aparecerá configurado.

![image408.jpg](/assets/images/sql7-148cc540e950e180483c1003389894c2.png)

Depois de configurar o status para Habilitado (Enabled), mais duas verificações devem ser feitas nas propriedades do protocolo TCP/IP. Para acessar essas configurações, clique com o botão direito do mouse em TCP/IP e, em seguida, em Propriedades. Uma tela com duas abas superiores se abrirá. A primeira aba Protocolo (Protocol) deve ficar com a propriedade Habilitado (Enabled) configurada para Sim (Yes).

![image409.jpg](/assets/images/sql8-e9570a045cef718b931726df03136251.png)

Na segunda aba, Endereços IP (IP Addresses), devemos garantir que as propriedades Ativo (Active) e Habilitado (Enabled) estejam configuradas para Sim (Yes) e a Porta TCP com o valor 1433. Isso deve ser realizado no endereço ip que é utilizado pelo banco. Por exemplo, na imagem abaixo, se o ip utilizado for o 192.168.1.102, as configurações devem ser aplicadas para o IP2.

![image410.jpg](/assets/images/sql9-6f600114a2ca8f980290ebcedaf5ff3e.png)

Após garantirmos essas configurações, clicamos em OK para salvar nossas alterações.

3º Passo:

Para iniciar o serviço do SQL Server Browser, utilizaremos novamente a ferramenta SQL Server Configuration Manger. Para acessar a área que controla os serviços do SQL Server, no menu da esquerda, será utilizado o item Serviços de SQL Server 2005/2008/2008R2/2012 (SQL Server 2005/2008/2008R2/2012 Services). Na parte direita da tela, os serviços relacionados com SQL Server são apresentados. O serviço Navegador do SQL Server (SQL Server Browser) encontra-se com seu Estado (State) configurado para Parado (Stopped). Para iniciar o serviço, clique com o botão direito do mouse no serviço e, em seguida, clique em Iniciar (Start). Esse processo levará alguns instantes, e o estado antigo passará a ser Em execução (Running).

![image411.jpg](/assets/images/sql10-7a151a5705dd4a3f065aeb1e362f77ca.png)

Após a inicialização do serviço do Navegador do SQL Server (SQL Server Browser) e as configurações de liberação para acesso remoto e de TCP/IP, o serviço da instância do SQL Server deve ser reiniciado para que as alterações tenham efeito. Para fazer isso, na mesma tela onde foi iniciado o serviço do Navegador do SQL Server (SQL Server Browser), selecione o serviço do SQL Server (SQLEXPRESS), clique com o botão direito do mouse e aponte para Reiniciar (Restart). Aguarde alguns instantes a parada e a inicialização do serviço. Lembre-se de que SQLEXPRESS é a instância do SQL Server do servidor que utilizamos como exemplo.

![image412.jpg](/assets/images/sql11-ccb9c00b83e03c93233ea42bb04e1155.png)

Observações:

1. Para que as conexões remotas funcionem no SQL Server 2005/2008/2008R2/2012, o Firewall da rede deve ter exceções para as instâncias do SQL Server 2005/2008/2008R2/2012 e o serviço do Navegador do SQL Server (SQL Server Browser).

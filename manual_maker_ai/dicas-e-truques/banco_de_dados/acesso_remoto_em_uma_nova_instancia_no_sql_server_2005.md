# Acesso remoto em uma nova Instância no MS SQL Server 2008R2/2012/2014

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/banco_de_dados/acesso_remoto_em_uma_nova_instancia_no_sql_server_2005

# Acesso remoto em uma nova Instância no MS SQL Server 2008R2/2012/2014

Para compartilhar projetos que utilizem banco de dados MS SQL Server, com instância, em uma rede, são necessárias algumas configurações:

- Na tela de Serviços do Windows, a opção Navegador do SQL Server deve está rodando para permitir o acesso remoto.

![image728.jpg](/assets/images/sql1-541766a7842e98517b3389d45e752bde.png)

- Com o serviço Navegador do SQL Server ativo, abra o SQL Server Configuration Manager.
- Em Configuração de rede do SQL Server MS SQL Server 2008R2/2012/2014, aparecerão as instâncias do seu banco de dados. Clique nas instâncias e, no lado direito, habilite o protocolo TCP/IP.

![image729.jpg](/assets/images/sql2-85e0a8de511747ca01c749d0a94bb8db.png)

- Em Configuração do SQL Native Client, clique em Protocolo de Cliente. Ao lado aparecerão algumas configurações para Protocolo Cliente onde serão habilitados os protocolos Pipes Nomeados e TCP/IP.

![image730.jpg](/assets/images/sql3-1791e1a1b612f7b2d1b866f97e6f1d57.png)

# Configurando instâncias para projetos no SQL Server

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/banco_de_dados/configurando_instancias_para_projetos_no_sql_server

# Configurando instâncias para projetos no SQL Server

Para utilizar as configurações não usuais, por exemplo, porta diferente, múltiplas instâncias, entre outras, é necessário personalizar o seu arquivo [database.xml](/docs/webrun/estrutura_de_pastas_e_arquivos/Pasta_CONFIG/arquivo_databases_xml).

## Como usar instâncias no MS SQL Server

1. Ative a tela [Configurações](/docs/maker/configuracoes) e adicione um parâmetro chamado instance. ao arquivo de projeto (WFRE): instance=`<nome da instância definida na instalação do SQL Server>`. Exemplo:

![image1547.jpg](/assets/images/sql17-c4080d537257f403aff730adf4c4284c.png)

Isso irá instruir o Webrun a usar o valor do parâmetro instance na composição da string de conexão.

2. Personalizar o seu arquivo [database.xml](/docs/webrun/estrutura_de_pastas_e_arquivos/Pasta_CONFIG/arquivo_databases_xml). que se encontra na pasta C:\Arquivos de programas\Softwell Solutions\Maker 3\Webrun 3\config. A string de conexão ficará parecida como:

```prism-code
<group>  
	<group-name>MSSQL</group-name>  
	<item>  
		<item-name>Driver</item-name>  
		<item-param>net.sourceforge.jtds.jdbc.Driver</item-param>  
	</item>  
	<item>  
		<item-name>URL</item-name>  
		<item-param>jdbc:jtds:sqlserver://$HostName$:$Port:1433$/$DataBase$;**instance=$instance$**;charset=$SQLServerCharSet:iso-88$</item-param>  
	</item>  
</group>
```

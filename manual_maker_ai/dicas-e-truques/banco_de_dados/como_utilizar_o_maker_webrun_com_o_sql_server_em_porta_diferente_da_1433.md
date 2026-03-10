# Como utilizar o Maker/Webrun com o SQL Server em porta diferente da 1433

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/banco_de_dados/como_utilizar_o_maker_webrun_com_o_sql_server_em_porta_diferente_da_1433

# Como utilizar o Maker/Webrun com o SQL Server em porta diferente da 1433

Para utilizar o Maker/Webrun com uma porta diferente da convencional no banco SQL server, os seguintes passos devem ser tomados:

1. No arquivo databases.xml, que se encontra na pasta c:\Arquivos de Programa\Softwell Solutions\Maker 3\WebRun 3\config, encontre o grupo "MSSQL":

```prism-code
<group-name>MSSQL</group-name>
```

2. No item URL, trocar o parâmetro `$HostName$` por `$HostName2$`

Ou seja:

```prism-code
<item>  
  
<item-name>URL</item-name>  
  
<item-param>jdbc:jtds:sqlserver://$HostName2$:$Port:1433$/$DataBase$;charset=$SQLServerCharSet:iso-8859-1$;useLOBs=false;sendStringParametersAsUnicode=false;useCursors=true</item-param>  
  
</item>
```

3. No item ServerField, trocar o parâmetro "HostName" por "HostName2", ficando:

```prism-code
<item>  
  
<item-name>ServerField</item-name>  
  
<item-param>HostName2</item-param>  
  
</item>
```

1. Salve o arquivo database.xml.
2. Altere o parâmetro "HostName" no WFRE (Apontador) para: IP,PORTA (Ex: `192.168.1.112,1723`).
3. Adicione o parâmetro "HostName2" no WFRE (Apontador) com o valor: IP (Ex: `192.168.1.112`).
4. Adicione o parâmetro "Port" no WFRE (Apontador) com o valor: PORTA (Ex: `1723`).
5. Salve o WFRE, e em seguida, reinicie o servidor de aplicações.

Observação: Ao utilizar conexões adicionais,deve-se acrescentar o parâmetro "HostName2" ao WFRE e informar o mesmo valor do parâmetro "HostName".

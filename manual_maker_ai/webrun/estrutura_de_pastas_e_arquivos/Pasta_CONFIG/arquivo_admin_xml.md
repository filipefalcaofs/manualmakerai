# Arquivo ADMIN.XML

> Fonte: https://manual.softwell.com.br/docs/webrun/estrutura_de_pastas_e_arquivos/Pasta_CONFIG/arquivo_admin_xml

# Arquivo ADMIN.XML

Neste arquivo, é possível fazer a alteração do Login e da Senha do administrador que tem acesso às Configurações no Webrun. Este arquivo encontra-se na pasta C:\Arquivos de programas\Maker Studio Bootstrap\Webrun Studio Bootstrap\config.

```prism-code
<?xml version="1.0" encoding="UTF-8"?>  
<config>  
	<group>  
		<group-name>Administrador</group-name>  
		<item>  
			<item-name>login</item-name>  
			<item-param>admin</item-param>  
		</item>  
		<item>  
			<item-name>senha</item-name>  
			<item-param>webrun</item-param>  
		</item>  
	</group>  
</config>
```

A alteração do Login ocorre na linha renomeando ’admin’:

```prism-code
<item-param>admin</item-param>
```

A alteração da senha ocorre na linha renomeando ’webrun’:

```prism-code
<item-param>webrun</item-param>
```

Observação: Depois que é feita a alteração, deverá reiniciar o Webrun.

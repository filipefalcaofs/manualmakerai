# Problema com permissão ao empacotar projeto com banco SQL Server 2005?

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/banco_de_dados/problema_com_permissao_empacotar_em_sql_server_2005

# Problema com permissão ao empacotar projeto com banco SQL Server 2005?

Execute o comando abaixo para dar a permissão necessária para [Empacotar](/docs/maker/empacotando_projetos) projetos:

use [master]

GO

GRANT EXECUTE ON [sys].[sp\_OACreate] TO [DOMÍNIO\Usuário]    // Domínio e usuário da rede.

GO

GRANT EXECUTE ON [sys].[sp\_OADestroy] TO [DOMÍNIO\Usuário]

GO

GRANT EXECUTE ON [sys].[sp\_OAGetErrorInfo] TO [DOMÍNIO\Usuário]

GO

GRANT EXECUTE ON [sys].[sp\_OAGetProperty] TO [DOMÍNIO\Usuário]

GO

GRANT EXECUTE ON [sys].[sp\_OAMethod] TO [DOMÍNIO\Usuário]

GO

GRANT EXECUTE ON [sys].[sp\_OAStop] TO [DOMÍNIO\Usuário]

GO

GRANT EXECUTE ON [sys].[sp\_OASetProperty] TO [DOMÍNIO\Usuário]

GO

sp\_configure 'show advanced options', 1;

GO

RECONFIGURE;

GO

sp\_configure 'xp\_cmdshell', 1

GO

sp\_configure 'Ole Automation Procedures', 1;

GO

RECONFIGURE;

GO

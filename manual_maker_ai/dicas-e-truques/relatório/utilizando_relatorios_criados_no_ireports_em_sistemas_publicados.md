# Utilizando relatórios criados no Ireports em sistemas publicados

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/relatório/utilizando_relatorios_criados_no_ireports_em_sistemas_publicados

# Utilizando relatórios criados no Ireports em sistemas publicados

Por padrão o Webrun não leva os relatórios da pasta Bridge automaticamente quando o sistema é publicado, por isso é necessário que o usuário faça essa integração manualmente. Para executá-la os seguintes passos devem ser seguidos:

1. Publicar o sistema.
2. Remover a pasta softwell que se encontra no diretório "c:\Documents and settings\All users" .
3. Copiar a pasta Bridge que se encontra no diretório "c:\Arquivos de programas\Softwell Solutions\ Maker 3\Webrun3\reports .
4. Colar a pasta Bridge para o seguinte diretório "...\tomcat\webapps\`<NOMEDOWAR>`\system\reports .
5. Reiniciar o servidor de aplicações.

É possível efetuar este processo de outra maneira, seguindo os seguintes passos:

1. Copie a pasta "bridge" que se encontra no diretório "c:\Arquivos de programas\Softwell Solutions\ Maker 3\Webrun3\reports".
2. Cole a pasta "bridge" no diretório "c:\Documents and settings\All users\`<guid>`\reports.".
3. Reinicie o Webrun.

Seguindo tais passos o usuário não irá perder suas configurações personalizadas.

Observações:

1. É necessário que os parâmetros do relatório feito Ireports tenham a mesma quantidade e estejam na mesma ordem dos parâmetros que foram criados no relatório do Maker.
2. O perfil dos usuários do sistema é perdido pois a pasta "Softwell" é deletada. Com isso o usuário deve fazer novamente as configurações do perfil.

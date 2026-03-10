# Habilitando a exibição de tabelas com prefixo AAA

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/habilitando_a_exibicao_de_tabelas_com_prefixo_aaa

# Habilitando a exibição de tabelas com prefixo AAA

O Maker, por padrão, não consegue visualizar as tabelas de prefixo AAA\_\* após sincronizar o dicionário de dados.

Caso queira habilitar estas tabelas, siga os seguintes passos:

1. Vá ao diretório onde se encontra o arquivo \*.ini de configuração do Maker:

C:\Documents and Settings\`<identificação do usuário>`\Configurações locais\Dados de aplicativos\Softwell Solutions\Maker Bootstrap\

Onde a `<identificação do usuário>` é o seu usuário no Windows.

2. Abra o arquivo Maker3.ini;
3. Localize a linha [MAKER];
4. Insira o parâmetro que segue, dentro deste grupo:

IgnoreAATables=0

![image865.jpg](/assets/images/exi2-4dab6d0fea5a684adb63d0f1ec350107.png)

5. Feche o Maker e abra novamente.

Após sincronizar novamente o dicionário de dados, ficará acessível a visualização das tabelas de prefixo AAA\_\*.

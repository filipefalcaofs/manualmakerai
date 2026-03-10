# Instalação do Maker

> Fonte: https://manual.softwell.com.br/docs/maker/instalacoes/instalacao_maker

# Instalação do Maker

> Faça o download do Maker 5 agora mesmo. [clicando aqui](https://s3.us-east-1.amazonaws.com/download.softwell.com.br/maker5/maker5/instalador/m5woKieLp0HyiNGL0impY4r.zip)

Para a instalação do Maker e do banco de dados PostgreSQL, será necessário um computador que tenha, no mínimo, a seguinte configuração:

- Computador 2 Ghz ou superior;
- 4Gb de Memória RAM;
- HD com 5Gb ou mais de espaço livre;
- Resolução 1024 × 768 ou superior;
- Sistema Operacional Windows 10 ou superior

Para a execução do Webrun (serviço do produto), considerando que ele interpretará um sistema de pequeno porte, são requisitos mínimos:

- Computador 2 Ghz ou superior;
- 1Gb de Memória RAM;
- HD com 5Gb Mb ou mais de espaço livre;
- Resolução 1024 × 768 ou superior;
- Sistemas Operacionais Homologados (Windows ou Linux)

A Softwell Solutions garante que o produto Webrun é compatível com o sistema operacional Linux. Vários clientes utilizam Linux, mas devido à existência de variadas distribuições e por se tratar de um ambiente não muito intuitivo e que exige profundo conhecimento do desenvolvedor, informamos que não fornecemos suporte a Linux.

Observe os passos da instalação:

1. O Maker Studio Bootstrap - Instalador prepara o ambiente para instalação.
2. É exibido no painel o conteúdo da instalação, onde será possivel aceitar o Acordo de Licença e mudar o diretório de instalação através do botão ![image4.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFMAAAAXCAYAAAB3e3N6AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAI2SURBVFhH7ZmxbuowFIb/gJSNlSdIB8ITZGKliyfe4HZCYrmZ+gRM3CUSE7xBpyw3a6cMzAlDMzIgIWYQEnCPjQNpRNNb4rQD/iSLOHZw/J//HCNhrFar43K5xHa7xeFwgOY2Go0GjNlsdmw2m+CtXq/LIc1X2O/3WK/XMBaLhRBTUx5js9kctSPVUNNCqqMmPzUK0GIqRIupEC2mQr4oZoC+acLMto6HRI7eOzc408Eo3mG3O7W49wK7H8ix+6Z0mluPPTjRG7mTu7YDL/DQEa7t0x0iSfu80fg7G+ecLoIiv+c8L9u/tkbuO6hdYnttfnWUFjP44yJsP8ASvRDuEJgK147R5ZuxXbR96WS/DddON5TA6zBMnnzp8hgj8KB8Rn6NLsbiWrZ4hIhlRcvPr44bxKSXsy8uYCAxxukrUgmYDqSwROBjgiewdLjLqDeBz3ea/MVLSPN/p4MWBuPMsx+SW0OQcScFL0SEt3NUrs2vhtI18yLkBzitzEYstBx5mcxp0208lN4lF5IhGsXynXwK2M9QOs0/JZxnUjfBPJSXVovCogDp/ufBd3ivmGrFlGk9TE+TbNpbj+g5E7DzaUE1tM9/ZnH3hpjLRxJvSM8UIIKSSWuxRhG8VlM5yK5b2P9/KnYmHQ50IFCRPdUzFlGJSA8BqpGvlJITJuuvDRf8IKP7zxQCxu+Z+IVecdpaA0zFEqf5po8fS3OD6sxRXmtKUn3NvCO0mArRYiqkxv8M0qgA+AeUKP2cxZU7mAAAAABJRU5ErkJggg==). Na próxima tela poderá escolher os componentes que deseja instalar.

![](/assets/images/image004-dd21ffa25e4b704be593e56825cba2c0.png)

São itens da instalação:

1. Maker Studio Bootstrap - instala os arquivos da ferramenta na pasta padrão (C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap) ou em uma pasta especificada pelo usuário;
2. Webrun - Instala o servidor de aplicações do Maker Studio Bootstrap. Todos os sistemas são interpretados pelo Webrun por meio de um navegador WEB:
3. Banco de dados PostgreSQL - Instala o serviço e o gerenciador padrão do banco de dados (o nome do usuário master é postgres e a senha é Maker@1). São disponibilizados dois sistemas. Exemplo: Sistema de Controle de Estoque e Sistema de Chat ([também disponível no site da Softwell](http://www.softwell.com.br)), será possível visualizar pelo nome de usuário master e a senha 1 (um). A mesma identificação e senha são usadas para os novos projetos desenvolvidos no Maker;

Observações:

1. Caso o usuário possua o PostgreSQL instalado, deve ser desabilitado o item Banco de dados PostgreSQL.
2. A instalação é 100% LOCAL
3. É necessário que o sistema de arquivos da partição no qual será instalado PostgresSQL seja NTFS.
4. Para usuários de rede cuja identificação contenha espaços ou acentos, ocorrerá erro de acesso ao Gerenciador de Banco de Dados PostgreSQL.
5. Para obter informações sobre todas as senhas utilizadas, acesse o tópico [Senhas Padrão](/docs/maker/instalacoes/senhas_padrao).
6. [Para usuários que utilizem o SQLServer 2005/2008, deve habilitar o protocolo TCP / IP e definir o valor 1433 para a porta TCP](/docs/dicas-e-truques/banco_de_dados/como_configurar_conexao_remota_sqlserver2005);
7. Na próxima tela, o usuário inicia a instalação.
8. Por fim, clique no botão ![image8.jpg](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAAAUCAYAAAATMxqtAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAUSSURBVFhH7VjZbttGFD1cRUrWRkrWYqWymzh1bQQwUPep/9q/8FcEBgIUiYMgTqTIqxZKokiKO3tnqvq9gGggjQ9gjDic4XDOPffMNYUw8jI8Y2sQN+0ztoRnQreMZ0K3jFwJVWQZiqDDdxZQMh2IQyBUoUgFZAEtHceQEx1JuIIU60hDDwp0fh+hQq0EISpAgk/jFSDxEDr04EiAGBdorAjXypAELsRIx/31AJFL60oK1suQ1hYghLTuEyLXQ+luMkWtXkJJM+D6FrJERamkYrFcQtfKiKIMmi5CQAF+YCNNKACKAN8PoWlFiCLdEwPYSx8Ns0xjiEgxhSyrqNZK+PplCIP6XSeEKEe0Tg1B7CBLBXo2BYvGqQUiNRY2b5Q/clEoI8JzfezWTRg7DSiigKpuor/XhWd7KKlFlAoqYn8FMclgjW+QBhHqZQ1imqBa0iAkPr8vZxKKqgTXdiFlIQLXIUV68Fdr6IoKKSXlxglSn9ZcuSgIJbiLNXqtF9BljZQtwZrZCIOUMiZ/tW6d0JjS2PM8rH0XP/V7mM7GSNOI2nt8Gw2gFymFZQGO46DRaPDWMAwehLu7O0iU5uv1mreKopDSosffAqUwQ5IkpD4ROztFLBYWarUKKV9HGPo0PuD98/kM374NaGyEQoGMRC9gtVry+Xli64Smaco3vL/fpw0NkWUpCSjibbGoE4ErqEROr9cjgiSYZpM2XMDDwwNOTk6InBqq1Tr1m0SCjsFgQPOK6HQ63AZOT0+JrDkiUuViacFsNHnwrPkU5UoJ3b02HsZ3aHd2sdtq4PD1S7KNjIKowF4tNm+ZH7ZOKFOTqqqkIBmu66JcLkOWmDcq/JopuFavYTgcchVlWcKJPTw8JMI0fPjwgYIS4+bmhvcfHx/zZ338+JGU6+Lq6oqr2TAqMOoGb5mKwzDkCp7PVzjYP4Bl2ZhMJhSoMV69ekVKnmKvu7d5y/yQi4eyjQUBHRS08fv7e4yuR1xl7LpJilouyQN9n6uZgaXvdDrlBLTb7ceULxY1TmSr1eLKvb295f1MuYywIWWAbdu0VoAXvRfcav6FaVax39+nbAEPAps3GA42d/NDLgplGxQFGfVaA7vNDp3QLUgilUt0SAwGI7oHThLzTqbUOE45YVmWPZLMbMPzfBwdHXGimUr7/T6ur695BpgG2YLRRByBgtSi/luqEgCNDrv37y/5oTiZzPh1eacKZ+Wh0/5OFcqIGY+nPGVt2+Fl0Nu3F5SazFt/5h55eXnJyWQkqapMirN4yjN1MvKYytlhwghm88bjMSeZjWFqn82WpHiVVqNa1A2opQBSVeH7MXnxG5qTUZAaqFQMfP48oDVNsp38T/nc6lDXibhvMhWylv0xXFxccIWdnZ1ygmYzi1L5hiuWHU4sPZvNJvfbZnOXvG/OfZjNT6jEarWaOD8/x+9nf3DbYF7LPJKNWa2oDCNbYdbA+kajEdWrVapLIwqsR1azRLtb4++RF3L/2uQsFig1Ovj87h06hwfQEgWyLmEym2Kd0CmvVeAKGdzJAL1fjpA6awjKDmzrK8p1qlsXn7BOW+juljdP/G8Q7RAxea5LJVmR/FlS/7GUvPAkn+/uP92ie/wS/p2HaTjD2fFvcJKQCvUlvPA1DvZu4ERv8OmvP5HJv6JUWW9mfn94mu+hqYWr8CuU6y7KrycIpya0Ov0TQHWhWTnZDPp/4GkI/YGQyyn/I+OZ0K0C+BtxsHUBF2C/qwAAAABJRU5ErkJggg==).

## Observações importantes sobre a instalação

Ao instalar o Maker Studio Bootstrap, um novo diretório será criado. O Diretório padrão será “C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap“, dessa forma, caso o usuário tenha o Maker Studio Bootstrap instalado, o diretório da versão anterior não será afetado.

O Webrun por, padrão, utiliza as seguintes portas:

<Connector port="8037" protocol="HTTP/1.1">  
<connectionTimeout="20000">  
<redirectPort="8443">

Considere os procedimentos que indicamos abaixo:

![image1871.jpg](/assets/images/image101-8eefdb046d92ca90015a90fab820220b.gif)

**Figura 1**

Cenário 1: Você já tem instalada na sua máquina a versão 3 e o PostgreSQL (todos os SO's):

Caso no procedimento de instalação da versão anterior (3) do Maker/Webrun também tiver sido instalado o serviço do banco de dados PostgreSQL, ou o computador no qual será instalada a nova versão já tiver instalado o serviço do banco de dados PostgreSQL, é necessário efetuar uma instalação personalizada, desconsiderando a instalação de um novo serviço para o banco de dados PostgresSQL (Figura 1). Neste caso, os sistemas de exemplo disponibilizados na pasta ”support\Sistemas de Exemplo” do DVD de Instalação do Maker/Webrun deverão ser desempacotados manualmente.

Se já existir a versão (3) do Maker/Webrun no computador em que será instalada a nova versão (3) do Maker/Webrun, ao tentar desinstalar a versão anterior, pode ocorrer de alguns arquivos necessários para o funcionamento da nova versão do Maker/Webrun também serem desinstalados. Sendo assim, o recomendado é que a versão anterior do Maker/Webrun seja desinstalada antes da instalação da nova versão.

Cenário 2: Você já tem instalada na sua máquina a versão 3 e o PostgreSQL (Windows vista):

Se a nova versão do Maker/Webrun for instalada no sistema operacional Windows Vista, durante o procedimento de instalação pode ocorrer de o sistema operacional enviar uma mensagem informativa (Figura 2), a qual informa que será aberta uma tela para escolha da pasta que contém os apontadores dos projetos (\*.wfre) já salvos no computador (Figura 3), para trás da tela que mostra o andamento da instalação do Webrun. Neste caso, efetue um clique na borda da mensagem informativa (Figura 2) para que ela venha para a frente da tela de instalação do Webrun e, em seguida, efetue um clique sobre o botão OK.

Cenário 3: Usando o instalador da nova versão do Maker/Webrun, você quer instalar apenas o Maker e o PostgreSQL e, em um segundo momento, instalar o Webrun (todos os SO’s):

Para a instalação manual de cada um dos produtos, exceto o Maker, devem ser utilizados os instaladores disponíveis na pasta support\Instaladores Individuais do DVD de Instalação do Maker/Webrun. Para a instalação do Maker e do PostgreSQL em conjunto, deve-se utilizar o instalador normalmente, desconsiderando a instalação do Webrun. Durante esse processo, aparecerá por três vezes a mensagem "Não foi possível encontrar a pasta de sistemas do Webrun. O WFRE será colocado na pasta pública de todos os usuários, normalmente C:\Documents and Settings\All Users\Documentos\Systems" (Figura 4); efetue clique no botão OK em todas elas.

Erro: Não foi possível encontrar a pasta de sistemas do webrun. O WRFE será colocado na pasta C:\Documents and Settings\All Users\Documentos\Systems

Após a conclusão do processo de instalação do Webrun, é necessário copiar a pasta Systems referenciada na mensagem apresentada no parágrafo anterior para a pasta "C:\Arquivos de Programas\Softwell Solutions\Webrun3" (pasta sugerida para a instalação do Webrun, quando instalado pelo instalador individual).

Ao tentar desinstalar todos os produtos instalados pela nova versão do Maker/Webrun, o instalador só identificará a instalação do Maker, os demais produtos (PostgreSQL e Webrun Enterprise) devem ser desinstalados manualmente pelos instaladores disponíveis na pasta "support\Instaladores Individuais" do DVD de Instalação do Maker/Webrun, ou através do utilitário do "Adicionar ou Remover Programas" (Windows XP/Seven) ou "Programas e Recursos" (Windows Vista/8/8.1), ambos disponíveis em "Painel de Controle".

Observação: Todas as novas funcionalidades foram testadas à exaustão, porém, podem ocorrer combinações de alta complexidade, as quais a equipe de testes não tenha identificado. Estaremos sempre à disposição para resolvê-las. Para isso você deve manter contato com nosso suporte pelos meios: e-mail, telefone, chat.

## Chave de acesso ao Maker

No kit de Instalação do Maker consta uma chave de acesso que possui o registro de uso da ferramenta .

A forma de liberação do Maker é definida no ato da aquisição do produto.

IMPORTANTE:

Essa chave deverá estar conectada em uma porta USB para que o Maker possa funcionar. Esse componente que acompanha o Kit de Instalação do Maker é de total responsabilidade do proprietário adquirente. Em caso de perda, ele mesmo deverá adquirir uma nova licença de uso do Maker.

## Atualizações e Suporte do Maker

Ocorrerá sempre uma checagem pelo Atualizador Automático, localizado na Bandeja de Sistemas do Windows, nos casos de computadores conectados na Internet e com o comando ativo na tela [Configurações](/docs/maker/configuracoes).

Para executar a atualização do Maker manualmente, consulte o item [Atualizações do Maker](/docs/maker/atualizacoes_maker).

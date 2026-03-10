# Paleta de Objetos

> Fonte: https://manual.softwell.com.br/docs/maker/paleta_objetos

# Paleta de Objetos

É o local que disponibiliza a maior parte dos objetos que compõem o projeto. A Paleta de Objetos fica localizada no lado esquerdo do maker na aba do Gerenciador de Objetos e é formada pelas abas [Formulários](/docs/maker/definicao_do_formulario), [Relatórios](/docs/dicas-e-truques/relatório/configuracao_servidores_relatorios), [Fluxos](/docs/maker/editor_de_fluxo_de_acoes).

- Caixa de texto Localizar: local utilizado para a definição do nome de um objeto que se quer localizar. Deve-se observar a configuração do banco de dados no qual foi criado o projeto, pois, se o banco de dados for susceptível ao caso sensitivo (case sensitive), a pesquisa se baseará exatamente no valor informado para ser pesquisado;
- Área de exibição dos objetos: local no qual são listados todos os objetos criados. No caso do objeto fluxo de ação (Aba Fluxos), ele aparece dentro da categoria (hierarquia) à qual foi associado.

Todas opções abaixo são acessadas através de um clique com botão direito sobre o objeto desejado:

- Novo: utilizado para a criação de objetos dos seguintes tipos:

  - Formulários: aparece a tela [Assistente de Criação de Formulário](/docs/maker/assistente_criacao_novo_formulario), a partir da qual podem ser definidas algumas propriedades para a criação do formulário. Quando criado, é possível visualizar as opções:

    - [Componentes](/docs/dicas-e-truques/componente/alternar_visualizacao_componentes_formulario): contém todos os componentes que podem ser utilizados nos formulários;
    - Salvar: salva todas as alterações feitas no formulário que estiver com o foco, caso esteja aberto mais de um formulário ao mesmo tempo;
    - Salvar Tudo: salva todas as alterações feitas em todos os formulários que estiverem abertos. Além disso, este botão também executa a mesma ação da opção Salvar do menu Projeto da Barra de Menus do Maker;
    - Definições: abre a tela [Definições do Formulário](/docs/maker/propriedade_do_formulario), a partir da qual podem ser editadas algumas propriedades do formulário.
  - Relatórios: aparece a tela [Novo Relatório](/docs/maker/usando_o_assistente_de_criacao_de_relatorio), a partir da qual pode ser escolhida a versão do Gerador de Relatórios que será utilizada ou o assistente no qual o Maker se baseará para criar o relatório.
  - Fluxos: aparece a tela [Editor de Fluxo de Ações](/docs/maker/editor_de_fluxo_de_acoes).

![image793.gif](/assets/images/imagens_fix1-19ae1113eb9b10c807d1f0fc702aa511.png)

- Editar: abre o objeto para que possa ser editado.
- Histórico: aparece a tela [Versionamento do Sistema](/docs/maker/versionamento_de_sistemas) listando as últimas versões do objeto. É possível restaurar qualquer versão selecionando-a e, em seguida, clicando no botão ![restaurar](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFEAAAAXCAIAAAD87DQQAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADfSURBVFhH7ZhhDsIgDIXReECOytE4gnWvaxombDQs0bTfj+1RnhmP4hJ91FqTM55890Rk9kFk9oHxvV1KYbWRc2b1D9j7TDmFZgsGXHfeR3yfV0CdBDzeKzxQrUadkCEEAb1Nds2iZ3nxfR79SDreEFRstFREiKFxQjcMzL2PnGLPrB+pF00aAlAds2IQGueYKfOY9Wcb8YBUjiuWjSC41GfKfMqN7zDkxJXWeozd47rThv1sf0VnQ0+kood0hfj4dqQymFqCx9+Slsy9LadusPpt4j8DH0RmH0RmD6T0BrfNm3D02Ar+AAAAAElFTkSuQmCC). A partir daí, aparecerá a tela Importação, local em que a ação poderá ser concluída. Outro recurso disponível é o da impressão de todas as versões do objeto em formato de relatório, por meio do botão ![imprimir](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAYCAIAAADS9PzaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACZSURBVFhH7ZdhCoAgDEYtuqxX8ACeu8HWkBWGGyKTvT9+TY0ezR8eOee0LyeNmxJ6ngk9z+j1SimUxunvtbxZsObv1VopfdGfHSKa8w/oJYSzqANtBQM/Au0UZlFRc9FoA9sJvkYEbrN3BRHrOSBisYJoTs+EngE4S4j9FOmYeCFaaMXM0gM3Sg9LVOM665nQ80zoeWZrvZRu0tpL13c8NCAAAAAASUVORK5CYII=).
- Duplicar: aparece a tela duplicar objeto, a qual disponibiliza a caixa de texto Nome do objeto, local em que deve ser definido o nome do objeto que está sendo duplicado, e os botões OK (utilizado para confirmar a duplicação do objeto) e Cancelar (utilizado para o cancelamento da duplicação do objeto). Quando um objeto for duplicado, as permissões e as propriedades WEB e Externo do objeto de origem não serão consideradas para a cópia.
- Renomear: é possível renomear uma regra para o nome determinado pelo usuário.
- Exportar: será aberta uma janela de Exportar Formulário que permite ao usuário salvar o arquivo com a extensão \*.frz.
- [Exportar Para o Jasper](/docs/maker/exportando_relatorios_para_jasper): apenas para opção de relatório, clicando sobre essa opção, será aberta uma janela que permite ao usuário salvar o relatório com a extensão \*.JRXML. Relatórios com essa extensão podem ser utilizados em sistemas operacionais Linux e Windows.
- Visualizar: apenas para opção de relatório, permite acessar a [Aba de Visualização](/docs/maker/aba_visualizacao_visualize_imprima_relatorios) do relatório selecionado (disponível para [Maker Report - versão 10](/docs/dicas-e-truques/relatório/configuracao_servidores_relatorios)).
- Visualizar em: permite que o relatório seja visualizado em uma língua previamente traduzida no [Sistema de Internacionalização](/docs/maker/tradutor) do Maker. Observação: Apenas o componente Label está internacionalizado, os demais componentes estão em fase de homologação.
- Dependências: abre a tela [Visualizador de Dependências](/docs/maker/visualizador_dependencia).
- Categoria: abre a tela Categoria:

![image850.jpg](data:image/png;base64,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hAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAggVEECogABCBQQQKiCAUAEBhAoIIFRAAKECAuKNjY3t7e1bXv6ln+gyf/YkPwJQKhuefcOPurRW1+1cdCHPqIAAQgUEECoggFABAYQKCCj6T30XLVrkR+gPa9eu9aMCDO1PfvRT8ft2fw1/6gsII1RAAKECAggVEECogABCBQQQKiCgpKEuWbLEj9KydiUo3uYC2V0L+KnM+xsel630zff8VD/p9yssSqmfUQfr3vbXx12+fLkfDS32+bG7Foh+utwCv1OuerwXunjpi55JVBqleJvzKXWo+b7P2aQT7LqBCU86bjfMH8g8y/H73V6P30/LmgnvukF4xrjdIczuo/oj3n2lTLAbTLoZ43aN38814/jZ0LUF44FT6f87qOx+Bg+F8DhLvjU5T883E12cNRPMBzNuHMw40QUoW9EvVtYg/EXMN+PGJjofPjpABuGlr90ru4d+J49gTdbny3G7ORWy2B/o6TZ0z19F365EQiFfrzLnvlLG73ebVo8PIT9b2s/J4PyM2ouvva23sxw/lV/3i/2BND9VpKJuzBBgd7PEj8t+1Osvlj8nzU8N3pe+fP8wyT4R7pPi9wtT1ONJ98FXeu7L4XdE9O4GR88qhzs+aD+jhr/wWWM3yNLNAyV6enSxm7HL8CEbB4fcjBNdkyV6irqse9TNvc55qEzkvBdZkzmF10TPcjNOIdc2EPiL4xnsaxD+qpQAf3E8wF8cN/n+4njpQs33fajEYUSFb1jpb0w5hFomX5o+hprzXgz6o6sbZRoqciqHUMtEH0OVU1SovDMJEECogABCBQQQKiCAUAEBhAoIIFRAAP9HxkAZ4feogDBCBQQQKiCAUAEBhAoIIFRAQN5fzwAoB/x6BpBBqIAAQgUEECoggFABAak/9Z269im/B6D8+H+F0O8BKE+x2P8DHApjZBhBQrgAAAAASUVORK5CYII=)

Nela é possível, pelo botão ![nova categoria](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG4AAAAaCAIAAADZiv57AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEZSURBVGhD7ZlhDsIgDIWn8bK7wg6wc6+xpCEtMAbPGc37frhSHlDemEZ9rOu6EATPdCXT0EoYtBIGrYRBK2HQShi0Esa4ldu2peiNa/4E2JqnTuW37EOtu+97ihDwAYfxStch5K7KAYn31k6NduUai50mJ3YVM7V5LCMUNdqUuDHJAFNWFrH6XOyoaYrDa5kodhnLW0ZjyyhRMMCslbLw6fKmcbvSoEGPuGeeUyCTAE6lepQafYi+39O22LqGuVRMg5s+dtTuq9u+tLEZFyBg3ivVqWKsgSPXOOLwKNaMvOZdEluXZpSoccQhY/zzT79qd2p8nkEra7fxztKL5IXdXAz/kIDBbzswaCUMWgmDVsKglTBoJYhlOQB2U8JLmuAjZAAAAABJRU5ErkJggg==), criar novas categorias e vinculá-las ao objeto selecionado.

- Permissões: abre a tela Permissões do Objeto, na qual se pode autorizar Grupos de usuários a Editar e/ou Excluir o objeto selecionado. Também é possível selecionar o proprietário do objeto clicando no botão ![proprietário](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAAAXCAIAAAAN52+dAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAD2SURBVFhH7ZhhDoMgDIXZsstyhR2Ac+/FNk0nlAHi0KTfD20fNuKjssVHjDE4JZ58djLcGhO3xsStMXFrTLqteX/D6hDt5fmVB2/dQvePN+aUUuIkS6fwh1u0cIMXaokvYI41WFigY7BLgVYo0AqgFEhMOtApBVoBlE7kxece9DxkSSnAkCgSVxRQL6kMgWLtLEa6BjMQWDoGnorgXMEDJzTFTy6x17DNGyxtwBFWp7ZDI9fahpd0h8XIXlMByyuPJ0udK5q8hBQcKaChIvoCxDhSYTHo5fSPEsMzW84N/teswj9lmXjXmLg1Jm6NiVtj4tYYhPAB4wanRUzPFE0AAAAASUVORK5CYII=).
- Restringir acesso: esta opção tem como objetivo restringir acesso a qualquer usuário que não tenha o perfil de Administrador ou Gerente do sistema. O formulário fica acessível, porém não poderá fazer nenhuma alteração. Caso um usuário com nível de acesso inferior tente fazer alteração ou importar de modo que sobreponha um formulário protegido, o sistema informa que não tem permissão. O Maker cria um arquivo de LOG confirmando o bloqueio do formulário na pasta `C:\Documents and Settings\<usuário do Windows>\Configurações locais\Dados de aplicativos\Softwell Solutions\Maker Studio Bootstrap\debug\import_export`.
- Excluir: aparece uma caixa de diálogo questionando a certeza do usuário em excluir o objeto. Caso o usuário clique em Sim, o objeto será excluído, caso o usuário clique em Não, o objeto não será excluído.
- Permitir Acesso Externo - marcando essa opção em objetos do tipo Formulário ou Relatório, será possível acessá-los diretamente por um link.

  Levando em consideração a URL (acesso externo ao formulário):

  ```prism-code
  http://localhost:2020/webrunstudio/form.jsp?sys=LOC&action=openform&formID=6693&align=0&mode=-1&goto=-1&filter=&scrolling=yes
  ```

  Observe as descrições dos parâmetros:

  - sys - deve ser informada em letra maiúscula a sigla do sistema. Caso exista um nome de instância para o sistema, a sigla do sistema deve ser concatenada com o caracter "\_" (underline) e este com o nome da instância. Exemplo: SSS\_NOMEDAINSTANCIA;
  - action - deve ser mantido para uso interno do Webrun.
  - formID - deve ser informado o código do formulário (pode ser obtido na área inferior esquerda da barra de status do formulário) ou GUID do formulário (pode ser obtido na tela [Definições do Formulário](/docs/maker/propriedade_do_formulario)).
  - align - deve ser mantido o valor "0" (zero) para a propriedade. Ela é utilizada internamente pelo Webrun.
  - mode - determina o modo no qual o formulário será aberto. Caso seja informado o valor:

    - -1, o formulário abrirá em Modo Normal;
    - 1, o formulário abrirá em Modo de Inclusão;
    - 2, o formulário abrirá em Modo de Alteração.
  - filter - são os filtros de pesquisa nos quais, a fonte de dados vinculada ao formulário se baseará para limitar os registros. Deve ser utilizada a sintaxe `<nome_do_campo>=<valor>`. Exemplo: USUARIO\_CODIGO=55. No caso de haver mais de um filtro de pesquisa, estes devem ser separados por ; (ponto e vírgula). Exemplo: USUARIO\_CODIGO=55; SENHA=12.
  - scrolling - determina a exibição ou não das barras de rolagem. Se quiser que as barras de navegação apareçam, deve ser informado o valor Yes, caso contrário, o valor No.

  Quanto ao objeto Fluxo, marcando essa opção, o fluxo estará disponível para ser utilizado como [Serviço Web (Web Service)](/docs/dicas-e-truques/maker/exemplo_de_utilizacao_de_web_services_no_maker).

  Quanto ao objeto Relatório, há duas formas de se acessar um relatório externamente. Da maneira citada abaixo, o relatório precisará de um filtro, pois ele irá chamar um formulário para o usuário digitar o parâmetro de filtro:

  ```prism-code
  http://localhost:2020/webrunstudio/reportOpenExternal.do?sys=SIGLA&reportID=257&exptype=PDF&nopopup=true&codigo=2
  ```

  Observe as descrições dos parâmetros:

  - localhost - endereço onde está localizado o sistema que contém o relatório;
  - :2020 - porta do sistema. Caso a porta esteja definida como 80, não é preciso passar tal parâmetro, uma vez que os navegadores enxergam a porta 80 como padrão;
  - /webrunstudio/ - contexto do sistema;
  - sys=SIGLA - sigla do Sistema. Geralmente são três caracteres. Caso não sejam utilizadas instâncias. Substitua a "SIGLA" pela sigla do sistema;
  - reportID=257 - para obter o código do seu relatório, efetue um select na tabela fr\_relatorio. O código do relatório é o valor do campo rel\_codigo referente ao relatório contido no campo rel\_nome.
  - exptype=PDF - formato em que será gerado o relatório. Neste exemplo, foi utilizado o tipo PDF, mas os outros tipos podem ser usados. São eles: TXT, HTM, SCR (Na tela), etc.
  - &codigo=2 = este é o filtro do relatório. O nome do filtro a ser passado é o nome do parâmetro que foi definido no momento da criação e não o nome do campo.

  Caso queira passar mais de um filtro, basta ir concatenando ao fim do endereço:

  Exemplo de três filtros:

  &codigo=1&loja=3&os\_data=01/01/2008

  Neste caso, o endereço completo ficaria da seguinte forma:

  ```prism-code
  http://localhost:2020/webrunstudio/reportOpenExternal.do?sys=SIGLA&reportID=257&exptype=PDF&nopopup=true&codigo=1&loja=3&os_data=01/01/2008
  ```

  Da maneira citada abaixo, o relatório não necessita de um filtro para ser aberto. Caso possua um filtro, ele não considera e abre todos os registros contidos no relatório:

  ```prism-code
  http://localhost:2020/webrunstudio/reportOpenExternal.do?sys=LOC&reportID=112&exptype=PDF&nopopup=true
  ```
- Web - ao marcar esta opção, o fluxo de ação poderá ser executado por uma URL. Há ainda uma outra forma de se [executar fluxos de ações via URL](/docs/dicas-e-truques/maker/como_acessar_um_fluxo_web), a qual se baseia na definição de parâmetros avançados na área de trabalho do Maker. Considerando a URL:

  ```prism-code
  http://localhost:2020/webrunstudio/insereregistro.rule?sys=SSS&Idade=50&Nome=Pedro
  ```

  - Localhost: é a expressão que identifica o computador no qual consta o serviço do Webrun;
  - 2020: é a porta utilizada pelo Webrun para provimento do serviço;
  - webrunstudio: é o contexto que identifica o nome da aplicação do Webrun;
  - insereregistro.rule: é o nome do fluxo de ação que será executado, o qual deve ser concatenado com a expressão .rule;
  - sys=SSS: é o parâmetro identificador do sistema que contém o fluxo de ação;
  - Idade=50&Nome=Pedro: são parâmetros definidos como parâmetros de entrada (objeto Início do Editor de Fluxo de Ações) no fluxo de ações. A ordem dos parâmetros que compõem a Url deve ser idêntica à que foi definida no momento da criação do fluxo de ações.

  Observações:

  1. Após marcar o fluxo como Web, é necessário recarregar o sistema.
  2. Não é possível definir uma interação com o usuário em um fluxo Web.
  3. Ao renomear um fluxo que esteja com a propriedade Externo ou Web selecionada é necessário marcar novamente a opção após salvar o fluxo.
  4. Após a seleção da opção Externo em qualquer um dos objetos, Formulário, Fluxo de Ação ou Relatório, é necessário Salvar o projeto. Ademais, para que a configuração fique completa, também é necessário a reinicialização do serviço do Webrun.
  5. A passagem de parâmetros between não funciona para formulário externo, pois o que é referenciado é o campo e não o parâmetro.

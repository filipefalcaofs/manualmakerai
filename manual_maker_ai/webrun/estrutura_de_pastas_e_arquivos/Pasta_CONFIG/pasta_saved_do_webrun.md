# Pasta SAVED do Webrun

> Fonte: https://manual.softwell.com.br/docs/webrun/estrutura_de_pastas_e_arquivos/Pasta_CONFIG/pasta_saved_do_webrun

# Pasta SAVED do Webrun

Nesta pasta, são registradas configurações do Webrun, referentes à personalização de Grid, Pesquisas Avançadas, Atalhos. Esta pasta encontra-se em C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\config\saved.

Observe a sequência de pastas abaixo:

![](/assets/images/image768-f50fa933fc9ada736881599eebc529f0.png)

Esta pasta é composta por diversas subpastas de sistemas acessados (a nomeclatura inicia com a sigla do sistema, como no exemplo SMC\_). Quando um sistema possui formulários compostos por grades configuradas por usuários, teremos uma pasta `<sigla do sistema>`\_SETTINGS e, dentro desta, teremos a pasta user\_`<nome do usuário>`, contendo arquivos \*.XML:

- advanced\_query.xml - são arquivos que configuram Pesquisas Avançadas criadas pelo usuário;
- grid.xml - são arquivos que registram configurações personalizadas para componentes Grades.

Deve-se observar que esses arquivos de configuração são criados para cada usuário. Caso ocorra uma mudança de servidor, por exemplo, para não perder as personalizações, devem-se copiar as pastas contidas em ...\SAVED. Na pasta C:\Arquivos de programas\Softwell Solutions\Maker Studio Bootstrap\Webrun Studio Bootstrap\config\saved, temos subpastas para os mesmos sistemas registrados no nível acima, contendo subpastas de usuários, armazenando arquivos \*.XML das configurações dos atalhos criados, descritos nos arquivos shortcuts.json.

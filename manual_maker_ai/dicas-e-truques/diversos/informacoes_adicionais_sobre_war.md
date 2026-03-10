# Informações adicionais sobre os arquivos gerados dentro de um .War

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/informacoes_adicionais_sobre_war

# Informações adicionais sobre os arquivos gerados dentro de um .War

Segue uma breve explicação dos arquivos gerados dentro de um .WAR. Com essas informações, o usuário pode fazer uma simples atualização (cor de um componente, por exemplo) sem ter que enviar todo o conteúdo do .WAR novamente.

## Referente ao Sistema

• Diretório - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\

• Classe - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<sigla>`.CLASS

• Propriedades - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<sigla>`.XML

• Ações - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<sigla>`.actions.XML

• Tipos de Dados - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\dataTypes.XML

• Dicionário de Dados - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\dictionary.XML

• Menu Principal - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\menu.XML

## Referente a Formulários

• Diretório - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\forms\`<formulário>`

• Classe - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\forms\`<formulário>`\`<formulário>`.CLASS

• Propriedades - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<formulário>`\`<formulário>`.XML

• Ações - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<formulário>`\`<formulário>`.actions.XML

## Referente a Componentes

• Diretório - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\forms\`<formulário>`

• Classe - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\forms\`<formulário>`\`<formulário>`.CLASS

• Propriedades - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<formulário>`\`<formulário>`.XML

• Ações - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<formulário>`\`<formulário>`.actions.XML

## Referente a Componentes

• Diretório - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\forms\`<formulário>`

• Classe - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\forms\`<formulário>`\`<componente>`.CLASS

• Propriedades - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<formulário>`\`<componente>`.XML

• Ações - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\`<formulário>`\`<componente>`.actions.XML

## Referente a Regras

Referente a Regras do tipo Servidor

• Diretório - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\rules\

• Classe - `<sistema>`\WEB-INF\classes\wfr\com\systems\system\_`<sigla>`\rules\`<regra>`.CLASS

Referente a Regras do tipo Cliente

• Diretório - `<sistema>`\jsRule\system\_`<sigla>`\

• Arquivo de API - `<sistema>`\jsRule\system\_`<sigla>`\webrunFunctions.js

• Todas as Regras - `<sistema>`\jsRule\system\_`<sigla>`\webrunRules.js.

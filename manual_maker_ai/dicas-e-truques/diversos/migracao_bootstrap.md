# Migrando um projeto de uma versão anterior para a Webrun Bootstrap

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/diversos/migracao_bootstrap

# Migrando um projeto de uma versão anterior para a Webrun Bootstrap

Com o Maker Studio Bootstrap, fizemos uma reestruturação de TODOS os componentes, estrutura de pastas, CSS e diversos outros ajustes para estar 100% adequado ao padrão Bootstrap.

Os procedimentos abaixo, visam minimizar o impacto na migração de versões anteriores para a versão atual.

1. É recomendado que seja importado um dos templates (Aba, Janelas, SPA ou Bootstrap).
2. Caso não opte pelo item "1", o CSS dos Formulário de Login e do Formulário Principal devem ser removidos, para que o CSS do Skin entre em vigor;
3. CSS que antes apontavam para as Classes dos Componentes, ex. .HTMLButton devem apontar para o atributo [webrun-type=”HTMLButton”]
   Desassociar os fluxos Toogle Menu e Toogle Menu close ou só Ocultar os icones de Abrir e Fechar o Menu(Já foi ocultado no CSS)
4. Os Skins abaixo, devem ter os seguintes Fluxos alterados no projeto:

| Skins | Fluxo | Alteração | Motivo |
| --- | --- | --- | --- |
| **Portal Light** | Formulario Principal - Definições do CSS - Sub Fluxo Estilo da Janela Flutuante. Todos os Fluxos do Formulário Principal ao Entrar que ocultam algum Botão de Ação. | Utilizar a Função Mostrar Componente Remover o SubFluxo | Os botões de ação possuem a classe d-inline-flex, ela utiliza !important. Isso invalida algum css com propriedade display que seja aplicado nesses componentes |
| **Safira** | Desabilitar Menu Expandivel Montar div arrow | Substituir a classe HTMLTabArea por tab-pane Remover o Processamento Criar img | Não remove a div closeItem usando a referencia antiga da Tab Area Insere uma imagem que não existe (Essa imagem foi substituida por um Icone) |
| **Office Light Green** | Toogle Menu e Toogle Menu close | Desassociar os fluxos Toogle Menu e Toogle Menu close ou só Ocultar os icones de Abrir e Fechar o Menu(Já foi ocultado no CSS) | O menu Mobile será o do boostrap |
| **Mac** | Toogle Menu e Toogle Menu close Aplicar CSS na Tela Principal e Definição do CSS 2 | Desassociar os fluxos Toogle Menu e Toogle Menu close ou só Ocultar os icones de Abrir e Fechar o Menu(Já foi ocultado no CSS) Remover todos os Processamentos que adicionam alguma classe (imagens) nos Botões de Ação | Quebra as chaves de permissão do Modo Gerente |
| **Múltiplo** | O Template não apresenta fluxo de Abertura de Menu na Versao mobile (Mesmo pra versão antiga) | Ocultar os icones de Abrir e Fechar o Menu(Já foi ocultado no CSS) | O menu Mobile será o do boostrap |
| **Blue** | Ocultar Configurações Toogle Menu e Toogle Menu close | Estava usando a referência errada do elemento a ser retirado diante da nova estrutura Substituir a classe HTMLMenu por form-menu e mudar e trocar a função pra ocultar os elementos para a Função Mostrar Componente | Não remove as Divs box-overlay que estavam sendo criadas Não abre o Menu de Configurações |
| **Red** | Toogle Menu e Toogle Menu close Formulario Principal - Definições do CSS | Remover o Processamento Anexar menu ao Form.jps Desassociar os fluxos Toogle Menu e Toogle Menu close ou só Ocultar os icones de Abrir e Fechar o Menu(Já foi ocultado no CSS) | O menu Mobile será o do boostrap Nova Estrutura não permite mais esse processo inviabilizando a aplicação de CSS no componente |
| **Default** | Formulario Principal - Definições do CSS | Remover o Processamento Anexar menu ao Form.jps | Nova Estrutura não permite mais esse processo inviabilizando a aplicação de CSS no componente |
| **Ametista** | Todos os Fluxos do Formulário Principal ao Entrar que ocultam algum Botão de Ação | Utilizar a Função Mostrar Componente | Os botões de ação possuem a classe d-inline-flex, ela utiliza !important. Isso invalida algum css com propriedade display que seja aplicado nesses componentes |
| **Uranus** | Formulário de Login - CSS Componente Menu | Remover o processamento Anexar Menu na Lay | Adicionar na lay, deixava o layout quebrado |
| **Metro** | Formulario de Login - Ao Entrar Formulario Principal - Definições do CSS Metro - Formulário Principal - Anexar Elementos ao Boxer 1/3 Metro - Formulário Principal - Anexar Elementos ao Boxer 2/3 Metro - Formulário Principal - Anexar Elementos ao Boxer 3/3 | Concatenar as Classes das Boxes com as que ja existem Remover o Sub Fluxo Estilo da Janela Flutuante Remover o processamento Anexar Menu na Lay | Quebra as chaves de permissão do Modo Gerente |
| **Executive** | Toogle Menu (Aplica Classe) e Toogle Menu close (Anexa o botao fechar) Formulario Principal - Definições do CSS | No Processamento é preciso trocar a função Obter corpo da página do jsp por Obter corpo da página Usar a função Mostrar Componente nos processamentos que exibem e ocultam os botoes. É preciso trocar o seletor por form-menu em vez de HTMLMenu. Remover o Processamento Anexar menu ao Form.jps | Nova Estrutura não permite mais esse processo inviabilizando a aplicação de CSS no componente Os botões de ação possuem a classe d-inline-flex, ela utiliza !important. Isso invalida algum css com propriedade display que seja aplicado nesses componentes Na nova estrutura do Webrun a classe HTMLMenu foi mudada para form-menu Nova Estrutura não permite mais esse processo inviabilizando a aplicação de CSS no componente |

5. As propriedades dos Formulário de Login e no Formulário Principal devem seguir as definições abaixo:

|  |  | Formulário de Login | Formulário Principal | Formulário Principal |
| --- | --- | --- | --- | --- |
| **SKIN - Webrun v. 501** | **Tipo de Menu Padrão ao Criar Novo Projeto** | **Usar Propriedade Responsivo do Formulário** | **Usar Propriedade Responsivo do Formulário** | **Usar Propriedade Alinhamento do Menu** |
| **Ametista** | Vertical | SIM | NÃO | NÃO |
| **Portal Light** | Vertical | NÃO | NÃO | NÃO |
| **Safira** | Vertical | NÃO | NÃO | NÃO |
| **Uranus** | Vertical | NÃO | NÃO | NÃO |
| **Office** | Horizontal | SIM | NÃO | NÃO |
| **Light** | Horizontal | SIM | NÃO | NÃO |
| **Múltiplo** | Horizontal | NÃO | NÃO | NÃO |
| **Mac** | Horizontal | NÃO | NÃO | NÃO |
| **Default** | Vertical | SIM | SIM | SIM |
| **Metro** | Vertical | NÃO | NÃO | NÃO |
| **Executive** | Vertical | NÃO | NÃO | NÃO |

6. Os fluxos "Template - Criar Lista e Exibir Formulários do Sistema" e "Template - Obter Formulários do Sistema" devem ser removidos do sistema (remover das dependências também). No Maker Studio Bootstrap, o combo de formulários será automaticamente criado quando o sistema estiver em modo gerente.

Caso este tópico não tenha comentário satisfatório, envie e--mail para [[[email protected]](/cdn-cgi/l/email-protection#f3979c90869e969d879290929cb3809c958784969f9fdd909c9edd9181)] (Título: Editor de Fluxo de Ações)

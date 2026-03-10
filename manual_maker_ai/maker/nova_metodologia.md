# Nova Metodologia de Desenvolvimento de Software

> Fonte: https://manual.softwell.com.br/docs/maker/nova_metodologia

# Nova Metodologia de Desenvolvimento de Software

## Proposta

O Maker é uma ferramenta de desenvolvimento de sistemas aplicativos para Web e Mobile que utiliza técnicas que proporcionam o aumento da produtividade com qualidade e adiciona poderosos recursos ao produto final. Tudo isso sem que o desenvolvedor tenha que escrever linhas de código.

Possui uma interface que interage facilmente com o usuário por meio de recursos intuitivos proporcionados pelos assistentes, pelas ajudas e pelos componentes de desenvolvimento.

O Maker permite que a abstração de todo o projeto possa ser planejada por qualquer pessoa.

Os sistemas gerados por essa nova metodologia podem ser traduzidos para qualquer linguagem de programação. Atualmente, há um interpretador dos sistemas gerados pelo Maker para internet: Webrun.

## Editores de Interface WYSIWYG

A IDE de criação da interface dos sistemas criados pelo Maker segue a técnica WYSIWYG. O desenvolvedor constrói, por exemplo, formulários e relatórios de forma visual.

Os formulários são criados a partir de uma origem de dados e o Maker oferece assistentes que são capazes de inferir a partir de um formato próprio, presente no modelo de dados do sistema.

Inicialmente, o Maker disponibiliza um conjunto de componentes visuais básicos para a construção de formulários. A partir desses elementos, os desenvolvedores podem criar novos e mais complexos componentes dependendo de sua necessidade. A criação de um novo componente, assim como todo tipo de evolução na ferramenta, é feita utilizando a própria ferramenta. Ademais, a ferramenta disponibiliza domínio específico para a evolução de uma IDE de desenvolvimento. Isso garante que a ferramenta possa evoluir independentemente do fornecedor, garantindo a ideia de objetos reutilizáveis.

A interface de edição de relatórios do Maker também segue a técnica WYSIWYG. Tal interface é bastante poderosa e contempla elementos importantes para a elaboração de ricos relatórios (ex.: gráficos, imagens, referências cruzadas, agrupamentos, sub-relatórios, código de barras, dentre outros). Deve-se destacar também a existência de assistentes para a criação de relatórios à partir de formulários, obedecendo a característica de aumento de produtividade.

![image198.jpg](/assets/images/criacaoprojetos-dd2e63a43218eac8ef0ef71cd75f6558.png)

A interface do Maker foi projetada de forma que todas as suas funcionalidades estejam ao alcance imediato, ou seja, sempre visíveis, sensíveis ao contexto e de fácil entendimento. Um exemplo disso é a [Paleta de Objetos](/docs/maker/paleta_objetos). Ela sempre possibilita acesso fácil aos objetos do seu sistema com um simples clique de mouse.

No Gerenciador de Objetos é possível localizar os formulários, relatórios e fluxos, por filtragem do nome do objeto desejado (ao iniciar a digitação do nome de algum formulário, é executada uma filtragem mostrando aqueles que coincidem com o que está sendo digitado).

Exemplo: Ao digitar a letra "a" no editor Localizar, serão filtrados e exibidos todos os nomes que iniciam com a letra digitada.

## Perfil do Usuário do Maker

O Maker não é para leigos em TI. Para a correta utilização da ferramenta, é necessário o conhecimento mínimo de:

- modelagem de banco de dados relacional;
- alguma linguagem de programação.

Participe do Treinamento de Capacitação Maker e exija o seu certificado oficial, promovido pela Softwell Solutions ou por representantes autorizados.

![image2.jpg](/assets/images/image2-c56b41d4bce19bdfeec6da72d661c402.jpg)

## Programação Visual

Utilizamos fluxogramas para tornar mais intuitiva a elaboração de rotinas de software: recurso de fácil entendimento da lógica de programação.

A interface permite ao desenvolvedor aplicar camadas de abstração em sua lógica por meio de rótulos em seus elementos. Tais rótulos podem ilustrar expressões ou outras rotinas complexas e tornar ainda mais intuitivo o entendimento. Por exemplo, pense em uma expressão matemática que faça um cálculo complexo de juros. Imagine que o especialista de domínio não entenda os mínimos detalhes da tal fórmula, porém ele poderá entender se, no rótulo da expressão, contiver um texto claro que diga o que aquela expressão deve calcular.

## Abstração de Camadas

Com o Maker podemos abstrair camadas. Saímos da complexidade das linguagens codificadas para o desenvolvimento em alto nível.

![image1.gif](/assets/images/image1-780c828344b8034227b66bb13ca78593.gif)

Como mostra a imagem acima, inicialmente, as linguagens de programação desenvolviam sistemas em linguagem de máquina, em baixíssimo nível. Posteriormente, foram desenvolvidos níveis mais altos. Agora, com a nova metodologia do Maker, ocorre a abstração do negócio numa camada mental.

## Arquitetura em Multicamadas

Os sistemas criados com o Maker são arquitetados em multicamadas: Servidor, Banco de Dados e Aplicações, permitindo que cada parte do sistema seja executada em uma máquina diferente, otimizando os recursos da rede e oferecendo integração total entre as funcionalidades do sistema. Dessa forma, o balanceamento da carga da rede pode ser feito no melhor nível possível, maximizando o desempenho.

![image3.jpg](/assets/images/image3-dfb7cefe9b19e2809e1a0ccaf501c78b.jpg)

## Escalabilidade

Escalabilidade indica uma habilidade de manipular uma porção crescente de trabalho de modo uniforme, ou estar preparado para o crescimento desse trabalho. Essa habilidade é desejável na maioria dos sistemas. Os sistemas criados com o Maker são executados em um servidor de aplicações que fornece tal característica.

![image4.jpg](/assets/images/image4-6764ea5631851394e44e199248a9b251.jpg)

## Balanceamento de Carga

A fim de garantir maior escalabilidade, as rotinas de software dos sistemas criados pelo Maker podem ser aplicadas nas três camadas de sua arquitetura.

O Maker propõe um formato comum para tornar constantes as rotinas dos sistemas e essas rotinas podem ser traduzidas para qualquer linguagem de programação, aproveitando-se de características facilitadoras e fornecendo ao desenvolvedor no Maker a possibilidade de criar rotinas que possam ser aplicadas a qualquer uma das camadas da arquitetura. Assim há:

- Camada de Modelo de Negócios: faz a tradução para a linguagem em que o interpretador foi escrito - JAVA.
- Camada de Interface com o Usuário: faz a tradução para a linguagem que a maioria dos navegadores Web tem suporte - Javascript.
- Camada de Acesso aos Dados: faz a tradução para a linguagem SQL do banco de dados relacional utilizado.

![image2.gif](data:image/gif;base64,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)

## Multiplataforma

Os sistemas criados pelo Maker podem ser executados em qualquer sistema operacional, já que a camada de negócios é escrita em JAVA.

## Segurança

Os sistemas criados pelo Maker têm, implícitos em suas construções, componentes que garantem a sua segurança. As características que tornam os sistemas criados pelo Maker seguros são:

- criptografia: utilizamos criptografia forte para persistência de dados cruciais do ambiente;
- HyperText Transfer Protocol Secure (HTTPS): é uma implementação do protocolo HTTP sobre a camada SSL ou do TLS, que permite que os dados sejam transmitidos através de uma conexão criptografada e que se verifique a autenticidade do servidor e do cliente pelos certificados digitais;
- auditoria em log: o sistema armazena em um ambiente seguro informações detalhadas de todas as ações de um usuário nos sistemas gerados;
- permissões de acesso: o ambiente permite definições de políticas de acesso detalhadas em todos os elementos do sistema (formulários, componentes, relatórios, entre outros).

## Acessibilidade

Os sistemas Maker estão em constante evolução no que diz respeito à acessibilidade, as aplicações geradas com nossa ferramenta seguem as recomendações de acessibilidade na web, com o objetivo de fazer com que o conteúdo dos sistemas sejam acessíveis para usuários portadores de deficiência. Adotamos o padrão mais difundido na linha de implementação de softwares com foco em acessibilidade chamado WCAG (WCAG, Web Content Accessibility Guidelines)

## Interoperabilidade

Interoperabilidade é a capacidade de um sistema se comunicar com outros sistemas (semelhantes ou não). Para um sistema ser considerado interoperável é muito importante que ele trabalhe com padrões abertos.

O Maker dá suporte à interoperabilidade ao permitir que outros sistemas possam acessar seus recursos, além de fornecer métodos de alto nível para que sistemas gerados a partir dele possam acessar outros sistemas - a tecnologia Web Service.

Web Service é uma solução utilizada na integração de sistemas e na comunicação entre aplicações diferentes. Com essa tecnologia, é possível que novas aplicações possam interagir com aquelas que já existem e que sistemas desenvolvidos em plataformas diferentes sejam compatíveis. Os Web Services são componentes que permitem às aplicações enviar e receber dados em formato XML. Cada aplicação pode ter a sua própria "linguagem", que é traduzida para uma linguagem universal, o formato XML.

## Baixo Nível de Especialização da Equipe

O propósito do Maker é tornar o desenvolvimento de softwares uma tarefa menos árdua e, por que não, menos especializada? À medida que elevamos o nível de abstração do desenvolvimento de sistemas, estamos aproximando-o do ser humano comum, sem expertise em software. Assim, é possível, com o Maker, reduzir o nível de especialização da equipe de desenvolvimento de softwares.

## Manutenibilidade

Já que os softwares criados pelo Maker são flexíveis e voltados para o especialista do domínio, o próprio especialista do domínio será capaz de mantê-lo. Isso pode reduzir a dependência entre o profissional de domínio e o especialista de software.

## Confiabilidade

As seguintes características tornam um sistema confiável:

- segurança
- corretismo
- escalabilidade
- flexibilidade
- poder

Conforme mostrado nos tópicos anteriores, o propósito do Maker engloba todas essas características, o que nos leva a inferir que um sistema gerado pelo Maker é naturalmente confiável.

![image5.jpg](/assets/images/image5-f38c6d2fbee2cbfc68432a769b54e47b.jpg)

## Algumas Soluções

![image6.jpg](/assets/images/image6-685c25f1fea87ff30db79aac3f609a25.jpg)

#### Compatibilidade com versões homologadas veja em: ["Versões Homologadas"](/docs/FAQ/versoes_homologadas)

####

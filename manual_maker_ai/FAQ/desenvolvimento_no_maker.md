# Desenvolvimento no Maker

> Fonte: https://manual.softwell.com.br/docs/FAQ/desenvolvimento_no_maker

# Desenvolvimento no Maker

## Como integrar aplicações desenvolvidas no Maker com sistemas existentes?

Há diversos mecanismos de integração com outras aplicações, por exemplo:

- Webservices - É possível publicar e consumir webservices de forma rápida e prática;
- Chamadas de DLL - Na plataforma Windows é possível invocar métodos de DLL's;
- Linha de comando - É possível executar linha de comando no servidor ou cliente para invocar aplicativos;
- Chamada direta a código Java - É possível executar funções Java diretamente, inclusive de bibliotecas de terceiros;
- Chamada direta a JavaScript - Permite executar código JavaScript no cliente;
- Troca de TXT - É possível ler e/ou escrever arquivos TXT, ou qualquer outro formato para troca de dados com Instituições financeiras, Governo Federal ou sistema de TEF.
- É possível executar uma regra em um código HTML. (Fluxo Web).

## É necessário o conhecimento de alguma linguagem de programação?

Sim. O usuário não precisa dominar completamente, porém precisa entender de lógica de programação e conhecimento em banco de dados.

## O Maker desenvolve aplicações sem o uso de linhas de código?

Sim. Todo o desenvolvimento de formulários, relatórios, menu e fluxos do sistema é executado sem programação, pois utilizam-se componentes do Maker ou elementos criados pelo próprio desenvolvedor.

## Como o Maker trata o reúso de código?

Todos os componentes são categorizados e armazenados em um local especial chamado de Repositório. Com isso, pode-se até reutilizar objetos desenvolvidos em outros projetos que estejam na mesma base de dados.

## Que recursos o Maker disponibiliza para Gestão de Projetos?

Utiliza o Log das alterações do sistema para analisar e acompanhar o desenvolvimento, além de reduzir erros de compreensão.

## Como a documentação de ajuda é agregada ao sistema em execução?

Ajuda on-line é pela tecla F1 para campos com Dicas.

## É possível publicar uma aplicação sem a instalação do módulo runtime/api?

Sim. Existem duas formas: 1) utilizando um runtime para interpretação dos sistemas criados com o Maker, porém esse runtime pode ser rodado em servidores de aplicações homologados. 2) Por meio da exportação das classes já compiladas (formulários, regras e relatórios). Os servidores de aplicações homologados são Tomcat (puro) e JBOSS.

## Implementa efetivamente os conceitos de Orientação à Objetos?

Para o uso do Maker, não são necessários os conceitos de OO, visto que é outro paradigma. Nas aplicações geradas, nossa camada de persistência acessa diretamente tabelas. O foco do Maker é na regra do negócio.

## Permite fazer debug passo a passo do código gerado?

Sim, temos um depurador, que tem como função detectar erros na construção de um fluxograma, rastreando todos os objetos (processamentos, decisões, subfluxos e interações) presentes na regra executada. Pode ser executado paso-a-passo e modificar o conteúdo das variáveis durante a execução. Com esta funcionalidade, podemos depurar tanto fluxo servidor (Java) quanto cliente (JavaScript).

## A geração de formulários no Maker poderia ser comparada com o padrão Delphi ou Access?

Sim. É uma nova metodologia que utiliza alguns dos padrões de trabalho do Delphi ou do Access. A facilidade de criação por assistentes e componentes disponíveis e configuráveis define uma nova tendência de desenvolvimento.

## Gera código para .NET C#?

As aplicações completas são geradas em JAVA, JavaScript e linguagem SQL para os bancos DB2, Firebird, Oracle, Microsoft SQL Server, PostgreSQL, ADO, MySQL. Atualmente, estamos implementando/homologando .NET, ou seja, em breve as aplicações desenvolvidas integralmente na filosofia Maker poderão ser portadas para .NET sem nenhuma implementação. Atualmente, rotinas/algoritmos podem ser geradas diretamente do fluxograma para diversas linguagens ABAP4, COBOL, C, entre outras. Para tal, disponibilizamos no Maker um mecanismo para cadastramento de novas linguagens, construído com o próprio Maker. Fornecemos também um manual técnico.

Para obter mais informações sobre a geração de código com os descritores, [clique aqui](/docs/maker/gerador_de_codigo/descritores). Além disso, para compreender o processo de cadastramento dos descritores no ambiente, [clique aqui](/docs/maker/gerador_de_codigo/gerador_de_codigo_?id=cadastramento-dos-descritores).

## Permite que o código gerado seja exportado e utilizado em servidores de aplicação J2EE?

Teoricamente, sim. Atualmente, já homologamos o JBOSS e o Tomcat (puro), sem nenhuma implementação ou problema. Para rodar em qualquer servidor, será necessária uma avaliação caso a caso.

## Como fazemos a manutenção de nossos modelos de dados Orientado à Objeto? (Persistência)

É um outro paradigma. Se formos tentar encaixar o paradigma adotado pelo Maker com a O.O, não conseguiremos encaixar, pois é outro conceito. O Maker é mais bem visto do ponto de vista da análise essencial do que da análise O.O. Focamos na lógica no negócio, garantido pela infraestrutura que roda por baixo

## É possível criar Threads no Maker?

Sim. Há funções que iniciam a execução de fluxos de forma assíncrona.

Verificar as funções no Maker: Agendar Execução de Fluxo e Agendar Execução de Fluxo sem Pai

## O Maker permite implementação voltada para sistemas MultiEmpresa e MultiFiliais?

Sim. Desenvolver sistemas multiempresas é apenas uma questão de especificação. A interoperabilidade com outros sistemas, por meio de webservices e sockets, é facilitada. Basta informar parâmetros.

Veja: [Versões Homologadas.](/docs/FAQ/versoes_homologadas)

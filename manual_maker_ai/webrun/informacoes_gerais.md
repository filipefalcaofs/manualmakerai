# Informações Gerais

> Fonte: https://manual.softwell.com.br/docs/webrun/informacoes_gerais

# Informações Gerais

## Definição

O Webrun é um interpretador de sistemas gerados pelo Maker.

## Características

#### 1. Multicamadas

Os sistemas criados com o Maker funcionam em multicamadas. Em uma arquitetura de multicamadas, notamos claramente a separação da interface do usuário, do modelo de negócios e do acesso a dados.

A arquitetura multicamadas (Servidor, Banco de Dados e Aplicações) permite que cada parte do sistema seja executada em uma máquina diferente, otimizando os recursos da rede e oferecendo integração total entre as funcionalidades do sistema. Dessa forma, o balanceamento da carga da rede pode ser feito no nível mais otimizado possível, maximizando o desempenho.

O desenvolvimento de aplicações multicamadas é um recurso muito utilizado atualmente e permite que as aplicações se tornem menos dependentes da arquitetura geral de um sistema, possibilita uma manutenção mais rápida e menos complicada.

A arquitetura de sistemas multicamadas permite que a camada de apresentação do software seja independente da camada de controle de regras de negócios e que essa seja independente da camada de armazenamento dos dados. Dessa forma, é possível construir um software inteiro sem se preocupar se o armazenamento de dados será em arquivos simples, XML ou bancos de dados relacionais.

Além disso, softwares construídos dessa forma tornam-se mais manutenível, pois impedem que uma mudança em uma parte do software seja propagada para todo ele.

#### 2. AJAX

O AJAX é uma metodologia moderna de atualização assíncrona de informações entre cliente e servidor, pois permite que os dados sejam trafegados sem que haja atualizações totais das páginas.

As aplicações desenvolvidas com o Maker utilizam-se da metodologia AJAX automaticamente para aumento da experiência do usuário e da performance do sistema, efetuando apenas requisições de atualização das informações que são necessárias no contexto.

#### 3. Não utiliza Applets

Applets são pequenos programas feitos em Java, aplicativos que se servem da JVM (Java Virtual Machine) existente na máquina cliente ou embutida no próprio navegador do cliente para interpretar o seu bytecode, transferindo-se com as páginas web e os navegadores o executam. São independentes de browsers e de sistemas operacionais. Porém, Applets requerem uma gama de recursos instalados na máquina dos usuários e geralmente têm a capacidade de interagir com e/ou influenciar seu programa hospedeiro, utilizando privilégios de segurança restritos, apesar de normalmente não serem requeridos a fazê-lo, além de serem mais lentos e inseguros.

JavaScript é uma linguagem de programação criada para atender, principalmente, à validação de formulários no lado cliente (programa navegador) e gerar interação com a página. Com ele é possível modificar dinamicamente os estilos dos elementos da página em HTML.

Em relação ao Javascript, os applets são mais lentos de processar, além de possuir espaço muito delimitado na página onde são executados, ou seja, não se misturam com todos os componentes da página, nem têm acesso a eles. É por isso que, com os applets de Java, não é possível realizar ações, como abrir janelas secundárias, controlar Frames, formulários, camadas, etc.

Com o Maker, todos os recursos são feitos sem a utilização de Applets. Os sistemas são baseados principalmente no AJAX, o que garante velocidade e segurança, além de não ser necessária a instalação da JVM na máquina do cliente.

#### 4. Múltiplos Bancos

Um SGBD deve garantir a consistência e segurança dos dados, proporcionando ao seu usuário uma visão abstrata dessas informações ao omitir detalhes sobre as estruturas e técnicas utilizadas nos seus processos. Para isso, são usados modelos de dados: ferramentas conceituais usadas para descrição, semântica e relacionamento entre os dados e regras de consistência.

No entanto, a dependência de ferramentas de persistência pode ser um problema. Uma determinada empresa pode fazer uso de um SGBD e, por exigência de um de seus clientes, pode ser solicitado um banco de dados diferente do já utilizado. Com isso o custo para alterar e tornar seu sistema compatível com esse banco pode gerar trabalho a mais para a equipe de desenvolvimento. A depender do banco, a existência ou não de generators, triggers de after, before e outros tratamentos pode fazer com que consultas sejam reformuladas para atender a determinadas solicitações.

A independência dessas ferramentas vem se tornando cada vez mais necessária. O uso de tecnologias que não dependem de um banco de dados em específico possibilita um desenvolvimento rápido, barato e com alta performance.

Alguns frameworks vêm tornando possível essa independência de SGBD. O Hibernate é um desses exemplos. O sistema que faz uso desse framework abstrai o tipo de ferramenta para persistência de dados. Com isso, pode-se vincular uma aplicação desenvolvida em Java a um banco de dados FireBird, SQLServer, Oracle e outros. Entretanto, no desenvolvimento de um sistema fazendo uso do Hibernate, existe uma configuração particular, envolvendo um arquivo XML e algumas bibliotecas que são extremamente necessárias para essa independência. Com isso, torna-se imprescindível um tempo de estudo para sua utilização.

O Maker proporciona uma independência arquitetural em relação ao mecanismo de persistência, sem necessitar de configurações adicionais para obter essa característica. Nenhuma adição de bibliotecas, nenhum treinamento extra para desenvolver sistemas independentes de banco, de plataforma, etc. Para melhorar ainda mais, todo sistema gerado pelo Maker já possui todas essas características, sem que seja implementado nenhum módulo. Tudo isso já é nativo.

#### 5. Multiplataforma

Na tentativa de reduzir custos e obter independência dos fornecedores de plataformas de hardware e software, as aplicações Web vêm se tornando cada vez mais atraentes aos usuários, que se tornaram cada vez mais exigentes, tendo em vista manter ou conquistar a liberdade de escolher qual sistema operacional (Windows, Linux, Mac) e/ou hardware (IA32, x86,...)  executará sua aplicação, podendo optar por mais segurança, mais facilidade ou simplesmente isenção de licença de aplicativos ou sistemas operacionais. Seguindo essa tendência, o Maker consiste em uma IDE de desenvolvimento de sistemas Multiplataforma, altamente flexível, com portabilidade completa (tanto do cliente, quanto do servidor).

A portabilidade de um programa de computador é a sua capacidade de ser compilado e/ou executado em diferentes arquiteturas, seja de hardware, seja software. O termo pode ser usado também para se referir à possibilidade de executar um software sem a reescrita de um código-fonte para uma outra plataforma de hardware ou software. Java, Perl, PHP, .NET(C#, J#), por exemplo, são linguagens de programação portáveis que permitem compilar a aplicação uma vez apenas para que ela possa ser executada em qualquer plataforma que possua a respectiva máquina virtual. Não existe necessidade de produzir uma versão compilada para cada sistema computacional em que se deseje executar a aplicação.

As aplicações Web também obtêm essa portabilidade. Elas estão em uma camada superior, usando um protocolo padrão para transferência de dados (http, https, ...), sendo executada por qualquer browser popular (IE, Firefox, Google Chrome....).

No caso do Maker, essa portabilidade oferecida é devido ao fato de se conseguir reunir as ferramentas necessárias para desenvolver um software que seja acessível nos principais navegadores. Sendo assim, não dependem de plataforma.

Essa portabilidade irá permitir que as plataformas de hardware e software sejam substituídas sem nenhuma mudança visível ao usuário. Quando usado de forma cliente-servidor, o Maker conserva a característica de multiplataforma, já que os servidores utilizam o software Servlet Container que é disponível para diferentes arquiteturas, e é utilizada uma linguagem padrão Java.

#### 6. Escalabilidade

O crescimento constante da demanda de usuários vem causando quedas de desempenho, com baixos tempos de resposta, congestionamento da rede e interrupção de serviços (DoS).

Uma abordagem para solucionar isso é tornar o servidor de aplicação mais poderoso com o uso de uma arquitetura em cluster, na qual múltiplas máquinas funcionam como um único servidor.

Um cluster é definido como um grupo de servidores executando a mesma aplicação web simultaneamente, aparecendo para o mundo como se fosse um único servidor, ou ainda: "Um sistema paralelo ou distribuído que consiste na coleção de computadores interconectados que são utilizados como um só, unificando seus recursos computacionais" (G. Pfister, um dos arquitetos da tecnologia de clusters).

Isso possibilita a distribuição do trabalho nos servidores, o que é chamado de balanceamento de carga.

O Maker possui um ambiente de execução que suporta clustering sem modificações nos sistemas, assim que é implantado

#### 7. Ambiente Web

Atualmente, utilizar aplicações Web é uma tendência mundial que vem crescendo fortemente. As aplicações Web vêm cada vez mais substituindo as aplicações desktop, fato que foi potencializado bastante graças à Web 2.0 e ao crescimento e evolução das tecnologias de desenvolvimento web.

Tal crescimento pode ser explicado pelo fato de aplicações Web possuírem recursos que muitas vezes as tornam uma melhor alternativa em comparação com as aplicações desktop. Alguns desses recursos são: maior acessibilidade da aplicação (de qualquer lugar do mundo, a qualquer hora, em qualquer plataforma), acesso concorrente, dispensa instalação no cliente, etc.

As aplicações desenvolvidas com o Maker já estão totalmente integradas no ambiente web, oferecendo todas as características de tal plataforma sem necessidade de nenhum conhecimento das tecnologias web pelo usuário. Também não há perda de tempo preocupando-se com compatibilidade cross-browser.

#### 8. Segurança

Os sistemas criados pelo Maker já têm implícitos, em suas construções, componentes que garantem a sua segurança. As características que tornam os sistemas criados pelo Maker seguros são:

1. Criptografia - utilizamos criptografia forte para persistência de dados cruciais do ambiente, criptografia de senha (one-way hash): DES, MD5 e Blowfish.
2. HTTPS (HyperText Transfer Protocol Secure) - é uma implementação do protocolo HTTP sobre uma camada SSL ou do TLS Essa camada adicional permite que os dados sejam transmitidos por uma conexão criptografada e que se verifique a autenticidade do servidor e do cliente por meio de certificados digitais.
3. Auditoria em log - o sistema armazena informações detalhadas em um ambiente seguro de todas as ações de um usuário logado no sistema. As informações incluem itens como por exemplo: IP de acesso, Data, hora, usuário, operações que foram realizadas no formulário (inclusão, exclusão, etc), campos modificados, entre outros.
4. Permissões de acesso - o ambiente permite definições de políticas de acesso detalhadas em todos os elementos do sistema (formulários, componentes, relatórios, entre outros).
5. Java Authentication e Authorization Service (JAAS), Java Cryptography Extension (JCE) e Java Secure Socket Extension (JSSE)

#### 9. Interoperabilidade

Interoperabilidade é a capacidade de um sistema de se comunicar com outros sistemas (semelhantes ou não). Para um sistema ser considerado interoperável, é muito importante que ele trabalhe com padrões abertos.

O Maker possibilita a interoperabilidade ao permitir que outros sistemas possam acessar seus recursos e também fornece métodos de alto nível para que um sistema gerado por ele possa acessar outros sistemas. Para isso, o Maker utiliza a tecnologia de Web Service, que é uma solução utilizada na integração de sistemas e na comunicação entre aplicações diferentes. Com esta tecnologia é possível que novas aplicações possam interagir com aquelas que já existem e que sistemas desenvolvidos em plataformas diferentes sejam compatíveis. A Web services são componentes que permitem às aplicações enviar e receber dados em formato XML. Cada aplicação pode ter a sua própria "linguagem", que é traduzida para uma linguagem universal, o formato XML.

## Arquitetura

![image234.jpg](/assets/images/image234-fcf73cf69ec0c7e3df4d987110aeceeb.jpg)

#### 1. Camada de Dados

É a camada de persistência do Webrun. Ela dá suporte a qualquer banco de dados relacional que implemente JDBC. Atualmente, homologamos os seguintes bancos de dados:

1. Oracle
2. SQL Server
3. Firebird / Interbase
4. PostgreSQL
5. MySQL

Essa camada não utiliza tecnologias de terceiros (ex: Hibernate, EJB, entre outros). A razão disso está no pré-requisito -> (r) -> Não deve haver dependência de robustos servidores de aplicações.

Essa camada trabalha sem estado com o SGDB, o que permite distribuição por meio de clusters. O controle transacional é explicado como segue.

#### 1.1 Transações

Uma transação é uma unidade indivisível a ser executada, ou seja, é realizada ou descartada por completo - princípio da atomicidade. Além disso, deve ser consistente, isolada e durável - ACID. Ela pode finalizar de duas formas: por confirmação de todas as operações que engloba (commit), isto é, as alterações no banco de dados são permanentes, ou pelo cancelamento das operações (rollback).

O Maker, assim como o EJB, proporciona suporte automático para transações distribuídas em aplicações. Essas transações podem alterar dados atomicamente em múltiplas bases de dados.

Cada formulário do Maker, que acessa um conjunto de dados, controla uma transação ”mestre”, e para cada dependência, que também acesse um conjunto de dados, é aberta uma transação aninhada. Como dependências, podemos citar subformulários, regras de negócio, grids, formulários linkados entre outros. Seguindo o princípio da atomicidade, as alterações em dados só são confirmadas se todas as transações forem concluídas com êxito. Com isso, podemos até alterar mais de uma fonte de dados que o Maker permitirá/garantirá a atomicidade.

O Maker também armazena dados em memória para serem postados posteriormente. Esse comportamento ocorre para situações de Mestre-Detalhe, em que, teoricamente, os dados de um detalhe só podem ser incluídos após o mestre existir. Porém, o Maker permite a inclusão de dados no detalhe e esses dados só são confirmados quando o mestre for incluído.

Por padrão, as transações do Maker são do tipo READ\_COMMITED, o que significa que o processo B vai enxergar os dados do processo A, quando ele fizer um commit.

#### 2. Camada Servidor

Compatível com containers J2EE JSP e Servlet e servidores de aplicação J2EE. Servidores homologados:

1. Tomcat
2. JBoss+Tomcat

#### 2.1 Componentes da Camada Servidor

![image235.jpg](/assets/images/image235-c79303b67c26acee521ef70af4416d7e.jpg)

##### 2.1.1 Servidor de Aplicações Web

Controla todas as requisições de clientes. Identifica a ação correspondente, valida autorizações e as encaminha para o Gerenciador de Interface HTML.

Padrões de projeto utilizados: MVC, Abstract Factory, Adapter.

##### 2.1.2 Gerador de Interface HTML

Responsável por apresentar em HTML os diversos componentes do sistema. Cada componente do sistema tem um ”Apresentador” correspondente que deve ter o método ”design” implementado. Na ação ”Desenhe”, por exemplo, o Gerador de Interface HTML itera os componentes da requisição e chama o método ”design” de cada um deles.

Padrões de projeto utilizados: Abstract Factory, Composite e Singleton.

##### 2.1.3 Gerenciador de Lógicas de Negócio

Responsável por executar regras de negócio da aplicação. Caso a regra de negócio ainda não tenha sido executada uma vez, o gerenciador irá compilar a classe correspondente e depois executá-la.

Padrões de projeto utilizados: Factory Method, Prototype e Singleton.

##### 2.1.4 Gerenciador de Sistemas

Responsável por manter as definições de um ou mais sistemas. Um sistema é composto por componentes que podem ser: formulários, controles visuais, regras e relatórios.

Padrões de projeto utilizados: Bridge, Proxy, Abstract Factory e Mediator

##### 2.1.5 Gerenciador de Banco de Dados

Responsável por toda a comunicação com as diversas fontes de dados de um sistema. Encapsula funcionalidades de consulta, atualização e remoção de dados e garante o seu controle transacional, quando isso não é assegurado pelo SGDB.

#### 3. Camada Cliente

Responsável por apresentar os dados e por interagir com o usuário. Suporte a diversos navegadores:

1. Internet Explorer
2. Mozilla (Firefox)
3. Google Chrome

Tecnologia

1. JAVA (J2EE, JSP, Servlets e JSTL) (Verificar as informações conforme sua versão do Maker)
2. Apache Tomcat 6, 7, 8.5(a partir da versão Maker Studio - Compatível com tecnologia de contêineres/docker) ou JBoss 4.x
3. Interface JDBC (Type 4) para acesso a dados
4. Troca de dados em XML
5. WebServices
6. Javascript 2.0
7. Gerador de relatórios: PDF, JPG, RTF, HTML e XLS
8. Suporte à biometria (Nitgen) em ambientes 32 e 64 bits
9. AJAX (metodologia)

### [Dúvidas Frequentes](/docs/FAQ/F.A.Q._-_Frequently_Asked_Questions_Maker)

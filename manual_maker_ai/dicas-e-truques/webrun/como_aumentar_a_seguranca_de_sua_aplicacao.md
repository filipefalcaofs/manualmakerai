# Como aumentar a segurança de sua aplicação

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/webrun/como_aumentar_a_seguranca_de_sua_aplicacao

# Como aumentar a segurança de sua aplicação

Visando sempre a segurança no desenvolvimento de soluções utilizando a IDE Maker, estamos em constante evolução para que a experiência no desenvolvimento seja única e satisfatória.

> ##### Notas

• Os itens pontuados abaixo foram desenvolvidos baseado em diversos testes de segurança realizados numa aplicação gerada (.war);

• É recomendado manter sempre a versão do **Webrun** atualizado e publicado no ambiente de homologação/produção. Projeto em “modo interpretado” não tem as configurações aplicadas, mesmo que definidas;

• **Propriedades Avançadas**, quando definidas na área de trabalho do projeto, serão válidas para todos os CLUSTERs (quando aplicado loadbalance);

• **Propriedades Avançadas**, quando definidas no painel de configuração do **Webrun**, serão válidas apenas para o ambiente onde foi configurado. É necessário replicar tais configurações para cada ambiente de deploy.

Dessa forma serão especificados os seguintes itens de segurança para a aplicação:

• [DesabilitarScriptNaResposta](#desabilitarscriptnaresposta)

• [SameSite](#samesite)

• [noStore](#nostore)

• [MaxAttemptsChangePassword](#maxattemptschangepassword)

• [Seguranca:Upload:SQL:ExtensoesPermitidas](#segurancauploadsqlextensoespermitidas)

• [VersaoSeguranca](#versaoseguranca)

• [Seguranca:TokenPorRequisicao](#segurancatokenporrequisicao)

> #### Desabilitar Script na Resposta:

Este parâmetro tem por objetivo prevenir a execução de script em possível ataque **XSS** (Cross Site Script).

Para ativar, defina *DesabilitarScriptNaReposta* com valor "1" no grupo *PropriedadesAvancadas*.

![image1777.jpg](/assets/images/DesabilitarScriptNaResposta-59b8177a8c84bb502bfb14e900856d45.png)

**Considerações importantes:**

Caso o parâmetro avançado *“VersaoSeguranca”* esteja ativo, por padrão a propriedade se torna ativa.
Esse parâmetro só entra em vigor quando o sistema é publicado, ou seja, em modo desenvolvimento essa propriedade não tem aplicação.

> #### SameSite:

Este parâmetro tem por objetivo prevenir o envio do Cookie em requisições entre sites evitando desta forma possível ataque **CSRF** (Cross Site Request Forgery). Por padrão o Webrun define o valor `Lax` para a propriedade, porém é possível também setar o valor `Strict`.

• **Lax**: O cookie same-site ficará retido na sub-requisição entre sites, como chamadas para carregar imagens ou frames, mas será enviada quando um usuário navegar para o URL de um site externo.

• **Strict**: Se o cookie same-site possuir este atributo, o navegador enviará cookies apenas se a requisição for enviada do website que configurou este cookie, se a requisição tem origem em outra URL, nenhum cookie com o atributo Strict será incluído.

Para que o Webrun possa carregar esse parâmetro é necessário realizar a inserção nas configurações do mesmo, definindo no grupo `Cookie` o parâmetro com um dos valores supracitados, conforme imagem abaixo:
Veja também a seção *Seguranca:TokenPorRequisicao*.

![image1778.jpg](/assets/images/SameSite-b9706934690ffa25c772343aacbc66a3.png)

> #### noStore:

Esse parâmetro tem por objetivo não permitir que os navegadores armazenem em cache informações que podem ser consideradas sensíveis (*Sensitive Information Cached to Disk*).
Para que o Webrun possa carregar esse parâmetro é necessário realizar a inserção nas configurações do mesmo, definindo no grupo `Sessao` o parâmetro com o valor "1", conforme imagem abaixo:

![image1779.jpg](/assets/images/noStore-5f307faca694ce84d08dec3f072dcf6d.png)

> #### MaxAttemptsChangePassword:

Esse parâmetro tem como objetivo definir a quantidade máxima de tentativas que o usuário possui para redefinir a senha de acesso ao sistema, quando excede o limite a sessão do usuário expira e o mesmo é redirecionado para a tela de login do sistema. Por padrão, esse parâmetro quando não definido pelo desenvolvedor assume o valor "5" (representando cinco tentativas).

Para que o Webrun possa carregar esse parâmetro é necessário realizar a inserção nas configurações do Maker (*Avançado*), definindo o parâmetro com o valor que representa a quantidade de tentativas, conforme imagem abaixo:

![image1780.jpg](/assets/images/MaxAttemptsChangePassword-ab49f1fbf31ae66d5bd73781ddaf5381.png)

> #### Seguranca:Upload:SQL:ExtensoesPermitidas:

Tem como principal objetivo configurar quais arquivos poderão ser enviados para o servidor de aplicações através do *Executor de Scripts*. Quando o parâmetro *VersaoSeguranca* estiver ativo, por padrão, o Webrun permitirá apenas upload de arquivos \*.txt e \*.sql.

Para que o Webrun possa carregar esse parâmetro é necessário realizar a inserção nas configurações do Maker (*Avançado*) ou grupo *PropriedadesAvancadas* do Webrun, definindo o parâmetro com o valor que representa quais extensões serão permitidas separados por (;) ponto e vírgula.

![image1781.jpg](/assets/images/SegurancaUploadSQLExtensoesPermitidas-7b057f5e8af4bca2fa8a1c0ae80ab246.png)

Observações:

1. As propriedades que possuem o valor "1" para se tornar ativa é desabilitado quando é informado o valor "0".
2. Recomendamos também além dessas configurações, o desenvolvedor habilitar o parâmetro `VersaoSeguranca`.

> #### VersaoSeguranca:

Tem como objetivo:

• Bloqueio de download de arquivos das pastas Upload, systems e subpastas;

• Bloqueio de upload \* de arquivos com as extensões "exe", "com", "bat", "dll", "so", "bin", "jsp", "jsf", “jws”, “cs”, “vbs” e “vb”;

• Upload na camada cliente sempre irá para pasta `Upload` disponível no contexto do Webrun;

• Bloqueio de acesso aos arquivos que não se encontram nas pastas “tmp” e “download”;

• Bloqueio de valores padrão para campos apenas leitura;

• Prevenir *Cross-Site Scripting (XSS)* em todas requisições realizadas ao Webrun;

Para adicionar este parâmetro no **Maker**, o usuário deverá clicar com o botão direito na área de trabalho e selecionar Propriedades -> Avançado, adicionar o parâmetro VersaoSeguranca e determinar seu valor "1". Salve o projeto e reinicie o Webrun para que as configurações tenham efeito.

Lembrete: Ao configurar este parâmetro na área de trabalho do projeto, suas funcionalidades serão exclusivas ao projeto.

![image1660.jpg](/assets/images/VersaoSegurancaMaker-4d5973c495c6b9ee0d03f5fe30e9a18d.png)

Para adicionar este parâmetro no **Webrun**, o usuário deverá criar um novo parâmetro chamado PropriedadesAvancadas nos parâmetros de configuração, adicionar VersaoSeguranca e atribuir o seu valor a "1". Reinicie o Webrun para que as configurações tenham efeito.

![image1660.jpg](/assets/images/VersaoSeguranca-7fd0459a833a9403b8f778aa40d8c1cf.png)

## `Impactos:`

• A execução de regras que efetuem download das pastas citadas não terá êxito. Nenhum arquivo será baixado;

• A execução de regras que tentam acessar arquivos existentes nos diretórios “Upload”, “systems e subpastas” poderá apresentar comportamento inesperado;

• Em formulários externos, bloqueio de execução de regras que não estejam configuradas como externa ou não estejam vinculadas a um componente do formulário externo;

• A função Imagem – Alterar URL não permitirá a utilização de imagens que não se encontram nas pastas “download” ou “tmp”. Desta forma, caso exista alguma regra que altere a URL de um componente Imagem e o caminho da URL aponte para uma pasta diferente de “download” ou “tmp”, o funcionamento será incorreto.

É necessário lembrar que por padrão, as implementações de segurança acima não estão ativas.

O bloqueio de arquivos com extensões pré-determinadas funciona em conjunto com o parâmetro Seguranca:Upload:ExtensoesBloqueadas. Adicione este parâmetro no Grupo Seguranca dos parâmetros de configuração do Webrun.

> #### Seguranca:TokenPorRequisicao:

Seu principal objetivo é criar token de requisição na abertura de formulário, que são validados em operações de CRUD e navegação do formulário, realizando a prevenção de possíveis ataques **`CSRF` (Cross Site Request Forgery).**
Este parâmetro por padrão é ativo no Webrun, para desabilitar o mesmo é necessário realizar a inserção do parâmetro para o grupo *PropriedadesAvancadas* nas configurações do Webrun, informando o valor 0 (zero) como argumento ou o valor 1 (um) para habilitar novamente o recurso.

![image1660.jpg](/assets/images/SegurancaTokenPorRequisicao-f7625e48df12d043d18a9b4125dc9d1c.png)

# Propriedades de Componentes (Metadata)

## Visão Geral

O arquivo `codeTemplates/metadata.xml` define as propriedades disponíveis para todos os componentes do Maker AI. Estas propriedades são usadas pelo gerador de código ao compilar formulários.

---

## Lista de Propriedades

| Propriedade | Descrição |
|------------|-----------|
| `Aba` | Representa nome da Aba em que o componente está presente. Valor: String. |
| `AbaLocalizar` | Informa se a Aba Localizar padrão de um formulário deve ser exibida. Valor: true|false. |
| `Abas` | Informa se o controle de abas padrão de um formulário deve ser exibido ou não. Valor: true|false. |
| `Ajuda` | Propriedade que contém um texto de ajuda. Valor: string. |
| `Altura` | Informa a altura de um componente. Valor: inteiro. |
| `ApenasLeitura` | Informa se o componente é para apenas leitura. Valor: true|false. |
| `Apresentacao` | Informa o modo de apresentação de um formulário (Desktop ou Web). Valor: 0 ou 1. |
| `Arquivo` | Informa o caminho para um arquivo. Valor: string. |
| `Atributos` | Informa os atributos de um componente. Valor: números separados por ";". |
| `BotaoFechar` | Informa se o botão fechar da jabela do formulário deve ser exibido. Valor: true|false. |
| `BotaoMaximizar` | Informa se o botão maximizar da jabela do formulário deve ser exibido. Valor: true|false. |
| `BotaoMinimizar` | Informa se o botão minimizar da jabela do formulário deve ser exibido. Valor: true|false. |
| `BarraDeRolagem` | Informa se o formulário poderá ou não apresentar uma barra de rolagem. Valor: true|false. |
| `Campo` | Informa o valor do campo da consulta que o componente está associado. Valor: string. |
| `CampoChave` | Informa o campo chave do componente. Valor: string. |
| `CampoCodImpDigital` | Informa o campo onde deve ser armazenado o código FIR de uma impressão gidital. Valor: string. |
| `CampoLista` | Informa o campo de exibição do componente. Valor: string. |
| `CampoListaCriptografado` | Informa o campo de exibição do componente. O conteúdo desse campo deve ser criptografado. Valor: string. |
| `Centralizado` | Informa se o formulário deve estar centralizado na tela. Valor: true|false. |
| `ChamaSubForm` | Informa se o componente deve chamar o subformulário definido na propriedade Formulário. Valor: true|false. |
| `Codigo` | Código do componente. Valor: inteiro. |
| `CodigoForm` | Código do formulário: Valor: inteiro. |
| `Colunas` | Campos do formulário que deverão aparecer na grid. Valor: string separada por ";". |
| `CondicaoCriacao` | Cria componente se a condição for aceita. Valor: string. |
| `Conexao1Nome` | Nome da conexão extra. Valor: string. |
| `Conexao1WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao2Nome` | Nome da conexão extra. Valor: string. |
| `Conexao2WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao3Nome` | Nome da conexão extra. Valor: string. |
| `Conexao3WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao4Nome` | Nome da conexão extra. Valor: string. |
| `Conexao4WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao5Nome` | Nome da conexão extra. Valor: string. |
| `Conexao5WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao6Nome` | Nome da conexão extra. Valor: string. |
| `Conexao6WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao7Nome` | Nome da conexão extra. Valor: string. |
| `Conexao7WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao8Nome` | Nome da conexão extra. Valor: string. |
| `Conexao8WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao9Nome` | Nome da conexão extra. Valor: string. |
| `Conexao9WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conexao10Nome` | Nome da conexão extra. Valor: string. |
| `Conexao10WFRE` | WFRE da conexão codificado com base64. Valor: string. |
| `Conteudo` | Tipo do conteúdo do campo (Livre, Número e Data). Valor: 0, 1 ou 2. |
| `Cor` | Valor númerico que representa uma cor. Utiliza o padrão Delphi. Valor: inteiro. |
| `CorCondicional` | Condição para aplicar uma cor a uma célula de uma grid. Valor: [[<Condição>;<Cor><tabulação>[[[Campo 1];Campo 2];Campo N]]<quebra de linha>...] |
| `Criptografado` | Informa se o valor do componente deve ser criptografado ou não. Valor: true|false. |
| `Descricao` | Informa a descrição do campo. Valor: string. |
| `Dica` | Texto de ajuda para o componente. Valor: string. |
| `Editavel` | Informa se a grid é editável ou não. Valor: true|false. |
| `EntrarComoPesquisa` | Informa se o formulário deve entrar sem dados e direto na aba Localizar. Valor: true|false. |
| `Estilo` | Informa o estilo do lookup (Como, Edit e Memo). Valor: 0, 1 ou 2. |
| `ExcluirSeInvisivel` | Informa se o o subformulário deve ter seus valores excluídos se ele estiver invisível. Valor: true|false. |
| `Fonte` | Representa uma fonte do sistema. Valor: Nome da Fonte, tamanho, propriedades, cor |
| `FonteDeDados` | *(sem descrição)* |
| `Forma` | *(sem descrição)* |
| `GravarEmArquivo` | *(sem descrição)* |
| `GroupWith` | *(sem descrição)* |
| `Habilitado` | *(sem descrição)* |
| `Imagem` | *(sem descrição)* |
| `Lista` | *(sem descrição)* |
| `Mascara` | *(sem descrição)* |
| `Navegacao` | *(sem descrição)* |
| `Nome` | *(sem descrição)* |
| `Ordem` | *(sem descrição)* |
| `Paginacao` | *(sem descrição)* |
| `Parametros` | *(sem descrição)* |
| `PosicaoX` | *(sem descrição)* |
| `PosicaoY` | *(sem descrição)* |
| `QtdeColunas` | *(sem descrição)* |
| `ReportIgnore` | *(sem descrição)* |
| `RequerAutenticacao` | *(sem descrição)* |
| `Senha` | *(sem descrição)* |
| `SQL` | *(sem descrição)* |
| `SqlLongo` | *(sem descrição)* |
| `Tabela` | *(sem descrição)* |
| `Tabulacao` | *(sem descrição)* |
| `Tabular` | *(sem descrição)* |
| `Tamanho` | *(sem descrição)* |
| `TamanhoMaximo` | *(sem descrição)* |
| `Tipo` | *(sem descrição)* |
| `TipoSQL` | *(sem descrição)* |
| `URL` | *(sem descrição)* |
| `ValorCheck` | *(sem descrição)* |
| `ValorUnCheck` | *(sem descrição)* |
| `Valores` | *(sem descrição)* |
| `Visivel` | *(sem descrição)* |
| `Tamanho` | Valor numérico que representa a largura de um componente |
| `Valores` | Representa uma lista de valores. Cada elemento está em uma linha distinta |
| `ApenasLeitura` | Valor lógico que informa se o componente é apenas para leitura |
| `Altura` | Valor numérico que representa a altura de um componente ou formulário |
| `Lista de Objetos` | Representa um mapa, onde a quebra de linha separa cada dupla chave e valor e o caracter '=' separa uma chave de um valor |

---

## Templates de Geração de Código

O Webrun utiliza templates na pasta `codeTemplates/` para gerar código Java a partir das definições do Maker:

### system.template (323 linhas)

Gera uma classe Java para cada **sistema** Maker. A classe gerada:
- Estende funcionalidade base do WFRSystem
- Registra formulários e menus do sistema
- Define propriedades avançadas e de segurança
- Configura conexões com banco de dados

### form.template (115 linhas)

Gera uma classe Java para cada **formulário** Maker. A classe gerada:
- Estende funcionalidade base do WFRForm
- Registra componentes do formulário
- Define campos, tabelas e SQL associados
- Configura regras e ações do formulário

### component.template (59 linhas)

Gera uma classe Java para cada **componente** que possui lógica server-side. A classe gerada:
- Estende WFRComponent
- Define propriedades visuais e de dados
- Registra eventos e ações do componente

### Variáveis de Template

Os templates usam a sintaxe `<%VARIAVEL%>` que é substituída pelo gerador de código:

| Variável | Descrição |
|----------|-----------|
| `<%PACKAGE%>` | Pacote Java da classe gerada |
| *(outras)* | Propriedades específicas de cada tipo |

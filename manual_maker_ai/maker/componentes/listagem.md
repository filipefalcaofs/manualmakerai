# Listagem

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/listagem

# Listagem

![listagem_icone_maker.jpg](data:image/webp;base64,UklGRkgAAABXRUJQVlA4TDsAAAAvH8AHAA9wo78b/d3ob/7jAQoiWakOUGtgAysZ1RCGIYDfBhH9J5ikqbZj+HcY9ALhkOrKbH93IpxvAQA=)

Componente Listagem gera uma interface configurável em um ambiente de produção, sendo possível customizar de forma prática. No momento da sua utilização, ele conta com as seguintes funcionalidades:

- Geração de relatório customizado em tempo de execução.
- Versionamento da configuração do relatório.
- Formatos suportados:

  1. EXCEL
  2. PDF
  3. TXT
  4. WORD
- Configuração de título para uma única impressão.
- Definição de filtros com qualquer campo disponível.
- Modificação da consulta em tempo de execução.
- Suporte a filtro por função ":FUNCAO\_sessao".
- Separador - Campo responsável por realizar a separação das colunas de acordo o valor informado (disponível apenas para o formato TXT).

![](/assets/images/listagem_imagem_webrun-b4952334b7817098aa0d685eb05df9f5.webp)

**Propriedades em comum:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Altura | Define a altura do componente | Inteiro | 250 |
| Código | Informa o código gerado pelo Maker ao qual o componente/formulário foi associado. De forma geral, não interfere nas características do componente. | Inteiro | 5 |
| Container | Informa em qual container o componente irá ser inserido. | Indefinido |  |
| Dica | Armazena uma dica para o componente, o qual se torna acessível no modo de inserção ou alteração. | Letras | "Digite o CPF do cliente" |
| Habilitado | Torna o componente possível ser editado ou manipulado. | Lógico | Sim |
| PosiçãoX e PosiçãoY | O "X" determina a posição do componente em relação à esquerda do formulário, e o "Y" em relação ao topo. | Inteiro | 100 |
| Tabulação | Indica a ordem de tabulação do componente em relação aos outros que compõem a aba do formulário na qual está posto. Essa ordem pode ser observada quando o usuário altera o estado do formulário/grade para o modo de inclusão ou edição e navega entre os componentes/campos usando a tecla Tab. | Inteiro | 2 |
| Tabular | Selecionando a opção Sim, quando o usuário estiver navegando entre os componentes, como foi descrito no item anterior, o componente receberá foco (observada a ordem de tabulação). | Lógico | Sim |
| Tamanho | Aplicado a todos - determina a largura do componente ou formulário. | Inteiro | 100 |
| Visível | Aplicada a todos os componentes, com exceção da Moldura e do objeto formulário - Selecionando a opção Sim, o componente aparece no formulário. | Lógico | Sim |
| Nome | Aplicada a todos os componentes e para o objeto formulário - apresenta o nome do componente. O Maker sugere um nome diferente dos nomes dos componentes existentes no formulário para evitar que mais de um componente possua o mesmo nome. | Letras | "Tabela de Consumidores" |
| Descrição | Aplicada a todos os componentes exceto para os componentes Árvore, Grade, Moldura, Imagem e para o objeto formulário - É a legenda que aparece sobre o componente para identificar (resumidamente) qual a sua função. Observação: Ao selecionar um determinado campo o Maker irá sugerir uma descrição obtida no dicionários de dados, caso o usuário deseje deixar o campo da descrição em branco basta apagá-lo e clicar fora do componente. | Letras | "Insira aqui a idade do consumidor" |

**Propriedades específicas do componente Listagem:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| SQL | Defina a consulta com todos os campos possíveis para impressão de um relatório, dando a possibilidade de escolha na hora de execução. | SQL | SELECT \* FROM table\_relatorios |
| Nome do Relatório | O nome do Relatório pode ser definido um padrão que pode ser configurado em Produção caso deseje. | Letras | "Nome do relatório" |
| Modo de Visualização | Selecione entre o modo clássico ou avançado para escolher qual será a interface que será mostrada ao iniciar o componente. | Indefinido | Modo Avançado |
| Msg Aguarde | Mensagem enquanto o relatório é gerado. | Letras | "Por favor, aguarde..." |
| Gravar Log | Armazena o log da geração do relatório | Lógico | Sim |
| Caminho dos Relatórios | Diretório de armazenamento dos arquivos para geração do relatório. | Letras | "C://Relatorios" |
| Permitir Mudar Consulta | Quando definido como verdadeiro o usuário poderá modificar em tempo de execução a consulta aplicada no componente. | Lógico | Sim |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Antes de imprimir | Este evento executará o fluxo informado antes de imprimir. | - |
| Ao modificar consulta | Este evento executará o fluxo informado ao modificar consulta. | - |
| Ao clicar na consulta | Este evento executará o fluxo informado ao clicar na consulta. | - |

**Para configurar o componente, utilize a propriedade "SQL":**

![Imagem do componente listagem](/assets/images/listagem_imagem_maker-191343b74304560ac7ecb01b14741fd0.webp)

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

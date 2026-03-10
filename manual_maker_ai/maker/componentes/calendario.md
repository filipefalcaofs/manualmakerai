# Calendário

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/calendario

# Calendário

O Componente Calendário tem como funcionalidade mostrar um calendário no formulário.

Calendário:

![](/assets/images/calendario_image-f66156a3f312edac2f858c828bb1f364.png)
*Imagem 1 - Interface Componente Calendário*

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

**Propriedades específicas do componente Calendário:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| SQL Feriado | Permite fazer uma consulta SQL para mostrar os feriados. | SQL | SELECT \* FROM tabela\_feriados |
| Campo Data | Seleciona o campo que vai receber a data do SQL Feriado. | Letras | data\_inicio |
| Campo Descrição | Seleciona o campo que vai conter a descrição do SQL Feriado. | Letras | data\_feriado |
| `Maker` Integrar Google Calendar | Permite a integração com a API do Google Calendar. | Lógico | Sim |
| Id do Cliente | Código de identificação exclusivo do OAuth Client do projeto Google. | Letras | d5mg1gb10qfh9fba vqid5offk3fon26f.apps. googleusercontent.com |
| Chave de API | Código de identificação exclusivo da API Google. | Letras | BIzaSyCDdWsKA cVmyqvJ8G17T7UpU IRuV3dVqO7 |
| SQL Atividade | Permite fazer uma consulta SQL para mostrar as atividades agendadas. | SQL | SELECT \* FROM tabela\_atividades |
| Campo Data Início | Seleciona o campo que vai receber a data inicial do SQL Atividade. | Letras | data\_inicio |
| Campo Data Fim | Seleciona o campo que vai receber a data final do SQL Atividade. | Letras | data\_fim |
| Campo Descrição | Seleciona o campo que vai receber a descrição do SQL Atividade. | Letras | ati\_descricao |
| Exibir Números dos Dias | Exibe os números do dias em certas partes do calendário. | Lógico | Sim |
| Botão Avançar Para Dia Atual | Avança para o dia atual no Calendário. | Lógico | Sim |
| Exibir Mês e Ano Atual | Exibe título do calendário, determinando mês e ano atual. | Lógico | Sim |
| Destacar Horário Comercial | Destaca no calendário o horário comercial. (Segunda à Sexta, das 9am - 5pm). | Lógico | Sim |
| Modo de Visualização | Define o modo de visualização do calendário. - Mês: Visualização padrão de um calendário, exibindo todos itens do mês. - Semana: Visualização dos dias da semana. - Dia: Visualização das horas do dia. OBS: O usuário poderá alterar a visualização pela barra de navegação do calendário, essa propriedade define qual vai ser o modo de visualização inicial. | Lista | Mês |
| Permitir Alterar Modo de Visualização | Permite alterar o modo de visualização do calendário. | Lógico | Sim |
| Menu de Contexto | Define se poderá ser aberto o Menu de Contexto no calendário ao pressionar o botão direito. | Lógico | Sim |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao Atualizar | Executado ao atualizar o componente calendário. | - |
| Ao Modificar Mês | Executado ao modificar o mês do calendário. | Número equivalente ao Mês |
| Ao Modificar Ano | Executado ao modificar o ano do calendário. | Número equivalente ao Ano |
| Ao Clicar no Dia | Executado ao clicar no dia do calendário. | Passa a Data do Dia clicado. |
| Ao Clicar no Evento | Executado ao clicar no evento definido no calendário. | Passa o Objeto Evento |
| Ao Mover Evento | Executado ao mover o evento no componente calendário. | Passa o Objeto Evento |
| Ao Redimensionar Evento | Executado ao redimensionar o evento no componente calendário. | Passa o Objeto Evento |
| Ao Abrir Menu de Contexto | Executado ao abrir o menu de contexto. | ID do evento, Posição X e Posição Y. |
| Ao Fechar Menu de Contexto | Executado ao fechar o menu de contexto. | - |

---

`MAKER 5 __Integração Google Calendar API:__`

1. Para realizar a integração com o *Google Calendário* é necessário acessar o [Google Cloud](https://console.cloud.google.com) e logar em uma conta Google.

![](/assets/images/googleCalendar_8-2ad9a14b3ce69bfdcff34d72e2efb52b.png)
*Imagem 2 - Tela Inicial Google Cloud*

2. Crie um projeto para a utilização das funcionalidades *Google API*. Obs.: Caso a conta cadastrada na *Google Cloud* seja empresarial é necessário entrar em contato com administrador para efetuar a integração, pois não é possível selecionar e nem criar uma organização com uma conta empresarial na tela de criação de projeto. Ex: [[email protected]](/cdn-cgi/l/email-protection#a6c8c9cbc3e6c7cbc7dcc9c888c5c9cb)

![](/assets/images/googleCalendar_1-12aff3a6f339898bbe9d7a9045b7f640.png)
*Imagem 3 - Tela de Projetos*

3. Após a criação do projeto, localize no menu lateral *APIs e serviços* e selecione no submenu a opção *Biblioteca*.

![](/assets/images/googleCalendar_2-e90a6079e60d5e9e8661403083d0b27d.png)
*Imagem 4 - Aba de APIs e Serviços*

4. Na tela de *Biblioteca* realize uma busca por **Google Calendar API** e clique em ativar.

![](/assets/images/googleCalendar_3-6e66eac0da5fb89e8d6e20809bd7abb7.png)
*Imagem 5 - Biblioteca de APIs*

5. Na tela de *Credenciais* deve ser configurada a permissão do OAuth 2 e liberado o acesso externo.

![](/assets/images/googleCalendar_9-abc23f31be9befa8f66669bda54816ae.png)
*Imagem 6 - Configurar Consentimento*

6. Cadastre as informações do seu sistema. *Não se faz necessário preencher o seguimento de **Escopos***.
7. Realizado a configuração da permissão do OAuth 2, iremos adicionar os usuários de testes da API, esses usuários terão a permissão única das contas do Google e poderão testar a integração na fase de testes.

![](/assets/images/googleCalendar_4-a74a642a30e6f3eafe2c4114b2ef9f59.png)
*Imagem 7 - Tela de Permissões OAuth*

8. Finalizada a configuração da tela de permissões volte para a tela de credenciais e clique em *Criar Credenciais*, primeiro crie uma *Chave de API*.

![](/assets/images/googleCalendar_5-03e60d1d5ad72bca6c55fe23d1d9bbd1.png)
*Imagem 8 - Tela de Credenciais*

9. Logo em seguida devemos criar um *ID de Cliente OAuth*, é fundamental que o tipo da aplicação seja Web. Após a criação do *ID de Cliente OAuth* devemos adicionar a *URL* do contexto da aplicação nas propriedades *Origem JavaScript Autorizados* e *URIs de redirecionamento autorizados*, exemplo: *<http://localhost:2020>* ou *<https://softwell.com.br>*.

![](/assets/images/googleCalendar_6-cd9b2fa9714eedf6be8a6f14fb4ca972.png)
*Imagem 9 - Tela de Criação de Id do Cliente*

10. Após a criação das credenciais devemos incluí-las nas propriedades *Chave de API* e *ID do Cliente* do componente *Calendário* dentro do *Maker Studio*.

Na conclusão das configurações, as funcionalidades do **Google Calendar API** estarão disponíveis para utilização em seu projeto.

Observações:

- As configurações é realizada para a utilização do **Google Calendar API** no ambiente de desenvolvimento/testes, caso queira implementar no ambiente de produção é necessário acessar o console do **Google Cloud** e localizar no menu *Tela de Permissão OAuth* e clicar em publicar aplicativo seguindo o passo a passo de configurações. Após um período de avaliação o recurso estará disponível.

![](/assets/images/googleCalendar_7-afc2245a419fee4954fa53ff32d8ca56.png)
*Imagem 10 - Publicar Projeto*

[Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

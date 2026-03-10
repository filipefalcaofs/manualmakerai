# System Inspector: Validação Automatizada de Formulários

> Fonte: https://manual.softwell.com.br/docs/webrun/system_inspector_documentation

# System Inspector: Validação Automatizada de Formulários

### **Diagnóstico Inteligente e Sob Demanda para Formulários Web**

O **System Inspector** é uma ferramenta de automação projetada para se integrar à plataforma Maker Web, oferecendo aos desenvolvedores um mecanismo robusto para a validação de formulários em tempo real. O seu principal objetivo é realizar um teste focado nas operações essenciais de um formulário (CRUD), garantindo que as funcionalidades vitais estejam operando corretamente durante o desenvolvimento ou manutenção.

Através de um único clique, o desenvolvedor pode acionar uma suíte de testes completa para o formulário em que está trabalhando. O resultado é uma análise detalhada, enriquecida com Inteligência Artificial, que não apenas aponta os erros, mas também fornece recomendações, sendo entregue diretamente no e-mail do usuário.

### Objetivo Principal

Acelerar o ciclo de desenvolvimento e garantir a qualidade das entregas na plataforma Maker. Ao automatizar os testes mais comuns e repetitivos de um formulário, o System Inspector permite que os desenvolvedores:

- **Identificação rápida de falhas:** Detecção imediata de problemas nas operações de criar, ler, atualizar e deletar registros, no momento em que ocorrem.
- **Redução do esforço manual:** Eliminação da necessidade de preenchimento e verificação repetitiva de formulários a cada modificação.
- **Maior confiança nas entregas:** Garantia contínua de que as principais funcionalidades permanecem operando conforme o esperado.
- **Feedback qualificado:** As análises com IA apontam causas prováveis dos erros e orientações para correção.

### Como Funciona: Um Mergulho Técnico

O processo tem início com a ação do usuário diretamente na interface do formulário, e toda a execução ocorre de forma automatizada por uma arquitetura de microsserviços.

#### 1. Ponto de Partida: O Botão "Inspecionar"

Dentro de um formulário na plataforma Maker, o desenvolvedor terá acesso a um botão de acionamento do System Inspector.

![Botão de acionamento do System Inspector](/assets/images/system_inspector_1-c17e1526e42881df8d4ea108e5c8d613.png)

Ao ser clicado, uma requisição é enviada para a API do serviço, contendo o contexto necessário para a execução, como a URL do sistema, o código do formulário (`SYS_COD`) e as credenciais de acesso.

#### 2. Fluxo de Execução Automatizada

A execução do System Inspector é iniciada a partir da interface da plataforma Maker, por meio de um botão específico presente nos formulários. Ao ser acionado, o sistema realiza uma chamada HTTP do tipo **POST** para a API central de inspeção, disparando uma cadeia automatizada de eventos coordenada por microsserviços.

![Processo de inspeção em andamento](/assets/images/system_inspector_2-214dbcaea34231161a6d45fe056474c3.gif)

A seguir, o fluxo é conduzido pelas seguintes etapas:

1. **Configuração do Ambiente de Teste:**  
   O serviço configura o ambiente de logs da execução.
2. **Login e Acesso ao Formulário:**  
   O RPA efetua login no sistema com as credenciais fornecidas e navega automaticamente até o formulário indicado.
3. **Inspeção Técnica com Evidências Visuais:**  
   Antes do início dos testes funcionais, o sistema verifica se os objetos do formulário (menus, abas, campos) estão visíveis e habilitados. Durante o processo, capturas de tela são realizadas e armazenadas para futura análise.
4. **Execução de Testes CRUD:**  
   São simuladas as quatro operações fundamentais:

   - **Create:** inclusão de novo registro;
   - **Read:** validação da leitura do dado salvo;
   - **Update:** edição e salvamento;
   - **Delete:** exclusão do registro criado;
   - A ordem de tabulação entre os campos também é validada automaticamente.
   - E o alinhamento dos campos são validados automaticamente.

   Durante essas operações, todas as ações são registradas em dois arquivos de log distintos.
5. **Diagnóstico Inteligente com IA (Fase 1):**  
   Ao término dos testes, os logs e imagens são enviados ao primeiro assistente de IA, responsável por:

   - Identificar erros por formulário, objeto e mensagem;
   - Sugerir causas prováveis;
   - Retornar um HTML estruturado com diagnóstico técnico.
6. **Validação Visual e UX (Fase 2):**  
   Um segundo assistente de IA realiza inspeções adicionais:

   - Valida erros ortográficos nos elementos;
   - Verifica alinhamento visual;
   - Detecta falhas de tabulação entre campos de acordo com a imagem e com o log.
   - Retorna um HTML estruturado com diagnóstico técnico.
7. **Geração e Entrega dos Relatórios:**  
   Com base nas análises, o sistema gera um relatório final nos formatos **HTML** e **PDF**, que é enviado por e-mail ao usuário solicitante. As imagens armazenadas são removidas após o envio.

#### Casos Excluídos Automaticamente

- Formulários sem barra de navegação ativa;
- Formulário nativo de usuários.

### Conclusão

O **System Inspector** é uma ferramenta de automação para a plataforma Maker No-Code que valida formulários com um único clique. Utilizando *RPA* e *Inteligência Artificial*, a solução executa testes de CRUD, usabilidade e alinhamento visual, gerando um diagnóstico detalhado com recomendações de correção. Seu objetivo é acelerar o ciclo de desenvolvimento, reduzir o esforço de teste manual e elevar a qualidade das entregas, fornecendo um relatório completo via e-mail diretamente ao desenvolvedor.

# Assistente de Criação de Formulários

> Fonte: https://manual.softwell.com.br/docs/ai/assistente-de-criacao-de-formul%C3%A1rios

# Assistente de Criação de Formulários

### **Prototipação Acelerada e Geração Inteligente de Estruturas**

O desenvolvimento de aplicações muitas vezes exige a criação manual de formulários, tabelas e menus com estrutura e relacionamento complexos. Essa etapa, ainda que fundamental, pode se tornar repetitiva e sujeita a falhas. Para resolver esse gargalo, o Maker AI oferece o recurso **"Assistente de Criação de Formulários"**, que transforma instruções textuais em objetos funcionais do sistema.

A solução **Assistente de Criação de Formulários** foi criada para:

- **Eliminar tarefas repetitivas** no início do desenvolvimento;
- **Aumentar a produtividade** na prototipação de sistemas;
- **Reduzir a inconsistência técnica** causada por implementações manuais;
- **Entregar rapidamente um modelo funcional** para validação de requisitos.

![Prompt para criação de formulários](/assets/images/criacao_formulario_prompt-a460701f0793069319be5afce443b781.png)

---

### **Funcionamento Técnico**

O Assistente de Criação de Formulários interpreta entradas fornecidas pelo usuário (seja por **prompt textual ou arquivo anexo (PDF ou imagem)**) e as converte automaticamente em formulários completos, incluindo base de dados, relacionamentos, componentes visuais, menus e dados de teste, a partir de uma análise semântica e estrutural avançada.

---

#### **Entrada via Prompt**

Nesta modalidade, o desenvolvedor fornece um comando em linguagem natural, descrevendo a estrutura desejada da aplicação.

**Exemplo de prompt:**

> "Preciso de um sistema de controle de produtos e fornecedores com estoque."

O Assistente de Criação interpreta o conteúdo informado e transforma automaticamente o modelo conceitual em elementos prontos para uso no Maker.

![Exemplo de entrada via prompt](/assets/images/entrada_prompt_exemplo-e729d37319470508ccc9b5baf2a9c563.gif)

A partir da análise, ele cria:

- **Tabelas no banco de dados**: nomenclatura padronizada, chaves primárias/estrangeiras, índices e restrições prontos para uso.
- **Formulários completos**: campos com tipos, máscaras (CPF/CNPJ, data, moeda), validações, ordem alinhada ao padrão Maker e textos de dica/placeholder quando valor nulo.
- **Componentes visuais inteligentes**: grade, lista dinâmica, lista simples, checkbox, upload de imagem, busca vinculada, subformulários, etc.
- **População com dados de teste**: dados contextualizados para testes imediatos.
- **Agrupamento e menu**: organização contextual dos formulários e opção de inserir automaticamente itens no menu com ícones e rótulos amigáveis.

Antes de finalizar, o assistente apresenta uma **pré-visualização interativa**, onde o usuário vê todos os elementos gerados — nomes técnicos, tipos de campo, máscaras aplicadas e vínculos — e decide se mantém, ajusta ou remove qualquer item, bem como se insere ou não no menu.

![Seleção de formulários e opções](/assets/images/selecao_formularios-51dc90a555748e2edb126d82118e22dc.gif)

---

#### **Entrada via Arquivo**

Além do prompt textual, o assistente também aceita o envio de arquivos anexos para complementar ou guiar a criação dos formulários.

##### **Tipos de arquivo suportados:**

- **Documentos PDF** contendo requisitos, especificações ou descrições do sistema;
- **Imagens** (ex: Documentos de Requisitos) que representem a estrutura ou processos esperados.

##### **Exemplo prático:**

> Um usuário anexa um PDF com o documento de requisitos de um sistema de estoque e, junto, envia um prompt textual simples:  
> "Baseado nesse documento, crie formulários para cadastro de produtos, categorias e movimentações."

O assistente processa o PDF e o prompt, gerando automaticamente as estruturas físicas e os formulários correspondentes, prontos para uso.

![Upload de arquivo para entrada](/assets/images/upload_arquivo_prompt-d4624f43257e71826c5ffadaca9e3e37.gif)

---

### **Histórico de Prompts**

Para otimizar o trabalho, o assistente oferece um recurso de histórico de prompts:

- Ao abrir o prompt para criação de formulários, o usuário pode acessar o histórico pressionando **Ctrl + M Histórico**;
- Esse histórico mantém registros de todos os prompts anteriores enviados pelo usuário;
- O usuário pode reutilizar prompts antigos ao clicar duas vezes no registro, ajustando somente as partes necessárias, o que acelera o processo de criação e mantém consistência entre projetos;
- O histórico também facilita a revisão e repetição de padrões comuns na geração de formulários.

---

### **População com Dados de Teste**

Todos os formulários criados vêm preenchidos com dados fictícios e contextualizados, facilitando a validação e testes imediatos sem necessidade de entrada manual inicial.

---

### **Principais Benefícios**

- **Aceleração no Ciclo de Desenvolvimento**: criação em segundos, eliminando tarefas repetitivas.
- **Redução de Erros Humanos**: aplicação consistente de regras técnicas e padrões.
- **Padronização Técnica**: objetos aderentes aos padrões Maker garantem coerência.
- **Geração de Protótipos Executáveis**: prontos para validação com dados reais simulados.
- **Adoção de Boas Práticas**: modelagem correta de relacionamentos, índices e interfaces.

---

### **Comparativo de Produtividade**

| Atividade | Método Tradicional | Com Assistente Automatizado | Ganho de Tempo Estimado |
| --- | --- | --- | --- |
| Modelagem de Entidades | 2–4 horas | 30 segundos | > 95% |
| Criação de Formulários | 8–12 horas | 5 minutos | > 95% |
| Inserção em Menu | 30 minutos | Instantâneo | 100% |
| Inserção de Dados de Teste | 1–2 horas | Automático | 100% |

---

### **Requisitos Técnicos**

- Plataforma Maker (versão com suporte à IA);
- Permissões para escrita em:
  - Banco de dados (tabelas, índices);
  - Estrutura de formulários;
  - Menu de navegação da aplicação;
- Acesso à funcionalidade **Copilot** via menu.

---

### **Como Acessar**

O assistente pode ser acessado por:

- **Menu Superior**:  
  `Copilot > Assistente de Criação de Sistemas`
- **Botão Direito no Painel de Formulários**:  
  `Novo Formulário > Criar com Assistente`

---

### **Conclusão**

O Assistente de Criação de Formulários representa um avanço tecnológico que automatiza a modelagem e estruturação de sistemas no Maker. Através da análise inteligente de texto e arquivos, ele gera rapidamente estruturas técnicas completas e funcionais, promovendo agilidade, padronização e qualidade no desenvolvimento de aplicações.

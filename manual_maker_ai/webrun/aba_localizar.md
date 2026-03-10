# Nova Aba Localizar

> Fonte: https://manual.softwell.com.br/docs/webrun/aba_localizar

# Nova Aba Localizar

A **Aba Localizar** é um recurso nativo da plataforma **Maker AI** que permite aos usuários localizar, consultar, editar ou excluir registros de forma rápida e simplificada, diretamente nos formulários de dados do sistema.

Com a reformulação da interface e o aprimoramento das funcionalidades, essa aba passou a oferecer uma experiência muito mais eficiente, moderna e acessível, respeitando padrões de usabilidade e design atualizados.

![Busca Genérica](/assets/images/aba_localizar_gif1-6a91daef22eb6d10153752db48421a93.gif)

---

## Finalidade

O objetivo principal da **Aba Localizar** é prover uma **camada padronizada de consulta e gerenciamento de registros** dentro dos formulários desenvolvidos, eliminando a necessidade de construção manual de grades de pesquisa.

---

## O que mudou?

A nova versão da Aba Localizar passou por **uma completa reestruturação visual, funcional e técnica**. Abaixo, destacamos os principais aprimoramentos:

### 1. Interface Visual Redesenhada

- Adotado um **visual mais limpo, moderno e intuitivo**, com melhor aproveitamento do espaço em tela
- Alinhamento à identidade visual do Maker AI, promovendo **coesão entre as telas da plataforma**
- Cores, ícones e espaçamentos otimizados para melhor **legibilidade e navegabilidade**
- Redução da curva de aprendizado por parte dos usuários finais

![Interface da aba localizar](/assets/images/localizar_1-27b88120964d8e67bbb0da020a0a348d.png)

---

### 2. Filtro Genérico Inteligente

- Novo campo de busca ampla no topo da aba
- Permite **realizar buscas em todos os campos do formulário de uma vez**, sem selecionar colunas específicas
- O usuário define o **tipo de comparação** (`Contém`, `Começa com`, `Igual a`, etc.)
- Excelente para localizar registros por palavras-chave, nomes, códigos ou termos parciais

**Benefício técnico:** Reduz significativamente o tempo de implementação de funcionalidades de busca no sistema e melhora a autonomia do usuário.

![Busca Genérica](/assets/images/aba_localizar_gif3-bfe975605b7cff6916f9a663c175942c.gif)

---

### 3. Filtros Avançados por Campo

- Cada coluna do formulário conta com seu próprio campo de filtro individual
- Suporte a diversos tipos de operadores por campo:
  - `Contém`
  - `Igual`
  - `Maior que`, `Menor que`, etc.
- Ideal para **consultas refinadas e cruzamento de critérios múltiplos**

**Benefício técnico:** Otimiza a visualização e melhora a experiência de busca.

![Busca Genérica](/assets/images/aba_localizar_gif2-953323333558fe0e3157319b985217b3.gif)

---

### 4. Coluna de Ação Integrada

- Inclusão de uma **coluna fixa de ações** em cada linha da grade
- Possibilidade de editar (`✏️`) ou excluir (`🗑️`) o registro diretamente pela interface
- Ações rápidas reduzem o número de cliques e telas envolvidas nas operações

**Benefício técnico:** Simplifica o uso do sistema, reduz erros de navegação e melhora a produtividade operacional.

![Busca Genérica](/assets/images/aba_localizar_gif4-56ce137d0bf87d8d05436e56afd8f319.gif)

---

### 5. Paginação Automática

- Implementação nativa de paginação de registros
- O usuário visualiza um número definido de registros por página, com opção de navegação sequencial
- Melhor disposição dos registros para melhor uso do usuário

**Benefício técnico:** Garante maior **performance**, principalmente em formulários com grande volume de dados.

![Busca Genérica](/assets/images/aba_localizar_gif5-05f4afd32f30eb7f91d1ced27193b1c9.gif)

---

### 6. Responsividade e Mobile First

- Comportamento responsivo aprimorado
- A aba se adapta automaticamente a diferentes **resoluções de tela e dispositivos** (desktop, tablets, smartphones)
- Otimizada para uso por toque, ideal para usuários em campo ou mobilidade

**Benefício técnico:** Amplia o alcance do sistema e permite operações em qualquer contexto, sem prejuízo da experiência do usuário.

![Interface da aba localizar](/assets/images/localizar_2-6ae0c2b762401b077dd5585b307c48bc.png)

---

### 7. Exportação de Dados

- Exportação direta da listagem para múltiplos formatos:
  - `.xlsx`
  - `.txt`
  - `.pdf`
  - `.json`
  - entre outros
- Exporta os registros filtrados no momento da ação
- Nome do arquivo é gerado com base no contexto do formulário

**Benefício técnico:** Facilita a criação de relatórios externos, integração com outras ferramentas, backup local e compartilhamento de dados.

![Interface da aba localizar](/assets/images/localizar_3-fab9d7ea20b1c81c40bbc4c5ccfcffdd.png)

---

### 8. Ordenação por Coluna

- Permite ordenar qualquer coluna da grade em ordem crescente ou decrescente
- A ordenação é aplicada ao clicar no cabeçalho da coluna
- Suporte nativo a tipos de dados como textos, números e datas

**Benefício técnico:** Melhora a leitura e navegação de registros em listas extensas, eliminando a necessidade de criação de ordenações personalizadas.

![Busca Genérica](/assets/images/aba_localizar_gif6-7bb6afc95ed61595281c96cb0846c932.gif)

---

## Vantagens Técnicas Consolidadas

| Recurso | Benefício Técnico |
| --- | --- |
| Filtro Genérico | Reduz complexidade de consultas e melhora experiência de busca |
| Filtros Avançados | Melhor organização para a busca causando menos confusão ao usuário |
| Coluna de Ações | Elimina a quantidade de cliques necessários para a execução dessas ações |
| Paginação Automática | Otimiza a disposição de informações e registros |
| Suporte Mobile | Melhora a utilização da aba em contextos remotos |
| Redesign Visual | Melhora a visualização das informações sem gerar poluição visual |
| Exportação de Dados | Permite integração com análises externas, relatórios e backups manuais |
| Ordenação por Coluna | Facilita a leitura e priorização de informações dentro do próprio formulário |

---

## Conheça

[](/videos/aba-localizar.mp4)

## Conclusão

A nova **Aba Localizar Automática** representa uma evolução importante no desenvolvimento de sistemas com Maker AI. Ao unir **padronização, flexibilidade e usabilidade**, ela:

- **Melhora o desempenho** da plataforma
- **Reduz o esforço de desenvolvimento** e manutenção de formulários de consulta
- **Oferece autonomia para os usuários finais** realizarem pesquisas e operações com agilidade
- **Aumenta a consistência entre sistemas**, favorecendo treinamentos e adoção em larga escala

Recomenda-se fortemente que todos os sistemas utilizem essa funcionalidade nativa sempre que possível, garantindo **modernização, acessibilidade e eficiência** nas operações.

## Observações

A partir da versão **6.1.0.14** do Webrun, a **Aba Localizar** passou a permitir a exibição de campos configurados com a propriedade **Campo Lista**, em vez de **Campo Chave**, nas colunas vinculadas aos componentes **Lista Dinâmica** e **Lista Simples**.

Para utilizar esse recurso, é necessário ativar no formulário a propriedade **Exibir Campo Lista (Lista e Lista Dinâmica)**, que, por padrão, é definida como **falso**.

Ao realizar buscas utilizando esse campo, nos **filtros avançados** será apresentada uma lista com os possíveis valores disponíveis para pesquisa. Já na **busca genérica**, serão considerados apenas os registros cujo valor do campo seja **exatamente igual** ao texto informado na pesquisa.

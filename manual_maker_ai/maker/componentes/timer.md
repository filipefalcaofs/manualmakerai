# Timer

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/timer

# Timer

O Componente Timer tem como funcionalidade marcar o tempo de execução de um sistema.

![](data:image/png;base64,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)

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

**Propriedades em específico do componente Timer:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Estilo da Fonte | Fonte em que os números do contador iriam ficar. | Letras | Arial,22,0000,clBlack |
| Mostrar Iniciar | Mostra o botão iniciar do componente Timer. | Lógico | Sim |
| Mostrar Pausar | Mostra o botão pausar do componente Timer. | Lógico | Sim |
| Mostrar Parar | Mostra o botão parar do componente Timer. | Lógico | Sim |
| Mostrar Reiniciar | Mostra o botão reiniciar do componente Tim | Lógico | Sim |
| Auto Iniciar | Opção que faz com que o componente Timer inicie automaticamente. | Lógico | Sim |
| Valor Inicial | Valor em que o componente Timer irá começar. | Letras | 00:00:10 |
| Tipo | Tipo de contagem do componente Timer. (Progressivo ou Regressivo) | Lista | Progressivo |
| Formato do Timer | Define o formato do tempo no timer. Se essa propriedade não for definida, o componente irá colocar o fallback padrão (HH:MM:SS). | Letras | HH:mm:ss |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao iniciar | Este evento executará o fluxo informado ao iniciar do componente. | - |
| Ao pausar | Este evento executará o fluxo informado ao pausar do componente. | - |
| Ao parar | Este evento executará o fluxo informado ao parar do componente. | - |

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

# Slider

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/slider

# Slider

O ***componente Slider*** permite que o  usuário selecione um valor, e ao deslizar o botão este valor será modificado aonde ele desejar.

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAVsAAAA4CAYAAABT2FutAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKFSURBVHhe7du9alNhHMdxb8CXuxEnvQO9EMGpi1LUuHXRgghFhw52dXKQoh0CrkqpdLRisW0iuEjrG/QxT3OKYE7a5JzTP2nz+cAPepK0Q4Yvh6fJuQTAiRNbgABiCxBAbAECiC1AALEFCCC2AAHEFiCA2AIEEFuAAGILEEBsAQKILUAAsQUIILYAAcQWIIDYAgQQW4AAYgsQQGwBAjQS2/dbKd17k9K1ZyldetBf/jk/lp8DmHa1Y/vwbe+P3Bm+HN5HvdcATLNasb3+fDCuw3aj91qAaVU5tsfd0ZYt/w7ANKoU23wOWxbT43ahtZ9evuumj5+3zMwa2afN7fRl52va3ftZFKop3bQ8N5tuzhSba6ed4pkqKsX29qs/pTEdZbdefC99w8zM6m5370dRqbqK0C6uD7keX6XYXnnyuzSko+zy41+lb5KZWd3lO9xGrC317maX0mpxeaDTTq2Z+bTcKa7HVCm25+/vl4Z0lOWjhLI3ycys7jY2t4tK1bO6WHYXu54WZmbTwlpxOabw2ObfLXuTzMzqrpnY9o8MWivd4vrQsMdH4xjBzM7MmjlGmKDY+geZmU3imvkH2QTFNn/062JrMKTHLR8htD90St8kM7MqO4mPfk3MmW3mSw3AWbWzMj/4udqDTyP89wmFMVSObTbO13XzawFOh/5d7L8jg3pHCFmt2Gb5bvWoI4X8nDta4PTpB/fwG2R1QpvVjm2Wz3Dvvk7p6tN+XPPyz/mxjW/FiwCmWCOxBeBoYgsQQGwBAogtQACxBQggtgABxBYggNgCBBBbgABiCxBAbAECiC1AALEFCCC2AAHEFiCA2AIEEFuAAGILEEBsAQKILcCJS+kvprYsrznMSbIAAAAASUVORK5CYII=)

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

**Propriedades específicas do componente Slider:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Valor inicial | Valor mínimo que o marcador pode atingir. | Inteiro | 0 |
| Valor final | Valor máximo que o marcador pode atingir. | Inteiro | 100 |
| Casas decimais | Permite casas decimais | Lógico | Não |
| Valor inicial do marcador | Valor onde o marcador irá começar ao carregar o componente | Inteiro | 0 |
| Exibir numeração | Exibe a numeração referente ao valor onde o marcador se encontra | Lógico | Sim |

**Eventos:**

| Evento | Descrição | Parâmetro Automático |
| --- | --- | --- |
| Ao finalizar movimento | Este evento executará o fluxo informado quando o movimento do marcador for finalizado | Valor onde o marcador finalizou o movimento |

- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

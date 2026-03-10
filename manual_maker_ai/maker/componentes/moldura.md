# Moldura

> Fonte: https://manual.softwell.com.br/docs/maker/componentes/moldura

# Moldura

![image162.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAYCAIAAABiC9roAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACZSURBVEhL7ZRNCoAgEEYzxAoCL5Mrz+UpPJwdqCgXQ4Q/o0KzCHwbZ6HPDx1lm1KTEAMBI5HXM8JIQFcHMK01lC+stVCVMMZAFZFIXe/1IJM5jBFInAc8RFbtwVcW98bUntz6mkPrfR1AqC5cY1OPB2DqmtZGSDz01qS5BImzbgqLTE5/T5/ww+aTUpKoOefHeZGo52V1u7sBe0ggyklylFEAAAAASUVORK5CYII=)

Esse componente serve para agrupar outros componentes. Ele cria alguns tipos de molduras, podendo, dessa forma, separar e organizar componentes dentro de um formulário.

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

**Propriedades específicas do objeto Moldura:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Considerar Ordenação | Ao selecionar a opção Sim, serão consideradas as opções Trazer para frente e Enviar para trás do item Controles do menu suspenso. Assim, caso o componente Moldura esteja posicionado atrás de um outro componente e tenha sido selecionada a opção Trazer para frente, então as bordas do componente Moldura se sobreporão ao outro componente. | Lógico | Sim |
| Estilo | Selecionando a opção - Levantado: o componente aparece no formulário em alto relevo. Selecionando a opção; - Abaixado: o componente aparece no formulário como se estivesse abaixo do nível do formulário. | Lista | Levantado |
| Forma | Nesta propriedade, definimos o desenho da Moldura: se ele terá o aspecto de uma moldura em si, de uma linha, ou simplesmente um espaço sem linhas no seu contorno. | Lista | Moldura |

**OBS: Quando selecionada a opção Forma**:

- Caixa - modifica a aparência do componente para um quadrado ou retângulo;
- Moldura - modifica a aparência do componente para um quadrado ou retângulo com pontas arredondadas;
- Linha acima - transforma o componente em uma linha (parte superior do componente);
- Linha abaixo - transforma o componente em uma linha (parte inferior do componente);
- Linha à esquerda - transforma o componente em uma linha (parte esquerda do componente);
- Linha a direita - transforma o componente em uma linha (parte direita do componente);
- Espaço - modifica a aparência das linhas delimitadoras do componente, transformando-as em pontilhados.

> Observação: É recomendado que o componente possua altura e/ou largura superior a 5 pixels, pois informando valores menores que isso, as imagens(que compoem o componente) ficarão sobrepostas entre si, apresentando apenas uma linha em seu lugar.

[Propriedades e Eventos Comuns aos Objetos](/docs/maker/propriedades_e_eventos_comum)

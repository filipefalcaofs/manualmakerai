# Gráfico

> Fonte: https://manual.softwell.com.br/docs/maker/grafico

# Gráfico

![image157.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAhCAIAAADYhlU4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACTSURBVEhL7ZZhCsAgCEbbrtW5doouPZkyNuhLMYN++P6kQbzMgo5aa1nMKeNK0mFnD0drTSIvimNeQIwcIQICOqIERN+BBDTvcOs9n8fvsNe0QR3XgyRe9DrsZ4LYu+d20mEnwMEXj5GpPybH94mgmEAvSXfwSt4jit+0S/9/hapGDAREQD/GAiL/iXbSYWe9o5Qb9uExuthg3HcAAAAASUVORK5CYII=)

Este componente permitirá a demonstração de dados vinculados ao formulário principal, por meio de gráficos.

![image316.jpg](/assets/images/image156-7912a69636ea7e30d168cacd9d4653d5.png)

**Observações:**

1. O componente gráfico possui uma característica específica, para a plataforma .net, nesta possuimos uma tabela onde não é possível inserir duas colunas com o mesmo nome. Caso queira-se utilizar campos com o mesmo nome é necessário o uso de Alias, para diferenciá-los.
2. O componente Gráfico, não é visualizado na tela "Editar a ordem de tabulação", pois a tabulação não funciona para esse componente no webrun.
3. Este recurso está disponível apenas para a versão Enterprise.
4. Campos do tipo *DateTime*, apresentará somente a data no componente Gráfico.
5. Utiliza da biblioteca *ECharts* para renderização do componente:

   1. Utilização de Canvas;
   2. Performance;
   3. Animação;
   4. Responsividade;

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

**Propriedades específicas do componente Gráfico:**

| Propriedade | Descrição | Tipo | Exemplo |
| --- | --- | --- | --- |
| Conteúdo da Legenda | Configura a exibição de valores e títulos na legenda. Veja os valores possíveis para essa propriedade abaixo dessa tabela. | Lista | Porcentagem e Etiqueta |
| Cor da Legenda | Define uma cor de preenchimento para a legenda. | Cor |  |
| Estilo da Legenda | Permite especificar os valores que serão apresentados na legenda. Veja os valores possíveis para essa propriedade abaixo dessa tabela. | Lista | Automático |
| Mostrar Grade | Ao selecionar a opção Não, a exibição das grades no formulário será desativada. | Lógico | Sim |
| Mostrar Legenda | Ao selecionar a opção Sim, a legenda do componente será exibida. A exibição da Legenda depende também que a opção Aparecer na Legenda (campo Check da tela Propriedades da Série) esteja marcada e também a opção Mostrar (tela Gráfico, aba Opções). | Lógico | Sim |
| Posição da Legenda | Determina o posicionamento da legenda na área do gráfico. Contém as seguintes opções: - Abaixo: A legenda se posiciona abaixo do gráfico; - Acima: A legenda se posiciona entre a imagem e o título do gráfico; - Direita: A legenda se posiciona à direita do gráfico; - Esquerda: A legenda se posiciona à esquerda do gráfico. | Lista | Acima |
| Orientação da Legenda | Determina a orientação da legenda. Contém as seguintes opções: - Horizontal: Os caracteres da legenda são dispostos horizontalmente. - Vertical: Os caracteres da legenda são dispostos verticalmente. | Lista | Horizontal |
| Séries | Esta é a principal propriedade para a configuração geral do gráfico, envolvendo dados, estilos, conteúdo e outros. | Variante | (Nenhuma) |
| Título | Esta propriedade define título principal do gráfico. | Letras | "Gráfico A" |
| Exibir Dicas da Série | Define se as dicas da série devem ser exibidas. | Lógico | Sim |
| Agrupar Dicas da Série | Define se as dicas da série devem ser agrupadas. | Lógico | Sim |

**Valores possíveis para a propriedade Conteúdo da Legenda:**

| Conteúdo da Legenda | Descrição |
| --- | --- |
| Porcentagem e Etiqueta | Apresenta o percentual correspondente a cada faixa em relação à soma dos valores e seu rótulo correspondente. Geralmente utilizado para gráfico circular de setores. |
| Valor e Etiqueta | Apresenta o valor correspondente a cada faixa e seu rótulo correspondente. |
| Porcentagem | Apresenta o percentual correspondente a cada faixa do gráfico, em relação à soma dos valores. Geralmente utilizado para gráfico circular de setores. |
| Etiqueta e Porcentagem | Apresenta o rótulo e o percentual de cada faixa. Geralmente utilizado para gráfico circular de setores. |
| Etiqueta e Valor | Apresenta o rótulo e o valor de cada faixa do gráfico. |
| Valor | Apresenta o valor correspondente a cada faixa do gráfico. |
| Valor Eixo X e Valor | Apresenta os pontos do eixo X e o valor correspondente a cada faixa do gráfico. |
| Valor Eixo X | Apresenta os pontos do eixo X. |

**Valores possíveis para a propriedade Estilo da Legenda:**

| Estilo da Legenda | Descrição |
| --- | --- |
| Automático | Obtém os valores naturais indicados na série do gráfico |
| Últimos Valores | Obtém os valores naturais indicados no último registro da série do gráfico. |
| Paleta | Obtém os valores naturais indicados na série do gráfico. |
| Séries | Apresenta o próprio nome da série como legenda. |
| Valores | Obtém os valores naturais indicados na série do gráfico. |

- [Definindo Série para o Componente Gráfico](/docs/dicas-e-truques/componente/definindo_serie_componente_grafico).
- [Exemplo de Gráfico no formulário](/docs/dicas-e-truques/componente/exemplo_de_grafico_no_formulario).
- [Propriedades e Eventos em comum aos Objetos](/docs/maker/propriedades_e_eventos_comum)

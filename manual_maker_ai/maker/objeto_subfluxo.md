# Objeto Subfluxo

> Fonte: https://manual.softwell.com.br/docs/maker/objeto_subfluxo

# Objeto Subfluxo

![image112.jpg](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAVCAIAAADaYBkLAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAF5JREFUOE9jtLW1ZaA2YILSVAU0MRTh/c7OTgiDDFBeXg5lgQELlAYDNDkiAaZrUAwFAogKoOn4HQ5XgNUdQyeiRg2lPhg6hqInfnhiJpi78CigSd4f4eXpUDGUgQEAhFsZOMXq7BoAAAAASUVORK5CYII=)

Um objeto Subfluxo é usado para que, de dentro de um fluxo possa, chamar um outro fluxo, inclusive de categorias diferentes.

Observações:

1. A chamada de fluxo entre camadas diferentes só trará retorno caso seja feita de um fluxo cliente para um sub-fluxo servidor.
2. Quando uma Interação de Erro é chamada em um subfluxo cliente, o mesmo não interrompe a execução do fluxo chamador quando o mesmo está na camada servidor. O mesmo ocorre, caso o fluxo seja chamado nos eventos Antes de Inserir, Antes de Deletar ou Antes Alterar do formulário, tais ações não serão interrompidas.

Para usar um Subfluxo, clique no objeto que se encontra na Barra de Ferramentas do Editor de Fluxo de ações e depois clique no local desejado. Execute um clique com o botão da direita do mouse e observe as opções:

- Editar - ativa a tela onde será definido o fluxo que será chamado e os parâmetros de entrada (caso o fluxo escolhido possua):

![image1325.jpg](/assets/images/image339-54a070474d30d55811298b8bb8dacf12.png)

A tela Subfluxo possui os seguintes objetos:

- Barra de título que apresenta o nome do subfluxo selecionado;
- (4) ![image223.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAkCAIAAAARsx0+AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAJhJREFUSEvt1cENgCAMBVAwzsU+MBCzOIZruIVNrAfbQkTbRJO+i1z4fkqMcVm3YGOKdnLO+BZtEz4NeDTh0YRh9PAnU2vF1amUgqurzwyEV+6gAxnafGgNpBfd2nPTjE8GckdPQKqoXSM/ohz9oDKn01q8FSFapTJQaC1WBjRaqzJ427pVGfgfnfBowqOJmFLCpbY/DiSEHee4Juj0KwwFAAAAAElFTkSuQmCC) (carregar subfluxo) - abre o subfluxo selecionado;
- ![image208.gif](data:image/gif;base64,R0lGODdhFAATAPcAAAAAAAA5cxBKeyFShDExMTFSlDFalDk5QjlalEJrtUprlEprtUpzlFJrlFJztVJzvVJ7pVJ7xlpaY1pzxlp7pVp7vWOEpWOMpWtrc2uEvWuMpXM5KXuUrXuUvXucrYQxIYQ5KYSU1oxCOYyMnJQ5OZRCOZRCQpRKUpRSWpRaUpRjWpRjY5Rje5SUnJxja6Vja6Vze6V7jKWtta2ElK2EnK2MlK2MnLWElLW1tbW9vb3Gzr3O3sacpcbO3tbOxtbWxtbe797Wzufe1ufn1ufn3u/n1u/n3u/n5+/v3u/v5+/v7/fv7/f37/f39///9////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAFAATAAAI5gCHcBgQoKDBgwcFXCjCAUKPJxAjSpQIBMLAHRMzTtxBcOIEjU8AQGxSUGKIBCBFNllS0IlLJxEeIHhJE0ATJkkKNtnZZEGTAjyD2sSpc2cFBx0QUAi6c2jOADx97gTK1OaSI0UzGGDCBEGBBlzDAsBppGDYs2i5jk1CxCzXGTFsxHDBA+3atgHCwuCKQkTau27D3viAFkMLAEok4EV7QsVfAADYFkxCOQmLEpUzHwBAgIiQAAJ0CBFCw0SN0S9GqwYwIkgOARYYyPhBYsOKFCBW/Ni9W4IPHAo0IPFAEKHxggI0MAkIADs=) (ascendente) / ![image209.gif](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAARCAIAAABSJhvpAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHKSURBVDhPjZO/SxthGMfvD7g/onOnOBSiIITSoW4ZUohyGLG1uVChDoYDFX+VFlqhd9d6cRAChWrpYCk4aOkgKLhGHUJAsoQMIUZKmx9D0qGfy3PXSxMK+QwP3+e95/O+78GdoqpqIpEwDGNhaBhGQVT0VMq27Uql8ntoGEZBVNLpdLVabbfbv3wmjTMvDaBpT6kMoyAqXIPN5BmsZy4i+lev+RfTzCqKIhkF0ZU7nc5Pn9jqecw4Hpt0vL6HkZF7yOPj98kogfzDZ+L5ITUUtaTtBVMgBzLvcNtleu17zDhac76NxR1t+ZMsCpo2S8W07d1UylUC+aYLx0oADvdSD8gSArnVahWLRf3VSShuEYCTkaPPtqX9C7IElEC+Hg5kCYHcbDYLhcLnzczHpbdftrLU7JP50+wei30gS0AJ5Hw+v59epcJ2NP7mQVhyH8gSArnRaFz5HG5Y66E7XjMAsgQUT67X65c+1sPozsyU1wyALAHFlflES6VSrVbL5XKZuZX3kVHC/0CmMoziftvJZNI0zXK5fPBy14pEDl477Aof5uYl9IJMZRgF0f2fdV1nm3fh0cXwXefxjD316EU3cLE+kKkMo6iq+geuYcULIS12FAAAAABJRU5ErkJggg==) (descendente) - abaixo da barra de título, organiza a lista de subfluxos na ordem ascendente ou descendente;
- (1) ![image224.gif](data:image/gif;base64,R0lGODdh6gATAHAAACwAAAAA6gATAIcAAAAAADMAAGYAAJkAAMwAAP8AKwAAKzMAK2YAK5kAK8wAK/8AVQAAVTMAVWYAVZkAVcwAVf8AgAAAgDMAgGYAgJkAgMwAgP8AqgAAqjMAqmYAqpkAqswAqv8A1QAA1TMA1WYA1ZkA1cwA1f8A/wAA/zMA/2YA/5kA/8wA//8zAAAzADMzAGYzAJkzAMwzAP8zKwAzKzMzK2YzK5kzK8wzK/8zVQAzVTMzVWYzVZkzVcwzVf8zgAAzgDMzgGYzgJkzgMwzgP8zqgAzqjMzqmYzqpkzqswzqv8z1QAz1TMz1WYz1Zkz1cwz1f8z/wAz/zMz/2Yz/5kz/8wz//9mAABmADNmAGZmAJlmAMxmAP9mKwBmKzNmK2ZmK5lmK8xmK/9mVQBmVTNmVWZmVZlmVcxmVf9mgABmgDNmgGZmgJlmgMxmgP9mqgBmqjNmqmZmqplmqsxmqv9m1QBm1TNm1WZm1Zlm1cxm1f9m/wBm/zNm/2Zm/5lm/8xm//+ZAACZADOZAGaZAJmZAMyZAP+ZKwCZKzOZK2aZK5mZK8yZK/+ZVQCZVTOZVWaZVZmZVcyZVf+ZgACZgDOZgGaZgJmZgMyZgP+ZqgCZqjOZqmaZqpmZqsyZqv+Z1QCZ1TOZ1WaZ1ZmZ1cyZ1f+Z/wCZ/zOZ/2aZ/5mZ/8yZ///MAADMADPMAGbMAJnMAMzMAP/MKwDMKzPMK2bMK5nMK8zMK//MVQDMVTPMVWbMVZnMVczMVf/MgADMgDPMgGbMgJnMgMzMgP/MqgDMqjPMqmbMqpnMqszMqv/M1QDM1TPM1WbM1ZnM1czM1f/M/wDM/zPM/2bM/5nM/8zM////AAD/ADP/AGb/AJn/AMz/AP//KwD/KzP/K2b/K5n/K8z/K///VQD/VTP/VWb/VZn/Vcz/Vf//gAD/gDP/gGb/gJn/gMz/gP//qgD/qjP/qmb/qpn/qsz/qv//1QD/1TP/1Wb/1Zn/1cz/1f///wD//zP//2b//5n//8z///8AAAAAAAAAAAAAAAAI/wBviLkRY+ANLjcExhBI0CBChQwLJnwoZuFAiQcTVozoUKPFhhM9cgwJ8WLHkiAzosRI8SNLkSZJboypcmbKliNrujxp8+VKnjtlBhVDFA1RMUaLHk2KdKlTpVCbRmVK9anUq1WnWs2KdatXrWC7huVK9qvYs2XHmjUq0Kjbpm/jwp0rty7du3bz4t2rty/fv34DAx4suDBhvFUNKz68uDHjx44jQ54sWW/TtpQzV9bMebPnzqA3YxYzqWmjpKWNniaaWsxq0qZRx2Y9G7Zq2bdp57btGndv3b95v249vDZx38V3HweePPhy4cijM5cOG2mj2YlDa//Mfbv37uD3Yv9OavfuXvPl5Z5Xn37uevft376XH19qffLo4eenv9/+Y6f3KcWefgPyV6B/B+KXoIAEItiggg8yaKCDE0JYoYQUYmgZfqNdGOCGg/0nmIghGnYYiX6h+Jd/DrZG12powNhcazQ2tVyMbs1o445G3SijbzX2yONvOFoH5JBBEvkjcEkmuWSRvDU55JM6Cmklb2+NN5+DLKa4IH4lRgiml2JCRaaHZq74ZZogomlYaV16p2KbYZ5Zp5onjmhieBmCqaWdgN75IZ506klonocaCmKG/fHXKIll6sflmpJC+KilYzJaX5wWasggpxgKmhmcAs0lI3ZU5pgjkqxeSWWrUU6Aqap1sEqZW5Ex1grrq1faCp2RwOLK66/CstdpoZ6Gp+x3zB4LGqIXTjpQqIM6am2f+WW7mKbJvqfts2hCmqlj7jFElLnmSjQtugit6y66A7Wb7rTqqgtvRu9WRO++CuXLkLzu1suvvvfGW7DA/SZMcL72Dvzvwwb7KzHEFE88UEAAOw==) - campo de busca - digite as iniciais do fluxo que deseja localizar ;
- (2) Árvore de Fluxos - relação dos fluxos existentes na base de dados disponíveis por categoria;
- (3) Parâmetros de entrada - exibem os parâmetros exigidos por cada fluxo (caso exista). Executando clique duplo sobre o registro de parâmetro, abre-se o [Montador de Expressões](/docs/maker/montador_de_expressoes) e deste a tela [Propriedades](/docs/maker/tela_propriedades_do_montador_de_expressoes);
- (5) Identificador a que será atribuído o retorno do subfluxo - campo que permite atribuir o retorno a um [Identificador (variável)](/docs/maker/exibir) ou [Parâmetro de entrada](/docs/maker/parametros_de_entrada) definido no objeto Início. Quando selecionada uma variável neste campo, às vezes o componente modifica sua cor para a cor vermelha. Esse comportamento não traduz que o tipo de dado que será retornado pelo Subfluxo não é compatível com o tipo de dado da variável selecionada, mas, sim, alerta o usuário para que selecione uma variável que tenha um tipo adequado.
- Alterar Descrição - permite mudar o rótulo do objeto. Utilizado para documentar a rotina que o objeto executa;
- Remover - exclui o objeto da tela de trabalho do [Editor de Fluxos de Ações](/docs/maker/utilizando_o_editor_de_fluxo_de_acoes).

## Melhoria dos componentes SUBFLUXO e INTERAÇÃO para permitir uma rápida definição dos parâmetros

Agora é possível atribuir o valor dos parâmetros de subfluxos e interações diretamente, sem a necessidade de abrir o Montador de Expressão, com a identificação imediata do tipo passado

- caso seja digitado um texto o valor do parâmetro será automaticamente do tipo Letras;
- caso seja digitado um valor fracionado ele será automaticamente do tipo Fracionado.

Um ícone indica o tipo do valor digitado. Para passagens de parâmetros personalizadas, há a opção de abrir o Montador de Expressão

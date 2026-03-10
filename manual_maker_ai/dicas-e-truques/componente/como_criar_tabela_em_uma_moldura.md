# Como criar tabela em uma moldura

> Fonte: https://manual.softwell.com.br/docs/dicas-e-truques/componente/como_criar_tabela_em_uma_moldura

# Como criar tabela em uma moldura

Neste tópico, será demonstrada a criação de uma tabela no componente **Moldura**.

1. Crie um formulário com os componentes **Moldura** e **Botão,** sem fonte de dados:

![image692.jpg](/assets/images/image692-094719c3862b8883623b6bfcfe6db6aa.jpg)

2. Antes de criar o fluxo, clique no componente **Início** para informar o **Formulário de Trabalho**:

![image693.jpg](/assets/images/image693-d15dd7d5362404405575667315b1f960.jpg)

3. Pressione **F11** e crie os **Identificadores** (variáveis):

![image694.jpg](/assets/images/image694-526a199dc7232c4b1f5c30b3da38e09f.jpg)

4. Agora partiremos para a criação do fluxo. Para facilitar o entendimento, o fluxo ficará da seguinte forma:

![image695.jpg](/assets/images/image695-427fcaa7ffc1d1b31a19be47d92aba3e.jpg)

5. Insira um Processamento ![](./img/image696.jpg) para criar uma tabela no componente **[Moldura](/docs/dicas-e-truques/componente/como_criar_tabela_em_uma_moldura)**. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Tabela - Criar tabela em uma moldura**:

![image1236.jpg](/assets/images/image1236-cda882dc1b7b076be29a9897f4212bd8.jpg)

6. Insira uma Decisão ![](./img/image698.jpg) para verificar a quantidade de linha. Com isso será feito o controle de linhas inseridas na **Moldura**. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Menor**:

![image777.jpg](/assets/images/image777-1c935169a8d1a8d79dc9c5ff67e971b8.jpg)

7. Insira um Processamento ![](./img/image696.jpg) para inserir linha em uma tabela. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Tabela - Inserir linha em uma tabela**:

![image700.jpg](/assets/images/image700-1192e239310a43b5fc1ba11c28c76ef9.jpg)

8. Insira um Processamento ![](./img/image696.jpg) para inicializar a variável **Contador de Célula**. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Identificadores**, tipo **Inteiro,** adicione **1**:

![image1380.jpg](/assets/images/image1380-2b70204d0366e99f4443abc87291c80a.jpg)

9. Insira uma Decisão ![](./img/image698.jpg) para verificar a quantidade de células. Com isso será feito o controle de células inseridas na **Moldura**. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Menor**:

![image778.jpg](/assets/images/image778-71f2571ef91c053404672141d64b9eb5.jpg)

10. Insira um Processamento ![](./img/image696.jpg) para inserir células em uma linha. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Tabela - Inserir célula em uma linha**:

![image1205.jpg](/assets/images/image1205-f163bbb7a3a9c7b1701493f4204d4ce9.jpg)

11. Insira um Processamento ![](./img/image696.jpg) para incrementar a variável **Contador de Célula**. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Soma**:

![image779.jpg](/assets/images/image779-9dca27ca5cc906b66e665f0fffcf2328.jpg)

Insira um Processamento ![](./img/image696.jpg) para incrementar a variável **Contador de Linha**. No **[Montador de Expressão](/docs/maker/montador_de_expressoes)**, na aba **Fluxos e Funções**, localize a função **Soma**:

![imageex2.jpg](/assets/images/imageex2-ee4f8f8c29d16cebe8707b213a1d07d9.jpg)

Associando fluxo a Evento: Associe este fluxo ao formulário criado, aplicando ao componente **Botão** e ao **Evento** "**Ao Clicar**" e veja o resultado no Webrun:

![image7030.jpg](/assets/images/image7030-bf163ddfeeb17aec08bb9b2cc96311c3.jpg)

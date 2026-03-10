# Organização de Fluxos através de subfluxos

> Fonte: https://manual.softwell.com.br/docs/maker/boas_praticas/organizacao_de_fluxos_atraves_de_subfluxos

# Organização de Fluxos através de subfluxos

A utilização de fluxos com muitos IFs (objeto decisão) e fluxos extensos demais, pode ocasionar erros de compilação devido a uma limitação da Máquina Virtual Java, onde os métodos têm limite de 65, 535 bytes de bytecode. Neste caso é recomendado que o fluxo seja dividido em subfluxos para evitar problemas de compilação no momento de execução da regra.

Por exemplo, temos o fluxo abaixo que realiza envios de e-mail de acordo com os parâmetros (anexo; lista de contatos) e logo após envio, registra o log da operação.

Observe a extensão do mesmo.

![image1663.jpg](/assets/images/image451-37de75c6d4dd52b4eb9c1f08df23637e.png)

Esta é uma regra que poderá apresentar problemas ao compilar, tornando difícil também seu entendimento, legibilidade e suporte futuro.

Não existe uma regra de como e quando o fluxo deverá ser divido em subfluxos, isso varia de acordo com a percepção e necessidade do desenvolvedor ou de boas práticas de desenvolvimento internas.

Neste caso dividiremos este fluxo em alguns menores (2 subfluxos), o que irá facilitar o seu entendimento:

![image1664.jpg](/assets/images/image452-251d4491db65440eb49b85fd0f8207dd.png)

As áreas em vermelho destacadas são os pontos onde o fluxo principal será divido.

Após ter dividido o fluxo em subfluxos menores, o mesmo ficará:

- Subfluxo 1:

![image1665.jpg](/assets/images/image454-a6640bff3ab89a8f76cc6dd5d54b71ff.png)

- Subfluxo 2:

![image1666.jpg](/assets/images/image456-33fc8497fd711f87a736bd7b87164d3e.png)

- Então o fluxo inicial ficará assim:

![image1670.jpg](/assets/images/image457-35134ce56977f1047655a7927283edd4.png)

Com boas práticas, muitos problemas podem ser evitados. Observe que após a divisão do fluxo, o mesmo ficou mais legível e de fácil entendimento para todos os desenvolvedores que vierem a mantê-lo.
